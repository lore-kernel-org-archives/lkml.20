Received: from mta1.migadu.com (out-72.mta1.migadu.com [95.215.58.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93680599A2A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889495; cv=none; b=eKPiW6Juady5hYe3723byI0i2kHpY5d8MqPp3LUgY35/U2IgUEKiM2f9DoOjH7pKGKYFZ0sP7g8TRc5uCG1XaS0oze/7feB2rva9BmDLk3eDQdRA8LaD0pyp5TPLjXZVg6isu7kMRdUSkEpOZoUnlajsSvlmkH0lwYRi4/7As8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889495; c=relaxed/simple;
	bh=shS8wJQrB4HWz/U934t8cM7y9gfZ75UCzUXY0q78QD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aMu6t/USCaC4qxhuilKDvrJKXrscKCM6skprhrhiMuUl4OP2YbABzOFoVPlT+cbIy+ijpU2DWbZ0tcUQ7QbZGAUYTYfOfzCVpFT6hIcReO5WHOqweUAqtn/06FVGx1Iu9B+laNsyDnYGjLTKMWrQBfcsq+zXwkqr+4UulpzuYzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kRy6nQ2D; arc=none smtp.client-ip=95.215.58.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kRy6nQ2D"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=shS8wJQrB4HWz/U934t8cM7y9gfZ75UCzUXY0q78QD0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788889491; v=1; x=1789494291;
 b=kRy6nQ2DyX/kkdL6TmTdTvdyDor4u7pls8ejCJgjcTegpg+09SxTHhKIwP0ffK2Iy78r3oiQ
 2ddFfSDbtrr+m6xEmNQ42XtTJYo9NNVjIsk5jxyp0s1kcNZCc8uLy6uiHlbf8EcLvKgFg9JLClI
 4ZrlfhXRDCnqgZ4ko5vvKrnU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3ca9f3d7e4d2c48b;
	Tue, 08 Sep 2026 17:44:51 +0000
X-Mizu-Trace-ID: 3ca9f3d7e4d2c48b
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	"Benjamin Tissoires" <bentiss@kernel.org>,
	"Jiri Kosina" <jikos@kernel.org>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schwartz" <matthew.schwartz@linux.dev>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Jonathan LoBue" <jlobue10@gmail.com>,
	"Khamunetri Clark" <khamunetriclark@gmail.com>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v6 05/13] HID: asus: add vibration strength configuration
Date: Tue,  8 Sep 2026 17:44:25 +0000
Message-ID: <20260908174433.74260-6-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908174433.74260-1-denis.benato@linux.dev>
References: <20260908174433.74260-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ASUS ROG Ally handhelds support the vibration strength to be configured:
add sysfs attributes to allow userspace configure motors vibration
intensity.

Assisted-by: opencode:glm-5.2
Signed-off-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Luke Jones <luke@ljones.dev>
---
 drivers/hid/hid-asus.c | 195 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index ac0c0a176857..866fb82b7d7d 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -206,6 +206,10 @@ struct ally_config {
 	u8 left_trigger_max;
 	u8 right_trigger_min;
 	u8 right_trigger_max;
+
+	/* Vibration settings */
+	u8 vibration_intensity_left;
+	u8 vibration_intensity_right;
 };
 
 /*
@@ -827,15 +831,193 @@ static ssize_t xbox_controller_store(struct device *dev,
 
 static DEVICE_ATTR_RW(xbox_controller);
 
+/**
+ * ally_set_vibration_intensity() - Set vibration intensity values
+ * @ally: ally handheld structure
+ * @hdev: HID device
+ * @left: Left motor intensity (0-100)
+ * @right: Right motor intensity (0-100)
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static int ally_set_vibration_intensity(struct ally_handheld *ally,
+					struct hid_device *hdev, u8 left, u8 right)
+{
+	const u8 data[] = { left, right };
+	int ret;
+
+	u8 *buf __free(kfree) = ally_alloc_cmd(CMD_SET_VIBRATION_INTENSITY, data, sizeof(data));
+	if (!buf)
+		return -ENOMEM;
+
+	ret = ally_gamepad_send_packet(ally, hdev, buf, ROG_ALLY_REPORT_SIZE);
+	if (ret < 0) {
+		hid_err(hdev, "Failed to set vibration intensity: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static ssize_t left_vibration_intensity_show(struct device *dev, struct device_attribute *attr,
+					     char *buf)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
+	struct ally_handheld *ally = drvdata->rog_ally;
+	struct ally_config *cfg;
+
+	if (!ally)
+		return -ENODEV;
+
+	cfg = ally_get_config(ally);
+	if (!cfg)
+		return -ENODEV;
+
+	guard(mutex)(&cfg->config_mutex);
+
+	return sysfs_emit(buf, "%u\n", cfg->vibration_intensity_left);
+}
+
+static ssize_t left_vibration_intensity_store(struct device *dev, struct device_attribute *attr,
+					      const char *buf, size_t count)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
+	struct ally_handheld *ally = drvdata->rog_ally;
+	struct ally_config *cfg;
+	u8 value;
+	int ret;
+
+	if (!ally)
+		return -ENODEV;
+
+	cfg = ally_get_config(ally);
+	if (!cfg)
+		return -ENODEV;
+
+	ret = kstrtou8(buf, 10, &value);
+	if (ret || value > 100)
+		return -EINVAL;
+
+	guard(mutex)(&cfg->config_mutex);
+
+	ret = ally_set_vibration_intensity(ally, hdev, value,
+					   cfg->vibration_intensity_right);
+	if (ret < 0)
+		return ret;
+
+	cfg->vibration_intensity_left = value;
+
+	return count;
+}
+
+static ssize_t left_vibration_intensity_range_show(struct device *dev,
+						   struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0 100\n");
+}
+
+static ssize_t right_vibration_intensity_show(struct device *dev, struct device_attribute *attr,
+					      char *buf)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
+	struct ally_handheld *ally = drvdata->rog_ally;
+	struct ally_config *cfg;
+
+	if (!ally)
+		return -ENODEV;
+
+	cfg = ally_get_config(ally);
+	if (!cfg)
+		return -ENODEV;
+
+	guard(mutex)(&cfg->config_mutex);
+
+	return sysfs_emit(buf, "%u\n", cfg->vibration_intensity_right);
+}
+
+static ssize_t right_vibration_intensity_store(struct device *dev, struct device_attribute *attr,
+					       const char *buf, size_t count)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
+	struct ally_handheld *ally = drvdata->rog_ally;
+	struct ally_config *cfg;
+	u8 value;
+	int ret;
+
+	if (!ally)
+		return -ENODEV;
+
+	cfg = ally_get_config(ally);
+	if (!cfg)
+		return -ENODEV;
+
+	ret = kstrtou8(buf, 10, &value);
+	if (ret || value > 100)
+		return -EINVAL;
+
+	guard(mutex)(&cfg->config_mutex);
+
+	ret = ally_set_vibration_intensity(ally, hdev,
+					   cfg->vibration_intensity_left, value);
+	if (ret < 0)
+		return ret;
+
+	cfg->vibration_intensity_right = value;
+
+	return count;
+}
+
+static ssize_t right_vibration_intensity_range_show(struct device *dev,
+						    struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0 100\n");
+}
+
+static struct device_attribute dev_attr_left_vibration_intensity =
+	__ATTR(intensity, 0644, left_vibration_intensity_show, left_vibration_intensity_store);
+
+static struct device_attribute dev_attr_left_vibration_intensity_range =
+	__ATTR(intensity_range, 0444, left_vibration_intensity_range_show, NULL);
+
+static struct device_attribute dev_attr_right_vibration_intensity =
+	__ATTR(intensity, 0644, right_vibration_intensity_show, right_vibration_intensity_store);
+
+static struct device_attribute dev_attr_right_vibration_intensity_range =
+	__ATTR(intensity_range, 0444, right_vibration_intensity_range_show, NULL);
+
 static struct attribute *ally_config_attrs[] = {
 	&dev_attr_xbox_controller.attr,
 	NULL
 };
 
+static struct attribute *ally_left_vibration_attrs[] = {
+	&dev_attr_left_vibration_intensity.attr,
+	&dev_attr_left_vibration_intensity_range.attr,
+	NULL
+};
+
+static struct attribute *ally_right_vibration_attrs[] = {
+	&dev_attr_right_vibration_intensity.attr,
+	&dev_attr_right_vibration_intensity_range.attr,
+	NULL
+};
+
 static const struct attribute_group ally_attr_groups[] = {
 	{
 		.attrs = ally_config_attrs,
 	},
+	{
+		.name = "left_vibration",
+		.attrs = ally_left_vibration_attrs,
+	},
+	{
+		.name = "right_vibration",
+		.attrs = ally_right_vibration_attrs,
+	},
 };
 
 /**
@@ -880,6 +1062,8 @@ static struct ally_config *ally_config_create(struct hid_device *hdev, struct al
 		cfg->left_outer_threshold = 90;
 		cfg->right_deadzone = 10;
 		cfg->right_outer_threshold = 90;
+		cfg->vibration_intensity_left = 100;
+		cfg->vibration_intensity_right = 100;
 	}
 
 	spin_lock_irqsave(&ally_data_lock, flags);
@@ -1213,6 +1397,17 @@ static int hid_asus_ally_init(struct hid_device *hdev, struct ally_handheld *all
 				 ret);
 	}
 
+	/*
+	 * The MCU does not keep the vibration intensity across a reset:
+	 * send the recorded values again, whichever interface probed.
+	 */
+	ret = ally_set_vibration_intensity(ally, hdev,
+					   cfg->vibration_intensity_left,
+					   cfg->vibration_intensity_right);
+	if (ret < 0)
+		hid_warn(hdev, "Failed to restore vibration intensity: %d\n",
+			 ret);
+
 	return 0;
 }
 
-- 
2.47.3

