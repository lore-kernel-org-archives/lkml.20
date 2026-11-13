Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601500;
	b=OUAS9o3UDUWup8mGpNWQdAMGGIdZX1vJBA6M1M5LLL5Jps3IA9mfBLVX8JB1TQtePTxc
	 N7bz0hU8qncS8YdLYy07HqK22T+DbUrESGheR3KCVOHWwBea5k9rrXJpB5TqsNW1A9113
	 knXoPKlvY/nCbuJ9SUHg7lVR1dIH6SlcImx07KR5ELjI6vTmjP92D7YVLUHY2DSRZZLsS
	 CvgHq58tx8lC0V8OfcSGnDc85M+hCTtUdpHVd8o74JLzRbdHLnDFf7e3v5nRJbehzcgft
	 cm3On4YA13vp8hzyeEqCPaFRS4oEdvEBSgwKMvmF3akwnCyCqP8q5MyblioUyCOwQyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WU1bfrRJnySLXBq2fMTwUjF2uo3KDqqVLdyu6MbMrY4=;
	b=pwG95+hxJmcifpfWqEuCeMgyxQKf+1gDHQ3ENeme6grDksgPPPFCckbcksuCZPnqD3u+
	 cXAAvOpKEQgoAgzH19s0DIMIBT5hYoWduog2GJkGKcgQdwUoQGTQidNwEfW/37F94RyU0
	 0LkgDizNk8lYSd1QLW+cPFDSpFyenVoAvyCnshcqFVPW5FyWq9YhUXP3GHoDMCM3U/nj+
	 BKmxF+8SWmiFfrr2CklqetFn/fU3iYNCgjjVN5kup/k1psHTfybZmL63XsSzWng46m8Jo
	 kjcMFS6XefK732TgEtDjR4eIceEy6agf4YiKfcup5iRS9ogm/QYCzCFvKxsi6wHjDTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0g1DJoN3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D049F60A260C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D049F60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0g1DJoN3
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3adfb0c9e3cso2655671fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601498; cv=none;
        d=google.com; s=arc-20260327;
        b=SjSqyP1Q5x+MjuG1HtFgFNcVfPLP3LYCRMnWHukgo+cAMfC9SlFNXq8feloJsSCJoP
         Fy/FZxz6ANE/k7SeO9lJp3hENrx7I8XlBrZhTHKAR0yMCgC0OPwxXUqDPGn8A1TTt5MB
         NkQoBrXFGAnv5yWtMDLAKrCvVVKr6nHEHaUGgS70LWzJIVlmo8XSiWOpxnwRKc95nnB3
         wNcof/BxYkJx+1gujwGnpKeOYs+E6MiVV3sTHw+MWV0alvAmdRJ7bVV0a2eZkGlJ18Lw
         4FZRUObQyt5SF9qHlLhIAsNZqBt4yfEpxbsSDYhH5j5nUbXKLI4fF7BWVO3YhZuDQnHZ
         S3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WU1bfrRJnySLXBq2fMTwUjF2uo3KDqqVLdyu6MbMrY4=;
        fh=8WI6kypNK7fyaJQqQe1G/Hm6O4ad7qAGwweKiwqJTNo=;
        b=bii7zOCNjTs9vPCYpyQwUvTXo3QwL7k3aaL3XHDB1p1a0HfGBqfBX1U1U6w8iUKkQb
         bPiVvGmIKKM1O5su+YQt6IPVVKZzdekgGdLQM51ypPUomp+VljaLpz3BG8NRaMqgy68w
         U/m8i9AKd8T9kHWooeWeknvzE6xZL2heqQyJy1E3qr+hNksj0OLPVC+zoN3EDAkCW0z9
         eWHMDx4+yiYUMqAO4P1pmF60Vx2JtzIYdH6djdWr9sNJ4JGrwzpt2Sc5mQGu28hLvKpC
         SLggCwMqG408r2vZkSY3sbGwvIuMJp0YWrPIXd9xJCNtbu9WYyf6nkyUG9XTihcU1Y06
         GB9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601498; x=1795206298; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WU1bfrRJnySLXBq2fMTwUjF2uo3KDqqVLdyu6MbMrY4=;
        b=0g1DJoN3uaUcy2p6X7jqIAGU43O1RIQVA/5wx6ZVJy+1mNtoze4HoMIAA5izV3YqzC
         Bb1xDthXhYq9lCufBijX67OZaZMVQhGhHsklv4UQ1dAFVP67KYlXKW1i2moy3AhNo1Vf
         NM3/LhbPzb+8wAkhsvDtRVHfElGxP53ggF2RiUVV0m2aOHGkvYg1nqPHzt1ruhwoCfVN
         z4htBZYXB3guowNnRyr32VxeG3lgyu4xBXCmRvboo/SiWtLExYJZ/eo/oK9fY+dC27DA
         rK+BTfpGdJFrJl5AAT78yXqiil2fmpehxMOFjPFDnQiL3YxRC+8nr7VL4xrVB5O4QFXn
         1QEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601498; x=1795206298;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WU1bfrRJnySLXBq2fMTwUjF2uo3KDqqVLdyu6MbMrY4=;
        b=x89nCsrIqqcCK15Iwt+ZM+8l+XppmM4gueLD2aJ9UjS7o/pyLo1OqVWA6Gugi/jRxk
         cqRAP2hVOB2Llx6HL25sovWZADEvXSktCuzCctE3j93HD+Ujm23WhM/RKtyqP3gPyEtj
         aTY2CirfjUTXNr6jeODA020L5Bwd9i+DVUUQ/YS53A5OL2MkyJHtj9U0E648iYyLYvOS
         Ew9LFKabcIdepEieoWI4AKFJoBGmrbHniyv0YE+HmtzmHd27n6Yq/rVpoArfZWGBdc2m
         3YGVt3xq85ZpGrWpL8G+3tYgNuj4A00WuhS33AbJGQpcdoirGtGqGJMQMMjMor2wgkdx
         TFKQ==
