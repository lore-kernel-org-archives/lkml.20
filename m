Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360686;
	b=M9NyojyxshT3Bm1Dx1LPmEyw+EBXFiKkaRG8/8Nv/a0vzuRv0TGB4Eg0POPz2x1qNLz8
	 +OqJUahopDSts0QuxVfu9e8ZZpPo66ounR6hyaZaZWLwNwd0MPEpFZdW5yXY/K4HTnUVe
	 snROivxszE8agw8kVcoho9PX+/MUyxmfQOViPaqoccUEKPiv/cbZwk2ur/I/3yitJv/C+
	 XzSbNlkQ0DmviUoZEdsVKbozpom1kXLbPvVrC+3BR8QPbffKO9ZiGIjcFvs/7IoWf01I+
	 EQm6UJyFPx/kyXws0nKP0Pc8umTEgwsJ75IcjYZHAaEaq10w0x27VqxLRck32vLVVEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vvimweWXdTkslV51aQTQuVA5EhGHU7gBJImiZfr2+Uo=;
	b=Ka9/S3VmA87CrpbmVK77u0GVODCallxHLF0oquPsZZSCeRgktjcUle2R8KcRExmhuy2g
	 sVwsL6E+MZFV6art/7s7dgXJnAY/Qujl0abd0aKNxzEHuQrawsCs9XzPt8Lcnd6OhrRMw
	 vV1mup8nrzRLHocXGS7+UBk4vOhX5Kn3nbTWHaVGCdl94q5LSKRThGcKWa8tckLORewv9
	 ViBE3RJxCYJe/F+IQXtN4ZQRb0VhWbetDyuPByeYOI+OSKSSmAXn6CBAPRU1qILzaSO6Y
	 6YUMuUxd97kdWhEa1O7g4tTghLcZDzEMIKOI9rfxUdp2TVWy7fQn1atRQc6l/BBASNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rhQE7oNj;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAFF606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DAFF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rhQE7oNj
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3ad211ad92bso980625a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794360685; x=1794965485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vvimweWXdTkslV51aQTQuVA5EhGHU7gBJImiZfr2+Uo=;
        b=rhQE7oNjT/ClBPXKDRzn/ic9tgZvv+IsW9XdK9Yr4Ao5PoVhF8RyspCbwNn347QtSL
         dBumovkerfirOsD5INbjJvgG1/5XJeZmLMPaeVJy1Vita6/nSw03gQD7Fpm/wz2gkQ6P
         iH3SnKYMy70xsgPW6WzQf+TV8V5/rjqUmxiUcV2kmpiCxNGNJrGWSei/Chit4UW1ocWy
         l1VOuNMRBKxKYw/Q/ByErZI5COZbHJQuARn9ugGTQ0G1V0XQVJUqAHcQN9zo3xtzPkKL
         RIiWPjk5ylibqsQTG/TfOuu/6KrVIIENgdou7fW+nvwh7+Fx3/eEhqQdcSfOsS+99tfS
         QZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794360685; x=1794965485;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvimweWXdTkslV51aQTQuVA5EhGHU7gBJImiZfr2+Uo=;
        b=TviPaDH0E4lY7gW0WhwFxGIyPPdkUgs9TFkpFpfmw0ea68EhsAeQxaHFJlgDe/zPdV
         SBmMI1SVK+Pash0tCdf+r/z1/bjZXAcEd1lHdx9/McqnfPW5SJ5gLTkh/iabJw5kNZqN
         VJhjPXRW6OCACK5GxDZ+V4cNQZ/dFrbez+FJF5qMZYr8ug/M4dYgVEbhDlhQu1Id2S7Q
         Y92cSInrSQLbERyEf4evNMeLE70pO4MHM8oySQvEYyXOE/vnOpU2ggPtNN+0xQDLdZu0
         ddTA0LPpbtPqZDfuuuuizCpcHBKKgKq5to5sGOTU/LsdMUesdMbj5zcac71Q/iMsdbw9
         jtXA==
X-Forwarded-Encrypted: i=1; AL+hErGDG6K10kYO6BaU4CkBzTOaXElGI+fuNSoK11uhjys/hkfJW3LvkcLl7Vuz86cHbjBRmDjHahkAKOIUA2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9xUVlxp1JAQXB1yji0lQkVGZaSd7ExiiXq8A0pL76duAEDgGx
	UuYcAWTEHIEN4burZ0uo5YFImAn1kplgq3Zkay9iGKGvRJ9xsmHeJvM5
