Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794776;
	b=jru0REISK+QgD7gyhtGHTFiL0BEWHDL3XBwOIZzwc285EjtRC3eC6a/UXbyIuhE9Oi7P
	 IRmyLP9kumSMX2doVEHjL2I1BnV5QodhKV2pMOFrkF0fYiw44B38Oq2CP0ju/magjAJPY
	 zztyMXG1v4hGaVxJkGIyRFyE8xg6tusFJqrtIeKKoYNazTHHlvd67DKEL1Ys5ZcfDDKTh
	 Bo5Uop2M0bsQvc7MbUqdOQWb0SECON6pftlwqIc5PWhDFLWWvbxKqCpylrj42DgVTJv0S
	 kDZo2D6iFhreuyCINqr67W2sptQ4YXpxJgobx61GWKXy4Uh11nm+rRHHeVazHl9bHVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=cJJzd3L/eTg07J3EuxCVtYSR2lZ8hLnhdrN82dNaJoM=;
	b=42fyXsGEN0SB4KeAGNtqE2obARt+z/jGmECrf8buMtm8gLMMSegaHUwlSdSnpogALB5F
	 h2uDzUSwhp/o4t2EyUmtApsXb23TQYbDURxat2yHi1Nteyr1KjzzlmW1widk4+1eDLHIJ
	 h84u3r8T9qkgOrOQS0idrvSE4uRQlkhZShzse6hXlAW0VypxtzxKXOVQy07MCG8AV2TJz
	 mvE32iKJBNwyFQt6lUZYKAO4TMyBBWGoKgWbubCC45geQCbArMKZDWC1edF90htNvNMaf
	 0WbvAFdc9rC7mK1eY9lIlzJCtpRQFFeiJZ5kt0YaErUN3cxnHoeOSwcG5qW9csmrGQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chullee.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VTjSrDE7;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3118606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3118606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chullee.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VTjSrDE7
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36fa5673fccso7984086eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794794775; x=1795399575; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJJzd3L/eTg07J3EuxCVtYSR2lZ8hLnhdrN82dNaJoM=;
        b=VTjSrDE7MawxOcxEuD4oIQtp/U7YoR3PVV/is3qCifcKgRSm8SKRabj+lDDmbKruHk
         azRftHH07xd/ixfAmrkzyE1BrxOdSWZDa+PJMyQExEm9RVE6o0crb3bRt0cxn4/qX10V
         tZMfADhho68tKPIk7IhEq//lmHH2qkJK0rKpm9ZDRMQN/VPlailg6nwhpLoGBdh/r0Rs
         4/Sgp2E0TtU8aMGDRyPZ2iVIpd0ScUMYgPHxD7/fhtfw5DC6C/T6wM4LnDxS89GTCsWl
         cxdVcwSLYC5ceOmx3Sfi7knHlJJHiATsMBy2k/DxRzx926b8xM8gkSv670YqX2yfoS2M
         xTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794794775; x=1795399575;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cJJzd3L/eTg07J3EuxCVtYSR2lZ8hLnhdrN82dNaJoM=;
        b=YUeqBCsPYBZvufSLSCZm8xjZ8tMO5nbb2ThM7NMFmuP56CXVe3UWJ+CkWRKbhab4vB
         H4fkpBbLgaT2m5i3fe1MhVpu1vQNzWtk4C4z0/zX1K0pgCY/SwRrZKXByFdaZx2ulayf
         uvEPq08BikjILfyOAWFJhvorj0xagJsdv5YVj++RJLn7V3Iq2USyqozJ18prNt/0e+6C
         ZbqUTSZiUiHV1zMNxOTFgDDDrmhFDTuRq3GTw+YBRWR8EdQ48FJIV4nqFOGhxGXo3o0Y
         VX2U9oqDHFDDJbDjbbgVDrcQAVyUnpeejY+5qZxTWWugiS82+QAdWGjIhxD5SAmk2D92
         ESnQ==
X-Forwarded-Encrypted: i=1; AL+hErGwfr87iBz7TnMJnwBUQrKHczA2yrKDIUhflVmE/xyeXwfdhltYeGVyxe7emKcFgd6HymWfCxDtXrnshCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+OO03QQTSumZIjCOxZ1F9N+w36GVlnEFktFcCqCXquMN6nOUC
	wx/QilgdORYeDi94SQ4wMKirpAF1vVwEsbMSH1Sd+AC8Ocwl9av8DVFiXUONTrAVbs3y+4f+EY1
	oWt20cxeF6w==
