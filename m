Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4B74E4C24
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849495; cv=none; b=LYIjWYMqkuUnfp8UKcL61YrPIinbD4C1zf17wt3Z5/esoCSXsocMFRHyyM1VT5niZnZERsYXx4VrUzdLgRIxKvX6Wj/wJ/TUtZeG7h4SwTM3sxkV8/Z/HUC9AEyTUM4aPTGDkVh9iPpNcbTYZKFQXQX1eiIPLyn4VU5P+/6NJv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849495; c=relaxed/simple;
	bh=6C565t/VlyoDv3UV6Pv/GK2eTKoZ4N03hIDuBo2UJDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PsrcWrtUqqpCoqlbf+VgFSv0bO9cY0PQitUfohu2HqN9IAa+3men8lspg0roITZiILKAZM1iRPdCEsZ0DaiNxyjok+zvfR67kKyntWrP8fL9KBH2FS04Z4HHDe1Ld1AXUS01t7oytzmCpiTK0MhmL5shY63lO/Bxa7oxmP31c5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bOMFfnn/; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bOMFfnn/"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6af82ce3c83so344123a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790849485; x=1791454285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3XG5cy5KBLHekXoy0zdt8qQzO6LEdX5LiupQKnkZIo=;
        b=bOMFfnn/jgcz1WJBEzhyFKMrlGUEYbsuCSbA6r3wTylJd66TyCu5SR5fCkUgQwBOZW
         KCIcufLthnXh9KQfCHlLl6IF1XEBvloeFkmBFXF0LJHMarEOn6JQ6byyvAzMyOShQzQ6
         ZeXpvpF+kCn/QX5M7cdXO+ltiSp50HpNN66qTWqfVzrO1GWLSk6rHIO3ctSgJGFXilPx
         cWJ2a1WagwmIT/r5gmeYZv75Sgf/gADZh2ePg7Gip4Gs5qS3RkeVui5mj57bHcWc1hYD
         tT8Pn0TUhjCu8dEhc4DwmL1JtVVcp4D+xWFtpf2R8SZMySyhumIc59LClekjWdnvLITG
         CLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849485; x=1791454285;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3XG5cy5KBLHekXoy0zdt8qQzO6LEdX5LiupQKnkZIo=;
        b=zxHtqbe+i5+B3nxeohXUjEP1KIoyM7pNaP1RidNHL5iaV1BMPfITg/rkG2bANa9X3Y
         /yQ2M0Q8Awz/Ki2I5fA3zKyVRiGRbnbrHGqcyS39iWu/IuRjge08Pyye1m58+NRNvuMM
         B703LGssqVyZQ3dH164UTKXtrDViZCEGx0puZPLYbQXK31myTJS3iwT5IOH7alz+0TsF
         GmEMNGbMUizJtWjdUanEyphjSbSU9IiMh4wF2CU5zz05jUKo6AVcS/ea9v7tRuytY7gz
         10yhK2oGkud6IkaG+7vnwhjEv6UIUxkwdNVtNLK07RV8vPFRJWLMNq7pDqyi8fg+dDgZ
         WmVQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/oetG4GErEOz/NLPz4rM2QFTb07+sECiDCegDxJJs0o+FJiYhTjqfTJL/UJ+SwgHuDCi9lfucHbBPEn0=@vger.kernel.org
X-Gm-Message-State: AFuF++l/qI8EiPJIUYlfTbLFQpvMBBKyI5/eRlGcZ3B7L1kGR3toPcJx
	JLMqIl0Casv7WXH8WRKJ5/Yni9u7PTOfqodOoJWBSs6cvOmkGnkZKFpJflK+68hrZOA=
X-Gm-Gg: AYBFou2DJDwADh0P/9Yflv9byq4Wzz3kk47fXHQUSWaXaqwjEw4KY1gjxhYAlhET69U
	EffyIhEUmiAuvVo2znF+TZ9PYV+RxtoLyda2zjlfDc+7+eE7JCLvWGepaJ1oBg4HEUXooOaItS1
	J79S1SjFUkSJOWdrzA2BbzZRWc/B0UwPOVJQ8fPq1fAK93RqdoQRRQvaGvLoVoFA9FFJWkfmN+G
	MY/DDYqv0WT7z/PSFDBzOTLjHSfp5cv9J+EPsHZoLaUpX8LkcZmG41TmaG/bvJWRUy3gbrqg0FC
	icvpQ0/41eoRt30zFVH7X1V3MJlFlL8PgngzmE6MUtu9iyI1KWc/IFytYe5hmSqwTEP8PsWSXOW
	joAbKAJjaPILbatEFFWzSo/ZWTaBe41WX+RuKjT+WnJ9D3X9wO2ZOdUQwkTQiCeKZ5WSKKRtO6/
	ngA1YbxGvZMcnvIDh+2CrMjHW/4FDIoOWqMO5/vIlJm8ZUf34G8GNz/riIp7dYgMTKtNpVdBx8k
	UmlZVrdDXg=
X-Received: by 2002:a17:906:f587:b0:c2d:c98f:4824 with SMTP id a640c23a62f3a-c2e23d7e12fmr327647166b.30.1790849484765;
        Thu, 01 Oct 2026 03:11:24 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.14.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e342a24c5sm95689566b.4.2026.10.01.03.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 03:11:24 -0700 (PDT)
Message-ID: <f61f1882-d6a5-46ce-81e3-b84648ecc6d6@linaro.org>
Date: Thu, 1 Oct 2026 11:11:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: media: Add qcom,x1p42100-camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com>
 <20260930-purwa_camss-v3-1-0fe2a5b11208@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260930-purwa_camss-v3-1-0fe2a5b11208@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/09/2026 07:57, Wenmeng Liu wrote:
> Add bindings for the Camera Subsystem for X1P42100.
> 
> The X1P42100 platform provides:
> - 2 x CSIPHY
> - 3 x TPG
> - 3 x CSID
> - 2 x CSID Lite
> - 1 x IFE
> - 2 x IFE Lite
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

