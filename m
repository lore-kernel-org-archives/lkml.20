Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295904;
	b=zMKNcG2DgnL70jWSGWabvZIavpC9r5XkB+bboHK8kLZR2Yc2x+T4DYG4Rh3P+g9F/KwJ
	 c8BdOv5luj3JLkO9A/b0eH54J0eT6iFREpl1OdVumGhh1wPW9HqOseBx4RYCi/aqk2DPs
	 EAEvjjKYiSok2CxYChVS64ZlDbdHvO/p/NSCu+97/bB1a1N+QqyI2x1D8szLUeXperI6/
	 ZKFTefuyqB6hsgTiFmoW/d4KUfjQUQ/P08GFauiJHnXBObtTFhc9wSMBQV4gvdkdsMIDg
	 /3Kx6sCeAWEUeNzH0YZVcAXWAk5K7y1wkvnUVOyyV4xHOBHTIUh0iur8jeaxJXPbJzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Iihqh3jg1Fo/JG4K+1inwvG2PsMwLH1y1X5y2K/lrO8=;
	b=l1WQmuaJ25E6CmvpYEA/b4aSwPFS02s9KKmBaHLuucCibOWM2aW/54WMUWyK29zEH2m/
	 afMFLv+KMMvtB781wYMLytVZXkeUbQ0tLY+BrckN7zQmvSzH4WACKLd5d9X4j6pdLmbQ7
	 3Bu9pRQJE+UGDcfOuoGW9nQC0eyB/Wg5qQYnNG+JQHoglxGJmJt3izP+rg1L2WKxVm99M
	 IBnJqOWOguXYeUVS7moAoSpUKHrCXF86CD1h8tRzWdBulRpQ3vJz+m8gDfwml1UegNaoc
	 8LJ60AyCWyOgc2fYOJyqW2EUcltBQOS0f1gFQJL0aCEi0J8tNfC4racbW4oyd+9k+0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gaZnpUqo;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E735606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E735606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gaZnpUqo
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so5621555e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793295902; x=1793900702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iihqh3jg1Fo/JG4K+1inwvG2PsMwLH1y1X5y2K/lrO8=;
        b=gaZnpUqosYh+K+C2b7hl2OXB2Pjdz/S0be0v6Ir/6w7DFyiIgNpxEM/CB8Cy7Xnalw
         cciI30agk6PFN7EFNYifjlZkrbxafO3INk/rVvGDfu+u0lUdhfkiJvCDezUxVXtwi2Kc
         CtN2Y1ps1JlQisSUhNoVscoOyj5ZWfjfnEpj5Kxan6knpRgdDWYQF3LgUV+gBI6vths/
         2iq7uFunhsKJ/CjiQnByjbdvAXb7TMOCO/jnEmryRhoaxnKO4eNKA52UKiXVCK0EwLls
         UtABCJ2yn2vXEmeK4rOmfKSYGcuP/dLWbmVUXq+pFnbYqd8p3WsVGU1kKBESZEiIHgTb
         yCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295902; x=1793900702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iihqh3jg1Fo/JG4K+1inwvG2PsMwLH1y1X5y2K/lrO8=;
        b=gwIQhETrn8ziwCVVX2yWeGhl3z+Ev5ppeTcwlYusyzZYSXGHx9SGxyfvrihpwwr5XM
         lsBFvmSNaHW35H90+dRj9g9oPL4FMVrg8bke3BD2Y7rVQ6y7D6g8Tile9auzw92Kb+Yh
         FAJNPscvMEZpnIeAD+TnJEYy4kIRtvtwcT2niqRsYt8Q7IddPAx8OVPdfIhWNtGX43e+
         4rJAXZetGnVrEBKMtAhCUaoVRAPlJmjPGPQfU0HhcWbA1pfDJvdnHNM83ErIf25bkLTf
         rFEL4pTCmKe4Uswklo1+ql21rq/xZnWWAxUNtECH6oRdLzreC1jfzk8SySddrKbiOwnk
         1Ebg==
X-Forwarded-Encrypted: i=1; AKwUvBxS4/qUvyReAlEN0oq5rKgWX2LS2DiOopqlHphnaAEQbMmUD+88T4EKwDq4a+4REVd7FdNmjIUpO30Ucrs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsL1RqFG6C37M0nGPAWajW3afqq4gxaNhr2Rg0UK4dxYZ/Ryb+
	4CMkGH7SV+4I9HiiQuA2Da6OoqXYpPZJCBRzWnCJ5bGBONE0snlkewzn
