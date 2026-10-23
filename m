Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749992;
	b=xEXZ65Qwqyoq8ZVtPqVcJdHrg6F+R89QOL5MW3NYy/Ls7wUzhnh0MTYzE+sgqfK+4Q40
	 oSHbtsLAekxOGdnKlX8VOcxWM/+bzxfljl0Eq0ppEGw9+nRTP2qcAklnUv65LKrmD4bt9
	 +FjEw/DOb7yJj6VL+n4Kf41t6c+4ORdPu7g8Y1D/FM7llEgRCC4zhoPNcFMZyPen7iZaV
	 TYxpzYIIBGJ3M04uT2XX6wzOp6YEaLwmXIyj48u8lJuWH99ZnCtEi2s/2FEl4tA8Y8H28
	 1HM/f7+H8Tw3rraCSgIgiRuVr+NUF0Iw4/Faf5NjbrXYmu4fDm45hPNH6YxBRmz1urA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749992;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nTWmeH9i/zciPFKRMIAo/+xF0ZeK70HJ+nGUDNQqdWo=;
	b=J1NyqitBo6b7J/0z0JXmSo/Zwe9ZSzIu3cgN95AARG45esUX9fuWYsKl1mUqhOWKiEmI
	 u8eltZcS8x3NmigN1w1HIH8xHpk4iTE5LQ1Og1RBnn3SBnLexHZD17Y6vKf7ri42bC6Rw
	 Ir9tJQvrU59GNaj9oaj50FSgTLpNwenp2liiivoq7mdSWPz7Rs8U44Uk3+L73XkusTJB1
	 YqMgTBRW1lyIua3tQvNNZAPhj3UUczhUfvJ/uIetOidnsVB5HztiVIUcorhhWAaMytKEP
	 lIq/kUVM4nX4fg0rsFRHCfF/qKofYCVK6eilZynxl5R7aXRBlzFRgUNPBt8UGMziyVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kXKV10Fy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284C6606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kXKV10Fy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB571F031ED
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792749991;
	bh=nTWmeH9i/zciPFKRMIAo/+xF0ZeK70HJ+nGUDNQqdWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kXKV10FyDxIC8tBXivP5X7olR25twvFuz3ZrYMs+uyq6s8KX95pkNqWl7A0DDs7kQ
	 dRMYCnqlED09DR+/ajG/r6r43Rt3PGKo8HgX8i+C4Y6fm4zzy1nLxsQlFSh9ffizTH
	 Oeza9LBLOJ07JK+Zrw9nIupH6k/RkQIt1cj1/hxdNZK1UHmK+yGFYObEASoFi92Se3
	 +u7+FmPtUWHfsQMV/r86gZS2CyspoRV8030KUqyn68EumHESpWrg9wZ4Jhb9a/dcH8
	 pSpfCI5AA2EqUVDOGuZ0a5tStDAZElP5V+5EuGCMzbppnnvFg22KLrxwK4XGW3H3S4
	 pgCBzpTH07Svw==
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93e515769d3so66680085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:06:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByIKWUIrsCHcIWABcU4+JUpH74eCTjGIYNDy0V1YY7y9/7vgjneZe4XZKVM4SVNFQ98eb1vSpxhUvSP7bg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOEu3wucYinMgHKo+PHcTEE+iHq/DNgvhy6Ac7wn3BvaIBCQYS
	04JMls/Bf9RXRY9PiRVzHcFvojlhHH0eoRc93npeUxi5WelhsPsSQ/PD8ygvRlFHym4Z3Sn+Jei
	jf8iztT4S1tX4o4ZFE0TDaLE8lQKwAmY=
X-Received: by 2002:a05:620a:1a10:b0:93f:309a:ba5 with SMTP id
 af79cd13be357-93f6f8151demr326659285a.47.1792749991048; Fri, 23 Oct 2026
 03:06:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023080430.465305-1-hui.zhu@linux.dev>
