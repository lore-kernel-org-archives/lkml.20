Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431966;
	b=qZVahWrPSSkw26c3TV1u5wbEk5pbW5CGHJNYY/bsrY5f1+hRzZoZ83IdTP0DXlnqO1Ic
	 I++2ufRo5NA+hkK3vpcT8U5/OD0SZrKzvJDG0VffcNiryZ+/7taS5XoaxGig0wibF1rIf
	 jNFPEa3oY+6gx0DnGTwUNztY93IXnPu5viTErxiy7Nt0b0uRYuJ3m2AjUmV6EoMU+Ne5A
	 KdntuDg564VPr3hm8WlzeFbpgdY6jDcUjh/Z4HwDwh10Vx854TqQ86E/x3mQWDY6mk1V+
	 1kwqCDs6zInqSWhq0D/GWV5hINDz7cSAyFQjKrhXT13jzIzrBl8SY2MBmWdBhEkHFEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+v0XDEn7WImlApgTzqdVPMiQHvAezV1NF4IDw8sRSaw=;
	b=WrZFa5pHSAT45TobfW5c4ai44CrVzF/aTknnlCSFTLUIrklAjndmwrJLgYsH7PkwkogA
	 ei6NpqXz1cKsS7POjaiU6ddHb7whGmIE94OkQWQbJE4DuFwkO/Na/GhXJvgrYyvd6u+Nw
	 D1ZcqyVZ1O6c/llvzF1C1h6EpUBoL4N/7s3KodEbTfFDKAVn8SZm539nJlqw4SKGyR+cY
	 yh/5/3iUHbeFIl6+Rrkm5p8JaMenqNfmpjwKCVQMuQeWsnsupV4rb33dLY0khhdkJcM0g
	 +tBHWn7nb1uVJadDJuzw2i3ibjOMtG5sSIzl4RoWkssd1JChT+rF4UIjN19qKVzU5CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sCKJhlru;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26FA606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C26FA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sCKJhlru
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7c337cd6614so1346895137.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431965; x=1793036765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+v0XDEn7WImlApgTzqdVPMiQHvAezV1NF4IDw8sRSaw=;
        b=sCKJhlrumSD1Dqx0SYByyLDVJg85IiJ+e0SweNLF2WVKuWOqZtvBYbx8S1VjLxtjqN
         7+Q3fDIKilFzHzLaK2wTyr43V0iL9h8vWgnduADLtR87ZulsOlXvHCL9r8LOsfmMpmf/
         FEapUJN8Nv0Fc19WoMTZuzR7DjyAakV/5q91N/3x6ZoMD4nYa16XRl8ZlBsy0JI5sxaa
         d/Q/TJOe0xahhC1U37tRWi8M813QszAkY4JHIPo0jepOYCxNmijOFYhiFf1EJzzzeh4r
         pgAQNGlhgllZlncJmbM/4fMyt73k9vOu+EWkjlnvSgzFxHLSoQ54DWsbfUejmUv6JApC
         yndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431965; x=1793036765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+v0XDEn7WImlApgTzqdVPMiQHvAezV1NF4IDw8sRSaw=;
        b=iPdFHFt0Y2C93otcyuFSHy+EBVFicmq4JcamrTinSAqzr+p2jN03fEFZB1mGFDoj+V
         ztABx+T6gTBqx4HLxjTIa5ALEoUKrvegmgWpSHzz+zIspqOynA4G3fDMZ+dwnpuVHvHC
         +/c0XP4f8dK2CW90jW8nV9v3KnapAHg7+/1BHg3pKc/am6hTs+0wsR1toFx7Pi50YuQb
         YPLFOPWIi2Zwr8Vk7Djb7UvCPBSDsi0/Fy3E25Zg3KY4BypL486g7OnfcChWpIBwo0B2
         WY06eAHIUAzeDPFdEBLXhb9IChR4SJDQwBDp+4OX5dnSXsSwT+n210m3fUmNwbKXhyUR
         r9Uw==
X-Forwarded-Encrypted: i=1; AKwUvBwt2I5xBl+nLvQ7i5V9T+PovIAoq9pJ+r06JWbacrlhT/FxfQflyU0DYqisc8NzUNQWmIaZfghwdBuC4RU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN6WVcRQHJZL8KPfrMJS64zt4B7qXvXwv0/8lHLv/SY4dt+AEl
	ciEKtCtiAi205IW8KMnASFC24g+AcJizdVYqU+V31kzRcOTN3Vyydgr4
X-Gm-Gg: AYBFou0zVylbzNRGdHuRzQS2JkdMxB3jr4Gv15jNL0D9422vaHUOS2P4KxeqrP89w2Q
	/Vd1jR/+49ZISFfZooAdYf3/hSvGQ3xgXA/mSj/dLcPu4n1iVKSnuqDCnk4nOezx5Uc3rj/nG4h
	oQ7KmDsDNcFBf2pF6MyNtw5kueree39TdhbeRrnmZb8ELEqMow/yx+Puk9dyFKMjJMbuJAXY00O
	vrmS4GK9Oa2iM8Y8aTeOJ8FdfScUnY0oxynxNPtQ45vccp1nfCUPaWXRZbfVOd6FSdRqJ8izWYb
	qLEUYqFuTFGGw/DcC40CqkOMXFnmVlaD1q9kEj70XNep6spZRlzVeDZMSrTd8/Bf7p1w6OYrQJ9
	pwwDfpu4fBou+yZzcIjNx2Jh3ehxNo4qQSyo56NIdOG3B5RGbLBoPNkASivNB2/bqATZ+j6jxpk
	E0yeDDC6zHli/ztavgJLmPPtP/9WE6sUu2ZXDJ9a/413jk2guCMhPy60ogb7jjT87LfUNci5iNr
	hr/ZKh7lXovobS0XymMCfbQvXTJmVDCA0dzCXfoqHNmRSl1Z+UrsRRIvBHBqn5AjSAFafQ9pr4j
	i7bK+23v/qOYMCB9UR/335pH4Xn0OUg=
