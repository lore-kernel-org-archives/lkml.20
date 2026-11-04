Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790788;
	b=aoefxZEOTsmFDDVT8Tyth4qaaH5gn668rghyc5Fp+IcWlCNJr0u2Av0LvcwtKPjMifK9
	 BbHDoj9dd8yUkW4AWqjCft9J8HgwaUpywE4o1uqMxX162mxtVpXBcs6mGeJa73pQgjwbP
	 gfYnDV1lq1lBVPDRcb1zFUKzV1aCgeg5YWSdiRQ0yrjWi9QInLRpY0QxyFNA2PsHkM57p
	 pnU+egf7ZM9hciyB41AA7J1zjg9sI7D3df8B2bhcYG9NW4XUfNEa8OWwudQgjXjEcRXBZ
	 pkEKc5yX8LqLv4zwD3JdwQVnvLI8dIapj9yGH4dsNmOI/IHSpYMkuaK0zI8ZvV+UN8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dZQH8qK67DPjzVzFRy8vpMz0SogpfmebsloyVM18dBc=;
	b=Q34gbZLTfC1Z4+defHCcWvUxrsEP4Q9SFRyiPeAsfVZBazSJgH/zqYliilIz/xFDYmcZ
	 Ep8mD+fGQcIZjeceHWTQqWmBfpS17rdYYZxfpndpqozwE4gzRfZo744qHCr/etAYyFu2b
	 /4NPy7Fp1sIaNWyK07Yr/vXLgU6v3tOkjT0bQ5HIeKus9Mhm6J+BTK9CT4D+x78xAElQm
	 jJ+pIyezZA9PO03tlZEjc3pZyR1blDjtG5CgN4LjvkC+ye+aGf459P1iTDFAGTckc7o7s
	 lMSvjkeJGwE4PNd7C6aLKu4f5r5s1Yldqv2wA724tAIUXFT09/S986JvkQPSf2YKk4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H2S4h8li;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872FD606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 872FD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H2S4h8li
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eae12762c9so173233e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793790787; x=1794395587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZQH8qK67DPjzVzFRy8vpMz0SogpfmebsloyVM18dBc=;
        b=H2S4h8lizCZpg9P/a4FdXkrUhW7vZ5UOEvCnDm+dARa0Ei4gU3pRu1q2Luey7kop35
         i2ZG6ySU5hFIjTWKViEeiN6TK5LMBFubVlqlCOzeUW4Oa3lqfey3C0CTfxhWt67oAFxQ
         Jsp2IgSDyOgMt0NqOd72Q4WWTqlidayFZHGnnRU/SGAyMwe5Iw88Zk/Fzjbh7DksNDbi
         /jDPbpP4XKhzw3sQivtTsLTwRByoRXLOnkqr114RDsBLDH/QAUV3rKqetQMiJp3HQHN3
         4xbur4bMcFH+xlAN1ZPSkl0dYSqwgc5KHOTkV/M/xAGFg1sfNp6PzDGcwrMhquZqHjhu
         XJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793790787; x=1794395587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZQH8qK67DPjzVzFRy8vpMz0SogpfmebsloyVM18dBc=;
        b=MQMnMPSVnDLYj68uvQce2dD8D4nKOdqWKDk84L73ab+kWZ48TAEJ1sqt3VAVeqvmCY
         dW4u8VnLGrz3AhgwXTjvrCnRuUj43CzKu60syLuYjPd+2tHOv5ZRCjdz08VBZ0eYvfkV
         +g4gpxNqmyuMkdU4ZupHR4WjBXtV6ElXzhfNiVLwmDtf4wGePaAUOAtCK/bKaGN3fa1T
         nPiu5D2/4qgn144532cCe+mdcMiZp+2T2993IHSiza3ysn6XT8FDubGJK2/V1urm1K42
         gvyYE+ejH57GuarNAn+MctBlUVH26FmqwtOYdOhv9aACWZUzlCidUx2CT3Qsjr8abwUJ
         t5zg==
X-Forwarded-Encrypted: i=1; AKwUvByDm1ajRarRFlg47hetW6zp8v+VzJlapJio7/3/g+IrjHEYwk1i0oKnbry4QW/hPMlQHRUPz+GdQgORZbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PT5VIdP7j8vSb91O5ehn822+9VU+cE8BfSVcPAK0rIYuv33yM
	Vrz11bP4mT97GIGqeNC10EJqjZzDW7gzwFEOCQ0KgB2hJvfWVPAkYDKl
