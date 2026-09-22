Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7D53EC6B2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790058191; cv=none; b=EXYaQysM0+k6oCAsEncH5gFAHlefNgantJEazcvNNPg953kTmZCRdGwn6OsBI4CIK64xoKKQPDHtKB41TCBHOn4lFV+CIPJikWXUocE0q2eeFYAYyn3eVzYcivopPTc/pUgMI0BaSsIlfhs60b3e414RV1nxiMCc/kqPLUrarNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790058191; c=relaxed/simple;
	bh=xvaFz7vC2g0c23kySh4YpbizKgZYbTNUlJqPM/Prf6M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CWRwkPiAXHc2AB//0M7mldWmgXS2g9rQkp3aCCRvNmdN3MtRq9vx0aE2YqLrW5eh9ySK4rTBLnE2ZjoL4830Kzb6o7Pvy/ITZzboaaWDIkISQc4NI7E8VVHNl+w26ustKnWUPJnl67thxO5j4r+XtDQjkP0lYRNfSnZ5lxH8ph4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HLaQ8ZLd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nlZ7tGQD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HLaQ8ZLd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nlZ7tGQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790058189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/1jmYqRyXpyyU6dyrYgqvepUerNBQjNM+3vAXNLV/i8=;
	b=HLaQ8ZLds6xMt/XgYmcaI74JaehoLEoASWV6DLg3N5dlSiaj5eGkFTdIXHfroErHL5k3On
	bS9T9bx4KI2rKoEe7+rNMRT5qCn1ib36SRpWseIcJM9BdYj1rmSmULy+aSNJNIDmo98WBt
	Ge7LAl/Dbanm1qStON4gimiZqXupllo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-sc1gsnkONiGkzNNJGBVJKg-1; Tue, 22 Sep 2026 02:23:07 -0400
X-MC-Unique: sc1gsnkONiGkzNNJGBVJKg-1
X-Mimecast-MFC-AGG-ID: sc1gsnkONiGkzNNJGBVJKg_1790058186
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-487041c4c82so1120653f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790058186; x=1790662986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/1jmYqRyXpyyU6dyrYgqvepUerNBQjNM+3vAXNLV/i8=;
        b=nlZ7tGQDbW2x9wIj1jk4TeXvKCUHHL/2gPWFj9HhdN0G00SdwjXOVviWIVzpNa6XpP
         LTTapfX+4kByeP2mxE2EGxPmFdUIWdUrnWc5RjxJZO8Rfta5DRdPSIsPOAbGOslbhWVb
         yRfK3vRiYbXW3il4b5KwUmUcyzDa0va+SeSMTXxlFYQvrReQo9avaP8f9OPU25toRoUJ
         3fLsix0eev0AVzJWhoS/y6OLbOZ6fjSQPqEy1saqmFJUp8Tg5pVVqQVFyqMTFI5BpwzZ
         5+FbsyM2Hvka4tokj55Twa3zGxBuXTxdsTXDdxBQWhOfmXxEaWh5TfhuLsGzlO3vHYE1
         mzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790058186; x=1790662986;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/1jmYqRyXpyyU6dyrYgqvepUerNBQjNM+3vAXNLV/i8=;
        b=v9/Wu5YV0xrG/yNe16f3BNAiiXnUw3S9AwlIpINUVXapM/xOewUorz7uy7Z46QQOKb
         Z0ZDXcOkBXei58JSU4qP1VOnZ2V0WCs65tQJBfMzPUzSXzrdCNeYOMljSYwVtAWKgqWV
         aqVkj6G1hPb5FBFC1YOvwZaR/nVuwKK8qtKWQ0ZsDDON4kCIpfY3vk+0404AoTh6HQwF
         TaazO0v0MW12Z0libHGq1A4w2ueTII+kTsraFClH/HldDZZ2ZEgMiS/YELMYUftR9NJE
         4MM9AZlqsCzqMHy0xXFp6mKT6Rgy18BS+oN0baf6pvDakHO0dHE6MTGwQaV7hkVkpUoi
         uypQ==
