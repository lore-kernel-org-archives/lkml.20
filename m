Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696941;
	b=RVeMCWnf/Z8JA1Ueg4frGsNz/cCwZQiOAhnzqO0mskfqkusqCZQIZ/wEkq009fclMWmu
	 6HDvzyYEHnlWowD56lAAJUM/vxbwx/oqXqaKpQ7JrbqRyRes6W235+JDq7wEgrRC1e331
	 GLAQr0PCic8Z+ta8Iko52BbJnnoYaySjIaP8XCUsKYK80mQRHhSz4hYtw0BAtfSvKHXD4
	 Vkahrd6YUsmdL+nNbzAjY24Ssom82SwwR1PGWvTafDl5JXLqaqkwKUY5ngSljhkzrQ93x
	 i5HqVuSxGhVqpQEfZn4NrdSGAy5a8IPzqNFrvziKdAXVMBoHnuVHMUacSy8Cx3fsnQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=r+6KD6EavPTxoIx3RdmJF2dsNsMGEPhiTBNUEhG2xw0=;
	b=3vkkcasKdVZ4M9TBPq7HroKUCekTh8Hf3rTa2eIWWN3PQxSVz+AQvX1/5hBO6DCHpQYa
	 71FEiXUUafAALtsME7M9G4ordOl0bOtIFWxAg/NiBSpL4zBUuFrnUoK5l+JPuv/8E/mr2
	 paEQ9+mMupUX3Ke5wf/xjexF3S2JdRhRd+U0RXVHgji+QxyE/wlQCE4k/CC3SuQcconPw
	 C/HBJXatN7wSntCbjkwdq4u9nRC1zpIFjGtmKL0Ah2AItWhzA9C5iwepTwB5uHT0eHdJP
	 L9PF3qDh1NvnADq6ekWjgKGJfGa853jUbI5mq+RQF4xR1kIR7YcDWzMJPJokkXmwX/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qwHAKRKe;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FF0606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96FF0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qwHAKRKe
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c5358fc28so3161995f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793696939; x=1794301739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+6KD6EavPTxoIx3RdmJF2dsNsMGEPhiTBNUEhG2xw0=;
        b=qwHAKRKeL0gxsxvUga5R6sbSY7XB605sAgBRFLiF0xeaaKABYi/qpyGE4IF4V8XpYI
         TgNnTG4G/sGbNNq5yNFo0T8crh5+8FZBPmX5kZTn+ZspRLuTfsAWC6SITiFkoMywwZe8
         hBz+N2sUnXMMNC5jhGzN+j20k9MlCJFSkkZHQUbCwC2oRS+5anVqdVwZz0sX0HZt6x6O
         +DBIkwaBQhDQsyYnOM9qgS/CZDGWYQZhSJ2Ugqm4Uuiv6Qm8UdoUOf+ZDv2JYtaDMTz9
         WoCZsRx8JlvtZ1dHUVSFFdDc0rh4q24IuaOCHVjz/D9BfjJZZ7Td8Fvev65bXsyL/xRU
         m77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696939; x=1794301739;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+6KD6EavPTxoIx3RdmJF2dsNsMGEPhiTBNUEhG2xw0=;
        b=EDGqPD1ikf4CG0ZoAt5ZOqTV+pbviX8QVOvd2Q5OhjiLfENtBv6aq25Gyv3T23vebQ
         zZyZe0adJuZhU17s132vwl1xev0rPaa1GqzZf5SPVF1Hj1aKRhSZ449haB26YqHupsMs
         L/CZT8yI7RvlW/ZaJ84pb21csu6uQVpA4nHRNnBRxK36kvTkh8xv1jtVnwA4/UzuEn5i
         HKDfElQYHGZWxb6oO4wQUzCIDzmA53JKbZZWpc2APZXb4YySxe7A6xeAiEEaN/oclnSQ
         BPjjIuIE71kYqFuyH8Pdltwa+vygToppjJQ8eggR3UX0Csf/OBPhKmQv5iUUOurUeRTV
         etPQ==
