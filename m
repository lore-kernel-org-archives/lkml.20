Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A72C13A258
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791646906; cv=none; b=gxt/UteyFzDXp6nchV7drlJx35qZZA2NEsbAl6BdibH8ZgGSokXUFMXP/wp/BNe5tjF72i6mWKFkpO4vpOZX4Huy0+Qv1g1H2lSrcQdiQ/tdMV2Do/Cl2Kxiv2aZPg6FQ/JFDUzHfPdVhuSuInlgkLUN4aiDrso/07dwv0JwYvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791646906; c=relaxed/simple;
	bh=fYmH6wb821TTClHxDlG86plSNvkmVhJkEMXg80ucEl4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cY8aGB13LLVTWio9bBwi5GEofU2bLF0T9l4gxq2dixms0Jv51TJuPcga+L+0ylNJMXSzuY1JRRCdR6Ixy8A8E0HX9s8Off8WXwSEcvzfjtWvkcnU7q4lU8Zwys7LCzpt8fDfPzcp0unULj035ELpuGOG1L1yj7JtL3TlZGMdEuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iKCwVKBP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iKCwVKBP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791646904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQGlwc/2yUU8o+zgtCEtBmM0FXAGhm3La+GwOgSdudM=;
	b=iKCwVKBPW8B0u6EbVnYXKPPCj3LtwXMwAph1hRfgzH42iX1Pfr7BAUKHW4JBJczOaaf9yd
	R/pFoUJiDdlQ0LIHIPQEziSjxlLVm+XjOqa2gSVa+ztDt9A7q4fYDV/BbIj3B0eayDIhy7
	JWA4mUyPzX525r/uKb4Oig8PI8t0l0E=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-CH-zkm-8P9i0f13HVfx26Q-1; Sat, 10 Oct 2026 15:41:42 +0000
X-MC-Unique: CH-zkm-8P9i0f13HVfx26Q-1
X-Mimecast-MFC-AGG-ID: CH-zkm-8P9i0f13HVfx26Q_1791646902
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1de6d5c3so152052585a.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791646902; x=1792251702;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQGlwc/2yUU8o+zgtCEtBmM0FXAGhm3La+GwOgSdudM=;
        b=No34DtzTgjaUVU3RfZ7+cfYNlVRVsDkBo4P5aUvQvNb6b9JH9QVMrLmMVM6IWgaHIB
         yDrKPNYYeA8GLSmkyL8wXzjGbEJcCNvFYH7dfaLH+socBjM9F10ZQmtmRKu6DW109Ro+
         T7SJbeoWh5E9Kr4cwrmx+zKfH9PXPSNkKwplSZ8K9mMdd/wArZObUnXbGD56rQ0cq/kV
         L8bCKgK60lnOg6y0+jW//DuIAkJIPHKaeiofU+sO0B137YpsUqALE9n0Xogn/TckuoHJ
         q8MIiFapEZNdO5N5xHvXSoinmPvqJgwUL/j2Rr2hXTF8c+O+X6p4dagaV7BIdTsjipyz
         ORlA==
X-Gm-Message-State: AFq9FYLoo8Goar78WsMxV6Qas/Juxgzn2SGQWZNeMw8gofxdozi/9xGa
	IO9bS33aknqRGKdJM2wBtTkQwYjZDQlilC95zmQR364ui8wSBIM3ZM/Ed8g8fxppuUkTgsRNcc9
	I/+xAy3Hjyg5IkWFk1Re4QcjszgmKhIBm3rkE0qNQcSmI3/gpQ0HTF9dSArMxrB/aVw==
X-Gm-Gg: AYBFou0E+RXdWbVTJkxL+fsW0Wi08UQdfDUlYkXec08iA5Pki77dBKn7WLubxtRlIyv
	0JKKzghmCikmrquH70javg8EagABi0cOC1oH8RPfV6Ww6zWi/paM8a+RHlXxo9peLrM++P/Jnnd
	YCKY/G2AMK9EqwVpj+MGQlp+C+m3uQ0RyIHuM63C+vVXcrUwSRrkhmaI7inhtDmVTYv8CpN9EUv
	2QgOgEwCPbahA3TsDMK+WnOw6GtjTnFXhG4w5lNJ7IYSvNTRgKTtSWIFa5MJerNZPeeBgnNHAlt
	ewAiKF504327kf6TfIEi9Vu47NYk2L1rrQrPQCXpxWGm/I1+uF/Y2G4QhCm9CKQxGSLEvBUMkZl
	f/2Q=
