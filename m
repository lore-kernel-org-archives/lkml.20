Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C271B15746F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434433; cv=none; b=eOGc2aBAArpd+cy4ANb0m1LAPaIro7IPFob9NJMmUlxj0nLjXGC5ORPLrabVLj3/Bz5VIN1XBiE09G5fpfHIvnOz3/VtW41sy9lh0C4/G/YN3izkYZujKc0QxRpNjO9yHZBM5c5H8EWu8gws20QXceLNkGYs4t6h+gCJ5y8Rxg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434433; c=relaxed/simple;
	bh=5O5eqfLypWfDjYsCqtepdYKUYbkiq/D3qpQ19awntLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmQKI0kocAdZiqhZ18cZSIP/1z0gsbFQFdkqjHETDBy0r9FHUEwor2y9lvJVxQxb6tOWznJK5Kfc4ry2he1x6N3IbNbZpLu1OJTg7MNTJ8NmbeuHd/R6djTHtVtLeqhtcRqEW0syX6pcvEmfECmZ84BCn8JPVXQi4DWLhmA6U0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKV4kSua; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKV4kSua"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f4f53975e6so4576599a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434429; x=1790039229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6cNDLrhI7CpmG5tLA8lLPnVJATdUTBCme7lo3eW3A4=;
        b=hKV4kSuau/nhJoaEGTEIH4YthKRMQXpHme38KnaKsqIb+oJKuEZ+6m0lylpZIXmVn8
         ts2XRFp4cAgHghY7TjfKVxszusf/ohRq99PBzXqUvTaZy4PsdGEfYpUVlBkwse9Seo9f
         cC7L1lEwy+HH8A2Xmz95ovO54K9dEcD5lonM312uyqtfmN25XVCPeaPsRhKwvHiMjBlZ
         MLNtrkbaIGv9cL2FNaNhc3ONgIftBSMObPIdtyqb+lOMLSh95BoPSAlkEaHG62MBsGLq
         gwHeCFSlZCf9Fhqk71fod6Kx+bCmTCqFM20pQTJo0R9fk9DkShmI17k8ObdSkqrd1uMY
         6VDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434429; x=1790039229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6cNDLrhI7CpmG5tLA8lLPnVJATdUTBCme7lo3eW3A4=;
        b=SWOXOFpdnZ1WUBj4RpQvQUir38uIsjaEdVPDePkyjpwEkqZMUmJs+1QXhzdcYCNn00
         mgPv+jI94S5PY0gtxuLT4XuPGnxX2O9R+NwptBESa8FlAVPiVNMr9/5QrKMm7xW1GbRL
         YZ7dVO4EzN/a4BJHSBilWaOxBr++GfDNI82oVFzrHVV0541m0HC/TJBawcIaRg9grhEL
         38UNaD/TdiTiez7QCInrXO/mAFqqrrU/2zenlkWZphtIAzu+DPmehXEKT127aHfayLds
         Nzp5D9kkxhbTUjPJ9r7ERLjQmYYYqc8t9qGmfpCzhhbNACm3J1ejjXYcWpwE3mEwx1lD
         rnRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaKBUNYozqT8HWvRMURJI13PQE/Rud2+jZTNruL7OrtBEpd8hWYzhzew9/g2TXGpucWQGZZHIMJaNRxaM=@vger.kernel.org
X-Gm-Message-State: AFuF++m0VkSCUcQe7ViuU/FMGLkxz0dR9QrnOithTVoiERDkEVRCY6B/
	x9Bd0NjAHUnddbCh9d6zvQ5ux/mvsokxHnm9qDOapXErwZ+W5PMryH+s
X-Gm-Gg: AYBFou1mTmeEAmIovxgfwe0EjHdQcHyibJXir+b2kG+WT24vg66OatZAIPBen6yqzlc
	MNa2ck0/g2xHeWdj6TJf1ENUfUvmPzd7nGOKM7x25w6CFCyEjb+yiQfppoYSKuEWz3vvTr2D8Rz
	NyRf7q+oHfLBw3wLuq0+HwRurnlBT8wDFImpeOPq7/QCF9+2kqdByE+XZjfKr6pb7vH8MQzkI41
	YXnjU5WkyIydcvFBOqvxRuozpCgE0xZq9PaRqfRyX77XvFk+GuVYZNR6Ku9pPsQ3TIIlXTVrbpR
	EPjAZ4KG63XHO9umuxDcQGfHZTPQvio0VWUCZB4OPWNfEckrjR4NLHwo3Oxc2jCAovBxROtLScY
	cvBSiqFjWIEzEICIVDlv0G2Ae03z3zWC+FMaeKcj6sScA2Q70ayrvHIYK6lTUxCNZxnqXzV9k3z
	IkUNCWyT7lBX2j0EI1ultFOqFrBlVkDe4AwMcgWHLfLREYgyYKxLso2Br+fwRKWXzh8sh1AZQS3
	MRvu8PfDZS0h6d81SX/SuaJWpoCnShtwJ0aoUY1wrQbIn4leDIqDTOatQR3bEZvUFC9VfOdoKM/
	c02zeduXRyNS+sDL+bTEbTMIzQvwtIkgr9vvJTbrFJRbXEvQwg+/HO7ogAOVwUVJ
