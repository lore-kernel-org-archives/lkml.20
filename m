Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF2F357CEA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789968430; cv=none; b=FA88ys+LwI2Cw8SpKzau61+SsZTg6j8eVabD6vB1lZ2sHMJZoqmjyUl/iEsez0/gOM4kWZ6V02si/k/jwKydB/+4aqMWNc2ngMUjF/dwlAqAziDs+lW0RpCn2YhBECQvXlsGkI2DYN15HQSiNLyRd7EGcUu2Xd73RNPveKvO2cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789968430; c=relaxed/simple;
	bh=EWu1pLVFRSaebwmi7fm/KMUICrHPC3ue7UZVQJg/fhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dv+5EP/Y4/EKLhMedNUBZ/MG9TQRkkyDRRJ2N7aVMibgnWFx1KSD3Ckba1V2Iu6rxQkM+f7APlIvnP7gsR5zgoLg+TnV+EzOEH1dMc2mXtpyDccY6WLf3SE9jV0LNWtquBbP7jOT+09X5sMXmg2HBAt+4/8DR1bIBe+Gb7FUv7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLlmAY8t; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLlmAY8t"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so1995170a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789968425; x=1790573225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xz7oDjDIsYHvot04hwnpj8aBarD/yeH6H4D2rmaqZdc=;
        b=jLlmAY8toK3ay6YjxLCbenY4BHriYZL65+6EmqZQPoycLR0fNt9F5euKFcsfs5zKjl
         DEnpk4BpFQu7GCyRbLfRitlWQqwBl7dhptmF5YSsxIarnEucAg6eBL8ADanIfqC/S6+W
         66bj+oI+Ve9VCHx3q6TJGGPxloRvdziynTNv7OquM3iXaK3aVaGf/WuvC2obSgCTRDfB
         Y8yYK/4EqvwtpFBDIqC+1Fmq2xnDCtih0QjVtXldfpAGZOjYP/qwpUufoR7qR1MW4Qvb
         KZgKzfezrgsNwTkeCyAL5/Lw07oHVPV0Cz0Is5t74cVG/o3j8iQfgW86XOfzfF4gdnLw
         RiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789968425; x=1790573225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xz7oDjDIsYHvot04hwnpj8aBarD/yeH6H4D2rmaqZdc=;
        b=rs4/v6ip1T81eCPTv11Q7ig/hTZUvw+XJ5A9OR9knUfVzA02nhwREdQzxQfHF3L0Z3
         ugFU6Tk1LDtkH5zdMOazZ6JNMVbp1e7nkAV85Yx8/nWe8YVbaCkavxmYQAwa/0sFgAAE
         mBCZc8EnQ0VimtvD15dJl3eQ+k7cAOIjQhPfgDEIfi/ahSZMX2rcPy5QpZqa5qoI31nI
         bLoD4DvECcHDzG33Qj7r7vCM6K+nV2P+nx2guw6gJ0+RvT/ioWj6U+Isx7C6VOfruCSB
         NBBPrMMhLZj7TRvZkpHG3t9k2NhDFGVC9q3fBfXYAM0fmjmia1lgKTE3rUbsKPBuOCBN
         AVDA==
X-Forwarded-Encrypted: i=1; AKwUvBxx5XqLQTqaZiC77z0Edv7MgNbzpVNh/FfcYhUEZLLaKuo6YG0uxaQ6bNiLAC3TlOmGXAyYba4/4xm7gRo=@vger.kernel.org
X-Gm-Message-State: AFuF++lYod1OS6L4YNDQPKTkn8vl2X2TE+9jvkKorTg33w/VLdcSkpr9
	Ps0Qq80UMUx8mHl6AoDyJmRcXnVC2oF68EkucgxJ/xCE/AiOqCDz70rZ
