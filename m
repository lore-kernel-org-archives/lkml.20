Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B67D53D0B3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079344; cv=none; b=L8iakyUmoktJxdAFYw5rTgBDibjJtAu72U7ODJA7zI+to79EA9wNbyjcS9yRvqC4eH1supZh4yEj5UVCb22xAmslYZIbM338e+xemVoKQQOfuK42+2i0yNZRdhKV2jxkkzUwJ1+gzh65AM1+dDPBar4NLA9RWaaSJk64AnQzzSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079344; c=relaxed/simple;
	bh=T6dJRCGr0tg8CyVITnaV4caTAtiMkYaG9rXKeW1fy/E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kgSE8OP99cTeQcWH4IwdoHsM2RR67lmVMnY1xkBRrNLUN1f+BaLuEgrX/Fg2gjLvAbu93963bMXuo/HHhEwYBD8a92Hu7mxVyOgpD62dgAv7N0JtAa3SgGMVYsyaOZ/sfzEybjt9Si+mJ6oIwq+xbCVYAz1y+XYlLDK8CvA3NuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gn34GsXr; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gn34GsXr"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so54493385e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790079340; x=1790684140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6o4kVB7SdHxVgXCadG4g08z3sTOxxFvqJY26n9s0pM=;
        b=Gn34GsXrBVO8f2Xeu+bkc2ESjW0C/nNTs7JQa83zBUWOyd4Ny+1jm7N893xcEYl4sV
         DB75wCfxrUVV7QgE3oRdLwLCeUob61i9YHTvTfjI73yNPywD50ziMiSSXAv2mM0XJBsp
         WW3atJb7WUixWizH0HQvqdQkFQ2z/iLtJidX1qrJdUQ0z+DjSBbcmYGbPQumLWEUrnrJ
         qYI+JJF3arxSDhp0tBwqZl7f6l8emrAKXNGw44Mp1ePNVmUgas/AJJafzfcZuRgNSHg9
         YoF1AChFUUXPG6T4Q/syLm493aCodZWW0fTqjqD7cAaNRbzKd2Z9Y/Z7BRKHnYW/jjV/
         WyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079340; x=1790684140;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y6o4kVB7SdHxVgXCadG4g08z3sTOxxFvqJY26n9s0pM=;
        b=v4JYg1rig+zl7mUw1BxJIy9+Ez0v6T2wW6xDuB8/udFk0Xnlc5tEKF8wmlgbqmEGNE
         9hEGk3eftTNo5OZv8dr51KhgArK9pjnR3O3efG5PBpRa+/8m9aRxnGB1USUrnCcZCW+4
         n+p6L2QmmGtWQOxQe4pYjrj/tjSe6jy5b8lXMmlWdHksM/3MaojQbjjfyeWIJX120tsY
         7Oj+gqSKjg03IHi79wobCHopEcwu7uHWJs1fisOAuZvT2rFgI/XHegPdhP4Bf0f3fzUS
         GzeCBTMMmQ4C+JrCa6TLQhOv5xSiW5sgts4X21Mdro51UFy7MwPuxZ6qdtTncHdrk96a
         pL9A==
X-Forwarded-Encrypted: i=1; AKwUvBxczV7L/p/Nm2g/KCvqq+fh/leI6qcedPqnlOlLeIsMV1RWAfKmEMMapFk0fQd2Ij7pGu9jzti1+qyyiO8=@vger.kernel.org
X-Gm-Message-State: AFuF++kKu587vtwdC9iMeZvAKTP8Ecj2h8FVW/HyvZ2hfTtU+qrYki0Q
	L2761XRzQcNx0Gxz+zYA0qu0PfXYY8JnymKBrnZJI8QvZnnow+6Tme97wI86ofpHg5U=
X-Gm-Gg: AYBFou0M5epXdonpHn2taMX46Ty72h5Cm2Uxx2YESziJkmkDRrLqnbL9ryaASxye3D2
	efMBgqqzFU/Xjnr0wedahrF3KIz1BKinkK9IbxbD1iqXFeuZihW/LYdNuvCc9uotLKPzylQX4tI
	mOV3mTHon9D+ePVYHHtalMbc2k5/l2XlqNYU/kMjhVIDORau45eBjulIU/z+gLxpP3Au4N/ayVv
	jXmoVpVqvLwvv5bKHX0WP3bvQfC+xGriukBpjl2I/dmI6KZiqgHkYwOPwGjYapQPmzeXStT9Lyj
	oo0MwaxHPPM/qpAlcpuJPqC0puT8f5cpgJwwTjpq7lsVIrb1zFYc+FPNsWxh1nH7eDB+RqNJcxm
	dkMkhTzkMA6fvOj4uWGu15MZETNeflQdmnlZ/g9UwYezj85ztP8JdIXMhaPOsvbK2wxYl4jLYaM
	6N7DiGJbVttNBvruQr23xDU+aJfLvHWVAHJbL3bh3wG/gddt1cWd13lryQZ0RGU9uberxU8+j6G
	LUhtQdpA28Z0qwi0yyNv+beUHiqMY6PRHQmLDoPBuxO7FnFS/gzD4A=
X-Received: by 2002:a05:600c:138c:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49fc56ef0cbmr194687665e9.14.1790079340130;
        Tue, 22 Sep 2026 05:15:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ddd0:8cc7:9887:fa82? ([2a01:e0a:106d:1080:ddd0:8cc7:9887:fa82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdad29ee8sm46774625e9.4.2026.09.22.05.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:15:39 -0700 (PDT)
Message-ID: <749294f5-9640-46a8-990e-b59abe9cb9d3@linaro.org>
Date: Tue, 22 Sep 2026 14:15:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v18 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org>
 <20260917-x1e-csi2-phy-v18-2-6515b5255fa9@linaro.org>
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
In-Reply-To: <20260917-x1e-csi2-phy-v18-2-6515b5255fa9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 01:58, Bryan O'Donoghue wrote:
> Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
> existing CAMSS CSI PHY init sequences are imported in order to save time
> and effort in later patches.
> 
> The following devices are supported in this drop:
> "qcom,x1e80100-csi2-phy"
> 
> In-line with other PHY drivers the process node is included in the name.
> Data-lane and clock lane positioning and polarity selection via newly
> amended struct phy_configure_opts_mipi_dphy{} is supported.
> 
> The Qualcomm 3PH class of PHYs can do both DPHY and CPHY mode. For now only
> DPHY is supported.
> 
> In porting some of the logic over from camss-csiphy*.c to here its also
> possible to rationalise some of the code.
> 
> In particular use of regulator_bulk and clk_bulk as well as dropping the
> seemingly useless and unused interrupt handler.
> 
> The PHY sequences and a lot of the logic that goes with them are well
> proven in CAMSS and mature so the main thing to watch out for here is how
> to get the right sequencing of regulators, clocks and register-writes.
> 
> The register init sequence table is imported verbatim from the existing
> CAMSS csiphy driver. A follow-up series will rework the table to extract
> the repetitive per-lane pattern into a loop.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   MAINTAINERS                                        |  10 +
>   drivers/phy/qualcomm/Kconfig                       |  15 +
>   drivers/phy/qualcomm/Makefile                      |   5 +
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 385 +++++++++++++++++
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 463 +++++++++++++++++++++
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  97 +++++
>   6 files changed, 975 insertions(+)
> 

LGTM

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
