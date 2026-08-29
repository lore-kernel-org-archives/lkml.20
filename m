Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753961D4606
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787997405; cv=none; b=Y+VMW4A2qkaE7bj+goIIVkq24z7bBEvF2//r4XVJJkhj8M2poB6/Lmm00Cg19PMFF1MIrjCRT8eU3KyZHh6f4rcc3z2KD9IafZrZZOTAytHaketjBL/UTn2uTwSUPD7aR5TGw9+if6Idvcmrl9NnUzXaXz81E3eyHx8rkPbm0x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787997405; c=relaxed/simple;
	bh=UrFVACfUigNKuEeAS2rOrHF/W3WbbIlyxgRKUtLSz3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlACTe57O+t2biaVt0KA2eLLl6Djjq3OWkFnicNZ6qM04McfiEpMZHVRYAZCMJB9SQpppKZVO8b1RojNGvePkL/XkQZMG96rgAOAIHSC/hlCKlBIQyE6g7KAZ59syDrIVpa2U5X0ZXaDGXp0BlSOL575MyYX1yM/KzPjF1ZiKYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5+BAN31; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5+BAN31"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134C71F0155B
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787997404;
	bh=UrFVACfUigNKuEeAS2rOrHF/W3WbbIlyxgRKUtLSz3E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P5+BAN313h0CYeJo4TIOg6k1doINAoWJENv7bG0Iwvo1zxMOQ05wiV5Tlbbmbkivz
	 Fr+7RZKRDy1cZSaDDJF/ghikBBUh6aP7HgY6cMc2fmam85lNhaHg7tPJPoz2lUlr5g
	 JttkLUyZDJ4DV6ghVpEjgVOYlMRP11K18a22LhgAZAZDEiMs8Q/EIEXg7zOPfgo11u
	 bSjUNzqkRZphDgk0frTJTYODh/EnC8h5aTI3bumwoJj+Z53fq8LvdMM2Vhm2YrP6Wh
	 S7ApTqpxIQT4ox6317a3q5IKqz53YLJ8k0pObjgXlEARelFGvhU0J2X5qAmqNDZ3iO
	 nqwfj+LdoyNRw==
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9384cb251fbso86942285a.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:56:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrfMTI3IouSFjwfsD7W/5tJ3F3QLE5OiPdwA7pPbjeZ98sI4eWbgnZukWzibN8c8hi4VZdJcc3A+MdBccw=@vger.kernel.org
X-Gm-Message-State: AFuF++nv9bNatxXxX6EFsh+RjNZVUBvfJyClMEPA59I/hq0maGOJpwyr
	7bt5bLk6U6LQB3tBvkOZ55zfD72PRsGhz5nHgb4sLvIbfc4GfIZJlHbLW8UP6LciDedyr7JyYX9
	4hHZLOtSTRiNq6024UhvjDiGsHwaeICU=
X-Received: by 2002:a05:620a:a410:20b0:932:dbf6:6f9 with SMTP id
 af79cd13be357-9391377b55bmr1149584285a.9.1787997403348; Sat, 29 Aug 2026
 02:56:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826-mglru-flags-cleanup-v3-0-d9f1c75549c8@tencent.com> <20260826-mglru-flags-cleanup-v3-3-d9f1c75549c8@tencent.com>
In-Reply-To: <20260826-mglru-flags-cleanup-v3-3-d9f1c75549c8@tencent.com>
From: Barry Song <baohua@kernel.org>
Date: Sat, 29 Aug 2026 17:56:32 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wKiM+99c5JzW4kp=J+2qPNGemnAg4x1PeiudamwLOf9w@mail.gmail.com>
X-Gm-Features: AcwNN1V7KSbbFyvp8SG4r87uwEoqsTqZAxA7dZIuQ66MlFFh0qP85fwkFdw6IWM
Message-ID: <CAGsJ_4wKiM+99c5JzW4kp=J+2qPNGemnAg4x1PeiudamwLOf9w@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] mm/migrate: copy all referenced state via folio_migrate_lru_refs
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Chris Li <chrisl@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ridong Chen <ridong.chen@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Yu Zhao <yuzhao@google.com>, 
	Zi Yan <ziy@nvidia.com>, Qi Zheng <qi.zheng@linux.dev>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kairui Song <ryncsn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 1:53=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> folio_migrate_flags() copies PG_referenced separately from the MGLRU
> refs counter, which folio_migrate_refs() transfers. Yet under MGLRU,
> PG_referenced and the refs counter bits together describe the
> referenced status of a folio.
>
> Consolidate the two: rename folio_migrate_refs() to
> folio_migrate_lru_refs() and let it copy the complete referenced
> status, i.e., the MGLRU refs count including PG_referenced, or just
> PG_referenced for the active/inactive LRU. Drop the open-coded
> PG_referenced copy so the referenced status is transferred in one
> place. No behavior change is intended: under the active/inactive LRU
> the extra bits are unused, so operating on them is a noop.
>
> Transfer the reference state first, before the destination folio is
> marked uptodate, so a concurrent lockless reader cannot have its
> reference update overwritten by the copy.
>
> Reviewed-by: Baoquan He <baoquan.he@linux.dev>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---

Yep. We now have some unified code for both MGLRU and
active/inactive LRU in `folio_migrate_flags()`.

Reviewed-by: Barry Song <baohua@kernel.org>
