Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F5949B5A2
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791382814; cv=none; b=gV1DHGROx+5rAVHlvINm8n01ysghm08MG3XfyS4z5rhogFL8/A/BPy1czOP6UxpNFZPgz4o31rEoMRk+Ye93mbTkx46Dy36/b8+KZBcQgKehk2yKXlE+tfVF19PolY8SEViTDUEybP1m+iG7oXeaNhkawKLAehHcjQHH4Dar1R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791382814; c=relaxed/simple;
	bh=FevSWJK9Syzx7poqCu6O++DrbI/Qs1QWh0ohA5zPVrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H6G5wNCgUihyrlZ8spwjKjlNqSY57HsKslFNqCoMdCAutWCQoZNnY4cJQ99hLnevNCeiiUSBIwmvRfHLX0xnL6gvMVUdb0EudYTp4BYz+Gr0Pdz9HjiL/mnnGaSw8giGqTEdvvS1w2zszipEVgzOnr+5V6vCA/+AVAC5x3BOSio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=smartx.com; spf=none smtp.mailfrom=smartx.com; dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b=ilN8Kdbo; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b="ilN8Kdbo"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15168a20b47so1254510c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20251104.gappssmtp.com; s=20251104; t=1791382807; x=1791987607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zYps3KCVttLwho8YDfSTZ1UrhVzt/fY82tJd2iDL6Fg=;
        b=ilN8Kdbo9lZiKwnx0qCpvZOE22igOLw+73h+s8+/3PEGhF9Oa1YBOYcRvSngUPsSfn
         V4N/8U9vkG6n2u/QoOauG5mzuUkL+YUMxxdshG3K52WBwVV8E5mO1oXWO3Putiy7FJzt
         Xe+C1/MIq/HOp/sD2T0ErMHiwQRGqzniClPBvkqhIG6UkFF60T4Zad4fSPnfnXTadcem
         cBrkgW9WxKFbQoqWBCFM+XIgQxjhplQJrXKT+dQW4820VtQSZjb4A1c4g6bJ7MtIKKi9
         yILrEBo4kAQIX8mz3Typ+a8j1NqhjFXqyfwLK5/rd5R9OGHGBeI8DwsVJ17t/ItQ8+Kf
         PERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791382807; x=1791987607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYps3KCVttLwho8YDfSTZ1UrhVzt/fY82tJd2iDL6Fg=;
        b=YOThloGPPe8R9b/XXUaIysqzGVdgzc6vJ8lkshLg0ooNtGjqr+2cv5Yh61OfRFdqGR
         WyUHRWDkmCarazVMnLiqfivoljwkex/Xly+dQxH2FAr85vHrvA/tSz5/qxKv7KdbROpr
         XEcKZV70jkr4NCixnxVl3iZIbs7ywFkl1HJV7h7R2zlWU0K7+hPvkIrMNr3S+9V57Ddh
         GQJWLhu7TcVTaT/c/VKi7YZ/+Yl8pJ2j4vNidIIqpIf4VyqFKvTlOUa121WU/xpmVtAP
         63pvVe9hQKy/5vdHiEHv54iDiAuSWqfnTywL5lQvuFmTRwoy4NxJa1rp54ZC76SGh/jy
         UIgw==
X-Forwarded-Encrypted: i=1; AKwUvBxMDGOT5gwZm2ckRYwAGrndAheoY8iRlERWTm/nDVajAVuBya3fsaUtqSqvjS4QIGr9qk3X2wBy7iGUnDU=@vger.kernel.org
X-Gm-Message-State: AFuF++mOR0Okm5cljtqU0VJKuy56UYgJU5GaHj8rs/lXYt0GWdzM4Iyh
	hZKQZmqdm9HAMyZJPEphCL0Zz7aeLOxyRiJKmLvKDa/PKZxLZeKP4W8Gprtx5lvOzvOavMaJbh6
	h4HNtth7wsjNzG3+E3iz2xcx18q7eZT34RaeVg726vd9sYovjVhbutQm7C0Y=
