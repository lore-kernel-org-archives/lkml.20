Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEA93546F9
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791351995; cv=pass; b=eXt3onxLKXH4yF8RwR8nqihRG9XEhO7YenLa/AL9EOpuSTUe5y+ptrkD7FI0+BzEVyYL+63NTUeyE/QQFhSdtUVjzwNtFdNUtUT6LXN3Ab+YRQx85XkHuUGs7e7H8gOoDzrUyqC+c6C1o+FNHF8RqRPZKWqGdHFU5R7fRy+1MbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791351995; c=relaxed/simple;
	bh=GbvZ9DhCLr8e5YD7hO2dEW+KCs6Zdmn61FcCnoqnWXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNYUuWSVeJlRLXyzkSEdrDtgSGKkjWkdqLWJhXN3qQAjBBKlkE05hDw/OWjHrcMxZStwgEjqRPmBpRYSiok8n8tLjAHw0z5zIM71glTGp5CwYe47lNtKOhEUuR7EvLgW8E0ZKONozZcTg9toT4Un5eoKIqQYAY4b4FkvJu8HecM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HL6+Mbhy; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HL6+Mbhy"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4d870d54so917437f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791351992; cv=none;
        d=google.com; s=arc-20260327;
        b=X/dA6gRg/bfnPzoAFGbT47zg+xWJCqd4k1uLWEMqg2Khi/bberv3R2ryOc+rHkBCSD
         v9N1lYkvsCdz/GtLQMvwAAC/fyEPI74BEww82bZduydXoWyOQfFD5SZzOWSvkTTSXR7u
         YlMcjpzx3w2c9oSwRl+kDHdPn1u9dSlEtb74liorIm77dfm33AsYjZKtRhUvvs+C4ZBA
         LwKApKXQ7r+eMrtRtIz1QJ0RxFmEmlf+M+QPxHh5zUR8DGFXYJ3V2O19Cy18exYgdibs
         8o1DWnhKEHsBpKTuC84icdNCAEyUFIntecRR87g4HuqgUYsPYdBWDWLUCymzvgY/+PPl
         sVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0lICY5WSOFzmjBp3zqHxgBj253NHuaAGIzHQXH6pqh4=;
        fh=Y1c+iYyjmMY1CrV4FV6vnmu1Fes26OqeFiAtX9lT6vQ=;
        b=g+K7QJmanT3l0lXkozAlZndsrhilJrYemFstXvWQ0w1B1cneE6s0zwRWV1hzcJBvlZ
         +WGh2v4lWs3QyrTw4jdjHc4zuCJ1a8ES27hFBA9wc08QdJBYj3RB8ENlAFyLOXOSAPb3
         5R1uSQHluPqfGXr+IXDfnK8fkD3dp+fMnkxQwmGnyOUIO23w0c2ryhbxRUsfzY1LSqip
         BtQ/uB55sxJNUA83trr26qk1ZoW0ecWvQaHXoJ9dpanbbev9kF/ABAYoZ6db8soM0FE2
         flj5JXJuSPlE48nbcUmggLqelREaQDeGfzhGA4+A6ACKQI/ldFNZVom22Sv3/i36xe31
         pehw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791351992; x=1791956792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0lICY5WSOFzmjBp3zqHxgBj253NHuaAGIzHQXH6pqh4=;
        b=HL6+MbhyJ+qqOncPSNuX3xvSg27kPFjBWBwlDR5arOij/UqfnFH/h3vw2CTbXzlE7B
         QpW1XeoERj0eQEOBfXhbs8KljajIWxtc1rvwM4DdV4lnHcQS/dmReThCtE7pTooY0lLM
         aTFAXut5GBBp+UOe7U/IbhN+m2oogEuxQCI9KsO8jgQMX8mk3BesJ66Q55TAWNJl03iG
         W2XBvISpKHDhN1+fAsC9Iw9fS1vst/nl+X/xhIzQ6QCIUEg0hTgX5Y5UcCGwf3fhIpoe
         DGhzQve84jxKJKsAZm6kWgMZmwLdqPqcyita5aswb+8z1482dIoP9/RZlpoB2h4npXn9
         wl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791351992; x=1791956792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lICY5WSOFzmjBp3zqHxgBj253NHuaAGIzHQXH6pqh4=;
        b=hpE/xdWmVAYz8wSRoAxN2TSraUlKABoQYKM8OQv1VO+jJb/nJcJrXUbP2E1HZgx5Tm
         FOX5/OG8heQ8X/NDOV0/p0IK4MHXI3VRDgExRWAqy3nmj/Af+MHVvcNWZEHtgMP2lZhn
         nxl8XA+pUXjsxKR8thZhtgrPG1SvVqyFdIf5N5BtIi4Iu5iZpyjp+5UktxCDRU47/+I8
         bC0DX/feY2iAGQopf0NUsr2xJGTt3RFKd4T3ldojrh8kxgEdCJnwMq2T+pgTDfzGgxnV
         6WIzDriQL4p4aBZQy32Iae7hVZwXItsImJG1tCKbgC1Q3nHibwCxRlm8gh/5QUFhpCCW
         POjw==
