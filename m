Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3695D363C63
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725840; cv=none; b=ElZcPTIZqcFJ6xXAhSLgb93OYT+mKWb2tYQIeEdJ81hNCMPKYytPX53qV6Iu/tfHuwI6DWQFKXvK5FnObu+NzhmoReh6iq8YUxyP/f3grrWR1J2qMf4l0UzCCwVfIrsg5sxPJePlXJEYmzuVaYYlcoWTksIy5InQsDSiMGb4DL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725840; c=relaxed/simple;
	bh=TUt4IgCxtrSPH172R2/R8p3roroqSOduOa+0501w83A=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=q1MUMrF4JL16IMngqVCRTrqv7/avb8R2w+CjQENSJgEcj0ynYJGhX6db1y475TTFVMaY2LJXdizYdYsemoAIgs6+QMa5GM37Ev454XCohef7RsjacElBKxvhpI9z+KYO/qsj+CIMRf8oOVFHkAr0043rQvLsZDotcAJ32zkI3hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rNBTDmmn; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNBTDmmn"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-783047c8464so2148308137.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788725838; x=1789330638; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FPcJdKOhEGIyKqoQExd+dXzrnHFFn879UVtG9q8zpck=;
        b=rNBTDmmn0gWyg8hXGmA9c0qKadTeXlz46B+np9BjS9WYNX8nWz448l9OYnxkyKR7FW
         lsRI3lAvE7IYSwCw6lrscRaDjg5HIhP18uOZBhC9ue6s7xN70HxkY96RDrhuf9ItrTdn
         g4XshRZIsltf0vNKng4e58VHY2wCZloQ7IqH3Ig3mREQSgGdEcMp2YnqRlCZg8G3K41g
         StVHCV1+04JKbt+EmtRM30iwoxMKShJyucXEHr9zo1HRY0CtfyoubdDzg82SegZxR3PZ
         6QM8wWZvM2vm2La28fQXATLQORw1ODcO+X07FE5dKs5vCwUJQ4oliP2G2kZbUL/wIrOh
         LzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788725838; x=1789330638;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPcJdKOhEGIyKqoQExd+dXzrnHFFn879UVtG9q8zpck=;
        b=sM7DUb89qS50lR09mxpA19FEVW4P/d4MeHQraSh5GBXXIvN8bZTtUncHOMn5g484tX
         TNXlKyoljKUdL/zvTqyPnS6bpzbSbgkFFNoTlFKWchbqZ3gIPsmFzs4VWumy7VVgl2bv
         mLvwsk7sB/4hTbT//x3yn0wmjpR1BiR+IMYBdI2lU/qVYmMc7yPiVw3Si9mYzr70jJHH
         97TfRd4AGkbrMfK/h+0CneDy4UBPXa7p33NAWHhk9yadt9AItZ9F1m98nWDJtloyi3tG
         AIiJN+bjAdPujMbdVJ227Amln/m0qQ04eYJOIaSAhLnHQa0osYYzn19/PCYTRm0FyRWJ
         msag==
X-Forwarded-Encrypted: i=1; AKwUvByjOWpoc9nztVRleMO6ejFYvmoBBlkmyRpyrl4WDDWM5umXrzXr1rR5sMP5AnDwgYtXwaUzdVWxLPXuOPE=@vger.kernel.org
X-Gm-Message-State: AFuF++kB2FUydZT9jnmIzIcGrYeORzCGj4XnQJ83zLFaCknEf6NnVvHS
	uF9yTeysDUQOR79See+XVAZzjKQVvta/ulxqdWw10FmOyITmRBDmSmy1
