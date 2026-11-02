Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793620103;
	b=0LBPoe8TCGJLwsI7zorPie0oIlCO60ggVwUTyBg323BoRAuNDkb8P3TIU8ke+b7KRzVQ
	 I6sjPEvuTwgtkt3jxlDnhovFOOrCSv6fLfWgjMOWDa6Ape7CWahLOpW5wb5DBMB7wJB7Z
	 JHaZSdVsJaUPcYyteK7zTS24J1mpaojCM1dfL27apiFuhhNrSP/n066fDN9zNLjsMIeTS
	 fMj5k7xB5YlhvTROStLQD74YwLirliy0iViNn+jdUwAB7DXExDQa9TA5/D6ilULqBYK20
	 pSbx26tFPH2xUHtAt8tNXJfvnQunqPbRijt2PbrQr5rnRdG9nWJac6jLjrtuJ0Lei6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rauZGBFXVvz8AaUGJr8FmAMzmIJEbnyJfkU8F/WFMhc=;
	b=Ac09Oai6om1jkW2JGkO6Fu+K7vwM7xkqEGmVYgegp/Y9FuqIwUPdt5CAlb9Pq8OKhKcD
	 vNiPjBb/doXzvX0ZwFFwmUjklyaKDwR1+2McOCDL/I47DBeAah1EUrGjRGul4EqPxgI+B
	 GsLQAiTF+aXwTjwQS9+58bvjxX3soUTVqmBANccVo5PC+UOc6t7F9M4n15moZRhpd6LTj
	 8C6hVilMC3zpw/BvxILFczuNhWOYXiU4driduKjHlVFJ5obgf8lRvtfFuSs9/4iPwUwMR
	 foUTlGlAHzIf1cwt+WsnbXdQnCJ3RfTCnKGuIaXPgQgCOVH+Cmn40yR2Iho1j0P5eTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=deHCt1kX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D24606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D24606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=deHCt1kX
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-7037daaa820so984466eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:48:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793620102; cv=none;
        d=google.com; s=arc-20260327;
        b=Pd8hFpR7Qp+xOxChYS2qw+FTsMvOGULx4bEiSqdAqRe8V+/cxb6T8nmxkXAg2CGGIk
         lBjzNymJcJ/rFBPp1fiDjbvMqUCedAd/X3aemuj6I60xzVMtlWhw0FjxE8G/76ifU7GD
         CmlrqzfpSWC361PBegbxteRY2mwa239/tdfF+A69EgEk+RUQM/ugnmwQTCexeoc8UXf0
         4rpHnx7WxCUOmXVipQU2D2DHvTDkynoSXvtY5ppda3u22jrl8R5vbwtlHHLn6B8oQSc4
         3scbRd5DpGIXEOaG7VxWuu4VHeDBAW1i3VmVQx/lSM8Sm26AzhYQewS/hKDqAp8n1qIv
         jLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rauZGBFXVvz8AaUGJr8FmAMzmIJEbnyJfkU8F/WFMhc=;
        fh=lZ3M+QX+hTckJC5faKykiHzcUcgH7PYD0lX5rr47VGg=;
        b=YkAaWAtMV1CpSKCbcYpz7vJvfi14tSaThCKS7rcVfhDWvrM9f3l7w00f9LsMHCaxnd
         gZjBD7kdMBm9RbVQOIymy7p+iJ3eDKhgeV+BEM3pR4aiJIxmWULvh6LA6l5J0gy8CQjh
         RWlXs+W7aP+Ym1GTlC8sochxGfAG71xh/tm77Sen0Mu1/Cl7hu4EQoPL2M1Y8uv+JFoh
         /5hgqVaZAsQiJ3k7p++JRrWmn0Ch/VIgr6qONl5AEnwt6bQrm+OcEK1wLqgv8sycPUJ0
         0KNCB4ATfir02AM76FOzZFutU3WeLGs0auZGirXhdXRgqOFtFbnFtRKjw1nPa0A5ysOo
         vnXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793620102; x=1794224902; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rauZGBFXVvz8AaUGJr8FmAMzmIJEbnyJfkU8F/WFMhc=;
        b=deHCt1kXObf/4PvERbEkS0a1GZPsmvpFF3uCs3GZzUmr5pGcw9Z1Ls/yJHcNgI4vda
         +DnXQtdzKGwWt8BjT6daHFQFhPWr6itZGXPkxKZg6HMZBJAuahL4tuusHk4BT6LtAeRG
         RzZnF9uQCOWrAjqZnUaxzvQwfQ1w67SVe+giBaEoExJpeQ6gcLkm4aGDLV0Z0QPVwNH3
         RSh19dBZp1fGxTPrA10YzZkEIqNXhkwava3+eNoFuE6FeZ85r70LQTLmAAWFroOsXnvf
         Bt2dkGahlmFI83l9YX/vTuGXTuB+AZ6LWMZjrDEjdUyjd5AIo1TkjBSJgVLjrWvTiFWK
         UOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620102; x=1794224902;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rauZGBFXVvz8AaUGJr8FmAMzmIJEbnyJfkU8F/WFMhc=;
        b=cHS4IO5SiG5qQRv7HrkmpZGw+lnA5mzv1K+luEpus9SBbLdaxUis21wAP41/yHaAoY
         pbC59wjqI48HJoORUjaCoRL8AEavDoFhZqzMwcclWluLf9Ay34Sr0MsuG3C46N55vScR
         qbgl2kaqlyrRV2SmD+pFlq1wwB3nsQKDWfzxT76BYY6GJ0l8wdzHy0+ImlKsiYCMMx8f
         1D2YAyCdmVeqfawWo2M7vskj3geI+VOyakQzRpc/PpQhw9L7kKdGu0/rjkZ/+W/0NYHh
         udHOrANKeARDEWocubW/rMH5h+qK2a8SGgfA0FagsaGDb49BRwqRnwmZo2wD64YSlVIb
         VewQ==
