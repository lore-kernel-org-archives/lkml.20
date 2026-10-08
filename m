Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3343D75BC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448242; cv=none; b=CJJ8XseB+B7Fu0l2z4AllehfJUHnX9utbVS/jLO/NOcWvCXsk2GyKcPOsjf22t6gyeOy+J0TYMxi36I/R9BdaU10/+mc+k0sVhP2meMQfTwukvD0iHlZcZlYUmf2SZ+lPdVDvidaDgj8Qje35T7ach8qq0UHU07wVySNNbR4Hgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448242; c=relaxed/simple;
	bh=JkHgF9flfmEmpwopaAwoC/sgDgVuxCOuTX1ptM5bC5M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=b7PfgXwExykEOfenR6dv7vQ+WnUtF64Ej8UPNgE40q24dm4E0zD4SdJHtAsvd8izMVHKMKmE42f26PLrqCzqRB+sQRvBr2wkrNrKPAK8esoGHex2Rz7mkTuPUyWqnRdE6fQHtUIi9BPToENCRnUqj/bknMWEE8mUifFs/GRj8KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xmVt3rwn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xmVt3rwn"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so23081375e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791448239; x=1792053039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K52pgwEsFh/s2byahqoHEGKJhKcLRQ+lmV8r0ELRlTc=;
        b=xmVt3rwnwbezKaKyaG6wWQj6Ep8m7OvIKR9YPnt3jQrKMnmme5/nnd0eQHuKopXzqo
         nZN7DvhDrmQcONJ1lo7A3uYHryEF46yYo2I7X3M5mTTc0NTuIehMk1uEVoHTbTIwuJcT
         uAu3P/KAY16FbJKvqQC8DNI0590v1wHvi8HEF/jkwWY01GzmSlIXYwhu765YUzWS+QB8
         CRt99+qEIJ2yn2NQGzILHV6zJ9t2feiKvaJK81yYNobFfOv3bsry4uxEb7JjDkbYlWhH
         HX+tGPrM1e0ssEGSvxfY/C41aCLyMQZtwyCSK81ByB1YqtJJ7v3vlJB1D2sWEghScgl4
         BRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448239; x=1792053039;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K52pgwEsFh/s2byahqoHEGKJhKcLRQ+lmV8r0ELRlTc=;
        b=l+ZdeR4ezqpga32Rqa1b1MzhSGECxuzcfF781nLc8lxELS5hOISFD7ypcx0id9MprU
         BqkO/QkU69Rsb7irXHG13u1QLmsL2b76ImpbYT767/KYVdsvM03PaBU2zLCABw43HEam
         t7/z6FrnVo6l2sWKWSxfkFn8d/6765QpDH6S+Ffkc0ue8zpyV6oKe96ih3TRAKx1+xOq
         c+f4h+C+3Ib9EO3XkTeoAGs/AXGcn63q3prAthyOwI7yt4jxE7tN7BAgC4gEsCL97VFT
         Htomu1S6OqRReioTlXRXp1Fq9FTsM0zJwlqrq0PEF3D8r8P2MOdsuwkzHZwqynz7sLZj
         wGSA==
X-Forwarded-Encrypted: i=1; AKwUvBw4prEG1G84UlhsyhqGP1ZC1INJjE541KEwqnjO3uq+0r6+WiVn4ZoTmhpSF1LMivuKm+XncTK9gGN11DE=@vger.kernel.org
X-Gm-Message-State: AFuF++l4TzfttwhM3K319s4YvWuNxfsn3m9Ks+0p09z9splMsQScqYhe
	O+wbdZYsnQ0bUoN/BDJ1U2uWcn/m0gtSoQ8bxWxMamd7rCbWMMHtAcy60lg1hnr7P40=
X-Gm-Gg: AYBFou0X/Y/tjqV5xG+/Bgn6L+XVere4y1oxBAO3qUoaI5vNzL0q0sZtAUUUaUgrmzl
	EqwuPybxtLSGSKixD7jwTjNpTTjLEmkmvy+way1PweXa/nSD8+gVcu/bK70SkFMWSAy+7f9w9MF
	bUrdsKfJvQ0Z8F2B71am+qxLqLgCpUSMZOztgddig4gt5s6tnonPsJ52RTgppWED0VvSW9a2M60
	Rs/KOgTe1P4+xMwtQI7c5XAsc17vw3LrDj5Ba4RGHOwdgkDrdiCscufQip+z7XUde6agaKOaML9
	ZoJeKBYOZQZHd3rVq7KDm85R6Uvmaok5ELSgQaD7lFurB677+HJkfAlHdKiVvjs0TxzXo5KEZhN
	RTMtnyX2R5fJ+CvXdzrXZGpNdP/WnRGLo1Ef8EPW3NAAYSqs+TnD97w85yz41/7nRN4XCQ/Dbix
	bT1vv+Q7NHwWgIrgvmV1wN4XvZfrCZnbujy53cwRh27i9gAA8lL3Xq60mQkZnpBVkT08JuhuC2G
	vs2oucNiuxq26iAp47tJj/tRRZBZEc=
X-Received: by 2002:a05:600c:190c:b0:4a1:7f8e:6e67 with SMTP id 5b1f17b1804b1-4a1800d6880mr71908935e9.4.1791448239166;
        Thu, 08 Oct 2026 01:30:39 -0700 (PDT)
