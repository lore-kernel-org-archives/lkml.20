Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833768;
	b=LRW/toc2QrYQofSMetUTavJCXSCqNGquCbDhGCASk7zuejxL9wXv0RLFuaYnNbxwPkBr
	 JZ9AguqWcGq3AFLHSAV3mqjxlOwIE1OvgM9NySsmoW4HMnum8Z/wwlhNI3y9G1VcmKNf5
	 vKBEY1p4Yw+Z/fpOYh2BVDz9hlXbZDHhXCwMr6Lf4BChmZ4ra5Ct9WoYl+kEdB3ztSTuI
	 +cvERi5R7xjMk2OfPWm8nStp8peJ1oDlu0yUL9PJ9bwm4NdGg8nFzaxmKJvkM/4sYpCaw
	 E3ehBvM+51fBItPvsh6DdSfSMAdLh/eh3sP2Q9X0fAHFCOqYITNpUvVvpgKRe8KXWDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QJ44xLdhQI1uBh7xxp/N2gaMNtMNeyLEDRfUNR/7E78=;
	b=2S1sNRcjUyuryN4e4CcboNNyjnHNtv4KMH8XszVSb8HRX/b7mnOF6Do9xj3j4DDrgu3J
	 NkGLglxDokCymIGbBfX+BLK3JeKfMFTDpGKCDh9UMzmxlAPffTKx8/36v5oWktRuBz10Z
	 ZC9V0x7roQf5VbGWr4CxpODCs+r/u4XUPeBLYhd6T9Jd5x5bQ0ZBTadSjwsBKyjQwi20Q
	 b7eKqSbzSqVQeLyucBGPsiYP2JnqZF04/0rZGdUIHgP/b2UXIjF+yz2O0H4iEj3tzqWxF
	 3QcPkoH1aMvdmv1K5qugc+/LsI9IRdXrtUw8DTMzavoY+MN79gfHgG4SrrMHwmo40eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjPH+Yne;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E72606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5E72606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjPH+Yne
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso9819085e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833766; x=1794438566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJ44xLdhQI1uBh7xxp/N2gaMNtMNeyLEDRfUNR/7E78=;
        b=wjPH+YnexCxHCatAS+O3CqB/uti+0YeZ1zpXdmwJfGvl18ME2cwPE17tj9l8RL6zKG
         4YD+rNP0FbGe1DApbRxNUKKDQxKiWWyJsEsiIeD5m3R1WFqh5uyBi5/u3mZOh93btlba
         3eNdOhcnOs7Rz8iwRjpkdDIuKPNF5iof1aLQiDacU5C4shWTx6C57mU+9gbm2GGZcfBA
         p5pZk14nucF2DgMpHAyDsRhrYK1h49CfvSIS462o++nOlfmXwYGmg6Vlq1VcyCgAzpCN
         hIQfwykB+Z6qGuAShuE0FkkN5trrXYAempNz1eSEyLl34fNFWujFVUwcAFwoGY/0fLOu
         XYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833766; x=1794438566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJ44xLdhQI1uBh7xxp/N2gaMNtMNeyLEDRfUNR/7E78=;
        b=VaOwF0I2gB4cj8j55SqFH+P7vtTPMWrhdU0P7+QdvAQRKTMnJH+Dzs9gD+/dAfzBBS
         3uz+1HhiPTCziyO8VXsCZodjDCibqyUVgEk4Is0/F8KIlu4+qywN6qfwRPXE2y1N10PW
         IBZ/W4qldj90Sm1jdMGLq4hs7wnkF1W2X1bpQQJpstcPnEwG3C+2JugJtbXSk2BAj43F
         JDkokhbYWz3oWmR3YjRYA2JWW+QCEzVSGB1F/XvkQEbwoF4pH1KLtSokWLvUPqkAsr52
         WkRG4qxm9mBM/pxK95M1XGSiu8Ssh5VgulPEzYisHHJhswfeZoYUBSCetrG1TI1/I/fj
         kkoA==
X-Forwarded-Encrypted: i=1; AKwUvBxT244AW0p5FDhnBuvFajyD9kgQFUb/Go7qu5lr672RIMdH9CGyXaYKNiyo9vm+MO6K3mHxgLwMemBQSjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Um0OCfEqieiy280iYn5jgTp1QnQGf/pHF15c2NURgtXPYxZRF
	+ye6vTuh+6QB5NpoTl1FezBsqiux2pSRKndRYwYQxGcuUNvpZiF1bEri
