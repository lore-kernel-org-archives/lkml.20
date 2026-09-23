Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099093769F5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156424; cv=none; b=FRGL0VsZTCZRVtz4lX5ehTzVEUWeWJSGiBXgIH1OMGEyW9EPVvl7sZ4IPO9M4aw8AyAODyz85J+uaUE6pOey0bTyEDnqOpctdFR9nNIgNYX+5t1JNkVZi+LXbzQEq9leAn5iwblJcXtn8pZz+3MlBG2p4sk6eucQZrEpCQYuSxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156424; c=relaxed/simple;
	bh=uzU7RaY2K9+73Q6YK9gtNJvyk4mkQ/ySuzyx9byGgIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nV9QRAWjcUScy8lqXConf6gK7U1YaYcOMIpmRCwl+NMJXAJ1rDNxJlLtHNCS8mUJixD0MiXnSU66M0+pAfCNyToa1HNR2UBxrZi5u+9jE45hWsrjpyhZZqKA1NpcL0IhTxlfTcccUlweRkI2aiG4p7qpf9SUAtabHd9aKqACL+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsESacbh; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsESacbh"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso607611a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790156422; x=1790761222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MnQHrDxAyd1yhTRUYQ1mkIzupirTqXVm+66Gi8J/eBw=;
        b=DsESacbh0dRI66xu2NzwLZxlRdW+armDGeYolMnRwBWt60G2n18BwQ+S8/vRrxIWVW
         /cBeIfKdUiX5iAt3PkW3D7lDNFlgHpPukSxZ9XLcfw/KWSbRyf8ElBW5W2R+YYkPRssm
         ER78MU5KYWkhNW8OElrXTcDLPd26iojs5lKx7d8dTxFgxD7SlF1rktZFZ+od1ziVE4iJ
         J7I0y9JnUMssqP6MXLG3eI9oWvKbEf3e8Ycj7rcFtreDAzDAyUjRXr4JtmggLfEh5H74
         TkvNbC11NWlVzzJoZSZDBfOszCS+RFH6yZbyA3U/2t+9iu9ldHYI6vqBfHUuOnDe2aTG
         oLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156422; x=1790761222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnQHrDxAyd1yhTRUYQ1mkIzupirTqXVm+66Gi8J/eBw=;
        b=af2HWEq5g9U5I8Ec/FjPaG0Prr+uxOYuFI/XrsmH1/Divs9jt5hZa9yhcyELtHzK7v
         fjxSYugWCVAq234jE+RgVSbyh0rWf9/I7G7+YYM8nWj9ZaB4hFhXRfu0N7M0MDNprUY8
         atLKrSe+LpTPU5y84gWJlo2ZShrAqpypX4KxL3awpAxymS9212bzKYjTpvn3GuwxAIET
         fjgd1wPZhZdPUJg6CSkIlkWenDhX9h6L+mXNC/278HvhMts0cwRCiO4HnEvJadUUVwyY
         wmu5TjiSNMggSMVMkIEUr0+gMtafSVAfFVBAvsJZw9FCyvyBScW7F+tVZi+pWtPrcR1d
         jhSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcoDKRi69W/ofCOSkAmV8BGEI4CGkCEAnQq0O2P36FcYoZf+6CkY7ni6XJLjDymFnq3seFs0rt8Q3O/8E=@vger.kernel.org
X-Gm-Message-State: AFuF++liPFN5fYkffWNsZQUCoquqiSoUOfoV1u076rNTj6OG0hASwbPn
	eHIKbqTUMUJdG6YKsSdY2bYqqI+FKhUie5PZF31rTxvE0HX2HDyxn9HM
X-Gm-Gg: AYBFou1/ruZfTsugZ8qAc5PQM5+OzZHOMNmt3kvGh7Tla+vP758aI8DmqWSWKUqfJLu
	7Uynzf6gNm+iOjpMLsfZ+YcaQPRww9FcW91mHfs9yuMx+hMwOyDNAvPXn2EiAsV0DCWIYDiDvPP
	HN0wBci8kcwyYES6DX0/9xJOot68yobJtXyBk+toqvU847HmG+CiSue54C70ZuTb1Zd6Xo9oJKl
	4hHiruaEIZrOM1M6zZVXAdanIgYlE0XnedGev1jk9nTsQVErquWorZmsjczgJHUjtXH9lG/7aRi
	8hfvr9Si+VAeNSlnmEu0Qz3ki4VRzQ7+G+8UPcHxUU1z+8uY5t613IQWZ0ZtS7vSoqGBxV7+0+l
	mSlYzjix2RQjdM9m6UjW8zHLFQ7+g+VfVOd1s6EUf4fI/sBI1clTHmWQQpE3iArvndpDN9c8mmM
	NdQtWvB+v4WOhspRecmPgFWHaicJV9g9HccDoIJrebnpn9r7kymQdoEk6X0QFhEncPMdF2WhBG2
	GTFjGq1zyCavWGQiQ==
