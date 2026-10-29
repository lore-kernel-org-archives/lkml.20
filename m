Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283235;
	b=mMcjXjvv7DUvnh8rHk7MGgSfDFHYrRHneVFddQ+Ld8JKPs7sNo4o6NgU1irJuIYTeYs8
	 +wVpYfh8bSGUa1e7S+fBOuMcrV/ZJQmQImwvRAZqbyP5kLY3dz5PlZJEc+zCs4rIOCpA3
	 8vOOGcRbiiuLn3AnQ+C0/O+YPdQX2ZQlMPNsTvStEIzQsWIu3g0+KNzsxYPh4eGnvNupm
	 xQxQu9cPTzVZdsYUO0/Oaye6SgthMuC+iHZLPKJFRbXC+hEHjLbW/QnAQzT/jEi1mGAys
	 2gxtizWR/0t+NKopqx8TDg9cWijJLOELZ9Dlo42IGiJZAcVQU9JmjcoeiUt50A3pzJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=VHQCBBokr9ANF1mnkSximMg4YC5imaFH/YUHtOF7V4U=;
	b=LK6abEiIxLqPLdAgqclDJiuSQ3KegBz18Wic1jY3gL8NMiEmBwHBYqmbJ5cQc6sFNK+E
	 XUzuczLAQCvPZB8Y06MljPiFRJgN0KtZjPmF8a0ZWVIMbDuPudTIN+pBbzgV/MTIkDrkh
	 a+Fm1HFBzx+Bk9qvS0xoIVFgC5MvveTZ8n2hBhOv4F0BvRyBV5PgMBlE195DpvS/HWc31
	 kQ9RyzuQggTk/x5AwvC9YStwvLwoqzM2MmErQkUddmAyRpJTOLkL0/01DHs26zzgjJzTX
	 wo1L6DxkeXV19beeMkJzrMN1eNIS17/zVbW+enUtI4+9IMF6cCuEAZozEEh/EL/aWPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="e5/0LFuu";
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B644606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B644606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=e5/0LFuu
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c43fbcb4393so345596466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793283233; x=1793888033; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VHQCBBokr9ANF1mnkSximMg4YC5imaFH/YUHtOF7V4U=;
        b=e5/0LFuukNHW7lzYuFosRJh+HCYXR9pyFNiQxvyIIBVipBFBgPFdS4+6o0e/VLtSHP
         D2NV+uWECYwfjgApOljWOGHKCse0y1GozqH0FgOpVe2BGPs5fNsPIa/znV1SPRUcfRzC
         S2HvVwG+whXsWeX2XViUnh1wbiyPOAgZYzqXUt26yduzQ4O2OmGCssgjZkXAmf+1GtpK
         qCiL3bvCUG1uU/sMo60Z4jhr+nRw7l3FkT58U3zkvqVemdPsgtw1581thB5KWAkrpUg5
         ZQXV5QFXWQJRc25kncj0f/n/AZy335nPp8YBto+psFG1ofitw09eWSoKIi34kVGWTlCu
         Ewrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283233; x=1793888033;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHQCBBokr9ANF1mnkSximMg4YC5imaFH/YUHtOF7V4U=;
        b=uQiadAUBYAAmHG/4cZulhlTOEJXhP6ONTUqYC2B5GrWu7BtvVqO+lSn93wyoRHczZi
         aaBefc2iuAYBuOtsDk8RvHc2QoEQqVOf9teuO8DuvDpglQurn0aV+Aeo1ubfGvCkHLtv
         55m7oCZIJykbJYkx12zFeXQi4fFuSJ2ga259gEbGWFgRa0wiV48tMAS11gNNtLUu4ufe
         gzNQiqkWomCaWsUyDDWUOtcc8XfusyWMIvOU2EsMrwcN0pxSLWgHgeVaeeDRscgFXbl3
         63ebfkGeBD9nF/wdqz77Qf9AjyTvAlFYUr1akE70RaB/T60pLJFxYGExgJBuwiQD2dP5
         +g2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxFq2+QAyJi5XoLX+DQ3VYSoVuQaFl7Dq3waPeJrtUEFBaoZOG7ZaPSyWkw9//xqumYsR3x07AXOm8uTLc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF2vmsazLFzMjvAeNXEXBlSqUrRg2KytU4VcBAKpqJKnvB+cnx
	mFp2Mo7QSaMOCyDR+oR9DQ017utxOxvFpHO94D1uMkJTuMaATicuNBvBFmjgJp4R68E=
