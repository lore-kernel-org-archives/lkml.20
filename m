Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450943;
	b=fLmXPRxPbSbqLL/FbOqDnvtu+sPiyghRA2DKOChM9f6U5fUgmmaXd7fhDhlaIoDdKV3u
	 xLm+E6qLafhkZlkLT3xifaOgmjfNVZktfu9rMTl7TqhGnLG/um7S4h395UyfopbcJj8ge
	 zncpborWa0GlE8afnKROfjvSHFllUFQq/m6a3pv5AlbvUgHhCQJwaos4saGekDmqUw4Uz
	 qu6c+HyHIbIV8H1JPsoLHA7T7UzeWaxGO3kVs+Wcen99QqdpKn04oy9qBGXVJGItvSxXy
	 T6hIIjkiGyRaPZg9SDuJZGFE/lExhREChVMeH+yLv0snZ7gL2Kuh9zpsQevYYW+lcmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zraiqcqrqhJWYv6kozl2Pz+m4C0IhnfwuOksIs6CLCE=;
	b=Bjw8B/K9f8kR3uzIWtWTQf7ECCqalGzWA/XCpcjI90Zy6a26Z7lC94Sg4uAqOr4JEj4t
	 AfheRyRzBVHmETZboxyeAejP7taeQAItYViJzbrnoES88W/RmHxLkrpc9xzET+iJzYShT
	 kxvZti/dQ0IOILu/qAfNMJdyvIGN9xgGueLyWSffULB2U6YYDRxnRXz4YFQmC0buFUKiI
	 eCE+N2awViTnUX9CZ+jQI6t/GefOiAvhsEzeFKNWPMcOomMGhW77Ejq6FwvKY3CIpO8mp
	 d/WEMxoaxRwOQQ6VZXu3kTa3UD1eGOdmxL6M9YRP8nVrNzJZOeYxWDkzwQPXthLRS3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NUzkIfPC;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBB7606A325
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEBB7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NUzkIfPC
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-81ae6aefdceso2373378a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792450942; x=1793055742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zraiqcqrqhJWYv6kozl2Pz+m4C0IhnfwuOksIs6CLCE=;
        b=NUzkIfPCL8LfG9GJna5426ezcATIb78zd4wGWYUc3g7E1OIZ86kngW37tvJO7gJ1Eb
         zJV569aurEIRr/cajxz1Z8RUpG7L2wqZ//8/m34RtrIGU2HRuqiZ+fnwqQ06+1OW+k1M
         GvmBeL25T+YJSMeWy/o+KadkswoUsz62TXhrhKeWDms025M5iHVggHNHj749dHS4vOqx
         z53dqrxo4hVzgacBX8+GtGwx9xgZ/nwl8MZQiEBdpCBy4+Rjfu9PMduwHa6UmNo8pzg4
         qthzB7kIIIykfuckijl3MCAmz5+MyRsO4Q/hV1VSzOp1pcANOomzBwlBkgNPlV0Hdj/W
         V7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450942; x=1793055742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zraiqcqrqhJWYv6kozl2Pz+m4C0IhnfwuOksIs6CLCE=;
        b=KaOo94SJ1HN/Cv3unGIC/lq3eROEbiYs3psoD56kYcyLenyARGbwl7qhoWKKtvorEl
         y7r0PZRzwriPxDXPFeXA26vMORY29svmrBWwTxrwx4nGpSNvk2HVz7JBdmnrCopf40fZ
         O7Q2HXoMcaDPUWJCEbeSXblFGsawKp1Kl2XCDSEcfFwyNf0RNkwjApGuMz55HXSa45B8
         tFyMUeY/+B7yzEqYlqVDfeV6jq1YYGXhXbdCGFNyTznCml8rX8AJrTXgyNXLF3gnX+8Y
         MHyeUfZ9znUIV94rQsb6WDNHiBeLbiHk+JSdkbu43/5JgvQUsPOuHLz3ysuUHYirkElk
         a9Xg==
X-Forwarded-Encrypted: i=1; AKwUvBztIxwJ55727aGUsNIEBo+g0Ig2aApgxfpHE4g1L+IYWUeKvcsraZyosCwjFfGOnRLrg10n7MxnGF4glJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFD63sIapykjTSRDTXfPGGa6R152dfRLzALjkqIXJ2gyO8TPjg
	ejdzSB9fm2MA1mdxkPaQUb5hvF1yv4JNZl4IPlS4pyC+CH92EF+/gnBK
