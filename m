Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B1B4582E0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434881; cv=none; b=e7dJVhWeuZDel8P/o+PP02qynssdYGYAGWFVu+se0yAaLHJCmOJTt1K8il9SlUgeXZLOVh+5Vy6+3JNwQNmOP39ty0hue0cq7ytGwHHveFBBSC3XoIgJ93/prheDiaKb2WU2BoAO9tpD3adpa/FHrvNu7XVKipVaOb6EpU+WCGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434881; c=relaxed/simple;
	bh=6ZiigvaTWfMfxyXpdAmeZRNmql3dKQaEnwrRx6I6TCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XhE+X+q8RZxMp/VZlcosftYW+/v7g8+mtZxZMlMlUY/CUQINkGNEqDHUyT4WsItSzmxSUmqSJsf/CkefSliX0z/eLOXGifZDePWETNl59xkfvKu9rPoBnE/yOwxR9aK9q5TMMXqeR0hamwfvLYpegP6IQ9ZDI9V5Z0obzQ3TKuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buu1OXg5; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buu1OXg5"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8487214ad2bso3289063b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788434876; x=1789039676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LelVyfkIJElVaV96Bx2ole6PtnzRp3ZrnXJtU0M/fEY=;
        b=buu1OXg5sqBorZ6VY/VWFV+0Qs2OlKZEAgVY/ZXdbSmk3y2d3oi47rko9C+Pk3rK20
         uPHk8/ANEsBXFQiLCfUdlYpxC0W0Z6TBkB4tzbClJqzB2NwAj+/tuOX6utb7fNCAMrVh
         dz77fo78uT4gwlk5dhtWQAW/eeY97rjULYTFX3nwFaBDYAYJcTEeQ3SOL00BbY/2UQRF
         e8JPYrxAl3xqDMAHGluF6JnxYsp3EF4rGeRBklAJW5J3cYOwmXMUQ6NzW/G4XRQv4unG
         gRIynOtfkRMaFF8b9hLriB7gwK5SMWWAabq4++RLPJ+hnDvYOxeyCeon3CHbacyA4+s3
         F8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434876; x=1789039676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LelVyfkIJElVaV96Bx2ole6PtnzRp3ZrnXJtU0M/fEY=;
        b=hYVigxE9YD1zKE6cnGjWDiBKVehV+MeLT88lZs5Xonnjc+M3FZDETo21W+WH5mXrrl
         1Q8VsruBksG2t4oLI04RdwVytBr+f72UQGd9hJ8t3qHk9Bor7h2WBu9wBKgtLbdP+sxK
         Ei2pkK0esL+M4QrOZkYnlua/TX/qocQZsSZwsL2KbvxUr8DCXN1gxRlMEgzil/wAXkXl
         kjAT38QqWgjkjipYS5yacT2Yl5k3cF5I+7hrXfWL2L1gfVNy1CVaxZ8ZMv8ayJi1EIu3
         eKS67ioKV4LaafW+a7iFh2+1wIQWjA7ZNQ1JuW6WztPQtJTRohIOPypAIlIRZGnp2Jom
         YSIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkLoTY7/q6FHYsWkmqp8s6AFdvDUEz9gMs5oLLHu1XEQxQFE4vN6LFz0RQzqIW8PtGW78yoZQ/K739f64=@vger.kernel.org
X-Gm-Message-State: AFuF++n/oDgFiPmzQo8uHS8r/cS66xlMfrmZ8KktXsBWAukSEJwxVKdC
	vmoTZ9Cajoip3AGs+qySKjoJN6+ViggVQicwOyxpJal2GS7zSQxwqioU
X-Gm-Gg: AYBFou1q7rrIYGeW9rL84pAFc2MvDfeyKlKVsieiDkUNboSwAV9GUWpUO/CeXm2TDbI
	/UK7h+b7NKRzaKeGu2vAvzaYdBvjivn7o7g8DAr9XmoSYN4Ocm/gz8ANieVd0ymR7sIec5JhbPQ
	NJzu/r48lKL7/5yXfJQ77j878FL1k3PsrIJ2n6MUQThS2wolNcFFinFVgvLEb42mScx/vMKY0p1
	pGyhS5hw+uaPF7f7nxERLIBfYZ1XWsUv1L1ifTCn7n9RjQlATaKSbDD7Jw4Lv/KYY7lfa2LXlL+
	5ETkfctsD+J9BAIXykmAR0VVdlTdqzPrYqX2uwkpWDDOuCj8xPwKulZ7MXLMDD2Zw3LiBO8ib0y
	zYUM0Oto33TTDDV0Qm6WARuvkjjSyxKlujADwCoNiSOidwI54SD0+Vl5RFwgbRjKa29/DPElTYN
	LtmWw6H1BNw9VSRaec3zbXMlZRLYkli9ClWu+4H6JdSLI6NX64XXug1tbXuB7HBNOPoR/CIktN+
	IqawPs4dbl2Jtr2N7HfZDaLQuZeQnOrwEbmaR/UYkMggrBJfuvLLiSMkVmh/MZQWcnyHH5QWK2c
	UdmhgjD0h7PrcnM=
X-Received: by 2002:a05:6a21:339f:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3d9afa068f5mr18626130637.4.1788434875933;
        Thu, 03 Sep 2026 04:27:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d467134sm856084a12.30.2026.09.03.04.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:27:55 -0700 (PDT)
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
Subject: [PATCH 1/2] ASoC: rockchip: rockchip_sai: Handle runtime PM resume failures in set_fmt
Date: Thu,  3 Sep 2026 18:27:38 +0700
Message-ID: <20260903112739.373621-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

rockchip_sai_set_fmt() calls pm_runtime_get_sync() before accessing
hardware registers, but ignores its return value.
If the runtime resume fails, the function continues to perform register
accesses while the device state is undefined.
Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() and
return early on failure to avoid unpowered register accesses.

Fixes: cc78d1eaabad ("ASoC: rockchip: add Serial Audio Interface (SAI) driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_sai.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 30b5e71d0937..264a99e618a5 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -487,7 +487,9 @@ static int rockchip_sai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned long flags;
 	int ret = 0;
 
-	pm_runtime_get_sync(dai->dev);
+	ret = pm_runtime_resume_and_get(dai->dev);
+	if (ret)
+		return ret;
 
 	mask = SAI_CKR_MSS_MASK;
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-- 
2.43.0

