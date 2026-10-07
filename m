Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E1D4AA3FF
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791382708; cv=none; b=Hv08gS3O6qosz6bgP4bXP3YljOnro9wpRAKW8Ho0Q4k4HfJvxRA8OqeWIBvmEAOtg3cFQzPrx/zBc1ddfe9eANFPAh+w1W5n46HKtYpr+9SO695NLmX8PwuuoJtqkcUaG3CaZBZIie9WmwbTjBP6FzzfaUum2hyOYJKnD1Pp4ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791382708; c=relaxed/simple;
	bh=3jIritETAAQuv6kAdsHON0sENC6zIY9Enr0b/xxc6F0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dza+urTmVXYX3a/33tStSktVhipGb3lxTIdvnaeUz+5DY+Oh9xv1NUqArR4tBrlK15/aKcNJ02qADgFGNi7Maw9rAf36L/uUg4I+e8P8YT5Lj19Lsz9KYqbS60eND8KzUbnqOVVCTdU+E/cKAMrxIVtahHADuPT7WagAVPwuYKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com; spf=pass smtp.mailfrom=smartx.com; dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b=IbXNwKF9; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b="IbXNwKF9"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-824e6e6ed71so3051553a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20251104.gappssmtp.com; s=20251104; t=1791382699; x=1791987499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jp1XCm/vj9IDzSYwv15Kh1QdqJQdJPhxMV80ssGGTGU=;
        b=IbXNwKF9ylOBv81mY4efOGqk8aKxeWj4r7XaNJiw2YmtH8X8Eli8UizrhM7j71KUJT
         W3RIo0TI6/hQf2PxvKCPAWxzVsU69lYOO+cOdWYb74nMMxZ6URF6aRYeI7NTgV2vQznb
         DFRmhxJhoIR/zezNTrlUvrpns9Z/ZaJ9GW/UgvUWLJ8PAX90l0QWqp4KpOLALp7WfjYD
         Pp/nCcHO2WOdXS8aYYlYUn+kGci+uv9ysI/h4wPA1dEMjJQOrA+/n+ifThm6zLn0QtCh
         sYrbvWJH5qkOncOeCOEAqbnzLzWNU+9kR5swvf9jRt9Sddk0KceimCp6VLkK9KDgHDyP
         JMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791382699; x=1791987499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jp1XCm/vj9IDzSYwv15Kh1QdqJQdJPhxMV80ssGGTGU=;
        b=iwYa7oQvzXOJZ3lo5rjJZjFVBvFSu2WilJykIbhE9zoCyKV98iBJ+ni87uAjSzOLlz
         ZUFLbYoT7Ww7KMvvfTWoZQBmEZqjmi3NgX+vxwDQOBDbpR6LyarGMRqIUHilIoKVGvn7
         fO+APB2xr8FGneMS/znYKr7nmVgaNl8cu0LD9my/dTe95sKSQikkPmD8NLkFFxZXAIbi
         wk80IqLotQOWvgOjqMuLiFDcbDBr2H5K6e3nIuPXybJd5bRJglKMZl0iFCcRGy0KYz1W
         l/+RVD48fGxU4MTpNkiOWM7MXLvap9oA8mKb50pHLrA4WsbC1aC8p1dQ8l3RrHYt9mdl
         C26g==
X-Forwarded-Encrypted: i=1; AKwUvBwo4Mp+p/XVHisVvmY0OhgYE3fDagDKFFpc0AxC55l4awrBlpuDjswf7d3e7SckNBvG7KYdUaqJoWOdrEY=@vger.kernel.org
X-Gm-Message-State: AFuF++mnzVUWoy98pckAvr71rYRfsPQE4+ZDcTqPOhubNgAs9286OsMr
	o2oW8UdDyLe4ZV+uCwg5fMcWxYMaYDnmcm9DVBiK/nFHm2OCp/Jhj5eAYL6S3+JqTaWh1xwW0aZ
	IDcBwyE7dmtsgazge1p5KgZqOPkznPjFinvMUopcZCRUt4etLC7lH3OIPXDQ=
