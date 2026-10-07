Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34283D3CE3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366558; cv=none; b=jAYwx1sq/2kBEQ3h9HqjAOBOPME1j51GXd4fuzrXVBx8iW/vEW12AXgKLVUmz/f0X86MlLZHJn4UhYPelmwlISaR5jgx8CxIp8J14zYE4VGSrhHuQfsUJBLr2M2q7JRmvrh0b5jTLZjmGBFQzRMnqssRikx2gMCpiwPNavErKHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366558; c=relaxed/simple;
	bh=0sEpBHImgtBxz8uqC365DtivvPzhsstSwHsRYHYQ4t4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9WfBK60o0VlrfahsyoObFv5LGHDtFUxjUUVDQvuGSdn6dYnX69FzhDGn7n1Oo1wevUT1BYESALtpCBLd1sEBfQbwVc/yoTEiatf5qlCD7sNpY3vOhKOKICq327thQ3azG+CMYiZmPOfyNVOA0Kmw0dbVdabV3pTmxcmwTLQZ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rKBJxCJS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rKBJxCJS"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a061a13884so13957525e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791366547; x=1791971347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KCLuNr5Jl4WbBQBGA8ZScNaP6xA2JOMpqFLldkWVSHk=;
        b=rKBJxCJS66UM2veHqCI1TbI+fZfaHwd4eP6Gu4swccjbzbpvgp6Rud1/IufdLNsjGw
         l6NN/lgL7o2ZPPhB8dtPcrTdBIXsn0KhuBplwK2+N5Cnj0u+mwwS0rlAs71oxerGwqWo
         lxoJ0DuE6A1WResD171qmlH49cB6pT0UnqhRIh1MHBL6sq6nTcJN0Ri+KXuzICgtfG3T
         SxrXfd1NwZrinvmxuusS9kQ7OvNe/GVpHyEiWFcGaowIB7CdDJaDhQWqr0w6rEQ/1A4F
         9eFU0aaQM+DdfmXIkuQaj50sQ8Zub9QWO2c8QARR6aJdvlNj+ObGY7qTYEKftyj/MRQM
         Uluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366547; x=1791971347;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCLuNr5Jl4WbBQBGA8ZScNaP6xA2JOMpqFLldkWVSHk=;
        b=UsWcYor7xYa9y/uzTK2kNAFQhhAXL90zsFkiqb5Y3m9JSYZMZjtEh6qMqlrm2uqW/Y
         CKhhkcsPIwXamHI3hx+Tgfp4s9agvzSc7SKBsYeQcEzAZW50n37zpSRnoqUB2qnw4R/e
         g1ToXGF+63iwQZgLf5mjyn1Ekf7GGpSHkMgQJYtgF/lklrdCr2103W1fqo/Gw/lTNIfh
         fmWh/Oa98g+bDBmoeV9rC4NNwENx7J+piCN8gMogD9nPxE4V2Ri5pEjhViBtNCYmrBV7
         GJI4F/Y3/nwykmxNgBFt+aBDQncACSBs/0oB6Zdx0AzyeurbtiuFOCGk2oWEP9hYAJ3Y
         jISQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBeQAqGZO2iq8SZ+rg2kgPurBxjdxjQVpU9kH/VxJvsDLI1zHp4uzal2BSP/S/LINhy9cby7iBs0aI/PU=@vger.kernel.org
X-Gm-Message-State: AFuF++l396HNTTHE3c32yMmJXQcFvhEY050oz+OiRAkA8Utx/ktfjhG4
	XS93nt5oicfBYwxWUq0abt+6sDCvdGf2dvjAc/VIv9l+TbQ3trUeNIkn3odTalnP2oE=
X-Gm-Gg: AYBFou1pv8YXZg2e8QBm3qknsFh8yFi2VTIQHswzLGhCR437UZvZ4DJ0iHoiQbiAqzz
	yr12ujwEQ2hSe3m9KpD0qjcE1JKE1CG9sSVZJYjcQW8LgMgCa6YJnDQNKMeImADMDWVIZ3y8OIL
	zCq4KdiW01NqfQNrmp9rqY6jeUCXz4lVe7t+WDmbuUj5HyPcDzlJamb6oYgziaSISzW+87wljvf
	d/Iu+3P+/4CGOVEdB8V/MnhoTxVhj4PJNWDUXzSmANM0KaEeElfL5v+16n3vz53DgkC3FOs0wP/
	AmOwYmxOzizkKaixtOgg9LM/qMMcdcTllSe3rN9EScb0ekqBsEjL2LJ2lEv6/ftyMHKdzCehJxR
	SKX8TL+BNmlT/LqmEflpdB4Q7hB+PIOiNblVATMDMkH/uKo3wB1LxyZyN3sA6ILaf/rtuT5o4Iw
	lvLDiWvtzofORFZONvqDy9gcp6eHqAJKjdHEG6tXekMAb7Lr4pCIwfe3SpO6LWRndvIzGzFuRT2
	gluuh0ZiD7G
X-Received: by 2002:a05:600c:19d0:b0:4a0:1f51:ba2d with SMTP id 5b1f17b1804b1-4a18045373dmr21395025e9.22.1791366546591;
        Wed, 07 Oct 2026 02:49:06 -0700 (PDT)
Received: from [192.168.9.72] ([185.249.114.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180932dd4sm20918875e9.4.2026.10.07.02.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:49:06 -0700 (PDT)
Message-ID: <2bb9dda6-4a13-4da8-b17d-3bee6ecf9bba@linaro.org>
Date: Wed, 7 Oct 2026 11:49:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/45] dt-bindings: media: qcom,sa8775p-camss: add pixel
 path variant
To: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
 pshrotri@qti.qualcomm.com, Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261006223953.3382273-27-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20261006223953.3382273-27-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 00:39, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Document qcom,sa8775p-camss-pix for CAMSS configurations that use IFE
> pixel paths. Keep qcom,sa8775p-camss for the legacy VFE resources.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/media/qcom,sa8775p-camss.yaml         | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> index 48f280e99809..9206c7cfe197 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -14,7 +14,9 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,sa8775p-camss
> +    enum:
> +      - qcom,sa8775p-camss-pix
> +      - qcom,sa8775p-camss
>   
>     reg:
>       maxItems: 22

I don't get why a new compat is required.

Please look at my RFC - there's no DT depends at all in that.

The existing CAMSS node has been designed around the IFE SID - not by 
accident - I've been pushing this for months - to prepare the ground for 
not needing DT churn to enable IFE.

Sorry NAK to this.

---
bod
