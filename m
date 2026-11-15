Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794704062;
	b=U+k+JsVUe0hsJC6xZAzYRgBY5GPtSvW/QN3Iyzuz2CX3RaB7t3frJMmRoMGGcx/e8XWS
	 OswhgxnWJxtoZ4xhXSlRYGYzFGD+TZpNQ4v8hhNPg248pKhgE6aibTQQdr54kUyMgS1Im
	 nD/JL0E74sa6lIQfWy88ggwWNX32aYdLaBXDgPZ3szisocQZZqcj4wp2A3bm6MFjKvduU
	 uiO7ywe9YyrTEqh1G/+9U0M8kezWU1MvNrbLe+bgFp4Vdx+RW4iLcVf6ChryCAag+5oHu
	 YOuz+NmDQ+A7y4lslT6HVhz3vdVzklgZvPcTYftEQElxALlaDIu5SeYfJD6NPvF6GFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794704062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wom25+2wqiUds1POyI+eHp228E/IXzic3h0qgPh6IYw=;
	b=WXOXsLwRPD1lO3ahpZoUlliNW4NoDMPYjLnl1YG9Uv1RHj5Q62GkVjBc9iLUD58L97NV
	 wSyMHPGDtCbpQTmTwHat2ClZlMH5mcCewB6t57UD3GgO1mHS5sjbaqNuNZE5TBLotfe8s
	 SghKJmiuQFiAiU7d6EFnzA1YXP8o6FfXx1oA5XrKeQIXvGletrNEUPzPoC5yTXJorL1jF
	 lc6rctl6FzaXvrZXQDftTK8CAYJJrfD5L1cyNW0rlCvRQ50yDiH9yNrp/yBxhjnylpfbz
	 9B1H02MS7iaVvwk9+ygV7qDHbqdTxL44el3/kcQiYIBf0LCVVOyUkKMAOG00raA64XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JecE9e1b;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5E6606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA5E6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JecE9e1b
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1537590c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794704061; x=1795308861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wom25+2wqiUds1POyI+eHp228E/IXzic3h0qgPh6IYw=;
        b=JecE9e1be6XXuDyJ7bsgq/w6HNy3eTpyXi1AnZBs/ei9qYWQUmrKztlbQdKX0HcKqb
         4pgIkEA8JoEfTgZWYZgcyyZQwbzGqa1gKXYfeU2pAlHETUAUohb3vCfaYlgmuSgitCgA
         RULyMt+x/Bt2iWu2zJdswd3YMeqTdKOZni+eTnFEgD42p9ze+wPrzfs8wqG6lIhd/9xC
         oBZX0inwvbqy1FyaQFAqtaAkPfp/WjqDbKQD4eZ/zlYAwLJs4UOdXYv1Wb/dtLGUdlQy
         Dz4UFFvuQ7VGcgqkpyQ24FzjW+k4VXyWNs9/Xvn9UcaUg/F9U3TUFT51OEwBoOKqAJrP
         sMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704061; x=1795308861;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wom25+2wqiUds1POyI+eHp228E/IXzic3h0qgPh6IYw=;
        b=G+tSoCJALpNq4wNHgCMrhlhBeh5tlJlm37R+n9FBRlkH/EBKeT/ddFVWrtFKq1cdc0
         X87+eZYxO45tCOv2wWMg2aihLchb0+l4dNSFC5GS7oEWq8tIqCkZ83GmmEZcTCq/GYSH
         lOe781PA6sCo7p9taCjf/nyogfmL2TjNLoriy5Y/m8wbPytVg7Af+VKAPA0LDbrOaQ0H
         EG5kjbcVpAB60Ib3LgUKwcstbSUrXjvYIon1glx3gV+ArJs4lR8KnFRT/nFiZytD7+cW
         7w66O43BKyH3euqN9lG2Zb/7dHTU0CwsHY/Y+oBqGSEddCKIoGTzD/sgcwUuihZppDFR
         Qqfg==
X-Forwarded-Encrypted: i=1; AL+hErF1Mle8xzKFI/O0nRGAp+cX7Gi95g1Gu3LqeLos0/IfkuDrW/KwaHtB3gj/QczUyf51YmA0WBWRsKZmhko=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rsDA6oWms8XWalGL1/jU2nBqwm07rOFV/iohmcPuSm1zVX0hR
	3e2okWmcqrQ5g/S/gT5YpjDCmlzxgvtU1Zd3WpgaZIQA8xekmL1lHJ+3