X-Forwarded-Encrypted: i=1; AKwUvBzusiarArp2WdsY7xFZmtlptzEbScDR72/8fKKX3bOUcEwbBDlbywneu01ZySgeualymvCaH5C+gFm3d5E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKw8WXAgwoiXQS2Bf0G0echK8xQCQ+I6xdCx+EVE3LHvgI4Ad2h
	gfCo9xKUP2SsGGeIwxHRLwhNNYW9Bou4yDBNPN9XlwzZILnniMP0iYsaVQHJweq8fyJZK+7h0pI
	KTnhr6hbqvM1i5klz3ktfPrFENC8i7eE=
X-Gm-Gg: AYBFou3YLVWoGadqY48HwIXkOoIpUEqnnXcz4WtxWA6auQxmgS8Qml5uRg9rn3rHILB
	ne2/lI6lHVsVOSdV1OBdT5lo2UBx60Gbj4RttC6a1nETk7Tzfe5PFjdhTu1P9KR+2ZmuZ29oTd8
	SxVpAWmDioE4fuB5g6od7rmKNrr9cY8PYI+rSG2pWV9gIX3vl/XwtRC49lBnAtv/VckNVHGQbX0
	44MAZL+6Hc3t/t8LeOu0BFcMlq3wGwb+gfNot0SmtS18rbGZ7ihGuF/mstkktMjQ2Xzw3fSWz32
	Gu0wwMoKtFzh5kdt6kksCgkSLtv27Cm7fO4I9pMNKD83xIq0LpaKyBoBGqrxX3oRp6uGeZzqgBV
	bbOqn90jFW9VAYtfiLkDB0nbFjclljKtWArwqel09l8PfLXm8i1VIu8Ei9/AujjXS2m9QjUHwVL
	TcTCf9rwJlee8cFlF4356tCmHH8rhzAOw0QW/+1Xr5sNNQC91aQA==
X-Received: by 2002:a05:6820:1501:b0:6e0:1599:a4b with SMTP id
 006d021491bc7-714f29883fdmr5485309eaf.18.1793620102037; Mon, 02 Nov 2026
 03:48:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-tf-luna-v2-0-ce403579bb8a@gmail.com> <20261102-massive-busy-woodlouse-8d0bbb@quoll>
In-Reply-To: <20261102-massive-busy-woodlouse-8d0bbb@quoll>
From: Vidhu Sarwal <vidhu.linux@gmail.com>
Date: Mon, 2 Nov 2026 17:18:10 +0530
X-Gm-Features: AclHuK-Rix2X8fn5EwhAQXoIbuQmroe9ZGiZTVGN5aB_rSm7KEtS6EsFTTUOsQw
Message-ID: <CAFqz8LJZQ+tw6wmLS-1FXvt6OxBESPEyz2-uK4D7B8X8epoKhg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] iio: proximity: Add Benewake TF-Luna LiDAR driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 02, 2026 at 11:47:56AM +0100, Krzysztof Kozlowski wrote:
> What changed exactly? b4 diff fails, the patchset cannot be applied on
> any known upstream revision I tried.

I am really sorry for that, I didn't realise it was based on Jonathan's
iio.git (testing branch) instead of linux-next. Patch 3 conflicts in the
Makefile on next.

In the binding, reg is now optional, there's a serial example, and the
pin 5/6 descriptions cover UART too.

Happy to rebase on next and resend if that's easier.

Thanks,
Vidhu
