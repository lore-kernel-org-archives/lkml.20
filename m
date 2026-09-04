Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF6347124B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532995; cv=none; b=j26g5Wz6hpUpd8r9uTwFCJCvEAeAQh0AaQK6z4JyE8no1P4AcUWHbvGlYsHvMx1kMImh8Zk0bVWlAF5ltETiE8tuiyK4uJgnCWhugM4n06BgCZ5oX+h8F0pSI/Nk0QtFtqrzPFNIRJPjUTqZpuheIwmOlnTwwyQO8CKO2hz6lgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532995; c=relaxed/simple;
	bh=TmrdyYRtRUker2eEPa3SJoQ1mqCt9PEVADcbJB6GIk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ew8lHnXurd5sgDN4F4D9eHqAT6Rrik1dgw7FJ2UHXnY75panDmS1jXZyJ+BsQXNuWP89mjR9xbzJJ7UVad/75BCFw/fyhJPDWbhbvImzltlI/6Aw9Agc0BzAlpuo8hg9UdHKL4tIRl9KZQ7XNYMI+Q8wkG4MFRBIHTdfTNwf35o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXOKaYLV; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXOKaYLV"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so10049841fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788532991; x=1789137791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRbzgHH2uPKV/5VNVqjlcOo8QkYrGj645E/H8JPEoRM=;
        b=OXOKaYLVzYd1mgko/X0Sh3eVqsfSI0oNb2ZXc+HpXXq8D4Ew2ktzYix8BjvhYQFCme
         yrmZ7wndmZm0DKIiXhGZZVEnnRYO4LhwQukewmVr8WjrSxnlzwmIpJvRuJ0TpXxj1k6L
         OSLZYpAmAKuTJNEwElVUhFnMfufKTG7eZCW4IrIjgPAcEo2lH1PHYRW9H5x87crMxLDo
         927EMIDH/gH01D+M5ABdAQr/50vRq1fGZJRC0tlvhvdj1/6v5xF3fHvpEc7C+KYkrxF9
         bMnKIDD20OL7YEqmy73DWucTxOf+B2u20ECJY6ZgP1T/IplcrTP+rk9mkxdUsRCRXyS4
         pyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788532991; x=1789137791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MRbzgHH2uPKV/5VNVqjlcOo8QkYrGj645E/H8JPEoRM=;
        b=hI4SKItNAdFi91DP9GwPgMLg0W1U8TNfPinUjXRNkGxNdIs3KEfmtCEmwf8utr6qzc
         kyQM3ZZZOh5+fAb2+tPE1yNsg0W2YCMJOuFgiVFVTP31GR1bDKFhvg6xIGCctJDzhKr7
         PAZWzM77kc83RP/t3FdNg8cP/1ZHv9D+1LTY+J++wQ+6b86aUrG7/NevGrhAk2xW1w5B
         evvOxxle8c1HHQ4B5Cb/324hYQLvD9PLVqX9TScTcRUvxg2z+p/rwk+D3HM5qWzlP5WV
         4n4+zorl+9YRdf5KTnMFZlgPgZo6dRtt2iP8UXLjJOdyTqpP8e8z91Oc2yZpbF0uLpBM
         3cuw==
X-Forwarded-Encrypted: i=1; AKwUvBya6rTjyYKOwehxYWcoc+U9s6M++zXnUiQdBc6G3Saq7iuXRhV3E0QbrWXv343vW8pMJfH/E+3A+9z77Zc=@vger.kernel.org
X-Gm-Message-State: AFuF++kSDWqPROLcjHq0gQEYjWt75BhXmiDLA0agmT6HLdJGHpmkcp6J
	N3uarVknQJGmGlrQjkHqPTmLvmLWboMv3yZWJc4h7yivxRsqo4GRoJRO
