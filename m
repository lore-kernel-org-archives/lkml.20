Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793997046;
	b=EzsuuJfFZTurwRepbA1yR6FDHYc6SOfp000xDVkb/h6U/uG7feGjjM+OWRXOba2L3tlz
	 Rg8Eg5DZXV0RMrTyaR4j4HhpbWt6WY07PN+TP12OfLzmx6fstRgjgF2+gYkZPzSjOdy7o
	 C8qrMbYw2GWXQTaca7B/0PwEsYZeO8AVeslKrPW6H/Uxwt70PGInugH+ZJ2UQHHXzXLZJ
	 Q260koLCXHQj6m3X/7L8oVn9CwfULy8B+9T6IzMQxBPdZxMjPjNgsrmaSpW8CogvwTPN2
	 yPtttBA5y35LY4XKfYkEGDoVRTrCzkKwdD5vDztdq0JxPUtPVey8W1AlIu+cft28YSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793997046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XDl5/MgXQuCQFzdaeynJUphUR2A+eiDxz+hBUu35V5U=;
	b=FpcvCfTAiVVsX8r7DxZ03gSaVnBe8JdBpnSviuN+bdRLSL/pvWIzASHC6+vwrZ9j6FGl
	 /lRm8neVaVeqVprJUKQcWgd2To08Z42++sbhx7uM1OR1m+z2mabcUE/dZAc8mi/a6l275
	 eg5fktOoA8bQMecQSjJPiYX9gEoS8N9m1dXCXzA2Xi0Tfhh2Zp1GWlEsnNx9QfnJTJ46A
	 Lwju48oQObV44xYw0mkV73s27TubgPoMZgUXgpNYA/cVzzTM5sbURErGuKW5F16smYr9j
	 +DHlJSx71MnCBe4d4C1z/NFuhy470FmcbAFcJQwR+7GLmnYxwedugab4BY5LRuCW7Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fONB6Qyh;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDC6606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CDC6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fONB6Qyh
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-716d052dc23so483680eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793997045; x=1794601845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XDl5/MgXQuCQFzdaeynJUphUR2A+eiDxz+hBUu35V5U=;
        b=fONB6QyhII8LrA6wEFGjTRJ6FJk1LtaqVCn8unkx3BDDhO6PUzVJz47bWgDSuGxGCr
         VeCmMaNEvmFoZNrrHqlxPk2GryAaGsnRVC9ivNok26vCQJZb5ZUAiPl/JW3UM11fZNOt
         +aQ53Teci6NJ+dfRv+iG1dSxJqF1mDdG+3ym0B3x/L4WIomKO1sH/2ww/JI6PEMSwsH0
         lUEBg85NJZ6IhyQPvImzaiOFHR7yVB/45QDSOZwa41/opfXfhR5pjW6an1GCfSrqP1n0
         KoHt/UkEVQn7m90THv1WCTDcNfsSbAGUdWM1YikKSizHf5B2baniOGMfnDoM2JxTQkdT
         sIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793997045; x=1794601845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XDl5/MgXQuCQFzdaeynJUphUR2A+eiDxz+hBUu35V5U=;
        b=PCvLwGEMLv2qNKuN55xgHcNfa+4cf5Y2uPKiV9i1C0cuTGbLQlRg0EDsT1p1etfDr1
         0twDDy4ccZfuqZDUqJnf8pU/Xjw9izq4kg+Zi0KaJ/8DfMZmRhlimgEroc++l7N54ndx
         Wo/kcyiTmiAzP0Ib2fdZheLKmjzLn4ckrYImRFdHj97DFLHMGXapuieYRwt86UuoVIdl
         uIg41RmAOWk2mLXkfpB5FwC3fETs9ydSfO/k9BjAG0ySSKabqZxok0AB01KExOhRCL3q
         VDYH7EUUZGshw5GCh0AWEPlVNLuyuuNO4ehjKeGU05sKBTHAqaGZB0BnwgJWp9PVVPkc
         kEpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAEsLPwrN4ALNAhXJFJLRkek/v36TJoF8gtcOYVI838It9OWcNjQ8lYrX23GEh+uG6lqSbHSCx87sbVUM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CBLv0ku2n/coPpOOQCUV8lgDcz13Pcl6Ang18/OQPOCYqQuUm
	ou+q2itaIdz2I5To+D4n8H9vW2DkzpMoAon0ILDxa/ZnkENGB5Hnt/fB
