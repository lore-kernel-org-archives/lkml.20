Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3242F48A2C2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256995; cv=none; b=tBfUecO1/JhvsZCxKwMHDQi9iAm3k4OQ4b/FqYWEM3UFahqXJ9C+f7P889M6xOx8bfbB/jr/kKUOUnJFntBxzhFUAD8Z+tkjumWi5IcG00aDpNpvap5Gj3geOiCehUD2ALBtKQiFN06iFoYYFGAAjv/HzEc1yQTI51zC936Z/mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256995; c=relaxed/simple;
	bh=kuAjVmy/l8TrZPUG6v9tpNTjRV/TAbGAxMr0wjvZllg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mv2xwPo0+yzzQmqmGUKdTrHVLIRcqhvFr8PjYYiLwoV0JFItUziOdngvK4iVdiLOxaPu4XSgN57r0NUbtFassWL5VhuvN1Kokeu4pblUYeRdbgyCjMb3wSjvE4Ozia5tSZ8PytQf2n4kcLR8FpDhZB0G6DMOTVIq+IHOxcElojs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oMukW/i4; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oMukW/i4"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso1255114f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790256981; x=1790861781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GOE7UhoK4tCn9iUhFUN5ojV92TGV3EOzfICN/tCRR3o=;
        b=oMukW/i49efzPYjUg2t8w9FL+jm2lhvFFR6MrmZwadn4+7UWzdGB+BuUXBiPsjxeOk
         COfGfntj9Nlu2o9z/b5OHiZnW1Ca4/kGtcT/ZP8ju3CWK7dK2e3WBJxnx3ylZjDJ5oZT
         P5IhrbK7eyIdu3ZxWyq1RM8tyddKCPiZkWbjx7BnHe1eOdNo3TLzy77g5ZJYZXHNyR3T
         XhWYgIRLafXaFjDcWtqKfXDtBo8IPkDkRqCdo8mHIMp0RDKL2bS67ZKmH+8MvZoLaee2
         muQWMEioUbROYvLB7ZixnfmaicXtU3HdpUJDWbgyTifFYOkG+bnhPettcr8/RfpeFtqE
         0UkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256981; x=1790861781;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GOE7UhoK4tCn9iUhFUN5ojV92TGV3EOzfICN/tCRR3o=;
        b=Uu8YN7DXo2uRg0CGo9fkOdr3v7nwnhfmijZLjSeRuigcIKpwT+MdlNlwIJ47JOkOQ7
         Wb2IFC5aggd/MfUnDGTDy/riVJSnQftoK+sHq8h5s7oe3qSgbZCf3TRIHR/Wo9jVQxmv
         4tAHuaounkq5bAX+mKb9HB/leKtVXOjf7EpSwKpYdl4esjAPCklxSm0kFfDT6pyyG1nC
         3GYeaThD+XbHiC0Hbv7qo0tabjzEJk7R3uF4d6DgjyncwjvbqQj/NIH3TA7TOfdkrRdx
         ZeQcSGHPky63ZrALEqMPQ1NVTKnsoni4wCj0tUZHOUuEI8o+8mpa+EVcC6nZQB7Dh0xW
         Cgfw==
X-Forwarded-Encrypted: i=1; AKwUvByWKmOSRgxzoo0iU9SAEWUSB9G12BVMKCL5XJBr9JY8N3xltPVTCLBtlp/94bvvttK1hX9CyZ8kq+pUrzw=@vger.kernel.org
X-Gm-Message-State: AFuF++n7AfwkmqbkxH6PyHXwRsizuPxC9A1jgAT/7MeFCCdsB0XPIn1N
	4LmIi3oigcTzCMJSqktEyatR+nbGuskNczreBRpvYCHp05g2qlt4Pw8S1EXGLLKjxaQ=
