Received: from smtp.vivaldi.net (smtp.vivaldi.net [31.209.137.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9109475336;
	Fri,  2 Oct 2026 22:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.209.137.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790979547; cv=none; b=YkgDJLZuHg07LSg2GT6em7XgXXsGqr6n7xK0iqN1WS8Bj6B1e8I036RHHg5xbWhXEMdoYKuET2M/cyFbC86cKFIF+lo1gutfBSbmor9Km05li3OVETAHpEK/grggE8T+c5llCuyTCkfs2Gnshdg1J8K6wQV60Xj1Q0bY9nf6PzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790979547; c=relaxed/simple;
	bh=00ImJOWWu9lRfEyQbYNou2C48dp7gXgRCU6Wmbm5heg=;
	h=From:To:Cc:Subject:Date:Message-ID; b=qDwM8YC2YRIcf03VvMwnk3jljQ9UZf9YONDKL6ntsxy3/Dg1QNoTbS1aM3uCc8cZjW8CBT+dGQ3+6bdmg1rqpvyb+vpC2P4XoOJ5yqokJUSB59aCNbcIICfv2HkopRIp6D9wL/heU7fmwV/uo7IKQgdXNWbTIsHiKPNEciGSjfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vivaldi.net; spf=pass smtp.mailfrom=vivaldi.net; dkim=pass (2048-bit key) header.d=vivaldi.net header.i=@vivaldi.net header.b=hk1+F5Ab; arc=none smtp.client-ip=31.209.137.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vivaldi.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivaldi.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivaldi.net header.i=@vivaldi.net header.b="hk1+F5Ab"
Received: from localhost (localhost [127.0.0.1])
	by smtp.vivaldi.net (Postfix) with ESMTP id 14439FC5AB;
	Fri,  2 Oct 2026 22:18:58 +0000 (UTC)
X-Virus-Scanned: Debian amavis at smtp.vivaldi.net
Received: from smtp.vivaldi.net ([127.0.0.1])
 by localhost (mxo-1.viv.dc01 [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qEQVsi1rZcrE; Fri,  2 Oct 2026 22:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.vivaldi.net 56632FC392
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivaldi.net;
	s=default; t=1790979535;
	bh=nP/+18zknw95i9l3i/sUf5wslrs2pLZPAh5Dqd/WG5Q=;
	h=From:To:Cc:Subject:Date:From;
	b=hk1+F5Ab/zZ7GFhIY8fb1j3VrYDxFQFQoYXLCiuYl76xj/pt/VZ3kEHX/r8RDKA5h
	 GAis874uVfP1vv/oTcSkCGFbiKyvLCiOK8tVprQ3jLC7N+OjEodOm5u0IbzllP/zvO
	 jy2Df1RU4V7H0hyRDaGh2T55XuqpN7qbu3KzH+X7fXoYA+Aen3pPaIXmN1D4QSJ0yv
	 gMNRzaOReVTPuBo8v4fsRYktIt9qDl8nnDM/aWJZyb5x8YhspyEVR2+fvLeOu83Sm4
	 Hjt6QsbQkcmf4lhIc5YAkQm79NtUSEflNpPCqJp1lACZEh5NoqmsLNyKb5nY4V8SPC
	 TQMWNstL0k+Sw==
From: Denis Yakovlev <mfthesun@vivaldi.net>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Yakovlev <mfthesun@vivaldi.net>
Subject: [PATCH] ALSA: hda/realtek: Enable headset mic on HONOR MagicBook Pro 16 2024
Date: Sat,  3 Oct 2026 01:18:50 +0300
Message-ID: <20261002221850.12443-1-mfthesun@vivaldi.net>
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

Assisted-by: LLM
Signed-off-by: Denis Yakovlev <mfthesun@vivaldi.net>
---
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
