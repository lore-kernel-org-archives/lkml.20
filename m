Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238190;
	b=unO0WKlVTI+Pfzyk2coF62Jw/b1fdhX7oIBebDUaMD+IrPLAn6rllYctkDgBxeEG5OMe
	 PrN2cQybtZVGb/p2q/lv3ohEP3g6mCK7fjA+OpFGcobPPSvuy57eWqGM7ciM7le5fO7xh
	 cBKGqmChG68BfPnf57XDcpual9DzofUoYr7rikNngUNFTZP4BtuGldlhbZrGFdaEPjsmk
	 cvHhKtqfYPoqfkbgHrrhvXPcSjcte6Vzblf835kXKSvOT0N5uxsFQHibknxb71DTQQ7oY
	 BmsvvDclblevaSzLtI5WZlY3itqjJoK8zTZDk0drUa6elQXl/2v84lY+sYcp8lqn9Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jnYP2KN7r5kNXfdZbVQA/CFCZuIizGMEZVIhbQvzn8A=;
	b=32R99jrr9ufD5gS1cwT3zzbzXQBVfks8paZIYVGnL0RRee1VSjRob8RahS4QrjwdRDW8
	 cIB2/IVMmSAOTAdecrQ/1v4CxUvQk7F6zGtJOWe/GKTFBVYo75xfNsU2MMneiQnr1NWnB
	 BN/IF+bJvDV+VsVDFtUXBYf8qLVtNUoRquBsZXkD24Gm7+QZ3UTn00I4mRbE5pI3j4NzC
	 VdZ/yw9CUn0I9M1/0oIZTWgU371ZNEDWeh1NJQEIvKfDZRcqitC/9/SbEViW/oz+oWIek
	 78lRSIf6HtgRuvGuWzZBm42y3wNByiq5PMWrNeNoMRwFWfjCcrxp/rdWlzAaZ/3Kdqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="k+KAGS/+";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BFD606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86BFD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k+KAGS/+
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535a54bed9so2356605eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793238188; x=1793842988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jnYP2KN7r5kNXfdZbVQA/CFCZuIizGMEZVIhbQvzn8A=;
        b=k+KAGS/+YCeYtPpXvNoO1JmPUNiqxrxre58pV9UUuOwBsM9tFxyMAhUD1XIvcVlBjf
         xSuVRWpoA3MlYIys0Zjz91o0De8I2eSwXbXwYVlMRvRVJz9o97jYOx66iFmrbo0DLfz6
         2VDj78jg8f2uh2QJIwiXx7/0IBj+m+Fy8mXQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793238188; x=1793842988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jnYP2KN7r5kNXfdZbVQA/CFCZuIizGMEZVIhbQvzn8A=;
        b=cTRefJB+VKTDXW7QziBb7/UesgsZYGM29Slas3hJCVhVvf8Omz4BGVGTF43lUO2Wp6
         PTAoPU7hwXHbDc4bptbfAGk72DQRWCGrViGMoLH5+nFM/UmXxpv8N0h6Yq0qwLcP7MGe
         GHJcbSbPrord3AMqimhVo7rMD7DJNGnrd7bnUiOa82H3ucul4I1nJsTB9ExdL36sihGA
         g3GC20tFIU2ZZV/f6qQwigeJ0yM5fRXebHTSpODgD2RUKl5FeHeKTFxtk++dN9x2KxrQ
         FVyWfHJCwSTIp71k/P1MLW3UNFW5oSgNZUpUvEneecEwDRLkm4efAH1HIefb8BknjXdr
         oGfg==
X-Forwarded-Encrypted: i=1; AKwUvBwA6dYje5IOYYXwGLbmixVq/cxaThXYKmFtqkAE0XGLv5L4QiFmpX9oG2VqclkK1LXs75mVPl7RR/VTxmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrPCLoT0bUF7Szk8Jf3B/xPvA5SqT6uaKR8Ru6MvtVsmX/QZG2
	W9wA+wsmLjKD7O/CDsoLu9DaSx4xmkraqTjkf+8Fk7495p00chUD9o40cBGQDK+5KvOtbJdximk
	clU8=