X-Received: from dyah18-n1.prod.google.com ([2002:a05:693c:83d2:10b0:37a:8a0f:3aba])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2587:b0:36c:a104:90db
 with SMTP id 5a478bee46e88-3796889be5fmr8618935eec.41.1794794774206; Sun, 15
 Nov 2026 18:06:14 -0800 (PST)
Date: Sun, 15 Nov 2026 19:05:04 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116020504.4051796-1-chullee@google.com>
Subject: [PATCH v3 RESEND] ufs: sysfs: Add WB partial flush mode support
From: Daniel Lee <chullee@google.com>
To: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com
Cc: alim.akhtar@samsung.com, avri.altman@sandisk.com, bvanassche@acm.org, 
	tanghuan@vivo.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chullee@google.com
Content-Type: text/plain; charset="UTF-8"

Expose the following JEDEC UFS 4.1 Extended WriteBooster attributes and
flags to sysfs to support FIFO and Pinned partial flush modes:

  - wb_partial_flush_mode
  - wb_max_fifo_size
  - wb_cur_fifo_size
  - wb_pinned_cur_size
  - wb_pinned_avail_pct
  - wb_pinned_cumulative_write_size
  - wb_pinned_size
  - wb_non_pinned_min_size
  - wb_unpin_enable

Introduce UFS_ATTRIBUTE_RW and UFS_FLAG_RW to support writable attributes
and flags.
Document the new entries under Documentation/ABI/testing/sysfs-driver-ufs.

Assisted-by: Gemini:gemini-3.1
Signed-off-by: Daniel Lee <chullee@google.com>
---
v3:
- Fold ufs_wb_pfm_to_string() into wb_partial_flush_mode_show().
- Propagate actual error codes for non-OCS error (ret < 0), while keeping -EINVAL for OCS errors (ret > 0).
- Clean up blank lines.
v2:
- Change wb_partial_flush_mode attribute to accept and report strings instead of numbers for better usability.
- Order local variable declarations from longest to shortest in new functions.
 Documentation/ABI/testing/sysfs-driver-ufs |  85 ++++++
 drivers/ufs/core/ufs-sysfs.c               | 311 ++++++++++++++++-----
 include/ufs/ufs.h                          |  17 ++
 3 files changed, 350 insertions(+), 63 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-ufs b/Documentation/ABI/testing/sysfs-driver-ufs
index 3c422aac7..32dd38eba 100644
--- a/Documentation/ABI/testing/sysfs-driver-ufs
+++ b/Documentation/ABI/testing/sysfs-driver-ufs
@@ -1791,3 +1791,88 @@ Description:
 		will be rejected.
 
 		The attribute is read/write.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/attributes/wb_partial_flush_mode
