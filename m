Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793890154;
	b=KcXYdqNI6TvLgVLbM/KUtYfd43T441kw5DoyI6y3C1fwp/NzZtBbVncVC4Qt6lhwDUkF
	 gm6EsnIxUF07GY5upceVpam3BqGCJRvB/YOhFmWePl40/WhVOKWsoGLao0caDIoyxsaxa
	 hie6BOqytwpNsSn4Uvkto5P/fqFT921b7z34gpK/3C002iS2KeTBaZaVD3tfETxuDLnrY
	 YCF0jwRpm/6vfujRwP5Eq35Uti2a9TI4yFI9klzdO/6ps8TZFaOBdgyoptoQBywVDbmK+
	 jcYN4TKZ1yVUtFPE9Wv6JaArpdcDy54Dkn0MVG6blkFAwTjQVg9XtPuqw7g+AMHhU1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VgauoPLiP0v5M8oyKkXnXeYyHv/1syF6LIptNT4Sfz0=;
	b=JGPTAygOoZtAPhAWPwX3LdNtjlGQpD4Fay5l7vvrt7Wp14M38E3J9VjipcQzxvqBLk1r
	 7FSpWNgiyxIrjN0CasseesmFVI3uBKN3sJIkINzf1ZJ6hXpWDdyhwIFq6z9zYZ2r064R2
	 +ThQZSy5qd2kuwM0BdKwOYC5tp8xq6DgSosUfyfATMx0uliVMYFXi13/nRheBlvU3hO4g
	 f+twiZ98Tq6Y3prFg5e6SClyci6tPKRrKx1fw6+ZJlyY/IhsaEReV6ZQ88klf1i1pbTXI
	 Axrim73+MTM6K9VhGhbcimoGMcFYyUq0AcivN0bPwVe4R23nJ/OY+ksHj855g5ZztKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WtCH3TRq;
	arc=fail smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D47606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56D47606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WtCH3TRq
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67c08c7adadso567240d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:49:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793890153; cv=none;
        d=google.com; s=arc-20260327;
        b=raxFxUsz26dBU9lRjpS7C3moxC21OhVggRHaLurdWggxifCeA9xVUlEAE8zfj6CZy6
         pT1S5LfRp9Ss7EXd/cZUlr9urP3LfDtmgEkMEuiAGzLM1w/AuvrPICqEaOdjXZGCc3j1
         sHHcSPc6cOzfHzNdFP4tQsi4VtdkUL+g0UN4grlU3wiorgAknTZ3LRNWrmEjfiSOqsay
         aZI7RKTeXjxs844x+Xpe+PtGLqJw0qS2q2BBLOF6w2zuYvR5/JSI00hWglV5WpOlasGS
         xm7tkNs9Or44+AN8Ks4VDEpyFX+HYuj89mbQsrWcIorIFEIxcKlSYTcgh9UM2QB8vCm5
         AerA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VgauoPLiP0v5M8oyKkXnXeYyHv/1syF6LIptNT4Sfz0=;
        fh=i/iRfPxKnj2egeQkurVGQPSgfDQDIZm9o+AxYzZzJQ8=;
        b=SvfvLUWQw08BZ8WmdUaVpamcxZ5CKpGjW8KKsjxkLlt1t9aKK7fiejVbfKALNSiCow
         jKGT1WVvXKsQQbfnZcU0GRvRtP+alRjBdNX/Nr3g0B72BcimYrpcH9zezXhMSzlJCBA7
         o1AAzL46fF3M3GKUSoMBRYoD+3alxG92nuZ2qxPEsf7JzzMJAcBGl3Dxek3F4u5C9ddo
         ZPDX4WNY6n7zW3bRIlbMHQYbbF5eHJdoqq5f73oSFPpWRlCV/nKjxEXMginHHuKj7KYu
         Tf+MeXULTHHxCJ9jhMWtllk6NFng4OYelDwI3B5I5PXQoA2SodcNMIBv4+pWeKJWDdKx
         7Gog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793890153; x=1794494953; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgauoPLiP0v5M8oyKkXnXeYyHv/1syF6LIptNT4Sfz0=;
        b=WtCH3TRqFTYythzQ0H1Y/8kQGCd68gJBEz3yDB9QLQZWGRY4Kplm155FR6u2KtjeV/
         pUVI3hoIhYCRDOR9kuu9ty/lSZqKBrls+8ValTsxkcy/gQM2b91Pd/VKZMoJ4GbIFODx
         E9moLGE4AosxcDPl/R6QUfpumW2EM1BikvniNbrb1h+ETNrJtKQiHEVkm7n1UfB6/k0w
         RKjX1jBm67t3t9yanWu1KjBBzWB1HQDM5UpiMZHKsNtBDJt1d6wEPn4ErrV3XwsCfK+B
         gQELKq7Eg6aZTaDfhho3gAeSn7RgGqstT/KkwcO9s0IgTZDrCW7B5gXyTf4vdXZh/SnN
         jIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890153; x=1794494953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VgauoPLiP0v5M8oyKkXnXeYyHv/1syF6LIptNT4Sfz0=;
        b=Gnt7zd6OA1rg4/waYNKWy4r4u1mM8tUBV+bzYCLFiQH2tda3dRSLPB3ZRNJOOleMIV
         Pn2mNgtDiHfbUc+OnDrwYiNHlSrbLxe3tby9hO2Gmv8rqZVX0sgN8kXHDm1Pf+9rgNp3
         zrhncNW6Bx/t8yOsW6nyNUA4ZQLdn8Tbc7qVVhLn9DL8OrNCMLQoY4bZPSHsaKAWUaz/
         saRpV18uPHqSy+Dm8eE/j+QByQoHEHxP9ayecI/89vlLVl+NoqHJbfqYYIE0BU/MgqrO
         LvIbNyayzxRK2AXmT+miyTEXfKz0d4m3ngX1SwKEYZWz8f442Efa9c6gnFsJVvl6kkuE
         nUpA==