X-Gm-Gg: AYBFou1oftLES7tJVzGUivRpNCiZnYLQCPystmkinUyJOOf36nLfhy1ZC/eduYPhOt8
	Lc5Gl5DAxRGM4cv7M9D2sIYGFmQiSrV14eJ0kHfdG+x+6poNH4GucYccpkF7CdbgatRO6h81bWi
	Ef86AUgv7HaqKichOxbgdvMwgBLfZ5al80yx3lo45RYyG51EBSrbLrOCfeiftE6D4i3AwLI8rOL
	A5xz7oxiVFzPuIsv+amRJBf3d4lKsELNZ5u5REPiSf+WIMIeigUQ5Jql/SBY8hwONC1qJlPmXSR
	FyCh89dXChMdp26p+9pvra3d9l2jzpfK1TuB19SwHIRAOOfubl6W7A+lgWGnM5r2UfyuRQVs+b2
	GFTnsGaVj072nEufnIzFI2ObjG60nk1WPPXoVK7SZliQV3ze4lZ1HXorOUtgD4hctYG5aiA74LB
	tGihxbT5ph6mfGslnbic9JEK6+uusvD5gPEg+npquj27pHX4yQUnHSeoCSZ78GPbffid6lzhvgp
	v6CuRdy93D0ZSVH32Hj2GvzzvSgdkB6S9qdPN2QbwaQlpwBazAE6UuAxHAKngKG0ZXezsqBVZrx
	HcbaySf22LmAcrV8Wd9TiG44imqWO5yrc3zsYgdk2nwzstkqcb+HjvLGn1HwwdArPfVLNzwR4dW
	pszyGCMw=
X-Received: by 2002:a05:6122:218b:b0:5ea:a0f0:192f with SMTP id 71dfb90a1353d-5ec6881c31bmr6232105e0c.10.1793790787438;
        Wed, 04 Nov 2026 03:13:07 -0800 (PST)
Received: from fedora ([187.120.134.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b6568sm1403664e0c.1.2026.11.04.03.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:13:06 -0800 (PST)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	surenb@google.com,
	trintaeoitogc@gmail.com,
	vbabka@kernel.org
Subject: Re: [PATCH] mm: clear pmd in pmdp_invalidate()
Date: Wed,  4 Nov 2026 08:12:54 -0300
Message-ID: <20261104111254.320059-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <f1b2ec5a-f7a7-442c-97fd-f67fe6ecb197@kernel.org>
References: <f1b2ec5a-f7a7-442c-97fd-f67fe6ecb197@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

David, I haved immersed inside this problem on last days, and how sashiko-bot
very well apointed, I'm haved doing a wrong duplicated clear on pmd's. I not
notice that the pmd_establish() already called the page_table_check_pmd_set()
wich in turn call __page_table_check_pmd_clear(), my bad.

At first time, I thinked the problem is a duplicated
page_table_check_pmd_set(), but with a LLM helpful I ruled out this hypothesis,
because I not found any obvious call to page_table_check_pmd_set() before
remove_migration_pte(). At second time, I suspicious that maybe we are haved a
race condition, that make no sense...

After a lot of debug and tests, I found a thing.. And I attempt to test this.
If you see inside arch/riscv/include/asm/pgtable.h, the pmd_mkinvalid() do:
```
static inline pmd_t pmd_mkinvalid(pmd_t pmd)
{
	return __pmd(pmd_val(pmd) & ~(_PAGE_PRESENT|_PAGE_PROT_NONE));
}
```

but , the pmd_user_accessible_page() check `pmd_leaf(pmd) && pmd_user(pmd);`
and pmd_leaf():
```
static inline bool pmd_leaf(pmd_t pmd)
{
	return pmd_present(pmd) && (pmd_val(pmd) & _PAGE_LEAF);
}
```

and the pmd_present():
```
#ifdef CONFIG_TRANSPARENT_HUGEPAGE
static inline int pmd_present(pmd_t pmd)
{
	/*
	 * Checking for _PAGE_LEAF is needed too because:
	 * When splitting a THP, split_huge_page() will temporarily clear
	 * the present bit, in this situation, pmd_present() and
	 * pmd_trans_huge() still needs to return true.
	 */
	return (pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE | _PAGE_LEAF));
}
#else
static inline int pmd_present(pmd_t pmd)
{
	return (pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE));
}
#endif
```

And the TRANSPARENT HUGE PAGE , is exactly a page that I was allocated with
mmap() (see my previous emails with my repro.c).

So, I change the pmd_mkinvalid() adding PAGE_LEAF flag:
```
static inline pmd_t pmd_mkinvalid(pmd_t pmd)
{
	return __pmd(pmd_val(pmd) & ~(_PAGE_PRESENT|_PAGE_PROT_NONE|_PAGE_LEAF));
}
```

And this work for my repro.c.
The problem here is what the documentation of pmd_present() say:
```
	/*
	 * Checking for _PAGE_LEAF is needed too because:
	 * When splitting a THP, split_huge_page() will temporarily clear
	 * the present bit, in this situation, pmd_present() and
	 * pmd_trans_huge() still needs to return true.
	 */
```

So the documentation say that if a THP is splitting, this should return true
event though PAGE_PRESENT and PAGE_PROT_NONE is cleared.
If you think about this, maybe make sense.

And after some searchs I saw that was already fixed by Yunhui Cui
<cuiyunhui@bytedance.com>
https://lore.kernel.org/all/20260523042052.35476-1-cuiyunhui@bytedance.com/

Thanks, Guilherme