X-Forwarded-Encrypted: i=1; AKwUvByBFqxd31qL2t5p4FJzx2mvhTyYKC7CDvcvFaIvV8XgGW/SN9ulhCDENjpnlmLNGuj+gjd/v85/thPsPMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWB70WaRjH0DIxeLabI7EM3SPrEJ7yuSkMTuhWB5XK02SPn3M4
	TWgUhoQMBm5yD7VBw9X/3skGiu4HqC8u/5RO0YdXfsHHOLxARDDI7AcPR7anBGMsg9T1FhjjUSu
	I0+DoUIZRvuiGIYhvJ6mSf8T7IkwGe44=
X-Gm-Gg: AYBFou3yDfgAPplJzh0wn8v/1YKRjFDi2lqC3opxWzE0yrDNyBtxV5i7MOFfPN5njO2
	zOGupfChISSQUPRBhGsg2IXmkshnEkZuD6sWSaHgdT03/OZRBggifcY6H6EXucEPHeOILa98ckP
	k77Xva9UjyDWwPtyYkhNmgnQmYvIgtVgWuQiagqs72A9kbmzWrTZSWsPz7V0+S4z9aFIXqdjYd5
	sqdJ92doOGy+vwzV04rsh9FJ67XFYX8EbxoOhlVSb2s/2q6YJRjt+rDSeoNuGINFD02WEkZVMkv
	+XBmnsBLU9qU/yGU1HH7kbA/+WglyI30I8zDnt0x5BHQnZFT6Q9lj9oI/qClyP4KbpYAiO/OioO
	8VNAXLYUk+po0
X-Received: by 2002:a05:6000:298d:10b0:48b:10c8:2181 with SMTP id
 ffacd0b85a97d-48c7276b5cbmr1543779f8f.27.1791351992147; Tue, 06 Oct 2026
 22:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006002307.2669023-1-usama.arif@linux.dev> <20261006002307.2669023-3-usama.arif@linux.dev>
In-Reply-To: <20261006002307.2669023-3-usama.arif@linux.dev>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 7 Oct 2026 07:46:21 +0200
X-Gm-Features: AclHuK-kf0wWB_PkgUsgFRdsEqx0C7L4e5ywAsWTaXOzlhXgNykWvuMnXDUaGPw
Message-ID: <CAKEwX=NgO7wZ5thKeq09swYEkoc97sUAaCo9H4QO93UQcdixng@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm: zswap: use stack requests for synchronous decompression
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, chengming.zhou@linux.dev, dsterba@suse.com, 
	hannes@cmpxchg.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	terrelln@fb.com, yosry@kernel.org, riel@surriel.com, shakeel.butt@linux.dev, 
	alex@ghiti.fr, senozhatsky@chromium.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 2:23=E2=80=AFAM Usama Arif <usama.arif@linux.dev> wr=
ote:
>
> With separate requests for compression and decompression, loads still
> serialize on the per-CPU decompression mutex. A low-priority load that
> is preempted after the codec drops its stream lock keeps holding the mute=
x
> and stalls every other load on that CPU, including higher-priority ones.
>
> Synchronous algorithms whose requests need no extra context can use an
> on-stack request, so decompress with one and take no zswap lock. All
> in-tree software compressors qualify. Asynchronous algorithms, and
> synchronous ones with request context, keep the per-CPU request and
> mutex, which is still taken before the zsmalloc read lock.
>
> Reading the per-CPU context without the mutex is safe. Since
> commit ef3c0f6cb798e ("mm: zswap: tie per-CPU acomp_ctx lifetime to the
> pool"), it is set up before its CPU comes online and is not torn down
> until the pool is destroyed. The codecs keep their own stream locks, and
> crypto_acomp_decompress() rejects on-stack requests only for
> asynchronous transforms, which never take this path.
>
> For software compressors this drops the heap request added by the
> previous patch. The on-stack request and wait take 216 bytes, which
> makes the load path about 270 bytes deeper on x86-64. Asynchronous
> algorithms pay this too.
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

LGTM!

Acked-by: Nhat Pham <nphamcs@gmail.com>

> +               ACOMP_REQUEST_ON_STACK(req, acomp_ctx->acomp);
> +               DECLARE_CRYPTO_WAIT(wait);
> +
> +               acomp_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLO=
G,
> +                                          crypto_req_done, &wait);


Lol this got me reading crypto API again.
