Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008061;
	b=lay0TMOYHEqmc65/PZEbS2f83wvyrjT1Eu7TJlMSI77qmAOWGZuS4gYrLqVNHZP5q9eo
	 rUyEG7S3A+nyJ9NYnLwXgyk7VVZ3ObiGzytQ7UlCB49MnUzpUzooL9KxdOEQbGSudAPRb
	 3zOzwiQvTfYDi9HvYehkrLvUsCQ6NPgVGHkcNy170Ldeu7cAioEqZofvcaQ1/xFDGbbfJ
	 joS5l9E/4uDMkVOoVT7W6C5jQFBKx9zFYQlKpOkoOoRS6jTnUnFOC+8UWlftf07FD5ERX
	 Hk0OSgfKCVok/wkS8FmUptrhKd3L5MdiveFaf2l5P5WB7znUQnDj0SlNgBT0SvWgMkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008061;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UPYRliWsU0Z66rDxbPPakZCnWJzqb2ufb8ueBJaSZh4=;
	b=VZRXF+RX+h3kv2g1WAvyEPqN+gPjOhRV73SrLuEJjHbwzy07NynQIpavgZ9TZmTPrj2i
	 62lMlqmWHmoZY1ZCorCdk5dP7ue1oDOv/jkiZgsAo7XO3SuZEQvw/YTfzRL/glsus9pgX
	 BJDV1kfLY/utt0PO7pWDdMBcSgAUL/v9/V1WEfZvRB+tINduhlUTTlIMum+cexnuYXk6i
	 x3g7sSWZZ9NUXyJUtQ/AhZ51+dAYHa61g5cAyqB2B5+NhZWQNpmJFR0W7t5kF1SOeAU6e
	 CnTdy3LUbgSne1CmTNWZymvNem5ZgO7FWpxuVW/swIEYiXRxP5iVv7ygPTIIDf8oupw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O6hPdZyj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA8C60A263F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O6hPdZyj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7371A1F031EE
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793008060;
	bh=UPYRliWsU0Z66rDxbPPakZCnWJzqb2ufb8ueBJaSZh4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O6hPdZyjp/WUul6/WqzGfWPcKmuShX3G88MfwmxpOVv0QhAtu6/2LUs2QX/g18GK3
	 RKj8hOGyUvomBvD/gqqD6e74Wm8cEH5FJNPnFEsqa26veJjRM18lXvSUMG7pbkh0Hh
	 5ydMYWnKcPxFR5oRAqicS45TQY9YlZJPSm1bStz9GiJsme1FZtn8Y1qTDui+s7eivF
	 K0iK/J6FCtMCxkqV9OKS3Uwz7rttx0dNYHXTvOk2LxwWT1E7byux27941wxykn4GQj
	 LTAjEzzE7OoI/H+a3+c82oIIiimBMfM5Ek4QDkk4XFHwzgMZ4XSiOdv4k0dJ30AlWR
	 VXVVLXvNudvGA==
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91c63449320so4641926d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:47:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzyvW9a+peJ1B9IoiJ830AbPPDmHaq6HPa0yYeJqf0JHZWo+UzAKUuf3XaXVR9llqBCb/gKGhDXENoAE/c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPg664iSF0wzempgjOzdEsEuggxwP3K4MOEkRHkWSWVxXNrmUo
	n3TxjiVBQPYEoTwwj1H2eTKr7yqGpoU8X1hh+n05zclZ1MrYfbfsAlB8plEBZ9DSLt8Y2J3sOXp
	mM4Hs8x62Nwaw+zx8lB9yIUnAJ1q9yls=
X-Received: by 2002:a05:620a:17a9:b0:93e:50ab:10df with SMTP id
 af79cd13be357-940ef7ac82cmr824571985a.5.1793008059753; Mon, 26 Oct 2026
 02:47:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026084035.535989-1-hui.zhu@linux.dev>
In-Reply-To: <20261026084035.535989-1-hui.zhu@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Mon, 26 Oct 2026 17:47:28 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4z46o6fs16T0ctLcTXiinL1+0CXpvueDN1rVc2-rLT6NQ@mail.gmail.com>
X-Gm-Features: AclHuK_NRJA0B-x0bJfZaCvEv37_IFIwFzwcGPGyMJ6wMoTgtUrxCpJpqOIo_rI
Message-ID: <CAGsJ_4z46o6fs16T0ctLcTXiinL1+0CXpvueDN1rVc2-rLT6NQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/mglru: fix a no-op lru_gen_clear_refs() call in lru_lazyfree()
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Yu Zhao <yuzhao@google.com>, Kairui Song <kasong@tencent.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 4:40=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote:
>
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> lru_lazyfree() calls lru_gen_clear_refs() after lruvec_del_folio(), but
> lru_gen_del_folio() has already cleared LRU_GEN_MASK, so folio_lru_gen()
> returns -1 and lru_gen_clear_refs() exits at its "gen < 0" check without
> clearing the refs or PG_workingset.
>
> A MADV_FREE folio therefore keeps the state it had before madvise(2),
> even though madvise_free_pte_range() has already cleared the accessed and
> dirty bits of its PTEs.  lru_gen_folio_seq() places it one generation
> younger, and PG_workingset puts it in the last tier, so sort_folio()
> promotes and protects it instead of evicting it and charges it to
> lrugen->protected[], which read_ctrl_pos() uses to balance anon against
> file reclaim.  __folio_inc_gen() clears the refs but not PG_workingset,
> so this repeats every time the folio reaches the oldest generation.  If
> the folio is redirtied first, ttu_anon_lazyfree_folio() keeps it and
> lru_gen_eviction() packs the stale state into the shadow entry, so a
> later refault is promoted to the youngest generation.
>
> Call lru_gen_clear_refs() while the folio is still on the generation
> list, as deactivate_file_folio() and folio_deactivate() already do.  Its
> return value only says whether the folio is in the oldest generation,
> which lru_lazyfree() does not need because it re-adds the folio below.
> Keep folio_clear_referenced() unconditional: the classic LRU needs it,
> and it also covers the folios that lru_gen_clear_refs() skips.
>
> Fixes: cc8ec7be78ff ("mm/mglru: optimize deactivation")
> Suggested-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> ---
> Changelog:
> v2:
> Call lru_gen_clear_refs() before lruvec_del_folio() instead of
> open-coding the flag clears; drop the lru_gen_enabled() branch and
> the comment (Barry Song).
>
>  mm/folio.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/mm/folio.c b/mm/folio.c
> index 35e242b48870..ea3adb6a89d7 100644
> --- a/mm/folio.c
> +++ b/mm/folio.c
> @@ -597,12 +597,10 @@ static void lru_lazyfree(struct lruvec *lruvec, str=
uct folio *folio)
>             folio_test_swapcache(folio) || folio_test_unevictable(folio))
>                 return;
>
> +       lru_gen_clear_refs(folio);

The only thing I'm not sure about is whether we need
if (lru_gen_enabled()) here to keep the semantics consistent
with other places where we use it.

...
   2    676  mm/folio.c <<deactivate_file_folio>>
             if (lru_gen_enabled() && lru_gen_clear_refs(folio))
   3    695  mm/folio.c <<folio_deactivate>>
             if (lru_gen_enabled() ? lru_gen_clear_refs(folio) :
!folio_test_active(folio))

So maybe we still need

+ if (lru_gen_enabled())
        lru_gen_clear_refs(folio);

with that, feel free to add:

Reviewed-by: Barry Song <baohua@kernel.org>
