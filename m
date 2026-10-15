Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2474C3EC804
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083304; cv=none; b=QqQnBn1lYXkYC2AA8EJMzX9QxSfqCtiQLHGMpMCmbmfUJ1DJrsrdv1fTxkn98UPIT7gDD3NyDqJt64UvZ6/P5cpK7suA3UvQn6HGMz1bIpeLVs3QABiJcGyhu/cuYiXjmvUwB3kEa2telEhm52bmbzeJ2cneHB/k3ymHGgLq108=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083304; c=relaxed/simple;
	bh=dz4JFwB4ePeaGz3RlHhyJ9b6Yy23+uXcydlEUFJ6fY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LtEc96YIC8RsGmsbds7ZLrpoXH7weLEkqKBnHrFDR48Z90Igmevbt03ubPKDJ+VDd3FvZ5VK35y2ZdtSnFKJV+l4orTLQuGPeDAOehxv4d5w+eYiZ6fza46oVT/a9jzk3UyZoisBGRC+VrSH/WB97ixTMihRfnfz7o1aDaZ/zC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RY4L/Z10; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RY4L/Z10"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so44788375e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792083286; x=1792688086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqLVm7SLi9zEE0K3BLZXJn3MFA1ghZKJ0G7TZDkfEHQ=;
        b=RY4L/Z10gtzvXkj5iCNOteXx+oNFO7bBsDk4+5lBQoMdHPQoh1XCRhik7j4YIoQ9B7
         9oc5D7K3vOvPJGlltGGLCOv1rTjIEzLqGZlulsAde/PoEf0LJNlOAbbiIzerik93H05s
         IYK8imrF1kmNhrCCRK8H8ZEYmMk7jfJwL58Hizb7tSXW4kN8NAc+mcFXAan65GAw63Gz
         1VWiiHrZ/r4WLC8+MWzbjfU9olX4uHJyUNZThTrfWFQmyguXVL/YOTCF60Ahxss75y91
         8IrUpi6enTsbs0Q8fODda4lRBRItx0jDEb2SEtw2pilp7sQAUov/1gI7c8Sc/0gEOLK5
         D08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083286; x=1792688086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqLVm7SLi9zEE0K3BLZXJn3MFA1ghZKJ0G7TZDkfEHQ=;
        b=l71RQYEnYs4RX6AhEvRncR7iZ/Kk1IXo630LdGtX3iNRmcvm8s4OzdNi4gkxbdNsgx
         zptyy8VggOCm3QEcKtN3yjjuarsQShzSgBrm807uaQI7xYONcRtiU8GRNRd8HS28nHzY
         9vNbNygoAaGq5sPEKCwfyIdEsq0vJbqyAKPevCPrnnamGT6hevZHiJ/T9tnF9QxtDdc6
         OMVsdg1eIVg+OHJ8L/9i6n0XViuv5QppE/9iasJzrhq9+VV1nNKgzgX4juWjqlTy4ZGY
         uWOFa9SxjBiGdPKSEkmKEwdwJjqlL8UVRgo8NiMV2Njeoxf0U0BHXQiiiOlhF5q3+H/D
         qAoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjaBfcG3kwTWz0D6K2KYJPNzdXr57sft6EwTbDVW9tuClzvCPmTbh3OeS38r9Ucv5jKNAkaLSCwsk45U8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+/+MgubZ01s2KZuuWB44PADESremQ9w8qgRiQ7kyltXGuHlj1
	ckF9n5Fv6/Gg+UqwpjsPc9XNwmQk4TFpFGmS/wN7oSZSspY9UUsAdE++TN05zxyw4gE=
X-Gm-Gg: AYBFou1Vwb5303j4Os1JP/1iKkpzsatwzgS1B2ez/UfeVeSY0rCc4+PoOalxYjfn3r+
	nRKBNLizF2E2As8+z6p0DADSYj2wCPT2Fwzeyi7Flt8ICwQa7UmXSf/DmBANAmhagBczEZv9YWG
	Fx3J7kph7O2CkvPqU4nbkER8ijPAEDneyKWgqh2M/pIWSi2dwSQwwTmInV2ejHfXoYCbbynM1ay
	7rWKJ6u1ySkvZw6ymGhnc5CuOHVgtwLsz6tlbMhIvJW86xPA/Yka3QO3Sf+PN+gf2pxcFcrHt6i
	AvDzlM03z8PcEKGr1wjHYiV24sfGSwnYH3Sxnyg3rAHzFNEpn8Lw2quu/PYDYov7aOlctgTNaHW
	uehxorhIWx5kRlDmF1QLHIsWITowlNbDO6lh76YlHeIbr4dxUQIorK4eo6DIXYICGZNcX8Ebed4
	B2fN/AGaAB0Wwu7tDfIo71CxPQvj4r/YXgbKqFcVk6j7kmZsvZv3ZY1S8nragWXS6BbFjkonFDr
	4qZjfCtXq8enZ1n51nF2U+Fxc4hFaYsw592xgQ27bFoXZKtupPLAYGasP6WRug2oDxJgg==
X-Received: by 2002:a05:600c:a013:b0:4a1:c6fe:5c0e with SMTP id 5b1f17b1804b1-4a1c6fe6071mr6634665e9.33.1792083286162;
        Thu, 15 Oct 2026 09:54:46 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa5dbsm20775664f8f.12.2026.10.15.09.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:54:45 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Thu, 15 Oct 2026 18:54:31 +0200
Subject: [PATCH 2/4] clk: ti: fapll: Fix clock speed calculation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-patch-ektor5-dm8168-clk-v1-2-8b99c5cd5541@linaro.org>
References: <20261015-patch-ektor5-dm8168-clk-v1-0-8b99c5cd5541@linaro.org>
In-Reply-To: <20261015-patch-ektor5-dm8168-clk-v1-0-8b99c5cd5541@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792083282; l=1034;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=fBTD64HW6udC2yGl6I8fIRV564MzcGzaqjs261VGICI=;
 b=l/dbkURMpePhSEWvypYoRZlI9vzGFMFaCM9Q6CaCjA3UFI0DhdX13It/6H6eJCJkN+nzCGSf8
 FeOm2+7dNnCBmuBuRH4svkON+awYpeVhjA/7zgOJR2knKKfpPEU776N
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The fractional part of the divider was being treated as 1/10000000 wheras
it is in fact 1/16777215. This led to incorrect clock speeds being
reported when a fractional divider was in use. Correct it.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/fapll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index ae2f6fed10f6..008a61f45ac1 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -336,8 +336,8 @@ static unsigned long ti_fapll_synth_recalc_rate(struct clk_hw *hw,
 		v = readl_relaxed(synth->freq);
 		synth_int_div = (v >> 24) & 0xf;
 		synth_frac_div = v & 0xffffff;
-		synth_div_freq = (synth_int_div * 10000000) + synth_frac_div;
-		rate *= 10000000;
+		synth_div_freq = (synth_int_div * 16777215) + synth_frac_div;
+		rate *= 16777215;
 		do_div(rate, synth_div_freq);
 		rate *= SYNTH_PHASE_K;
 	}

-- 
2.56.0