X-Gm-Gg: AYBFou3Q8M+gcLi2IqrkXiTSmbKEAJzewgYTKomWlzBt/3QP/ihDjpAch/hNI8grLIj
	+MPoWvlwqGRc7/JIopmcIxb8jCMzpruFw/yNBYJd61Hg5+ORcGYWX+EY5pLARmB7h1iO2wQfHuU
	BSr5jD/1AA2bS2xuAmzt8Ux9saqXCdAk41XHmwzntJOxuScOYGni+Up9Itp4KoSuDEV6dpVVmQi
	14nUVmTDgH3f4GCId6mYIIzaesbLJJxLGrajKDfP8ScC5WgiNGhJNvfWo7mJ5rVjvkXS0asTBCo
	5q2m9D78DVW37f5c9zn5Bn6b0BFB4PSpAHxP6Kg9D3hCicYy9Qy8ihEzLf301RgI7AeQ3vSfIIV
	fX7VZ5nHIjyGlfKpSwyk/0LUd7lc7eifRVlMVlRner3qripoDIgq+RKHINruBrroYt8gpp0stKc
	h+80GLV02wpjGKNo1BbZt4KYqIK5en0TAa5WBn7FH88iNFTkya8+wRkbASOelp6BIDZdLG7o136
	cBZm9w7ijxi9vsj
X-Received: by 2002:a05:6808:13c6:b0:4f4:d7:b15b with SMTP id 5614622812f47-53cc6b003a6mr8280876b6e.4.1792450941672;
        Mon, 19 Oct 2026 16:02:21 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b6d7e0csm9327797fac.12.2026.10.19.16.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:02:21 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 3/5] ALSA: usb-audio: Add Audient iD14 MkI mixer matrix
Date: Mon, 19 Oct 2026 18:01:57 -0500
Message-ID: <20261019230159.834954-4-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019230159.834954-1-mrwillporter@gmail.com>
References: <20261019230159.834954-1-mrwillporter@gmail.com>
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

Mixer unit 60 mixes 14 inputs (Mic 1-2, Digi 1-8, DAW 1-4) into four
outputs (Main L/R, Cue L/R). GET RANGE reports -127 to 0 dB in 1 dB
steps, so the generic driver creates four "Analogue 4 Volume" controls
with values from 0 to 127. The crosspoints take -128 dB (mute) to +6 dB
in 1/256 dB steps. The reported range cannot show the gains above 0 dB
or the fine steps that Audient's iD application uses.

Add one control per crosspoint, "Mix <output> <input> Playback Volume".
The value is the device's s16 in 1/256 dB, from -128 dB (mute) to
+6 dB. The fine steps carry the pan law of Audient's iD application.
GET CUR works, so get reads the device. Hide the generic controls in
the MkI map. The driver writes nothing to the mixer at probe.

Test setup:
- iD14 MkI, firmware 1.1.1
- Bazzite 44, kernel 7.2.9-ogc3.1.fc44
- snd-usb-audio built out of tree from the v7.2.9 sound/usb sources
  and the complete driver (this commit and the later ones)

Results:
- crosspoints read back after writes
- DAW 1/2 reach Main L/R and Cue L/R through them (listening test)

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient_id.c | 124 +++++++++++++++++++++++++++++++++++
 sound/usb/mixer_maps.c       |   1 +
 2 files changed, 125 insertions(+)

diff --git a/sound/usb/mixer_audient_id.c b/sound/usb/mixer_audient_id.c
index b4d1e1697..5b38590ce 100644
--- a/sound/usb/mixer_audient_id.c
+++ b/sound/usb/mixer_audient_id.c
@@ -43,6 +43,7 @@
 #define ID14_FU_OUT		0x0a	/* feature unit before the outputs */
 #define ID14_ROUTE		0x33	/* routing XU: CN = destination */
 #define ID14_MON		0x36	/* monitor controller XU */
+#define ID14_MIXER		0x3c	/* mixer unit: 14 inputs x 4 outputs */
 
 /* Control selectors */
 #define ID14_ROUTE_SOURCE	0x06	/* u8: source of the destination */
@@ -60,6 +61,7 @@
  * use 1 dB steps. The controls show the steps: 0 (-128 dB, mute) ... 128 (0 dB).
  */
 #define ID_DB(db)		((db) * 256)
+#define ID_DB_MIN		ID_DB(-128)	/* 0x8000: mute */
 #define ID_VOL_MAX		128		/* control value for 0 dB */
 
 enum id_kind {
@@ -392,10 +394,125 @@ static int id_add_ctl(struct usb_mixer_interface *mixer, const struct id_ctl *c)
 	return snd_usb_mixer_add_list(&e->list, kctl, false, true);
 }
 
