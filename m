Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBBD46C837
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484377; cv=none; b=VfCJ6vAeUH6kug/2+U64S36BfAp30WqNXt9QvPetJ1inTprqZtVW2+YNc2Tt+b6L8PzY6BqN8YTnrWFYXf+Y26FQAcwNT4Mgjz94BZUIvqZR64rl0qAheTAdGP3cDTBttDbhquZgp3OvqdLviNLJ6YCkI1H1zgtckeznV+L/EmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484377; c=relaxed/simple;
	bh=4QlUlLrLI2izCLiDBGQYAyl5XJzVi04VSQi/7fQZnYs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IZhFw7CtjC8MpvZ5tnrLrnzJ/hhvuV3iVo98nrcbbXyOBfaXIXSBm+4Sgl9PQzxFQJ2+6YFqoW4Sxf8+XIPKnB+7MkWR7LoOFGn1/xtwlya3LzHhkjuUVb7wWaMSY9Zlnv9f4N46KAWE0KAmOJHKnPO8EqSiauH0YuHXHqLRC70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsTPKIxu; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsTPKIxu"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so410542a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789484375; x=1790089175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sM8FZVMxP2hiPNTQV1TQf/nu2Pe7Nxn9zPQ+apETFmc=;
        b=ZsTPKIxuwU5AqpDcpyP0T3CCTMlEIauddRYFpPsHr6NtWFCzH0CxCRUPScJtQuvUTX
         iTb7jasW1mhS6R+ymA4oP33PNwYWZ0HbTL480HIEmW8OKVGkDK+RaOah6hiQyO8Fj8iO
         n7t2teOg/HbzpasCUOCpofH0LPtUYW+EChzV1YVJBekBWaQ32ZI0dXJKfJwH2cmrSo5w
         UCEBwQE2jbyPeFVuqNxxWtEwZSsDZ7hazm1dvbGAsMDQr4ug9rTbdQ9PBEPqYo5TfpeV
         eTFmGxKNo9NLqhdt2UYy/rBU3lB2r+ptXZHH4S8zkeRofp98c0eW3hjkRuHQgtLT1MSq
         FJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484375; x=1790089175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sM8FZVMxP2hiPNTQV1TQf/nu2Pe7Nxn9zPQ+apETFmc=;
        b=vxmY4eUfGZ/5cK3zUPVIRfrZooCm9SsR8tl9xnB+0CBgeHRtiFChJU4Ci5JhdBbc4h
         GJuIU3+3YcrsMPF2Zf3gu372LQgr9f+ICfaBRZLGshWJNcMwi26FlcthxnVD3G7PvqH/
         cyTuqWZOI6dWyG0Re0A9Se/IK9S9f8Br7nldcWhG7zIDWB21jFzAEkDVv8d1eeMnP7Wx
         FFE/n3ZUseD4srlchTJEjEkn9rD7kFjoFhfxrdoyX2fpT5Kg/F4rAssAYUq+tzXXg+z0
         4ylCaD7OkkUp9sblmoDYt26Z1hwBMHIjfhE8pz2UUN3oXUuoreFN1BVY47dAYoYcs8zY
         +6xQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYYsTwV0Ufnd+VzpFzLRCcgbjx/9deNthLuzPc5F13T6mlSTzMFZ39+KxjJS5gHAAQuzbrBkb6SbNOLNo=@vger.kernel.org
X-Gm-Message-State: AFuF++nYPhAkvmgHvNKa10QVKJCDiA4xnMiJdzXQIMwLWSUd+lW+zhGx
	Wwbcd+DpxUUvtQxW33k4NAKws6OXcHlVz6FQYl9A8z7HmDhpo8Cb8N3C
X-Gm-Gg: AYBFou0+gaK8dEQJtZ9J0NeuFBRPKsYDuEgeU17cJXvgjphygH+u/PyGzHInMIreGoL
	7DuKjYO15+0wzekENc1+wVXuY7pfPMjXzrGkhV18yUnpB+TMlGc8d/IX4w+zhONJS8kfG40OD6u
	pkg5kHVwRsnK0Tzf7PhJqbD9Uy5IVlh18OL/zWYNWf741ARB2HL5sXkA/b4hyPgbEMA/0uA/sgu
	iYZrXX9tzpkvdut73lYzvtrpqhshINpU3brLXUKfyDwXY4o+oAw1PE/6HznBSP7oVUQ1hS3aFhF
	RBQ16hEbWGwhi4AzRpETwUX62NStbwhycpXFwy866jlZzwCHe1MocdEPWO2Qf7P7lYQNBher0p1
	5co+unma9amFtxgMrjsX1HW66xfA2FeWib5tj9m4fjFPwAbDL+fM7oaoroL1EG+4wrlmg/sK643
	eRA8k8G/38qh7Mhvq1UZPVP31Oa9ePXR6mS8Zj5LaIe1JmqLGhI3Wyn4+6CPtTH4mCQ4XGaIb/S
	aKfxz4yceJteQHX4xVeuIA1Xib++zMmZlzDC4QvMuq2uyIl1hojoYTjyY0JNG/FVo7qViLvN6uW
	j+D1hrj1h4HfiTC21nX6
