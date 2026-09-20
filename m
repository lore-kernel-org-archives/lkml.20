Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0C73F8246
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896114; cv=none; b=aoq3ygf5ocvTYch8Yse+RmXXEoaj+K6qj3a/z71CTITJJ1vYeQqdBtgo/8YvP5Lek1mveMa20E1VNM0vHE5Zf5Bz8uTLMRPFBY0vWnORf+bEqREQWBbuiVNJLnqLZEWbRJW/YWb155LjPuv33pWX8lL8Lj308CEA/rpjZPllDKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896114; c=relaxed/simple;
	bh=+SaZJHQL2G9LoUBeVibG0ZkfGUAgIYNrG7/zs7Nh0/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aiv/wfGZo4rxNiRP/8sFbCOEo0YgaxSVORq6T39Da4Kubh6cnq2rDrfHyS423ljcfabf/EcS2RFVbK5vyvq6RWm0J7tOEIGaU/CNu7E0+G8tsqjopd94mYpOU3HtTjG1E3GsyVVCphxGkWddtOQ1ZY5EFRpca8y0G6hgyzpnK4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6ypJEi3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6ypJEi3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607E21F000FF
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789896112;
	bh=+D7/BT1IHpcDxVkUKhWYFCe5JmCtgbgwd+dQYTaICxM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O6ypJEi3XmekbbWJhkr8fU5bGBhJpZweRrAPld86N9f+lKoQacQFpI6vCntJYqtUH
	 5WYVN219o7kSTBzJMetqeguRA5BWrydKqxe+JH3IhoLh4nsv97nwyFAUpCNzOKlaCF
	 O6I1YRYD+ydrxK6LoJq3xG9DTg/U4wDF6l0VWKcIwkgrSqofIfx8iuHqjWOAlx65YX
	 7F+/Ic/jPzyFsJ9hATZMIqljoOONJvpOf3QD66oamNWbY0cQ3TxHp6XBSjuoCjATnX
	 TbuyjTtyDl4i8eEjSSF9UfPbLe8NdTpFwmCVNS67/EoDnvjKwoSsZMV4aRrKPYyVKl
	 o7zrC/krE3tkg==
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910c9ff1fso242338985a.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:21:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxpvKxWFsdNKNPVPaj416byLJok9Aj6oDiFHq4BqYA1oHe3NhwYUupLG5V7iXWPO3kNmiv0r26ieviWAmw=@vger.kernel.org
X-Gm-Message-State: AFuF++nuZqxe6i3FujsWL9fROcwl80KZ1TI1Nc8zfnI+9N3jlMwKuZWY
	SBYntFZxI1h+WvAfgIwSM3/2/qnF6q0xxIBa/W9EtsPYNXACLdmNMW7voxBCbYn87auk7vh22fW
	hhbJVuCC1vtuhkio4HIS3ubo7zNQTsEY=
X-Received: by 2002:a05:620a:8809:b0:93b:d7a3:45de with SMTP id
 af79cd13be357-93bf57e5603mr459482685a.71.1789896111765; Sun, 20 Sep 2026
 02:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920043015.3126317-1-ridong.chen@linux.dev>
