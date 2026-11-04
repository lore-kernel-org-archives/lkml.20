Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815609;
	b=qSqKY5EARQ3FmGtsoUEYR40wfBkslLb6f4YSvg6Q4W46A0ze3OCHXbkKYfhZ2N9f60W7
	 ub+Wv22Xo/pR5m3y1nWZ7xy3+nyfyPcEsrvp2XEGKNTA8puMUrures25RlGIW6UvSOHkA
	 Z4t1sH59q8OqHFD6//VghDg2YksoCIhlBypS4goPxpq4QjyI9EkDYk6cdOf7/JiIc+Ere
	 gVjqx5TEbxxtzAZfgy185ryzTvl8hCwbkDlTstRHH8oLOl/LMOsqG5Kz+TQUsC1E9F0SC
	 dxKbaxZI4sB5loK7IZNe0Fjb8qRZQHlg/XOLMv8W78arOXaa5Bgu/mzClMJNWM9+39g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hrmLv1n+5oNqFmytsUE4u53hMRh1aIZieVEIUAVdMCk=;
	b=5B9R+QG6o86C6Dr78bDhcNkrevtC3dGvWWoKNOhsmCsUWw9+Onzu2L6ZR0nbZZqCRsph
	 QeBi3Pxbf7UuHawzBOwrHtYpzigWkX/kB02CH8SCttAVaTvbMc2UmKyS7/2giPS2ScPow
	 mV5JsfDK7oZSgEuWddkwzLYr6drMTaL1S5nY1ACfb7TIXA8NnF0W0qsnTXPjbqv98HERH
	 1GwKS5Lb17Y9cWmZXm7VF8rhb/1E8D/Wg/bzxERQL9vaiFfORDIKpu4I/so2ZQeH30RkB
	 1Bzfu3FlcGmFVvLtEyexgg5d3zBIm2W7LJCUaWR97BvJfOFInqh0fSWDFNMSxicVdKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tN6FtHzx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C821606D83D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C821606D83D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tN6FtHzx
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so9285415e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:06:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793815608; cv=none;
        d=google.com; s=arc-20260327;
        b=Za1yBGi10viWu72f+Kkw/qSE3xi95UVn9/11IHIf+KdW3oT2tZQrW2ok2qxC+I7tLD
         jPfzXxc3iGa16JdI76EOX/VVZ/wX30vAayhgcFSbRT1jI2cE+ayREj/TJ8cu9zMJQ45m
         jlq4iv1BrAzR4GRcAv6b92uVY6q2xpKMlQD5FkbjqQy4g4/WMnlPmoZxISlJazPBU7zc
         ktJqtAvwfkRBQOtfUDxChgHCAxlYD+KjLgNKTe1cgelcjdEZAb+yvPNZC1qOjX2MhEjr
         G28XxSLk49kScvs+/UFX9g/RLD3/Bp90v1Ij5fkvuIS4esFzyMSJ/2/wiHlVkEldFej7
         4DMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hrmLv1n+5oNqFmytsUE4u53hMRh1aIZieVEIUAVdMCk=;
        fh=Y9TP145gU4ZO132rVcDaJsOl2xgCe30/ys8kPFHgA+w=;
        b=ZYgm/zsFN+x8DYRlj+LwyHG9EzLxsxzHgX/sW55q6mW2NtJPKgKMDB4ypQw4FpuJEn
         7xhGNg2DaJD+2ItpkE1M/IH2IBgWwnKMrrrwTRKpYxkUykpqKgohwPAqBdp5RrPglBpF
         sXt8FcMWrmZt7ZjXuv4XMz4F/EaAvDkYC2g8N/kSz8Vn9OSI1sl58msbL8eeCgC6JS86
         K30kUXGL9EcaR2Oa9QO2erLNZB13qDC9ofXPbM7GZPpTczJ/Y4PaWF2jNcdMgSzWWmv5
         oI8Fu9qMw1dIxNRh9wxDUlQlHYuixlC3JRQ0ev3Xrtyi795YtbnmvOC8IFnUw+fsw9kL
         jcKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793815608; x=1794420408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hrmLv1n+5oNqFmytsUE4u53hMRh1aIZieVEIUAVdMCk=;
        b=tN6FtHzxbqESjO6TiLAKC+L7Gr/T68SUx5G8GTm/brhVH/8qHgOLhNWmkbxDRd13MM
         AUlJfyZxtJYYXsxDSEQ5YwGhxg/2T2OFEZbt/zTHCqBEBUnrUWbuCyDiIFU9bWDZPM/3
         ZgGLIpl1gKuW3e9iRJk1SdDn6CnTV27Gai399Cnp0TY6eKlhnREoUQgVmSb77hS9rzqF
         qmlPIzTd5eh2+a2oxpKmq2dIeNZKwC2IhHiDUfzX7em80h1bsrnYpyQzIOvqzf4JrnjS
         mMtrWYFRhyX5hOMm62//2kLSClJXt0y7al2cbpmcexPj56UCDuDH1FmTm4f5Tl/mjvCZ
         QELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815608; x=1794420408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrmLv1n+5oNqFmytsUE4u53hMRh1aIZieVEIUAVdMCk=;
        b=HdaWYFur7rfeGpWSLGsVILG2FhPgiOqk5GWO25jZQ7U32NHm4y5hhKy1kpZppLEoUA
         mm1aekGoEkYm01s+N84Gc+mRiPAFbbYcyoP/EdQLn8j3woL1BVo5QSusgFj8RkwyJzgI
         2S4eHh4HkXe7ifQU/cSOGpmO0hLA+ObAikkW3fsf71W8ZTf1GF6rT6SGVx1/qjzVZye0
         Lc1sG+DdXvVX8+pPac36ST/nz05ncGRHcXqGkRHAijlCvSYyFVnsGmkAemD/Lt7HaWUZ
         tI06lYlVMb/X+AhLNjV2FxKx1mlJovC9B7N6bvAyku0IpgGGAhrgaSMYqUEb+65cBy9P
         Faqw==
