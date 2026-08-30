Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA20A30569F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788124270; cv=none; b=Xv4jqRQilfag1lBcQgavlkYs4/UgXFHEn8vxI1vCbhwTaft7ikliC6FhbRE074Ed6CY92SUKKxZHT0qyG6sRLnhbtads4Tpc2mNx/w0xAqht73um0GfjhsvExddln7+AgJx6M+PqbhWLHNZqcTHGrdhKlQy2tAkqeGs5IW8xxNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788124270; c=relaxed/simple;
	bh=x1SkIl6iKUUejh7zdfLj/CjsYpbNg1BMET6btHWa4WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A7aTua8ttQ9cZTutIYKWT/uhew/tlO9yIYy/1xb5NDCUR9iNCQfUeSYJinTpHYJIur4THVEpzg7VSe+5pqsMuyy3TiTj1jkRmeulyPAypqfhTm7uSST2amygtVfPDP47W63ARATm9Ca1O7TUGPYJ7u/xkCDbEITP7725sSpa0+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Us2rrRKK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Us2rrRKK"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e2fdf5abso1228270f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788124267; x=1788729067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CVLu7tw+tzyiEDt7AhVn43dizoUQJSvF2qQeqgPHb+4=;
        b=Us2rrRKK6+WSCdChbEFdb7QgBdhy3mA+U+cAu0nRMYdDYDUC8HG7nd6SF0K+Pb1IcN
         DM36SA69fI7pF5H+skdk0QbQ1y9Z6YdYQF8I0LQu39Oc4d96/SF3k8fxGdUMViXzWsbH
         cpoBRgl7/pn3SBbeKjUcNdqoLZXAcZA1JGaTBNyvp0BH3lCujRRQcGUd87U0uMDwCLB0
         yVzZS3qOx6HzEsO4Ggd+Dlp85pnNCaEQuBkOL1q0rZ/JX11ZbKVN9XbeWxF6+mhy8Lax
         2X2Yo0qmXQ6wzt5cjDozy2YdtXc/+h/JWpMpNurF7/Vw5IWTvKE7Xt032qZktcnu6XmW
         aacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788124267; x=1788729067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVLu7tw+tzyiEDt7AhVn43dizoUQJSvF2qQeqgPHb+4=;
        b=M5h/OUOb6wp2HdntDEM14Nkg7gypTxKVhIQ3ywKPQcw1trUC3J28o0VCUZhx+CEBcy
         f/ai7hXQCp0MODEysMaMjmru7CUhhGJXQuacqBk+1t7AlnySfyQaxtE6zXj2cUWLRuNo
         h9XcGaqgF4Kp3RsbPgSjBsXc9VENCT5qPADoSo3Hj0vPDDnZ0mRVd5Fy62zHRKiVFzFs
         zlaMs22hwl0tdn+ZvM1gyoz31Nw3VDljWL7ija7VLxm3XDYDjRMOOR56tVxCfelKBQBf
         wvxeE5UcrzF2XiHQC+EPrXqz7orstied1JeWAV29K2PfMV267ungd6xE6jYQqZUtEigF
         W6yQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHE99q3uLp7gcvBBhA4eKPvb1/UvO/2Wd4xgP3OdviMV1gHOzZD9sPYF6MsrKvrmjzORD8Ypo8iUpSzTs=@vger.kernel.org
X-Gm-Message-State: AFuF++mKdO7FewM++CMyYyA41qn6hWGuz+BrBBENY0EQiHXhdKTSoGTn
	xuSo5p8i+fYxpSH9AJ0VXePPun6PHzGmqxHpzqz2rQeCjaI2s5zAud1SnEnH3VNjBfI=
X-Gm-Gg: AYBFou3mDbDMLiNnHBjvFRmriuu9B28Wq2mccroFgdoJWvIUmFv6NkGa5CuzrHm3Up6
	ld+NzipxU7SL0vUDphJ3ubUXUgzPPod4PWqZVn+5GFOguVgUzyTSmigzEv+5xw1gsetESjit0zl
	ws/I0aJc8SrekeGKibfSUSWXroHh9STZzY1CUdonGGlEy0wVxHJQMFYALXBLHwn2Es8Z34+8kba
	t2nZgekPcgWW1wIlMDD/Ke2ob/PNsi12K70tZOJAOCXuh42tSRA+mL1hFS8F3mxwpGOQ4rrA07D
	+UfBS0lkeODAfPP+YDJ67gF4n42UyrR5nYe5IF0xPTHWBfZVnweEACfZiSkif1V9f9xxLbwgUkW
	3jwyvvYr/YfZdoakCOL6JKD+imtpzcDrDHAPW2WadZIV2c2NNZIqvMoEeqD0UgS0jacee9gSa82
	2Ka6IP5NY1p+JoOJl3AFVD1eImtfcjrQpP0Il+BtVBmxDDFAh03Kl41hXGnqhKpdMD2XPbnw==
