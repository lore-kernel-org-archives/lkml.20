Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793286667;
	b=3WeqSy2iAXr5tQXt+3B2HlzZbZU/7ylY08/MvkJrUeqDmpFUDDf/uzXrwVyKwCfLZUeE
	 MwPDHfPkTYjNineMW94mlcrPrnHdBJyHmxb9gBhRoyYzCrQD4G60NohCkjI6Kn57iVH/E
	 XVLc3R9GKFCkLnD4Wo0S1ipnTMGn6DQRj4M7d08L5DaKFQ6zpkryMTk4P2jRFMMNWSNIK
	 JPBatGzige8i9GsHjy+JgYuxuTXRmorjFsKJW7lGBufT+JPP5Pev2fhIn2LJrHOJWGfeM
	 QQtr4/t7qatuHwYU9F2YQvXBZ7IS/7AQWDi69rTZQbV9r9kgrvH2liACH6OPW0GsHRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286667;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZqTgnnNUxdGiYEW6DlaEOJ5z5Gde7KefjLv+VuU08fk=;
	b=xP9SdZGYTyFGhgGRketRzG3Rd+TyIOjHWJ3PLLlsJdcz9V39egOwehjm8hXqBakex4tH
	 +7EqIzIxtoDUThBn24WwgBynw0S22B0r5hm8R/a63gja7CVqlIuQhxX0eJ2SxWFt/SB0s
	 sPQ2eK88lCyMQ00D62jTAzM4mQg+M+7KbSWd60tnklcvQzr5U5gfGioaCs1rpqrzYyMv1
	 ZTgsy6Lyr/Noz/A++vPBUyIQicZErlsSrMgBxUzydJPEzY322GbYW0axKgjdjUicV0L9B
	 YrAdwFwHS2rvo8wgkWIDiBsdj8sGzHhoq4jpudYc0jYinJadZHXCNLOjVXkVD4pABZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X5+uycy4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB66606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X5+uycy4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED511F031E4
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793286667;
	bh=ZqTgnnNUxdGiYEW6DlaEOJ5z5Gde7KefjLv+VuU08fk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=X5+uycy40K8tl/gLvfiZzMF1U+BC+VSnRxUxnhz6FhJqS/ennwlndEwlRsdbqUQER
	 cBSNUAtaVWdNLYPKla2hL1ddgwSq7pxoaNCsdHwfKLtAOgnsfjVfDWvwe1zn8PeUjy
	 HqxzURiLHvu1Rm/OvszEI1w/ykjLQgtiAkxIyp+1WgFoFnJlSrvkQxWKCPULGrkFoX
	 bC9FAR3UjOx3DoHXjjkDjuffC1bvftXCs0kL2kP8NOeqQ5dn7ubTrn+BwEGBAM+1hI
	 yPB1whMxyvE4eZjWtwGgM7dLA5aDXiYUrpiNCN1/s/om20pQejrD2tGGCXwnxm4Rma
	 Xyzhnlu+sUY0w==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c46bd7a7345so166827066b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:11:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx8eDbIyFisDzhiSj8qtSgkyboVEAi+i08toGEFRqCHKBlwSnkIrFE8PvnJWX8fp86Ut1JW9L3vZ0VFJJE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9FJNLyhju3lbR4w483B7NZX5Gx7yiHh2orjlgnDhhJkl+FBe0
	cSqEA9f2Rnw3Gi76bF6dsMSrs1kzTtE596Pmqk2H01i9rRxyh6nk3PliMbLBbLPU4OE/sp5BgCX
	0DVu6RtofhO5v6ZjpmHnLotVzpVUd3k8=