X-Gm-Gg: AYBFou39N/886k+EYNBYIrdo7cfccxfQ0LLSi/ED174BvFpMsXVUMwiQAyuJsHcfhQN
	BUz458d+w3XRcG/FdJHS8SSSjhhHKi+AzDFOUv5YkbJaYJnf9UKQdXKK3CNUo5zj4p22aXbmLXZ
	DShTOC7HmppQmVP5fp3FZV524WCf62AEKxl+iIK5CcHu7MzuzsE2qjLmE5+9Sosp0P8VKPhNred
	XHzFS9k6kNSINJRmbQfXrHOSqqdBgM0C8IzEbUhoKPdeti0MCsfxRjQrJ4cFzQwn+tddvSFqKES
	qYe05tnNSyVvGhJvMbP3hyZuqvFn2QD7bi7nHNOnV8t2KZE5/ZDgAlDAF77F8qAH051Wm46KoL5
	UnxD6DDSBcnuXGEiCEL9NTis/yYOP25Uc54IL9rZI1dLVqJ5hwGyRMRCY8PKGivdy2QBDjRXblH
	yeRkPbP9zEJy5WRm97t/qowBxrB4JrERdgaPFjkrqKfDft63LTaDnXlwrgFcfDKe844Tpzoi2jI
	D4d+oeDatWMq1mBUUzog4EPzSbnCLNArMrnKS4m7OGNAQu3HrkhGXvl+K4i
X-Received: by 2002:a05:6512:b91:b0:5b6:1a7c:fd82 with SMTP id 2adb3069b0e04-5b61a7cfecamr750470e87.40.1788532990495;
        Fri, 04 Sep 2026 07:43:10 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61670537esm549289e87.66.2026.09.04.07.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:43:09 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: tiwai@suse.de
Cc: tiwai@suse.com,
	perex@perex.cz,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [RFC PATCH v3 2/2] ALSA: usb-audio: bind the Topping M62's vendor controls
Date: Fri,  4 Sep 2026 19:43:00 +0500
Message-ID: <20260904144300.529289-3-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904144300.529289-1-mikhail.v.gavrilov@gmail.com>
References: <20260904141158.33398-1-mikhail.v.gavrilov@gmail.com>
 <20260904144300.529289-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The M62's vendor controls are driven by hid-topping-m62, added in the
previous patch, which speaks a vendor protocol on the card's HID
interface. Those controls belong on the sound card that plays the
audio, not on a card of the HID driver's own.

This adds the other half of that: a component master, registered from
the M62's mixer quirk, which hands its struct snd_card to the HID
driver at bind time and takes the controls away again at unbind. The
lifetime rules are the component framework's, which is the point --
neither driver has to be told about the other's disconnect, and neither
has to guess at the other's state. The same shape binds HD-audio to the
graphics drivers in sound/hda/core/component.c, with sound as the
master there too.

The master's context lives in devres on the audio control interface
rather than in drvdata, which on a usb_interface belongs to
snd-usb-audio itself; devres_find(), keyed on the release function,
gives it back inside the callbacks, which are handed nothing but a
struct device *. It hangs off the control interface rather than off the
USB device because component_match_add() allocates the match list with
devm: on the interface that is released at unbind, while on the
usb_device it would live until the device itself was released and a
rebind would stack a second list on top.

Neither component_compare_dev() nor component_compare_dev_name() fits:
the audio side has no pointer to the HID device, and the HID device's
name carries an instance counter that is not predictable. The match is
therefore one of descent -- the HID device sits two levels below the
USB device -- and which interface it is stays the HID driver's
business, since it registers a component for the vendor interface and
for no other. That keeps sound/usb free of HID symbols and of any
opinion about this card's interface numbering.

component_master_add_with_match() returns 0 with the aggregate merely
pending when the HID driver is absent, so the card comes up either way
and grows the vendor controls if and when the other half appears.

Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
 MAINTAINERS               |   9 ++
 sound/usb/Makefile        |   1 +
 sound/usb/mixer_quirks.c  |   5 +
 sound/usb/mixer_topping.c | 186 ++++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_topping.h |   7 ++
 5 files changed, 208 insertions(+)
 create mode 100644 sound/usb/mixer_topping.c
 create mode 100644 sound/usb/mixer_topping.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 627595e245f3..b49560efa1c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27593,6 +27593,15 @@ S:	Maintained
 W:	https://tomoyo.sourceforge.net/
 F:	security/tomoyo/
 
