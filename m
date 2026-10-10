Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168FC255F52;
	Sat, 10 Oct 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627907; cv=none; b=L3TLRbRVQincptgrxMpkIo+Q6lSIOUjypzC7OgzM2ONspn7IL1utXtQsxPgDSxFGhvG+O97xiiHW2zdFuKDDo4Ni/f4mw6cSoX9vc+dTb7WP2yyASsuH/ZyCgDNOlBrwHYohHRp3KPzLGVyLE8ReQ1b0gY+6h2fdHb35kj5YmMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627907; c=relaxed/simple;
	bh=I3KH1o842MU1hc5uI6sgSimt4viWp1SeNLRIp7pJsnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HlKHFupDJk6SmDbNUp20Cv5MtIZXz4HbI72gN9ZCeOYLOgazaPemg1/bPBR8cWak/o0nR6iVTE6BoZDJp+omcvMUN79iGsijd6mNYhPBzWCQ/Vn2pIwbL6J4KR25mx1c20TmPT2c198tk+Z7aNqDxWdvd8pwkQ+hsJiT3w6MJ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ee8j85H4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ee8j85H4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4F3EC2BCB9;
	Sat, 10 Oct 2026 10:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791627906;
	bh=I3KH1o842MU1hc5uI6sgSimt4viWp1SeNLRIp7pJsnI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ee8j85H4KTBvo5D2iWQUqzslqD28BiclTELW2VvjL6mgnp94XzPCX5ek3nhth5ors
	 XoyPvhxfJLQhxcENNxrMBEZGesdX0vsqTbrjQze0Wcn0lG4TBy7L2TOPLkEehP7F63
	 qh1hZR/jgtjWtzI7aytvlkWu7jEjcwmZJzIDFRDB2Y6FIFD0UzJcy+Bqq8P33YeWA5
	 pTomzjOQJ0rBvaFXrUE2EqyfeZTPuSwcMOJwDr4A419GVjfYhAtxlyiycazXvzXv/7
	 ZfoLIiV8LReX8BY8VpVOPFev+DjK7YJvcb3UhEkDDd1WzVtKTk2/75WoMg00MFtuMh
	 MAyXX2EicBAaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F93CA9EBE;
	Sat, 10 Oct 2026 10:25:06 +0000 (UTC)
From: Federico Amedeo Izzo via B4 Relay <devnull+federico.izzo.pro@kernel.org>
Date: Sat, 10 Oct 2026 12:24:43 +0200
Subject: [PATCH] ASoC: codecs: aw88261: expose hardware mute control
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-aw88261-hardware-mute-v1-1-d0befedd3b4c@izzo.pro>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAyF4asgz1iKM7TAVSoGh7jFlaCVQwAJc
 fem7fa+4f0HJDGVBF11gMmqSV9zAdUVDCPPD0GNxeCdv5Ajh7w1TZk4ssWNTXDKi2B79RRbohC
 YoXzfJnfdf91b/3fK4SnD8o3BeX4Ast8XQnkAAAA=
X-Change-ID: 20261010-aw88261-hardware-mute-9721d911bbaa
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Val Packett <val@packett.cool>, Luca Weiss <luca.weiss@fairphone.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Federico Amedeo Izzo <federico@izzo.pro>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791627905; l=2467;
 i=federico@izzo.pro; s=20251017; h=from:subject:message-id;
 bh=BYKelzy2Ps55yjmnOFm7JWNbifFBGV5GETpncVeWvFY=;
 b=M+g3tCFx03KoL5rCw3LD9LmwSCGb4Zrxy1QS/Fj6EbKtg09aENr05n7vFGwxaHl9dQIWtYpqj
 CaosaU6S4kuBIfsJn650s2XbgKkkuyWiCPNfdlFFZ+p1d7E1nQHd2d8
X-Developer-Key: i=federico@izzo.pro; a=ed25519;
 pk=XfmNfpH48k8jLbId5NKrp0yoKoFb/uLjr97qIxBImBw=
X-Endpoint-Received: by B4 Relay for federico@izzo.pro/20251017 with
 auth_id=544
X-Original-From: Federico Amedeo Izzo <federico@izzo.pro>
Reply-To: federico@izzo.pro

From: Federico Amedeo Izzo <federico@izzo.pro>

When the aw88261 speaker volume is set to 0, it becomes very quiet but
still audible. This causes echo during phone calls on motorola-dubai, as
the bottom speaker output is getting picked up by the bottom microphone.

Expose the aw88261 hardware mute functionality as a Playback Switch
control. The new control can be used in a UCM profile to disable the
bottom speaker during phone calls and greatly reduce the echo.

Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
---
 sound/soc/codecs/aw88261.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 8671069f4c18..7303dc9eb4e0 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1014,6 +1014,33 @@ static int aw88261_volume_set(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int aw88261_mute_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
+	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(codec);
+
+	ucontrol->value.integer.value[0] = !aw88261->mute_st;
+	return 0;
+}
+
+static int aw88261_mute_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
+	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(codec);
+	bool mute = !ucontrol->value.integer.value[0];
+
+	if (aw88261->mute_st == mute)
+		return 0;
+
+	aw88261->mute_st = mute;
+	if (aw88261->aw_pa->status == AW88261_DEV_PW_ON)
+		aw88261_dev_mute(aw88261->aw_pa, mute);
+
+	return 1;
+}
+
 /*
  * The field contains 4 bits in units of 6dB + 6 bits in units of 0.125dB
  * which is too precise for TLV (!) so we have to multiply the scale by 2.
@@ -1026,6 +1053,8 @@ static const struct snd_kcontrol_new aw88261_controls[] = {
 	SOC_SINGLE_EXT_TLV("PCM Playback Volume", AW88261_SYSCTRL2_REG,
 		6, AW88261_CTL_MAX_VOL, 1,
 		aw88261_volume_get, aw88261_volume_set, volume_tlv),
+	SOC_SINGLE_EXT("Playback Switch", 0, 0, 1, 0,
+		aw88261_mute_get, aw88261_mute_put),
 	AW88261_PROFILE_EXT("Profile Set", aw88261_profile_info,
 		aw88261_profile_get, aw88261_profile_set),
 };

---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261010-aw88261-hardware-mute-9721d911bbaa

Best regards,
--  
Federico Amedeo Izzo <federico@izzo.pro>


