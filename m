Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4C23A1E96
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791426877; cv=none; b=cbFDMzrbCulvfdHx6xGzJgSD8MRf6BHV7b6wfu6hmeF5svo8/vxps06UVWMv7jnoViBV6A2SLr0bhE1+F37c6lVyXyGVjYXVUi11gMzgCp/M1fcs6WrxXItxcb+yYLExfUAQk5tkSFt3rC5uOZiLE6q1xrUlknfAITb23MurBJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791426877; c=relaxed/simple;
	bh=+wM0VmSiDjRAdWxhi0prLQUEgT4m5W5HkWp4Vz60K00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTJzllXWA2ZcKx2GO9kwPjgAYf31p6lWbO665WruE50Plu/1/MWslM+68jIvqzT0jhdvqo4cpOcbnZ+OnW9Z2ifk4tCQ/bwrRAPk8ghioiWTGPmdK3eUrBq09VGSvVggFSO3IRyFGJ++JeAR/f+gbcoW5JlG6fuTWg0bNzjq2Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com; spf=pass smtp.mailfrom=smartx.com; dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b=wYLVgrul; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b="wYLVgrul"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35154cb9de2so3487435eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 19:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20251104.gappssmtp.com; s=20251104; t=1791426873; x=1792031673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mP1X9Jb7PPmqjAwOELPEXnkZJu8MP8cRs8E5/HQQK1k=;
        b=wYLVgrulRV6igOhgWcvc+reATTuvxIWj87p/9Xnq+3YfhrtXUNTD916N3T3IcvtEqS
         CIKu/PBj5iV4c+JfjxpDYK1CjIyYwiV9pAyYFjlHxfuoq3VvMiE3atRT8c/F5ikvoy3d
         Zt5/G4yzfTnqQIPqV4iqXGQm8f7obJaQBWKqvxRJE89S+2R8kR97GBxMSlWvT9G/DwMw
         +JQXizokTtPNYJQObYJGphV8Bq9KcoESqR0qdY0lHvfp1W3ZW3+VKahfznf4ysagPDeW
         RH7JEjY+oa6ydtPiUkC1gBtzKkilVxywzpBrnPlNxheo6yDiMQsL4Lk9OQRHSbPU0dIx
         odmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791426873; x=1792031673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mP1X9Jb7PPmqjAwOELPEXnkZJu8MP8cRs8E5/HQQK1k=;
        b=Dp0GPgGPIs+j8EI7XzKOEbWmJEZVmxTbIQaNchulzOS21aeUhOrluh40tdYy/LaQTZ
         H8lrFzX39g9VqGWq48gSA+lKYYC43FB0f64HRe/aKoqpBxRoTloAqmlR5SOVnv0/FHac
         eQYgEKv+B4vylB4JOaD3WDmDYYqstyBijg8E4nzjENv2eclgoxixu7ZxSTKpFMTSi9gb
         wwn4XMFpm2oUN55TpzJvxpFAobYDRLF3aVReU2qI+/CvTmruslUF+OOEMCbBt/sqgV39
         Xjaf8RGo+2AwZglLTFzEk5+cMo4R3PYeCxV2EBwuzuBSMicJGBHa1BM6WhtjrG3LCDCh
         bKnw==
X-Forwarded-Encrypted: i=1; AKwUvBwE9H3ZmhC9P7+Yu1vELVxyN0Rdz4aiiVPyooV3nEiI+LEpTUQ9NOCqFZr9kP2QAU25a5NVU35VLGET1+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRCnWWfAMQXluuoQ7VAKM5Nu6IYysjfY78q5F6jEWm8Acl9OKe
	BWWtL4cwRg6GGa/ihOZDxXiTN7qZBzsAXSWxORhyXosXrUAw9qO8jnpjVk+phWtlZyXOdjeIkxQ
	u3F6joRmz5iCITEzR30gKFf2su8xUnxWz6YflCMAJ0eSEt5VThI7kcgyrin8=
