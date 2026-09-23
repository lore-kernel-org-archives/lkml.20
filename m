Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93659481AB0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158539; cv=pass; b=L54S+Rl5Wvdh1qJfG5baWH/rAAik5NVvpMPYsqt9W0anlzgPjEH+esRNJnT4HMFO4tX2seqcGxYdsfRiY1xTFT43xKPIP7lTT1jIXu/GxEO0ePPdBhKETVLrF5X4w5Vyhwx16jnPElJLN1UTOn14EF8pTDmNtGKrlxpd7JqB72g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158539; c=relaxed/simple;
	bh=yvjRsKuG4XK8dy8/ip76T2dDftOg0LvGvvMlM7k4+Go=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6+HP/nukzS2RJ5pHhWK6b2gM3ZYx08oomvsoqqRu08J1XkBfbZats/8CxDcuLETHdV0NEz+DoxmVsmjSUXNvDfiQNizA510Y0+oX8ytYok5Q0bUgGQjXrWvp7ASCvLCOU7EOLw32BtbyDqo+VoSp2HbiB+I6Ye9tfD9ultS29E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+wkIn8u; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+wkIn8u"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55eff0so103922266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790158529; cv=none;
        d=google.com; s=arc-20260327;
        b=C+ZIsdeZduVpwOgpHmeMtMotFMFAf3nLI8QpQnQguVFLjLmoOrFD8Sm1o9CzXE9ULs
         c0Q8vBDDtHes13SvOiPDrn+9XbJxFc8x0rg40JOROPvgXuczxrF6N0YVCO1C18Ue4A2q
         hgHUDbNJCl1Scb1oIU3D6akLD/CNocCT+eANXtgxn5xAy6yyr6xALQ+i7XhoQIAVm0L2
         jbMrEHR+SwCh3zGZue3JsRv4GCUsmjXzuw+XfJD6WhIwA2gaPmNVGow5gb52AEXfnQzm
         vz+7VtGJoIxIabcTDIzyx7UiCoyX6kAWeoXobYFQIuwb4RlMRMj1iUiE0364TAo8ssXe
         nUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yvjRsKuG4XK8dy8/ip76T2dDftOg0LvGvvMlM7k4+Go=;
        fh=/czWoh1pM70L523tf4lcX5JEmmt9DmSVhiUMfMsRfOM=;
        b=q4GUqtDfuemyFAGTqfHkb4qe72LiLrPwg1Nd09h1HzTYXOYQvSdbUv/sytEfPHnNXS
         J5aL2B/fYdJ3Wn9fifwuguXydk2GumNEQqTM2rIKviz63cam3eeSW9Ki3Pf9Ka0iaGcK
         hutGvDaQz+zrJTNGRyRrf76h7KgbW8p95mR5CwctX4Go5bhF6UPAIS1Y8zPj6idwqREC
         mFw/xMoy14E3EdoLO51sNu6KRPnHL8eU7J5a1rDuhmpGwj5A8Q6r7/4/1hXJvWtOl9mZ
         qA1NYwbJ8I0fksiVkTd6lPoy63hxXHytQh4qPYynCtylISWlo0UfOK9Dm2LyYkUJox1k
         TdqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790158529; x=1790763329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yvjRsKuG4XK8dy8/ip76T2dDftOg0LvGvvMlM7k4+Go=;
        b=E+wkIn8ud+sbCW/hZDRB7OxDjiIBjlkPxyo8p4WLgr05JGZp7afS7jAXLgOEsxULAK
         htK6cbjZigGp+IYhMUR+f8i6bSh4OYgBITO94ZGV+ZjGLF38IeUSPOovIkmrnMfZGaEP
         +7htVPqAiWzT3MtbmSifZd8UInb0/0bNFNYYqpIvUiW+D4kXljRg8cMAFbWoCHxaiORN
         sK5Qei0QC2uT+Dk5w419ptsi1mGfHiDWF5rHk4eqotbuTbsxKzjafnO/ag2EZtnDplfh
         RjlD0fw5Y04Vu9VpCunWJhdGSyTP7rmB3bMFuCmlrmG91/jBsKWZk0s3132AsaANChwK
         Iigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158529; x=1790763329;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvjRsKuG4XK8dy8/ip76T2dDftOg0LvGvvMlM7k4+Go=;
        b=hqrvdK+e/ddul637eHlbK4+YStnljEJ5PJLE6aYoH12s7l0Wc9siR9ydA62eBKYzYh
         ITyXBx4DbhZPLxGjdTgnsgsVFvMpXduDJjQjGbk5HcpAI2TkLaiH6KBt0vQdZdqWkhoV
         vqTM7VWEP1LyGgmPkjPH15MRXm/uQTBRbyXCusE7fdOOsMImho7RVAbwPCk5Shzlt9cG
         ZpJIU5s/2FOVXWxBVzrP+/Td5owskmKgpqLM4JRAp8y54zIeT6Y9rJA4xSE26RvKZFBf
         elI2hWkjIh47bj2Q8U+f/uzzZoSNryxGOrg+k9iq0BdwfHetLP44j6pALc46/gLrS2iv
         0AEw==
