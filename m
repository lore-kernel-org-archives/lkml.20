Received: from mail-pj2-f19.google.com (mail-pj2-f19.google.com [74.125.227.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2553446A7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789708431; cv=none; b=Qxc/Bz1cJBbwQ59zabzlIidA2/XlBNuBoxxs+n1Sg/mtrAMQFGHhG2fh/pI9+uDcjQwgeekBDxqgXbZFp/U0evIfg7HNXAZ+All6PVqK1jC47+0f+D5866VNo9nDYaWYCr5uKNuRxvYdG6fcf87+AMdnaQG8HTk36xEwtThQ1AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789708431; c=relaxed/simple;
	bh=ulA5Ml9aBNWFkPyTYzxj3umiIvCtlQZWCthJVuYoA7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Elq8/6kifPjZyYRPoFjbG81MW19yG9WyENdK9jKwP6oS8QcSeXpp2FXCjGkwWpi7ab4LAaTr7s5h7Np9yUDmL9JnV3qm4cAtuzL8jkfrAu4ffrYaGEZQjdowYGCVsKhffDfDwihdWjVhRsiNd7edHwlCif0w5AUm4i71A5vYvfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKZmIX1m; arc=none smtp.client-ip=74.125.227.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKZmIX1m"
Received: by mail-pj2-f19.google.com with SMTP id d9443c01a7336-2db18fe433fso2701755ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789708429; x=1790313229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fD5FYGWqbEawclsuAKqnAhQHLJbtl85EqSDEc6sInv0=;
        b=iKZmIX1mwH3JLXYBvSi8YG5x7BBNqBVvoZKDDAIiYkpWKpEx79Dpd3/JBv/FHfm3IA
         OF8j3bJxEP0tp4pWHq1p8eMEkTcoacBQRehcxJY+f+2thtyiwHWUwO1yRf6C47wJLceO
         i3AkWyaxCD9TnmNvPt4gSRlPPk0HA12WbXSPm79w1ZCzgmN2ZmPnbnRadP/GUUzh7hcE
         PeC60udJ0jkLxdE7cKzEjLFk3QYRyNEx9iPNoFjhXe9l3l3q0C77d1SU3I8sFvUd5Hxt
         CE3wuHYYLkKurPLvp8bKhQWB4CPkdHrYrszHgkqETv+iT4efGpzN3/y+ZLzTKHPgfYDd
         aSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789708429; x=1790313229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fD5FYGWqbEawclsuAKqnAhQHLJbtl85EqSDEc6sInv0=;
        b=cXAc5Az/WkKbkrzr7hYJtjY3qT9/xBIU1C0qyKTRTwkcrB2yM1GmepUIk849FNgshX
         e+Uu/EORgbbdCmId/zXirtiy513hTgEjob0KtkaXLnPKyA7YJhoMffvWQya5lyGxVFl/
         llEPRVszyqyeVI+CWKlwf8gHaKmQvKOMXiRfF20UO7kOHMBAWbscRbNiy8ddAG+F9j97
         2YNtGBxUNJvln4D5DaeXZBqzblnwX9L+nx2kW+ZbtGPYrwaHJp75/mfDJqY8ONVJ0rYX
         6qfMl65d48MLd6EE1mvqAQBnbf2EnOFPp+KOnOaah4lUAqbs0bw5VlkrXy94OrWItSMd
         eo/A==
X-Forwarded-Encrypted: i=1; AKwUvBwz/Rze3XMrCfMohK2B5wYAY0wHanr0+9wuu1moXLAGVCjx4Q6H8L80eD1yNB+D3yvAcTB72k3DrNoioww=@vger.kernel.org
X-Gm-Message-State: AFuF++kIQn1FDMrr7RP2MsFdmnNdtVHtTgMP+325kP+mE2WqhxvXFsqe
	h6dDH7gVFtNxpYL8T1buclGtQTpHA6HvoZgRDwp/x0Uj3AyqdNHRstLN
X-Gm-Gg: AYBFou2IKjsXJIhSKLVVMSQm2X4eJc//MCnPrRTt5MFm+TpXC2DPrY9EUGHeM9LLVdl
	tQ+HZ9W3mjbeX4YWHNPeXNSz2E3Ex/dK/h5m7orvs0y0KrzpGUn/ojJ+mDhzHGeRIoMr7f6YLg3
	IikmgPbU2nd6z5XfooOMh8m6nOBDVeg1wEaTw5+63LNOcERF2Q7hK00XFwgDfo859yAB2xqBS1R
	jdEtZ7jR2fAgPjwqWb8N++E4A6XaNIldsvS29Zl9fUJpjIr+VYmhMjzdIztZJaKnHITdM8NWN+b
	AhIJVAet5sVY3cb4aOywwnCwVDNuYEyrEHUMKA4mPiYIqSUBzYlMSs2bXjaSApPLDScCb/HJkSL
	2GfXwHgZc6LilIUGS7UDxT/AeuLxoYE+JbOD5Cl714Csz/Tqw2F1YQBQ4LZahMqbQUKlBuCIPhS
	pAxG6L/0R4ZaW6OQ5qoe5/gykQK4mWCNE1WZYyi1RS1ulchfsUiGC4w7xQFG8FdEHC
X-Received: by 2002:a17:903:9ce:b0:2db:20fa:9443 with SMTP id d9443c01a7336-2ddb1b1133cmr31729675ad.13.1789708429446;
        Thu, 17 Sep 2026 22:13:49 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb73dae10sm2177985ad.1.2026.09.17.22.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 22:13:48 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] scsi: a100u2w: disable PCI device on remove
Date: Fri, 18 Sep 2026 13:13:40 +0800
Message-ID: <20260918051340.3549545-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

inia100_probe_one() enables the PCI device with pci_enable_device().
The probe failure paths disable the device before returning, but the
normal remove path does not perform the corresponding cleanup.

As a result, the PCI device enable state remains unbalanced after the
driver is removed.

Call pci_disable_device() from inia100_remove_one() to match the probe
error path.

This issue was found by manual code inspection.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/scsi/a100u2w.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/a100u2w.c b/drivers/scsi/a100u2w.c
index 4365b896f5c4..827d8715138c 100644
--- a/drivers/scsi/a100u2w.c
+++ b/drivers/scsi/a100u2w.c
@@ -1204,6 +1204,7 @@ static void inia100_remove_one(struct pci_dev *pdev)
         release_region(shost->io_port, 256);
 
 	scsi_host_put(shost);
+	pci_disable_device(pdev);
 } 
 
 static const struct pci_device_id inia100_pci_tbl[] = {
-- 
2.43.0

