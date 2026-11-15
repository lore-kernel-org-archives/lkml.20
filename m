Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794734700;
	b=2v0uT0S78oHz9iKuscFhlELbgAadgzABuJNRr2AEGtjchLPvoHElHJqTS2KnF9pXqtJ/
	 4K3ei6bMdbfcb5Qr+sTLi7djJ0Zawz5JiewKVFlPVJ0QIA/eFmqlILy03rgjIkVgF+4up
	 1FVDn3gn+VAAJfjw39zXHwVZvbdSP8mNk5tJw9HpJTOyEQcTR2nEBcDIBaSbQHSY2OyVS
	 Tt8rsVdCL/mDKl0zAf7Yk6Sko5qOKsxDnUhh9PpgOG8DZxx7+lsZIE9V70LTOe3vR4JG9
	 7oEzg7MISBgQ4T+Lpi5cRTieBeg3KFN05Z/KN9d9o8ZOcPlMmQpnSP0l3EHnOuTlKMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794734700;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9c8p7xnMkOo8VygGtCf+xkzjwVTSeX+xnVktgNDwVkU=;
	b=Kr95N+7QRPGuyFq9zRQGOZT4NfbUGimbU9ruYFPl3EnNCBUJ/+AnD5MZTCfW9x/f7VcS
	 90sqz8wdDuynsdXm0KDpuJwn8hsa1+7aEbuMA+TVzOylesq8DywDGCelpiM01X7HRAkel
	 RvBDKxhMJXe/hbXIVKuqN5cEIua+RI5rfC7QPZ3V5p5g9vnf1/ShBXgyiYTLFdN7lZGnr
	 ByZCwLxzF4rF7MoF3PVfpfoCQOEUYu+wZX1H5QwLT223iyLjJjIPEes+gNGgtjUUYPW8+
	 sY2ioI8xcxXgKFmELPk0Yv+fRvT+GTYxwpgDEh8+4sgG7cPW2jMVVkidzzeFpExlinQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="WNTH6/sJ";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OM22gf9d;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23D606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A23D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WNTH6/sJ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OM22gf9d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794734699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9c8p7xnMkOo8VygGtCf+xkzjwVTSeX+xnVktgNDwVkU=;
	b=WNTH6/sJeMccz6PWHBzGFzhbKcttNstFLK2smWGUTzfmvq7QHBGCHF/VP7MovYJ2oTNxtu
	7sFMzQpRJV8y+sw6nLO5kzAqkxWHMsgEiE0gc95TFv3rqg8yfoHKOFxzNQqIKcDQTT/Sa7
	Ql9LiEcxZ5m7McsxZex9vk2uQ7CWa+c=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-UsmwWZMTPNWAnsp4WsIAAA-1; Sun, 15 Nov 2026 04:24:57 -0500
X-MC-Unique: UsmwWZMTPNWAnsp4WsIAAA-1
X-Mimecast-MFC-AGG-ID: UsmwWZMTPNWAnsp4WsIAAA_1794734696
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3ae3cce89a4so4445771fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794734695; x=1795339495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9c8p7xnMkOo8VygGtCf+xkzjwVTSeX+xnVktgNDwVkU=;
        b=OM22gf9dVdnx9TbTO8vNQ9Y8YBWJM2fhKGDxOLV0X6pmaQMXGtuVoJNGXoEpDuyuEF
         HsenWSJaBPqwm4A06rMK0yCOt8cq4fURVt6VduV5MKUGH8lO0CRRXvRCRCl6bk88ang1
         WyL+IbAycwZEZl9BSkmQmIhm3/rpvKHfeaY8piIe0u7RwhQuagKogxLvzgLY+6IChws5
         gKuppmnrjIYqrSkqKRcOC84+toW18d39+PbMxIzRHoVKWD3tpxVGW4Ts5UNw57NB08iX
         jOAEuUt5EaPpVGxlGzuCFNN2J3UROosEEggceQJHEjQZzygFHJhsRVJatiGk7IahmJw+
         Zltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794734695; x=1795339495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9c8p7xnMkOo8VygGtCf+xkzjwVTSeX+xnVktgNDwVkU=;
        b=JZERmkZ57mLZblss3vjLssOZc69xqgg0Xo2n0Re9Tc7zs8fQ2siEOZZJejBlH1ZFD0
         9i5IbwY25dTRSwi21vMkbN6nw+BSGyN+L6DxhOXnfvlFlhBFi8Al57NUAL5xPyHJGEeN
         ZQk2DQt2eG+Li3hBO6yPEZv9VMmBf1Hd4sOIW2Rcx40Hf/V3vki5Jlo2pau6pBChcroO
         XXIv3jI8mCuDrGthgRmiI8hgnbfM8RndItVCPMRNDK4cAtdxrdIqDA6CEFeTvqZ5pdi4
         WUxb2sbu6WbInPqAH4m6qa9ZiYjAsJ9nt95bD4T7PgsGFGEMCj4K1w0qT1iOSnkIlcVZ
         ImDQ==
X-Forwarded-Encrypted: i=1; AL+hErHVMVhWmtOBx23ksIZvEcZhLemk1+5YUD7tIS5kkak+6As8XKTQslfyWO3SvK02V+ss0Srp+wqDxmhPM7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bYxNL41H9aExUQ34266ma5J+iU30BFMGdjTEO9wyvzDOm+4DT
	O49xVHZbCfVWFR+6XLUUfsQertEAyLIW1vA0j04300Izb55u/4IWsOnoVPvH4TM4/MN/ma3lLCV
	282M+WDhlFWbnI58qh8YjXRszbg9lNPcLDC8Kk+rmiCvJW0Eo4mLhERsa7gg0il5l
