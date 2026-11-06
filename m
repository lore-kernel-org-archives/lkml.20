Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953873;
	b=zNDszT70ApkqlrMcgAgEW2xSL0lQTrz1HCqnRG8cgNqur1dMpeGwBxsA2QpKpKCpLNST
	 F/aiT4nGPaisc8u9hfE0di0Dj+PDGAM+FQN7dhSFuu5edLZ68/9l/7CDKm+bb7bR0Px60
	 JUUcNPxUn17syZgKGZJEZE2r9IZuGMi04l05kHkavtlpwDGWB7XrZrFqyiLeANcZG83as
	 TmkaOmAPoLeAU9nmq1xRFDeihX/HMelVBERHrJNghnxuRuu+x2TsLkKqDOnpq6X9sDexm
	 Me9IkaZ4mi/OI2CxLHYa1RlLw9hof6A30esomjpuCFXbyUeEGwf8yf+mzouDbXgmP6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gRVAhGeZWCNMiNHPmygg3aA49aMAiMWPBcpElZA7SC0=;
	b=3IAnAoD1xl2ymfrWhToHtNVBoXciMAAQZnUBNw08RHDZzFqP1rb981UXennof1Awl1EA
	 9qptjSi/+aQz2G8GXIJuYgNLzbpXw7Y7NEq4BpXrZS3iKEuX2q9Vl8nrcwrU5ydN+oUYn
	 Zh4DEQO6P+a/XBcGzkLqVHmhIQMAbClXoUMkmVYAAQUENAZdxthaq+G852VcqGT0/j436
	 Ko25FI8p0UIyN2z4ucHYmp4zHiOAJ1kImjP0DbGRMiqY1oL+DzYn54XKqSm22vBb248Ep
	 rwPK5CdtQyY1LEZVZqEAG8EHmYDsceuUpO/FPLUC/7Z/2AP37s4jzxxohTRz9qC2ymw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aClLuhsz;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113E6606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 113E6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aClLuhsz
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so3046135e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793953871; x=1794558671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRVAhGeZWCNMiNHPmygg3aA49aMAiMWPBcpElZA7SC0=;
        b=aClLuhszkMakCaj4YvlRHufvUoCFMcpZMZZ4kusICUw9Cu+9XfRShbxcesrOoE8OUD
         /OQMotlJCqn5sSEq64SJUKKnS4XnbQ/0/qn4VJC8wWl57dVPBeVjaoDqNwFVNR07sJ/6
         TDBbnqdZaDRgrLMQKOW+P5Wh1X0yQX4AzOeH4mVXZusshWzLhMXiPUjZSwDfu+ntxKND
         AYGTtdPDyJ0y/U1cSC5NU1B4FPRu6zBf/Ax6cljgdBunEgVJKJoVlwftmKocw1fP/sY/
         4NcpBgo/DoGApWSPnolo8CLB22AMGdwJOcjpn/t2fO47lLca+uiCwy9Frx/9rvDtFWAU
         1sOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953871; x=1794558671;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRVAhGeZWCNMiNHPmygg3aA49aMAiMWPBcpElZA7SC0=;
        b=KFRuKUn9w5xgR/FAs3bgkz7eDEt5guZvxTaR8wgRS8VWtn771k9tp5+8l+snDn4lGY
         7LEfowCaAv2Sy+H3+/nwOkI+IazfD+d/RpA8hcr4LnDPWaplJipOF4bgbmRzU9NEo6P/
         PiO5UMgApZC6L8BX9Bb5FcI7zHKxK5vqcxQpTJYmTv4DleKTRmv4wYeHcnbXcxXzlZMV
         dpshwBLoAlqXSMZX70Z0BxkMvujvMpT8Su54LW7R5TT8xVEoeLkmFHwpNWEDoHAmPCY6
         T1EnzlS+rlMZqe/ag/8C/4FB2R55fMMhqnI9wLARMc/yEzB6DrHYcRwWEZe7mF/ZHpNQ
         5vJg==
X-Forwarded-Encrypted: i=1; AKwUvBxy1ZZkSV0ztj1azwkPnuT3Ewk24HZtUC612hfubvx77OTSTjNOaAqVJpzO6c5V6FlbBCF0w4tIEgqKZdY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H1bt3SZybMeuxwPcWVAa2Xah5XcY8crmYY4Vr/WNdi4C3+BGd
	4XgUQ4CiYdbSK7XXp0Mb/u7bOPE+Jic8W0teC+LBT6tkS5lrZy4qpbgLbUnBLfpEjqE=
X-Gm-Gg: AYBFou35JQJ5gC8NFYVSAe8mRqEoDdXejadOyFe3nLElLSJkKKn75CmS6MEhPlakQvS
	fl9CIRnxMMcBqSIVeHINZ6T49+essI5uu10A03AAYRJ3jwJn5wRh1jHEHi9EWamSWHOcrbAzLTO
	wvJmQmFjyFHTEP0Ym69Q8IYDWCxoIWelUVA/zRW1bJJujY48cW2sjrpyfU/RmIUH9DO9HHFQrFu
	znREI6F3KxT8qbtdgFqzUWgFk8D6nocp94pgZ+2eXHuuce4hLsTLpY2VXhIO4KpF+yG/0esLWUE
	OK24ICPcMZ2N2k7AHm1aH/OWPvP9LfjAI3gMzuNmUhXiWqk6bqSH73PjmIjpoXyUk5A/V50awXB
	QWbP156gsJmF8BOWz+xI/LclAxAtcuO1Ix5azgtvjrV4fXX1XUjAsPEeBQpTKdTG9p8Ei1Gs/IH
	+9izCXDmbbonB90TVLc0zEUQ8j4ya+rZFsnkPisGglgiH97z8KHyWqNEGJ4A5QF0WTBnHIEw9AM
	we6qi1l2/2FrepYzd1H8X/DYq2714w/fduaWDPpA4WQrLnDB7wXfBIE/8d5WDLERTWkGqZefqBQ
	B6QXJbo/NHNkRhRmzWxkvdC5
