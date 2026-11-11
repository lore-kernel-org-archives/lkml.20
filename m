Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372356;
	b=NcLTPEWzwvhBoA4u3bLZLin4YTbGxIElhKrKqwo5GrX66vaY/Pf/uK1BsHe9wk6WyHn2
	 uBGgmnJAxu1evabxdB9Q54TZSccuBH5pbcxb2VKUEH86C3Zt/TD+ijo7hfRFhaVoGpZ3S
	 PcwBn7KkTc6F8P3xkwKmvSmZ+7GF8wc6vOkb+HiA/+ZcI/ZySUNNevZBr3G4eDxGRd8RE
	 lpqORS0svxF51FppXh4yOyfqcbLUuXoMeZMa9ctUZguD0K8IlHAE2vYeqkzJJwdWGhpTz
	 Rf6q1dKHmZBB/631bvO4184DryKQGr4tIzW0sIJOFwXaEcJWiGpswNE9Ayf8RG3pJbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OxBc7udt7i3/+ft4HX8pY2dwrc5+goW7dVLwPsErWuM=;
	b=ERl+z1IVW5G2WeaH0O8tYVLzZQ8qzMtJJlixAqSyeXJmkKMixXPbqegXnI6bjBtDnHzY
	 hcD3POlC+mIBOJp57fmXfg+9ZA+1XHj4PQH/O5Ibbc6wkGZaLwpQq37jg2GX4PujM8L2b
	 VhItLasoO4OuwBy3u6tEBz25Fcir/JaxiYGAhWYpgvmwrt9iWTiWy5XlliHEpsk36m5tz
	 Xjj3iFj8kzWqy9Z4m+RAQNEsAsm6hM98eJGuj5E/DZCOxQO+EtUT7BXnsIJeTEcCHued8
	 n/4P6zyHvNXrFMueJDqRUnJrrmLQcbqDlkMBeKHDRcAfLZ0+yvdRyWxA2NdirWHPRsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JE7IFn+K;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04B760A2631
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E04B760A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JE7IFn+K
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso893142a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794372355; x=1794977155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OxBc7udt7i3/+ft4HX8pY2dwrc5+goW7dVLwPsErWuM=;
        b=JE7IFn+KaEWtBeLR1zH0AgVCQY/XnnnYAg3RElMOTH6p/ySOhguUDZY5n1s0h5ZRZk
         dqpJeaLH5weeDncpT2Y7WyOWWMoHVC7IhOHZ5tBMfa9K7rRCUffva66BeUmqnJ+2zVOy
         FJAAp5sbmAaKz3rdHWUpiQ04QDeJdm3BXDyCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794372355; x=1794977155;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OxBc7udt7i3/+ft4HX8pY2dwrc5+goW7dVLwPsErWuM=;
        b=M5ApGNQe7RmSaMfwGv59rRuoBii+/FD8NWQsnf08u4AH5pTjtxMgAK8wn6JSxo/H3M
         1I9BBXePXwaIx+Ky5G8HJ38q67wVt8dYIJQ+1tHvD0G1p4F5iaYM0GOjZSWDsUlhyxfj
         i+B5kgHH0Z+iq+onIrnhafk+XujxMxpzXGBFuBXlUbVsXAKGMVHjvxgfGmZUPg4VpHaI
         85YW+V1zqQC5MyHDVNvnbrmMjWtZguW7bbQdL+KS8KwrlWSPC29u9Esz8RvkslErgkpC
         WiROKGsJMR95T1LsAFEq0s/rMa8a1V3/fm1I/2eSflHlTzPLRFXjUkKUGU2KYVOCbAb3
         RLoQ==
X-Forwarded-Encrypted: i=1; AL+hErEpFL7pJsqq8/6/4pMB0khBXGwiGwacySk5/xkN3EYPg9iplsqN9aihipwq++19J9QLHmDPGPff+mfRNi4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xJlWAQAe9mRv3avofsmislkynrwIV6UyX0RLxOUm/s/U4ZP9B
	dd8uY4cXgC7aFCTrgXiET8qk4YpkfxH5pPhC3C1vfM/ZXTSH414e9ODOl982CTJXDQ==
