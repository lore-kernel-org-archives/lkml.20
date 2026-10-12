Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020C3390C85
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791776433; cv=none; b=X4NZ1jQ46kyxI3mU2eEF02x2m5QvifEnI3cS/hTiy/CgIHu4tPVkBbxPWlSH4KVyYYb08WkXLF+n9gLN7n8EkQRsd0z20d3cxR+t8LDopWlGEEY+ifbv7t19UrQLSWTAJvBlOJCTgxQNkib5ArGoR01BTD0QxQ15vO52KU6cSJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791776433; c=relaxed/simple;
	bh=YzZg1+gUIs5Df6KMIHtH6J4c2+lVLSU0eCXJOmn+lAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fiZLGoTgP7ABlxi36afhDqRYZNe/HTJXipsi1K08SWiV+8kNi0Cv8GGz/CqBxS61Sq0OioyX/0egBaiXTJaS1Z6Y2dadwfvmskh3sT7EMywkNcTXHoazM/R9uSkz2vfRsdcsZ+xVmL32HlMo5KB+la+uIUrIn+lhqyu+GRcp0Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgZ4KbVG; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgZ4KbVG"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e51d8d400so103721085a.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791776431; x=1792381231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xTa4f6Jpo9bbyJgbZsVx5DPWhH7RO4U0C8aC28e9B8o=;
        b=EgZ4KbVGGnova89l4wyxN2LlpYg2QcNzBQXOUl9cq3e5vG/VF7rEOrNCjDbbQ1/mtx
         hV7yGiq+mYslehCUmJ/z4QArWOuEDX9lG7dLRzRq6QHMSLI4UaUfxyhx8obj804cTP0c
         mKklpBrjQen2EOMO6mEShVVPlI+dQbNNf+GlhJicthj8/F/x2DhcDX2aPyVjMlaUC9tF
         qx5ICyXBIOChUwENICvxuWsTfZO7o4t+sITzuUwUozPhtfND6ebGyEXtlWAi5+NT+9T8
         K7xe81HvVwU9hleYTPm7uIDOajqQgJWi9PrmPX/YCO9chEisY7RxNUScD9iiHLTJGA0O
         G3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791776431; x=1792381231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xTa4f6Jpo9bbyJgbZsVx5DPWhH7RO4U0C8aC28e9B8o=;
        b=ntn5ZgiDDLLJsWUanI7ZvvrZPu+WHMz5vvBzabtuaXQKbC4LrYvNVREgPimKq8mtqj
         1K3e+hwSOHuSRkhrzpB3YliVWV36O3DlpAYm+W2sDqBMYh+gmGKpqUcT7SHJsL6OjkNS
         ern5XCBeZRVmf4gk1sNyxKAU5QKX9kWmEBPSTcTKeQqosHdD/p3mKkzPOLibYZqP1j6M
         Ih/yfef6k2+igs28RNA+2fVDTPFKE+6VrfkwW78yi8Psg/gsvMM0QsctvgYHSZLu8sbI
         aBXvpC/GSezuJbd0AeMr4s4Emf2LhsF/STYH4KTCXkKt9ZpWwgi7+Pa6LfBjE/93E8o8
         cVqw==
X-Gm-Message-State: AFq9FYILeqrBxoKegyICy5ww7SlPwEs0x28EW4OpNDRLiSYl2p49iBzM
	XrAJni3hWGxcFc//S6GdIaQPlHujQ6b+6pJq3SF5VeI95Hsm8VtzDHwD
