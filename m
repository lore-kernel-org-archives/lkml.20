Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372295;
	b=A45mFOPPlEtHY+dKn0piDRuW64QAQV+AtrB8n/AJjMHvlevXW+IK2Mld2Yo4zHbDRmZF
	 I8yqFsayq3E/dbcAmn1lW3ev9qFHeJyDoVFVa7sJjVQAxsV+A4sz/dDVcXv6aPqxjzFx6
	 9fQdJhbQQCd/hRfRxJ0VVawpnhCuZReVHwOOZgI9RasXEdUe5t3CDwYpYOpAgGevPfV+c
	 Ul8qnQzW0oDI6L+h4U1B+wOZk5CqmAMG+whi7VQt2MSzYTUBfOjyNC+ywZ8XD8e0BRogc
	 0wcs5b0YGKJ2m+dDKG5HGaSGYo7XACvdxaGQvoCzL72mAUDJ+gIaVWAmABmWEZMqK9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KoYYrzQCypT7hiVPNIFQ9/YTWNz1K37xLoWsOPOqb/g=;
	b=iVRU4QpTN22/2jV8Ngv8RJeESA3HtaRZvtJMTyoEoRZZyxwfVJQeZQvR65txpF6WZLmX
	 Nmpto/aylKerT5Ct5UYN3I5s2+neFm0rgXGAh+gfigZWNrT4/BFJRabJAu9kbj0dhORJK
	 J7P5/t8anVHmcHLBVWmhYN/hwt+FQ3qVgVDrEi1Pi2scIkk/4iQCEVlSLy4d8Z7MO3lwF
	 95cJa9FFeBN5kTX6BSwHb4oODZH79KGCfXEKcrsX71uGh6zZ96UyKdfJMIgJn1QjouJPf
	 JuQz3vWGmNgb3yC3sD58TTgTZTdb8Xa29L4AxV3S1U2OJU9r54UjnsZIVjQFTnMwZRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=clUU+nVL;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8B460A260C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E8B460A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=clUU+nVL
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1736379a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794372295; x=1794977095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KoYYrzQCypT7hiVPNIFQ9/YTWNz1K37xLoWsOPOqb/g=;
        b=clUU+nVLi3g78VSHR4IbHtS+EX2/WopjzD4YtK9dLlnxn8DhvsIvLE/rPMCtgiZPAD
         RMVEsb8O5AGRKTbCix4KZOgzMhE7VT/HxN2bm3cXHMtzxsj2gcadmfF12cFJrARTs8hJ
         9QD+WAU6tcuJSIQ8qOeMV0hIAmxhVD5kMKybc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794372295; x=1794977095;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KoYYrzQCypT7hiVPNIFQ9/YTWNz1K37xLoWsOPOqb/g=;
        b=mHqYEUlwQTKSFuC0q2kQo1y7liTlr0JC20eAOnXPTkN653GuR7qLkQ/UDR2SNEcF9z
         o4DT5XKCeI9gLxHEAHqhB+4VonUUJ0N4oxSIk+XGhj5JeH6v092pJN7JgyTR6kiowKO5
         pvMxDlgP6D74XJyaWtbtGSkfGatAD5kN4i8OxRcszyOfK5bpqbgRFpPeO5OEM9CWkWTD
         s0XV0Q/Bv6NUuvGC5N9uUKiYcQrslXny3yWaMt4Ymya9HrxrD5mzzJSRaXILCyshNcFI
         ICDNH610VI0G1l6UooYUM6tFWfba+WX90Imdu9OwN8LQ6oDkz9KHPTrT6xNVsAnKv7qz
         YeXQ==
X-Forwarded-Encrypted: i=1; AL+hErEWnKQixBz7AKBwEkVNHAwReN7c1XboznBiGRiPPLhWx2gbl6wn6F9Hfy9cQsblvWfi75kATPk0ugovDCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XswTmsNbrZbjakV7/7tesXo4cry9m145U9STwQQA7j8ANdkpp
	M48X3mstPH/XLUWwTvEU0CEuL1ykROnEkMo5o2jW7B/hghFU5RPeKgCIdnSje0Vp/g==