X-Received: by 2002:a05:6102:419e:b0:7b3:4199:2dd7 with SMTP id ada2fe7eead31-7cc364a1700mr2844170137.0.1792431964536;
        Mon, 19 Oct 2026 10:46:04 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3adfd0sm790707241.12.2026.10.19.10.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:46:04 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	fvdpol@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/13] ALSA: jockey3: Add probe skeleton for Reloop Jockey 3 DJ controllers
Date: Mon, 19 Oct 2026 13:44:33 -0400
Message-ID: <20261019174445.1931263-2-fvdpol@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019174445.1931263-1-fvdpol@gmail.com>
References: <20261019174445.1931263-1-fvdpol@gmail.com>
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

Add the start of a driver for the Reloop Jockey 3 Master Edition and
Reloop Jockey 3 Remix USB DJ controllers.

These devices are not USB Audio Class compliant. They use a proprietary
Ploytec framing protocol, which needs handling beyond what the existing
quirk mechanisms can express, so the driver lives in its own directory
rather than extending usb-audio.

This first patch binds to the device and brings it up, and nothing more:

 - match the two device IDs and validate the three bulk endpoints;
 - claim interface 1, which owns the capture endpoint;
 - run the Ploytec initialization handshake over EP0 and report the
   firmware version;
 - register a sound card that has no PCM or MIDI devices yet.

The card is created with snd_card_new() and released with
snd_card_free_when_closed(), so an unplug never waits for userspace to
close the card. The "Resource lifetime" comment describes the resulting
split between disconnect and the deferred free.

ploytec_proto.c holds the EP0 protocol helpers. They are kept apart from
the ALSA glue because the protocol is common and can be shared with
other Ploytec-based devices. The alt 0 bounce in
ploytec_initialize_device() gets its caller when rate switching is
added.

Streaming, PCM, MIDI, recovery and power management follow in the next
patches.

Assisted-by: LLM
Signed-off-by: Frank van de Pol <fvdpol@gmail.com>
---
 MAINTAINERS                       |   7 +
 sound/usb/Kconfig                 |   1 +
 sound/usb/Makefile                |   1 +
 sound/usb/jockey3/Kconfig         |  15 +
 sound/usb/jockey3/Makefile        |   3 +
 sound/usb/jockey3/jockey3.c       | 531 ++++++++++++++++++++++++++++++
 sound/usb/jockey3/ploytec_proto.c | 210 ++++++++++++
 sound/usb/jockey3/ploytec_proto.h |  58 ++++
 8 files changed, 826 insertions(+)
 create mode 100644 sound/usb/jockey3/Kconfig
 create mode 100644 sound/usb/jockey3/Makefile
 create mode 100644 sound/usb/jockey3/jockey3.c
 create mode 100644 sound/usb/jockey3/ploytec_proto.c
 create mode 100644 sound/usb/jockey3/ploytec_proto.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8883889b25c87..c1da7806b0dc1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23084,6 +23084,13 @@ F:	Documentation/filesystems/relay.rst
 F:	include/linux/relay.h
 F:	kernel/relay.c
 
+RELOOP JOCKEY 3 DJ CONTROLLER DRIVER
+M:	Frank van de Pol <fvdpol@gmail.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+W:	https://github.com/fvdpol/alsa-jockey3
+F:	sound/usb/jockey3/
+
 REGISTER MAP ABSTRACTION
 M:	Mark Brown <broonie@kernel.org>
 L:	linux-kernel@vger.kernel.org
diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
index b4588915efa11..d7edfbaf099be 100644
--- a/sound/usb/Kconfig
+++ b/sound/usb/Kconfig
@@ -205,6 +205,7 @@ config SND_USB_AUDIO_QMI
 	  will be called snd-usb-audio-qmi.
 
 source "sound/usb/line6/Kconfig"
+source "sound/usb/jockey3/Kconfig"
 
 endif	# SND_USB
 
diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index 2e842dcc73de1..1427173165cef 100644
--- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -38,3 +38,4 @@ obj-$(CONFIG_SND_USB_US122L) += snd-usbmidi-lib.o
 
 obj-$(CONFIG_SND) += misc/ usx2y/ caiaq/ 6fire/ hiface/ bcd2000/ qcom/
 obj-$(CONFIG_SND_USB_LINE6)	+= line6/
