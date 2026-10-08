Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9634331B80E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791426896; cv=none; b=mKeGS0bBNJtzOKXQWhbIlOSdzlRhiSeJeuO9uxd+gk/Y8ONH+8xygfrGKA8p+LNa+mJ/fL7BODQVaPWcsSBZIEk70cvE3Jkx/1JkLu1cVuUkBmiPhWTwogW35o85Y9Gmf/3sEAZRs/FhrvjOfOF2RiOVfhQgpDFOsV4ZDbT7XRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791426896; c=relaxed/simple;
	bh=ipFidcXxbVizbNu+kgmGjmrJAORqhj4oJeJtvJTCpuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ukVz6PWFb/PsRtci+3Qkr+nxSyqrXY1SyXq1Kf/YC3DHJK4j92gzh1KuVVXmlOj5fsSKvlg0QZ022/E5pSDhgdUYUhHbtkOnVWIcLL9JaM4rVfkEpiDUSHfa6xXfXTvptDnPRFxIX2FqOFVnDv7KEaFL72I6y8Be8w/XBn4Mahw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com; spf=pass smtp.mailfrom=smartx.com; dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b=MhBBCfT0; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b="MhBBCfT0"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33c2520ad38so5869902eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 19:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20251104.gappssmtp.com; s=20251104; t=1791426894; x=1792031694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sfh2HSMnCjXwgYeAujbI+vl7unaGjCR05Oxxe16EwFw=;
        b=MhBBCfT0Ve7Mq8Ler+7nOy7KefPP/A/rt7IcbZ2xZhjvDpI4OKCyXIIf1KL2E+0rIP
         H5alxfSbo3tz4lzK/avqnETlQtAfWhST6XBhBUTZ/GltrGyTXN2Q1nQsc8SuZ2LhoUcH
         VJc+Talr+D5zh4b4CKRn0XJsCGRLD1zbmAuj0dEC9OXYN1NEvjqVxGuqKYBJVdF47Oyk
         mCOhuu7Nl4aR5+A3h9OJPtrnxd/G4+ZyhWqWm0loMqliMXUveAxeTm/A4ROppiuIrjVb
         Tfvp1lFAPRAIu5oKsTz0yNnrPls5h5+l7v3vlUHfkKFw0yTAa7vQQp42W33cfbtF4+iZ
         EMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791426894; x=1792031694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sfh2HSMnCjXwgYeAujbI+vl7unaGjCR05Oxxe16EwFw=;
        b=FcC4jCqqHIsZ9Q7w/yRpqvtEKhNsoEJN1aTnr9XUE14G5YuWeFOGdPMhAH/IHBG9LX
         pSFSUwo2gpVKP4BwBNDKQr1qjMiDj+zSf8HKppzWNZLJYZbfsalwgpIILVIl/RaCl21Y
         eseCu/NlAGjOh44bSyYqdF9+6QsSq08A7JLPgTAQ3ngrlEwWXFAM6IXfFuiXHrWAmTZc
         mQMp0GvJyS1Gwi5heLOw6O73a0pgC1R052vRAQA6Rwud2P+oMMlaXEoFF/x1NfCw0Hh3
         Q3eMxEABGUAmDsS8/FHOrwiGrBNF/SHnQXEsRvfw2MUDqCybCdKrJNXStplQfIEPcK5b
         WGMg==
X-Forwarded-Encrypted: i=1; AKwUvBx+uSXmlf2LFTGI+mEzb0AOfwIiIYRiTudDFlYbCXQnciBrMx2xS0VQHoWsUfak1QxAkptjmQWRJonc/uw=@vger.kernel.org
X-Gm-Message-State: AFuF++kAxpUxt2BiO4GqEVEDXFRFQPKzVn9VDVNfpXYMVB82xqI5XJ9T
	OFqQ+k3Sq7PFjF3XSH1MbpymPZiCmoFqnNmZH0y+pJguZUifJBpA/EK4YEl4agdLaioHnwE+0aV
	SHcIzAtyz7/9dONgto8oFgOPwYM1sNxyum2Y5XI3UoCyb60EjysHNekcp1Qk=
X-Gm-Gg: AYBFou2T7crWq8lAtGdJbsgS2Ds4ZcAJl7/smEzxtfh+F9ZFrkrnjTuRcl29JJ3phhX
	wgL8i3OJ/HH/RIjlEHuVmb4fCYP0nmbpPMT+LOiX2DzddXeuKnv05eR2TkNN8Up9eDoMNUmZb3A
	idoOxalEgFeNVnaEn69zUx0FH05DI5JtL7G6GXNtgcEaKLjjGkK/MTcHnBYxwQrB0qsmcy6uo5A
	qwiHTf+0u2x7D8YXrIGDtrmCRCBYhabYL4+QtZtaXlBjL4RuXYaESHSHpI1dFxxWY5jh2jrR7TT
	fNBmKsq2aHf/w2L8HcvLL3+9bSwQGGVzKwhFaa7TQTuXl9ltnBK5dvEiecVRUdkqS0XQyGOmdQR
	Sx033NryvHMORDkNrT1PaHTbSR/RjQepIKinOHKF1IV9z+NuYsRcIqBA4xoX6n8XzRKgNK7BEk6
	cFpIQR0flYgSWdIFQxozl46RWRMQ3q3iQO2obfBOGBpLxN1ieY+NlyAgPxdawSME3PsFCVHL8bB
	561nK4fEu/j3E1rpyWX