X-Gm-Gg: AYBFou3ghY90PWlggqFN9kWa3MFLPxshXPPi/JPtEBdnkbXLrOVbuFxnBQyp+Ad0EGo
	RQOCDQMydCONJ9O+FvHh94MCsTgaWb13hbQGo4ax3wJx3XI2hCEsAp87Df0zidTpEXW82NXEGpi
	JhqpQFnLmUm63ZhbiRzf1QJNaYll4JkwQVZESw+O92yIznJa63d2Nx6riX9Xfn2AvEkvcNXBl9R
	38TzQKYH7XpSycS1dkL8gVMOnd2m7OUqRdXq/Xe/2epRrjElxihZXUjIB71ZOfyKHvwg0xLDUao
	8p3Gtq5ijFz6WFVD2mr0116inPctvyjNKxMiX3iw6zZSIYBAmvv1kRkqPJTSs0Q2gmH63ApqJQ7
	5S2vP1OCkIc8DNztI/jVqftQk7Cc379KWx22nEUaMzfhzb52LeXAAEhsgEFIuFgRr3/jLMVzT3m
	jh4ZTD3pl6L6yp8L92KO9AVTBtS+uNjMZ7qRPlVbePQlqEeG0N9l5b9Z4uOLJfCnsd4ATDF4zsB
	LAEujil8eG7IaA0x/awlMZoE4B5w1xBRdPKxuKvxxbn86I0UmEiWMdxlz9JpsjSGIaZ3WqGT94F
	fW2SxrK3+i0aAkeaVZjM2IhiK+dyY3Yhx51fs/VRhl3IHw==
X-Received: by 2002:a05:6820:2910:b0:704:4ad:9c47 with SMTP id 006d021491bc7-716e79e7188mr2022604eaf.68.1793997045017;
        Fri, 06 Nov 2026 12:30:45 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad979d7032sm2782071fac.7.2026.11.06.12.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:30:43 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: Re: [RFC PATCH 13/16] ALSA: mixer_audient: Add enumerated controls
Date: Fri,  6 Nov 2026 14:29:43 -0600
Message-ID: <20261106202943.1034941-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-201869@kernel.org>
References: <sashiko-outbox-201869@kernel.org>
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

Hi Christian,

The bot found a real problem in my patch 13:

> Does advertising ctype->enumeration->items + 1 items in
> snd_ctl_audient_info() while rejecting item index e->items with
> -EINVAL in snd_ctl_audient_enum_set() break the ALSA control UAPI
> contract for writable enumerated controls?

Yes. mixer-test writes every advertised item, and alsactl restore
fails on a value that store saved as the extra item.

The diff below drops the extra item from every enum:

- A device value outside the list makes get return -EIO. I chose an
  error over a fallback item: an unknown routing value shown as Main
  Mix could hide a route that bypasses the speaker volume, cut and
  dim. The device is not known to report such a value.
- A write-only value that no transfer has confirmed (only after a
  failed probe write) reads as its init value, as a write-only switch
  reads off.

Tested on the iD14 (stable 7.2.15) with the diff applied, with a
script that does the enum writes of mixer-test on this card only:
get returned every advertised item after its put (from the cache for
the write-only controls), and the item past the end was rejected.
alsactl store and restore of the card succeeded. I did not run the
full mixer-test, because it writes the controls of every card.

Does -EIO from get look right to you here? If the diff looks good,
I'll fold it into patches 13 and 15 in the next version.

Thanks,
Will

-- >8 --
From: Will Porter <mrwillporter@gmail.com>
Subject: [RFC PATCH] ALSA: mixer_audient: Advertise only selectable enum items

Every enumerated control advertised one item more than a put accepts.
mixer-test writes every advertised item, and alsactl restore fails on
a stored value of that item. Advertise only the real items.

