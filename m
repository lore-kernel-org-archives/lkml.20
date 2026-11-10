Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314748;
	b=P331raJbYp7ax6hNqgOWBpD5rvyBa1dQTyL01iD7QXUng8iRcM5ecoH4Y+ucC/wqMO18
	 d3FuAr56irteb1tWrbBE/5GUTwlECu2flnaJ+Q9UFLMGRipz8uO/7htjkJI0GaY3dN8vJ
	 /bzQEKMWDhz6oXm6a1XFI2LwyW2G+QKysRmUCvPQgmmNkXa0huhKTq+FDd8w8zye+S7pm
	 l2AcELRb2zDKdNs1cnC6FZ1AO4oti0ZnM9bpmyqDSySw/RL0KD+a4NMLgI92/5n9FRYSy
	 BCAneSeys22cWaI5S7qnZOwUA7sYXu907oKwh5D486bP7rircmg3la3ygdWbyIRgyjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=/n0bim+DZunsCFW3lXGEDWBVlO3l7mvDuQoSVxWJW/Q=;
	b=ux60NynD05ekPd8Bv2Nat0lzMhbvqjVRHMoMR8+3WSzphqVIiqIe24XwwwBPitr4L+vY
	 djiNZYnl/6/MkgL91mjFPhargjD+Gs60eGfQboPlQpBs2GlnG+k/FpsJ6ThngUFbRjg5y
	 r4YQSh2lESJYZRXWz7X2rNvPeq0zH2hib+ZCdeXpLtZ8KM2ihIri6LUZe9bWRCw3ACwJA
	 gu5t3ngYdgLp0GFeqt0ZAXlvCXheTJA65+89aKvGEfN6uvxehVBVZV3vY7kYyG5vCzvNM
	 GiQlKDzo4jnzIuZC5qNf9Tzm2uIZwhi8yZpDBSIpC1OCV70lAuVfxdIemm4rHt4ytcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=tiZ1cWKS;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD801606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD801606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=tiZ1cWKS
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93a40a9a01aso249184585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794314746; x=1794919546; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/n0bim+DZunsCFW3lXGEDWBVlO3l7mvDuQoSVxWJW/Q=;
        b=tiZ1cWKSpc9uAv0SdzmnaMzMNtVSWuInLRsIW8yxgbXOcAaw21fF2tKef0pbuZrtXH
         +aQ0sd4xtOF1PnF3vnvB/LSDXBjOSrJErA1oSrgBc5DZgQQdjpCJX+hYFYkQ4WAITkAD
         fDzUDn9nje5T45hIFzVxmaTKlJ7xpWldKxWedK8WqnRk4paqGkz2je46okt7IFJGjZmi
         IDx5hHlZnatMfaYpoQrRjZDuIA3xr1IeGibAjwN+3PFyfGCzOb4qJ5s4+cM13tYMewmG
         fq8+WmwDUI0puflffDQkswi8ZZ+69IhDbpzipsofhkc1Uo0K/GcDMPq0tP6kmv9F6aTl
         n+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314746; x=1794919546;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/n0bim+DZunsCFW3lXGEDWBVlO3l7mvDuQoSVxWJW/Q=;
        b=TcIe9/I9Y3rGDjY67n49XpZlRmahf38/bAaR61wdJAiIWMxq+K5tYZAoQCyqnFfHWj
         gR3g2JHv1VvhiwvyyKhs3WQH0xjHm1V7iNRH90jnFKbmmZ9nIYkE7WyyB22zxL95cqWv
         rRjTxyLQc6nD0GzrOtvnWdn+asjYdY/ZTvyur5HQIl/Ji6Aef57pbynBEdPs6+cz6D5y
         Sx+joRfys26WstnjPTeq+r+Cz/0u8uLEKpf9qSoykhHSvWcX/SzVQRZRvfbjBW/xgmBs
         eZxKbUIDPW97zwmG905h/hkpuoHfqHTucVgGXfyhmzwAmhtwyTF++3Om2H4gYsl+fWE5
         PICA==
X-Forwarded-Encrypted: i=1; AL+hErHJWv6LDC2MaeP/FtaNdKAbveZVifL8H84fTxtiewpYXCBGaPe3HeKjHXGN6+7oV9RhFJdRwe5Dij/hdf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pZ5xfnVKDZC+mYq9P6t6n/YCnEO5SG71u/3/Oy/I7IXsWocGl
	q2J2jrrILBl3w6RyFtu88dbIKnYJoa6UVZGsTfnOXwlaIO6X06WWpYPO6P8e+VMvo/s=
