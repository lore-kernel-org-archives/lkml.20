Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386937;
	b=PXISUttmvuI4/0bmtiL3Lg9IoN/8wEVmPhFmEhARzxLhpJ1fYr+KXHU0ffl7/mMWzxVg
	 8wMHQLCuKNWEKHQfk6x2dHlesLmo4WCvYzc+vwQj5bSfXIPCBDBrL/NYmYtPG84sNzY0A
	 ELjB33CXyFxIaPAh9ufXFct2j+QQualq15JZXczGEWtx2JToEjcKmotjVkTEyQu/uopst
	 54lQOnPpfnbhyynKVCZuOKZKh2PJqtnLnBIdLwhUSSMzFIIx3nZH7SP3cCVsgg+ozmqbN
	 Oh16LWzbHYtFvWCGOmCh1FC8914rdUqctjHurRgY4y0B63xHeMNpsElT3oYXavafzIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=XP4Wu7nT+ir3/JSpOzG3VpzBBZM0vfK9214Nh0VjCjQ=;
	b=Yy5wkWp7KNMtR5ATBJcRFmR4HTbg6bHtjNd2M0/2/cF42sfqVf1ZHVolPEsQOFlyYm6J
	 DvKmhPCQO4uzODHMs/ic7eXdY5yBoPIzUSYSbVtwRDebBWk3lVK2j31gy6Lo9o3yCk3Pi
	 Kgz06LW6MYituC5AvSYhd6vUrBi5gnA4B0lpr8BQcesBQON0y2N8p85FLoEjXLKvXtSnp
	 w5g1g3qxeuhtpbS1gSN5B2oXiyFylCoP5QP832f/8HdOwhvViGnpah56riS+CzbjT6PED
	 nmrWSegndzXcPRd56bg/kxv0JsS0kNuw9P88yrvLaJJYnzQppRTtIf6K66GR+i45qVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lkXxAzOL;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838ED606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838ED606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lkXxAzOL
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05b68f851so2384314b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794386937; x=1794991737; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XP4Wu7nT+ir3/JSpOzG3VpzBBZM0vfK9214Nh0VjCjQ=;
        b=lkXxAzOLGDcJQOYArOxY0/H4cx1atoR09E0e4P1pDXqIWRlrNlSMsw+R269b2d6aMS
         16AfD0Bn1upsZYShZ+3FkTBKAWiA69+AA9xs5F9C1PqLoD2LQqHdGvvME3CzgYTAT+9B
         7U1xyDYpowZAxIVwBftdRX4o58zWVA6CoYMCWF06UEnGY6M/MMqIywSxrbrnTjuk5NEE
         UDJKImRpLM7WRiuztp7MfK4KRHDxVVyxpttnzQKSS0u9L7kwNwaBrPIoY/YKWw0l1eFM
         Ie5mMldX3Qi2EBa5qT9FlnSueX0gSxUm+5ZDjyFXTrfhKamMtRXwUgVOhy7S0E7HGTni
         u4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386937; x=1794991737;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP4Wu7nT+ir3/JSpOzG3VpzBBZM0vfK9214Nh0VjCjQ=;
        b=yrUwi5Grre35lyRkjszwxiRLVuB/YJsoTWVybCPBUFhlQL4T+eePtEXONOZlkyRbBf
         7FrX8p9Rqk1ECAYrf5YSw5r/wt/OQHKhtZFD7oYXVDJOWgRmuZO2kDS0SbtdRLrlgIqE
         vV+la8ymDeMEyX/i4I28gABMdEn5h+hrNOsioRb7zmt/FonXJG32KagjAqtHuXRpM3x7
         lhNlio01H6ioEgeUOR70ApHatFp01AAc/hcrugCHzmgYRUa+fPrWTRZm41nLki6A3ug8
         7GHFlMFVHzAITZIkPzu2CX6ig0fyf8vppEK9ZyBanXeHRC2yvLvPKsfasjnFtqmYpSgN
         4vWA==
X-Forwarded-Encrypted: i=1; AL+hErG867Ou/VLzCy3Pvu98EJX1no2Ex7D/jJ1inrGG9D50JR06hWNhiwD/gCEmEZMMlhmCiL5saTW+EsXIb10=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n9i9mfByXcfWXvbkuc1xaKcxL2CforMuagjxaLbHNtl+QPER8
	kTCMAeRXJL0cF23M6Lf4bxH4jYKMxMiD4VpCQiWJV4cqIGBr7D0vZEjgvXqykRFSN0eT72LX7Hf
	hdvU/NvhDzU2AZ8LFYSXPcQ==
X-Received: from pfn18.prod.google.com ([2002:a05:6a00:a212:b0:89f:afc:76b5])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9cc8:b0:3e1:6f0a:cf2f with SMTP id adf61e73a8af0-3f2febde39amr1339727637.28.1794386936537;
 Wed, 11 Nov 2026 00:48:56 -0800 (PST)
Date: Wed, 11 Nov 2026 16:48:53 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111084853.3530107-1-stanleyjhu@google.com>
Subject: [PATCH] scsi: ufs: ufs-pci: Check hba->vops in system PM callbacks
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>, 
	sangram kumar yerra <sangram.k.y@intel.com>, 
	Rajeshkumar Sambandham <Rajeshkumar.Sambandham@amd.com>, Stanley Jhu <stanleyjhu@google.com>, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ufshcd_pci_tbl[] defines the Samsung 0xC00C and AMD 0x1B29 PCI IDs
with .driver_data set to 0, so ufshcd_pci_probe() leaves hba->vops
NULL. Both ufshcd_pci_suspend_prepare() and
ufshcd_pci_resume_complete() dereference hba->vops->name without
checking hba->vops:

1. System suspend on an AMD 0x1B29 or Samsung 0xC00C host enters the
   PM prepare phase and calls ufshcd_pci_suspend_prepare().
2. ufshcd_pci_suspend_prepare() evaluates
   strcmp(hba->vops->name, "intel-pci"), dereferences NULL, and
   triggers a kernel oops in the suspending task.

Check that hba->vops is non-NULL before reading hba->vops->name in
both callbacks so hosts without variant operations use the generic
ufshcd_suspend_prepare() and ufshcd_resume_complete() paths.

Fixes: bb44826c3bdb ("scsi: ufs: ufs-pci: Fix S0ix/S3 for Intel controllers")
Cc: stable@vger.kernel.org
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/host/ufshcd-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufshcd-pci.c b/drivers/ufs/host/ufshcd-pci.c
index 668b57403e62..f9abbbc436f4 100644
--- a/drivers/ufs/host/ufshcd-pci.c
+++ b/drivers/ufs/host/ufshcd-pci.c
@@ -644,7 +644,7 @@ static int ufshcd_pci_suspend_prepare(struct device *dev)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
 
-	if (!strcmp(hba->vops->name, "intel-pci"))
+	if (hba->vops && !strcmp(hba->vops->name, "intel-pci"))
 		return ufs_intel_suspend_prepare(dev);
 
 	return ufshcd_suspend_prepare(dev);
@@ -654,7 +654,7 @@ static void ufshcd_pci_resume_complete(struct device *dev)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
 
-	if (!strcmp(hba->vops->name, "intel-pci")) {
+	if (hba->vops && !strcmp(hba->vops->name, "intel-pci")) {
 		ufs_intel_resume_complete(dev);
 		return;
 	}
-- 
2.56.0.506.g506a7eabc5-goog

