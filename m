Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508244;
	b=GOxUVgoUafxBW3GwMEBGUdaDC4Q8uQqLq26o0iT0zu6ZBpC98q1nJT+ryIKdvlmMr5IL
	 TCxPWPSZVZshdmQBjvRuo6TG+9hg3H5CXvL+jYdkOqkHpHI1uNNEGAOej1f40R8JkyL9X
	 4hgAY2uIhWoXqka8wNy9F+zE7FqZj3djvkqDuoGm/SGylWSu0ekEjuHBrPlpJ5VfwUZv/
	 sRmAeBqCcTwXbx2q8JOz3AxEGpew9S34S7r+TCArg4U5WG81w396dnyA4hzQjzFma/fN2
	 ni1P3W1VSJY0MeTT6HhShBhQLetm6+C3JXjQaz1xCm+pLzzfDJ0ryzHZWmJwnRkl/xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=8heaxWBSFkRNUlviiZ9nDMXdRG+6YAFJsY4iZ/iCCrE=;
	b=lallemKAAnwhPEt/Ik1D5VUY/kWBUQa2/ZrFto8BSG/Lqqr5Fim8tYH9TgVHipDnkfhI
	 0ciqKsJUkaNVdpoPtKHJu30hlQDeoDc6x/ChnFv1SDdBwJN5Yc26R8/FoqfxeVyX1MUOE
	 FP3olBYnbZkRzQjSO1uR1UZkuc/H8o93z94UY5fWHv7K31dPV06/VFKsT4nZWhyvA1X4h
	 edOSCQmN05soxHtcw5IcmQwdMx3/82j51soExT9GTk+WH3X3c4Xf5BLdVg+JoMk4cfG+g
	 rojMvnD1kdsT4XNKu8WGPGH7rjSer2xQCaDzsTFEobylb/CZQlyitIsfeRStw4Ryi7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="B3l/Ciiw";
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87139606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87139606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=B3l/Ciiw
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91ea5600c9cso1579316d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794508243; x=1795113043; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8heaxWBSFkRNUlviiZ9nDMXdRG+6YAFJsY4iZ/iCCrE=;
        b=B3l/CiiwstYmBhgI0goMqwOvrVHqJomGCbsZzhCG6QsPdqqhbWCYjbB/z8hlFyuzVU
         e39kFKxGyKXLBCVeyidQmRxoFGENRYKmNDq4KWAqS8FI+NgZlWtp9Kw9ee2klIBEADum
         TdJ2sqf1ICCwC1cfOnU+irWKHY56MTgJanpb+osTk9tK6ldKBS+HyIIDQtH3jX41BiTC
         qr0wSXbMh0InHAuw6pxLbD9N3Cts4gjgfTmhbu7pb9gAvB4wqLTNURcKncL/8C6fTv1P
         NyE3FPR3A+o1GrOFJGc24suV7Wh+oS0jcOAJIRBVFNAuh1yIbj6PG4SqMznqZOIwoSRR
         2Eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508243; x=1795113043;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8heaxWBSFkRNUlviiZ9nDMXdRG+6YAFJsY4iZ/iCCrE=;
        b=MIWwCVJrXh7ML1eNSFTsQOfU6uzXY/3Blo/rYJkrguod9jNIp/Y3TDu3ALcOUKy/RV
         G+R5zud4vIT8RBItZ9va1eMPciwMu9dcyg6bwz8oFUwRuohVFnOwbSwgGndw0jJUKPhz
         UBZLZ7kCdRzyW2kaODqa/57y0eI3gHdYyPgZ9mjFiuSHCThv6wANY6cIK+FQ7T6zcxDY
         40qDc6eY6mC/dII57NE6wYdz37zheHTotsmXkjfN08kbSxoPmPAgm/oeE8cw64mlTgXA
         gKaJS+6NcYekyZRSDaTIqjYgeAc/a9J74wWi3xa2YjtDfocccvGf5QrTks3yBBWtVCix
         PDTg==
X-Forwarded-Encrypted: i=1; AL+hErGEzLdqRTYMzs4Q/JE0ZbR4B4hvBQWfPy0RXmQnFbFyIGDe0XOQbz1bORzi8CQJHpfJTm0pKZqHFG2FZMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qix+ZiM1vOlu9MfF17vOMelX+7/3eLcYxskjA+ln3xuDi11CP
	onqxsr5NSWWUoFxmz55q+q6UbJoG0H1+2awLZgiMeg5tcWBNZogyo3SveIEW1ATQgQo=
