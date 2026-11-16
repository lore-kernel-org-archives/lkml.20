Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794852398;
	b=kxTpeN2jjLwlFTcxHl6fNibRSHDqNWUtp8iI+fniksr2gSZTJyKPBOSK9lGisRj3Dkyt
	 261bU0xFsfQCUXNWcWBuWoMqYFuz9cSPSO2z24efMbLY+WcHMSrGIv4onQ99WH+0+S+YM
	 hKozJ4VVLAXf55GDgjcUu5wCirP+7XOyHNkxGi7RvFonJdX0mMWfOsSrqVzsuribMW4e3
	 10GAmm5Z7p1nB5008Z7LGWDuI+hhMt+XTNsXVar1/C96KJ7XlYTCWIseHHhVcs2lRxVRK
	 puvgxxqVhCKDHV0OOyRXBW/O7Tr0XFt7eug53Vc7N3FNviUSerhcXLfM8u8yPDZHqyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
	b=Imo0AhvX+juSV6309muQuRrv78p91Gl/Ran9LZNPPhU6r05Ea5wxHuIhYUJWW0Aa94jx
	 F0Uokg/xjCaiW9FnJqhe/YZzwnUp0iTl/fx1jTf9I2sUjwkfKWhvX6pM1Zw9OLZTy0FNA
	 fHT/erBtCx9ZN05uZKiYMoH10CNn6PkkS4S6iigZe+GW+6Z1Mqu3PIhDmEkW7nx1G2IMP
	 BQIvjyaTLlrujUXfRMWNFnZ1XF0GEFix53tainFXLbv49NbAyisdux/dH8dR3VKtITaYo
	 ZdpxptKMtbULD8f9HO+DyvF1FfFzgxy9mTLxzmxu97gcXGUQmlawQefLhRkFpMuiNZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kmfEtmJS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A323606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A323606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kmfEtmJS
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so4399821a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:06:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852396; cv=none;
        d=google.com; s=arc-20260327;
        b=K5180G+kdba8s3krTVO2YwxoRYUtMLZwfM/WmztZXOZDE1+NB6s5Uhe++M0ACl60eE
         Q9aDgFcnw4nu/fcSfKIV4vnRNWqdHlYaSsYGg0hhwyDGQTBeuxkzeFadYG17s1nXYWoY
         qIvqzmCCPSwYKmUffy9uKkZHhLEkOkw1cX6WsNb/1qw01Wjr1gl7NgjHhLtnbB8QDDNK
         ptkYd+hYbzukXqKuY99MfAn9LQCCFCjkwYY0HlhCPS5LRrH4vV+ibso8+Apq3rdl5S9J
         p9qnOCa0w+sPf5xhJ7Xrb0f/PraOgXwWhXDu4xCWrh9OrD7upb/BB8k1r4hjDnKFj91a
         VNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
        fh=T6Lcwjpza3stW8oSjynlE8dxfiRZ2gtlxiXeHoadksQ=;
        b=YKstZJjbbzcUjDMyjWLCE55la6G/3h64yNVANVLfOGRES0zTKL5udAZ7vYvHFUW/IK
         wDJgqqA1g7OhIMlCQMsHGHG8ViBBmCciQRSdRsWB/bvK0SrXOY9W5q/Lh3MAj8fSla0x
         o7yvDcHc0MrJM7s6DGaAzb7wXrDOALpQ9oVQri+KVHMGwYjcqunRMp69644ht3yA2qug
         xNRXVcX6tQ1J7t6k0ATlGXSxiCZs1Bi1wGg3CdX6fG9rdM7z0TRT/u2y19Hx8SCjEeNf
         rCU64GIyAswXoihDtvjSkN0PTFuaCSNisEkl1mPIjCnxlVl6DWM5o9sHixpVhnujloaD
         UF5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794852396; x=1795457196; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
        b=kmfEtmJSUQOj12O65RS6VbY1Mw683v1ljPvF36Xaq8xyWwxLcE7Rgpv+P0xUSOOzWS
         CBohX4JEJNdoeAcC6jydgpFDt1yU41+HXutDjQAdyI8vLLYBoI/h4Emm3DiFQfqcNQUR
         ypxdcXFHdYJd6ZaX146We7oygm0fSjC2yeM8PoUbco8QbD2GyNZxH/fdgbsFR/SwJvJ0
         YDxEGIMYJYTUooX4Xp5OmSdS+fQ41EkMyu65zgulLxKykbDLEkMOPCpoBmrMKZQrTqxO
         KU7rr9M7eUtWKa9Fv0ia4lwZPdGN45eJodeXwq8zBsEC1Ei5SPQXIPFCGxuJR4mijPDa
         g54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852396; x=1795457196;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
        b=dnEKyGF+fFGEgn1HczfNrgJ3qVK+dKoORreUMY1Te1bS3WjOMk8qALiW6DrOKhc4Yt
         ceio6f5Gf6/2ApzSVigSgFZcyDaGOiF0ZvLWTn9sAd0KfAQu+HA2cwJDVlqDLl7EEmRe
         AkJEaS+Hlg6n0yvEWwkenZnJm/QoTtg9cha0PxCj0R6eRgBtGdcGsJxOmAYYP85qbbbE
         EByu3ugW1siUMh0Rgw04EZi7jEBo9GRB/GqQuQByVhrXMIGH+HGBy/IPISHyVYEV6Yvt
         pIziR2IzFlz2ca3EK6vFzuFy7qW9uJenEEBIpK/LigEWJ07yFJ8OXDYNPQgVIokLNCv5
         chgA==
