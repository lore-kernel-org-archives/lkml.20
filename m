Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2967F3385A1
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791740159; cv=none; b=mYJMCY8PVNUpOyYVeRT0en36cSNXT0kKvMLbLJvgMu/LtKwFmA7HSg5r2DsW14PDaaat8iCAeP6nOdMSJ2nBPx6g5iE2G4UZzX7pnPLgCk/2twiD2gZLzPORRZLJM2mHvZXFSVJ7cU0A6tkGyTGTkfgpiN870WlVyctimhWol/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791740159; c=relaxed/simple;
	bh=BA6Eq7SxDm1L8zEyXbbvdU/Ub4OE26FS6uK891J21U0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pnIW12ccUMIbOG/NzQ8oIqez+i8KtbmmmlNaiMKT9wNgTzNX0tJbIoB7IhYUhHvWKDYRxQ+YfD1DH5g3/Z3hF+CR2H2uis9+vZdGiCJeRqu4mh/xhb86Rg3hBYtw5QsWK4n7TdidwN0WuQaUuub7TF6+Zl2IuFoTKY//9nhE3Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dePmDayW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dePmDayW"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c31a34de844so181288366b.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791740155; x=1792344955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=crwJpou1dc4UoRYz8bgCYYV5fnDg/uzo/t0oCNRfcv4=;
        b=dePmDayWmv8v0mwSzR5nVk15cgoAHarFsNHNDSXgdCMv2nKjiNoagrt901O76U3ZaT
         ViR3hutQjPwdEUfQSSU1Pa4p8HkJk/nRelBepZWCzpR4Y6ckXYDEEhrDCHxDt6lkczh2
         y92xapLFiVA+lhq5Y4c/JNmFUfLJwIlAAHKzD3k3HBzfj48+5ZrDe1NzM4asaZikFNUy
         D0RVQQyu/DO2c/KAIczkRwiqSmKFZqmkrww4/Tev1miwV+7C1l9b0gEWQuCs/mlcaSOs
         HOuRtD5ud2K/Sp6iV5+hh60Xh9TMmPLOVJOU69Niu8hctfVdu3nFat0S8oG+7ixpEoDG
         6gsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791740155; x=1792344955;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=crwJpou1dc4UoRYz8bgCYYV5fnDg/uzo/t0oCNRfcv4=;
        b=rOqafr8HcAdBS8hydVscq8+XjJYB6Afs+jCmCqILMoYHZQHWtXx5rt3hRPdE9VNZKc
         1hEM/ZCCFPf0QNeGnG3p4kYgCid0eOhb5WSKtnCB5IgYiBPOCtfnW0PQADqnQM+C8YKy
         K/tWApgzXhFgTv/UCLHiIk48WMKo0vENcRwprzT9yEjF2RgpfHUn/X/pnt+Vt6wRFHat
         VM8ivCovQUcyWFSMSrdLHhg0oBKW+4ki1lV6+Z2dyVJ5JaK2ANKzANi7b4XRIeHbZ4Dz
         UeIq0fq05/8gO9jza3DVkjClXvHVoAzlwtiMuwXZloEoR0BWC1yH3Y28PtPZPX28uP2X
         6NIw==
X-Forwarded-Encrypted: i=1; AKwUvBybvJNSZ+eBSLWjMT0J+agze8bE2fnxJKQonwLJ/oWvfuqw282zn5a59tSRv3BF/Iwqf+xXR1jaCBM/3Do=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFV77n4v9YeEFCL2Re74X6Yw0VAcZENgEMh21djX7Z1Nb7roI9
	KndqUhhwY076oLyeM6czYyXYwRTvq6742gLbRKMECN8n64SXaTKRWJew
X-Gm-Gg: AYBFou2DKWD4NC2RnaFzoAOYY42T1kWbuXS0pSXsMf+xS/0Oe6JI4hRr/n957DINYgp
	haeM3Bqy3sAvUs2RpDxOcm+x9KgTagn1rXPaMGzswaEUdawBkisrzw+LwHDtqwmIrLjyWf0fcc3
	Zzd9Gb2YPpUuC6NWijalHMSaVkLTjJNKMMs2tt4877O6coikKEJQvI6Fza427YPbC5tIxkFJ42C
	e2JhF8PcpNL+VdipOGbUDz0aqNY72/tbRmJAgXXsvHPfff/MhVqxbkMV6X3/FLM1hw7bkzbC76F
	+iM1ul88ePicxQ7C7LuU/6J1YIJ2ifmyXvd76vpB6lYropNNFdVoe2W7SPPx1psH/TS6f5IJRPq
	U06bs68uN4khLtxJ5Lr7IbWdy1gujw2PrWvhdszEgu/pYbpwi8EbCTQM5+RDaVfKgkSGrhyYCfE
	luQvMbv8nAP3g6YPbM1B2cByzPLGdJeBZjMFcioIIxcs9G8ZIz8o4D5efatV+gT3nZQoWflfYue
	hM4vcinwqqs6S2NDJVW
X-Received: by 2002:a17:906:c106:b0:c24:6f60:3f7e with SMTP id a640c23a62f3a-c31a9a28f90mr757418966b.2.1791740155162;
        Sun, 11 Oct 2026 10:35:55 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3bbc9sm381019766b.20.2026.10.11.10.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 10:35:54 -0700 (PDT)
Message-ID: <4abc72fd-c645-4410-9387-3f03c751fd3c@gmail.com>
Date: Sun, 11 Oct 2026 19:35:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261007085457.98762-1-clamor95@gmail.com>
 <20261007085457.98762-3-clamor95@gmail.com>
 <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com>
 <CAPVz0n0FiT93626L3MnMCto1X0_FmWp_zzQpQ=yRBXn+ir6OPg@mail.gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <CAPVz0n0FiT93626L3MnMCto1X0_FmWp_zzQpQ=yRBXn+ir6OPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/26 3:55 PM, Svyatoslav Ryhel wrote:
> нд, 11 жовт. 2026 р. о 16:28 Jacek Anaszewski <jacek.anaszewski@gmail.com> пише:
>>
>> Hi Svyatoslav,
>>
>> On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
>>> Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
>>> inhibition.
>>>
>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>> ---
>>>    Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
>>> index a65d92522c9cf..596b5e284f44a 100644
>>> --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
>>> +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
>>> @@ -31,6 +31,10 @@ properties:
>>>        maxItems: 1
>>>        description: FL_EN pin
>>>
>>> +  flinh-gpios:
>>> +    maxItems: 1
>>> +    description: FLINH pin
>>> +
>>
>> You don't seem to make use of it in your patch.
>>
> 
> I don't have to use it in my patch. This change completes and improves
> hardware description of the AAT1290/1270.

Still, If we don't have the use case I'd avoid adding it to not confuse
people looking for its use in the driver.

-- 
Best regards,
Jacek Anaszewski