X-Gm-Gg: AYBFou04TMRxT9eoglQYNmr7Z9ng1T3UHES0XvEoeCa54PYj2MwDgOuXUkbC30XNCyN
	mMYms9t16+yQvhAPvPfRz1CbkQh0cdf5vApaJna7BoeY57BcspK6S2xGKdLnO1SJApB0e3qJIDo
	kLAsWtdq9ISOUqziZRkxDbvjLxO9fDDC9aOxp7redCKU5iGag3z6NhY6inxgqP9FIcyRH1H9Xjw
	Dci01qcGTFBCUfzvlIrxkUqPUUkIYc9Dj/sn8teS4YNezPxRvrgL/O+nzXzYPL8vW3z8EM1jhaE
	QKEJa/anSrAb//qHl0OuICEfxe7ZU1j2IMf6m2r5fQOWcS3tGmHBZPc+aL3HmftxJrmn+MKYVXC
	KPxYo+HJRFvBmoFJ5Ir28kDhrsWz4iYOTpLt4W1c3bUWGuaRl6PVpEzM5RGKNntAN3eV0upIvXT
	F922zC0ngpHTQbqCNlr7A+0Lrb3ic0Y2fKTxkggr1nBqPYJdbFBSCg/vPivHuihkBvObwxE20rY
	hW/eYuk6ehVXerswau12CVPjrXj2rxSsY5a6waQi515usoqmebWHDE=
X-Received: by 2002:a05:6000:491e:b0:487:8ba:8aa9 with SMTP id ffacd0b85a97d-488716cfedemr4392066f8f.23.1790256980460;
        Thu, 24 Sep 2026 06:36:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a2d5sm14387149f8f.27.2026.09.24.06.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:36:19 -0700 (PDT)
Message-ID: <7847ae8d-b330-4add-b39d-bd12b9a611cd@linaro.org>
Date: Thu, 24 Sep 2026 15:36:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 8/9] drm/panel: novatek-nt36672a: Add panel for Asus
 Zenfone Max Pro M1
