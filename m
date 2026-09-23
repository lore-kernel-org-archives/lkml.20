Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FDA3A5E89
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197330; cv=pass; b=oe2YcCiax/uKZGwcwarpFxcGa+23Wy4G5qIDwVybLwnsx+SLJAlOChCx4VtgBA8v+bK7nHWGQaUZQmrAfrvWuMBlvQwG9QbgHmhOIZ7MWLaqIHJtd7sW2cOFLlJODz4bOHXd4jcuv791xejZcP1Bz07xT2NyoCY0GZkdrbfAwJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197330; c=relaxed/simple;
	bh=/ivY9I/EG9+DSzOaxxM5obfKFkrp4hNLEWa7/4iEB2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7Tz6WF6Q2SVr3ypMRINF7t+sCjzL1a6z+7wzt2gKI1US+DWdaRsq4eIxi829o4aY4D1vq1KGe5vsB4XsCLmSyVnGafNnFXlITF/fSzZ45cGRiHb2H5dJkGIDCdVWiubO7CT1PNXJyJqqyLVqxwA6I3+25FYTQ9g6FgHLURJk6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iVa9EvIM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=n/CmEFhY; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iVa9EvIM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="n/CmEFhY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790197326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=teMaf0NJPbuhvSvBaJzyDInJb+MTYgx/6C4I8crlQU8=;
	b=iVa9EvIMSOmnDA9b474bHGTgWhK9mWBlyGQKdZQE95Fl4XI9BIsnvggctghhWj+sy7pem6
	xGGy6iqdWcoKa7a0a2pYuF0GR1vTCxs9at+pTfTjxCJfE3MLhup9MRqLB8NNYBVVzD2C09
	JFu3I0BtsFSnHHXt4+KQDU6TfjFWhyU=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-Fx-nfXRpNXWp0ja7GQiEdg-1; Wed, 23 Sep 2026 17:02:05 -0400
X-MC-Unique: Fx-nfXRpNXWp0ja7GQiEdg-1
X-Mimecast-MFC-AGG-ID: Fx-nfXRpNXWp0ja7GQiEdg_1790197324
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-671562ddec3so2239729d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:02:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790197324; cv=none;
        d=google.com; s=arc-20260327;
        b=j/43HUjk57MnN6H05ebt0/4WjHlcb2Yfjvp1HkvONKb4mPU4PVd3sRYzNeKf+eDMuq
         5kT5vN148jU+uafNvYLrR8XZvYKo8fFl5nz7JPWLPpkrCm4JBg3xo/Edy9kJnCfUipFx
         vSSiOzYdaM9/ZVh2jiGRsVHmzrXP1oo7Q2cay6WKByF9oel6YzMdaUuGJPjCwQjLUw8E
         JiJEZk+dfkFRphOrSU2p8xewnZ+HFVyrhpyQ/w9C5nB5hYUbxoU/3py7r3VbPoIt9laG
         mH7afyu3Vbp55ckci36AmEkfJM2KQeWpN/Py/oEE1hlHKDqSaC71pgLYvI4M1HYONbtf
         edbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=teMaf0NJPbuhvSvBaJzyDInJb+MTYgx/6C4I8crlQU8=;
        fh=77v8FQurpmA8baDcjFuoMqdF4C31i4oVUR6T/HwWiuI=;
        b=SPnU+b6W1HFWTR12QECNYAvRfMNFZZae6kXXmnp+BT/RJZvAVBtbgC6IFV48BtE8/j
         WK7CLRKCccHUIQ8QHIHubQZNgGlDMX5zVRuq6r9Q/nrKVnuiyyH1veYXWQReHcuiN4Hi
         NaoCfGViakt7N+Oxd31T4SHuq0MGrw70kN6VQlz2VAiDQ9dBcOHDQva3xPKjplxp/93U
         ZEjoSkCmU5PfMhaDyQdqmPoBK+IJV24I4L/Z3e24/g9PoyN5niLIRw3EjMWEstUXIuEl
         m5ymQYjT6qjvIcq8mpMuZtvTEbrCmqxYyw92BI83fIlfwE8rUgjmdYit1uKxmbhB6lai
         g6aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790197324; x=1790802124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=teMaf0NJPbuhvSvBaJzyDInJb+MTYgx/6C4I8crlQU8=;
        b=n/CmEFhYAJ6MW3O+wjQ17UzxqlCJ10jJz3Ge87DPMfsz+JewaXJ8mpe/bCrYblQt08
         AxEhkb5gsvAtL2gCZtzLKhAyvPkNDudpQh3h9nLMGOEldlf+KJYpfBQ0+CMP7/vyGGQH
         wsACfNLDGYY8fZLifo93OyIoYkXJIOr+ehjCzjCweIAi3uLpauw0oka1mxr2sJYITdAl
         02jWqtjWwa9MCGZFN39Wws+eKs8UhSzxeEBXPb5lN7HX6Mok71MujcLawfSktjCc97WP
         /8ZX+zot8DTfhFEszQJ+YuFMSmVn9thpkumAwZS8uTlZc2uEmVHsRC9HW5HZHljDGlS7
         bTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197324; x=1790802124;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=teMaf0NJPbuhvSvBaJzyDInJb+MTYgx/6C4I8crlQU8=;
        b=0Xg4h4If+v9/drNDNzLYlhIogkdsulsFvVvPoVQ0Wi764SZNJiDc1BUaffxl8Akx5s
         nOyB2OUmHEITKlZZF3JYeLrl6CZSiXg367cUm4gM7HoW6vuSGNw2GQUasV9wj7N4j6lB
         jd9RwjULArSNi2QJA5qM61Ssh0a5+G+Zh3iG3Z7Kfnt3YjAX7NotUcv9DmLstwwuyzDP
         L9vWQcnSdjMzIBlucivWuMKELAV2Kmx7DRXs1WsETX533dxBPYUjajZiohl5yXcqrEaP
         1EcIWFnqONg8WyEwmpk1OB4rOuk5izxZw59losLVB7VaHg9feaFMheuqY5r65TAV8blT
         quTw==