X-Forwarded-Encrypted: i=1; AKwUvBydHRzjTRPUXe6KmPS7nUhRmB782pI0Qz1vQL280aCLQPPl8JyRFxliAEDpJEPMl6qVtOo/4MYizhgVL5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z92mkOYru6YWc1b9Us08Z9r/uMeL15o5MSv37WZ/yO/5Mc0VuGq
	NjnyWl6jPnEbcuDk1DHxP6cCqMh1X3MIU4L9BO/3ZGFcaMlgB3wa1MQB6gA9ZfsR73IpNhtAX42
	aW02Ao1uEytAi+KK0j7T+Lcdwaw84jg==
X-Gm-Gg: AYBFou0XxoxUB3evioFE6JX9AT3jzObw6PkraBdXU4wf5Rv2+lNOYJPg1b0dZcAr/Dj
	ktVjuflMvdDuSVsSHjKYQxle6cFYO5pKfC46uW66bh6b2zfufZdIIpZlHoSgFRcLUxbgMdqGBUH
	xkD85kB+cm8BlQWxOBd450VqvdG0ldazq7fvGZVMjuofmTPRElcguduYbYt9H6TLiGCkWEq4gw7
	Yo889f5Y9EZJSocp9M8zvmTYKN6saCqg+NtJPG75QLwqQ5FHoO0ABMckjwrCp1FFCc3f0579zut
	cNyggkXCaoaQnPifMa7bqrxFcm+FoJ0niMjECDfKbtjN+r6EjzWlciRBhWUz4qziUM21Rb7RMzU
	rr1xafzi9SsvVGlOuVtX1kzwJRUX/dY/UNst7OxkqWZ7Nlkqy3juiHiKPsR7sRyIi7pZQ8zbXiC
	0IcfgQ16SzQPl2cAw=
X-Received: by 2002:a05:690e:450c:20b0:67b:31a:9b7b with SMTP id
 956f58d0204a3-67ba4fa40b1mr7256109d50.33.1793890153050; Thu, 05 Nov 2026
 06:49:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com> <d4d89cf9-884d-424b-927d-5b6692f50327@arm.com>