X-Gm-Gg: AYBFou2e+F8M2XCPL5zTQmprUuoCZhY5hxtjMSso5sGVMFl5KiJDckrMiyRFJjDk8Qy
	33jA0G/Wa33gr70ZK6xUdIPJGVjAo4Jcx1vgysFfVLUB5nYDn6ffC6NrI7eckfYzc6f9f2E9RnP
	wz17/uuvdMfbu68ShfjtDSqIIbu/zNpWN5iAuaR2N5KBIT2H6AuIgN8q5o9sRwipYxWVWL9V/S6
	Xenrh9WEa0FnCfzvGbaSIUsbFUj9m9J8N5zlD9BoKLKLdzQ6rKXBniMbudxmV6RjIM2fltMRzUe
	r3bJNlOT3DRvJmXVP+06aPprCH5ekdfeglh17msSe2dHcvWLTVeYEz9F/Z+LvgO9G+K/rjH5exh
	aqy2Zw+FIMpyVh85/rCGhmqVFS/FhKxHNvZfZrdYkbp1xzB1EF07rOy67+NL9qKpZk4cszBvtUQ
	XjOh34fuXAT1oiXfKWKFfYZ+Cht386UlcHbl7fOWkNs+XlDOt5vGxonh2LKbTfpdKqAA/jgBSWj
	1nIiYU0Nw/gReYle0t39+qKDo39QMugz2Yb3PzPsjWN/asaGVLD0ubarknghUvWrYpsxlSo2kQb
	tzGN1vFbYePfdBQSOyjbzAYeYAnguKwPpeM8
X-Received: by 2002:a17:90b:5487:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b182eac822mr798734a91.26.1794360685246;
        Tue, 10 Nov 2026 17:31:25 -0800 (PST)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e0ecd3sm441451a91.3.2026.11.10.17.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 17:31:24 -0800 (PST)
Message-ID: <e83df8e0-f48c-4262-b96a-6f99a53df9d9@gmail.com>
Date: Wed, 11 Nov 2026 09:31:14 +0800
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
Subject: Re: [PATCH v2] mm/migrate: improve mlock tracking for PTE-mapped
 large folios
From: Wandun <chenwandun1@gmail.com>
To: david@kernel.org, hughd@google.com, akpm@linux-foundation.org
Cc: ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
 byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
 apopple@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261110123218.1579490-1-chenwandun1@gmail.com>
Content-Language: en-US
In-Reply-To: <20261110123218.1579490-1-chenwandun1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/26 20:32, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> Commit ab521b4142aa ("mm/rmap: improve mlock tracking for large folios")
> mlocks a large folio when all its pages are added in one rmap operation.
> However, when a PTE-mapped large folio is migrated, remove_migration_pte()
> restores PTEs individually, passing nr_pages = 1 to the rmap helpers. As a
> result, PG_mlocked is not set on the destination folio.
> 
> Reclaim can restore mlock in try_to_unmap(), but Mlocked in /proc/meminfo
> remains undercounted until that scan occurs.
> 
> Restore mlock once the full mapping has been restored in a locked VMA
> under one page table lock, rather than waiting for try_to_unmap() to
> restore the mlock state.

I forgot to include the v1-to-v2 changelog:

Changes in v2:
1. Reword the subject and commit message.
2. Drop the Fixes tag.

Best regards,
Wandun

> 
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> ---
>  mm/migrate.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 94033c222e04..140e291d4587 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -353,6 +353,7 @@ static bool remove_migration_pte(struct folio *folio,
>  {
>  	struct rmap_walk_arg *rmap_walk_arg = arg;
>  	DEFINE_FOLIO_VMA_WALK(pvmw, rmap_walk_arg->folio, vma, addr, PVMW_SYNC | PVMW_MIGRATION);
> +	unsigned long nr_ptes = 0;
>  
>  	while (page_vma_mapped_walk(&pvmw)) {
>  		rmap_t rmap_flags = RMAP_NONE;
> @@ -446,9 +447,16 @@ static bool remove_migration_pte(struct folio *folio,
>  			else
>  				folio_add_file_rmap_pte(folio, new, vma);
>  			set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
> +
> +			nr_ptes++;
>  		}
> -		if (READ_ONCE(vma->vm_flags) & VM_LOCKED)
> +		if (READ_ONCE(vma->vm_flags) & VM_LOCKED) {
> +			if (folio_test_large(folio) &&
> +			    nr_ptes == folio_nr_pages(folio) &&
> +			    !(pvmw.flags & PVMW_PGTABLE_CROSSED))
> +				mlock_vma_folio(folio, vma);
>  			mlock_drain_local();
> +		}
>  
>  		trace_remove_migration_pte(pvmw.address, pte_val(pte),
>  					   compound_order(new));

