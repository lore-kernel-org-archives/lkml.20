Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739ED3358B9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349130; cv=none; b=WWT9GkFdsq1gfdPkaUMgwq7Dk/rVdS0RiZDMJKC7OqllWZvHp2WrgMVjxc8nSMEdN63Lf3PKfBNL0Bu90y8jwAkwU1HhatRfdf6zmtA8Ui49bqfCGzm52zO+KSK2JBMn2hgPIFz/LHPrtRTtgZYRhwiaBMLDUsFgMbSzFfI8L/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349130; c=relaxed/simple;
	bh=q/jOT0aSezOBSpE6+6RycY5gUNZ6DERvx3WJ8/EXdUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G09ikt3XIcL8O3UezbbXWpvbmmgWmGMml7tHdgzujXFlMLpg768wPRXx7F4+3rWVDxMtnDbD/kJvQm9dVi+GJSnEthb6S5rSxdioflCKe/B+dpcuGu1X0miEaemLZiMMeQb61eWEEepNjkrK/hvVxQXHPaUM3Wen/PogrVYfCrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGAKfdLm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGAKfdLm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so8099115e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788349124; x=1788953924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYZ6NU8jX/7XJB8VagafYKNIpfybNyjtFYVwXJsyJqw=;
        b=VGAKfdLmwPqDAHyHZT0xMMWrql2D1RGgneRVFwxIBDo3gLR5RgRw/BxTQSXV9dYOPX
         erYDCfiaPvQjVQVhx3Z+m8a1LvOspwAQ8esrm+g/rQoGAPkRvSm53A/d6N98sWM02KHs
         S0B5dFuYwMxivRcGlUqybl99gsTi0axKHYgJYmVaK4KQk1Tk/OWQhvyieAIQOTI+kBC+
         tPkcU8NxRRfmcTIJJ0TTRI0ajBUFAINgvOhqSXGvhZTEy+YMhEHZZqSfytj1MX3rvegw
         flQz+sht0wuP/UIJos/JHjQyIA8cNVPt3qiy2uKx0bQ1s6txLtLuC7ch/8/hPPkQs7Ex
         OA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349124; x=1788953924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZYZ6NU8jX/7XJB8VagafYKNIpfybNyjtFYVwXJsyJqw=;
        b=skg1xk+zjIWTX+zZmRNMmHaxpzyKR/UFhECwEm0ZB7mvjh4Fy2e3EoBYo+G5LJz/h/
         1T+qH0M+dNZDdsrptGIzNzAaaBeuoXdWo/pQtjnTSqtuOy3VkF27yD5yTUE4TeYYvSL9
         SqsEeKDFZwrf4VuSrQHsQc8bmY7OlqoEGw2Tqmgm5jiSoKGQ2h1mwdtazZeQA8I/ojrs
         DInjiGqqNvFKKBafj76ZC8pmTKT9ZJLbwdioHtIsAc3eL9kP9zlP9AHXGm0WUg+i+Rd0
         eLFpsoLskQA7bmDIf0sE0kgFlxJNc/3iLJLRW0vzQI3+WIzJfc0w1JrbJMVqunn2pQnc
         Jjlg==
X-Forwarded-Encrypted: i=1; AHgh+RpRdcX3/MDpC7xM7Dxw13QjCumbSTT81jJs21L+b+kS/HIzH6p5CRk6BQmLP6ywBsM8Jnbxzek5w3SI8x8=@vger.kernel.org
X-Gm-Message-State: AFuF++lL5ntO+hDNh74q3ByJQ3HXgAtp+y0Y9ajCR9nxFrnUsOZqiR7N
	X7DFLxA6DSTUQt9LYGrCiPs5oQZ2Ks/FCGKIkd9TNBoWqOov4dfF2fn3
