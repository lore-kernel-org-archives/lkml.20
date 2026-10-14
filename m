Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5420544F54B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959601; cv=none; b=lv6jrm3T77OvJrVakA/XHxdKfzy39XcXM3HzhWBqbz2VVRiVYjeSUZzGg1MTTWRYNicHBJknPoCVR66BcYBJVF6xWGLIeqLWLE2Uks6uLWALlczlKH8oldTrkShbDVWlTCzclZwVBDJDmw3BmLzpsNOi+HZ8wae6Is84WHO2NeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959601; c=relaxed/simple;
	bh=s3+QGgTV4plzI/xr8IROgJwAbZe1P/l4ItW/7cwy/wU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7i/hg1HnOqsCcy+5buQLNATPyk24eG9d1d2dC6iHoUWe0E4g/6T8HNBZ9tz/gp7QgNa4uRcybL+A0TKftpTQKAytL7G4Utx9Im226H4PZuWW8pI1y69xAZ9iazJqYtjp55uFlX80oMGkfIVXrZIDcD1tnvQf7nyvgeyvBL1h0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRLNHaoB; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRLNHaoB"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so2713811a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959594; x=1792564394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0dNwa3ufJkZOa7uAR5+Q4Sf0EjzJIjuDXt2hIDnuBc=;
        b=HRLNHaoBamsEwdq5WipuGzXDYkQmR4IDCt6BEfLxQ0RjIeKi53wLd/20yZfOJlpOzp
         mwXk+s0IB4DYkRTdwHKZ3fFCi+1DdjgyEGH8fOvb0+9q4QRjWJJyxbLelICRDY4pL30H
         U3j2rv8+Rt/ZBt5JZJuhn31dzfe/S4MP5MN7PaS1/69OtX/aDNJpolJEwKGQyU4jNIqW
         K8RFudNJ55uDmOAIi+8G2xa88A1Mf/IWmLUe9GhtuYkR/8umiKk3l3cLZHeQsyFOsl2J
         Eqs5IVoH06NqcWUeLpWdq+aPvvfS5loctUz1xDrV0xdHwaZNkNCyZ76XGz3qVzvDdsLZ
         8qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959594; x=1792564394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x0dNwa3ufJkZOa7uAR5+Q4Sf0EjzJIjuDXt2hIDnuBc=;
        b=znptiPhM8VhAEa7Xh6DH5XsanOZAwVNl/iWIbY7/sWFfa/6TkffuzQMg2E6g7YNGpY
         I9HgPCLQh7C1S5WyRi/2ClrzHmntzpukzDBGX32Ms1CJLvL7tcqh/2u5TTY53FLkLRRc
         lTcud5gLMiVpnLtCS7XNPfnNwfFsapRplGAN+WOJ62b5O0/8mu1RaWUSZimidd/evJqE
         3MF4K3rdgtMRI+7euV4qEg2Dz8ER1RWJmKIDOOhUnfBuFsXqlrG9F8LImwtWp43tjvfB
         jgGguVOYFjuys915O4Ns0+TXmF5KTbU3i+QkAiy6bmxm2pZm7uUmJ+4W9bI5zRkYpf6D
         sn2A==
X-Forwarded-Encrypted: i=1; AKwUvBzj74TlhG01Rff6EozBwbCWA9ISZj38KD6mRBW+Y8faH24RU/i5cJdvTLnFxJBtYYZKhEPqCF6p6xPuaCY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKP6IPRnRxZ27oeo9PwNsOX5dl42eX7Ixv6iIfsBeLMMPUYwGkl
	2Rev1iXLdKH7JtTl8VzjJHlohstwvMZEI25RQlCJ3NN+K2zqpL9mBYPnsBlaoOgJfD4=
X-Gm-Gg: AYBFou3+DzjZ+Ugkrq/5jO1EMUQ42T+iWzq8ZEbjtzemNRzhEeymcRgZzWpvYEtytmi
	xhQ0EvtPElUdfztR465hPFy9/hy4EbA/D/AUUB8JlqwIDZYR0W4IHjZx7oyBVEqh8p0X0K6b2Z3
	Molt36QS06Tig78t3dflpur+0Fd++Eb7+1HavZF/q5Ys2F3XxdB42i1JcGXYkouIyQKGnZczoq9
	O154K5fvNCADJiboJAynZbarpIgN7Z4OFq1cidynuWGAxTzLGrzG4FRvJY/nouyCyF3BCp/UeWh
	smSudMKSZ3cBDZPJvsEgmyUdv4Aajtpx4oaS/un5GVk56MDoGIrZSownx9Wbw0W/Rwlsed4TVPM
	WhTUZp+huw5bffZgosS1/r5v7fe04Zp58xs0UFsKEsksLenMwnrwG7Jj+Y7AT6ogUbtrZWbU9Uy
	xiITDoM34VgGuGBagS+A/WON38THNvqs8wMcVsvd0nTs2P7uLJAJ6LmLoY2+ToCmXdz2K4DFxFG
	tNtRHHw9ixM+LcsIQTCIRNqw3I4MzHitGqx+JCqPmIjpRrwiA+O/0rwknhgMnRWKeI28YYAsAw=
X-Received: by 2002:a17:90b:5343:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3ab3a9d3dfdmr11573517a91.67.1791959594121;
        Tue, 13 Oct 2026 23:33:14 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:33:13 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/13] ASoC: codecs: wm5100: Fix definition of EQ3 Band 1 Volume control
Date: Wed, 14 Oct 2026 15:32:38 +0900
Message-ID: <d7f690e391feda7a6d8f38d0b238b165bc1f4fe2.1791959026.git.sammiee5311@gmail.com>
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

The EQ3 band 1 gain is in WM5100_EQ3_1, not in WM5100_EQ1_1, which
holds the EQ1 band 1 gain.

Fixes: 6d4baf084f4d ("ASoC: Add WM5100 driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm5100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index 2fe937a93026..d0f5c4e89556 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -658,7 +658,7 @@ SOC_SINGLE_TLV("EQ2 Band 4 Volume", WM5100_EQ2_2, WM5100_EQ2_B4_GAIN_SHIFT,
 SOC_SINGLE_TLV("EQ2 Band 5 Volume", WM5100_EQ2_2, WM5100_EQ2_B5_GAIN_SHIFT,
 	       24, 0, eq_tlv),
 
-SOC_SINGLE_TLV("EQ3 Band 1 Volume", WM5100_EQ1_1, WM5100_EQ3_B1_GAIN_SHIFT,
+SOC_SINGLE_TLV("EQ3 Band 1 Volume", WM5100_EQ3_1, WM5100_EQ3_B1_GAIN_SHIFT,
 	       24, 0, eq_tlv),
 SOC_SINGLE_TLV("EQ3 Band 2 Volume", WM5100_EQ3_1, WM5100_EQ3_B2_GAIN_SHIFT,
 	       24, 0, eq_tlv),
-- 
2.43.0