X-Gm-Gg: AYBFou2KNMMmoDqeh/PJeG1IjEFooyQ0bQeiCodZRtBbc2F4UlGz4tgKuCfymsW0Bqi
	CGiOEEp/zcPamfMjZd0Mkb8jZ7yfNbUJBiTTGxt04mXIHAifQxEDxkCC29V9PsVvldnbmOzKmCG
	CVZuMgjaJqLtjEV8710rNHoZelU4Ed7RhObHy0JBIu/8yaHNYFD+e9JlY+sfryRfaEw0SnaBbTK
	etc74qyKgq2dh20DraTuT0/+3BM1HCxCxZPvaaoMjlEFQaMx1N7W1EOMmm6hkpLpUtW2glNO90B
	CvS2AdyWSq2K6IocUaxIbhfFziNSIRsEP7FyNjowsi2ZZXjLfBz4YT9J1PYeG9R3dwYGyonM8to
	ydLSFiCth10SQmmuF+Rq94d5mhb4tSemjxaR+dtLClFLMyuTw/pc3UFxL+TV2IUZUJtcwx+qH2m
	Kd7R92D6h7G159Ruazs0b7jT550TYZb+SWBP1vtGTtTeUfUUeDDiT80ngTrfuMM08aIPHssFT1Q
	I4x2JM58zH7HgeTBNs79ZrnO/4MlRAO7r3KLx5eyjFNQSu+Z99423oh9qaJs/dokkV52qSDJa6N
	PT/x0LeJGg==
X-Received: by 2002:a17:90b:554b:b0:39e:6c6a:6574 with SMTP id 98e67ed59e1d1-39e6c6a6819mr9043191a91.55.1789968425257;
        Sun, 20 Sep 2026 22:27:05 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e554e5529sm6677054a91.4.2026.09.20.22.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 22:27:04 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: bhelgaas@google.com,
	airlied@redhat.com
Cc: benh@kernel.crashing.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v2 2/2] PCI/VGA: invalidate open user references in vga_arbiter_del_pci_device()
Date: Mon, 21 Sep 2026 05:27:02 +0000
Message-ID: <20260921052702.1725696-2-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260921052702.1725696-1-benquike@gmail.com>
References: <20260919222629.3798073-1-benquike@gmail.com>
 <20260921052702.1725696-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a PCI VGA device is removed while /dev/vga_arbiter is open,
vga_arbiter_del_pci_device() removes and frees the vgadev entry, but any
open struct vga_arb_private on vga_user_list retains dangling pointers to
the removed pdev in priv->target and priv->cards[i].pdev. Subsequent writes
to /dev/vga_arbiter or closing the file descriptor in vga_arb_release()
dereference the removed pdev.

Mark matching priv->target and priv->cards[i].pdev entries as
PCI_INVALID_CARD under vga_user_lock in vga_arbiter_del_pci_device(), and
treat PCI_INVALID_CARD like NULL in vga_arb_write() and vga_arb_release().

Tested in QEMU against Linux 7.3.0-rc3 by opening /dev/vga_arbiter,
selecting PCI:0000:00:02.0, hot-removing the PCI VGA device via
/sys/bus/pci/devices/0000:00:02.0/remove, and writing "unlock io+mem".
On the unfixed kernel, priv->target retains a dangling pointer to the
removed pci_dev so write("unlock io+mem") proceeds past the NULL check
and returns -EINVAL (-22); with this patch applied, priv->target is set
to PCI_INVALID_CARD on removal and write("unlock io+mem") immediately
returns -ENODEV (-19).

Fixes: deb2d2ecd43d ("PCI/GPU: implement VGA arbitration on Linux")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Split out from the vga_tryget() return check fix into patch 2/2.
- Update Fixes: tag from the file-move commit 1d38fe6ee6a8 to
  deb2d2ecd43d ("PCI/GPU: implement VGA arbitration on Linux").

 drivers/pci/vgaarb.c | 71 +++++++++++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 27 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 350ab9624eb9..4f13e542505a 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -818,11 +818,33 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
 	return false;
 }
 
+#define MAX_USER_CARDS         CONFIG_VGA_ARB_MAX_GPUS
+#define PCI_INVALID_CARD       ((struct pci_dev *)-1UL)
+
+/* Each user has an array of these, tracking which cards have locks */
+struct vga_arb_user_card {
+	struct pci_dev *pdev;
+	unsigned int mem_cnt;
+	unsigned int io_cnt;
+};
+
+struct vga_arb_private {
+	struct list_head list;
+	struct pci_dev *target;
+	struct vga_arb_user_card cards[MAX_USER_CARDS];
+	spinlock_t lock;
+};
+
+static LIST_HEAD(vga_user_list);
+static DEFINE_SPINLOCK(vga_user_lock);
+
 static bool vga_arbiter_del_pci_device(struct pci_dev *pdev)
 {
 	struct vga_device *vgadev;
+	struct vga_arb_private *priv;
 	unsigned long flags;
 	bool ret = true;
+	int i;
 
 	spin_lock_irqsave(&vga_lock, flags);
 	vgadev = vgadev_find(pdev);
@@ -845,6 +867,21 @@ static bool vga_arbiter_del_pci_device(struct pci_dev *pdev)
 	wake_up_all(&vga_wait_queue);
 bail:
 	spin_unlock_irqrestore(&vga_lock, flags);
+	if (ret) {
+		spin_lock_irqsave(&vga_user_lock, flags);
+		list_for_each_entry(priv, &vga_user_list, list) {
+			if (priv->target == pdev)
+				priv->target = PCI_INVALID_CARD;
+			for (i = 0; i < MAX_USER_CARDS; i++) {
+				if (priv->cards[i].pdev == pdev) {
+					priv->cards[i].pdev = PCI_INVALID_CARD;
+					priv->cards[i].io_cnt = 0;
+					priv->cards[i].mem_cnt = 0;
+				}
+			}
+		}
+		spin_unlock_irqrestore(&vga_user_lock, flags);
+	}
 	kfree(vgadev);
 	return ret;
 }