+What:		/sys/bus/platform/devices/*.ufs/attributes/wb_partial_flush_mode
+Date:		June 2026
+Contact:	Daniel Lee <chullee@google.com>
+Description:	This entry controls Extended WriteBooster partial flush modes.
+
+		======== ==============================
+		"none"   No partial flush
+		"fifo"   FIFO mode
+		"pinned" Pinned mode
+		======== ==============================
+
+		The attribute is read-write.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/attributes/wb_max_fifo_size
+What:		/sys/bus/platform/devices/*.ufs/attributes/wb_max_fifo_size
+Date:		June 2026
+Contact:	Daniel Lee <chullee@google.com>
+Description:	This entry configures the maximum size in Allocation Units reserved for the
+		WriteBooster FIFO Buffer size.
+		The attribute is read-write.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/attributes/wb_cur_fifo_size
+What:		/sys/bus/platform/devices/*.ufs/attributes/wb_cur_fifo_size
+Date:		June 2026
+Contact:	Daniel Lee <chullee@google.com>
+Description:	This entry shows the current size in Allocation Units of the WriteBooster FIFO
+		Buffer size.
+		The attribute is read only.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/attributes/wb_pinned_size
+What:		/sys/bus/platform/devices/*.ufs/attributes/wb_pinned_size
+Date:		June 2026
+Contact:	Daniel Lee <chullee@google.com>
+Description:	This entry configures the allocated size in Allocation Units for the UFS
+		Pinned WriteBooster buffer.
+		The attribute is read-write.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/attributes/wb_pinned_cur_size
+What:		/sys/bus/platform/devices/*.ufs/attributes/wb_pinned_cur_size
+Date:		June 2026
+Contact:	Daniel Lee <chullee@google.com>
+Description:	This entry shows the current allocated size in Allocation Units for the UFS
+		Pinned WriteBooster buffer.
+		The attribute is read-only.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/attributes/wb_pinned_avail_pct
+What:		/sys/bus/platform/devices/*.ufs/attributes/wb_pinned_avail_pct
+Date:		June 2026
+Contact:	Daniel Lee <chullee@google.com>
+Description:	This entry shows the percentage of available space remaining in the
+		Pinned WriteBooster buffer.
+		The attribute is read-only.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/attributes/wb_pinned_cumulative_write_size
+What:		/sys/bus/platform/devices/*.ufs/attributes/wb_pinned_cumulative_write_size
+Date:		June 2026
+Contact:	Daniel Lee <chullee@google.com>
+Description:	This entry shows the total cumulative size of data written to the
+		Pinned WriteBooster buffer.
+		The attribute is read-only.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/attributes/wb_non_pinned_min_size
+What:		/sys/bus/platform/devices/*.ufs/attributes/wb_non_pinned_min_size
+Date:		June 2026
+Contact:	Daniel Lee <chullee@google.com>
+Description:	This entry configures the minimum size in Allocation Units for the
+		Non-Pinned WriteBooster Buffer area when Pinned partial flush mode is active.
+		The attribute is read-write.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/flags/wb_unpin_enable
+What:		/sys/bus/platform/devices/*.ufs/flags/wb_unpin_enable
+Date:		June 2026
+Contact:	Daniel Lee <chullee@google.com>
+Description:	This entry controls the Pinned WriteBooster unpin enable flag (fUnpinEn).
+
+		======   ==============================================================
+		0        Unpin Disable: pinned data is not flushed by WriteBooster
+		         Buffer flush operation.
+		1        Unpin Enable: pinned data is flushed by WriteBooster
+		         Buffer flush operation.
+		======   ==============================================================
+
+		The attribute is read-write.
diff --git a/drivers/ufs/core/ufs-sysfs.c b/drivers/ufs/core/ufs-sysfs.c
index cf49ad025..97301f95e 100644
--- a/drivers/ufs/core/ufs-sysfs.c
+++ b/drivers/ufs/core/ufs-sysfs.c
@@ -89,6 +89,12 @@ static const char *ufs_wb_resize_status_to_string(enum wb_resize_status status)
 	}
 }
 
+static const char * const wb_partial_flush_modes[] = {
+	[WB_PARTIAL_FLUSH_NONE]		= "none",
+	[WB_PARTIAL_FLUSH_FIFO]		= "fifo",
+	[WB_PARTIAL_FLUSH_PINNED]	= "pinned",
+};
+
 static const char * const ufs_hid_states[] = {
 	[HID_IDLE]		= "idle",
 	[ANALYSIS_IN_PROGRESS]	= "analysis_in_progress",
@@ -1528,41 +1534,94 @@ static const struct attribute_group ufs_sysfs_string_descriptors_group = {
 
 static inline bool ufshcd_is_wb_flags(enum flag_idn idn)
 {
-	return idn >= QUERY_FLAG_IDN_WB_EN &&
-		idn <= QUERY_FLAG_IDN_WB_BUFF_FLUSH_DURING_HIBERN8;
+	return (idn >= QUERY_FLAG_IDN_WB_EN &&
+		idn <= QUERY_FLAG_IDN_WB_BUFF_FLUSH_DURING_HIBERN8) ||
+	       idn == QUERY_FLAG_IDN_WB_UNPIN_EN;
+}
+
+static ssize_t ufs_sysfs_flag_show(struct device *dev,
+	struct device_attribute *attr, char *buf, enum flag_idn idn)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	u8 index = 0;
+	bool flag;
+	int ret;
+
+	down(&hba->host_sem);
+	if (!ufshcd_is_user_access_allowed(hba)) {
+		up(&hba->host_sem);
+		return -EBUSY;
+	}
+	if (ufshcd_is_wb_flags(idn))
+		index = ufshcd_wb_get_query_index(hba);
+	ufshcd_rpm_get_sync(hba);
+	ret = ufshcd_query_flag(hba, UPIU_QUERY_OPCODE_READ_FLAG,
+		idn, index, &flag);
+	ufshcd_rpm_put_sync(hba);
+	if (ret > 0)
+		ret = -EINVAL;
+	if (ret)
+		goto out;
+	ret = sysfs_emit(buf, "%s\n", str_true_false(flag));
+out:
+	up(&hba->host_sem);
+	return ret;
+}
+
+static ssize_t ufs_sysfs_flag_store(struct device *dev,
+	struct device_attribute *attr, const char *buf, size_t count,
+	enum flag_idn idn)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	u8 index = 0;
+	bool value;
+	int ret;
+
+	if (kstrtobool(buf, &value))
+		return -EINVAL;
+
+	down(&hba->host_sem);
+	if (!ufshcd_is_user_access_allowed(hba)) {
+		up(&hba->host_sem);
+		return -EBUSY;
+	}
+	if (ufshcd_is_wb_flags(idn))
+		index = ufshcd_wb_get_query_index(hba);
+	ufshcd_rpm_get_sync(hba);
+	ret = ufshcd_query_flag(hba,
+		value ? UPIU_QUERY_OPCODE_SET_FLAG : UPIU_QUERY_OPCODE_CLEAR_FLAG,
+		idn, index, NULL);
+	ufshcd_rpm_put_sync(hba);
+	if (ret > 0)
+		ret = -EINVAL;
+	up(&hba->host_sem);
+	return ret ? ret : count;
 }
 
 #define UFS_FLAG(_name, _uname)						\
 static ssize_t _name##_show(struct device *dev,				\
 	struct device_attribute *attr, char *buf)			\
 {									\
-	bool flag;							\
-	u8 index = 0;							\
-	int ret;							\
-	struct ufs_hba *hba = dev_get_drvdata(dev);			\
-									\
-	down(&hba->host_sem);						\
-	if (!ufshcd_is_user_access_allowed(hba)) {			\
-		up(&hba->host_sem);					\
-		return -EBUSY;						\
-	}								\
-	if (ufshcd_is_wb_flags(QUERY_FLAG_IDN##_uname))			\
-		index = ufshcd_wb_get_query_index(hba);			\
-	ufshcd_rpm_get_sync(hba);					\
-	ret = ufshcd_query_flag(hba, UPIU_QUERY_OPCODE_READ_FLAG,	\
-		QUERY_FLAG_IDN##_uname, index, &flag);			\
-	ufshcd_rpm_put_sync(hba);					\
-	if (ret) {							\
-		ret = -EINVAL;						\
-		goto out;						\
-	}								\
-	ret = sysfs_emit(buf, "%s\n", str_true_false(flag));		\
-out:									\
-	up(&hba->host_sem);						\
-	return ret;							\
+	return ufs_sysfs_flag_show(dev, attr, buf,			\
+				   QUERY_FLAG_IDN##_uname);		\
 }									\
 static DEVICE_ATTR_RO(_name)
 
+#define UFS_FLAG_RW(_name, _uname)					\
+static ssize_t _name##_show(struct device *dev,				\
+	struct device_attribute *attr, char *buf)			\
+{									\
+	return ufs_sysfs_flag_show(dev, attr, buf,			\
+				   QUERY_FLAG_IDN##_uname);		\
+}									\
+static ssize_t _name##_store(struct device *dev,			\
+	struct device_attribute *attr, const char *buf, size_t count)	\
+{									\
+	return ufs_sysfs_flag_store(dev, attr, buf, count,		\
+				    QUERY_FLAG_IDN##_uname);		\
+}									\
+static DEVICE_ATTR_RW(_name)
+
 UFS_FLAG(device_init, _FDEVICEINIT);
 UFS_FLAG(permanent_wpe, _PERMANENT_WPE);
 UFS_FLAG(power_on_wpe, _PWR_ON_WPE);
@@ -1574,6 +1633,7 @@ UFS_FLAG(disable_fw_update, _PERMANENTLY_DISABLE_FW_UPDATE);
 UFS_FLAG(wb_enable, _WB_EN);
 UFS_FLAG(wb_flush_en, _WB_BUFF_FLUSH_EN);
 UFS_FLAG(wb_flush_during_h8, _WB_BUFF_FLUSH_DURING_HIBERN8);
+UFS_FLAG_RW(wb_unpin_enable, _WB_UNPIN_EN);
 
 static struct attribute *ufs_sysfs_device_flags[] = {
 	&dev_attr_device_init.attr,
@@ -1587,6 +1647,7 @@ static struct attribute *ufs_sysfs_device_flags[] = {
 	&dev_attr_wb_enable.attr,
 	&dev_attr_wb_flush_en.attr,
 	&dev_attr_wb_flush_during_h8.attr,
+	&dev_attr_wb_unpin_enable.attr,
 	NULL,
 };
 
@@ -1672,8 +1733,10 @@ static DEVICE_ATTR_RW(max_number_of_rtt);
 
 static inline bool ufshcd_is_wb_attrs(enum attr_idn idn)
 {
-	return idn >= QUERY_ATTR_IDN_WB_FLUSH_STATUS &&
-		idn <= QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE;
+	return (idn >= QUERY_ATTR_IDN_WB_FLUSH_STATUS &&
+		idn <= QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE) ||
+	       (idn >= QUERY_ATTR_IDN_WB_PFM &&
+		idn <= QUERY_ATTR_IDN_NON_PINNED_WB_MIN_SIZE);
 }
 
 static inline bool ufshcd_is_qword_attr(enum attr_idn idn)
@@ -1743,48 +1806,97 @@ static ssize_t wb_resize_status_show(struct device *dev,
 
 static DEVICE_ATTR_RO(wb_resize_status);
 
+static ssize_t ufs_sysfs_attr_show(struct device *dev,
+	struct device_attribute *attr, char *buf, enum attr_idn idn)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	u64 qword_value;
+	u8 index = 0;
+	u32 value;
+	int ret;
+
+	down(&hba->host_sem);
+	if (!ufshcd_is_user_access_allowed(hba)) {
+		up(&hba->host_sem);
+		return -EBUSY;
+	}
+	if (ufshcd_is_wb_attrs(idn))
+		index = ufshcd_wb_get_query_index(hba);
+	ufshcd_rpm_get_sync(hba);
+	if (ufshcd_is_qword_attr(idn))
+		ret = ufshcd_query_attr_qword(hba, UPIU_QUERY_OPCODE_READ_ATTR,
+			idn, index, 0, &qword_value);
+	else
+		ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
+			idn, index, 0, &value);
+	ufshcd_rpm_put_sync(hba);
+	if (ret > 0)
+		ret = -EINVAL;
+	if (ret)
+		goto out;
+	if (ufshcd_is_qword_attr(idn))
+		ret = sysfs_emit(buf, "0x%016llX\n", qword_value);
+	else
+		ret = sysfs_emit(buf, "0x%08X\n", value);
+out:
+	up(&hba->host_sem);
+	return ret;
+}
+
+static ssize_t ufs_sysfs_attr_store(struct device *dev,
+	struct device_attribute *attr, const char *buf, size_t count,
+	enum attr_idn idn)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	u8 index = 0;
+	u32 value;
+	int ret;
+
+	if (kstrtou32(buf, 0, &value))
+		return -EINVAL;
+
+	down(&hba->host_sem);
+	if (!ufshcd_is_user_access_allowed(hba)) {
+		up(&hba->host_sem);
+		return -EBUSY;
+	}
+	if (ufshcd_is_wb_attrs(idn))
+		index = ufshcd_wb_get_query_index(hba);
+	ufshcd_rpm_get_sync(hba);
+	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_WRITE_ATTR,
+		idn, index, 0, &value);
+	ufshcd_rpm_put_sync(hba);
+	if (ret > 0)
+		ret = -EINVAL;
+	up(&hba->host_sem);
+	return ret ? ret : count;
+}
+
 #define UFS_ATTRIBUTE(_name, _uname)					\
 static ssize_t _name##_show(struct device *dev,				\
 	struct device_attribute *attr, char *buf)			\
 {									\
-	struct ufs_hba *hba = dev_get_drvdata(dev);			\
-	u64 qword_value;						\
-	u32 value;							\
-	int ret;							\
-	u8 index = 0;							\
-									\
-	down(&hba->host_sem);						\
-	if (!ufshcd_is_user_access_allowed(hba)) {			\
-		up(&hba->host_sem);					\
-		return -EBUSY;						\
-	}								\
-	if (ufshcd_is_wb_attrs(QUERY_ATTR_IDN##_uname))			\
-		index = ufshcd_wb_get_query_index(hba);			\
-	ufshcd_rpm_get_sync(hba);					\
-	if (ufshcd_is_qword_attr(QUERY_ATTR_IDN##_uname))		\
-		ret = ufshcd_query_attr_qword(hba,			\
-			UPIU_QUERY_OPCODE_READ_ATTR,			\
-			QUERY_ATTR_IDN##_uname,				\
-			index, 0, &qword_value);			\
-	else								\
-		ret = ufshcd_query_attr(hba,				\
-			UPIU_QUERY_OPCODE_READ_ATTR,			\
-			QUERY_ATTR_IDN##_uname, index, 0, &value);	\
-	ufshcd_rpm_put_sync(hba);					\
-	if (ret) {							\
-		ret = -EINVAL;						\
-		goto out;						\
-	}								\
-	if (ufshcd_is_qword_attr(QUERY_ATTR_IDN##_uname))		\
-		ret = sysfs_emit(buf, "0x%016llX\n", qword_value);	\
-	else								\
-		ret = sysfs_emit(buf, "0x%08X\n", value);		\
-out:									\
-	up(&hba->host_sem);						\
-	return ret;							\
+	return ufs_sysfs_attr_show(dev, attr, buf,			\
+				   QUERY_ATTR_IDN##_uname);		\
 }									\
 static DEVICE_ATTR_RO(_name)
 
+#define UFS_ATTRIBUTE_RW(_name, _uname)					\
+static ssize_t _name##_show(struct device *dev,				\
+			    struct device_attribute *attr, char *buf)	\
+{									\
+	return ufs_sysfs_attr_show(dev, attr, buf,			\
+				   QUERY_ATTR_IDN##_uname);		\
+}									\
+static ssize_t _name##_store(struct device *dev,			\
+			     struct device_attribute *attr,		\
+			     const char *buf, size_t count)		\
+{									\
+	return ufs_sysfs_attr_store(dev, attr, buf, count,		\
+				    QUERY_ATTR_IDN##_uname);		\
+}									\
+static DEVICE_ATTR_RW(_name)
+
 UFS_ATTRIBUTE(boot_lun_enabled, _BOOT_LU_EN);
 UFS_ATTRIBUTE(current_power_mode, _POWER_MODE);
 UFS_ATTRIBUTE(active_icc_level, _ACTIVE_ICC_LVL);
@@ -1805,6 +1917,71 @@ UFS_ATTRIBUTE(wb_avail_buf, _AVAIL_WB_BUFF_SIZE);
 UFS_ATTRIBUTE(wb_life_time_est, _WB_BUFF_LIFE_TIME_EST);
 UFS_ATTRIBUTE(wb_cur_buf, _CURR_WB_BUFF_SIZE);
 
+static ssize_t wb_partial_flush_mode_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	u32 value;
+	int ret;
+
+	down(&hba->host_sem);
+	if (!ufshcd_is_user_access_allowed(hba)) {
+		up(&hba->host_sem);
+		return -EBUSY;
+	}
+	ufshcd_rpm_get_sync(hba);
+	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
+		QUERY_ATTR_IDN_WB_PFM, ufshcd_wb_get_query_index(hba), 0, &value);
+	ufshcd_rpm_put_sync(hba);
+	up(&hba->host_sem);
+	if (ret > 0)
+		ret = -EINVAL;
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", value < NUM_WB_PARTIAL_FLUSH_MODES ?
+			  wb_partial_flush_modes[value] : "unknown");
+}
+
+static ssize_t wb_partial_flush_mode_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	u32 value;
+	int mode;
+	int ret;
+
+	mode = sysfs_match_string(wb_partial_flush_modes, buf);
+	if (mode < 0)
+		return -EINVAL;
+
+	value = mode;
+
+	down(&hba->host_sem);
+	if (!ufshcd_is_user_access_allowed(hba)) {
+		up(&hba->host_sem);
+		return -EBUSY;
+	}
+	ufshcd_rpm_get_sync(hba);
+	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_WRITE_ATTR,
+		QUERY_ATTR_IDN_WB_PFM, ufshcd_wb_get_query_index(hba), 0, &value);
+	ufshcd_rpm_put_sync(hba);
+	up(&hba->host_sem);
+
+	if (ret > 0)
+		ret = -EINVAL;
+	return ret ? ret : count;
+}
+
+static DEVICE_ATTR_RW(wb_partial_flush_mode);
+UFS_ATTRIBUTE_RW(wb_max_fifo_size, _MAX_FIFO_SIZE_WB_PFM);
+UFS_ATTRIBUTE(wb_cur_fifo_size, _CURRENT_FIFO_SIZE_WB_PFM);
+UFS_ATTRIBUTE(wb_pinned_cur_size, _PINNED_WB_CURRENT_SIZE);
+UFS_ATTRIBUTE(wb_pinned_avail_pct, _PINNED_WB_AVAIL_PERC);
+UFS_ATTRIBUTE(wb_pinned_cumulative_write_size, _PINNED_WB_CUMMULATIVE_WS);
+UFS_ATTRIBUTE_RW(wb_pinned_size, _PINNED_WB_SIZE);
+UFS_ATTRIBUTE_RW(wb_non_pinned_min_size, _NON_PINNED_WB_MIN_SIZE);
 
 static struct attribute *ufs_sysfs_attributes[] = {
 	&dev_attr_boot_lun_enabled.attr,
@@ -1829,6 +2006,14 @@ static struct attribute *ufs_sysfs_attributes[] = {
 	&dev_attr_wb_cur_buf.attr,
 	&dev_attr_wb_resize_hint.attr,
 	&dev_attr_wb_resize_status.attr,
+	&dev_attr_wb_partial_flush_mode.attr,
+	&dev_attr_wb_max_fifo_size.attr,
+	&dev_attr_wb_cur_fifo_size.attr,
+	&dev_attr_wb_pinned_cur_size.attr,
+	&dev_attr_wb_pinned_avail_pct.attr,
+	&dev_attr_wb_pinned_cumulative_write_size.attr,
+	&dev_attr_wb_pinned_size.attr,
+	&dev_attr_wb_non_pinned_min_size.attr,
 	NULL,
 };
 
diff --git a/include/ufs/ufs.h b/include/ufs/ufs.h
index b0207e694..f6011ef1a 100644
--- a/include/ufs/ufs.h
+++ b/include/ufs/ufs.h
@@ -151,6 +151,7 @@ enum flag_idn {
 	QUERY_FLAG_IDN_WB_BUFF_FLUSH_DURING_HIBERN8     = 0x10,
 	QUERY_FLAG_IDN_HPB_RESET                        = 0x11,
 	QUERY_FLAG_IDN_HPB_EN				= 0x12,
+	QUERY_FLAG_IDN_WB_UNPIN_EN			= 0x13,
 };
 
 /* Attribute idn for Query requests */
