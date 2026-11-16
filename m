Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794799101;
	b=mU07i8RjmSXFd65Dz7iy80BDdkVMj484vMr1GlTiXOCtkqa0POM/lw79Ull7BtMN/dZj
	 03Lt7x+fAjU/gjaXkpc6Hst/PYUdGo5pR2BC9uhXaup6KjnJSY7999J+i3fFbSb17CQIG
	 g3NBg8VvIFpEdPdJ0AmnieHxBhvAyFFQePFUi1a31yPvT7zMV7jU9jC6+05Z8xGk5qOMi
	 CJSatcVCo+Xk7E05u3xnkk1wR9Xi92JFoWLpryYZC+N2pIS9vUDsgzz0BheSGvreIcAgb
	 aoFtcNuPD6ImJzcvxAQmwF2gLRr4K4/F7vl1iOsu7n1ngO/Y1I/L0p+D4vBv+xHUkew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/O0UqoG1L12MCxVVxaMuav5eOheizO1ao/WWSQ9qpIw=;
	b=YM8ANLWaHHihS3ijMY+qkLeak1ekTDsNzXnzKeoKmHcEOGUpo1ygvXpFdsyhzkYfVQ/Y
	 8QIE0NQfz+G+E3LVlK18OScecABP64PjpfKR4VfT/G5uqXluF/Jzq6p4jeYwjzygaG7we
	 eAR3tDbGN3dhC9qjdSIfgtrVOk25iSCZixcifr0XbBNEgdIYum9q4xQPZ/ngIeXedh/nw
	 cfJQK27hiwzIIqs2hZWXBEGwnbJMTYF0DDe9XP8QdS18BMWGD/ZkubTaua7xtRUgWWjwa
	 5oQHysQc+z4rnJVIDxoP57ikf1zOkOHPa6R+GHVY0QtSyqQC/DGw2noEzIV6ftHDXGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z6VFOe8A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B18C606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B18C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z6VFOe8A
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c506a231b88so414761466b.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:18:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794799099; cv=none;
        d=google.com; s=arc-20260327;
        b=iwLOXCsQ/FhjUu6Fdtd74sZWKG+1QlqGkQP9/BNMUGq0izA2d3RgRRrh6NMUIafuSp
         +DXqb4fh1BYc4wW9CVL3j9idWVMcmLdc0A5pCny/cON7uM9jmuM84y1/cJogg8HP3W0Z
         XgHUT3LqkVU5QyRNKqfAojdzxVBWfyD6ANUoMGjG8IovbqxLynl+3jV3Nj4zY0Ms1dpe
         hTcujX2Wrf6ImVPTdFWqg8FDTplVo8BMjH6g8Zv686ZK+08piNSlwEnqluVXYJ48MXYF
         CQGh7DrD3/kq0HFPIJiJ3nueWX0Zr6LTwxSquTcy4V6P/mkAJaAwQmvAzCpY51mzlY08
         xW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/O0UqoG1L12MCxVVxaMuav5eOheizO1ao/WWSQ9qpIw=;
        fh=4ey74YGZNTiW287mqpAz1zt+qsJUPBd7MxY329Oc45g=;
        b=d5n5KYz3/NkCNfJFsmL18ErPgJn8+FLSSTQTyD4ydwpa0E86rD4HInEoEmr9avjQqd
         rvpXlEjhjp78wc8PUQw1Q4cz8uliWxS4zg9YYE+xuKnTcL5iS6gJO+DjiRWayFcTwWhD
         zyHE0xRkXDH+RuxyDBRL1vhwN0FAMYzbnHuP4ZXz5riWX2SY+aMpudswfmvIeTJZuhk/
         qJARI59Hr6HvJOxRxL9n4SR7EEw/F8l4oOt5hWHO+gHHo2sEeiFN4TFSkNcQUokxO5Pl
         3kFEaYeHZmfbFKLTOYEquA745n4/jqN9IgTEKu7asJG8YklSJvQ12BF0mD511jafbYiD
         b0kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794799099; x=1795403899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/O0UqoG1L12MCxVVxaMuav5eOheizO1ao/WWSQ9qpIw=;
        b=z6VFOe8A8RJigvmiMTR4JF+xmB+ptQpKz3UhMYrp3hx43+cePo1TPzu5hbjZ4ndArv
         VuG9z4TdPsLU0xS0JNeRgJ6D2dAkUGqIDJmKCDdtYVe2mZEI8NqEghAeTBrTlRJ57uAv
         cfnNU5fYQtiyUUAk9n5Xj9xGje0/F8IrjmlzpWI4nTXdRnYR4+5c6PX035n2Favv2QfP
         lQUzrT6K2If/nPL5AJ6RgfdUT4ZElZo+pqALCv+oghslsGPl9evgAY2INuC+WsIpgRo3
         oRQsoiZ29G9Bdd05XQyJkCGGXlR0Lvdn7i6SU7PbJYDaZsYdo5YpNWGoDQqauDb0N1md
         8aWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794799099; x=1795403899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/O0UqoG1L12MCxVVxaMuav5eOheizO1ao/WWSQ9qpIw=;
        b=jHEmQgyphAl7Ev48QzbwpfpwDrmyyKUZpAAtXvXI+j7IOE9HslzohpNdTZYRQFKEbN
         ZcwGHpWgC3TaXkkfQ4KhXwQbd1ifgugFwGAplD/tBUT0u9nKQNRlfcagt7fJ75W0oV23
         XPFF0id6Mi0HbNh9IYaNfHiDMMneDESYmWos5zGFarTp99RP2DlNfbkWwURScsjCx6Rn
         I/QgivISd4z29h+jVgk2hq9KtnF4alon6drL53hnrAPCqYLCvQ9jNcj/jVg+spIWp8pe
         jN1uQFmMewGjvvJge5ptvEAOFTfsnsf2949ddFqZWgmCHOFUgHcIacL/E5YbLJjXnRYq
         djGA==
