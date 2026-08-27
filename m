Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146AD499F22
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851116; cv=pass; b=fU/9o7IhWbAeHUXoneOX+mV7VTbwEzaZBWIm5qcqbs7QW4nohfIsv1hYe3tupMmMyD5OefCl6WWIN9W+yt5hStnaGaU+lchRrU1NzhPk5beFv1gnoFFDuFr78B4uRiKn4yfNOouAUGAd8BwaRo/tHBEuEAlkcj/6T+UtKC/bCmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851116; c=relaxed/simple;
	bh=cNKN7P+0Hjj504FMpK5rDVWOiT7kp0KvvD/7ppm3CW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lHGEzlzAjH9mPxSIutzDVFU1iHGnp1nssFqyYR9IF183N5QuANPLfVxPy81wXMtkNBn9QYbH2a821HBtaQvBTRzvd0bSYwFLt6sJ9bgqmhmwt5VJPsuOPmFhGWWYVdg8kBwvMvHNkjPoNu8C0tMrFHGKiOAe2CAcS0HFkDy4iM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RaJPorKh; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaJPorKh"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a600a1caf8so41452a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787851113; cv=none;
        d=google.com; s=arc-20260327;
        b=HoLBkFBScvuWKGjKq4Sp/jkOd6LcxgSqNq7VSdcKm+Y1+5s4lrsW3jy0C8ty091tyx
         TFdoTFt1sfjFfPkByow39Q9IlOhzWtbsPdOGzeKJ6b7fhpllN+RSrOcyZOGbAnko67wk
         A65t98PJvP91YPEDvBc4oxnl7lx9fXJfbL6c/DBnA68GUMB4h9ftjUT6CaOIDyx5smI1
         d+K+67J3ujJnWGGmmwg1f05wveNRjr/L2IoJ6VS7+KVp/YDIKxqFSKddGwJ4Tb0UtJ1T
         Ed6egvCcNuf9dbtflsXzHpUwubYwaVEto4jiW9tbMZeQsaC6F9gjtQDUM5lZsqWXwJZm
         1fiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XtbE6IYV/bM0IXeRDDxsSyGBBMTGpNCnOy9DkA38jik=;
        fh=QgKOngfeQBYoKsIv+kkrh2LIq/TjgGVCjpK3BD7ltUc=;
        b=i+w+ddWow3aispcX8Z/pO5rEhwAP5mfou/ORSv1bGzDUt+9iQPPsXt5OPDh38s7NCO
         oJxcMm98NVAf2P5eSI1kHFxIlW+oAdpcjgJFEqor4gM05lurJacmYozQeGQ1vMO+0cbW
         Nf6tizJuQEZJl+YYWAV9REj136u3x6ES3QDhBG+uGHAHMxghejd4ZM/xjJuiUCDA+CDb
         KxAa79aXFKCec6loOYBpicMSmYhbC1Tc9dC/npsCZIxy7z8ozpt27n4zkqrq38h02jWW
         5h93FYSc9yyflCYziM0l1/R52DuSvASuz/OkhD4Z5teNBjlkneYvNYvYSQtPMCvGbzCz
         mCQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851113; x=1788455913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtbE6IYV/bM0IXeRDDxsSyGBBMTGpNCnOy9DkA38jik=;
        b=RaJPorKh9D7wNCgoGTp+aiBsuLa5M3CDetHa6AYGysQMiZC1d5vDK+OOyALmsrysIt
         xgqj9iX4uoxze9ZOENbgTChUEh8UNN/581IYTZKPa/+6IBgpDO6DuJqaTSeginLzZQBO
         hJbqmtphTMNMsMEd5rOTaGtbjBvua5p3v2XsFjdLkoKnUIeyt5B0e/7W4/bISr6ASg6v
         mqlndYwUVXiA/+CTX1PQxptHA0gK1i1QagQi0tq7Wx8kctn423ERmtWc3fS7PKylHJBt
         n9sIQuSgFGq0gbto8jGf9JpZVsEIK4vT2Wqbd8DL4gwgpnUf9qXUVQe+iTsWNr0ojuYb
         cG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851113; x=1788455913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtbE6IYV/bM0IXeRDDxsSyGBBMTGpNCnOy9DkA38jik=;
        b=outLK8ujW04htowBECiVJUfCrXvcWTjV8ExVzopUI8S9eOkH4GZUoKi0FQzAecur5A
         I2WN8lMYNbO64xvBposqIve6Wpco/R9Ke8AGzJx2Hwmssg+YT5wIJtMkRoR9+Bqt8PhR
         O70YRf9uMuF3asUyIlhRxkrnohwnl576/RfZlr1dZ4QtURrhxuZivBf5bXULPrkcR0yt
         AJzu80oxIbsPviszaUpmYgJtAC9sUtiOS0yS8cBjLRVix03e/T4F1wo4Sso8Ru+mJxrx
         APmpGpVvjHceMcKnxCjjHxNjvzhr9jIynR4Duz3f7jeZZExHggQPoxWICZtDCVptzfsJ
         palA==
