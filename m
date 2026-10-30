Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793344122;
	b=hddJK3RyWW3j2kyQFNjF+f0kUm2sLnajI+ClWlSFMfIh2PwMGOsW3Uf5rEYeQ8TSh0Qt
	 NU7DrrkL6ENBpSUUmdhkxNEn8JOBBvPLrmOmYMpfPZceb2GZIXKsDHGy8/3Uj5FNuFZ3n
	 GfzjU4Tu6cv1wkY+O4Tqbs9tGUAXtWPZyO5EzmeOjCSK8ethSo2eO9wyi41xiin6GV4Ad
	 n1AP3m1e7qCu137X89OJC05ntHWar+3kgbXsvEGuONCAu+zOSZznC8H3ejRxLj8pvRFlw
	 Sw8c3H4abSHmxudcOJgorJeU2ByceJ5Xx/XYzwgGtZ0FOtgF5ihuLaWq4oBnPQQTASg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793344122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mHd/Wr3BFH8QFtsPeQilYKemQuojRmVOWieDBcVZcE8=;
	b=D8ku4Rx/E48OO2A6ctw+6ogjF58MM5Gr4Q5vHEV6Cm4JHGktyAojGCOpUKx1HrzAOb7h
	 WAurlFBpFS1Rf5duQJ+n0tZPN22VsW5zUAjhKIBV28PH8rxVd8wP84tOuNMRXT9XjWTXZ
	 atP3+4VYNJ/MR/C7c7gqy/IHugYMAIcDnVPAEAm/nh1mLEJvEREHIM04HN2fGlwZiu07S
	 wPHRQOaOrMUv04MQqXV8hVBoB48dV5gsgOtMuWmj65HWnD3fdbqyRMCSmFT+TIr0QRQ5P
	 5t5lRXaiHjO6G8cIlL1+aoG6jZsZgNTqeVgcbJhfvE6Pdz7f2E+U2SbtT8Xhdf9gvyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kc7jdnZC;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36229606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36229606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kc7jdnZC
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e47347279so175230f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793344120; x=1793948920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHd/Wr3BFH8QFtsPeQilYKemQuojRmVOWieDBcVZcE8=;
        b=Kc7jdnZCdv4SlnsrVznX30ADusJK02ouRndqH+v9CwGQ0VPn/uZI4OLLREFkpiHlR7
         6F4bqzoq60uwZIuu1FPzRUeWaf+zGatfkLByJF5VcW9WB4OdKUfJ2y4EgnNm1ll6cGtU
         z44iLg3aGtFNLuAb5LzPa3b1aZnrXUp1HTbIA4nXbICk0asvbEjdWkpivTB5Az3AHPAf
         TmCiJ4A9a1evNOrPOOeMg7tSlhQPFuRFAiDiK2wuAAT+LuVC8MgxQRXYHxZRALmlFoi8
         yr/w/Nae+Ihq77PTEvrJntqEfaocPkFgfDi1JgaHfxdboGi9fWliemP1mnRakHbdB7nO
         CjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793344120; x=1793948920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHd/Wr3BFH8QFtsPeQilYKemQuojRmVOWieDBcVZcE8=;
        b=QebV/pBXRUG/EOzRYcXl0OsN2PgcU1bnyZFV7tQqeLJZGM9sctJ2k3DklMbQ2UgGRx
         i32k2Q/cQ5TNo1a5yU8m8dk5L7k5iN20R7888ASnPpY9QuxLd5Lp6J+8jMt0TEEBm5/k
         ZF++iWDd62jfLj+tQUJxap4wzK9jggPAdbDXvMAQ2gtRFYbXiIJw/dng+rjNS+WRIpu1
         U2DKO5o7N+8H98CBE7TAVhY3PHF3k4GH/GjWD97tV8xR+b3PSBDtLnnsySPeOCUneWDp
         o6k1UCq11zImaB7ESWQAHy6Jyisb1zDd5fuBX0J4xrPyPiedj9vjjEJWvlE4209yGE9B
         h6Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwHSI5s7xLzMspVTFPo8MfHpeqPSrIIsg65urGF6N12TOHRWSKZM/UofRfjkhn7owxbKPzeOxbrzIp1qOk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiTTryvl0bUk/ELFlWXNbnb1u0myw0xIwONV8y9AHyAzf3KOGA
	W5O/vB9hQenrysWZfCFxr0WurC82QzXqC5arnqKzGxq6J7em0lvH03a+
