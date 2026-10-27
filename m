Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144858;
	b=eng0wPKEZoGgrfqkQqf9ljIN03WKO3/ynoG91ozjaAtaMkYtsgqmJxPadLWIPCWpiyUp
	 BtuPMOTCigh447mHBUp4sCCjp4mYYR69JDgSt+ok2qRBV68DAvYppTYvUeygIaVsOnilL
	 PTbjSIldZeULXxbsMf+9gWCkjN7ENR7lRipE6h1ww+Xh+bmhrOMJLPNRzEsx73CgthxE+
	 eyzlv2qY7mrk86HM3qttlsranUL11dkl4/jUZ+QW35IuLmZo/5jXPmR9nNbxlRBUn8UsX
	 i4EE4T8x1RlsKA4XlRup6VeBQRE2INtvqiIzSfbMeSIM8AUFgITQb83bByRIlSB7zNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IeoTTHjrmkN+lAjLjMn+hlXcwBGCw4hztvP/cN1zZZU=;
	b=ydmEjaJgV8L143W/G7/Ma3LinCVU7BKDe5hFvAlHARiXH2IXyEf3kbpOvq3z3ki/66c1
	 0Rk5fAUSZVMGg65x3Dcgm3ND64jbApeP5xNTb1481zIRao/BwfPssKfmB1yvDIjDaE23v
	 cIHh5cP+EgS5PFqEukWoIWh/Lqb7VTdPSL19fFIbiYMpjbAAuGZXq9pdUC6U5yTW5xhJD
	 FjEsLlFQy8r1ehBoqaym6tGznnjFJszzwagnuTnmLacFE8QDP9geOhLvmazt1vWCTSOcJ
	 Rq+zrwZ2ZtsxXfbqpXSiEvpLI14mgVKaIHMjsT6Qn1uDmupGXWECG4Ze1m81bNRnUig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zoRtLJTz;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AA3606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33AA3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zoRtLJTz
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so3049695e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144856; x=1793749656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IeoTTHjrmkN+lAjLjMn+hlXcwBGCw4hztvP/cN1zZZU=;
        b=zoRtLJTzm3WXPgvBJXiFVZ+MUih4dfxDAUp9aZRpcShjdqilgb5SJSmPI215uBqHSC
         KiKM9g63qR6c7yS3SOU07/XtqCGwuU8yT79uzXCjRJ7Me4+NvifGIKCWwPJ+nmMmxph7
         2t4Opjgn1vF3qvyBPIY/KkLY+aQj4euEePwgVjtovyquuNJaBZPSd/on0/TQu1R42tdA
         kWI9kxUhWLPvLbxI4i9F/JkAzZPH2tv+dVJJ1djR4eNrWYOfvMgLwCwiUACaLUUOPwuh
         bon1H+JLdP3JwNznXDl7WxVXqfnj1UImUcETCi8GcuPufwicELbquu4+yrrQRdlxg1DG
         EKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144856; x=1793749656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeoTTHjrmkN+lAjLjMn+hlXcwBGCw4hztvP/cN1zZZU=;
        b=gFvDMGmFho52nWJFNNDVkyE7sqv9qg1XZqvW58zaOmJjf9MmJ8GhTAEwUXcHDmQvn2
         PTViR0BPYtdBQQh5UO7a+ZRFRNuTij8E7+rdaJSlb0V7gwyitr1lJE42K6sXLWY+Zs/r
         LN5tTh7xix4pMNmH+A5sh29rGiVDyyK2p1orHPKrt+y18diSqeH9IznYTNpRfxSWbKhg
         kbksnvYpceGYPZXWOJzRVnhoCx0t/d5MMr34+DkPJ3L/QdGNBMdPO9IOhEzqylgUSu8e
         OA6p5E+e8hjedXfIernLVMoq4W/FwJ/+Z0ZQ+sXeBYmkHIcFERXq2oCL06v+4wzfSmZE
         YmOA==
X-Forwarded-Encrypted: i=1; AKwUvBx3d5eXSmzmU5lwrusjaWtvppzWuPR8ue+IQq1vGnV+jP/GIBYJZtifZ1LD9HRbhA0fT95G2jxQIWvACKA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJULh65oXNhiavg9itfc4vyWYoQRETuQFPV2HB/xcUZw55ckegq
	fJmHwxckSvLnK83MtHs1KP+HTfTJA45FH43bZXfl7KgRoE5opfimqVfU
