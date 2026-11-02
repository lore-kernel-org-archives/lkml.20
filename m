Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646261;
	b=y8xggWHNgBS+KTCtwJKBaoPKMxb0dXMcROXc5u4/fw+/E7h77Dsg803MvcE++BrCf+Nr
	 2Y+qqs0Sy8m1a3NyytdWWw5uujuZpfOxFuWhVe1cUkhKzFzv3B0v/xROyPhI+8DqLuAp5
	 3LLpSKtkoskTIcqlXDKOxHAwmKCmJGZJyr3tZGeu2KsCpjN4hreILPX7BhxfzLoxj2/7D
	 aVBwKyeFp4KvCQr1pgT9+ZxWiFAroJCre7SbiOstycggIYozdWeOV/3h4YST8wsDCy9rE
	 eLffU28v73dN6ZNLsiUUevv90Jl3cvfmHh+7/fzkPDjqzfRA6sXfjJn0G7OXXX1h/QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M+QwIPWbbdAjBaKNUwmjBRmTqatLvbp8j/bjo+78+cQ=;
	b=l0mh/BBFgQcy0QU5s1P7j/iVfHspT0gBC54EVHEfNbDL7x7tuejwyOL87GF2EDPcB6iu
	 /kjSiI78CLKmdcEzzNpsYkA+7Z1vFdEFYn0UVHjta2UY4H445N/BEclnddtyi8MdQq1Ap
	 84pMLDNCPHzPcUf/z0H+zddCCAH+EAMRFjH9W3FJpNvitNgjFVMic8784F1OqN3ohroik
	 ldKcdd5JWB189hw3yz3D0Ul6+MbX4qCcOSPeG1b9Zcdde9xfjRimBZevDQgORUOH9oitH
	 RR3J11HhdDmH7uNmRDi6WHXCX76Fhnz6gfHzpzBRbv7IIae2HAyftSVCG9qey2eBrpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwF3Ax3c;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593AE606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593AE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwF3Ax3c
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so34341335e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646260; x=1794251060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+QwIPWbbdAjBaKNUwmjBRmTqatLvbp8j/bjo+78+cQ=;
        b=DwF3Ax3cXHIpP2vUuVn13JpsnNcBLJ8Le9rotXxtnsFh8M7nnLoOL5L30kkwv0YRyA
         QYjdwxX0YhO514qFqoFacNj3ENZ/yV3mpbSrakDBANGo4Q8slHJ3BYG09eMwqCcfrMPp
         q4BYyPneuWGovUUIPdJYpbxxl3/mKQhaDGlnIU9DK4NE6+ferRpWGQXSuCKlin7bpjYK
         4OZ9Xz6TkkBBIZoxmP6ylRDDF3NQB347IqhaiAnPPRFm20ip2DCtEYfbWnrLj7McJ2/O
         TrO5BRjofUc6fTc6buHf5P9wgVDuZAazSmmyW8/633Larn9FnIk00cgfa9DJTO/WRU42
         Z+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646260; x=1794251060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+QwIPWbbdAjBaKNUwmjBRmTqatLvbp8j/bjo+78+cQ=;
        b=a0bcJXGiP4e7tJb5yWsETJeYNytmm0VGndvR1BqTwC0iYHrJG5yjTVFDo0chLHOW97
         shUb8BCgKe2XVfg1aYbNNJptTOwTQl0ZQ6SfFMb769PXLiT1aHrOFZ65TYJIkHobjBRG
         gEoWCWdltM8qpDv5XPTtwzR7tsmfzVN3S745WSwz4YCoOrF3nU6k059LuNJf4vJFC1XJ
         AxWFbraUZq+z1NCsoET2r29XAXYw6BNlXywI7VXcgu/2ijKk0m0ae+IPAZUEeDDKP6ht
         HftCOdSEo/OZ7CuSFmc3HMZ8nFMmU3aJ29kvqxEyd6yK2SbkR9x3cI2Xj80DaTnZzZPo
         4GhA==
X-Forwarded-Encrypted: i=1; AKwUvBw9tA2ARKh5ocdcdwEJ5GywSn/U0JTSnAlW3kvd7lO3c+Gs7XXH2UixmzSSAr9uOQYQ2WhF9gCqpn8T/Zk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnZsEYF5ASR59PmT9h1p867yaEIQJo4GZWQZx1vmNG7Pmwv49i
	Bw7UscNgeQxQKd+wCqJ2C96e5C3f4VGUKo3dBIcej7RFAjf/g1i3Dns=
