Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793101202;
	b=sgzKAVS6FkFDtUAz3aP4RsHf91DSCxc2wdijjD8dwXBQDkD+zvVk5JnqXFVTwJoKBQXq
	 3sljSVuNGz6nIakEXILuKuUcjRpzZfJCFuRvOaQuEL1sjj/0oYwyq/cV7G+BwSoL+GAcf
	 M5FNhuzQAz/Eo9mEa55WTKtK69JMBjhuXUQwIG1j+5i2zf1sY+xqA1l0ROKbFpi8ksUf3
	 59pIVK79OXeLpJdaFLEaQvJV3HfFKT6e0c9DX40QdqhPeXsZVXXQpOhNQm1PiaQkMxL1b
	 dCgdg0mIINZG5f76sUJDn2/aX2EEJoaxVvua6btCwsBlrcLTA/D9M0SVVPm0iZ3Dj3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8xwtJD2tDU+fIoTVWwQ7vdURPVaDHGIK/RJJWfEVHd4=;
	b=cZ7EF2OTJ5pMJcQdONJACMDWUhUNKgE9vIwkwrmlVm14SWMVnddgKBMGqHkIm3bPXWKB
	 AJwLNFf8nbNygWg0R88cu0kfaRWqZCrI/s7jCNG/TtnRNA5svNd42bUxcmOlRBf9J1ghm
	 9jtW+9c40Wlnh57cl4LO0N20H8BZ9grRb+6v7TEmu2aTMdvoCnElvAueBAaFQKbNz7iRL
	 HRvxV3130oQNtiMLR9RhM643dCVcsWkqmEPeZNa7F2Hqc+KkojgRdjfaqE94LSHhBopwW
	 nG1GYrDFSFMzbXfeA9nZ0008mbK/2NoQ2sRavo5ZTX0s2/ZcotqJSnccLiJVq7rvLjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ClArcnUw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EA4606A846
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03EA4606A846
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ClArcnUw
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a01cac8733so3009314b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793101201; cv=none;
        d=google.com; s=arc-20260327;
        b=BSDvf97O1dLKlwiUNnkRCXqQ/y84WSQ9zL6P7OzWPrRwtG8B0WvuhebSyvRaVltbBe
         ippB+BC3yq7bt8t2TdhzSPE8RotM0bokI52zotAAh1xrb45HA0xMO2wjdxZZXmufQ5em
         ckYwx/QThsu2ZLdLX+VyWEBOXh0bbsu2ohHvtPo9rXv7/jNBixpdOBCRaMNtJlg+OC+Z
         XndeCIUUaN6XP65bklCnN6K+BrNPqYb87vGBGFSblO9syAWGgPf97lSP3h/eX0hSagTR
         eP7t9LzyjkNJ/eoJY0qtEqVds5ZJiB8vVnOa5fk93/EI6JHD+gPmhZxLcCOJfyGfuoqr
         ASYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8xwtJD2tDU+fIoTVWwQ7vdURPVaDHGIK/RJJWfEVHd4=;
        fh=RTOp0jxxpOCCYwqLgsZHNeXIytktX9dRdJRTnfPT9Mw=;
        b=D6Avng+pDzcyiyCy7SgLYTxneNgYKu4qbuYBoGyRZyzPZHBPDilfzYQvT1PPR9U4R5
         bvOnrkd348NayQ98Q0sjl2BNN/Krdbx8NnPIrKy+03uy28F9MqS/wCODtsHHL6oB5We5
         Yilhm3VV2tlmdhf0clCXsOu6rAJqI+LAs0RID0/qO3LoJPlKk63qa9XOVa5YAhQojlcl
         BIKtDPgL6BPqmIRO+acya4dOD14qbpqGEymY0zNuY2LlVLEFmxPO2etvvdqaxFKFGfnC
         Zay0j0Tgt6AxBO+PvIGYSqvrF60dKlfdg7qmwAssdU51FbGznN9Sn8OiZo7wyLuoivQq
         lsNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101201; x=1793706001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8xwtJD2tDU+fIoTVWwQ7vdURPVaDHGIK/RJJWfEVHd4=;
        b=ClArcnUwVnEcQib5RUm+MZRj7dn3IO/z12g8FhLlci2VvfaYvuPcha2W9S00ON6tBV
         0tjQQ9HFMjfSe9F8eB3caJN4j3Fyf+9oGcVtjUjQO2al+KX3o5Z2J5mTBbQ2V2u2Z4W1
         4hws4IE2I/jM3+FOoY/fvG4ZgoHKCR4qMtngWjMhiP+s8x/z10c2Gldu3P4jqmSl4XDe
         YkDAiP/Cy/rh2y8Fj0yaf1IsTtoRFByaQF5tIeSRxkX8kFv0nRUaUEznsNh3p8ayjnoJ
         et7+XkoqJybqu9GcH5JuRuYoiFVCj/4PR0AdqTGmoOSwx2l1StTtrS2T+juZF3JvAOjn
         sp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101201; x=1793706001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8xwtJD2tDU+fIoTVWwQ7vdURPVaDHGIK/RJJWfEVHd4=;
        b=ZKxfuPw7iRsoHDbAS2kQStih7eaYv7JTzlHouLSZnUKhUNKX2hbTIMr4NJxvKOufRJ
         wo53JzpIeEDhnAeIdnqMYHFcG9bdSyBKeeg7CDBfVV2rI133O37+yFxJEE4W2nDSne6L
         j+y5VR3aIiIjS6bHXwqnVZvSZC36wCsaz96q1OVc3XUHufy4/GWKPlAFnY1+vN2XqksI
         W3w36ECjdqnJLD1vLKDu6V/2tq42wiNTKcSAN/t+LlXy+ay0v0ahFcYB7MIA9kAxZzjW
         v7kpQmMafypIIEo4gVcbmJmNEtDF20ES48R/qwgKmc4spIu/B/GXyAj8Syav6sO98JiO
         w66Q==
