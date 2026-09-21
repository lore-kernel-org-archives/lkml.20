Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F419D1F5834
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789956620; cv=none; b=YB33eVS9gtPyzKLSHTKtloDt2NCcEPwy+M3gY+wxcaYDDmvQJ7wbbxfhid06Ms+cH5ppVaZ16vLwoZKOa5LE1zGLipMyr5gmoDonMY3L7BI8mYavnRnO31eT7DR4wIJrUtcCYQ8bXbfgceT0LC7Mqh+IEqcicMXSPhV14YkgKJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789956620; c=relaxed/simple;
	bh=/q9jN18v9kVg0ewuIvSTRizst+QlqZDfb0J3vJ0la28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ua9ABtb6ECN5JUbO1gHo9SPgqzr+Uxbo/BG+eo2j4ZxqZ4Gw5lzx8M6Ham50NDSO6IaHtJqn9fKBYd7uWQimDc8qx4iBG2aBXakH+D3f0pcf3I3H+zort4ibZOOVj/wMr3rFhtl+UvlMn6OEynrD+ApijtoLyNnEjNg3rJo5bjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WH/f0Dfw; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WH/f0Dfw"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b35611so1548417b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789956618; x=1790561418; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/dMNk0vzsP7lGVeV0klVmoKB3p9mxiH+9npxTdGlvQ=;
        b=WH/f0DfwBcU6+gtSvtMxETAo3e5WuK1rjhDUT7tR4MulKzBSHI3bFv4V4vmozcsR67
         71Yw+voLfWU2XmtK2G/jyTp9R83/AwKWu3Z9OW5lOxkpGaRA5xp+wGgbo9SHO05pufrK
         Wgo6QvZNuMf7+HuEyCM4Z+wQavzwl6H+fngGBOdZ2pB3fds1TOfzE2N486xQgcq7oauY
         BzoJjBPB5v98W5A2014uDBHtcADTWa0iBrOvQjwCVU2TI15anzYNU+nB/zY6qu0WRiFx
         FVGK8NXL7pwZ4j/ChVAC9RD9ca9Q2xG5oHe2HxpwXgpFicjDwRIDLCbRFxIai7Jw3w14
         g6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789956618; x=1790561418;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/dMNk0vzsP7lGVeV0klVmoKB3p9mxiH+9npxTdGlvQ=;
        b=jOVLkRmGv9bVin/+WSq2wHVGjEEguszcNzCfEKZc3MoHFV8+mjjO8jpKIwJ6aXE9SR
         LBoTRMewTwkjCHsk6FAKpf5wNttQ/7YkFoMKl6HYWngxcFtFu0bL3F7Xnq5dYHuaNSiL
         9bVBx74rBcnkSgWhjZOn59zL891MOw8thxKxz4aKn/E4naF+sCn/iQFINQphlDeCqeRR
         Er66gYlfgSn+QV7ib+tXFcLGrlxDLP5nT9AOkfMx7pzBMrs0NrRfkA2+ZGjVnjFA5eTD
         qdr+kKt/bG4Ojj4deV9oChCmFAeQ9TyGV/25HqM5Y/8nFR/BgUjjymzZ5e0uzlXgQdtj
         oPZg==
X-Forwarded-Encrypted: i=1; AKwUvBxWQMA1ecD/qVKDGr24eM1sDSbzFOmXxqoCzxYRQUKbPsxNps5FNm7G8mEBt2qatZNWqc8XGYQxzXpoX3I=@vger.kernel.org
X-Gm-Message-State: AFuF++lwbrmDZJl3opSS/YSqGEoMCUiXbXS+QTlIXF9MldoTYHodJbl6
	4kHdyEmFLkUrknu23Snxf8P1JPIvNaj/7y4LUCBHZVkNo6QMWcv5OvzpsqtVDhJc
