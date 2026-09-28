Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ED547141C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584479; cv=none; b=YFe8gDpzw7ieZzhE10kS9c4y2SjVus8AtRIeekPOqmIvARqGGkPYrphj26fNO6GOvx1VpNm1gJp7iCILWT1/eHwwKeTUGyz7OeLsRFNPXVPQYXbuf0gXr1Dw02JDBUXUC2GGQpKV6OW5S8nJxLM73hZBpyAlG8iI3IxsqwE7P/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584479; c=relaxed/simple;
	bh=cLfeyMYlE7LALUmIDZ09d4RId2E8nj9jM9ks46yKFFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMovKgvxIvTqPk3rByNv2/HF2byvUjJ422Ky+gXsqvp3h2W9y+VrT9aEk+5IlYLI58e8VHwqTW/7bECaPkaV0BPUGa7aLOZfSz89D867cOmB30lY3vJy+MlOMD9zLJio8wqdO/FjzrZwrahg8dccB2/UgQMPxP0r6fySp1tLCik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PfosCRyj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tV1u5yPp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PfosCRyj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tV1u5yPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790584477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uzwrULNhYSechUNjVS/Fi9ktEtQS2wEO+pXDyiHKO9g=;
	b=PfosCRyjLGVC+zNxoMbw+qqYeNxeHzxlHg9l65JChOwfk3GDbmlr0+iwzp9+ddQLNVp5Ee
	vPowMGA203Kkszz3VgRieGtStGwECFz4G8lsibzZ/BmITtaCsH4RgwIw+98qK638BATUHw
	bshBOHdjNZbigkzxJ/2ntjlU4VG+T9I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-OCSaU2PLM5ORsuJu3Pal0g-1; Mon, 28 Sep 2026 04:34:35 -0400
X-MC-Unique: OCSaU2PLM5ORsuJu3Pal0g-1
X-Mimecast-MFC-AGG-ID: OCSaU2PLM5ORsuJu3Pal0g_1790584474
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4887efa4486so2095270f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790584474; x=1791189274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzwrULNhYSechUNjVS/Fi9ktEtQS2wEO+pXDyiHKO9g=;
        b=tV1u5yPpMqmbU1Oj32a7wZZGpcz1QuHwrnmjgA2kXZ3Az+sPsvr+3wId40+LNDj7rT
         RPDqN8/Axkwxvz9fcvsU1L3CGfFZJq7Bii/rZH6OuYBYv6EDQI3s0ywoLZxlD09zj/n3
         8UgduSItlKldvAxykhPlV6dC7SiKV1r26XxBOY1pMPjVrL4pKSVV9wTMi2tpjYNzjj6O
         RZ3YCnl1IWHULvp7R94CalrGATjz5gpiahWXa5l54JScXE6TqQlGZfqfFTDvyIiRsnL+
         RHxcrSoddgM2wVNV8NMBhytMwXKfmuDMaH4IznE951YON5pO304lhVIWxQ66L1CIoyf0
         MY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790584474; x=1791189274;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzwrULNhYSechUNjVS/Fi9ktEtQS2wEO+pXDyiHKO9g=;
        b=b3d764g8Ewuz8IqOmHM+vDtuJARs0rVnVTRuFNw80JWaKDYvVMO6mneMz92JOBjhki
         FEVJks3Er3TDaq/yjCXtyA3zI3X5pXq6nHFFjQP0augthNxSgJEYXil2JzUHC/ZwaJjT
         i+tqDShEb+e3HT01Y80d15rchwnbWnK+bQ1JmFFeQQjv7uRzRGnQ6/aGtJxCba3E06E+
         QfU5Ckle6RPFJ3xOxQg5D2P8iU9rfeOKOrd86ugTq/O6VkyzlLKDWy7+V3N4f0f9d23v
         V1WcNMXD2dhESnyTqlHviTaT+NxX28yoqJ/pZ0DSv6/nhlE6juDTL9g3pjG4SA6IOvZe
         YlJg==
