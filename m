Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594516;
	b=xCllis3KF8qfJaK0V06N2WUNUNpADbB6pNyGiv/sRCD1mEzIGEYcaBOzhyNvYCvFJy9s
	 HHT7TqMFItoZu5qI9s+kHEnI6ibgQufg20H4t4jQY1Xd7hhv0oKd0hnySa8mvMdHWOZZY
	 9H5fxSb0apZBFL6aW0R24TJtFZA09+optywWqQt3aai0UJTVfnO/dBdI/3bbCJndBMO8c
	 YJsI3InCGk3xRcbrMejsULD6YbLY86mXY4S7BAGQpg14E8ClOZjbL/gJnsz+7BkE1D9XL
	 1O6HGJtJrd+rpmaB4dhnMKSoM3PT90/VIPUfufSdohtRea/h++FSjFgUPwGWSGJQ+4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DTnZOneL4PMu8XoXZjbkX+6/k13bvPAdWUl/Ap54aVI=;
	b=mEKX1RbGppd6xdXv7UsN9iJbN4qp6PGRqhw+dN1aJr2iJ5m8+MIRj6ehMymTjMV/NSRX
	 cwigRVv6uYvGYyZqBrTI7sg8bc9cASwFxhKmY/sOdVVwhlFy/2v+FB9gvC+WcRsyttXX0
	 zatXfzZPP1kcfklfw0F6KPGqsmm9Zqpc1goND0I85COOu48k6jISjt5vHU/FW87eg5vXP
	 qPDd1gbPC4vqTPy638z/4T5dpIbEWjjM63z58S501+19ck1gemYgHXfN+rlRHNJ6YzriO
	 vJE8iELnVBZhohJ0VIBgVbLtEzakqGXulzc+UBPVXok4iPLJ7o2mRukIm7LhXDfsOXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M8+POkKx;
	arc=none smtp.remote-ip=74.125.229.139