X-Forwarded-Encrypted: i=1; AL+hErGWZo3OkEl6qSVu8oLDdavjy5s0+ZN8xrvYGP2ohZTqqJ32KTFcRxvBw2WSQB6vY3/xPMoG0M5Q2KjQnDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zqISK9p7blk6zc+SBgukZCTDc9hCie8XCU6qg+TRVyY3xKlP6
	zVS+Vpf5UNa8aqgcGQE9cKaIwhZKK5RzQzCQhoKYMrFmqmcgcad8zbcSqvYhjoh2jDf34pU4r64
	O8P+7TfOb2fYsVNM8d9MKegCRBjRjs3g=
X-Gm-Gg: AYBFou2v+/azqkwVTXYXXpkreDHLT9QLiXWtnEIGWdqSbX7oQ7oeO9tyYTesqjBnfwU
	wN2b6htL4MrlALmcjhK8pNN80/cMWkp/F/rve7qEErXvC21wW+uk0BYr/mLUanvJC7bLZ1AA6Cg
	GjqnZCF0n3ye3qfPTF6oSe5JOwZwENbtVfaagoowuyxQ3ykLuPqAqFRytdaw1h/2g8L7AKVS4Sg
	Kz/dSkIaNH1IOCUyoRVa74OL3gXlsPD6odFnsnjdDUHhF+RTEfJO1E+mUJ6I+rcewTS6Hzq+uzD
	whRBO/rYJA34nnxh+bZkrN1ZcOTIimjdhXiMm2ZRCzqFfoLjQs9vEIGgikcoTJZMs7CrI18nwqV
	sQs7K/KwxVVNUWI1x7wh2j15dHqWhAiEGH5dd298mRRk3kGOECb+QoAMTYgphpdxUpOdZ9A8=
X-Received: by 2002:ac2:4bd3:0:b0:5bf:f87e:3d25 with SMTP id
 2adb3069b0e04-5c17075fbeemr1839415e87.2.1794601497810; Fri, 13 Nov 2026
 12:24:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
 <20261112-vop2-fixes-v2-3-8218c1cf8ac8@gmail.com> <a5b52d95-7fa2-4148-aa02-cfee6f195e1a@rock-chips.com>
In-Reply-To: <a5b52d95-7fa2-4148-aa02-cfee6f195e1a@rock-chips.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 12:24:46 -0800
X-Gm-Features: AclHuK9InRTgWzumTIOYOi5MivIL20TRnUBG8RNDv3yJlv7_a6OpEdGqBKKf5lU
Message-ID: <CAEy9hNVKy6sTA70B8kfhP7eBFCUFobFn4SvXUGMxzCs-bpXW0A@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] drm/rockchip: vop2: Fix the HDMI sync polarity on RK3588
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Piotr Zalewski <pZ010001011111@proton.me>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, cristian.ciocaltea@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hi Damon, Chaoyi,

The TRM names GRF_VO1_CON0 bit 5 the HDMI0 vsync polarity and bit 6
hsync (7 and 8 for HDMI1); the driver, like the vendor kernel, uses
them the other way round.

The HDMI controller agrees with the TRM. With patch 3 and 1920x1080@144
+HSync -VSync the driver sets bit 6, and VIDEO_INTERFACE_STATUS0 reports
-HSync +VSync; with 1600x1280@60 -HSync +VSync it sets bit 5 and the
controller sees +HSync -VSync.

v3 keeps patch 3 as you reviewed it and adds patch 4, which swaps the
two bits; with it the controller reports both modes as set. Please
shout if the TRM is wrong here.

v3 4/8: https://lore.kernel.org/r/20261113-vop2-fixes-v3-4-08ae37e83b5c@gmail.com

Best regards,
Arun