@@ -1025,27 +1062,6 @@ EXPORT_SYMBOL(vga_client_register);
  * the arbiter.
  */
 
-#define MAX_USER_CARDS         CONFIG_VGA_ARB_MAX_GPUS
-#define PCI_INVALID_CARD       ((struct pci_dev *)-1UL)
-
-/* Each user has an array of these, tracking which cards have locks */
-struct vga_arb_user_card {
-	struct pci_dev *pdev;
-	unsigned int mem_cnt;
-	unsigned int io_cnt;
-};
-
-struct vga_arb_private {
-	struct list_head list;
-	struct pci_dev *target;
-	struct vga_arb_user_card cards[MAX_USER_CARDS];
-	spinlock_t lock;
-};
-
-static LIST_HEAD(vga_user_list);
-static DEFINE_SPINLOCK(vga_user_lock);
-
-
 /*
  * Take a string in the format: "PCI:domain:bus:dev.fn" and return the
  * respective values. If the string is not in this format, return 0.
@@ -1168,7 +1184,7 @@ static ssize_t vga_arb_write(struct file *file, const char __user *buf,
 		}
 
 		pdev = priv->target;
-		if (priv->target == NULL) {
+		if (priv->target == NULL || priv->target == PCI_INVALID_CARD) {
 			ret_val = -ENODEV;
 			goto done;
 		}
@@ -1215,7 +1231,7 @@ static ssize_t vga_arb_write(struct file *file, const char __user *buf,
 		}
 
 		pdev = priv->target;
-		if (priv->target == NULL) {
+		if (priv->target == NULL || priv->target == PCI_INVALID_CARD) {
 			ret_val = -ENODEV;
 			goto done;
 		}
@@ -1266,7 +1282,7 @@ static ssize_t vga_arb_write(struct file *file, const char __user *buf,
 		 */
 
 		pdev = priv->target;
-		if (priv->target == NULL) {
+		if (priv->target == NULL || priv->target == PCI_INVALID_CARD) {
 			ret_val = -ENODEV;
 			goto done;
 		}
@@ -1335,7 +1351,8 @@ static ssize_t vga_arb_write(struct file *file, const char __user *buf,
 		for (i = 0; i < MAX_USER_CARDS; i++) {
 			if (priv->cards[i].pdev == pdev)
 				break;
-			if (priv->cards[i].pdev == NULL) {
+			if (priv->cards[i].pdev == NULL ||
+			    priv->cards[i].pdev == PCI_INVALID_CARD) {
 				priv->cards[i].pdev = pdev;
 				priv->cards[i].io_cnt = 0;
 				priv->cards[i].mem_cnt = 0;
@@ -1366,7 +1383,7 @@ static ssize_t vga_arb_write(struct file *file, const char __user *buf,
 			goto done;
 		}
 		pdev = priv->target;
-		if (priv->target == NULL) {
+		if (priv->target == NULL || priv->target == PCI_INVALID_CARD) {
 			ret_val = -ENODEV;
 			goto done;
 		}
@@ -1429,7 +1446,7 @@ static int vga_arb_release(struct inode *inode, struct file *file)
 	list_del(&priv->list);
 	for (i = 0; i < MAX_USER_CARDS; i++) {
 		uc = &priv->cards[i];
-		if (uc->pdev == NULL)
+		if (uc->pdev == NULL || uc->pdev == PCI_INVALID_CARD)
 			continue;
 		vgaarb_dbg(&uc->pdev->dev, "uc->io_cnt == %d, uc->mem_cnt == %d\n",
 			uc->io_cnt, uc->mem_cnt);
-- 
2.49.0