X-Gm-Gg: AYBFou04h+nW75y8Cp/Px61yc4CA6q75rkan1iLYVzEKz73/AklA4X8DO1riAM6cgk1
	cRpBMdzBCh260FE/DIxkwfYsk1zxOvdskuZ9fbCztM5WcWwfAAlb94M91Or52rCMuipVqr42XWD
	Tm0Jacl1W8E62a8RplL5GnVX6/G41WPs8QOGRZFwPLAs0YEJNQBkQTJBBm2aWURUWxiNu+E7J/J
	6gHLKH9QEnwn1PNzl4NioSAsJ6nUOdUhe6JHtH661DduY71+u5q4VYWtQoieUZQjpOUNHCIRGbp
	K4A1fiICcefu8H4qc3Krg3p1ECr54iKj6SeW4JumaYQReHXUgNmYHv/cs4Kj1OomZ+N+KWWjGY4
	YLgQ4i1Dacs5YvDGhn31GJwasTBn7yPpNSQgyZPbDMxfWVWXJ632OqWyP1xiA0bYCsYLSPvX8jR
	xXnvKISSPjo84jC5pG1kQmdzipzy451B9kLTM+BRPeQC39qSFqLQboH+zds+77j0oXM5rO2tlR6
	1FKT10QcGX1z/JebzxZ1NGXX6Y2ET9kSbJdmJJYbwNPpm/YHK8sx4rIQ52IiCtp5dFPvFk7Ww0c
	eDBuYW9vrk9H3o8AKUs=
X-Received: by 2002:a17:906:7313:b0:c45:c030:732c with SMTP id a640c23a62f3a-c49be03a73amr545832866b.41.1793283232717;
        Thu, 29 Oct 2026 07:13:52 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:4::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4992141068sm521507866b.60.2026.10.29.07.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:13:52 -0700 (PDT)
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
Subject: Re: [PATCH 18/46] mm/khugepaged: check if PTE table is empty in
 try_collapse_pte_mapped_thp()
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Gregory Price <gourry@gourry.net>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>, 
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
 Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, Hugh Dickins <hughd@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Zi Yan <ziy@nvidia.com>, Lance Yang <lance.yang@linux.dev>, 
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
 Alistair Popple <apopple@nvidia.com>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Nick Piggin <npiggin@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
 Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-cxl@vger.kernel.org
In-Reply-To: <f9067f65-fcdc-4ebb-bbf8-84db9e22af0d@kernel.org>
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org>
 <20261027-fixes_core-v1-18-6f74bec9a5bb@kernel.org>
 <179323853182.453251.8510731747954180380.b4-reply@b4>
 <f9067f65-fcdc-4ebb-bbf8-84db9e22af0d@kernel.org>
Date: Thu, 29 Oct 2026 07:13:51 -0700
Message-Id: <179328323124.453251.12177231963891458248.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-29 12:01 +0100, David Hildenbrand (Arm) wrote:
> On 10/29/26 02:48, Gregory Price wrote:
> > On 2026-10-27 00:17 +0100, David Hildenbrand (Arm) wrote:
> > 
> > I get that you want to avoid taking both locks while zapping, but
> > wouldn't it be simpler?  I suppose we don't know what kind of
> > regressions might pop up with that though, bah.
> 
> Exactly, that's the spirit of the original code. We would just block a 1GiB
> range of va space for the entire operation.
> 
> If you think there is a more elegant way of doing it (while minimizing holding
> the pmd lock), please shoot :)
> 

Elegant and this code do not appear to be compatible.

Another look, i think this is the preferred route.

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
Gregory Price (Meta) <gourry@gourry.net>
