Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0201619049B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788095086; cv=none; b=e5bd48n/TpJoEKVVPaeQUfu/hHpWU5FDa5XweN+o9HZ2fqwV3+Mhq5F4m+dHSYXtqytteIB7Kwhp0qve38PapAqEPTQCi0o6dsupwEf/wjyYWh07uCxXkcsXPeVUx4KwywjMnIsc7/L5wvRzieaDdrBSCMOAF3dkCt8I32wXIkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788095086; c=relaxed/simple;
	bh=Lh/QdKDKUhi+nstzx0NETNDyYUB5yLFuyQqV576Cz3g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=csvimfMVnWmkLmdaC5znXhs/yo2M3eo0d9rkByGOLuCAjVAgE+RUpoiaJNpKOqcCTwbDDAwJ6mq96X9lkRVl+/29d0SsW+UjQP+0vHBeK6rQ0LCN5RRZqEoKRIHPh8SM64qoO02lZ2mpvsn2SbZuh0nx5XIOGx7a2W3udvU90v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d4w1cqA8; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d4w1cqA8"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48433f36a21so600336f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788095083; x=1788699883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGEZNmWTNMZMXanzrEPwQbHM5u7d/Ry5Or1T+0Vsl9w=;
        b=d4w1cqA8Gr2WlVB/J3GPJJsnw8be1LaomneXeoWWY1mIon5XW+OKErMadRhdX62thc
         vs3VNPhbyUTMqFZSD0mA/VHmx7c+Jh0WPClnIRs9RDCakf249XJ13gd8VDofk+SCXULb
         AM3MbV1wold7gcst4oHsNbSiCB4ezdQr7EfTsDd3TtcMrZ5yC2Bos4UGqzKl/nbvOCGV
         zRGWpn9th4QIjrybtS9vV4JRURoKDDm7KWDaYKkxH20VyjFykzI/dgUZeWt9z4ZH8pLf
         GtKcSOPMbdX9MANr5BN1cq0U9zIsfcfY3sdg9jHtMk8SkRKnxwRPzc5L+97zth+yaOXI
         LiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788095083; x=1788699883;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BGEZNmWTNMZMXanzrEPwQbHM5u7d/Ry5Or1T+0Vsl9w=;
        b=BYrVlMxvJTI6iUfWW4GgRtJ2PQxxR05S7kPx4Ui8kbwmXvFFg2lfouzu+k4l8Ux3yf
         4Kj3grhNFseFJG5F1siP1bMqc5piQPffXuiXqjFHwXPVPvgWNzvpUNFskD9tkkDhWPSp
         biUbW8WS4ox52KD7aUIc17XQrJ8C1Lzo1z/eUP1TaH1Nhq4N4ox5sB289Q9fnRhGeNDp
         WTKZ+nviYOnkBsiBJgzX9yfd4a8LIXJ1DlbPTEUCCbC1nRNyciym4vch1Y1IjqpKm6B6
         Bgp71pHs0zQPBnYrXMg/CpkQRlBkkyUCLL+2KrUsWOiGgtZvzkTDqKFAo2ypxGSri/+3
         rvmg==
X-Forwarded-Encrypted: i=1; AHgh+RpE4W1M+irK+D325o5vbwB7U9G0Vuj/rNJ0FvnCY1cdnzXaAkb3z+i7PJYIj2WJlg4hQIQ5yoyjKx5fuu4=@vger.kernel.org
X-Gm-Message-State: AFuF++m9OgNwZAdQ5H2ifqERiZdDmvWOSn6KpcVuVb1lX45c6lTk5WCm
	0u5pIhf9OiCSRI7Hdp7+hf4HuNV6QBL0FfLkXz5gqPdoPEKFnIt9VVnL6Ey9fZUlJNU=
X-Gm-Gg: AR+sD11xOMiTtEdfe81BhazP9PSsh0DG38r5ItIskce6ovn2J3hbWkEYUbwVer5YVLw
	X8TrEiYEZdsV51ql7HMTrGEyVYQpwEmUr13kpsCIuoe36c0ZsnYUgX18/Mo6B0DG+nSVNgvkvbd
	M16K1mTcHsrtBGvgfJCAMcLLmMSbzbL5BA8j/Gvev8xTDpwBaDfXUiNrIzf0rnSVjK6k8KCQJJZ
	jvCxiNpOL6ThLD2R7E3wL046MijdQGnbHIMqICk9fw8ZywQD4xhaFc18De0iEK9Ct9zYvQEVWu+
	Abz2dgyRsGxFL6MNWQtQ4/4z9E39hahoQ38OMGXAgGOYIj9itpoQuJ9NRDtW03ioa0dLyreZeZA
	jLFRqjNEfPRBADvYdIovg7HsBfTa6pUt52r6vK4cRF+gaWFJRpyChKyWlyaN+J4SHWv9pSNdsex
	LIJi1iMbIp0VQPjnw1xGwgvBR3BcxoptPUDjO61gfKcIVyavWyigqouJVcF0DTdqudpP1p6hxu
X-Received: by 2002:a05:600c:8b63:b0:49c:ced9:ab7f with SMTP id 5b1f17b1804b1-49cd53c438bmr35600565e9.8.1788095083121;
        Sun, 30 Aug 2026 06:04:43 -0700 (PDT)
Received: from [192.168.1.36] ([83.214.235.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95018ee8sm205342395e9.15.2026.08.30.06.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 06:04:42 -0700 (PDT)
Message-ID: <d4ba8298-fb80-4fed-b1ce-7fc5d0adf5a0@linaro.org>
Date: Sun, 30 Aug 2026 15:02:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/4] arm64: dts: amlogic: t7: fix the pin groups of the
 vsync PWM
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>, Ronald Claveau
 <linux-kernel-dev@aliel.fr>, Brian Masney <bmasney@redhat.com>,
 Chuan Liu <chuan.liu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260829094758.23248-1-tanure@linux.com>
 <20260829094758.23248-5-tanure@linux.com>
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
In-Reply-To: <20260829094758.23248-5-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/26 11:47, Lucas Tanure wrote:
> The vsync PWM output can appear on either of two pins, but the
> description named a single group that does not exist, so anything using
> it would refuse to start.
> 
> Name the real groups instead, one entry per pin. No board describes this
> output yet, so nothing changes today.
> 
> Fixes: 2a2a7b9701a7 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 8c4bd683cce0..719e111bc3dd 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -546,9 +546,17 @@ mux {
>   					};
>   				};
>   
> -				pwm_vs_pins: pwm-vs {
> +				pwm_vs_y_pins: pwm-vs-y {
>   					mux {
> -						groups = "pwm_vs";
> +						groups = "pwm_vs_y";
> +						function = "pwm_vs";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_vs_h_pins: pwm-vs-h {
> +					mux {
> +						groups = "pwm_vs_h";
>   						function = "pwm_vs";
>   						bias-disable;
>   					};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