To: Alexey Minnekhanov <alexeymin@minlexx.ru>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>,
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org, Aboothahir U <aboothahirpkd@gmail.com>
References: <20260917-nt36672a-panels-v2-0-f8de8be5b86f@minlexx.ru>
 <20260917-nt36672a-panels-v2-8-f8de8be5b86f@minlexx.ru>
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
In-Reply-To: <20260917-nt36672a-panels-v2-8-f8de8be5b86f@minlexx.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 18:43, Alexey Minnekhanov wrote:
> Add support for TXD TXDI600YANPA-43V3 video mode panel based on
> Novatek NT36672A, used in Asus Zenfone Max Pro M1 smartphone
> (asus-x00td).
> 
> Co-developed-by: Aboothahir U <aboothahirpkd@gmail.com>
> Signed-off-by: Aboothahir U <aboothahirpkd@gmail.com>
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> 
> ---
> v2:
>   * change compatible prefix "txd" -> "txdkj"
>   * use co-author's real name in trailers
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 281 +++++++++++++++++++++++++
>   1 file changed, 281 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> index 48dff2279b0e9..7d7c79d2502d2 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> @@ -464,6 +464,252 @@ static void tianma_jasmine_init_cmds(struct mipi_dsi_multi_context *dsi_ctx)
>   	mipi_dsi_usleep_range(dsi_ctx, 5000, 6000);
>   }
>   
> +static void txd_x00td_init_cmds(struct mipi_dsi_multi_context *dsi_ctx)
> +{
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x06, 0x9e);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x07, 0x94);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0e, 0x35);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0f, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x6d, 0x66);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x69, 0x99);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x95, 0xf5);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x96, 0xf5);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x23);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x12, 0x6c);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x15, 0xe6);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x16, 0x0c);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x00, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x01, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x02, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x03, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x04, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x05, 0x0c);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x06, 0xa9);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x07, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x08, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x09, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0a, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0b, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0c, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0d, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0e, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0f, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x10, 0x15);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x11, 0x13);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x12, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x13, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x14, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x15, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x16, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x17, 0x0c);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x18, 0xa9);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x19, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1a, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1b, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1c, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1d, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1e, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1f, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x20, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x21, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x22, 0x15);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x23, 0x13);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2f, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x30, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x31, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x32, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x33, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x34, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x35, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x37, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x38, 0x72);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x39, 0x72);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3b, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3f, 0x72);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x60, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x61, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x68, 0x83);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x78, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x79, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x7a, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x7b, 0x9c);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x7d, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x7e, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x81, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x8e, 0xf0);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x90, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x92, 0x76);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x93, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x94, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x99, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x9b, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb3, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb4, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb5, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdc, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdd, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xde, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdf, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe0, 0x75);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xed, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0,
> +				     0x00, 0x00, 0x00, 0x15, 0x00, 0x37, 0x00,
> +				     0x54, 0x00, 0x6d, 0x00, 0x84, 0x00, 0x98,
> +				     0x00, 0xac);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb1,
> +				     0x00, 0xbd, 0x00, 0xf9, 0x01, 0x25, 0x01,
> +				     0x6b, 0x01, 0x9c, 0x01, 0xec, 0x02, 0x22,
> +				     0x02, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2,
> +				     0x02, 0x5e, 0x02, 0x9e, 0x02, 0xc9, 0x02,
> +				     0xfd, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5a,
> +				     0x03, 0x68);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb3,
> +				     0x03, 0x78, 0x03, 0x8b, 0x03, 0xa1, 0x03,
> +				     0xbd, 0x03, 0xd6, 0x03, 0xda);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb4,
> +				     0x00, 0x00, 0x00, 0x15, 0x00, 0x37, 0x00,
> +				     0x54, 0x00, 0x6d, 0x00, 0x84, 0x00, 0x98,
> +				     0x00, 0xac);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb5,
> +				     0x00, 0xbd, 0x00, 0xf9, 0x01, 0x25, 0x01,
> +				     0x6b, 0x01, 0x9c, 0x01, 0xec, 0x02, 0x22,
> +				     0x02, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb6,
> +				     0x02, 0x5e, 0x02, 0x9e, 0x02, 0xc9, 0x02,
> +				     0xfd, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5a,
> +				     0x03, 0x68);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb7,
> +				     0x03, 0x78, 0x03, 0x8b, 0x03, 0xa1, 0x03,
> +				     0xbd, 0x03, 0xd6, 0x03, 0xda);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb8,
> +				     0x00, 0x00, 0x00, 0x15, 0x00, 0x37, 0x00,
> +				     0x54, 0x00, 0x6d, 0x00, 0x84, 0x00, 0x98,
> +				     0x00, 0xac);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb9,
> +				     0x00, 0xbd, 0x00, 0xf9, 0x01, 0x25, 0x01,
> +				     0x6b, 0x01, 0x9c, 0x01, 0xec, 0x02, 0x22,
> +				     0x02, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xba,
> +				     0x02, 0x5e, 0x02, 0x9e, 0x02, 0xc9, 0x02,
> +				     0xfd, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5a,
> +				     0x03, 0x68);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbb,
> +				     0x03, 0x78, 0x03, 0x8b, 0x03, 0xa1, 0x03,
> +				     0xbd, 0x03, 0xd6, 0x03, 0xda);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x21);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0,
> +				     0x00, 0x00, 0x00, 0x15, 0x00, 0x37, 0x00,
> +				     0x54, 0x00, 0x6d, 0x00, 0x84, 0x00, 0x98,
> +				     0x00, 0xac);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb1,
> +				     0x00, 0xbd, 0x00, 0xf9, 0x01, 0x25, 0x01,
> +				     0x6b, 0x01, 0x9c, 0x01, 0xec, 0x02, 0x22,
> +				     0x02, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2,
> +				     0x02, 0x5e, 0x02, 0x9e, 0x02, 0xc9, 0x02,
> +				     0xfd, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5a,
> +				     0x03, 0x68);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb3,
> +				     0x03, 0x78, 0x03, 0x8b, 0x03, 0xa1, 0x03,
> +				     0xbd, 0x03, 0xd6, 0x03, 0xda);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb4,
> +				     0x00, 0x00, 0x00, 0x15, 0x00, 0x37, 0x00,
> +				     0x54, 0x00, 0x6d, 0x00, 0x84, 0x00, 0x98,
> +				     0x00, 0xac);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb5,
> +				     0x00, 0xbd, 0x00, 0xf9, 0x01, 0x25, 0x01,
> +				     0x6b, 0x01, 0x9c, 0x01, 0xec, 0x02, 0x22,
> +				     0x02, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb6,
> +				     0x02, 0x5e, 0x02, 0x9e, 0x02, 0xc9, 0x02,
> +				     0xfd, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5a,
> +				     0x03, 0x68);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb7,
> +				     0x03, 0x78, 0x03, 0x8b, 0x03, 0xa1, 0x03,
> +				     0xbd, 0x03, 0xd6, 0x03, 0xda);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb8,
> +				     0x00, 0x00, 0x00, 0x15, 0x00, 0x37, 0x00,
> +				     0x54, 0x00, 0x6d, 0x00, 0x84, 0x00, 0x98,
> +				     0x00, 0xac);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb9,
> +				     0x00, 0xbd, 0x00, 0xf9, 0x01, 0x25, 0x01,
> +				     0x6b, 0x01, 0x9c, 0x01, 0xec, 0x02, 0x22,
> +				     0x02, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xba,
> +				     0x02, 0x5e, 0x02, 0x9e, 0x02, 0xc9, 0x02,
> +				     0xfd, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5a,
> +				     0x03, 0x68);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbb,
> +				     0x03, 0x78, 0x03, 0x8b, 0x03, 0xa1, 0x03,
> +				     0xbd, 0x03, 0xd6, 0x03, 0xda);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x05, 0x0c);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0a, 0x81);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0b, 0xd7);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0c, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x17, 0x82);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x21, 0x1c);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x22, 0x1c);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x24, 0x76);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x25, 0x76);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x5c, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x5d, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x5e, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x5f, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x65, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x69, 0x60);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x6b, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x71, 0x2d);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x8d, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd7, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd8, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd9, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xda, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdb, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdc, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x26);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x06, 0xc8);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x12, 0x5a);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x19, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1a, 0x97);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1d, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1e, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x99, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x27);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x13, 0x0e);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x16, 0xb0);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x17, 0xd0);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 70);
> +	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
> +	mipi_dsi_usleep_range(dsi_ctx, 10000, 11000);
> +}
> +
> +static void txd_x00td_deinit_cmds(struct mipi_dsi_multi_context *dsi_ctx)
> +{
> +	mipi_dsi_dcs_set_display_off_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 50);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 120);
> +}
> +
>   static const struct drm_display_mode tianma_fhd_video_panel_default_mode = {
>   	.clock		= 161331,
>   
> @@ -608,6 +854,40 @@ static const struct nt36672a_panel_desc tianma_jasmine_panel_desc = {
>   	.send_deinit_cmds = lavender_tulip_deinit_cmds,
>   };
>   
> +static const struct drm_display_mode txd_x00td_mode = {
> +	.clock		= (1080 + 122 + 8 + 76) * (2160 + 20 + 4 + 28) * 60 / 1000,
> +
> +	.hdisplay	= 1080,
> +	.hsync_start	= 1080 + 122,
> +	.hsync_end	= 1080 + 122 + 8,
> +	.htotal		= 1080 + 122 + 8 + 76,
> +
> +	.vdisplay	= 2160,
> +	.vsync_start	= 2160 + 20,
> +	.vsync_end	= 2160 + 20 + 4,
> +	.vtotal		= 2160 + 20 + 4 + 28,
> +
> +	.width_mm	= 68,
> +	.height_mm	= 136,
> +
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct nt36672a_panel_desc txd_x00td_panel_desc = {
> +	.display_mode = &txd_x00td_mode,
> +
> +	.width_mm = 68,
> +	.height_mm = 136,
> +
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_NO_EOT_PACKET |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.lanes = 4,
> +	.send_init_cmds = txd_x00td_init_cmds,
> +	.send_deinit_cmds = txd_x00td_deinit_cmds,
> +};
> +
>   static int nt36672a_panel_add(struct nt36672a_panel *pinfo)
>   {
>   	struct device *dev = &pinfo->link->dev;
> @@ -689,6 +969,7 @@ static const struct of_device_id panel_nt36672a_match[] = {
>   	{ .compatible = "tianma,tl060fvxs16-00", .data = &tianma_jasmine_panel_desc },
>   	{ .compatible = "tianma,tl063fvmc43-02", .data = &tianmaplus_e7t_tulip_panel_desc },
>   	{ .compatible = "tianma,tl063fvmca01-00", .data = &tianma_lavender_panel_desc },
> +	{ .compatible = "txdkj,txdi600yanpa-43v3", .data = &txd_x00td_panel_desc },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, panel_nt36672a_match);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
