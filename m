Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C173A16B8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 15:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788710326; cv=none; b=MTRNlywyKng/5O7ZxPwHVKpAo2XiEF2V5k3Y1GpjWYr+cK0TQKffoxlMMrQP3Q+ARi4aPK+rLiIsjT34do4VRRTaONJekR+dSC57LOzXG+K/FTiNJJl1Rw8qnu6H3yXt8v/KQXu0pxfBzbqBoY8XermppFYuvwrHQH70ZAK8UzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788710326; c=relaxed/simple;
	bh=K8U4gG3AQblf7ICtp1xRLfTb5Hvus1HZE7hzEe6OtnU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ey5tSsu6pxAvfUvNa6N0gog65mYs58gG+2PfuZXs4XcFYIAF+5m5kArdq6Bzh9eJh0YSEeimtJ1axpyZ+icM9GVYUNmuA/XSydfPRsVoCMtctwsrtgk+j77WzIcSaQbTDx32Qv0q5o4UZIibES54lfG/0rFtlPARRz3xAr3xee8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/5mrscp; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/5mrscp"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso2815533a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788710321; x=1789315121; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/dbxaiPStg/QuX6EVqwVigaoYbaqasF56BIGaXeKFQo=;
        b=E/5mrscpWeXAtn4F8L1jTftEr7PkPzCNYA4x0LVYiT5kYhtXaPaZ+UMTZMyw7Jnabq
         /iepuBEtZjw6eIhflgSbtpGMFC/I6ZkHT0VtU8CEqDG6reo/z/gH0EozDF7JR8jIpiXz
         YfWLiAqqU7EExCla1GNy58dUb+DaU1I31USzZRMOBLyO1w90mqP+YN1fpUnAMChdGwfV
         GSqpWKdgx+pdB2PPfM9e72D9UkYiTUzdJQ1czP+N7EIRXrJPVK2nF7EZIyVmsDVDHxGx
         817kmKTrNuSm5A3HANzJJ8XRAJV8vL6CQ1pSOyFUn5VYZKUd6qw9jLr/zJ0CcZfkmpEc
         0B1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788710321; x=1789315121;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/dbxaiPStg/QuX6EVqwVigaoYbaqasF56BIGaXeKFQo=;
        b=ga73LzFgErq/HAyP6KqE9rtHj92qaOSbapni4i+N/YWgE4QsAXxfez8stzYR8Px27S
         ELXfDA4jjHd0L7NDPUfHCVSdNEx5qExmZhgL//JHTPBfMATafsWnKi7Gk5mGJWwjjHDP
         eLeJ7hHa3uBGxqSGpyRMa6dvz9L9mL4/yki0yvIZOj89MjqTA4Y7O7h+dLyibcFdLfNo
         otRy9VIBgUy6De5MRDYDacYb56XCynmLHCRzOi19xu1e27uBxq+n/gYzwSDfkqt5L9bO
         dNPeFOmt5IpE3TYakusXJwOzMUl1upWzVsJaQcxoK0MTgn5zdyDoTXE7w18A4Uo2OUrg
         9QnQ==
X-Forwarded-Encrypted: i=1; AKwUvBx49QP0JF3VfllLzOUvefF/4iC6Nwz4aW8CDERIHHqUEheNiNfIuxwsJokTxghOL68iIaOHC+/8Fp/OIyA=@vger.kernel.org
X-Gm-Message-State: AFuF++lrI14etJf1n4mwoTr5QF/XIK0/KMMamTq5jAVN+tcED767DbHM
	64ysqLRZ1FzLo1qi3kXhNJ0K3Cr424n9Knv7y4jCVcv6Q3eITVaVxg8B
X-Gm-Gg: AYBFou0UT6E/s5KVISJ603idGcF2nqlB6WcNN1cMOklbYFI1bblRnW9QOAeXSsA2Eq6
	Ca7FcPMPH5Nh5C46b++2YNIXZxJWZcz8igwQFSaMooIJ/OizX+uFBaQS2N63k0F16UbK53I2nDv
	BELJr2WREsHUXG1nnqBawpBnxIqhrsz+0qGu0Yh6GyOxSwwu60RzanaBBdsS9y0rYfGtLcJ4JQz
	Hlmirs5QF5TLcybT7+OI9C66bdvJaLooOhr4nB9C38MCImLe7d0Ga9tt4VVW20VAeapMcyIiuiw
	5I+cmD2Jnz4nr0TaQDdRrzPKoos+02zLWd8jLBJ7oLIt5UaAm7p9uF/djl0kRFkEnygWCCSmmCD
	sO7M+y/uPnq0/55wot57GuOGmGJXGrRF62p14rxqxHOLJN0ucwjZmvcvuwBtd9NPoiEAervNL21
	1byHlO88cHbMpm/j2KjIzikDXQ+Mv5lk4i1MjOrFjVWcgc7gRJG5swg/TQeJysz3AqF7vvAlfrv
	rudHd7q/J11GnwSBMWxY99mRF8oOp7/xgNvFC455vtOA4xIdcR8XCVFMU4Lp0aJqyI=
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr26240194a91.1.1788710321449;
        Sun, 06 Sep 2026 08:58:41 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm15941401a91.8.2026.09.06.08.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:58:41 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH 0/2] iio: adc: sun4i-gpadc-iio: two fixes
Date: Sun, 06 Sep 2026 23:58:33 +0800
Message-Id: <20260906-gpadc-v1-0-92d3dc8ef355@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwMz3fSCxJRk3RQTwyRLM5MUizRDcyWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQDWtQlxaQAAAA==
X-Change-ID: 20260906-gpadc-d41b964d8f17
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Quentin Schulz <quentin.schulz@free-electrons.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>, Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788710316; l=477;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=K8U4gG3AQblf7ICtp1xRLfTb5Hvus1HZE7hzEe6OtnU=;
 b=KKdnvVHGc9z66Nr5HNx4ntRPqRtsqEijnBCzDHcZaEUJXlQxGGQqVwgyS6ym5BVtkrrzwfg//
 vFo8QEpNRFWCBfN3nxQpm1Vo5vSvRI+QU5qCcDHZdotA0ms+izqTQNT
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Felix Gu (2):
      iio: adc: sun4i-gpadc-iio: drop underflowing pm_runtime_put() calls
      iio: adc: sun4i-gpadc-iio: clean up on thermal zone registration failure

 drivers/iio/adc/sun4i-gpadc-iio.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260906-gpadc-d41b964d8f17

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

