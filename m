Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355888;
	b=T98CmvlNbbVOC7DZuACeS6oH1SHV+RoViQIrLtl5HaHCn1eLBMgx1XqDjyhupHWTM8BC
	 JvKfGTYWSB9Aeob8eJczCtsxYvPpCUVRGHyW9wvedR6Id7eRDE955/pyY/d8u+qjFFj/G
	 jX5wpv2fjlml204VJADtQKBYoN9U3HXlMyLevtpLnoaHETKNCVO2ogDv7M47UdKhi2Ya8
	 0HCeUXum583v307DBsx32GRrRpzEfdFk2rm5WkMI3QAdYwMY85H9HGjnl4QFs3pDTpu6m
	 yQ8tL5XMlDFeuPvmBcLlg8A1dtNw54wvaTqjBM5/36omZo9diZ/y26pS9oaFcyzn6/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=CwWE7UOGE7vvkgiGMpiO2wb6+EIxQ8HXhg/iR90K5xU=;
	b=vQGOHSTPvUGAZ3K1DyJDfgOCBOP1lVgYsXBWRffv9oST5yOT2O2UNKrxgA3AC90ukTuO
	 5mK4waa6LKAA+8+wWolJTjXooIaGzE7pj32OZgOUCx2Z3UgWAwBeTB9/iNhOzNAfvEjOm
	 BlgrqnbBesYlSm/gmebDRN83Ow8kDNA4KRtuKrn8ApTwhOLXCl9OOKNiZJOj2mUMkadZP
	 +4D4i5Hgz6iEwQzWhY8YKruPgbwy3e6EMBlJCsvc2j7xxBEEYLvuCqKrWNbhR1k4mKE2s
	 o2IyYN9gftTCxv0pvHPcqshzAVUY5BsBxqut8+BxBeQ6MD5hgH6UAZIdsc/uABvNjOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WuaPdODR;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2D6606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A2D6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WuaPdODR
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2af4c8d00so1022387c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793355887; x=1793960687; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CwWE7UOGE7vvkgiGMpiO2wb6+EIxQ8HXhg/iR90K5xU=;
        b=WuaPdODRsRMFiI8tCzDGLtIWj/t3kmU7toTjs7yU4HCs2ivVqxGQQvm6C7+DRbmp2c
         mytF4JZUfqc8tWgTYXVYiq/EntpFK58ycgKy6BHzSPT/xPNddavbvn/15l7RoYj4rzJ1
         GHcJcCJvZ/nc80BsfpqAoyfDNpOoOIgczkvsBDoVQlFvsr+bbifzjM+LbtU87kjL8cRI
         8D5odWnPRckICnn9cHmMoPWDChpmRdV7BN+4koQaYRRf1EQg9k4pbSmDh6F1YQ3uc3/O
         LDtoIX9o2xiZ/xLZE0g3/sl4xa5l5+9Ds3mVpMbnuJMzJTFpChsV+mTWN20OEHtNRp+a
         o4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355887; x=1793960687;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CwWE7UOGE7vvkgiGMpiO2wb6+EIxQ8HXhg/iR90K5xU=;
        b=x5dG04sRWV4IEAQ9O36ikMA7cAlg3rUnrh3fDYQ0JOwc3EZzez1SEilDcjBlzNsv9I
         wN0wXeETt6865Wug+8/wSZCbbJ5g9CbRidh1dOv/9cWlQnaRAOHn+ID7PK+HNYv5DCJa
         2pgJjXKfb0CB6k38z1Ombh5/hAYR2FzUx+w3ch1Y6lIN3Z9cGqo+LLHF12x71B21me7U
         n3/GNcLeMw0/38ACjUkPpnoFtX3IlOolEX7a8CiNYgOZJ1jpP7x8BVWUBMNWzR+tKCd2
         2J0fFFhTFO7QrQWqiPkBX5UEno1anKsThziSw1vAPuva4ujUjInHMl/Y9EUR/ZgCcmz+
         qWJw==
