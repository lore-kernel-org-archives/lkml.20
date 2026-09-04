Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE8048F822
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519626; cv=none; b=KKfCRka5WS6Y5Qd/tgtkPZ0vg74TNY6rYmuWGmMKzCSje/IcuLW849yXdurWSDZomhjfowMIIOaciTbnl3d6nNHtpR4cMbEojhSwHWKMWWhQKxScU+g0VeK53d9Oeaqgj1ABqwP/YP5KHtRep4nO0cgEgpJOEblg1s2kGTrMo/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519626; c=relaxed/simple;
	bh=ec3f2c/2ovVBbSwOHdK1oiWlSRb218cenPSOQvS+b1E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LKB7mCPqaW4bi9tpy2JZlYRMIVL1Xq486WfsG/e/KRwFL1wOMk/0gwCna5bKPlDgbmnI1f1W4cL/3OicAJ957kYUot23LAChlrNpNOHQptUYgl6+CIqCpy/EJhO/TXd3ela8nt2Rr1IcEX+rjNQ3hBgJnlPdGMGLSLZ8XqzCpb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dkBfu3Cs; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dkBfu3Cs"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so2067945a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788519623; x=1789124423; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zo7VwFgsbtJ8UJqRREQfIoxVumyrpqsEREUtKGw4Baw=;
        b=dkBfu3CsCjYICrP+RgbLcA7k/mX3cJnwLzQ8qYboK/5hMbEu0b4lleC+DbsAWMkw6h
         UIqWJBXqIg9NLKtxcQQaYBIPQQlMSy628uQax4DnhcifP/xWBK1QWd2ZJmq+xjWWBpfs
         yrKXsOMfJ7AdbRtw19uhTkEGmkwBUMcfBtPUfO89zjbylv2H6yttgUqoDcllXuYi61Zr
         MktX407CUW08k0w+r3MtHgjSOoDqMSBkDAiHfR4cqFeT42qM/3Vb2FyU9PT/juveBf/0
         uMgdL05V3ObtFyqsbk3oFYPw+7Pgb6OJD/BKZDgrEDWsG8K1PGSkiKkjHYA2L2EJvt+7
         o1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519623; x=1789124423;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zo7VwFgsbtJ8UJqRREQfIoxVumyrpqsEREUtKGw4Baw=;
        b=D0Z1N7Lai9Y1moS+sHeBtunvpFzxrLgVrIXPOS8zAaoQXIIu1Th70MMUBqm/2bmGZ+
         m4b4nC9LU1QURvMTxOkiqofc+5tmBB9FjWZZOIGgU9sdWA4ymOzpL8rBdcxVxdzT1kxy
         hZKU4HquNiJUfP22ni1kBU3NVL0A3YBb/XL3lT5c4+bKxHwqJF/2JekkG2lm9Xf1QMBT
         H5xrB/2lFaS5UolzlWkfgpdl+QZY8S6J7gtthb1UoeNLw20bqTT9uOVVj38Mbcc2RtZD
         99wUHpIUEY9VXXmftagCCkRsVqXObfsXjyva7D4p0zPUlMSVCHfvMnzeSlV65zAUmN0p
         G6LA==
X-Forwarded-Encrypted: i=1; AKwUvByN3LNMZRIYOrg5sQuOLoVeCqqrPM72vngbxwlFZprv/hBpfEJiUUNPt/jll5ByB1Dd25vUCm8gw13QinI=@vger.kernel.org
X-Gm-Message-State: AFuF++nYf8HSY5KYbVfnd0Ra5MnjLsMb22Aq0PwzINZwfM/AdDizVRsV
	BfHa3aUeFVC/eTezxKHHUWJqtz7lHEAa3SXixz9nNjTaI6ByEtW6XhjIvV3whquplVDZ1vTzBM/
	gZPkaa2Pmcww7IVJ8YVMc7A==
X-Received: from pjye1.prod.google.com ([2002:a17:90a:ee01:b0:398:d6ef:834])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3943:b0:398:d8eb:cb2a with SMTP id 98e67ed59e1d1-39b26273e31mr9007463a91.23.1788519623111;
 Fri, 04 Sep 2026 04:00:23 -0700 (PDT)
