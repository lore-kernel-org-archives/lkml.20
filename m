Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F4E39E17C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856792; cv=none; b=bNmsC352AvrjByHy2JUWFPpgxdEpLOHxrtkHUOMyXxYfCq7XHGBN85ipFr3GaVeBpL6VE3jsl6VCkDQDf6Ia5RV+U8J1v2ul+WcfeHcPl930mnbVDxZKvqkrlLL5Jrp6TF/Hv0CknIQQR+JfHO2hO7Y+2DzdWpfM10tS3xe6By4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856792; c=relaxed/simple;
	bh=H4IosnsmrbIdD2WnNrn/Jl69BS84apXNa6SmRDl/rRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZPLi0cyluqeyIbCDZnIVWiX5VNwXES6aY7FXsgq/q/8Wn/GSKuEfob0HcTDEa1/bth+baAKrrnmJkaegZeHnwhDpf/hakwXKAV5m4u0H6u6K0GDJuYJJwtTVPrLnoX5cfGlqJR9EYtf9bJtUbLn0WdOgNh0Hiykf1L25GeVAIuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhIR2u4c; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhIR2u4c"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba92so1716269a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856790; x=1790461590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6R3voHmBzh4lvqv8peZSsVk4sFxcqioiBA0aCjPm9Mc=;
        b=KhIR2u4cBTBfmxauLrScUr14LarTQtuOGJt1vo8tu940A2qyyHcTt/YqkJsVP0BkkM
         UVMYB+eJ3M/Q2bN11fkdqoEZmJsFVwbZFX2jtvgSWqPzgf6bcBILmLsKhrIlF5jUglis
         DF/pmg4CsK4YgHJC9i5rItGiUbFHzOnV/ux1aiPFxnfk6gVzHJTBazNMkm0IKpvKibhd
         1xkb4yfZtZM3t48tG1paNBUjTkKtb/nY7gSE10fRAeOL+6xHenOx2ph7DhUCM9TlJsgC
         tMHrWGI2llZFv27rQjhK0eMGNydH27S14PT43R6pQAbwdt9Cbb5toU3rCS8gPd/U8BeU
         l6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856790; x=1790461590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6R3voHmBzh4lvqv8peZSsVk4sFxcqioiBA0aCjPm9Mc=;
        b=RF5r5wbgKim/ofFkR4SJeHWInZGohk0+/1eTTdjB2+hqoENDMvvo39rIq+Oq7IEk0t
         qBmqNzsAnZmqMQEvxPV/7gVnRvZwev4sHj4Cw0ZLibJ9Jpd2SIoJrF51/xuQqlyPhDAB
         Vj9PsdxZoZ3Ql43xht9wHIApIe/MMBWpDHxoa4ERuJ0pqnFML8pLmhSwzPB1Lm34yGE/
         tVzk4pkY22l93sBlieqZLMrDL6LsCKB4932p1QVVHw/B1qtGO32YKK59Nk2/xg3YViNg
         HKBp4+uhGuUTA4v0G6CEan2f/r1x/CTmziL7IsinLjxGdsjZva+aND985bIbjoNc8Dt0
         WUBg==
X-Forwarded-Encrypted: i=1; AKwUvBykio3RYEBsP95jWYTDq5cG+/OsJ6BLLyj5KR/SPZSdbByUOhwl6LSqwegaN0RwwCRAvNt+MEUlCHMSVlc=@vger.kernel.org
X-Gm-Message-State: AFuF++mFIW3D8XkSumoXsZFCJBQvp29sEsQi/m5lJfODur0OYWFzVpUN
	NUZbnDleUD03g92+V+M/xE8Afn86rBSBeeD1z5+GHkgK1DImKLkykxvgagaknSZd
X-Gm-Gg: AYBFou0Of6HMK5PsDgeHhmpH7ZaHX8Sz8Daw0I9ru9uowVdyNsyeDW9Wlblean6a9Ez
	m2gYWOPSda40sB4DOcVM4mt6ozgsbm2qgitvXYOsX+GII8lSLhhXuFrzvWJGeB63fah6bVAZdt9
	5fypIxc+1SN+fjrfSwUUgOdn5TcXddlAs9TN0vx3vtvs3RET0rU/CvR+X1+GfBM4U5m9aMHd95b
	y92p8WDBz7CRoV5FFr6OV78dmXaCxBedvmd+hG0aoNpiuHIsASxdlKCeESDJZcZKuVJ2Nt7NKwz
	G2CCkSg+bKq28tSzryHUBFMyJATxBg3/QtBxKA+bdrkNY10uEiqZhJUeod1cXZdrLFhMz9CMav1
	Rx5jcF4zZj1IiMcbqrltrK1w6lV8HStIkKCNAj3gxVTwI6R3q08Q1UXtWSG92AYF5j7mqnezKwX
	QWfd67xOXpjrns13ZSNa0AH4Sy6homKGcMQa0LElEPabESiaA/+WsnahHpTssx5AkJT2ftrSQXh
	1f9GlFm4w+mjm7ZIhhzQ0Hm3aJ4ThnPh5oILcaOMEjd7lT1185RHlqaiON1aKIcOFn93Xdqz6T4
	v+5CcsXoPg==
X-Received: by 2002:a17:90a:cf0c:b0:39e:6c6a:20a1 with SMTP id 98e67ed59e1d1-39e6c6a22aamr3921834a91.66.1789856790138;
        Sat, 19 Sep 2026 15:26:30 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6ca4ef3esm6351460a91.1.2026.09.19.15.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:26:29 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: bhelgaas@google.com,
	airlied@redhat.com
Cc: linux-pci@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI/VGA: fix inverted vga_tryget() return check and clear removed pci_dev
Date: Sat, 19 Sep 2026 22:26:29 +0000
Message-ID: <20260919222629.3798073-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two issues in drivers/pci/vgaarb.c:

1. In vga_arb_device_init() / vga_arbiter_From_pci_dev(), vga_tryget()
   returns 0 on success and a negative errno on failure, so checking if
   (!vga_tryget(...)) is inverted and skips unlocking on success.
2. In vga_arbiter_del_pci_device(), clear any open vga_arb_user_init
   priv->target references pointing to the removed pci_dev so subsequent
   writes or close() on /dev/vga_arbiter do not dereference a freed
   pci_dev.

Fixes: 1d38fe6ee6a8 ("PCI/VGA: Move vgaarb to drivers/pci")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 3de05aee7859..4f13e542505a 100644
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
@@ -1266,12 +1282,12 @@ static ssize_t vga_arb_write(struct file *file, const char __user *buf,
 		 */
 
 		pdev = priv->target;
-		if (priv->target == NULL) {
+		if (priv->target == NULL || priv->target == PCI_INVALID_CARD) {
 			ret_val = -ENODEV;
 			goto done;
 		}
 
-		if (vga_tryget(pdev, io_state)) {
+		if (vga_tryget(pdev, io_state) == 0) {
 			/* Update the client's locks lists... */
 			for (i = 0; i < MAX_USER_CARDS; i++) {
 				if (priv->cards[i].pdev == pdev) {
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