X-Received: by 2002:a05:7301:b06:b0:351:515b:4e85 with SMTP id 5a478bee46e88-3515dd78cacmr4684940eec.16.1791426893578;
        Wed, 07 Oct 2026 19:34:53 -0700 (PDT)
Received: from localhost.localdomain ([23.148.204.240])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3515aff5dd6sm11859009eec.26.2026.10.07.19.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:34:53 -0700 (PDT)
From: Lei Chen <lei.chen@smartx.com>
To: sathya.prakash@broadcom.com,
	sreekanth.reddy@broadcom.com,
	suganath-prabu.subramani@broadcom.com,
	ranjan.kumar@broadcom.com
Cc: MPT-FusionLinux.pdl@broadcom.com,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lei.chen@smartx.com
Subject: [PATCH v2] scsi: mpt3sas: Simplify debugfs setup
Date: Thu,  8 Oct 2026 10:34:40 +0800
Message-ID: <20261008023440.468919-1-lei.chen@smartx.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007141951.417155-1-lei.chen@smartx.com>
References: <20261007141951.417155-1-lei.chen@smartx.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debugfs creation helpers return error pointers on failure, so the
existing NULL checks do not handle creation failures. There is no need
to add error handling here: debugfs accepts error pointers as parents
and debugfs_remove_recursive() safely handles error pointers and NULL.

Remove the ineffective checks, error messages and file-creation rollback.
Allow host_recovery creation to proceed independently of ioc_dump, and
leave any successfully created entries for the existing teardown path
to remove.

The setup function is called only once per adapter from probe, so create
the per-adapter directory without checking whether it already exists.

Signed-off-by: Lei Chen <lei.chen@smartx.com>
---
Changes in v2:
- Remove debugfs error checks and logging instead of adding
  IS_ERR_OR_NULL() checks.
- Leave debugfs cleanup to the existing teardown path.
- Allow host_recovery creation to proceed independently of ioc_dump.
- Remove the redundant directory existence check, since setup is called
  only once per adapter from probe.
- Reframe the patch as a cleanup and drop the Fixes tag.

Link to v1:
https://lore.kernel.org/all/20261007141951.417155-1-lei.chen@smartx.com/

 drivers/scsi/mpt3sas/mpt3sas_debugfs.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_debugfs.c b/drivers/scsi/mpt3sas/mpt3sas_debugfs.c
index 183391f6b8d1..0e37473abbf6 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_debugfs.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_debugfs.c
@@ -99,8 +99,6 @@ static const struct file_operations mpt3sas_debugfs_iocdump_fops = {
 void mpt3sas_init_debugfs(void)
 {
 	mpt3sas_debugfs_root = debugfs_create_dir("mpt3sas", NULL);
-	if (!mpt3sas_debugfs_root)
-		pr_info("mpt3sas: Cannot create debugfs root\n");
 }
 
 /*
@@ -121,25 +119,12 @@ mpt3sas_setup_debugfs(struct MPT3SAS_ADAPTER *ioc)
 	char name[64];
 
 	snprintf(name, sizeof(name), "scsi_host%d", ioc->shost->host_no);
-	if (!ioc->debugfs_root) {
-		ioc->debugfs_root =
-		    debugfs_create_dir(name, mpt3sas_debugfs_root);
-		if (!ioc->debugfs_root) {
-			dev_err(&ioc->pdev->dev,
-			    "Cannot create per adapter debugfs directory\n");
-			return;
-		}
-	}
+	ioc->debugfs_root =
+		debugfs_create_dir(name, mpt3sas_debugfs_root);
 
 	snprintf(name, sizeof(name), "ioc_dump");
 	ioc->ioc_dump =	debugfs_create_file(name, 0444,
 	    ioc->debugfs_root, ioc, &mpt3sas_debugfs_iocdump_fops);
-	if (!ioc->ioc_dump) {
-		dev_err(&ioc->pdev->dev,
-		    "Cannot create ioc_dump debugfs file\n");
-		debugfs_remove(ioc->debugfs_root);
-		return;
-	}
 
 	snprintf(name, sizeof(name), "host_recovery");
 	debugfs_create_u8(name, 0444, ioc->debugfs_root, &ioc->shost_recovery);
-- 
2.43.0
