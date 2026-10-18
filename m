Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED453A63F3
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302942; cv=none; b=ODI4FYd+JlshBCPFqOuY2toFUY8NJc+pmkSUZQ7pSrjPerlVP4/saS+DiSJDS88WAdB50Y68UQ4K/knUle8/W45olSAQec5lzz1vECjG4exLEatNZQzk65tWLkh9l0gBT5nXc2Z6aAb/IAUFJA8dwlAkWpHFTdKRfafdJghwML4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302942; c=relaxed/simple;
	bh=9blMBWr7YSyHeQmUBs/7VgENlyvjO/n7aari+GuU1zA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VjGq+ABkNSw6OoURTcuyzeFqTOkguIgu5L7jIAL7groU8tMtNB0lAPZB08WvgG4lPfiMg2fIZgYWVxpbnuVFM7Lx2PanC07RlRM4tj8bpbvly36wdaCDWQZYKwZIwjCUbqpBrc2vgukgzKk3loMDIUxFjgO0PvwidmQTEdfqcLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBjZn2s6; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBjZn2s6"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38759bcd877so666411a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302940; x=1792907740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oG7xpTf+2B5oFo7T4YVD/UfNfM1JDvvTcYxZXQ4liDI=;
        b=eBjZn2s6KT0Yqw29Fb4b8QJW+GQTu43bRIN8ksn5s3GYdTgKhz4vwoZBQpBM1ieG7n
         wqRr8ec5p9+hw5A/kKOuaElT2CnHUSRWACP9do/zM7e7NybWUvSOTFDe2JvZbRvfGCHd
         mK68i/C0o4WTQF3cKD9slXkLjUHqF6xx5nzbUyBV4slUmoOSCttbpXTOmHIP04gLBm2r
         dT3Z8kTMr3tQ3wMsHkNdSI9rOJM7FwmMUJzrVLt0rpZWuRw0ejEJ2ezvzIqs8UOfDrRz
         JqLm2ZmIk+tClAi7yS5v208J2Gd05iB1njfSv3mb8x+30EC795HlMcylNCjsVRFWIRig
         g2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302940; x=1792907740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oG7xpTf+2B5oFo7T4YVD/UfNfM1JDvvTcYxZXQ4liDI=;
        b=OQMVi4akx+LBdfflG4dXcLeygxXakeEtNNsna5/WByVF4a+6LNfx9Mx8OxzD78uZeU
         gxZOPxVJB5WEEjF7yP6CpQgIO2rQVWQ/Pzd5WSqUFnKF9v78ctzpW0GEctrWJHwXLRx6
         aQLRZ/BDnuYR9dpMnzSzQ6R2GKrfFdOMBSVHVXjK9hQ2le5X0/y3q/f+9VgkMlsMm5I5
         myYxclD+NkUCGbBOwAfvZva0EvuT6aYqRGKIynDEFSW43C2YZgmgKJcz6mNhRF2wVtLu
         ZZqzqmpKgYjEHc/dnh5ij4NwVgbBwelVdg8F4zThrF+0H4IzmU5uaZdOG1VnSyDx68Iy
         V1hA==
X-Forwarded-Encrypted: i=1; AKwUvBwKvPnovhoVBiROUCP+72OJZmHqJkOE8fDslPU6Y72kM47GPo+cUVvaIDfpVB/XQJFf6KlB1ycSbfTOGw0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZUpRlyNe3aRkHBenj2Eil/tz/uUHfqbMK66/sWqukrcN1uEIl
	h/uyM5RLHlaFfMbhFiqWMlK0K2dc6woZuNByNWyY0fWz8qsObfvrCwDE
X-Gm-Gg: AYBFou0IdKvrVLQxV+xEdb+hvq5VXpT3pb8a+uBANmT8NcX32D2MGCoOrpE5nJs660j
	uty+qTNPd/HHxrOYFV1SfL6G2EmAMI0n/SkwE4xm/WEjfSBW9qktRrhOWgWwHfPP7nQgSdLoSmj
	oM5aDKfKskWgRgsqxPR1nH/chXgRjN18wahK8BwxcqObTg4X86pZlfCkq3IG46agJxCqXZGWnKe
	szls/lM/3yqR9Gxvqo3f8dtVyqtutVGO1rpFkscn0klv8h49Tb+3UVRs58OmighJm1dWKrMjnl7
	NyzbXPSrwN19TXG4yGXHJwqxSxG02n6GJRlMVDZAEDobipGoalNj/2vtg+pl29qZTqXXMo9vvAg
	Px/ETh8/+3oKacRi6kgd2Mfskz7q9Ubqes/9ZX75j9H619RjCBYtz7y7MBVFSdrwB5cBjQ7Yes7
	9r/ZfdRkXGP2155SWCDoCuOytX8aDBbLPH1z/FBu0WyFf9LbYa/AuZgnf0Ok4FwbmIdtDvb+QZZ
	FVoCZrtM9oVKySEkdpnpXFxDlv0fNi0j+u0940GDkQhsRFACmC6fkqlXwy3WmfuEWyF+ee9ucUE
	y8r25PE0lZirQWMIETCZJ7O861uRiONZRLyY07EfeuVyZ6Q=
X-Received: by 2002:a17:90a:d446:b0:3a4:e735:b39d with SMTP id 98e67ed59e1d1-3acef603b1dmr3522678a91.64.1792302940213;
        Sat, 17 Oct 2026 22:55:40 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:39 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:01 +1000
Subject: [PATCH v3 07/21] ASoC: tas2770: Add compatible for TAS5770L
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-7-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=758;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9blMBWr7YSyHeQmUBs/7VgENlyvjO/n7aari+GuU1zA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnc7m2aKqH0TDBh9iuOyj/7pF3478Srb3rG07en6
 mJ/VbJQx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKrzzjL8s6yU1a66u2PRM+OLheZhW/a1Hub/Fv5y14fNKn+KvT4+5mFkODrn2ZI
 8QaFFRdVFE67HGHSc7Zm03eRM7jZDTdv23ua7nAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS5770L is an Apple-specific variant of TAS2770 found in a number
of first-generation Apple Silicon Macs. Add a compatible for it.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 882e19857697..5dfddd3bd049 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -978,6 +978,7 @@ MODULE_DEVICE_TABLE(i2c, tas2770_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id tas2770_of_match[] = {
 	{ .compatible = "ti,tas2770" },
+	{ .compatible = "ti,tas5770l" }, /* Apple variant */
 	{},
 };
 MODULE_DEVICE_TABLE(of, tas2770_of_match);

-- 
2.56.0