X-Received: by 2002:a05:6820:198e:b0:6c1:653b:d2da with SMTP id 006d021491bc7-6c542a38753mr3056904eaf.28.1789434429402;
        Mon, 14 Sep 2026 18:07:09 -0700 (PDT)
Received: from rithvik-nitroan51557.tailece47.ts.net (23-93-86-111.dedicated.static.sonic.net. [23.93.86.111])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33be20c67b7sm3077346eec.15.2026.09.14.18.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:07:09 -0700 (PDT)
From: Rithvik Vibhu <rithvikvibhu@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rithvik Vibhu <rithvikvibhu@gmail.com>
Subject: [PATCH v2 1/2] ALSA: hda: Allow jack presence to follow another pin
Date: Mon, 14 Sep 2026 18:06:56 -0700
Message-ID: <20260915010657.36140-2-rithvikvibhu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915010657.36140-1-rithvikvibhu@gmail.com>
References: <871pavol7n.wl-tiwai@suse.de>
 <20260915010657.36140-1-rithvikvibhu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some combo jacks, the microphone pin can report absence even when
a headset is plugged in. Ordinary jack gating still requires the
microphone pin's own presence bit, so it cannot handle this case.

Add snd_hda_jack_set_presence_source() to derive a jack's presence
entirely from another pin. Use the existing gating relationship for
callback propagation, and invalidate the related caches before
callbacks run for events from either pin.

Keep the dependent jack detectable and non-phantom so generic
microphone autoswitching can use it. Make the new behavior opt-in,
preserving ordinary gating for existing callers.

Assisted-by: LLM
Signed-off-by: Rithvik Vibhu <rithvikvibhu@gmail.com>
---
 sound/hda/common/hda_jack.h |  4 ++
 sound/hda/common/jack.c     | 83 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/sound/hda/common/hda_jack.h b/sound/hda/common/hda_jack.h
