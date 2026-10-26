Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792990367;
	b=dUdQ5RcLCJmYKNwVpafdVEiHB5wgAriMnpziT3I2FLPY2k2jCTtT7tnUJlqzSLVWK+CK
	 bwudV0cscIfcLRBnc7vvN+4AT50eOb+hMxQALsAtapNEXFu2F5YV9/IjjYDUVkGscYA9P
	 BO1g8brZNRubmXuTyrgNFFvsJ/RxMfDNiDiRy1teoa9ppjLxMMVyK7Yk5TDl0MWsdEvod
	 J4c+Veqo7VEGdKEDjdU1CNzgF0mFcpwYnU4zaTS+H70zN78UyY5myYVj8gPs4eXtQ9/b3
	 bT7GRvniGHUpuidM3/8WCGLcOfo7gzP8FRRgtOLtUFOAJl1BSzkPvwg3LNlQoQlMbOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990367;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wBTt6MDoP0oWCk5YcX06KXZMQu4SU2+/GpSjq8u/XPI=;
	b=uQJqbdIz/DBSpH3U3X7MVlUk7BPf9ZiShvzAjvvzIVRa5mk76HfksasIb7TEuYm8V0Mz
	 Ym4kLPRZhQCISh8mzD5cmmkWptQ/3Yq/nigsD3vu0ed6imBqhECfN/fNJZPeEePF+8UXP
	 S/koUCeCLdf+Uc+rU0Ms/whbhtQrw1n+9odywlRkMtlY6RDLMWRhhPCi8GrE6Y7VYVL0H
	 zEwBlciuE9Cg+ofrxAjHaDBrFUGv4Na3Dr7lN03Bm+UBl18wwMIkDVysOujcgSNnwIm3e
	 b7G1Zf9QWxYi48yOs65rbTBXgZ/ND++IvA7n7wkePbz2DB4ec+0kavQp+CEIvVX2TFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQvr4fMu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424D0606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQvr4fMu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB321F031E5
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792990366;
	bh=wBTt6MDoP0oWCk5YcX06KXZMQu4SU2+/GpSjq8u/XPI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hQvr4fMuzl0diruADxjlXwpzYFn1Oc8BjJqOFIs/NNF6GXbmOFnc+Qs9zuaTLm2cU
	 +k/H8dkVBTue0J9zL8FPMtklx+PEkQJf1iGmExjA9StqYCOf7j1MP7zeal9RgW1fV/
	 2be3dzLsDypHyO+mLtt6ykD69HnJwv9HWwn4S4Ga82mKWwmCr0LrUjy5THI8Zb8FvM
	 +Z0S7gMP7JUbd85ld2RZPSV1B3NNpsk+TcLFAeye2uFoukxP9hEQMwbU1ab2s1GRy1
	 FhXSlBB7bC0LkBwcfkoU0vLXBEKGlH7J0WiHKAF+ufxWGXY9VW9/HpoqBTCJHRN/9K
	 Pp+pvS2ANhAuw==
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91791ec1b83so20478326d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:52:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByZAuPJQl8QcrtkzEvurCu/bgvGQFfue+aCsbOc2MNMvF9gzKCGXaxL0BCtQJXcRcZCEKKUYY1r0uJCppg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOEesvfp7B+01pfiOxP7Dt1nRXDEaL3zVOxZDdE+0bJMxkE5zL
	p0ixsPuiGy+oqZZB1GDWJPbBqdiSyI8/eK4fFKqPiNgqiZqj0wRemgAozrUKdHM1XihiCACqekh
	xp69iHgcxUMfNn6OipzCsJ3XK2i8ojJo=
X-Received: by 2002:a05:620a:2603:b0:93f:565f:e46 with SMTP id
 af79cd13be357-940ef97fb6emr813826385a.52.1792990366068; Sun, 25 Oct 2026
 21:52:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-ksm_fixv2-v2-0-8b61ad0491f1@linux.dev>
 <20261025-b4-ksm_fixv2-v2-1-8b61ad0491f1@linux.dev> <CAGsJ_4zUVpBJazRxc1CzN6u5XvpUaGnaf-_7JMz-rGK_ZTYMtw@mail.gmail.com>
 <e865f7f0-087c-4fe5-b729-6e6946cd20f6@linux.dev>
In-Reply-To: <e865f7f0-087c-4fe5-b729-6e6946cd20f6@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Mon, 26 Oct 2026 12:52:35 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wp_jCtCeMx39nW0Z1Jm5pja7_V6XNwLB6p7zTan0c3VA@mail.gmail.com>
X-Gm-Features: AclHuK-BfQrdt1kOWUG-wz67A8OjcZGoLUsTLJeHszoeBANLz_PBEAvc05UFngk
Message-ID: <CAGsJ_4wp_jCtCeMx39nW0Z1Jm5pja7_V6XNwLB6p7zTan0c3VA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm/huge_memory.c: skip zero-page remapping when
 underused THP shrinker is disabled
To: Nico Pache <nico.pache@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Yu Zhao <yuzhao@google.com>, Xu Xin <xu.xin@linux.dev>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Usama Arif <usamaarif642@gmail.com>, aarcange@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 5:48=E2=80=AFAM Nico Pache <nico.pache@linux.dev> w=
rote:
>
>
>
> On 10/25/26 2:28 PM, Barry Song wrote:
> > On Mon, Oct 26, 2026 at 1:40=E2=80=AFAM Nico Pache (Red Hat)
> > <nico.pache@linux.dev> wrote:
> >>
> >> The zero-page remapping in __folio_split() was added to support the
> >> underused THP shrinker. When the shrinker is disabled via
> >> shrink_underused, gate TTU_USE_SHARED_ZEROPAGE on split_underused_thp
> >> to avoid scanning subpages for zero content unnecessarily.
> >>
> >> Suggested-by: David Hildenbrand <david@kernel.org>
> >> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage whe=
n splitting isolated thp")
> >> Signed-off-by: Nico Pache <nico.pache@linux.dev>
> >
> > is b1f202060afe a correct fixes tag? as
> > commit b1f202060afe has no even "split_underused_thp" there.
>
> I believe so. IIUC these two series were merged together. While
> 81d3ff3c6f7 introduces the toggle, b1f202060afe is where the behavior
> started.
>
> I guess you could argue that the Fixes should include both?
>
> Not entirely sure!

Thanks for the clarification. I guess it's fine.

BTW, with the code below, we no longer add fully mapped
folios to deferred_split_folio. So the scanning code only
handles partially mapped folios to set up zero-page mappings
for their subpages.

I'm still not quite sure whether this is really harmful, though.
Am I missing something, or was there some discussion I missed?

void deferred_split_folio(struct folio *folio, bool partially_mapped)
{
        ...
        /*
         * Order 1 folios have no space for a deferred list, but we also
         * won't waste much memory by not adding them to the deferred list.
         */
        if (folio_order(folio) <=3D 1)
                return;

        if (!partially_mapped && !split_underused_thp)
                return;
}
