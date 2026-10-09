Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5524FB9CF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791576995; cv=none; b=I2lQQ33OYHwPf+0mwChXTW2SDHi1lFECdHIlOgAtfm8VnU+gGn4AVC49JQR263OjS1XAm8FcWZgGNkPh7f/qkjWcloRsYEDfYg2zJJTEiJiAGiHfqFZ4DLEt8G6tcJC6MKyw9Vy8JUhthkLJ1wPlHwY9KYlAtV/hbR2WDELMAc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791576995; c=relaxed/simple;
	bh=ug1UrfKuRfaHBPrwL3OQJ4KydFLAWT7KvToxSSpT4fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGWLew2JT7gjwZABxXjK8mE4ukcmu4oFL3lYxOgtEGpnuCnNxe18yT8wb/9p/wJy1cC6kLVnRqNQ9Ejc3VynUXo1KLpnxGQXiDVYTwubUPuCa9mJgNFnbn5F3CFkn6bm/ZZqISQVCFKLDdME7QOtBpSf4g65gOQgpbi6bj1a/oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bXLkQn63; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bXLkQn63"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791576993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06oOQhiRccqg5uPYKG9qboYKXJc4u6UZT5IOyGCRZqw=;
	b=bXLkQn63cZIwFcHM9D1aJvMpgIiWyN8oxpUCx5KaWTANEYeKcxxv7xXDdQ+PL8tFpjRs+Q
	sy0nrtyL/zKNps6GOLSavfkHikOzciBlmWtYJ5XlI130Nw9EtfzCNWHfGNw5A/gMPGHCXk
	WHVXKsDbipnAflPsDk3MskvTYDw5N/U=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-chXbuhyvNc-DNl8bpaQ7vQ-1; Fri, 9 Oct 2026 20:16:32 +0000
X-MC-Unique: chXbuhyvNc-DNl8bpaQ7vQ-1
X-Mimecast-MFC-AGG-ID: chXbuhyvNc-DNl8bpaQ7vQ_1791576991
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93be1861d2dso7759685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791576991; x=1792181791;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06oOQhiRccqg5uPYKG9qboYKXJc4u6UZT5IOyGCRZqw=;
        b=CtVJANRIEllo4gx021z40E1S95HGAkcrS1tGMDscDaDrFS/gBqo64eMxqYAdY2lD5T
         KZ+soYlWtkYj4AmeVJAayQH0kbYht7UnZO0JATxUwSneweiIBeVZaM36OwcZvgE69WbK
         u5vt3SmQHE62wESy/YFHy6AtHv3atUuxhVoR6xz51zfY7b7Bb8EGwY1V6Jj2WAJEmJDd
         rorkIaK3lHuaD7Ser57tyNjq+BWsUrF1gE6Fyh5nefAJCkOKZgsjDXs5vF8w1IzNs0aC
         +8c35wjB7upsXMwxKh8xbNDIR9wTc3aKKeqcycHi/8op3ZbpUS5g5oKXtNg51J7UES47
         SBDw==
X-Gm-Message-State: AFuF++nLIyTkf/acEheO2cKyEI634sxhgFwPGR1M6D3QULCHibT62dmB
	mGm0ofi1/jXJBrPKYpxZmmw21dmP170tvoVetGqIXNiTflBWBCvlvTV57JlRuCG4xziTDtayuj/
	lwVzzTmCS6rkEfjNkneHv7nxgQ10BAKrdPTbOqulrJOjhxl+XQEBK7/FuOXyWzJBbf1GWYUFT5Q
	==
X-Gm-Gg: AYBFou20JtyqRQXFkQed4ToqcDPUWWkZfBsYLYbtzsyl3RrwDN1YR8SUlrKrrFxRNFO
	X8mUS77XATY1MFUrkhYO6R+btYtqxmRJ9gVEGccWjcXYv0RSl9p/zO+6i2L0B37uPfGKho8tE2p
	dGncMwiv4QkbRaFwLxFQa3PiSrZkkDB3z61mNniORktPcY99hZqBeVRHu8uXIDoX0oPx7iF8YTn
	zbtOlDeWMhk/QnSnfyiRGTEWZvRNGnCawa1CN2lY6npDeO7RXCd8atEAeT0jWjQgtXcBYE++UTH
	gU/tC/oIMdIPIzXf3sfvRgD94+bxGIHmjbi0OWJf+m/idlS6JQe79rhbvCW4cpljoaeiy4hhhTD
	PdcE=
