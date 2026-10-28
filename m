Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184118;
	b=r9sPi3Abn9F5Jzc6MSD2XyxhrRozm6e7xVAZLESpqTOCqqEiE25qZ3i3jeJdjJ/foKPu
	 HRIn76bp32U3CjEZjVTQSVCtr+pmHCfzUSawm1C1/dC2JhX5mrHP+98bmGpomcbQ++gHl
	 7gtozxWPYNw0xukhx6GeaOqlTr80w8kG5eyeTAgOEhRB4VaUlTc+uLw0WlWywqFRlIfUv
	 J64RLSJ1ElV08p/GmcXLKVV27xKlCQtRVFryRGvFFBG1yC+3fu+RgTwso6Ni6rdOhh/Fa
	 TMgZ4NZF6RNnqjngYHNuOYqJ+ZWauYFoi1Cu2DYlqP2S7XhIOmlREt5EGvdjc5DfuIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VN5fEzxH2kFG0nlBiZiP3afHlKGS+YaXg+8uMnSRxhg=;
	b=utYbm3wDlJblTy1kWOpQPWA3u7/flCeQhKFpKtHJoGhRsXgDqSTV8sLvQGZLeOIl9Lhw
	 fYZLQ+jbcMS4MfJo5ZUYHoQBjJwJrLAmjdb+C3oP9loH/lgIKsdJNQIOWFchmg170U1Ce
	 vrm/WzFe7hDymssI+nY/nZLtDKoqPmBomLsoVKVFLCUnMvwKWNt8HpZpzjTW1N9vrkXg4
	 wWiPctHDezuCXmxBkkRMKdIsBGhNWqXrAjZRhTjC/lDt9Q4Y194rC42trzgL2d8LXOQx7
	 OHVJhQLbE80KiCvhUph3b0BIrxoPiOW4/Tjdx4Coqwfj3K5EhqAZhQexcgd6k/mXgkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=01eM8GzE;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A04606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34A04606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=01eM8GzE
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-353804b591eso1303135eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184117; x=1793788917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VN5fEzxH2kFG0nlBiZiP3afHlKGS+YaXg+8uMnSRxhg=;
        b=01eM8GzEbTOGlS/4wzn+IH9eCHPQ4B9A99Ciin3/ICzHqi/hQwxUEeauTHqf98cx9j
         pyvF1GFCeT/E2CHC55nmWP04gSNOISX7d0cUAuH7a7nqUAInAthT2sEkwxiqVvFJtM1D
         wSjZHFqatQMVVQd4Am/7etu2gEG1/ENqIwUYGtzojHtWMy2TesJv6R7qMMOS4vOdOmsP
         8egVD3fcEDY5BmGqK6a7XSe64w7HekLGFtDhxlnjDvImNSMNDtNHIUMJc77P/2YsP659
         hSyOSzUs4nOuGaoSWPYbuyCnp05JA3f9xJMAvhdEV2SQ49WzAWE/DYvIuXzPmrkvHIRV
         CRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184117; x=1793788917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VN5fEzxH2kFG0nlBiZiP3afHlKGS+YaXg+8uMnSRxhg=;
        b=alI0VLWEX32sfSIfu2nITs1xEhhyTvqxECrVbzxvtMWxzfUyHqdE+WdQMBlNR7HAyv
         HZeReyDssN5wmuklqknagLoEGfrLuKBQZcRqAlwDZh6oJa6pvqzS6MgVb/b0Imyi+W5T
         D3ylhSMFblnmkiu3+1JtVHaowiqpMnmL4Hzqg6/qFD0bAfdGIsUhUAGgNgYLcYtL+h6Y
         XEtPxTwVrECzONIG/QFnDTKTr6yKcs5bPp8t8JduHW3XdfFixyrBXRwz5Muheyxreec5
         DwJgychBkPbeVZsmcdJwzzH28F95q+r3eVyU+Q/E5nEcxtZerApwqGo+AAp97seM/70W
         vVmg==
X-Forwarded-Encrypted: i=1; AKwUvBzJaH4RC39lRCgJ8kaMUV998r1AkCCs8EpQ5QziI5NXitx+PiX93HyJD4nLpj0uv3fYFh6JpCLCk1BFG6E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTnjeix1Bq6FgzR51/B9cc8hOtcjqLosrGrbDH4FryLmM6JHak
	R5Rup2GEwRnJjfv5Ooy9qXpd7cYOBbp7B0ET0QYBZfwtFTJ+yX4SnwlXsAlxMQ==
X-Gm-Gg: AYBFou1qE7gHboCQdHcKTviQwPFI+v1M2zvOB9A8vjjGqOqHqqsER2n8LZnDUdQ0yZJ
	TLFLa7I3Kvo2kYre5/A0IIOkfYAPpsRjjXLP8HrddlCkUCF8GC4VFquGTwmuHXvyndEwIJdsqnt
	12nY74syObSaWzDIWFc0P+dSKamQk1V1V/bk7IGw6Gl2Vsjkqy9zSgMqrygPbi8OmIJ4nw8P1AB
	UvlviBSU/b1X9Rr+PasqpRe8UbjH3jVh+r+stXRNCjq2EuNmpPu+sWSZEChLFBCbODJAXCSACJ7
	2Hrc9Mv9H8SKsWreUfVBm3phmbqlcbXy/tAnuN6TnYlKs8Y5FdMLAkXoJXnPj0zAQfumh/BPKEp
	RTtYTDmR2WNIzQZgfx2tUREiJZdg7djo7mLPF4dadz7Jo8szCgCd23pCyuX0BK2n0vhkGj/Set3
	B8xbfJXr5H656uLkdFX0CSSBJmDyBl25UHjjJNwh9rBVj9h2Y0zkmeTdExWSj2hBgClC3feOw/c
	xWY9oCxYVq3Hx62J+58vi9od+8DqPsda4gI4ZFYDDRJimfDp3+3mGqybM3LD/NTZUN4l6FhafpZ
	dU8rfgLf+buJ8qmZ5m5sDDiuAIHG3d9qYt9UqfMvx+5BRTQBVhIE8zohldiYDB1jKEqfFXpz4iT
	qVDY0/jqLZ6cgwjX20TetWucPIT30He5JpZyFAecCxqpA
X-Received: by 2002:a05:693c:880b:20b0:36a:16b1:3f25 with SMTP id 5a478bee46e88-36a2027d423mr3426321eec.5.1793184117071;
        Wed, 28 Oct 2026 03:41:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm7521881eec.8.2026.10.28.03.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:41:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/3] ASoC: loongson: Fix configuration and clock error handling
Date: Wed, 28 Oct 2026 17:41:35 +0700
Message-ID: <20261028104138.26973-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes I2S configuration updates and improves clock error 
handling in the Loongson ASoC driver.

Link v1: 
https://lore.kernel.org/linux-sound/20261022084040.31181-1-phucduc.bui@gmail.com/

Changes in v2:
 - Use FIELD_PREP() for register fields as suggested by Binbin.
 - Apply the same approach to the other registers in hw_params().

Compile-tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: loongson: Fix IISConfig0 update in hw_params for rev 1
  ASoC: loongson: Use FIELD_PREP() for register fields
  ASoC: loongson: Handle clock enable errors in set_fmt

 sound/soc/loongson/loongson_i2s.c | 58 +++++++++++++++++++++----------
 sound/soc/loongson/loongson_i2s.h | 11 ++++++
 2 files changed, 51 insertions(+), 18 deletions(-)

-- 
2.43.0