X-Gm-Gg: AYBFou332t1hJe3xpyUyWQJ2jOOxBjYAXW6Z82/nDcbZode1iIoGK+aMpR6VV+i/fgZ
	gAEfVPw5VzQRkxie7gfxVjTbrrrxxZFsNeRUEyE7ZDJ+jArwjgIojP5MySZpcFwX8bdVXj53/XD
	0U+kVDzsC2VcRPJhdlgDECCw/bJ26cmO9at6vVToAGOmUQL8/likeeBTmT6nI/xb5txlagCe33/
	OFee/uqdOrfbOIxk6lmmCyZalj85Hh4w7u+sK2TpXayOSjbWTgoTd9JVRmoDv7JdLxBjGQM7+4b
	+KkiLvueQ2beHx/aniEdfZ7fTaPRSunxSIPQIu0uOVfRuFkqCBcMrWwOgTkdVWgen7izx05Lk4D
	QsTKpglrUJJa3xifBve7ttD/KBzyXomav0JNE/ap215yuaLcQWxTtLMqkJfy+ihZBn7b7hiSaMv
	Td+bS45poNnRvYxrkLQ9UK+th+VogFZ6NzCBsc5J1m/0LBJDTnqig5oVguRjkV+Gcy5rK218rkR
	nc2bXdHAVOb99HIGIS0iGrzh2l65pl1LL5ez82Sgruwkgr9ImyVaCa8gjA0N9CqFAEipPLuy7nJ
	Q+Vd/4h2hCLPHGSnFuM6IBU=
X-Received: by 2002:a05:600c:3b88:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4ac187a6ffcmr414345865e9.29.1793833766131;
        Wed, 04 Nov 2026 15:09:26 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm18115315e9.1.2026.11.04.15.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:09:25 -0800 (PST)
Message-ID: <a9ed4146-691d-4a35-9b82-e60329688277@gmail.com>
Date: Thu, 5 Nov 2026 00:09:22 +0100
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
Subject: Re: [PATCH v5 3/4] mm/huge_memory: read a special PMD under the lock
 in copy_huge_pmd()
To: Konstantin Khorenko <khorenko@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Peter Xu <peterx@redhat.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
 =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>,
 Lorenzo Stoakes <ljs@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-0-c56d0d26f970@virtuozzo.com>
 <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-3-c56d0d26f970@virtuozzo.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-3-c56d0d26f970@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 9:40 PM, Konstantin Khorenko wrote:
> copy_huge_pmd() reads a special PMD without the page table lock and
> copies that value to the child. The mmap write lock held by fork does
> not stop unmap_mapping_range(): it zaps under i_mmap_rwsem and the PMD
> lock.
> 
> The zap visits the parent VMA before the child's, as dup_mmap() links
> the child right after the parent in i_mmap. If it clears the parent PMD
> after fork has read it, and passes the child before fork copies it, the
> child keeps a mapping the driver has revoked, for example:
> 
> - vfio-pci: the child reaches the BAR after the device memory was
>   disabled or the device was reset, instead of getting SIGBUS;
> - panthor: the child maps the pages of an evicted buffer object after
>   the driver has released them.
> 
> The same branch deposits no page table under the copy. ppc64 in hash
> mode keeps the hash slot array of every huge PMD in that table, so the
> child dereferences a NULL table on the first hash fault, in
> __hash_page_thp(), and on the zap, in hash__pmdp_huge_get_and_clear().
> 
> Take the locks first and let vm_normal_page_pmd() tell a PFN mapping
> from a folio under them, as copy_present_ptes() does with
> vm_normal_page(). The zap clears the parent PMD under the same lock, so
> either fork finds it none and skips it, or the copy is in place before
> the zap reaches the child.
> 
> The copy of a PFN mapping then goes through the same tail as a folio:
> 
> - it gets a page table where the architecture needs one;
> - in a shared mapping it is marked clean in the child, as a PTE is;
> - in a CoW mapping, which only VM_MIXEDMAP allows, both sides are write
>   protected instead of a warning being printed.
> 
> Fixes: bc02afbd4d73 ("mm/fork: accept huge pfnmap entries")
> Fixes: d1503aa9ab80 ("powerpc/64s: Add support for huge pfnmaps")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20261014-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v1-1-d225c60bc316@virtuozzo.com?part=1
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