X-Gm-Gg: AYBFou1/XaAMIto44R28dxllvZCSxm2aYnJAgKLVAT7ZPYIruV7nkwKesPX6wuznJyt
	vkkI3a9GQDPt/FCyz5edyiSLg/L7GePtoqN9R4vhn96lk3HEAmqyuVXwJngmzRNOi8fCV6OVjZE
	R383vFcqAERDG/XUrPxrl5pgLTANS+S7ourMTQN4reNHMDrWSUZysGrNbL2+QlB73xQ+kNuC+tM
	yj+3IfiKT4wuKjlr9yvSIVhPsDyYQqXrECnIXDKOhlQnrVPuzuccTi9OTd/h36E1lYliMPMzDI9
	KxaGEKNcC+istvyhz3MUE2pRVSQt1+P2III94ItFdenk4civv9AMvC8NqqKOh6nHKf6plvLBXqP
	MbKeYFD1JJJ+ziqDdNg7zeOGmW6dn6BQAlUqTJOQZzAX8oXfa/qP5327aVWGvI7F0gvUyXh8erm
	BGH3ugQEk6MPq3yUOzR60Yp+NXE6ezYFcj4ZjsOD/bW36JEV9PfE47GJ0v26T0EM6EdSIqMdkPq
	pcMQZWS4k7wub5zMfSpBy+e2UbSw+9cRKZ32Dw6
X-Received: by 2002:a05:6a21:1343:b0:3dd:85a9:55a2 with SMTP id adf61e73a8af0-3dd8c5be2damr15381203637.36.1789956618331;
        Sun, 20 Sep 2026 19:10:18 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3844:3355:5928:66ce])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331ad266sm14562856eec.23.2026.09.20.19.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:10:17 -0700 (PDT)
Date: Sun, 20 Sep 2026 19:10:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] EDAC/amd64: Stop allocating ECC settings separately
Message-ID: <arCC5ukNvN11l1aj@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There is no reason to allocate and manage ECC settings separately when
struct ecc_settings can be embedded directly into the driver-private
struct amd64_pvt.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Resending this standalone cleanup that was originally posted back in
2015 as part of an async-probe RFC series [1] and got lost in the
broader driver model discussion. Since amd64_edac has long moved away
from pci_register_driver() to probing nodes directly in
amd64_edac_init(), patches 2 and 3 from that series are obsolete, and
this patch has been rebased onto the current code.

[1] https://lore.kernel.org/all/1426726150-983-2-git-send-email-dmitry.torokhov@gmail.com/


 drivers/edac/amd64_edac.c | 40 ++++++---------------------------------
 drivers/edac/amd64_edac.h | 27 ++++++++++++++------------
 2 files changed, 21 insertions(+), 46 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 475235c402e8..6931b7e61652 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -30,9 +30,6 @@ static inline u32 get_umc_reg(struct amd64_pvt *pvt, u32 reg)
 	return 0;
 }
 
-/* Per-node stuff */
-static struct ecc_settings **ecc_stngs;
-
 /* Device for the PCI component */
 static struct device *pci_ctl_dev;
 
@@ -3999,19 +3996,12 @@ static int probe_one_instance(unsigned int nid)
 {
 	struct pci_dev *F3 = node_to_amd_nb(nid)->misc;
 	struct amd64_pvt *pvt = NULL;
-	struct ecc_settings *s;
 	int ret;
 
 	ret = -ENOMEM;
-	s = kzalloc_obj(struct ecc_settings);
-	if (!s)
-		goto err_out;
-
-	ecc_stngs[nid] = s;
-
 	pvt = kzalloc_obj(struct amd64_pvt);
 	if (!pvt)
-		goto err_settings;
+		goto err_out;
 
 	pvt->mc_node_id	= nid;
 	pvt->F3 = F3;
@@ -4042,7 +4032,7 @@ static int probe_one_instance(unsigned int nid)
 		} else
 			amd64_warn("Forcing ECC on!\n");
 
-		if (!enable_ecc_error_reporting(s, nid, F3))
+		if (!enable_ecc_error_reporting(&pvt->ecc, nid, F3))
 			goto err_enable;
 	}
 
@@ -4051,7 +4041,7 @@ static int probe_one_instance(unsigned int nid)
 		amd64_err("Error probing instance: %d\n", nid);
 
 		if (boot_cpu_data.x86 < 0x17)
