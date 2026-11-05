Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871008;
	b=0N2PfR+IiS+t7384uHayfuO3tcCpSEtvsQVzatEJB3EfLmF9vv2jfJDMf1u8NqV/tjvJ
	 cKeGp6eKhrhQgrsG221uFS/9Uu8asf7MRbhc0Zen8dusCicQASmRQUx+RHyBHw2gi8dRF
	 AFlcXtcV1FleWB+K0P2NUuBye4xDm+QPdwyHUYP7K/j71ew14pY2584tX6bBXD+xvJ5eC
	 ysauTEb9HyzhM2dvP8UVxpIo9v8jOAl/eePwp8btzYGPFSJSRR8yh9paOwAfoutY6++i5
	 mnqpR5PATkk2bOt6ZTb4WCFqdP/tQ3SUqGNFp/SwbbpSb7S1TlO2qfgpV75CTe0pdkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871008;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=KjEnga27/tEerSydp7sFOusMCGvk8cn4l0RbuqweDp0=;
	b=mbKHdE90POGbVE+Nev6RI2QBs7HgwkOsmMOYkWTMI5Chsk77sLJb1L8KTo+uspkXOGlH
	 o9N/icDieCCL93vXDH6Oso3O+uZvuc4j9CcpHMV6S50GLWRyED2ly7UkP8gv/tZ6aw4z3
	 QWe6bQGWjW1tMoe53M/ci26zcczNgR8Ysyzc3Ey0MVrG3l5Maedrc4VPZk5UDB1xXOcdK
	 7XeCDNfzGCZhsQAo/ZhEggjWL9IQf9a+YRMTOb05R2fS8U0y/vifFB+cC1BTIHknL1YHH
	 l+Jr5uh1yDjqklM5bu1sVs4H/HUrYJ03N0Y1LlmdzL4F7h+Vjtm/GvstNIhcWSes7hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542AD606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 542AD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-990703f817fso816258241.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871007; x=1794475807;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KjEnga27/tEerSydp7sFOusMCGvk8cn4l0RbuqweDp0=;
        b=0BnHHm74ZQxdhWlu0zZ81byhNovtZcHSzXTuLuRVwWAj3aqStzBQUQ5L4sOBu4Hh+l
         biNFS/YjoYZM6UIo5FOnK7FeGyP+KN5d2uO5mvrNNQ5dzA81gOfNertAoU0/7kKLCzDd
         09nzm9AGJoz39EW2NNeZHSiRsTeciP1zgwbZBeRw48ZzkZbp88nEOJq9fgE4+o7D5idX
         ZOMrRmIx814w7lNizE2zjLrT1vnBocKs4Gie1bwKfngl4xjwKh/cW4HlQBeiqSpOSur2
         xz3s5PfR1PZ0urVVKPQfMNqYhl/Vkf0eQ9PlWa1jM0+wo+w4ZMgt9BjsraOMbRYSR2Cf
         MkYg==
X-Forwarded-Encrypted: i=1; AKwUvBzVEiSkqoTsqOteI69tZqsJi6c1xqpCJ7K99tIMea/V0VpAdyPTtHOn5oNndHlXx2LZiNoRh2QXY3Tj6nY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6QQbU0OQQunRJSb/cokhvIqT7yJSpkMVKnXQ/0KMsckHyBLnY
	ON8cuypjf9UGlSTqLH6BrEOMunu0qh2sFrACZLFstCq+76YsmEYNCHa5g5U64DuD13A=
X-Gm-Gg: AYBFou2/vGun0lpqgnuptiPJLnLVYKYrjd82R3TDfwJym1CVva/EniydhUyXhZ2pFOO
	7Gdbl6Z++2V+2HGSkEVUxioYBlNAbbyWnoNaMFQPBY0LasnqWwpokpinHP7pUNRC+1PODFkbWog
	uWa1p2N5JXnMZB6m0KpddFebmU+0WzOYRkgRblRwcSO0PkkSn1mT3+DGg1SAtY9l+ybocnX156P
	be+GtSyuowc4Vfq/Rr6q5jAal+rNw9ucsTPltsWGwy8U3SloOBEgotZPouipykUT3NWYNhml/Gb
	3V0fhoJljFXaEMLgYjOqCLc3eik6Eaz+wywpNcxrC9MMVZBFqyEyAAPdQQTDJgtBBPHtfppaHKD
	zJ5U7kigu5FaBM/nn83VwAHXwayb/h8tG93+D1khyecAHu3A+5NmDMr63ipQoxW0BK6YZeVHbbK
	/85B5WTxTBmCO3bLH5DbUJPKENCwPkO0u4I3o7s1AWjO3xROQU3T74lYmnOnqqeb4Lq02nLKvxg
	WrMI9ezw6h21K2Lb0sUDen2SoHQGbQfto/y4eysFc3ZmCyoHvssIo/TUben5b9Y4tsP8b9kTHym
	/ViSVVk/8ans8htzGMmOcBScmH/6zTf544VjNdMQta16aSPUost1q51Ym+u441ffIA==
X-Received: by 2002:a05:6102:358d:b0:7cc:21cd:9b68 with SMTP id ada2fe7eead31-7d07267043fmr10577502137.15.1793871007321;
        Thu, 05 Nov 2026 01:30:07 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fdaf4efsm3489080137.5.2026.11.05.01.30.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:30:05 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7c3b6e8225dso1052629137.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:30:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw13F/wdgY7LRiKpGJbwwfolXq95BXWPYDVsd3qgCtKfPmqPlBnnneYeVT8QAtB07jaJyVdXNk26F0ehZ0=@vger.kernel.org
X-Received: by 2002:a05:6102:3f44:b0:7cc:24e1:77b with SMTP id
 ada2fe7eead31-7d072270da8mr8474506137.4.1793871005148; Thu, 05 Nov 2026
 01:30:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro> <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
In-Reply-To: <auxHASG78dTviSz8@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:29:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWA1LNNaih3DHUM7yxpoyrnUndWDKpOjqb6_hSWWs7KHw@mail.gmail.com>
X-Gm-Features: AclHuK_4i6VsNysO9pD5FTt2GxVJKeNES2GdHJyDSBq2xm_0fur_LQOmKg8OPSw
Message-ID: <CAMuHMdWA1LNNaih3DHUM7yxpoyrnUndWDKpOjqb6_hSWWs7KHw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review tags
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 10:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Reviewed-by even with the "# subpart" still appears in person's credits
> > and reviewing entire patch of 700 lines of diff code (like Frank's SPI
> > patch) is not the same as 10 diff codes for one driver.
>
> Yes, if you want to spoil that, you'd need to introduce
>
>         Partly-reviewed-by: ...
>
> or something.

With a parameter taking a percentage or number of files or lines,
to serve as input for the Big Statistics Calculation?

Doh...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
