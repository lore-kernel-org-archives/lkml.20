Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A464AA3E4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789689592; cv=none; b=dtOKhJL1JZm2HN7yx4pCHzoH9BhBRIHCyALpjzuh2i1/I+otHm6HHk1Xl9PUvF7RVQ63X7kgsxAhUbdqqwSxAt7FwrI3AWdKKb5Pio3nCHNaxVX15cUZsX9PmTIHiaU0xGmZQhIKD0mgNKu2ps1nW/sggv7cV2IhE174aSGM7W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789689592; c=relaxed/simple;
	bh=X5fBI29rdRgQVD/lVN6Y+RY6XP/n3DxCK2eTWygRAJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iRnH7eDmIwvwup3QvbBr7Bw3kYyssX6ddDrLH0AHssO/UUvVkc1XcpeLkDvwEQtTmqqeOuFo/8boEXObLumVDQCrWEAEkr+fspBm9uYPppXCQRmvwJuX0tOgiY8l7rRD89scvF/t7jg6CAYF2ibLpQj+TU1sZ4fnmMPHlRc1Xg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnfiiOZF; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnfiiOZF"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae7089c0so88837eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789689585; x=1790294385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qXNjnaKjCC9zA9Voyk96teJyXfaJqLPqZodkmIpeNdc=;
        b=bnfiiOZF9vVf60nLw/WuDtszEvQJREgpavcWGqg8LOBIW98u+ziHqNVyvWimISovqh
         FEfY5wevRgbIIfZgluZjW0TGKlHcaLPb8QrBG7F/Ykba7/tboZAS4RTK1YWecZsrE7cm
         lqseVNuonJMhkRcpp7x42MwgAQUp1APM1YfhpvIAD2h/0NCSJ4JzH0gKV49WdwQwG6r0
         2Kd5K1+KuO8Yij1inpsK8/W24QzGWJqe6fBoPP1/1xjCmTC6WLnLaNWwnqdncnt/vEx8
         JqiJjaPEq09QgwT5vgINdFaechkY5Uil5DMew1/hlFE+Ma/kCobE35ZEZz3ADpn9XIZ0
         YL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789689585; x=1790294385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qXNjnaKjCC9zA9Voyk96teJyXfaJqLPqZodkmIpeNdc=;
        b=VU2dMh1e8bsUvLXyKdyrKoLXzhBW3nMx/T/k/oEiwk62KkRNJSxy9bSAfymmWxiBeD
         iMIiW3LNagFaiYk5592uHEreuqUr4jXlFvcn+EI4VmIsVE/2nQN8f5MusYTaoDNV3VSl
         okfsfCKBixcLWVygFf92p6bZdJWEgbVKKmQpQquxq6t8odsILG9S6/jT5MYmzuMWeBmO
         xzv4OT72vRVOnj1UBnQHSslu1ZB4nP3SFWFpwzm1FLaMeq0vjT7nAMAFtD+e/TE9tZKf
         1TmjTWwxeZfSz6kJaSuYy7G+z/r/5kb9ls6NYkquF3Ac5316luxsnTtnGJDU4hxK7M5D
         70aA==
X-Forwarded-Encrypted: i=1; AKwUvBxQtnXztsm/rHnFJmgznglyoN/geioW5S7rsmlzakEz20s0yHrtwFbjFdYPWB/inhppIBBNo+gZMa+5MDI=@vger.kernel.org
X-Gm-Message-State: AFuF++njn5vS8+hg+Lf6bePpNtUPPozqjOzUCX81LCGItiVI8y9Ntcoi
	SLc2JLU1kjv85Vo7aPneXanPari4IsqRfaQaFrl2LCBJffDzzy3OaTUi
X-Gm-Gg: AYBFou1GoSd8rgEe5Yp53LM0gGKQJn+Uwy/TUjlkYakDflL2j1aBMzEwTr64UYB30V8
	r879VDY8UvSnYkj9L8e9399XBz3d694glKzqxpEPCOUbeiMcob2h6rzsv5B3RMRcyT9c6/hSIVg
	s5tnib+dTQ8/drX9libl3eL17lXPEDgFsvi4EGQiBBZkyFaLyH/2nvDKZqEj6yrTjvUgwaUuzPp
	S/noAuiOhr5HvDUeTLDJ4lYNvJtoMTcZXzA2bDFNDRu/mkXmUdVQDLFZNGXxNlFo5JIjRQoGRPw
	Deh8xCsyo75eQqheb1gC02fvTnDbXhWUQCDVbpt04/wGRc3kvcojYK15Bu0B195uDBOUJaumXyl
	61yAb2T+a3+L3ptQavU7lpZpdIGLrk0eGdPscTMODtS4tlzr9Fptj3N6jVcvhNe4R1LQJ+BjwlF
	B9lQVnKeB5FMZ1w6KKorIJt/4719a2KqJt2ZtfbBkWShJ6r/xYFVuXRW+iiDBbSwuaWe3Vp/41D
	eqKx5SFiR1Bv6By/vjIEQhXTXU0GHIet3BYXiFJWxPP9Q==
X-Received: by 2002:a05:6820:4d06:b0:6be:7782:5a40 with SMTP id 006d021491bc7-6ca9ac3f6f7mr779525eaf.28.1789689584793;
        Thu, 17 Sep 2026 16:59:44 -0700 (PDT)
Received: from cachyos-x8664 (fixed-186-96-141-48.totalplay.net. [186.96.141.48])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4870b228179sm237307fac.9.2026.09.17.16.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:59:41 -0700 (PDT)
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
Subject: [PATCH] memory: stm32_omm: fix child clock leak on set_amcr() error path
Date: Thu, 17 Sep 2026 17:59:25 -0600
Message-ID: <20260917235925.44185-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the mux is enabled, stm32_omm_configure() enables the two OSPI
child clocks via stm32_omm_toggle_child_clock(dev, true); they are meant
to stay enabled for the device's lifetime and are disabled again in
stm32_omm_remove() and on the devm_of_platform_populate() error path.

However, if the subsequent stm32_omm_set_amcr() call fails, the function
jumps to the "error:" label which only calls pm_runtime_put_sync_suspend()
before returning, leaving the two child clocks enabled. As this happens
during probe, the error is propagated and .remove() is never called, so
the clock enable references are leaked. devm_clk_bulk_get() only releases
the clock handles on unwind, it does not undo clk_prepare_enable().

Disable the child clocks on the set_amcr() error path, mirroring the
cleanup already done on the devm_of_platform_populate() failure path.

Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
Cc: stable@vger.kernel.org
Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
 drivers/memory/stm32_omm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 84eb23c824f5..3599683ab04a 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -274,6 +274,8 @@ static int stm32_omm_configure(struct device *dev)
 	writel_relaxed(omm->cr, omm->io_base + OMM_CR);
 
 	ret = stm32_omm_set_amcr(dev, true);
+	if (ret && (mux & CR_MUXEN))
+		stm32_omm_toggle_child_clock(dev, false);
 
 error:
 	pm_runtime_put_sync_suspend(dev);
-- 
2.55.0