X-Forwarded-Encrypted: i=1; AL+hErFZooG02aluZZCZTe3G6mZ8apGfGaNff0QHoQ4XwMfWm3sX2g3YthmzCHWVCrTG0PmqS3GDQwn118a/fJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z85Y3CSqsLq4mUEZ0OW9Hec1mN1pPUaPy7tzmhXEP3OJqAVNtYQ
	9mMmEJSx/Q82lVpdxo3U3sVvKgeue2uqIXODXUNocfoWB+bc47O+q3Y5i5kRAkFTUTg0qpjLi+W
	UhcR8Ry0gZVXe0ersDw84YA1/T9l/Pyg=
X-Gm-Gg: AYBFou10qMOPCYUWfpLKyhhOUJHx1oc95K5C6CgFM+wR+KJkxAuEigMBjfQg9gFabi1
	HtnqVHYeOYa5mgb2WKthvnoMc0dqxGJu37K7dKCjEzgP+Ai+uUNcZGW8WNzNIZr7L7Ed/4udLOE
	7XySHxAu8jp7oIy2FsVqx2UtokZtlY5h4HSzhveIk77FGdfFq6Drph94ffPyG6IyKNGti1EdENZ
	gWQk/N+cToAqhalf+qW8IIpsWK/IlEw0R4vDYbSNV520WP0Dp0PcYOtnpe1bjhhZw8qHy1+keqs
	xYVfkaYdOLjH61qqlTFvSpciZ3OU/WP9woFinQTFKjYcK42aji9aLp0gaNba0MQEvM2gxtSDQsd
	aUQhoo91UvHhFxXaF9XvX/YisDhjq71k5nQNrDNRzhzVNwsg4d1fj51RP58kjzG61K9Ei2A==
X-Received: by 2002:a17:907:3e0d:b0:c4d:8e7:29b9 with SMTP id
 a640c23a62f3a-c50961d1c5bmr782313266b.5.1794799099188; Sun, 15 Nov 2026
 19:18:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112081928.3014946-1-ridong.chen@linux.dev>
 <avV52J2rD19cjM2J@KASONG-MC4> <CAGsJ_4yibOkJmi9niJ8svu2NdEkZ5Qyf98VO6qMrJMa_9wGFgQ@mail.gmail.com>
 <c01ec177-da44-49bc-a542-35b64554526f@linux.dev> <CAGsJ_4xx8ivDeh1d5pvJOEgndRL8rf=CO2==T480pAm=j2X0ZQ@mail.gmail.com>
 <e4f50794-0c47-4fd3-8c3d-f3888f83dd2e@linux.dev>
In-Reply-To: <e4f50794-0c47-4fd3-8c3d-f3888f83dd2e@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 16 Nov 2026 11:17:43 +0800
X-Gm-Features: AclHuK-576g1ZsYN5Em4fQm0xWI0S0zRqi93o5imuX55ZMFCNfrCGTymUozk3ms
Message-ID: <CAMgjq7Co89oBiErnEE3q0=GncTDWPBvOYNysbZ4k5wccWQER8A@mail.gmail.com>
Subject: Re: [PATCH] mm/mglru: deactivate anon folios into the oldest generation
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Barry Song <baohua@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Yu Zhao <yuzhao@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 9:48=E2=80=AFAM Ridong Chen <ridong.chen@linux.dev>=
 wrote:
