Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996FD3AF660
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869748; cv=none; b=F9+A+Lop6Z1rJzVOe0T3EW7KyJRKIt0VxhXpFryz0KDqBgqvBPcE32sG9QFImQbJzMOEoWQSQdiTI9RAF4NHK8C85PUYY8C4SDlUH1nA5pm1P2kuWkuPs7ZhHSzio33n/gYO4wngODCUQw4x0W5SKimL5RLoBWezdMUWnpG4xuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869748; c=relaxed/simple;
	bh=JOAhONCDvIV93MM10QEhfZjZAUjlaFLYtJjIVb7TC10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jA18wnEDWa8SIbcV3YboX6CPfBqylYShOaSEpyOy3HNvvxw/sGtBcisOLsn+4BVjlTg6UzxaXdZ61BM44APwTvlILBj4sfRwYIahTdgaW6IxroO+sK9JcX/avwwPujmRS7sHRHzxtrKBPzhoCvXjmJ36QkigDvt02WD53wGFu5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcKyhyJy; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcKyhyJy"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so2029461a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791869747; x=1792474547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=31jej+zw5eC3wdks2N/0FrXz19KzIMeRP96y4F0yMqY=;
        b=GcKyhyJy1Pv5Ia3lxyNIyZyeOboRPghJs6J4vIisbZVVEADO2jJr62lbDtYZD1NOXn
         2ii43+xcpO7RHP5x4dZG0XF2gC9VFQayaCbsaYoLTvp4OC3f8LFlbHJDWNeq4lVG5Dy1
         j4B5yTYemyA3dJtLhmTESDHxh9EZ/60pFIRbfDUJu26XYcVPQNw/twE6EL9/D4Fq+14Q
         fBFCGJPDMSXGpqYspavxdEiXOEN0AHIdqj8odGdkTH0o4id384yGHDrwHkqs2ay3eXqT
         8IjYjS6nFmPGRK6Igql+nVUrDfVZmlu554ps4O0pjS2BDdNTtNdpaHuMrJuebs58rprH
         NtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869747; x=1792474547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31jej+zw5eC3wdks2N/0FrXz19KzIMeRP96y4F0yMqY=;
        b=WQEj42eFpYw9hDvNoROfbJrSY/xTvhA7oKydybL2oY5dDi7v88DfEFbY9tcS7XRcMT
         Kx+0642uec2ywEDix0/s1ISMP6MuYGbWTh+2ttVtNIj5D2gIwsZuIJ9vMhC93phh9p0o
         +sVWp7JTHpyqrlnbDxefIsyMfUyfnSeeKxw0ZttzDrfNtm7oEc2BMCFZchZg91neNJuV
         KRBy9r0dfTTGM09ninHv6dr72TvJjrfZpl2Rq9Ktfo+Gn6W9T3vAbWtHfIxi9k3R0eDG
         1hW4SmpDg9in6HEUIPBOZZklwwrt9OBghUZwTs92vEvACZVSD1ETI2zc+C6xO3GNF1TO
         4n5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxq3ix4LDLz7QXmtPr11yowVx2H7cCJpnayI2lvVyl/LeoLPIi3o7xaH3xRPN6nE766BtC0iioeEVwoKUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJc0/drn3ceake6NLvsFHpk0EZL8NdAiDlMNEfWVuzGTJTgGwP3
	5QnoWHlbC4VGM4DHa7keVlNwbeDZEXKWJcwuM7QS9wMTvR0aVRPa5JtOGJBkIlgStnU=
