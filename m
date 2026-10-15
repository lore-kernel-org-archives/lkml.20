Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322D73B5314;
	Thu, 15 Oct 2026 02:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792030376; cv=none; b=WSdAkkHZ1btVOrNoXPTWvUyeVOX+Mq4NJiPWsSoiyihCOu2yI9vT456wEOd3oTxe2+uuZ4tN0fv00j50MSydXTYep+7h4GtGTvIySdD7ei7enps4wq1tMTbuNcscBcnMqc7+GVAb/Kf5Cy/CSK9831YT1dNsfkly6T2G12TtolQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792030376; c=relaxed/simple;
	bh=XYNbB6cQO1CmStFe0RCQDlPRgWVXev5Kqq1wi6EjdzA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wlns1VGwdVgdMxNsUnf5HPt86cBTzvuHjKxl7eIBOcNCFf6oh+V0XDIO+vEYDq4BEe1GDHEdellWIFmYqiUtLhoZHCDZ9vYgqh9i/nEvFSylX0exYTQwBX6fXYMeTPQN5FHFSUdaeF70OLY/SRZhxFd788TA6SRAc4X8Jqg/nI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JsZAufML; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JsZAufML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0j
	ET81PnFNgNqpKzJuA5wHASKLaxhr+lBNloSaPkHyc=; b=JsZAufMLItjlzZHO3E
	z1mH+SROF3tYQq6hyZeDv4kP4hvRHTOAoBNTywZ6oyyM91B8TpmH1bbIaBYqDXZH
	tMycVGbbRs91ljH08SMjMCr4OJwJg6aMy4fbwKE14NjYNwRKLgOC1mnvX88ttB1H
	kYqno6Cc0a/uY6vTVYuOPGUxQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnfyaBNtBqXMiMAA--.64967S2;
	Thu, 15 Oct 2026 10:12:19 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	wangdich9700@163.com,
	perex@perex.cz
Cc: wangdicheng@kylinos.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Limit Line In boost and ADC gain on DECENTA MATX03
Date: Thu, 15 Oct 2026 10:12:10 +0800
Message-Id: <20261015021210.106392-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnfyaBNtBqXMiMAA--.64967S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF4fKF1kWrWDWr1xWry3Jwb_yoW5tw4rpF
	1Sy3W5CFs3WryIyrsxtr1UZw1rGa48Jr1rGay3t34Svan8Ar1kGayavrW5tF15Jr1rKF1S
	vr9aqa45KrnxZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRfM3iUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC5wN8y2rQNoNPXgAA3N

From: wangdicheng <wangdicheng@kylinos.cn>

The DECENTA MATX03 (ALC897, SSID 1e0b:1297) exposes a high gain
range on both the Line In pin boost and the ADC input amp. Pin 0x1a
reports nsteps=0x03 with stepsize=0x27, that is 0, 9.75, 19.5 and
29.25 dB. ADC 0x08 reports nsteps=0x3f with stepsize=0x02, that is
0 to 31.5 dB in 0.5 dB steps, and defaults to 0x3f (maximum). The
combined 60.75 dB analogue cascade overloads the front-end when the
source level is high, producing audible noise during Line In
monitoring.

Add a new fixup alc897_fixup_limit_linein_boost that overrides the
amp capabilities of pin 0x1a to nsteps=1 (max ~11.75 dB) and ADC
0x08 to nsteps=1 (max ~0.5 dB). The total gain drops from 60.75 dB
to ~12.25 dB, eliminating the clipping.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---

v1->v2:
- Simplify the fixup function to use hard-coded NIDs (0x1a, 0x08)
  instead of generic pin/ADC iteration.
- Move the SND_PCI_QUIRK entry to the proper position sorted by
  PCI SSID order.
- Drop the model name addition from alc662_fixup_models[] since it
  is not needed.
---
 sound/hda/codecs/realtek/alc662.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
index eff7c83b9c59..c1c7277b6754 100644
--- a/sound/hda/codecs/realtek/alc662.c
+++ b/sound/hda/codecs/realtek/alc662.c
@@ -198,6 +198,24 @@ static void alc897_fixup_lenovo_headset_mode(struct hda_codec *codec,
 	}
 }
 
+static void alc897_fixup_limit_linein_boost(struct hda_codec *codec,
+					    const struct hda_fixup *fix, int action)
+{
+	if (action != HDA_FIXUP_ACT_PROBE)
+		return;
+
+	snd_hda_override_amp_caps(codec, 0x1a, HDA_INPUT,
+				  (0x00 << AC_AMPCAP_OFFSET_SHIFT) |
+				  (0x01 << AC_AMPCAP_NUM_STEPS_SHIFT) |
+				  (0x2f << AC_AMPCAP_STEP_SIZE_SHIFT) |
+				  (0 << AC_AMPCAP_MUTE_SHIFT));
+	snd_hda_override_amp_caps(codec, 0x08, HDA_INPUT,
+				  (0x00 << AC_AMPCAP_OFFSET_SHIFT) |
+				  (0x01 << AC_AMPCAP_NUM_STEPS_SHIFT) |
+				  (0x02 << AC_AMPCAP_STEP_SIZE_SHIFT) |
+				  (0 << AC_AMPCAP_MUTE_SHIFT));
+}
+
 static const struct coef_fw alc668_coefs[] = {
 	WRITE_COEF(0x01, 0xbebe), WRITE_COEF(0x02, 0xaaaa), WRITE_COEF(0x03,    0x0),
 	WRITE_COEF(0x04, 0x0180), WRITE_COEF(0x06,    0x0), WRITE_COEF(0x07, 0x0f80),
@@ -326,6 +344,7 @@ enum {
 	ALC897_FIXUP_HEADSET_MIC_PIN3,
 	ALC662_FIXUP_CSL_GPIO,
 	ALC897_FIXUP_BEELINK_SER6_AMP,
+	ALC897_FIXUP_LIMIT_LINEIN_BOOST,
 };
 
 static const struct hda_fixup alc662_fixups[] = {
@@ -787,6 +806,10 @@ static const struct hda_fixup alc662_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_gpio4,
 	},
+	[ALC897_FIXUP_LIMIT_LINEIN_BOOST] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc897_fixup_limit_linein_boost,
+	},
 };
 
 static const struct hda_quirk alc662_fixup_tbl[] = {
@@ -857,6 +880,7 @@ static const struct hda_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1b35, 0x1234, "CZC ET26", ALC662_FIXUP_CZC_ET26),
 	SND_PCI_QUIRK(0x1b35, 0x2206, "CZC P10T", ALC662_FIXUP_CZC_P10T),
 	SND_PCI_QUIRK(0x1c6c, 0x1239, "Compaq N14JP6-V2", ALC897_FIXUP_HP_HSMIC_VERB),
+	SND_PCI_QUIRK(0x1e0b, 0x1297, "DECENTA MATX03", ALC897_FIXUP_LIMIT_LINEIN_BOOST),
 	SND_PCI_QUIRK(0x1e63, 0x6d9a, "F+ FLAPTOP r", ALC897_FIXUP_HP_HSMIC_VERB),
 	SND_PCI_QUIRK(0x1f66, 0x0202, "Beelink SER6 Max 6900", ALC897_FIXUP_BEELINK_SER6_AMP),
 
-- 
2.25.1