X-Received: by 2002:a17:907:6d0a:b0:c42:6632:a369 with SMTP id
 a640c23a62f3a-c49d1298d10mr274706866b.21.1793286666112; Thu, 29 Oct 2026
 08:11:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028113619.38752-1-kaitao.cheng@linux.dev>
 <CAO9r8zP15iW3ECW2Bs0rfyZrifeisDunLa6qJC43M1RcE16wWQ@mail.gmail.com>
 <auJkvb-Lq0M5Enkz@cmpxchg.org> <2bd4f0df-80c7-4d32-ab50-1225681ff6be@linux.dev>
In-Reply-To: <2bd4f0df-80c7-4d32-ab50-1225681ff6be@linux.dev>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 29 Oct 2026 08:10:54 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPuDtn1S0g8rDnXNfSdZ6uuH1geXALDN5-X_SZpM_W+wg@mail.gmail.com>
X-Gm-Features: AclHuK9UiJ3AeOpD0_o7obusrkhCcVmC8X2efUUrguVLj8iQz-lYuV7lcHEm0Q0
Message-ID: <CAO9r8zPuDtn1S0g8rDnXNfSdZ6uuH1geXALDN5-X_SZpM_W+wg@mail.gmail.com>
Subject: Re: [PATCH] mm/zswap: fix double decrement of the LRU node count on writeback
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Dave Chinner <david@fromorbit.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 9:23=E2=80=AFPM Kaitao Cheng <kaitao.cheng@linux.de=
v> wrote:
>
>
>
> =E5=9C=A8 2026/10/29 05:10, Johannes Weiner =E5=86=99=E9=81=93:
> > On Wed, Oct 28, 2026 at 12:22:43PM -0700, Yosry Ahmed wrote:
> >> On Wed, Oct 28, 2026 at 4:36=E2=80=AFAM Kaitao Cheng <kaitao.cheng@lin=
ux.dev> wrote:
> >>>
> >>> From: Kaitao Cheng <chengkaitao@kylinos.cn>
> >>>
> >>> Successful writeback calls zswap_entry_free(), which removes the entr=
y
> >>> from the LRU and decrements both the sublist and node item counts.
> >>> shrink_memcg_cb() then returns LRU_REMOVED_RETRY, causing the LRU wal=
ker
> >>> to decrement the node count again.
> >>
> >> I wonder if we have a valid use case for adding LRU_REMOVED_COUNTED or
> >> LRU_DELETED instead to simply avoid the decrement.
> >
> > It bugs me that it's the walker, not the callback, that adjusts the
> > count. That composes poorly with the normal list manipulation API.
> >
> > How about pushing the accounting into the isolation callback, which
> > can then simply use __list_lru_del()?
> >
> > The tradeoff is that more things need to be passed into the isolation
> > callback, but that seems reasonable. It does make the change noisy,
> > however, and we might want something like Kaitao's change as a
> > backportable fix first regardless.
>
> I tried three approaches.
>
> The first was "pushing the accounting into the isolation callback", as
> Johannes Weiner suggested. However, as Johannes's example below also show=
s,
> this would require extensive changes across multiple subsystems. I doubte=
d
> that such a broad change would be accepted, so I dropped this approach.
>
> The second was to add a new flag to enum lru_status, as Yosry Ahmed sugge=
sted,
> to handle cases like zswap where the callback has already decremented the
> count. However, the incorrect lru->node[nid].nr_items value in zswap is o=
nly
> an accounting issue: I could not find any code that reads this counter fo=
r
> zswap. Changing a generic interface to fix an accounting error with no
> apparent functional impact did not seem worthwhile.
>
> The third approach is the one implemented in this patch. It keeps the cha=
nges
> within zswap and fixes the accounting issue, so I think it is appropriate=
.

I honestly think it's a problem with the list_lru API, as Johannes
said, walkers compose poorly with the API. So I prefer we either take
Johannes's suggestion or add LRU_DELETED, unless there's strong
objection to both ideas.

FWIW, we don't need a minimal fix for backports, I don't think this
needs to be backported at all. As Kaitao said, I don't think the wrong
list_lru count is being used anywhere for zswap.
