Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792892095;
	b=vIXRJoV2UMDzLuBYwS2/KJaf3mOOELsZSUh0dpTTKnkG+lA1ikO7O6AkZBTM5dff5tJw
	 l+o+qliSOhTbSecx9EDIFn4mZM4GAVB4k/BkmkC5uaFOdkRU2bMuPRO5a1Y1W0q+UKbds
	 /pVyDvTfbQzHDBwlTcWIW2/E4GV70Qhe5ntNW65jLpDxCsrpH9LY07V+yHNAX2huoEMq6
	 PI6hBa0gTf9lYhDoKN9g5hhn4XhKk4vBPSSg4pcJTTyVvm/BlJ6cHlabdv/TvhbX8G7qy
	 KEdca1X4F6tU+Va90S2zbuaezztdOP/cSzlZ3Z63IVOnMBIoB33whn9thW03XeMTnqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792892095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=d8zTOCpdfLCFup0LtTUT8GHUquWtW5OhPtS3dNMqHJw=;
	b=NPOmh6JerD1O+3SY6ImXvbTZnekezcc9LDehFY89dEUUIxXWJYxTLffvVbcHd6iFjLKu
	 uAZlJFGnZTi3exFnrtLeC7q1SEss6A5P92l+zXg/ixONMDpb9dyiYoLM2RfGg+uLmaGMH
	 MP7uLWwTdOryERiiDZ/MZ+GKb/b1pSxMv9J/WZ590wgeQMuPzfqQPiNo0izmmDT+i443f
	 wUK6irjCXa3GN/aIh40d8YI9w+HlBln5YBa41BmZcrdgtGu6Bx6dLR8zqGFQyIWP7edl4
	 zDVvtW5SCiToFcwdozmsT6shSSEDJw1uK55bT7z+4rtibuoZ3yEHqAR/RzIFSbehCcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=INVTu4vU;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7DA606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF7DA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=INVTu4vU
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so1666350a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792892094; x=1793496894; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8zTOCpdfLCFup0LtTUT8GHUquWtW5OhPtS3dNMqHJw=;
        b=INVTu4vUwpEyC7ZtxvJsKVU2+nOgKLbSmZQV5fHfLi1+JJ898E1aLK08xff6wcILew
         LSG5Nk78eLrG9Y1U1tpmffPRoP1gn9jCLfbXSA0sMUN/r6Yzm1+pZyvghn3Vj2IIkzIY
         JgT5Y1kG1vcwJgXPaKd5+3cYPLiIBWsZ6fNFtHZtbMiWuKlQiVB2o2LXJ1HNlj0BmVsm
         ejI6O0J2ETi9brA+6Bf3P7RCRBJRcPhdzwkQ295uNPiJBrGd0Hzu39yZ2v3FNO/Mhc4O
         MVnCVqHltB160meoyBF8A0z8uTl8lnlx4mL/523peD9igjcf18omkXV2CoNFnFXIr8qg
         sr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792892094; x=1793496894;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8zTOCpdfLCFup0LtTUT8GHUquWtW5OhPtS3dNMqHJw=;
        b=FwkHCwPUm0vqbCnLzhAviF/EBWKP9E+qy4x11LUPT0Kqe5MGQ1O/D8ZheXSsbr9c6p
         mXd5Fsn0Irk9yCwI9fpLSM7tEIjIU9JEp9ngp4ltg8W7exGB+Bqlv7Xt3jvB+QaCcTjF
         RFSe/92grLAutL//kctSZP8F/rUWRmagnjNXYodmfuhsZoPzpzlX0lnK7u1rKLwolqRw
         JqsUfleOAAIWmleQGeSQr86wQjn/3xgfiOFBlcu5JQlklEtW4GliTlR5FbF3BSQ50LxC
         8fRIhC3wIzgmbRiYwSHQtCgbeZAqbCDRebzzhMkWkMczcDnhIVNSW1x1QHQq0LDZOOVL
         Sr1w==
X-Forwarded-Encrypted: i=1; AKwUvBzLQ+Ve5f/pCmM6kBg0F/a+uoI+ecRDpsxNMEGzLM7e4uEyBAUPamn9k2qJnivf2TwEsXbxcRIIeU5+w6k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUyZZfQw8g2BRJm6UV7LEhuKRmY+tIPJ9UpXqzbJ6kwMAlx9Cm
	sGCpqzZS4A5c4Hgjo3SmePloT+ea6sWBrPfNdRVKn0Cb1R4QNSOJ/Ok8vZ0sPnIP5EioiyBcj/X
	MFCi2Ging4c20wt/6qQRS4g==
X-Received: from pjblj15.prod.google.com ([2002:a17:90b:344f:b0:3a4:fb9f:4a65])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4ac9:b0:3a7:db88:3491 with SMTP id 98e67ed59e1d1-3adeabe4324mr2618939a91.33.1792892093846;
 Sat, 24 Oct 2026 18:34:53 -0700 (PDT)