+/*
+ * iD14 MkI mixer crosspoints: CS 1, CN = input * 4 + output, s16 in
+ * 1/256 dB. The control value is the raw s16, -128 dB (mute) ... +6 dB;
+ * the iD application's pan law needs the fine steps. GET CUR works; no
+ * probe writes.
+ */
+#define ID14_MIX_OUTPUTS	4
+#define ID14_MIX_MAX		ID_DB(6)
+
+static const char *const id14_mix_inputs[] = {
+	"Mic 1", "Mic 2",
+	"Digi 1", "Digi 2", "Digi 3", "Digi 4", "Digi 5", "Digi 6", "Digi 7", "Digi 8",
+	"DAW 1", "DAW 2", "DAW 3", "DAW 4",
+};
+
+static const char *const id14_mix_outputs[ID14_MIX_OUTPUTS] = {
+	"Main L", "Main R", "Cue L", "Cue R",
+};
+
+static const DECLARE_TLV_DB_MINMAX_MUTE(id14_mix_tlv, -12800, 600);
+
+static int id14_mix_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = ID_DB_MIN;
+	uinfo->value.integer.max = ID14_MIX_MAX;
+	return 0;
+}
+
+struct id14_mix {
+	struct usb_mixer_elem_list list;	/* first: snd_usb_mixer_elem_free */
+	u8 cn;
+};
+
+static int id14_mix_read(struct id14_mix *m, long *val)
+{
+	u8 buf[2];
+	int err;
+
+	err = id_xfer(m->list.mixer, false, ID14_MIXER, UAC2_MU_MIXER, m->cn, buf, sizeof(buf));
+	if (err < 0)
+		return err;
+	*val = clamp_t(long, (s16)get_unaligned_le16(buf), ID_DB_MIN, ID14_MIX_MAX);
+	return 0;
+}
+
+static int id14_mix_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *v)
+{
+	struct id14_mix *m = snd_kcontrol_chip(kctl);
+	long val;
+	int err;
+
+	err = id14_mix_read(m, &val);
+	if (err < 0)
+		return err;
+	v->value.integer.value[0] = val;
+	return 0;
+}
+
+static int id14_mix_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *v)
+{
+	struct id14_mix *m = snd_kcontrol_chip(kctl);
+	long cur, val = v->value.integer.value[0];
+	u8 buf[2];
+	int err;
+
+	if (val < ID_DB_MIN || val > ID14_MIX_MAX)
+		return -EINVAL;
+	CLASS(snd_usb_lock, pm)(m->list.mixer->chip);
+	if (pm.err < 0)
+		return pm.err;
+	err = id14_mix_read(m, &cur);
+	if (err < 0 || cur == val)
+		return err;
+	put_unaligned_le16(val, buf);
+	err = id_xfer(m->list.mixer, true, ID14_MIXER, UAC2_MU_MIXER, m->cn, buf, sizeof(buf));
+	return err < 0 ? err : 1;
+}
+
+static int id14_mix_add_ctl(struct usb_mixer_interface *mixer, unsigned int in,
+			    unsigned int out)
+{
+	struct snd_kcontrol_new knew = {
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
+			  SNDRV_CTL_ELEM_ACCESS_VOLATILE |
+			  SNDRV_CTL_ELEM_ACCESS_TLV_READ,
+		.info = id14_mix_info,
+		.get = id14_mix_get,
+		.put = id14_mix_put,
+		.tlv.p = id14_mix_tlv,
+	};
+	struct snd_kcontrol *kctl;
+	struct id14_mix *m;
+
+	m = kzalloc_obj(*m);
+	if (!m)
+		return -ENOMEM;
+	m->list.mixer = mixer;
+	m->list.id = ID14_MIXER;
+	m->cn = in * ID14_MIX_OUTPUTS + out;
+
+	kctl = snd_ctl_new1(&knew, m);
+	if (!kctl) {
+		kfree(m);
+		return -ENOMEM;
+	}
+	snprintf(kctl->id.name, sizeof(kctl->id.name), "Mix %s %s Playback Volume",
+		 id14_mix_outputs[out], id14_mix_inputs[in]);
+	kctl->private_free = snd_usb_mixer_elem_free;
+	return snd_usb_mixer_add_list(&m->list, kctl, false, true);
+}
+
 /* called from mixer_quirks.c */
 int snd_audient_id14_mk1_controls_create(struct usb_mixer_interface *mixer)
 {
 	const struct id_ctl *c;
+	unsigned int in, out;
 	int err;
 
 	for (c = id14_mk1_ctls; c->name; c++) {
@@ -403,5 +520,12 @@ int snd_audient_id14_mk1_controls_create(struct usb_mixer_interface *mixer)
 		if (err < 0)
 			return err;
 	}
+	for (in = 0; in < ARRAY_SIZE(id14_mix_inputs); in++) {
+		for (out = 0; out < ID14_MIX_OUTPUTS; out++) {
+			err = id14_mix_add_ctl(mixer, in, out);
+			if (err < 0)
+				return err;
+		}
+	}
 	return 0;
 }
diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 7795a5fbe..e147c1a48 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -529,6 +529,7 @@ static const struct usbmix_name_map audient_id14_map[] = {
 /* Audient iD14 MkI: model-specific control map. */
 static const struct usbmix_name_map audient_id14_mk1_map[] = {
 	{ 12, "Monitor Mix Playback" },	/* FU, partial coverage */
+	{ 60, NULL },			/* MU, see mixer_audient_id.c */
 	{}
 };
 
-- 
2.47.3

