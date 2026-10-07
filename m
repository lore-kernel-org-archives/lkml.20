Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F2347D46D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366738; cv=none; b=Msc8iH/n0iWwZKEvAE8L7ALnRt4cIFboChL1X6E1ZvElVeOerrSwCr+rmGXQV/YjmRt9Sf8NML0PYYSkg/KQeJAjWWkQxsy7iP06S19g7D1jGJhpj7YDRTYDlKAov2uX98YGhziDiLUeFw9rREK4tihpoE4cLhp+ZHmI3ZFYeJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366738; c=relaxed/simple;
	bh=A9zqlCOxjRlPR6veYqUZq2yHzXNj7ksqudP06P908Rs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TyCkCPKvKxhrF10XFm9hP31XAp1rTIk8At32UyRFDW8c5GI82H7LR6KIfu4CA7BStAqJgIMqVh25cXMpF6B3UXFw1Z6vPNKumqB6QKGbT1OuwiUXDw8A04HuUY+digsWyaiyY9onTt8dgi6cqBj3ZRIz0QpCggeqv2VE9lLR4ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dJQcdaX1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dJQcdaX1"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso8868025e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791366727; x=1791971527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTCkoZU0MickLLuynMxKjy0YUIqhaSwwD9LsZbzk31Q=;
        b=dJQcdaX1hM5UJxG5DtkGI2oRPMXqempOR594uf9pqZjpG1yzcicjFbQOYbIEDfxE0f
         IJASTEU+D3ZWknqSUl0PtuWpBKwVxzeBhQq4eMxNW1VUy8GO5/SPZeiImYAG2zyQgQTJ
         w7inapaFSHrf0SjynUBULolD26W/C87gtT1eSycnsGtAlcm8AFfsCxhxuREcq2OCoigA
         xosXm2JS3aDM5S07ZreIpNhMIhWmaQX0sqC/HkGE1UORHKksJD5t7D9KjyBTafTuFoYe
         A6S0BUHXHBAnIFQgoAPGTqKmbD2n2Yb9lxE7S8ah85m5H7tyyEA4IKsXgXP1mthWH9qq
         e6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366727; x=1791971527;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTCkoZU0MickLLuynMxKjy0YUIqhaSwwD9LsZbzk31Q=;
        b=HSKbyG9RYft4gyS/YQ1RHejMTghS0MGm65WASVYuR+Uedf76Zms7rNxx2eBzQTudTB
         dG/32GUsbM2VeRcCj6LrJLcwyE/WGxGb88S8S4D2hTVjBk5HjFH96YHKX/N1hJz9LT9W
         7v0WWqx4JQ37RT62GPhfbOomOf4JYkjnXpmuClM73uUwHiVwdNgvYGMwzA1N4ZwES24g
         iO+eQDaT5WUwimndAwcwQH+JC2rsMsXFpYJRdnX8MzBMQX9mpE6YNW6wdW4/rh7ZKHdS
         OD64KP0KHRm1wMQQBHazLz0oNMg2jsWK0uqzfDCQ+TCMRYwAksCExuvOa6/Feq5Tox7z
         OKbw==
X-Forwarded-Encrypted: i=1; AKwUvBxj1FRoIVmRnJy7aQOluNksnAnr2xEy5RpFQgzojgYbcX2uKOJwA9zmeqa32rTF1Rmfds8ulg4WoynY4PU=@vger.kernel.org
X-Gm-Message-State: AFuF++lG+AJtd2bi5GIX3SS9fG/jxZ/Gg0EPr4AKbrCoTINtOQY1h2KA
	HAQie7ICqn2j0yoUoFOx3fUfDvqCSdAtYor2wovGq/9BAGxOYvc6CWKLYHcoXOpvsrk=
X-Gm-Gg: AYBFou1F7UbLIPcY3gU5uF8qflCPvRkdQgcXJRzFQp132srdSCfTx5KCJTUbUU/DJSp
	dJvp9Kjdncq04W2XGW9QaO8UnRKaKRMSIektj/JwnMQI53VW7CclYoeCS4dAuj3UVv6AMJeKy+M
	B4Li+cNK6+WeCENqscwhXGyyZE+wD6VQvxzEMT5oaTEtJxSXSlpCghEDYhYwtYPT938/jRPwNOu
	LYqjQoexHylMGdA1upRYqrt/TVKmzsaA8Clnhck5NbGswa/YrBXgp8Vo9EmPxT+jdUfvXyKl07J
	tN0tMS5VZ9R/HfwhmQy/58QO1Jdb1wZO45k+oF3TfwrLFEztNidTgK3pe2bleyAb8kxyA0R4E4d
	3GF1olC1csfCCbO7bcRhdW2tq97tKbglEaacxASYIw4SZ3s5r2Jr8xMv0TyRi9Rc4ot+A7kcgD9
	Sj9nKQu9NWa5uoUuwZvHlEh1IXtqoU37OEaRKnEOoX06xPNqjxOXWsEnDyKUBeVuBGc2w+CuvAW
	Njkcu/ZUCbe
X-Received: by 2002:a05:600c:8884:b0:4a1:80d8:aeb3 with SMTP id 5b1f17b1804b1-4a180d8b0f1mr16568905e9.12.1791366726900;
        Wed, 07 Oct 2026 02:52:06 -0700 (PDT)
Received: from [192.168.9.72] ([185.249.114.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f653d7csm54587755e9.14.2026.10.07.02.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:52:06 -0700 (PDT)
Message-ID: <e7c46f2e-fa6e-4cfa-b16e-8fa5d2112db4@linaro.org>
Date: Wed, 7 Oct 2026 11:52:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/45] dt-bindings: media: qcom,sm8250-camss: add pixel
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
 <20261006223953.3382273-5-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20261006223953.3382273-5-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 00:39, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Document the qcom,sm8250pix-camss compatible for CAMSS configurations
> that use the IFE pixel path. It uses the existing CAMSS property
> layout without additional properties.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/media/qcom,sm8250-camss.yaml          | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index a509d4bbcb4a..d561179be48c 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -14,7 +14,9 @@ description: |
>   
>   properties:
>     compatible:
> -    const: qcom,sm8250-camss
> +    enum:
> +      - qcom,sm8250-camss
> +      - qcom,sm8250pix-camss
>   
>     clocks:
>       minItems: 37

Same feed back as on the other binding.

Enabling the PIX path shouldn't require a new compat string - 
Lanai/sm8650 operates this way and x1e/x2e will also follow this format 
in v2, v3.

Lets please align to that and work to a common cause.

---
bod