Received: from [192.168.151.76] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2d563sm9920967f8f.41.2026.10.08.01.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 01:30:38 -0700 (PDT)
Message-ID: <1ade78a4-b1cb-400d-932a-3a7423f9892b@linaro.org>
Date: Thu, 8 Oct 2026 10:30:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] mmc: meson-gx: honour the busy timeout for R1b commands
To: iav@iav.lv, Ulf Hansson <ulfh@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261008-meson-gx-busy-timeout-v1-1-d92f3c68c409@iav.lv>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261008-meson-gx-busy-timeout-v1-1-d92f3c68c409@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/26 06:26, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> For a command without data the driver programs a fixed 1024 ms into the
> CMD_CFG timeout field, and for R1b the controller waits for the card to
> release busy within that time. The driver does not set max_busy_timeout,
> so the core sends erase and cache flush as R1b with busy timeouts of up
> to 60 s and 30 s, and the controller gives up after one second:
> 
>    mmc_erase: erase error -110, status 0x0
>    mmc1: cache flush error -110
> 
> Program the timeout from cmd->busy_timeout, rounded up to a power of
> two and kept within 1024..32768 ms, and report 32768 ms, the largest
> value the field holds, as max_busy_timeout. The core then sizes discards
> to fit and, for a longer wait, sends R1 and polls for busy itself.
> sdhci takes its command timeout from cmd->busy_timeout in the same way.
> 
> Fixes: 51c5d8447bd7 ("MMC: meson: initial support for GX platforms")
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Tested on ODROID-N2+ (S922X), 256 GB eMMC, btrfs root with discard=async, Armbian builds in docker as load.
> Without the patch (7.3-rc6): 262 errors in 3 h and 68 in 2.5 h in two runs; the first came 4 and 43 min into the build.
> With the patch (7.3-rc6): 0 in 2.4 h.
> On 7.1 with the previous eMMC module, a synthetic test (20 GiB write + fstrim) gave 48 errors without the patch, 0 and 0 with it.
> 
> The timeout is rounded up to a power of two: the field holds powers of two only, and the timeout is a lower bound.
> MMC_CAP_WAIT_WHILE_BUSY is not set: I have not checked that the controller waits for busy on every R1b command, HS400 switches included.
> ---
>   drivers/mmc/host/meson-gx-mmc.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 7ef16d7c03cb..8de3eb65ccb0 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -125,6 +125,7 @@
>   #define SD_EMMC_CFG_RESP_TIMEOUT 256 /* in clock cycles */
>   #define SD_EMMC_CMD_TIMEOUT 1024 /* in ms */
>   #define SD_EMMC_CMD_TIMEOUT_DATA 4096 /* in ms */
> +#define SD_EMMC_CMD_TIMEOUT_MAX 32768 /* in ms, 2^15: limit of CMD_CFG_TIMEOUT_MASK */

This is a cleanup and be sent separately

>   #define SD_EMMC_CFG_CMD_GAP 16 /* in clock cycles */
>   #define SD_EMMC_DESC_BUF_LEN PAGE_SIZE
>   
> @@ -212,7 +213,21 @@ static unsigned int meson_mmc_get_timeout_msecs(struct mmc_data *data)
>   
>   	timeout = roundup_pow_of_two(timeout);
>   
> -	return min(timeout, 32768U); /* max. 2^15 ms */
> +	return min_t(unsigned int, timeout, SD_EMMC_CMD_TIMEOUT_MAX);
> +}

Same here

> +
> +/* For R1b the controller waits for busy to be released within this timeout. */
> +static unsigned int meson_mmc_get_cmd_timeout_msecs(struct mmc_command *cmd)
> +{
> +	unsigned int timeout = cmd->busy_timeout;
> +
> +	if (!timeout)
> +		return SD_EMMC_CMD_TIMEOUT;
> +
> +	timeout = roundup_pow_of_two(timeout);
> +
> +	return clamp_t(unsigned int, timeout, SD_EMMC_CMD_TIMEOUT,
> +		       SD_EMMC_CMD_TIMEOUT_MAX);
>   }
>   
>   static struct mmc_command *meson_mmc_get_next_command(struct mmc_command *cmd)
> @@ -841,7 +856,7 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>   		cmd_data = host->bounce_dma_addr & CMD_DATA_MASK;
>   	} else {
>   		cmd_cfg |= FIELD_PREP(CMD_CFG_TIMEOUT_MASK,
> -				      ilog2(SD_EMMC_CMD_TIMEOUT));
> +				      ilog2(meson_mmc_get_cmd_timeout_msecs(cmd)));
>   	}
>   
>   	/* Last descriptor */
> @@ -1168,6 +1183,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
>   
>   	mmc->caps |= MMC_CAP_CMD23;
>   
> +	/* The longest busy wait the CMD_CFG timeout field can hold. */
> +	mmc->max_busy_timeout = SD_EMMC_CMD_TIMEOUT_MAX;

So you seem to fix 2 issues:
- for timeouts larger than 32768U, we don't wait enough, so ok this should be in a single changeset
- we don't wait the right time for r1b, so you add meson_mmc_get_cmd_timeout_msecs(), ok
   so please sent it in a separate change aswell

> +
>   	if (mmc->caps & MMC_CAP_SDIO_IRQ)
>   		mmc->caps2 |= MMC_CAP2_SDIO_IRQ_NOTHREAD;
>   
> 
> ---
> base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
> change-id: 20261005-meson-gx-busy-timeout-7e8e3fdcb3e3
> 
> Best regards,

Thanks,
Neil
