Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1283D953B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148805; cv=none; b=VBdd7zQxbo1Iarp9MhP7tvq1U4lTJNapNhSUDEz/RtAdI2RkTVQhDzEJP6ARgcDnFTKf6ZgaETrCxzOs7hxF0Juz1t2/ORMgdyqqN4GM5OTU26EGprfDbHMfE9aVg/5qw0tGemJHdfFDdd7Iq/HdTAXsJ1xhcYp171u/54/rI50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148805; c=relaxed/simple;
	bh=1BP3OU5iinrec32pP5DMCn4fySLDjSuZemQqebqrhKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EffBhNJOqD1RkVEZze7/W4hvt5qHqH9d4yAnuGcpHf38c5N5N9pB7ZMRn96qPYjk4OvvqV1f/Vsd5lPs42EDRu7QS9uu4PKCoZMm3HNG7dbAf/9M5W8EOU9xDAfscFcwRXvP53Zi1K//+Xbk8ylSihkeCJVSTIacnGiwBCT5X/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ESj09Y43; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ESj09Y43"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso4695555e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792148802; x=1792753602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BhJhQfG6m5IjmjHeVsqFyoc/qVFSsNb+YvIuAxHlx2E=;
        b=ESj09Y437Yd7ChKt64/8190ixvdd1GI7Rpw0NCi4KlLUSQhvg0mNol82R/hjz80H3B
         xGSxSkMo/STmJ68ETvUv4W9RPyJdmrBQ6HgcV0qpIrHh/sxjG3a09VUMQKHy/MM9VZq6
         m6fL35gsxbqFqbVi8IHR+Ip+yT97kUZOB7X1eevgBvfLQ6kr7siDThky7GLHatX9efXw
         rb+cLRdDb1AZu92DOLyeR4jYz4IuVH0wpPwzej/TUEKaMDaHhoqCip7m8+yzetFryDA8
         oTAYxyJchkgmQfopLpiHM//QiTTLThDuuq2OJnAI55PNLljk/j6mw6IL9LnIKLD6cE/w
         tKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792148802; x=1792753602;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BhJhQfG6m5IjmjHeVsqFyoc/qVFSsNb+YvIuAxHlx2E=;
        b=YOKbFCuHIEpCon2uLUBHlV0ul5YRMSo+VUCL+C+Q1GaJzN7Rt8i9xZJzJGkrO2OFJC
         mCZ9cJlj4KGsFpwybNBr+q/0hg01vgtXPOoiNyzn8EMbDpy0CLBSgz5xzCSH1vZqeaXi
         +o16Zy837ZbNnJmx8AnKLYT3YMnRNbeXM27bRKNDFQVpFCz620D+apJ9gplqNb2IN4Sb
         q2jLSEgbPKq42CLZd9FtZ0Lt/fthGhzJ7b9W6siwzFb0oeeUGDPBKvHl0ew7E+e5N0di
         79PIuLdxPd36VJ4cbhUWWr10m2jq+1Y8f4CFW0OwmOI1CMgF7xhE/voNX6Q3sqwSrbAl
         q4ww==
X-Forwarded-Encrypted: i=1; AKwUvBzHoaJpYt/ssVr54HotixNgplPMdfFjqSDto7d0Z3uD7tspOJWpfrrJqMmD5XJaJSK/+SmPfoXqZ7bWWKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHP1aRNhyJZuPJDxCJdpyOmk7Y925jjPRlW7TaNBCP3bAa8Bfk
	adVwArZqByEr6mB78BzI9fkp2R0ZvlmOkbGl+9HF9X3wYvElIsxp5TeG/9nQmAOq/Ec=
X-Gm-Gg: AYBFou3IGUnmXikXaTlCbKdFlXb/A7BhYs1SNImOyNwbckK6iYINH7MWe1tyBIqi+qY
	7V3yNAgW38d2VfddCuFKtqFUUZDbXKF0vkWQi6ADEUpCy+QIYsFd7yqW7j5FqLnM8LN6nGNFNL3
	4WZZgb0iaamNCzHMQd8VmhOpfEO6+C0A3e626aoo048Sbaybiu1e+LleTMnlSM1ktrE5ZkTeZUa
	XBUdfeTN2+E4ptFeHQuCa75hwjhkiZjN37JxGo+u8iJ9iAPJ0hRQn9jfW83HcSlA6moOhSbjUQX
	0NK3IlinzJEuvsp0TYYjG3CYp3lO0/I4L4yyevWfQFXEltlWcscR4DdqRPh2lHgSmCfbI+x/vE9
	jqzYEb7x2l86R0nqFqqwJa+5AbHSzqorIqL3nqpkL7o//jZAuiW7hD70unWXbNEdqfu7NkbZTxj
	w1gAxepFoy3wr+hq9+MZ749KrZ74hgZm77AOoeStAfwnGyTIAfBptN/7FkuhFCMSJFf7d0aJH0w
	igJtKM31JE=
