Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878182;
	b=svLpGVp074785Xx4HtdaDA40v+iMciirM0gWQuTfoLxwpOX5T7jcGOJqAb7SmhQQxuSX
	 MER6VPE4MIV3yUN39jERZy44I7UbT2RbdKzD3RBDHU6Drwtm84iHIQ6VhB8dnJXcSQgeL
	 cmupswu325Pct5Diz4SU9axgFl6Ms30uLiIcJ3KzwM2afJm6aO7bqHhQnYCJD+jQ+IDJH
	 UVnkb1yeb7OEgf8eoAvddZ2thm1vVlaHnziET+N+uPcA1Cuqgxjnpotk6d4QvvJLqfP0j
	 k+zay4p8Ob1f8fXdeJMhCutmqXfwiT5B6fvCR5z/ffuRkPJm8ruYdPjGua3En+kwsgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FLHBd2itr/YyJ+QhRpnjae+TMuupiEZD7EB6TUX9ubo=;
	b=vCSi8b/M7AapIcthMfn9ICwrviI1nE093n1ycdMIDBHXmuL4Ol1L3lFD171L199ZE/zU
	 MalkRSiwv0JS++/UeOO4CKGfhDvkkBsInCn6KPJnWPQgZi5wzL/fVwCjRfed+fCYNFR2j
	 /Frc5SElduq2zWxwFeGPgFQ94GXUJeBQSOxHHNh8ELDbq6FE/1q79vk9XS2KAiTfOuhx+
	 JwvJhBfff5OM9ATgXCPpeD+Vbu9m81QP0qNMWUQTdN1rvDmlq0o/+jXr0hE+JxPBtZVGn
	 NqkZ/uGq6XQeDxenXeXZo7UQmyQR8wVMJN1Fwejnk5xpf4WPB3o08qifdUmav+Rkolw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tOGk6cjO;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECC5606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ECC5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tOGk6cjO
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36dbde64409so1364762eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793878181; x=1794482981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLHBd2itr/YyJ+QhRpnjae+TMuupiEZD7EB6TUX9ubo=;
        b=tOGk6cjOnLo4EV1CmL9k8hDbqbc+stqO84OB4ZgGwGWMux1ClZXL377GgxbbfhoNni
         NcjrRBFg6EQvrVLKNQISW8KmsgZ7yMqOgZrDkHch8iMb1m75r4Zf/TRo9NxjLB8wgZoX
         X+OfSBsUUF0l3IEO+rRGyghh+f4g+008W2rPYQK6w5qx/cUZXw0iS2qzYR1bCiZaynn5
         n4cu7faqKoN1gd2NsjLWx8Pp6JYE8mxuFxOGy1WuULYkBnXCqv8/jNPeRHmkfWtVNGHf
         oORUFaL8N5YWBA6Q7CNLr3vey/yCt7/Lq2p/esH0BiY5poFMihcMAMM1TIGT05yLKg75
         EaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878181; x=1794482981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FLHBd2itr/YyJ+QhRpnjae+TMuupiEZD7EB6TUX9ubo=;
        b=cSgVqYcBglYYfR+vn4uZwNnt9NgCVKdAwCe+ar/nkF41MB741VbDUPoPEFC9fRuK9F
         aqBvbxJNHPGUFDAqzA2Cm88CXUqTRkMFE8jwp94jmNvwJI4WZE5acFZpfhb+KSEgAaeH
         JdWyUeQ+3wgfDYgijIOpIfSnSAfeOqgMCg2mb9jPyh56OXJ349dl9koJ7H2Qu+RbMDUn
         P/Q+G4g6P0EL6iFDfTXBcCAehoNiaiYVVPyFHoV9qJ281I4kfZVZeD2Ktcrgth8Dk7fV
         Dxry+83TrgRn9ey+gngfayOEX7yKHaA+hXxT5OcAbr0Ee2htlnbvhkcvxQZws/iSLR5S
         +aJQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5aT+434V+g3DUFJ75H3SEEPwum1P/iLEiMwu4dxeut09BRFaKzabgfI4ne28DNCGeO+lHBuyPyzdGuNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bEHiUrRSt42iWZ+UUFC7INirlx+ntxew4rjFY59appJY93yGy
	KV8ctre9mfJlJdiVu+KfDsV3SKdy0YXkAj/D/4f4MU0OhMCSBUna0QeS