X-Gm-Gg: AYBFou18wf0uUZ5VQc16qdvmC8FbfLIIeOudEL7tie94zwsq5/5ERtCmhlkzYBjyGmJ
	g/TtrHLzfDAoDEmD/NqfSKpv2xX/jkEJ+krAJT2WzVdRrLW4G2dRjO7LJh8tYnfqBF76g60Safb
	UY7qkErCh+21QrNFtUl7swfpDv9IzXx1/sco1KIKKK99Xdug/nDudk8cxN55D+MaEg6fZ0oG0Aa
	h4pMBMp60SS4lguFKexJa3A+5smFOx/etaIFRnjtuZQmdwLA0+sT90wphO24W9AZYVqZ+aBksTL
	8DmCuDmf59FVxvJMF7u43DQr2SsueKD8QuSZtyYs+/lO+7rUaba2pc+6h6vasacVmoDeyiwJS7u
	4IkClQhIFtkxN1pLxAG3Fq78CSZuulIyRbAmlweXFz4SNsQLJYApUsU1iaUmTZZbiIVZr0Y7gUt
	OTdHUd3FQw8G09P1bADQBlVOe5xLVQ5FACwvnSuuyRzzpDAI4Ma/0+1V1/o90b0+Pvwvg1uzLlY
	aBlIDRkAX/w3A9ogl7AfBIYLtmYFPrc9hqj06ga5O/Ed6E9Nec8hru8Oo7FNuE8wrfah+lukGrB
	5P/Fot5BP8yeeuhhn+9oZDsPHAaApj91mg24RdA1Tp0n2Aktc/9bHwefT2oIGat8IVg0mzAW+P0
	=
X-Received: by 2002:a05:600c:621a:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4aa871e8be0mr84272155e9.7.1793295902519;
        Thu, 29 Oct 2026 10:45:02 -0700 (PDT)
Received: from ahmad-HP-ZBook-17-G3 ([5.208.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm86776545e9.13.2026.10.29.10.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:45:01 -0700 (PDT)
From: ahmad baghereslami <ahmad.b1995@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ahmad baghereslami <ahmad.b1995@gmail.com>
Subject: [PATCH] ALSA: hda/conexant: Add mute LED quirk for HP ZBook 17 G3
Date: Thu, 29 Oct 2026 21:14:46 +0330
Message-ID: <20261029174446.1412118-1-ahmad.b1995@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The HP ZBook 17 G3 (PCI SSID 103c:80d6, codec CX20724 with SSID
103c:80f8) has a speaker-mute LED wired to GPIO0 of the codec, the same
as HP's other Conexant laptops of that generation. HP's Windows driver
for this model sets EnableGPIO0MuteSignal. The mic-mute key's LED is not
connected to the codec: toggling each of GPIO0-6, the EAPD of the unused
pins 0x1d and 0x22, and the VREF of pins 0x18 and 0x1d only ever lit the
speaker-mute LED (GPIO0). CXT_FIXUP_MUTE_LED_GPIO would also register a
mic-mute LED on GPIO1, which drives nothing here, so add a fixup that
only sets up the mute LED on GPIO0.

Tested on an HP ZBook 17 G3 with Ubuntu's 7.0.0 kernel and this change
applied to its conexant.c: hda::mute follows the master mute, sound and
the microphone keep working, and the mic-mute key still mutes the mic.

The GPIO and pin tests, reading HP's driver and this patch were done with
the help of an AI coding assistant (Claude); I verified the LED behaviour
on the machine.

Signed-off-by: ahmad baghereslami <ahmad.b1995@gmail.com>
---
 sound/hda/codecs/conexant.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index a141c94ee..525a6d0d1 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -305,6 +305,7 @@ enum {
 	CXT_FIXUP_ACER_ASPIRE_GO_MUTE_LED,
 	CXT_FIXUP_HP_ELITEONE_OUT_DIS,
 	CXT_FIXUP_HP_ZBOOK_MUTE_LED,
+	CXT_FIXUP_MUTE_LED_GPIO0,
 	CXT_FIXUP_HEADSET_MIC,
 	CXT_FIXUP_HP_MIC_NO_PRESENCE,
 	CXT_PINCFG_SWS_JS201D,
@@ -810,6 +811,13 @@ static void cxt_fixup_hp_zbook_mute_led(struct hda_codec *codec,
 		cxt_setup_mute_led(codec, 0x10, 0x20);
 }
 
+static void cxt_fixup_mute_led_gpio0(struct hda_codec *codec,
+				     const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		cxt_setup_mute_led(codec, 0x01, 0);
+}
+
 static void cxt_fixup_acer_aspire_go_mute_led(struct hda_codec *codec,
 					      const struct hda_fixup *fix, int action)
 {
@@ -1089,6 +1097,10 @@ static const struct hda_fixup cxt_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cxt_fixup_hp_zbook_mute_led,
 	},
+	[CXT_FIXUP_MUTE_LED_GPIO0] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cxt_fixup_mute_led_gpio0,
+	},
 	[CXT_FIXUP_HEADSET_MIC] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cxt_fixup_headset_mic,
@@ -1193,6 +1205,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x1025, 0x1937, "Acer Aspire Go 16", CXT_FIXUP_ACER_ASPIRE_GO_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8079, "HP EliteBook 840 G3", CXT_FIXUP_HP_DOCK),
 	SND_PCI_QUIRK(0x103c, 0x807C, "HP EliteBook 820 G3", CXT_FIXUP_HP_DOCK),
+	SND_PCI_QUIRK(0x103c, 0x80d6, "HP ZBook 17 G3", CXT_FIXUP_MUTE_LED_GPIO0),
 	SND_PCI_QUIRK(0x103c, 0x80FD, "HP ProBook 640 G2", CXT_FIXUP_HP_DOCK),
 	SND_PCI_QUIRK(0x103c, 0x8115, "HP Z1 Gen3", CXT_FIXUP_HP_GATE_MIC),
 	SND_PCI_QUIRK(0x103c, 0x814f, "HP ZBook 15u G3", CXT_FIXUP_MUTE_LED_GPIO),
-- 
2.53.0