+TOPPING M62 VENDOR CONTROLS
+M:	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
+L:	linux-sound@vger.kernel.org
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/hid/hid-topping-m62.c
+F:	sound/usb/mixer_topping.c
+F:	sound/usb/mixer_topping.h
+
 TOPSTAR LAPTOP EXTRAS DRIVER
 M:	Herton Ronaldo Krzesinski <herton@canonical.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index e62794a87e73..151b481df795 100644
--- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -14,6 +14,7 @@ snd-usb-audio-y := 	card.o \
 			mixer_quirks.o \
 			mixer_scarlett.o \
 			mixer_scarlett2.o \
+			mixer_topping.o \
 			mixer_us16x08.o \
 			mixer_s1810c.o \
 			pcm.o \
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index a1f5592cc5d5..10f33026cdff 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -36,6 +36,7 @@
 #include "mixer_quirks.h"
 #include "mixer_scarlett.h"
 #include "mixer_scarlett2.h"
+#include "mixer_topping.h"
 #include "mixer_us16x08.h"
 #include "mixer_s1810c.h"
 #include "helper.h"
@@ -4531,6 +4532,10 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 		err = snd_fcp_init(mixer);
 		break;
 
+	case USB_ID(0x152a, 0x875c): /* Topping M62 */
+		err = snd_topping_init(mixer);
+		break;
+
 	case USB_ID(0x041e, 0x323b): /* Creative Sound Blaster E1 */
 		err = snd_soundblaster_e1_switch_create(mixer);
 		break;