X-Gm-Gg: AYBFou0zQZb92PMKgW/SE37wOoyi+Ea9p6Bd6pBRh5nXj4JnQAt/fD/IiU4Gm9jUh4S
	nF/5i84Dk6q8H0shiiCVwLPc/XfEHLr8VsiCpfT+FFv6pHljbdHALyEdLbfRGic/1hpteDVwR9a
	WY21t123Wydb3SkEOMu7zCxWEJXGNc1qbZ84jwJbUdBUVQ3bMbFjFri5yk7p0W5GHNGiko81jOo
	/XVSDekSUMPB6oIeARLw6ThNT2IgjFLAyrfYC5EpnHimg9lpSxCbL8JJkmaLcbUBCSDWy3iXMfJ
	6YX75qT+CyKs/PU8CsxrRW/kpEWDI7rrPdD8vnROx/Gi1BXNwCQwM+jD2MHeaPQbUWj8dD8F7X/
	9SsVGKy3WAsPFaVxMsUYWbxN6FYLASTCdC7ju198oytEDfaUWoeOVm9NQahzJTS9rZ6SXUSxw/k
	uGaymjefp8iCimzuI7isOE+vGT/ekKutTcypJl90SAAIVNgychC39Fn14xiIFBvLy3+aMXPyqaG
	nnt4irgKyH2UOE1pWl5jtLjPRIYVUqgSvLxyq9eDeSOu2FWnw4auLEDsNBm8J7zYMZf4fkuG92s
	PIteVLm20yYZZbmoQ+JnuDgWu/hICg==
X-Received: by 2002:a05:7300:ec82:b0:36d:7f5f:7e97 with SMTP id 5a478bee46e88-36d7f5f8290mr4601005eec.40.1793878181167;
        Thu, 05 Nov 2026 03:29:41 -0800 (PST)
