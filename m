Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284584;
	b=TfXc6TeHtN2djgJ5Hw/dompzN+eRiedhqPYivYQ7uspkBe/PPgrhVXol4Cy/aih5Lzcx
	 XbJKL/7+47Muz6GNmsUviondebx/HdztLUz3nrGWBnb/1fozL1AIum6zzWS93rT4eRp7x
	 ovIWxiW5HTWr0UToRN/AIpwKeN3/gjAn8wq0Og9PH99mR3D97/VFgAt4Me+PxktSwcfLv
	 Qael5H/nRERnSGL9XInHZ5z3mLXiRww4fF27Tg5lcJQwgB/SKryhI5yIETjH9tGQA6w7C
	 9xnsldz4lHFRpYTUYsTDBV3jEyCu7HOPX+n5sLmIi0WCD7Xlw0L/bxZCB43yYr7qrig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AobNRzoJo9ZhKbhwLMRuTuaSxhba9zwPGclaewwNK7o=;
	b=GCPp5qa01T22TkQI1FhZD0gPs1yXftiyiY07oJIDXjIpnvlPDY+ebATUuCMSx0ju+LkL
	 Pb7FrJOcyyAV58NfLfEsxiS73GNBiOLLiY0aLzrwJyzUQFr/zn7B5zG90rplRAACmoFDx
	 WJ2SsMP4BaTtpNJoxKbisSV66JDAsDCKKgtyNC1SPmwXrnO6XpAGoUn1YS7zLb4vMSEDv
	 oeGt46UWIY5XaGmuj3lJatCg6On9s3UTbG8WLhsrCGhe6sJEiVLfKmnl3i1sDHUVOSWpC
	 As9FXGIUcZK2OV5qDNuS+BsrMf0qDSFB9Gtt15CuA+T+MV1fBfF4UGKJX/pln2FJmbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GJCfjyuA;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8070606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8070606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GJCfjyuA
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso24180545e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793284581; x=1793889381; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AobNRzoJo9ZhKbhwLMRuTuaSxhba9zwPGclaewwNK7o=;
        b=GJCfjyuA58h2dAVGnto1aSgexQNg9qENa5Z7ZZYnZIvS2PJBSWKxkxcFYcbCd332l9
         v/nPCEJKYAuLKfEent4po3W8AgtrBJjcKmj7s87g54VRT7Q9cim7dcVlHu8uKlItn+MC
         Ag8Pyzp/GIte9drLIBouJwcpD77Db/qK4o0dc2MtAzzu4/jgEmZtuFf3dgVp+9h2BeWu
         xf/WXFcb30CZkA7UsGm0dCGtQ82nRrntwqWWgcijRnsS8EUrZ7Dy9qln3xoEodmEsdWk
         Ppy7tDcH6A4rs8VoZlRTznNaqf1GHw8u1s8fUA5nC8enz2YTZyYYBQKzKLLmKCyyTt1p
         70cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284581; x=1793889381;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AobNRzoJo9ZhKbhwLMRuTuaSxhba9zwPGclaewwNK7o=;
        b=riceoW/Tg3bEVS6eRomNnqDtKdZEIFKnyDvDRn4WDJBZHi4Mmk+4BOQ2s1c+Ay/LDX
         urBSh+NdBF7gKu3A+0E3RAdVJy5kgODZ6SSCsTzQbV4y8U1OmVh449vCPER8w6u9oWpU
         C9ao7u6gOa0chfJeI98HuBTQRpYPD5ZOel3Lxt3EcA9ujrW5PZcWHeFg8UmqDvPPMlVy
         cCZS2QLoPxkHqH7HNb456dEkAA8GILMRg72Q6modkcTwunatMsX26dY9ZEWF5bGAJag6
         u39nO+wTNr+N4CsBNmmdRSHBvM3P/xWVh6+PQHeAWm/ZgVx8ljVZQBux2Vy8MJDrz0bP
         bZPA==
X-Forwarded-Encrypted: i=1; AKwUvBwwH4X5iV6m7dTuddqK9FQWKC1D7L7nvvDKoiF/8ZsSWvmvidAmkemm9dkfSsebxQJoTMZE+Sej3bTCjvQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGnN+aYfnHb6PRVZQCzAwxHi7rhWVs1R6ZbRgIEWUcl6z/uX2X
	jYFL7b4Pdl2l6BxJtvDZzVz2AX2Zs+d+L0U2Rmj4SAU0q6Gx/nd3Fzx7F+cCx3g3lrw=
X-Gm-Gg: AYBFou2fQaYgrzP9cOAVr7aW+g0IV6G0wIqO1WXBWv2z/fUjUgkJIJzQ1MUFFQe8HmU
	deLAY4UDc+8NbCijvmsU1Gi2iqigY/wys9MAdoVrztJ20WsCl5JEPT1Js7gIPLPIPz8IN2LkTIA
	XpfhPu28R2kDmnP5r1Ln8a7M9NrUG7QnSVYRvMPEXy7GUzoCHma8Y/OCkJ7F+eLEtAkSSO4HhxW
	yeIAMC+HL/QHCHW4v5mJSzpVRadDaGJRGxYc1E+RdNQA9BROybAsZUdusuyfCDtsTheWEClvgsZ
	zJYCykfzRNymdSA5jqhZdguAu82OybP7jHoJs7MC9LQlbPb+NsrtYcvutRohOfzpzfqCKLDfJ09
	MNTPirSWFEqxODdotog9TRAGcw8Is28Zeu3Vdo4q0aTg7CEhKWD3bON8V1M1BSQOd5ZFnd/Mysj
	gE6C41FaZ4H0Ykgb72wfb7DydcNajys2Df4Snz+sFEYOB1GJ8x3nD6XcE5o2AsPAvowSnKeLSKV
	IwvuNMLpDbteRkphBbwS+JSvT/CZBamlz1ouvg6Qs7ylQmw4g6gROgvBv9Z3IrN4HHdNhlUizhT
	X2yq6vBcuUsOP7fzRu6uZSdNM2Qu6vDzFVper6gkk1y+LDDp
X-Received: by 2002:a05:600c:6085:b0:4a1:e01e:1927 with SMTP id 5b1f17b1804b1-4a996a9e304mr115101135e9.5.1793284581222;
        Thu, 29 Oct 2026 07:36:21 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a96a32eef4sm80612955e9.3.2026.10.29.07.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:36:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/3] Fix the ENCP clock select field on GXBB, G12A and
 S4
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
References: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
Date: Thu, 29 Oct 2026 15:36:17 +0100
Message-Id: <179328457778.1865333.17367903644168961694.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=328; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=I6EvPRMH0NyoJrkviiRd+YwWhq7FQ66k6ghPBYl+JiM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmPIx8LPbxyy0ci6kzfIiapRZva5gtGLNK0DJVjmvol9
 kQC74+rHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZiIghojw5bD68TulT3j+8wp
 V/biuueWSxOFT7/cVbHvs/upiYzn51cwMjyJdD/z4eTLD9z51W7b7z/cIHlEU6d+n8HFS+1bvD4
 wSfEBAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The GXBB, G12A and S4 clock drivers describe the ENCP clock select with
> the field of the ENCT one, VID_CLK_DIV[23:20], instead of [27:24]. Fix
> it in the three drivers.

The commit description of patch 3 apparently does not really make sense
in the context of the S4

A part from this, it looks good

-- 
Jerome

