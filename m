Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816352;
	b=qGpdEzghIOIGJySOO8ZtZ34ZOOLFF7CiYoolCt+T7Cic2KSmCgEi7/uQrQFW+wrC9Oou
	 v1hD5weC770b/8G2mYFrYKenwykD8zUJJAwHasXh2pgOK0kxCoXoKuQ5/H12+D8ovRlm2
	 PTDpLMb1M2sYmF6ThoHsZ9LU6k4wEp3Tspm6G4FRrK1dmkunB44/V4nzdBOTYw2eSvGQj
	 6GEkWSVxCyLSyvT7QG9jM2+mtPWEb6gCkNyS6ceAK8FHVAKIcQzxaFoZIe1UB9jISoRCU
	 p1RvII75suZQLLaTlSUshfkN0QJzq/MW3n5aheATBbwj2VUkLrW/oGtkls3efevcQoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816352;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=FlQwGt9vsgmEqVOXecfnOUjERz/PPFh4Xv6/vyt/054=;
	b=xBTGwB8HrBXnTn65si6FqSVvjS69CQJW4nn7SGMs9EyrswXu9znXZP7yO8rQUPOF58Q3
	 51Wx05idHu1BxRiqR3G0YaWFtUe4RNEq2xCbNCdab9S3R8puc8Gg7aitvGbGWF9XvMWoL
	 aObZzghWxleLIa8BPgGAty+rpAF0sZkMly1Tt9HZr2DuhySKaYakglCYJ8TUx/pRrxQpX
	 /dnOgvz//UmO0rXnq+v7laEVSBqrG5dhikmey5sGiHvSAITGg4XTSX71stmIOS09IXVae
	 IFzpYTpTnrx7B1YR80U0iWh7pz5CQ9OP5hUFUfj/lhVgVqnDX6eRqO+rZoqY6YwoD9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KuXOpBSi;
	arc=none smtp.remote-ip=209.85.214.225
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A625E606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A625E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KuXOpBSi
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2ed06b725fdso8909185ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816351; x=1794421151;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FlQwGt9vsgmEqVOXecfnOUjERz/PPFh4Xv6/vyt/054=;
        b=Rpk9uvCbj32JzVKTJJEdfDMiZGGHoQNAl2SpveRxVmpgnVR4bIPRvpF8yT0BUmFbXo
         k/YxRwhgvAXlAhdeCajEMp/1c4xhARPXiPq3jJWzwT6CcE2ibkoHkP07JfgJ0kf7i/lT
         V8zqk3z190VCjKhOg8idEeNm1ZKD1Yf2vvJ0Gc+GdsXrNHFxChAiETAPD0Z9v+G7lJmX
         8siStJIRFfPVQaQq2/sdxjKrRCNBCvEgLatoFhePBjaxNM4wwCbbWaWX/DdteGEE1bQX
         ESLEsNgBOyV4CbeUXcYXiHRloBVZf0L/ZCCx4bvJLHuE2oKVq/hRe6W7T36Pp7NXUAD7
         /OUg==
X-Forwarded-Encrypted: i=1; AKwUvByGICKdoVQOSRe/KuWWrASweSQpd2c9BWx+QsoqqLtzSXjgNe0/qRF8WD8x7flNVXtu1EwU6cQWVWQ8K7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/ZzmtmkzYqQi5WjN9pVJZQ9T/08zUVbai/cV68OszE4xLVnnU
	zPTfnAM4v/jNIm7jKE3UVzIID5NTeUQSX+82VWtSOsTwwo7oz/v3Ax/z5AqvpIzWbKdehYSMF3q
	US17v/AznzNTiU4gJmCO2SZDrzezvQWXXgx6UhaIWZQbMDv7EiaIk/nJCsHR7n2uwKj4vS9Fe7R
	c+xSErru0lZ1rTPDaI8VsMUaZLwSqGS6lnLaLlAV53IrQ1gmm2YkWlsNDXN9YklrMEpNorZn04u
	N2An2brDioZmpGPLdR9ap2Nz3M=
