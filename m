Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278530;
	b=T7yb2uSfuom49xfxjGtPmGu40BIzyX09wWfVLMX5+iej0/z6RrSqe9Yq0xLMvWykARo6
	 gymBO4nHgX3nr8/VPRZnMqj+MkWgfn9K75KVREm2i0zhmuwcIJ8MbBFNegpVIUdM1Q+ja
	 yl/73UuSKrF8266SgsCbZ9844nRsAv2dNU48uMQo9EooYGj5KqYYvUVREpd3Jkjs8J4jd
	 8VnYtS9jcctFXrbCvBPrKbgXJLblPHTjc8TdPufL99zcsUNtWuQputrQ/42WCHFxQBgVB
	 6qofnnk33RCdoI+ztPfymmhOjd9NwJgKky4DShbz+P4bdDbIV8Qza+aLQPaCm7WYzPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9eYU/miYIaBNjo7DaB+0PRJT3BKcPjkG2A+IW4gcpts=;
	b=GVMMH/FC5shLIqibmr3AZmK1um5M757Y6Gk9sEbqppRSMyP8zCbLFgkULwBM99xsQWmq
	 5UaiM1uL3c2BKE+xsBbOyrj8xElDWuezo5wrtFdn4vQ6veUnVvHEn313STfesZtLNnJJm
	 5mlYey0TpM3DW59aJgF5ZjDNbZIdgJCTkJgQ+gNjPGUuFVTfRSP8DALuRtnhW2qBSPo2W
	 1qUvuiWKGZyOQvBz1ZWuT1FZG6QmEjHkgh21of7Jq/9ZvrNXDdrKop+89PmGlaiiLiKJ6
	 NZfZYuiMzmoa7M7KH8a9EwauZwlfW6KIGTg9zQ542c7ps0RxQSj7AWsBbLeZeHN4DYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nXJhPw5v;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C11E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C11E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nXJhPw5v
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso992249a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794278529; x=1794883329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9eYU/miYIaBNjo7DaB+0PRJT3BKcPjkG2A+IW4gcpts=;
        b=nXJhPw5vFrR9y2ePe1Z8+p6bw6mKBf+vmWebUzrfYf5b5xi7vUnxgc8Y+pOetVkuXh
         yvwe11s3VjwtRuIgXfqhpp9fgFjvsI+PCP23kCfHlyWXh6I17unK40D4ULUsZf4XkRSR
         5v32odlZieWi6bzXlQjaR+085OfHz2rW9eYhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278529; x=1794883329;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9eYU/miYIaBNjo7DaB+0PRJT3BKcPjkG2A+IW4gcpts=;
        b=FG6bUAM5UHLrXZEbOzC6bMMXMt03FXZvMVpTQtTYcnIR8kjiVqlzJtB6AmZr09aumX
         SWLwA8T4QrsYD3Iq7iFW1k8mfi4GHDz5nTuqk1HxXQCT/cScu4H4+sjNobbpjGUJM14h
         LfnrmM7Apv2QeTQ8PnI2P52opMcOHuMdnsS1G1xrVMhQH+aAqPADYcjfP4gMDyPIpFH+
         /YikjFn8b2MmBlrA/BHcA1HcOYAPcJD/Loh5YAUmxoqPOz0svv59izxoy0vIxCliTco4
         HC7RRoza82ooZXRBEv5IP/PF0ptS4Sm7hYkhR+yCmOqqzqtTNuLqMKUor8S35R7+KdA+
         kQEQ==
X-Forwarded-Encrypted: i=1; AL+hErGW8DWZsXFj5+OyA5g4/Muf5x3qLmlT8qRNvEEL1Q5B7ccIEeLeEZLb9prgTnCwW33O9msjiojG+0v6sJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sCn4UWZ+USZLlxi3wLYJSPDWknmd0ha7Y3zuNLQVDt6LF3JVw
	nToRBFmJVaoN888+mj+mgWJFKu92cKt8G2F8Ct+vt7TOuJrEYVYkvZnAl1U0h9IZ9A==
