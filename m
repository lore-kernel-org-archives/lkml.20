Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6266415F29
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341112; cv=none; b=ncQLOob3MuXZg2+voYNOiaiTJicTRmERyQFHAJJtR6Ir9wZlPw8FDZqJafVFXoErPwIa8jOV91kAIzDo2efDYyiBehPHSCCBc+tlueqerXgK+svMVzBayHhD8AC7qx/4pGf2lXa/9SMIhQFaXF5EJ2WnbM+9rthFTqTkyciestE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341112; c=relaxed/simple;
	bh=FlaO25gqB/twgCzUaB0N1ObHl5Wc1UY32hZDskIQa88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CVhXBOm3JxvSw8y3Bqz7TgmtzYkRyUJXDbk7sr6m2D88/I791oeQ8jcydoUn14/K6P94VwBEv33g9TvGh/+Q6oLinIYQOGpQXSgBe+1nhu2vEPhaOCFKSenopSpAWJfh+daPeFY+xxi59pL3JDk63a/TZufQkslgLG6MsuCkibQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IrrVw5Qb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IrrVw5Qb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788341109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dggw3aZELjkrZngRu3p06M3tFtYsn+wILS1Ok2qcUPQ=;
	b=IrrVw5QbqPlySwozwXNEC9KEnrHsALNO2R1AF4Qv18FlMbbjBADcWNDWudW2D5URe1tvF6
	TV/a/dTLkkhK00s7PXl6CI11bLYKevJC2ffaopEFHlCYu0v1aEL0kKfb0/QxlBPBdYvbX9
	OtT8VGnanNGOvNxfmx+fxUArO6bwT9Y=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-500-ki7hp8qhMk2qiJ9C8w23OA-1; Wed,
 02 Sept 2026 05:25:06 -0400
X-MC-Unique: ki7hp8qhMk2qiJ9C8w23OA-1
X-Mimecast-MFC-AGG-ID: ki7hp8qhMk2qiJ9C8w23OA_1788341105
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3D89618089B6;
	Wed,  2 Sep 2026 09:25:05 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.49.19])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AE2AC195608A;
	Wed,  2 Sep 2026 09:25:01 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: mst@redhat.com
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	jen@redhat.com,
	virtualization@lists.linux.dev,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	linux-kernel@vger.kernel.org,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH] =?UTF-8?q?virtio:=20add=20Eugenio=20P=C3=A9rez=20as=20Mai?= =?UTF-8?q?ntainer?=
Date: Wed,  2 Sep 2026 11:24:59 +0200
Message-ID: <20260902092459.1983909-1-eperezma@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..a92c5712d8cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28877,7 +28877,7 @@ VIRTIO CORE
 M:	"Michael S. Tsirkin" <mst@redhat.com>
 M:	Jason Wang <jasowangio@gmail.com>
 R:	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
-R:	Eugenio Pérez <eperezma@redhat.com>
+M:	Eugenio Pérez <eperezma@redhat.com>
 L:	virtualization@lists.linux.dev
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-vdpa
@@ -28954,7 +28954,7 @@ F:	include/uapi/linux/virtio_gpu.h
 VIRTIO HOST (VHOST)
 M:	"Michael S. Tsirkin" <mst@redhat.com>
 M:	Jason Wang <jasowangio@gmail.com>
-R:	Eugenio Pérez <eperezma@redhat.com>
+M:	Eugenio Pérez <eperezma@redhat.com>
 L:	kvm@vger.kernel.org
 L:	virtualization@lists.linux.dev
 L:	netdev@vger.kernel.org
@@ -29009,8 +29009,8 @@ F:	include/uapi/linux/virtio_mem.h
 VIRTIO NET DRIVER
 M:	"Michael S. Tsirkin" <mst@redhat.com>
 M:	Jason Wang <jasowangio@gmail.com>
+M:	Eugenio Pérez <eperezma@redhat.com>
 R:	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
-R:	Eugenio Pérez <eperezma@redhat.com>
 L:	netdev@vger.kernel.org
 L:	virtualization@lists.linux.dev
 S:	Maintained
--
2.55.0