X-Gm-Gg: AYBFou1Jx6eaetL9fZAWUqx+GaL2zuDKDpfR8ubKVqLAFBpmGp1nw/GVnqtkidkhh7G
	CAys5KuTHh9A4cznIaBaFf0+olV4s+oqdIvdokBuby7C6qtimOR8+m2U7/qk6p9rOuHKQ/SIsps
	EGwegblVEQa65o4LNWBsfaF6kVOuQezBzCdrZTEslYgXh8H2/U5O0smgPS3rAlA3VDRQP+rt06u
	N5yOOHbp4yb1XlZCfnO2aC84ij6PNbwF/f+DQKvQmRxWmx4LRiipY5FliMno4xzb0HMzaBQRHGq
	STmFbaA1nYUbwxVnrxPJ2vqXcLV2Cn6P7qEwlwzphBt1fVLnRGWqFMzVrjbT5gA4orujFVs72rS
	CK9OF62JMdtTqhglYZXlWCm5y5nD2aGkhkROYfxc34nLPWbYz3/dDrk1Zx8cRVV6OFm4dIKIbEx
	/yfFEyqRpFUSKYPvrAroWDGgparR2CegSSVLreZOvOKIxHHTOc7x8De2Fa4uegnUbtkzgNs0hva
	0TEBuNWp2evvAWa2mf1h2nIUI93Yru/e5/bELqMyLxkXZhSQDWOHnQzidYYJ8bv1YGdZO3aBfpG
	li8+JBqH0lcCeT28Bgs0IXgxsDX1NnI1+F//I7uzrs8VqID6znfnpClwfY4IlyZSXEsZrmS0
X-Received: by 2002:a05:6000:2c01:b0:48e:6dd5:30d0 with SMTP id ffacd0b85a97d-48e6e504e6emr3441527f8f.53.1793344120319;
        Fri, 30 Oct 2026 00:08:40 -0700 (PDT)