@@ -196,6 +197,14 @@ enum attr_idn {
 	QUERY_ATTR_IDN_WB_BUF_RESIZE_HINT	= 0x3C,
 	QUERY_ATTR_IDN_WB_BUF_RESIZE_EN		= 0x3D,
 	QUERY_ATTR_IDN_WB_BUF_RESIZE_STATUS	= 0x3E,
+	QUERY_ATTR_IDN_WB_PFM			= 0x3F,
+	QUERY_ATTR_IDN_MAX_FIFO_SIZE_WB_PFM	= 0x40,
+	QUERY_ATTR_IDN_CURRENT_FIFO_SIZE_WB_PFM	= 0x41,
+	QUERY_ATTR_IDN_PINNED_WB_CURRENT_SIZE	= 0x42,
+	QUERY_ATTR_IDN_PINNED_WB_AVAIL_PERC	= 0x43,
+	QUERY_ATTR_IDN_PINNED_WB_CUMMULATIVE_WS	= 0x44,
+	QUERY_ATTR_IDN_PINNED_WB_SIZE		= 0x45,
+	QUERY_ATTR_IDN_NON_PINNED_WB_MIN_SIZE	= 0x46,
 	QUERY_ATTR_IDN_TX_EQ_GN_SETTINGS        = 0x47,
 	QUERY_ATTR_IDN_TX_EQ_GN_SETTINGS_EXT    = 0x48,
 };
@@ -406,6 +415,14 @@ enum {
 	UFS_DEV_WB_BUF_RESIZE	= BIT(0),
 };
 
+/* Possible values for bWriteBoosterBufferPartialFlushMode */
+enum wb_partial_flush_mode {
+	WB_PARTIAL_FLUSH_NONE		= 0,
+	WB_PARTIAL_FLUSH_FIFO		= 1,
+	WB_PARTIAL_FLUSH_PINNED		= 2,
+	NUM_WB_PARTIAL_FLUSH_MODES	= 3,
+};
+
 /* Possible values for dExtendedUFSFeaturesSupport */
 enum {
 	UFS_DEV_HIGH_TEMP_NOTIF		= BIT(4),
-- 
2.56.0.611.g1030f0b940-goog

