Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278755;
	b=mKl1olaO5evyUq0FGQdeZZODzmoyGtD3ZcMoXtxw7aZjDzjzo+9lalqFzH72EfW3JPbd
	 KajSGWYIymOnUejhACm1v0fljK+crU+F54J5NH/oJki4wZ5/kPVBIPb3POPAqFVJZuibO
	 z95pRDU/+ndlKu84iGEbd1qpXVF1eCT3tPH21zEHzSJOMObSNjUYcO62tHJL+X9UebbAY
	 aA8CKRZ1dsWpqAcol1FRPpr7ZeQvC8xqEvNk1PhYnh9ytrWtA1y655nX4L+9eUtZhSk02
	 IGzIhFozeeaD8d7ZAXGahoU5Ycj2pPs9DFvdwaoPZyj8Kjm4OEXEAf6ovzyygl8cJ7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+1IT6L02h4Z0rswWeGeMVfIe5Og40SseihhMQYse9qI=;
	b=QJl/dIShaA0xgPFKX2uSljZ1VnHl0kLEtuM5GgNYaJQT6nPK1psgINJRkrvXFJ3sIbVe
	 1ts4AzXxQqhvI06OC8jAG9vTx2bOrPOnF+sbiz75sFABjMgbp5F64bNB/ylOscGNNC9fa
	 1yUydZwR0lTCOil6F/xdOX9UID3Kj0HCOwvT2VEBqENAsDQ5LU3ganlApeqf9/Lhu3v2s
	 RVYByowSPpqja0/ZHmUZ3lrAt5qdx/oBHXp9l1ORhu2b4Q2QcG9z7KcACpiQDx0bioOq/
	 8+aGMjxELEc2RUdFUzHis22L78DpynflctLqDMDK8EfLPUPLudEl4rb/yFNJkCd1FpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hqBoijwW;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28318606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28318606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hqBoijwW
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ed2bfe3252so5623455ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794278754; x=1794883554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+1IT6L02h4Z0rswWeGeMVfIe5Og40SseihhMQYse9qI=;
        b=hqBoijwWRhG9a6Nw7Vb4sOk28SgYHZThM5/xqtyQKu+zBz4WSVBqa93imIaIvTBu+w
         94VIKdj14FYUX8jOTCs813DbthJDgPF246X/NXVE58H/W0rAU6G51euWo0nU6gjq8f0h
         gqrsQlimEC1ZyWHxCO7LkqB2zrnqJCrJoQ5aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278754; x=1794883554;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1IT6L02h4Z0rswWeGeMVfIe5Og40SseihhMQYse9qI=;
        b=Dm0F3LZwkOo6rjvlGQn4JvYhhRY9eItoLsTB6X2bYk+chj/r9h1HRZtyC3S9VLWn0Z
         XB9eWdmhXNoEBTYaFIwcdQFc6qM41Xu4dc3SiaS8JrqIhmkYcnsReKCbhz/L1X2Xf6k9
         8F1bWwDIeaL4NSy8FT59jE46S0SEXD7VyH0CaxeQf7tUczYVrYiW/r6ubAG9bhm4UWXa
         nU/rViAcJS/lZi/xj/VT+8qjWK5abKltp27ZzontrLsylMj6+pG9fHDC7EQEoPnXNLOY
         ftJnYy0Zdn5Hzvx2POcJD+Anbo6olRzvkZvzwknoGt/DCrAN3gXKyfC4yca9V2wZOUqB
         oudQ==
X-Forwarded-Encrypted: i=1; AL+hErGeK0Eu/xEjPTfWuByZWhOJy7z5u3tURShV7g2KizDrOUFdlLFXfnzQQ6LHakpzBvZ5+Cf80K873MT3CbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wlGE88YeZcN6kCeM4GFeV/3HCMhmZl5I/i8GoxrEdWSWbIkg1
	YZes9VK/f3h3gzbGwRyKo1Z34AsgiiCTzLyiPxqAK8ATjulnaiq7tf3kEopkp5hpKw==
X-Gm-Gg: AYBFou0yzYY38la2FGO24hQhtQLRDNb0mdildJAEtLiDBePMiYeafB928yAxpHHlTux
	vxjs5SXL1TfpLqkBpo2pu5BAA5dIlD/kqqaKmTytCeCyQbKze+nJxxi6UO6pNOjgn21YI9q/ful
	UfnofMCO1M1j4kBsd8h6pB8zv5FPozKGHuG4uLlvTq9+5xmWpCzmMt8jOoZukHh/wsPfi2anhvj
	34V7N8fJ3NjJd3ZVbDS3Kf50FdtqpAuFObGIM0UlFWSXz6fNGtE2fFoiw4OrGVuppGmHJ+60IsW
	+8sHCkRsccj0dzwtXOQfxZlllzMozZ19ReEyoVJZNnhhuwYr58sfXfh9h6UlgKfbFxm0n/dHsO1
	6Dag72CMuIkQ6r6UwFS48VXwL6385ceVq95DF5prytpsjEyJ8KQeO2vtcHWaHdZz2zjTj0ZM/NI
	Ldu0Q835CkvsSaIZQ4mXsLZwsTh5O07zEqQFeNKqnJhE+WESQzdPK4WRVZkAIZyNUCRcBDAHuYY
	hSM61qIheqVB/UrcV7nrMJ6yV5xV2+8vLWXQxoqn444BZBa+6vIs9IwgznX3pIIQxFfNGBoZ73k
	g/TlsM+ym4Wp7SJ+ztbK572/Pyr5S5Bhqxcoa7pWehpmWpMkqQy3Gx+tBxqAgPAdKBNqPA==