Date: Sun, 25 Oct 2026 09:34:44 +0800
In-Reply-To: <20261025013446.345974-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261025013446.345974-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261025013446.345974-4-stanleyjhu@google.com>
Subject: [PATCH 3/5] scsi: ufs: sysfs: Propagate runtime PM resume errors
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	Peter Wang <peter.wang@mediatek.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stanley Jhu <stanleyjhu@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

All 14 ufshcd_rpm_get_sync() callers in ufs-sysfs.c ignore its return
value:

1. A user-space sysfs read or write runs when W-LUN runtime resume
   fails, when power.runtime_error is set from a failed runtime
   suspend, or when W-LUN runtime PM is disabled while not active.
2. ufshcd_rpm_get_sync() returns a negative errno without waking the
   device or host controller.
3. ufshcd_read_hci_reg() reads an HCI MMIO register on an unresumed
   controller, and the remaining handlers issue query UPIUs over a
   suspended or broken link.

Switch all 14 sysfs callers to ufshcd_rpm_resume_and_get() and return
the error after releasing any held buffer and hba->host_sem.

Fixes: aef80fd1da32 ("scsi: ufs: sysfs: Resume the proper SCSI device")
Fixes: b9d104465a6c ("scsi: ufs: Prepare to add HCI capabilities sysfs")
Fixes: 600edc6620a4 ("scsi: ufs: sysfs: Make max_number_of_rtt read-write")
Fixes: 6c4148ce7cc1 ("scsi: ufs: wb: Add explicit flush sysfs attribute")
Fixes: 500d4b742e0c ("scsi: ufs: core: Add WB buffer resize support")
Fixes: ae7795a8c258 ("scsi: ufs: core: Add HID support")
Fixes: 1fd2e77b8897 ("scsi: ufs: core: Add device level exception support")
Cc: stable@vger.kernel.org # needs "scsi: ufs: core: Introduce ufshcd_rpm_resume_and_get() helper"
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufs-sysfs.c | 67 ++++++++++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 14 deletions(-)

