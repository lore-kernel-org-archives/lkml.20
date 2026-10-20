Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496350;
	b=moCXQoZ24JZJeR5bYw8/N6ftKV4wOy0QeOjmFG9nVT7zALgwkrvLpkL14XghgZhIC742
	 kHpqN1IKsXYZXcdXOSw0cnF88nVzTAcPse7hU5G0GM+MQXFQdYsOy5mtXNB9sq1C3+ux4
	 735XD37CnSbftanXJ90hhXHdv+oHgegoHTKypHtaHE3GV2a8rD2cF7WpM7+eBWqFZpMi8
	 8+NV86iJEivzANF1Z6ZpoLzqS5876CQS04ZlxCh9Ys/3k7qHCDNlb2AoJ4mPNA1ojblBy
	 2uFxy/yVyrJMIhmCN4ejATaeCSNX5DLcETnvm7s6W0Fyfuj4hBrN8LPLdH8PlprDGrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=52MzbrkvqUYyLpVPRbvTDBjM4Idiu7Sa4nLZ4X0lEUg=;
	b=XxLuGm/wqM8L/SQh7VVwkGt3sjqYaz6qJw6TbqgRJoCprHmggfops4csc8UetMiZQ5aR
	 En0cBQ/dgcqDKc2A15xZyANukkYUoRvPJap1+6hj8MqCzP+XvXIjg6ZJAJuqBQ7l1ljmF
	 Bvvn0+QUcMunztyiGPvP1gVGE97vGsRPKBBnFUZh0suFThs9vZXxhryLR+op7KRXt9wrh
	 +vx/HB+IvWu6zy6nSHM8WtJGssTCSOOUb3X+v84eOTcjyf1taJmMPKVK22Sup6Q5g9rRk
	 UEjUMp8UCQcEyAkAxtCyroUinr2iQsWW4MQUBKm4P26zBe0HJSBQj5R3kFQBoLC2NzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=FpXFv9jb;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA6B606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA6B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=FpXFv9jb
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2055573c8cso385518366b.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792496349; x=1793101149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52MzbrkvqUYyLpVPRbvTDBjM4Idiu7Sa4nLZ4X0lEUg=;
        b=FpXFv9jb8ZFizFKmibEnGMxt1ygssK0ha5/IxCeaeVWR/9PJUI5neVAVL4ikaUrhPA
         IT+9Y14UHyeMEfNifm70pPX7HZubefMM9Zech/k1MVWOmdyFtg1vlxacV+eT5xn+WAqE
         SKXtIhCXd9lzv3T1zwQeRqoyNvzt+R/H1/eqQMXmwk4+OT9IUvKJ1RbMrYl1el+wDfFn
         Uex2LJn8XgKH4CxLvNY4xwJFpk/ecN1HyscXaE/sVTz1p3U6wYCRPmRiEIHyRbDwOEFn
         bFIDAwu2H1uuchZNYutvD0S80IkKVdGRCpXuqHpJg8KSfpU0QNaP632lfjqb5tvNBEeN
         yLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496349; x=1793101149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52MzbrkvqUYyLpVPRbvTDBjM4Idiu7Sa4nLZ4X0lEUg=;
        b=TSHvLHGShw7JoOVMBTZaBed+2U4htS5rM1WozhXHHAsoJ2kCVjbpkBn0cLxd0hoVtK
         quqAzyddBMT4eqehl/81y+IWzLAVydamMcYsF9bPi4N+hdItHC9GfgWfblACM8rIMpkM
         nvLuaz1YDk9fPtwIhtHUR+BrB2FYBEUyIZIl9dKfyq32Ioy2mJKqJC3CpIg63Mz/kpWT
         mPO81eiTb70DuRE7//b7K9qxjk6TDP9DQ3Br/t7iIjQ7uiwSJKRIz+sxQJk1ztGa2sHO
         5x+YdEESPGhEGUGKLUaxVXyV1iyR7E9swW4+PRCdZYtWE+N9ge87nfkjFNUrm4iFbMc3
         S3Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzb1b6aBP/PcuhEiRyFWZ0cIx27vSM6ZR1IEEyRmiQJZjGAqxyyXCUp+f1binXWvdtjbz7Pih94pLcuNhg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4a1O7ORxgOSLEeqfZgmlCpvVjz051ZwK3sOvsKoKyiUR4Etop
	rt7URIPZ74yGzh4hkK+FC8VsjF34U6GCEg5RvrU45+fwqyVxkluZHkyjiOPL2fUrJm4=
X-Gm-Gg: AYBFou0M+DmkMMiqlo0Ao2rzlP5/NQvleDt4NGnKZsc0+GAasaXd47o0hRikyxhPCQV
	1EiMhJ8H2ebCdBcCj8uS4/CcQgEjS8/Ngu/HP9XaYuA9phNJAkbK/xbqnXiocekbPcQlmKFyutK
	DbLcSQ2obsMnlykNR0nQHiiwwE731LXoJCiK4UgUiw0WjvRfOGUdm7ARJ733PMeXKQ/UAnJWwaH
	9KyUQydijmpjMKul7h0ZLv6eqUOCJZ2c4ZnrS1N8k2Tc+IXH5r+tBw09fRAKQ7FJ/34hdS5D1wG
	1lyUYFxTf0iisLM15S++LLOEII5VFeuKANJH5MBylZQm3PvuJKX3IzWq7CKDrjTzUhSafuC6FKz
	dzKhCELKLcLgY8BCGHkj724AFu6y/+EXdjlx+MLuosuBKRjA3cmYlBFYpeh4xy96uMYkLMh4bSs
	+nwptEs5woepvqvDzGOgoQQvwdvyGC6lIxFgfsJPIqjFucVgvof5vgWe7ZkDw0s69FpQS8+a0H5
	qPmu2V20bvJPnd2zmDLlB+EdwzQd8GQSpM8HcSswXub0aIALhZsyKkiqdeanXov4GDu/yQTu5ot
	ZrZEx09y1qSmxKYbyxPjeow5S9aqHtvKb28Zi8L2BJ7ZhsmTLjTDDcTYNXPA93kTTUD7sNXVSR1
	IDqqSY3bXR3lDwa1ApY9qp38Z9A==
