Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E25A4E4C4C;
	Tue, 13 Oct 2026 12:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893068; cv=none; b=tPDQFS3S+kgjs3ix8pFDjcMYuZQ+x6nuF1KdwRQ4eWRaVTmomWa79O/howVFQ0Oipdojnadz4PyVQFWNadUk69EUQQFoUJ8W/IiywUpF1cMb+uA7c6OuC3kGFyiD1kkHfwLMRuWkkw8mkA7DmTs8dd0KJxE0zVOuDfjJPFlzkR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893068; c=relaxed/simple;
	bh=TD3OOfnVDe4MsO1kGCAiM9NYuCtzEvmpUK0h+6y1jiI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dw+qY4XEhDxkHH48qiDctKFlC7XdLOzVggDv5hD+IYBHIzvWN3oURFXymZlhTy5pdpjd8GsH1PD6OpF2KuRZNmE/MF/os6j4jv4+ORcfUDYV4ClvO9PAupAM+zXvjaohNRHlxG5X9hXPoA3FAN9FFrjHRSfMB/Y6te+E6qjEyqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Y3yAXFev; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Y3yAXFev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=F0
	a0sun/DlUOUhg+oQI47pu+NZ1gqi59SBBJS3E+Lqs=; b=Y3yAXFevTrbe173s5i
	4MCLj2g1iVYGM8YWJ4rC4LYQ7xBi58ybqqh+O4hlY3UrPf87Tq7PCeksiwWNA06U
	Wi24EIUk+WZo1Dr2N2DOOcyHOh0ZPYFdPmlnDA9H89e6BKDndlYyeQKdtJfPGOIu
	Bk6XomtAY53tOB74KhvQ1bOyo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3360lHs5ql5G+EA--.65161S2;
	Tue, 13 Oct 2026 20:03:51 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	wangdich9700@163.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng@kylinos.cn
Subject: [PATCH] ALSA: hda/realtek: Limit Line In boost and ADC gain on DECENTA MATX03
Date: Tue, 13 Oct 2026 20:03:27 +0800
Message-Id: <20261013120327.998217-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3360lHs5ql5G+EA--.65161S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF43Xr4fury8KF17CF1xXwb_yoWruw1UpF
	4Sy3W5CFs5XFyIyrs3tr1UX3WrGa4rGr1fC3y5tw1av3Z5CrWkGa9YyrWayF15JryFgF1S
	vrnaqa4Ykw43ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRfM3iUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC5wfeLmrOHidyQQAA3+

From: wangdicheng <wangdicheng@kylinos.cn>

The DECENTA MATX03 (ALC897, SSID 1e0b:1297) exposes a high gain
range on both the Line In pin boost and the ADC input amp. Pin 0x1a
reports nsteps=0x03 with stepsize=0x27, that is 0, 9.75, 19.5 and
29.25 dB. ADC 0x08 reports nsteps=0x3f with stepsize=0x02, that is
0 to 31.5 dB in 0.5 dB steps, and defaults to 0x3f (maximum). The
combined 60.75 dB analogue cascade overloads the front-end when the
source level is high, producing audible harmonic distortion during
Line In monitoring.

Add a new fixup alc897_fixup_limit_linein_boost that overrides the amp
capabilities of the Line In and external Mic pins to nsteps=1 (max
~11.75 dB), and also limits the ADC input amp to nsteps=1 (max ~0.5 dB).
The total gain drops from 60.75 dB to ~12.25 dB, eliminating the
clipping. Internal and dock mic pins are excluded to avoid affecting
built-in microphones.

Tested on the affected machine: with the fixup applied, Line In
recording at maximum source volume is clean, and dmesg confirms the
fixup is picked:

  ALC897: picked fixup alc897-limit-linein-boost (SSID)

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc662.c | 50 +++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
index eff7c83b9c59..a140891d51fa 100644
--- a/sound/hda/codecs/realtek/alc662.c
+++ b/sound/hda/codecs/realtek/alc662.c
@@ -198,6 +198,49 @@ static void alc897_fixup_lenovo_headset_mode(struct hda_codec *codec,
 	}
 }
 
