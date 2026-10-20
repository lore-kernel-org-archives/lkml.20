Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536037;
	b=rPBWTDSMI520rmKbFDPSfAeKqdQIloPsaheZQJHSHTX0SqQho9UjQMaKfweYDk1tnQPi
	 lEvhGyh8kBSU3d5E699MTpf6Bmg12WYxfGLmPUpsXptao9gYbARkABc4VOAuSmGtens1E
	 gd1wJjh7O3BgiUijQT81hgmO0tfgDrz0G5PsqZZ6W2HSL1Kkq2RkoAuDYFsUOMVX3G4fa
	 LdRYUJtyjTjKl+Ku33n8vRM8YMkuc4tYYBmMBfngpQRK6XRFG9fDVCSmY+eDktue5gDFX
	 NnGAhOJzLnbomqJPUsabCGBW1FrMcACEjyDuqZNSEflMdNd88EucjqCEztTHWZmSbnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536037;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=84jZLGzTIT4Sj3i9FX7tcYRkNT2fyVWLYZ5z8y+jcQs=;
	b=q7tDQvLVdXpjRa5fZbJPPwo5JJoTE2MKuzy/mnb+MMslD0X07ftwXwAusyIBGrplazUR
	 YyCxybRfB9tL1P24knlataMhB6OLnXk+fT+7P3w3tk2cYIX7AtArNsAHKnGK14HP9gbGX
	 6FuGkq8al75+XEsCNt0xoTg7mnjDD/Ph9UXkV5TZMgIiwn6lYHbEGipdwh6jSOEfKjk8r
	 FYu8gK06wmSNj8OQaVSSaFcxcdOq3RaWxeXSrXEUElHo104IpHqi+6fbJw3bPSobWyo1q
	 kpH50vGs3bQ4h0tobZ0ze46z3iKp8mF9n20n/e1fjUTKI3UtC4VE7Mt45w7/xKXiYVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oIwZ2y8v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5847B606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oIwZ2y8v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4C51F000D4
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792536036;
	bh=84jZLGzTIT4Sj3i9FX7tcYRkNT2fyVWLYZ5z8y+jcQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oIwZ2y8viELTIUIyDEDuwjC6IZqgsuxpY7seZZTPVzwbr8SnvAbVEO12sYHp9gEdI
	 rFJ7trUK5Cp0XvFJCE2O7xsbULGznKYVwiImeNAog0Y0D0Q6JQXXYS5qLlwvWxK126
	 SOI3D7U0QcIeh2EpI5uyPSD78F+onhIKdNcnMz6KnS27hEDnTJyzGuov779fn69bbc
	 vLDJ8LE7yl7eEMsEm7BAFDCPqOM2npdq77/hvfJF89h7C0ppRqa6unNkx/r1l0NKGR
	 xPrbpSVMbLWgs2JwlcUQwbFW6ZGFGOC3yef4L3vLDVMLDZwBrn06XTSV9Aq3YUboVX
	 TXRgORDAKzE/A==
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f1ca4132bso13599485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:40:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByV9pdiGqLiWDSeMQ9hI6AvSYlYv0LX1+/EAj08bArSlbs4L1HTd9hP3mYvY2UNhBGCf3+UsXyr5L4QxFM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoY6eJ94eaFsLylxW82xLh+wGBqahhXd5Qjt5wvSxdOm/orZ6+
	1syAXCm3BWo8n8D+mwtKYj2U6XTZuju87JAjZH7/e1qcPI8YHMfHXfxlIhdo4UQheCsHpHmtCFb
	HUiOJCTBuZpoCQTYcTHYC1wJk+kmKFZ8=
X-Received: by 2002:a05:620a:40c1:b0:93e:6283:eba6 with SMTP id
 af79cd13be357-93f57f1cf03mr122558185a.38.1792536036147; Tue, 20 Oct 2026
 15:40:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019230646.3510790-1-joannelkoong@gmail.com> <20261020153648.52636815691868735e9699be@linux-foundation.org>
In-Reply-To: <20261020153648.52636815691868735e9699be@linux-foundation.org>
From: Barry Song <baohua@kernel.org>
Date: Wed, 21 Oct 2026 06:40:23 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wq8jii0HozMonGej+2O5k90DB4ii07WaBHoOQOKQDokg@mail.gmail.com>
X-Gm-Features: AclHuK8ovGRhlv1AIzUCiEbFfOLm2OwfNkpHY-6qkuv3aKlEYhCczyrQk4_0jvI
Message-ID: <CAGsJ_4wq8jii0HozMonGej+2O5k90DB4ii07WaBHoOQOKQDokg@mail.gmail.com>
Subject: Re: [PATCH v3] mm: unqueue deferred split folios outside the lruvec lock
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Joanne Koong <joannelkoong@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Usama Arif <usama.arif@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
	Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 6:36=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 19 Oct 2026 16:06:46 -0700 Joanne Koong <joannelkoong@gmail.com> =
wrote:
>
> > move_folios_to_lru(), folio_batch_move_lru() and folios_put_refs() call
> > folio_unqueue_deferred_split() on folios where the refcount has dropped
> > to zero. In these paths, folio_unqueue_deferred_split() is called with
> > the lruvec lock often held (move_folios_to_lru() always holds it and
> > folio_batch_move_lru()/folios_put_refs() usually hold it for every foli=
o
> > in the batch except the first). However, it's not needed to hold the
> > lruvec lock.
> >
> > The lruvec lock protects folio->lru and the reclaim LRU lists whereas
> > the deferred split queue lives on folio->_deferred_list in
> > deferred_split_lru. The deferred_split_lru is a list_lru with its own
> > per-memcg per-node lock.
> >
> > There are already other existing callers that call
> > folio_unqueue_deferred_split() without holding the lruvec lock (eg
> > __folio_put(), shrink_folio_list(), __folio_migrate_mapping(), ...).
> >
> > Add folio_batch_unqueue_deferred_split() and use it in
> > move_folios_to_lru(), folio_batch_move_lru(), and folios_put_refs() to
> > unqueue each batch of zero-refcount folios from the deferred split list
> > after the lruvec lock is released and before
> > mem_cgroup_uncharge_folios(). This helps shorten the lruvec lock's
> > critical sections, which run with IRQs disabled and are highly
> > contended.
>
> Thanks.
>
> This is a speedup and not a correctness thing, yes?  Let's make it a
> 7.4-rcX thing, for the 7.5 merge window.
>
> I'll park it in the mm-new branch for now.
>
> If people think the speedup is sufficiently worthwhile then I can add a
> cc:stable to it, if clear justification is included in the changelog.

This isn't even a speedup at the moment, as no users have
adopted it yet.

mTHP folios aren't currently added to the deferred split
queue. Joanne is about to add >=3D2MB mTHP folios to the
deferred split queue again, but even then, contention on
the queue shouldn't be an issue.

It may become a problem someday when we add smaller large
folios, such as 16KB folios, to the deferred split queue.
So this patch is more about future-proofing.

Best Regards
Barry
