Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77B3335555
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792306076; cv=none; b=rojpBPk+zCGgY3lJ3rqkZU8hMRXpu/XZnJuHJ0iUTNrXaBHqrkZ/ucMvQhqkleyavaVGub7JaI4eh8b5xzCBctdQ/anz79fWACMuPirzGpNhvsFv7P9kDdJwUnSDX6FP5K/EweRJZdWkGjrqfx8TgtHBcvk/Ek4HXO10Vqz5Kos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792306076; c=relaxed/simple;
	bh=l1O247UECd9MgFF/yX1QTmm2/D2UiVNrnHCAcxwFq1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SWhG7ClyRI9+HkX2beGK4IXnZ2Ra/5I6mgjnM3Gjm2ALTpMw0b4+dHpDM1jTKBfMZ9KnCrRW0fc6Kn9hKD9oxMBujb32ui+S7aW+azcoIWb3lBvEfJc8G2sKlCwsvvLhqOKLz1u9RpRRj2mfXF5TA5vhlDLMXb/1cEG8DdpiNW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2TXp2Wt; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2TXp2Wt"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9995ce866so8507925ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792306074; x=1792910874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7HNx6CyE/4Kbnua7x5pglUwrO1yHT5e3xN4f5XT3au4=;
        b=s2TXp2Wtgo9DkAiGjc+cQReUYTF4+/7mCC8sZaJyJZOb7c2E2bap/Z9HbyIGPLdB5S
         wJ48vifxPM0YfgAYygGd4OkLS5Z0ZvfDuqbrGPLR6SHxd/sMzNwXxYV55vyLZ5C07nzt
         o4SEH4UyK4XxKybigUESDi3i0wWRggkPEEiYorz3iHBBkSlD8VBnpctsrOTlgPXNgWG7
         faZVoiGmRKHbx7E19ktStTJJq1FI7NSfJiI9Y20+CDNXN6k36ChNlBWxL+g0XKtMyl08
         zeA6Ek62J39VZH65sJsAp13d/iQFEnae6LRGQCOgZm9XOCMaD3x4UhxkMd1hsWqi5Csg
         FVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792306074; x=1792910874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7HNx6CyE/4Kbnua7x5pglUwrO1yHT5e3xN4f5XT3au4=;
        b=VNRbbr5lbvYpSOloOW5oxjfzQGXTBkg/dP6vfHhoevSEZMFZCqGMow7rCMDLrQGWkO
         GdTeny5T7LhttXzku1mg99dR/3De84mJ4yPz0PoTYT9UHbTeFVEQvHhRQ0BVJ43Jb/Or
         tmE/W1a+RIjoRBdLDq1RyZIFuZXZ/zDzjgASRoNXXA5ZKfxC8FjiLLZW6+Cj3QfMkyhf
         opOQBDwAhChkxvP+JZ39NTVWLKMuUF1aGfDvzt6rQPWgGecLxNpJodFkOE9bs1B74Fe4
         3cc+ejiHzmZZhcHS2DUMvFTHTH3Zusd9TTH2mVQfIDB/de+jEpXqsO3cO3ANtrlkjxG/
         A5fg==
X-Forwarded-Encrypted: i=1; AKwUvByU1CgXoepM8vkBFRoIBraKypvuHwXMqfVvJRPCSAAUc0HW2/4IOj4fUsnUVad7YugvQyR0+No36TRrGco=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzyjNTninlJEak6/47z3DD4p1qdUNhuviblYUdcjd42GIav737
	Dkh8uVlZzJY4HzB4HID5tehfEzTEyB0iftdn03cUD+VBQOgm8rexOxF1Jcymb5BM
X-Gm-Gg: AYBFou2kv7JnjN3yBhQKCRUUR5La24IWdF0PpFQR6h0e5kLHbG99or+ZzaPjylTt0SN
	QJNLBFoSIr8+3ddS9hULDFaxwFTkgnBbDSaSSuH0LLeuUFhKAVmVoo5mmcrekdlgfI7aXb+VrVO
	hqvoqjT2c8aK1hlSilQ/pkVr5pvQANmMohNZY+OAL9bdPtYMVYY606nXuracnxQkE9ELsGOGUAt
	5lBFJii47JVBwgQvEA5iaqn1QsfNH/KuQzlm1i0gBAxVyRFO2ZIKjQAQv+UwMdgWy2Zb+zcj6+O
	jfouFEKf26EAlMS7/xRbMS/8Ljck6G3cGJ7T1FDCB2If2RdgvzCMmrtyJFfWEWKIUUoW06Zj1qw
	xLz+X0RAQzzCEFoDjoTXGCrqZWvSF35eADVAnfC08QAfLVHIOFtPLrg0WQnus4XrqnJRykDuVES
	TtapC4KUBGuz2TsyvPdFZs2DjlTt9TJAm7w12pykvTmUKuuYXZIoC7nwiNZ1H/46ytY4Tz+O+e0
	vHsbDmnNBf392WnwRQkHR2G5FjmqRH9FPOiaYoBDT3FQwOEPoX1ScCf+Puj52QtTkdNhvF1FRtc
	8/64NT9gTB8p
X-Received: by 2002:a17:902:ce81:b0:2e9:6f2c:71b9 with SMTP id d9443c01a7336-2e9a6834239mr39718335ad.1.1792306074114;
        Sat, 17 Oct 2026 23:47:54 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b98a9sm27280335ad.74.2026.10.17.23.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:47:51 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	marex@denx.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ASoC: codecs: Fix more control definitions that write another control's bits
Date: Sun, 18 Oct 2026 15:47:43 +0900
Message-ID: <cover.1792135145.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are the last fixes found by the overlap scan from the first
series [1]. In sta32x and sta350 a 4-bit field has a maximum of 16, so
the control also writes the bit above it. In tlv320aic32x4 a TAS2505
control uses the wrong register.

[1] https://lore.kernel.org/all/20261008130953.2446692-1-sammiee5311@gmail.com/

HyeongJun An (3):
  ASoC: codecs: sta32x: Fix definition of limiter threshold controls
  ASoC: codecs: sta350: Fix definition of limiter threshold controls
  ASoC: tlv320aic32x4: Fix definition of TAS2505 HP Driver Gain Volume
    control

 sound/soc/codecs/sta32x.c        | 16 ++++++++--------
 sound/soc/codecs/sta350.c        | 16 ++++++++--------
 sound/soc/codecs/tlv320aic32x4.c |  2 +-
 sound/soc/codecs/tlv320aic32x4.h |  1 +
 4 files changed, 18 insertions(+), 17 deletions(-)

-- 
2.43.0