-			restore_ecc_error_reporting(s, nid, F3);
+			restore_ecc_error_reporting(&pvt->ecc, nid, F3);
 
 		goto err_enable;
 	}
@@ -4067,10 +4057,6 @@ static int probe_one_instance(unsigned int nid)
 	hw_info_put(pvt);
 	kfree(pvt);
 
-err_settings:
-	kfree(s);
-	ecc_stngs[nid] = NULL;
-
 err_out:
 	return ret;
 }
@@ -4078,7 +4064,6 @@ static int probe_one_instance(unsigned int nid)
 static void remove_one_instance(unsigned int nid)
 {
 	struct pci_dev *F3 = node_to_amd_nb(nid)->misc;
-	struct ecc_settings *s = ecc_stngs[nid];
 	struct mem_ctl_info *mci;
 	struct amd64_pvt *pvt;
 
@@ -4089,10 +4074,7 @@ static void remove_one_instance(unsigned int nid)
 
 	pvt = mci->pvt_info;
 
-	restore_ecc_error_reporting(s, nid, F3);
-
-	kfree(ecc_stngs[nid]);
-	ecc_stngs[nid] = NULL;
+	restore_ecc_error_reporting(&pvt->ecc, nid, F3);
 
 	/* Free the EDAC CORE resources */
 	mci->pvt_info = NULL;
@@ -4149,13 +4131,10 @@ static int __init amd64_edac_init(void)
 	opstate_init();
 
 	err = -ENOMEM;
-	ecc_stngs = kzalloc_objs(ecc_stngs[0], amd_nb_num());
-	if (!ecc_stngs)
-		goto err_free;
 
 	msrs = msrs_alloc();
 	if (!msrs)
-		goto err_free;
+		goto err_ret;
 
 	for (i = 0; i < amd_nb_num(); i++) {
 		err = probe_one_instance(i);
@@ -4195,10 +4174,7 @@ static int __init amd64_edac_init(void)
 	msrs_free(msrs);
 	msrs = NULL;
 
-err_free:
-	kfree(ecc_stngs);
-	ecc_stngs = NULL;
-
+err_ret:
 	return err;
 }
 
@@ -4218,11 +4194,7 @@ static void __exit amd64_edac_exit(void)
 	for (i = 0; i < amd_nb_num(); i++)
 		remove_one_instance(i);
 
-	kfree(ecc_stngs);
-	ecc_stngs = NULL;
-
 	pci_ctl_dev = NULL;
-
 	msrs_free(msrs);
 	msrs = NULL;
 }
diff --git a/drivers/edac/amd64_edac.h b/drivers/edac/amd64_edac.h
index 1757c1b99fc8..a93e0214143c 100644
--- a/drivers/edac/amd64_edac.h
+++ b/drivers/edac/amd64_edac.h
@@ -322,6 +322,19 @@ struct amd64_family_flags {
 	      __reserved	: 63;
 };
 
+/*
+ * per-node ECC settings descriptor
+ */
+struct ecc_settings {
+	u32 old_nbctl;
+	bool nbctl_valid;
+
+	struct flags {
+		unsigned long nb_mce_enable:1;
+		unsigned long nb_ecc_prev:1;
+	} flags;
+};
+
 struct amd64_pvt {
 	struct low_ops *ops;
 
@@ -372,6 +385,8 @@ struct amd64_pvt {
 	/* place to store error injection parameters prior to issue */
 	struct error_injection injection;
 
+	struct ecc_settings ecc;
+
 	/*
 	 * cache the dram_type
 	 *
@@ -441,18 +456,6 @@ static inline u8 dct_sel_interleave_addr(struct amd64_pvt *pvt)
 
 	return	((pvt)->dct_sel_lo >> 6) & 0x3;
 }
-/*
- * per-node ECC settings descriptor
- */
-struct ecc_settings {
-	u32 old_nbctl;
-	bool nbctl_valid;
-
-	struct flags {
-		unsigned long nb_mce_enable:1;
-		unsigned long nb_ecc_prev:1;
-	} flags;
-};
 
 /*
  * Each of the PCI Device IDs types have their own set of hardware accessor
-- 
2.55.0.1082.g2b9226bbc0-goog


-- 
Dmitry
