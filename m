Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB53383C96
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280352; cv=none; b=u4Fskf506ILdjXq3NWL9qxNid9Y6yeUqD2BwRwpXlkvnql8lBD8F676QDrw8bolXdsq71q+3yoDxqisfOJEKNSZCC579Xi4l6BiCq/+R4HZMF7bwxCLx4nmNDTQQXxqDxopRAn2Q+aGlcgdjMfzIlTynnEsOd5KBVtxITIy8L+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280352; c=relaxed/simple;
	bh=6ukBLZgdFyu+EFv7T2p+uZ1RLGqqruEuiJOXJsGXooM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqeAgxZzr8LnPDTcmbNzuYFzIIM3TeMh9Ya3uDDuBI6vt3epiQIVBpurTMs0yxBHNOBQ7E+Uu7yznNNx9DeofuEWzqpvhiZxtlTzSEizYfoNboGx2DOX6YxUEjMhBVCXXxQWYXZPQHKPFXjVESo+N9nfH5fsU41jwUCJVlU5icU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R904BJON; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R904BJON"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-887fb6c0ad1so834490b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791280350; x=1791885150; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fg4heyaNVw7VYP4ZPvHMypbYfuDwCofB/Hw02l9JTQk=;
        b=R904BJONig7+7mUHEzmZWdiNMguXiM4ZmfjaeEjvPqJp8fLzaEIzZ9eWRf0qCmjRkr
         GXu0RqEcTLhxwtzqvmfb2Sh/vlFNiuA+FFJEo10Guj+qC3zldAkj23ggBTh4ZKTUtCFI
         8KNoUA1obAYiJzlXhWMm9qkcodlrCIa9cuW1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280350; x=1791885150;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fg4heyaNVw7VYP4ZPvHMypbYfuDwCofB/Hw02l9JTQk=;
        b=AmqWCApzD4KkCSEMw6x+BFdBF2h+YCR6wN1G5Ng7eSwwCX6oFJ+DkE9sotZbW4SO33
         AbQZuD7fmQK0heUPM+lsDDuuTdKqFxlgVJHX7gzjZXvBSWEb5mWRT3r6X8/ONijKdGGa
         +6yhH6RYfCgWIjvh8dpH01rrr4OZdDITAB6E2tEY4o6zUpjAorjHC2s9FRZ+4U0LTDT+
         2q03wbM8tIZLZlMhIBHyZGhBTYYO5FWcY4Oakz7MW4Qj+Qva6qJ5fN2cjgvlb1vhET4k
         oYzCv76KEe9ULAIAbPltzRsX24tmZyrFAHZkxmljuSLn2P7LMP+JcqX2hSvX+VEDG08n
         iY2Q==
X-Forwarded-Encrypted: i=1; AKwUvByie5AQRB+HYA0ynHrPs1hqDh8AuHjKV4pAAS7dxdeyHBt/MHkPqXkgY62wK5AThKL+LzOs8MtooGiPXKk=@vger.kernel.org
X-Gm-Message-State: AFuF++lCscr6AV6Lqpv8IQ311EktstixheSrWbDLjigE2qVlV0tGPrJT
	u0Ze/AszbTBp9wW9LOCZLkkSGSK4UyPAxBZDr8opEXgpOLkezqcFUmDTPexonQsElA==
X-Gm-Gg: AYBFou2lutt3TJZct2QQtQ9bDjf0jrS0x7xT3cMmBd3l/qg2rb678+7GulH+N76dkd0
	9Mte2z3opW3Z/795cGTEfL5qmGlR3bxqCelgPfq8S3Oo9HqKKDjEGDN+EwznS33m9Q6m0iCGdz5
	dPNVst2+RD2z5ucCCuQ+Blb4RHShy66SqiYX/WC8PxRQzB+ulbgbk9JYdJXes00AF0RIxVUoQko
	/upnQZL3r7vjWKeI3aGoEUhCbf9YJPEdVlvrP2d6o7HzZqn7PBqcxqzFVB/Avc4kVfEbGI3XlB3
	fRyiOHLNUDirW1vKZfPdWpQIjhZrORgZDq7Hu/aDkwOcmBGjeorwk4DTr4icsxr7r8QXpRMtU6l
	WlicAznfkIitgbPs7q36+UfLkPDlTvLKaJyBWuDuPUuA3+gAYuHm/hAFFUsNggoQA559R/+GKKX
	NhQBnaubxKs+3NNTG0z2at05GsQGJhvynRUdMOhkqncPpJdFGO/OfvFEPeR8gL3YPIpf6Dxa8BB
	vK4L9GVnreLzXKaMRBVfG/RjSEfjjVPDbP/2sk=
X-Received: by 2002:a05:6a00:27aa:b0:88d:284b:6ef3 with SMTP id d2e1a72fcca58-890e027488fmr698552b3a.58.1791280350355;
        Tue, 06 Oct 2026 02:52:30 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:ed0f:30a2:6c81:a58e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4523788b3a.53.2026.10.06.02.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:52:29 -0700 (PDT)
Date: Tue, 6 Oct 2026 18:52:24 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Usama Arif <usama.arif@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, chengming.zhou@linux.dev, dsterba@suse.com, hannes@cmpxchg.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, terrelln@fb.com, yosry@kernel.org, 
	riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, senozhatsky@chromium.org, 
	kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm: zswap: use separate compression and
 decompression requests
Message-ID: <asTEwVNe97_m0Iui@google.com>
References: <20261006002307.2669023-1-usama.arif@linux.dev>
 <20261006002307.2669023-2-usama.arif@linux.dev>
 <CAKEwX=O=QNWUCTn9kcCwu9V3pTrSwTj8SMCMS6Z-8fwhGjrkdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKEwX=O=QNWUCTn9kcCwu9V3pTrSwTj8SMCMS6Z-8fwhGjrkdA@mail.gmail.com>

On (26/10/06 11:47), Nhat Pham wrote:
> On Tue, Oct 6, 2026 at 2:23 AM Usama Arif <usama.arif@linux.dev> wrote:
> >
> > Stores and loads serialize on the same per-CPU acomp request and mutex.
> > A low-priority store can be preempted as soon as the compressor drops
> > its stream lock, while it still holds the mutex. A higher-priority load
> > on that CPU then waits until the store runs again, which can take a
> > long time when other tasks are runnable.
> >
> > Give compression and decompression their own request, completion wait
> > and mutex. Since commit e2c3b6b21c77f ("mm: zswap: use SG list
> > decompression APIs from zsmalloc"), the per-CPU buffer is only used for
> > compression. The two requests can share the per-CPU transform: no
> > in-tree implementation modifies transform state while (de)compressing,
> > and shared codec state has its own locking. Loads can still wait for
> > each other on the decompression mutex, and stores still serialize on
> > the compression mutex.
> >
> > This follows the proposal from Sergey Senozhatsky for the same split
> > for zram [1].
> 
> Thanks, zram peeps :P

:D
