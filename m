Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260888;
	b=xe7kjtlLwuzG0x7rmUrxMLGW7aYcucGImx854iU1DZMAqxzn7u89jJeKAR7MZkMAXdF9
	 NWQDH9dH9WH71ffyTz7/jl8SNLuW/pWOysC5gR5BaJXJPI1voYqPXhACD7pbdcXQBrWwn
	 iKSTy0M2HOT+FwXgCU3XPAO+Z5NG2maDamTvAr+0XtoQvhgHKWxw5F0d7mTa0jz5azclr
	 KcdZZWynGJv+Ta7k8MwVIIhTtMhs3QhKjjPcgVMvanP3t9cdz6dCJr68Du1sCwgjF8NoZ
	 zJp3GbPdIhtLhDvaYU0PjpbG2NYUV+AKPxv6OfnHhayGmdR2ZDE9jOupo89zwt2o+yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/d8IwCIqZ8PUSmXsThzeGHGWl9DDG0TcmLpto88ahAQ=;
	b=pFeWkZbVDhzvf2Et3XUIZ622SK/rkln0rgRXdD1pCmtzmpj1gHWYbq3GThOFLnydSQBv
	 ywumWW2psT8Q8YKIEgbX8BGy5e/5bBWb/Omg02U9wI0SS44dGyoMZ0w/+4KEtTftVo/Ee
	 91cKHEaMfabWoI7ePdmsP/uoo9S4Zc8nKJNiFn4tWJ64ZqPiUmd+evOOLmHpNWbrKvJ+g
	 uxBXs8Y+4VpAHM+137hnYcF8V7mpVCiPuT1F/+lu9qP3/gLzUmnIAyt/Yx/wnNjMT1bM4
	 LxdMjE65VZ40/2mr4ykCGFL3gxxS2vIyAghnxYlprZfNxHVQNx1X11ntljsmjFHqH0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+9V9DCT;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36BE606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A36BE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+9V9DCT
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9995ce866so16451485ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260887; x=1793865687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/d8IwCIqZ8PUSmXsThzeGHGWl9DDG0TcmLpto88ahAQ=;
        b=v+9V9DCT4syKNnx+u2GjMoRpclOhWVrVc08k8qJEyOoMfxaF6aA+13Y9MsvgfLy9zp
         kdKi53kaQOgdaJd6buuBoUbv7MIelxy68et27pkshiAEHrYUKor2he/auzLuDWe5zxdn
         sky895t3Lkr9qKp6Glv0ifup/whpBuA6cYuTlF4TLgwdVwjSn6/Q2e7yR4monjS+QDx3
         qQ+dKgIu1CfCjEKresyIX7VFVScvEqLPJDvN+cUTS9tA30sOCU6weD80XA0q3slMqpkg
         JIkVl6j1D9G7FXbLop1U10j2MeYEuujJOf7/xEAbUDUmDo4COpy+iWwA1nE0S2MciJBS
         8Lhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260887; x=1793865687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/d8IwCIqZ8PUSmXsThzeGHGWl9DDG0TcmLpto88ahAQ=;
        b=qNjweK4vvFMdfBfGkODyK93Bry7irFwFXBcGuHo33cNhx5DkrAkVZaw2Ce5zsI9IC4
         CcmSp9uP6Yy8mbsjPeX8Hrs+VyLdfggirBgOW4JgR2SRSbwfcdE2nXxEHPwJ+lqA9VO4
         EMk2oZ/PZzpjjkAihard/uBh9rVdrJy9pwjud4CTylfLStVB1B9LQdAwjwbMAA3C0/1Z
         3OjPuUEop9gxhgoBFVOkVoDmCzvNHnh7hvz90q5MkB89GDUn6fiYp6J/ckpDvrkev2SC
         6/5YnMfF/ULx/T0LtloYEWHO5wJGab77iekXKC2Sbnu/YsTOtS9yH51iaaHdilXEksy0
         Vkog==
