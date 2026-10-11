Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415BE298CAF
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791725298; cv=none; b=fJOM9Hc+PlBAlNkLVoqiDcAWwIOX/E1r5AEPzwLwSho3spfc9+8Dc7sjil6KLxU3Nbxcg66wIsKr4n+LjO3jV1AAhdh521ab8Arqg61efkDRmp+qZS7I2eud+Wya0aNa6Xma6caDdvFKgDRQCz9+GP5uv44ITFOg0pBarnh0R7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791725298; c=relaxed/simple;
	bh=bmKBnxSlrM9rBY26AIfTXLAwtzZx8fLdclkPI0vbXIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tkhZLT5SDuGrEItM60BW9HMPWSdTryw0vYvhRGmZx14Jto0GoH+6cNh5roNKfIlTMIDXpBQ/z2y1hS3kSF+QnjdrR20wVBPqVex4oj/QXnPwBwcvLx6Grq8nxhq5fAFbSbt5JHQB+KIE+hTg29DksOMprox6RM+R+b0Dd1BUV1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5GW/BQj; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5GW/BQj"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2e2007dd8bso189800066b.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791725295; x=1792330095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tmhk+556JexJYWbKIeWCGwz8JU5Skv6kMn9t5D0fvfE=;
        b=T5GW/BQjPxz6VsLIsP7UcXY1u5eotPfmYoNz2ZaumkqD1V9f2rDVKafqeoJyM/6rWz
         /ZPtOYXBwCsD3UcFtvjXqUUeFm5wVB4jzKfXV8ZG8Q/Zc7hGl27SSF1lqTGoLxt8ZHRl
         jYPJQvy07cx3REUG8Zrls1PvwATlBN9Z6LksYGnDmLXkuhOjhka5G8l2kwXyrlaIsOkj
         VtkmjH6IP29NNKpNyz0RGiWZjzEp0dblTCvUxj6GOkzHNGGowuZKd+7vFSYrCue1O2py
         JQAzyFZtrH7Ry5kU6m65TqgSQ5mQbsgAS3n2iJyAYLO/BZwZZbqIDzSYACLsyF8gqEA5
         qu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791725295; x=1792330095;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tmhk+556JexJYWbKIeWCGwz8JU5Skv6kMn9t5D0fvfE=;
        b=nFnO8kAcUzvqCJdAHTnES6RACDqlxTovf0vugKVbRrXuHvuylqeqbpJ+iVeadZFTwe
         29p+YgL62CUYfIGdfhj8VrFmN6SIFN2Wi/kxSD99lWkaBsSNRJIEmYzG3dEEmA7LcyyR
         xSpSHgzZIRGp5eZ9C+dL5fAHUqWvTFsaLriUeYXc8QcZuMDaZFIezV3yYSbnmzcYq+zy
         ynG/MEQZ/PO+j7zzPV2I5noFKGG7dRvi3ehuOc1qL2Lzy3C2OZmwnoccNRMZGarql3KS
         1kQK7xzBij21+WEf6jBRVO0bte1YZnU//0NXpYngab9PvQkiwpgDukdv/mJ8IjPjN0/1
         CPqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI5RGA9f6qv/X0EstXhXtfA6WYtVQfuohZ3eRnidKb9CBhv8dZPBhAfSaKbWf5riFTLc4D28xR1ermZXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpPzxDxn9cfYZTtXWW/xDzrORT0g+WBq8lvaG3elK3XyHNSQe3
	W/Qakk9+elsAQNE6ikDrS6XeSC9ONn8R/e4SEDl1iXA5HLcSIZg/Q1ENnXTRAQ==
X-Gm-Gg: AYBFou3CVL2MNeFKa7Vorboi2trI3JPEFaSED9EVgrJ9ru81Lpq/nmxtqgujuNzB7Ne
	BsJxYVb91i5Z+3AZ7ydszTMBhHbZNXgOI6OBArcagJTgb0QyQXY5tb3cVNfB4kXtRt9ZQ2HxsKL
	SBDt9k6p26VvvGgmOXGExb01B9dFrQhzZlCkKWs6VlOfFNDxIHmQSXrrB9UtdRogCqaYuIjIQyZ
	8B1rsEI3OsE51pjpLU2+ZGGmZF9WAK3Ui5RFv3ls0ctJ8V6ePPCMEddu96A5tz/A3T1jWSttzKN
	SFW3iznWwqOjZn75xe3OANTLz3q7Zld6GRdvYzU6NirtqXI6FWtT/AhCawjLIC5UMoTFRetbW02
	OvGqEsDzajNQ4e2QHL59cSDzj7Fj4HI5BR/ilC27xMHKjgO2YlX2oSJ297El61o0UZwNTNaORO2
	F2/lr244JC1uBfaijGsE/SNaUP5Ddq63k3wHBHyKDkccfZMpbTDtOtjoSYJ7fu78Ofr8nAUCpDa
	YfFKp4qvUz06y6TJFcM
X-Received: by 2002:a17:907:2d12:b0:c2c:d06f:cf89 with SMTP id a640c23a62f3a-c31a9a10df4mr621177766b.2.1791725295323;
        Sun, 11 Oct 2026 06:28:15 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ae6csm359503166b.17.2026.10.11.06.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 06:28:14 -0700 (PDT)
Message-ID: <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com>
Date: Sun, 11 Oct 2026 15:28:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
To: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261007085457.98762-1-clamor95@gmail.com>
 <20261007085457.98762-3-clamor95@gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20261007085457.98762-3-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Svyatoslav,

On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
> inhibition.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> index a65d92522c9cf..596b5e284f44a 100644
> --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> @@ -31,6 +31,10 @@ properties:
>       maxItems: 1
>       description: FL_EN pin
>   
> +  flinh-gpios:
> +    maxItems: 1
> +    description: FLINH pin
> +

You don't seem to make use of it in your patch.

-- 
Best regards,
Jacek Anaszewski