X-Gm-Gg: AYBFou2Mc68pvUV22k5kUGY7DcP+S962NpGGJkaF0ebq2MflNd1omUaZ2Hu2nE/2TlY
	r0j9YPaGaynSEhR2Q8gdXl2RNlKRSpM6Wy86BprG3qMY7h9c4kvUekhKHpNoBDPOg+YeG3zrIw6
	6RWer+xXPy1l7xwcSbPPZoiyVk/qTWtFGsDdQvkGWdub1wrRgnSZ6bnqSiOzkG4ZQz27sl2/ZSa
	a43hfZxiVlWsgY4O7WPwVW1j2FUZlY1jRA6tUvkzCmkKhE+URVXYUEVAJGOI5P9hasvsiEaod4b
	vfNhntH1wCltFh/V3SU8ciLjQtXTmUgUoQnHYpO2Dn2ip5qgp58vzrhfJqVMuCRpNpL1bm1aVUx
	qdgrDEn58ByjCIgnKh1iuH0WmpI9/RJ7ZxqHQsCQaf4Wxuubi8ik+oXMSudjhnFZ3mIK6H+gqln
	vkJnPQoBUGB9p5451LrIDhPQfqXxmf25NFd4gnofrplltXtZ/waoA+fETWP6DALGpaztky9erS+
	IqbrIGU9VVIxlSTHuU6yklls0RyugAm354mt7dV7QiHtQ8jb9FJfuPKoMn6zKXZL+ASXX4qaaLR
	hqLfDW2SOhaihQdyZAXb0PbI/XsuXID4dZf706O52LATo63nFkA3UD/dcw/FWEMMqIXPM8IQ6Ud
	G5Brx0rUdI1ZskW8=
X-Received: by 2002:a17:90b:534e:b0:3ac:8dfe:8ec9 with SMTP id 98e67ed59e1d1-3b182f63112mr1181106a91.47.1794372355253;
        Tue, 10 Nov 2026 20:45:55 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db85a9bsm2707226a91.14.2026.11.10.20.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:45:54 -0800 (PST)
Date: Wed, 11 Nov 2026 13:45:51 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Richard Chang <richardycc@google.com>, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 08/11] zsmalloc: encode 1-based obj_idx so valid obj
 is never 0
Message-ID: <avPy0QUkvtzNy8aA@google.com>
References: <20261110054836.1515030-1-senozhatsky@chromium.org>
 <20261110054836.1515030-9-senozhatsky@chromium.org>
 <CAKEwX=OhvH80f-6emK0fBhbm2d4Er0rQ8oXX=FmfG0vrTdvZdA@mail.gmail.com>
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
In-Reply-To: <CAKEwX=OhvH80f-6emK0fBhbm2d4Er0rQ8oXX=FmfG0vrTdvZdA@mail.gmail.com>

On (26/11/10 10:57), Nhat Pham wrote:
> > The next patch embeds struct zs_handle into zram and zswap entries,
> > and a handle is considered allocated when its obj is not 0.  But obj
> > can be 0: object 0 of a zspage whose first page is PFN 0 encodes to
> > 0, and some platforms do give PFN 0 to the page allocator.
> >
> > Store obj_idx + 1 in obj, so that a valid obj is never 0, and adjust
> > ZS_MIN_ALLOC_SIZE so that the largest index still fits.  Unlike a
> > separate tag bit, this doesn't take any bits from obj.  zsmalloc did
> > the same before handles moved to handle_cachep, see
> > commit 67296874eb1c ("staging: zsmalloc: Ensure handle is never 0 on
> > success").
> >
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> Bit convoluted, I assume the this is so that we can use obj's 0 value
> to mark unallocated state?

Correct, 0 is for zs_handle_is_allocated().
