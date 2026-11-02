Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643737;
	b=GY6oUK7W6fwTQLY01IWXfce3zKgaIALPQldV8eQ3f9Eh0aRasLBCBXhkm0xFvwJg3rgC
	 P8ZHTWm4/kIDrUPLlximZ+EqNPf1DqW1v97pGb/dj5N2s+JqpH6QyvLonGXARTWc5LhfG
	 Z/2YTYM+ENt6APRc/+67fhnUj6rztL0jAdjRjXXqii2ZnkBNoiuya2cXFH/MaCv8YbryU
	 6pSbJYpsxLcDyZ9LRdO5okNcEL2m/OKgC1cGbRdmzfj9VTuehOY5871GwQJ58/BUTpu6X
	 KJbe0kAztmKrqCd8z1ursyivZIXqUhbAwLLUbEnnhyzvey9Pb3yLDzXtslFf1kAXN7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tyG+KrBGnuPWnNF/+fOUZY6fmOkYDusAbsJroxJ3bGI=;
	b=REvpNejLEIe5P7I1f7b4BTrxUKZy4CNMK7MKHSCEtwTUjejiwQ4NORqKEjzmT6VT/Fpw
	 ZVfKFSaw6pmAl6OlTpRJLATG4ADgU0GgA5as1SpiJfrvg6wf2BLnYmOVFGQ8LLa/8wuk1
	 V0zBMwwoOgpiTsGo08I8EHVbJBapey524Eu7N7pgCsWusGG2L3h7fBxzOlTvi2hPJWI0y
	 1Neg9xFb8/07Q6zMgn5+dSoAai2smN7hwDJpXPTjcpif/CnktvoozP3HxS4AuaUXr/tqg
	 Qhtq520SUyH02eIRyYZaBHznGI2spXbpxuzSuDNnaLN/9PkufWw7DJ2s4YN7XuyQHog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqkAYYvH;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A8606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 944A8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqkAYYvH
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso26424765e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793643735; x=1794248535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tyG+KrBGnuPWnNF/+fOUZY6fmOkYDusAbsJroxJ3bGI=;
        b=hqkAYYvHWlrHi8VJJivANXVITPxtd/zXbc1eoojhPOiDbEV5mijfP4A1IW04AWHKM2
         RqCEWLjn8ZT3SZqVVU1PR9lpd/BPMrHL/1aqz04RFdlLaJf3HCOOE3qY1hL0WZGte+3W
         9wx+8v1zoSHpblnkweFr78mCvjEGC8zs5LUIJzJjWSajvL3ptxxXbzXHgkc6v9dtd0pz
         X9SvrTfqfBzGFM+KcTXqiIfnnjzycx231WEqm3DLMOfiJxLdhnykQGhNAuOGBT81i6vz
         QL8A3W7kaRFFOhvSCtOsHsvs40pEhO2d/zaT55cZVwyb+wfFiXOP1nGYzFmUEH3VOSHg
         kkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793643735; x=1794248535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyG+KrBGnuPWnNF/+fOUZY6fmOkYDusAbsJroxJ3bGI=;
        b=IM1bn0Dh97wkIrAXlP4NTZSfcxMNC/SlkCs9szQILdKgA4oRT9swxJVXEiTPirtx2w
         2jb1VOp5xr8XURi3AcRsqfNMRvQ1UGWDZad4K4KAie8BiaZs/izLmUg54KoTj8E7a76b
         ZD4HPnlaS68AelKcl5vvDHjX+0ooRgNpNdaOHWKbC8NHAXgDCAsQifAmhKd6ABb877xl
         gDozjDIjMIECIRt8JoJujUbv00+KBNS81C2BS+HraW0Cims3HZMqKxIDgwy5J/34GnEy
         mE5jJfjOInhZhiLjnnlmQP0PiZTMYqlVsNJ06KWwn/dh+c14VuhlD1v2KyaOdJiDEguO
         raCg==
X-Forwarded-Encrypted: i=1; AKwUvBw9CC9RmB7+IuIep/IN48fNg0dTCQSFEJn/Gukl5Mi4HBFeVDmz1oKMdACzFbu/Am2cZoqugk0VnR3Bc/4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKy9OVo/5BjH8Myh05hFCKCfafjyI9hjrlOQtJG8KfMiPOUqaa/
	niN04bPuCzOkjBq6762Pjq9RFf5S3j763M+xB8H+maMrXuXW24sVbSo=