X-Forwarded-Encrypted: i=1; AKwUvBxjqynrZMu5yqgkyUtCYNWtYk8ep/+npgO7j2zffi9N5DOiXry6dKc3XPkvGgpuTYRiNl7OGDgEgokKcwI=@vger.kernel.org
X-Gm-Message-State: AFuF++mt5vc/YPdT6ljIIFEaQ9WbWanBL2wxZ9XnPly4P1Hu9xwEh/vz
	DjGERFzJ7hSWdqPyWpmxrDQmxn3tMwt9Rbqv/NLmsQMLie8E26XfuKDVwJYP41ejJxOYP3oBTvf
	fQBzuGLkiBnlZOPrsYWnv5Lzk/gfPTKXvIGPTx7U0tS/dfVPRDTJiDEF/uNLf0oUYqDEgKK0RTh
	GLhPpbVPBq0nXPYLNuNkB9XUHlb5aconVAtj6eRTSn
X-Gm-Gg: AYBFou05bYYgGXkzMqhsr5oib/9c6onWx4PxfN7tnLqxM9/V/cdHTOAVHUeKQxubBrD
	4pHwBEcAs13DhTiERQap3HIeB1ZTmuQMjJOgzvwn4rUtnAiJxCWr7UYMLJu4nWEPTbDTPWooKss
	86/FAZ5EjMud/OPZZHihDsYNo2Wcgf70vq0/kQ/LlHku5ug6H9jqkA3Ju5aU5J0IhhSN8+qtOXl
	DYpVFzyJ64brtu1cMSR1ErDalla1VayX5Azwe7ZtLOP8A==
X-Received: by 2002:a05:690e:408b:b0:671:70d1:d6d4 with SMTP id 956f58d0204a3-672ed8e80c4mr293365d50.70.1790197324204;
        Wed, 23 Sep 2026 14:02:04 -0700 (PDT)
X-Received: by 2002:a05:690e:408b:b0:671:70d1:d6d4 with SMTP id
 956f58d0204a3-672ed8e80c4mr293294d50.70.1790197323555; Wed, 23 Sep 2026
 14:02:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921211712.1563575-1-agruenba@redhat.com> <rhj2uhowkjekxgi7tkxko5odxw3zikthtnlef5f5owrfjzrt3r@nul7b7ldcb2g>