X-Received: by 2002:a05:600c:46cc:b0:4a1:688d:a41c with SMTP id 5b1f17b1804b1-4a18e4c06a8mr423248765e9.25.1792148802433;
        Fri, 16 Oct 2026 04:06:42 -0700 (PDT)
Received: from [192.168.0.167] ([109.78.92.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm4017925f8f.21.2026.10.16.04.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 04:06:41 -0700 (PDT)
Message-ID: <a295568c-1599-45c1-a60b-66fc106a2281@linaro.org>
Date: Fri, 16 Oct 2026 12:06:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/4] phy: Add MIPI C-PHY configuration helpers
To: geocausa@gmail.com, Vinod Koul <vkoul@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
 <FSgHquVCF3k-Ipt8d6Xu8eAn745A_NyIA7d_BvByx3RTufBZXE-NlVL7jHWYixnuNYx8MvrFfT6LUcHtq-BXDA==@protonmail.internalid>
 <20261016-x1e-cphy-rfc-v2-2-377654253193@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261016-x1e-cphy-rfc-v2-2-377654253193@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 11:57, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> A CSI-2 receiver knows the link frequency of its transmitter, and by the
> V4L2 convention a C-PHY link frequency is half the symbol rate on each
> trio. Add helpers so that the receiver and the PHY do not each open-code
> that conversion, as phy_mipi_dphy_get_default_config_for_hsclk() does
> for D-PHY:
> 
> - phy_mipi_cphy_get_default_config_for_link_freq() fills a
>    configuration from a link frequency and a trio count;
> - phy_mipi_cphy_config_validate() checks for a symbol rate and one to
>    three trios;
> - phy_mipi_cphy_link_freq() gives the link frequency of a configuration.
> 
> They are small enough to be inline, so no new Kconfig symbol is needed.
> 
> Suggested-by: Bryan O'Donoghue <bod@kernel.org>
> Suggested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>   include/linux/phy/phy-mipi-cphy.h | 61 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/include/linux/phy/phy-mipi-cphy.h b/include/linux/phy/phy-mipi-cphy.h
> index ef6af61de..f6746dcb0 100644
> --- a/include/linux/phy/phy-mipi-cphy.h
> +++ b/include/linux/phy/phy-mipi-cphy.h
> @@ -2,6 +2,10 @@
>   #ifndef __PHY_MIPI_CPHY_H_
>   #define __PHY_MIPI_CPHY_H_
> 
> +#include <linux/errno.h>
> +
> +#define PHY_MIPI_CPHY_MAX_TRIOS		3
> +
>   /**
>    * struct phy_configure_opts_mipi_cphy - MIPI C-PHY configuration set
>    *
> @@ -24,4 +28,61 @@ struct phy_configure_opts_mipi_cphy {
>   	unsigned char		trios;
>   };
> 
> +/**
> + * phy_mipi_cphy_config_validate() - Validate a MIPI C-PHY configuration
> + * @cfg: configuration to check
> + *
> + * Return: 0 if @cfg has a symbol rate and one to three trios, -EINVAL
> + * otherwise.
> + */
> +static inline int
> +phy_mipi_cphy_config_validate(const struct phy_configure_opts_mipi_cphy *cfg)
> +{
> +	if (!cfg->symbol_rate)
> +		return -EINVAL;
> +
> +	if (cfg->trios < 1 || cfg->trios > PHY_MIPI_CPHY_MAX_TRIOS)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +/**
> + * phy_mipi_cphy_get_default_config_for_link_freq() - C-PHY configuration
> + * from a link frequency
> + * @link_freq: link frequency in Hz
> + * @trios: number of active trios
> + * @cfg: configuration to fill
> + *
> + * A C-PHY link frequency is half the symbol rate on each trio, the
> + * convention V4L2 uses for the link frequency of a C-PHY transmitter.
> + *
> + * Return: 0 on success, -EINVAL if the resulting configuration is invalid.
> + */
> +static inline int
> +phy_mipi_cphy_get_default_config_for_link_freq(unsigned long long link_freq,
> +					       unsigned int trios,
> +					       struct phy_configure_opts_mipi_cphy *cfg)
> +{
> +	if (trios > PHY_MIPI_CPHY_MAX_TRIOS)
> +		return -EINVAL;
> +
> +	cfg->symbol_rate = link_freq * 2;
> +	cfg->trios = trios;
> +
> +	return phy_mipi_cphy_config_validate(cfg);
> +}
> +
> +/**
> + * phy_mipi_cphy_link_freq() - Link frequency of a MIPI C-PHY configuration
> + * @cfg: configuration
> + *
> + * Return: the link frequency in Hz, half the symbol rate on each trio.
> + */
> +static inline unsigned long long
> +phy_mipi_cphy_link_freq(const struct phy_configure_opts_mipi_cphy *cfg)
> +{
> +	return cfg->symbol_rate / 2;
> +}
> +
>   #endif /* __PHY_MIPI_CPHY_H_ */
> 
> --
> 2.53.0
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