In-Reply-To: <d4d89cf9-884d-424b-927d-5b6692f50327@arm.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Thu, 5 Nov 2026 08:49:00 -0600
X-Gm-Features: AclHuK-SbGVRFFZQFk2Ozvq-Gg4EdtItrFF8Dqsp7Ze5suIdv9U1RHoClLmzyb0
Message-ID: <CANxy8yTiJoGJe5uz_R5hTdmT9A8ZsxAphB6qWSB4_SDuLSHSaA@mail.gmail.com>
Subject: Re: [PATCH 0/6] sunxi: A133: Add CPU speed grade detection and OPP table
To: Andre Przywara <andre.przywara@arm.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Cody Eksal <masterr3c0rd@epochal.quest>, Alexander Sverdlin <alex@sverdlin.org>, 
	Paul Kocialkowski <paulk@sys-base.io>
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

Thanks a lot for the quick and detailed answers!

On 11/5/26 12:30, Andre Przywara wrote:
> So I read about the 1.6GHz somewhere, might just be a marketing claim
> about some max frequency. If the common speedbins do not support 1.6GHz,
> that's fine, but apparently some do, so I'd keep them in, for people who
> happen to have those SoC revisions.

OK, v2 will add 1608 MHz for b0 and b1. The SDK table stops at
1512 MHz; 1608 MHz is only in the table of the factory firmware on my
board (its kernel was built in January 2026, the SDK import is from
October 2024). I compared the two tables entry by entry: the factory
table is the SDK table plus five OPPs, all other values are the same:

  1608 MHz: b0 1.18 V, b1 1.13 V (max 1.14 V)
  1416 MHz: a0 1.18 V, a1 1.18 V, a2 1.13 V

Should I add the 1416 MHz OPPs for a0-a2 as well, so that the table
matches the factory one?

> I think if we can be sure that the current mainline OPPs still apply
> with this series, that's good enough.

They do. The series does not change the A100 code path (patch 2 only
moves the cell reading into a helper), and on the K5C the patched
kernel with today's A100 table gives the same OPPs and voltages as
before. A 6.18 kernel without the series and with the new A133 table
falls back to the A100 selection (with 1008 instead of 1080 MHz).

> Regarding 1008 MHz: This was just some frequency close to 1GHz picked by
> U-Boot, that should be low enough to not cause any trouble, even with
> the default voltage. How critical is this "unlisted initial frequency"
> message? If it causes trouble, we can add a made-up 1008MHz OPP with
> some safe voltage, otherwise I'd say we just leave it.

Not critical. It is a pr_info, and cpufreq switches right away to the
next higher OPP (1080 MHz). With the A133 table it does not appear,
since that table has 1008 MHz, as the BSP does. So I would leave the
A100 table as it is.

> So like for the H616, please just use the SoC ID call, that's a clean
> solution. Maybe just make sure that it can fail somewhat gracefully
> (read: not crash).

That is what the series does. Without SOC_ID the driver warns
"SMCCC SOC_ID not available, using speed grades a0-a2", falls back to
the A100 selection (plus the BSP's a0 rule for normal parts) and
continues. I tested this on the K5C with a test build that forces the
revision to unknown.

> I think some of those handheld gaming consoles use the A133P variant?
> Maybe there are some tables in "their" source code?

Good idea, I will look for those.

> Thanks, I will try to get those logs, I have the Liontron board and the
> Teclast tablet.

Thank you! I will wait for your logs and the other reviews before
sending v2.

> P.S. Since you mention the KickPi: can you please work with Paul (in
> CC:) to upstream the DT for this board?

Yes, happy to. Paul, I have a K5C DT that I run on mainline kernels
(6.18 and 7.4-rc1): eMMC, SD card, USB host and the PMIC work.
Ethernet needs a PHY driver (Maxio MAE0621A) that is not in mainline
yet, and the Wi-Fi/BT chip (Seekwave) has no mainline driver. The
"kickpi" vendor prefix is not in mainline either. How would you like to
do this: should I send the DT with you in Cc, or do you already have a
version I should build on?

Thanks,
Rajan