X-Forwarded-Encrypted: i=1; AKwUvByhqTwHCCg5n3Pv4ci+AxHYq/1tk5UCtvUOnl6H3DhG18jrhVNRNK9eS/YPGIlcCxymHosm6eRQbLVGOBg=@vger.kernel.org
X-Gm-Message-State: AFuF++mTkbeOs7CS3PLnLd+CaaW8dsCLtQ7yDNjCiK1urPN2yNCavoSe
	cOQLukY/lS6b8doGCXuYch+XUL4/ZQ7Ims3NQfuI8Rw04WY52J4fIvDksPF6LeNq8Nasjw/Bosn
	68r087iiropn5Ge62RLcpjM8ZDc+uwK34YlG4R16rsaURYEnE5fbLOeuHobaj9BGDew==
X-Gm-Gg: AYBFou2+oITrU8a4Ub+u31n6SJOYLv/u7p5ja1eZ/vscP3MHfCmNHxrgCpBCQzbfltm
	M6i7vZ5IcOVjxfKdvK6MOyTYiuWf/m2/nskUVXTjEQE519oTXTozylGlaLasERSkG+fIDK6VU70
	PJ3uhue8gldHRASWSpsOo67e3qcl8hzTx98ctDFopXr7lWtJf/SH85MVHLU2XsDAye6Dd+A2/F4
	2PH8hKNkeXvapcw2VGcMngNm5JosJVCjiQkU7EAl4D0rZBQUY9A6QJaIyRGS9OUE9dqz5OheXhP
	T/Wt4UX35N2XFHBNmHbzzlTWCB8vI8BzhSgNpJ2fsVxCeAKufhoppdigoaA48gHelKqQxM0s
X-Received: by 2002:a05:6000:40db:b0:485:9b35:a20e with SMTP id ffacd0b85a97d-4871e3c2896mr19375334f8f.56.1790058186291;
        Mon, 21 Sep 2026 23:23:06 -0700 (PDT)
X-Received: by 2002:a05:6000:40db:b0:485:9b35:a20e with SMTP id ffacd0b85a97d-4871e3c2896mr19375324f8f.56.1790058186012;
        Mon, 21 Sep 2026 23:23:06 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789129sm2745795f8f.22.2026.09.21.23.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 23:23:05 -0700 (PDT)
Message-ID: <dd31022e-6211-47f8-b123-edb589dd0471@redhat.com>
Date: Tue, 22 Sep 2026 08:23:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] of: fdt: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 of_fdt.h header file
From: Thomas Huth <thuth@redhat.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20260619160234.69568-1-thuth@redhat.com>
 <a37baafd-56dc-4733-bd7c-c92a8b8c1474@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <a37baafd-56dc-4733-bd7c-c92a8b8c1474@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/08/2026 09.40, Thomas Huth wrote:
> On 19/06/2026 18.02, Thomas Huth wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> While the GCC and Clang compilers already define __ASSEMBLER__
>> automatically when compiling assembly code, __ASSEMBLY__ is a
>> macro that only gets defined by the Makefiles in the kernel.
>> This can be very confusing when switching between userspace
>> and kernelspace coding, or when dealing with uapi headers that
>> rather should use __ASSEMBLER__ instead. So let's standardize now
>> on the __ASSEMBLER__ macro that is provided by the compilers.
>>
>> This is a completely mechanical patch (done with a simple "sed -i"
>> statement).
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   Note: This patch has been split from an earlier bigger patch of
>>   mine to ease reviewing.
>>
>>   include/linux/of_fdt.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
>> index 51dadbaa3d63a..72b452e388eeb 100644
>> --- a/include/linux/of_fdt.h
>> +++ b/include/linux/of_fdt.h
>> @@ -16,7 +16,7 @@
>>  /* Definitions used by the flattened device tree */
>>  #define OF_DT_HEADER        0xd00dfeed    /* marker */
>> -#ifndef __ASSEMBLY__
>> +#ifndef __ASSEMBLER__
>>
>>  #if defined(CONFIG_OF_FLATTREE)
>>
>> @@ -103,5 +103,5 @@ static inline void unflatten_device_tree(void) {}
>>  static inline void unflatten_and_copy_device_tree(void) {}
>>  #endif /* CONFIG_OF_EARLY_FLATTREE */
>>
>> -#endif /* __ASSEMBLY__ */
>> +#endif /* __ASSEMBLER__ */
>>  #endif /* _LINUX_OF_FDT_H */
> 
> Friendly ping!
Ping again!

Rob, Saravana, it's not a big patch, could you please pick it up? (or tell 
me if you don't like it, then I'll stop annoying you ;-))

  Thanks,
   Thomas

