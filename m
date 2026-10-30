Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370491;
	b=zKWIHmUEevSloPmQhpqgrxBx0wHWaZnzS1xiasiHv66MHqWzatlSREWjWMFXa2gXF+S0
	 IWglIr51sL0feHOSQnbyl10R3DxVvRGJNbe00uUevBetj3CYmvYBy/JRhp2XfMI1ROu8k
	 KXRIxTz3dDwJbr/YleQgbF3awQdZXsjmZM8rFnsQ0j0L4nTFBqhVJvChpPY+NCJkPTJnb
	 CjpnGwN4AHFVSAcTITM/fpOiGO5CQDjVsjGzebZLLmcB4mS4+GeO43nrcH1d4jnvyRFtM
	 THm71YcfGopretiPQpwI4gJ25wQ3DLjZfK/MEPpCrrJJwITl+uazRp+U75jbCal3ThQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=jb0UUIPqHeTvqxXRmuce2uufcIVFotyqcoN9aAY32/w=;
	b=XSTEQXF8RcapAPYh9KIXCSI9ETLucBuX3/ihvftDt/rF9t8mIqHbCaiPFHhFB0so5k/T
	 Lk2Po0LSDEdSD9+sRskko4jOpeu5+58MNf4bbPIe2/p9p9wLpj8/gj4Hb3Of1wpl2goEA
	 RS16D/o3kpuqshYa7JCD4nZ3NsEu5KnmV+0PQ31sY0aypIMX9upJd4f9GAGkH3JIW3zs1
	 QzDlGjmEr8PS57qrTTymwR3NRoqYC8qDJW/AOXV/18+PT+JlTEWeoE3n9TSX5QAIOEqFy
	 n2ylW6ZqwFVzYZngCy3M1HCVfEJiUGDcp5XghdYQ4ZO6EGNSVA+aW+V6WkA518EwHqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jmCuwfAH;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F24606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F24606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jmCuwfAH
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so4391905e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793370488; x=1793975288; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jb0UUIPqHeTvqxXRmuce2uufcIVFotyqcoN9aAY32/w=;
        b=jmCuwfAH1CPTN8+mXIj6qPJx442DYL1aTnIIIWOVWiZegQVRIFn3R9Rmlu+wVFk/Q1
         qjr0GyO6OYqSG+JpENqWyICsbWea0t4k+e8bfeh63CwkToIcFD9Lc+5Pl88NM4vjtkdA
         hOlaadfDH7CaA5sQzJj9gHFemWBXIocfM+pzIWAOWpTKjlrBaOaZuIVuJTZ7N5H5WHW+
         KLESNqOfJk4VztQGyiobnxzEORUCO9NINvql6Y0jjVEs/8OkRe6i2s22zRDkydoQtmSi
         WPlaTz+IjyJRCxWtLoBVqUUlEgynmw/XJ78hh/5U9KHq4zrG0HOJT8R06SP/mYZL8KGL
         YXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370488; x=1793975288;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jb0UUIPqHeTvqxXRmuce2uufcIVFotyqcoN9aAY32/w=;
        b=qOAXsNM4C8dsNgb+m0sJdgHe64B81PgviS+mM8RLMFOITmsuubG2AW3jcqeh68GdpY
         HpSS6vojijRp3sCiFdWYsq7NQmWWzFXl846qMlX/jblw2hOHHmtGALRkCAOl+J00zHe/
         FJCWPylelWT4UDBadmpM2jKEu9HDIx8n5aPjqJ28pfNA05qHLW69d80LEZRO3Rcehbny
         aQwb/2Vwnk0gCfNH0LpPlUpYjEv5SiSPgYmAb5lgiAsh65ETd133jhxWNJE/Pj2XS0dP
         ocQ8l/FYLXNDmitG+5nxvYgjdJHG2TY+uUxswurxvTxhDWCAP1Yfeaca1CMdm9vqruta
         XTSg==