Received: from ahmad-HP-ZBook-17-G3 ([5.212.7.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm1700069f8f.14.2026.10.30.00.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:08:39 -0700 (PDT)
From: ahmad baghereslami <ahmad.b1995@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ahmad baghereslami <ahmad.b1995@gmail.com>
Subject: [PATCH] Input: synaptics - support the touchpad LED on RMI function $30
Date: Fri, 30 Oct 2026 10:38:21 +0330
Message-ID: <20261030070821.1716595-1-ahmad.b1995@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Some HP laptops have an LED in the top left corner of the Synaptics
touchpad that HP's Windows driver lights while the touchpad is disabled
(double tap on that corner). On the HP ZBook 17 G3 (SYN3040, TM2706-002)
the LED is not driven through the PS/2 deluxe LED command: the Windows
driver (SynTP.sys 19.0.19.68) switches the touchpad to RMI register
access over PS/2 with mode byte 0x7f, looks up function $30 (GPIO/LED)
in the page description table and sets the LED bit in its control
register:

  register write:  SetScale 2:1, SetRate <reg>, SetRate <value>
  register read:   SetScale 2:1, SetRate <reg>, GetInfo (first byte)

For touchpads in a new rmi_led_pnp_ids list, look up the F30 LED this
way when the touchpad is set up and register a
synaptics::touchpad_disabled LED class device. Setting it deactivates
the touchpad, writes the F30 registers and restores the mode byte, which
leaves RMI access. The LED is restored after reconnect.

On this touchpad F30 is on page 1 with control base 0x55 and four
GPIO/LED pins; the LED is bit 3 of control register 0x59 and its
brightness register is 0x5f.

Tested on an HP ZBook 17 G3 with Ubuntu's 7.0.0 kernel: the LED follows
writes to its brightness file, the touchpad and the pointing stick keep
working, and a userspace helper that turns the touchpad off on a double
tap in the corner keeps the LED in step with GNOME's touchpad setting.

Reading HP's Windows driver (Ghidra) and writing this patch were done
with the help of an AI coding assistant (Claude); I tested the LED and
the touchpad on the machine.

Signed-off-by: ahmad baghereslami <ahmad.b1995@gmail.com>
---
 drivers/input/mouse/synaptics.c | 241 ++++++++++++++++++++++++++++++++
 drivers/input/mouse/synaptics.h |  13 ++
 2 files changed, 254 insertions(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index b007e642e..bf1c6c738 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -589,6 +589,236 @@ static int synaptics_set_advanced_gesture_mode(struct psmouse *psmouse)
 	return 0;
 }
 
+/*
+ * Some HP touchpads have an LED in the top left corner that HP's Windows
+ * driver lights while the touchpad is disabled. It is wired to RMI function
+ * $30 (GPIO/LED), which these touchpads also expose over PS/2: mode byte 0x7f
+ * switches them to RMI register access, where SetScale 2:1 followed by two
+ * SetRate commands writes a register, and SetScale 2:1, SetRate and GetInfo
+ * read one. Setting the normal mode byte again leaves RMI access.
+ */
+static const char * const rmi_led_pnp_ids[] = {
+	"SYN3040", /* HP ZBook 17 G3 */
+	NULL
+};
+
+#define SYN_RMI_MODE			0x7f
+#define SYN_RMI_PAGE_SELECT		0xff
+#define SYN_RMI_PDT_START		0xee
+#define SYN_RMI_PDT_END			0x0b
+#define SYN_RMI_PDT_ENTRY_SIZE		6
+#define SYN_RMI_NUM_PAGES		4
+#define SYN_RMI_F30			0x30
+#define SYN_RMI_F30_HAS_LED		BIT(2)
+#define SYN_RMI_F30_HAS_GPIO		BIT(3)
+#define SYN_RMI_LED_BRIGHTNESS		0x0b	/* as set by HP's Windows driver */
+
+static int synaptics_rmi_write(struct psmouse *psmouse, u8 reg, u8 val)
+{
+	struct ps2dev *ps2dev = &psmouse->ps2dev;
+	int error;
+
+	error = ps2_command(ps2dev, NULL, PSMOUSE_CMD_SETSCALE21);
+	if (error)
+		return error;
+
+	error = ps2_command(ps2dev, &reg, PSMOUSE_CMD_SETRATE);
+	if (error)
+		return error;
+
+	return ps2_command(ps2dev, &val, PSMOUSE_CMD_SETRATE);
+}
+
+static int synaptics_rmi_read(struct psmouse *psmouse, u8 reg, u8 *val)
+{
+	struct ps2dev *ps2dev = &psmouse->ps2dev;
+	u8 param[3];
+	int error;
+
+	error = ps2_command(ps2dev, NULL, PSMOUSE_CMD_SETSCALE21);
+	if (error)
+		return error;
+
+	error = ps2_command(ps2dev, &reg, PSMOUSE_CMD_SETRATE);
+	if (error)
+		return error;
+
+	error = ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO);
+	if (error)
+		return error;
+
+	*val = param[0];
+	return 0;
+}
+
+/* Finds the LED of RMI function $30. Leaves the touchpad in RMI mode. */
+static int synaptics_rmi_led_probe(struct psmouse *psmouse)
+{
+	struct synaptics_data *priv = psmouse->private;
+	u8 fn, query, ctrl, caps, count, gpios;
+	unsigned int page, zeros, i;
+	int addr, error;
+
+	error = synaptics_mode_cmd(psmouse, SYN_RMI_MODE);
+	if (error)
+		return error;
+
+	for (page = 0; page < SYN_RMI_NUM_PAGES; page++) {
+		error = synaptics_rmi_write(psmouse, SYN_RMI_PAGE_SELECT, page);
+		if (error)
+			return error;
+
+		for (addr = SYN_RMI_PDT_START; addr >= SYN_RMI_PDT_END;
+		     addr -= SYN_RMI_PDT_ENTRY_SIZE) {
+			error = synaptics_rmi_read(psmouse, addr, &fn);
+			if (error)
+				return error;
+			if (!fn)
+				break;
+			if (fn != SYN_RMI_F30)
+				continue;
+
+			error = synaptics_rmi_read(psmouse, addr - 5, &query);
+			if (!error)
+				error = synaptics_rmi_read(psmouse, addr - 3, &ctrl);
+			if (!error)
+				error = synaptics_rmi_read(psmouse, query, &caps);
+			if (!error)
+				error = synaptics_rmi_read(psmouse, query + 1, &count);
+			if (error)
+				return error;
+
+			if (!(caps & SYN_RMI_F30_HAS_LED))
+				return -ENODEV;
+
+			priv->rmi_led_page = page;
+			if (!(caps & SYN_RMI_F30_HAS_GPIO)) {
+				priv->rmi_led_mask = BIT(0);
+				priv->rmi_led_ctrl = ctrl + 1;
+				priv->rmi_led_brightness = ctrl + 4;
+				return 0;
+			}
+
+			/* GPIO/LED select: the LED is the first set bit */
+			error = synaptics_rmi_read(psmouse, ctrl, &gpios);
+			if (error)
+				return error;
+
+			priv->rmi_led_mask = 0;
+			for (i = 0, zeros = 0; i < min(count, 8); i++) {
+				if (!(gpios & BIT(i)))
+					zeros++;
+				else if (!priv->rmi_led_mask)
+					priv->rmi_led_mask = BIT(i);
+			}
+			if (!priv->rmi_led_mask)
+				return -ENODEV;
+
+			priv->rmi_led_ctrl = ctrl + 4;
+			priv->rmi_led_brightness = ctrl + 7 + zeros;
+			return 0;
+		}
+	}
+
+	return -ENODEV;
+}
+
+/* Sets the LED. Leaves the touchpad in RMI mode. */
+static int __synaptics_rmi_led_set(struct psmouse *psmouse, bool on)
+{
+	struct synaptics_data *priv = psmouse->private;
+	u8 val;
+	int error;
+
+	error = synaptics_mode_cmd(psmouse, SYN_RMI_MODE);
+	if (error)
+		return error;
+
+	error = synaptics_rmi_write(psmouse, SYN_RMI_PAGE_SELECT, priv->rmi_led_page);
+	if (error)
+		return error;
+
+	if (on) {
+		error = synaptics_rmi_write(psmouse, priv->rmi_led_brightness,
+					    SYN_RMI_LED_BRIGHTNESS);
+		if (error)
+			return error;
+	}
+
+	error = synaptics_rmi_read(psmouse, priv->rmi_led_ctrl, &val);
+	if (error)
+		return error;
+
+	val = on ? val | priv->rmi_led_mask : val & ~priv->rmi_led_mask;
+	return synaptics_rmi_write(psmouse, priv->rmi_led_ctrl, val);
+}
+
+static int synaptics_set_mode(struct psmouse *psmouse);
+
+static int synaptics_rmi_led_set(struct led_classdev *led,
+				 enum led_brightness value)
+{
+	struct synaptics_data *priv = container_of(led, struct synaptics_data, rmi_led);
+	struct psmouse *psmouse = priv->psmouse;
+	int error, ret;
+
+	guard(mutex)(&priv->rmi_led_lock);
+
+	if (psmouse->state != PSMOUSE_ACTIVATED)
+		return -EBUSY;
+
+	error = psmouse_deactivate(psmouse);
+	if (error)
+		return error;
+
+	ret = __synaptics_rmi_led_set(psmouse, value != LED_OFF);
+
+	/* Setting the mode byte again leaves RMI access */
+	error = synaptics_set_mode(psmouse);
+	if (!ret)
+		ret = error;
+
+	error = psmouse_activate(psmouse);
+	return ret ?: error;
+}
+
+static void synaptics_rmi_led_init(struct psmouse *psmouse)
+{
+	struct synaptics_data *priv = psmouse->private;
+
+	if (!IS_REACHABLE(CONFIG_LEDS_CLASS) ||
+	    !psmouse_matches_pnp_id(psmouse, rmi_led_pnp_ids))
+		return;
+
+	if (synaptics_rmi_led_probe(psmouse))
+		return;
+
+	psmouse_info(psmouse, "touchpad LED on RMI F30 (page %u, ctrl %#x, mask %#x)\n",
+		     priv->rmi_led_page, priv->rmi_led_ctrl, priv->rmi_led_mask);
+	__synaptics_rmi_led_set(psmouse, false);
+	priv->has_rmi_led = true;
+}
+
+static void synaptics_rmi_led_register(struct psmouse *psmouse)
+{
+	struct synaptics_data *priv = psmouse->private;
+	int error;
+
+	if (!priv->has_rmi_led)
+		return;
+
+	mutex_init(&priv->rmi_led_lock);
+	priv->psmouse = psmouse;
+	priv->rmi_led.name = "synaptics::touchpad_disabled";
+	priv->rmi_led.max_brightness = 1;
+	priv->rmi_led.brightness_set_blocking = synaptics_rmi_led_set;
+	error = led_classdev_register(&psmouse->ps2dev.serio->dev, &priv->rmi_led);
+	if (error) {
+		psmouse_warn(psmouse, "failed to register touchpad LED: %d\n", error);
+		priv->has_rmi_led = false;
+	}
+}
+
 static int synaptics_set_mode(struct psmouse *psmouse)
 {
 	struct synaptics_data *priv = psmouse->private;
@@ -1444,6 +1674,9 @@ static void synaptics_disconnect(struct psmouse *psmouse)
 {
 	struct synaptics_data *priv = psmouse->private;
 
+	if (priv->has_rmi_led)
+		led_classdev_unregister(&priv->rmi_led);
+
 	/*
 	 * We might have left a breadcrumb when trying to
 	 * set up SMbus companion.
@@ -1496,6 +1729,10 @@ static int synaptics_reconnect(struct psmouse *psmouse)
 		return error;
 	}
 
+	/* The reset turned the LED off; the mode byte below leaves RMI access. */
+	if (priv->has_rmi_led && priv->rmi_led.brightness)
+		__synaptics_rmi_led_set(psmouse, true);
+
 	error = synaptics_set_mode(psmouse);
 	if (error) {
 		psmouse_err(psmouse, "Unable to initialize device.\n");
@@ -1616,6 +1853,8 @@ static int synaptics_init_ps2(struct psmouse *psmouse,
 	 */
 	priv->is_forcepad = psmouse_matches_pnp_id(psmouse, forcepad_pnp_ids);
 
+	synaptics_rmi_led_init(psmouse);
+
 	err = synaptics_set_mode(psmouse);
 	if (err) {
 		psmouse_err(psmouse, "Unable to initialize device.\n");
@@ -1693,6 +1932,8 @@ static int synaptics_init_ps2(struct psmouse *psmouse,
 		}
 	}
 
+	synaptics_rmi_led_register(psmouse);
+
 	return 0;
 
  init_fail:
diff --git a/drivers/input/mouse/synaptics.h b/drivers/input/mouse/synaptics.h
index 3853165b6..1d36a207e 100644
--- a/drivers/input/mouse/synaptics.h
+++ b/drivers/input/mouse/synaptics.h
@@ -6,6 +6,9 @@
 #ifndef _SYNAPTICS_H
 #define _SYNAPTICS_H
 
+#include <linux/leds.h>
+#include <linux/mutex.h>
+
 /* synaptics queries */
 #define SYN_QUE_IDENTIFY		0x00
 #define SYN_QUE_MODES			0x01
@@ -202,6 +205,16 @@ struct synaptics_data {
 	bool					press;
 	bool					report_press;
 	bool					is_forcepad;
+
+	/* Touchpad LED on RMI function $30, reached over PS/2 */
+	struct psmouse				*psmouse;
+	struct led_classdev			rmi_led;
+	struct mutex				rmi_led_lock;
+	bool					has_rmi_led;
+	u8					rmi_led_page;
+	u8					rmi_led_ctrl;
+	u8					rmi_led_mask;
+	u8					rmi_led_brightness;
 };
 
 void synaptics_module_init(void);
-- 
2.53.0