diff --git a/drivers/ufs/core/ufs-sysfs.c b/drivers/ufs/core/ufs-sysfs.c
index cf49ad0258e1..19b62cf52410 100644
--- a/drivers/ufs/core/ufs-sysfs.c
+++ b/drivers/ufs/core/ufs-sysfs.c
@@ -250,13 +250,19 @@ EXPORT_SYMBOL_GPL(ufshcd_us_to_ahit);
 
 static int ufshcd_read_hci_reg(struct ufs_hba *hba, u32 *val, unsigned int reg)
 {
+	int ret;
+
 	down(&hba->host_sem);
 	if (!ufshcd_is_user_access_allowed(hba)) {
 		up(&hba->host_sem);
 		return -EBUSY;
 	}
 
-	ufshcd_rpm_get_sync(hba);
+	ret = ufshcd_rpm_resume_and_get(hba);
+	if (ret) {
+		up(&hba->host_sem);
+		return ret;
+	}
 	ufshcd_hold(hba);
 	*val = ufshcd_readl(hba, reg);
 	ufshcd_release(hba);
@@ -350,7 +356,9 @@ static ssize_t wb_on_store(struct device *dev, struct device_attribute *attr,
 		goto out;
 	}
 
-	ufshcd_rpm_get_sync(hba);
+	res = ufshcd_rpm_resume_and_get(hba);
+	if (res)
+		goto out;
 	res = ufshcd_wb_toggle(hba, wb_enable);
 	ufshcd_rpm_put_sync(hba);
 out:
@@ -421,7 +429,9 @@ static ssize_t enable_wb_buf_flush_store(struct device *dev,
 		goto out;
 	}
 
-	ufshcd_rpm_get_sync(hba);
+	res = ufshcd_rpm_resume_and_get(hba);
+	if (res)
+		goto out;
 	res = ufshcd_wb_toggle_buf_flush(hba, enable_wb_buf_flush);
 	ufshcd_rpm_put_sync(hba);
 
@@ -490,7 +500,9 @@ static ssize_t wb_resize_enable_store(struct device *dev,
 		goto out;
 	}
 
-	ufshcd_rpm_get_sync(hba);
+	res = ufshcd_rpm_resume_and_get(hba);
+	if (res)
+		goto out;
 	res = ufshcd_wb_set_resize_en(hba, mode);
 	ufshcd_rpm_put_sync(hba);
 
@@ -598,7 +610,9 @@ static ssize_t device_lvl_exception_id_show(struct device *dev,
 	if (hba->dev_info.wspecversion < 0x410)
 		return -EOPNOTSUPP;
 
-	ufshcd_rpm_get_sync(hba);
+	err = ufshcd_rpm_resume_and_get(hba);
+	if (err)
+		return err;
 	err = ufshcd_query_attr_qword(hba, UPIU_QUERY_OPCODE_READ_ATTR,
 				      QUERY_ATTR_IDN_DEV_LVL_EXCEPTION_ID,
 				      0, 0, &exception_id);
@@ -1101,7 +1115,9 @@ static ssize_t ufs_sysfs_read_desc_param(struct ufs_hba *hba,
 		goto out;
 	}
 
-	ufshcd_rpm_get_sync(hba);
+	ret = ufshcd_rpm_resume_and_get(hba);
+	if (ret)
+		goto out;
 	ret = ufshcd_read_desc_param(hba, desc_id, desc_index,
 				param_offset, desc_buf, param_size);
 	ufshcd_rpm_put_sync(hba);
@@ -1482,7 +1498,12 @@ static ssize_t _name##_show(struct device *dev,				\
 		up(&hba->host_sem);					\
 		return -ENOMEM;						\
 	}								\
-	ufshcd_rpm_get_sync(hba);					\
+	ret = ufshcd_rpm_resume_and_get(hba);				\
+	if (ret) {							\
+		kfree(desc_buf);					\
+		up(&hba->host_sem);					\
+		return ret;						\
+	}								\
 	ret = ufshcd_query_descriptor_retry(hba,			\
 		UPIU_QUERY_OPCODE_READ_DESC, QUERY_DESC_IDN_DEVICE,	\
 		0, 0, desc_buf, &desc_len);				\
@@ -1548,7 +1569,9 @@ static ssize_t _name##_show(struct device *dev,				\
 	}								\
 	if (ufshcd_is_wb_flags(QUERY_FLAG_IDN##_uname))			\
 		index = ufshcd_wb_get_query_index(hba);			\
-	ufshcd_rpm_get_sync(hba);					\
+	ret = ufshcd_rpm_resume_and_get(hba);				\
+	if (ret)							\
+		goto out;						\
 	ret = ufshcd_query_flag(hba, UPIU_QUERY_OPCODE_READ_FLAG,	\
 		QUERY_FLAG_IDN##_uname, index, &flag);			\
 	ufshcd_rpm_put_sync(hba);					\
@@ -1608,7 +1631,9 @@ static ssize_t max_number_of_rtt_show(struct device *dev,
 		return -EBUSY;
 	}
 
-	ufshcd_rpm_get_sync(hba);
+	ret = ufshcd_rpm_resume_and_get(hba);
+	if (ret)
+		goto out;
 	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
 		QUERY_ATTR_IDN_MAX_NUM_OF_RTT, 0, 0, &rtt);
 	ufshcd_rpm_put_sync(hba);
@@ -1648,7 +1673,9 @@ static ssize_t max_number_of_rtt_store(struct device *dev,
 		goto out;
 	}
 
-	ufshcd_rpm_get_sync(hba);
+	ret = ufshcd_rpm_resume_and_get(hba);
+	if (ret)
+		goto out;
 
 	memflags = memalloc_noio_save();
 	shost_for_each_device(sdev, hba->host)
@@ -1700,7 +1727,11 @@ static int wb_read_resize_attrs(struct ufs_hba *hba,
 	}
 
 	index = ufshcd_wb_get_query_index(hba);
-	ufshcd_rpm_get_sync(hba);
+	ret = ufshcd_rpm_resume_and_get(hba);
+	if (ret) {
+		up(&hba->host_sem);
+		return ret;
+	}
 	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
 			idn, index, 0, attr_val);
 	ufshcd_rpm_put_sync(hba);
@@ -1760,7 +1791,9 @@ static ssize_t _name##_show(struct device *dev,				\
 	}								\
 	if (ufshcd_is_wb_attrs(QUERY_ATTR_IDN##_uname))			\
 		index = ufshcd_wb_get_query_index(hba);			\
-	ufshcd_rpm_get_sync(hba);					\
+	ret = ufshcd_rpm_resume_and_get(hba);				\
+	if (ret)							\
+		goto out;						\
 	if (ufshcd_is_qword_attr(QUERY_ATTR_IDN##_uname))		\
 		ret = ufshcd_query_attr_qword(hba,			\
 			UPIU_QUERY_OPCODE_READ_ATTR,			\
@@ -1848,7 +1881,11 @@ static int hid_query_attr(struct ufs_hba *hba, enum query_opcode opcode,
 		return -EBUSY;
 	}
 
-	ufshcd_rpm_get_sync(hba);
+	ret = ufshcd_rpm_resume_and_get(hba);
+	if (ret) {
+		up(&hba->host_sem);
+		return ret;
+	}
 	ret = ufshcd_query_attr(hba, opcode, idn, 0, 0, attr_val);
 	ufshcd_rpm_put_sync(hba);
 
@@ -2121,7 +2158,9 @@ static ssize_t dyn_cap_needed_attribute_show(struct device *dev,
 		goto out;
 	}
 
-	ufshcd_rpm_get_sync(hba);
+	ret = ufshcd_rpm_resume_and_get(hba);
+	if (ret)
+		goto out;
 	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
 		QUERY_ATTR_IDN_DYN_CAP_NEEDED, lun, 0, &value);
 	ufshcd_rpm_put_sync(hba);
-- 
2.56.0.307.g5fe7bd680c-goog