X-Forwarded-Encrypted: i=1; AKwUvBzVfPQ1wppp+AHIEWBE0AlyJUBCrkHOSLsKw8IRBE4h0S+3nVryVoxpgDDJosp+5Qkm4RM6bm1Sx9tr92M=@vger.kernel.org
X-Gm-Message-State: AFuF++m4YXXDhqgb7rMbTGhTZn2CqpThNTal1jz52VoCi4Y6ouwHAtZ0
	7SkEqBwhooTITk0uXZ00NBqFYD3zzmZpclFLYUocDJpqVraY+hD976Vd8zMmM3bpMjWwEF2sJMh
	FiqG2SJz66ett+VB9xyWibF76AIy2j3M=
X-Gm-Gg: AYBFou2jT+82K176PPorWYEFxswe8f0icE13/AxZ+TdStOBZCDUTj22/Ik2w5qvrnXj
	Mn8hsZeW9EMrsotwNeiIVYiIcuaM9/gvrMb6dIFc1t53GX5FwugC+ee8OfY68B8bbXuyppsUsuh
	pwkDefmTUpp76DJh1siSxZyKsHs3D5vV6qtyVgp1NHPgLZSku7V40nllDJqNJ9dULl7krTX8iRL
	C7vedRCLCu+uVAsA+69kHVCTyLhDqf1+TpeDtVfRqCqy64E1CoqrZmVCK8VxcMSKsrZAnN64aBo
	WsayCRUBJyukDsDa5izpryemKu6tmyPzxKtXHePgGiK/msKsePKiBb5XCuMIpu1JxQR9OaXFMxB
	9VGLmtB/8YBrHxFds6tKTHkb3ZENCAb4gVQ==
X-Received: by 2002:a17:907:94d1:b0:c21:8a0f:56dc with SMTP id
 a640c23a62f3a-c2aadcf59aemr168360266b.4.1790158529011; Wed, 23 Sep 2026
 03:15:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921152449.629486-1-alex@ghiti.fr> <70cae945-3a4a-40db-96ac-5ce66a3fa186@kernel.org>
 <CAGsJ_4y8-wD0yMV8GCtCz5MfNrOKqUaTd+UgH=8MoP_nuvPnGg@mail.gmail.com>
 <108487b7-0529-4282-b5f4-355804b4c0cf@kernel.org> <CAGsJ_4zGmGh70QtRBpnhueev3qt_bgB4ZiE9fkW-hgNjAVhv+w@mail.gmail.com>
 <2e695c8a-4212-42b5-bb51-fbe1aa162e1d@kernel.org> <CAGsJ_4z2nakqBCKd_uAn4bfub99r3NJt2spOUx-K0M7bHW3_-w@mail.gmail.com>
 <4c7c6ea0-84a7-45f6-989c-d1502b90694c@kernel.org> <CAMgjq7DeYsJxG_VCf2KnViV5nd10m-PPYzXRD1fi8QcGWwD0qw@mail.gmail.com>
 <d9a77381-cf88-4726-9223-c16a5c6608c2@kernel.org>
