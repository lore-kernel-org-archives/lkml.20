Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377118;
	b=GA5hY6vSIcvTcL1gQ/qdIPoljuAJvn3uSofuISNtSk/SgOl67vttanF2IkNOCszQDTKO
	 15xADgh0mViqtGyT3x4ViZ80QHXjOjMPQ8ZZwBDXxcs+azT1f93yDBoH/ToOMupkUgSlA
	 mH5Q93vWvZ4W0KPGLA10soCuhG0biRfmH1jeBoa+oXJJbxwTK10cpNpYWT58FU8Semovz
	 Uy+3TArqg0lg/jpsZyeEppKZL/XI5N1YEhmhdgcexvgGo1SG2XzfjXbkyNcHrR7jHKyBF
	 tH6a9dWAka+TJbeX7QGW8fUIIrV4uUel5B4JBrPDdN36/J/fCGAkzPO7Xt0FBcP9kyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=IM8our1qODgBYXBjuIaJFEMcF7pAsbTKhqQQH1o60eI=;
	b=ps8qEejukfVxi0IyLK+Niw2puO3m9MJfnJJCoAw7q8LICxe39sj713eZMi6i730QXrNP
	 ss+h4/SveqX8O/1/9Tv1wYtU/o3voBlvKrygN8JkGnzSze0cFzQ8XWXTcOYwN3Vpg7jA4
	 QLsHvKA493n30rvEADeNLvLqZAwkTgjD4aUUzP/iN6sfepoJlJ4EhYOsx5GrwjcwlCBtR
	 QQf1LZ1Gey7wFD7MEBhYBwiW5DzE1d0d16JwaWSjnoMKaDc8m5FIWM3+en1A0YqeI+VeV
	 rjkTHQXLWz0w1J3izvKMat2aM2uUhp2br9EaWXLKtexjihU8qV8G5yqgesgzRQd79gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BM3W0ImJ;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3855B606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3855B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BM3W0ImJ
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso1341105a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794377117; x=1794981917; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IM8our1qODgBYXBjuIaJFEMcF7pAsbTKhqQQH1o60eI=;
        b=BM3W0ImJ/AnF6hGKXgR5cMiYjO9JnWPpCmADsQJeLCubm8lklE3HbOnzULfoeBiGFD
         9UsR25vVppFKHNWEwM52J84Osd3lAfTkcFb1cxZd7AJdGNiqjHw8FjR5cj8sjbr0q6GZ
         i4ZT6VY7c4lNVVwOIYCC54Tr6eAwgM9EugRO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377117; x=1794981917;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IM8our1qODgBYXBjuIaJFEMcF7pAsbTKhqQQH1o60eI=;
        b=0Mm4fkPI/jxycBVV4wTHQXzNfCBET9vOIjUqXIHU0297Tb6W7gaSzu4FPDBCp3sH9o
         JmdObpg/tygfKXQ6avwit0dL9095FRKggkbLJMHievv6HOdrYxRJwFsnlBxUHU+jwY3o
         SK2i/1Y1b8F6h7+45Pzd+H1tIXmP2PotnMFkdWzLe2FuMgNXPHHP4wgpB2q03f2/gmVx
         /MX6ult9uJ+F1rOEUT/hqiUzz+zhuftxYkeko+1kcoXTIP8pUYByCMaQX2REk6UUUob1
         IX1qL+QtcbgeN2Qw8rjZAGpxI+mzCQj+Ntlw5PeS0tFla1ygKLSEVlHMnypnMKLQXlbo
         DvLA==
X-Forwarded-Encrypted: i=1; AL+hErFqtQwvlPRPAuVL0RdFmoWm4o5DOKu53KA2N73ENp66WogDP2euL8wvnvQwwkuHyKaB4Q3CRqKXEQObDA4=@vger.kernel.org
X-Gm-Message-State: APuU4Z80ZHE9vJAecaZy6G84KoPdZePv7DhUeNARpW2BYamh2s0BUUu1
	0pArl7RP21ekQUAG4t2wlPMqvw4hoMTnve9utQRVEkHBsqE0zJhUktr0qfD3Q2cOZw==
X-Gm-Gg: AYBFou19/wWguw7bGFFMswTd2TAIV7GfRAx9GbsD48HBzrMQjVL8y7WHh6T/wMQNz4Z
	0sUxKs2IpZhApjKKY92rUxAQjSwugjimrl2LWcs9MSjdPjE7wHAsEmVehl/iLdW4nVAxWkYU48g
	IPYeV6AQSHb3Ftt/JWC08ue1mwaKNmYxhtG0zfmvVebtH+QTb4MOnioKZutmKYPZ4X25eC6ML7P
	tHyEdt2Ng5avfY1UHIqe/GJAgI4l5k+Wt3SQ5xCqzgTVmDwqQl4b2T+Amcj1x2UENEByysmm5kS
	4joMqHHPhlHykaPWRWtxFBHloM1rKiRIbGoJynHcgQhYnOkeagbNhFgxC5TsEXPzs9o9UOLjnb3
	oy+8ug5gPfCJuhCxqenSZ06nsFlosE/SbDMxYgERSsYCt9lMxKvuwRGBYXr0fXw5/cLsyKfwqDQ
	7JzSmNvWbBpV5pv9T+tGG6wCjyEALUT0n18ikbf/edlSHEwbRJmUAenoIr98RGSH+OmTXHzt+3e
	lmcVBTtMkmK1ez/g++vg6oI445ZbZaE5yrAymq99catvNmfsyorZMaW0KiYTDaa1DK62c8S7QHy
	y8zywLoNQR/toy80csOvOANBLR8eRM4TwnfiIz7xxQrVr5U6UFBA+6aU79N7EiVl0REZuw==
X-Received: by 2002:a17:90a:e708:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3b182f26e6bmr1551048a91.25.1794377117628;
        Tue, 10 Nov 2026 22:05:17 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e313932sm2766371a91.16.2026.11.10.22.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:05:16 -0800 (PST)
Date: Wed, 11 Nov 2026 15:05:11 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Richard Chang <richardycc@google.com>, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 10/11] zsmalloc: fold zs_obj_write() into zs_store()
Message-ID: <avQFhb2EwjRkSM-a@google.com>
References: <20261110054836.1515030-1-senozhatsky@chromium.org>
 <20261110054836.1515030-11-senozhatsky@chromium.org>
 <CAKEwX=PJObB4gDPtsOWGjW6FJD4dtoz0qDu9KpK9jzP0=N=d_w@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKEwX=PJObB4gDPtsOWGjW6FJD4dtoz0qDu9KpK9jzP0=N=d_w@mail.gmail.com>

On (26/11/10 11:01), Nhat Pham wrote:
> On Mon, Nov 9, 2026 at 10:49 PM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> >
> > zram and zswap always call zs_obj_write() right after zs_malloc(), and
> > zs_obj_write() has to take pool->lock and look up object location
> > again, which zs_malloc() just did.
> >
> > Replace zs_malloc() and zs_obj_write() with one single zs_store()
> > call.
> >
> > zs_store() takes zspage read lock under class->lock, before it drops
> > class->lock to copy the data, while zs_obj_write() used to take it
> > under pool->lock.  Compaction and page migration already take zspage
> > lock under class->lock, so this follows the existing pool->lock ->
> > class->lock -> zspage->lock order.  We don't need pool->lock there,
> > zs_store() doesn't look up the object via the handle, it already has
> > the zspage from the allocation.
> 
> Oh nice, this looks like it'd save a pool lock acquisition?
> 
> That (effectively global) lock can be quite contend-y under memory
> fragmentation, etc...

Right.
