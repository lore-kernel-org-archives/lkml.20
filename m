Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F5D5208C3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067445; cv=pass; b=vDmV2HawYnS0z7ODzTgkRAttUdgeMHPGkK7uEDLQsCzL5hnsErOwoXbuf+1BPeS/+maeH6ZkiNkjfM7ge4yjvgm/5/MxcIKgr0bjzDrHC2ZNv+SeHOUpoEEqj9XJljNQRTtLTDDa4o9wrBe6b/htWUkagF73sUguO01Y4hwA80M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067445; c=relaxed/simple;
	bh=o6514X00PWNdi26SoKkvLC/5NgmaQmLJQdoANYp+Jhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFKnbCDr8UbCdeKkbgfWN+u2v2CfT8BmmxvApjdl/5brwzYR8pNl81L3s362fOf4egEJMUw5G6gPOP33eoy2rZKlojxn+ax8Jkzcj01Sso0J/RsJ8/7EGwbR5fRdDR0hDTVeMeBIbzeFPIYPJGpxsn64hQMFDglDUpONWxHCPEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkW1A/BR; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkW1A/BR"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6aa053900f5so6494965a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790067442; cv=none;
        d=google.com; s=arc-20260327;
        b=MPAfEWGUWIroJZpQ9OAAryNFgkeCSrwu4Y2HPSFAArM9GnAAgShVvGwp79l7RxuEI4
         ctHoz1XED8BTZdwRnDPLMIeEtk5HWvQxtBnrVoWUrGm5t9LxIk2ofsZdLwOKdb7+w15L
         lDR0LWcB8+HBSQoybDiFQCx5elLYCZjs0zt6zufiqeo9/Q8ll67CT4U0gbd1Rz16DKlX
         vk9vVdlfrjJEd8fUG8zKhl2MFFVB1BTBQxzX4UPeRCijuGQKbOqRXGo/YjBEipgNQr2N
         nJ+qH/JmCHZoDE4jyDvZJX0kLro9MMuGZpBAqksYYt+dkZD8JZzCXB4wPLou4IpXRacJ
         oE5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iiXXKr6AQsDe2gm1Pl8WbMsoWdC+iaoqvgtPe7PcWE0=;
        fh=ezj1G2CcpXXCHaLyRDD91GCTbaqy+4LoWbumrz2Kgp8=;
        b=DEasld77kIC4LEo0A/F6DZl8ZV7FGsed3L7fVgm5fdbZy20CJRK6Soe/1hG3Ds60JA
         nsVOGUuQTu1K/tfGvSMxwPwToNAsTBpU/blFc7u0pNu02I5d119XurQmklz0zvfev/Gb
         bMfyFSGhNT4R03zlAUUAHyz9ziEe7SYfBlu7+anJ/5i2Nn3epBQQynPvtjgSnB8cq8F0
         Lvsfr3OQGmALGodKnzWhTS41KHeSz++J6HEJmielpgtZrQf+VZSwexp1MXkDyNptnMsa
         qpVUNggquncMTg6UtRFB6K4+V+nGhs8KkRKYBFv/nksww0Lljq0KKc7cWAcjFbCp6vLK
         xy1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790067442; x=1790672242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iiXXKr6AQsDe2gm1Pl8WbMsoWdC+iaoqvgtPe7PcWE0=;
        b=SkW1A/BRv4vxti4dW4RlEet575P8COquLIUKlmd9+8Mltv9Mv63IprBmC9Fmyq/fV1
         s0r+e9FOOwTtOTDSjoKKxCMEXao9SWOEVttxdy993EzXXAJJII/wT1OlDdYRi4ijj89E
         64tiPfTuyMRTi0MTjuokLoJ5cmEAe7/9x/pEHNzmE5mX26OFNzG01uvbr5okqu2nQKxG
         rJRNEDtQmao7QLzGByPB0Dv7y3GS3jr25rt6oFjMnf/ciM0thMyBxrqcWNrQTriGXfjq
         0ND64N/zHrkfLSdeAqGmTiGGg7Gdx8OXiXOz3T57nrj5eRE6d8Qxnz3RWG+pIjV4dlbg
         dZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067442; x=1790672242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iiXXKr6AQsDe2gm1Pl8WbMsoWdC+iaoqvgtPe7PcWE0=;
        b=0XOezo4ckz6pM1Qpv8bXXPRSnWrdzCfjXBr+1m7B59B0K1lW0VhX/pvz9BmvnjCMYa
         Ply2CsJpKo9LIzb1j5/v7KtkSK8Znj9rn5KHo5Mlskww9S6FPONvr8gIXdIeMxdci9eJ
         vZPeH8478q5nPSdgCxvVUwN5JoQrj6ksmlrTw4TAqlEps+Nv2lCKPCoDucvSwZ092Mlz
         jWITH2azVv8pSdpPBOMAxveaLMbwO7Unf/bdSrXn4a2wwDQr7p62Mx8kpj90iRep+0fa
         W35Gx/uUrMDEfeM9qWpUHye+HX6Z8UyUlyXP86y7OM2JVbRymE+FhmFnGeCz06OkuX8d
         KW0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxGSCx7m0AlaDugagz6jpmFq5KCEeoRPEAuU8xIXPY7fg8gv2q9TjYR1SkyRVdzkXuOeP5+2Fr0XUL49Gw=@vger.kernel.org