X-Received: by 2002:a05:600c:4f42:b0:4b2:4b5e:8141 with SMTP id 5b1f17b1804b1-4b6df4f2304mr29162125e9.9.1793953870825;
        Fri, 06 Nov 2026 00:31:10 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6dc6e0cfbsm44553765e9.0.2026.11.06.00.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 00:31:10 -0800 (PST)
Message-ID: <40bdc057-7e5a-4904-9f1a-1a36e639e0e7@gmail.com>
Date: Fri, 6 Nov 2026 09:31:09 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] memblock: don't allocate new reserve_mem regions on a
 KHO boot
To: Mukesh Pilaniya <mpilaniy@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>,
 Changyuan Lyu <changyuanl@google.com>, Alexander Graf <graf@amazon.com>
Cc: Tony Luck <tony.luck@intel.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, linux-mm@kvack.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pratyush Yadav <pratyush@kernel.org>
References: <20261105213153.9572-1-azpijr@gmail.com>
 <d928099c-4e43-4af8-a929-b510819967ce@redhat.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <d928099c-4e43-4af8-a929-b510819967ce@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/26 4:57 AM, Mukesh Pilaniya wrote:
> Hi Jose, Thanks for the patch!
> 
> On 06/11/26 3:01 am, Jose A. Perez de Azpillaga wrote:
>> On a KHO boot, a reserve_mem region that can't be revived is allocated
>> from KHO_NOPRSRV memory, which includes the bootmem the next kernel
>> boots out of. With CONFIG_KEXEC_HANDOVER_DEBUG, preserving the region
>> then fails:
>>
>>   WARNING: kernel/liveupdate/kexec_handover.c:1245 at kho_preserve_pages+0x168/0x180
>>   failed to prepare memblock FDT for KHO: -22
>>
>> Without it, the next kernel puts its memmap on top of the region and
>> the ramoops records in it are lost.
>>
>> There is no use case for adding regions across a live update, so fail
>> instead of allocating, and drop the TODO.
>>
>> Add an is_kho_boot() stub so the memblock tests still build.
>>
>> Fixes: f99230780211 ("memblock: add KHO support for reserve_mem")
>> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
>> ---
>> Changes in v3:
>> - add an is_kho_boot() stub to the memblock tests (Mike).
>> - add Pasha's Reviewed-by.
>>
>> Changes in v2:
>> - fail on a KHO boot instead of allocating outside bootmem, as agreed
>>   with Pratyush [1]. this drops v1's patch 1.
>> - not an RFC anymore.
>> - based on v7.4-rc1.
>>
>> v2: https://lore.kernel.org/all/20261104204235.9066-1-azpijr@gmail.com/
>> v1: https://lore.kernel.org/all/20261021211058.83483-3-azpijr@gmail.com/
>>
>> [1] https://lore.kernel.org/all/2vxzfqxglrg6.fsf@kernel.org/
>>
>>  mm/memblock.c                     | 11 ++++++++++-
>>  tools/testing/memblock/internal.h |  5 +++++
>>  2 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/memblock.c b/mm/memblock.c
>> index a450092a80fb..e325e0542c9a 100644
>> --- a/mm/memblock.c
>> +++ b/mm/memblock.c
>> @@ -2827,7 +2827,16 @@ static int __init reserve_mem(char *p)
>>  	if (reserve_mem_kho_revive(name, size, align))
>>  		return 1;
>>  
>> -	/* TODO: Allocation must be outside of KHO_NOPRSRV region */
>> +	/*
>> +	 * On a KHO boot memblock only allocates from KHO_NOPRSRV memory here,
>> +	 * which includes the bootmem the next kernel boots out of. Only regions
>> +	 * handed over by the previous kernel are supported.
>> +	 */
>> +	if (is_kho_boot()) {
>> +		pr_err("reserve_mem: can't allocate \"%s\" on a KHO boot\n", name);
>> +		return -EOPNOTSUPP;
>> +	}
> I think this over-restricts when KHO is explicitly disabled. kho= is an
> early_param parsed before reserve_mem=, but kho_populate records the
> incoming FDT without checking kho_enable. So a KHO payload booted with
> kho=off ends up with is_kho_boot() == true and kho_is_enabled() ==false.
> 
> In that config nothing can be handed over again; reserve_mem_init
> returns early on !kho_is_enabled(), and kho_fill_kimage bails on
> !kho_enable. Allocating the region from KHO_NOPRSRV is therefore
> harmless, and the documented best-effort reserve_mem= behaviour is
> preserved.
> That said, a new reserve_mem= line is rejected and its ramoops/ftrace
> boot-instance consumers lose their region.
> 
> So, Would
> 
> 	if (kho_is_enabled() && is_kho_boot())
> 
> be better here? If so, the memblock tests will also need a
> kho_is_enabled() stub, since
> tools/testing/memblock/linux/kexec_handover.h is empty and reserve_mem()
> sits outside the CONFIG_KEXEC_HANDOVER ifdef.

good catch, will do it in v4 :)

-- 
cheers,
jose a. p-a
