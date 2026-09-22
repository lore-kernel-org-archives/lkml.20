Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4575751596A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077594; cv=none; b=jpdtGTi7aaFPn7Gs0mX37GI+KyLUUkJmBMcODXkGe+FgbOyt/VchW8hN23/6tSobwaULch1ioqPBrSkJxhGBnRW4+7tU8s/k0tb1UKzb7yvnvc9EAi0SsGEOkUesA5csPVTOR08Q5GcElaRNW7Qa6AxSqg/3AA19zgtvroMlVrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077594; c=relaxed/simple;
	bh=M3Xr9iBMhROimwBT9eQQeQt6rCOhgjqnmrhUoKcVfnI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AGesgKBd275hrKLVA9YCe7zMftsPRgGK2F5xPD9VX675GSO57YEmU5zWx+/XJxs1eWwqYiN6Tg1C5KA93RQuG6l0fu54StEpeunZBPs8JlXYqAu5TsWWpJwDdpRqtqJ/a854mBo6tLdUDBoVcYO/LFbGSdR1VuA5fmgV+7HaGVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hCPqAcWq; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hCPqAcWq"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so1949531f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790077590; x=1790682390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovAKBw15uveBtm1L1gdlFwDkGVI31wzX0RWiaJj57Zg=;
        b=hCPqAcWqhmGtvbbP4WxZQam+QdzZuzmX6+hCpv2eHAbQnMmPRz6p3OmqgW3vGpjVFv
         y0eFjBjvvIE3NaQFiNV7mg6mL9sgGPMBs1JN75IN9/DKeGV3xEWLK/4R+tJCGSpHGgyL
         xBLLw6OxEbIKsR9RF2CW7HUBx9TGFnwPYBycTW8+YUZajQs40FFUHIsq9q8MfxI+Af2f
         GKMjyDPUKELiVqTuZus5UaXcev+S2lNbSlw8i4hQ9//PJ5NvzCvcngG5rcwKOIoAgg7H
         EDOK9Hrf5Z+WalfAJSmaN4TNzPfvDmcpWeBMK2yrKgF6Vi5bSnDptXVNakpE40YwhJ7d
         OjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790077590; x=1790682390;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovAKBw15uveBtm1L1gdlFwDkGVI31wzX0RWiaJj57Zg=;
        b=BYAbfMS0W3nrp2j8sUWO0FKMooJn5nHEsg4dL8wSUNoTugapao2IYSojHNOV14DkHF
         Z6J8heXZY8FljVAQg4eVfUo0IFKtttFAVeoxhFcqtowvZxm7op6Hir0zARq3Co8I1xli
         R6qYfqNIsIyQEd+7j/wDueoJGizxfCu+Miy9Fydb8j/NudQW42M5yDSrP+EI2LeQmsak
         MIQyrmyyDif8PV3zCk3fSzet547Mz/CRq49yRK7QHb9GyHmbRe1Og92k/9mrIk/lUPaX
         HeX9Dmj2KLzUx91TOdG6yWs8NjU/mQo3m22NvKjkS5EOgNO48w8qEWzvS32qelic20lr
         zemA==
X-Forwarded-Encrypted: i=1; AKwUvBxNJZ1z+hkJER4v9DCwkLS206Qjobq755NnoDtjJlCGYfTUn4qZJAGpOw+P+qw98DAe9sapUwrUfL9HaGM=@vger.kernel.org
X-Gm-Message-State: AFuF++kpVFl9VMS5asENgkQP3WJ3qDw6gOFSwlcRlQsk8YfIxsEmBPPz
	/4ugCS+EbSWC/lDIU8WNi5JDkCjVAH36RkBsixEnoazpr2o7VLoCAjUIscQ1TgM7nrg=
X-Gm-Gg: AYBFou0flL9ZBR/Gb3/aLMOyrLlQWAkln8gNxUiYPO9GT9LgRdB+s1R9kBx4knlv1n7
	uWTp7Rm3IjIKoOit2pyfGP6dK3qGrFZjkywe9VqIt53ROdAeg2MFx5K4NrLKsuvko2DdSl0zbln
	CQYcwDCBkE4bqOFGkQROQbreMzBnaOcnzl12k1bSqOCsz7mY22qcesWFZLQqKbXF+kKvYYP/pJz
	U+mfmFHXiG9z4Pmi0ypRVzkAiAUo3JtUOLHr+7e3Jpz3iQmvBHsSsUo6h7Gc41oax+re/y4JsR+
	v082kJsZZTREYQqouB00YJpHgMFWrIgnV6GQ7DISsQQlWGZDOetvKl81NkLCeaugc24GMCT//iO
	wp5bYe3zFAPzbH0X4M0lTxH8ssH+Amds3EtbLQ7NN9Bnfn7bgiGbqZw/hCmXBIiSdwIUwG/79zb
	HiRu088jt7Qp5ATzudFgVyNOjWnrEIcWR+8ClNH/EeLwwrjbjcDa0vTeRca/geMEwHmfSBNjMop
	y6Ah197HZc9PqJ+hOenlCU5oKSDjEn6lgTbETB3IY+dwTq7nY+V/94=
