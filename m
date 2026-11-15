Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744224;
	b=YjuglaaWj0z5IHjMCb8OEQcbNhMfD61otDNps9FOVqtzrQbMmjoiIcJWzbnw7VbacJI2
	 n8OLbqS9N0D4Fumm5392V5XFh8j8PAErNX5J//11Z7cXB1pszOvc6cH6bFdEfJs/fM2HD
	 NXlo2dyK5BTp3qb2zeKiDpwJEPaPCyAbUEXUvxWGSbmFel/c96wJvgWQbFwotMQuQBG4m
	 qFQ+i6TjUUOlXziXC7DbG59lnqfdw5pDFRxxF5CPjPwr+jEpr/SUtdijZY539TitiPTLu
	 RjPlZLZEBU/zaVryZkUKjDRXM4BQegWNsfdeCaYN+mM9GM99ApdH0AQWKlOMWbsO7Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=G2xfTStPsDXrBa4bi2OyO6+uMbuqPCiOosCTtZjhiB0=;
	b=i5r2UhsVRjXmrkAufxZ0GN8tVvYHp4Q1rXQpXLuwWUTlQRP1UFl+Lz4fJmQaMSbZ/jib
	 fMtfd6pa/6AdSvvgnR+3KuulLWf2et6Szjmv9+SNFUCm4ONF9DWEeLeqe2Uy6bRxBalRW
	 xvtFY5zehBHuqzBJcu4xbDrsq4HCkf5hF6WtTNCZ3+QKb1YZq+1n7JBRyDq+zQQwbZlN/
	 KxFqna12azkm8VWjeqGoEAz0cAJI6lrNqjNeaPalewnTs2qrvf3U6L5ZpLZEblXDQytId
	 YWDb3lL+C/TdX+FHXBkWF0cohPHa0f7QW+6ghirT83Lo6OAAhWzaPZpDabtKncqQMcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PUV0k4wi;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E602606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E602606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PUV0k4wi
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so2255095e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744223; x=1795349023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2xfTStPsDXrBa4bi2OyO6+uMbuqPCiOosCTtZjhiB0=;
        b=PUV0k4wiuHhnC2t7Hsp/WAP5J+moB0hPEz1xgcSUOumUT/V74YrWQ+u4/kcDQAZZAI
         FU1UcT4LA71zQaO4RNN3fDK58kEm0gyjmnHcM9RXVv/QQUcKWnFnRVFUJIN5LvgOmRbU
         CdkX2MpZzMt3w1jVBaRwXSai8LXU3yenBkKD3eLHOTo7bbQWZTnRfd7OxqDr2Tm7aqgM
         tqbEjAIs/onLiVZMqsDdlB+BeBjSC46vX/IUEnjCJMfCs4q473Yu0+LQXUWKpIUAmuWq
         g5GqBSIfulUimYpqvkhkiTnwvyFlIbN6ai/HPSelBPAghTiFoksA7JqN58Ta6+eI4q4I
         045Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744223; x=1795349023;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2xfTStPsDXrBa4bi2OyO6+uMbuqPCiOosCTtZjhiB0=;
        b=vpCHN+IWXzPkhrNxrgl1sUWwN/sHVtSxHkqbRZkZEXVPQV3gEnGlSC+1ofaxphj5LW
         16Cmr7PonXzCNEkqu0pBkfg2xVL/q4b1btaTIQL2DsYTSdEf5Lgw2qxVQkzsS/2DcmIk
         F1JEO6tGW5kJNw0r1Zt+JL220Awiq3vgwJ+oflk/CpaYyFNtSFBAYxLynaswyRrM1rVu
         gQuqIkCQRetqVKff6ZVZ4RB7sQ5UbDJzuebiwoSJDNaCJMOXRc9gd7R94UdrINutvLwA
         CPmTrCHrDyRX0gimClypNu6Jkeogr+2LpxJwCWyKnM0BapVFoWi/lVjm4zhJXwBEDC3t
         euZA==
