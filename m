Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958143;
	b=iNCA58DCAik3rEC/rrlOeJus4zYnp4wDb/cyxmO1SnTQXOBCAI+aOLSledoVJqj1pQL8
	 ZqJEhXsf+EKijl441HNQu0c1896mGM3j32hIQIxoAlp7gjLUba3svllpBwcNh+yxqHugn
	 g+GUNSgQvZQhVyLUZQzqCkpi3GaJdKXVNOy/zu0zRm1xwX0/bMEBU1bJM8U/0agxVdBNi
	 V9497Qs4bAkOEEhrMbZSRJ6wdZLU8zIKPqQBizs/D+cvmaftCT0RMWU97c0M5x88u0puj
	 nb2ZrhF3c5z1h2S/YjBTh2YNzHdJxQIGYxyRMyoFc/zw72haCAR2z+VfSKpZCsQ68/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wxjoU6eh1AnEB74q9TNTzzgoHGIbkez0gtAfCeShC9g=;
	b=tmVF4SeaGk4BFQn/Y137JZ/QX9QO8bPFoqEXYgIEmBJmlu5cjBkhlbf1DYjdTRQ8yz4S
	 RyrYCjnjZziF/emCSqJPG/itRb60BnH9S5OUnDK1wg9ZnfDyj9Tu7TLxy7+78Pxv131vt
	 0/U/lHfVEND4HGjOoz1MCl9wozmYuBDJjPCu7/Ag2fIf+kct7M93xFWMGtYvIgJEZzKFZ
	 /hfpkNeRNf1xrPr8j+Gh62g0F545t7iup9dBBOouyGM13tXcHbt36z5QYrdfB1XHKUhk9
	 n87Cy4E1kUxaOGlGVQ+ElDI4tUI+BG7DBdYWFYYrKJGFRku+0dToDbNh5/gjtEv0kdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f5aviNlW;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C055B606A90D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C055B606A90D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f5aviNlW
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so3188215e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958141; x=1794562941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wxjoU6eh1AnEB74q9TNTzzgoHGIbkez0gtAfCeShC9g=;
        b=f5aviNlWe44WrD8IRdQX6ADMuIeIzKR0W9+k5UrolgZdhp5s/PGxmiZR+YoERBoVJ/
         6icSuT1pJK1BhDf9IIxn5cOoFPu3PXRcOjMBVS/auhQmMFJtiS811F3SN0M+HYUhfQ3z
         zv/RNhWZeAqD7XzxOLY04ZCApDq0VHzqjeoX1GyvA8W4WDjDzzcBAxWierLV9QWXD/NZ
         UQ+7cbI6on3aS/XAL23R+H0tD54FGUBzA783tY3f96ogm/iz8k5ihmez/pJCMZMaPljs
         p05ksTgKwyP1b297hjQpu/uHw9xgDm+3JpKi0vgksCEUrs8AbsWwzuqXcRGIAUH0fsFK
         Fu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958141; x=1794562941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxjoU6eh1AnEB74q9TNTzzgoHGIbkez0gtAfCeShC9g=;
        b=pYNYzGxS+vkap8e2urmiCe2WTKe2YyiQzKbi55jhamYimwpG6mRAUoBXSQrmG0vWKx
         iS5hvvz0FUEcAk+6L1v40ZF7pf0hElL4uPx+dLoFmhBX22EnjXRpZIsirc8l4mD3prFG
         +Ap86/zl/SeCO2Fz52IFMhunNmDisd/3EchNwDmbSwle6WJngKguQzxqHJVbNcenvYEk
         sGSuBwoD/nDysooXRbpL0TEprsGxVuZtrtU7stwJwjWE4AWJznWLOiQQxCkmHHu+mBXu
         KtC7Gb5E8l691YwAwlSvxN7lbSrRxvWvIALVITdfEYVMfwRcwdYGUImr1KNaXUPFORe+
         S1vw==
X-Forwarded-Encrypted: i=1; AKwUvBzW3WVzTz730SWKm1VrAHy4SQ4ALXmEDWjyKjPn6uOgGyWH6NLg2XvED0ctdi7st+PO2JmICRXvvvOy6LQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gALruhIpkQzqT2Oqhw9hlORh1LQTbhLLbaaI26U0rGdzmwxJJ
	RwvF669wCgI8ynC1+oC5D4cIYjjNFv06/f7B/R1TAxeDEOkBxuvvcNsp