X-Gm-Gg: AYBFou2/YvcOkSmpVt5ju+Iaagl+/TuI68lnicdmklxxJCCKTvu8uaxMDXZP1miyRpA
	quOI0wSEgsb6ov2NpWaH9xOxCtC7XWBvVSe1kxPQamgLkKbXApRhXpbhf7Cs4nxWH1zEoJWFJeB
	VRRoYYkC6aypvwmECguQVoLJcO6pW0rmnsLKbSgguVuhn3NjHs3z/mXNxZhFEUYy82DEZXqqrR4
	1JTkHW11NG1mPHhifAwk+cosJH2x5PdEI8hXnn3JOP5aQ5RxpV6LM2IZOfs9WUNmhoaHsEoM7Ul
	DvY5I3cqvU8PuwovKigFKzTk7ofYKUl1+rayYcxJENIQ3kCi13Pz399Ki5IEgPxcUdL1Bnnt19S
	iFYfZgu6l4+jA32vL4dJ44/VZEFfFlseJH3eCqKs9BEKBmKRcLTZc7lSPAc/WeR7UKcBQaM2MvE
	qmAc9gO3tKxYdq9CKirRjzK9D4W+xT0yAYp6VZz1C+NZWqX4CQPUD0iQ6eIswkbdqn6kZbRq4vi
	4IjHC4FGRBA1hL9L4fz5wFtgh+/WQ9rCHEGv2RbB808zm3j+nkxj4FWYV3ERw1kLOc8qTRaRXBV
	DM2cqExNPtiVJ8mzYe7KmZ0fXPyAoAO58K/K9K4tFdFfAZF8uSXyhctxMhW/Aw53dI6CIYa6v/5
	ZZ+PIq20=
X-Received: by 2002:a05:6214:4187:b0:91e:b592:ee15 with SMTP id 6a1803df08f44-91f13978bd6mr53482146d6.15.1794508242079;
        Thu, 12 Nov 2026 10:30:42 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23da1023sm1861256d6.34.2026.11.12.10.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:30:41 -0800 (PST)
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
Subject: Re: [PATCH 11/13] percpu: fix contig hints that are too low
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, 
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
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Usama Arif <usama.arif@linux.dev>, 
 Kairui Song <kasong@tencent.com>, Balbir Singh <balbirs@nvidia.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Glisse?= <jglisse@redhat.com>, 
 Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>, 
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
 Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>, 
 Chris Mason <mason@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 "Borislav Petkov (AMD)" <bp@alien8.de>, Mark Brown <broonie@kernel.org>, 
 "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-11-3d2454362e8d@kernel.org>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-11-3d2454362e8d@kernel.org>
Date: Thu, 12 Nov 2026 13:30:40 -0500
Message-Id: <179450824041.482102.13630289942269263315.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 18:13 +0000, Lorenzo Stoakes (ARM) wrote:
> pcpu_find_block_fit() skips a chunk or block whose contig_hint is too
> small for the request, so a contig_hint must never be smaller than the
> largest free area.
> 
> If it is, atomic and reserved chunk allocations can fail spuriously, and
> others can create a chunk which is not needed.
> 
> There are three ways in which this can happen:
> 
> Firstly, when an allocation breaks a contig_hint, both
> pcpu_block_refresh_hint() and pcpu_chunk_refresh_hint() promote the
> scan_hint to contig_hint and scan only what follows it. However a free
> can set the scan_hint regardless of what precedes it:
> 
>     free areas    A = 10 bits, then C = 50 bits
>     hints         contig_hint = C
>                   scan_hint = 0, cleared by an earlier allocation
>     free B        5 bits between A and C: scan_hint = B
>     allocate C    contig_hint = B, the scan starts after B
>     result        contig_hint = 5, but A has 10 bits
> 
> Secondly, when a free stays within one block,
> pcpu_block_update_hint_free() passes the end of the free area to the
> chunk hints as a block offset rather than a chunk offset, so in any block
> but the first the chunk hints are not updated at all.
> 
> Thirdly, that free area stops at the block boundary, even if the free
> bits continue into a neighbouring block.
> 
> Fix these by always rescanning when a contig_hint is broken, passing the
> correct offset, and refreshing the chunk hints whenever a free area
> reaches a block boundary.
> 
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: da3afdd5bb54 ("percpu: use block scan_hint to only scan forward")
> Fixes: 92c14cab4326 ("percpu: convert chunk hints to be based on pcpu_block_md")
> Fixes: d33d9f3dd96b ("percpu: use chunk scan_hint to skip some scanning")
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

I was able to reproduce all three conditions and show the pcp allocator
will over-consume memory and in some cases fail allocations.

The change otherwise looks reasonable to me, falls into the class of
"Avoid doing clever things" camp, which i like.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

