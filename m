Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D15F4A4829
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465032; cv=none; b=GyWM9TylBs13DOIyYJnMW55v4PS6aOvbQSAU5qYud6Wh2jS5uRWi0Z34NkX1ycjAzHr1uaO5ASiZ8HGTCPxsdLoo+t7Mbv922zIPgUc1st7yxCalkhKlFgdlRbhlkou/lTYA/zI4LUq6CU2ZnenBzSeCftVXCKrU87RseekcpuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465032; c=relaxed/simple;
	bh=zHCtk0H/jLyKTYdfYZ5aBjRZVczZY6U6t7NL//KT1Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HdWwf9gHYzEtvV5RZdcrTsTU23mSVf40u58OjLxDk8rMy6g91l8em9S0xCLtaBaJF8ZW3oTic+/G2TjcU/3btrSIoczvPUisx0JyiOtRHN5XuQCCgzRucmbOyG7ZHClFMiFLSHz5mtOWabY2oCwlW3ohhRlltwGLjf/mTl5x7M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4w1PJUZ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4w1PJUZ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-88b5f43cb8aso1788123b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465031; x=1792069831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shuB7r7dFfmeYUYlRpCvLZJEkZ6fS8GYQAKqB0WVliU=;
        b=e4w1PJUZBtTapBol6J/Hl8Ki4OYkrV5W7Iv7JZdkjwWH+370R+qqBVDEoWL8YkMPS9
         qXyd6BdbTZhEjTAhDRSjsBhJnv+azLoFYcx6rqMv4uIkVqVO9tX9HkglO7QYN3+phD3S
         SKDAJ9yAS4wrLe8yu+qQpa0S+QRIf+xjWlyzobXyHU3YO75bEysN8ois+8odfDZFJcJv
         sycpVZwLlu4ijVirLUoSyG1BIZEGPSpIIDh4ilRUS1OhE6CUo2ils3KWjKQHKh8RcifX
         JuaC0+o9OdPSTTY+HCtKKX9Tb/FphlG1joZUdQjqkHEglKBku3B/1+LNdFUXdBfy0hWN
         T4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465031; x=1792069831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=shuB7r7dFfmeYUYlRpCvLZJEkZ6fS8GYQAKqB0WVliU=;
        b=Poxr1Cx074ATqo4tDLqe0Pe4dIgtKIdG9NV+ypBzXk/m9F/ARTrzC+doYi/e8qFP7G
         s/jN9cNznNhFLs0q9u85CwhEVbHedvAH/pE1NKjPXRTx4V0q9W5DM0hbrMsmLJraDqxn
         HSboeuSZen1dGQRs8jNJaCmOMpuF0bR+dpFpAEMDzloxUh4uIK1xp3LNZ67XNq3qVDym
         NnrAimALMHMKrr6waJPDj9mjI8WAjULoNbl7AzlOhkY8reHaIrJL/0Bhr+QHXJ5AKZTP
         LphaSCeIiJ0DIa/UWtv5zVUSfOrIKGGSgpqa0+gpQ29pQ/mr5m8wwGW+5UQLznb6s4NH
         DawA==
X-Forwarded-Encrypted: i=1; AKwUvByFJt53JzYGg6HSxLvWzxA5teDnvb5R9e2j1yt74ua53X7k4fVnIrGjG2z6mGXd2FlbaXAxN3A35HoW/Aw=@vger.kernel.org
X-Gm-Message-State: AFuF++mbCZwxPdEGtujvx21co6/Vay9fQpEgGzCT/ItEkY6C+CN80Die
	437QNUa84wSgbeKAORZpH2j7+gLDw22aBS/Il/B9yfOhllUxZhWs4Xst
X-Gm-Gg: AYBFou2PoWQzuc4J/tsznlb2iZMG9QLWuUQEKjGgsE0phN3lxMAarS9kf3yoZ/UM41s
	ueqjXc6N7mkeYfVH26pl+Pw1/C04mbkEycoy3KcBlWkTuRVX20/58KLB1SUjmZa7PgCId/4T7DA
	JITQgEgLzK71wK8SHHRfUDdjE3I5IG9B6vT4BbyExoDL10pi20Jwhl9rhZ6IlsMs9gSCQPBk0LZ
	/ouNXRn2l/mh0lh50tR1WFN4Py/U2cZ0AWanO9odZlv1jv16Tj1AuYOvqkn/kO1TMRcPf6lGssX
	uK/1c5NJHEyVcKgHEHnx8CWsjuiV+9GWKc816IkKekImet/B0vnRXgNA+o84JzFIxePXppJPT49
	KSUM5qbBpSFyJ10Q1uqHWZ7xeAUkgJRF9txBXK04eVjVt8ftQ0YdKK8bUkxV9Kpd0wOT3jkcuJy
	zNSfLgYneCgavd3W8S3mJ7Gemop1lnM0UdCdxSs+svSHHfr+v+Wr5x+uW3DXE4Tp/iMfyOEUObu
	Aq3PbIDaM42kRH0tjRy4MrRQFq7Z/IMIgR7ca9V6v9kyDgsgxbZ2kcm37LJXMFNcy/iw/vvvDQ=
X-Received: by 2002:a05:6a00:4b08:b0:882:1b4d:1847 with SMTP id d2e1a72fcca58-891b49f0761mr4456095b3a.39.1791465030602;
        Thu, 08 Oct 2026 06:10:30 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-893143368a7sm870761b3a.48.2026.10.08.06.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:10:30 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 6/6] ASoC: nau8822: Fix the 128x oversampling switch bits
Date: Thu,  8 Oct 2026 22:09:52 +0900
Message-ID: <20261008130953.2446692-7-sammiee5311@gmail.com>
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

The DAC and ADC 128x Oversampling Switches use bit 5 of R10 and R14.
The NAU8822 datasheet register map puts DACOS and ADCOS at bit 3 of
those registers.

In R14, bit 5 is inside HPF[6:4], which the High Pass Cut Off control
owns. So turning on ADC oversampling changes the high pass cut-off, and
the oversampling bit cannot be set. In R10, bit 5 is reserved, so the
DAC switch has no effect.

Use bit 3 for both.

Fixes: 1e3cb6c321be ("ASoC: nau8822: new codec driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/nau8822.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index db1931d7b901..d91a0bed2025 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -383,9 +383,9 @@ static const struct snd_kcontrol_new nau8822_snd_controls[] = {
 		NAU8822_REG_RIGHT_ADC_BOOST_CONTROL, 0, 7, 0, boost_tlv),
 
 	SOC_SINGLE("DAC 128x Oversampling Switch",
-		NAU8822_REG_DAC_CONTROL, 5, 1, 0),
+		NAU8822_REG_DAC_CONTROL, 3, 1, 0),
 	SOC_SINGLE("ADC 128x Oversampling Switch",
-		NAU8822_REG_ADC_CONTROL, 5, 1, 0),
+		NAU8822_REG_ADC_CONTROL, 3, 1, 0),
 };
 
 /* LMAIN and RMAIN Mixer */
-- 
2.43.0