X-Forwarded-Encrypted: i=1; AKwUvBwe9jfacpSIf4iY8Xk3rg7+OPPIyhkrwoKAhrd7X1OfahQKpLSc7zuiNkn88sIqIxxc6M+6xxPUCZ/3c9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfVJ1ymEqxW8stDgLif/Bg1Anf98DpjV+jlDu2J85V7glQzKxa
	u5AzjqWO/TN6MK3GzcG9Hd/U8nTJhT8nxjO16GoL5vRy8IpkQXsiQSYd/gmh21xYq6U=
X-Gm-Gg: AYBFou3otxKKwVifeOVYLuGuUbhQ/Bj1k8mcEijQ2y0QN+Fw0VzvvI9wlrwN2WZ+nuu
	kbtYOc738/GMUkUkKJEM/EsTft5I98DUZqT2p/dXN25GkTGPeb6FbwJTrT35K60LafvExkBLhW3
	7jDnyRYp8LnFU7LZEYl/QnxF0xIXLF1EWF/SbNwqbV/d4r8cKDQmQcRX/pjtMTpvk+OpS2DEiRH
	afCGDi4SvK4mLrKaJHr1FfpLKt6/5Utc2ibj0D2DP6BqYhi94zZEwTaBvaa98Rs6/Fcms+0Ro1L
	N8iSZrCOYAPsZ0o2OZHJEY5RaxL0Xq85KB2uGISv+7+dqpI7w6VUuWFWhm9pNJccxblNhW0WGjN
	s+BFHfWdY78DzU0yIOd6Gtt+9/T9UqR/RHa6kBkFS2qEoxKy/YDH7gM6P5ZyKjnnhqKJIMKOKSQ
	KyNAapqGy3s+Dgj84gDLSKXwMfgfQzxucXVtf6V7bCMQO95DU3MAb78LYgGsDexMlwV3okFYsZe
	m8EiZujzmVhLpg7LPjECwvFEqhafbh7m5KbcNT+PH1OTkrKqwlGxueUcgegvbE5Ntn/TB7uULlZ
	VViH8x5I1ccpGZ7Czl5ZGi+cVm0JrLD/znuzz6ajx6r3Zd78l2Rf1wNccKyjLiqhi8C3i6k/l/t
	CjOCN7d6XwxzCSjE+sZzF7kSLl5s+IdBskt26Ev80LuW4xSOm6r0kS9PmevzDHYghPrljbkQ=
X-Received: by 2002:a05:600c:8b63:b0:4a1:f688:a5d5 with SMTP id 5b1f17b1804b1-4ac187a7655mr51642025e9.23.1793370488309;
        Fri, 30 Oct 2026 07:28:08 -0700 (PDT)
Received: from chomik.local (ory90.internetdsl.tpnet.pl. [46.170.50.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b286a0sm53158235e9.4.2026.10.30.07.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:28:07 -0700 (PDT)
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v12 0/6] Add Amlogic stateless H.264 video decoder for
 S4
From: =?utf-8?q?Wojciech_Biega=C5=84ski?= <wbieganski@baylibre.com>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
Date: Fri, 30 Oct 2026 15:24:06 +0100
Message-Id: <179337024629.131241.9227206619077693683.b4-reply@b4>
X-Mailer: b4 0.15.2

Hi,
I tested v12 series on AQ222 board with v7.2-rc1. Firmware version:
'v0.4.ff.I0c83495.75444b3' build 'Thu Apr 16 18:18:55 2026'.

RAW NV12 frames at the decoder output were visually OK across typical
resolutions and H.264 profiles (main, high, baseline) with and without
B-frames in the stream, also with I-frames only streams. I used Gstreamer's
(ver. 1.26) 'v4l2slh264dec' element on Trixie with both mmap and DMA-bufs
buffering (on the capture queue only). Input bitstreams where
FFmpeg-generated (testsrc2 + libx264) or publicly available test videos.

Decoder (and the output) remained stable with simulated (non key) frame
drop at max resolution (1920x1088, noise generated by FFmpeg's bitstream
filter).

The performance at max resolution, tested with 'filesrc ! parsebin !
v4l2slh264dec ! fakevideosink' pipeline was ~85 fps (fixed number of
outputted frames divided by the total execution time).

Tested-by: Wojciech Biegański <wbieganski@baylibre.com>

