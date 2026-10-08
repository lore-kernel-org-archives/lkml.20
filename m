Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DDC4A385C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465021; cv=none; b=PdT0LsTc2rpQQd/Pue95rnIiVhTTLchCb94x9RCDLzWofx/GoblFxtIy3+XBquodmlVpcp1/kvBHiNvMTY95wU/wHQifQuoTHzmcA1Kzp53F/uK6oG+nGQ97lpoS7ows/VVh+HuIbvVS7LT7SrnRgsDFWsIewOlnpxaZgnDzbgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465021; c=relaxed/simple;
	bh=aS4Dv5UHiq88C7h++2J8wWh4mkIjbtMYGmmdrGEH6DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uLDfoViwhgGz4qppDDEY7p60yHlswgQ9vmSQ4mfGP5vQ2lB0DRt+3alnt9XLP2PAwRAqS9VmmTNeUnWBIwczC8NABvykUB/x1yvXvatKWelIAMDHqQkJ/DWku+wj6hQ3KDRnN0jkS6xbOfJXHHLF++IwO8XPjM3Quc05tZhY8r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3H9i9an; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3H9i9an"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8897e83332fso307579b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465019; x=1792069819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+A95327gEMuDSz2TUbfO2faSqz/UxfLB5KUZN+2QgPI=;
        b=C3H9i9anqnZgFOqLOXO4vu95c882goEtdwfPh03/kOspfNiecyvq0SB9iHiCI+eVnM
         kAcosTPvkxRxdIyVdrtQxZzMHLjATBB/hkA+jIGu1Ooqxs8Uy0sHz8zymxSXIlQ62wSl
         Yoove+2wrPeP/bn6+rFp6fkWw7gFFHMlC4BHGW4ZwoO9kjDIv595A1Mm87txfdDv8FrL
         z3MRROUGbKDWBm+6SNxvjweZmX/tMDh4TFIwp1T3UCgtl0QYch8RHB3ly85qBfoY9o5R
         rpHjam8nV0gzJuuvh/aWc0SK+F0i1YMvArA0jYzAEfEaSvEu2KlwUl4LDlJyDZ1zM0an
         8yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465019; x=1792069819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+A95327gEMuDSz2TUbfO2faSqz/UxfLB5KUZN+2QgPI=;
        b=SEv47f+52hxj3RVLqxdPwyI7veBoMH1q1KKMfgWzrkuZcF6hvhb5/HkXV+zaUjcQcJ
         7dII+tiMYhcmUYSVBlAELy9c8LURIJuO2LucanimLOKbWgK5yVXmVViGzlVyz99KeXOW
         fg0MWYzElw6ovJmEkQT4NiyGnZMnvbzQfJhNh7eLw4z78gLY921KUSe1kh+goeL4J0se
         WQAImM7AQpPS5SHrVtaLR7tjuqjXyDg5ikV6s53LX2UrmIFVJHV2rdZMrz96mdWadHaD
         F5VvjLrnG9+kpOGJ8y34AFolybD3HqYox3IE94bFXuTholmpumelRagdqIjyavIutyeQ
         tGuA==
X-Forwarded-Encrypted: i=1; AKwUvBy9bVTkBXbl+lcB9C2tVfQIezZnRi3l2Lxs1KeqQTJse1xok08bRhfCijm/5fBlhlRONMp15FvFiakgw2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL4cza4a7fT4nrLW08Ne4qMgcYC/jH24CKlC9FlEpuqD1QMdhc
	Fto7JCdF7RsYehzzONIDw9pRyOFYCrqfZcejYJILcvJFw0Yv9Rdp+iQ2
X-Gm-Gg: AYBFou2N5XQEAlHMa3kmKZRHMxuwCawVTuHFeFyTV0wsnX1lEn7TlkNG64Mn37GPVJ7
	ShMAMS2v5JVSD7wUs9cXZ21oqwokcKp3lE0+yC8ng/KTyIaQd584gPLERMjUPbC/+CVrHUcmmc3
	iKhVC5LRzQYC+J2kCt+SCD/ANeVJCchH2/24Nbj+/9ZWAyjF/RnBRbogdQ1iwYWD1SbrCtN8PYN
	iwUrOVVdq+dfCAbngYEw4JOzaX9TIZnbXZKyA7IT9yhq2aYScHIu8FnAYOBk4xhlKyX3D8gLb6d
	aDGpggzW9YKh8rDDZ3Gvva/9NeUOQeHtS2WO/S2WQtH60GmyfiEW+r0Q1N2FJer5QKX5dXBQCVf
	2N1ysJnhCzA8CFV3tOfGBEi0kCJLpKat01nIzj9fFYjuTU4sYopYEgdLug7FmWfu4k5UiPl0V3n
	UKDsT7xgwl8oqKLMbhgGmLUtGKPNukYQX0XcHniWLHo7X12Uf7POp4Jx0vDZE8FEU/Z6D8OIBU9
	QEzfr58anFyKTN8dv7jtAlDHyf29HArRx0LoTHLncVBpUybSvJXUD3UzBe1pC0Ugwps7NDiqkk=
X-Received: by 2002:a05:6a00:228d:b0:886:2d02:de83 with SMTP id d2e1a72fcca58-8930aec36abmr1548345b3a.25.1791465017776;
        Thu, 08 Oct 2026 06:10:17 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-893143368a7sm870761b3a.48.2026.10.08.06.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:10:17 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/6] ASoC: pcm3168a: Fix the DAC zero flag polarity bit
Date: Thu,  8 Oct 2026 22:09:49 +0900
Message-ID: <20261008130953.2446692-4-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008130953.2446692-1-sammiee5311@gmail.com>
References: <20261008130953.2446692-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DAC Zero Flag Polarity enum uses PCM3168A_DAC_ATSPDA_SHIFT, which
is bit 6 of register 70. That bit is ATSPDA, the attenuation speed,
which the DAC Volume Rate Multiplier enum already owns. The datasheet
puts ZREV, the zero flag polarity, at bit 0. The header defines
PCM3168A_DAC_ZREV_SHIFT for it, but nothing uses it.

So changing the zero flag polarity changes the attenuation speed, and
ZREV cannot be set.

Use PCM3168A_DAC_ZREV_SHIFT.

Fixes: a9b17a638af5 ("ASoC: pcm3168a: Add driver for pcm3168a codec")
Link: https://www.ti.com/lit/ds/symlink/pcm3168a.pdf
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/pcm3168a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index cb6a6f08f2f8..6f45ea4869a7 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -103,7 +103,7 @@ static SOC_ENUM_SINGLE_DECL(pcm3168a_dac_zf_func, PCM3168A_DAC_ATT_DEMP_ZF,
 static const char *const pcm3168a_pol[] = { "Active High", "Active Low" };
 
 static SOC_ENUM_SINGLE_DECL(pcm3168a_dac_zf_pol, PCM3168A_DAC_ATT_DEMP_ZF,
-		PCM3168A_DAC_ATSPDA_SHIFT, pcm3168a_pol);
+		PCM3168A_DAC_ZREV_SHIFT, pcm3168a_pol);
 
 static const char *const pcm3168a_con[] = { "Differential", "Single-Ended" };
 
-- 
2.43.0