X-Received: by 2002:a17:90a:e704:b0:39e:6c69:9b8f with SMTP id 98e67ed59e1d1-3a07e693a28mr1695259a91.52.1790156422193;
        Wed, 23 Sep 2026 02:40:22 -0700 (PDT)
Received: from fedora.tail6c1c0e.ts.net ([2405:201:c411:b12f:aef2:6452:fd6:d00e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07fa5fd15sm1333168a91.1.2026.09.23.02.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:40:21 -0700 (PDT)
From: Tarun Noonemunthala <ntarun2000@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tarun Noonemunthala <ntarun2000@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP ENVY 13-aq1xxx
Date: Wed, 23 Sep 2026 15:10:14 +0530
Message-ID: <20260923094014.58867-1-ntarun2000@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP ENVY Laptop 13-aq1xxx (PCI SSID 103c:86ad) uses an ALC285 codec
with two speaker pairs: front (pin 0x14) and bottom (pin 0x17).

The BIOS leaves pin 0x14 as [N/A] ("not connected"), so the generic
parser never enables the front pair and only the bottom speakers are
audible.  The vendor driver (RTKVHD64.sys) programs that pin with the
value 0x90170150 and runs the HP amplifier initialization, which is
already implemented in the driver as ALC285_FIXUP_HP_GPIO_AMP_INIT.

Add a board fixup that applies the pin configuration for 0x14 and chains
to the existing amplifier init fixup.

The pin value was recovered from the vendor driver's own configuration
data.  The patch and this changelog were prepared with an AI coding
assistant (see the Assisted-by tag below); the change was reviewed and
tested by the submitter on the affected machine.

Tested on an HP ENVY 13-aq1xxx by rebuilding snd-hda-codec-alc269 from
the Fedora 7.1.10 source and loading it: the codec now reports
"line_outs=2 (0x14/0x17)", pin 0x14 comes up as an output (Pin-ctls
0x40) with its amplifier unmuted, and both speaker pairs play.

Assisted-by: OpenCode:deepseek-v4.1-flash checkpatch
Signed-off-by: Tarun Noonemunthala <ntarun2000@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 8f55c3c00..35d7d2f87 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4139,6 +4139,7 @@ enum {
 	ALC285_FIXUP_HP_SPECTRE_X360_EB1,
 	ALC285_FIXUP_HP_SPECTRE_X360_DF1,
 	ALC285_FIXUP_HP_ENVY_X360,
+	ALC285_FIXUP_HP_ENVY_13AQ,
 	ALC288_FIXUP_DELL_HEADSET_MODE,
 	ALC288_FIXUP_DELL1_MIC_NO_PRESENCE,
 	ALC288_FIXUP_DELL_XPS_13,
@@ -6412,6 +6413,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_HP_GPIO_AMP_INIT,
 	},
+	[ALC285_FIXUP_HP_ENVY_13AQ] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x14, 0x90170150 }, /* front speakers */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC285_FIXUP_HP_GPIO_AMP_INIT,
+	},
 	[ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_ideapad_s740_coef,
@@ -7400,6 +7410,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x861f, "HP Elite Dragonfly G1", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x864f, "HP Laptop 15-dy0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x869d, "HP", ALC236_FIXUP_HP_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x86ad, "HP ENVY 13-aq1xxx", ALC285_FIXUP_HP_ENVY_13AQ),
 	SND_PCI_QUIRK(0x103c, 0x86c1, "HP Laptop 15-da3001TU", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x86c7, "HP Envy AiO 32", ALC274_FIXUP_HP_ENVY_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x86c8, "HP Laptop 14s-dr1xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
-- 
2.55.0

