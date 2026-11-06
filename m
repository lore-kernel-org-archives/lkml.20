Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975076;
	b=rXpI97V8iC6RtHG5Q9kVepYKBDqj/8U21rGVlqS4iyyiDK+Dz21bQtiXrCdybZAdVg8h
	 +IPkqyXT2VBb8dG++aFgTqcF8XiQHn8Kst+uLUb0YlwtoxHIilsGxDlk7baw9/rkuJmCp
	 GmmRiVIOlSwJLlrc6HFd9K72x99unxVE9sZnefZL3PZ9uCfJQroLK0TuoQVjqBAd/t5eh
	 njl3/MJDZUA7f95OgAA1QmbOVHXBMHA/aA0J01PmubPOzob0ZGuuHJFwlswGBgXs49fcM
	 0OzkofPsZmw+ItBz4fxfCmV81LO+846n8kExOX6slVF7Eo7+DVEwLv46bCE3Dd/KrBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975076;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RsbAWx9awItnmsEqL9HYois8DVnWjcJlTRdDarpJQQA=;
	b=0OAErL/0o4yUYOMu9KikaY6rrZ9J9MHT09Nc4bxiwuyv5irs1ywsmFQkXhXFYg6QGiyy
	 F+pPeQKocHRmNqOtP+M6LM25PDmTcVHkhhEPaGdwdBwhNSgAImdHf3iarsNHRb9DluFff
	 jlR8KoxVqmzyglmaeX5oCGvVnZLTAoTwGHfvDcQ33fiEq08Sc9967GTLP20blkq4fXfqk
	 tiMHGMyj/L76q9xAzvtCcUaSjFzVDLfBsg823DzZzaxZcusuV910Dp9v59JCIkR7ws60N
	 creLKJRCrw/7tWyFKCUI3dnajzCAdSxdmYgWZhMolpUqp4LDudY/yqjq4NJf34bsIhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e1bjef56;
	arc=none smtp.remote-ip=95.215.58.25
Received: from mta1.migadu.com (out-25.mta1.migadu.com [95.215.58.25])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66790606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66790606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e1bjef56
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YAScMz4ejAKdcpVdDrYVuObuSfODYXDwzmYPYxxPwIk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793975073; v=1; x=1794579873;
 b=e1bjef561g2q4uILu7kdQCRCUyqiY+shmaFrJpfkjcYwDnkY19ZD/uVkaydG36cvYhaEdT/a
 hx/RmwL+oZ8g7bSYTDgZ84cq6bvvmFd+WDsHrBATNbxRki+QSYqW06QGRyTAQKq3pWSHfUmQ59P
 +hVggMd5O767n6qzm0TZfZpM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d369fee6376b602d;
	Fri, 06 Nov 2026 14:24:33 +0000
X-Mizu-Trace-ID: d369fee6376b602d
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	"Benjamin Tissoires" <bentiss@kernel.org>,
	"Jiri Kosina" <jikos@kernel.org>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v14 10/18] HID: asus: add support for gamepad mode
Date: Fri,  6 Nov 2026 14:23:26 +0000
Message-ID: <20261106142334.1881-11-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106142334.1881-1-denis.benato@linux.dev>
References: <20261106142334.1881-1-denis.benato@linux.dev>
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
controller mode via the gamepad_mode sysfs property.

Also list available models with gamepad_mode_index to align with
other handheld drivers.

Co-developed-by: Luke Jones <luke@ljones.dev>
Signed-off-by: Luke Jones <luke@ljones.dev>
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/hid/hid-asus.c | 130 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index bb3475a038b8..cf33ccefcc2b 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -374,6 +374,20 @@ enum ally_command_codes {
 	CMD_SET_ANTI_DEADZONE           = 0x18,
 };
 
+enum ally_gamepad_mode_index {
+	ALLY_GAMEPAD_MODE_GAMEPAD = 0x01,
+	ALLY_GAMEPAD_MODE_KEYBOARD = 0x02,
+};
+
+static const char *const ally_gamepad_mode_text[] = {
+	"gamepad", "desktop"
+};
+
+static const u8 ally_gamepad_mode_value[] = {
+	ALLY_GAMEPAD_MODE_GAMEPAD,
+	ALLY_GAMEPAD_MODE_KEYBOARD
+};
+
 /* Rumble magnitudes use the hardware's 0..100 intensity range. */
 #define ALLY_FF_MAX_INTENSITY 100
 
@@ -1387,6 +1401,112 @@ static struct device_attribute dev_attr_right_joystick_outer_threshold =
 static struct device_attribute dev_attr_right_joystick_outer_threshold_range =
 	__ATTR(outer_threshold_range, 0444, right_joystick_outer_threshold_range_show, NULL);
 