index e9b9970c5..8887d70ca 100644
--- a/sound/hda/common/hda_jack.h
+++ b/sound/hda/common/hda_jack.h
@@ -37,6 +37,7 @@ struct hda_jack_tbl {
 	unsigned int jack_detect:1;	/* capable of jack-detection? */
 	unsigned int jack_dirty:1;	/* needs to update? */
 	unsigned int phantom_jack:1;    /* a fixed, always present port? */
+	unsigned int gating_jack_only:1; /* presence comes only from the gate */
 	unsigned int block_report:1;    /* in a transitional state - do not report to userspace */
 	hda_nid_t gating_jack;		/* valid when gating jack plugged */
 	hda_nid_t gated_jack;		/* gated is dependent on this jack */
@@ -101,6 +102,9 @@ snd_hda_jack_detect_enable_callback(struct hda_codec *codec, hda_nid_t nid,
 int snd_hda_jack_set_gating_jack(struct hda_codec *codec, hda_nid_t gated_nid,
 				 hda_nid_t gating_nid);
 
+int snd_hda_jack_set_presence_source(struct hda_codec *codec, hda_nid_t nid,
+				     hda_nid_t source_nid);
+
 int snd_hda_jack_bind_keymap(struct hda_codec *codec, hda_nid_t key_nid,
 			     const struct hda_jack_keymap *keymap,
 			     hda_nid_t jack_nid);
diff --git a/sound/hda/common/jack.c b/sound/hda/common/jack.c
index 1d6b0f0e6..5e8045388 100644
--- a/sound/hda/common/jack.c
+++ b/sound/hda/common/jack.c
@@ -204,7 +204,7 @@ static void jack_detect_update(struct hda_codec *codec,
 	if (!jack->jack_dirty)
 		return;
 
-	if (jack->phantom_jack)
+	if (jack->phantom_jack || jack->gating_jack_only)
 		jack->pin_sense = AC_PINSENSE_PRESENCE;
 	else
 		jack->pin_sense = read_pin_sense(codec, jack->nid,
@@ -405,6 +405,68 @@ int snd_hda_jack_set_gating_jack(struct hda_codec *codec, hda_nid_t gated_nid,
 }
 EXPORT_SYMBOL_GPL(snd_hda_jack_set_gating_jack);
 
+static bool is_detectable_analog_pin(struct hda_codec *codec, hda_nid_t nid)
+{
+	unsigned int wcaps = get_wcaps(codec, nid);
+
+	return get_wcaps_type(wcaps) == AC_WID_PIN &&
+		!(wcaps & AC_WCAP_DIGITAL) &&
+		get_defcfg_connect(snd_hda_codec_get_pincfg(codec, nid)) ==
+			AC_JACK_PORT_COMPLEX &&
+		is_jack_detectable(codec, nid);
+}
+
+/**
+ * snd_hda_jack_set_presence_source - Use another pin's presence detection
+ * @codec: the HDA codec
+ * @nid: pin with unreliable presence detection
+ * @source_nid: pin providing presence detection
+ *
+ * Unlike ordinary gating, this ignores @nid's own pin sense. Both pins must
+ * be jack-detectable analog pins; the target remains a normal, non-phantom
+ * jack. The source's events also invoke the target's registered callbacks.
+ * Set this up during codec probing, before jack controls are created.
+ * Chained or conflicting relationships and DisplayPort MST are not supported.
+ *
+ * Return: zero on success, -EINVAL for an unsupported relationship, or
+ * -ENOMEM if a jack-table entry cannot be allocated.
+ */
+int snd_hda_jack_set_presence_source(struct hda_codec *codec, hda_nid_t nid,
+				     hda_nid_t source_nid)
+{
+	struct hda_jack_tbl *jack, *source;
+
+	if (codec->dp_mst || !nid || !source_nid || nid == source_nid ||
+	    !is_detectable_analog_pin(codec, nid) ||
+	    !is_detectable_analog_pin(codec, source_nid))
+		return -EINVAL;
+
+	jack = snd_hda_jack_tbl_get(codec, nid);
+	source = snd_hda_jack_tbl_get(codec, source_nid);
+	if ((jack && (jack->phantom_jack || jack->gated_jack ||
+		      jack->key_report_jack ||
+		      (jack->gating_jack && jack->gating_jack != source_nid))) ||
+	    (source && (source->phantom_jack || source->gating_jack ||
+			source->key_report_jack ||
+			(source->gated_jack && source->gated_jack != nid))))
+		return -EINVAL;
+
+	if (!snd_hda_jack_tbl_new(codec, nid, 0) ||
+	    !snd_hda_jack_tbl_new(codec, source_nid, 0))
+		return -ENOMEM;
+
+	/* Allocating the source entry may have moved the jack table. */
+	jack = snd_hda_jack_tbl_get(codec, nid);
+	source = snd_hda_jack_tbl_get(codec, source_nid);
+	jack->gating_jack = source_nid;
+	jack->gating_jack_only = 1;
+	jack->jack_dirty = 1;
+	source->gated_jack = nid;
+	source->jack_dirty = 1;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_hda_jack_set_presence_source);
+
 /**
  * snd_hda_jack_bind_keymap - bind keys generated from one NID to another jack.
  * @codec: the HDA codec
@@ -741,6 +803,25 @@ void snd_hda_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	} else
 		event->jack_dirty = 1;
 
+	/* A target-only event must also refresh its source's cached sense. */
+	if (event->gating_jack_only) {
+		struct hda_jack_tbl *source =
+			snd_hda_jack_tbl_get_mst(codec, event->gating_jack,
+						 event->dev_id);
+
+		if (source)
+			source->jack_dirty = 1;
+	}
+	if (event->gated_jack) {
+		struct hda_jack_tbl *gated =
+			snd_hda_jack_tbl_get_mst(codec, event->gated_jack,
+						 event->dev_id);
+
+		/* The source need not have a callback that reads its pin sense. */
+		if (gated && gated->gating_jack_only)
+			gated->jack_dirty = 1;
+	}
+
 	call_jack_callback(codec, res, event);
 	snd_hda_jack_report_sync(codec);
 }

base-commit: c9e6e5f38bf75276605f1952b22285f5f3abcaff
-- 
2.55.0