X-Gm-Gg: AYBFou3PUkuBIGcGHJDgvKBvTGqU2aWVah3lMmGzwDIHpwYXH7XORS/YjnlhzRrqN6N
	uctdg3Z7qGct+xNsQhHkfI+tkA/BshA48WioSf9p8krKEoU6HKT8XuVej49IZq6L/n4HIV+mmev
	coz5B0OG8BuZc1K5quBKd1+pbtAJ/Y9LjBk3gvAT9PWafTM6QhWG6GkMc4izrqSuGCG7oKCulF+
	Y1ukTtQVdfjvFLDdA3OH6lEumcPHq+oqrdyYAtUhUFsCYmgYtU1WxvGrPtazcCuwiQRwZ6+Uxg7
	uZhhCKy6aW3lnbZ7rOh4yn5lP4ZhfwI3ZKwpg0m+SD0mrL9BTOYcSCX+WbViI+ceKslCR/AyFz6
	w9Qg4jglF5Jmnn2jEcrWmSQ+byEryYOfA9MFxuRplvt4a58a5PsUGXWZYVyi7wwqFAzGRfx0Fpe
	ZWFCsjmbWnHgYJW3IZpjpnQzhb8K2TWglRxLaUmtHcGg5gNEkBWQ==
X-Received: by 2002:a05:6102:f8a:b0:786:c86c:8fe4 with SMTP id ada2fe7eead31-78a4ab73095mr7872878137.13.1788725838086;
        Sun, 06 Sep 2026 13:17:18 -0700 (PDT)
Received: from localhost ([2800:40:44:f1f5:f400:4c49:91c1:9905])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76512sm5832057137.4.2026.09.06.13.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 13:17:17 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Sep 2026 17:17:13 -0300
Message-Id: <DL8IDZLLS2KT.31M9BO759E5H0@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 02/10] dt-bindings: iio: adc: support the TI ADS126x
 ADC family
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-2-1dc27e9c0260@gmail.com>
 <aae42329-f531-41fc-80df-2cb5e445f1db@baylibre.com>
In-Reply-To: <aae42329-f531-41fc-80df-2cb5e445f1db@baylibre.com>

On Mon Aug 31, 2026 at 4:44 PM -03, David Lechner wrote:
> On 8/28/26 1:38 AM, Kurt Borja wrote:
>> The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with an
>> integrated PGA, internal reference, excitation and burn-out current
>> sources for sensor biasing and diagnostics. The ADS1263 is compatible
>> with ADS1262, but includes a second auxiliary ADC (ADC2) to perform main
>> channel (ADC1) cross-checking measurements, system background
>> measurements, or temperature compensation of the primary sensor.
>>=20
>
> ...
>
>> +  '#io-channel-cells':
>> +    minimum: 1
>> +    maximum: 2
>> +    description: |
>> +      The first cell selects the channel by its reg. The second cell se=
lects
>> +      between the main ADC (ADC1) and the auxiliary ADC (ADC2) as follo=
ws:
>> +        0: ADC1
>> +        1: ADC2
>> +
>
> I like the suggestion to make this always 2 cells. Makes it simpler. And
> to put ADC first.
>
> And maybe make the first cell take 1, 2 so we don't have to make the
> translation?

Sure!

>
>
>
>> +  "^channel@[0-9a-f]+$":
>> +    $ref: /schemas/iio/adc/adc.yaml#
>> +    unevaluatedProperties: false
>> +
>
> ...
>
>> +allOf:
>> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: ti,ads1263
>> +    then:
>> +      properties:
>> +        '#io-channel-cells':
>> +          minimum: 1
>> +          maximum: 2
>> +      patternProperties:
>> +        "^channel@[0-9]+$":
>
> These don't match the pattern above (missing a-f).
>
>> +          properties:
>> +            reference-sources:
>> +              minItems: 3
>> +              maxItems: 3
>> +              default: [internal-p, internal-n, internal]
>> +    else:
>> +      properties:
>> +        '#io-channel-cells':
>> +          const: 1
>> +      patternProperties:
>> +        "^channel@[0-9]+$":
>> +          properties:
>> +            reference-sources:
>> +              minItems: 2
>> +              maxItems: 2
>> +              default: [internal-p, internal-n]
>> +
> With those fixed...
>
> Reviewed-by: David Lechner <dlechner@baylibre.com>

Thanks David!

--=20
Thanks,
 ~ Kurt