X-Forwarded-Encrypted: i=1; AKwUvByK0TDtygUdm80nfGTBV1bRXzZKNkuCcKMA7FqkZlMzFP2VkC+YxzeMiNxM4CuKnWAqcPuMgt0R7LvL8r4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9smlHzZD66WWGP/nYTMCEqmwPsQVHxcbvwgnmJX42I6UwcbXnD
	inMkYuDDROgqWRaABrImLwGxADEunBSpsALmQN92qIbnOihibE59kwAryhT2xfhQ8fg=
X-Gm-Gg: AYBFou0B5BoioWcHRV+ZJTxuxb74iPmHwnFrjzt5egYfmfYtjfRcd2xI5zc0UII29nT
	QPott148tGN5vZyPsTvinA7/UwbifrEMho5BwZGIldRxww8Bf01lxfHbxizH818PyFGtbRqR58w
	9LSjvRzwAfHqUtvAssn23FmvYHiT+I+fhRP+WkE+1gxEXoX7mLszKNzy2DW0HCXYfMn0T6GhoqE
	DkOGER3Ere/dJ8WjQipbE5GoH4KYHdCOHtywxeYGelbfAd6jJ9G7WDArBmKtHHQTnQHLqzyF8Bj
	X6FlfEY7hQOP7qRMvNKW33rRfg0+uN18D+tJdZC01G4QpsjHSpMQUm7jtHIz0iUITRCA02Cj0VB
	JfuAiserZXWfD7lgvuq/nK2KuNlaN4x0fMasY9cZFQ8bTL/opepIdw/UGtZxOD/4m5SWOZbMk1M
	bV2/k8wX/SUoAj6aq9JZd3pyQIVSsIuxBsdgCDqiP+hEciIHZZw3mTAyPcb78MXpAyZi3uw/Y8S
	h3RXpgje8W7KjecIAcS+YPsJZNYyPQos4Y14N/lZhJ965jPQB0Kbf8cY4PvnJ0GL5jwIdyv18BQ
	J13yHBcXGy8D6I63+BNWcKM357lEii2vd15Z0Ch6YRrZVaOah0dKC4ehw7llBsRgu4Fs3dyjd5u
	5Gd7X/DTK
X-Received: by 2002:a05:6000:2213:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-48e6e3042d5mr27695053f8f.45.1793696938764;
        Tue, 03 Nov 2026 01:08:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fbba47a32sm717115f8f.1.2026.11.03.01.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:08:58 -0800 (PST)
Message-ID: <054d99f5-3364-48c8-a5ba-ca2faf745179@linaro.org>
Date: Tue, 3 Nov 2026 10:08:57 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: amlogic: clk-measure: Fix AXG HIFI PLL name
To: jian.hu@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261027-fix_axg-v1-1-741388f1e851@amlogic.com>
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
In-Reply-To: <20261027-fix_axg-v1-1-741388f1e851@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/26 09:43, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> AXG does not have a GP1 PLL. Clock measurement ID 5 corresponds
> to the HIFI PLL, but it is incorrectly named "gp1_pll".
> 
> Rename it to "hifi_pll" to match the actual hardware.
> 
> Fixes: 19e0bde7bf6a ("soc: amlogic: clk-measure: add axg and g12a support")
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>   drivers/soc/amlogic/meson-clk-measure.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index 33767f0bc67c..c1ffa2537464 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -182,7 +182,7 @@ static const struct meson_msr_id clk_msr_axg[] = {
>   	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
>   	CLK_MSR_ID(3, "a53_ring_osc"),
>   	CLK_MSR_ID(4, "gp0_pll"),
> -	CLK_MSR_ID(5, "gp1_pll"),
> +	CLK_MSR_ID(5, "hifi_pll"),
>   	CLK_MSR_ID(7, "clk81"),
>   	CLK_MSR_ID(9, "encl"),
>   	CLK_MSR_ID(17, "sys_pll_div16"),
> 
> ---
> base-commit: a848d72aab71e19ea78180f2502ad7d12818723f
> change-id: 20261027-fix_axg-9a1226dd4f1d
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