X-Forwarded-Encrypted: i=1; AHgh+Rqcj8DzHgpPhJ+r9nX+hdFyYzcvNe4Z5157qxhDhzn6a7HKQsWCYx22oMKML5zmnkw931v0OemiEVqo6MM=@vger.kernel.org
X-Gm-Message-State: AFuF++miKGX8vHAlGWvsqeLpRPWaUuM2ZwHE2xWAzbrVh8cE6AxikwYc
	4aaGlYlT3wgaczsA9T5j0FBQ1dvbbYwW4cY/YrqMWGLdfTxlpW1Jm5JXRZdcmoDEWC51L+5O3eu
	q7VTYw3H6CcKz+5HG0JJEJ9apB8vkYj8=
X-Gm-Gg: AR+sD13q9K4EriPDluVJsYMcTPh4XhIFyedjYgP4qhMAbUfHpQBUQMERxjCAdUp3fXQ
	+4RvPRfZxNIRbY5nRluvEa805LJSvhmN5z06GB6F9DfGNMRzfhgxqjYQEptoiMY91VQDphpCZZq
	Az/UfhnQ7KcA5E1vYQzqiIYAbszcTsGBOtyRmZMPXEHFdbpIAyP+UnHNi3UheB6l5pIzNucpZfu
	CRXsYRag5GIJYhIgp0EgUBAB16MJkocMBAcMFcu6suZRe1bqqeGj9DIEBLvExnqBKsfWC5x5bUv
	+AjiEko72DR5w9v0UWqkYWxK2MBbOc9FlXLeYIe4ngSt4pHk6zb7NGQra9+C97NTL+abGPg33ul
	E
X-Received: by 2002:a05:6402:44d8:b0:698:9e5e:5df8 with SMTP id
 4fb4d7f45d1cf-6a60d3450b4mr16898a12.7.1787851113010; Thu, 27 Aug 2026
 10:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-4-9b43f5163238@tencent.com> <e156c931-69b4-48d6-84bf-c06df134c9da@kernel.org>
In-Reply-To: <e156c931-69b4-48d6-84bf-c06df134c9da@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 28 Aug 2026 01:17:56 +0800
X-Gm-Features: AcwNN1VebzlFJypx5e4RotNewkKx5zemE-HrEPZEpkP6B4aDviKyhLvjLFBwBqQ
Message-ID: <CAMgjq7BzAkuibv+SyZQ+WzzbEL29dV-vPYyX2p43L0JDn3=wNg@mail.gmail.com>
Subject: Re: [PATCH v3 04/18] mm/huge_memory: split the routine for splitting
 anon and file folio
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Shivam Kalra <shivamkalra98@zohomail.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 12:19=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> Switch to double tab indentation instead while at it. Same for the other =
function.

Sure, will change it.