X-Gm-Gg: AR+sD106EPQTYx+luN/c4kyiprxowOoj65zsn/YPs2Jk5TkP5WF/XgM5K9xzXNko5T4
	I5tmkCzgzPC/yCk5oUEGeZIOaYsH3IlV5V0wH1GrgApRC+obe9SpHDekz+bmvQBBis70jK5tyNK
	jTClYzIRiA8dj8GmyHgURRIqJCOEACDOcPOjsS4PLRERvjwtbLfIfwdVWxMD8sbNK+j9E4/jn1T
	MPmJY57C8XmPr4wUQ+hbNcmvM3vGstI6aYp5zPVnh9rYDhISYxaniuHYdSmxsBnOASc7dNyZr4H
	1hTl2aofzwAcoVBaiG/Po6LenZaF5dwRsH7fj52HJ87OZE4G+MI9Ilf1AwZ7Vjwk2t0u19ETsx3
	RNIReRwtT4kgEVXUwOO15cNwwQa9t+5HeOh5OeBH20ErK6OYMxwjMqxm9DaNnpDr2QPiukvkuzk
	ZlAae6aDMnZog4m4OgmNg110Cut+weAXKkRhbbbnvDxvuSbzyxwpk1Qv6fn+2FDeQ3V7pLFzJ+c
	7Koyo+9XeSE2FBeQw5i9Sin6u9wiXM3LaGm8FPmVFMtP87aK424rx8XeA==
X-Received: by 2002:a05:600c:1d89:b0:49c:ed8f:d094 with SMTP id 5b1f17b1804b1-49ced8fd250mr10166605e9.10.1788349124161;
        Wed, 02 Sep 2026 04:38:44 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce309e418sm85608165e9.13.2026.09.02.04.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:38:43 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <7b7e4b45-dc5c-4328-bb51-5d1fac4c5586@gmail.com>
Date: Wed, 2 Sep 2026 12:38:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ima: allow users to specify the pcr index with
 IMA_MEASURE_PCR_IDX
To: Mimi Zohar <zohar@linux.ibm.com>, roberto.sassu@huawei.com,
 dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com
Cc: eric.snowberg@oracle.com, linux-integrity@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260824162215.1572367-1-julianbraha@gmail.com>
 <35ae5c9fd60874127d15f5fedb84c0a90e56eca4.camel@linux.ibm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <35ae5c9fd60874127d15f5fedb84c0a90e56eca4.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mimi,

On 9/2/26 01:54, Mimi Zohar wrote:
> On Mon, 2026-08-24 at 17:22 +0100, Julian Braha wrote:
>> The IMA_MEASURE_PCR_IDX option is currently not visible in the kconfig
>> frontend, so it always uses its default, 10. This means that the
>> 'range 8 14' is dead code, and users are unable to specify the pcr index
>> value.
>>
>> In a previous discussion, Mimi explained that users should be able to use
>> this config option to specify the pcr index. [1]
>>
>> Let's add a prompt for users to specify the pcr index, when EXPERT is
>> enabled.
>>
>> This dead range was found by kconfirm, a static analysis tool for Kconfig.
>>
>> Signed-off-by: Julian Braha <julianbraha@gmail.com>
>> ---
>> Link: https://lore.kernel.org/all/1feff118-4afa-4b9c-86f1-271a7a88208f@gmail.com/T/#mc4efa2491b4937eb7c9e532c29ffba516a70e662 [1]
>> ---
>>  security/integrity/ima/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
>> index b3a9f86809b0..2d5bb19ea6ac 100644
>> --- a/security/integrity/ima/Kconfig
>> +++ b/security/integrity/ima/Kconfig
>> @@ -46,6 +46,7 @@ config IMA_KEXEC
>>  
>>  config IMA_MEASURE_PCR_IDX
>>  	int
>> +	prompt "PCR Index for Aggregate" if EXPERT
>>  	range 8 14
>>  	default 10
>>  	help
> 
> Thanks, Julian.  The existing Help says, "If unsure, use the default 10."  Could
> we make this recommendation stronger?  AI suggested:
> 
> 	  IMA_MEASURE_PCR_IDX determines the TPM PCR register index
> 	  that IMA uses to maintain the integrity aggregate of the
> 	  measurement list. Most attestation tooling expects PCR 10.
> 
> 	  The default is almost always what you want. Only change
> 	  this if you know what you are doing.


Thank you for your feedback, will include this in v2!

- Julian Braha
