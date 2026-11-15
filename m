Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748827;
	b=l5YxNaXsb5ZtCaO49qDCPHyZFyob/2isD+0izFM5hxoyvqguA8E8JvZyQL0jSzc2Ty4l
	 JJxQ1BUU7KAaQC2ZnL4zR5fT63LwBe4bMjM2MhlGkyMLx85gszCqTgEuida3J0fdB7NcQ
	 0twQzmkCoTbOR7/bd1vg7adcg3NfRd6uLtSJVhbQU7dWqUZZ46S2uZCQ3ECEyVCvcP8uU
	 KbXGFEO5sw8r6a4HROQamkUVzjERPW3myxT1Mehmkq0vqO0VOWxXEDrc00aTWDhYV2KGO
	 mGJ7HqosDFIesImKNCeGcTui7M+mVHrC1ATEvU02uAaVSawS1OrL+kh5TIGABC5cglQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/rYsyjftvDCPeS9SbbyhKVYUDY9LVQRgCngM6FVnSFQ=;
	b=r4+a+88VzwoK7aFC+ltyLYsE/KkXwXGK+mPUsecnvnY/bzUFaq1Au0rRI/3MUt1wQWa+
	 EzdsuGXxlSkgLSwQoyz8qwa3rjcTNh1LOcAnEd+Ew1jJhyh0UB7fcFq3/KOMjGWGVbAPU
	 XdXWo1uw7cMXGVdApz72j/31Dj0kFMw5VCmJILEgKTjCeZOVKk4IwgSSwEW2Tr2N3LGD4
	 g8HHX3NkHDbNWw07kqrqAFpEvY8ntFlHJjIgoW8EVD7lkLyorAiY3vX0HKbb9S0UWjRmg
	 waOVpY6XtWP+Q+HZvXvapmFfI60Ot1I2vluImP+gbpdgBMWgY6fkIAGIzOnzTxYqThg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYyWL4GB;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79C8606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C79C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYyWL4GB
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2822080c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748826; x=1795353626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rYsyjftvDCPeS9SbbyhKVYUDY9LVQRgCngM6FVnSFQ=;
        b=zYyWL4GBuf0DsAdvhYGsk1HKtQ4dzGXDITV2wnSBhAUnJTmKOesAjxxSywEZ2hHpzq
         llR+jTI4Z1JZxjB9Zs0fQVKGcq7BQFZZHAXztEp/1F0X6UaDtEtWTPCGHc89IEy566yp
         KA62XuLoFmxtWbwk/nye62TtvNTJZWospqclUElyMRJjlHq5ON5zlaLp3WAxDHFfiefR
         xCc5jg/iosd6Uivwmng7ZT2W/KXXSPREMO6aEKpdQDmj6tLVYqjK0ys3pGi9AjM8db0U
         5fifSAbg1/WkWX0MF0Ed+a6jZRero+oWYiNrPY0Jdu0dBlXkIjwPEWAEbIcliiwPxzni
         Vp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748826; x=1795353626;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rYsyjftvDCPeS9SbbyhKVYUDY9LVQRgCngM6FVnSFQ=;
        b=AWoL0C6cYY1cVQiOivMm+jJrSJpNTzMKo5sm8YbojhbPTNgLoHhqSyYGQyIA4VHFq+
         OtoT440uh9iEK0G3qYwhq9dmysTHfNKwfEvauAG7SiavoSSEfFvtufnYEOVsR8PEqtnj
         hEQGpnDCoVAH4E2UsyTa2dA+2Bj7G6yuX4lVddJXsdBTGvTQIg11jUiU9xUjulWi3cWu
         xwkHMToRLL15DFM3BpnzgN2wK9h0R4Ts1kKc0ncEyfrqPZuxq5VJSmL38uWscQMzoXPc
         VtkxAcnXriTQDR6gwcxn+8UUNGklXQa0ujyFuVbfA7ZGTBJUZ+VkIqKmp5WXfHAmwcYZ
         TdDg==
X-Forwarded-Encrypted: i=1; AL+hErHcs043HNzpr0sK3L015ua2oMdnzhqzId7rp2KOlp/CXdakeCurgzR0P2+d7EEBv4+iEwFA9rguRpNJujQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dvp5K0vPwipbVQGLUlmEo5D40scjH6545vk3RVY88xsPF9joH
	d4Ml4n5p4ivamkxSKOgCpwm/IsRasdL5AYep2SI9t3hToUUvR1NtdD+G