X-Gm-Gg: AYBFou343Yl5AmfzklU/aSZ8PFJeZF9DFzx+hqiQr/cf1ztsWLVzP0MHyklHNv4d9/+
	f7/SH0N7t5jrV8l9x13XnE1VfL0W1hN4MroaygfXuF6CdQrEucEIM3sS9JV5/wSRSqLNmUUS9Wc
	Crmq/wkQkiyIsT+qDAFD0vsVp29yd2Jat2on/d+qo/MWlNnGt6DggDdOs06WYmvgY9CHrZH/0EW
	tAITEYJiVNOyu+NLG9gOSjPO8BgqUtVar0K1ZIVGXNgUDVqGMwsrbaernD6ich0et9qRRJhUwbb
	r3Mg8Lz+YSM9nSHrD6ZiLsfrYxauu6yWws8tlde9A3zA43h94QlXql86LCsdN1awTVqmu2n/C5l
	x2Ya/IoniyiZ3XUjBlWYNDsirqrFS2hNn/Reb49UV2oZv662IuIHBbCQRcDDrCeNNAGqt4phsV7
	KkpuHU8QUdF5T/ppad2dxhWYQyRKikopLaXqPL+Yy2JlzJYzSlz4ppLnzqvgo/TVLXGjlg62x53
	W+zjEqK8AJYJovwwHU2OXvmprd8l4LNNBg9+Pyc4xRfLIxkNfCtvdCpDSVb1IODO/jfB2sUp7wR
	bZ+9nP3Zq6wx7++phpnB/SJ4BzNu7L5EUpRAFu3qc3Ey7Y2FaqMlbw0wzghRLGfKSsO87Q==
X-Received: by 2002:a17:90b:17c8:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3b182f1b3bamr1359541a91.58.1794372294543;
        Tue, 10 Nov 2026 20:44:54 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db5cc73sm2535622a91.10.2026.11.10.20.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:44:53 -0800 (PST)
Date: Wed, 11 Nov 2026 13:44:49 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH v2 08/11] zsmalloc: encode 1-based obj_idx so valid obj
 is never 0
Message-ID: <avPyH5Dbb0MI-JXQ@google.com>
References: <20261110054836.1515030-1-senozhatsky@chromium.org>
 <20261110054836.1515030-9-senozhatsky@chromium.org>
 <avNJ0p1v6FZ-wnQE@google.com>
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
In-Reply-To: <avNJ0p1v6FZ-wnQE@google.com>

On (26/11/10 16:44), Yosry Ahmed wrote:
[..]
> > Store obj_idx + 1 in obj, so that a valid obj is never 0, and adjust
> > ZS_MIN_ALLOC_SIZE so that the largest index still fits.  Unlike a
> > separate tag bit, this doesn't take any bits from obj.  zsmalloc did
> > the same before handles moved to handle_cachep, see
> > commit 67296874eb1c ("staging: zsmalloc: Ensure handle is never 0 on
> > success").
> > 
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > ---
> >  mm/zsmalloc.c | 19 +++++++++++++------
> >  1 file changed, 13 insertions(+), 6 deletions(-)
> > 
> > diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> > index 3a6a7253fd01..aa436df0cc4d 100644
> > --- a/mm/zsmalloc.c
> > +++ b/mm/zsmalloc.c
> > @@ -61,7 +61,8 @@
> >   * Object location (<PFN>, <obj_idx>) is encoded as
> >   * a single (unsigned long) handle value.
> >   *
> > - * Note that object index <obj_idx> starts from 0.
> > + * Note that object index <obj_idx> starts from 0, and is encoded as
> > + * <obj_idx> + 1 so that a valid encoded obj value is never 0.
> 
> Well, this may be a stupid question, but why not make obj_idx start at
> 1?

I didn't write that code!  I just resurrected 67296874eb1c! Just joking.

We use idx to calculate offset, we need it to start from 0:
	off = offset_in_page(class->size * obj_idx)