In-Reply-To: <rhj2uhowkjekxgi7tkxko5odxw3zikthtnlef5f5owrfjzrt3r@nul7b7ldcb2g>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 23 Sep 2026 23:01:52 +0200
X-Gm-Features: AcwNN1Wx3An96hJa8GxLoJV99l3BMwVJSGq56GeWtJeaT0vWl86MXKjtrRWGLfo
Message-ID: <CAHc6FU4Rf9-r8m8SSb=e0k0zyoFhQAdjupHMWvT6rStBshntug@mail.gmail.com>
Subject: Re: [PATCH] fs/gfs2: prevent premature evict in prune_icache_sb
To: Jan Kara <jack@suse.cz>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Matthew Wilcox <willy@infradead.org>, gfs2@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jan,

On Tue, Sep 22, 2026 at 1:22=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
> Hello Andreas!
>
> On Mon 21-09-26 23:17:11, Andreas Gruenbacher wrote:
> > Introduce a new I_NOPRUNE i_state flag for preventing prune_icache_sb()
> > from pruning specific inodes.
> >
> > prune_icache_sb() prunes clean inodes under memory pressure ("direct
> > reclaim").  An inode is considered clean when none of the i_state flags
> > are set; the assumption is that evicting inodes that don't have any
> > i_state flags set will be fairly cheap.
> >
> > Unfortunately, on gfs2, inodes can be clean in the sense that they won'=
t
> > require writing back to disk, but they may still have outstanding
> > revokes (as indicated by the GLF_LFLUSH inode glock flag).  To evict on=
e
> > of those inodes, those outstanding revokes need to be written out first=
.
> >
> > This requires flushing the log, which is already an expensive operation=
.
> > When in data=3Dordered mode, all the ordered data needs to be written o=
ut
> > before the log can be flushed, which makes things even worse.
> >
> > As previously discussed [*], we are currently also running into the
> > following warning in iomap_writepages() when flushing ordered data:
> >
> >     /*
> >      * Writeback from reclaim context should never happen except in the=
 case
> >      * of a VM regression so warn about it and refuse to write the data=
.
> >      */
> >     if (WARN_ON_ONCE((current->flags & (PF_MEMALLOC | PF_KSWAPD)) =3D=
=3D
> >                     PF_MEMALLOC))
> >             return -EIO;
> >
> > So we need to prevent prune_icache_sb() from evicting inodes that have
> > any outstanding revokes.  This patch achieves that by introducing a new
> > I_NOPRUNE i_state flag.  When that new flag (or any other flag) is set,
> > prune_icache_sb() will skip those inodes.
> >
> > In the filesystem code, we set and clear the I_NOPRUNE flag in sync wit=
h
> > the GLF_LFLUSH inode glock flag.
> >
> > An alternative approach might be to allow filesystems to refuse evictin=
g
> > inodes that prune_icache_sb() has already selected.  This could be
> > achieved by changing the ->evict_inode super operation to return a
> > lru_status code or similar.  prune_icache_sb() would then have to
> > resurrect inodes that were already marked I_FREEING and put them back
> > onto the lru list.  This approach doesn't seem obviously better than
> > introducing I_NOPRUNE, so I haven't pursued this any further.
>
> So for situations like this I've written a patch set to allow filesystem
> to mark inode for deferred reclaim (from a workqueue) [1]. Would that wor=
k
> for you? It will definitely solve your problems with warnings in memory
> allocator.
>
> I don't want to have two different mechanisms for the same issue so if my
> solution doesn't quite work for you, let's discuss how to make it better
> :).

thanks, this would solve some of my problems. In the gfs2 case, inodes
are only in "deferred reclaim" state for a while (while they have
outstanding revokes) before becoming directly reclaimable again. So
I'd also need a way to clear the I_DEFER_RECLAIM flag again.

The I_DEFER_RECLAIM flag setting and clearing code would be racy and
ugly though, so I'm wondering if we can change the ->evict_inode()
super operation to return a DIRECT / DEFERRED status code instead. The
filesystem could then look at the filesystem-internal state and return
how to proceed with the inode. For example, fs2_evict_inode() would
probably request a DEFERED evict when GLF_LFLUSH is set, PF_MEMALLOC
is set, and PF_KSWAPD is not set.

Thanks,
Andreas