X-Gm-Gg: AYBFou1ma7EVwpO7NtgZBI3GHNCDagLQ5bmEHwD1Dvsxxt1bxTlXH60XE5htkCNbXtE
	5IjKPjl3g6v9eHoHPC3G2/JEYPzM5QH+43XGTX9+rsnVHniQv8RqiXqvkgyuUjlsxYfziHak6T0
	PrKxuXBPeROHFOIyoHTSUlcgCodMxPh5ISc9BOAdkEMdL9tP5VSdUtvy6h3dvpY2uLdrSI+sSw3
	LJ85uk58DDCoD3V7nsSJ/gZ6vPUiwq6TdQyr0tOWNBS23VlXGVnIbah05vYiOdGhGWNfa6oWLnn
	tq/JIiiZpZuoiXnOF42BYyNSNiDIwID23xQnB6gSsNiDCvnFVOmdDI+/S01v1GwYbv34hS5ww2c
	AWu609nP5fMPW2bKhFjoRTXxu4snc61YU54plVfaNX+EgCYJbvRkdOu+mdLNlPH7ISmZFezMbkt
	neYhvqBLqRKYaqCs/4NwYGJygCh7PDEU723ddpGrIgprIjjYFwKJx6MrI4m/xtZ27n99BTq2Dqf
	OB137sUCcJrANbJjV/JAtOuuamFic82yQ9jrySm7+afM9V0yh3r6XcHLwhTQvmvhFi63Bb31BPG
	pUkp64IUXtpweyhYlK/rX48=
X-Received: by 2002:a05:600c:c168:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4b6db2ba2demr25269125e9.4.1793958140866;
        Fri, 06 Nov 2026 01:42:20 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b741cdd8d7sm22361285e9.1.2026.11.06.01.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 01:42:20 -0800 (PST)
Message-ID: <528e3a0e-04fb-427f-88c7-63a7f4bbc505@gmail.com>
Date: Fri, 6 Nov 2026 10:42:17 +0100
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
Subject: Re: [PATCH 1/5] mm: limit pagecache folio refcount when mapping pages
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Song Liu <songliubraving@fb.com>, Rik van Riel <riel@surriel.com>,
 Hugh Dickins <hughd@google.com>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin
 <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Steve Sistare <steven.sistare@oracle.com>, John Hubbard <jhubbard@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 iommu@lists.linux.dev, Chris Mason <mason@kernel.org>, stable@vger.kernel.org
References: <20261105-refcount_overflow_stable-v1-0-70b9c655da3e@kernel.org>
 <20261105-refcount_overflow_stable-v1-1-70b9c655da3e@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261105-refcount_overflow_stable-v1-1-70b9c655da3e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 2:10 PM, David Hildenbrand (Arm) wrote:
> With large file folios, overflowing the folio mapcount and refcount
> became possible. For anon folios it is currently not really an issue:
> each large anon folio can only be mapped once into a process.
> 
> That's not really big news, but it's about time that we do something
> about it because some modern technology might find ways to abuse it :)
> 
> One of the enablers for that was commit ddc58f27f9ee ("mm: drop tail page
> refcounting"), however, file thp support was added later.
> 
> File folios can be mapped multiple times into the same process, allowing
> for processes to hold many references to the same folio.
> 
> As a short-term solution, let's introduce two folio refcount limits:
> one for ordinary consumers and one for admins. Leave some headroom
> before the refcount goes negative, which we really don't want (having
> the mapcount go negative is also not expected).
> 
> Start reporting SIGBUS if we run into limits. When restoring mappings
> from migration entries, instead zap the pte/pmd entry. We allow for
> slightly exceeding the limit to keep things simpler.
> 
> This is far from ideal, but better than all easy alternatives we can
> backport comfortably. For now it fixes the big problem: letting
> the refcount (+mapcount) go negative and cause trouble.
> 
> This is only a temporary fix, we'll follow up with something better.
> 
> While the refcount checks are not required for order 0 folios, let's
> just add them for consistency: each folio_add_file_rmap*() and
> folio_dup_file_rmap*() needs a prior check.
in mm-new copy_huge_pmd() now does a folio_dup_file_rmap_pmd() at fork,
since Konstantin's "mm/huge_memory: copy file THPs at fork like
copy_present_ptes() does". doesn't that one need the check too?

the rest LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
