Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793972708;
	b=dQ93UxAuIOJXr8/RWuDMcWjgDqerZl3yKM8EJs6KVejK8qReO9WXqTpquJXK+Ro3z7jQ
	 lhnX2a38vnWdZKCj8DWyG+qkEn7whsnPwlBYFKscMBcSHvjL37yRuEXQNENB9prIrg1YB
	 tgQKOIZYSL8VcoKlCU1CXJ5jZ/MmHnIbs29+2VpEZwcOt8wD7Vixulh0yizqKpHntu/C8
	 NTd7Xv6TdFVrOXvrh+LplgcK+QZWcRkICZU7fRgQgOs7hGyR3oEAtmFUoiqfD9yrszKFR
	 T097jxulI+YOLjR+pYr9HULW0Et2C1m/TC/KaHpd1TG9JjEe90DnKfkoyfo8y2xZL/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K63SRYXJYnToUzmwwdizK3xJn9h0hSaj5lF2H2514zI=;
	b=1osRsqQLWBPRcD6SUWOtZgz/JK8n2d4+tmF2SDaOxTjwDhnjyFxD2M//ZUe1pvE1T9a4
	 +3PiOp316GK8goVx/Y0SDoVdLU3FlhLOEAUw3bU3uVa9c9DZKnQVOjIzYI5zoKZXeOjSn
	 Mztum1dfV3S9HgXZ1uQyNve44JG1J2oytOSPNE0XPE4hbZeJmR1MALbgphAzalBwNBEnh
	 +UEPRjkzZS41cA5h2BE9tTFJyhXUOkKVnzUu34yE+KtuIhscKW+99QR/NlLxR/HqGqAol
	 yJ8l8pybLbr5+7+T0IaepJfTjpvVzABgiCYW7Ubj876qLoxSz6zwug/Y7U3XouAAkMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2JVQdvL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80558606D80E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80558606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2JVQdvL
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4c9abc1824so93000366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:45:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793972707; cv=none;
        d=google.com; s=arc-20260327;
        b=DSI+IkhRqgb2Z0UZJto3iIy8F5CkzhmfFKlT0eoRPJ5ANurR3yxXlwX+Dm8NTj4mI/
         P4bXiGpW7nP/Fo2eKMZBsdCy3VywPLm4nGRb/wzz7iK5Va7/zeYcVC4gJiOsQJ8XSuYy
         PXLSPtdQH7suoh70ac/WXHRs/LNiYl46V0OvVPifRdemCRFK+7yuuDscDS3LFc9MOzez
         awHcy6+mFCQcRd72+eWeuCxzricfhUMY8HlRhDZKtxtAiGIgTqKIgora9ZGoj/N3kx+s
         l2RhW0kiAIN89nreoKPLbQZ00gl1/49a6shQpf+JKUku4rv+kc4awGowDYe05AKYW6qT
         +qzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K63SRYXJYnToUzmwwdizK3xJn9h0hSaj5lF2H2514zI=;
        fh=9oWcadSBSIV4+MNpgw8CmVLmkf3nUnVBXCJldMp0Mcg=;
        b=n2tvvv1nOu1WXWv7UjsEg5I7FntC7jtd8j5BXEf2y5Yt5h3hBtU/4HWfHIVPmEwqmr
         f04A7xjF5NsBqbrXn8i+AkUV2HifTl1Dn48AhR+YI+6V8HPUPSyB6cV1Er+QTeaJpHGO
         gG/drxXau8W8i0V/ef3Ejtq8OLNsQI1U2WucZSdK8NTjjvIXTMBtYPTXqaXAjZo6Mr/K
         GfSJhX6W2n7lv8kMmcQue48/SL1h7UR3J7G0zUkQ9vuv7KPJeWhNAoloR0/qr64pPNzb
         JHgfJ0qlcWcfRmvB+MTZkyKbDMKNv/E3GCtAvI+o7iNc4AWg4ylxEAt88XF7Gxygon2C
         Gflg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793972707; x=1794577507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K63SRYXJYnToUzmwwdizK3xJn9h0hSaj5lF2H2514zI=;
        b=d2JVQdvLfHRRFU/9OajScUqNz6CIKbCaSp2D4Io5kCHMRRpXsoTNBwA/PnRxye4Qfm
         9HdfsacDpjYiMOycWgwUAH7asXfv4Dh1/y6gRVeCaM6PGgZ0w/nfz14wdcLsQ0EXZ4fx
         vKaNFcWXfWfA8eNqDcScRKySJH3pnGX5j91/rjBf5CirdNyqritRekG3Mz3osdAOGBdc
         5I/66tzj/3umdKEgS3yhEthrehRd/7SiF930Z1Qz8bWWdFf/bwNBBgw9MATkT7MJjY8z
         NRDRoTF+WeYrI5HVryl5Qj8CaGmmONK4EAaUyNroAXPKWFyYv2lVbq8My+W7TIcG+oIK
         uDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972707; x=1794577507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K63SRYXJYnToUzmwwdizK3xJn9h0hSaj5lF2H2514zI=;
        b=rkJChQSNTT73k/e+h0/zMs4tCCMQkcNirjYwiZ55U48qmBgh8CvynSlhivQjOFGKGn
         M9jyzrD5JWvtuE9kTt2QxuIxkc805e/4JWmUXZ5HFKn+o8IHwiOs0UwOoH7Y/ZZNoZBJ
         k6FERvxZ2oU85AID31rkk9kBEAo/++kgx57VRqZe/Pg+WRtx34+H5vyx43pvtKP4p1N/
         6hdTo6n/Tg/BBt47Vr6qH8RzphlvuZLqCPo9NAAPgRtEL4BfkPsSZtPIMPH1M1t0u2Ml
         oURrThk7k19AxYZcqsZaNVt6uHut9Tw0y7wNSc88rrXApVgZPuXZwx/ihyy0xmsgJ5PO
         h1/w==
