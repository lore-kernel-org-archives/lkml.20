Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990CF2931E5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789352900; cv=none; b=IkFj9GJLHNuQaedWRx6icJwBZYHCjUU/Fqlot1QQ76HMtIKNJeSdqCvH1aZU4WdjoaJlumzE3B9lx3/inxXitQWAJIFMhAhIQW1FcCW3EOQGDPY60ROnV0hylP9Z8BSUy3xjpVzQ+OCHe0GIoKWc3IotareRXrnD+jRxBIW9/N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789352900; c=relaxed/simple;
	bh=UwQcyCtvAgULgEsPJFhkCRC5Ap9dKgwHVKIG/nOSa/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sTq/OzLa77puLQThZNdjP90IMUUP8GPX6WkSaWpWwhLegIPKHSc5r+XYltopcIZcqDzdHR/s3kYFQQgG79JGHR7VG14R+W3x3WRMXQ3Mn3AykIiM3T7UBsPWKQse2LPz8knhpPN+TyKwVnjmRlhhoECifrG4dns7Z4QwatUoPj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNdWhvY4; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNdWhvY4"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-939fa4f2b81so147646485a.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789352897; x=1789957697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfLRfSvn+xOZSC/1dZJbN6doVrHFNDZyUwYsTq1qEDw=;
        b=PNdWhvY4gIiHTRUPnOB1S8P3O0ipRmP3XmL+t+fQMMmso+GJyuQOxl2dZL5EBtdYNG
         yLqS4bRTUOLe9VYCDScEufZOMliTCKu6m/fdFv5yjknCraXCQZKH9wwFGEDvpEKBpasi
         hudlEy3Is1khqktRwIEbF/ipjb6gD8n0QedrUfs3g5RIL2ZDIxQls+wup0zd44frdyX9
         +bFCFbEMfyJbNfmrKwTKKsLJmqzgLalQVIOi6fEouhJFCcOUG5rX5RTiKewXZ3TWLVeL
         reVulOGGCmLTjPrdfBosuGPas/MCKhK+fvxVvepYpDv5+Gi90qzMPvtsbVc9lwFZP3Mh
         HO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789352897; x=1789957697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfLRfSvn+xOZSC/1dZJbN6doVrHFNDZyUwYsTq1qEDw=;
        b=ULrde9NdVJa1IBMLaxT/xd91swFQKDfELnou3CNTOiOcALO3OfV/aczZWBY4YytPjY
         FPVT4AA2oxNoFRk/Q5ew9wgej/+K/s5CaBkCAcdPt1sH13WzBDBmC2On2N2uzIns+zmc
         SY4f0jMxSXMO1u6ex06GIy1gk2Air7qPCxa6xFsB8M0+i+LCn7kTn69IwIZM4iC9zVcJ
         RLGIlYD6OqPHCrkzGbcwogzzBubI4m4ARnpul6d91MYkaAstlbUEmJO7e3srTN3ojTl2
         A2U9xKK/5O2f3uwPs/dgpLDirEmVRpUGap7MSSHtCulP4yRfwXbVJpNyxy0kIlOa/7nf
         uLtg==
X-Forwarded-Encrypted: i=1; AKwUvBwEJ8nezJ9pGBY/C69lW2kC1F6y2e+24Ri7sNMmWsab44Kr3jvyRo16VH8D0bfNb1mxGUAYrFk9p4UIb9g=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ7RHCV81xHCL/9SAjnef7+u7dZoBrbBrDwhQ4qmpsegBtm2er
	3RIVkaNEXycBLMOZb4L2vR90VXQcJCXNfQ5/ByOlNfJdlHklSSbAEWJowjz5jd1o8OVD