X-Gm-Gg: AYBFou1a2Fe5CNpl3KlRl6E6WVuWCXoNaNF6y9U+CeYg8VLzaZUf/sOQu7JkoezBZSL
	arblq4wjhsnfQZefK12tJWS3/gXzAPW4xQSMmNYNF4k8cUoHi8bo/TqvSU/4CDUIPiIaldzRV7s
	DaOww6UBCNkTWmBB7BVHxd5W4hfakQpOKPuoDvOnJ9IqLoyNaq1hHW5mVQl6uoHRFGeyJ4WoSi2
	vUNX+SKlFZU2g8STh82qlQaXWpDvmz4ZHHCCB9R2J+S/S9wW5HqeA11Z7lIDxqgp/Nvth/aGA9k
	czW5HIb+8rounWLZwWpd1ifs9xBncaggwFbpd1l+aCvpW2GbtbtAq6nr7AhVpCGfwxCAs7ibyJP
	UB2vHUDokZgmf2aO4WmWGdSweWPxcm1vqzAN1JEpZA1RmmU8T5l8oGgKUnqDnGO0yykCULCwICu
	dCML7rUANNgS2ifP5MgOAcibghqlV2DLzCTcjdQiuh0r0Qat8aHVQNmG9iPYKei6lcxSjX/XT4L
	kF9Q8E0mWct7eaIHw7K00nFQuSZ3+U+wVDGp5dNzZT8zU73JF0Syk5y6uOhuWrdTUaDFvmKacG6
	jYgSJ2UWwJ8oNuDzOioUanEWGwd5chRr3GW4CNj2obHQIqRxqcvcADCn8MiZ2l2xx6PI7CynalX
	QpMgyBhE=
X-Received: by 2002:a05:620a:4055:b0:93e:7ec5:2cfe with SMTP id af79cd13be357-9479f4b6e59mr357636485a.28.1794314746577;
        Tue, 10 Nov 2026 04:45:46 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73c3ddsm215618585a.15.2026.11.10.04.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:45:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] mm/hugetlb: charge hugetlb cgroup and memcg in
 alloc_hugetlb_folio_reserve()
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 David Hildenbrand <david@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Ackerley Tng <ackerleytng@google.com>, 
 Daehyeon Ko <4ncienth@gmail.com>, Hongfu Li <lihongfu@kylinos.cn>, 
 stable@vger.kernel.org
In-Reply-To: <20261110-for-alloc_hugetlb-1109-v2-1-25795ce44f80@kylinos.cn>
References: <20261110-for-alloc_hugetlb-1109-v2-1-25795ce44f80@kylinos.cn>
Date: Tue, 10 Nov 2026 07:45:44 -0500
Message-Id: <179431474443.789062.10429880669466859032.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-10 14:05 +0800, Hongfu Li wrote:
> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> alloc_hugetlb_folio_reserve() hands out a folio from the hugetlb pool and
> consumes a global reservation, but unlike the fault path it never charged
> the folio to the hugetlb cgroup or to the memcg.  Folios allocated for
> memfd_pin_folios() through memfd_alloc_folio() were therefore silently
> bypassing the accounting: they are never charged to the hugetlb cgroup
> usage counter (hugetlb.<size>.current or hugetlb.<size>.usage_in_bytes),
> so the limits (hugetlb.<size>.max or hugetlb.<size>.limit_in_bytes) are
> bypassed.  In cgroup v2, with memory_hugetlb_accounting enabled, these
> folios are also not accounted in memory.current and are not bounded by
> memory.max.
> 
> Charge the folios to both the hugetlb cgroup and the memcg, just like
> hugetlb_alloc_folio() does.
> 
> Test with a process that creates a hugetlb memfd and pins pages through
> UDMABUF_CREATE. The counters were read while the folio was still pinned:
> 
...
> 
> Fixes: 89c1905d9c14 ("mm/gup: introduce memfd_pin_folios() for pinning memfd folios")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>

one note below that is worth assessing but maybe not a blocker.

> +		ret = mem_cgroup_charge_hugetlb(folio, current->mm,
> +						gfp_mask | __GFP_RETRY_MAYFAIL);
> +		if (ret == -ENOMEM) {
> +			folio_put(folio);
> +			/*
> +			 * Skip uncharging hugetlb_cgroup since the charges
> +			 * were committed to the folio and freeing the folio
> +			 * would have cleared those up.
> +			 */
> +			return NULL;
> +		}

This adds a new -ENOMEM condition on stable which may race subtly on
two tasks allocating against the same memory.max and cause failures.
In testing, it doesn't cause splats or anything, it may just cause
spurious allocation failures that fallback to other paths.

This implication may be worth a comment in the changelog.

~Gregory

-- 
~Gregory