X-Forwarded-Encrypted: i=1; AKwUvBzp/4SgnRwrq7tnWxmHLQ1JtbFMNeQ25H95U2/PcP/2yFsLMIhl7RsupQ77ksA8yEQptwUEXs2C7MHmEqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoMffYZVF0HKcXmoQDcx+edmJtNtRl2T/lo+xwsIk70e80gycj
	cYFCXH164y9VS6pQsBKQHwl6//YVH12ocPh86inOHsRjSKl+Aipum27RGmNFGj/R3aR/vuHqlak
	yYRr02E+KVhYZBNebl9fJSVRLMBX1v8f82NhmGq7IOQ==
X-Gm-Gg: AYBFou2FD3SaJdWoccWoAz4pbcRNcPXLDrVKOlLdUOXS+MrD7U4VE32DOnys6PS2c7y
	LTlByHeu6qnR5ls3ob72o1QA9vmku14MkmhtsP/Wil/G/Vo6NUhwiFaOnTBxn1NUommfQGyVLBJ
	m+G0kevsA2cCLV26GFVqQwnruGfF8K7/xcC8NAgbn9vDHbilyFWaTHANfQW4F/B56yZWSF6PlJc
	clWV4xWgajGPfeNZdKV2d4Z63bD38r94tRJrRlibFQkBgh0YIoodQJgJ3VddJTjqiKVfzwLPg7E
	NymtM/HgBdy9H0EcWAeZ7W3yCoX+jyJFy2yY6y2c4quT/m7VLvIfjowXF+ViWP6vhV+37CNiVYz
	QbPjHYM5dOyUkV/89mKOTlpRScpc2G49rz77ezltBE0pSCv83o58yvyAJt35/b88CexznyA==
X-Received: by 2002:a05:6a00:98d:b0:89f:5ac6:32f6 with SMTP id
 d2e1a72fcca58-8a366f67343mr6490150b3a.24.1793101201328; Tue, 27 Oct 2026
 04:40:01 -0700 (PDT)
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
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 27 Oct 2026 19:39:23 +0800
X-Gm-Features: AclHuK_TYPiGSVgmW4A3CkA1FUOBB7hbFiGmI0M9h0LRJd1ARuctkV948Qsk3Ls
Message-ID: <CAMgjq7AJSU9jUBTHGcm05mtGBH4EMQ_ua9YNwuLOGVzhkdLKkA@mail.gmail.com>
Subject: Re: [PATCH v2] mm/mglru: fix a no-op lru_gen_clear_refs() call in lru_lazyfree()
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Yu Zhao <yuzhao@google.com>, Barry Song <baohua@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 4:41=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote:
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
>         lruvec_del_folio(lruvec, folio);
>         folio_clear_active(folio);
> -       if (lru_gen_enabled())
> -               lru_gen_clear_refs(folio);
> -       else
> -               folio_clear_referenced(folio);
> +       folio_clear_referenced(folio);

Why can't we just call folio_set_lru_refs(.., 0), and should we clear
PG_workingset? Keeping it helps PSI on refualt / redirty tracking (not
sure if meaningful but CLRU does this), clearing it makes eviction
better, but the eviction issue is MGLRU-only, CLRU keeps it.

And folio_set_lru_refs(.., 0) should be a little bit faster and unify
CLRU / MGLRU. And we can detect lazy freed folios in sort_folios to
avoid PID form touching them?

Something like:
diff --git a/mm/folio.c b/mm/folio.c
index 35e242b48870..416cd4beb182 100644
--- a/mm/folio.c
+++ b/mm/folio.c
@@ -599,10 +599,7 @@ static void lru_lazyfree(struct lruvec *lruvec,
struct folio *folio)

        lruvec_del_folio(lruvec, folio);
        folio_clear_active(folio);
-       if (lru_gen_enabled())
-               lru_gen_clear_refs(folio);
-       else
-               folio_clear_referenced(folio);
+       folio_set_lru_refs(folio, 0);
        /*
         * Lazyfree folios are clean anonymous folios.  They have
         * the swapbacked flag cleared, to distinguish them from normal
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6a1af9b92349..e64b7f544d15 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4835,6 +4835,10 @@ static bool sort_folio(struct lruvec *lruvec,
struct folio *folio, struct scan_c
        if (!folio_evictable(folio))
                return false;

+       /* No need to protect lazyfreed folios */
+       if (folio_test_lazyfree(folio) && !folio_test_dirty(folio))
+               return false;
+
        /* promoted */
        if (gen !=3D lru_gen_from_seq(lrugen->min_seq[type])) {
                list_move(&folio->lru, &lrugen->folios[gen][type][zone]);

---

BTW I also tried to cover this in MGLRU-FG series (not including the
sort_folio part):
https://lore.kernel.org/linux-mm/20261016-mglru-fg-v4-13-2106750c0bfa@tence=
nt.com/

I tested keeping min(refs, LRU_REFS_WORKINGSET) / just set to 0 as in
v4, nothing different from the workload (testing using Android apps as
workload), so I think it's fine either way but the above patch I
posted might help to impove it by a little?

And if CLRU didn't actually expect PG_workingset to be kept but that's
just a leftover or trivial, maybe we can always do both
folio_clear_workingset and folio_set_lru_refs(0) here?