Received: from mail-dl2-f11.google.com (mail-dl2-f11.google.com [74.125.229.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43531606A337
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43531606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M8+POkKx
Received: by mail-dl2-f11.google.com with SMTP id a92af1059eb24-149f2b3f25dso126307c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792594515; x=1793199315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DTnZOneL4PMu8XoXZjbkX+6/k13bvPAdWUl/Ap54aVI=;
        b=M8+POkKxPXsKEjqsml/3a+mXvMk+h/ukjuakWI8fUHVQbYHJwyf0YOC3xc2r7uBiqC
         qXPZYumpPiCBLVeQyOk3ZynkPWDe3I1g/zKZHPkHjCzCfXo+HJvj55hFG/+T9D/O76DQ
         CaHKVfBWwjLu70HyK8rBOl+gQH6O7KlHuiPEnLYG51ioFigVdgeJZekzO2skZYAcxycQ
         Ol+T+CYjoPP4C8g2TiUKx8uE2rzIwiWgq6MdXDTdlME5A6vCbMG7Dg1IzbEbiBlLv10E
         4SHEuzh9hdkp9r5pSiwrA6f8XNPQlFhK2QhwToXzzjeC94fbwJi4Cild7Fi4+SPOrSG2
         AtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792594515; x=1793199315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTnZOneL4PMu8XoXZjbkX+6/k13bvPAdWUl/Ap54aVI=;
        b=eLbK5bQ9wbXZGinlzj6SMQFerioBdoUCVXgxEISBThUOxzvBfSwviXB73YnEO1CFLi
         1mmBoC2Ubi6vYb4KtRyVfDfX6oGcCrKUxmv2npto3CwCKRpYGx8zjrR8HDu4UHXNBkZj
         MCFtuXTF81YdOODODLwJHx1UfdVhmsN/vf8mQ7C5t1Qf+N3e1ifRwBm7oapHv5oRBMZz
         xWfoI873/XO8bBjdV2axXh10IBtJP4unpj80zmTl4+jMcFo+4lrTMkCsO/os8jv/+0Vn
         dWJslGsxTBemFqORQk0iC/sQMs7iM6SddyXQn6Tp7wxCnnulD1tNvWi93L2Pe5a4g4yJ
         t0CQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPor+prkdtJ5vjR3NkUjP9L77i92tyJVMiBM/Mrk+biS/kvRqGoO022MmMwUiTYu5KiIgWdEF1ue4DbOE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWSgErC055fGdkO/wc8vKNYdshJ7VkyFm1KwAwoYR8chxJs697
	ZVb/VTk762rfSBkUQYAueXVgPoMUEzipZ1yRL+1iSf96/nKx0JSBBL7OxrMSTsLxvq4=
X-Gm-Gg: AYBFou09YcSKFcNC1VJNKHTfVGqxOStWnahFpzWsgnbhUtQn8YpdseC2Nv7oN7txXeB
	ToSXhT1DiJetOpPDBrpqaHEqXquRfq91Lbtr5SmSb7fC5Hxsz8Pnc0RwR3sdmLArzS1Z6Im2yP9
	xUtx+kXFueYj1RIzWwlOq7OV7PJS+KTisEdVIr7up89D60i/0bx5/eSHZjFxNuYmn54659dmMCF
	EDXogv/y51czTYi55ITZD0QfCoUUi0XZnJ67JhJKJTUqmjQmqrRcsYezD2Wbf0YGO5Itf4h61SG
	yypxIiMRvb7ZWiqIvfYtsv/EEjLuv1vi0Q4C3fd3v69dLNy2nDpSXJ2tV4TTgVgJB96ndWMuZ0W
	Io+QgzsBVE2pxjIqMnw00/6bKRwP93d9cRBPUmQzjnU9Kn+WcT0P/Z5JSALFJw6xeC/YpxViQW8
	4SvpLSrbkwMwrCJK58DnJIFxrghKk33ZDnU7Ay+Goev2/KsW6rxy/D3DnZWBljp0HImvxj8hqJU
	VHWMW+rIKfLLS461F+hY+WC42GxoJ14E0tntJPx6kdra7CU9g==
X-Received: by 2002:a05:7022:4589:b0:143:2719:566e with SMTP id a92af1059eb24-190a728a556mr3628729c88.42.1792594514995;
        Wed, 21 Oct 2026 07:55:14 -0700 (PDT)
Received: from localhost ([2a03:2880:9ff:42::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903b3d0530sm7236819c88.11.2026.10.21.07.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:55:14 -0700 (PDT)
Date: Wed, 21 Oct 2026 07:55:00 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Shuah Khan <skhan@linuxfoundation.org>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Breno Leitao <leitao@debian.org>, thomas.petazzoni@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net] selftests: drv-net: devmem: Skip when hugetlbfs
 isn't supported
Message-ID: <atjSKD3o3_dQm7tc@devvm16445.scu0.facebook.com>
References: <20261021090852.996899-1-maxime.chevallier@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261021090852.996899-1-maxime.chevallier@bootlin.com>

On 10/21, Maxime Chevallier wrote:
> The devmem selftest requires accessing /proc/sys/vm/nr_hugepages,
> which is only available when hugetlbfs is supported. This isn't the
> case on all CPU architectures, for example it isn't supported on ARM
> 32-bits on cores that don't support LPAE.
> 
> On these devices, the devmem kselftest doesn't skip gracefully, it hits
> an exception while trying to open the nr_hugepages file :
> 
>   # Exception|     _reserve_hugepages()
>   # Exception|     ~~~~~~~~~~~~~~~~~~^^
>   # Exception|   File "/usr/lib/kselftests/drivers/net/hw/devmem_lib.py", line 36, in _reserve_hugepages
>   # Exception|     with open(NR_HUGEPAGES_FILE, 'r+', encoding='utf-8') as f:
>   # Exception|          ~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   # Exception| FileNotFoundError: [Errno 2] No such file or directory: '/proc/sys/vm/nr_hugepages'
> 
> Let's check if the file exists before trying to open it, and return
> immediately if we can't.
> 
> The _reserve_hugepages() runs as part of the "require_devmem()", that
> skips if devmem itself isn't supported. Before the blamed commit, this
> check was done prior to accessing nr_hugepages, so the problem wasn't
> showing.
> 
> This has been found by trying to run the selftest on stmmac, on an
> Altera CycloneV SoC (Cortex A9, doesn't support hugepages).
> 
> Fixes: 8ac4255c1e0c ("selftests/net: devmem.py: add check_rx_large_niov")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
