Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC3B4562B7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434886; cv=none; b=UIY0WTqjKmwpqXmE1ca166vicSBD/wRIJGRUsE5Ao27nQQfJTeXnigMUSj/I1TIYW0ggYTV1seDrJIWNvoUAz8nH2tXAoODl6ZQYCmIDx0s2O8WoKlRNKUa1DNyGcesJ3kulzUWJBk/AKe1ljqIVpbrozH+6ZIxA2/RNTUckdHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434886; c=relaxed/simple;
	bh=XRpAi5i1Z+CWPXz7fQWZ1j7nFW5lekc1/Hcoyy+O2zQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SO1j3a277lSNpY+HObbxk33p3kaYpWNW+M+9wJmj6mBvAIsQ4ZAb/TjK3R9IWH6R/s5oxROKXd49UxtuLnX93Xxh+DYcLkJ/1SbQGi3lZu6HGpw37IZYaiIRmeYrMvX/RjjO1KuJ3A8JFSl8VpykgBw4RGGqitMZpL55j5P5VuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWSNl8gs; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWSNl8gs"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1712688a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788434881; x=1789039681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DSDRRDoLPHiKnDrwS7cordsPoUIfThuJ85SX43JJJA=;
        b=cWSNl8gs8k2b8ZV7Pso96CT5G2rf7Q7wmZx88UNm24wkcx8mid2V2n6j33qLcZEqjh
         FVsnoDhB3TGWmxPiGTaszJxlg7Dq2J8zhFnrvCbENxGi8KrcP5uUPsVKxdNUBNy7W2ZQ
         8cWP+iAQiCPq2mhIqtDEy2lImMyCILo4Xw7VE0/z7XetE17D+ogD5kYFM81hC3Nho1zO
         Np/vVQP4C51zufdwt7JF4luLGE/mWA8tbPoHssIJzpGFMPfbpF1lD2DCjHiXDgZyXTFu
         YEc0J3wa5+yQqdQG+/g/2Povebp6hgpad5nz2i1h1oWo0KCuvVYFtlMxoKZDMdbHcAYk
         c77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434881; x=1789039681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DSDRRDoLPHiKnDrwS7cordsPoUIfThuJ85SX43JJJA=;
        b=XlD+gQBBKvBW2EQzooYLKAAz5FBul57029ABIZRzfxCiBAt86r0nABw7hKd69vYUJK
         m1yNVjRBWsSxqRQnydeRDyNul0R0l9R8ZOSNNN/hHH9I0PUwfpKJn9NP8wByvxgtT7B1
         p9wbikFX3fiVTpO8hCO1nojygn+elb9mdvDQ6vtzuwjOWRIlMbJ2YQrn7QaopSi7mZZq
         dt2oPtRLVay8ogpSAFc2CFFEsgYQEQUWLTDKKprqPDmYPovhL31K7KeJ1iU3J7TmYyUJ
         HTBV6kArmVosdedXXneN4Cs2IRMkxtnuLCx+fzj0j8lU/bkeyjMlXhOdCIMRpdnk+lau
         6mqA==
X-Forwarded-Encrypted: i=1; AKwUvBw9BRW8ve9rYuc1Dzf3mY9qeJCZtvPVU7kPYtMyZ/F9i8EkzzOzwksfYdZHsnOv5eSrhDEy0rjEuvEVzFM=@vger.kernel.org
X-Gm-Message-State: AFuF++l8xMVvB+r6fbtr4n1+1N/zXse/q5ynceRXgx9VJfMVIEGFHuFj
	sCLnyB0cqv49AjOjLBFgPvskUPNk5/1ZyRdE9bJ+2zfMK9dSzY0zbiS4
X-Gm-Gg: AYBFou1x4kJinUBvxDAJkzWZKeF4Em+Dl05rbyMvfD1nXqCT3bnoK9EP0P1eCln7z6+
	k10pqBDfhut46JKtE7H5HY62Rm+3YTisUFhYBv51N5RL5eAbjYixpTkTWtidjbQtcLS7SmzwKux
	cxOcybGFRN2dgTu3AiS0LFpEN0JCVPh4Zx4tXrmXES5zpX1g/9xpmEKWrwi33FywueIhQMGTXmf
	0I4ROqjEjiKCPvypHOsVMf0M2JQAkYsXANjFlpCIMeQXzi2IBXxixXVIMEVp56sfj2c0966OHTf
	l7OwKLHeC2C5VYvtAMQjyugc1QwkqNPL6sxvdNXS6dWd1YR37KubteieEq9uktuRuGKVVChH2WZ
	eoQiLEf06RBWxL+LpaHcpH3Im2ksx6k4iqQqxq4jg+KAl131t2QXI9hnJSAB63NXgvO5mXH/41G
	r/kmg6t6VMsNPPZ1jhHxBMjIcslCJu4oElzgxRPhCJpbdPoOk9tid9EsXbEhwtHUrffikkIN/yZ
	bZvtQ6kfV7WK3xFOvCHb8lt5k5qCb9IMpd6uPJS8GFJ4azIksyR7+lMJR6DiLsIewQfFGZGoLde
	1oFd
X-Received: by 2002:a05:6a21:9e0f:b0:3d0:9590:7148 with SMTP id adf61e73a8af0-3d9adcc7c15mr18547929637.17.1788434881320;
        Thu, 03 Sep 2026 04:28:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d467134sm856084a12.30.2026.09.03.04.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:28:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: rockchip: rockchip_i2s: Handle runtime PM resume failures in set_fmt
Date: Thu,  3 Sep 2026 18:27:39 +0700
Message-ID: <20260903112739.373621-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903112739.373621-1-phucduc.bui@gmail.com>
References: <20260903112739.373621-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

rockchip_i2s_set_fmt() calls pm_runtime_get_sync() before accessing
hardware registers, but ignores its return value.
If the runtime resume fails, the function continues to perform register
accesses while the device state is undefined.
Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() and
return early on failure to avoid unpowered register accesses.

Fixes: 53ca9b9777b9 ("ASoC: rockchip: i2s: Fix regmap_ops hang")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 261f36d4c2fd..e7ea71783e37 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -244,7 +244,9 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 	unsigned int mask = 0, val = 0;
 	int ret = 0;
 
-	pm_runtime_get_sync(cpu_dai->dev);
+	ret = pm_runtime_resume_and_get(cpu_dai->dev);
+	if (ret)
+		return ret;
 	mask = I2S_CKR_MSS_MASK;
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_BP_FP:
-- 
2.43.0

