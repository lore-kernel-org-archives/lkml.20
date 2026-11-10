Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278663;
	b=mZ6henReawZxnsMZ+vYzqzMF9+jj0qlbSArGnEWVMoihjB0M3wsn6v8lJF3q848Ppzkq
	 wti3AvTGyIJRh9qSg1J+U5KLrMx9eqCQt/vYQJrshoOfAYHV7HX7X807BoWUXCkw0SLlm
	 K+9mtPuyv1/aWQZ+myzJyxx1BXISQlvykafX8dMuMRka3pvfIrPUuaobAiR7vZZ3Jp9Fg
	 SMEkqmuAnTVdo1LyS0A7mjVcISkG/SBYl3HEAB+9W/+6CwCpdZIBEE/LXko+LaLtPyYNs
	 T5upXe7lALLPTYMvliTRMCaOx8uRWk8vQENkZiUvzXjZBZekVJ2HsKekRi2ks3yiOlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tGrXQabJRkW1FbhmS9p0Mif8T7WdwJdeDHCgDEbxScA=;
	b=mYU02zUZ7a78N/4ITqEr9sOi/0R0ft59wYZWvdUaanF1J3EDs8UCAeEAanCuzlGZOiAj
	 gLYT9ttmkfZ1lOxN6EFIMBxi7IQ8Ty8BDgoma/01aLxkgdEYLdEZ8ZcKH+rgqDyfmxNUB
	 MHsvEngsNSnkv8CyAan9y/85yyiPwPfHOcMe+8i2TPk0XKYSlOBSw49UfM8hWlB7Lz+lo
	 z0YQ/uq2uJsfS7pDIzwZB+gwP5K34Nj+hINT5kzk6h2c0xd22y+qMHFz0b2LmM11YW4sH
	 wetglEfouZJpTY2/WrdHtRUlb1TH58mgdGbzEeOPzLJlpczXccaoxreCqxbJjF0C5TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=f1Z1EUUW;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60713606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60713606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=f1Z1EUUW
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so779891b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794278663; x=1794883463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tGrXQabJRkW1FbhmS9p0Mif8T7WdwJdeDHCgDEbxScA=;
        b=f1Z1EUUWUqIEi/1hrH681g2Lts7jDLTXirhZCgNvmRtMcVjLJOjDCTHdBYDQOdebt0
         o0ZuUHqtjeGFXwCg1dTkmXcT0uwk01YgZGwgKfMj6/FrmyYqunvhCCbaVo4spMtxZ8nd
         Xs4zJqS5psU695Q1y5o70nziSd6fD6I27srlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278663; x=1794883463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGrXQabJRkW1FbhmS9p0Mif8T7WdwJdeDHCgDEbxScA=;
        b=JsoAbhPCW2AJAaN3eKdVV+QRvFwEbnezn9zbwMvu7AJZEyjMUzDVbr6CJw22TKF4Tq
         q8XlFSTXLs5OBE1AgfXTOZvpr3/mYSelGcqu3XLanZM5jLy4Tesu3W+FWLchGdKtJUUt
         JnzBgKHIEQwy8rkGtroP0v4GW2yb32ryid69Y60/dxS0z6PeFxs4AddT4kgrTPokMoMx
         BCbL9xZMzZsqe7uz0STXpp/BDlWQYpXXN5et9KM8O0vOp/BssKuo+OZj+Znf303vRRXm
         v/h3ZC7igATBlY+l4ERMGpWfMp8k35iunuWhJzlNEDVFDqH2M6XdhTujbqua4bdUiPyg
         kI4Q==
X-Forwarded-Encrypted: i=1; AL+hErFnuI0Rm2d1xwWEGADqF03Z6sCZ5KCgDBWTsIFlynNxVwTYE12i5DDaHJXUMRixTA0eiHWZp3IZOkYwgRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JG644h+Wxq2DalbP5FwWlKN+Z6YTl4CsENOg7N7b/liXWylc5
	PtqywzbmGb6tUBOnMKPow/IlstMKB2Fha6yc41J76q0h1+ObLHM8FEnIUA4fsVqAjw==