+obj-$(CONFIG_SND_USB_JOCKEY3) += jockey3/
diff --git a/sound/usb/jockey3/Kconfig b/sound/usb/jockey3/Kconfig
new file mode 100644
index 0000000000000..5714f46c57de3
--- /dev/null
+++ b/sound/usb/jockey3/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config SND_USB_JOCKEY3
+	tristate "Reloop Jockey 3 support"
+	help
+	  Say Y here to include support for the Reloop Jockey 3 DJ controllers.
+	  These devices utilize a non-standard, proprietary Ploytec USB
+	  protocol.
+
+	  Supported devices:
+
+	    * Reloop Jockey 3 Master Edition
+	    * Reloop Jockey 3 Remix
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-reloop-jockey3.
diff --git a/sound/usb/jockey3/Makefile b/sound/usb/jockey3/Makefile
new file mode 100644
index 0000000000000..4a3d02b7176e0
--- /dev/null
+++ b/sound/usb/jockey3/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_SND_USB_JOCKEY3) += snd-reloop-jockey3.o
+snd-reloop-jockey3-y := jockey3.o ploytec_proto.o
diff --git a/sound/usb/jockey3/jockey3.c b/sound/usb/jockey3/jockey3.c
new file mode 100644
index 0000000000000..940f5a5b7c653
--- /dev/null
+++ b/sound/usb/jockey3/jockey3.c
@@ -0,0 +1,531 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   ALSA driver for Reloop Jockey 3 devices
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+#include <linux/types.h>
+#include <linux/module.h>
+#include <linux/usb.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/bitops.h>
+#include <linux/mutex.h>
+#include <linux/cleanup.h>
+#include <sound/core.h>
+#include <sound/initval.h>
+#include "ploytec_proto.h"
+
+#define RELOOP_VENDOR_ID         0x200c
+#define RELOOP_JOCKEY3_ME_PID    0x1019
+#define RELOOP_JOCKEY3_REMIX_PID 0x1037
+
+enum { JOCKEY3_ME, JOCKEY3_REMIX };
+#define CARD_NAME "Reloop Jockey 3"
+
+/* Human-readable edition name for a usb_device_id.driver_info value. */
+static const char *jockey3_model_name(int model)
+{
+	switch (model) {
+	case JOCKEY3_ME:
+		return "Master Edition";
+	case JOCKEY3_REMIX:
+		return "Remix";
+	default:
+		return "Unknown";
+	}
+}
+
+static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
+static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;
+static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;
+
+module_param_array(index, int, NULL, 0444);
+MODULE_PARM_DESC(index, "Index value for " CARD_NAME " soundcard.");
+module_param_array(id, charp, NULL, 0444);
+MODULE_PARM_DESC(id, "ID string for " CARD_NAME " soundcard.");
+module_param_array(enable, bool, NULL, 0444);
+MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
+
+/**
+ * DOC: Reverse-engineering references
+ *
+ * Comments below cite documents by paths beginning "re/". Those are the
+ * reverse-engineering notes this driver was derived from -- USB protocol
+ * analysis, vendor trace comparisons and the experiments behind several of the
+ * timing constants. They are not part of the kernel tree: they live in the
+ * driver's development repository, linked from its MAINTAINERS entry.
+ */
+
+/**
+ * DOC: Device model
+ *
+ * The Reloop Jockey 3 presents two USB interfaces and speaks a proprietary
+ * Ploytec protocol rather than USB Audio Class. Interface 0 is claimed by
+ * probe(); interface 1 is claimed explicitly, as it owns the capture endpoint.
+ * Three bulk endpoints carry everything:
+ *
+ * - EP 0x05 OUT: PCM playback, with the MIDI OUT byte stream multiplexed into
+ *   a reserved slot of every packet (see PLOYTEC_MIDI_OUT_OFFSET)
+ * - EP 0x86 IN:  PCM capture
+ * - EP 0x83 IN:  MIDI input
+ */
+
+/**
+ * DOC: Resource lifetime
+ *
+ * The card is created with snd_card_new(), not snd_devm_card_new(), and
+ * released by jockey3_disconnect() with snd_card_free_when_closed(). A managed
+ * card would instead be freed from the devres unwind inside
+ * usb_unbind_interface(), where snd_card_free() blocks until userspace has
+ * closed every file descriptor on the card -- on an unplug that unwind runs on
+ * the USB hub work queue, so a single process holding the card open would
+ * stall hotplug for the whole hub. Every other USB sound driver in the tree
+ * avoids that the same way.
+ *
+ * That splits teardown in two, and the split is the thing to keep straight:
+ *
+ * - jockey3_disconnect() does everything that must happen while the device is
+ *   still there: latch JOCKEY3_FLAG_DISCONNECTED (for either interface, since
+ *   the core takes them down one at a time), release interface 1, and hand the
+ *   card to snd_card_free_when_closed().
+ *
+ * - jockey3_card_free(), reached through card->private_free once the last file
+ *   descriptor is closed, frees the transfer buffer and gives the card slot
+ *   back. It runs arbitrarily long after the disconnect and must attempt no
+ *   USB operation, though the objects themselves stay referenced until it
+ *   returns; see jockey3_free_resources().
+ *
+ * struct jockey3_chip lives in card->private_data, so it is freed with the
+ * card and outlives the USB binding.
+ *
+ * probe's error path performs the disconnect half by hand and ends the same
+ * way, with snd_card_free_when_closed(): a failing snd_card_register() may
+ * already have created the device nodes, so userspace can be holding the card
+ * open even there.
+ */
+
+/**
+ * struct jockey3_chip - per-device driver state
+ * @card: the ALSA card; read-only after probe
+ * @dev: the USB device; read-only after probe. Referenced for the chip's
+ *	lifetime, as @intf0 and @intf1 are, because the card can outlive the
+ *	unbind and usb_disconnect() would otherwise free them before
+ *	jockey3_free_resources() runs, which releases them.
+ * @intf0: interface 0, which the driver is bound to; read-only after probe
+ * @intf1: interface 1, claimed explicitly because it owns EP 0x86
+ * @xfer_buf: bounce buffer for EP0 control transfers, USB_XFER_BUF_SIZE bytes.
+ * @flags: JOCKEY3_FLAG_* bits, atomic bitops
+ * @dev_idx: card slot held in jockey3_devices_used
+ */
+struct jockey3_chip {
+	struct snd_card *card;
+	struct usb_device *dev;
+	struct usb_interface *intf0;
+	struct usb_interface *intf1;
+	unsigned char *xfer_buf;
+	unsigned long flags;
+	unsigned int dev_idx;
+};
+
+static struct usb_driver jockey3_driver;
+
+/*
+ * Card index allocation. A plain incrementing counter would both race between
+ * concurrent probes and never reuse a slot, so after SNDRV_CARDS successful
+ * probes no further device could attach even if all of them had been unplugged.
+ */
+static DEFINE_MUTEX(jockey3_devices_mutex);
+static DECLARE_BITMAP(jockey3_devices_used, SNDRV_CARDS);
+
+/*
+ * jockey3_claim_slot() and jockey3_release_slot() are separate functions so
+ * that jockey3_probe(), which unwinds with goto, holds no scope-based cleanup
+ * of its own: the cleanup helpers and goto are not to be mixed in one function.
+ */
+
+/**
+ * jockey3_claim_slot - take the first enabled, unused card slot
+ *
+ * Return: the slot index, or -ENODEV if every enabled slot is in use.
+ */
+static int jockey3_claim_slot(void)
+{
+	unsigned int dev_idx;
+
+	guard(mutex)(&jockey3_devices_mutex);
+
+	for (dev_idx = 0; dev_idx < SNDRV_CARDS; dev_idx++) {
+		if (enable[dev_idx] && !test_bit(dev_idx, jockey3_devices_used)) {
+			__set_bit(dev_idx, jockey3_devices_used);
+			return dev_idx;
+		}
+	}
+	return -ENODEV;
+}
+
+static void jockey3_release_slot(unsigned int dev_idx)
+{
+	guard(mutex)(&jockey3_devices_mutex);
+	__clear_bit(dev_idx, jockey3_devices_used);
+}
+
+/* Chip flags */
+#define JOCKEY3_FLAG_DISCONNECTED	0
+
+static inline bool jockey3_is_disconnected(const struct jockey3_chip *chip)
+{
+	return test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
+}
+
+static int jockey3_initialize_ploytec(struct jockey3_chip *chip, u32 *fw_version)
+{
+	int ret;
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	ret = ploytec_initialize_device(chip->intf0, chip->xfer_buf, false, fw_version);
+	if (ret < 0) {
+		dev_err(&chip->intf0->dev, "Ploytec failed to initialize: %d\n", ret);
+		return ret;
+	}
+
+	dev_dbg(&chip->intf0->dev, "Ploytec initialized successfully\n");
+	return 0;
+}
+
+static int jockey3_initialize(struct jockey3_chip *chip, int model)
+{
+	int ret;
+	u32 fw_version = 0;
+
+	/*
+	 * Let the device finish booting before speaking to it.
+	 *
+	 * After a mains power cycle the Jockey 3 enumerates and answers control
+	 * transfers while its audio engine is still coming up. Initialize it in
+	 * that window and the engine never starts: every control transfer
+	 * succeeds, the rate reads back correctly, ALSA accepts playback, and the
+	 * device is silent -- capture returns bit-exact zero and nothing is
+	 * logged. A USB re-enumeration does not provoke it; only a real
+	 * power-off does, because the device is self-powered and a VBUS cut is
+	 * merely a cable unplug to it.
+	 *
+	 * The threshold is sharp: the device needs between 144 and 156 ms after
+	 * enumeration, below which the engine fails to start every time. 250 ms
+	 * rather than the smallest passing value, because the time this driver
+	 * otherwise takes to reach its first transfer is host-dependent, so a
+	 * value that only topped that up would erode on a faster machine.
+	 *
+	 * See re/usb/init_timing_comparison.md for the measurements.
+	 */
+	msleep(250);
+
+	/*
+	 * Retry a device that refuses, not one that has stopped answering:
+	 * ploytec_initialize_device() gives up after the first EP0 timeout, and
+	 * retrying here would spend that timeout ten times over in probe.
+	 */
+	for (int retry = 10; retry > 0; retry--) {
+		ret = jockey3_initialize_ploytec(chip, &fw_version);
+		if (ret == 0 || ploytec_ctrl_ep_unresponsive(ret))
+			break;
+		usleep_range(50000, 100000); /* Wait 50-100 ms before retrying */
+	}
+	if (ret < 0) {
+		dev_err(&chip->intf0->dev, "Failed to initialize Ploytec: %d\n", ret);
+		return ret;
+	}
+
+	// see ploytec_get_firmware() for the packing of buf[0..2] into fw_version
+	dev_info(&chip->intf0->dev, CARD_NAME " %s Firmware 0x%02x v%d.%d.%d\n",
+		 jockey3_model_name(model),
+		 (fw_version >> 16) & 0xFF, (fw_version >> 8) & 0xFF,
+		 (fw_version >> 4) & 0x0F, fw_version & 0x0F);
+
+	return 0;
+}
+
+/*
+ * Free everything jockey3_probe() allocated into @chip, and give the card slot
+ * back. NULL-safe throughout, so it is correct at any point of a half-built
+ * probe as well as at the end of the device's life.
+ *
+ * One rule governs what may go in here, stemming from where it runs:
+ * card->private_free, i.e. after the last file descriptor on the card is
+ * closed, which on an unplug is arbitrarily long after jockey3_disconnect().
+ *
+ *  - No USB *operation* may be attempted. The objects are still allocated,
+ *    since jockey3_probe() references each and this function drops them, but
+ *    they are unbound by now and the hardware may be gone. Reading is safe,
+ *    talking is not. The dev_dbg(&chip->intf0->dev, ...) idiom is avoided too:
+ *    the interface is no longer ours, so the attribution would be wrong.
+ */
+static void jockey3_free_resources(struct jockey3_chip *chip)
+{
+	kfree(chip->xfer_buf);
+
+	jockey3_release_slot(chip->dev_idx);
+
+	/* Last, reversing jockey3_probe(): everything above may read these. */
+	usb_put_intf(chip->intf1);
+	usb_put_intf(chip->intf0);
+	usb_put_dev(chip->dev);
+}
+
+static void jockey3_card_free(struct snd_card *card)
+{
+	jockey3_free_resources(card->private_data);
+}
+
+static bool jockey3_has_bulk_endpoint(struct usb_interface *intf, u8 ep_num, bool out)
+{
+	struct usb_host_interface *alts;
+	int i;
+
+	/*
+	 * Alt 1 only: it is the setting ploytec_initialize_device() selects
+	 * and the one the URBs run on. Alt 0 has no endpoints on this device,
+	 * so an endpoint found only there would pass a check over every
+	 * altsetting and then fail at URB submission.
+	 */
+	alts = usb_altnum_to_altsetting(intf, 1);
+	if (!alts)
+		return false;
+
+	for (i = 0; i < alts->desc.bNumEndpoints; i++) {
+		struct usb_endpoint_descriptor *epd = &alts->endpoint[i].desc;
+
+		if (out) {
+			if (usb_endpoint_is_bulk_out(epd) &&
+			    usb_endpoint_num(epd) == ep_num)
+				return true;
+		} else {
+			if (usb_endpoint_is_bulk_in(epd) &&
+			    usb_endpoint_num(epd) == ep_num)
+				return true;
+		}
+	}
+	return false;
+}
+
+static int jockey3_validate_endpoints(struct usb_interface *intf0, struct usb_interface *intf1)
+{
+	if (!jockey3_has_bulk_endpoint(intf0, PLOYTEC_EP_NUM_PCM_OUT, true) ||
+	    !jockey3_has_bulk_endpoint(intf0, PLOYTEC_EP_NUM_MIDI_IN, false)) {
+		dev_err(&intf0->dev, "Required bulk endpoints not found on Interface 0 (OUT: 0x%02x, IN: 0x%02x)\n",
+			PLOYTEC_EP_NUM_PCM_OUT, PLOYTEC_EP_NUM_MIDI_IN);
+		return -ENODEV;
+	}
+
+	if (!jockey3_has_bulk_endpoint(intf1, PLOYTEC_EP_NUM_PCM_IN, false)) {
+		dev_err(&intf0->dev, "Required bulk IN endpoint not found on Interface 1 (IN: 0x%02x)\n",
+			PLOYTEC_EP_NUM_PCM_IN);
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static void jockey3_setup_card_names(struct jockey3_chip *chip, int driver_info)
+{
+	/*
+	 * card->driver is only char[16] and is what shows up as the card ID in
+	 * /proc/asound, so it holds a short model identifier rather than the
+	 * module name (which would be silently truncated).
+	 */
+	strscpy(chip->card->driver, "Jockey3", sizeof(chip->card->driver));
+	strscpy(chip->card->shortname, CARD_NAME, sizeof(chip->card->shortname));
+	strscpy(chip->card->mixername, CARD_NAME, sizeof(chip->card->mixername));
+
+	snprintf(chip->card->longname, sizeof(chip->card->longname),
+		 "%s %s at USB %s", CARD_NAME, jockey3_model_name(driver_info),
+		 dev_name(&chip->dev->dev));
+}
+
+static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id *usb_id)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	struct usb_interface *intf1;
+	struct snd_card *card;
+	struct jockey3_chip *chip;
+	unsigned int dev_idx;
+	int ret;
+
+	if (intf->cur_altsetting->desc.bInterfaceNumber != 0)
+		return -ENODEV;
+
+	intf1 = usb_ifnum_to_if(dev, 1);
+	if (!intf1)
+		return -ENODEV;
+
+	ret = jockey3_validate_endpoints(intf, intf1);
+	if (ret < 0)
+		return ret;
+
+	ret = jockey3_claim_slot();
+	if (ret < 0)
+		return ret;
+	dev_idx = ret;
+
+	/*
+	 * Deliberately not snd_devm_card_new(): a managed card is freed from the
+	 * devres unwind inside usb_unbind_interface(), where snd_card_free()
+	 * blocks until userspace closes every file descriptor on the card. On an
+	 * unplug that unwind runs on the USB hub work queue, so one process
+	 * holding the card open would stall hotplug for the whole hub. The card is
+	 * released from jockey3_disconnect() with snd_card_free_when_closed()
+	 * instead, which is what every other USB sound driver does; the
+	 * resources that outlive it go in card->private_free below.
+	 */
+	ret = snd_card_new(&intf->dev, index[dev_idx], id[dev_idx], THIS_MODULE,
+			   sizeof(struct jockey3_chip), &card);
+	if (ret < 0)
+		goto err_free_idx;
+
+	chip = card->private_data;
+	chip->dev_idx = dev_idx;
+
+	chip->card = card;
+	/*
+	 * The card outlives the unbind, so these pointers must too:
+	 * snd_card_free_when_closed() defers the release until userspace closes
+	 * the card, while usb_disconnect() device_unregister()s the interfaces
+	 * as soon as the device leaves.
+	 *
+	 * This keeps the memory valid, not the device usable -- the interfaces
+	 * are still unbound and every transfer through them fails.
+	 * JOCKEY3_FLAG_DISCONNECTED remains the thing to test.
+	 */
+	chip->dev = usb_get_dev(dev);
+	chip->intf0 = usb_get_intf(intf);
+	chip->intf1 = usb_get_intf(intf1);
+	chip->flags = 0;
+
+	/*
+	 * From here on every failure goes to err_free_card, and the card slot is
+	 * given back by jockey3_free_resources() rather than by err_free_idx.
+	 */
+	card->private_free = jockey3_card_free;
+
+	chip->xfer_buf = kmalloc(USB_XFER_BUF_SIZE, GFP_KERNEL);
+	if (!chip->xfer_buf) {
+		ret = -ENOMEM;
+		goto err_free_card;
+	}
+
+	/* Interface 1 owns the capture endpoint (0x86) */
+	ret = usb_driver_claim_interface(&jockey3_driver, intf1, chip);
+	if (ret < 0)
+		goto err_free_card;
+
+	jockey3_setup_card_names(chip, usb_id->driver_info);
+
+	if (card->id[0] == '\0')
+		snd_card_set_id(card, "RJ3");
+
+	usb_set_intfdata(intf, chip);
+	ret = jockey3_initialize(chip, usb_id->driver_info);
+	if (ret < 0)
+		goto err_free_card;
+
+	ret = snd_card_register(card);
+	if (ret < 0)
+		goto err_free_card;
+
+	return 0;
+
+err_free_card:
+	/*
+	 * Same order as jockey3_disconnect(): latch DISCONNECTED, and only then
+	 * let go of interface 1 and the card. All of it is safe on a half-built
+	 * chip -- everything jockey3_free_resources() touches is NULL until it
+	 * is allocated.
+	 *
+	 * snd_card_free_when_closed() rather than snd_card_free(), as in
+	 * jockey3_disconnect(): snd_card_register() creates the device nodes
+	 * before it can still fail, so userspace may have the card open, and
+	 * snd_card_free() would block probe until it lets go.
+	 *
+	 * probe() owns the usb_device lock, as usb_driver_claim_interface()
+	 * requires, and every unbind takes the same lock (see
+	 * jockey3_disconnect()), so interface 1 cannot be unbound from sysfs
+	 * while this unwinds.
+	 */
+	usb_set_intfdata(intf, NULL);
+	set_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
+	usb_driver_release_interface(&jockey3_driver, intf1);
+	snd_card_free_when_closed(card);
+	return ret;
+
+err_free_idx:
+	/* Only reached before the card exists */
+	jockey3_release_slot(dev_idx);
+	return ret;
+}
+
+static void jockey3_disconnect(struct usb_interface *intf)
+{
+	struct jockey3_chip *chip = usb_get_intfdata(intf);
+
+	/*
+	 * Latch DISCONNECTED first, and for EITHER interface. The driver is
+	 * bound to both interfaces and the USB core takes them down one at a
+	 * time. Losing either interface means the card is going away regardless
+	 * -- interface 1 owns the capture endpoint -- so there is nothing to
+	 * keep running for.
+	 */
+	if (chip)
+		set_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
+
+	if (chip && intf == chip->intf0) {
+		/*
+		 * Release interface 1 here, not from card->private_free: that
+		 * runs when the last file descriptor is closed, by which time
+		 * usb_disconnect() may already have freed the interface. This
+		 * recurses into jockey3_disconnect() for interface 1, which only
+		 * latches DISCONNECTED and clears its intfdata; if the core got
+		 * there first, usb_driver_release_interface() sees a condition
+		 * other than USB_INTERFACE_BOUND and returns.
+		 *
+		 * The two disconnects never overlap: every unbind of either
+		 * interface holds the usb_device lock. usb_disconnect() holds it
+		 * throughout, and a sysfs unbind or driver detach takes it first
+		 * because usb_bus_type sets need_parent_lock. So interface 1's
+		 * disconnect has either finished already or runs inside this
+		 * call, and the chip is not freed under it.
+		 */
+		usb_driver_release_interface(&jockey3_driver, chip->intf1);
+
+		/*
+		 * snd_card_free_when_closed() disconnects the card now and frees
+		 * it once userspace has closed it -- it never blocks, which is
+		 * the whole point of not using a managed card (see the comment in
+		 * jockey3_probe()). @chip lives in card->private_data and may be gone
+		 * the moment this returns, so nothing below may touch it.
+		 */
+		snd_card_free_when_closed(chip->card);
+	}
+	usb_set_intfdata(intf, NULL);
+}
+
+static const struct usb_device_id jockey3_ids[] = {
+	{ USB_DEVICE(RELOOP_VENDOR_ID, RELOOP_JOCKEY3_ME_PID), .driver_info = JOCKEY3_ME },
+	{ USB_DEVICE(RELOOP_VENDOR_ID, RELOOP_JOCKEY3_REMIX_PID), .driver_info = JOCKEY3_REMIX },
+	{}
+};
+MODULE_DEVICE_TABLE(usb, jockey3_ids);
+
+static struct usb_driver jockey3_driver = {
+	.name = "snd-reloop-jockey3",
+	.probe = jockey3_probe,
+	.disconnect = jockey3_disconnect,
+	.id_table = jockey3_ids
+};
+
+module_usb_driver(jockey3_driver);
+
+MODULE_AUTHOR("Frank van de Pol <fvdpol@gmail.com>");
+MODULE_DESCRIPTION(CARD_NAME " ALSA Driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/usb/jockey3/ploytec_proto.c b/sound/usb/jockey3/ploytec_proto.c
new file mode 100644
index 0000000000000..a14c6af5f9dc8
--- /dev/null
+++ b/sound/usb/jockey3/ploytec_proto.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   ALSA driver for Reloop Jockey 3 devices
+ *   Ploytec USB Protocol Handling
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include "ploytec_proto.h"
+
+/*
+ * None of the helpers below validate @intf/@xfer_buf for NULL: callers own
+ * the chip's usb_interface and control-transfer buffer for the entire time
+ * the PCM/rawmidi devices can be open, so these arguments are always valid
+ * here.
+ */
+
+/**
+ * ploytec_ctrl_ep_unresponsive - Has the control endpoint stopped answering?
+ * @err: error returned by an EP0 control transfer
+ *
+ * Distinguishes a device that answered -- even to refuse -- from one whose
+ * control endpoint has gone silent. A STALL (-EPIPE) or a short reply
+ * (-EREMOTEIO) both mean live firmware: the transfer completed and the device
+ * drove the bus. A timeout or a transport-level error means EP0 itself is gone,
+ * and every further control transfer will only burn another
+ * PLOYTEC_CTRL_TIMEOUT_MS before failing the same way.
+ *
+ * The list is affirmative rather than an exclusion, so an unfamiliar error
+ * counts as "device still there" and a new class has to be added deliberately.
+ *
+ * Return: true if EP0 has stopped responding.
+ */
+bool ploytec_ctrl_ep_unresponsive(int err)
+{
+	switch (err) {
+	case -ETIMEDOUT:
+	case -ENODEV:
+	case -ESHUTDOWN:
+	case -ECONNRESET:
+	case -EPROTO:
+	case -EILSEQ:
+	case -ETIME:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/**
+ * ploytec_get_firmware - Read firmware version from the device
+ * @intf: USB interface
+ * @xfer_buf: Temporary transfer buffer (at least 3 bytes)
+ * @fw_version: Optional, set to the packed firmware/hardware version on success
+ *
+ * Performs a request to the device to retrieve the firmware and/or hardware version.
+ * Required as part of the handshake sequence regardless of whether the caller
+ * wants the value; pass @fw_version as NULL to discard it.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int ploytec_get_firmware(struct usb_interface *intf, void *xfer_buf, u32 *fw_version)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	u8 *buf = xfer_buf;
+	int ret;
+
+	ret = usb_control_msg_recv(dev, 0, PLOYTEC_REQ_FIRMWARE, PLOYTEC_REQ_FIRMWARE_TYPE, 0, 0,
+				   buf, 3, PLOYTEC_CTRL_TIMEOUT_MS, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Three-byte reply: a suspected hardware revision, then the firmware
+	 * major and minor. See re/protocol_analysis.md.
+	 */
+	if (fw_version)
+		*fw_version = (buf[0] << 16) | (buf[1] << 8) | buf[2];
+	return 0;
+}
+
+/**
+ * ploytec_get_status - Read device status byte
+ * @intf: USB interface
+ * @xfer_buf: Temporary transfer buffer (at least 1 byte)
+ * @status: Pointer to store the status byte
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int ploytec_get_status(struct usb_interface *intf, void *xfer_buf, u8 *status)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	u8 *buf = xfer_buf;
+	int ret;
+
+	// Read Status (Request 0x49)
+	ret = usb_control_msg_recv(dev, 0, PLOYTEC_REQ_STATUS, PLOYTEC_REQ_STATUS_TYPE, 0, 0,
+				   buf, 1, PLOYTEC_CTRL_TIMEOUT_MS, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	*status = buf[0];
+	return 0;
+}
+
+/**
+ * ploytec_initialize_device - Perform Ploytec handshake sequence as observed in USB traces.
+ * @intf: USB interface
+ * @xfer_buf: Temporary transfer buffer
+ * @bounce_alt0: drive both interfaces to alt 0 before selecting alt 1, which
+ *	the vendors do only when changing the rate of a running device
+ * @fw_version: Optional, set to the packed firmware/hardware version on success
+ *
+ * Aborts early if EP0 stops responding, rather than continuing into the
+ * alt-setting sequence below; see the comment on the firmware read for why
+ * that distinction matters.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int ploytec_initialize_device(struct usb_interface *intf, void *xfer_buf, bool bounce_alt0,
+			      u32 *fw_version)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	const unsigned int halt_pipes[] = {
+		usb_rcvbulkpipe(dev, PLOYTEC_EP_NUM_PCM_IN),
+		usb_sndbulkpipe(dev, PLOYTEC_EP_NUM_PCM_OUT),
+		usb_rcvbulkpipe(dev, PLOYTEC_EP_NUM_MIDI_IN),
+	};
+	u8 status;
+	unsigned int i;
+	int ret;
+
+	/*
+	 * The vendors read the firmware version after power-up and the value
+	 * is unused here, but this is the sequence's first EP0 transfer and so
+	 * the last point at which the usb_set_interface() calls below can
+	 * still be avoided -- which is what makes its return load-bearing.
+	 * usb_set_interface() disables the interface's endpoints before it
+	 * sends SET_INTERFACE and does not re-enable them if that request
+	 * fails, so calling it on a device whose control endpoint has already
+	 * gone silent leaves every endpoint of interface 0 permanently
+	 * disabled and usb_submit_urb() returning -ENOENT until the device is
+	 * reset. A device that merely refuses the request is fine; one that
+	 * has stopped answering is not.
+	 */
+	ret = ploytec_get_firmware(intf, xfer_buf, fw_version);
+	if (ret < 0) {
+		dev_warn(&intf->dev, "Firmware version read failed: %d\n", ret);
+		if (ploytec_ctrl_ep_unresponsive(ret))
+			return ret;
+	}
+
+	/*
+	 * Deactivate the audio interfaces before reactivating them, but only
+	 * when the device is already running. On a device that has just been
+	 * enumerated the interfaces are at alt 0 anyway, and neither vendor
+	 * driver touches alt 0 there. macOS does bounce on a rate change, and
+	 * takes interface 1 down first, which is the order used here.
+	 */
+	if (bounce_alt0) {
+		ret = usb_set_interface(dev, 1, 0);
+		if (ret < 0)
+			return ret;
+		ret = usb_set_interface(dev, 0, 0);
+		if (ret < 0)
+			return ret;
+
+		/* Give the hardware some time to respond, otherwise it might not be ready */
+		usleep_range(3000, 5000);
+	}
+
+	// Select Alt Setting 1 to activate the audio interface
+	ret = usb_set_interface(dev, 0, 1);
+	if (ret < 0)
+		return ret;
+	ret = usb_set_interface(dev, 1, 1);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * The bulk endpoints just activated are not immediately ready for the
+	 * usb_clear_halt() calls below: without this pause, EP0 stops
+	 * answering anything at all until a full USB re-enumeration clears
+	 * it. Only ever reproduced on a single-core host (Pi 1B, armv6),
+	 * never on a multi-core one; bisected down to this range with real
+	 * device power cycles. See github.com/fvdpol/alsa-jockey3/issues/48.
+	 */
+	usleep_range(25, 35);
+
+	/*
+	 * Clear Feature (ENDPOINT_HALT). A failure here has never been fatal on
+	 * a device that is still answering, so only a silent EP0 aborts -- which
+	 * also avoids burning two more PLOYTEC_CTRL_TIMEOUT_MS on the remaining
+	 * pipes once the first one has timed out.
+	 */
+	for (i = 0; i < ARRAY_SIZE(halt_pipes); i++) {
+		ret = usb_clear_halt(dev, halt_pipes[i]);
+		if (ret < 0) {
+			dev_warn(&intf->dev, "Failed to clear halt on EP 0x%02x: %d\n",
+				 usb_pipeendpoint(halt_pipes[i]) |
+					(usb_pipein(halt_pipes[i]) ? USB_DIR_IN : 0),
+				 ret);
+			if (ploytec_ctrl_ep_unresponsive(ret))
+				return ret;
+		}
+	}
+
+	return ploytec_get_status(intf, xfer_buf, &status);
+}
diff --git a/sound/usb/jockey3/ploytec_proto.h b/sound/usb/jockey3/ploytec_proto.h
new file mode 100644
index 0000000000000..73bd1cf2e1337
--- /dev/null
+++ b/sound/usb/jockey3/ploytec_proto.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *   ALSA driver for Reloop Jockey 3 devices
+ *   Ploytec USB Protocol Handling
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ *
+ *   Comments here and in ploytec_proto.c cite documents by paths beginning
+ *   "re/". Those are the reverse-engineering notes this protocol layer was
+ *   derived from; they are not part of the kernel tree but live in the driver's
+ *   development repository, linked from its MAINTAINERS entry.
+ */
+
+#ifndef __SOUND_USB_JOCKEY3_PLOYTEC_PROTO_H
+#define __SOUND_USB_JOCKEY3_PLOYTEC_PROTO_H
+
+#include <linux/types.h>
+#include <linux/usb.h>
+
+#define USB_XFER_BUF_SIZE		64	// temporary buffer for USB control transfers
+
+/* Packet format/structure */
+#define PLOYTEC_PKT_SIZE		512
+#define PLOYTEC_MIDI_OUT_OFFSET		480	// location of MIDI data in the playback packet
+#define PLOYTEC_MIDI_IDLE_BYTE		0xFD	// send when no MIDI data is available
+#define PLOYTEC_SYNC_BYTE_OFFSET	481
+#define PLOYTEC_SYNC_BYTE_VALUE		0xFF
+
+/* USB Endpoint numbers*/
+#define PLOYTEC_EP_NUM_PCM_OUT		0x05	// Playback & MIDI Out (EP 0x05)
+#define PLOYTEC_EP_NUM_PCM_IN		0x06	// Capture (EP 0x86)
+#define PLOYTEC_EP_NUM_MIDI_IN		0x03	// MIDI In (EP 0x83)
+
+/* Protocol Commands */
+#define PLOYTEC_REQ_STATUS		0x49	// bRequest to get device status
+#define PLOYTEC_REQ_STATUS_TYPE		0xC0	// bmRequestType to get device status
+#define PLOYTEC_REQ_FIRMWARE		0x56	// bRequest to get firmware version
+#define PLOYTEC_REQ_FIRMWARE_TYPE	0xC0	// bmRequestType to get firmware version
+
+/* Timeout for the EP0 control transfers above, in milliseconds */
+#define PLOYTEC_CTRL_TIMEOUT_MS		2000
+
+/*
+ * Protocol Helpers
+ *
+ * All of these take the USB interface rather than the USB device so that
+ * dev_dbg()/dev_err()/dev_warn() attribute log messages to our driver
+ * (e.g. "snd-reloop-jockey3 1-13:1.0: ...") instead of to usbcore's generic
+ * per-device node (e.g. "usb 1-13: ..."), which is what struct usb_device's
+ * embedded struct device is bound to.
+ */
+int ploytec_initialize_device(struct usb_interface *intf, void *xfer_buf,
+			      bool bounce_alt0, u32 *fw_version);
+int ploytec_get_firmware(struct usb_interface *intf, void *xfer_buf, u32 *fw_version);
+int ploytec_get_status(struct usb_interface *intf, void *xfer_buf, u8 *status);
+bool ploytec_ctrl_ep_unresponsive(int err);
+
+#endif /* __SOUND_USB_JOCKEY3_PLOYTEC_PROTO_H */
-- 
2.47.3