X-Gm-Gg: AYBFou0gaj7GcYv9+1QANZNGCl+BWCO04jpQwhbONYhHc2YOVbPNLOUIaSGPpeBo5Aq
	a1s2u8X/lpnkd+2H1akDvBxSR8ngyHZM+k0mCCw+hlANm8fcRl2zqM0Uyp/Vcgmmq6zYJipJLE4
	UgK0UIvaDn7TGH32lmZj+ICnBPyhnqX1KjnUHAbwrabazhOsFUXNJ8RrFdzQ0Jm+M7ffsf4WCuh
	jhDV01LeCLhwHfSKS4W5MyrxEwf7OAGph3mZoU1i937yWw0yolABBkQlbCs8OoH+xr7fl5WVTbZ
	UO1KpZ99+DEVaR9GCp+VHnsKrPi30zucYGVrIE6RKOVx6PF9IOVEJlA8Yq/4UsGhRUAhTHAdR2k
	SroHdrcYpnujuMuFI2E4EP+lro6RXAPHL8P3Kf35DlVCwsYMRuyDq8JzzxEVDxgYs/zNTAdiWtp
	1CrNMC/f7KX9HkUoYv2+ZQsqDy4sltLkMjaUIlGl6X8zugEOTYqfjU0mAkQOGmV0Q5iMuRfeVpQ
	nds3THBIe/dIkXPcDlSsIhygmqap+hIE4qQdI8WpOYGY+pC/wNdnIi4S5CLk2+yNf+COeKLeIja
	/ZOi/ZKXxmKyDLrGIVF/hlpNOIPbY5kLM3J7Quuu7e6T42ZscOC+RoK3rzpAhEc878TodXs=
X-Received: by 2002:a05:600c:524a:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4a9674e6bf7mr9591635e9.35.1793144856486;
        Tue, 27 Oct 2026 16:47:36 -0700 (PDT)
Received: from matebook.galaxus.box (adsl-84-226-215-1.adslplus.ch. [84.226.215.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a96a8f28a1sm2905285e9.4.2026.10.27.16.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:47:34 -0700 (PDT)
From: Cian Ruane <cian.ruane1@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Huawei MateBook X Pro 2020
Date: Wed, 28 Oct 2026 00:47:32 +0100
Message-ID: <20261027234732.6893-1-cian.ruane1@gmail.com>
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

The Huawei MateBook X Pro 2020 (MACHC-WAX9) has a combined headphone and
microphone jack, but the BIOS marks pin 0x19 as unconnected (0x411111f0).
As a result the headset microphone is missing and only the internal
microphone is available.

The mic mute LED on the F7 key does not follow the capture mute state
either. The machine uses the PCI subsystem vendor ID 0x1e83 (Huaqin)
rather than 0x19e5, so the Huawei vendor-wide quirk that sets up the LED
does not match.

Add a fixup that configures pin 0x19 as a headset microphone without its
own jack detection and chains to ALC269_FIXUP_HEADSET_MODE, which enables
headset mode and the mic mute LED. This is the MACHR-WX9 fixup without
its other pin overrides. The remaining BIOS pin defaults work, and pin
0x14, which the MACHR-WX9 uses for a second speaker pair, produces no
sound on this machine. Configuring pin 0x19 with presence detection
(0x04a11040) does not work either: the jack state drops to unplugged
while the headset is still connected.

Tested on: HUAWEI MACHC-WAX9 (MateBook X Pro 2020), BIOS 1.26,
Ubuntu 26.04 (kernel 7.0.0-38-generic, with this patch backported).

Signed-off-by: Cian Ruane <cian.ruane1@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 23329d588..5a4cb04aa 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4330,6 +4330,7 @@ enum {
 	ALC255_FIXUP_DELL_HEADSET_MIC,
 	ALC256_FIXUP_HUAWEI_MACH_WX9_PINS,
 	ALC256_FIXUP_HUAWEI_MACHR_WX9_PINS,
+	ALC256_FIXUP_HUAWEI_MACHC_WAX9_PINS,
 	ALC298_FIXUP_HUAWEI_MBX_STEREO,
 	ALC295_FIXUP_HP_X360,
 	ALC295_FIXUP_HP_PAVILION_X360,
@@ -5063,6 +5064,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE
 	},
+	[ALC256_FIXUP_HUAWEI_MACHC_WAX9_PINS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x04a11140 }, /* use as headset mic, without its own jack detect */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE
+	},
 	[ALC298_FIXUP_HUAWEI_MBX_STEREO] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc298_fixup_huawei_mbx_stereo,
@@ -8727,6 +8737,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1e50, 0x7007, "Positivo DN50E", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1e50, 0x7036, "Acer Gadget E10 ETBook", ALC233_FIXUP_WUJIE_SPEAKERS),
 	SND_PCI_QUIRK(0x1e50, 0x7038, "Positivo DN140", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x1e83, 0x3e21, "Huawei MACHC-WAX9", ALC256_FIXUP_HUAWEI_MACHC_WAX9_PINS),
 	SND_PCI_QUIRK(0x1ee7, 0x204e, "HONOR DRA-XX M1020", ALC256_FIXUP_HONOR_DRA_XX_SPEAKERS),
 	SND_PCI_QUIRK(0x1ee7, 0x2078, "HONOR BRB-X M1010", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1ee7, 0x2081, "HONOR MRB-XXX M1020", ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO),

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
-- 
2.53.0

