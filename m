Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396023E4510
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047442; cv=none; b=k36zvswTS04JlnwoF7qPGR7twBAbzBvgHNuZb3OoTX+8d6xNNrHHA9W28QOP7OrMyOg89c0GBabQ4a7GjDbAT45laJsVu+v9CJ1XVJx4tAfs3rJbA+oNt3wbZ20ImQ7prBltIeHOBxL2O5wmhXQGKGkKT+vbO6+0eU7r5NKBfIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047442; c=relaxed/simple;
	bh=lfcTX4TL2A22VsA7xIY+rPkefGCSN06tu5AGdvEz78Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYzNYyr+KvFEqAFA34lofzMKUIFZt/n4RTx+HZYxTZFx31FWZfQjxaQ9PlUbqqn3s2wduoxMQ4fM5QlQdOgNInQzxzVcOgQuHY3O0hVBBBq4TLPvBIUySoQU+quibDJmjSVUCRyT9K8NH8F+bC5T6HEpZfmoPA30elhHviJlAtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yo/5mabD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yo/5mabD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482ea739de2so4816847f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789047438; x=1789652238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MV7aOFJWyf4fVQJnUJPY31C9vQENrTENQEYoiqtHwng=;
        b=Yo/5mabD1Z2s3VdL128GtIqoAoDG1XV60VvulKWLvS4wwo0z+Ekr7ylFTr8vVsWJ6N
         18UaNvdT6D1Tq8m0lkb3vsMecxvEsBmsJ77kAVwZo8Tw8ko/pB/5q1jjurWLvHBleqrC
         Sx0jR8inAcSXRMeiB88b0HvHIgcGkwaId6AF0FrJeLGPyh+t+zpMa2olPX80z/8tkkAA
         pdswLcAMPd1SMfSIlwUwq2i3J4mPhJQynvBokKka4RWQ/jR03wi/Oh4TaDk75s4HYLjy
         DYQ89pk5vKaCWkidUl3pkHLLuQldV+3cdbtPNENb+6+gQsnFiFSvexpSpo5I/Yavqxuw
         ujmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047438; x=1789652238;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MV7aOFJWyf4fVQJnUJPY31C9vQENrTENQEYoiqtHwng=;
        b=nIgqCpqiBoq5SXhv2PhUMxCxraCQ4pNu4m6VEobH4YDAOBa42fbT/2Xe5ZsB3ICg5l
         wI6uNEhwmYKk3sJtdOE/qccqsJWXOmfGcVq2HbheC/9gxaC/334CtHZrPqiHiLMY0OxP
         cikviVsRqT7YKICj79aTcj8TXRslJTfIJYig7f39ep4P+iPYH6PkoM1mxY9RGogfJMS/
         sAiX5ODK8WjbPszzPXghdqlpVQ0vF/gevEfS8iSUH2BVdS6jUWzXhNn+in3hJ/Qmgm2S
         AeRQm4AccDhf4aws6ioPTqbYEEZCfEyCVytMxtDmd0AaWzkg4IC/ubXXLrDTaPVEZa1f
         oYsg==
X-Forwarded-Encrypted: i=1; AKwUvBxuH2STYeU6Q17HppW9PjSVAHwGCkmgaufJHyit4DhgQkbbMX/lp2abWOpaTM6MNyQrsCv/34YSKQk3scI=@vger.kernel.org
X-Gm-Message-State: AFuF++lBGGaVmzFPs5+OT58exCVpy1mnOtmr3GHe0WZ5cdj3zEbBlZkZ
	T4ocEOvsuW6DD/rsUidq/EBePC6M0gAXo2E1Z6R0hdBczEV72VY6PJeCnPF72ohMHUs=
X-Gm-Gg: AYBFou1Nb3MuS6hmIFZ62heKdDuvfGhp8uCFz8eSKIJabX7q+pPqrX9YIaD2pulgOa8
	vM7rY1YMzI3EkisZ6InMJ9+vEnX7BeNQa808p8V2XYubMqzTau8E2kj1H+DYb/WcVvu5HXKud87
	rZirL9DW9djNUwmw8bDyyhFDFYjrEEV4dGJp5LMnJh/+Ow6X4UpA79AJhPfsvXdTfZov3zwM0v0
	F9QD3c9pxNQSKwqmiWzTRFfyUtMUenZ9JhHGBTjdAoOocQJN5vUwyjfRnDios41RHnJn+19we6s
	fjo3kgQzmpzByAuhU9vXvcfUBx17mnMphxuDJAXGn0uJ5D7MBbmoIojRe08pMh0ti4AbzHxpjTB
	KVx/8a6GlDp+QTuX9WkRBKOL6v08zzbqB9gV639tS1zGa1RSvY9081UXWLKpviP/Ape6H6uHWyk
	2j6zQxtumny0mFrFZD4g4SUI4MrmCBy5sDnJuB11mrNtMObsLlPzxZ2XnCFalco1b7xXVORwHF1
	255bmNiRpcbf0/n2xVTg32efX9RZzxzfI6ZwzLZqU6eOgeP5bZvIUtimxfaXTEbNQ==
X-Received: by 2002:a05:6000:22c8:b0:485:8fe2:ed95 with SMTP id ffacd0b85a97d-4858fe2ef52mr36331221f8f.18.1789047438281;
        Thu, 10 Sep 2026 06:37:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:edd1:1b07:ea07:35f2? ([2a01:e0a:106d:1080:edd1:1b07:ea07:35f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485aa2c9acasm15339035f8f.36.2026.09.10.06.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 06:37:17 -0700 (PDT)
Message-ID: <6da75e1e-674f-4b4a-8070-ed6ea0d183f4@linaro.org>
Date: Thu, 10 Sep 2026 15:37:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 29/34] arm64: dts: qcom: sm8450: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-29-90a252ddbbfa@oss.qualcomm.com>
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
In-Reply-To: <20260910-root_port-v1-29-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 15:29, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to the existing pcieport0 and newly labeled
> pcie1_port0, allowing board-level overrides. Rename perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 +++++++++-------------
>   1 file changed, 9 insertions(+), 13 deletions(-)
> 
<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