X-Gm-Gg: AYBFou0S1TG6KfUPDMoVtHgi2qUvHnC57LFKnP7pCL+qOqWSbmTUpICErltIB+/w+Pz
	CkUGSrH4G6c4CGkVVo8kblzyibfMeazWeYtK2nG+IbevLMmhBp+EGk53cTguzIqMm5DnXIgMnD3
	91viEtgfmAadCLwqypFqtegRws9jHrMKwNKoP+jOdZ+h7743eCHjA9xMQ7clbrgfobOuQy+jLvB
	NBAoefr6/bYb93W1hVbt7QN766pu4fAN9VlhZW9SpSFfDeu8xY2B9VjnPG7UToxU0n5B3d5DoeK
	BcSHsY0l2gI4C3zWxPUs39G7/yw0EIzSUzyWD4g+XtPi35YaOi+PxkEnSN2qOSd55OmgDdvpM6X
	LP9/+W1kwpLy/VoxDto0WzYB+rEA0tSCbi+eCqDp24OEDN79dYgHSqDc5f444NsZWmXHC5VUQ0S
	3lSd12+BroATEUmdhXLS3xAy0RQFlOqeKh3gk6xoxmZ37/6iHh2tIxBphgaBgyKhhIGK95m73el
	VTJsUDBvRlXQtJsboqwH2M9Cway7AtkSW6YqxmBaCjT7wxYNyoHmevotDgZw7Tx91zQRuXehSYg
	nzQpuPWaFunOAzFdPbRdoycU4ePv1m17xQ==
X-Received: by 2002:a05:620a:1a01:b0:93a:f9:614f with SMTP id af79cd13be357-93a29bfd0f8mr105360485a.52.1789352897622;
        Sun, 13 Sep 2026 19:28:17 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d3779sm82963676d6.43.2026.09.13.19.28.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 19:28:16 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: cx88: Disable PCI device on MPEG initialization failure
Date: Sun, 13 Sep 2026 22:28:09 -0400
Message-ID: <20260914022809.70623-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cx8802_init_common() enables the PCI device, then returns directly if
DMA mask setup or IRQ registration fails. cx8802_probe() frees the
device and drops the shared core reference without disabling PCI.

Disable the PCI device on both post-enable failures. Preserve -EIO for
a DMA mask failure and the original request_irq() error. Do not call
the full fini helper because the IRQ was not successfully requested.
The successful probe and normal removal paths are unchanged.

These missing error-path disables are present in the initial Git import.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Assisted-by: OpenAI:GPT-5.6
---
Validated with an ARM64 W=1 object build and strict checkpatch.
No hardware runtime or probe-failure injection testing was performed.

 drivers/media/pci/cx88/cx88-mpeg.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
diff --git a/drivers/media/pci/cx88/cx88-mpeg.c b/drivers/media/pci/cx88/cx88-mpeg.c
index 0c07ad3..cd23667 100644
--- a/drivers/media/pci/cx88/cx88-mpeg.c
+++ b/drivers/media/pci/cx88/cx88-mpeg.c
@@ -392,7 +392,8 @@ static int cx8802_init_common(struct cx8802_dev *dev)
 	err = dma_set_mask(&dev->pci->dev, DMA_BIT_MASK(32));
 	if (err) {
 		pr_err("Oops: no 32bit PCI DMA ???\n");
-		return -EIO;
+		err = -EIO;
+		goto fail_disable_device;
 	}
 
 	dev->pci_rev = dev->pci->revision;
@@ -413,13 +414,17 @@ static int cx8802_init_common(struct cx8802_dev *dev)
 			  IRQF_SHARED, dev->core->name, dev);
 	if (err < 0) {
 		pr_err("can't get IRQ %d\n", dev->pci->irq);
-		return err;
+		goto fail_disable_device;
 	}
 	cx_set(MO_PCI_INTMSK, core->pci_irqmask);
 
 	/* everything worked */
 	pci_set_drvdata(dev->pci, dev);
 	return 0;
+
+fail_disable_device:
+	pci_disable_device(dev->pci);
+	return err;
 }
 
 static void cx8802_fini_common(struct cx8802_dev *dev)
