Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793293888;
	b=JELYfrNLxUJt/iKYfZmaVhTG5YM/RPLp7KvYSKWWyUXQhhWMPqLXdDwuAhLJ0NeXLAlO
	 dp+n9SeYYYVPw/rcCtDvGhHgUHsU/UAPy07nRrcnfM6bftGXLrwkr6rNTGPPkpRhA3Sv0
	 Ok/bbhwnfEwoQlNJjPU6ZFBNDn7JyQZP2kejwxR9oAuSKwQe7YeAQFXPQqCbR9CHPDiUn
	 Ivc/xeJqC7H8MMAnJlNPDIlvD/KoMQTUL2tSmXi89I0S/kE3oZP/BAw4X1dXN3pAVhxXH
	 TN0cUDGOGl1YNU5G39pD43abRO/RCFJvgcNRCng1/pFhHnT3iTY+o8bsdjdsoGVOkog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tWIs7qde7qVf47bMdBUNRj4kmNzByzqvwM3TO1z2Isc=;
	b=DJVbqs+cD+GYbKPWBzllX8qOC3dXQUNO7YPLpeARY9uC4vtoJA+N/si9rs3q/oYzf8Vn
	 hFVyJSi09oVCtwftakoPdCs2J6maQZzEqnbghF4Z98rOx53iT0c9e/qWCHCrteHjTXSTr
	 J21a2HCjB6AFM3yIkFwuIQP4Fl6rW1DhIl9DMCRAH2e8mOfFLKkCV6f7RTTqrCHTd44hj
	 4yPcBbtmwRyCL3DUy5wmJ3u1dCqVzxaSZjLPiA0LPsarXIzkAbLN/5crXhWiQLpbKMBCF
	 9NxRns5m8/JMMmeWCtZSM9r6TC0mC565aMlFFS25woPlWhetYOl4RCH+dO1ajo44VrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xDBt7lKH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77339606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77339606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xDBt7lKH
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1391812f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:11:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793293887; cv=none;
        d=google.com; s=arc-20260327;
        b=rtGIfxERfR6c6MxO/o790/FkVmYoathScHjQmpLoFCx5dTtkWvLP4OmaobcFKAJHnL
         aYvHXfW6MAQ7sORy7UmLwcl/0X2AYjRpqCR5bHvgJLZL6+e6f0rZJe/jGtE4ZYpviXGB
         J3H5sCZhBDGZ+vC7/qHFxauAXy1i5fVs0owA5eGA0k/woLnBhRbvdguU8sx+Wtys8Jig
         2gUDeOtaWY1IfWjXtjlvpIcsnBq4S0mSFyii89jB0Jw1+0FcDCJ9h8vP1h5leRVU8f7T
         cYLN1oTz6cuE5ooZ/MwrFObZQjyuEo8Teq72pII76F9JJVqu9IQBPWfR0DtyraD1gChn
         8IkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tWIs7qde7qVf47bMdBUNRj4kmNzByzqvwM3TO1z2Isc=;
        fh=WQDTHMq/75iVj/MrPLvaz9V4xOFI/Q8YBKdzSzGpRf4=;
        b=FsRZ4y3WxQs1MVN4u1YgcGW+5/TYkkmM/hYzHdt3u+ldv3HQYkwu8GjAahO06zAw/7
         5HWv8iW+8lNkRgZTaXgWg64gij6+83/2vzLoU2f2fTZwSlPM1NzW2w5c1AImGpDYqKLI
         /Bkb+RuMTxdFPRAFH5HYwNoOOXsjbSz5CCC9OnMcOOTMusgLYSoAVjnZ0YgL4mEW/I3E
         DnBahvZuQ+guJCmEUmtcpmTqG9TKmF3reozfxYD1VKc3LNQ5AWTJHlc3vfbN1tn5+MmS
         3/Ky0FjO/7cd7BjtFxnZjTTOl6cNGNaOQWP+ch2noJurUiemxPlO3Z74LaAW9eYEMfos
         2pQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793293887; x=1793898687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tWIs7qde7qVf47bMdBUNRj4kmNzByzqvwM3TO1z2Isc=;
        b=xDBt7lKHELBkwvMdOK20QBMAhUk5awrA//Suf5iv3EVCF3qBscCczgQ8s60PISOafS
         B60Q1NYzOPpoctF8zDHXLzoobyFbSMWA39br6d0n8RjthMjea3P79GV+rZ+CDQxNiT33
         g4WQMN2G+c4c8Rd5NmPUADOt7LKVU1vjGByGVSIo5Z2BUBKYtuFoF94Klhvnn+RGgoXG
         c0Z+VRX82xet6602KfuxHiP3/wX2+HRu6L+dORP208vkFko3u7vJ2225pmqzLldrTU0O
         QdOIIplnGONyAg5FtBc93RHmJTmVoSYBXpdKN3VkZ7Bw3COSDY1tCiulrZ7sUi/wXheM
         4ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293887; x=1793898687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWIs7qde7qVf47bMdBUNRj4kmNzByzqvwM3TO1z2Isc=;
        b=m9vGrILr0hkpa8ZIjmFhRSZmMENMbEYGhINg4l+VIlfnre4uWbXxyBV9kIcsO2sv/B
         23m6TlorvcjC4YLWRN19CGz4gacJU2HfOYvW4UkZc00ujo4PLIRR0rp44I/e9Si9EAlG
         RDhqt3x0q6PUiC/mhwTFIvaDC70DETGhPjmGQGodQPplT3WJIc8B2HI8SAgdhk2si/EM
         eEpYzagCX6ke706eZbRF7QeBpMQOrpgeCcpWtNW9JxTIjl69W4TtgmJEcaGyrBQsyNtE
         lYHLMMsxYY3oqnc6ZLfMBhJVknzN2DH5EjUYAPn1hhLhhp1IZT7p71RyyRNG6vDuykxG
         j9eQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSQKMalWt5cOJFbY4/TdiCQghWrflDykChxlAeE0hOvcF59Q7WotITnSP9fMlP81/BPoc6fX8PYr6ZUEk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZTv0FvZRHTWkhhIBdoqL6xCsVQi83jHJb+8c1zYNLd6Wx1Opi
	AjoWhMQB+xyYIR8O4W8062LuYS1yt9qJkM1j8oK0Bm8EwOGKWEA2yupfOmiYXinRHdEEodLnEfX
	OEHwG3yFmU0Ne3A4qkgL+Q5CmIT+mozc=
