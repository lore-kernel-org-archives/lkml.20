Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136726;
	b=Z7PBrY6nIjPSTaQw+FN8JVubEGjxEqA/0AKfo2B6m/OsxDcRlFqCQIheOKU/QYVfXF1x
	 zMPMqCezp9zK5HaUZM0jUa6gP1oy7Guvmc77o8yc4dHehoJu9hYq+x18apKyMXbE6kEWy
	 RomYFKpuHgIYK5aQPEhRZlR34Hxn0SlR5rovxgMnwNMNAexurYZ14vYGZNBSKwAMJKi6b
	 1t2lDrH3UsXNBQFcO2WPFNWdfSCoqn3FJUXaQhYIh13Snkxz3ntCt+yX2l6JEi6/YtJP9
	 nUSKMqSBp15UL/Hmwl3b3zeaEJzZuuwqWj9gWKwXVY0IF6WLuv2VvJATZWc/Vm9ILfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136726;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S908WbS6sl8a+ccaT1hu8oFrTY/8mXQRTyc6SNjkEfE=;
	b=rqolf0CoG420tRub0i6/co+H1D6cyN1CdJf0m2is1iTIDOGCdXQgbQGgNKWNTSUKpXg+
	 tFMZZzFFBa52zAQhuY5S5REFOT15nkP70cBdmWjJtiNe/Xys10IyB8YaxEBTEt77BL/mF
	 /iPB4//rTKhLO7AMw/90YFrEHIVXP7nDaDk3SHHfBcsEn68dWMD9LL3+ZfuQnQPgjgLCf
	 xS7a96rhNKDNZVvEoSQOV8BsTHsCoR2TWWoR6mTswR8Cp/1iCK6qATF6fQ6z3Of1DH4mi
	 VhdleiOrz88qSF8TvHRezJ1sJmqfbSOjvmRd09DO8DBWIt2VmPXoBYZq5Wp4a95J0Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EGI8e3OM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6F4606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EGI8e3OM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FCB1F031F3
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793136725;
	bh=S908WbS6sl8a+ccaT1hu8oFrTY/8mXQRTyc6SNjkEfE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EGI8e3OMSj8oudPsWvxnIieFF6gTtab2PYp1pWyo2hMoHwm9k9vSCCBUrRG6xC8MH
	 0KGkcd0cCIQIKtaEwW9h9u/ChT04cEjChqjY1CDO6ZnF5ZAGMZXsI/3+Hd+Q5LXBkS
	 tstKAH5wHNK3/OGFItDDgQcCGMMsJehCZKVi5x688GOJAnc5FMB9Yl2vm4YMrbJS8z
	 GH6396g8Z26BXcomQK7YLP1JeyvPWoPTLaXD4wMHyikZsuZfVkFw4ACyB8DThiSEpJ
	 8mEUpcgXD7tk/pPGlMJZHaXf0LVXktt2gvyJsjPwxg15Yv9qrjFy1MJTjCjDoHGfaX
	 kdeNE1WPuUlqw==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93ead211f14so34639885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:32:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0IkxS34+D7hFkwl/6ODBxvsvxsui4apPL23RPNbpax3n3ztn/1kipguHZU30gjFeDBpO7P8GX8rjw3kI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYFpa4A+W8jeRMDXc3ztmL6lz0AQ4+GYvSKsxfrZm78mWv0oGk
	FsN/yH7ITOtTqyclIP0j+iheBbfXwZtKV+pgMiQstM4f2s4fqgSLgHKrlCjZPj5U/l1Rj14OkRE
	FwRt2q72HRfaABudTjH00s6VdsTq5vP8=
X-Received: by 2002:a05:620a:6013:b0:93e:7156:f814 with SMTP id
 af79cd13be357-94408a65be4mr32182585a.11.1793136724949; Tue, 27 Oct 2026
 14:32:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org> <20261027-fixes_core-v1-22-6f74bec9a5bb@kernel.org>
In-Reply-To: <20261027-fixes_core-v1-22-6f74bec9a5bb@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Wed, 28 Oct 2026 05:31:53 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wPwBz8OB5opbuKsVh-ceKqyqi4d1aB8Emx4ChqDe4qzQ@mail.gmail.com>
X-Gm-Features: AclHuK_Qzkd3NBrrAvAlcTVmJZ8ovWd4rfeoh503KU3yWFCYVC_zuTNZmwxW4A4
Message-ID: <CAGsJ_4wPwBz8OB5opbuKsVh-ceKqyqi4d1aB8Emx4ChqDe4qzQ@mail.gmail.com>
Subject: Re: [PATCH 22/46] mm/gup: check for overflow when converting nr_pages
 to bytes in GUP-fast
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, Hugh Dickins <hughd@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Lance Yang <lance.yang@linux.dev>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Alistair Popple <apopple@nvidia.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Matthew Brost <matthew.brost@intel.com>, John Hubbard <jhubbard@nvidia.com>, 
	Peter Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Minchan Kim <minchan@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Xu Xin <xu.xin@linux.dev>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Gregory Price <gourry@gourry.net>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-cxl@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:24=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> The overflow check in gup_fast_fallback() only covers the addition to
> start. The preceding nr_pages << PAGE_SHIFT can already have truncated
> the length on 32bit.
>
> Users such as RapidIO's rio_dma_transfer() can derive such page counts
> from a 64-bit userspace length.
>
> Let's just check_shl_overflow() to reject any such overflow with
> -EOVERFLOW early.
>
> Fixes: c28b1fc70390 ("mm/gup: reorganize internal_get_user_pages_fast()")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>