X-Received: by 2002:a05:620a:4510:b0:93e:c12c:f13a with SMTP id af79cd13be357-93ec12d0631mr714841685a.68.1791646902255;
        Sat, 10 Oct 2026 08:41:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4510:b0:93e:c12c:f13a with SMTP id af79cd13be357-93ec12d0631mr714838485a.68.1791646901755;
        Sat, 10 Oct 2026 08:41:41 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9722fbasm453274285a.6.2026.10.10.08.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 08:41:41 -0700 (PDT)
Message-ID: <87f6a5de-7ba7-40e6-ad31-e1311033e986@redhat.com>
Date: Sat, 10 Oct 2026 11:41:40 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86: remove the BIOS memory corruption check feature
From: Luiz Capitulino <luizcap@redhat.com>
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
 <e7c7e8df-b1e7-4796-baef-ca5d7676688a@redhat.com>
Content-Language: en-US
In-Reply-To: <e7c7e8df-b1e7-4796-baef-ca5d7676688a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/9/26 4:16 PM, Luiz Capitulino wrote:
> 
> 
> On 10/9/26 2:06 PM, Thorsten Blum wrote:
>> On Mon, Jul 20, 2026 at 04:41:05PM -0400, Luiz Capitulino wrote:
>>> By default, the BIOS memory corruption check works by reserving the
>>> first 64 KiB physical area from memblock, zeroing it and then scanning it
>>> periodically.
>>>
>>> However, this functionality has been broken since v5.13 by two commits:
>>>
>>> - Commit a799c2bd29d1 ("x86/setup: Consolidate early memory reservations").
>>>    Moved trim_low_memory_range() into early_reserve_memory(), which runs
>>>    earlier in setup_arch(), causing the first 64 KiB to be reserved (when
>>>    CONFIG_X86_RESERVE_LOW=64) before setup_bios_corruption_check() runs
>>>
>>> - Commit f1d4d47c5851 ("x86/setup: Always reserve the first 1M of RAM").
>>>    Hardcodes the reservation of the first 64 KiB early in
>>>    early_reserve_memory()
>>>
>>> It might be possible to get this feature to work by allowing
>>> setup_bios_corruption_check() to run first, but it's just not worth it
>>> given that the kernel will never access this memory area anyways.
>>>
>>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>>> ---
>>>
>>> Changelog
>>> =========
>>>
>>> v2
>>> - Rebase against latest Linus tree (v7.2-rc4)
>>> - Improve changelog
>>>
>>>   .../admin-guide/kernel-parameters.txt         |  23 ---
>>>   arch/x86/Kconfig                              |  30 ---
>>>   arch/x86/configs/i386_defconfig               |   1 -
>>>   arch/x86/configs/x86_64_defconfig             |   1 -
>>>   arch/x86/include/asm/bios_ebda.h              |  17 --
>>>   arch/x86/include/asm/setup.h                  |   1 -
>>>   arch/x86/kernel/Makefile                      |   2 -
>>>   arch/x86/kernel/check.c                       | 187 ------------------
>>>   arch/x86/kernel/setup.c                       |   4 -
>>>   9 files changed, 266 deletions(-)
>>>   delete mode 100644 arch/x86/kernel/check.c
>>
>> Hi Luiz,
> 
> Hey,
> 
>> v2 no longer applies to mainline - are you planning to rebase it for v3?
> 
> If we plan to merge it, I can :)
> 
>> Regarding the changelog: did you consider that the check is only broken
>> for the default size? Booting with
>>
>>    memory_corruption_check=1 memory_corruption_check_size=256K
>>
>> still works and I get:
>>
>>    check: Scanning 1 areas for low memory corruption
>>    check: Scanning for low memory corruption every 60 seconds
> 
> Yes, but IIRC this won't reserve the first 64K and my understanding
> is that checking the first 64K was the main point of the feature.

I've just sent v3. I improved the changelog based on your feedback.

Also, I realized that v2 doesn't apply because it was mangled by my MUA.
I sent v3 with git-send-email so it should apply now.

