Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62640451984
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790431131; cv=none; b=NbPLUYMLZxgcTidQBZ8hUjHtJuHtw0p5SnA2VC1tWtgzJHH+EMvC9ihcUnpwxXzGMEocvaKGFLf0n5VjeTLW1zmMTlC5Y8vhGayyOZolwMd2Rewe/AZPeY72lrvKBmy+rgcvMM+oEcNG34QkczXzKuuAG/NnyBNJZwqyHcFGIC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790431131; c=relaxed/simple;
	bh=sJiMHeN/tOpoqA4LehMacgNNmxNdHSFKWMtZmwxX3Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gp/h5UN0Jsp8/DQj2uQOEB7/vGlbx+I0npXiOOxhjCheti7XZiMdQFOkvuX7JS/Lw2aJ08tg3gzWLJsYYhbONTH+D+CEaiyXKQ/DFm2lQPZ/xFQgucv9dFV1DUN3tAAL3Yc5kMkrsZJBrLK25aLP7TKehEjhz+OSXNkW8BZBEyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WbsS8onZ; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="WbsS8onZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Zm
	pUxSHoF7rMfTQzYotMsMnyUuhQTmpvyCnXgcX4hSw=; b=WbsS8onZbInK4whtIg
	WPx9xK5T4a3ZInmhHuGLkW36wYJOzgrRrDUh9lk4GhwtFAdugJH3juwDohZs36BF
	f3Cs9Xk00xrXqfe+N/pP02zQmFiVlfq+ypZL367q3nR7uWq4SC08gG54vjZtXwhu
	n85xcNYvsDS7Yl0dUAoFp1Bg8=
Received: from zeyuli-Adol-14-M5451GADOL (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3H8lrz7dqvH7TAw--.43424S2;
	Sat, 26 Sep 2026 21:58:16 +0800 (CST)
From: Zeyu Li <13776528859@163.com>
To: Takashi Iwai <tiwai@suse.com>,
	"Jaroslav Kysela --cc=linux-sound @ vger . kernel . org" <perex@perex.cz>
Cc: linux-kernel@vger.kernel.org,
	Zeyu Li <13776528859@163.com>
Subject: [PATCH] ALSA: hda/realtek: Add ALC235 support for headset mode
Date: Sat, 26 Sep 2026 21:58:00 +0800
Message-ID: <20260926135800.27347-1-13776528859@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H8lrz7dqvH7TAw--.43424S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW5GF18Ar18Cr4kZr4rAFb_yoW8Kry7pw
	15Kw4rGF4xAF1qyay8JFWSq3W8KFy0gF1UZw4ak34fZF4jq3y8JFyUtFyDKF45CF9Fka47
	urySqr4UGa43XFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piWE__UUUUU=
X-CM-SenderInfo: zprtllawvsmmivz6il2tof0z/xtbC+hiaT2q3z3hWMwAA34

The ALC235 (0x10ec0235) is registered as the ALC255 codec variant in
patch_alc269(), but the headset mode functions were missing a case
for it, so the CTIA/OMTP jack type detection and routing never ran
on this codec. As a result, a plugged-in headset is detected (jack
presence works) but the microphone signal is never routed, leaving
the capture stream permanently silent.

Verified on an ASUS M5451GA laptop (HDA:10ec0235,10431814): with the
ALC255 coef sequence applied, the headset microphone works correctly.

Signed-off-by: Zeyu Li <13776528859@163.com>
---
 sound/hda/codecs/realtek/realtek.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/hda/codecs/realtek/realtek.c b/sound/hda/codecs/realtek/realtek.c
index db365a746..bc5226fad 100644
--- a/sound/hda/codecs/realtek/realtek.c
+++ b/sound/hda/codecs/realtek/realtek.c
@@ -1292,6 +1292,7 @@ static void alc_headset_mode_unplugged(struct hda_codec *codec)
 	}
 
 	switch (codec->core.vendor_id) {
+	case 0x10ec0235:
 	case 0x10ec0255:
 		alc_process_coef_fw(codec, coef0255);
 		break;
@@ -1407,6 +1408,7 @@ static void alc_headset_mode_mic_in(struct hda_codec *codec, hda_nid_t hp_pin,
 	};
 
 	switch (codec->core.vendor_id) {
+	case 0x10ec0235:
 	case 0x10ec0255:
 		alc_write_coef_idx(codec, 0x45, 0xc489);
 		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
@@ -1562,6 +1564,7 @@ static void alc_headset_mode_default(struct hda_codec *codec)
 		alc_process_coef_fw(codec, coef0225);
 		alc_hp_enable_unmute(codec, 75);
 		break;
+	case 0x10ec0235:
 	case 0x10ec0255:
 		alc_process_coef_fw(codec, coef0255);
 		break;
@@ -1663,6 +1666,7 @@ static void alc_headset_mode_ctia(struct hda_codec *codec)
 	};
 
 	switch (codec->core.vendor_id) {
+	case 0x10ec0235:
 	case 0x10ec0255:
 		alc_process_coef_fw(codec, coef0255);
 		break;
@@ -1780,6 +1784,7 @@ static void alc_headset_mode_omtp(struct hda_codec *codec)
 	};
 
 	switch (codec->core.vendor_id) {
+	case 0x10ec0235:
 	case 0x10ec0255:
 		alc_process_coef_fw(codec, coef0255);
 		break;
@@ -1881,6 +1886,7 @@ static void alc_determine_headset_type(struct hda_codec *codec)
 	}
 
 	switch (codec->core.vendor_id) {
+	case 0x10ec0235:
 	case 0x10ec0255:
 		alc_process_coef_fw(codec, coef0255);
 		msleep(300);
-- 
2.53.0

