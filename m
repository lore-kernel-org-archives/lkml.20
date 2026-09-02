Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A96338F250
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369287; cv=none; b=WLmhU9YpMPzhU1s+pbdBYljWlKQ/dbm+XgnAT8SZaYGUjqirKMvIPOmR87d1dcoYPB779010iLnIL3lIIW5DQbOjKa4o11BNj/q2L6aRXEpXrtgENEObbLRL2VOBuIt5+9wX4a5RiR6V3i8qMEKuj8rpbXR9ePknpqcdva69K1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369287; c=relaxed/simple;
	bh=qMZsljQDmb6N5lP7DSQvqvrfudliFDTL2G69BbIvksI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=URUwO2tpj4YUDQGa1IiQqjqCI0ocOY1j/oM0W9P4GTt+QqsBa+nYDlvsN6FwOMO7n61QhJ9oKOReIeSxfxSYFzqUqgVB/Sm8XSK/mDEaINxoTScRfkg47xf0cyck+9/9cJK1D0Q5a3u0gcvlqpbpbWXhoR2aYHztdwOfMzzI65s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=soKQ4Phy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="soKQ4Phy"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956869750eso8935815e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788369283; x=1788974083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAfzOXevgdtu1x0JDE+nFJSd7ktVRul0G2NSyc8HyKw=;
        b=soKQ4PhyzSAJO6sYchbDL/Ixjw9LQ9S/izg+1GF4Iak6wfTdD6NcBaT6oYIU1AAzpw
         EYNDap34djsSIzfXQP0jP+ah1Y9q+UyEjh6K0ymz/TETsyimr+MXtB8oXK8RO3YL4FeZ
         6Bm7gn70RPMhX4AHUQSkJjDpdW5HdSkl2GEfScBtlnUzuxo6THNoFWb1yO2LgfDOEXu9
         su1gSvUHIsjSoKlKTsrBLIQRG9h2zU8k030DdpQhgt6+d6JaUWG0xvllYVZGi+UyZycf
         w/I0DNqOswTUngy00PuPJ5SmSaa9e2AZ7EtqdZKM4U+wJBle5B/6vkLuMy7zaw+nVTpC
         QP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369283; x=1788974083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DAfzOXevgdtu1x0JDE+nFJSd7ktVRul0G2NSyc8HyKw=;
        b=aHLnSk+2pPBc6ILNlQPq/HKPojSZg+wsdBw0CCsKoCxzI1HMPkulaBlxypi2gwOVbo
         IbZVgqFfjFWNfF1nfImte6sRA6IiH4ehTSm4SbstSCFMlnu720NVGu86EnsjNdGFYpRZ
         zn//C773c3ITWOKp4I8FJ461iAY9btSL448xDnXz2j2oXWuhlaWQycRUXAkJk17z461+
         6wDV2tGulGynbTVbJ28+bzSztEhH+94dLm5nvGfo5H8Us0Djh1ERuxvmaZ+qBb7IUgoo
         sfF8un0ii8sHrjyISUOH1GtcaDSG0zGXnO49bzGc3i3YHrKB4VmacUt296/DWnlnBaYm
         b6Vw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+6bnfoInPOcqPZUiEeDQjGeZMMIpEYIw9iv3Sa7eMn711oPhQ8o9R9Oprk0Q4NhKcOaWO8vQw23C4A1s=@vger.kernel.org
X-Gm-Message-State: AFuF++mcxGdlQser8LUcxoUoLHxSdMl7EmDZ0bS5Mtz9J9YJmWramDME
	PNxCuif/mvD9jeDAKHyMINfwlJNvT9gsiHAxFdqqkB0rubzT8Go4UVO2
X-Gm-Gg: AR+sD13Y5h6MXMn8dg/p2qNNtweJRBT27/tvjk8QQsF+4c4LaOY5SugA26l+2rMhyaf
	1lNBwRUNE+T22F4ZyulIBnnyGQSFdx2vxsGm8nKo9h+3eRrAs2ganLLeq4bXCS6/jPTTJrv+3km
	FVo/r17j75rRZxNqnwVr0cL7q3Hi8Ds93IOwFyR6zDqVOGCvgw2dPlQyu02XDa+FpUPSVQJiUgN
	CBA/rD2C+FT9EfkOPpe4V+7OHWHfnUeC7Hg8w+IhXaHWQFtE3CGUkOP3oPcsqismx0Qg1jjWK7G
	3qFlq+GhvvnFXfXTvURhAZ3u6j1wFLJ4KUuIKJdcRSDHPaMBSGunGhwaPrrszl9aT9rh7nNRz6g
	1+cCE0hZ2N1zhBkMs7PaEaGsTyuudoUHSht1uXSMuJaNo6fry2Inv7oHs+cKs0HwmaLrn1DNniq
	8SrnqNGwvgbF5u2/Vzn7UnjIyCsgTM/gnCZU0g4iyREzxZmv4NEkOW7HxpkMs3a5CePpHcqQ==