Date: Fri,  4 Sep 2026 19:00:17 +0800
In-Reply-To: <20260904110017.3444852-1-stanleyjhu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904110017.3444852-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904110017.3444852-3-stanleyjhu@google.com>
Subject: [PATCH 2/2] scsi: ufs: rpmb: Register and unregister ufs_rpmb_bus_type
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, linux-scsi@vger.kernel.org
Cc: Brian Kao <powenkao@google.com>, Bean Huo <beanhuo@micron.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	Peter Wang <peter.wang@mediatek.com>, linux-kernel@vger.kernel.org, 
	Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

The UFS RPMB driver assigns its devices to a custom ufs_rpmb_bus_type,
but never registers this bus with the driver core. As a result,
device_register() fails during probe because the driver core rejects
devices attached to unregistered buses with -EINVAL:
  "bus_add_device: cannot add device 'ufs_rpmb0' to unregistered bus
   'ufs_rpmb'"
  "ufshcd: Failed to register UFS RPMB device 0"

Resolve this by integrating the bus into the UFS core lifecycle:

1. Bus registration and lifecycle:
   Register ufs_rpmb_bus_type during ufshcd_core_init() before any
   device probe occurs, and unregister it during ufshcd_core_exit().
   Annotate the registration helper with __init to allow init memory
   reclamation.

2. Modular reachability:
   Guard bus helper prototypes with IS_REACHABLE(CONFIG_RPMB) and provide
   inline stubs, preventing link failures when UFS is built-in and RPMB
   is compiled as a module.

Fixes: b06b8c421485 ("scsi: ufs: core: Add OP-TEE based RPMB driver for UFS devices")
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufs-rpmb.c    | 10 ++++++++++
 drivers/ufs/core/ufshcd-priv.h | 11 ++++++++++-
 drivers/ufs/core/ufshcd.c      | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufs-rpmb.c b/drivers/ufs/core/ufs-rpmb.c
index 4f41d0b64d20..cf8982824b14 100644
--- a/drivers/ufs/core/ufs-rpmb.c
+++ b/drivers/ufs/core/ufs-rpmb.c
@@ -29,6 +29,16 @@ static const struct bus_type ufs_rpmb_bus_type = {
 	.name = "ufs_rpmb",
 };
 
+int __init ufs_rpmb_bus_register(void)
+{
+	return bus_register(&ufs_rpmb_bus_type);
+}
+
+void ufs_rpmb_bus_unregister(void)
+{
+	bus_unregister(&ufs_rpmb_bus_type);
+}
+
 /* UFS RPMB device structure */
 struct ufs_rpmb_dev {
 	u8 region_id;
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index e55c2a02c1f5..415f9230b164 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -493,10 +493,19 @@ static inline u32 ufshcd_mcq_get_sq_head_slot(struct ufs_hw_queue *q)
 	return val / sizeof(struct utp_transfer_req_desc);
 }
 
-#if IS_ENABLED(CONFIG_RPMB)
+#if IS_REACHABLE(CONFIG_RPMB)
+int __init ufs_rpmb_bus_register(void);
+void ufs_rpmb_bus_unregister(void);
 int ufs_rpmb_probe(struct ufs_hba *hba);
 void ufs_rpmb_remove(struct ufs_hba *hba);
 #else
+static inline int ufs_rpmb_bus_register(void)
+{
+	return 0;
+}
+static inline void ufs_rpmb_bus_unregister(void)
+{
+}
 static inline int ufs_rpmb_probe(struct ufs_hba *hba)
 {
 	return 0;
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index a25b6a0cb5c6..4470e3d65c5c 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -11584,16 +11584,28 @@ static int __init ufshcd_core_init(void)
 
 	ufs_debugfs_init();
 
+	ret = ufs_rpmb_bus_register();
+	if (ret)
+		goto err_debugfs;
+
 	ret = scsi_register_driver(&ufs_dev_wlun_template);
 	if (ret)
-		ufs_debugfs_exit();
+		goto err_rpmb_bus;
+
+	return 0;
+
+err_rpmb_bus:
+	ufs_rpmb_bus_unregister();
+err_debugfs:
+	ufs_debugfs_exit();
 	return ret;
 }
 
 static void __exit ufshcd_core_exit(void)
 {
-	ufs_debugfs_exit();
 	scsi_unregister_driver(&ufs_dev_wlun_template);
+	ufs_rpmb_bus_unregister();
+	ufs_debugfs_exit();
 }
 
 module_init(ufshcd_core_init);
-- 
2.55.0.979.g7e5102b832-goog

