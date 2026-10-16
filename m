Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4561EB1AA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792190152; cv=none; b=pmdEJ9vlsSBfiXOC5UES4aOKAFqFR3dC1Q4772lSxjm++A6WxmGvPU/BWEimMP9lZ8vx0TvxH2Yxe1DLy7rNQg7ehKJpOExxwJX0BDnVvxvPR5z4T9Wucw5BYYCVqCyyAegsvug0rUPmBbpW0yBi4CjG0HhylDSRfQDZrBjx9w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792190152; c=relaxed/simple;
	bh=VmV7igZvuYDOPSitcydXZsjMaZjspE3F+MIYJXIO3ho=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=N+5rRbkw60eIeKBywAJA96I2Bu/mPpXYoyno7N4abt0Ik/rXSIedYgGmgwMjbk26zBdKUJcGpE4BaSHREXGM83lGgMYR+ux+tw1jKBBSxKwrJuhvq1JlSZCO38c1/r+BY86D/sTmAn2uWT6x89mKavzxski8B1DwciyJCnBm8WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BvcRh/LJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BvcRh/LJ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so8395ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792190151; x=1792794951; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/LiGROU1CbrwlWaE/oFd62FdockjDAPnXKwkB36OcQ=;
        b=BvcRh/LJw3DaNa9ydeJpQ+XQmeIqmnYauAfR6Gv9c6in/TXJJ8lcxOMvV/x3Q80pS4
         ecm8z4ZjRlV9IsMJTW7C4+yo+/Nhd+L7TtjIU3IJ6cBb8UO1PxbbcgnfWEdWvqv57plc
         RnIqlSVanSOYhkG9GCkcu6MiCoM/Le14cBDFzJAygFeexlPVa8QFZwQYDqBpibP63ibo
         z44J1E+y6pDeEkv0peDL6/Lc1A3UuAYqSzMCPejgZPIpeHryAq/hrRtsrs1yBaQgn1Y3
         7afj3qhh/Jv0bhS+yyzeS9UBQnGohh9RuTlgI1bbP4/LBfA4fR80DsXMD2nFEve58gln
         WtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792190151; x=1792794951;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/LiGROU1CbrwlWaE/oFd62FdockjDAPnXKwkB36OcQ=;
        b=byrtPKN/FWJxzNHLnGwcz8390Ym8rwqvsht8CDvoFYXEzOag9+CHZobwCN8kKqZ5P5
         AdOJH6cFIcorbVGmnWAEDtCsEBWSXfEqOFEKLE87hCC+niF4LC8C68Nw8mdMv8pr6VyW
         ZFPBigiehjMq7uMkhggFNV56hVOHZJyz8i3ehgCXGNWsui/WEje7egZb1xzX8VDJd6xV
         PqNmkjp/+wM2pTwpLJrslZAlXRVjvWLVWKw8As/16Pl/C0JHuEPI9CbAGNr9CC39K7QK
         yoK65Ltxutd/Q+OWea1OU2bSaKxWiZzmZ/KPHy+C1NkaQvu8xlvsAkjvZqHhp1mJ+6kT
         TzVA==
X-Forwarded-Encrypted: i=1; AKwUvBxByi6y311XUcp5lFeOslsl/JWQcoXrhnRwYO/XnWg1N1NSxdDeygpSFdDA2I1PkiM5xKgjdO+A/302NWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK34J/NEnU4BaU8QhWXdzEHAVqF1A00KGeu6xsfllxLFderk9ae
	LPfzwYO6s4iN+kfM3Ddc1g4H8mqxX5Y6IZE1CSQYUkvctt1Kn0mZY0ubXtL7o8qfPOWZIuFiW8k
	nCZpK2Xcp
X-Gm-Gg: AYBFou3vSwUcYSHcXoZaROFThC92NWOnkOcCyG0Vd5n7ICFqEsWBBYq5UxANG1voN2t
	vXfxrMaAGOczCfTgFiazZo60EqDSmNC7Iz5BJV5syl4BXyh5gGJSoJU3q+4Qjas9hECueMzcGBW
	xryoZYkP7nlbowluH96K2DmCdRi1uetNOFbe7aEFExlIoEsG39zHC7Qb41ZzzBwi23ptNS+UKTA
	azluNhxJHK4gZMnUg0k1pq2FSkGuYHtRNZFXH/h6gjbwe/GpDeKRymlpkgV5rUFyTJg+ohXRB25
	LgsDCI5UpXXKeaWG3bp58qvbo44FY9AQeX1D7w036KfqYN9J4vgCgZ9ILPpaAzfJq1kQoaPBFdf
	+FY0HOadLcwt82VFKPXKNmbq7VncqNxWFbISpKbrjzBL/PSpu3f1ueK8wRevTp0gfgEOyKICNd6
	IDWEyBF24V77DGtPmBK/hK5pbGYwm1sBpqA+jG3ml5431jDS0rBoizTWUFeBCSCE3qfleBqgd+e
	tIqcwCs2rI/mhauxSChcc3DxIofD/7VZ9f62b7eS0sxEevO1STICsVeLE63GlBzO8mS97pLIoSV
	9tfUcbcdkuAaZjoJ4eev/RUHe/zD1QSXOg8M6CujoT4iwzWYjM6/lOgMNHmHuVIPWyXC54okpE/
	WD4vDtAE=
X-Received: by 2002:a17:903:2447:b0:2e9:8c2b:979f with SMTP id d9443c01a7336-2e9b3252d32mr704095ad.8.1792190150274;
        Fri, 16 Oct 2026 15:35:50 -0700 (PDT)
Received: from [2a00:79e0:2eb4:9:17ee:cb47:3ad4:ee3c] ([2a00:79e0:2eb4:9:17ee:cb47:3ad4:ee3c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc98139ccsm3148060a91.0.2026.10.16.15.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:35:49 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:35:48 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
    Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, 
    Christoph Lameter <cl@gentwo.org>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Shengming Hu <hu.shengming@zte.com.cn>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/slub: initialize the free pointer of the bootstrap
 kmem_cache_node
In-Reply-To: <20261010203906.93156-1-kmehltretter@gmail.com>
Message-ID: <3284bb03-6c23-611c-872c-19954a7f3381@google.com>
References: <20261010203906.93156-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 10 Oct 2026, Karl Mehltretter wrote:

> With slub_debug=FZPU, validating kmem_cache_node reports
> 
>   BUG kmem_cache_node (Not tainted): Freepointer corrupt
>   Object 0xffff888000140040 @offset=64 fp=0x5a5a5a5a5a5a5a5a
> 
> and taints the kernel. Poisoning places the bootstrap object's free
> pointer outside the object, where check_object() checks it even while
> allocated.
> 
> early_kmem_cache_node_alloc() previously took this object from a
> freelist with an initialized pointer. It now takes it from the slab
> iterator and builds the freelist only for the remaining objects,
> leaving its pointer filled with POISON_INUSE.
> 
> Initialize the bootstrap object's free pointer to NULL.
> 
> Fixes: dc795d4c0282 ("mm/slub: defer freelist construction until after bulk allocation from a new slab")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Tested-by: David Rientjes <rientjes@google.com>