X-Received: by 2002:a05:600c:474a:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-49ce55ecebemr88727355e9.2.1788369282485;
        Wed, 02 Sep 2026 10:14:42 -0700 (PDT)
Received: from laptop ([109.95.34.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d587csm6459115e9.4.2026.09.02.10.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:14:42 -0700 (PDT)
From: Oleksandr Kovalov <oleksandr.kovalov.work@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksandr Kovalov <oleksandr.kovalov.work@gmail.com>
Subject: [PATCH v2] ALSA: hda/realtek: Fix cold-boot headset misdetection on Acer Aspire A515-57G
Date: Wed,  2 Sep 2026 20:13:05 +0300
Message-ID: <20260902171305.3955-1-oleksandr.kovalov.work@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830211038.19528-1-oleksandr.kovalov.work@gmail.com>
References: <20260830211038.19528-1-oleksandr.kovalov.work@gmail.com>
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

Chain into the existing ALC256_FIXUP_ACER_SFG16_MICMUTE_LED fixup so
this quirk-table entry keeps providing mic-mute LED support alongside
the cold-boot headset fix.

Tested on kernel 7.1.9 by building the affected module standalone and
confirming cold boot with headphones pre-inserted plays correctly from
the very first sample, across multiple boots (including a full restart,
and headphones inserted mid-POST rather than before power-on), with no
crashes or warnings and no behavioral difference from a real
post-replug recovery.

Signed-off-by: Oleksandr Kovalov <oleksandr.kovalov.work@gmail.com>
---
v2: Rebase onto sound.git for-linus (2026-09-02, commit f4a23e17d).
    Resolve a conflict with the newly-added
    ALC256_FIXUP_ACER_SFG16_MICMUTE_LED quirk for the same SSID by
    chaining into it instead of overwriting the quirk-table entry, so
    both fixes apply to this laptop. No change to the fix logic itself,
    which was re-tested and confirmed working after the rebase.

 sound/hda/codecs/realtek/alc269.c | 36 ++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index ecc9c6e..95b40a1 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -2379,6 +2379,33 @@ static void alc_fixup_headset_mode_alc255_no_hp_mic(struct hda_codec *codec,
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
@@ -4248,6 +4275,7 @@ enum {
 	ALC282_FIXUP_ACER_DISABLE_LINEOUT,
 	ALC255_FIXUP_ACER_LIMIT_INT_MIC_BOOST,
 	ALC256_FIXUP_ACER_HEADSET_MIC,
+	ALC256_FIXUP_ACER_COLDBOOT,
 	ALC285_FIXUP_IDEAPAD_S740_COEF,
 	ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST,
 	ALC295_FIXUP_ASUS_DACS,
@@ -6311,6 +6339,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
 	},
+	[ALC256_FIXUP_ACER_COLDBOOT] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_headset_mode_acer_coldboot,
+		.chained = true,
+		.chain_id = ALC256_FIXUP_ACER_SFG16_MICMUTE_LED,
+	},
 	[ALC285_FIXUP_IDEAPAD_S740_COEF] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_ideapad_s740_coef,
@@ -7148,7 +7182,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1597, "Acer Nitro 5 AN517-55", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x159e, "Acer Nitro 5 AN515-46", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x160e, "Acer PT316-51S", ALC2XX_FIXUP_HEADSET_MIC),
-	SND_PCI_QUIRK(0x1025, 0x1616, "Acer Aspire A515-57", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
+	SND_PCI_QUIRK(0x1025, 0x1616, "Acer Aspire A515-57", ALC256_FIXUP_ACER_COLDBOOT),
 	SND_PCI_QUIRK(0x1025, 0x161f, "Acer S40-54", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1640, "Acer Aspire A315-44P", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x166c, "Acer Predator PH16-71", ALC2XX_FIXUP_HEADSET_MIC),
-- 
2.55.0