+/**
+ * ally_set_gamepad_mode() - Set the gamepad operating mode
+ * @hdev: HID device the command packet is sent on
+ * @mode: %ALLY_GAMEPAD_MODE_GAMEPAD or %ALLY_GAMEPAD_MODE_KEYBOARD
+ *
+ * Context: Caller holds ally_prefs.lock.
+ * Return: 0 on success, negative errno on failure.
+ */
+static int ally_set_gamepad_mode(struct hid_device *hdev, u8 mode)
+{
+	const u8 payload[] = { mode };
+	size_t buf_len;
+	int ret;
+
+	if (mode < ALLY_GAMEPAD_MODE_GAMEPAD || mode > ALLY_GAMEPAD_MODE_KEYBOARD) {
+		hid_err(hdev, "Invalid gamepad mode: %u\n", mode);
+		return -EINVAL;
+	}
+
+	u8 *buf __free(kfree) = ally_alloc_cmd(hdev, CMD_SET_GAMEPAD_MODE,
+					       payload, sizeof(payload),
+					       &buf_len);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = ally_gamepad_send_packet(hdev, buf, buf_len);
+	if (ret < 0) {
+		hid_err(hdev, "Failed to set gamepad mode: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static ssize_t gamepad_mode_show(struct device *dev, struct device_attribute *attr,
+				 char *buf)
+{
+	u8 mode_byte;
+	int i;
+
+	guard(mutex)(&ally_prefs.lock);
+
+	mode_byte = ally_prefs.gamepad_mode;
+	for (i = 0; i < ARRAY_SIZE(ally_gamepad_mode_value); i++) {
+		if (ally_gamepad_mode_value[i] == mode_byte)
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
+	u8 mode_byte;
+	int mode, ret;
+
+	mode = sysfs_match_string(ally_gamepad_mode_text, buf);
+	if (mode < 0)
+		return mode;
+
+	/* The text index maps to the byte the MCU accepts. */
+	mode_byte = ally_gamepad_mode_value[mode];
+
+	scoped_guard(mutex, &ally_prefs.lock) {
+		ret = ally_set_gamepad_mode(hdev, mode_byte);
+		if (ret < 0)
+			return ret;
+
+		ally_prefs.gamepad_mode = mode_byte;
+	}
+
+	hid_dbg(hdev, "Set gamepad mode to %s\n", ally_gamepad_mode_text[mode]);
+	sysfs_notify(&dev->kobj, NULL, "gamepad_mode");
+
+	return count;
+}
+
+static ssize_t gamepad_mode_index_show(struct device *dev,
+					   struct device_attribute *attr, char *buf)
+{
+	ssize_t len = 0;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ally_gamepad_mode_text); i++) {
+		if (!ally_gamepad_mode_text[i] || ally_gamepad_mode_text[i][0] == '\0')
+			continue;
+
+		len += sysfs_emit_at(buf, len, "%s ", ally_gamepad_mode_text[i]);
+	}
+
+	/* Replace the last space with a newline. */
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
  * ally_set_anti_deadzone() - Send the joystick anti-deadzone values to the device
  * @hdev: HID device the packet is sent on
@@ -2004,6 +2124,8 @@ static const struct attribute_group *const ally_cal_attr_groups[] = {
 
 static struct attribute *ally_config_attrs[] = {
 	&dev_attr_xbox_controller.attr,
+	&dev_attr_gamepad_mode.attr,
+	&dev_attr_gamepad_mode_index.attr,
 	NULL
 };
 
@@ -2039,7 +2161,7 @@ static int ally_prefs_setup(struct hid_device *hdev, struct ally_intf *intf)
 
 	scoped_guard(mutex, &ally_prefs.lock) {
 		if (!ally_prefs.initialized) {
-			ally_prefs.gamepad_mode = 0x01;
+			ally_prefs.gamepad_mode = ALLY_GAMEPAD_MODE_GAMEPAD;
 			ally_prefs.xbox_controller_enabled = true;
 			ally_prefs.initialized = true;
 		}
@@ -2473,6 +2595,12 @@ static int hid_asus_ally_init(struct hid_device *hdev)
 			hid_warn(hdev, "Failed to restore right response curve: %d\n", ret);
 	}
 
+	if (ally_prefs.initialized) {
+		ret = ally_set_gamepad_mode(hdev, ally_prefs.gamepad_mode);
+		if (ret < 0)
+			hid_warn(hdev, "Failed to restore gamepad mode: %d\n", ret);
+	}
+
 	return 0;
 }
 
-- 
2.47.3