X-Gm-Gg: AYBFou3trvkoegdlHeo27N9/5VJCZKBAz8YNWhNHMhXyebXU216QcvZeuJwTprcwsic
	v6cTsBcfOHDXDGQ3SlKDFXQgWeoAWyJaBXH2pVbgxm7M+D5M3je5izT90Z+72R/GWBBJbxxon4T
	BJnnxKzY8W2nMNRFcZQ2wYeFJiyqsvvj0FbnDzdRtp8GSbm+fN10hYVol1v7YBvhwLyRhq9usjP
	OczClST6SM9bxk/8dNBeacBwItnJa11K2/KoQGjoDEN0/LODF9HO1ta5cfXfZzPFRqfuhT3eyxH
	2awKwvb3NXWYMl/r/+IgoWB+kxzGL5DWQEeX/7aPXqwf8pJgxFVAEB12SDvkaeSWwsLJoYMl/P7
	wJiL/ouAQfYBoaR5BCohuq+6bbVHCvEIyqoPQt4Bb6A6udhx65P2w+qpvN724R5Arw3cVhQaaiJ
	W9yJjOW9qYEwm/29XINif8+tES8ErUeM/sw3k50j4BTUkDJvv2PajwcYmG33fZ5m2jdaAwW5myK
	LgCePNkmeV9tJ6nfrwL9/6Yh8p7Y4xVZ6h3aCyb8Fnn3G5i/TQaYWHYwIUaY/mPQ0LVwXc3e4sh
	/9rCfxapzi9gXyxB6yvPJYxnEMA+p9AjswQP8n9DU9eZRUylITvyprZ5rOMBMWvc82yLFPOJE3P
	8r0H97oevYi5mB/3wPQRYLI/QpBBeOdDAaO8bJq59yCq+exFH
X-Received: by 2002:a05:620a:271a:b0:93e:48fc:aa85 with SMTP id af79cd13be357-93ebd2598c1mr1409753185a.43.1791776430907;
        Sun, 11 Oct 2026 20:40:30 -0700 (PDT)
Received: from localhost.localdomain (wnpgmb0311w-ds01-161-139-200.dynamic.bellmts.net. [142.161.139.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb984845csm763316085a.14.2026.10.11.20.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 20:40:30 -0700 (PDT)
From: Riccardo Oliva <oliva.scorza@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	oliva.scorza@gmail.com
Subject: [PATCH] staging: vme_user: avoid iterator variable access outside list loop
Date: Sun, 11 Oct 2026 22:40:20 -0500
Message-ID: <20261012034020.100737-1-oliva.scorza@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In vme_slave_request(), vme_master_request(), vme_dma_request(), and
vme_lm_request(), the list iterators (slave_image, master_image,
dma_ctrlr, and lm) are accessed in the err_alloc error paths after
exiting the list_for_each_entry() loops.

While the iterator variable retains its pointer value upon hitting a
break, accessing list iterators outside the loop body violates modern
kernel coding standards.

Fix this by referencing the dedicated allocated resource pointers
(allocated_image, allocated_ctrlr, allocated_lm) in the error cleanup
blocks instead.

Signed-off-by: Riccardo Oliva <oliva.scorza@gmail.com>
---
Hi! This is my first patch to the kernel. I am learning the submission 
workflow. Any feedback is very much appreciated. Thanks!

 drivers/staging/vme_user/vme.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index b5c66b66c..d38c792eb 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -298,9 +298,9 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 
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
@@ -495,9 +495,9 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 
 err_alloc:
 	/* Unlock image */
-	spin_lock(&master_image->lock);
-	master_image->locked = 0;
-	spin_unlock(&master_image->lock);
+	spin_lock(&allocated_image->lock);
+	allocated_image->locked = 0;
+	spin_unlock(&allocated_image->lock);
 err_image:
 err_bus:
 	return NULL;
@@ -865,9 +865,9 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 
 err_alloc:
 	/* Unlock image */
-	mutex_lock(&dma_ctrlr->mtx);
-	dma_ctrlr->locked = 0;
-	mutex_unlock(&dma_ctrlr->mtx);
+	mutex_lock(&allocated_ctrlr->mtx);
+	allocated_ctrlr->locked = 0;
+	mutex_unlock(&allocated_ctrlr->mtx);
 err_ctrlr:
 err_bus:
 	return NULL;
@@ -1469,9 +1469,9 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
 
 err_alloc:
 	/* Unlock image */
-	mutex_lock(&lm->mtx);
-	lm->locked = 0;
-	mutex_unlock(&lm->mtx);
+	mutex_lock(&allocated_lm->mtx);
+	allocated_lm->locked = 0;
+	mutex_unlock(&allocated_lm->mtx);
 err_lm:
 err_bus:
 	return NULL;
-- 
2.43.0