X-Received: by 2002:a17:90b:17c8:b0:39d:fced:6fb2 with SMTP id 98e67ed59e1d1-39e10c425c9mr2292789a91.5.1789484375014;
        Tue, 15 Sep 2026 07:59:35 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net (2001-b011-2005-787e-21e6-43b5-0185-f167.dynamic-ip6.hinet.net. [2001:b011:2005:787e:21e6:43b5:185:f167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm5797817a91.15.2026.09.15.07.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:59:34 -0700 (PDT)
From: Yiwei Lin <s921975628@gmail.com>
To: alim.akhtar@samsung.com,
	avri.altman@sandisk.com,
	bvanassche@acm.org
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yiwei Lin <s921975628@gmail.com>
Subject: [PATCH v3] ufs: sysfs: fix current_power_mode read without SSU
Date: Tue, 15 Sep 2026 22:59:24 +0800
Message-Id: <20260915145924.9080-1-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

current_power_mode was generated by UFS_ATTRIBUTE(), which calls
ufshcd_rpm_get_sync() before issuing the query.  That resumes the UFS
device WLUN, and ufshcd_wl_runtime_resume() sends START STOP UNIT to
bring the device back to Active.  As a result bCurrentPowerMode always
read back as 0x11 (Active) no matter what state the device was actually
in: the act of reading the attribute woke the device, so Sleep could
never be observed through sysfs.

Per the UFS spec, bCurrentPowerMode is the one attribute the device
must answer in any power mode, so there is no need to wake it.  Give
current_power_mode its own show function that deliberately does not
resume the WLUN.  It only resumes the host controller then reads the
attribute over whatever link state the WLUN suspend left behind:

 - link active: query directly.
 - link in Hibern8: exit Hibern8, query, then re-enter Hibern8 so the
   link is left exactly as rpm_lvl requested.
 - device powered down or link off (rpm_lvl 4/5/6): fail, the device
   cannot answer without a full resume.

Tested on hardware: with the device runtime-suspended (wb_on=0, so the
device actually reaches Sleep instead of being held Active for a WB
flush), reading current_power_mode used to return 0x11; after this
change it returns 0x22 (Sleep), matching the device's real state.

Assisted-by: LLM
Signed-off-by: Yiwei Lin <s921975628@gmail.com>

---
Change-Logs in V3:
- Synchonize the race between WLUN suspend/resume and other contexts
  that change the link power state.
- Restore UFS link if exiting Hibern8 for the query, then re-enter Hibern8 so the link   is left exactly as rpm_lvl requested.
- Correct the commit author name and mail

---
 drivers/ufs/core/ufs-sysfs.c   | 74 +++++++++++++++++++++++++++++++++-
 drivers/ufs/core/ufshcd-priv.h | 11 +++++
 drivers/ufs/core/ufshcd.c      | 12 +++---
 include/ufs/ufshcd.h           |  3 ++
 4 files changed, 94 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/core/ufs-sysfs.c b/drivers/ufs/core/ufs-sysfs.c
index 63e670d1a9d9e..a500ca697e5d3 100644
--- a/drivers/ufs/core/ufs-sysfs.c
+++ b/drivers/ufs/core/ufs-sysfs.c
@@ -1786,7 +1786,79 @@ out:									\
 static DEVICE_ATTR_RO(_name)
 
 UFS_ATTRIBUTE(boot_lun_enabled, _BOOT_LU_EN);
-UFS_ATTRIBUTE(current_power_mode, _POWER_MODE);
+
+/*
+ * Per UFS spec, bCurrentPowerMode is the only attribute the device must
+ * respond to in any power mode.  Read it without waking the device to
+ * Active.
+ */
+static ssize_t current_power_mode_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	bool exited_h8 = false;
+	u32 value;
+	int ret = 0;
+
+	down(&hba->host_sem);
+	if (!ufshcd_is_user_access_allowed(hba)) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	pm_runtime_get_sync(hba->dev);
+
+	ufshcd_hold(hba);
+	scoped_guard(ufshcd_wl_pm, hba) {
+		if (ufshcd_is_link_off(hba) || ufshcd_is_ufs_dev_poweroff(hba)) {
+			/*
+			 * Device is powered down (rpm_lvl 4/5) or link is off
+			 * (rpm_lvl 5/6): nothing to query until a full resume.
+			 */
+			ret = -EINVAL;
+			break;
+		}
+
+		if (ufshcd_is_link_hibern8(hba)) {
+			ret = ufshcd_uic_hibern8_exit(hba);
+			if (ret) {
+				dev_err(hba->dev, "%s: hibern8 exit failed %d\n",
+					__func__, ret);
+				break;
+			}
+			ufshcd_set_link_active(hba);
+			exited_h8 = true;
+		}
+
+		ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
+			QUERY_ATTR_IDN_POWER_MODE, 0, 0, &value);
+
+		if (exited_h8) {
+			int h8_ret = ufshcd_uic_hibern8_enter(hba);
+
+			if (h8_ret) {
+				dev_err(hba->dev, "%s: hibern8 enter failed %d\n",
+					__func__, h8_ret);
+				ret = h8_ret;
+			} else {
+				ufshcd_set_link_hibern8(hba);
+			}
+		}
+	}
+	ufshcd_release(hba);
+	pm_runtime_put_sync(hba->dev);
+
+	if (!ret)
+		ret = sysfs_emit(buf, "0x%08X\n", value);
+	else
+		ret = -EINVAL;
+
+out_unlock:
+	up(&hba->host_sem);
+	return ret;
+}
+static DEVICE_ATTR_RO(current_power_mode);
+
 UFS_ATTRIBUTE(active_icc_level, _ACTIVE_ICC_LVL);
 UFS_ATTRIBUTE(ooo_data_enabled, _OOO_DATA_EN);
 UFS_ATTRIBUTE(bkops_status, _BKOPS_STATUS);
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index e55c2a02c1f50..df61074843f06 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -3,6 +3,7 @@
 #ifndef _UFSHCD_PRIV_H_
 #define _UFSHCD_PRIV_H_
 