> >  {
> >       struct folio *end_folio =3D folio_next(folio);
> >       struct swap_cluster_info *ci =3D NULL;
> > @@ -3948,7 +3946,6 @@ static int __folio_freeze_and_split_unmapped(stru=
ct folio *folio, unsigned int n
> >       bool dequeue_deferred;
> >       int ret =3D 0;
> >
> > -     VM_WARN_ON_ONCE(!mapping && end);
> >       /*
> >        * If this folio can be on the deferred split queue, lock out
> >        * the shrinker before freezing the ref. If the shrinker sees
> > @@ -3956,7 +3953,7 @@ static int __folio_freeze_and_split_unmapped(stru=
ct folio *folio, unsigned int n
> >        * lock and must clean up the LRU state - the same dequeue we
> >        * will do below as part of the split.
> >        */
> > -     dequeue_deferred =3D folio_test_anon(folio) && old_order > 1;
> > +     dequeue_deferred =3D old_order > 1;
> >       if (dequeue_deferred) {
> >               struct mem_cgroup *memcg;
> >
> > @@ -3986,24 +3983,72 @@ static int __folio_freeze_and_split_unmapped(st=
ruct folio *folio, unsigned int n
> >               rcu_read_unlock();
> >       }
> >
> > -     if (mapping) {
> > +     if (folio_test_swapcache(folio))
> > +             ci =3D swap_cluster_get_and_lock(folio);
> > +
> > +     if (do_lru)
> > +             lruvec =3D folio_lruvec_lock(folio);
> > +
> > +     ret =3D __split_unmapped_folio(folio, new_order, split_at, NULL,
> > +                                  NULL, split_type);
> > +
> > +     /*
> > +      * Unfreeze the post-split folios and put them back to the right
>
> Why call it "post-split" here when it's "after-split" in the other commen=
t?

Will just call it after-split then.

> > +      * place. Keep the head @folio frozen until the end: sub entries
> > +      * in swap cache must be updated first, so a concurrent
> > +      * swap_cache_get_folio() cannot return the head folio for a sub
> > +      * entry (folio_try_get() will fail on the head @folio until unfr=
eeze).
> > +      */
> > +     for (new_folio =3D folio_next(folio); new_folio !=3D end_folio;
> > +          new_folio =3D next) {
> > +             next =3D folio_next(new_folio);
> > +             zone_device_private_split_cb(folio, new_folio);
> > +             folio_ref_unfreeze(new_folio,
> > +                                folio_cache_ref_count(new_folio) + 1);
> > +             if (do_lru)
> > +                     lru_add_split_folio(folio, new_folio, lruvec, lis=
t);
> > +             if (ci)
> > +                     __swap_cache_replace_folio(ci, folio, new_folio);
> > +     }
>
> This smells like duplicate code now. That should better be factored out?
>

There were some discussion on this in previous series, I tried to
implement a macro or helper, but it ended up being uglier. Right now
the duplication is just about 3 lines of for loop due to the split,
and the extra loop duplication existed before, so I think it's fine at
this point, maybe a helper later if this grows.

>
> > -     zone_device_private_split_cb(folio, NULL);
> >       /*
> >        * Unfreeze @folio only after all page cache entries, which
> >        * used to point to it, have been updated with new folios.
> > @@ -4075,8 +4105,6 @@ static int __folio_freeze_and_split_unmapped(stru=
ct folio *folio, unsigned int n
> >
> >       if (do_lru)
> >               lruvec_unlock(lruvec);
> > -     if (ci)
> > -             swap_cluster_unlock(ci);
> >
> >       return ret;
> >  }
> > @@ -4230,10 +4258,14 @@ static int __folio_split(struct folio *folio, u=
nsigned int new_order,
> >                       ret =3D -EAGAIN;
> >                       goto fail;
> >               }
> > +             ret =3D __folio_freeze_split_unmapped_file(folio, new_ord=
er, split_at, &xas, mapping,
> > +                                                      true, list, spli=
t_type, end,
> > +                                                      &nr_shmem_droppe=
d);
> > +     } else {
> > +             ret =3D __folio_freeze_split_unmapped_anon(folio, new_ord=
er, split_at, true,
> > +                                                      list, split_type=
);
> >       }
>
>
> I was briefly wondering whether shmem folios in the swapcache would now g=
o
> through __folio_freeze_split_unmapped_anon(). But folio_check_splittable(=
)
> rejects them.
>
> I think we should consider changing all the "if (mapping)" checks there t=
o
> "is_anon" instead.
>
> is_anon implies no mapping and !is_anon implies that we need a mapping.

Good idea.

> This patch LGTM, but I think we should clean up __folio_split() further. =
Maybe
> taht happens in the next patches in this series :)
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks!