X-Received: by 2002:a17:902:daca:b0:2ed:4456:fb2a with SMTP id d9443c01a7336-2edb913e57fmr10948875ad.36.1794278754561;
        Mon, 09 Nov 2026 18:45:54 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e11e9asm3619075ad.74.2026.11.09.18.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:45:54 -0800 (PST)
Date: Tue, 10 Nov 2026 11:45:49 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH 6/7] zsmalloc: fold zs_obj_write() into zs_store()
Message-ID: <avKFDz0PGwkbwNgz@google.com>
References: <20261105044752.1997895-1-senozhatsky@chromium.org>
 <20261105044752.1997895-7-senozhatsky@chromium.org>
 <auy6wQIz89NxpskT@google.com>
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
In-Reply-To: <auy6wQIz89NxpskT@google.com>

On (26/11/05 17:29), Yosry Ahmed wrote:
[..]
> >  Most of the memory allocation APIs use GFP flags to express how that
> >  memory should be allocated. The GFP acronym stands for "get free
> > diff --git a/Documentation/mm/zsmalloc.rst b/Documentation/mm/zsmalloc.rst
> > index dbb5c1a8dcc3..52eaba8f97e9 100644
> > --- a/Documentation/mm/zsmalloc.rst
> > +++ b/Documentation/mm/zsmalloc.rst
> > @@ -20,9 +20,9 @@ For simplicity, zsmalloc can only allocate objects of size up to PAGE_SIZE
> >  since this satisfies the requirements of all its current users (in the
> >  worst case, page is incompressible and is thus stored "as-is" i.e. in
> >  uncompressed form). For allocation requests larger than this size, failure
> > -is returned (see zs_malloc).
> > +is returned (see zs_store).
> >  
> > -Additionally, zs_malloc() does not return a dereferenceable pointer.
> > +Additionally, zs_store() does not return a dereferenceable pointer.
> 
> Well, it doesn't return a pointer at all now.

Ack.

[..]
> > -void zs_obj_write(struct zs_pool *pool, struct zs_handle *handle,
> > -		  void *handle_mem, size_t mem_len)
> > +static void obj_write(struct size_class *class, struct zspage *zspage,
> > +		      unsigned long obj, const void *handle_mem,
> > +		      size_t mem_len)
> 
> Should handle_mem and mem_len be renamed now?

Ack.

> Also, there's a comment in zs_page_migrate() referring to zs_obj_read/write().

Ack.

[..]
> > @@ -1318,12 +1306,16 @@ int zs_malloc(struct zs_pool *pool, struct zs_handle *handle, size_t size,
> >  	spin_lock(&class->lock);
> >  	zspage = find_get_zspage(class);
> >  	if (likely(zspage)) {
> > -		obj_malloc(pool, zspage, handle);
> > +		obj = obj_malloc(pool, zspage, handle);
> >  		/* Now move the zspage to another fullness group, if required */
> >  		fix_fullness_group(class, zspage);
> >  		class_stat_add(class, ZS_OBJS_INUSE, 1);
> > +		zspage_read_lock(zspage);
> 
> The zspage lock is now acquired under the class lock instead of the pool
> lock, this is probably fine but worth calling out explicitly in the
> changelog.

Let me take a close look.  Lockdep didn't complain, but let me look more
into it.

> > +		spin_unlock(&class->lock);
> >  
> > -		goto out;
> > +		obj_write(class, zspage, obj, src, size);
> > +		zspage_read_unlock(zspage);
> > +		return 0;
> >  	}
> >  
> >  	spin_unlock(&class->lock);
> > @@ -1332,8 +1324,14 @@ int zs_malloc(struct zs_pool *pool, struct zs_handle *handle, size_t size,
> >  	if (!zspage)
> >  		return -ENOMEM;
> >  
> > +	/*
> > +	 * New zspage is not in class->fullness_list or movable yet, so we
> > +	 * can allocate the object and copy data before taking class->lock.
> > +	 */
> > +	obj = obj_malloc(pool, zspage, handle);
> > +	obj_write(class, zspage, obj, src, size);
> > +
> >  	spin_lock(&class->lock);
> > -	obj_malloc(pool, zspage, handle);
> 
> Should moving obj_malloc() and obj_write() outside class->lock (and
> skipping zspage_read_lock()) for new zspages be split into a separate
> patch on top? AFAICT, it's a separate change from merging the
> interfaces.

Let me take a look.