X-Received: by 2002:a05:620a:1793:b0:93e:c12c:440a with SMTP id af79cd13be357-93ec12c48f5mr367251185a.70.1791576991383;
        Fri, 09 Oct 2026 13:16:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:93e:c12c:440a with SMTP id af79cd13be357-93ec12c48f5mr367246085a.70.1791576990896;
        Fri, 09 Oct 2026 13:16:30 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98cd599sm266356485a.39.2026.10.09.13.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 13:16:30 -0700 (PDT)
Message-ID: <e7c7e8df-b1e7-4796-baef-ca5d7676688a@redhat.com>
Date: Fri, 9 Oct 2026 16:16:29 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86: remove the BIOS memory corruption check feature
To: Thorsten Blum <blum@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>, x86@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 corbet@lwn.net, hpa@zytor.com, "David Hildenbrand (Red Hat)"
 <david@kernel.org>, Mike Rapoport <rppt@kernel.org>
References: <9e1a161e-9246-41d1-9651-ffa85b1bc99b@redhat.com>
 <asktOXVRiXNOTcqH@kernel.org>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <asktOXVRiXNOTcqH@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/9/26 2:06 PM, Thorsten Blum wrote:
> On Mon, Jul 20, 2026 at 04:41:05PM -0400, Luiz Capitulino wrote:
>> By default, the BIOS memory corruption check works by reserving the
>> first 64 KiB physical area from memblock, zeroing it and then scanning it
>> periodically.
>>
>> However, this functionality has been broken since v5.13 by two commits:
>>
>> - Commit a799c2bd29d1 ("x86/setup: Consolidate early memory reservations").
>>    Moved trim_low_memory_range() into early_reserve_memory(), which runs
>>    earlier in setup_arch(), causing the first 64 KiB to be reserved (when
>>    CONFIG_X86_RESERVE_LOW=64) before setup_bios_corruption_check() runs
>>
>> - Commit f1d4d47c5851 ("x86/setup: Always reserve the first 1M of RAM").
>>    Hardcodes the reservation of the first 64 KiB early in
>>    early_reserve_memory()
>>
>> It might be possible to get this feature to work by allowing
>> setup_bios_corruption_check() to run first, but it's just not worth it
>> given that the kernel will never access this memory area anyways.
>>
>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>> ---
>>
>> Changelog
>> =========
>>
>> v2
>> - Rebase against latest Linus tree (v7.2-rc4)
>> - Improve changelog
>>
>>   .../admin-guide/kernel-parameters.txt         |  23 ---
>>   arch/x86/Kconfig                              |  30 ---
>>   arch/x86/configs/i386_defconfig               |   1 -
>>   arch/x86/configs/x86_64_defconfig             |   1 -
>>   arch/x86/include/asm/bios_ebda.h              |  17 --
>>   arch/x86/include/asm/setup.h                  |   1 -
>>   arch/x86/kernel/Makefile                      |   2 -
>>   arch/x86/kernel/check.c                       | 187 ------------------
>>   arch/x86/kernel/setup.c                       |   4 -
>>   9 files changed, 266 deletions(-)
>>   delete mode 100644 arch/x86/kernel/check.c
> 
> Hi Luiz,

Hey,

> v2 no longer applies to mainline - are you planning to rebase it for v3?

If we plan to merge it, I can :)

> Regarding the changelog: did you consider that the check is only broken
> for the default size? Booting with
> 
>    memory_corruption_check=1 memory_corruption_check_size=256K
> 
> still works and I get:
> 
>    check: Scanning 1 areas for low memory corruption
>    check: Scanning for low memory corruption every 60 seconds

Yes, but IIRC this won't reserve the first 64K and my understanding
is that checking the first 64K was the main point of the feature.