X-Received: by 2002:a05:6000:490d:b0:485:8a47:5b91 with SMTP id ffacd0b85a97d-4871e36cb87mr18628350f8f.46.1790077590353;
        Tue, 22 Sep 2026 04:46:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ddd0:8cc7:9887:fa82? ([2a01:e0a:106d:1080:ddd0:8cc7:9887:fa82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862774543sm5000820f8f.11.2026.09.22.04.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:46:29 -0700 (PDT)
Message-ID: <b2112da7-dbb6-49fa-ae10-b9e4d47d4495@linaro.org>
Date: Tue, 22 Sep 2026 13:46:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Add initial Valve Deckard
 devicetree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org>
 <20260922-topic-sm8650-deckard-initial-dt-v1-2-c25e7759d04a@linaro.org>
 <bc3d3df8-a2dd-4ac5-8064-d54d4eaa3f6a@oss.qualcomm.com>
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
In-Reply-To: <bc3d3df8-a2dd-4ac5-8064-d54d4eaa3f6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/22/26 13:39, Konrad Dybcio wrote:
> On 9/22/26 1:28 PM, Neil Armstrong wrote:
>> Add an initial DeviceTree for the Valve "Steam Frame"
>> codename Deckard. The Steam Frame is a virtual reality headset
>> based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).
>>
>> Providing initial support for:
>> - System reserved memory, regulators, gpio keys, PMIC functions..
>> - PMIC ADC Channels
>> - UFS Storage
>> - USB Gadget
>> - WCN7850 Wifi7 + Bluetooth
>> - I2C + basic peripherals
>> - SDCard slot
>>
>> The bootloader starts Linux in EL2, thus a bunch of EL1 & DSP related
>> nodes needs to be removed and the reserved-memory mapping must
>> be defined.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> [...]
> 
>> +/* Remove nodes */
>> +/delete-node/ &ipa;
>> +/delete-node/ &gpu_zap_shader;
>> +/delete-node/ &lpass_wsa2macro;
>> +/delete-node/ &lpass_rxmacro;
>> +/delete-node/ &lpass_txmacro;
>> +/delete-node/ &lpass_wsamacro;
>> +/delete-node/ &lpass_vamacro;
>> +/delete-node/ &lpass_tlmm;
>> +/delete-node/ &remoteproc_adsp;
>> +/delete-node/ &remoteproc_cdsp;
>> +/delete-node/ &remoteproc_mpss;
>> +/delete-node/ &reserved_memory;
>> +/delete-node/ &swr0;
>> +/delete-node/ &swr1;
>> +/delete-node/ &swr2;
>> +/delete-node/ &swr3;
> 
> Hm, maybe we should think about sm8650-audioreach (simialrly to
> how we have a split for the kodiak variants)

I will probably go in this direction when adding support for audio.

> 
> 
>> +
>> +/ {
>> +	model = "Valve Deckard";
>> +	compatible = "valve,deckard", "qcom,sm8650";
>> +
>> +	aliases {
>> +		serial0 = &uart15;
>> +		serial1 = &uart14;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +
>> +		framebuffer {
>> +			compatible = "simple-framebuffer";
>> +			width = <4320>;
>> +			height = <2160>;
>> +			stride = <(4320 * 4)>;
>> +			format = "a8r8g8b8";
>> +			memory-region = <&framebuffer_mem>;
>> +
>> +			/* Bootloader will enable the node */
>> +			status = "disabled";
> 
> Is there a reason not to enable it? Does the bootloader prefer to
> only enable it sometiems?

Exact

> 
> [...]
> 
>> +	reserved-memory {
>> +		ranges;
>> +
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
> 
> it's usually:
> 
> addr
> size
> ranges
> <newline>

Ack

> 
> [...]
> 
>> +
>> +		aop_mem: aop-region@81c00000 {
>> +			no-map;
>> +			reg = <0x0 0x81c00000 0x0 0x60000>;
> 
> 0.dtsi

Good catch

> 
>> +		};
>> +
>> +		ramoops: ramoops-region@84a00000 {
>> +			compatible = "ramoops";
>> +			reg = <0 0x84a00000 0 0x100000>;
>> +			record-size = <0x40000>;
>> +			console-size = <0x40000>;
>> +			pmsg-size = <0x1000>;
>> +			ecc-size = <16>;
>> +		};
>> +
>> +		aop_cmd_db_mem: aop-cmd-db-region@81c60000 {
>> +			compatible = "qcom,cmd-db";
>> +			reg = <0x0 0x81c60000 0x0 0x20000>;
>> +			no-map;
>> +		};
> 
> Likewise many of these reservations also exist there

Not sure slitting this would be worth it.

> 
> [...]
> 
>> +	/delete-node/ smp2p-adsp;
>> +	/delete-node/ smp2p-cdsp;
>> +	/delete-node/ smp2p-modem;
> 
> I think these shouldn't hurt even if your usecase is different

Right, but those describes a pure firmware interface.

>> +
>> +	wcn7850-pmu {
>> +		compatible = "qcom,wcn7850-pmu";
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wlan_en>, <&bt_default>;
> 
> nit:
> 
> property-n
> property-names

Will fix

> 
> please
> 
> otherwise looks pretty good
> 
> Konrad

Thanks,
Neil