X-Forwarded-Encrypted: i=1; AKwUvBxpcvPpBIB9bUOM4ckAnqKSq88BRi/JIXtXl4/vL4Ji5t+cDbBA3f6k4Ca0S5UC5vX4VMgAS856ShGKJ9w=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3g775kcf3ZIknR9wTiDnFea8bkC+I5ELaGfr2WTdqmQYGSm3A
	GDxO9hQPwK9V4oadvnUkXz7lqYk1MdwFN7J80j2l5nrtOec5m5rc26i0
X-Gm-Gg: AYBFou2ccMNTtoeplEHkdraAFUd+wxsFGJ9j8QX+dQoJvJ6/sJeC5SS+vHfrXMU7lcF
	p9V2+tgHQtZ/fca2rPt56p6EISg3WuEYfzHPniDCh+csedN4zLHUSmF8pzoWe9K8elW+Eo/yv3e
	ZuDRaiQgj+tJnIoZEHGwvo1ItCo8BMAS8aLjW7rXjBWms5G47dk4s4ud/S+t6PmX83v6HVhNODJ
	lkF8p5KA9NXckNr7foR2nuMumP7FlC9v606dG8zVcPajrwhkfhRfY1IZa4m42H1Xd3dOltcHwo7
	yYVOthoVExMcduAWSvITzlQbtnW5Fm6km7ByTeHUFgDdyg2lDgnhxLDp5xgA22Sv9CUID5ODSJ7
	4Q22EyTIpPfHL5kholwLRBnBIMlKwkvrCVdzLWfEEsyzKdkqQ4VYvwmLZS+NWlBSa7tZj0Gr6p5
	E+Cj7dY+1e63Yuo6doIPHLHoUKM9LCCMNkamTNBm6Rqb9FMYjqNdQGHadxDkxJBLHnncGIbuswK
	eZitl9taYL/Q+085AqAcPvK8SrvhoE5kqcbiMRzSkkSbkGLDj5Y001qo8nbfI4YGLj/GIhKCEYB
	fRXiCyt/IzlafS7Tg+lTsV3qaQs=
X-Received: by 2002:a05:7022:3b87:b0:196:d6e1:108b with SMTP id a92af1059eb24-1ac59fbfd13mr2589413c88.10.1793355886505;
        Fri, 30 Oct 2026 03:24:46 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b0a628bsm5805067c88.22.2026.10.30.03.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:24:45 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Muchun Song <muchun.song@linux.dev>
Cc: Muchun Song <songmuchun@bytedance.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Pavithra <pavrampu@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] powerpc/mm: fix uninitialized ZONE_DEVICE struct pages with PMDs
In-Reply-To: <20FE1232-A48B-4F72-8F18-89EFF70EE0FE@linux.dev>
Date: Fri, 30 Oct 2026 15:50:40 +0530
Message-ID: <bj8bwkuf.ritesh.list@gmail.com>
References: <20261029063601.1961415-1-songmuchun@bytedance.com> <h5i4wlx5.ritesh.list@gmail.com> <20FE1232-A48B-4F72-8F18-89EFF70EE0FE@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Muchun Song <muchun.song@linux.dev> writes:

