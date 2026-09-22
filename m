Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6205833C518
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121611; cv=none; b=sNaeFX8Bgk5cpYX4TG5cweTXXqOlrDCcIBdl2ykeScuQAM8qweE8YeuehNpgfSm5lXbJjIfLGzJRT5IMlhe7DPYcpqmJg2gUM4T44nsh/UByaw39GEKtSeqJzK6/MniM/Thknkp/ASNyBMQYAGHFk/HnfaQ0J2eSvzIZtUULnhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121611; c=relaxed/simple;
	bh=GxIvcCVhCt308n4YpGYSb0pyx5gI+weTYg8N63j1whI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUhKgCsv/uggc7gRWgWXwiFsmJDtRZb5s0YD4Z7kGayrZGDWjrASXR11xzqqyyyIz9VdTG/+lsm7QH+ueVqnRlEKZTrw/tz6VzsQ8AtzWgMhFbvV+XQZUBz+FxFYrziJCWYFgTbSFJz/tidmtpLqLoPtOkowK83xxhXac7PLJ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnTRsuTk; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnTRsuTk"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43daa8f4so5243297b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790121609; x=1790726409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4php9BjbPBDqSY8Hi74vfy/uoxpmggiZhREEs3JVmig=;
        b=jnTRsuTkkMtOS7qH+ZgCioK3dBGgfTOgreDuHlZgmXhrHISj2aZ1Clx7awoWwa6BLf
         7vrKOdoUrlgwrPxSVkwqjL3wKkzar/X+t1CZe0YDYSQke+pS5tMkgsdgPL7jFF1+zWqa
         piiUGPeCCTZ38M71BxVdRUhmbP8MyzkBjSOsFUpCBwXNmxMrMBX6ZxOSIcywGBw6eJmd
         LcNZTn8PSx1EubLpdyNZtc33gcDbdmxGHpf7ByRbvt6pNUWpjlWoLeFScjO/XpqcpCZ+
         2XTLTP23mWV/b7koje+ank6+uqwP749aq2v8QXgbcmgpJsnzl7+xI6NWkRXjYajqK6kz
         Okew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121609; x=1790726409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4php9BjbPBDqSY8Hi74vfy/uoxpmggiZhREEs3JVmig=;
        b=ggVflgzspDWO2EePWR6HF0YJXDXJV1zTOJubSXiCRrL212koDX6ZL4JzC0D71+B62V
         loC244JyXAOPGX6NnxXCWyR9zB2E26i6QozAvHSHGdMnziffisrNoDKgDuW3KZdavDnK
         AqnfvrYBXjx5+Ynhk9veobY95ZU35Aui91+ZvGBtSumuEZWqMO812CTQFPSawVldRb+a
         iqHIuiom/hsOTfZ7SZhlNDEQitplkHDWONIdQk9Qo6/2VepfH0hn7TDFH6RdU0uhG4C2
         zMWjyN6ziBpruCHTZr+uvDwQ7+0RrdWSQz+VCXI/26Pt0e3m9EoYxbQNmQueJnvv4yMa
         s2ow==
X-Forwarded-Encrypted: i=1; AKwUvBxi2kx3GcrX2ks8PlQjB/a0BbNAVPSedWdaEJ/WWmNj/LrIhGve0onJjFlD3+eIlrySmzS3sjOA2ne2sRk=@vger.kernel.org
X-Gm-Message-State: AFuF++nwtUrqmQ6/P7C3Ccp0GKbnuvNroh7mWCyMkG4Ot81DC6FFvvP7
	34T5WGRv3QC68dOCDVWKslpSA23rA4tOTvXqzBMeDlH/1rFOqDVb9bo=
X-Gm-Gg: AYBFou18g02pSn59tbOyyHzxRS74vqaA60EDbxZwEEMSVqn9weK0EcuFdg3ljz2Te5M
	u6KGSvsPcqj45fBeCmEaEfSBitdHswsLghaU9yTavoMoAiyMqs8sZksusNoBUKinydOdPPTPCVU
	YRl2rUYELTjAbRWplNTzy3ucyzQ08zIGFgzJNmJg0zPWs0uUo7LWJonrXcYA0kIYMz9/+cxkXZA
	dnw3ad9NLPLhF2p0Y9nZu8wt7/oTizlMbhW/ym3/k0ZtXyICuYCM7e7jDHnJDoOYzHhZq5WtUiP
	Ss1jmxEf5FY7NmnmrLVTntrieG/W2Vbh8lnhDIEWPb4arvHOHED/E1cutzR2uM+B+DX3srOokkJ
	h5IJAZW6ojfy36JJ3oApEpEuyFVKqM8X0Hg2Pv8nMwkViNs9ior+2fqZovZnG4A0RjzOoVJ2+pD
	xyU7XEl/DhNK9K7dYLJ1eUEbxuWoKlOSMC/CcHZLSROpEo66ezU1IYaEjy
X-Received: by 2002:a05:690c:60c6:b0:89b:ce1a:c0c with SMTP id 00721157ae682-8a45b5904e9mr5603717b3.49.1790121609304;
        Tue, 22 Sep 2026 17:00:09 -0700 (PDT)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::3c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a4662b8293sm3850407b3.29.2026.09.22.17.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:00:09 -0700 (PDT)
From: Arav Verma <svav2021@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arav Verma <svav2021@gmail.com>
Subject: [PATCH v4 2/2] platform/x86: intel: wmi: Remove redundant callbacks
Date: Tue, 22 Sep 2026 18:59:54 -0500
Message-ID: <20260923000002.1799245-2-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923000002.1799245-1-svav2021@gmail.com>
References: <20260923000002.1799245-1-svav2021@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed redundant .probe and .remove callbacks from
wmi_driver struct, as they were print-only and unnecessary

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
v4: Added missing Signed-off-by tag.
v3: Resending as v3 due to git send-email formatting error, no code changes have been made.

 drivers/platform/x86/intel/wmi/sbl-fw-update.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/platform/x86/intel/wmi/sbl-fw-update.c b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
index cfef71f4f3284..7e07cfab227c8 100644
--- a/drivers/platform/x86/intel/wmi/sbl-fw-update.c
+++ b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
@@ -93,18 +93,6 @@ static struct attribute *firmware_update_attrs[] = {
 };
 ATTRIBUTE_GROUPS(firmware_update);
 
-static int intel_wmi_sbl_fw_update_probe(struct wmi_device *wdev,
-					 const void *context)
-{
-	dev_info(&wdev->dev, "Slim Bootloader signaling driver attached\n");
-	return 0;
-}
-
-static void intel_wmi_sbl_fw_update_remove(struct wmi_device *wdev)
-{
-	dev_info(&wdev->dev, "Slim Bootloader signaling driver removed\n");
-}
-
 static const struct wmi_device_id intel_wmi_sbl_id_table[] = {
 	{ .guid_string = INTEL_WMI_SBL_GUID },
 	{}
@@ -116,8 +104,6 @@ static struct wmi_driver intel_wmi_sbl_fw_update_driver = {
 		.name = "intel-wmi-sbl-fw-update",
 		.dev_groups = firmware_update_groups,
 	},
-	.probe = intel_wmi_sbl_fw_update_probe,
-	.remove = intel_wmi_sbl_fw_update_remove,
 	.id_table = intel_wmi_sbl_id_table,
 	.no_singleton = true,
 };
-- 
2.47.3

