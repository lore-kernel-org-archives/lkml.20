Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792435147;
	b=VwEV/o4xzX6b1L8AOt6nX+tKOepzgLKXy5iQpLsxXRELmDxW3E1kIp0QZJBHoryYYVQ4
	 aKmJBGtiwQ1mM65b7fgOsSZuDsS+bsGkv5LGGjjFZo6EZhoNvB2WITPgXRB3UZoof5La7
	 EzIzVF2CN+YqqIhwCuSBynkwkqpqTm3FDGaSkxWKwxFKjLq0HR2pe7BEpYbEIyeOMYLwD
	 +BG11DLr1GPoM7EWq5IQCQQrYAow/9U+SSeFPggrGyMYk0MbisE8Gb/TsCVd11Epaxbgg
	 E+XCxBMord6bpHe6P7l50jHSaiNKz2BYGIYdoh18/SkGSMIwOwHyKMBak+d+ZXEthSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=NXAsHlihhWDzUv4op4PoVrOh/D4EzSV3+8FTcBaPXwU=;
	b=x5Bo4XmXUll+ZrWgMGD6qtYKlaBUVmVhMIbt8oQlTjGQgONemsjCfGMxSBczNechaBSq
	 kiULjyJAs4uLY27mkcy/xZyzHy48CjPtjm7Pgz7pGPpU7x1uXT5Espg5kNr1Fd7k8UR63
	 bMDWjBgGGnkhB9BpFsN06TcnG/KOZIX6Nh0L5/sLPibg3R5abIPor40+u20hqqMEi3//k
	 DOYVkKoLu05zCG1x8ODEXRdRyi0H2EDMZS4PXnai7AdJQgL/k+WXdeMygcRjMNxT+TBYb
	 UfUAxMow4cZvIZMkss6EbO1cVc2VrAruNz6cy9umLVixm5lmWmXNn/pqmZQ8LN7/4pQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IPdGDorI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61EA606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B61EA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IPdGDorI
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6faddda49e7so2259737eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792435146; cv=none;
        d=google.com; s=arc-20260327;
        b=llG3v/x3mHVdSxdQNcYum6Vppk2AnAI2+AGqeUdrMjUivERxL1IL51P7pdyDOqpGDf
         i3LLpOVB4AoToD8DEtfH1+jbkxaJlBElfqQLVr+6LjbUNeAnThPPZ5zrk4TxsLCJPeKm
         dmbyMZjOKX7OI4N7/HbEIwJa1GgUHFU+aEYGcI9FoZwxux5UZLhkeVbfbQu7h0P6qgNV
         jwKCzJ2+URMngrKKx1aT9OKVAXvcvKUMdp8qJctQHQSJa51a5sK8unrj1SzWIKQ6Zgky
         iof9MhuQ9sYohZimJtSZItSyA6rfWAV4GFgaex9sdNJchSh4PWe++CMLzbKk8Y72hy/V
         EuMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=NXAsHlihhWDzUv4op4PoVrOh/D4EzSV3+8FTcBaPXwU=;
        fh=V9AeBafJgTW96HdC48wsxGAfd7Fe9P2uAL8tLCjpUN4=;
        b=YnKJLi06yVS6ostNbRa7F0DWhqgJjk3qNcYtG5i/Po2eP2SngHQZLS7z+h4YlULXl/
         NxHRFTD1skhOre9jU9LWiOCdUKBRVqyDF9YJYMFZkKZ8kF8RTZl1d5Lk854k4bG9VDBU
         sH3Ldo4Ya2VHAkK0xIs7BhSR1GL2nssDjxFURpxi4Wvj0Pra3P+4SZtjRnoX0sOZbvT4
         l3KkwlE413WYR1o9Hk2GedUgiyPhX2/nVjiTq+FLVqYEcevA1UzE8LOVfpfn1P0uLSjL
         fGcDPFfGUQgIt39lOde6DWOcW4WDD/CKs769x3GXXK/o3IyzJo+ZvjkYxtIrUlq9JETg
         FBSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792435146; x=1793039946; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXAsHlihhWDzUv4op4PoVrOh/D4EzSV3+8FTcBaPXwU=;
        b=IPdGDorI0nUPXuxRRnUX4R2INMI8qMfk0cRb2KaKHlGzHMV7GV5iYmhKsUXAivjQuh
         Tz4iXXqWO6ULS7vOIpJ4MBwln0F0uCojt8+qCFngiX4cgkyy6nxn/WlyLmCzV5LGXrtr
         70Elj6WPS2wirbpwtBlhVG3YsVS4bc0UhRaXoZFM6M5THO0IilRqI70ds01OOd8f21F5
         rTEwDFVhrdMXLC1Q+RUZY7JmzI2DWBF7yNwO6j9OiFaw5bvkcx9tLlkPezxP1Iwu9d/o
         S0ge1YZO5WA+J5eF3FlDcvu0FucZ4pvQ5EAdK5rHKx5G/ez+Li2N/pBn87ySThoLNUn0
         da6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435146; x=1793039946;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXAsHlihhWDzUv4op4PoVrOh/D4EzSV3+8FTcBaPXwU=;
        b=DepWa4SmUhYnA+liXXQo4SH5CJKcNUyP/yFmRiYFnzIWjcHYEgh1u78I774FWEpGlD
         Gx9qtYV7LC/QDHJiii2SXnDf3sDQqxo9yMIPMhYHwiyErfkD6y3+7r1bPgS7ax8HCPjp
         gugdzeXu6iyd252cq5mnEaxhsoJOqbMuqKe+X9OrteiwtNUTEa0Eezhl/4whgJVZMuxu
         Si19s+gifhlJegdFhjxwn8e3b2oJ1SwbjDJlDNVQBfw2swq5JtpYqhJ74L72nfpHDzOF
         0ykxeCDvKbRF6OgPYgS+YhBAWzuiJRFU+2oCuqXMKDEOsl2CfPR7ff2pHQv55rBT2YZ6
         034g==