X-Forwarded-Encrypted: i=1; AL+hErH4ePMMa81/V8m3epRonVl2ps+gElzgg/eaQxczp9Zj3+SYs0WLa8veGqH6x9bVjn8L489r9+cPEQx6FBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d3DVWdSGpT9l88yye/KYPiVsnQ+RV3nsQafqSpHs8LoPeAvt0
	1TJ+OY+Uxpa8IUu6w+lWIov3SVZt4Gxo84RpPr+wWOyD17+8LcX/cp+eor62V3vHJ8oiFF9qII2
	JMfql6bvLSCUk9xT9w5z9GPjZRAAD499shzp8KXbKgA==
X-Gm-Gg: AYBFou0SZ1U0SHb6iWxDocL5wt/euZnpBh9G5EM5VnFRlLwTUjeD11W8azsGay3b7c/
	S1NsVGfgP/9n4ZsdQ5QsIFyKHGGH8W2SmCO1MprJ0evWP2MR+YpdYMod1DHVR9Ei9JRMxq6Reu1
	iWkBSWBnGLSrQRqXbktP+85PrGYwKRKX6GIHIcn6ysHPtR8nP8yCH6xXtQBegKcOA+kHpRW9ykn
	94nQiZWYZy+tzWREWYyMwMItuYGUrcep8y56UsBK/lMi7WpS4//6nz6Wl0iE6XlPn5Bkdq1u0HC
	40uD0GqzhK9c8Up1LSrZwzp8iSCUAdfV0nGUghFVEiA1efzx1OR99cFI5fxEfxUC2lXPNDnpius
	t9vER9FCwFFYIhl0ZCh+4bKI4rqs1uBqabmcjnmmllmGvrcQ5M/0YOhbvgJnblPxsRUrQePri
X-Received: by 2002:a05:6402:1389:b0:6b7:d672:7834 with SMTP id
 4fb4d7f45d1cf-6b7d6727942mr5514347a12.36.1794852396101; Mon, 16 Nov 2026
 10:06:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104829epcas5p13695795bc337b89816b05eec610a0dba@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <a7b901f4-59d1-4671-bfed-0d11f9e505e2@kernel.org>
In-Reply-To: <a7b901f4-59d1-4671-bfed-0d11f9e505e2@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 16 Nov 2026 18:06:24 +0000
X-Gm-Features: AclHuK-FFknY5syd2Sq_iB3mSD9v2WzoQZ6qZmiqFZ7TfMDgzML0F8GxXx83h_c
Message-ID: <CADrjBPpecGbRo2PhH_zqGfNf3L=bNf81q3SMXnSvD2n0Lx-cbA@mail.gmail.com>
Subject: Re: [PATCH v3 00/14 RESEND] Add clock support for Exynos8855 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Raghav Sharma <raghav.s@samsung.com>, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Mon, 16 Nov 2026 at 10:02, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/11/2026 12:05, Raghav Sharma wrote:
> > This patch series adds clock support for below blocks
> > found in Exynos8855 SoC
> > TOP & PERIC
> > PERIS
> > HSI
> > USB
> > There are many other blocks, for which the support will be
> > added in a forthcoming patch series.
> > Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> > ---
>
>
> Thanks, entire set applied (even if b4 thank-you letters show partial).
> for-next will be updated later today after builds.
>

Just FYI, there were a couple of outstanding review points on this series.
https://lore.kernel.org/lkml/CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com/
https://lore.kernel.org/lkml/CADrjBPrzHP_97OgAYacJKKqeCcp9FURoi6=Dmopk6nisTdEbdA@mail.gmail.com/
https://lore.kernel.org/lkml/CADrjBPoAVMdxgU4P+shh+9O5rGJp+m3sRQMDd2c-7zbJ8qhiBQ@mail.gmail.com/

I guess the main thing that would be intrusive to fix in a follow up
patch was introducing a slightly different naming scheme (compared to
most existing Exynos SoCs). The clock names being
"gout_<IP-clock_name>-<block-name>" as opposed to
"gout_<block-name>_<IP-clock-name>" that we have for many SoCs. That
also applies to the dt-bindings header "CLK_GOUT_WDT0_PERIS" not
"CLK_GOUT_PERIS_WDT0" etc.

Thanks,

Peter