X-Forwarded-Encrypted: i=1; AKwUvBz+GsMB6QFw+J7P8Aj1AF8Oq2zABYiVtGY8ekVRz27z/uIZdho5d78QDNwhLGvwW8B2n9PqscPT8Ab+BjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zAG4dckmKo/H4XLp3fE9wC9EZYHv6u3DFhOWtxqhbPbOlXlBs
	nzv4HCMFU2lI7TKHAdGRZ+Jrch2C7QxRd+Fju7r63OnS27XZ3pVLl1PKmGmDaYYRGbPgYYP4a/u
	Yubm4VeP0jaP7lEW9h1N5uZVz0V+vfdAGr6m0
X-Gm-Gg: AYBFou0xEuKGqrAG0v/VoJz/tEKTP/NuXDxWrzUTcq2KBowdTQnxfOwVVYNApzdrBrb
	zD8iSyXJ4fvsPKQ/Hy2ED0ZGe88xomcHqZ9nP3PW++gk1tEmEd0raAAL/+scew3PgbBPOgxVYyY
	92IKqefQ8u5mSR5CgDLk15hLcUwpLz/6Wt3Geg0qXn4MBIhYv1RRNKgKVhWRLKqB/XTolef1jSN
	pnP+ceA24UJKhpkVp6z5rMkO41VFR4mo5OIdMw7DIdOyroSvC2DSwfDGBcaxSvZJc0ZXsUEMm7W
	oNfAGugyaxriuZRICPlXAUYAKVDXKxl233tXHrclKzdgNL7kIWuI3dqdbnBxBlYgt3IrPchADHE
	dEyNs78zSIVCbTozhSaDXZim2msp3zLMHQVe4SLqewoBdvK5zBITjR0TjAES4WMYZaIXq0dgmxj
	aqtwKhO2OKXAzcV+sgjxWXQhCRcz9sZtq3Xuqo5VRTRitKN6j7Qw==
X-Received: by 2002:a17:907:ea89:b0:c4c:bff4:200c with SMTP id
 a640c23a62f3a-c4d3531f031mr216233766b.32.1793972706561; Fri, 06 Nov 2026
 05:45:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202611041404.befe64cd-lkp@intel.com> <20261105-trommeln-einspannen-radius-ccb4e174e407@brauner>
 <auygOHcuBba_o132@gmail.com> <CAGudoHFpNbxL13ZOWiyyLSPpmzXcB=e=RBZ8ZGk+Oc58Aad9pA@mail.gmail.com>
 <au2vjpu_yqNa83pN@gmail.com>
In-Reply-To: <au2vjpu_yqNa83pN@gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 6 Nov 2026 14:44:54 +0100
X-Gm-Features: AclHuK9fhTVlPSoaFVQpmWKFtp3rg-Yo_vESXYaoYYRFIlvR-B2NGlbbcPxrfcY
Message-ID: <CAGudoHF3de_55YvdztPs7QiYs25u6nPEV=uMOzfr=bWmwof69g@mail.gmail.com>
Subject: Re: [linus:master] [fs/pipe] f7f4665dc5: lmbench3.PIPE.bandwidth.MB/sec
 18.5% regression
To: Breno Leitao <leitao@debian.org>
Cc: Christian Brauner <brauner@kernel.org>, kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 12:11=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> On Thu, Nov 05, 2026 at 04:57:33PM +0100, Mateusz Guzik wrote:
> > On Thu, Nov 5, 2026 at 4:28=E2=80=AFPM Breno Leitao <leitao@debian.org>=
 wrote:
> >
> > The test at hand has multiple readers and writers using the same pipe,
> > with 64KB i/os.
> >
> > Prior to the patch each writer had its own private pool to draw from,
> > guaranteeing no allocation will happen under the mutex.
> >
> > With the patch the reader exit also drains the pool.
> >
> > As a result tons of allocation ends up happening under the lock again:
> >
> > -   94.88%    94.88%  bw_pipe          [kernel.kallsyms]     [k]
> > __alloc_frozen_pages_noprof
> >      94.88% __internal_syscall_cancel
> >         entry_SYSCALL_64_after_hwframe
> >         do_syscall_64
> >         ksys_write
> >         vfs_write
> >       - anon_pipe_write
> >          - 47.46% alloc_pages_noprof
> >               alloc_pages_mpol
> >               __alloc_frozen_pages_noprof
> >          - 47.42% anon_pipe_prefill_and_lock
> >               alloc_pages_noprof
> >               alloc_pages_mpol
> >               __alloc_frozen_pages_noprof
>
> Ack, this matches what I found as well. Thanks for investigating it.
>
> Because the preallocated pages are not private to the writer anymore,
> the reader flushes them while the writer waits for room in the pipe,
> and the writer then has to allocate them inside the lock.
>
> This basically loses the wins[0] from commit 212ed884a1aeef ("fs/pipe:
> pre-allocate pages outside pipe->mutex in anon_pipe_write") for this
> specific scenario.
>
> > I don't think multiple high-volume writers vs multiple high
> > volume-readers is a realistic scenario and I would not bother fixing
> > it.
>
> Agree, but I would like to spend some cycles on it.
>
> > However, should someone want to address it, I think the patch should
> > be reverted and the resulting state tweaked. The patch at hand came
> > after the mutex is released -- the kernel prior to any of this would
> > still put_page on the reader side under the lock. This bit would have
> > to get tweaked to recover the loss in that scenario (not to be
> > confused with the loss reported here).
>
> We can revert the patch, but that would bring back the two page pools
> (the on-stack prealloc and tmp_page[]), which is probably worse than
> this regression itself (IIRC it would also lose the gains for smaller
> writes (about 20% for 8-16 KiB writes IIRC ))
>

Like I said above, per my understanding the win is not specific to the
unified pool thing, but merely to the fact that the reader would put
pages *after* releasing the lock. this can be done in either approach.

> That said, these are the items I am planning to spend some time one:
>
> 1) Reclaiming the pooled pages from a shrinker, as suggested in [1]
>

The more I look at this the more the extra memory usage bothers me --
even with shrinker support there is just plain waste until it runs and
it is going to cost elsewhere. If this was "free" performance I would
have no comments.

Makes me wonder if there is any practical win to pursuing it in the first p=
lace.

But here is an idea just to ponder: what if the threads using the pipe
were guaranteed to trim it at some point, even if it remains open and
unused?

Currently there is the notion of task_work, which allows for arbitrary
callbacks to execute on the user<->kernel boundary. As implemented it
is rather expensive (atomics) to use and always flushes the entire
work queue.

But imagine the mechanism got extended such that there is a separate
queue where only current can add stuff (so it is cheap). Getting to
the code could be gated with the same branch which tells the kernel
about task_work, so no extra overhead in syscall handling as long as
you don't have anything queued up.

With this in place pipe code seeing a big buffer could add a callback,
which would do some magic to decide whether to trim the pool and by
what amount. Just for the sake of argument, here is an example: 1/16
chance it will do anything to begin with. if it chooses to do
something, it checks if there is a "trimmer was here" bit. If no, sets
the bit and leaves. If yes, shrinks the pool in half. The pipe write
code would clear the bit, so a pipe with continuous usage would mostly
remain intact and an unused pipe would eventually drain to nothing
(including the currently held 2 pages).

> 2) Trimming the pool gradually on the reader side, instead of cutting it
>    down to two pages in one go. Or not trimming it while a writer is
>    in the waiting room (!?)
>

There is no indicator there is a writer pending, at best you can check
if the lock is contested. This seems like gaming the benchmark to me
though, as a real program who happened to generate data a little later
would suddenly find itself with the pool trimmed.

Granular trimming definitely makes sense, provided shrinker support is
implemented.

> 3) Keeping the writer's preallocated pages private again, while keeping
>    the unified pool (i.e. without bringing tmp_page[] back).
>
> 4) Freeing the pages the reader drops after releasing pipe->mutex,
>    instead of under it, as you suggested. This is independent of the
>    options above.
>
> 5) Longer term: copying the data into the preallocated pages before
>    taking pipe->mutex, so the writer only links them into the pipe
>    under the lock. This doesn't seem trivial, but it would make this
>    whole pre-allocated buffers go away
>

I think this is sounds awfully complicated in face of multiple writers.

> 6) Any other idea?

The SMAP stuff is the primary problem right now. To reiterate: every
single buffer read/write takes a SMAP trip, which is very expensive
even on modern uarchs. Refactoring this into i/o under one SMAP round
would provide a visible speed up. It also happens to not pose a
tradeoff in terms of memory usage and would be my first avenue of
attack if I was working on this.

All that said, one reader vs one writer scenario definitely makes
sense to optimize.

Apart from that, highly parallel i/o on one pipe is imo the wrong
thing to look at in the first place. What is more likely to occur in
the real world is the user having separate processes operating on
distinct pipes, but this was not benchmarked at all. Another case to
look at is one reader vs one writer, but all the tuples have unique
uids.