In-Reply-To: <d9a77381-cf88-4726-9223-c16a5c6608c2@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 23 Sep 2026 12:14:52 +0200
X-Gm-Features: AclHuK9mlyEK5KGjeb15PtrjRxgURBtxvyOWmKCdZfKnXFM1uVa_RwiaKUn-CGI
Message-ID: <CAMgjq7CLGyLHi7Lb8WF_m9bWUHpMRp_uDrqYNRQsH2GkuVQ=Ng@mail.gmail.com>
Subject: Re: [PATCH] mm: madvise: drop MADV_PAGEOUT folios at swap writeback completion
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Barry Song <baohua@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org, 
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

On Wed, Sep 23, 2026 at 11:47=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/23/26 11:35, Kairui Song wrote:
> > On Wed, Sep 23, 2026 at 10:46=E2=80=AFAM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> >>
> >> On 9/22/26 22:55, Barry Song wrote:
> >>> On Tue, Sep 22, 2026 at 7:26=E2=80=AFPM David Hildenbrand (Arm)
> >>> <david@kernel.org> wrote:
> >>>
> >>> I guess that's because the LRU is not always accurate. There are case=
s
> >>> where our prediction of future access patterns may be wrong, resultin=
g
> >>> in refaults?
> >
> > Hi All,
> >
> >>
> >> Right. But these would happen in both the SYNC and the ASYNC case. Whi=
ch seems
> >> to indicate that making the SYNC case behave like the ASYNC case (keep=
 in
> >> swapcache before evicting) could actually improve performance?
> >>
> >> Or is the SYNC case in general so fast that it is not a problem and th=
e
> >> swapcache is just not a good use?
> >
> > I think the problem is not LRU being inaccurate, but ASYNC case could
> > overshoot the anon reclaim very easily. File folios can be simply
> > dropped, and increase nr_reclaimed, but anon writeback (swap) can't be
> > done durig the reclaim iteration so nr_reclaimed never increase during
> > the scan iteration. So the scan tries hard to scan and reclaim more
> > anon folios, more than it really needed.
> >
> > I think the real fix is some kind of different watermark, throttling,
> > or a different counter to limit the scan of async swap. I mentioned
> > this at LSFMM this year but I guess I presented too much at the same
> > time so few people remembered it :D.
>
> :D
>
> >
> >>
> >>>
> >>> Even on Android, which uses zram with very fast synchronous swap-out,
> >>> I can still hit the swapcache from time to time. So perhaps with a
> >>> slower device, such as an HDD, keeping the swapcache around for longe=
r
> >>> could allow applications to hit it more often?
> >>
> >> Why is that specific for HDD? It's the exact same app behavior indepen=
dent of
> >> the underlying swap technology.
> >
> > If you have a shared folio, you must use swap cache, and even for
> > single used folios swap cache is the way to do synchronization,
> > regardless of the device.
> >
> >>>
> >>> I don't know. Maybe Alexandre can share more details about this
> >>> benchmark. I'm also a little surprised by the 15% regression in
> >>> Sysbench OLTP. My initial feeling was the same as yours: we should
> >>> release the memory immediately after writeback completes, for both
> >>> synchronous and asynchronous I/O.
> >>
> >> Right. And see if we can identify why we are swapping out the wrong th=
ings :)
> >
> > I think we are not? It's about over-reclaim. In the worst case we
> > might put every anon folio under writeback, while no folio is
> > reclaimed, if the device is super slow.
> Ah, that hints at the real problem then? How confident are we that that's=
 what's
> happening?

Given the fact that ZRAM/ZSWAP doesn't suffer from this, I think this
is the cause: the main difference is that ZRAM/ZSWAP frees the folios
after pageout() so nr_reclaimed is increased (reclaim loop just keeps
comparing nr_reclaimed to nr_to_reclaim), other swap devices keep the
folios under writeback, and continue reclaiming unless they hit enough
clean folios to drop.

I can't say I'm 100% sure, and it's hard to verify but I think we need
to try fixing this instead. It's not hard to construct a case where
all anon folios are put under writeback due to very slight pressure,
e.g. a dm-delay (e.g. 500ms?), 1G anon in one memcg, very slight
memorey pressure could easily put nearly all anon folios under
writeback.
