Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C2449EC51;
	Fri, 25 Sep 2026 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341649; cv=none; b=ApRvzHbonmt1/hfhl7FFNKQiAQdBe2C0J/72cHW0WwVI9oxG+DzoEwQRJYfBHiUmu6mbg01ayvEVpAxdOA9vCa+qIim/k4LFJTEBzlF2rfVxF56SLG0p/nHI4FAW+ZzqtuONfiKgVoHWh3PqsoEEo970YGnTdbTQz8pUHqbQQ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341649; c=relaxed/simple;
	bh=GOWrcpXNUO3g9w1ZjOk9FLXUaMCrUIsviv08hhDAfEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IEbtVVjJ3XH4nUEoXstxH2HCjPYP7M2xb8xcVI1ygr5gUPYKoax0Vo12WkMGHux52bXFUSj70ANKTZZwBpS/qD++zecmjCaxzRYG78or/SSF4MY+3JMq2XcXXN2ZyiAQwAAzb0bmnoHPag4yZGpxei6hzm6kJKdVo7OZ053MZtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npDLaBau; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npDLaBau"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57C96C2BCF6;
	Fri, 25 Sep 2026 13:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790341649;
	bh=GOWrcpXNUO3g9w1ZjOk9FLXUaMCrUIsviv08hhDAfEE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=npDLaBauf24h2a/0pvnGweYfOQVGk4QxrRWjn2DIqrOSu99aHnebDil2TBWAp6iyC
	 fOGB8G6YN+gtTbAM1h1vMM1JwXwzW/eKCvaL7Ai2gvyJTJeOBwdeAAJ74FeYQ4Kx/7
	 uPD3z0ekvWoqhfG4QSvO9UUUT2rXuaawJ9OWoK0i6/NZcAVPv3A27f+3Yj8BGERcoA
	 4CjYPPhTpBqj5VbcHATwyyxUwxwAbMewM+qnmADyFmZWcZ7orLDKPb2yOYuW9qnrq7
	 Zqax1g51cvRp+S0arAZB81OWdLHff5mf2o2onSI3P0Xrf6Fq6p9cDAkaF5Y7za+e41
	 fMsw6CheHhyjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B91C98324;
	Fri, 25 Sep 2026 13:07:29 +0000 (UTC)
From: Jasper Firth via B4 Relay <devnull+jasper.m.f.hotmail.com@kernel.org>
Date: Fri, 25 Sep 2026 23:06:25 +1000
Subject: [PATCH] ASoC: Intel: bytcr_rt5651: Add quirk for Chuwi Hi8 with
 generic DMI strings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-hi8-quirk-v1-1-ffd00b0447f9@hotmail.com>
X-B4-Tracking: v=1; b=H4sIANFxtmoC/yXMWwqAIBBA0a3EfCeYPai2En2oTTUFPTQjkPae1
 eeBy/Vg0RBaqCMPBk+ytC4BSRyBHuUyIKMuGAQXBa9EzkYq2e7IzIxzLVOZVSoVPYR+M9jT9b2
 a9rd1akJ9vAO47wepQeBNbQAAAA==
X-Change-ID: 20260925-hi8-quirk-00ca3a49b32f
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Hans de Goede <hansg@kernel.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jasper Firth <jasper.m.f@hotmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790341648; l=3490;
 i=jasper.m.f@hotmail.com; s=20260925; h=from:subject:message-id;
 bh=mVuuiZeMiCOfjjhkSmnqCkiKnAlFV1xhXjQv+TkP8dQ=;
 b=KPRQOkiY9hSmG+TYJ4uNXM+8Da92UEEp/KMWfN58sOkzKlNKgS7Bm6T0Rc4Fxxd/EDEuu9S7V
 LR0GO5nKO43DCPQgZ+lxNxFDXNHH6tUBC/rlD0zecd8sjljmIisBbVp
X-Developer-Key: i=jasper.m.f@hotmail.com; a=ed25519;
 pk=gjHZSqrU/BpOtVkMh341rjfZSeJ3PsQ3Sk/n8bax4jo=