X-Gm-Gg: AYBFou3Ueann4CWa5P2eAhQfW11OOL2CWKZzXV49KKv0TakYsUG91ZEXf0JU5qi+igo
	dCfxzhhiLd8UbkIMjaoVHbARmr/ywUQMEeljHt/vp3CcmH+54AlD52ceVxu6LEoOJRsfZY8loLC
	TFrhkK1rapGPnJUZH1rqZWznUsBNK2jmTg+quJlPsndOjMS8nEtxFuZ7NwsmOMmht0GxcLgcEw7
	EPYKj6HvEWyrrh83iPhau9EwIkwdWqxUa/SbQDQ9mHYLX0AK1hgtq5e/R6U5zRQ4+vcw3ixTss0
	mNRzZkkHM/A4e4Bi3TNSyG1kY0LrNygDI5W+qXxw4/ZVcOEGnD0PLfDtMrsrW80/sF8Q1+YqFNy
	033EMWPTWVjiEo6Wk3EPx9SpSqq7NnRCULk4pyodEs8gp9yi1NUkvpcdOczQVXKt1j6OY78Hys/
	UvQzSNQ73qjYp0Oe0wEzrtQluzmGVS768v39DYfViyglObhgocbvBKAeT0ZrKrj29PSCJudMJ7x
	OwqcyrozcFoZoog38lZ7dz/BcWqhX66+f0s4ljO/u9jTntJfsjkWBBz/BWWDkS5CqBpgE7vKbWY
	kuf8WQpPatn+nrsg+4KqIiTgye+nDxVGQCi1zQc9J+iEtrLMfrKvxwbm5jR9DxjDMs9e
X-Received: by 2002:a05:701a:c9c1:20b0:1ae:e7c4:9a15 with SMTP id a92af1059eb24-1b51828ef74mr4571335c88.3.1794748825692;
        Sun, 15 Nov 2026 05:20:25 -0800 (PST)
Received: from [192.168.35.213] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm28084123eec.24.2026.11.15.05.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 05:20:25 -0800 (PST)
Message-ID: <9f85f4a5-ee4a-4c0e-b902-abea050bb204@gmail.com>
Date: Sun, 15 Nov 2026 22:20:20 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v2 0/8] PM / devfreq: rockchip-dfi: cleanups
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kernel@collabora.com
References: <20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 5:32 AM, Sebastian Reichel wrote:
> This adds proper handling of the RK3588 clocks required for DDR memory
> monitoring, which involves adding them to the clock driver and the DT
> bindings first. The change is done in a backwards compatible way by
> marking them as CLK_IGNORE_UNUSED and using optional clock get in the
> DFI driver. The series also applies a few cleanups to the DFI driver
> while at it. This is done in preparation for RK3576 support, which
> will also come with some DFI specific clocks.
> 
> As everything is done backwards compatible, patches do not need to
> be merged together. So Heiko can take the Rockchip specific patches
> and Chanwoo Choi can take the DFI driver patches.
> 
> Changes in v2:
> - Link to v1: https://patch.msgid.link/20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com
> - DT binding: Do not specify maxItems in the generic part as it has a list
>   of items
> - DT binding: Only set minItems/maxItems for specific SoCs
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> Nicolas Frattaroli (8):
>       dt-bindings: clock: rk3588: add PCLK_DDR_MON_CH clocks
>       dt-bindings: devfreq: event: rockchip,dfi: add clocks to rk3588
>       PM / devfreq: rockchip-dfi: move to per-variant const structs
>       PM / devfreq: rockchip-dfi: add NO_INTERRUPT perf capability
>       PM / devfreq: rockchip-dfi: use bulk clock APIs
>       clk: rockchip: rk3588: add PCLK_DDR_MON_CH gate branches
>       PM / devfreq: rockchip-dfi: make RK3588 use its clocks
>       arm64: dts: rockchip: add dfi clocks on RK3588
> 
>  .../bindings/devfreq/event/rockchip,dfi.yaml       |  70 +++++++--
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   4 +
>  drivers/clk/rockchip/clk-rk3588.c                  |   8 ++
>  drivers/devfreq/event/rockchip-dfi.c               | 160 ++++++++++++++-------
>  include/dt-bindings/clock/rockchip,rk3588-cru.h    |   4 +
>  5 files changed, 184 insertions(+), 62 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260917-rockchip-dfi-cleanup-feae6eefae9c
> 
> Best regards,
> --  
> Sebastian Reichel <sebastian.reichel@collabora.com>


When I tried to apply them, there is conflict on devfreq-next branch.
I'd like you to resend this series on based on devfreq-next and [PATCH v2 0/7] PM / devfreq: rockchip-dfi: RK3576 support.

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