X-Gm-Gg: AYBFou2drL/rGN8OdAQ2PiJ1J2jPo1bTKYgQam3sCmQVBJqHHCmyDjn49uneMIus8FF
	Kzv9rdnRBfZ9mdFbTQDazBNEVQV/L1f9SRQ4GdRfWlNw1Zp/Xn0ap+jGN43iwgySTzlBZvtHopM
	FGM49Px/EwZTPimITQEDunZAifOiA/Bw8ecCkP3ahyM8bB/yQY7Eccif1YezQzfXp2RdAMLkejZ
	mFd9i4djjdtP9jCCC6Hpdhzcz+PdS+AxrRWz43uiNlUmL1TaD1IPv7zBOnp7Py+sWDc4yh5tVGA
	2WXqxoPoS/KxQrPZDfIXGjgwbAgy4Pg7xkIxPkqQJM/Uw334WZyzMIRIC7CI5ewDKXo7LYLTypm
	gbHJOVOz3sz3hs6eoFwDEj+8Jbj6Yco90wTkwjUB7fA74ibs7HMLw0cnxkLyxl0MEaUkyXZ9Otf
	rjxnoxfj7MXQDGpBgSjk1bXjRvz4PNowWdfgEWMBHPFnZyOBsMYFbTZYA04eX58KswPEOWURdeL
	YIuwO47lt0stkCSINIRrIjkVVry1FKy872GyXJmnT6ggbrHh+s0PgyOYDopDjpvCM1NU42MG1eW
	CVxkqSBlAQxYjRHlPbYMO7O/7Rx7azomwnn4KzzXLNArFd/AQ3Mig5lyNsCWpZzdfp8=
X-Received: by 2002:a05:701b:2706:b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1b503120981mr6267107c88.46.1794704060898;
        Sat, 14 Nov 2026 16:54:20 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm29598546c88.3.2026.11.14.16.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:54:20 -0800 (PST)
Message-ID: <9c1a915b-dbf5-44d9-88eb-680449348dcd@gmail.com>
Date: Sun, 15 Nov 2026 09:54:15 +0900
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
Subject: Re: [PATCH v2 4/8] PM / devfreq: rockchip-dfi: add NO_INTERRUPT perf
 capability
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
 <20260921-rockchip-dfi-cleanup-v2-4-43ff34ac8599@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-rockchip-dfi-cleanup-v2-4-43ff34ac8599@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 5:32 AM, Sebastian Reichel wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> The perf subsystem's PERF_PMU_CAP_NO_INTERRUPT is a bit of a
> misnomer.[1] Instead of meaning that the PMU has no interrupt, it
> actually means that the PMU does support sampling. On CPU PMUs, this is
> equivalent to not having an interrupt, but for uncore PMUs like the
> rockchip-dfi PMU is, no meaningful sample data could ever be generated
> regardless of whether or not there is an interrupt, as it is not a CPU.
> 
> Since rockchip-dfi doesn't seem to make use of the interrupt the DT
> provides it with anyway, this was probably never a confusion that
> existed in this case; the capability flag was likely just forgotten.
> 
> Add PERF_PMU_CAP_NO_INTERRUPT to the set flags for the pmu struct's
> capabilities member, so that the perf core knows about this limitation.
> 
> Fixes: 4d586b5724d3 ("PM / devfreq: rockchip-dfi: Add perf support")
> Link: https://lore.kernel.org/all/20250619140442.GH1613376@noisy.programming.kicks-ass.net/ [1]
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
> index 5339616f7ca6..dd9edfd6a674 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -646,7 +646,7 @@ static int rockchip_ddr_perf_init(struct rockchip_dfi *dfi)
>  	seqlock_init(&dfi->count_seqlock);
>  
>  	pmu->module = THIS_MODULE;
> -	pmu->capabilities = PERF_PMU_CAP_NO_EXCLUDE;
> +	pmu->capabilities = PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_NO_INTERRUPT;
>  	pmu->task_ctx_nr = perf_invalid_context;
>  	pmu->attr_groups = attr_groups;
>  	pmu->event_init  = rockchip_ddr_perf_event_init;
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