X-Gm-Gg: AYBFou0vCwejSxuY3P4XQE9Fq0R7FNGcbSTiUTlE5e2QWJtmJ3Sgy9KxAS/SO0CEpGZ
	AX+7eUmsXQC0VUPPiFCmiw46qtV/nN/4yanbVYPaiZuDDkfqwIsO04aixzxJPNiqpfWn1ud/n6V
	AXwyn5the0DQ0z+IMtuVwB9rGj74vk3OOHgN3bQQ3rf4+pyypOFyGS0gw8u95mJRDbL8behFuqy
	5lLES2BJAiC5VAfpJYdct4xpEKH2C2sUEJn1w8IrauUVHm3TmPIYc3TqGDT33O4vPK5Gc9u0FmV
	0Mh6tz1asOgK1XCRi3zm3YYmGktt3YIGVvwuC4a+O/zLzQvgt+8AxhjYEYOhupBRk8T5mm3L6vO
	APK4ZIqUrghviv7W+UF3PFOC/OPF/6TSpwPESCYqRQVBto/AYoIYZDwS/++Jn98H8AzJfMudUdp
	h1L0rJQhgVNrYkvncifsGfFX2LeccuI5sZPfjTzQvazYBGEO87naJiLQ+9hPmN4vC0IpYV5v6we
	PUaaYZiOFInZqHNtTXa
X-Received: by 2002:a05:6830:651a:b0:81c:5aac:798a with SMTP id 46e09a7af769-82acee8f351mr3093634a34.13.1791382699344;
        Wed, 07 Oct 2026 07:18:19 -0700 (PDT)
Received: from localhost.localdomain ([23.148.204.128])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-82ad9eeb5eesm2723670a34.2.2026.10.07.07.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 07:18:18 -0700 (PDT)
From: Lei Chen <lei.chen@smartx.com>
To: kashyap.desai@broadcom.com,
	sumit.saxena@broadcom.com,
	shivasharan.srikanteshwara@broadcom.com,
	chandrakanth.patil@broadcom.com
Cc: James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	megaraidlinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lei.chen@smartx.com
Subject: [PATCH] scsi: megaraid_sas: Fix debugfs setup error handling
Date: Wed,  7 Oct 2026 22:17:53 +0800
Message-ID: <20261007141753.416672-1-lei.chen@smartx.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

debugfs_create_dir() and debugfs_create_file() return error pointers on
failure, but megasas_setup_debugfs() only checks for NULL. As a result,
setup continues after directory creation fails, and a failure to create
raidmap_dump leaves the per-adapter directory behind.

Skip per-adapter setup if the driver debugfs root is unavailable, and
use IS_ERR_OR_NULL() to check directory and file creation results so
that the existing error paths also handle error pointers.

With the corrected error check, file creation failure removes the
per-adapter directory. Clear the stored directory pointer as well so
teardown does not attempt to remove the freed dentry again.

Fixes: ba53572bf02d ("scsi: megaraid_sas: Export RAID map through debugfs")
Signed-off-by: Lei Chen <lei.chen@smartx.com>
---
 drivers/scsi/megaraid/megaraid_sas_debugfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/megaraid/megaraid_sas_debugfs.c b/drivers/scsi/megaraid/megaraid_sas_debugfs.c
index 81698cd83f5a..556e01fc25e8 100644
--- a/drivers/scsi/megaraid/megaraid_sas_debugfs.c
+++ b/drivers/scsi/megaraid/megaraid_sas_debugfs.c
@@ -126,13 +126,16 @@ megasas_setup_debugfs(struct megasas_instance *instance)
 
 	fusion = instance->ctrl_context;
 
+	if (IS_ERR_OR_NULL(megasas_debugfs_root))
+		return;
+
 	if (fusion) {
 		snprintf(name, sizeof(name),
 			 "scsi_host%d", instance->host->host_no);
 		if (!instance->debugfs_root) {
 			instance->debugfs_root =
 				debugfs_create_dir(name, megasas_debugfs_root);
-			if (!instance->debugfs_root) {
+			if (IS_ERR_OR_NULL(instance->debugfs_root)) {
 				dev_err(&instance->pdev->dev,
 					"Cannot create per adapter debugfs directory\n");
 				return;
@@ -144,10 +147,11 @@ megasas_setup_debugfs(struct megasas_instance *instance)
 			debugfs_create_file(name, S_IRUGO,
 					    instance->debugfs_root, instance,
 					    &megasas_debugfs_raidmap_fops);
-		if (!instance->raidmap_dump) {
+		if (IS_ERR_OR_NULL(instance->raidmap_dump)) {
 			dev_err(&instance->pdev->dev,
 				"Cannot create raidmap debugfs file\n");
 			debugfs_remove(instance->debugfs_root);
+			instance->debugfs_root = NULL;
 			return;
 		}
 	}
-- 
2.43.0