X-Gm-Message-State: AFq9FYItbUbWh4gBd/+w2j5vHXwPmzaEFlksbtG9F63jfAyYe6PPPgZM
	ZBste/Eo2LTfO9dcUii325j64QtfOMqV5Tu4Bf5vu1rXN2A4IIHz4c7LkETwvfBjgUuCrmOgX3A
	N3+Lq8G5lF/j08AXMdaSP5TufFu/nHhrZrhpgbbndHQ==
X-Gm-Gg: AYBFou1wmtp4/AKcq6WuGuPRCn+ians0ubrqgw2yQfsHqKxJppxMn3at6LtICKi3wzy
	DRflPaG0fem3yx5fXhCcSKJoqHab7E/+x0r1f8yrFlcDlByXMCa8i54ItPZf9G/U1QW3FMMStWM
	L5nMUvy1ZQnGu2JUrp1Nx0SysFkwouakqdWXWHg4TjwPZlW9GHBKBkeKWP3TmwmZNEKvmIrtgaP
	JLts9mFSrCDgwDD5QExYu1NroDZDpRyILyD3u+az4mtE0Icex7W7p6lFs/N/L3YL9P9STRwM50x
	PGFB0jUZfXn2ypfUCNjLNqM+n4j81i5du21nmtyW2zPXwwUDVBQH99ZP06uVwGthMcsfvjYhnLI
	m8tiFcI+CqSG0Og==
X-Received: by 2002:a05:6820:c0ce:20b0:6d9:4131:5037 with SMTP id
 006d021491bc7-7035659d421mr4088208eaf.45.1792435145585; Mon, 19 Oct 2026
 11:39:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019101117.54038-1-thnkslprpt@gmail.com> <20261019140519.GJ989762@ZenIV>
In-Reply-To: <20261019140519.GJ989762@ZenIV>
From: Avi Weiss <thnkslprpt@gmail.com>
Date: Mon, 19 Oct 2026 21:38:54 +0300
X-Gm-Features: AclHuK8-Bh6IMTU8zCXZkBTsPl3Glp3sHHs7p7nyhCdjGJNYOA3bFtGMnnPKELI
Message-ID: <CAKOB7-ZjYfnOrv4A8YJ0iHKso7fogOEpF4L=-Pvmoh8YxhdBJA@mail.gmail.com>
Subject: Re: [PATCH] sunrpc: instantiate rpc_pipefs dentry before publishing it
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I was thinking of, for example, an existing NFSv4 client when
rpc_pipefs is mounted later. The mount creates the dentry for
it's idmap pipe, while an owner/group lookup could queue a
legacy idmap upcall on the same pipe.

The upcall doesn't take pipefs_sb_lock, and rpc_queue_upcall()
uses d_inode() once pipe->dentry is non-NULL, even with no readers.
That seems like it could leave a window before d_make_persistent()
completes.

I think there are other ways possible as well.

On Mon, 19 Oct 2026 at 17:05, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Oct 19, 2026 at 01:11:17PM +0300, Avi Weiss wrote:
> > rpc_mkpipe_dentry() publishes pipe->dentry before
> > d_make_persistent() attaches its inode. A concurrent
> > rpc_queue_upcall() or rpc_timeout_upcall_queue() can
> > conceivably dereference the dentry while d_inode() is NULL.
>
> Details, please...  I have no objections against the reordering
> per se, but I would like to understand the scenario leading to
> such a concurrent call.
