Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E65718859B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047481; cv=none; b=pGGM4TVhogc1QRMpBTI4RpEAruAIp11FpaXTRd1RKQ2ePjwW/pRFvcb4v+3jTFkhEdHmmBueBk6FUoypfYdXJ27r01qLNUBOMUtiVmqgTR2F0RSpD67Fojb+A4hX3fpkQ61TvNp+/hXe9wk8h3IQE8uDzhaKpy/xSRjBRJWlDLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047481; c=relaxed/simple;
	bh=qWV4F0jtQUrwquRceETKua0ug4DKPai48uK/+HVxo48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgWYxnqJEQXqDY/f10iXH5/Mr/ATVGcLyj27tQtjSgVGb0enf/cJP9NYykMxspvKQxy5GBrQdXVyxcHnGt6AnSnkdf/lit2wIByP0dLD2ynUMhabyilldv6uuMyQZqL/cSQ37u72UJWm+x5VyCS59vVYxacWHnOsk29jMKaDTE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TnSC+Eb8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TnSC+Eb8"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so51071305e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789047478; x=1789652278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSgviDKN/LY9jON+NF27RedkCnDOlNiU6ENgKgmxVRE=;
        b=TnSC+Eb80YTNyqJ4MDKOSuzSrfgd5stzkgvIci2WXgN+vcfP12rTWBfo9QYZ8nJdwn
         M4YP3hYlBw1dzjEB8piDPn+pZVM7negTrh5guVT0i6lwUCM+Ay/0B/E6SwNp1YuwHbm6
         Jpm/djTZyJwCnmAlbvBOXIbvoLfClpYIWJJQZpdY05LOiJ0/0Hue4pgc160YpR78s65G
         5AMr1BFNUAbecgSzR5dnwvIrRo1EZXZuBUE41xM8q3gCqsy3jUlcuL8OaogY8hCYSy8F
         xIhzJKiUiFjYcwQKCIFl6AxA5K8fnoWHxY2h4+zhfUbeS/G4o8YJ0JBA0gP1sKW66suM
         owoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047478; x=1789652278;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cSgviDKN/LY9jON+NF27RedkCnDOlNiU6ENgKgmxVRE=;
        b=T6HM6cWr2D03L0BsGo5kUMauI4+PB08NN1mMhIz2M7gutubJ+yUZjiTINzpXJhdXIF
         gjGm/lAQZ2SOTa8A/ZbRqsmJrxzBXbdtAOEh+nekVE//UiDXFd933exIh/q1uD01kLV+
         +iLHfBi9RdpkV8XFsYvEuaIpem4o5zHa7JvDygSVOz3GCyVv1+CJdRD0px7zuSTd/dGZ
         UJNmT8CgYLczuVLOr9Xeo5roPm3MSdTdQMExgHbBmrEO4w0Yk4kp9uRqhu5tDoD2MzBV
         +gXZD4eWiGWEs2r5zCMfLkZGYvjIwFZHAiLFkM4f4SRKhZ+RqH/Jjo7jz6JZFBsA/sGW
         R1vg==
X-Forwarded-Encrypted: i=1; AKwUvBxbRv8Y5c2pS+mZAESHtAeyW3ok1LlUiw646gEAKiJAzvuVgaLYR87JMR0Z0djLn2ISiCUzY8t+sgD2UOk=@vger.kernel.org
X-Gm-Message-State: AFuF++mWj9HC1SQDs/j4wLKXWISsq6H2R9QMJvwemQdyTHt1i/xmC5sn
	NUt4ajTmprUont6vjFENVtlg16B937WyQwz4dzUUSXGlX7fgGvDxbRX6Q813M123e7g=
X-Gm-Gg: AYBFou0Zza8v3xF8ybqveVQDrPdPCVV3tL+cyFBx4nHKuY2jMEHpPlLSvFSc2qbnXRs
	eSJM0p9z8+iCWwRXBZV+uT91Yn5VgCPfKkrdvAKe8ElSmNNJOZ+vmJ8N7wSjm0AN3A0OrgRlQ6I
	Q1WAVGBu96lzKYw1nyvjwya58m+yVBh1VCdxeccnRFY1cAjONmKDm1dhfzT+etbNP4H3aWqoqTy
	VkWJTSE7DFWaTKYLFNq9UTP/Je2R7+9j6YVQ621bb94xcUgLl26But2kJyXaLkfW8WWprfReLP5
	RgnUObhfFlC9ufEM+CwlSlOipISPGEUmdCmJXzYuAV1o40lAC+w9fB4GcJJuE8Yuan5oFZjVMkg
	dJV7kU6jOlwZtAONo2tEw6rqK+F2T3g80sI1wi3kWEa96ifFWp3OEs/4rhsLcGHpvEAxurUf6o9
	irPNccxtt610ypwWgEntNTtCekvuMvul4zNFlXdw9PtjwEFQW460QwsRu0H2J/jhLb6hVSJ4qDY
	2PN9RO5VKUDHHlx326BS9J+xOVsz+l6bOz+EpjyzJxIDCnwgNj/aw==
X-Received: by 2002:a05:600c:5303:b0:49c:fa21:1c87 with SMTP id 5b1f17b1804b1-49cfa211dadmr367002175e9.28.1789047477714;
        Thu, 10 Sep 2026 06:37:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:edd1:1b07:ea07:35f2? ([2a01:e0a:106d:1080:edd1:1b07:ea07:35f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm289732465e9.4.2026.09.10.06.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 06:37:57 -0700 (PDT)
Message-ID: <6fd633ab-eceb-44b0-b481-ba28951fdd0c@linaro.org>
Date: Thu, 10 Sep 2026 15:37:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 34/34] arm64: dts: qcom: sm8550: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-34-90a252ddbbfa@oss.qualcomm.com>
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
In-Reply-To: <20260910-root_port-v1-34-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 15:29, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and newly labeled pcie1_port0, allowing
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board files,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi             | 16 ++++++++++------
>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts                  | 14 ++++++++------
>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts                  | 16 ++++++++++------
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts                  |  6 +++---
>   arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts          |  7 +++++--
>   .../boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts     |  8 +++++---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi                     | 10 ++++------
>   7 files changed, 45 insertions(+), 32 deletions(-)
> 
<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
