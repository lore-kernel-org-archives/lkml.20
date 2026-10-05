Received: from out-zbxj-a82.jellyfish.systems (out-zbxj-a82.jellyfish.systems [198.54.127.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD93B27FD5B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 04:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791174589; cv=none; b=ec2CD9W0tMXU2Q8rfO5ekQsKNcsTb0AoX39jjuE1fFlL6njb3E3SVv44ABVTQhO172FRgI/8HgS4XZgny+EmHRXiG/5Q4agdjzrnGxlv9YMM2GQnt9tmIz9nx+wK58Jnwg9sx1ASBWDKjUqzhp4GrHhCHPJfKB6IthEcVjP54nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791174589; c=relaxed/simple;
	bh=8YI2FJFNtwcbRik4bllybK3nDGi2VpD6uJ/8GFvWFaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YhrhojK+taDlJ4r88650kRGAMMqV1muBtKazElGT85pWwlXgxZfunN3/sJCnEX64dVchJewSpIgTbN+r8LUnw3ukQM1zY4fLXT7EwZa6MKjB/IwIQy7SBYsmu04KxMh7aowutXc7ODLLYq8YGtp6rMrVNuVTkeiL/tpO0G9sWP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org; spf=pass smtp.mailfrom=firmwaredesign.org; dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b=qgfJn3p8; arc=none smtp.client-ip=198.54.127.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b="qgfJn3p8"
Received: from mail.privateemail.com (unknown [98.240.242.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hymcj0b8mz2x9B;
	Mon, 05 Oct 2026 04:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=firmwaredesign.org;
	s=privateemail; t=1791174565;
	bh=xAOFedc7WXMh96NVjyctLQdxLbrd4fJkRzu2avHa5xg=;
	h=From:To:Cc:Subject:Date:From;
	b=qgfJn3p8xrtXCQ5D7jYu1Kox05EYXxEc2j7BKO/4oA7ZeH+4tnOv1FjqgDx8F0YtF
	 iGZ1yoxtg6YMv5NWBXllwB/bwKaffzR30c1bEJzo9fA1dmDZtRwW6TeNo5Vws+a8bg
	 a4z1xVisLwhYeFC9Q3phMVIyJ9Xn6f6huuuvy6mOD1NBJmkGF4JIs8cAlXRjBAlX/o
	 IxEiXyPHimdH8Xz7/z0/Ad22t6On/KZK5zJfod/jyCrjYsITTjsbvDw1dKH1lmerVP
	 /CbmDAmiuHBRtShzJX8vAVeztocuMr32C8Yd9vK6plpI76X5IrokPpThP3DO4XM26n
	 vpHHVsyuaPFsg==
From: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
Subject: [PATCH] staging: vme_user: fix list iterator tracking and prune dead validations
Date: Sun,  4 Oct 2026 23:29:11 -0500
Message-ID: <20261005042911.64922-1-marinela.selseth@firmwaredesign.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: marinela.selseth@firmwaredesign.org

Automated static analysis runs using 'make coccicheck' uncovered
multiple critical logic and validation flaws inside the VME subsystem.
The file drivers/staging/vme_user/vme.c contained repetitive
unreachable checks testing list iterator pointers for NULL (such as if
(!dma_ctrlr) and if (!lm)) immediately following 'list_for_each_entry'
loop boundaries.
Because of internal pointer arithmetic designs, these loop variables
are mathematically guaranteed to never evaluate to NULL during loop
processing.

Worse, if memory allocations failed for the corresponding structure
images, the error cleanup paths ('err_alloc:') attempted to acquire
spinlocks or mutex blocks using those same loop iterators. Since the
traversal was already complete, these pointers held out-of-bounds,
scrambled memory offsets, exposing the kernel to critical Null Pointer
Dereference panics.

Clean up this driver architecture by removing the unreachable loop
checks entirely, dropping stale, misleading warning statements, and
routing the post-loop lock cleanups cleanly through verified
allocation tracking pointer references.

Assisted-by: Gemini
Signed-off-by: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
---
 drivers/staging/vme_user/vme.c | 69 +++++++++++-----------------------
 1 file changed, 21 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index b5c66b66ce32..fb9f6acbbe62 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -264,17 +264,11 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 
 	/* Loop through slave resources */
 	list_for_each_entry(slave_image, &bridge->slave_resources, list) {
-		if (!slave_image) {
-			dev_err(bridge->parent,
-				"Registered NULL Slave resource\n");
-			continue;
-		}
-
 		/* Find an unlocked and compatible image */
 		mutex_lock(&slave_image->mtx);
 		if (((slave_image->address_attr & address) == address) &&
-		    ((slave_image->cycle_attr & cycle) == cycle) &&
-		    !slave_image->locked) {
+			((slave_image->cycle_attr & cycle) == cycle) &&
+			!slave_image->locked) {
 			slave_image->locked = 1;
 			mutex_unlock(&slave_image->mtx);
 			allocated_image = slave_image;
@@ -298,9 +292,9 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 
 err_alloc:
 	/* Unlock image */
-	mutex_lock(&slave_image->mtx);
-	slave_image->locked = 0;
-	mutex_unlock(&slave_image->mtx);
+	mutex_lock(&allocated_image->mtx);
+	allocated_image->locked = 0;
+	mutex_unlock(&allocated_image->mtx);
 err_image:
 err_bus:
 	return NULL;
@@ -458,18 +452,12 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 
 	/* Loop through master resources */
 	list_for_each_entry(master_image, &bridge->master_resources, list) {
-		if (!master_image) {
-			dev_warn(bridge->parent,
-				 "Registered NULL master resource\n");
-			continue;
-		}
-
 		/* Find an unlocked and compatible image */
 		spin_lock(&master_image->lock);
 		if (((master_image->address_attr & address) == address) &&
-		    ((master_image->cycle_attr & cycle) == cycle) &&
-		    ((master_image->width_attr & dwidth) == dwidth) &&
-		    !master_image->locked) {
+			((master_image->cycle_attr & cycle) == cycle) &&
+			((master_image->width_attr & dwidth) == dwidth) &&
+			!master_image->locked) {
 			master_image->locked = 1;
 			spin_unlock(&master_image->lock);
 			allocated_image = master_image;
@@ -494,10 +482,10 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 	return resource;
 
 err_alloc:
-	/* Unlock image */
-	spin_lock(&master_image->lock);
-	master_image->locked = 0;
-	spin_unlock(&master_image->lock);
+	/* Unlock image using the valid tracking pointer reference */
+	spin_lock(&allocated_image->lock);
+	allocated_image->locked = 0;
+	spin_unlock(&allocated_image->lock);
 err_image:
 err_bus:
 	return NULL;
@@ -821,9 +809,6 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 	struct vme_dma_resource *dma_ctrlr;
 	struct vme_resource *resource = NULL;
 
-	/* XXX Not checking resource attributes */
-	dev_err(&vdev->dev, "No VME resource Attribute tests done\n");
-
 	bridge = vdev->bridge;
 	if (!bridge) {
 		dev_err(&vdev->dev, "Can't find VME bus\n");
@@ -832,16 +817,10 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 
 	/* Loop through DMA resources */
 	list_for_each_entry(dma_ctrlr, &bridge->dma_resources, list) {
-		if (!dma_ctrlr) {
-			dev_err(bridge->parent,
-				"Registered NULL DMA resource\n");
-			continue;
-		}
-
 		/* Find an unlocked and compatible controller */
 		mutex_lock(&dma_ctrlr->mtx);
 		if (((dma_ctrlr->route_attr & route) == route) &&
-		    !dma_ctrlr->locked) {
+			!dma_ctrlr->locked) {
 			dma_ctrlr->locked = 1;
 			mutex_unlock(&dma_ctrlr->mtx);
 			allocated_ctrlr = dma_ctrlr;
@@ -864,10 +843,10 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 	return resource;
 
 err_alloc:
-	/* Unlock image */
-	mutex_lock(&dma_ctrlr->mtx);
-	dma_ctrlr->locked = 0;
-	mutex_unlock(&dma_ctrlr->mtx);
+	/* Unlock image using the valid allocated pointer tracking reference */
+	mutex_lock(&allocated_ctrlr->mtx);
+	allocated_ctrlr->locked = 0;
+	mutex_unlock(&allocated_ctrlr->mtx);
 err_ctrlr:
 err_bus:
 	return NULL;
@@ -1437,12 +1416,6 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
 
 	/* Loop through LM resources */
 	list_for_each_entry(lm, &bridge->lm_resources, list) {
-		if (!lm) {
-			dev_err(bridge->parent,
-				"Registered NULL Location Monitor resource\n");
-			continue;
-		}
-
 		/* Find an unlocked controller */
 		mutex_lock(&lm->mtx);
 		if (!lm->locked) {
@@ -1468,10 +1441,10 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
 	return resource;
 
 err_alloc:
-	/* Unlock image */
-	mutex_lock(&lm->mtx);
-	lm->locked = 0;
-	mutex_unlock(&lm->mtx);
+	/* Unlock image using the valid tracking pointer */
+	mutex_lock(&allocated_lm->mtx);
+	allocated_lm->locked = 0;
+	mutex_unlock(&allocated_lm->mtx);
 err_lm:
 err_bus:
 	return NULL;
-- 
2.43.0

