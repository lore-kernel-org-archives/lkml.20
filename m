Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4492534CCE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024396; cv=none; b=uE2PPsAnrcFA7jV99pNWJ3yrW67/jOcZ0rMICoFU/Db5dgVGR5w0FLSUMDbEW80+zV5nVEKVK4C80vwW2UwOm2jZFBPE9AX9aqf4LV+5/guXjN/ggJdZikSREuWqhaQVsZduP6aRLC1JtaFICTRPUIie85AgyXDMzTcpfduu9tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024396; c=relaxed/simple;
	bh=gpk4QCTkMMoVEQ2hU/PY3Bgu//ErkeN2hdFFYL0E0/g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UfE2s8vVXcGsFCF3oEKAXlw7b1Dhhxn9PB+wlUBmjdqsDRkhsTiX8umGovWDQ3Fw305dRx4xoOtQQ1WbyoSUjgzWWRrVJ9wwTQOqlC4F4fLZcBke5FKTDl4qYguLtIQTk4UX9MY2TVt2UPo2ONfo8my/bCDTtmR9B57Aia7ATEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xNNGKL/O; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xNNGKL/O"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso97215795e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789024392; x=1789629192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=udAblsmxBxBfrNPUP96gC45YbWeS/a2NvUFAIRjIBU8=;
        b=xNNGKL/OgvZfEgwpuu83dNNxocsmP92+qtaHINbzckwCulhu9S1M9qfYxYHPdec4RH
         ZYOAXEX42LKanydu6VbxIFT4FcjEOXVGs/B7CEzCY13293U+AIe9kYYm1MWfQK9ihfr1
         07jHqlcGgOWKXmKcLxTpaWOSVq9fgtkBiLfBXQtzv0eRTBbhdUyfz1dNB149+0bqmofn
         08d4QpRrvBAsg2dvhG6J4W+CnhdNVtkSbSS5V7r0N1yj5qs8dIZueMA3/XsRX8FW1Th+
         2T2xahvLdBndziMdeyrd+4jUU/4YfgKmnTCAcZbuyhEBTYV4qF7PhQKJZNjczEvryGEc
         mqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024392; x=1789629192;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=udAblsmxBxBfrNPUP96gC45YbWeS/a2NvUFAIRjIBU8=;
        b=pgXKAraSAffgvgNsTtJMf60NQSyGemEc4MTNURyBx/MYrO+In61ClzOxyDOvaNfYxF
         hJDfUA/rWiPc9+fipOFRGM5TcTYdn7U/f9a9Q03nNjkQ2i3SXBQHsK3k0SdSHnBb+fi6
         yspxGTtPy+LpuTc5H2vsZD+MsqwSqsFzNWI2Efte8F9+2IVt9OIpcOg9z/EuwABk4EFc
         5hExjoDoqZ8CvUTSGikPJBPO/3YgGlOHQ0notxc2PzfhyUOybydFoADoiyN17PabPXAN
         tLcN1DNxL6cB/fjxOLl+jKfELNVyAFPXe4+BNP6wPa0o0gjR0XoWq030dpg8dbEIVltR
         r/AA==
X-Forwarded-Encrypted: i=1; AKwUvBzu+SQ8QcQH8VG2ZpLVNOw8izrRfzOMbKDu+6I4ZzNPPHaoLJZ/Et9U8gJFhp7347kPiNlotlQSgosp/Ms=@vger.kernel.org
X-Gm-Message-State: AFuF++kut6ssP7yCrYOp0FgQpJNkFrbXVQKSUCrmCslwzXtDA7A6bHAY
	2jG6T0vjGSIJ+Fi+zaVnr950n3oc+t0lU5v/UYKFJZRK4cnOuiZ7wS81xd9XD12eFiw=
X-Gm-Gg: AYBFou1DkZBrrWCj0LA0kfEgJNtyLsUg5FiY/1Cx+Q/WB38MTrnaGKiBTRCubddQ/z8
	6gvZpSqCSZ7pLUWaMbMyWrRqacsO6limj5sCyQOQENP2IXoV8SCI+8SvQPlrA7IvzVAlO+F5bG/
	p/qvDxCm4/M3PADlNBnrSE+6v2BKNywZFk1u6qsde11cVB1kM732QTN4uoPuOhzpLiF9Cw/n8jd
	KNEpEPwiC2EqNGU1YXEH7VIjcWRnDxrCwtznDtyUunP1e/XKtWcY55CKA6Si4QL+JYjMbW2DNs1
	AVWaf8JDwpqwxDHurw7Nq+H0jCupzirHuQfGo08mLyF4XwinrYBW+daFjgpiW42LlEYhwWv/7b4
	dr/D6exxw5S/WLl+7pYHBOhRvCMrwvIjrRcF5EgnGs1/UTMzX14URgdO2nOjb6h3mzE85ZRakEx
	6HjBltSz+RgdiU1fhws/FHK+02P9tFdqcYr5shzFEIrn8y5QD1is3O54X4CYI1Rw9wVSxWtpTl3
	dxv1X2x31Gf1VuOf3TOwa5nQePEqI1Sul0YraDJg1KOwO5ho1ZerA==
