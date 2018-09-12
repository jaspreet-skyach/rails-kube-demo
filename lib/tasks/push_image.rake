namespace :docker do
  desc "Push docker images to DockerHub"
  task :push_image do
    TAG = `git rev-parse --short HEAD`.strip

    puts "Building Docker image"
    sh "docker build -t jaspreetskyach/rails-kube-demo:#{TAG} ."

    IMAGE_ID = `docker images | grep jaspreetskyach\/rails-kube-demo | head -n1 | awk '{print $3}'`.strip

    puts "Tagging latest image"
    sh "docker tag #{IMAGE_ID} jaspreetskyach/rails-kube-demo:latest"

    puts "Pushing Docker image"
    sh "docker push jaspreetskyach/rails-kube-demo:#{TAG}"
    sh "docker push jaspreetskyach/rails-kube-demo:latest"

    puts "Done"
  end

end