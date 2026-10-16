Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A2E3D9048
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792133359; cv=none; b=OYBE8/vfsle6WDoxn+9Txlgzk8tVhQeK9ErXi9TWEF+GLO22qeePu8mTfzYAIECrYnYV7aoqQpzCi2+I7TPqJZPUyePbXhWZjhCrc8+1wJBGSXItrQt/yyYGwkznnWSZTb+TMbmkPSMDym0pe7mIXDe0pBD42YiU0HaFuLmVIUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792133359; c=relaxed/simple;
	bh=s3anJmAF71SGOdbmyGVbZpu/vKmD9EC36nXM/R7mmiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s4RKGhFk4BFKmJSZkvCpHKE6PD1lxWRhPQSDrl2hL1lFIgpJdh7xzrH4Xt7lWnKeP48DxVqasY0/ZCVrdIPtnQ1glHx6aUTWzMNg3QcKZvDfgacYc3yy1m3uHe38Kx7YMDfw59OKrr5pJXP1og+cJhFAtJ1Fz+HdxR4olcDJQzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PcpeuoIF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PcpeuoIF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso23065155e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792133348; x=1792738148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjYKa8DIKuvjh+VVUAQH4onZZeigp/qLBTebXWbeIHQ=;
        b=PcpeuoIFPtsRL4dqinUQmmo6dMRrYt2Fgl8fSYal0jWsFGDN01mIMJsKSFkr4FxCzB
         aXe/Z192qqQ8zD9hDv/6lpYKmqZZUBfqnPVdc931mPvQ/U4x9czwDjDnByiYwqkJ5mQ3
         IPqsEVX/xUuG2ERYzgWvsSrpn0yfvJGD8ZxAOWP6fxMVDRbuYKfgtggN/eljsLKpaDBw
         yZjNQZ8HjEPMuTIuxqG3h9YYJ+XBgdKBvcDjb/G473l2GxAEU6InHXAYvbkUp7CJT4pt
         zFMg/yl0Rk3lfgPCLpXR3Yc3eaDxDp9y3Z0YlIFUlUE3fhA7ir88OuIpoPRKA3EqjrB0
         QI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792133348; x=1792738148;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sjYKa8DIKuvjh+VVUAQH4onZZeigp/qLBTebXWbeIHQ=;
        b=VLVzDTbZpz2UWO2Nan1XzzgQtjuNYGgqSCaT7QOBbogEev01Mg11lJJwTRCHXbM3a2
         aVRLomdj7RI4F+c16nplvsRUEvc2ZmXt1oEKnrC6uc8aDt5dylX0KyGYh338II/muBiK
         GTVxK+XnKhIIQdjoBIk4LIp6LNd7l64wK9GHllbbPLQDpg65I0nup+r8dTq0QvVjs/IQ
         nEOf56xWy1/J2/8EttaGnrUkhZCOwq5NFt920sUnc/UBq1JsFodZBQcyo1ddO+3gIHg0
         X6R8UcgpXcV7jYdLF5Zp69T2i+ZWYDB3Z1OcA/LuRTxpn5Bv/2n6Tyl7iJKOIlclY9RI
         QCQg==
X-Forwarded-Encrypted: i=1; AKwUvBwHvobyD1Vbp/fFvkoaGrvxfEiXD5Py/9vaCkN9IgiCBYB7oisTz52wfr3X6nYDpZkF8MlkfAAI6iAkftM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK96rzK67zdj3XerNUUpUlMd3ahb2L/DhGMJlALsLUEVpatvVT9
	9ejkrsGhD/wxaTfjgy1Rl+MWVvpo0TxeVVjjHjbUoJPiF96X92S4jYj7CHpCCcKrIbo=
X-Gm-Gg: AYBFou3B/Dp/hM3GFIXCfudCRHsV/JQi8F65a0g+fJTkpRMvoCLJK//PVi71xMJL7YX
	czt6oRF6POMgYXtVYd4ShhJ1nKMK5vVm0tr/qrb7d8miNF/bVWj5ptbmGQgheZOey8ZCpdmMGAz
	6LRoJ2ZU4mGA9f4Wt3oFIJPnvNlLXXKY1wCH6spEI20ZtVt24J9yHaXYpyJBTx70C51+32EqKCN
	0P3H6aElRF+R+Hb/jXSwiJQwAaYc5FYVtulLf9ckwoOjgyyUhCMMx/SujK8dSm0EZPOhbmclZG6
	m8RyPQ8+oz00IR/NDDYUhKYlIfHrrvKWcyfjIWOe7zKF30WAwt9TVqd+W3TYyg2Tbr6oUCA5vo9
	PcfPZoQeyn0+0i8pLm6tML4Z14n1J1zic03XwgW/kdIa/IMlt52nBjXBWvg/wU9SwG9/xcXoZHU
	Tatghnag3xOR8CUSkt88+ufrp2vamALctW2XGieMxAN3V0oCJl35Y/UmKNbRt6uSZhA7kcOSpiD
	Ls/osJLslgkpOcEbsDzN+ClSdUuoSTSWDGButY9atEfN75xiZ1I9A==
X-Received: by 2002:a05:600c:8106:b0:4a0:c02:938c with SMTP id 5b1f17b1804b1-4a18e4d683dmr439002795e9.25.1792133347816;
        Thu, 15 Oct 2026 23:49:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3de7:deff:62ea:d0f8? ([2a01:e0a:106d:1080:3de7:deff:62ea:d0f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8af3f8dsm33220615e9.9.2026.10.15.23.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 23:49:07 -0700 (PDT)
Message-ID: <bdb9fdd8-215d-4220-8275-5fac170ed71f@linaro.org>
Date: Fri, 16 Oct 2026 08:49:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3] Bluetooth: hci_qca: disable power control for WCN7850
 when bt_en is not defined
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann
 <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
 quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
 jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20260324023016.3889062-1-shuai.zhang@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260324023016.3889062-1-shuai.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/26 03:30, Shuai Zhang wrote:
> On platforms using an M.2 slot with both UART and USB support, bt_en is
> pulled high by hardware. In this case, software-based power control
> should be disabled. The current platforms are Lemans-EVK and Monaco-EVK.
> 
> Add QCA_WCN7850 to the existing condition so that power_ctrl_enabled is
> cleared when bt_en is not software-controlled (or absent), aligning its
> behavior with WCN6750 and WCN6855
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
> Changes for v3
> - Add change history.
> - Link to v2: https://lore.kernel.org/all/20260319075125.76539-1-shuai.zhang@oss.qualcomm.com/
> 
> Changes for v2
> - Expand the commit description to include the affected platforms.
> - Link to v1: https://lore.kernel.org/all/20260319031040.4096297-1-shuai.zhang@oss.qualcomm.com/
> ---
>   drivers/bluetooth/hci_qca.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index c17a462aef55..4512ff7cd0c0 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -2484,7 +2484,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>   
>   		if (!qcadev->bt_en &&
>   		    (data->soc_type == QCA_WCN6750 ||
> -		     data->soc_type == QCA_WCN6855))
> +		     data->soc_type == QCA_WCN6855 ||
> +		     data->soc_type == QCA_WCN7850))
>   			power_ctrl_enabled = false;

This disables power_ctrl for WCN7850 soldered down on the main board and handled by pwrseq, which is a regression.

When pwrseq handles the QCA_WCN7850 qcadev->bt_en is obviously NULL, but qcadev->bt_power->pwrseq is not.

The test should be `if (!qcadev->bt_en && !qcadev->bt_power && !qcadev->bt_power->pwrseq`

Neil

>   
>   		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",

