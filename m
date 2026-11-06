Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958978;
	b=fAPI56fA72E6m51X8sf3JKR4rRAsyN7ctMLtgROKvxudOzaSmHwuVQ5ByaD9MflFIflT
	 vwWb4L/afNOXTc1vEjIN6twV9xSs/4nCc+umGakUhrWMaHwjmMAKNGpPJKmGS+8DR7Pac
	 UDKf5oxrNFhPINTVJAQFnv8/0w7RROoW0IvWCUG93H889GKg3ipL6jfl7+IYL11frscP1
	 iux7It3bsi5JGni4iH+W3+WUwcF+4maj95ik8Gtp7Zjw6AUc/g21gDYgjsm4pknE78HVJ
	 /mMQGzMErWuihDq+Jm7I3B/nKAqyVRTLba3WjOq0uuOc2hiyM1rV6KDPo8qbDVBuIAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PVNqNcKixHGsvQRk+aF9Z3pXurarEsFSJxJzB1XGyf0=;
	b=5UInV7zaYzXL+tfX0o1O3q+GIajGUrvKx8OV/1URZHhFeS4lvRMy02oL7amZkpAlRVpd
	 9JL8q3fpS/pg+Si+9E7Jetgcv5lfvsetJFkxzlT4Lqpoivw+4WRVLsN17iK9GNSOiUw2U
	 nsG7YevTB30DZlQkoQTH5mx0d8r3bCus+t3hatS1RhwOsgpmUjuwvgKDEyMJGrgVUMufg
	 pg7hMoHrro3Zb0MTwxxaTJiGR2QT8NYujh3m/nt+6yXVp0ppCKB+uquDg/CT7DJVIAx49
	 bmg6yp1ocoG9lfSJG2ixWgksKpc1Zxw9D1HF2r1clNBEnLZhN1VCCnmkTGEiMXTaEMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H1Xmkiwr;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A21A606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A21A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H1Xmkiwr
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491846221ffso365210f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958976; x=1794563776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVNqNcKixHGsvQRk+aF9Z3pXurarEsFSJxJzB1XGyf0=;
        b=H1XmkiwrX3YLzUoz8v63tW0K3f8HeQQMrYHC6NguBq0Yc1lHgV5BxOaPiQVM/nx5Kr
         Nv4Nkr/P+0smDYStmA0vxUWIevexJO6W3YeVFzXWxjpUb82YtyB7exO1WkMPRlrqshbw
         7gdELKEwKXzXZnlrkpHr1yD7exsMl5g9kqsHjwkVOrYoszaDhxn1MLxcOJF4sb/6L3MY
         sIdWD7L/keA+kAzxJc8rrEhKaeUKb4K3OJKzQ0cL4yoRHek+Sk1AtTQV2X8+u59Vj8dP
         k4wPQ0+F+f6g4v8Op0nmFGDXNrToQHYaCL+7LHoyjFE/RK0fmcwPf6Waptypct15sbUF
         jOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958976; x=1794563776;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVNqNcKixHGsvQRk+aF9Z3pXurarEsFSJxJzB1XGyf0=;
        b=zGOw3cz6Yd+dPMEmYcm+7PqB8pNameAALQv2EjYB8+9o2+R7tpQSqbInD8s+WV0Uff
         IgN4pvov5gNjcJaKnD/bWZw0i/JRFToG2zXSACaoNbBXgtsTGDL8GWsMGUHSbOVXI3F8
         n07LR25kcrjHjC5yO0R1aOzKwSN6CxvsoK3wcHCvzfqzbyV1hNNywd85YlrmEm0xJjP8
         5ZTq0XWXVBRAQui4uQRBEJg1y/8EOOtzwE8IwCy32ZfqP8QY4RYwUvvF918st3vIbaPi
         949335n9r8IIzXG86VmZpt0TBNz2xCT+lOLHtS2Ng7UY6jitD78o3E3+DFGFLwquTreP
         gqIQ==
X-Forwarded-Encrypted: i=1; AL+hErG/RebRdI3GMP/Kkqh3Tb1eo0VT4ldPiekTjTOU3GwoBzr3EKKLRjWa+tCua8aoCb+RcscmCDqj9cMOZxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d9U//YJ7ERCnXX0Qu060bK3EYIW4t/gFdxv931FhlK2dWZ30h
	R4IUt5V4cOa7pUDCmJFWZUhH3EILkcjbaLXL8nFNbR+EumPQB6T9/TxC
X-Gm-Gg: AYBFou2mDo7ftJ6abmZpq86ajpzKyyhv/mtzkkYepCXyJE1nki141hSqIdMBTj96eTI
	XF7ZybYDrc8PtsS9KbUiwW4wYMugEnbooSiWdCJM/dTV3wKQ+rkW4SU7QoIrfygmNxBpSQexsxQ
	vOX3tLbI/fJY+hOGc6RVDUqvc6Niov++wJRrnhzEVFC9yakfXGuOEF/Wypt0m+BxnuLvhblk7hN
	R09IWdl9q2R/hOrrQxyNgQ9IIN0QPLfF/NbbKSnJLWyRaLOpHJOYu8eUbSlR0+21/ub0vulFAp8
	wMI3RpG0BCqlqDaBoEqDRSckWkb6dwhM1nAzsYcRDPoCbeai1m4glQ/2qW8gB3LefD+g1r2PFZQ
	3MsNetdcTUDW5vLB8zsPcBoAJMlQqmfB3xE91/IaLV8goPlcpEMKp2mWQ0p3TmayZQw//NILh5R
	4bHVIXvwzTaZ7kPy9b/taHgcod1fV71gaWy2gPFHuPuBJW/re5cflMD2z2KALepUF/pAbcuxiUz
	QYbCFqDfUVk5A5buF7cnq8SvwqpNBzgKaw6t5aTlYi3zpzSDugf8mRXlw3oINegrcdwvZlDSFWU
	X5etf4LMa6kCPqUh7A5Ckx0=
X-Received: by 2002:a05:6000:26d3:b0:48e:6159:8274 with SMTP id ffacd0b85a97d-492765a3e9emr3874962f8f.27.1793958975594;
        Fri, 06 Nov 2026 01:56:15 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7dbb0d4sm2752385f8f.50.2026.11.06.01.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 01:56:15 -0800 (PST)
Message-ID: <e3e15340-d6c0-479b-867f-e5eeac1e0e2c@gmail.com>
Date: Fri, 6 Nov 2026 10:56:11 +0100
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
Subject: Re: [PATCH 3/5] mm/mmu_gather: flush pending references early before
 the folio limit
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
 <20261105-refcount_overflow_stable-v1-3-70b9c655da3e@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261105-refcount_overflow_stable-v1-3-70b9c655da3e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 2:10 PM, David Hildenbrand (Arm) wrote:
> When a task zaps mappings (e.g., MADV_DONTNEED), it can drop the PT lock
> and defer dropping the folio references. In the meantime, page faults
> can refault pagecache folios, creating more references for the same
> folios.
> 
> Let's just request a flush after enqueueing a pagecache folio whose
> refcount reached a certain threshold. Start flushing well before new
> references are refused, regardless of the caller's privileges.
> 
> This is a temporary measure until we have something better.
> 
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 10ebac4f95e7 ("mm/memory: optimize unmap/zap with PTE-mapped THP")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