+static void alc897_fixup_limit_linein_boost(struct hda_codec *codec,
+					    const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+	struct auto_pin_cfg *cfg = &spec->gen.autocfg;
+	int i;
+
+	if (action != HDA_FIXUP_ACT_PROBE)
+		return;
+
+	for (i = 0; i < cfg->num_inputs; i++) {
+		hda_nid_t nid = cfg->inputs[i].pin;
+		unsigned int defcfg;
+
+		if (cfg->inputs[i].type != AUTO_PIN_LINE_IN &&
+		    cfg->inputs[i].type != AUTO_PIN_MIC)
+			continue;
+
+		defcfg = snd_hda_codec_get_pincfg(codec, nid);
+		if (snd_hda_get_input_pin_attr(defcfg) == INPUT_PIN_ATTR_INT ||
+		    snd_hda_get_input_pin_attr(defcfg) == INPUT_PIN_ATTR_DOCK)
+			continue;
+
+		snd_hda_override_amp_caps(codec, nid, HDA_INPUT,
+					  (0x00 << AC_AMPCAP_OFFSET_SHIFT) |
+					  (0x01 << AC_AMPCAP_NUM_STEPS_SHIFT) |
+					  (0x2f << AC_AMPCAP_STEP_SIZE_SHIFT) |
+					  (0 << AC_AMPCAP_MUTE_SHIFT));
+	}
+
+	for (i = 0; i < spec->gen.num_all_adcs; i++) {
+		hda_nid_t adc = spec->gen.all_adcs[i];
+		unsigned int caps;
+
+		caps = query_amp_caps(codec, adc, HDA_INPUT);
+		if ((caps & AC_AMPCAP_NUM_STEPS) >> AC_AMPCAP_NUM_STEPS_SHIFT > 1) {
+			caps &= ~AC_AMPCAP_NUM_STEPS;
+			caps |= (0x01 << AC_AMPCAP_NUM_STEPS_SHIFT);
+			snd_hda_override_amp_caps(codec, adc, HDA_INPUT, caps);
+		}
+	}
+}
+
 static const struct coef_fw alc668_coefs[] = {
 	WRITE_COEF(0x01, 0xbebe), WRITE_COEF(0x02, 0xaaaa), WRITE_COEF(0x03,    0x0),
 	WRITE_COEF(0x04, 0x0180), WRITE_COEF(0x06,    0x0), WRITE_COEF(0x07, 0x0f80),
@@ -326,6 +369,7 @@ enum {
 	ALC897_FIXUP_HEADSET_MIC_PIN3,
 	ALC662_FIXUP_CSL_GPIO,
 	ALC897_FIXUP_BEELINK_SER6_AMP,
+	ALC897_FIXUP_LIMIT_LINEIN_BOOST,
 };
 
 static const struct hda_fixup alc662_fixups[] = {
@@ -787,6 +831,10 @@ static const struct hda_fixup alc662_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_gpio4,
 	},
+	[ALC897_FIXUP_LIMIT_LINEIN_BOOST] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc897_fixup_limit_linein_boost,
+	},
 };
 
 static const struct hda_quirk alc662_fixup_tbl[] = {
@@ -859,6 +907,7 @@ static const struct hda_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1c6c, 0x1239, "Compaq N14JP6-V2", ALC897_FIXUP_HP_HSMIC_VERB),
 	SND_PCI_QUIRK(0x1e63, 0x6d9a, "F+ FLAPTOP r", ALC897_FIXUP_HP_HSMIC_VERB),
 	SND_PCI_QUIRK(0x1f66, 0x0202, "Beelink SER6 Max 6900", ALC897_FIXUP_BEELINK_SER6_AMP),
+	SND_PCI_QUIRK(0x1e0b, 0x1297, "DECENTA MATX03", ALC897_FIXUP_LIMIT_LINEIN_BOOST),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
@@ -954,6 +1003,7 @@ static const struct hda_model_fixup alc662_fixup_models[] = {
 	{.id = ALC662_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
 	{.id = ALC669_FIXUP_ACER_ASPIRE_ETHOS, .name = "aspire-ethos"},
 	{.id = ALC897_FIXUP_UNIS_H3C_X500S, .name = "unis-h3c-x500s"},
+	{.id = ALC897_FIXUP_LIMIT_LINEIN_BOOST, .name = "alc897-limit-linein-boost"},
 	{}
 };
 
-- 
2.25.1