X-Forwarded-Encrypted: i=1; AKwUvByjA+OBSfZtdKY+chsXYv0dhMxLMA/ISVtEBTeTAdUMxNb31TPSt7fRRHI74r47txkD7Up2spdqueVjn+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHmY2W7WM9J9wNLig1kpRMZjAH+BDsTP/y+UMjsz/mmMc9dQIu
	zZpDiTl4NhUUNhBVGJrVWUT03XUMhNWyWCN0GWDrtCsPfCfUEgXxYGV4
X-Gm-Gg: AYBFou3/Un/Kcg9iamtNLVv41XlurmVS4lK2nXw/JVpd85aKqG/60ADT/iF9NVIHxQd
	osnmAvx84qq0RqHeAQ2qKng7DPROLdlQNmiIFrE/PqiJ6jtpzs2ZDrxcVKiHZwfucsRTyvwo4qb
	jGaLEeDIsZMHgFXt9HbYgY3ld40PPA1DZ/FcepI0QgtjuvWc4Bjqcque1FUiEdXa4hUpuCoyw+i
	K2EPsLKdTgYl3RzvyR1mtZp5UCN/tRDeiFoQ9qimEwOjTtILUk2x3OQXdn5bY4UlIihMvlFwHrW
	KMe3Cn/j+iAFYwIWLqUa2ubjFCWQ9oh4+83xsr4jfJ0Aw/l3XoMGgpSHmVWsow4R+iqJPoAMSSd
	bnQwwAH0fcb91WBa+gdFETXg7YXWhPOK7FxTQSxVGidK+M1i/Ifv49oAx5dpwnvtGTWXZalcUGj
	fy3vOFUTxbziwJJxwYRMPLKhoeZYziVnXCb2l2wVTlYjRo+eG8dZTjP9+a89I+Ia2wFeHnEFC4L
	Fim3qq5a/rUj1S/pO0TwyhZFweWXAGbdfMwo7/yYAXVu60cMzHBTbzxG19AheXkfKC0/JJqgvn9
	O5HemvesazLuOkkYbg5954M8E3G2wZs6EFhhIkRn0sRg/f04Pj46IZEGcQeXdQI80M1Z0fpfKUV
	fby6y+KlzfOKaH8UXFsqbytvvnDSV9tWrsQnUHAMAuI9D0FO7KBpxD7MSSmaGbCxT1w==
X-Received: by 2002:a17:90b:390a:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3ae57bf9742mr3793713a91.0.1793260886902;
        Thu, 29 Oct 2026 01:01:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7fe923sm3380289a91.8.2026.10.29.01.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:01:26 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: hisilicon: Remove redundant bit clearing
Date: Thu, 29 Oct 2026 15:01:08 +0700
Message-ID: <20261029080109.12240-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029080109.12240-1-phucduc.bui@gmail.com>
References: <20261029080109.12240-1-phucduc.bui@gmail.com>
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

The S2_DOUT_RIGHT_SEL and S2_DOUT_TEST_SEL bits are cleared before
being set again immediately afterward.

Remove the redundant bit-clearing operations.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/hisilicon/hi6210-i2s.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index 554356f060b0..1c9e235c3a81 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -147,10 +147,6 @@ static int hi6210_i2s_startup(struct snd_pcm_substream *substream,
 	val = hi6210_read_reg(i2s, HII2S_MISC_CFG);
 	/* mux 11/12 = APB not i2s */
 	val &= ~HII2S_MISC_CFG__ST_DL_TEST_SEL;
-	/* BT R ch  0 = mixer op of DACR ch */
-	val &= ~HII2S_MISC_CFG__S2_DOUT_RIGHT_SEL;
-	val &= ~HII2S_MISC_CFG__S2_DOUT_TEST_SEL;
-
 	val |= HII2S_MISC_CFG__S2_DOUT_RIGHT_SEL;
 	/* BT L ch = 1 = mux 7 = "mixer output of DACL */
 	val |= HII2S_MISC_CFG__S2_DOUT_TEST_SEL;
-- 
2.43.0

