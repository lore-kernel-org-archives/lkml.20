Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792972377;
	b=DoW7XOks43NpxDIWgA1c/vVhVxlW9XwaU8ccq+gUog/+F/ucvjBEi5eN8ImUSc8uswoP
	 ajgCnWiGu8i5qQmLs4f+LGu2pDPI/tGo4KX22TWH8gUxLBP83/MISMWVvSb0rI9fKi9F7
	 2xtNRL7LpcG1rCjIkygZVXufPrslojRuOaYqbQW+Cx1+2wuUHeAye/fVTRbKjH9v/55ug
	 Yuwvr4QmGJsvHlVFNSn00IQwVKjQwsJD7o6RnjFk/a6N9a3TpKus+9zCk/ZLmQzqevuk/
	 i2vv2/cWhCiJbdBGnpttcRAbj7AQfCaW1b3vSUahuNEC9ZDXVmWucgB4Gc/zbgTEoTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792972377;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2sQ9RggWB/FTjatjDyMh4VbIMnJ141FdxXeEeGqLh5c=;
	b=FWEus3JQGsza1zkGt0k+F2idE8rfQnegW49pFyzXluJMtxVZeFGMSGDCmTNl6Ub4TAUT
	 5RIIQ2ItlMiThKh/53zvwZTu4V+DVqSPFUuS/olNBtbHIjLb1nibDxlIkVfLIqM1b099P
	 xfZVTKqTfLZq3HPTgzAB6DXnxs+z5I6qu2X1gKi4MFZeNxUW7DwtVMQrB/d2wQ8UqU8OM
	 eQXAnk4G+THPb/p4a3x6UGKj3rEZeAQr/HCYS4Et75QixFBRblb2xX1OM8qoSrZwHL8eo
	 L/NhoGgjGQcKoF5ZxDRtSIXo+baLQD3YzJWnh2cwB37SYK6VnN7apFu6hcYNXjVJJCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OJw80wfJ;
	arc=none smtp.remote-ip=95.215.58.76
Received: from mta1.migadu.com (out-76.mta1.migadu.com [95.215.58.76])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BC960A2607
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85BC960A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OJw80wfJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=agJX0UORfZ7K87twI6B8Dr10FbZXl+OJkbodJzQIlEo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792972374; v=1; x=1793577174;
 b=OJw80wfJ/RAhmPnQEhekS1gpQgciFqi7blNHoFLA1mtjOcioJEFMSGL0IOg/sd7qVNtoPo0I
 eAN93l1atCluszawVPgWRsk/0/kVOyeZZIcB5xDXQ9LmaQkhSuB9ytdA4fx3kQBnmYnWnOaeQLP
 8oxj0q5WPMQ6oZ19M5+baOsM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fea364409dc63dba;
	Sun, 25 Oct 2026 23:52:54 +0000
X-Mizu-Trace-ID: fea364409dc63dba
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	"Benjamin Tissoires" <bentiss@kernel.org>,
	"Jiri Kosina" <jikos@kernel.org>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schwartz" <matthew.schwartz@linux.dev>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Jonathan LoBue" <jlobue10@gmail.com>,
	"Khamunetri Clark" <khamunetriclark@gmail.com>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	"Joshua Leivenzon" <hacker1024@users.sourceforge.net>,
	"Nathan Chancellor" <nathan@kernel.org>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	"Ivan Levchenko" <me@livan.pro>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v11 09/18] HID: asus: add support for gamepad mode
Date: Sun, 25 Oct 2026 23:52:22 +0000
Message-ID: <20261025235232.129945-10-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025235232.129945-1-denis.benato@linux.dev>
References: <20261025235232.129945-1-denis.benato@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ROG Ally devices can emulate either a mouse+keyboard (desktop mode)
or an gamepad device (xbox360 controller in ROG ally and a custom
DInput device on newer models): add support for switching the current
controller mode.

Signed-off-by: Luke Jones <luke@ljones.dev>
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/hid/hid-asus.c | 158 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 157 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index a3a21a1493aa..fae5f36a9fa6 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -198,6 +198,11 @@ struct ally_joystick_resp_curve {
 	struct ally_joystick_resp_curve_param entry_4;
 } __packed;
 