X-Gm-Gg: AYBFou3MH8yJfzHFkaRk/RAPJ0p0Xydp+UqAH4pAG/GHC/9p7hAqx6t4oEggbeaFxc1
	OylHPL7eRzKo7DRmdad+8aYuubGFIegF7QB+XpRqYUyr+ok5kxDYiqs3bvKqgY8AXq3J8q3Uaxe
	tWV8jDscgxOV8mJAwrIE2pcaUNIWj7wVjH7Si1NL+9lD9yLz5YodUsRswixZptCCNkDJMdqx4EG
	WjklDvASOBqvOKPH7TzDH+faIIDxSd0wZ5u4Veede61OiE11v2YRjgLcil5WBdOk2BGjQteU4Qo
	Qp0wrXMtW9amFDO1de5dJuqxV6YfNjjasFn5zbInbR+efwvfaDjfBCPhNa3To0xFH3iTGu4fE+G
	iBs8YNKyT8yIaLYfTNSZoD88ExNCxlqY+vJ5DjBIxZZw16SeYV9HwqFz5ejymnXoRAi3dZP/yXp
	FefkKL
X-Received: by 2002:a05:651c:211b:b0:3ab:1639:9a75 with SMTP id 38308e7fff4ca-3ae2b4efaebmr20845121fa.11.1794734695448;
        Sun, 15 Nov 2026 01:24:55 -0800 (PST)
X-Received: by 2002:a05:651c:211b:b0:3ab:1639:9a75 with SMTP id 38308e7fff4ca-3ae2b4efaebmr20844811fa.11.1794734694918;
        Sun, 15 Nov 2026 01:24:54 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b780517sm24261081fa.15.2026.11.15.01.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 01:24:53 -0800 (PST)
Message-ID: <607bc1e3-7f12-429d-8b0b-a24f77b3762f@redhat.com>
Date: Sun, 15 Nov 2026 11:24:52 +0200
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
Subject: Re: [PATCH v2 05/13] mm/migrate_device: don't collect a range twice
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Balbir Singh <balbirs@nvidia.com>, David Hildenbrand <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Usama Arif <usama.arif@linux.dev>, Kairui Song <kasong@tencent.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>,
 Chris Mason <mason@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Mark Brown <broonie@kernel.org>,
 "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Josef Bacik <josef@toxicpanda.com>, stable@vger.kernel.org
References: <20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org>
 <20261113-mason-migrate-et-al-fixes-v2-5-50a2ed382b61@kernel.org>
 <avfrWjzLQdDcmXO6@parvat> <8c79ce88-7730-44c4-92a0-d760d6f8e9e1@redhat.com>
 <avinH6zgTzpjMCrf@gremlin>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <avinH6zgTzpjMCrf@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/14/26 20:34, Lorenzo Stoakes (ARM) wrote:
> On Sat, Nov 14, 2026 at 08:45:55AM +0200, Mika Penttilä wrote:
>> On 11/14/26 07:09, Balbir Singh wrote:
>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>>> index 9e5dab8e1b77..28ed706109da 100644
>>>> --- a/mm/migrate_device.c
>>>> +++ b/mm/migrate_device.c
>>>> @@ -257,13 +257,17 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>  	pte_t *ptep;
>>>>
>>>>  again:
>>>> +	/* [start, addr) is collected if we get here after splitting a folio */
>>>>  	if (pmd_trans_huge(*pmdp) || !pmd_present(*pmdp)) {
>>>> -		int ret = migrate_vma_collect_huge_pmd(pmdp, start, end, walk, fault_folio);
>>>> +		int ret = migrate_vma_collect_huge_pmd(pmdp, addr, end, walk, fault_folio);
>>>>
>>>>  		if (ret == -EAGAIN)
>>>>  			goto again;
>>>> -		if (ret == 0)
>>>> +		if (ret == 0) {
>>>> +			if (unmapped)
>>>> +				flush_tlb_range(walk->vma, start, end);
>>>>  			return 0;
>>>> +		}
>>>>  	}
>>>>
>>>>  	ptep = pte_offset_map_lock(mm, pmdp, start, &ptl);
>>>>
>>> Is the intended race a concurrent MADV_DONTNEED reclaiming the PTE table while
>>> PTL is dropped for the split? That would leave pmd_none() true on retry, entering
>>> migrate_vma_collect_huge_pmd() through !pmd_present() and taking its hole path.
> Balbir - yeah exactly the PTE page table removal, and it zaps the migration
> entries installed for [start, adr) too, so those don't keep the table alive.
>
> And yeah, we would then see pmd_none() on retry and
> migrate_vma_collect_hole(start, end, ...) would appends entries on top of those
> already collected.
>
>> I think this is "ok" for the fix, the hole is collected from [addr, end).
> Thanks. Yeah addr > start, so it's not PMD-aligned so always ends up in the
> per-page path.
>
> And if the split happened at the first entry then nothing is collected yet
> anwyay.
>
>> But couple of things follow. It can't be possibly collected as
>> MIGRATE_PFN_COMPOUND entry, only small pages. And the collected entries
>> in [start, addr) are wrong ones.  Finalize will recover, but the
>> migration will fail for those.
> But that's true for any zap that races after collection started, so there's
> nothing for this fix to do here.
Yeah agree this fix is fine and good for stable. To collect the whole
PMD hole a rollback mechanism is needed.
>> These all are handled in the HMM walk based migration series.
> Ack great glad to hear :)
>
> --
> Cheers, Lorenzo

--Mika


