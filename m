Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84664F30E4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860090; cv=none; b=ZUmIKlecwdj0PuXfasRZOoKFv8pdxR3cxjfxGBEjtgZhrMemAARjGNhogTvv5LwgwVgWqf4aqhZ1Gegp0zix8MNOwh9Gac94dHnCyifpQPhceRdtspYE7c8CHmXKtFA4Oke5mDJGG6q5dqd+qQnEw57uJk0gMmTwScR2FisdbuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860090; c=relaxed/simple;
	bh=/7mJb5zwLxSBCtxFZ58EtxTprX1xsoQvMGsFAPnJMCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k0pne7TeONfrC+fPxWnJQIx4UYXzkj62309aFt0bwx2PhqiXnLvGJht6Vu4HA7fBCwt9cEAcK2eNceMV3yPO4D7H3BbHvivkNOP3QQ3uizJcxM/3Oxg/sG6q4LrCL/DLCYZuJIWcb4u/dRqcfBRuMOnpOkiysy5/p5WaSLxlrqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmgodSbs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmgodSbs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7B11F00AC4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788860088;
	bh=+dWSZPT2cSGadun9qNKyTf04I9xLfA1wAds+skSZwk8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OmgodSbsMd+e2EKAAVE0Y4Ez9c6bYnvrydF7+hyJSlJnCCAc7MQc9WV8R+wGRLu3N
	 iYE1NSmy+l83Jc+XosVTZ81xyv2Y8aScDeyadeTwOTi/vfiIpr97N+2g1Rj/IRaLUP
	 Ex9u5LjDtE0uhFZ/nxlq2sZBy5fQH+AlFu/jWSCqF1YXqRTU0yfN6T5iIWEOco/ly/
	 hyxpY5wavgkxE0EYzSpNDGgu/awjlq0InEY5QM0pRgFAs9TsGo/b4Gw0EYCm4fNBMK
	 U9zQ85Ky4J7+YKZE1I0UwFSoK1MYw7Ozl5fa4mrRdrnv0iymvtdWW4+CYH/GZUEIIx
	 p/jsRkWX8+mHg==
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9399e925dcaso197801485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:34:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLWIDQ5V6xXdhhQH69SDoPWLoUouQUN+9MqQdtIFdYNV+KGAxDzLuRliQJlvAc8Kdb36R+18L7zbDnPxc=@vger.kernel.org
X-Gm-Message-State: AFuF++mhk9GOd/z67l0fiTR2c0ke6UigMOYob+kDGukoZE6CH2ccdHy8
	YHOdah5CeAeUaliHpcVGW89J2K2uZGy0MoVsR+Pc5Nb0pgg4+HgEvD4Vrz1OzfW80w2MqeIRijC
	qC+ZRTszgHxV8Q0R4eK54LJAPaoqX+D0=
X-Received: by 2002:a05:620a:aa0c:b0:937:2e9f:70a8 with SMTP id
 af79cd13be357-939804af824mr3279565385a.39.1788860086621; Tue, 08 Sep 2026
 02:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908062649.1045883-1-zhangbo56@xiaomi.com>
In-Reply-To: <20260908062649.1045883-1-zhangbo56@xiaomi.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 8 Sep 2026 17:34:34 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4y7XRChHuquYj9brgTv9bugOVo14DmoaPFHam+vnmGnFg@mail.gmail.com>
X-Gm-Features: AcwNN1U9qAXnbYyo19332yqF90SnZUuQ82rHyPQcT8THjupG7pojENqlZKkPEQ8
Message-ID: <CAGsJ_4y7XRChHuquYj9brgTv9bugOVo14DmoaPFHam+vnmGnFg@mail.gmail.com>
Subject: Re: [PATCH v4] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, kasong@tencent.com, 
	qi.zheng@linux.dev, shakeel.butt@linux.dev, david@kernel.org, 
	mhocko@kernel.org, ljs@kernel.org, ryncsn@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Bo Zhang <zhangbo56@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 2:27=E2=80=AFPM Bo Zhang <zhangbo0325@gmail.com> wro=
te:
>
> We have observed some cases where memory is allocated with GFP_NOIO, so
> we cannot reclaim any anon folios unless they are in swapcache. We can
> end up spending more than 150 ms looping in `shrink_folio_list()` scannin=
g
> non-swapcache folios without reclaiming a single folio. This is pure
> overhead.
>
> This is particularly true on systems using zRAM, where swapcache is
> relatively rare. So let's check whether anon reclaim is allowed by
> GFP_IO and whether there is enough swapcache to make it worthwhile. If
> the swapcache is extremely low, we're essentially searching for a
> needle in a haystack, so let's avoid scanning anon in the first place.
>
> On Android this is triggered by dm-verity hash-block reads through
> dm-bufio, which legitimately use GFP_NOIO because they run underneath the
> IO path:
>
>   verity_verify_io -> verity_hash_for_block -> verity_verify_level
>     -> dm_bufio_read_with_ioprio -> new_read -> __bufio_new
>       -> alloc_buffer
>          gfp: GFP_NOIO | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN
>
> Such a reclaimer can land on a memcg with a large, unswapped anon LRU and
> a tiny file LRU (e.g. inactive_anon ~335 MB vs inactive_file ~4 MB, with
> negligible swapcache). shrink_lruvec() then keeps feeding that huge anon
> list into shrink_folio_list() - ~2400 shrink_folio_list() calls, ~93,000
> anon folios scanned - where every folio is kept because it needs IO. The
> 150+ ms above is one such single shrink_lruvec() pass (not accumulated
> across a reclaim cycle), and it reclaims nothing; the actual progress
> comes entirely from the file side.
>
> Aging anon alongside file does have some value for a later __GFP_IO
> reclaimer, so it is not strictly pure overhead. But that aging is only
> deferred, not lost: kswapd and other __GFP_IO reclaimers still walk and
> age anon. Spending ~168 ms aging memory that this context cannot reclaim
> is not a worthwhile trade-off in a latency-sensitive path.
>
> To stay conservative, this only skips anon when the swapcache is really
> tiny - below 1/64 of the anon LRU - i.e. when essentially no anon on the
> list can be reclaimed without IO. Whenever there is a meaningful amount o=
f
> swapcached anon, the normal path is used and anon is scanned and aged as
> before.
>
> Note this only addresses the traditional active/inactive LRU. MGLRU
> selects anon vs file scanning in its own path and is not covered here;
> fixing the MGLRU case is left as a TODO.
>
> Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>

LGTM,

Reviewed-by: Barry Song <baohua@kernel.org>