A get of a device value outside the list now returns -EIO: an unknown
routing value shown as Main Mix could hide a route that bypasses the
speaker volume, cut and dim. After a failed probe write, a write-only
value reads as its init value; this does not confirm the device
state.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
Proposed change to patches 13 and 15.

 sound/usb/mixer_audient.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index e65c62e1eac4a..4180d7d8b325c 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -67,10 +67,8 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 600);
 #define SND_AUDIENT_CTYPE_FLAGS_CACHE		BIT(3)
 
 /*
- * An enumerated control: item i sends values[i]. The texts have one item
- * more than the values. A put cannot select that last item: a get shows it
- * for a device value outside the list ("Other"), or for a write-only value
- * that no write has confirmed ("Unknown").
+ * An enumerated control: item i sends values[i]. A get of a device value
+ * outside the list returns -EIO; it does not show a wrong item.
  */
 struct snd_audient_enum {
 	const char *const *texts;
@@ -85,7 +83,7 @@ struct snd_audient_enum {
 		.values = name##_values,				\
 		.items = ARRAY_SIZE(name##_values),			\
 	};								\
-	static_assert(ARRAY_SIZE(texts_) == ARRAY_SIZE(name##_values) + 1)
+	static_assert(ARRAY_SIZE(texts_) == ARRAY_SIZE(name##_values))
 
 /*
  * iD14 MkI units. The monitor controller, output routing, headphone level,
@@ -126,7 +124,7 @@ static const DECLARE_TLV_DB_SCALE(snd_audient_tlv_id14_vol, -12800, 100, 0);
 
 /* Mono mode: one-speaker sum (Left, Right) or phantom centre */
 static const char *const snd_audient_id14_mono_mode_texts[] = {
-	"Left", "Centre", "Right", "Other",
+	"Left", "Centre", "Right",
 };
 SND_AUDIENT_ENUM(snd_audient_id14_mono_mode,
 		 snd_audient_id14_mono_mode_texts, 1, 0, 2);
@@ -139,10 +137,10 @@ SND_AUDIENT_ENUM(snd_audient_id14_mono_mode,
  * mute still act on every headphone source.
  */
 static const char *const snd_audient_id14_route_main_texts[] = {
-	"Main Mix", "Cue Mix", "DAW Thru (full scale)", "Other",
+	"Main Mix", "Cue Mix", "DAW Thru (full scale)",
 };
 static const char *const snd_audient_id14_route_hp_texts[] = {
-	"Main Mix", "Cue Mix", "DAW Thru", "Other",
+	"Main Mix", "Cue Mix", "DAW Thru",
 };
 SND_AUDIENT_ENUM(snd_audient_id14_route_main_l,
 		 snd_audient_id14_route_main_texts, 0x14, 0x10, 0x00);
@@ -156,12 +154,10 @@ SND_AUDIENT_ENUM(snd_audient_id14_route_hp_r,
 /*
  * iD key function: the value is the monitor controller selector the key
  * toggles. ScrollControl (0xffff) toggles nothing: the knob then scrolls
- * through the HID interface. The last item of a write-only enum shows a
- * value that is not known.
+ * through the HID interface.
  */
 static const char *const snd_audient_id14_id_key_texts[] = {
 	"ScrollControl", "Mono", "Mono + Polarity", "Dim", "Talkback",
-	"Unknown",
 };
 SND_AUDIENT_ENUM(snd_audient_id14_id_key, snd_audient_id14_id_key_texts,
 		 0xffff, ID14_MON_MONO, ID14_MON_POLARITY, ID14_MON_DIM,
@@ -170,13 +166,13 @@ SND_AUDIENT_ENUM(snd_audient_id14_id_key, snd_audient_id14_id_key_texts,
 /* Talkback source: the routing source number of the input; none = 0xff */
 static const char *const snd_audient_id14_talkback_texts[] = {
 	"None", "Mic 1", "Mic 2", "Digi 1", "Digi 2", "Digi 3", "Digi 4",
-	"Digi 5", "Digi 6", "Digi 7", "Digi 8", "Unknown",
+	"Digi 5", "Digi 6", "Digi 7", "Digi 8",
 };
 SND_AUDIENT_ENUM(snd_audient_id14_talkback, snd_audient_id14_talkback_texts,
 		 0xff, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13);
 
 static const char *const snd_audient_id14_optical_texts[] = {
-	"ADAT", "S/PDIF", "Unknown",
+	"ADAT", "S/PDIF",
 };
 SND_AUDIENT_ENUM(snd_audient_id14_optical, snd_audient_id14_optical_texts,
 		 0, 1);
@@ -933,22 +929,23 @@ static int snd_ctl_audient_enum_get(struct snd_kcontrol *kctl,
 	guard(mutex)(&mixer->lock);
 
 	for (i = 0; i < hwchan; i++) {
+		unsigned int item;
 		u32 val;
 		int ret;
 
 		ret = snd_audient_raw_get_one(mixer, ctype,
 					      snd_audient_cache_slot(elem, i),
 					      base + i, &val);
-		if (ret == -ENODATA) {	/* unknown write-only value */
-			ctl_val->value.enumerated.item[i] =
-				ctype->enumeration->items;
-			continue;
-		} else if (ret < 0) {
+		if (ret == -ENODATA)	/* unknown write-only value: init */
+			val = ctype->init;
+		else if (ret < 0)
 			return ret;
-		}
 
-		ctl_val->value.enumerated.item[i] =
-			snd_audient_enum_item(ctype->enumeration, val);
+		item = snd_audient_enum_item(ctype->enumeration, val);
+		if (item >= ctype->enumeration->items)
+			return -EIO;
+
+		ctl_val->value.enumerated.item[i] = item;
 	}
 
 	for (; i < nchan; i++)
@@ -1007,7 +1004,7 @@ static int snd_ctl_audient_info(struct snd_kcontrol *kctl,
 
 	if (ctype->type == SNDRV_CTL_ELEM_TYPE_ENUMERATED)
 		return snd_ctl_enum_info(uinfo, snd_audient_kctl_channels(kctl),
-					 ctype->enumeration->items + 1,
+					 ctype->enumeration->items,
 					 ctype->enumeration->texts);
 
 	uinfo->type = ctype->type;