Received: from AD03042041 ([115.137.252.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36dd7ec8881sm14177194eec.18.2026.11.05.03.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:29:40 -0800 (PST)
From: Deukjung Kim <mentalese@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deukjung Kim <mentalese@gmail.com>
Subject: [PATCH v2] ALSA: usb-audio: Add Arturia AudioFuse 48V/Main mute mixer controls
Date: Thu,  5 Nov 2026 20:29:03 +0900
Message-ID: <20261105112903.536150-1-mentalese@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87ecd0tt6x.wl-tiwai@suse.de>
References: <87ecd0tt6x.wl-tiwai@suse.de>
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

Add mixer quirk controls for Arturia AudioFuse (0x1c75:0xaf02):
 - Input1 48V LED Switch (wValue 0x0001)
 - Main Speaker Mute LED Switch (wValue 0x0500)

Values are written with a class MEM request to entity 0x46 and the
initial state is read from a 178-byte status block of entity 0x47.
Protocol reverse engineered from Arturia AudioFuse Control Center.

Signed-off-by: Deukjung Kim <mentalese@gmail.com>
---
v2: Fix indentation in patch description

 sound/usb/mixer_quirks.c | 187 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 187 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 5eee501948fb..5839719444f8 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/usb.h>
 #include <linux/usb/audio.h>
+#include <linux/usb/audio-v2.h>
 
 #include <sound/asoundef.h>
 #include <sound/core.h>
@@ -4419,6 +4420,189 @@ static int snd_djm_controls_create(struct usb_mixer_interface *mixer,
 	return 0;
 }
 
+/*
+ * Arturia AudioFuse (Rev2)
+ *
+ * The protocol was reverse engineered from Arturia AudioFuse Control Center.
+ * A parameter is written with a UAC2 class MEM request to the vendor entity
+ * 0x46 (wValue = parameter id, 1 byte payload), and the current device state
+ * can be read back as a 178 byte block from the vendor entity 0x47.
+ * Both entities live on the audio control interface 0.
+ *
+ * Layout of kcontrol->private_value: (parameter id << 8) | current value
+ */
+#define SND_AF_CTRL_IFNUM	0
+#define SND_AF_ENTITY_SET	0x46
+#define SND_AF_ENTITY_STATUS	0x47
+#define SND_AF_STATUS_LEN	178
+
+#define SND_AF_PARAM_SHIFT	8
+#define SND_AF_VAL_MASK		0xff
+
+struct snd_audiofuse_ctl {
+	const char *name;
+	u16 param;		/* wValue of the set request */
+	u8 status_offset;	/* offset of the value in the status block */
+};
+
+static const struct snd_audiofuse_ctl snd_audiofuse_ctls[] = {
+	{
+		.name = "Input1 48V LED Switch",
+		.param = 0x0001,
+		.status_offset = 0x3e,
+	},
+	{
+		.name = "Main Speaker Mute LED Switch",
+		.param = 0x0500,
+		.status_offset = 0x5c,
+	},
+};
+
+static u16 snd_audiofuse_windex(struct usb_mixer_interface *mixer, u8 entity)
+{
+	return (entity << 8) | mixer->hostif->desc.bInterfaceNumber;
+}
+
+static int snd_audiofuse_ctl_write(struct usb_mixer_interface *mixer,
+				   u16 param, u8 val)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	int err;
+
+	err = snd_usb_lock_shutdown(chip);
+	if (err < 0)
+		return err;
+
+	/* snd_usb_ctl_msg() bounces the buffer, so a stack variable is fine */
+	err = snd_usb_ctl_msg(chip->dev, usb_sndctrlpipe(chip->dev, 0),
+			      UAC2_CS_MEM,
+			      USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
+			      param,
+			      snd_audiofuse_windex(mixer, SND_AF_ENTITY_SET),
+			      &val, sizeof(val));
+
+	snd_usb_unlock_shutdown(chip);
+	return err;
+}
+
+/* Returns the number of bytes read, or a negative error code */
+static int snd_audiofuse_read_status(struct usb_mixer_interface *mixer,
+				     u8 *buf)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	int len;
+
+	len = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0),
+			      UAC2_CS_MEM,
+			      USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
+			      0,
+			      snd_audiofuse_windex(mixer, SND_AF_ENTITY_STATUS),
+			      buf, SND_AF_STATUS_LEN);
+	if (len < 0)
+		return len;
+
+	/* enable with dynamic debug: file mixer_quirks.c +p */
+	print_hex_dump_debug("AudioFuse status: ", DUMP_PREFIX_OFFSET, 16, 1,
+			     buf, len, false);
+	return len;
+}
+
+static int snd_audiofuse_ctl_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.integer.value[0] =
+		kcontrol->private_value & SND_AF_VAL_MASK;
+	return 0;
+}
+
+static int snd_audiofuse_ctl_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
+	unsigned long pval = kcontrol->private_value;
+	u16 param = pval >> SND_AF_PARAM_SHIFT;
+	u8 oldval = pval & SND_AF_VAL_MASK;
+	long newval = ucontrol->value.integer.value[0];
+	int err;
+
+	if (newval < 0 || newval > 1)
+		return -EINVAL;
+	if (newval == oldval)
+		return 0;
+
+	err = snd_audiofuse_ctl_write(list->mixer, param, newval);
+	if (err < 0)
+		return err;
+
+	/* update the cache only after the device accepted the value */
+	kcontrol->private_value = ((unsigned long)param << SND_AF_PARAM_SHIFT) |
+				  newval;
+	return 1;
+}
+
+static int snd_audiofuse_ctl_resume(struct usb_mixer_elem_list *list)
+{
+	unsigned long pval = list->kctl->private_value;
+
+	return snd_audiofuse_ctl_write(list->mixer,
+				       pval >> SND_AF_PARAM_SHIFT,
+				       pval & SND_AF_VAL_MASK);
+}
+
+static int snd_audiofuse_controls_create(struct usb_mixer_interface *mixer)
+{
+	struct snd_kcontrol_new knew = {
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.info = snd_ctl_boolean_mono_info,
+		.get = snd_audiofuse_ctl_get,
+		.put = snd_audiofuse_ctl_put,
+	};
+	u8 *status;
+	int len, i, err = 0;
+
+	/*
+	 * The quirk is applied for every mixer of the card, but the vendor
+	 * entities are only reachable through the control interface 0.
+	 * Checking this per mixer (instead of a global flag) keeps the
+	 * controls working after re-plugging and with multiple devices.
+	 */
+	if (mixer->hostif->desc.bInterfaceNumber != SND_AF_CTRL_IFNUM)
+		return 0;
+
+	status = kmalloc(SND_AF_STATUS_LEN, GFP_KERNEL);
+	if (!status)
+		return -ENOMEM;
+
+	/* a failed read is not fatal: start from "off" and keep audio working */
+	len = snd_audiofuse_read_status(mixer, status);
+	if (len < 0)
+		usb_audio_warn(mixer->chip,
+			       "AudioFuse: cannot read device status (%d)\n",
+			       len);
+
+	for (i = 0; i < ARRAY_SIZE(snd_audiofuse_ctls); i++) {
+		const struct snd_audiofuse_ctl *ctl = &snd_audiofuse_ctls[i];
+		u8 val = 0;
+
+		if (ctl->status_offset < len)
+			val = !!status[ctl->status_offset];
+
+		knew.name = ctl->name;
+		knew.private_value =
+			((unsigned long)ctl->param << SND_AF_PARAM_SHIFT) | val;
+
+		err = add_single_ctl_with_resume(mixer, 0,
+						 snd_audiofuse_ctl_resume,
+						 &knew, NULL);
+		if (err < 0)
+			break;
+	}
+
+	kfree(status);
+	return err;
+}
+
 int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 {
 	int err = 0;
@@ -4609,6 +4793,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x03f0, 0x0269): /* HP TB Dock G2 */
 		err = hp_dock_mixer_create(mixer);
 		break;
+	case USB_ID(0x1c75, 0xaf02): /* Arturia AudioFuse */
+		err = snd_audiofuse_controls_create(mixer);
+		break;
 	}
 
 	return err;
-- 
2.53.0

