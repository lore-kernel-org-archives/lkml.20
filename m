Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879789;
	b=S/ay1A1tpEbqwu4yfRqCauRfOQKdBazZiMYEd46tN0beZ6iYcBU4pL33rrjHLIfYFTLv
	 fyf903fjhErVbT7zWz4az+VlO563ZTpqeSCpRrkHp4DJCfEsuY0GBtLq5LRdBziWBkPtA
	 j2FZudS+AvlS2dlid4m+IhRf9kdfyUnRz9luDXi8hasjdTy+jBjQaBuvvm3GY4YH9yAt/
	 xVftIihGZ/t4+XuiaiUDZkQK65iCQK8LQIjnNKQ3rxuwDwIMYyTlTq1sbjKIaCJYI9sd9
	 6zctZpW2IMxgCQg/N866PURbqoxfTMTEKyCkF9YEkqmWbmn6M778a1+almjgvct81sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RAC3JyCcPbrtGRCcu9CD6bbgq1BaxglIl3X5ZCQ3VwI=;
	b=LUA++jLFdsL64D/2Q+pS15tPUbr1E/2icr9WcaC7FOrdz7Yp0frZ7WEO9jXaP/D+Xi0Q
	 XITKKsbT5eAgjwb2vMm805BepBoPENW4jDx1DfMWLnheQ1SHTFLgtaWfKP5ybAVd/yxYj
	 8uf3RtvTJ6rjUU+8Ou/jfMTZscHEsV8ga+I+fX+Gb7xTdAgmUr747hqImJ2BM3UDpeoaV
	 JjTJfcFMzQL3wRoj5I8ad9vPHY5Oy0uluxJ12lAfvjTjRCz2w2H2gNScapiPiezum8lks
	 jL9Zoq0ob7W1TlBCL3mkWrrE/HH5o2NBGkX1vlBwOrTc/TxGpLpVnh6Di7wo/DYyaVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gy9FRoDQ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8992606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8992606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gy9FRoDQ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso11909275e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793879787; x=1794484587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAC3JyCcPbrtGRCcu9CD6bbgq1BaxglIl3X5ZCQ3VwI=;
        b=gy9FRoDQY3tkVeLxxNEbqVrcji9JGHyYz7LTUozpQWLttDD3xDrYtLkmejSywyyG0Y
         KYfO+2EnwihHFovKEXKTXG+rDXx1ECKivpDi12TQ0YQYNGKlvnj3INxepXfTZ1ZUgO/4
         CuR+91aERbUAfu8Hg0nHaA94YZCDwCNFf6l9xGySf6B/59m0QcUi/coR8mgpGlhsyJlZ
         3l/2Zxm8oFCv735iJgUdl39JWXkt2fIFEE4CL15Da8D6+6xLaGo8A1TNBmNxMAYukJ25
         bSG/M7kllx1TH7DpHp50W5Ujm9b/r21WKJlHnIVZB/L5qb15/lIuRLjfN+wjPdeVHyLF
         R2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879787; x=1794484587;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAC3JyCcPbrtGRCcu9CD6bbgq1BaxglIl3X5ZCQ3VwI=;
        b=FqpRUX4NM8VdhEU8Gf0h93r8z3+/MurNnz+mLw7iG/mhmQhjxBU01uPwB1AgVxkwWt
         UniqVpJaebiNiOVeE8D/aKMsvJCEHaWA1Qd/sqlRqmx/C5LhOkJdHO2jmYU6Fhj9J2RJ
         89h2Yy19uJSIGi7tpxPlYTa557D7212pUGSQ/t5YvSdHMyv44EBwsq19wQ+MndF2gfVX
         YnX3sSJlbRObs2EpRAIpGBs+ygysxNE38tSK71aAOFdv9GvpYZzXcZldSXxQBpeH5UDh
         xy2dhnAoTzsYrEblnsv8p9vYJY2Ka72Ep1+rh2IbiCve4SzrIuqC18PTrssrafHq8xEW
         V48A==