>> On Oct 29, 2026, at 23:45, Ritesh Harjani (IBM) <ritesh.list@gmail.com> wrote:
>> 
>> Muchun Song <songmuchun@bytedance.com> writes:
>> 
>> Thanks Muchun,
>> 
>>> PowerPC radix vmemmap population can reuse an existing PMD mapping while
>>> populating a device DAX range whose section is marked as HVO-enabled. The
>>> reused mapping is an ordinary vmemmap mapping: the redundant tail struct
>>> pages are not remapped to the shared tail page.
>>> 
>>> Leaving the section marked as HVO-enabled makes later ZONE_DEVICE
>>> initialization treat the range as optimized and initialize only the struct
>>> pages that would be backed by a real HVO mapping. The remaining tail struct
>>> pages can then be left uninitialized even though they are still used as
>>> metadata for the device DAX compound page.
>>> 
>>> This first triggers a zone mismatch warning in __init_single_page(), then
>>> faults while initializing the pageblock flags:
>>> 
>>>  WARNING: mm/mm_init.c:600 at __init_single_page+0xd0/0xf4
>>>  Call Trace:
>>>    memmap_init_zone_device+0x164/0x430
>>>    memremap_pages+0x43c/0x93c
>>>    devm_memremap_pages+0x3c/0xa4
>>>    dev_dax_probe+0x264/0x3d0
>>>    dax_bus_probe+0x140/0x1c8
>>> 
>>>  BUG: Kernel NULL pointer dereference on read at 0x00001400
>>>    __set_pfnblock_flags_mask.constprop.0+0x34/0x160
>>>    memmap_init_zone_device+0x358/0x430
>>> 
>>> On kernels without these initialization-time diagnostics, the
>>> uninitialized metadata remains latent. When userspace later maps and
>>> accesses the affected device DAX range, the kernel operates on those struct
>>> pages and panics at that point instead of during device initialization.
>>> 
>>> The Fixes target predates the section-based vmemmap optimization
>>> infrastructure, so older kernels do not have section state that can be
>>> marked non-HVO. Backports to such kernels need to handle the PMD-reuse case
>>> in powerpc radix code directly, for example by initializing the tail struct
>>> pages that core ZONE_DEVICE initialization would otherwise skip.
>>> 
>> 
>> Actually that would be totally new code right? It won't be a straight
>> forward backport, correct? ... 
>
> Right. Because it's impossible to backport the whole section-based vmemmap
> optimization infrastructure (48 commits).
>
>> 
>>> Mark the section as non-HVO when reusing an existing PMD mapping, so the
>>> section's HVO state matches the actual vmemmap layout and all required
>>> struct pages are initialized.
>>> 
>>> Fixes: f2b79c0d7968 ("powerpc/book3s64/radix: add support for vmemmap optimization for radix")
>>> Cc: stable@vger.kernel.org
>> 
>> ... then should we mark Cc: stable here with the above mentioned fixes
>> tag? Because this patch cannot be backported as is to older kernels -
>> for the reasons you mentioned above.
>
> The comment following the trailer is used to guide stable maintainers to
> backport proper prerequisite commits. It's hard to do that. So I choose to
> mention the alternative in the commit message. But with the help of LLM,
> I found the alternative is also not the right solution. The reason is as below.
>
> That pmd_leaf() path only creates or reuses the vmemmap mapping. After it
> returns, sparse_add_section() calls page_init_poison() on the whole memmap,
> which overwrites any page state initialized there.
>
> Therefore, older kernels must pass the PMD-leaf information to
> memmap_init_zone_device() and let it initialize all real tail struct
> page entries. Initializing them immediately in the PowerPC pmd_leaf()
> branch would be too early.
>
> Another solution is making vmemmap_can_optimize() range-aware by passing
> the vmemmap start and end addresses.
>
> On PowerPC, reject the optimization when any part of the range is already
> covered by a PMD leaf. This ensures that an existing PMD mapping is reused
> normally and that all real tail struct page entries are initialized later
> by the core code.
>
> Maybe it should be a separate patch for old kernels? Thoughts?
>

yes, I think we can do a separate patch later for older kernels. I
will look at your suggestions to see what can be done in that case.


>> 
>>> Reported-by: Pavithra <pavrampu@linux.ibm.com>
>>> Closes: https://lore.kernel.org/r/97f85592bb78a273be8519e6897e7f9b9bd31469.1793070429.git.ritesh.list@gmail.com
>>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>>> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>>> ---
>>> arch/powerpc/mm/book3s64/radix_pgtable.c | 11 ++++++++++-
>>> 1 file changed, 10 insertions(+), 1 deletion(-)
>>> 
>> 
>> I think, this patch should go via mm tree, due to all the dependencies
>> coming from there, right?
>
> Better. I hope Andrew will pick it up once I send a v2 version with more
> proper commit message changed.
>

I think we can add an explicit comment like this then?

Fixes: f2b79c0d7968 ("powerpc/book3s64/radix: add support for vmemmap optimization for radix")
Cc: <stable@vger.kernel.org> # see patch description, needs a different fix for <= 7.3

-ritesh