X-Forwarded-Encrypted: i=1; AKwUvBwXH1VEnDuDxZUGxJvmJ4JQie4wLanUKqELGeteO1yNCzn8Ku5yUPT4CLj9Ubzu4/dcfk1LRfWh4D/LhPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QiIGqF7/A2C7/g2ZYB9Chhv0lisUwHc0/1WeqA1ifXNABJ6ZF
	fWfywM/byN9J62/7Fn6toW7XjkfRSXTyOJFPjtemFuGq3+y7ITtgZFsDRXR6ws03QMV74l/Apwy
	XHA4oGtB3kJrwmb8CLsz07o7h0K6ZRrc=
X-Gm-Gg: AYBFou1VyYbokjRnqr/gotgI4TBI+E27iYRjUsG5zlquJUtbG4DgPbvgNzDqu2SoTnO
	UAWNxLIy2XotLl0uvXBnVZmP0/j6DHRwEaARYIYUFwFCWnxf0DBma9at28hEcD9cAyBLCw2G2/M
	SKByFIsgRSRqsdZKfXvXozLghHFmiV1h5zeZ2xyUuXvGJ3f/iCtY0NOwWkrXFYcfMvYg5tzuG+e
	AsFLTFmOhClVD1FDhGqO8MiAd2xiWkAYmNh3AKEfEDneeqQZ+O3a6+0O1XyPgAe6JxFgC7S4Hm4
	8Jm+cFx+zhVe3ZMUNzQ9XaexgNx9mfiFBxWteim/lCl7jCHLHAogyQKvldUby/nxfa5pJsQKuyt
	g6X4M9Juob6tZZkJput7fvg0m7oSxvvX0Czx4raOM2/kMFM52YDpzNdOzAK17x8/n2ibi5Ky9qg
	wAJ3wvbTxs7A9w0CWZ7/4YO5kXZNf3VCnbyYHeN6zV/nVfrE56k3OL
X-Received: by 2002:a05:600c:4e13:b0:49c:d019:70c5 with SMTP id
 5b1f17b1804b1-4ac1228978cmr355749615e9.0.1793815607361; Wed, 04 Nov 2026
 10:06:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1786003779.git.xueyuan.chen@vivo.com> <anVWZVOt-xeD0dMH@google.com>
 <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com> <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKjuiRxQwtsZF_0@google.com> <auKlTdFbOZmAuheo@google.com>
In-Reply-To: <auKlTdFbOZmAuheo@google.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 4 Nov 2026 11:06:35 -0700
X-Gm-Features: AclHuK8O0RVfLvv4wNWjy3TZpDm45BdNUGxoFz9O-SyvP0_8LTONh-wQ2RREB4U
Message-ID: <CAKEwX=Ox9S-hinxCQTPDiJg6ta4yjsHKLQeN079+y_A0-xPt+Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction budget-aware
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Xueyuan Chen <xueyuan.chen@vivo.com>, Barry Song <baohua@kernel.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, xueyuan.chen21@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 6:48=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (26/10/29 10:43), Sergey Senozhatsky wrote:
> [..]
> > > Hmm we'd need to collect more data in our workloads to determine, but
> > > if we can compute compactable ratio (freeable_pages / total_pages) on
> > > a per size class basis, can we just skip the size class whose ratio i=
s
> > > too bad? Would that at least cut down on the vast majority of
> > > fruitless memcpys and lock acquisitions etc?
> > >
> > > I'm always a bit hesitant to over-rely on userspace, especially when
> > > kernel has information to do something smart about it. It might not
> > > react in time, and many proactive reclaiming schemes back off under
> > > heavy memory pressure.
> >
> > Apologies for the delay.
> >
> > The thing about shrinker compaction is that it's sort of on the
> > wrong end.  It doesn't trigger compaction when memory is plentiful,
> > no matter the internal fragmentation rate, and start firing compaction
> > scans when memory pressure hits.  The problem with this is that, now
> > compaction moves objects (if can compact zspages) and releases empty
> > zspages, in parallel with potentially heavy swapping out activities,
> > which can simply allocate those released pages back.  Which seems like
> > a useless exercise and needless memcpy-s.  So I was thinking about
> > either putting it under config or just removing it (this might be a
> > harder decision).

Hmmm I suppose if the new objects belong to the fragmented size class,
then there is no point in doing defragmentation, because the new
objects will fill the holes.

If they are of different size classes though it's a win to free these
fragmented zspages and reallocate them to the size classes of the
incoming objects right?

I can't really say which is more likely without data... And it might
be workload/reclaim-behavior dependent...

(The size class check for fragmentation level to skip internal
compaction is nice here because is agnostic to distribution and
trigger points. We should land that regardless).

>
> In embedded (android/bookOS/etc.) there is a daemon, that triggers
> various zram activities.  We can wire in pool-compaction (once under
> memory pressure), which is a zram sysfs device attribute, instead
> of pondering zsmalloc with scan callbacks.

Internally we use senpai, which trigger memory reclaim when there is
no memory pressure, to reclaim cold data (which in turns trigger
zsmalloc compaction).

It still does both zswapping and zsmalloc compaction in the same
round-ish though.
