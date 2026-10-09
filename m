Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A47133D6F7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566862; cv=none; b=uk37BQbCMixyeIGoZD/CZW88HzYionK1I/NiZFNjYdr9Wf5LH1ATe5Wtx8GBMyJzB/LHtcXz0kO2xB+dSZo0hXP2nzqBPs6gmiWn00pqxeSK6/hS3YYVyMgWGpGp8XjJOPi4hYbmzHhehLhsTEUZzd5A8U5A63Vpp7wNbCsHiiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566862; c=relaxed/simple;
	bh=CqBnW54Mbv9AWJM08eruBqtBpvvm1r80uZxZrFNmgvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nEMAukk6viWu5/xCZ2s+okb5GdJZzLJ894VeHsclEKQ8J200tnMYAefXYiFdxxwNp5eVYcLR3wMoDGfWdc4YARrruTBRmqa3tZhJfZ/pOy3PfTCZ0O9X9BjW75XZnUBeDcM0tg92nW6Xzt8fddTTIGcGdVMhSOvHs60tCcqgwf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqjXN3Rq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqjXN3Rq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48F01F00893
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791566860;
	bh=CqBnW54Mbv9AWJM08eruBqtBpvvm1r80uZxZrFNmgvs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SqjXN3RqTLfMmSywHxGghzVWZvm8/uzSr3YyQipzhuCRBBFtVTzKfi7S86bs0Kozj
	 5SXMW1QNYEZWhHSv/jo9sETHqY2j+jXLXhxP92egSuuhVIV8b0viOvr3+s6AoGfSSk
	 owvFPCFmxdvIYU/Ycel31Cu8chB7Pn1x3MlyiI9kbFpVvmhFc/EWZrSKG1yZoJRAYD
	 wFr3cTafYmRYzJiyCu1XHVTEuKlONMRGSXlIvB2m1J00x/DxDWaBQeoM9aaVD4CfzE
	 LDx+UT/p9p86XReCR8jneQuOZJ7GY9YkESK3tqpu5mxbtFm8MwuhVHMMfNa3uTSTcK
	 ffNel0x9a/FCA==
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b64fb6010so2827446d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:27:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxn2Th1ASKyfQmz8/zasgg248n4BUQhOhzs1RuwGrwcaAmu4zqlgYH+wLvGZJw3KNHnw+TESoiTUY8a4N8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIc8JAyeFUMMB8TVj3zzbebYT7I73SuKMhjg/9H+X83+UCxxV43
	UzHu3jwcSZ0S+yjH3YtNBBiAiduxOsv2ylyHFNm+NoDTXdIRJ9O67iJU93B73Tnf7z4QVIPk48A
	5GNyfjofhpAKkyRIARjMMyNYzNvLWFT4=
X-Received: by 2002:a05:620a:2728:b0:93d:23d5:32fd with SMTP id
 af79cd13be357-93ec1499888mr302127885a.27.1791566860153; Fri, 09 Oct 2026
 10:27:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006002307.2669023-1-usama.arif@linux.dev>
 <20261006002307.2669023-2-usama.arif@linux.dev> <CAO9r8zPm4B1_wtAUMeSR9PQ5ja+kJz14Ub7MCuJit_NSH2DQsQ@mail.gmail.com>
 <3465c889-de07-48b7-b6b4-7fc8dcac4e67@linux.dev>
In-Reply-To: <3465c889-de07-48b7-b6b4-7fc8dcac4e67@linux.dev>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 9 Oct 2026 10:27:26 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMjcmoY_pJtCUGbw39Kq7i_L9qUUQXUSBNAqSmwiaVVOg@mail.gmail.com>
X-Gm-Features: AclHuK-oBA4BdyKvlYo-fUMM-fivKSARBB0CToCpEWZ_rb1EHfIuBapd1xjHTP4
Message-ID: <CAO9r8zMjcmoY_pJtCUGbw39Kq7i_L9qUUQXUSBNAqSmwiaVVOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: zswap: use separate compression and decompression requests
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, chengming.zhou@linux.dev, dsterba@suse.com, 
	hannes@cmpxchg.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	nphamcs@gmail.com, terrelln@fb.com, riel@surriel.com, shakeel.butt@linux.dev, 
	alex@ghiti.fr, senozhatsky@chromium.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 8:07=E2=80=AFAM Usama Arif <usama.arif@linux.dev> wr=
ote:
>
>
>
> On 07/10/2026 23:01, Yosry Ahmed wrote:
> > On Mon, Oct 5, 2026 at 5:23=E2=80=AFPM Usama Arif <usama.arif@linux.dev=
> wrote:
> >>
> >> Stores and loads serialize on the same per-CPU acomp request and mutex=
.
> >> A low-priority store can be preempted as soon as the compressor drops
> >> its stream lock, while it still holds the mutex. A higher-priority loa=
d
> >> on that CPU then waits until the store runs again, which can take a
> >> long time when other tasks are runnable.
> >>
> >> Give compression and decompression their own request, completion wait
> >> and mutex. Since commit e2c3b6b21c77f ("mm: zswap: use SG list
> >> decompression APIs from zsmalloc"), the per-CPU buffer is only used fo=
r
> >> compression. The two requests can share the per-CPU transform: no
> >> in-tree implementation modifies transform state while (de)compressing,
> >> and shared codec state has its own locking.
>
>
> Hello Yosry!
>
> Thanks for the reviews!
>
> >
> > I am a bit uncomfortable with this. If future changes modify the
> > transform state while (de)compressing, it may result in nasty bugs.
>
> Independent acomp requests can share a transform. UBIFS already uses its
> shared compr->cc for compression and decompression without caller
> serialization. IPComp also submits per-packet requests on a shared
> transform, and EROFS allows concurrent decompression on one transform.
>
> Drivers synchronize their shared state internally. For example, HiSilicon
> protects its transform-owned request bitmap with req_lock. Unsynchronized
> shared state would break those existing callers too. Separate compression
> and decompression transforms would still leave concurrent stack
> decompressions sharing a transform.

I guess others relying on this makes me feel better about it. It would
be nice if we have protection against it. Not asking you to do this,
but constifying the transform everywhere after it's initialized is one
way to solidify this.

>
>
> >
> > As for the buffer, I would also prefer some protection, but I feel
> > less strongly about this. For example, we can put it inside
> > zswap_acomp_req and not initialize it for the decompression request.
> > Alternatively, we can have an intermediary struct that contains
> > zswap_acomp_req + buffer, and use that for the compression request.
>
>
> Done for next revision. Added zswap_comp_ctx containing the compression
> request and output buffer. Allocation, use and cleanup now go through tha=
t
> context. The compression mutex protects the buffer until zs_obj_write()
> finishes, and decompression has no buffer member.

Thanks!
