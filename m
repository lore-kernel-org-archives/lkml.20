Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792892099;
	b=M/vcW0TZZfT797WgvoVduJ9NwgWnre8cjfWmymG0lERqqWUm3gIIFs1+nT0GrrZMReXz
	 9gvuY6W+YZajxe7Q79ol0bgYF/RJeHwzPOpBi5Zg7rRpTjN9+B1ApWwQF++da3ZAMT8qh
	 YlYjqjFKhReY8rVGGrV/dM6yiVrAyPYi+rqH+K/qAsWSv9Tb4yFU10IRIZVjAMtA6l3/l
	 grHT5JCJtFjdstCGENLeC44G1/knoxpE2NoVOt8JPWYEUZ/GycoYwkaWDOn/y4FAwvNWq
	 2PjVYXhY2bEOSVA0nSm6RlQnWQtgwJL4LIlR0NBDe6svb+KESyZ08ueTuEfvyqmvIcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792892099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BP/T5caNyFQqrbvx80KyGJgS3Pl0WpQ0WItoit3D5n4=;
	b=X6KyHozobY5/Pi6Lut6ku8Ys1FLqVUTV0BYIgfIS88oHFiTd82gveJnsT9tsk8GBP3Si
	 YKyV/JtS2tOAqpXKuNnpTfyv2dYKcN1btFoNz7px/HnrZBeJcABurSnpuYao/Dp0oLHqs
	 Y99bNZ5qh1WMMLTFokFWNnGSwGpj5zQrQ9C3eXUuC5cfif6Zwfahg8DwNl+ehsO13Ls3u
	 vOkChIaGFyGwE3ypGVlrjmrxgwACVg53J2icwIDOw+Rr9yVuT3U32HBfrlAu95Efs9Zdq
	 BIB4DuXF7oJywZI61xRsE11u01+Ktlrh7qb13yfKSJ0m9v/GFk9cLc8Jd1e5OOXfmXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=dEzswU2F;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C870E606A331
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C870E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=dEzswU2F
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so2618741a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792892098; x=1793496898; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BP/T5caNyFQqrbvx80KyGJgS3Pl0WpQ0WItoit3D5n4=;
        b=dEzswU2Fcsi1HV/1C1T/dd4ptCo42oLxLfLaX5mdu4t50ngB7DU/MikWO9wmPQj6hH
         wDUjsaOuZILakJWz6SJ3xNZCNmaVOroWsYUI0BdPbphSAX4n5KQs2LEcJzxhbWG/vmg/
         JsaGpOiIsL68Yedj1JC3z2zz5qupKclpqFwpYMmmbVLaSjFk18tmQ/jScKl4xe2CLsFA
         eU+M6DvthyaXWW+EldMi2NBn1+nYccZERagA7tSuxh5bnXFk8m69l/JToSc7HbFV4eHp
         UctyADqbeG7sOpmRZAm98fcpI53RaKdQ4FyL6pbMHXBTEbA1fnu7Mi4VbAoQYn3SqQNH
         tamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792892098; x=1793496898;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BP/T5caNyFQqrbvx80KyGJgS3Pl0WpQ0WItoit3D5n4=;
        b=m2RueS56tlucIH0uc6oDpFKNM4DmeetDhe8a3nnH0zKIdB3hkS9DvGOMyXQO9Ee0em
         9piFnQxBZQoRi3uSwFnRibZmNdDFNm8+oUL0utv9sOT7VS/x9zuhVXjxLLRTQEY2fcxc
         SRYJUKqD68FXxyXOZ0NNCR7adPu/Quxhhn0e0ycf9OkCoSimWFZiYuOzVJDiTCEJztdD
         xqIKOmOajEF2esyY9yTe8VKagA68cNkrHRCfY2E1YcRmCoi9q1bnYwLURtoozpx5Luo9
         goutt0KAiRJkx3VCzoZW75i2GSu+pUK/XJ24U7pDda+qvhuSMBC5sakGWH+kLS1/gGo5
         5KOw==
X-Forwarded-Encrypted: i=1; AKwUvBzjg8ZChrGqNU8lb3K/nyE+TH+MNoow2z8UFJTjliwmm9C4AelUZWbsgD8o11DQMyf+Ifvl9FzyqAKbkmE=@vger.kernel.org
X-Gm-Message-State: AFq9FYICywls1cxqJvcnMTpwS+u5uVCs4BmNM1r1MgkXit/C9iOLZaWQ
	6BIZdmAv1b0a7CQXOAp6NN5T9pbaXflXQByqskEhxKhWq/XYBazUe78KaHWo9hwmiZdam/vqZzX
	VSA4RVuQKhQM4LTuhDDjlfA==