X-Gm-Gg: AYBFou0wpXZBwTOl2ZzE5qGHU/M2HbTFgy1l1xNtd886Q4LP114q2bP/NUBk43t0NHz
	lYH+DjAyv4kaFgA1iYABFdSITG+EcCGEkYFiKKjiFU+h8yFppUxqp+bLzLhaNfLRjxOJOLsSylU
	VHB9dnll3q0Amo/4an4KlMr/txNCfQ4O1Ux0vW0OuLxgmdCLWHC6f5nXPhVln+Zxny5YOyi9yH8
	toMESX4F6VlF6sqBx9PlwbAbbdDufxyJN1lSA5T3onwz2nU0qemiRs3Bb+3jtHf79lZNYqzyqMA
	HQJGX487zfYaOnzcngSnsVN47MLDcQMaUrZuQRIlQvlH1axyosNIWHwCJz0h4r/rvAWJJ9qvSjf
	Wb+EaVsm8+1yrbxFaSq4xZVuW+mewvYYPFdPyol8+TYQCHi1yzXjQ15Fl5GAAiMrqd3HwUzotP/
	xKoHV2gDzKWvnzOfATmg38l9TWkYEc8huvyQX0Nb7Ku+eHhhGqdCErHum1b7A+rsoMVj869yILI
	RF5mjOcva/egrv5tg4M1szAy4CqCudSx41oiyCFinotmRuH9Oddb43lUGn4EwAC3sB3F6wGX0gb
	UnZGtkHYwAvX5oKcj3VOWtkyMJKCMyH1BVKIUnaRjjecE0wqoVc9yBHITJmUFlNDgmkQlQ==
X-Received: by 2002:a05:6a21:7303:b0:3eb:a104:f30a with SMTP id adf61e73a8af0-3f18e1df821mr1008561637.12.1794278662747;
        Mon, 09 Nov 2026 18:44:22 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa963bd1sm305882b3a.29.2026.11.09.18.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:44:22 -0800 (PST)
Date: Tue, 10 Nov 2026 11:44:18 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH 5/7] zsmalloc: embed struct zs_handle into zram and zswap
 entries
Message-ID: <avKE9cp35cn5pAMD@google.com>
References: <20261105044752.1997895-1-senozhatsky@chromium.org>
 <20261105044752.1997895-6-senozhatsky@chromium.org>
 <auy8-5SW9sCfCCbc@google.com>
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
In-Reply-To: <auy8-5SW9sCfCCbc@google.com>

On (26/11/05 17:30), Yosry Ahmed wrote:
> > +#ifdef CONFIG_ZSMALLOC_REBIND_HANDLE
> > +/**
> > + * zs_rebind_handle() - Rebind an allocated object to a new handle.
> > + * @pool: pool the object belongs to
> > + * @dst: unallocated destination handle (must not be on the stack)
> > + * @src: source handle that currently owns the object
> > + *
> > + * Rebinds the object from @src to @dst, updating the object header so
> > + * compaction and page migration update @dst instead of @src, and resets
> > + * @src.
> > + */
> > +void zs_rebind_handle(struct zs_pool *pool, struct zs_handle *dst,
> > +		      struct zs_handle *src)
> > +{
> > +	struct size_class *class;
> > +	struct zspage *zspage;
> > +	unsigned long obj;
> > +
> > +	if (WARN_ON_ONCE(object_is_on_stack(dst) ||
> > +			 zs_handle_is_allocated(dst) ||
> > +			 !zs_handle_is_allocated(src)))
> > +		return;
> > +
> > +	obj_class_get_and_lock(pool, src, &obj, &zspage, &class);
> > +
> > +	if (likely(!ZsHugePage(zspage))) {
> > +		struct zpdesc *zpdesc;
> > +		struct link_free *link;
> > +		unsigned int obj_idx;
> > +		unsigned long off;
> > +		void *vaddr;
> 
> I think this would be easier to read if you move the declarations to the
> top of the function, so that the different logic in the branches is more
> obvious.

Ack.