X-Forwarded-Encrypted: i=1; AKwUvBzlEW83P1cUzU73NYOAmBgIFEyqhJCvjwkpVhkSu7/BRDrY4Jvv+q109oi94msfwguTLaLR6Bv3zWNzl7k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgSMVvVHCvKGxjKueoyNPN7op2s8IEv/cqEeN/tcqRdGO1aLVL
	csh/EjNjtWH3020M4dpg/rsBs1zNG5cpXy8EiaLHOdnfmN3HAia75OdDOSZrQRROCW4WK5zN0P9
	j+8DR8HOI4bxFzGojAb5e8nqMOIPo30aVjxlrQcUfNf2n3bl9dUplTlppYr4jB9sHxg==
X-Gm-Gg: AYBFou1u6mJ47OzFR5KQuRwN15UgiV9IUhbmcutJtnKWwSHAR6Vq6uYMUpuuzETa1E7
	o8krMQ1Q47cYmH1bH+mxAy6kptdkh6c5t74GviP5EzI9U9vOnW7ZqT4LplqdhTKfxez1Sipw3x8
	W6VVcY0BRZ35r5qCOSG53uerkhsxpBpB2uNZwtza986vWV08raYt/KVtS/+9wr9jXwP3g/PKKQ9
	V9cA0T5bD19jNQT3tC9+TTSYTuxBK2BH8397WJERxSeCuieTgIh08w603YWmJT+fuvYUPv99vQK
	qvTgoeMQnUGmPWorJc08NdMqa0kAGz2Xjh8TNAzFH2t13IiBrl2Npnpjp8vI1GovwRJhDO8W
X-Received: by 2002:a05:6000:178d:b0:488:8192:c765 with SMTP id ffacd0b85a97d-4888192c938mr18877197f8f.18.1790584474466;
        Mon, 28 Sep 2026 01:34:34 -0700 (PDT)
X-Received: by 2002:a05:6000:178d:b0:488:8192:c765 with SMTP id ffacd0b85a97d-4888192c938mr18877142f8f.18.1790584473923;
        Mon, 28 Sep 2026 01:34:33 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a648895sm25850940f8f.28.2026.09.28.01.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:34:33 -0700 (PDT)
Message-ID: <5a5e160c-e3ec-4142-9e19-63b49ad922c4@redhat.com>
Date: Mon, 28 Sep 2026 10:34:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/purgatory: Compile purgatory with -D__DISABLE_EXPORTS
To: Eric Biggers <ebiggers@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260925130217.3912329-1-arnd@kernel.org>
 <20260925191635.GC2060@quark>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260925191635.GC2060@quark>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2026 21.16, Eric Biggers wrote:
> On Fri, Sep 25, 2026 at 03:01:49PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> A previous patch fixed compile-time issues by setting __NO_FORTIFY
>> for all of the purgatory code, but this is insufficient and still
>> leaves build failures that appeared recently in linux-next:
>>
>> ld.lld: error: undefined symbol: __memset
>>>>> referenced by string.c
>>>>>                arch/x86/purgatory/purgatory.ro:(__UNIQUE_ID_addressable___memset_2)
>>
>> ld.lld: error: undefined symbol: __memmove
>>>>> referenced by string.c
>>>>>                arch/x86/purgatory/purgatory.ro:(__UNIQUE_ID_addressable___memmove_3)
>>
>> Set __DISABLE_EXPORTS as well, to avoid pulling in a reference to the
>> wrong string functions.
>>
>> Fixes: 65cbe410d312 ("x86/purgatory: Compile purgatory with -D__NO_FORTIFY")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   arch/x86/purgatory/Makefile | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
> 
> I dropped the patch this fixes already, as I mentioned at
> https://lore.kernel.org/linux-crypto/20260924174911.GA1978@sol/ .  It's
> gone from linux-next now.  I think Thomas Huth is planning to send a
> fixed version, together with the two patches that depend on this.
> 
> But compiling all of purgatory (and not just sha256.o as is the status
> quo) with -D__NO_FORTIFY -D__DISABLE_EXPORTS sounds good to me.
Yes, I think that's the way to go, and I've now also verified that the 
change is working. I've now send a new version of the patch here:

  https://lore.kernel.org/lkml/20260928083055.104266-2-thuth@redhat.com/

  Thomas