+enum ally_gamepad_mode_index {
+	ALLY_GAMEPAD_MODE_GAMEPAD = 0x01,
+	ALLY_GAMEPAD_MODE_KEYBOARD = 0x02,
+};
+
 struct ally_config {
 	/* Must be locked if the data is being changed */
 	struct mutex config_mutex;
@@ -411,6 +416,15 @@ enum ally_command_codes {
 /* XInput rumble magnitudes use the hardware's 0..100 intensity range. */
 #define ALLY_FF_MAX_INTENSITY 100
 
+static const char *const ally_gamepad_mode_text[] = {
+	"gamepad", "desktop"
+};
+
+static const u8 ally_gamepad_mode[] = {
+	ALLY_GAMEPAD_MODE_GAMEPAD,
+	ALLY_GAMEPAD_MODE_KEYBOARD
+};
+
 static const u8 ALLY_FORCE_FEEDBACK_OFF[] = {
 	0x0D, 0x0F, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xEB
 };
@@ -930,6 +944,137 @@ static ssize_t xbox_controller_store(struct device *dev,
 
 static DEVICE_ATTR_RW(xbox_controller);
 
+/**
+ * ally_set_gamepad_mode() - Set the gamepad operating mode
+ * @ally: ally handheld structure
+ * @hdev: HID device
+ * @mode: gamepad mode to set
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static int ally_set_gamepad_mode(struct ally_handheld *ally, struct hid_device *hdev, u8 mode)
+{
+	u8 payload[] = { mode };
+	int ret;
+
+	if (mode < ALLY_GAMEPAD_MODE_GAMEPAD ||
+	    mode > ALLY_GAMEPAD_MODE_KEYBOARD) {
+		hid_err(hdev, "Invalid gamepad mode: %u\n", mode);
+		return -EINVAL;
+	}
+
+	u8 *buf __free(kfree) = ally_alloc_cmd(CMD_SET_GAMEPAD_MODE, payload, sizeof(payload));
+	if (!buf)
+		return -ENOMEM;
+
+	ret = ally_gamepad_send_packet(ally, hdev, buf, ROG_ALLY_REPORT_SIZE);
+	if (ret < 0) {
+		hid_err(hdev, "Failed to set gamepad mode: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static ssize_t gamepad_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
+	struct ally_handheld *ally = drvdata->rog_ally;
+	struct ally_config *cfg;
+	u8 mode_byte;
+	int i;
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
+	mode_byte = cfg->gamepad_mode;
+
+	for (i = 0; i < ARRAY_SIZE(ally_gamepad_mode); i++) {
+		if (ally_gamepad_mode[i] == mode_byte)
+			return sysfs_emit(buf, "%s\n", ally_gamepad_mode_text[i]);
+	}
+
+	/*
+	 * The recorded mode only comes from the table above: an unknown
+	 * byte means memory corruption, not a userspace-visible value.
+	 */
+	return -EIO;
+}
+
+static ssize_t gamepad_mode_store(struct device *dev, struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
+	struct ally_handheld *ally = drvdata->rog_ally;
+	struct ally_config *cfg;
+	u8 mode_byte;
+	int mode;
+	int ret;
+
+	if (!ally)
+		return -ENODEV;
+
+	cfg = ally_get_config(ally);
+	if (!cfg)
+		return -ENODEV;
+
+	mode = sysfs_match_string(ally_gamepad_mode_text, buf);
+	if (mode < 0) {
+		hid_err(hdev, "Unknown gamepad mode\n");
+		return mode;
+	}
+
+	/* Convert the index of the text mode array to the byte
+	 * that will be accepted by the ally MCU.
+	 */
+	mode_byte = ally_gamepad_mode[mode];
+
+	guard(mutex)(&cfg->config_mutex);
+
+	ret = ally_set_gamepad_mode(ally, hdev, mode_byte);
+	if (ret < 0)
+		return ret;
+
+	cfg->gamepad_mode = mode_byte;
+
+	hid_dbg(hdev, "Set gamepad mode to %s\n", ally_gamepad_mode_text[mode]);
+
+	sysfs_notify(&dev->kobj, NULL, "gamepad_mode");
+
+	return count;
+}
+
+static ssize_t gamepad_mode_index_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
+{
+	int i;
+	ssize_t len = 0;
+
+	for (i = 0; i < ARRAY_SIZE(ally_gamepad_mode_text); i++) {
+		if (!ally_gamepad_mode_text[i] || ally_gamepad_mode_text[i][0] == '\0')
+			continue;
+		len += sysfs_emit_at(buf, len, "%s ", ally_gamepad_mode_text[i]);
+	}
+
+	/* Replace the last space with a newline */
+	if (len > 0)
+		buf[len - 1] = '\n';
+
+	return len;
+}
+
+static DEVICE_ATTR_RW(gamepad_mode);
+static DEVICE_ATTR_RO(gamepad_mode_index);
+
 /**
  * ally_set_vibration_intensity() - Set vibration intensity values
  * @ally: ally handheld structure
@@ -2217,6 +2362,8 @@ static struct device_attribute dev_attr_right_response_curve_index =
 
 static struct attribute *ally_config_attrs[] = {
 	&dev_attr_xbox_controller.attr,
+	&dev_attr_gamepad_mode.attr,
+	&dev_attr_gamepad_mode_index.attr,
 	NULL
 };
 
@@ -2356,7 +2503,7 @@ static struct ally_config *ally_config_create(struct hid_device *hdev, struct al
 	}
 
 	if (!cfg->initialized) {
-		cfg->gamepad_mode = 0x01;
+		cfg->gamepad_mode = ALLY_GAMEPAD_MODE_GAMEPAD;
 		cfg->xbox_controller_enabled = true;
 		cfg->left_deadzone = 10;
 		cfg->left_outer_threshold = 90;
@@ -2926,6 +3073,15 @@ static int hid_asus_ally_init(struct hid_device *hdev, struct ally_handheld *all
 				 ret);
 	}
 
+	/*
+	 * An MCU reset switches the gamepad mode back to its default:
+	 * send the recorded one first, so that every other setting
+	 * restored below is applied on top of the expected mode.
+	 */
+	ret = ally_set_gamepad_mode(ally, hdev, cfg->gamepad_mode);
+	if (ret < 0)
+		hid_warn(hdev, "Failed to restore gamepad mode: %d\n", ret);
+
 	/*
 	 * The MCU does not keep the vibration intensity across a reset:
 	 * send the recorded values again, whichever interface probed.
-- 
2.47.3