X-Endpoint-Received: by B4 Relay for jasper.m.f@hotmail.com/20260925 with
 auth_id=1062
X-Original-From: Jasper Firth <jasper.m.f@hotmail.com>
Reply-To: jasper.m.f@hotmail.com

From: Jasper Firth <jasper.m.f@hotmail.com>

Some Chuwi Hi8 tablets with model number CWI513 ship with a BIOS
(American Megatrends 5.11, dated 05/21/2016) whose DMI sys_vendor and
product_name are both "Default string". The tested unit is labelled
just "Hi8", but its model number is the same as the existing "Chuwi Hi8
Pro (CWI513)" entry, and it needs the same quirks. That entry matches on
sys_vendor "Hampoo" and product_name "X1D3_C806N", so it never applies
to these units.

Without its quirks the internal speaker, whose amplifier has a
differential input wired across LOUT left and right, cancels to a faint
distorted residual for any centred (L == R) content, and the headphone
channels are swapped.

Add an entry matching board_vendor "Hampoo" and board_name "Cherry Trail
CR", plus the BIOS date since those two are too generic on their own.
drivers/platform/x86/touchscreen_dmi.c already matches the Chuwi HiBook
the same way.

The quirks are those of the existing Hi8 Pro entry, except for the
over-current detection scale factor: 1.0 instead of the 0.75 from
BYT_RT5651_DEFAULT_QUIRKS. With 0.75 and a CTIA headset (inline mic and
one button), loud speech into the mic, and headphone playback coupling
onto the mic line, were reported as spurious KEY_PLAYPAUSE presses, one
of them held for a whole 8 second speech window. With 1.0 the same test
gave no spurious events, and 3 real button presses were reported as
exactly 3 press/release pairs.

Tested on a unit with the generic DMI strings, with a module built from
this patch and no quirk module parameter. The quirks were applied via
the new entry, the card components read "cfg-spk:1 cfg-mic:in2
cfg-hp:lrswap", and the following all work: speaker, headphone left/right
order, jack and headset-mic detection, headset button, and the internal
and headset mics.

The problem was diagnosed with the help of an AI coding assistant, which
also drafted this changelog.

Assisted-by: Claude Opus 5.5
Signed-off-by: Jasper Firth <jasper.m.f@hotmail.com>
---
I don't have the Hi8 Pro (X1D3_C806N) covered by the existing entry, so
I've left that entry alone. It may see the same spurious headset-button
presses with OVCD_SF_0P75.
---
 sound/soc/intel/boards/bytcr_rt5651.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 62cb4856c..c9b105320 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -410,6 +410,23 @@ static const struct dmi_system_id byt_rt5651_quirk_table[] = {
 					BYT_RT5651_HP_LR_SWAPPED |
 					BYT_RT5651_MONO_SPEAKER),
 	},
+	{
+		/* Chuwi Hi8 (CWI513) with a BIOS using generic DMI strings */
+		.callback = byt_rt5651_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
+			/* Above matches are too generic, add bios-date match */
+			DMI_MATCH(DMI_BIOS_DATE, "05/21/2016"),
+		},
+		.driver_data = (void *)(BYT_RT5651_MCLK_EN |
+					BYT_RT5651_JD1_1 |
+					BYT_RT5651_OVCD_TH_2000UA |
+					BYT_RT5651_OVCD_SF_1P0 |
+					BYT_RT5651_IN2_MAP |
+					BYT_RT5651_HP_LR_SWAPPED |
+					BYT_RT5651_MONO_SPEAKER),
+	},
 	{
 		/* Chuwi Vi8 Plus (CWI519) */
 		.callback = byt_rt5651_quirk_cb,

---
base-commit: c82b61455a76c9ca3ee37ac67f0f4a34a4dbdb04
change-id: 20260925-hi8-quirk-00ca3a49b32f

Best regards,
--  
Jasper Firth <jasper.m.f@hotmail.com>