X-Gm-Gg: AYBFou0ybs3rWrpDg8nH46SLAAZG/ZgldcdavwnCaX5EglPXlse4TeTTuUhsTuiZz9v
	+PiQhpjhhGkl89sKC6DmGFQWQiRL79hB8Vr7SKwmqwyuaezZ2kFJBgU98ey+gRsyG0Ao0+b3NVH
	DnEuZgvDtrhyOb7BY+EWXGof7QZbyrR9tGFy1h4CL6Qe7eRvncsU+92UlLnJAyY4bgtWGDTE9lo
	nnvJCZCsLJkd0cTDmqXHL6HMKRMvJ2ZJpcaA5pBVBB6uYxsCFMSfgQZSCLGxCReWTYWCFuz96m9
	bWj0CDjZWP6enH9IAt/T+m/TxUPJ+pkDSyl1Bfq1RZEudJkXN/AIZXnPtHCq6Hd9kGkvDXC/5ug
	Bz5+C8ROr3lXHjn5rkmmAVcm2FATCmP8haXJvD8gDdKi6kNCFpuO5Lhj3DN/d/AGQd/Dr+SRC6Q
	ho+Pq+ZDk/jtiUvXksIV9yqTEuum/o8qmKiJ+REig1Y6blx17cY1C33jFzu8Io0lGuQ4Q7whJBk
	ynNxZUVtHXjOFOyBZ+3t7uISaRayLSu4EMmW8WDDneyZcy/8+kzqwxm5sf24MGH7SjZpqGSSC6y
	JIHA3tF9VtWU3r5slHDossA4c1ntqtgfvPSIsEQ3zMOgKjlgaXA5kFbtSAW+kDPgitHOOg==
X-Received: by 2002:a05:693c:88d7:10b0:369:f2d6:4108 with SMTP id 5a478bee46e88-36a203945dfmr5136005eec.10.1793238188408;
        Wed, 28 Oct 2026 18:43:08 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:f72e:e03e:c64e:b5b3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239bf999sm11997202eec.28.2026.10.28.18.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:43:07 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:43:04 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Xueyuan Chen <xueyuan.chen@vivo.com>, Barry Song <baohua@kernel.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	xueyuan.chen21@gmail.com
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction
 budget-aware
Message-ID: <auKjuiRxQwtsZF_0@google.com>
References: <cover.1786003779.git.xueyuan.chen@vivo.com>
 <anVWZVOt-xeD0dMH@google.com>
 <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>

On (26/08/07 09:25), Nhat Pham wrote:
> > On (26/08/07 18:57), Xueyuan Chen wrote:
> > > Hi Sergey,
> > >
> > > Here is some additional data:
> > >
> > > I used the following definitions:
> > >   compactable ratio = freeable_pages / total_pages
> > >   memory reclaimed  = pages_freed * PAGE_SIZE
> > >
> > > freeable_pages is the estimate before compaction, based on the same
> > > calculation as zs_shrinker_count(), while pages_freed is the actual
> > > number of backing pages released.
> > >
> > > There were 264 callbacks in the trace:
> > >   callback elapsed time:
> > >     median:    5.77 ms
> > >     p95:      55.82 ms
> > >     maximum: 271.36 ms
> > >
> > >   compactable ratio before compaction:
> > >     median:   0.32%
> > >     p95:      2.86%
> > >     maximum:  8.33%
> > >
> > >   memory reclaimed per callback:
> > >     median:    3.80 MiB
> > >     p95:      30.45 MiB
> > >     maximum:  92.73 MiB
> > >
> > > The longest callback took 271.36 ms. Its compactable ratio was 3.25%,
> > > and it released 7,650 pages, or about 29.88 MiB.
> > >
> > > There was also a 241.91 ms callback (with 30 schedule-outs) with a
> > > compactable ratio of 0.44%. It released 1,019 pages, or about
> > > 3.98 MiB.
> > >
> > > Based on this data, it seems better to remove the shrinker.
> > >
> > > Would you prefer that I change v2 to remove the zsmalloc shrinker
> > > callbacks directly?
> >
> > Let's bring in heavy artillery to this discussion, in addition to Andrew
> > and Minchan, adding Nhat, Yosry, Barry, Johannes, Brian (random order).
> >
> > Folks, I'm bullish on removal of zsmalloc shrinker callbacks.
> > I don't think those buy us much apart from memcpy-s and lock
> > contention.  Systems that want to compact zsmalloc have a sysfs
> > knob (and API) to do so (based on zram mm_stat numbers).
> 
> Hmm we'd need to collect more data in our workloads to determine, but
> if we can compute compactable ratio (freeable_pages / total_pages) on
> a per size class basis, can we just skip the size class whose ratio is
> too bad? Would that at least cut down on the vast majority of
> fruitless memcpys and lock acquisitions etc?
> 
> I'm always a bit hesitant to over-rely on userspace, especially when
> kernel has information to do something smart about it. It might not
> react in time, and many proactive reclaiming schemes back off under
> heavy memory pressure.

Apologies for the delay.

The thing about shrinker compaction is that it's sort of on the
wrong end.  It doesn't trigger compaction when memory is plentiful,
no matter the internal fragmentation rate, and start firing compaction
scans when memory pressure hits.  The problem with this is that, now
compaction moves objects (if can compact zspages) and releases empty
zspages, in parallel with potentially heavy swapping out activities,
which can simply allocate those released pages back.  Which seems like
a useless exercise and needless memcpy-s.  So I was thinking about
either putting it under config or just removing it (this might be a
harder decision).