+#include <linux/cleanup.h>
 #include <linux/pm_runtime.h>
 #include <ufs/ufshcd.h>
 
@@ -15,6 +16,16 @@ static inline bool ufshcd_is_user_access_allowed(struct ufs_hba *hba)
 
 void ufshcd_schedule_eh_work(struct ufs_hba *hba);
 
+DEFINE_LOCK_GUARD_1(ufshcd_wl_pm, struct ufs_hba,
+	({
+		mutex_lock(&_T->lock->wl_pm_mutex);
+		_T->lock->pm_op_in_progress = true;
+	}),
+	({
+		_T->lock->pm_op_in_progress = false;
+		mutex_unlock(&_T->lock->wl_pm_mutex);
+	}))
+
 static inline bool ufshcd_keep_autobkops_enabled_except_suspend(
 							struct ufs_hba *hba)
 {
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 2ba244cf40ac7..7431c0ae9ce74 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10294,7 +10294,8 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	enum ufs_dev_pwr_mode req_dev_pwr_mode;
 	enum uic_link_state req_link_state;
 
-	hba->pm_op_in_progress = true;
+	guard(ufshcd_wl_pm)(hba);
+
 	if (pm_op != UFS_SHUTDOWN_PM) {
 		pm_lvl = pm_op == UFS_RUNTIME_PM ?
 			 hba->rpm_lvl : hba->spm_lvl;
@@ -10467,7 +10468,6 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		hba->clk_gating.is_suspended = false;
 		ufshcd_release(hba);
 	}
-	hba->pm_op_in_progress = false;
 	return ret;
 }
 
@@ -10475,9 +10475,11 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	int ret;
-	enum uic_link_state old_link_state = hba->uic_link_state;
+	enum uic_link_state old_link_state;
+
+	guard(ufshcd_wl_pm)(hba);
 
-	hba->pm_op_in_progress = true;
+	old_link_state = hba->uic_link_state;
 
 	/*
 	 * Call vendor specific resume callback. As these callbacks may access
@@ -10568,7 +10570,6 @@ static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		ufshcd_update_evt_hist(hba, UFS_EVT_WL_RES_ERR, (u32)ret);
 	hba->clk_gating.is_suspended = false;
 	ufshcd_release(hba);
-	hba->pm_op_in_progress = false;
 	return ret;
 }
 
@@ -11256,6 +11257,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	INIT_WORK(&hba->eeh_work, ufshcd_exception_event_handler);
 
 	sema_init(&hba->host_sem, 1);
+	mutex_init(&hba->wl_pm_mutex);
 
 	/* Initialize UIC command mutex */
 	mutex_init(&hba->uic_cmd_mutex);
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index dfd302f2dc7c1..ac7da4bd260cb 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1010,6 +1010,8 @@ enum ufshcd_mcq_opr {
  * @is_powered: flag to check if HBA is powered
  * @shutting_down: flag to check if shutdown has been invoked
  * @host_sem: semaphore used to serialize concurrent contexts
+ * @wl_pm_mutex: serializes WLUN suspend/resume against other contexts that
+ *	change the link power state while the WLUN may be suspended
  * @eh_wq: Workqueue that eh_work works on
  * @eh_work: Worker to handle UFS errors that require s/w attention
  * @eeh_work: Worker to handle exception events
@@ -1176,6 +1178,7 @@ struct ufs_hba {
 	bool is_powered;
 	bool shutting_down;
 	struct semaphore host_sem;
+	struct mutex wl_pm_mutex;
 
 	/* Work Queues */
 	struct workqueue_struct *eh_wq;
-- 
2.34.1