X-Gm-Message-State: AFuF++lA7JDS7Cp7vqSlhAEuhiEqDWgOFTBUALIEYpbYOCKxaCr66n2i
	jdBtUgNk6jA38yTWEQxcgrC1x02rydgZXT0hAmfm4zE6CdsNq3hqnFZRsjgbR45QhgmlRFU02IK
	wEYZrhTv0zrfTZqCmT9YVNSXhlevRg9w=
X-Gm-Gg: AYBFou1eINwXxAjRfnfuMJZ3PWHJWxCjRDvMb3UGg1tbp8+MvuE+uLns/MlTJ3dMveX
	Zd40Sqp5aUli+oZIFmbzyGfgfjCwaxRGI1nrZS5T1k7PGc0WZ57nsxCojsobZA48DGjtZRp/PCb
	mNB0ZYV23ISTemHfmJ5lw01hXkt8k7dmuRmsPUX4cQopb//r8rkuhpwC9QuaKefjg8lJBzyGppN
	mzHX9iqSBuKUDY5oP7tM4VY/PNw/39E1fQ0j4NVNqe/AGuIdS3BAgZTgF8dIUL7hdt09AGklQYR
	VtArjpH7I6mSRbOtt+G/ymcpzgp1SApNgCxG0FFzGpMr2NNF6Luvsr/lFb96qweR165Isjw3Nii
	YLslVAZghwN3qB1ne8vuhBQ==
X-Received: by 2002:a05:6402:e98:b0:6aa:a05d:c08b with SMTP id
 4fb4d7f45d1cf-6aaa05dc232mr1725470a12.25.1790067441280; Tue, 22 Sep 2026
 01:57:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921152449.629486-1-alex@ghiti.fr> <70cae945-3a4a-40db-96ac-5ce66a3fa186@kernel.org>
 <CAGsJ_4y8-wD0yMV8GCtCz5MfNrOKqUaTd+UgH=8MoP_nuvPnGg@mail.gmail.com>
In-Reply-To: <CAGsJ_4y8-wD0yMV8GCtCz5MfNrOKqUaTd+UgH=8MoP_nuvPnGg@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 22 Sep 2026 10:56:40 +0200
X-Gm-Features: AcwNN1XI2j9cIScZ408fYBNwmh9MTw-tllmDtnAwPjWo0btydNjCZVpYmlUUn1g
Message-ID: <CAMgjq7CpRg_5aMiRWFxWTYA2b1mtHu8YJAtvRRAy3SaZg45t-g@mail.gmail.com>
Subject: Re: [PATCH] mm: madvise: drop MADV_PAGEOUT folios at swap writeback completion
To: Barry Song <baohua@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org, 
	willy@infradead.org, jack@suse.cz, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, jannh@google.com, chrisl@kernel.org, 
	shikemeng@huaweicloud.com, nphamcs@gmail.com, baoquan.he@linux.dev, 
	youngjun.park@lge.com, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, yosry@kernel.org, 
	chengming.zhou@linux.dev, kunwu.chan@gmail.com, tz2294@columbia.edu, 
	hch@lst.de, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 12:00=E2=80=AFAM Barry Song <baohua@kernel.org> wro=
