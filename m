Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794556255;
	b=0LqL0RijLaU17pdC2c5z7E2uInM+zPFecoYI6D+qjz/tXKqxyyJ1QazgdzR9nn2b0G7D
	 YvBV1c3kiY/R19YP2Acz1M3GcrcCq+CbOlw+HHMR1NzzqKruxIrvlrisBOk7h+6iMC4NB
	 T2wp8X+YZoZ1QEOojJBV4t9TumgChYF34QBP4pXslNS6Cn0aUcwzANneWqpLwUQV9xa4p
	 HwQpZu5WHu3SAMTP/ah+pR4pCSORfCmf7C3941IMELKf+qNdp9ZnVectXXWtnE9IybTXE
	 lsQdXuWx0hr2p/8mffKsBUBJv7gTJ2H6MN3XGKYQFZBPNKq36TgpVErDxsTFsJNebDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=06mx7f1gORAe7RxT0Hl/EBeglXXoMbIOZN2VJUQnHLc=;
	b=paVtGbWRSVVKI+anJMAvot/gZYtvvLIINHoqyeJr3X6oInw08IwMrsg2cmPCBu58a0z3
	 4xst5okts/N0RWaXtrwSSrh0D9V/jjA3kbSl6ZkzbBJCRI+G7yjiyQ8FtenQvB2Nsh9Ml
	 qzom8CTacQEX6mK6Lb8d+6JUlOwNJLkGX2omMxRD06Pco0DzwATagThq+g8m+3OIcPfv3
	 6Lw6AEP28bu54WZqs+g2n3EIM9cjv9KRo22j4tM+PR/cIztUoZ9ZlNBXcW1OxdAhwsnDS
	 pPOUKQq5nJWrA3gJRi/yQ4sH7azb8ceXCxeSkivOtRXVruHZd+sz2Yn2gypltngwrhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bxzdj2of;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10929606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10929606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bxzdj2of
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c05727a58aso54830e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:50:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556253; cv=none;
        d=google.com; s=arc-20260327;
        b=NvC3h7qeDmCHoxArhtJl7p2mzY58Fshs1jn7PqlZFFwbqnXh+namFzKhphbG7hLYLM
         HYuwzFZk/NTwTn6SaokV37d2ZRd9S956LItg7oUKQDaTYc9U6Az7huG72Be6reHetOiW
         Xs0pGSFnLUBcsQwB5b2IPGb64vPorzvqR76O9OZVefF/p1wCo5q8/BXmPsdeGTZpN2wD
         ELHS3PZQOQUk8Uzv7QiFaDzKgKmJ3u9xDqQbLTMjjgddDuBnkDCw81zFBRpP5u08nzvb
         tnS2370a29Nf1/bFKjMD6HuptyO2jjTD+KNlx+w891vCOSERrEad4yt04a9AWr2bNvIc
         76uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=06mx7f1gORAe7RxT0Hl/EBeglXXoMbIOZN2VJUQnHLc=;
        fh=t2QLzKtbdveVuPhBRC+3jNFbBQorpze0QhJ3lFMvX3g=;
        b=i9NCbfwO00MgrazOiCJutcRPxluA/sLqUCElOf98hh1qhannYeEwKHAwf9f4tsp9CJ
         TBV3Sn7J0SeaNkbXrYl3tye/WDBwHorKQWA+GjKpVBuUBlZHa0wNMjOhB/F8+lCa6imu
         7I8N05iLW4SO8oluMgUpj6jl3+dpwON/uzadPDoojOmoHyf8YeHLBtsYoL1I8JKzshJH
         2yLsib8GhwLGolnmLS1kv784Ae9X9inFNXWN5DhLceD6lv3sYf51eBUyoPvcs5ZtSk6q
         QKn73/Z7IHugNaA+TJ6psrXE09E67Br/gOFjCbYGByedluqBf47cv5oN77LPaNviiwE/
         qihw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556253; x=1795161053; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=06mx7f1gORAe7RxT0Hl/EBeglXXoMbIOZN2VJUQnHLc=;
        b=Bxzdj2ofHlGnUK13pjII1xHYgPeDBcuJZLaE1pCSruf0dTjzNRkG6Vo3KFt8VsKHD6
         CMzbihA0WU9PqEj9uz+fysbtsq1vcdx1RGos10FAPvJUhswu2dNaKH3fa6YeLWdPPPEQ
         UKG0lBn4WPPl2N4UKRh11NROBG0PjN+FaEY7241idVRPmPQ07OD7aqhjZhzR0j0y6Fyv
         jOzlvl0rOFo795Tg8CH5QFhwQHgf5lL6o3lDwrp+SzOev+D2UDCo+Z1uo78DGndi3i0T
         DxEkF/qr+9nHffplcoIruv+CkV0fB+NvHsMPSntuw3P9pjBXKqdoHntobUqQ4XVry5sH
         CCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556253; x=1795161053;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=06mx7f1gORAe7RxT0Hl/EBeglXXoMbIOZN2VJUQnHLc=;
        b=1Qx2HWVDHk96alC5qDR2SlMQldypx7BGlkju9lm4Vd15Woav2L4KRp+isaQFQ7adPR
         SZIokve/CREqoT3whq1/w6TsQkdr2q8ok6buSNXrQShXv0LosVAD5kOHeg7MvuxUa6qQ
         QHO2Akm5cpikvHWxkKfoWpO4s4bs8JmeJPZ8rz0ra8I844fHR+qkpkai68SLfVrmY6oU
         B4UjTVfYgbl3wmP/nZ0kg5MuIfuG2JIKLdKKJcPMhV8GPMVAYixPCZZ1k2wIIGm2QfXY
         c/02tl8Bf+I6jlmw8uCI6kWm4Z/LWXZiql1cYw7A8I0ulSI9rWDAqz6UCCYKz68kmvFo
         UkhA==