X-Gm-Gg: AYBFou1b7VUn3laMw1Gr1Otjk0OPa7V/Ov8yXBJDue63UPDrkt0xxyNFKKAa7CawbrN
	hHdMTeKAJ1OmKCEob3+OG4szchHl+PdQTJxuFTh/3tEQuQ43Umph0rVQXYDxc9x2X9s5J6lDOEL
	yUzX79H+RFnyEmGkbkotOWqHFDbIimqzmnDQLoV8cUqmHOB4JsW/sn+ya7jlOXcsOIckDaV9rtM
	JkDvLwfrLm5RqW4oe2Am0LRWi0D3RK4vBKt1FGYG8qUvHRJLSGFt4zs44fabjqROQGm7wcfBfHG
	71hm7cKGGUUN7/qLeTk3ZTyOP/X5nmwrRZH7IznI5qhl1TaLrj+dmcF1fecBxlBT6Buzjo/H13/
	sNrAXKgwQSZoRyDX9VmvZe/yq9o7u+pu9wX8IGcdS5NJaEW0B3Q3c1asX1gks0VNsfYYfSV7ijq
	P4zIsHoQt8M5RVVE1xo4RJwuTsvChDAUGg+OSXjpSTqFRRBlPTYb339T+7ZQNsxK6UGVZkPP0J5
	Z/XtgXDlkHWx22ekPZXPhde0leSZlsdV/e/tlsW6XceGNlpXNzXtVhS552ahsHTtoWUPqC9h9qq
	gb4znYl+K23FYpc6Bx2NuYD60Rwoct4ooeRWeS5W4KB4S5NZPxHIdKbDVZ0SCg6MMpznMw==
X-Received: by 2002:a17:90b:2ec7:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3b1679a3218mr887901a91.23.1794278528711;
        Mon, 09 Nov 2026 18:42:08 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16792aabfsm1836319a91.12.2026.11.09.18.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:42:08 -0800 (PST)
Date: Tue, 10 Nov 2026 11:42:04 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH 3/7] zsmalloc: switch handle type to struct zs_handle
Message-ID: <avKEXEl5-yYKFvD1@google.com>
References: <20261105044752.1997895-1-senozhatsky@chromium.org>
 <20261105044752.1997895-4-senozhatsky@chromium.org>
 <auy19VvYgb25vnFc@google.com>
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
In-Reply-To: <auy19VvYgb25vnFc@google.com>

On (26/11/05 17:03), Yosry Ahmed wrote:
[..]
> > -void zs_obj_read_sg_begin(struct zs_pool *pool, unsigned long handle,
> > +void zs_obj_read_sg_begin(struct zs_pool *pool, struct zs_handle *handle,
> >  			  struct scatterlist *sg, size_t mem_len);
> > -void zs_obj_read_sg_end(struct zs_pool *pool, unsigned long handle);
> > -void zs_obj_write(struct zs_pool *pool, unsigned long handle,
> > +void zs_obj_read_sg_end(struct zs_pool *pool, struct zs_handle *handle);
> > +void zs_obj_write(struct zs_pool *pool, struct zs_handle *handle,
> >  		  void *handle_mem, size_t mem_len);
> 
> I would squash patch 7's constification here.

Ack.

[..]
> >  static inline bool obj_allocated(struct zpdesc *zpdesc, void *obj,
> > -				 unsigned long *phandle)
> > +				 struct zs_handle **phandle)
> >  {
> >  	unsigned long handle;
> >  	struct zspage *zspage = get_zspage(zpdesc);
> > @@ -839,7 +843,7 @@ static inline bool obj_allocated(struct zpdesc *zpdesc, void *obj,
> >  		return false;
> >  
> >  	/* Clear all tags before returning the handle */
> > -	*phandle = handle & ~OBJ_TAG_MASK;
> > +	*phandle = (struct zs_handle *)(handle & ~OBJ_TAG_MASK);
> >  	return true;
> >  }
> 
> Would it be cleaerer if obj_allocated() just returned the handle here? I
> believe this can be done separately in a prep patch.

Ack.