X-Received: by 2002:a05:600c:4e4c:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49cf8206e4dmr412212555e9.3.1789024392371;
        Thu, 10 Sep 2026 00:13:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3caf:d840:c911:29a9? ([2a01:e0a:106d:1080:3caf:d840:c911:29a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm49914055e9.6.2026.09.10.00.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:13:09 -0700 (PDT)
Message-ID: <cc06ba9b-c866-4c43-a7d4-e25188b84f22@linaro.org>
Date: Thu, 10 Sep 2026 09:13:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/4] mmc: meson-gx: enable the bus pipeline clock on T7
To: Lucas Tanure <tanure@linux.com>, Ulf Hansson <ulfh@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-3-tanure@linux.com>
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
In-Reply-To: <20260905153234.133217-3-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/5/26 17:32, Lucas Tanure wrote:
> On the T7 SoC, the bus path between the SD/eMMC controllers and the
> NIC_MATRIX fabric goes through a pipeline stage inserted by the hardware
> design to help timing closure. The stage has its own gate clock and,
> when that clock is disabled, a controller that starts a DMA transfer can
> never complete it, hanging the storage devices and, from there, the
> whole system.
> 
> Add a dedicated match data for the amlogic,t7-mmc compatible that makes
> the driver claim and enable the "pipeline" clock for as long as the
> device is bound.
> 
> The clock is deliberately not optional: the hardware cannot do DMA
> without it, and failing the probe with a clear error is preferable to
> booting and hitting an undiagnosable DMA hang later.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   drivers/mmc/host/meson-gx-mmc.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 694bb443d5f3..c0f1e929fc13 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -139,6 +139,7 @@ struct meson_mmc_data {
>   	unsigned int always_on;
>   	unsigned int adjust;
>   	unsigned int irq_sdio_sleep;
> +	bool has_pipeline_clk;
>   };
>   
>   struct sd_emmc_desc {
> @@ -1204,6 +1205,15 @@ static int meson_mmc_probe(struct platform_device *pdev)
>   	if (IS_ERR(core_clk))
>   		return PTR_ERR(core_clk);
>   
> +	if (host->data->has_pipeline_clk) {
> +		struct clk *pipe_clk;
> +
> +		pipe_clk = devm_clk_get_enabled(&pdev->dev, "pipeline");
> +		if (IS_ERR(pipe_clk))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(pipe_clk),
> +					     "missing pipeline clock\n");
> +	}
> +
>   	ret = meson_mmc_clk_init(host);
>   	if (ret)
>   		return ret;
> @@ -1322,12 +1332,22 @@ static const struct meson_mmc_data meson_axg_data = {
>   	.irq_sdio_sleep	= CLK_V3_IRQ_SDIO_SLEEP,
>   };
>   
> +static const struct meson_mmc_data meson_t7_data = {
> +	.tx_delay_mask	= CLK_V3_TX_DELAY_MASK,
> +	.rx_delay_mask	= CLK_V3_RX_DELAY_MASK,
> +	.always_on	= CLK_V3_ALWAYS_ON,
> +	.adjust		= SD_EMMC_V3_ADJUST,
> +	.irq_sdio_sleep	= CLK_V3_IRQ_SDIO_SLEEP,
> +	.has_pipeline_clk = true,
> +};
> +
>   static const struct of_device_id meson_mmc_of_match[] = {
>   	{ .compatible = "amlogic,meson-gx-mmc",		.data = &meson_gx_data },
>   	{ .compatible = "amlogic,meson-gxbb-mmc", 	.data = &meson_gx_data },
>   	{ .compatible = "amlogic,meson-gxl-mmc",	.data = &meson_gx_data },
>   	{ .compatible = "amlogic,meson-gxm-mmc",	.data = &meson_gx_data },
>   	{ .compatible = "amlogic,meson-axg-mmc",	.data = &meson_axg_data },
> +	{ .compatible = "amlogic,t7-mmc",		.data = &meson_t7_data },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, meson_mmc_of_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