X-Gm-Gg: AYBFou0r4olpOkLGVOz+IaUWbWJJpEGU4tFV2/OD09Jn6k1JxJPNaZsKvsKGIifnXL5
	kXBqzqNMyhQZvlHFEh4Uv6gicFsX4IC6PfdCxtsPADcUZ1uVnf5QEVPc4jrt3PwSOyoLSusQsDq
	dHmfk6dxlx9CTzmjrIkzF5NVrXtZWf5aLsFTIgQH2CvvdwWm9bsCvxxXV+FIupu3QcNX1bRe0Q/
	wOfvrRIPWw6bng7FSyiyY3fk5zAXKwNC6EX5TZvcYUPXxbEehsv49HrZ7D2f0Pq8XLlu2KpynkF
	86hdQZJabye46XdThkU+B4PpZ4xgpmMbWUiKpMjS65DkvUxcJnNUhykftDlLyvon+5S0OU0FjfW
	bN/XJfyQ5sNvuFURBvx4W2xdZf1O+Oee1J6IXW1CsxE8FM6xXNQcyN7+jbGtWHcOcP7kxosqpXX
	pwIGKMXO0DYwcaTbybaQdJH/2c9BwFceDuCtJu2u/R
X-Received: by 2002:a17:90b:3f45:b0:3ab:b764:8256 with SMTP id 98e67ed59e1d1-3b0afc29346mr215240a91.17.1793816350990;
        Wed, 04 Nov 2026 10:19:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0b31f880fsm52646a91.7.2026.11.04.10.19.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:19:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c938148eeso24437276d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793816349; x=1794421149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FlQwGt9vsgmEqVOXecfnOUjERz/PPFh4Xv6/vyt/054=;
        b=KuXOpBSivD6yTYvx7lNdfUXI1XYT+sCOfvw5IqLMOe49dQaXya5MMi+ROneFahzUz/
         mxkE9/2juMdJHoXhvWaZ/I3qww43k4zWheyolwIoEgrLLcdS7GELcS91X/UCvmoGtD2/
         Xtycf8tAf9MePujl92ECoqq6uA8kUyo4XE+V0=
X-Forwarded-Encrypted: i=1; AKwUvBzT0AXCZFClcIlgKZ0H44GvQLTa+V6wzCx7PoKNutUBvbLZBVMZ75adUXXt0UuKjR1dPGU41dOt+IU5b2c=@vger.kernel.org
X-Received: by 2002:a05:6214:310f:b0:917:aad9:de05 with SMTP id 6a1803df08f44-91e9445105fmr6407056d6.12.1793816349446;
        Wed, 04 Nov 2026 10:19:09 -0800 (PST)
X-Received: by 2002:a05:6214:310f:b0:917:aad9:de05 with SMTP id 6a1803df08f44-91e9445105fmr6406096d6.12.1793816348885;
        Wed, 04 Nov 2026 10:19:08 -0800 (PST)
Received: from [10.14.197.69] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e013a5dsm25545756d6.27.2026.11.04.10.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:19:08 -0800 (PST)
Message-ID: <2388e81a-424d-4263-a111-75d0f87c9754@broadcom.com>
Date: Wed, 4 Nov 2026 10:18:57 -0800
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
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>,
 Ryan Wanner <ryan.wanner@microchip.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean
 <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Laxman Dewangan
 <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>,
 "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:RENESAS RZ/V2H(P) RSPI DRIVER"
 <linux-renesas-soc@vger.kernel.org>,
 "open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>,
 "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Thierry Reding <treding@nvidia.com>
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/4/2026 7:22 AM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add missed set_callback in rspi_dma_transfer() (sashiko
> - collect review by tags
> - drop void *
> ---
>   drivers/spi/atmel-quadspi.c       | 3 +--
>   drivers/spi/spi-at91-usart.c      | 3 +--
>   drivers/spi/spi-atcspi200.c       | 3 +--
>   drivers/spi/spi-atmel.c           | 3 +--
>   drivers/spi/spi-bcm2835.c         | 6 ++----

For the above:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

