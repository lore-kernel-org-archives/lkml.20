Received: from smtp.vivaldi.net (smtp.vivaldi.net [31.209.137.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1302C39185C;
	Mon,  5 Oct 2026 20:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.209.137.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232737; cv=none; b=N7h4n+7cvL5vofn8jQIvxMnObYuGKYF/X0ygkleWMxRaH6IWNFmfsO/nM5fMkC0JbfYROcqwozw8KC6ZinaGV/de8zeSchRLW7NWhhD9XyGYz26jHDCZfLsfhsnVjEG4crUAJvWM8fenlXeZbuk9dHy0WawhYyvcFfA/8x5U5FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232737; c=relaxed/simple;
	bh=c9OyCut0MBpFSg/xAeAcAyv6yjhBOBxsYxu+kSu40TM=;
	h=From:To:Cc:Subject:Date:Message-ID; b=G+V6OXvLnPlcaNVa2fp5K4ljRhv10k6fCoKxK2mZQy0fkEiAzbIxBLmzWfHA71FYoVLhfGnfLL/piLVYxhzUZMripHi1KikmpG+x4Hfmyv9g8qh7BrGrInDQfrgYndZaMZlxSKmmz5ZcJq6dPVHzNqBIfA6sXGITuVvQSYPI+O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vivaldi.net; spf=pass smtp.mailfrom=vivaldi.net; dkim=pass (2048-bit key) header.d=vivaldi.net header.i=@vivaldi.net header.b=WpAEVVVd; arc=none smtp.client-ip=31.209.137.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vivaldi.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivaldi.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivaldi.net header.i=@vivaldi.net header.b="WpAEVVVd"
Received: from localhost (localhost [127.0.0.1])
	by smtp.vivaldi.net (Postfix) with ESMTP id 016D1FC495;
	Mon,  5 Oct 2026 20:38:48 +0000 (UTC)
X-Virus-Scanned: Debian amavis at smtp.vivaldi.net
Received: from smtp.vivaldi.net ([127.0.0.1])
 by localhost (mxo-1.viv.dc01 [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VScOkNsVJNGC; Mon,  5 Oct 2026 20:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.vivaldi.net 2E9DBFC3F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivaldi.net;
	s=default; t=1791232725;
	bh=tOjC/aDx4B1YbpcOH3s/Us2e+lrDVXAKtRRYR1NEFcg=;
	h=From:To:Cc:Subject:Date:From;
	b=WpAEVVVdlh9sCcVeSoESoBbXaMhr7hvnUtldu9u/ef/byfVXV/HB3clZA5YiV4Qss
	 YRUYbs6FJ6JNscRlTZWdm6IJD2wTWRkNZz959xu5hUv3oTx+fPOVytK0N5Eso9wY+W
	 U473f9/27ODhB/yBdAyNC/MPBIihyej4BAXCsSFKvteehuvc5BpIwDtStGL1kCew8V
	 ketlDlMWq1ADj229EtTV+gBTKAqmfA7eghY/n+Pkk2NXGskoaXRbaHP/o9H9yf3GCs
	 zRW0FknfOPtQGjL2p+49h37cNwMM9ywJwqE6ceEq/a5PnwMr2tzJyGMfW2k2NSnw95
	 UYj2JRmF4ydAg==
From: Denis Yakovlev <mfthesun@vivaldi.net>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Yakovlev <mfthesun@vivaldi.net>
Subject: [PATCH] ALSA: hda/realtek: Drop unneeded DAC override for HONOR MagicBook Pro 16 2024
Date: Mon,  5 Oct 2026 23:38:36 +0300
Message-ID: <20261005203836.11074-1-mfthesun@vivaldi.net>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Commit 1e3e378d63be ("ALSA: hda/realtek: Enable bass speakers on HONOR
MagicBook Pro 16 2024") restricted the speaker pin 0x1b to DAC 0x02, on
the assumption that the second speaker pair would otherwise end up on
DAC 0x03, as channels 3/4 that a stereo stream never reaches. That
assumption was wrong: without the override, pin 0x1b is still connected
to DAC 0x02, the only DAC that pin 0x14 can use, so the override changes
nothing. With and without it the codec routing is identical and the
speakers behave the same with nothing plugged in, with headphones and
with a CTIA headset inserted; without it they also keep working after
suspend/resume.

That commit also got the speaker roles the wrong way round. Pin 0x1b,
which the BIOS does configure, drives the bottom speakers, which carry
the low and mid frequencies; pin 0x14 drives the tweeters next to the
keyboard, and those are the speakers that stay silent without the quirk.
Measured with the internal microphones, enabling one pin at a time: at
1 kHz the 0x14 pair alone is more than 30 dB below the 0x1b pair alone,
while at 6 kHz the two are within 10 dB of each other.

Drop the DAC override and correct the pin comment, so the quirk only
sets pin configurations, like the one for the sibling M1020 board
(HONOR MRB-XXX).

Fixes: 1e3e378d63be ("ALSA: hda/realtek: Enable bass speakers on HONOR MagicBook Pro 16 2024")
Assisted-by: LLM
Signed-off-by: Denis Yakovlev <mfthesun@vivaldi.net>
---
Tested on a HONOR MagicBook Pro 16 2024 (DRA-XX) with SOF, using an
out-of-tree build of the quirk with a module parameter that switches the
DAC override on and off; this patch corresponds to "off". Not tested
with the legacy HDA driver. The mixer control for pin 0x14 is still
called "Bass Speaker"; that name comes from the generic parser and is
not changed here.

 sound/hda/codecs/realtek/alc269.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 3a3244fe3..447c0ba35 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -2763,17 +2763,6 @@ static void alc294_fixup_bass_speaker_15(struct hda_codec *codec,
 	}
 }
 
-/* route Speaker (0x1b) to DAC 0x02, the only DAC reachable from Bass Speaker (0x14) */
-static void alc256_fixup_honor_dra_xx_share_dac(struct hda_codec *codec,
-						const struct hda_fixup *fix, int action)
-{
-	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
-		static const hda_nid_t conn[] = { 0x02 };
-
-		snd_hda_override_conn_list(codec, 0x1b, ARRAY_SIZE(conn), conn);
-	}
-}
-
 /* Hook to update amp GPIO4 for automute */
 static void alc280_hp_gpio4_automute_hook(struct hda_codec *codec,
 					  struct hda_jack_callback *jack)
@@ -4477,7 +4466,6 @@ enum {
 	ALC236_FIXUP_HP_DMIC,
 	ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO,
 	ALC256_FIXUP_HONOR_DRA_XX_SPEAKERS,
-	ALC256_FIXUP_HONOR_DRA_XX_SHARE_DAC,
 	ALC256_FIXUP_HONOR_DRA_XX_HEADSET_MODE,
 	ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX,
 	ALC287_FIXUP_ACER_MICMUTE_LED,
@@ -7227,17 +7215,11 @@ static const struct hda_fixup alc269_fixups[] = {
 	[ALC256_FIXUP_HONOR_DRA_XX_SPEAKERS] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
-			{ 0x14, 0x90170111 }, /* bass speakers */
+			{ 0x14, 0x90170111 }, /* tweeters (top speakers) */
 			{ 0x19, 0x03a1113c }, /* headset mic, without its own jack detect */
 			{ }
 		},
 		.chained = true,
-		.chain_id = ALC256_FIXUP_HONOR_DRA_XX_SHARE_DAC
-	},
-	[ALC256_FIXUP_HONOR_DRA_XX_SHARE_DAC] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = alc256_fixup_honor_dra_xx_share_dac,
-		.chained = true,
 		.chain_id = ALC256_FIXUP_HONOR_DRA_XX_HEADSET_MODE
 	},
 	[ALC256_FIXUP_HONOR_DRA_XX_HEADSET_MODE] = {
-- 
2.53.0