In-Reply-To: <20261023080430.465305-1-hui.zhu@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Fri, 23 Oct 2026 18:06:19 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wJ7bBNF2DW_c7MboNFEa3GaOs=N_Sd_KkokCGaaCH3=Q@mail.gmail.com>
X-Gm-Features: AclHuK-Xdt5eGkfevbiMmRq5JHr_XV5TF8iVL1ErkFcg48nEdYLaCtJpU1OZ5wI
Message-ID: <CAGsJ_4wJ7bBNF2DW_c7MboNFEa3GaOs=N_Sd_KkokCGaaCH3=Q@mail.gmail.com>
Subject: Re: [PATCH] mm/mglru: fix a no-op lru_gen_clear_refs() call in lru_lazyfree()
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Yu Zhao <yuzhao@google.com>, Kairui Song <kasong@tencent.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 4:04=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote:
>
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> lru_lazyfree() calls lru_gen_clear_refs() after lruvec_del_folio(), but
> lru_gen_del_folio() has already cleared LRU_GEN_MASK, so folio_lru_gen()
> returns -1 and lru_gen_clear_refs() exits at its "gen < 0" check without
> clearing anything.
>
> A MADV_FREE folio therefore keeps the refs and PG_workingset it had
> before madvise(2).  lru_gen_folio_seq() places it one generation younger,
> and PG_workingset puts it in the last tier, so sort_folio() promotes and
> protects it instead of evicting it and charges it to lrugen->protected[],
> which read_ctrl_pos() uses to balance anon against file reclaim.
> __folio_inc_gen() clears the refs but not PG_workingset, so this repeats
> every time the folio reaches the oldest generation.  If the folio is
> redirtied first, ttu_anon_lazyfree_folio() keeps it and
> lru_gen_eviction() packs the stale state into the shadow entry, so a
> later refault is promoted to the youngest generation.
>
> Clear both flags here instead.  lru_gen_clear_refs() only reports whether
> the folio is already in the oldest generation, which lru_lazyfree() does
> not need, and moving the call up would still miss the folios that are on
> the classic LRU while lru_gen_enabled() is true.  Use
> folio_clear_referenced() rather than folio_set_lru_refs(), which is not
> defined without CONFIG_LRU_GEN; PG_referenced gates LRU_REFS_MASK, so
> clearing it zeroes the refs count as well.  PG_workingset is cleared only
> while MGLRU is running, which leaves the classic LRU unchanged.
>
> Fixes: cc8ec7be78ff ("mm/mglru: optimize deactivation")
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> ---
>  mm/folio.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/mm/folio.c b/mm/folio.c
> index 47a437e0f7fd..03be101334eb 100644
> --- a/mm/folio.c
> +++ b/mm/folio.c
> @@ -599,10 +599,16 @@ static void lru_lazyfree(struct lruvec *lruvec, str=
uct folio *folio)
>
>         lruvec_del_folio(lruvec, folio);
>         folio_clear_active(folio);
> -       if (lru_gen_enabled())
> -               lru_gen_clear_refs(folio);
> -       else
> -               folio_clear_referenced(folio);
> +       folio_clear_referenced(folio);
> +       if (lru_gen_enabled()) {
> +               /*
> +                * lru_gen_clear_refs() skips an off-list folio, which
> +                * lruvec_del_folio() has just made this one.  Left set,
> +                * PG_workingset keeps it in the last tier that sort_foli=
o()
> +                * protects from eviction.
> +                */
> +               folio_clear_workingset(folio);
> +       }

So we can't do the below? But why?

diff --git a/mm/folio.c b/mm/folio.c
index 45c814f3857b..6b779a1ad2f6 100644
--- a/mm/folio.c
+++ b/mm/folio.c
@@ -611,12 +611,10 @@ static void lru_lazyfree(struct lruvec *lruvec,
struct folio *folio)
            folio_test_swapcache(folio) || folio_test_unevictable(folio))
                return;

+       lru_gen_clear_refs(folio);
        lruvec_del_folio(lruvec, folio);
        folio_clear_active(folio);
-       if (lru_gen_enabled())
-               lru_gen_clear_refs(folio);
-       else
-               folio_clear_referenced(folio);
+       folio_clear_referenced(folio);

Best Regards
Barry