X-Gm-Gg: AYBFou3+0LfopszrcfYZAVBuf2qkOoI8O4/46qVsN972Ye7hI3Sm3S+r+1ZXJD68dpv
	sM8yeYcsIrmP0HlSwawb+yqnwOyxciosi1mRBtw4UODiaekTcuUOhV/t6Gd5DfnP+xNQNggmy5b
	mzb0HRxqtrTSPavGs+QGtiS84LNjTTK/HudmHTwXAvSU7F4Scu3BNBQKlEgawoyFK+IVCwpPKY3
	12c235FACMRn9XGsy8xxV+MYiFU9kOoFDGtetAXi2/SZkZdRP++cq+ky003ElqyfjY/VtnvPUW3
	h5H+m3m3ntb/xi5HzCYoXQJ2SZVLGCKXaeLHCGt13QHK9a11gwJvStzqOc4Olc7ZnecnQWHHgZ2
	ZVZMkaPPigAm28g4ST5oQ7WayBwcYfzRx8K9mnEWZDnRCwRfVsMx/acVtyuqndoPXnoYLF4GMZg
	DzmjWXiScElw5SW3IxObGLiBy4gJnWfi/eeFCFN7ptFzyq+zsPb0TmXnLcPITwFdwTNkwBYiCND
	k50XK2t7Ge4jU/Cxy4CHenZW2wkkjNVNXT8xqQejjWO6hRlA1KeJEjMFGfNUF8WIy3rXNpVK9RY
	Ol2ki/x1vuqsr+5Y8JlGGi3zkXt2t0836YXmT5E9NumbO88kjM507EJw0m97McLSDX8NtvpYfjl
	7ruUMvc2FqatiUZQqFsQNsKvBaripOwzu1eLoSGGRMeaZEEqyf9ITs+mGr+7/2VcwhmXAFBsb6l
	2tx9xVuEJBmWYFfWBTVvOHItKXJQ5HUJmyPZ3q4Y7xDFFHHXYM2jbJDQJMSH9P
X-Received: by 2002:a05:600c:3b18:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4ac1932b542mr260406925e9.35.1793646259405;
        Mon, 02 Nov 2026 11:04:19 -0800 (PST)
Received: from cachyos-x8664 ([2a02:2f0f:9208:cf00:b848:3801:1bc:d8d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a5372d8bsm8277235e9.0.2026.11.02.11.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:04:18 -0800 (PST)
From: Razvan Dinculescu <razvandinculescu@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/hdmi: Don't share an assigned converter on NVIDIA codecs
Date: Mon,  2 Nov 2026 21:04:17 +0200
Message-ID: <20261102190417.2661176-1-razvandinculescu@gmail.com>
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
restore the pin's own converter selection, which
snd_hda_hdmi_generic_pcm_prepare() relies on after the hardware drops
it, then move every other connected pin that selects the assigned
converter to an unassigned one. Look the converter up in each pin's
own connection list instead of assuming the same order on every pin.

Tested on that system with the TV's PCM on 0x08 and the monitor's on
0x09, both pins then forced onto 0x08 with hda-verb: a prepare on the
TV's PCM moved the monitor off 0x08, and a prepare on the monitor's
PCM put it back on 0x09.

Signed-off-by: Razvan Dinculescu <razvandinculescu@gmail.com>
---
v2:
- Restore the pin's own converter selection before moving the other
  pins, as i915_pin_cvt_fixup() does; without it a pin moved to another
  converter while its own PCM was open stayed there at its next prepare
  (reported by the Sashiko review of v1). The PipeWire restart test of
  v1 was not repeated; the code that moves the other pins is unchanged.

v1: https://lore.kernel.org/linux-sound/20261102182213.2154560-1-razvandinculescu@gmail.com/

 sound/hda/codecs/hdmi/nvhdmi.c | 97 ++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/sound/hda/codecs/hdmi/nvhdmi.c b/sound/hda/codecs/hdmi/nvhdmi.c
index 94671ad24b5e..e61ad1624dfb 100644
--- a/sound/hda/codecs/hdmi/nvhdmi.c
+++ b/sound/hda/codecs/hdmi/nvhdmi.c
@@ -66,6 +66,102 @@ static const struct drm_audio_component_audio_ops nvhdmi_audio_ops = {
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
+/*
+ * The hardware can drop a pin's converter selection, e.g. on a display
+ * reset.  snd_hda_hdmi_generic_pcm_prepare() relies on pin_cvt_fixup() to
+ * restore it, as i915_pin_cvt_fixup() does on Intel.
+ */
+static void nvhdmi_verify_pin_cvt_connect(struct hda_codec *codec,
+					  struct hdmi_spec_per_pin *per_pin)
+{
+	int curr;
+
+	curr = snd_hda_codec_read(codec, per_pin->pin_nid, 0,
+				  AC_VERB_GET_CONNECT_SEL, 0);
+	if (curr != per_pin->mux_idx)
+		snd_hda_codec_write_cache(codec, per_pin->pin_nid, 0,
+					  AC_VERB_SET_CONNECT_SEL,
+					  per_pin->mux_idx);
+}
+
+static void nvhdmi_pin_cvt_fixup(struct hda_codec *codec,
+				 struct hdmi_spec_per_pin *per_pin,
+				 hda_nid_t cvt_nid)
+{
+	if (per_pin) {
+		snd_hda_set_dev_select(codec, per_pin->pin_nid, per_pin->dev_id);
+		nvhdmi_verify_pin_cvt_connect(codec, per_pin);
+		nvhdmi_not_share_assigned_cvt(codec, per_pin->pin_nid,
+					      per_pin->dev_id, per_pin->cvt_nid);
+	} else {
+		nvhdmi_not_share_assigned_cvt(codec, 0, 0, cvt_nid);
+	}
+}
+
 static int probe_generic(struct hda_codec *codec)
 {
 	struct hdmi_spec *spec;
@@ -77,6 +173,7 @@ static int probe_generic(struct hda_codec *codec)
 	codec->dp_mst = true;
 
 	spec = codec->spec;
+	spec->ops.pin_cvt_fixup = nvhdmi_pin_cvt_fixup;
 
 	err = snd_hda_hdmi_parse_codec(codec);
 	if (err < 0) {
-- 
2.56.0