> On 11/16/2026 8:28 AM, Barry Song wrote:
> > For example, something along these lines:
> >
> > lru_gen_deactivate_folio()
> > {
> >          int type =3D folio_is_file_lru(folio);
> >          int zone =3D folio_zonenum(folio);
> >          int gen =3D lru_gen_from_seq(lrugen->min_seq[type]);
> >
> >          if (folio_lru_gen(folio) < 0)
> >                  return false;
> >
> >          folio_clear_active(folio);
> >          folio_clear_referenced(folio);
> >
> >          list_move(&folio->lru, &lrugen->folios[gen][type][zone]);
> > }
> >
>
> I think that works, and it is better than what this patch does. It
> puts both anon and file folios at the head of the oldest generation,
> which matches the classic LRU, and it avoids the two problems I
> mentioned (too aggressive for anon, and moving file folios from the
> head to the tail).
>
> A plain list_move() is not enough though. We also need to:
>
> - update the gen bits in folio->flags with a cmpxchg loop, as
>   folio_inc_gen() does, since folio_update_gen() can change them
>   locklessly from the page table walk;
> - fix up lrugen->nr_pages and the LRU sizes. lru_gen_update_size()
>   warns on an active -> inactive move ("demotion requires
>   isolation"), so this would be done as a deletion from old_gen
>   followed by an addition to new_gen.
>
> min_seq only advances under the LRU lock, so it is stable here.
> Something like:
>
> static bool lru_gen_deactivate_folio(struct lruvec *lruvec,
>                                         struct folio *folio)
> {
>           int type =3D folio_is_file_lru(folio);
>           int zone =3D folio_zonenum(folio);
>           struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
>           int new_gen =3D lru_gen_from_seq(lrugen->min_seq[type]);
>           unsigned long new_flags, old_flags =3D READ_ONCE(folio->flags.f=
);
>           int old_gen;
>
>           do {
>                 old_gen =3D ((old_flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF)=
 - 1;
>                 if (old_gen < 0)
>                         return false;
>                 new_flags =3D old_flags & ~LRU_GEN_MASK;
>                 new_flags |=3D (new_gen + 1UL) << LRU_GEN_PGOFF;
>           } while (!try_cmpxchg(&folio->flags.f, &old_flags, new_flags));
>
>           if (old_gen !=3D new_gen) {
>                 lru_gen_update_size(lruvec, folio, old_gen, -1);
>                 lru_gen_update_size(lruvec, folio, -1, new_gen);
>           }
>           list_move(&folio->lru, &lrugen->folios[new_gen][type][zone]);
>
>           return true;
> }
>
>
> > Right now, lru_deactivate() seems unnecessarily complicated,
> > incurring additional CPU overhead and LRU lock contention:
> >
> > 1. Remove the folio from the LRU list.
> > 2. Add the folio to the LRU cache.
> > 3. Drain the LRU cache.
> > 4. Add the folio back to the LRU list.
> >
> > Why do we need all these intermediate steps instead of moving
> > the folio directly in a single operation, given that we're
> > already manipulating the LRU list?
> >
> > Am I missing something?
> >
> I don't think the batch itself is the problem. The folio stays on the
> LRU while it sits in the per-cpu batch; only when the batch is
> drained do we take the LRU lock once for up to a batch of folios and
> do del + add under it. So the batch reduces lock contention rather
> than adding to it. What the in-place move saves is the del/add pair
> inside the lock.
>
> So I plan to keep the batching and, in lru_deactivate(), call
> lru_gen_deactivate_folio() instead of lruvec_del_folio() +
> lruvec_add_folio() when MGLRU is enabled. I'll test it and send v2
> if that sounds good to you.

Right, keeping the batch sounds like a good idea.

And I think we can make this cleaner if we build it on top of:
https://lore.kernel.org/linux-mm/CAMgjq7A1dWJ6DoF6+CxfjysxjzAChWrdk=3Dz_Jvt=
LMyFWdoYTyw@mail.gmail.com/

By having a "lru_gen_add_folio(lruvec, folio, min_seq, max_seq, tail)"

lru_gen_add_folio can cap the target window by the given [min_seq,
max_seq], -1 means no limitation. Avoid a lot of redundant code, and
we still have just one unifed place to add a folio into the gens
(except lazy promotion), I think.
