Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691628;
	b=lb2D50V86Kjjwgai2L8SR1/ef8ZGAPD9pojl4UrAxEoZVJ+KXerL+IEgjOXpK1FWJVFn
	 9lTwEDRyYl00F3HFm4JHRzRFoAP5K6izAr1SNz0ptUA3RDm4pwqvrFTlVfXFwv34EM/KD
	 1vD5tbs2sILpcJXCTAT5pou3OolxMhilHcxkLxveBKgGKurUUilQYwAdfWLc2+cn7DWeJ
	 DLlGfPnxdDfyGUMGENsuX8WAoaXaQWPFSoyGaQSwqueIdqap4zMKhf/ReIr3zMNKARw90
	 k5qqeao5susczm2fDSfB4hPw8NiOWT6FGKzV7Et4wNd4r2TbtsUyCV5TyOgAGq1lPdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=;
	b=DzFUC3hJYr94gkDjD/4OmkY9i4KJhAkdoBhkqDlBKQ+/kV7sTZAEVQLyqjEr9+4PxxY0
	 +KitQT2lb/gWukehNRXXlH3Qu0XDTu2l6+o0hWWKaC9QedU7YaXZWN76ERT4GCcYqDJ8D
	 P98Le+LdrnXhGZLECTNcSBRFbPNynUDHD7LHfD0yz7Qynp33L/w7gm8SHo9rpkhm4rsb6
	 vmgQPKkNWI/n+clBE3zZy486W/r5dBlJA+qaH17JWsJMTVn0kVwsJ9ByUinPTcGqSNRnR
	 gLgIg+vDcf3+zLGK8au81rddgEAE8ARxVVGpnWNgi+N3yBRTRh2CFfOS/c8e3KzkoSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XeOkfA/f";
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFEA606A338
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABFEA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XeOkfA/f
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1251181a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691627; x=1794296427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=;
        b=XeOkfA/fAqBzSShYzfpOx39UkrurJiIO01aK5E0axVU09Uw0vtTuHat0FCX5ROsS6q
         fC61WHrFE8JCGkUpvA4ha+nId/wpUuoWt5M33bt+2cIqx8MrR8jjnBIuuDjgg25wjmTU
         aKJY6MBupUMNKWywpotET5/x7QQJgMddPY0iXL4+2paricA5YZLpnpi1PjLBkSmO/UlD
         hOqrhbaR7uxCSrTZw83e7TZ3Vyp1vfBR+6RBRGx1f90++1z5g4xe7GxG9PhDttohWgyn
         XtjYWmWscF2Cdz+NZXpGe/v0MkgLri9UVnD9/hXoxh0mkTN7kuygZnB/4FuVILfsfdPO
         MR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691627; x=1794296427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=;
        b=xCSDiVRbVKSS8JBD1PDJjdcwiQ5QXIHlp+bc8VzXYiEeUiWxaW1mUNCoW1904mAxUk
         aoO532Ttdh+X2eSLy7exHVgBxMBhhb04tA1TKBnxwxkzoKXZnZbM4FBT29uNkFWyGl1T
         ujyykUvI+HMuKtsmHMHAP+fS0k+e/H8PqgMZ7V3BM/oCa0nvW/liAW4bWK41u45nfQpF
         WvTqVXQUXE9ncGR1kmNiSUOYdIEakzto+Ykt0qjSDPTQTWDoV3PM7E+gaCuwPBGtnA4W
         cfJdn36Dld8WDpoayEyfkNFbM3HrKZRMxAgiyMPMn6uk9pT2z4VtBVNxjB7aE76whUcA
         JWRw==
X-Forwarded-Encrypted: i=1; AKwUvBwvkHeIZdCK26RKQL4Esu+3WcGvkAKM00yNI8rt8OWb0ctyagEIPtoeTec5a/vLERNuBgT6d+ll6kullyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+99Wf3Gn2LSULqqY/ig6v+FDRdRfTx1szKdurryl8012zEd2rr
	ODf6aEvxIIaRr347gynGhPwNhaycAaL+ErzasxRhPFkV24+NsWrDogx7
X-Gm-Gg: AYBFou0OC/uxbFEmPAcT/Ku0bi/3XqvlXOubYiw05V5bMRm7xU8baJ1oNpU4GZP9kyf
	nCUN9KmUKnMZ8sojkWXnqiu4f19ey9YtxsyfsdrEu1Oerw+1KHWDNxB/NLgH0LXmUMDyDuGTTeu
	yC7PEt0AgtpkHQAvMXhIBF0pGN570d6o+dy3z6FLla3nKdb95eFUVQfoXpsO0Wa2OPDNcg75O/w
	+z+diWiBxSjfvI0+H72j7I+udV5/Ky21kr6Ba4/hEga6mcZXAFVf/lemODQTjymHGcATHHyztKo
	mW425UhaWjX25xwJBOqxcNroR4biUBTyh6ZKke/FEBnIbmyD92zJpo4wNFHyLtqLKGTG4ziSOo/
	DfFJZTflOg7/HZegjx3ZHN+kb+CXB9jXNBr4bCsjGr/qzxNQrUAJtEDHAzX9GOy00kkHdRmd9i3
	S2DddUBUzWzRBvvpH4YQi8ORm+MqBsdr3r+7ODaryjsHwMeVUPkFqkjtkarfjK7s5Ndf3Q7hcEl
	bMz8zG6hHFRQRPw/dM7bV70KoeKVk3/BlZXvRBCyw16vdbKAqzCtflK+AhTo0GIiF1bAnbiJfW7
	pAAiZgdYeAqfqlTFUPtJ9jC9i6sQ7gVzaHQa8kDsgqislXnReTURlOJLBXF3OoMvXq9p0KHOIfY
	Nzmhl2AHYuUVRHNMy2x/yDwLmMvUfW9Tt0DRNZneo6wp41Uf0y5rQLDMCnwiPLyn9b20klwpMy+
	F7oQs=
X-Received: by 2002:a17:90b:35c6:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3ae89536bdbmr10927084a91.4.1793691627024;
        Mon, 02 Nov 2026 23:40:27 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:50 +1000
Subject: [PATCH v4 02/22] ASoC: dt-bindings: cs42l42: Allow referenced
 dai-common properties
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-2-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ryTg7qu92xHmjo1HEk78arPtD12ewJvnTCmnNMpKI2c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+GpzjrzeRvYWVum1gj5HNzyuvK1hVdiudFLu8N0
 n3S1ebdMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOoLSxgZrl/hNrrKf2TVhzo7z237FA8e3jH3Nf/qtR/St39hfNBQ0sHwV3TNTE5
 f7x852/mjXWfWXk/xiHl+5AhnQ2rTYwn9Iv0OLgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

We may need to define both #sound-dai-cells and sound-name-prefix on some
machines where this codec is part of a simple DAI. Allow this by refrencing
dai-common.yaml and allowing its properties to be used.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index ab4c7d22dc0e..4ac0af34c464 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description:
   The CS42L42 is a low-power audio codec designed for portable applications.
   It provides a high-dynamic range, stereo DAC for audio playback and a mono
@@ -193,7 +196,7 @@ required:
   - VL-supply
   - VA-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.56.0

