Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BBA39768D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535234; cv=none; b=dugg8G/oRY+fWenokVoaRHf2on6pYfFO3yn8JRt3VRAExD8Vst7YfB+CpePf30lq1u+vdC7pNNnBIBaKWoR+CyTgSgY/VERgKvhdLF+SkTbbU/+Aei/QSwIpAHOWHXxLaabOv6HZtI/K4tWGiJKcHFnkvreHjZwIybaGTIwhw+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535234; c=relaxed/simple;
	bh=ErHS1o9w9dfqEkjc8XU/LM68Lx+ef5IJwQKQG4bY2Ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cn6+xq+d0Nq/cWiKlFF9EwuTbecTJnm+TqVdvZSdrcGodyX1OQG2lAu/RJE6J/jIWE0pYqgAgu4x3R3fIGEHwuwo7Lyn9Kwa2HxE+MNMp0kiz8128h1Ko1W0jZIHOAGeClHwTBdEJNV2vrJ9U6LomTZmoXSkXa/FB60gP2rTmmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V/qDGQdb; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V/qDGQdb"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso2638532a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791535231; x=1792140031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a3s76qkdukLICqlg6Em16V7dzhtvzS9YFXiNuwW4824=;
        b=V/qDGQdbz6/iD4Km7EymrAwEOqSe1LEMyXiFtQN7pvTYbwKqlcsPF8X0pD4X0N/gjB
         wjBYl/oo5uWkMpqqE2N5QXXNLXx4BqSB8Rah561eKCVjjKsoQ/2wNzGF1sUUMnKkNKe3
         L8WGV8ZOsG66WXO9VB7mJP7CTd5BT6dMg5oKyoch7SE2y+uWcOAaw2UBaWMyhNsU8eTB
         wQ3DM+Hdsq6e1LPvCdjJwkVvZ9ttdno93X4ljoCXjvjcObrfdzSmF/VuBunpgElMPEdJ
         HcVgkSYWGqlkh+72XVQQJAoMuaeqiImJ9O4edDnNeW5SozxeNv8VrtvxCnc7y73YUZzv
         WytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535231; x=1792140031;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3s76qkdukLICqlg6Em16V7dzhtvzS9YFXiNuwW4824=;
        b=dG/E5o/SxIenZ7iAt7RPPGRIqoZ3qGRLS6SYp/86FU6D98uDxnryxLXl4kww+h79hx
         raoufNTIzrP2IZFkzhdJ90eYuIGqzMIRUsblk4N4XSNbcXF3+RZuThJKco/n0gwbgZ5b
         P9Ma5590NyVy3zHoU8i48oxsr/GkTIl/POC0womH7SR5cTtbC9SAarLgoE4x1FVcbIb1
         714NQwS4hPWnMEe6vgoIHwboKSspiP9namMff4R/7gBGi74t1YXrx1Raz1DW7K87rMEm
         abuX0OLCr1LWlzdjm4lBLdKBM/D3noAXnZCX4NSEUmWZ32gujLdc5w4FrRoNBKrVq9Qy
         tn8g==
X-Forwarded-Encrypted: i=1; AKwUvBx2W9xL7s1GhXxKbMjCB9m2CFw/uhSUGBEH8QaWY08M6TyVYJZ08e7JVmleljF20iAWZw49O5uoQc6MK1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVJDzCL0XdHoEOX42QXXYug70YgFHh9TwlqmWLh6Yv5JnwIaGc
	IpQ4/MfNhzRme7YOruNc7N5QXWm6YmY+5Sdo/fh7AfoQHsdfBH9L9WaTq5dEGeXeDto=
X-Gm-Gg: AYBFou1++mg2IGWC/GoZ9/7hNs94WmEGFW/kIlPZd42AP8uXpV/aN2dpXH61zpG+AjO
	KHoLwZiEwXEiYnKMKP7zSxX0bOZOI7c4jM7SJG2JBduM+iqpREpimyCq4fkpD8uuLlhw5QfFkZf
	cBjfLUOTEtBQ6mO2aq4/zJkfiBfnTzBOhUW6h0jjHGFIpeSsEG9DoYMbsOaYRXg2/LDV4S4qx6X
	2h8Pb4IgRdvlhjtz0ci2EOVUGmGNSxltJe7ge9KYh4c44V4w0IJE1Ok/M96jo2W1ecKG3lTsc8y
	0hfDaI1NCxy56CDFLbkVYM7GmDdhEa4KgrLMyBzWhNK8wFPEGXccul13FGtt8hJeeSA4RXLxHsb
	QA/J6QE3VUFuh6colm+zUHoDvu+R0MTYNcFIBPhwvHnl81FsOE4Ns8sncCqvCJGSnyE7CDKwEIA
	+IP4hSIkRm8LAhB6ayF0UBvt0sUKDMbYq2nK9xmosyw3vJTjWukCnxlIXLL5GfUKgG3aNxQUBGL
	newA6oE1z5rr0QiWNzo
X-Received: by 2002:a05:6402:234d:b0:6af:d794:4a8 with SMTP id 4fb4d7f45d1cf-6b17c2a3834mr926471a12.12.1791535231094;
        Fri, 09 Oct 2026 01:40:31 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.78.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179de7913sm781218a12.23.2026.10.09.01.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 01:40:30 -0700 (PDT)
Message-ID: <82d48200-f13d-4b14-8cc4-4b1b2dd2bb37@linaro.org>
Date: Fri, 9 Oct 2026 09:40:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 10/12] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-10-b2c583ef50e0@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261008-kaanapali-camss-v19-10-b2c583ef50e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2026 08:14, Hangxiang Ma wrote:
> +		csiphy0: phy@9523000 {
> +			compatible = "qcom,kaanapali-csi2-phy";
> +			reg = <0x0 0x09523000 0x0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +			operating-points-v2 = <&csiphy_mxc_opp_table>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "top",
> +					     "mmcx",
> +					     "mx";
> +
> +			status = "disabled";
> +		};

These PHYs should have their ports defined.

---
bod