X-Forwarded-Encrypted: i=1; AL+hErG6RAGC3SA6AQZDFYJtE82D+XbNO7hH4E4FCDgD4il/3ogDMPacZsVJzAAr1j/VoHIwscfU54kObjaERHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z++XzrI8l/XWhs6pxuZlVbzG9oFzonjrp6uJDY4kH9qk3aMqNpN
	GhfsP7TOtGp71pkcZ+nZrZ1fXzQKBfpJ1eFzQjc2Le/Yejqhp5/qqfVB+NJGEbMxJFqAR5PNkZp
	dg5sK
X-Gm-Gg: AYBFou2yVfjK3u5lfoKrq4LwDpPT72E4VulIJoD2bYSTLdZ0Sf7956lV5VB3jwEKe5h
	i6WeBn6bSxuzKu6AuPZLpJRFw72WGLR2iUFw3F3BvsBwzE4EZ7D7Id8Mwq4qOWA+2KKx9Wy99TR
	4JGZ6xJLvB3pGYnm5IhPFCByddwYMIbE8YGgsEVOd8EKjgqbK2UhwhKqzNDCWJuLqdEOFJ82gaV
	sQ59RZpcfC0nlbHOJgyT4Hde269G4DQqaZJX4mpBIAhGq/pzG0EB858giwc+dAuyKHhnkjPKIcF
	lxZO7r/xAl2Cru8/gYc+hqqvLbp+wYFoHnKpxL1Jx2C3abbmuEex4v5yC+PLdf5/YEs0U9lmh4r
	GebCb1dRjzXZuckezAjbYaqv/tjdWOJMlE1Hvwyipi2fDvhfFisH/J9Drd3YQu3X6nzFl8fHp3M
	TDphTq4VnLoGeJFuDvm4Wa48EL0i6JuMKtxZltSt4P9prAJqaTtdlPCSraUpBoDVK+EY/LbXXoA
	HCQgURnGNn0FzC7qJcRjtaLVbj88YkwVC+LjaRCZO0VlMeTgM2tbL15vTR7YshqQX25VYcUtJWf
	ycuyRQ3dGiViqIbfV8jZqRk4nmNAAlWKxCeLc1WB6w0=
X-Received: by 2002:a05:600c:34d6:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4bb559f609cmr148644995e9.3.1794744222495;
        Sun, 15 Nov 2026 04:03:42 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60021375sm15371401f8f.29.2026.11.15.04.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:03:42 -0800 (PST)
Message-ID: <31101889-9d4f-4863-afb7-0f884b50088f@linaro.org>
Date: Sun, 15 Nov 2026 12:03:40 +0000
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
Subject: Re: [PATCH v7 02/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Eliza CSI2 PHY
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-2-8ff2a11835f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-2-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 11:29, Wenmeng Liu wrote:
> Add "qcom,eliza-csi2-phy" falling back to "qcom,x1e80100-csi2-phy", as
> Eliza integrates the same CSI2 PHY IP.
> 
> Eliza has no MMCX and MXC rails: CX feeds the existing "mmcx" input and
> MX the "mx" input, so only the power-domain descriptions need updating.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 8ff3df1d0d2787b2af0499c1e4106b86f56ff82c..884984f6f6b9e595df9bb3b0027c0bcf285b8058 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -22,7 +22,9 @@ properties:
>             - qcom,sm8750-csi2-phy
>             - qcom,x1e80100-csi2-phy
>         - items:
> -          - const: qcom,glymur-csi2-phy
> +          - enum:
> +              - qcom,eliza-csi2-phy
> +              - qcom,glymur-csi2-phy
>             - const: qcom,x1e80100-csi2-phy
>   
>     reg:
> @@ -48,8 +50,8 @@ properties:
>     power-domains:
>       items:
>         - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> -      - description: MMCX voltage rail
> -      - description: MXC or MXA voltage rail
> +      - description: MMCX or CX voltage rail
> +      - description: MXC, MXA or MX voltage rail
>   
>     power-domain-names:
>       items:
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