X-Gm-Gg: AYBFou1surTeYCbZIkGaDPnYIZQWGUvduW32vuLWsbTRfRPtQ0byYtVfkIODAZZIbvk
	Cf2t53DzLFE/BPyVhylGfVJ7UefJEXNOu+bZtWsfBHshbNG/0rIJ7lITGVRCvUkBl9Xs93j9v1h
	ZDNBA+V5nJOAl/GAJ5ac0Np0aBMxWndaCrteBgfG06ow3covnd+u8V2t+oyGElDkkO3KQ/FvdRg
	DVJxHamdzNrSFKWwjHHISdVXFX39d/o0gWZk69uQLuT+gcWR9bk6HWICVaFv+whqnKbpQ/ZvLBG
	pSMGG60eYRL1Hsvd50Nirh/quY7DfIhM2Gmk230ZjTAUkFUOq4tBB68g/QGezPCEyhUECi2TmSj
	xTZPfh1qghTC5n+vv5eAatCctZYZaeffRsf0Sg1OAc+FW2UfQf9ux+kcHXHK1T4NSqe9etH/fYS
	DleRR1rkmKNlC4epQ47j/Jljp5AuQF57UYhcujCzHNt1ZNWJ0biKnnFmivuSmPfqt+huHu6FB+f
	O7ZToEiupK5Uh1RZK1RJOrwDJreXqMtBhYTyYgn+u3apFhrFqxs4FKz
X-Received: by 2002:a17:90b:4e83:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3ab3a9dfb4amr9315608a91.28.1791869746831;
        Mon, 12 Oct 2026 22:35:46 -0700 (PDT)
Received: from laptop ([175.157.230.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f5509fsm19656383a91.12.2026.10.12.22.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:35:46 -0700 (PDT)
From: Teshan Kannangara <tpk.teshan@gmail.com>
To: jgross@suse.com
Cc: sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Teshan Kannangara <tpk.teshan@gmail.com>
Subject: [PATCH] xen/platform-pci: Disable device before releasing PCI regions
Date: Tue, 13 Oct 2026 11:05:26 +0530
Message-ID: <20261013053526.1336149-1-tpk.teshan@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

   The probe error paths release the PCI regions before disabling the
   device. Documentation/PCI/pci.rst specifies that drivers should disable
   the device before releasing its regions to prevent devices from
   colliding on the same address range.

   Track successfully requested BARs in a bitmask and use a common cleanup
   path to disable the device before releasing those regions.

Signed-off-by: Teshan Kannangara <tpk.teshan@gmail.com>
---
 drivers/xen/platform-pci.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
index f2438232518c..a12ac57274a6 100644
--- a/drivers/xen/platform-pci.c
+++ b/drivers/xen/platform-pci.c
@@ -95,6 +95,7 @@ static int platform_pci_probe(struct pci_dev *pdev,
 			      const struct pci_device_id *ent)
 {
 	int i, ret;
+	int requested_bars = 0;
 	long ioaddr;
 	long mmio_addr, mmio_len;
 	unsigned int max_nr_gframes;
@@ -115,16 +116,18 @@ static int platform_pci_probe(struct pci_dev *pdev,
 	if (mmio_addr == 0 || ioaddr == 0) {
 		dev_err(&pdev->dev, "no resources found\n");
 		ret = -ENOENT;
-		goto pci_out;
+		goto out;
 	}
 
 	ret = pci_request_region(pdev, 1, DRV_NAME);
 	if (ret < 0)
-		goto pci_out;
+		goto out;
+	requested_bars |= BIT(1);
 
 	ret = pci_request_region(pdev, 0, DRV_NAME);
 	if (ret < 0)
-		goto mem_out;
+		goto out;
+	requested_bars |= BIT(0);
 
 	platform_mmio = mmio_addr;
 	platform_mmiolen = mmio_len;
@@ -165,11 +168,8 @@ static int platform_pci_probe(struct pci_dev *pdev,
 	if (!xen_have_vector_callback)
 		free_irq(pdev->irq, pdev);
 out:
-	pci_release_region(pdev, 0);
-mem_out:
-	pci_release_region(pdev, 1);
-pci_out:
 	pci_disable_device(pdev);
+	pci_release_selected_regions(pdev, requested_bars);
 	return ret;
 }
 
-- 
2.53.0