X-Received: by 2002:a5d:5e01:0:b0:480:c5:d635 with SMTP id ffacd0b85a97d-482f782a4a2mr29764013f8f.0.1788124266841;
        Sun, 30 Aug 2026 14:11:06 -0700 (PDT)
Received: from laptop ([109.95.34.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20793sm17790800f8f.17.2026.08.30.14.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 14:11:06 -0700 (PDT)
From: Oleksandr Kovalov <oleksandr.kovalov.work@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksandr Kovalov <oleksandr.kovalov.work@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix cold-boot headset misdetection on Acer Aspire A515-57G
Date: Mon, 31 Aug 2026 00:10:38 +0300
Message-ID: <20260830211038.19528-1-oleksandr.kovalov.work@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Acer Aspire A515-57G (PCI SSID 1025:1616), if headphones are
already inserted into the combo jack before the codec powers up (a cold
boot with the plug already seated), the impedance-based headset-type
sensing races and misclassifies the jack. This drives the wrong output
configuration and is audible as missing center-panned content (e.g.
vocals) while panned content plays normally.

A genuine physical unplug/replug after boot reliably fixes this by
forcing a fresh sense transient, which is a strong hint about the
underlying cause: the sensing hardware appears to need a settled,
freshly-triggered read rather than the one-shot classification done
during the normal HDA_FIXUP_ACT_INIT pass.

Add a machine-specific fixup that, on cold boot only (not S3/S4 resume,
which already gets its own re-check), waits briefly after the normal
init-time decision and then forces a fresh headset-mode classification
by resetting the cached mode and re-invoking the existing
alc_fixup_headset_mode() path -- mirroring what a manual replug already
does. The wait+recheck is skipped whenever the first pass already
determined nothing is plugged in, to avoid adding boot latency on the
common case.

Tested on kernel 7.1.9 by building the affected module standalone and
confirming cold boot with headphones pre-inserted plays correctly from
the very first sample, across multiple boots (including a full restart,
and headphones inserted mid-POST rather than before power-on), with no
crashes or warnings and no behavioral difference from a real
post-replug recovery.

Signed-off-by: Oleksandr Kovalov <oleksandr.kovalov.work@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index bfbdb88..51b0900 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -2309,6 +2309,33 @@ static void alc_fixup_headset_mode_alc255_no_hp_mic(struct hda_codec *codec,
 	}
 }
 
+/*
+ * On the Acer Aspire A515-57G (and possibly other models sharing this
+ * board), if headphones are already inserted into the combo jack before
+ * the codec powers up (cold boot), the impedance-based headset-type
+ * sensing races and misclassifies the jack, driving the wrong output
+ * configuration (audible as missing center-panned/vocal content). A
+ * genuine physical unplug/replug after boot fixes it by forcing a fresh
+ * sense transient. Mirror that here on cold boot only: give the sense
+ * hardware time to settle, then force a fresh classification.
+ */
+static void alc_fixup_headset_mode_acer_coldboot(struct hda_codec *codec,
+						 const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	alc_fixup_headset_mode(codec, fix, action);
+
+	if (action == HDA_FIXUP_ACT_INIT &&
+	    !is_s3_resume(codec) && !is_s4_resume(codec) &&
+		spec->current_headset_mode != ALC_HEADSET_MODE_UNPLUGGED) {
+		msleep(500);
+		spec->current_headset_mode = ALC_HEADSET_MODE_UNKNOWN;
+		spec->current_headset_type = ALC_HEADSET_TYPE_UNKNOWN;
+		alc_fixup_headset_mode(codec, fix, action);
+	}
+}
+
 static void alc288_update_headset_jack_cb(struct hda_codec *codec,
 				       struct hda_jack_callback *jack)
 {
@@ -4063,6 +4090,7 @@ enum {
 	ALC282_FIXUP_ACER_DISABLE_LINEOUT,
 	ALC255_FIXUP_ACER_LIMIT_INT_MIC_BOOST,
 	ALC256_FIXUP_ACER_HEADSET_MIC,
+	ALC256_FIXUP_ACER_COLDBOOT,
 	ALC285_FIXUP_IDEAPAD_S740_COEF,
 	ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST,
 	ALC295_FIXUP_ASUS_DACS,
@@ -6050,6 +6078,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
 	},
+	[ALC256_FIXUP_ACER_COLDBOOT] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_headset_mode_acer_coldboot,
+	},
 	[ALC285_FIXUP_IDEAPAD_S740_COEF] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_ideapad_s740_coef,
@@ -6796,6 +6828,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1597, "Acer Nitro 5 AN517-55", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x160e, "Acer PT316-51S", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x1616, "Acer Aspire A515-57G", ALC256_FIXUP_ACER_COLDBOOT),
 	SND_PCI_QUIRK(0x1025, 0x1640, "Acer Aspire A315-44P", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1679, "Acer Nitro 16 AN16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
-- 
2.55.0