X-Gm-Gg: AYBFou36RmgVs6Wg6/QcWcrxFpnfv9HGQvcP9ktheiSl/G5X45vixN/MbyopHA3qUsJ
	LO6Ljt7SCEtnsXMv7riEi5Hy9RJSgKbV2i1u2f8l0FQIGicxFRoGbV680qtFqMm984tWyL9fTLT
	Yn26f3Xhw1ML0w8FB0vrqN/JfBvWRcVXqLEWgH2zu7MHYrSAySddlToa9NCx/mnT7SW3fnxUXkz
	vpGN7w1U440ecEmU5oVtHQRMxG4PDzvmaS/Bu1bg4jw+dqDpBODJ5mRZmAMMqsrx5Y/B+Kxa2L/
	cai1VDTKkDgScAuQ5QM/9OP54My2jXUZ+3tZbIsISzlaD87MhmSo+3oeuC1xB7HtKVrzKATCOoE
	DgUqQmhCMSWC1aECk6SV6oPDuX1cqGjsVnbq2dMvXrO8zAYm8PC5V/t+6c1kpDLu66pncdS76bj
	UyzYSrQnkAyMnNhJSnvaEIYRgOeBSahh+xUu5LfqqHNASouh0TFd3s2OCZIwvLd5uJqbSVuVcC2
	YZTkukQiKFj1n7XuEn1RQ==
X-Received: by 2002:a05:7023:a82:b0:146:85b9:970b with SMTP id a92af1059eb24-162079a691fmr2590983c88.39.1791382807133;
        Wed, 07 Oct 2026 07:20:07 -0700 (PDT)
Received: from localhost.localdomain ([23.148.204.128])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-16375a1f898sm3506357c88.0.2026.10.07.07.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 07:19:56 -0700 (PDT)
From: Lei Chen <lei.chen@smartx.com>
To: sathya.prakash@broadcom.com,
	sreekanth.reddy@broadcom.com,
	suganath-prabu.subramani@broadcom.com,
	ranjan.kumar@broadcom.com
Cc: James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lei.chen@smartx.com
Subject: [PATCH] scsi: mpt3sas: Fix debugfs setup error handling
Date: Wed,  7 Oct 2026 22:19:51 +0800
Message-ID: <20261007141951.417155-1-lei.chen@smartx.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

debugfs_create_dir() and debugfs_create_file() return error pointers on
failure, but mpt3sas_setup_debugfs() only checks for NULL. As a result,
setup continues after directory creation fails, and a failure to create
ioc_dump leaves the per-adapter directory behind and still allows setup
of host_recovery to proceed.

Skip per-adapter setup if the driver debugfs root is unavailable, and
use IS_ERR_OR_NULL() to check directory and file creation results so
that the existing error paths also handle error pointers.

With the corrected error check, file creation failure removes the
per-adapter directory. Clear the stored directory pointer as well so
teardown does not attempt to remove the freed dentry again.

Fixes: 2b01b293f359 ("scsi: mpt3sas: Capture IOC data for debugging purposes")
Signed-off-by: Lei Chen <lei.chen@smartx.com>
---
 drivers/scsi/mpt3sas/mpt3sas_debugfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_debugfs.c b/drivers/scsi/mpt3sas/mpt3sas_debugfs.c
index 183391f6b8d1..edaeccf538f4 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_debugfs.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_debugfs.c
@@ -120,11 +120,14 @@ mpt3sas_setup_debugfs(struct MPT3SAS_ADAPTER *ioc)
 {
 	char name[64];
 
+	if (IS_ERR_OR_NULL(mpt3sas_debugfs_root))
+		return;
+
 	snprintf(name, sizeof(name), "scsi_host%d", ioc->shost->host_no);
 	if (!ioc->debugfs_root) {
 		ioc->debugfs_root =
 		    debugfs_create_dir(name, mpt3sas_debugfs_root);
-		if (!ioc->debugfs_root) {
+		if (IS_ERR_OR_NULL(ioc->debugfs_root)) {
 			dev_err(&ioc->pdev->dev,
 			    "Cannot create per adapter debugfs directory\n");
 			return;
@@ -134,10 +137,11 @@ mpt3sas_setup_debugfs(struct MPT3SAS_ADAPTER *ioc)
 	snprintf(name, sizeof(name), "ioc_dump");
 	ioc->ioc_dump =	debugfs_create_file(name, 0444,
 	    ioc->debugfs_root, ioc, &mpt3sas_debugfs_iocdump_fops);
-	if (!ioc->ioc_dump) {
+	if (IS_ERR_OR_NULL(ioc->ioc_dump)) {
 		dev_err(&ioc->pdev->dev,
 		    "Cannot create ioc_dump debugfs file\n");
 		debugfs_remove(ioc->debugfs_root);
+		ioc->debugfs_root = NULL;
 		return;
 	}
 
-- 
2.43.0