X-Gm-Gg: AYBFou3UQyIPkZn0HZdACU4YefDv2raR47/2WkfgSrp64yBsxTXYg9U436psDH3CnPc
	VgeG4L4Zp790yZTNL9o0jJ0kXvcvBGpwn1p0x8u5zxIJtv2B/Jup8Ovhs6EsCFswkycTyIXO2m7
	JvmeUfQPqWGpnXshWe3f766i8ZhpN4rA0meBWINwDWOL7GgicFGSiNAatWCPUjx1OER7ylodui+
	kqCGmiXUKS74jqVwYTpDseVD+5UjLRVRf+Tfjtc0JImYkU8d9CzFGu9AIsYwmkN0HeT7KRzJDDt
	/yWg2+VZoOuZX3HbNu3yaEhLRB/uV+Qe+D9yaKXmSPVzXpZPUCi2Vs1Y7cKlAMO2f9+PGUiBSMa
	CrCDhojQsG5mh+D3LrX9u0L8j3ayT9AxFzUAnzYVtcd2tYu+v6uyUyRiKYYvSrU1NT6SS8pHklq
	T/c7pDFGnQdVMidq8uAI7vqZnWq4xHx6UGBM9D8oKKWkqEnTtdSZLzgVzphWTf8/dVfghn/Z7Ft
	v0pyLIyLw==
X-Received: by 2002:a05:7301:fd07:b0:351:2616:6231 with SMTP id 5a478bee46e88-3515deebc0fmr4226679eec.40.1791426873297;
        Wed, 07 Oct 2026 19:34:33 -0700 (PDT)
Received: from localhost.localdomain ([23.148.204.240])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3515b03da93sm9853886eec.29.2026.10.07.19.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:34:32 -0700 (PDT)
From: Lei Chen <lei.chen@smartx.com>
To: kashyap.desai@broadcom.com,
	sumit.saxena@broadcom.com,
	shivasharan.srikanteshwara@broadcom.com,
	chandrakanth.patil@broadcom.com
Cc: megaraidlinux.pdl@broadcom.com,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lei.chen@smartx.com
Subject: [PATCH v2] scsi: megaraid_sas: Simplify debugfs setup
Date: Thu,  8 Oct 2026 10:34:24 +0800
Message-ID: <20261008023424.468757-1-lei.chen@smartx.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007141753.416672-1-lei.chen@smartx.com>
References: <20261007141753.416672-1-lei.chen@smartx.com>
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
Leave any successfully created directory for the existing teardown path
to remove, even if creating raidmap_dump fails.

The setup function is called only once per instance from probe, so create
the per-adapter directory without checking whether it already exists.

Signed-off-by: Lei Chen <lei.chen@smartx.com>
---
Changes in v2:
- Remove debugfs error checks and logging instead of adding
  IS_ERR_OR_NULL() checks, following review feedback.
- Leave directory cleanup to the existing teardown path.
- Remove the redundant directory existence check, since setup is called
  only once per instance from probe.
- Reframe the patch as a cleanup and drop the Fixes tag.

Link to v1:
https://lore.kernel.org/all/20261007141753.416672-1-lei.chen@smartx.com/

 drivers/scsi/megaraid/megaraid_sas_debugfs.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/scsi/megaraid/megaraid_sas_debugfs.c b/drivers/scsi/megaraid/megaraid_sas_debugfs.c
index 81698cd83f5a..2fdb4c6bd3d9 100644
--- a/drivers/scsi/megaraid/megaraid_sas_debugfs.c
+++ b/drivers/scsi/megaraid/megaraid_sas_debugfs.c
@@ -102,8 +102,6 @@ static const struct file_operations megasas_debugfs_raidmap_fops = {
 void megasas_init_debugfs(void)
 {
 	megasas_debugfs_root = debugfs_create_dir("megaraid_sas", NULL);
-	if (!megasas_debugfs_root)
-		pr_info("Cannot create debugfs root\n");
 }
 
 /*
@@ -129,27 +127,14 @@ megasas_setup_debugfs(struct megasas_instance *instance)
 	if (fusion) {
 		snprintf(name, sizeof(name),
 			 "scsi_host%d", instance->host->host_no);
-		if (!instance->debugfs_root) {
-			instance->debugfs_root =
-				debugfs_create_dir(name, megasas_debugfs_root);
-			if (!instance->debugfs_root) {
-				dev_err(&instance->pdev->dev,
-					"Cannot create per adapter debugfs directory\n");
-				return;
-			}
-		}
+		instance->debugfs_root =
+			debugfs_create_dir(name, megasas_debugfs_root);
 
 		snprintf(name, sizeof(name), "raidmap_dump");
 		instance->raidmap_dump =
 			debugfs_create_file(name, S_IRUGO,
 					    instance->debugfs_root, instance,
 					    &megasas_debugfs_raidmap_fops);
-		if (!instance->raidmap_dump) {
-			dev_err(&instance->pdev->dev,
-				"Cannot create raidmap debugfs file\n");
-			debugfs_remove(instance->debugfs_root);
-			return;
-		}
 	}
 
 }
-- 
2.43.0