te:
>
> On Mon, Sep 21, 2026 at 11:37=E2=80=AFPM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >
> > On 9/21/26 17:24, Alexandre Ghiti wrote:
> > > On an asynchronous swap device MADV_PAGEOUT only marks the folio
> > > PG_reclaim and rotates it to the tail of the inactive list once its
> > > writeback completes, so the memory is not actually freed until a late=
r
> > > reclaim scan removes the by then clean swap cache folio.
> > But we have the same behavior when just reclaiming memory ordinarily? I=
t's added
> > to the swapcache and only the next scan actually frees up the memory.
> >
> > Wouldn't we memory we reclaim ... just gone, like in the sync case?
>
> For synchronous I/O, such as zswap and zram, the memory is released
> immediately after sync I/O is done.
>
> For asynchronous I/O, such as NVMe, the swapcache is currently
> expected to be rotated back to the tail of the LRU and wait for
> another scan. Alexandre once mentioned that when he tried handling
> async I/O the same way as sync I/O=E2=80=94releasing the memory once the =
I/O
> completed=E2=80=94he saw some regression. So, delaying the release until =
a
> later scan may allow swapcache hits before the folios are eventually
> reclaimed.
>
> But we actually have a problem here: this rotation, which puts
> writeback folios at the tail of the LRU, is not reliable at all.
>
> `folio_rotate_reclaimable()` would only work reliably if the endio
> happens after the folio has been put back on the LRU head, rather than
> while it is still isolated.

I think we might better fix this instead? Or is this really a problem?
If it has PG_reclaim, it should be putback to the tail instead of
head, right?

> But nowadays NVMe is very fast. If we isolate N pages and perform
> shrink on them, M pages may finish writeback during the isolation,
> while the remaining N-M pages are still under writeback. M can easily
> be more than 50% of N.
>
> As a result, we can end up with the following cold/hot inversion:
>
> LRU head
> ----- M pages whose writeback completed during isolation
> ----- other pages
> ----- N-M pages that are successfully rotated to the LRU tail
> LRU tail
>
> Now we can see that the M pages were expected to be reclaimed, but
> they are not only left unreclaimed, but are effectively promoted to
> the LRU head.
>
> For MGLRU, commit 359a5e1416ca ("mm: multi-gen LRU: retry folios
> written back while isolated") added the following code to reclaim
> those M pages that finish writeback during isolation by retrying
> `shrink_folio_list()` on them:
>
>                 /* retry folios that may have missed
> folio_rotate_reclaimable() */
>                 if (!skip_retry && !folio_test_active(folio) &&
> !folio_mapped(folio) &&
>                     !folio_test_dirty(folio) && !folio_test_writeback(fol=
io)) {
>                         list_move(&folio->lru, &clean);
>                         continue;
>                 }
>
> This somehow resolves the cold/hot inversion, but leaves the M and
> N-M pages with inconsistent behavior: some are actually reclaimed,
> while others remain at the tail of the LRU.
>
> For the active/inactive LRU and `MADV_PAGEOUT`, we don't have a
> mechanism to restore the missed reclaim opportunity. Ridong's patch[1]
> addresses this cold/hot inversion in the active/inactive LRU reclaim
> path. To my knowledge, there has never been a patch to address the
> same cold/hot inversion in `MADV_PAGEOUT`.

MADV_PAGEOUT is a bit different from the reclaim under pressure,
reclaim underpressure can easily overshoot the amount of anon folios
reclaimed, because however fast the writeback it, it can be faster by
scanning the LRU and dropping clean file folios. So before LRU
reclaimed enough clean file folios, we can't stop the reclaim.

I think the better fix is to have a separate watermark for anon / file
or a new way to handle reclaim. Reclaiming an anon folio is hardly
helpful in the short term when under heavy pressure and the device is
not a synchronous device.

The overshoot is a real issue, it's very common to see many folios
stuck in the swap cache after memory pressure. If we drop all of them,
we will see significant regressions. Treating MADV_PAGEOUT differently
here seems better.
