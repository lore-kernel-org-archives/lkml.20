Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FAF50129B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860727; cv=none; b=NGaEpSLi++kitDSSErPIJ4aExCP8y17GckZnJCpMZjpgfdUOSnpByvL/MfRsyhOb2sJ4NCL6MRDqjOWEMaX73tXzK6yIdGWDxqdm+7zfI5fTPr90eZ4EvFDnSpmr9hxExeKhi+BVCAb2VodbqYGtkcds1tP8E5f4xljqpngsQ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860727; c=relaxed/simple;
	bh=9WLH9+Lg9mafi3RlCnOSyDHhnDNxTttruE8nd/FvIYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UHOT66tJ1vNOEe7b9E5fCxVBX60hrxBz5AwrfmDX5OzVLdeWPSmkaZUcv0D/j5nWyW5zfvqTHbKh2CebT6dOhBlTgf1QcKnBE0TXdovrbJn434RFC6okJ3/j4unYB4+HERv3oCWmOamasvyiZ/QdfJRLXUDyI3nVonkh2UnJXVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=0fcbau75; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="0fcbau75"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae19319854so2729520a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790860721; x=1791465521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6Ys2U4rK4qRXJ88N00bl2NDAdA3PBqSlYtGtuTGakU=;
        b=0fcbau75QofeflcSgGjWEB8fDEqBkrVBm4osxpGYP/tLHy8w57voi2CcWBqEw5iaEP
         6Qb1iM+JGuAlK/r06aUOA9G/Ve0K4V/24SZkK/C0xA9lBwdo8TFdo2hiuiLHSyqEhFTd
         wpKTljLLT2xhbC9sB0V5d32DgNjiEXeLoy5Alt4Jyw7wyZGLdTr0W/orIcDTn5Nw6gYA
         26Tds6Dy4fASrOz1sGSeM99b45u1r2lTonlA47Q2G8flYmk+7JtCIxzg9qaHSfis9vHf
         SVCMsAbm0zINgCmMgo3XMKX8A28hPu2dDLItU/Ec1db2cpwScnu22w+GFeiNY8m9lfWM
         qo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860721; x=1791465521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w6Ys2U4rK4qRXJ88N00bl2NDAdA3PBqSlYtGtuTGakU=;
        b=zCn8O+y+YfpyTxorE9FuNgc9aVw6gYlXGlkWtze/k5nPnSE2ucA4bDvON2kSG2G9O0
         iRitmUjq/wwI4RMqJbd4deIEQRVI+M0cqXfhi6LEW7yFt/kKNs4+J0E28CHDT/AqUyWi
         EzzwYLcYsJqcXLnuFCLAZKmLKDytM5Vd2T80L5ez0aq8xWl9jbWVMfWgyUk4qhBE5yDh
         cVKdiTi4M8JLLckjB1i4C/pPAfz0B7cOeFMgh6EHN+iyiy6Bd9na3X3kGRcAnGZrR885
         hno48xiY3ojsQUB1tb0wFEoAUV4HrgCPHgxw0+GM75Z0hqf3u6SjDkFV9dkvS32okMR6
         ZVLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnC4LqMPYQHM/IQZysaB5scYM5AZcRVZe06fgX4jy8wkqxShi2VEC+OsKpfxjcIXYcdh6z6IVXPBnFV/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7Mk2utBhuEz6xfW+4jUWxIc1WUwsWUVC/SWLIGKR1ju98iqkh
	bRqTa09pWc+3kDWVRJxbyqB6SiSma9Cj/Ile0VegH4xE28DjAui7m4RxqGwoSIuNZPc=
X-Gm-Gg: AYBFou39cK0jrrBZSPgnLtpc2KS3QkRlvew3v/dgwe/UyCtkdtvKW2qsOkoni43HjuZ
	E6UbyZQNdqN1YTDdG+1fPTjhYlPXeDk4ZlJgFYUwzkN+HszwzFbHhADInbMiqoglZqFyiti3wXo
	a8DEzslNIGoznH20eQNmrAGoFywFrZVWUb71YCwGkMZB91E4Ofv7p29JSD5JaYEFN398j5IY8ZE
	Nq1XsNWsxp8CnI7RpRLhINnYNM67R6066lmzmqoYyjggBowIUt5FMkgAsSNKf94yX73uSFnUGdV
	Kk9zJ21ItFaojsna1rKG76KoWy05iRKQEQ6UkAQ1K/vtRxh9CdmRZnqPxUMAug7GaijWfS+Lha8
	O+WpWqA+20EYBe8FMz5U3+MRTfa6o3kGGmamAPIXrffqF0F1ue7btdQkdUc9aYRGxmLXs9H1RC3
	hBdrflWV4KTnwlX2TWgvlcIFxSNvAcu6jh8H8LTMoHTUZh9qKaQOe6Rzmq1MwizlqEydytjAvhu
	mcGCR42K1ZMG43RC/XgvlpE43vVcjF42bpz+hGYUyjt0qgzHxp5niYq7A==
X-Received: by 2002:a05:6402:2794:b0:6ac:ae52:8b75 with SMTP id 4fb4d7f45d1cf-6ae19978a4fmr3453730a12.44.1790860676581;
        Thu, 01 Oct 2026 06:17:56 -0700 (PDT)
Received: from [172.16.220.225] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca63130sm1146160a12.20.2026.10.01.06.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:17:56 -0700 (PDT)
Message-ID: <16efc0e1-8986-418c-87ba-9bf1ca4e4088@fairphone.com>
Date: Thu, 1 Oct 2026 15:17:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: dw9800: Redocument
 DW9800K
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Luca Weiss <luca.weiss@fairphone.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
 <20260914-b4-dw9800k_cleanup-v2-1-6553273aaa33@fairphone.com>
 <20260916-meek-qualified-penguin-fd8cea@quoll>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
In-Reply-To: <20260916-meek-qualified-penguin-fd8cea@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 11:06, Krzysztof Kozlowski wrote:
> On Mon, Sep 14, 2026 at 12:25:56PM +0200, Griffin Kroah-Hartman wrote:
>> The DW9800K's properties are too different to justify sharing the same
>> bindings file as the dw9719, Create a separate bindings documentation
>> for the Dongwoon Anatech DW9800K with it's updated properties.
>>
>> More specifically:
>>
>> The DW9800K did not share the SAC1 and SAC6 modes
>> that the DW9719 used.
>>
>> The DW9800K does not actually have a register that matches the property
>> description of vcm-prescale, instead the description of the clock-presc
>> in the DW9768 is much more applicable to the functionality required
>> according to the DW9800K datasheet.
> 
> I don't get why it does not match. You have exactly the same first part
> of the description, look:
> 
There is no inherent difference between the two property names, the 
values that the previous binding was using was completely incorrect with 
the hardware.

The reason for this discrepancy in the first place was us guessing which 
properties that this driver would need based on the datasheets we had 
for older dongwoon devices.

> dw9719:
>    Indication of VCM switching frequency dividing rate select
> 
> Your code:
>    Indication of VCM internal clock dividing rate select,
> 
> Both are dividing the VCM clock rate, no?
> 
clock-presc is used in a different dongwoon binding (dw9768) which more 
accurately matches the function of the hardware, So we concluded that it 
was a more appropriate name.
either way, the values we were using with this property was completely 
incorrect, so it had to be changed either way.

If you'd really prefer us use the older property name we can change it.

> Best regards,
> Krzysztof
> 
many thanks,
Griffin