X-Gm-Gg: AYBFou0JkgU5tAPTf1ZpS0i7iYX4KHghgk7rh4jRpfnn5hwRvA31EPRG5/R6J/5wMQt
	52BfuTLEoZ8A4Hik/f73gj/Tme1bTnAJ6AjeAg8KrQN4ZzyqvqHnJPnfujS6/V6iwQITkzBhoy7
	2n0HC08jT1j+X4W3f7KsZ1hi9suyUDXF8fTzHbSoQMeu8Iq4JUPZcuPlvlkKBhaNPN61tpaz5+G
	sF7xVtEilyqlQ6tKW2OZuMsbqUNB2BQ8r18nzMxxoioyFlSONiXVNalFum3vAMlFIiHB3veyLY/
	Dl3cj8RQW9KHgdy0A5dJJKtiX7XCyFmeR+lZ+cvvSonyj2qqVLMUEVOt6AZ8lNw6SwjlpAGjBAy
	PRBuwtuNPceX04SyRo8hW2OlsLzOewIUun8NzvCucK0J5zUwNilqweo3E8MQ1i8dGGDn7tSkCtv
	URzPuHHpBH2i/n6PPJdNQetsQp9I8x7lkuIKsiASIFslHijf7JKNvmx+B84Z6v3M/aOejMpTDQ/
	EYYFpD+za3NMAao2pIfw6lcT3Vt9nwDfm/RyrsMjvZ6zkdedPXxZalk69Kx8TH5Qu45ppYv2TTP
	p6Vu39wACEWIr5HMKbt/jq6sVZvENbPf8HzEU/pPis0Biq9HuNHi48PUu3yvZRM/W6AvnZfj8So
	jKR82UHsmMoO+3aZJLEPR2jz8v5MLIcvQIRWaVwK377BsGJLl6yGCwjEZFmKvFO3ssjaRfH9NF5
	0L4TJRzr3mAf13w0Wflnfy4nbLoAyUCQNe7uRRcvvIVP0sD13Npvc/YE1HypZO
X-Received: by 2002:a05:600d:a:b0:4ac:aae6:6400 with SMTP id 5b1f17b1804b1-4acaae665a6mr184831455e9.13.1793643734734;
        Mon, 02 Nov 2026 10:22:14 -0800 (PST)