X-Received: by 2002:a17:907:c008:b0:c3f:c10c:217e with SMTP id a640c23a62f3a-c419ea3897fmr671238166b.23.1792496348368;
        Tue, 20 Oct 2026 04:39:08 -0700 (PDT)
Received: from [192.168.3.32] (cpe-109-60-82-88.zg3.cable.xnet.hr. [109.60.82.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4465eb0c67sm202867166b.12.2026.10.20.04.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 04:39:07 -0700 (PDT)
Message-ID: <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr>
Date: Tue, 20 Oct 2026 13:39:06 +0200
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
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias
 PLL parents
To: Julius Bairaktaris <julius@bairaktaris.de>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Vladyslav Andreichykov <vladdrako007@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261020065430.1251541-1-julius@bairaktaris.de>
Content-Language: en-US
From: Robert Marko <robert.marko@sartura.hr>
In-Reply-To: <20261020065430.1251541-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 20/10/2026 08:54, Julius Bairaktaris wrote:
> From: Vladyslav Andreichykov <vladdrako007@gmail.com>
>
> bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
> which takes its AHB and SYS clocks from GCC, so the device tree does not
> pass them back to GCC. With only .fw_name these parents never resolve,
> nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails with
> -EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 Hz.
>
> Add .name fallbacks so they resolve to the clocks the CMN PLL registers,
> as gcc-ipq8074 already does.
>
> Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---

Hi,

This issue does not exist upstream, as CMN PLL is not yet wired due to 
missing
networking, even then the solution is not to add global name matching.

The required clock inputs should just be passed to GCC directly which I have
just pushed to OpenWrt.

Regards,
Robert

>   drivers/clk/qcom/gcc-ipq6018.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
> index 6943dc511534f..f58000407d015 100644
> --- a/drivers/clk/qcom/gcc-ipq6018.c
> +++ b/drivers/clk/qcom/gcc-ipq6018.c
> @@ -360,7 +360,7 @@ static const struct freq_tbl ftbl_nss_ppe_clk_src[] = {
>   
>   static const struct clk_parent_data gcc_xo_bias_gpll0_gpll4_nss_ubi32[] = {
>   	{ .fw_name = "xo" },
> -	{ .fw_name = "bias_pll_cc_clk" },
> +	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
>   	{ .hw = &gpll0.clkr.hw },
>   	{ .hw = &gpll4.clkr.hw },
>   	{ .hw = &nss_crypto_pll.clkr.hw },
> @@ -539,7 +539,7 @@ gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias[] = {
>   	{ .fw_name = "uniphy1_gcc_rx_clk" },
>   	{ .fw_name = "uniphy1_gcc_tx_clk" },
>   	{ .hw = &ubi32_pll.clkr.hw },
> -	{ .fw_name = "bias_pll_cc_clk" },
> +	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
>   };
>   
>   static const struct parent_map
> @@ -594,7 +594,7 @@ gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias[] = {
>   	{ .fw_name = "uniphy1_gcc_tx_clk" },
>   	{ .fw_name = "uniphy1_gcc_rx_clk" },
>   	{ .hw = &ubi32_pll.clkr.hw },
> -	{ .fw_name = "bias_pll_cc_clk" },
> +	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
>   };
>   
>   static const struct parent_map
> @@ -733,7 +733,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_rx_tx_ubi32_bias[] = {
>   	{ .fw_name = "uniphy0_gcc_rx_clk" },
>   	{ .fw_name = "uniphy0_gcc_tx_clk" },
>   	{ .hw = &ubi32_pll.clkr.hw },
> -	{ .fw_name = "bias_pll_cc_clk" },
> +	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
>   };
>   
>   static const struct parent_map gcc_xo_uniphy0_rx_tx_ubi32_bias_map[] = {
> @@ -769,7 +769,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_tx_rx_ubi32_bias[] = {
>   	{ .fw_name = "uniphy0_gcc_tx_clk" },
>   	{ .fw_name = "uniphy0_gcc_rx_clk" },
>   	{ .hw = &ubi32_pll.clkr.hw },
> -	{ .fw_name = "bias_pll_cc_clk" },
> +	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
>   };
>   
>   static const struct parent_map gcc_xo_uniphy0_tx_rx_ubi32_bias_map[] = {
> @@ -1920,7 +1920,7 @@ static const struct clk_parent_data
>   	{ .fw_name = "xo" },
>   	{ .hw = &gpll0.clkr.hw },
>   	{ .hw = &gpll2.clkr.hw },
> -	{ .fw_name = "bias_pll_nss_noc_clk" },
> +	{ .fw_name = "bias_pll_nss_noc_clk", .name = "bias_pll_nss_noc_clk" },
>   };
>   
>   static const struct parent_map gcc_xo_gpll0_gpll2_bias_pll_nss_noc_clk_map[] = {
