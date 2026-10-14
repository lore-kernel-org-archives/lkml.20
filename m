Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B10432BF5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959584; cv=none; b=sAlMPQmX2HZhTt8nQ5RyUkO9lXX0oLquSB/MYZ03iBlUHE+fNUrJ6l7KS6huRWnBAj6uixsz/iOqq4tU3Ckp4nZVJJlEJF1FCjT+O6T9C2IocmhcdWmbjY3K4elT5TfaO8svh6wGJnbXtWpQbzR10WXvTVPETmo/ui6Fsrk4OYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959584; c=relaxed/simple;
	bh=BU6CWfcv6QXI3AU+/mD2JVAE7fbItnDAw/RRU1VTZIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESzpyLmBGPdwEYv+M0bK2feHZlU4x3NRelWNnkVsHZvYPQlNWUup5tCemk5BeLX2K35jhXS1KCtT82He7tYvQ7xMPbDI6ak7B21S5wMbiD8N0qWK6ayhL2Ij1Sanx2A1estKosmfOSCVXs9ueAvmfmg+H/faG7EF2O9nQvc7xH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJnXM/VF; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJnXM/VF"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso2847369a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959579; x=1792564379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+6hR4pI3uVUfiEl+bUNCAmL21z73/9mDvuME3Iv3GqU=;
        b=jJnXM/VFPhxBuGDz26RqdFlFKWFlLWIfV2DkUb6Hkz72CEO7W5HCWSMPLknI1ZAnHf
         pZOiyshkomgnLJ4y/Zd43xSdhcbbK+aafdhr7mMUkE//eQZhUuU6qZdStaxYGH6Tl5+k
         ebeJ1DiZUnIIjbPR8aH1ZepmvsipJQ/pM5sH2d3R0Cbh2LGzY8nKEA0KU7J6VJ1pExVo
         9dzgZG9PmDGrCWjjoOQ9HywC2Qv59sgYWFRvguVfjxvW76uxwAdmPlk+dh06zLfmxFPi
         yKtSSQfj3Q2I4xlYsaQxjlD32HKmIqw2KV87TMKq+D/dV4AUi/VpP8s1edtuTdw90iC8
         A4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959579; x=1792564379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+6hR4pI3uVUfiEl+bUNCAmL21z73/9mDvuME3Iv3GqU=;
        b=ykdKigx9pqDQ5AQaTs5yBkv4H43ZIdJQlILCRKbtIv9wDfXoBqMO2tB+XOfBgfII8t
         yZZxa919MEwqXj0PMGKnFsscN3NquaLyqGARBcMXnn77WHRw6+xenTVlA0OxPcuIt2V0
         E4jMSrM+No4iid44iwrdvqAO9k8cDGdVASo/lc/4idmtkj5doZQl9G62PUcFSyeHmqrP
         28rHCYThU0/VVJYtUGJioAS80tMi6oS4AJMsp7ITQHcIVXvxslXfoyi7l/dL2hAZzjIT
         dQHRmNqZJzy93oJn2t2Z5aa+KzLg8FfVnnfgBSMLESwhOTy1UAUAXfAJY3Q37tLEkZNg
         LMJA==
X-Forwarded-Encrypted: i=1; AKwUvBxD55sdn9Cv8owgAcfxQRBOT8CYuiqmqUjWoDFIN00lpFzZW+TuSmQLSHu2x3PEm/ztvn6IL5Vox0v1CH0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+n3V4UNBXcW6MYKCW7jyeZ1HjOPlqAreN2SksocfWPjmHqTX0
	um8i8kVUuAiFl6BFCYb2LqIghp5/4++LwfZQF75GYltAHwZrA104+38Q1UcR83+MCVU=
X-Gm-Gg: AYBFou1lLG/isf/o1gLm3nwxOr35OTcqtgAE4ilrvlAlaLtiWV1NtkN+IJgE+q5rfy5
	9O6NTm+UGvvrSOIfkkP5mHQHgaVfDaGJZv/8ghAiKxCvv20puvryyXZIe+DkoL7NQOJ4DdVn0eL
	9LdsXDhrQ/hJx1LJ1xdGZ9t6ZMdmNMR6lV6uNaBC2v0F2Nwx91p2/u5+SXFmQ2HviivOsZ+gJof
	97MMQFn0i0UvVTbQXkXpuZTOdY/og6Iaoi+QJG3DpMQCBsIrr/xnGvvCjM1sGQNorz0aBDqiKzQ
	FBY5BJiBqUM9PFSlb0PbdRaTqrBVYNsKcVkMDnXGeT/dhIV9vlHI8Op+Bbb9Yjwutp5LGyBgtxK
	4AW+Q9d8/HdeZ40k1AULazlw1nsOD4hfb5jyHmkpqYUoAxBdzu7RPITAIqhY05uPCmfiBgEqDdF
	UV3tyofCBS+h4YC6hzSQzTWJgDv1NIV3rZcUJq2PDGcOYXdEpQl9j0xvVjvnd9v+dQWhgiayzVh
	qg1R1Hvcy6qxSNe/oxsYwB6sswpG/cZ51TFeI0uDzldt3AtuuP49zXOFNoc8Sy3nCJzzScUOlY=
X-Received: by 2002:a17:90b:4a0c:b0:3ac:762d:79ae with SMTP id 98e67ed59e1d1-3ac762d7ca1mr683645a91.2.1791959579079;
        Tue, 13 Oct 2026 23:32:59 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:32:58 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/13] ASoC: codecs: wm8983: Fix definition of ADC 128x Oversampling control
Date: Wed, 14 Oct 2026 15:32:32 +0900
Message-ID: <d6a5bbab35e1fd2bec5b13d30951546080d493a8.1791959026.git.sammiee5311@gmail.com>
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

ADC 128x oversampling (ADCOSR128) is at bit 3 of ADC Control, not at
bit 8, which is the high pass filter enable (HPFEN).

Fixes: 6b3860b0a20a ("ASoC: WM8983: Initial driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8983.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8983.c b/sound/soc/codecs/wm8983.c
index fab25f35fd14..5639dad90405 100644
--- a/sound/soc/codecs/wm8983.c
+++ b/sound/soc/codecs/wm8983.c
@@ -234,7 +234,7 @@ static const struct snd_kcontrol_new wm8983_snd_controls[] = {
 			 8, 1, 0, pga_boost_tlv),
 
 	SOC_DOUBLE("ADC Inversion Switch", WM8983_ADC_CONTROL, 0, 1, 1, 0),
-	SOC_SINGLE("ADC 128x Oversampling Switch", WM8983_ADC_CONTROL, 8, 1, 0),
+	SOC_SINGLE("ADC 128x Oversampling Switch", WM8983_ADC_CONTROL, 3, 1, 0),
 
 	SOC_DOUBLE_R_TLV("Playback Volume", WM8983_LEFT_DAC_DIGITAL_VOL,
 			 WM8983_RIGHT_DAC_DIGITAL_VOL, 0, 255, 0, dac_tlv),
-- 
2.43.0