X-Received: from pjvf5.prod.google.com ([2002:a17:90a:da85:b0:3ac:16a7:52de])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3b8f:b0:3ac:450a:f9d4 with SMTP id 98e67ed59e1d1-3adeb16364bmr3012759a91.64.1792892097936;
 Sat, 24 Oct 2026 18:34:57 -0700 (PDT)
Date: Sun, 25 Oct 2026 09:34:46 +0800
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
Message-ID: <20261025013446.345974-6-stanleyjhu@google.com>
Subject: [PATCH 5/5] scsi: ufs: hwmon, debugfs: Propagate runtime PM resume errors
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	Peter Wang <peter.wang@mediatek.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stanley Jhu <stanleyjhu@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ufs_hwmon_read(), ufs_hwmon_write(), and ufs_debugfs_get_user_access()
ignore the return value of ufshcd_rpm_get_sync():

1. A hwmon sensor access, a debugfs exception-event write, or a debugfs
   TX equalization retrain request runs when W-LUN runtime resume
   fails, when power.runtime_error is set, or when W-LUN runtime PM is
   disabled while suspended.
2. ufshcd_rpm_get_sync() fails with a negative errno while leaving the
   device unresumed.
3. The caller still issues temperature or exception-event query UPIUs,
   or retrains TX equalization, on the suspended target.

Convert all three call sites to ufshcd_rpm_resume_and_get() and release
hba->host_sem before returning the error, ahead of
__acquire(ufs_debugfs) in ufs_debugfs_get_user_access(). This covers
ee_usr_mask_set(), ufs_debugfs_restart_ee(), and ufs_tx_eq_ctrl_write(),
which all use ufs_debugfs_get_user_access().

Fixes: b294ff3e3449 ("scsi: ufs: core: Enable power management for wlun")
Fixes: e88e2d32200a ("scsi: ufs: core: Probe for temperature notification support")
Fixes: adbabdcf0db0 ("scsi: ufs: core: Add support to retrain TX Equalization via debugfs")
Cc: stable@vger.kernel.org # needs "scsi: ufs: core: Introduce ufshcd_rpm_resume_and_get() helper"
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufs-debugfs.c |  8 +++++++-
 drivers/ufs/core/ufs-hwmon.c   | 12 ++++++++++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufs-debugfs.c b/drivers/ufs/core/ufs-debugfs.c
index 9f83628f3e2c..44a1a9692324 100644
--- a/drivers/ufs/core/ufs-debugfs.c
+++ b/drivers/ufs/core/ufs-debugfs.c
@@ -70,12 +70,18 @@ token_context_lock(ufs_debugfs);
 static int ufs_debugfs_get_user_access(struct ufs_hba *hba)
 	__cond_acquires(0, ufs_debugfs)
 {
+	int err;
+
 	down(&hba->host_sem);
 	if (!ufshcd_is_user_access_allowed(hba)) {
 		up(&hba->host_sem);
 		return -EBUSY;
 	}
-	ufshcd_rpm_get_sync(hba);
+	err = ufshcd_rpm_resume_and_get(hba);
+	if (err) {
+		up(&hba->host_sem);
+		return err;
+	}
 	__acquire(ufs_debugfs);
 	return 0;
 }
diff --git a/drivers/ufs/core/ufs-hwmon.c b/drivers/ufs/core/ufs-hwmon.c
index aa0b60a0ee8a..2b9673d92573 100644
--- a/drivers/ufs/core/ufs-hwmon.c
+++ b/drivers/ufs/core/ufs-hwmon.c
@@ -61,7 +61,11 @@ static int ufs_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32
 		return -EBUSY;
 	}
 
-	ufshcd_rpm_get_sync(hba);
+	err = ufshcd_rpm_resume_and_get(hba);
+	if (err) {
+		up(&hba->host_sem);
+		return err;
+	}
 
 	switch (attr) {
 	case hwmon_temp_enable:
@@ -113,7 +117,11 @@ static int ufs_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32
 		return -EBUSY;
 	}
 
-	ufshcd_rpm_get_sync(hba);
+	err = ufshcd_rpm_resume_and_get(hba);
+	if (err) {
+		up(&hba->host_sem);
+		return err;
+	}
 
 	if (val == 1)
 		err = ufshcd_update_ee_usr_mask(hba, MASK_EE_URGENT_TEMP, 0);
-- 
2.56.0.307.g5fe7bd680c-goog

