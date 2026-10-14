Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5F1442FB7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959597; cv=none; b=fsIuGfbm4itYbN1SyJy96MLcExsYPSEKuimFkrM/B0vGu8rvWWr9dAcDdLs8EE0IfcPWIlYjWmtYQ0+qct/HjjvAcXjH1Wi8b8NC6pPWEEqHRCJaseyKBw2lcC81HQf60uR2mYLa1D27SO4e8r83P2CsYnlUwLUMkL1p0dNsOzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959597; c=relaxed/simple;
	bh=X1TteCYW0C81h/9+ov86nKEnPSCdPAB7NOw8djpzd3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V84Cjdm/NZ1DSKEzjBuyrwRAsmBlNTIBdKM3hP4+saSna+Rxqm2sq242dFYijyj9UcdUor0f8ElYfc4zsIHC60LfIGkPK7CVSYCwr3lu3xb25MKQ8qfvFieuVSbdm+2M0LIocr9ztp0yD1NJGtHrFwZwfMOmEE627AY9848RS7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnRLK+VS; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnRLK+VS"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc502d509c0so254929a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959589; x=1792564389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RH+iY7dhDDJlwpXHf+WzAFlV2oF689XdVCD3sH8jSnE=;
        b=BnRLK+VSGo4QfKUCEYK3+48uXxH+EctDQwhnGKLIXcKjlrnimGgxWvFvNmTJSPZs+X
         kHr8cXKAdv98BAlt9HLG3kUq21eDl7YmGo4BKPLjeX21n5BpiqugqM3kZF6qALcxRQ0f
         moCK99VPGE8QzbChhyBwMO59mj1jGOGgGfevDqSO5FmnMhpny6tj0PxvzGIgphUlUOmB
         OkOsqpjrrcDkm4LPnuG2qENDDtEakeYGu546tU8WsGURehWKV3Pf+ovFVIrOMFv+CR8Q
         3ZC6rZ/fPSZFJ+QbswqN6zpYB2tV+E47S9Tvu/qQttKTJEsaAi8kQkI8X5qIDnFBNg6b
         nN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959589; x=1792564389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RH+iY7dhDDJlwpXHf+WzAFlV2oF689XdVCD3sH8jSnE=;
        b=GggHVk85PVqZyEH7r1fhS/w6I6uJnuAfCMzW4KnkUpQ4Eb2SbRJ32umBifDXiu38lf
         TRYP4lObdv2S6s6uYs0OWqZKW5VTZmiUw5ibRShkE74kx0J+oM1W+jxCTan83uadWxX2
         BD/td58E/4iBFnPxVLrDewT4oJM+PncWJ2Brxh26iDdTKLGkMnL0Tx0f9AZAAfWW0biA
         5V38cStYGwvSupaYVqVirBD46Sb4WnV4/3CCqjW6RxKrQOzUh6RZcK7xDERwSyuo8IZt
         2svWTnzdDAw7K5Nb427pb50d1NsTrmHl0lf/Pg9kXaV7QfaicsXji3bMd5ugXWMHOTF2
         3+Bg==
X-Forwarded-Encrypted: i=1; AKwUvBwUhc2qKgaZnHW8hBtSCEBgEGnJ8AQWIMpBnnvz8oUv9MjXOVvczhBc8lNizLAcinbLJKoSHk7RyF3/PZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+oLgvJdTMl2w6CKP/NAGNVOhzYnkf5/qbaaXBLJruA6xEHMGh
	ctO9tETt987Nc5vCVlrVvAGXJVotKMwO4hnehTP7rEqCyEvQvmIa9yfh
X-Gm-Gg: AYBFou2ZWRNwZgEcZZWeuBauLuHfOJUZs2zekIlRqtVllO5hm8pdx2QJwDGly4Z3oDG
	ifIcjFZwPLz/CykpvyF5W3AJcXot5ZTBV3PZj5JwqUncBh2JRL4MbkvNzLF9TyLTdBoGCCCdMOI
	gRXOrVIbnruD4Z8cmx7rvwHDQzb+jMXvFG2CioRnmcUNLzM3A8xgc7pHj/0f/Kout+VEiGbsqXB
	wHiOvBmgW6RSlK0QtaM2Lrf8JJwLJ8oAaQPV99OvmQ9G0NLZdvsl+gBfMsqn/B6NL7y+ZaFmXXR
	+XOMV3UBeXkK1+UHP2DZbok06I/chITK5XXwzWSpQ4zH+GdtSzWKzhJxfQNZLCnMdF7R0bK5IwJ
	y2pMy3iSHhGWXwiI2/XS5UBPvSy8HkgQZOcSn9vYMHKi+9yTX/ptHh78wfRdbbQfIhY2T0UPesi
	KNpjD9Tj0LDoSWQwe8twluPVs0JIB+1VXNjoRR4+2H7gUcIMEkJYRVWjkhnPTczGSzzvV9Ndazd
	wIH+6TC6GleYqv+1kfZV7WOW0/h2hDh5PDnoOT+rScdPIFsqlFKpyc8jgq0hp6P6/9YFRLEwLOm
	BVbJsiu8rQ==
X-Received: by 2002:a17:90a:d2ce:b0:3a9:9f13:e960 with SMTP id 98e67ed59e1d1-3ab3a98f4e3mr12647903a91.60.1791959589183;
        Tue, 13 Oct 2026 23:33:09 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:33:08 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/13] ASoC: codecs: wm_hubs: Fix definition of MIXINR to MIXOUTR volume control
Date: Wed, 14 Oct 2026 15:32:36 +0900
Message-ID: <1ea1d115cea5b183dd51bba5cd9e38157b3482ee.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Right Output Mixer Right Input Volume (MIXINR_MIXOUTR_VOL) is at
bits 2:0 of Output Mixer6, not at bits 8:6, which hold the IN2LN volume
(IN2LN_MIXOUTR_VOL).

Fixes: 942c435ba79f ("ASoC: Add WM8993 CODEC driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm_hubs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_hubs.c b/sound/soc/codecs/wm_hubs.c
index f80dfc488e3c..ce16f2750979 100644
--- a/sound/soc/codecs/wm_hubs.c
+++ b/sound/soc/codecs/wm_hubs.c
@@ -427,7 +427,7 @@ SOC_SINGLE_TLV("Right Output Mixer IN2RP Volume",
 SOC_SINGLE_TLV("Right Output Mixer Left Input Volume",
 	       WM8993_OUTPUT_MIXER6, 3, 7, 1, outmix_tlv),
 SOC_SINGLE_TLV("Right Output Mixer Right Input Volume",
-	       WM8993_OUTPUT_MIXER6, 6, 7, 1, outmix_tlv),
+	       WM8993_OUTPUT_MIXER6, 0, 7, 1, outmix_tlv),
 SOC_SINGLE_TLV("Right Output Mixer DAC Volume",
 	       WM8993_OUTPUT_MIXER6, 9, 7, 1, outmix_tlv),
 
-- 
2.43.0