Received: from cachyos-x8664 ([2a02:2f0f:9208:cf00:b848:3801:1bc:d8d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm23878903f8f.6.2026.11.02.10.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:22:14 -0800 (PST)
From: Razvan Dinculescu <razvandinculescu@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/hdmi: Don't share an assigned converter on NVIDIA codecs
Date: Mon,  2 Nov 2026 20:22:13 +0200
Message-ID: <20261102182213.2154560-1-razvandinculescu@gmail.com>
X-Mailer: git-send-email 2.56.0
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

All pins of the NVIDIA HDMI/DP codecs share one connection list, so a
converter can be selected by several pins at once. Unlike the Intel
codecs (intel_not_share_assigned_cvt()), the NVIDIA ones never move an
idle pin off the converter that another pin streams on, and the display
that should play stays silent.

Seen on an RTX 5090 (codec 0x10de00aa) with a DP monitor on pin 0x04
and an HDMI TV on pin 0x05. PipeWire probes every PCM at start-up: the
monitor's PCM got converter 0x08 and kept it selected after closing,
then the TV's PCM got 0x08 as well when it was opened. With both pins
on 0x08 the TV played nothing, although its PCM was running and its
ELD was valid. Opening the monitor's PCM while the TV's was running
moved the monitor to 0x09 and the TV played at once. Restarting
PipeWire put both pins back on 0x08.

Implement pin_cvt_fixup for the generic NVIDIA model as Intel does:
when a converter is assigned to a pin, move every other connected pin
that selects it to an unassigned converter. Look the converter up in
each pin's own connection list instead of assuming the same order on
every pin.

With this change, three PipeWire restarts in a row left the monitor on
0x09 and the TV on 0x08, and the monitor pin forced back onto 0x08 with
hda-verb was moved off it at the next prepare.

Signed-off-by: Razvan Dinculescu <razvandinculescu@gmail.com>
---
 sound/hda/codecs/hdmi/nvhdmi.c | 76 ++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/sound/hda/codecs/hdmi/nvhdmi.c b/sound/hda/codecs/hdmi/nvhdmi.c
index 94671ad..95ae773 100644
--- a/sound/hda/codecs/hdmi/nvhdmi.c
+++ b/sound/hda/codecs/hdmi/nvhdmi.c
@@ -66,6 +66,81 @@ static const struct drm_audio_component_audio_ops nvhdmi_audio_ops = {
 	.master_unbind = snd_hda_hdmi_acomp_master_unbind,
 };
 
+/*
+ * All pins of these codecs share one connection list, as on Intel.  An idle
+ * pin left selecting the converter that another pin streams on takes that
+ * stream: the display that plays stays silent and the audio goes to the
+ * other display instead.  Seen on GB202 (0x10de00aa) with an HDMI TV and a
+ * DP monitor: whenever the monitor's PCM was opened first (PipeWire probes
+ * every PCM at start-up), its pin kept the converter the TV got next.
+ *
+ * Move every other connected pin off the converter just assigned, to a
+ * converter nobody uses.
+ */
+static void nvhdmi_not_share_assigned_cvt(struct hda_codec *codec,
+					  hda_nid_t pin_nid, int dev_id,
+					  hda_nid_t cvt_nid)
+{
+	struct hdmi_spec *spec = codec->spec;
+	struct hdmi_spec_per_pin *per_pin;
+	struct hdmi_spec_per_cvt *per_cvt;
+	int pin_idx, cvt_idx, mux_idx, curr, dev_id_saved;
+
+	if (!cvt_nid)
+		return;
+
+	for (pin_idx = 0; pin_idx < spec->num_pins; pin_idx++) {
+		per_pin = get_pin(spec, pin_idx);
+		/* no display on this pin */
+		if (!per_pin->pcm)
+			continue;
+		if (per_pin->pin_nid == pin_nid && per_pin->dev_id == dev_id)
+			continue;
+		if (per_pin->dev_id >=
+		    snd_hda_get_num_devices(codec, per_pin->pin_nid) + 1)
+			continue;
+
+		dev_id_saved = snd_hda_get_dev_select(codec, per_pin->pin_nid);
+		snd_hda_set_dev_select(codec, per_pin->pin_nid, per_pin->dev_id);
+		curr = snd_hda_codec_read(codec, per_pin->pin_nid, 0,
+					  AC_VERB_GET_CONNECT_SEL, 0);
+		if (curr < 0 || curr >= per_pin->num_mux_nids ||
+		    per_pin->mux_nids[curr] != cvt_nid)
+			goto restore;
+
+		for (cvt_idx = 0; cvt_idx < spec->num_cvts; cvt_idx++) {
+			per_cvt = get_cvt(spec, cvt_idx);
+			if (per_cvt->assigned || per_cvt->cvt_nid == cvt_nid)
+				continue;
+			for (mux_idx = 0; mux_idx < per_pin->num_mux_nids; mux_idx++)
+				if (per_pin->mux_nids[mux_idx] == per_cvt->cvt_nid)
+					break;
+			if (mux_idx == per_pin->num_mux_nids)
+				continue;
+			codec_dbg(codec,
+				  "hdmi: move pin 0x%x off cvt 0x%x to cvt 0x%x\n",
+				  per_pin->pin_nid, cvt_nid, per_cvt->cvt_nid);
+			snd_hda_codec_write_cache(codec, per_pin->pin_nid, 0,
+						  AC_VERB_SET_CONNECT_SEL,
+						  mux_idx);
+			break;
+		}
+restore:
+		snd_hda_set_dev_select(codec, per_pin->pin_nid, dev_id_saved);
+	}
+}
+
+static void nvhdmi_pin_cvt_fixup(struct hda_codec *codec,
+				 struct hdmi_spec_per_pin *per_pin,
+				 hda_nid_t cvt_nid)
+{
+	if (per_pin)
+		nvhdmi_not_share_assigned_cvt(codec, per_pin->pin_nid,
+					      per_pin->dev_id, per_pin->cvt_nid);
+	else
+		nvhdmi_not_share_assigned_cvt(codec, 0, 0, cvt_nid);
+}
+
 static int probe_generic(struct hda_codec *codec)
 {
 	struct hdmi_spec *spec;
@@ -77,6 +152,7 @@ static int probe_generic(struct hda_codec *codec)
 	codec->dp_mst = true;
 
 	spec = codec->spec;
+	spec->ops.pin_cvt_fixup = nvhdmi_pin_cvt_fixup;
 
 	err = snd_hda_hdmi_parse_codec(codec);
 	if (err < 0) {
-- 
2.56.0