In-Reply-To: <20260920043015.3126317-1-ridong.chen@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Sun, 20 Sep 2026 17:21:40 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xmoGWULDVNGj0LzRFFfxM4VVGg4Bx5Pz5cUfXx9uKrtw@mail.gmail.com>
X-Gm-Features: AcwNN1UQcUC92XzoRFaVg0eXTQk2xu-g1I5nlJQhu3nsQjCKfTWTt3DeOV-UAFk
Message-ID: <CAGsJ_4xmoGWULDVNGj0LzRFFfxM4VVGg4Bx5Pz5cUfXx9uKrtw@mail.gmail.com>
Subject: Re: [PATCH mm-new] mm: vmscan: put rotation-missed folios at the LRU tail
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"open list:MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)" <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 12:30=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev=
> wrote:
>
> From: Ridong Chen <chenridong@xiaomi.com>
>
> The page reclaim isolates a batch of folios from the tail of an LRU list
> and works on them one by one.  For a suitable swap-backed folio on an
> async swap device, it queues the folio for writeback and, after finishing
> the batch, puts the folio back to the head of the original LRU list.
>
> Meanwhile the page writeback flushes the queued folios in its own,
> independent batches.  For each folio it writes back it calls
> folio_rotate_reclaimable(), which tries to rotate the folio to the LRU
> tail.  But folio_rotate_reclaimable() only takes effect once the folio ha=
s
> been put back by reclaim.  If the async swap device is fast enough, the
> writeback can complete a folio while reclaim is still working on the rest
> of the batch that contains it.  In that case the folio stays near the hea=
d
> and reclaim will not revisit it before wrapping around, causing a cold/ho=
t
> inversion: a clean, written-back folio that should be a prime reclaim
> candidate is kept ahead of hotter folios.
>
> commit 359a5e1416ca ("mm: multi-gen LRU: retry folios written back while
> isolated") addressed this for MGLRU only.  The traditional active/inactiv=
e
> LRU has the same problem, reported at [1].  A reproducer is available at
> [2].
>
> Rather than re-reclaiming those folios (which would drop the swap cache
> that may still be useful for a future hit [4]), restore the rotation that
> was missed: when move_folios_to_lru() puts a folio back, add it to the LR=
U
> tail if it looks like it missed folio_rotate_reclaimable() (inactive, not
> mapped, not dirty and not under writeback).  A new do_rotate parameter
> gates this so it only applies on the reclaim put-back path
> (shrink_inactive_list()), not on shrink_active_list() where the list orde=
r
> is already deliberate.  This approach was suggested by Barry Song [3].
>
> Only the traditional LRU is handled here.  MGLRU already retries such
> folios via its own clean-list retry pass in evict_folios(), so it is left
> unchanged.  The same do_rotate scheme could later replace that retry pass
> to unify both LRUs, which is left for a follow-up.
>
> [1] https://lore.kernel.org/linux-kernel/20241010081802.290893-1-chenrido=
ng@huaweicloud.com/
> [2] https://lore.kernel.org/lkml/46037a37-4cf6-448e-a94b-30a4d16e8814@lin=
ux.dev/
> [3] https://lore.kernel.org/lkml/CAGsJ_4zwP3_+EYY5Ug9EJ+yD1UdxsBSGr25u8s1=
K3u_i7LH3Zg@mail.gmail.com/
> [4] https://lore.kernel.org/linux-mm/20260911121341.178028-1-alex@ghiti.f=
r/
>
> Suggested-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---
>  mm/vmscan.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index e200ce3eb056..026b844c681f 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -1971,7 +1971,7 @@ static bool too_many_isolated(struct pglist_data *p=
gdat, int file,
>   *
>   * Note: The caller must not hold any lruvec lock.
>   */
> -static unsigned int move_folios_to_lru(struct list_head *list)
> +static unsigned int move_folios_to_lru(struct list_head *list, bool do_r=
otate)
>  {
>         int nr_pages, nr_moved =3D 0;
>         struct lruvec *lruvec =3D NULL;
> @@ -2018,7 +2018,16 @@ static unsigned int move_folios_to_lru(struct list=
_head *list)
>                         continue;
>                 }
>
> -               lruvec_add_folio(lruvec, folio);
> +               /*
> +                * Put folios that may have missed folio_rotate_reclaimab=
le()
> +                * at the tail to avoid cold/hot inversion.
> +                */
> +               if (do_rotate && !folio_test_active(folio) && !folio_mapp=
ed(folio) &&
> +                   !folio_test_dirty(folio) && !folio_test_writeback(fol=
io))
> +                       lruvec_add_folio_tail(lruvec, folio);

sashiko says:

"Could this heuristic indiscriminately place un-reclaimable clean folios at
the LRU tail, ensuring they are immediately re-scanned in an infinite loop?
If shrink_inactive_list() isolates a clean, unmapped file folio with an
elevated refcount (such as from a concurrent GUP or speculative lookup),
it will fail __remove_mapping() and be placed on ret_folios.
Because this pinned folio matches the !active, !mapped, !dirty, and
!writeback checks, it is placed at the tail of the inactive LRU. The very
next isolate_lru_folios() pull from the tail will immediately isolate this
exact same folio again, creating an infinite loop that prevents any other
folios from being reclaimed and causes kswapd to spin at 100% CPU."

This seems to be a valid concern. For a clean and unmapped folio, we
may still fail in `__remove_mapping()` if it is pinned somewhere. So
perhaps we can add a refcount check when fixing the rotation.

Best Regards
Barry