X-Gm-Gg: AYBFou2mDc0AxySeyYz6m8i+PgkjGhKQUiWVgtXkZ2pKFBkgb31S+dyQt9HwFvdcgX7
	SziP1tX60kOb89l6YLwGMkTJHWZkYGOGgr9VyL4PoNIEq1ASoEOVIktJpsRvXbwkXJlEkJJ3ay1
	bl0nb+eseosBJb+GTJPJXIomrBaMyAWw+/AW733W63i1FDS47j9Ps8nrEvrG3bGFORmZocRUH6Y
	ZHga3gZ4ysDyfWsPKmquJ+Fey7a2BpXEXKM/GfB+ksjrSJpAYFLaH43P7Ia1uz8Um5EzRPTAPnv
	AxA/HNAwAdt8RgXkikqC3weCyqS5Q/GI+st4FSuh3fEl2cmJ32rpn0WiVNFlaG+LHcAWonyUuHj
	ySDOGmZcBr7ivqE5P8eF3TleyVXnq8yLIkYSpM05hAlo+HHFTxcae2lCq2CJ3/Q7fPWJEOgGyZO
	W+Uw28lpjT1wWF5S6sRmwIbh3xAbGqNe6Zh2KGjnlTvwt7HxaqrcV8Pw==
X-Received: by 2002:a05:6000:2486:b0:48d:ff81:5201 with SMTP id
 ffacd0b85a97d-48e6e4f44f2mr41720f8f.41.1793293886562; Thu, 29 Oct 2026
 10:11:26 -0700 (PDT)
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
 <CAKEwX=NfFNbBwhvNpYz8iWgimFuOow8J8x1SzV_6GcC_bb=Etg@mail.gmail.com> <3410e049-2e61-4ab1-b776-e77f3b97517f@linux.dev>
In-Reply-To: <3410e049-2e61-4ab1-b776-e77f3b97517f@linux.dev>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 29 Oct 2026 10:11:13 -0700
X-Gm-Features: AclHuK9bGc2_lFtcOpZQ5BfNhmM3b9GrSn5IrOfOf7ZTzL4rwMpqhXmug54aEy8
Message-ID: <CAKEwX=Odrncvnh=OU0Tqahb4ED0UYD2fKR7L2=_PVh=ZbB=jnA@mail.gmail.com>
Subject: Re: [PATCH] mm/zswap: fix double decrement of the LRU node count on writeback
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 9:15=E2=80=AFPM Kaitao Cheng <kaitao.cheng@linux.de=
v> wrote:
>
>
>
> =E5=9C=A8 2026/10/29 02:47, Nhat Pham =E5=86=99=E9=81=93:
> > On Wed, Oct 28, 2026 at 4:36=E2=80=AFAM Kaitao Cheng <kaitao.cheng@linu=
x.dev> wrote:
> >>
> >> From: Kaitao Cheng <chengkaitao@kylinos.cn>
> >>
> >> Successful writeback calls zswap_entry_free(), which removes the entry
> >> from the LRU and decrements both the sublist and node item counts.
> >> shrink_memcg_cb() then returns LRU_REMOVED_RETRY, causing the LRU walk=
er
> >> to decrement the node count again.
> >>
> >> The affected call path before this change is:
> >>
> >>   __list_lru_walk_one()
> >>     shrink_memcg_cb()
> >>       zswap_writeback_entry()
> >>         zswap_entry_free()
> >>           zswap_lru_del()
> >>             list_lru_del()
> >>               __list_lru_del()
> >>                 atomic_long_dec()  /* first node count decrement */
> >>       return LRU_REMOVED_RETRY
> >>     atomic_long_dec()              /* second node count decrement */
> >>
> >> Add zswap_lru_del_nocnt() to remove the entry and update only the subl=
ist
> >> count, leaving node accounting to the walker. Split data cleanup into
> >> __zswap_entry_free() so writeback can free the entry without performin=
g
> >> another LRU deletion. Other free paths retain their existing accountin=
g.
> >
> > What is the visible effect? Is there any effect, be it in reclaim
> > dynamics or userspace counters? Can you add it to the changelog?
> >
> > I'm not against fixing it, but need to gauge the effect for
> > prioritization, whether to cc stable etc. etc.
> >
>
> This is only an accounting issue; I could not find any code in zswap that
> reads lru->node[nid].nr_items.

Yeah I double checked - this is the node counter
(list_lru_node->nr_items). zswap uses the per-node-per-memcg counter
(list_lru_one->nr_items).

I think Johannes' approach SGTM.
