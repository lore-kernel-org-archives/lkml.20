Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453700;
	b=3ttc/WNweIoy2Ot+kmm+EFvXBGDH+T1vKqlICVKmviH2HyGBJeJCh7ZUAPJzvQlfnaLf
	 n4Gx+tp509/t9qpCaqQfI2Xh3UZ5SWVxOoMPDP3zFEVmqMk0p2fnwGEF142c1+q6mOw/d
	 HvSMNWtD75xB+wBWuI6pKvDXnmS/sZcNvU7KHCujc70BuwAWhuSBbpen9Ukk1uH6r93+6
	 QdQ9BrBvuQK9pu6AzGL4/1Zv+lZvIcEBR46XX1/PvSPToY6nrm2z0Ck86tohtmIgdhVYf
	 RygGTeYl5FVALtWn/0Ks1JTiwnaLiIaE7+s+1GjVq5eyOij0GD9DU8JeHV5DT8mXekg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453700;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=mqE4Fnmiow5t6+cu6uo49UiAA+7UjW5tKC/c/uUhAcI=;
	b=VKLtLK9t6qcnCrD5m1vb9N5j3wKyKJ+O3NyMcbaMlCsYXgLFCfhpX2tdqQjvNlRKLOOr
	 UFLxiIRjJbZQmqRnxT9bsGhmh/4qX+L6YDFWfqv26UmqfzrxYb3i7/ty3hBzuEd+qs5Pu
	 kQfokArnJSVawlEUiCmAVUw27EOnUc9tu7lHxRWrpui1hJ3sE8O2FsglkHTWk+wLJPW8a
	 6WoeqdsCe3JumqG2+HDC9BdHqT5UQ1H6AgJoIFeEh/LrFfRe98lFJBUzADFRhaLR18ALm
	 eMr4P6I78NibP+N3iYMF65jy2evemWPRKKUG66esCeoQ4MzO3y5QbRxVIH7spx862uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=POS3HJ9E;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9209D606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9209D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=POS3HJ9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=mq
	E4Fnmiow5t6+cu6uo49UiAA+7UjW5tKC/c/uUhAcI=; b=POS3HJ9E3oT+BlYdTF
	MAM+LRv2alTJNejYr7FaCJ7j+652rLyoyJyDj+3UL51SW0B61PzkotiapzqFI9UT
	nNLoX2hw2OKN3Z90iFXX4mYdHSvpjLD3qA6fqNedgCzsSS9jO/zu/p1wqehVau6U
	MnboYD/outQwM4bLHCdOwHhGA=
Received: from iZbp142fio164970eurit1Z.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgBH1Jdp7uVqpZqqDA--.17794S2;
	Sat, 31 Oct 2026 21:34:33 +0800 (CST)
From: linfordWu <linfordwu@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linfordWu <linfordwu@163.com>
Subject: [PATCH] staging: vme_user: fix probe error path resource handling
Date: Sat, 31 Oct 2026 21:34:33 +0800
Message-ID: <20261031133433.1826133-1-linfordwu@163.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgBH1Jdp7uVqpZqqDA--.17794S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww4fJw47XFy7tFyxWF18AFb_yoW8uFy3pa
	naga17Kr1xX34UWrs7Jw47ZFZag3y5XrW8GrW2g3ySqr45t34q9r4Yyry2grs7JrykJF9F
	qFWqkw17uayrJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pisqXdUUUUU=
X-CM-SenderInfo: xolqw0pugz3qqrwthudrp/xtbC8QrpiWrl7mol7gAA3b

The probe error paths free the current master or slave resource before
jumping to cleanup loops that free it again. They also pass NULL
resources to the VME release helpers when window allocation fails, and
pass a NULL buffer to vme_free_consistent() when buffer allocation
fails.

Let the common cleanup paths own all resource releases and guard the
resource and buffer pointers so each failure path only releases objects
that were allocated successfully.

Signed-off-by: linfordWu <linfordwu@163.com>
---
 drivers/staging/vme_user/vme_user.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
index a472a38ef61..980798ae622 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -616,7 +616,6 @@ static int vme_user_probe(struct vme_dev *vdev)
 			dev_warn(&vdev->dev,
 				 "Unable to allocate memory for buffer\n");
 			image[i].pci_buf = 0;
-			vme_slave_free(image[i].resource);
 			err = -ENOMEM;
 			goto err_slave;
 		}
@@ -641,7 +640,6 @@ static int vme_user_probe(struct vme_dev *vdev)
 		image[i].kern_buf = kmalloc(image[i].size_buf, GFP_KERNEL);
 		if (!image[i].kern_buf) {
 			err = -ENOMEM;
-			vme_master_free(image[i].resource);
 			goto err_master;
 		}
 	}
@@ -698,7 +696,8 @@ static int vme_user_probe(struct vme_dev *vdev)
 	while (i > MASTER_MINOR) {
 		i--;
 		kfree(image[i].kern_buf);
-		vme_master_free(image[i].resource);
+		if (image[i].resource)
+			vme_master_free(image[i].resource);
 	}
 
 	/*
@@ -708,9 +707,11 @@ static int vme_user_probe(struct vme_dev *vdev)
 err_slave:
 	while (i > SLAVE_MINOR) {
 		i--;
-		vme_free_consistent(image[i].resource, image[i].size_buf,
-				    image[i].kern_buf, image[i].pci_buf);
-		vme_slave_free(image[i].resource);
+		if (image[i].kern_buf)
+			vme_free_consistent(image[i].resource, image[i].size_buf,
+					    image[i].kern_buf, image[i].pci_buf);
+		if (image[i].resource)
+			vme_slave_free(image[i].resource);
 	}
 err_class:
 	cdev_del(vme_user_cdev);
-- 
2.43.0

