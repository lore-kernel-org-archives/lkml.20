Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793403214;
	b=3mJW8Le9qkLYIsHFVswSXSWyn396QZ5dBEN81IXGxHxjJRObFe2Z1IjrAMS6LeMbiFdP
	 drosO21LCKvEEnWo2k1p0bIQz2PEkdz1c6pvwXTcVIciGsElgU4w1uWd/FhTHdnbXVcHT
	 C536KvJYj5J13qXi4kbrOau9TfmQmKRLqdpCOBi5NQg9yRmEiqv0nSudtXbuBUI32Y3xU
	 FowcPP1oY7GKAQwMSZt6608P3t/VsHRxnLoFGY+vbgWBiWqeejygg6f2MhuOpOcpP+r20
	 c2cMo2qzL6XYze2Bso6oaETAatkU6tHxI4xzFD2DDWALw35RBKAmNUbWzQEuUnDzUBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793403214;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OPRSfo0QZ75Sz+slqG8MrN3zVsMn83dh2upfWeaLirk=;
	b=FaC9+Dy22QuLurhoTzzrle0ZggxXb9nGrwHCTcTAiMuO2FUd3UNPwRFCyP6SIleOMEMW
	 EghhwOEN298pPWOzh5rv7G4JHLMH/XUMRLeFvtfd6/c3V26O4kPbWJb+UG9lRoKc9mkOy
	 jlw277MquSouxZOONUx6xKlU5U5+qXPcxDx2LbqO1wtj4795SI4dq1JpV0fRoC+S53acs
	 KO/jqPSBUy44wQdRl6vIoUkWpClge9FWvbsvH0HM9uNWJ1hvUdFunCK+U4anW32FC9YKY
	 89in7vKolumtSdEj8TNTripQi7y75JAIeO6pXkhLeiEe/1rL3+HehRQxIG9Z94hmd7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Set1Yhpu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE59606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Set1Yhpu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493271F00A1A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793403214;
	bh=OPRSfo0QZ75Sz+slqG8MrN3zVsMn83dh2upfWeaLirk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Set1Yhpuapq2JPJL0lIcS1ot6Xs7w1xsNG+rC5V5CYBhvXQ0UG8Lj+Y7CK8yU6Ta/
	 remk5jitd1nqZJ9sj0SL9wIC0aifyD4zDQdsULk8elwhS/X8sJX6GUvCzRdzvtbQ6F
	 dEFSYqZKOnH553gDWNarOuiCPAXR5LMu2in8FcTvHHwXomRLLeeoL8kuQnSHmfHXY0
	 phSKjKMfpk2uDF6Na4fXyZORxvjqLPeK9BxXODmSADeCSRswaiU6TzxLcq2vZdtjyr
	 vnTmFsAYH9GjnPubdjrzEqw0ISsw/E8gF1NsgGP015KESruYO7So1TyKjcJl1MXSBl
	 Gq33SYLTd/+uw==
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91b55859245so18212746d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:33:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzyriaDmVu6T0pFiTqJpCXUQ6sVNWcNMRK/VsLsKedP85DzuELJ57YLSXeKsOg2xx3tUWg0PFnC4BLt818=@vger.kernel.org
X-Gm-Message-State: AFq9FYKq6AJaEp8QiSE38WXl3yJzHzkIwYjuVWqtf41/nq3OA6Ed1BU8
	CljFbAGXBCKbP9jFCG5iUd/QqSyvZE8cs3ljCi61bo9uid55U+DNKVGGPMFjsM4ETLxUEw4FyAe
	bqHawTwxxQU8qxsLdP4K2z2nY3mtKk7s=
X-Received: by 2002:a05:620a:6a87:b0:93c:b420:c2b8 with SMTP id
 af79cd13be357-944217b4dcamr669650885a.61.1793403212815; Fri, 30 Oct 2026
 16:33:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org> <20261030-maintainers-v1-3-97278f8a5f54@kernel.org>
In-Reply-To: <20261030-maintainers-v1-3-97278f8a5f54@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Sat, 31 Oct 2026 07:33:21 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4x5-01G5dim5OPm0iuw8V2naHwj3qZkOgogPcV6qp+xkg@mail.gmail.com>
X-Gm-Features: AclHuK_LU5noV4t1G-cnnOf_R0ik1wLzu3ZYmOCyMHU-nWfFHkqwyudGcBvvVho
Message-ID: <CAGsJ_4x5-01G5dim5OPm0iuw8V2naHwj3qZkOgogPcV6qp+xkg@mail.gmail.com>
Subject: Re: [PATCH 3/7] MAINTAINERS: add Zi Yan as co-maintainer for MEMORY
 MANAGEMENT - THP
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baoquan He <baoquan.he@linux.dev>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Byungchul Park <byungchul@sk.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Chris Li <chrisl@kernel.org>, Christoph Lameter <cl@gentwo.org>, Dave Chinner <david@fromorbit.com>, 
	David Rientjes <rientjes@google.com>, Dennis Zhou <dennis@kernel.org>, Dev Jain <dev.jain@arm.com>, 
	Gregory Price <gourry@gourry.net>, Hao Li <hao.li@linux.dev>, Harry Yoo <harry@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Nhat Pham <nphamcs@gmail.com>, 
	Nick Piggin <npiggin@gmail.com>, Nico Pache <nico.pache@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Qi Zheng <qi.zheng@linux.dev>, Rakie Kim <rakie.kim@sk.com>, 
	Rik van Riel <riel@surriel.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
	Xu Xin <xu.xin@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 5:35=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> Zi has been contributing to THP consistently and reliably over many
> years and is considered one of our most valuable THP experts. As THP is

Yep, that's true. I've seen Zi putting a lot of effort
into contributing and reviewing patches.

> an especially active area lately, having a single dedicated THP maintaine=
r
> is not sustainable.
>
> Fortunately, Zi volunteered to take on more responsibility by stepping
> up as a THP co-maintainer. So let's do exactly that.
>
> His placement in the MAINTAINERS entry is very convenient to perform
> this change :)
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Acked-by: Barry Song <baohua@kernel.org>