X-Forwarded-Encrypted: i=1; AKwUvByeMP52QftzlMDTGqC/POAZRK9UwPfULB1md5XHaTN4rJy374LciN6RW8iCyXAtYFs+vHLcnzmixBqlUnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CZSbVeO+dnHjq4sHiwAKvLpcqrl2WGslEAAfGRui60kUMJgDJ
	eLUmnAhZ5i5T8tXR4S3SaiEMQRrSIEpRb7cslNn2Pbn7FaZXeExfMpBo6ro+0SBoglw=
X-Gm-Gg: AYBFou1fz33eKRnfBOVqH0t23yOdGx1hW1TJEOdRgTyPl0vkvKNLvB2IL0/1NMhlVe9
	om72bYFPFBk4jADJ09dqXfmSjUSOWbli+HeZRCLOeN3evxFk8M9+5bXwrZqUcfva7OZ1sSkSJTR
	gkxRDavNWO9rRRgwFbBgc9k0RUVLMNC6TTFoXfHjWk2oyzgk/pHSRwH77bMzzDMZSPTzEfgag5Q
	5QMLNie0LMY47HWYQviqp6UBn/UMIHqi9vp6yiYJ7Y318LehLaFL/Kiit8dcLT6bazetSiSwahK
	TApX6sYUYViFeD5EHr/xwSnC1+Q8+rv9NxK2/bXJhi7Mm18rb+HjOUf/+ITc06zOuqZsnDVwVZN
	jX888PKXjLU7RNyqzpH2F4e7UYZT7wbebe75eEaIna95Xl/7/BorD7yYwDLH7dX2aScJVa0gJJl
	c0JQgwOU2Cfy9rwcd08mLBJTl4OeQ8085fhqSwMVdHGOG3uqPBwZyOdlqG8GDYHd3Smrt8T1JNS
	UnxAZhvGzFa4pkUvSFwtZ1wJ+qgX2/MW+amwXoJYBqy5GKdv75AUTKiO+2wbwlEBrI3EslGe0R8
	fhAIP4RXfgdykoRHkIo6QD3DWtfqNVxJXMBoeYu1jTCk
X-Received: by 2002:a05:600c:6212:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4ac17ffa395mr398423355e9.22.1793879786986;
        Thu, 05 Nov 2026 03:56:26 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea181085sm9708651f8f.1.2026.11.05.03.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 03:56:26 -0800 (PST)
Message-ID: <d2965cb2-428f-484a-bd81-55b78b770b96@gmail.com>
Date: Thu, 5 Nov 2026 12:56:24 +0100
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
Subject: Re: [PATCH v2] memblock: don't allocate new reserve_mem regions on a
 KHO boot
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>,
 Changyuan Lyu <changyuanl@google.com>, Alexander Graf <graf@amazon.com>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Pratyush Yadav <pratyush@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, kexec@lists.infradead.org
References: <20261104204235.9066-1-azpijr@gmail.com>
 <auw3dtAMp4CjNwY2@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <auw3dtAMp4CjNwY2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 8:59 AM, Mike Rapoport wrote:
> On Wed, Nov 04, 2026 at 09:42:17PM +0100, Jose A. Perez de Azpillaga wrote:
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
>> Fixes: f99230780211 ("memblock: add KHO support for reserve_mem")
>> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
>> ---
>> Changes in v2:
>> - fail on a KHO boot instead of allocating outside bootmem, as agreed
>>   with Pratyush [1]. this drops v1's patch 1.
>> - not an RFC anymore.
>> - based on v7.4-rc1.
>>
>> v1: https://lore.kernel.org/all/20261021211058.83483-3-azpijr@gmail.com/
>>
>> [1] https://lore.kernel.org/all/2vxzfqxglrg6.fsf@kernel.org/
>>
>>  mm/memblock.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
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
> 
> This breaks memblock tests, please add a stub there.


oops, sorry. will add it in v3 :)

-- 
cheers,
jose a. p-a
