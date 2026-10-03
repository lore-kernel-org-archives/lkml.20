Received: from smtp.vivaldi.net (smtp.vivaldi.net [31.209.137.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C416D7DA66;
	Sat,  3 Oct 2026 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.209.137.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791034433; cv=none; b=lx5QrLZY4eCU5EDuHbr3xtwDk+uIM6VQct2ZQZUit0kZaXv0HTOP5kFL0CM85hR904TXkpEg/4ZC9q9OxtNijQU5ZEjBU0/+ZZ4vW/FBgUjRT9eM1zrQ9CQHeAeMBnKikTctCP2BMlSXdK+Iuc4zIg2G6/+ZBQ0euO/jdkdzpnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791034433; c=relaxed/simple;
	bh=gx8YMcW2Yz9Ay6Z+HK0PkeUjb0LnIGc60NLWeM0JJUo=;
	h=From:To:Cc:Subject:Date:Message-ID; b=RDZ8JB9I+xkHCgfzBinLbQyBk1QxP+ZkpKP0c/E0gaxjFXg6yNl2ojdzHWWc5o425R582r+2qxiLoBTq2p0/1nVwv7Wbd8T4vT1ZMDip+pi3OoI8XGFg9PRdywMpvWcum1lP0BIfsD6d8nBAgF2vOr0ntlKMICIOBtvYpON/F+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vivaldi.net; spf=pass smtp.mailfrom=vivaldi.net; dkim=pass (2048-bit key) header.d=vivaldi.net header.i=@vivaldi.net header.b=bOID0JUL; arc=none smtp.client-ip=31.209.137.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vivaldi.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivaldi.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivaldi.net header.i=@vivaldi.net header.b="bOID0JUL"
Received: from localhost (localhost [127.0.0.1])
	by smtp.vivaldi.net (Postfix) with ESMTP id 0B90EFC395;
	Sat,  3 Oct 2026 13:33:49 +0000 (UTC)
X-Virus-Scanned: Debian amavis at smtp.vivaldi.net
Received: from smtp.vivaldi.net ([127.0.0.1])
 by localhost (mxo-1.viv.dc01 [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kO2XitxLY9Cf; Sat,  3 Oct 2026 13:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.vivaldi.net 22EAAFC2D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivaldi.net;
	s=default; t=1791034423;
	bh=ydX8eYPLNL0xEotu5oKlbslCm99j6FARjCnqLnWWgyg=;
	h=From:To:Cc:Subject:Date:From;
	b=bOID0JULbCTNNB/c3FDX1liU5z8cZL6Jx1gs2YsMDVDQJFx5/F240vJ13+zEgWp5V
	 gd26NDJxPpRQMEREjkMtfbnzY72v4kvQa6iM/Pbee36oGoQj8dnhSEqympOK1DFUJT
	 zzFyCHsiaStEbaa27A1iM/xjfUPOpJ4yWUVB6rwG/8aOGq7XcdJipYJkNV4QFNKo5k
	 +7eoSyn5IVvZ/7rsO2snmft4AE6J0e6+8aKAokaPJUDtg3kozbQOJPUoTIZR9UTLE3
	 OE394jlaI9KjcVnoH4Zvf91F9SqqgWIMvhuCtkZXtoDoC3cSEbXwDWceFjlp4l2twC
	 k3A3BdE5LWIew==
From: Denis Yakovlev <mfthesun@vivaldi.net>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Yakovlev <mfthesun@vivaldi.net>
Subject: [PATCH v2] ALSA: hda/realtek: Enable headset mic on HONOR MagicBook Pro 16 2024
Date: Sat,  3 Oct 2026 16:33:25 +0300
Message-ID: <20261003133325.97507-1-mfthesun@vivaldi.net>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The HONOR MagicBook Pro 16 2024 (DRA-XX, board M1020, ALC256, SSID
1ee7:204e) has a combined 3.5 mm headphone/microphone jack. The BIOS
leaves the headset mic pin 0x19 at 0x411111f0, so the codec parser
builds no capture path for it, and it leaves the jack switch
(coefficient 0x45) in the TRS state, which cuts the microphone contact
off from the codec. A wired headset microphone therefore records
nothing.

Configure 0x19 as a headset microphone (0x03a1113c, "headset mic
without its own jack detect"), the same value already used for the
sibling M1020 board (HONOR MRB-XXX) and by the VAIO quirks, and chain
to the generic headset mode handler, which detects the CTIA/OMTP
headset type on every jack event and programs the jack switch
accordingly. Pin 0x1a is left untouched: there is no evidence that it
is wired on this board.

Fixes: 1e3e378d63be ("ALSA: hda/realtek: Enable bass speakers on HONOR MagicBook Pro 16 2024")
Assisted-by: LLM
Signed-off-by: Denis Yakovlev <mfthesun@vivaldi.net>
---
v2: add Fixes tag, as suggested by Takashi.
    v1: https://lore.kernel.org/linux-sound/20261002221850.12443-1-mfthesun@vivaldi.net/

Tested on a HONOR MagicBook Pro 16 2024 (DRA-XX), Ubuntu 7.0.0-34, using
an out-of-tree build of this change, with wired Apple EarPods (CTIA): the
microphone records after several cold boots with the headset inserted and
after hot-plugging; without the change the analog capture is digital
silence. The headset type is detected as CTIA (coef 0x45 ends up at
0xd489). The speakers (including the "Bass Speaker" control from the
speaker fix) and wired headphone playback still work. OMTP headsets were
not tested (no hardware).

 sound/hda/codecs/realtek/alc269.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 67b9f41..4e22d63 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4477,6 +4477,7 @@ enum {
 	ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO,
 	ALC256_FIXUP_HONOR_DRA_XX_SPEAKERS,
 	ALC256_FIXUP_HONOR_DRA_XX_SHARE_DAC,
+	ALC256_FIXUP_HONOR_DRA_XX_HEADSET_MODE,
 	ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX,
 	ALC287_FIXUP_ACER_MICMUTE_LED,
 	ALC236_FIXUP_DELL_HP_POP_NOISE,
@@ -7215,6 +7216,7 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
 			{ 0x14, 0x90170111 }, /* bass speakers */
+			{ 0x19, 0x03a1113c }, /* headset mic, without its own jack detect */
 			{ }
 		},
 		.chained = true,
@@ -7223,6 +7225,12 @@ static const struct hda_fixup alc269_fixups[] = {
 	[ALC256_FIXUP_HONOR_DRA_XX_SHARE_DAC] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc256_fixup_honor_dra_xx_share_dac,
+		.chained = true,
+		.chain_id = ALC256_FIXUP_HONOR_DRA_XX_HEADSET_MODE
+	},
+	[ALC256_FIXUP_HONOR_DRA_XX_HEADSET_MODE] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_headset_mode,
 	},
 	[ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX] = {
 		.type = HDA_FIXUP_FUNC,