diff --git a/sound/usb/mixer_topping.c b/sound/usb/mixer_topping.c
new file mode 100644
index 000000000000..d97d895a4493
--- /dev/null
+++ b/sound/usb/mixer_topping.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Topping M62 -- component master for the card's vendor controls.
+ *
+ * The M62's analogue gains, output volumes and source selectors are not
+ * described by the USB Audio Class.  They are reached over a vendor
+ * protocol on the card's HID interface, which hid-topping-m62 speaks.
+ *
+ * This file speaks none of that protocol.  It publishes the sound card to
+ * whoever drives the vendor interface, so that the controls are created on
+ * the card that plays the audio rather than on a card of their own, and are
+ * torn down when either side goes away.  The lifetime rules are the
+ * component framework's, which is the point: neither driver has to guess at
+ * the other's state, and neither has to be told about the other's
+ * disconnect.
+ *
+ * The same shape binds HD-audio to the graphics drivers in
+ * sound/hda/core/component.c, with sound as the master there too.
+ */
+
+#include <linux/component.h>
+#include <linux/device.h>
+#include <linux/usb.h>
+
+#include <sound/core.h>
+
+#include "usbaudio.h"
+#include "mixer.h"
+#include "helper.h"
+#include "mixer_topping.h"
+
+/*
+ * What the master hands the component at bind time.  It lives in devres on
+ * the audio control interface rather than in drvdata, because drvdata on a
+ * usb_interface belongs to snd-usb-audio itself.  devres_find(), keyed on
+ * the release function, gives it back inside the callbacks, which are
+ * handed nothing but a struct device *.
+ */
+struct topping_master {
+	struct device *dev;		/* the audio control interface */
+	struct snd_card *card;
+};
+
+static void topping_master_release(struct device *dev, void *res)
+{
+	/* The devres allocation is the storage; nothing else to drop. */
+}
+
+static struct topping_master *topping_get_master(struct device *dev)
+{
+	return devres_find(dev, topping_master_release, NULL, NULL);
+}
+
+/*
+ * Which of the registered components is ours.
+ *
+ * This is only ever called against devices that have registered with
+ * component_add(), so it does not have to defend itself against the whole
+ * device tree.  What it does have to do is tell this card's vendor
+ * function apart from a second M62 on another port.
+ *
+ * The HID device sits two levels below the USB device:
+ *
+ *	hid_device  ->  usb_interface  ->  usb_device
+ *
+ * WHICH interface it is, is the HID driver's business: it registers a
+ * component for the vendor interface and for nothing else.  So the test
+ * here is one of descent alone and needs no HID symbols in sound/usb --
+ * which also keeps this file free of any opinion about the M62's
+ * interface numbering.
+ */
+static int topping_match_component(struct device *dev, void *data)
+{
+	return dev->parent && dev->parent->parent == data;
+}
+
+static int topping_master_bind(struct device *dev)
+{
+	struct topping_master *tm = topping_get_master(dev);
+
+	if (WARN_ON(!tm))
+		return -EINVAL;
+
+	return component_bind_all(dev, tm->card);
+}
+
+static void topping_master_unbind(struct device *dev)
+{
+	struct topping_master *tm = topping_get_master(dev);
+
+	if (WARN_ON(!tm))
+		return;
+
+	component_unbind_all(dev, tm->card);
+}
+
+static const struct component_master_ops topping_master_ops = {
+	.bind	= topping_master_bind,
+	.unbind	= topping_master_unbind,
+};
+
+static void topping_private_free(struct usb_mixer_interface *mixer)
+{
+	struct topping_master *tm = mixer->private_data;
+
+	if (!tm)
+		return;
+
+	/*
+	 * Reached from snd_usb_mixer_disconnect(), on an unplug and on an
+	 * unbind of the audio interface alike.  component_master_del() runs
+	 * topping_master_unbind() on the way, so the HID side has taken its
+	 * kcontrols off this card before the card is taken apart.
+	 */
+	component_master_del(tm->dev, &topping_master_ops);
+	devres_destroy(tm->dev, topping_master_release, NULL, NULL);
+	mixer->private_data = NULL;
+}
+
+int snd_topping_init(struct usb_mixer_interface *mixer)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	struct component_match *match = NULL;
+	struct usb_interface *intf;
+	struct topping_master *tm;
+	struct device *dev;
+	int err;
+
+	/*
+	 * The master hangs off the audio control interface rather than off
+	 * the USB device: component_match_add() allocates the match list
+	 * with devm, and on an interface that is released when the interface
+	 * is unbound.  On the usb_device it would live until the device
+	 * itself was released, and a rebind would stack a second list on top
+	 * of the first.
+	 */
+	intf = usb_ifnum_to_if(chip->dev,
+			       get_iface_desc(mixer->hostif)->bInterfaceNumber);
+	if (!intf)
+		return -ENODEV;
+	dev = &intf->dev;
+
+	tm = devres_alloc(topping_master_release, sizeof(*tm), GFP_KERNEL);
+	if (!tm)
+		return -ENOMEM;
+	tm->dev = dev;
+	tm->card = chip->card;
+	devres_add(dev, tm);
+
+	mixer->private_data = tm;
+	mixer->private_free = topping_private_free;
+
+	component_match_add(dev, &match, topping_match_component,
+			    &chip->dev->dev);
+
+	/*
+	 * component_match_add() reports a failed allocation by storing
+	 * an error pointer rather than by returning, and
+	 * component_master_add_with_match() dereferences what it is
+	 * given without looking.
+	 */
+	if (IS_ERR(match)) {
+		err = PTR_ERR(match);
+		goto err_free;
+	}
+
+	/*
+	 * This returns 0 with the aggregate merely pending when
+	 * hid-topping-m62 has not registered its component yet:
+	 * try_to_bring_up_aggregate_device() reports an incomplete set as
+	 * "not ready", not as an error.  So the card comes up either way and
+	 * grows the vendor controls if and when the other half appears.
+	 */
+	err = component_master_add_with_match(dev, &topping_master_ops, match);
+	if (err < 0)
+		goto err_free;
+
+	return 0;
+
+err_free:
+	mixer->private_data = NULL;
+	mixer->private_free = NULL;
+	devres_destroy(dev, topping_master_release, NULL, NULL);
+	usb_audio_err(chip, "Topping: no component master: %d\n", err);
+	return err;
+}
diff --git a/sound/usb/mixer_topping.h b/sound/usb/mixer_topping.h
new file mode 100644
index 000000000000..15e16b509eb9
--- /dev/null
+++ b/sound/usb/mixer_topping.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __USB_MIXER_TOPPING_H
+#define __USB_MIXER_TOPPING_H
+
+int snd_topping_init(struct usb_mixer_interface *mixer);
+
+#endif /* __USB_MIXER_TOPPING_H */
-- 
2.55.0