X-Forwarded-Encrypted: i=1; AL+hErEokkUNP7v5LUsfljZr4KiXGO4J8nCJSq+UOrfYKrXoLfgrEPbiEe5cJ+0gTuN27U+ao5N3ZI5y8yZsa2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DdJaJrhU6Ph8+QrjjAdO8iHl7j3hk4jlLsqmsUxRiJGQKWhyZ
	m1p9/uqKGEwSwbm37NKq4FDsofuIfmY+9PcsDCxxXd0JJxkp/DU4JnRW/ouON99gccFXDGPvn0X
	MLmb+ua94uWabbODU3LyA3kRZ0vTeWUE=
X-Gm-Gg: AYBFou0itNlSCOLbW7DMRiWLXWh9emytiwF/8cjJtJSKQZ/bVcEChrd0JcJF4eKdAcO
	69j3zNyNjihBiigOlYJrEtwjhuXYFDeJUwX4+JDyKr4qAR/7VQgbUT2WzFPj+UmHIO0yVDquUAg
	nWolMf3K0xxRP63i8yvJbGaWanUbdUNqWuXVP4mi1yIH76aPSLkTKrzkX2wyU2boHGeMQTpK7Tf
	rIRcGY7l9OZ2dXihm8Xp/83P88o3QR11438eWhk6UAxNr0BEYzRQ9B5uTxCwXMlUQDWgUUm6alo
	gSdQtWQzRuJYcjIIbYWt5wZp7TpUHaI62ibNOsZt/WLsqtn9aA3VvmLHZMnS/BNqgVMDB1OP+F8
	cOrEN0PoXT5Vo1re8ilvLUhbTHma1Mu+w1FNkL2sTFYWsRXuWCKjBWWfsdiBLAlhLzSRz4do=
X-Received: by 2002:a05:6512:ba4:b0:5c0:da9:407b with SMTP id
 2adb3069b0e04-5c1709e32a4mr633075e87.5.1794556252985; Thu, 12 Nov 2026
 23:50:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-pmdomain-rockchip-v2-0-5cd942a23df7@gmail.com>
 <20261112-pmdomain-rockchip-v2-2-5cd942a23df7@gmail.com> <avWae91pfLv9vyUv@pie>
In-Reply-To: <avWae91pfLv9vyUv@pie>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 23:50:41 -0800
X-Gm-Features: AclHuK9R5vFq7A0lmUNr9gzLMEUVHuewMGfBUZJVlzYHcBuFsoRJP4Ryjr6ab8U
Message-ID: <CAEy9hNW0sZBBdRz-LmydcnvnAwcn0TY+DmpsNaRamPY1mVpdBA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pmdomain: rockchip: report domain errors once,
 with dev_err_probe()
To: Yao Zi <me@ziyao.cc>
Cc: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Shawn Lin <shawn.lin@rock-chips.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Kevin Hilman <khilman@linaro.org>, 
	Caesar Wang <wxt@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Igor Pecovnik <igor@armbian.com>
Content-Type: text/plain; charset="UTF-8"

> These look like code clean-up instead of fixes, thus should be split
> into a separate patch, especially when we probably want to backport the
> real fixes. This applies for many places below.

v3 will split it into the fix (quiet probe deferral, the pm_qos regmap
error keeps its own code) and a separate clean-up with the remaining
dev_err_probe() conversions, on top of your 1/2.

> I'll drop the second patch in my series and use yours instead. But
> please search before sending patches next time to avoid duplicated work.

Thanks. Sorry I missed your series before sending v1, I'll search
first next time.

Arun
