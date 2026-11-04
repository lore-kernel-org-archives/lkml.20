Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790689;
	b=sBreXi6fl6EOizzTXOJ5dqX1/83GxDn7O6BCRIRLbBlW70B6BxrtJg6UPAo/ioC6iR0D
	 06KoNJZj/xB4Fc8Pw0vU4XZmh+kpOte/4SN6AFmY/CLSETs2XMx76sEUtjNKJrR6cjs7r
	 3r1GcrkwXFzsRZq4/wzXdQdW3O3PDVdwG9xnTifFDrOzn9UG8QrRdsxW1CYADm19uKkvh
	 qzV+9sOjNnXY4S6UL75zCQNrdEXvG3r9opGINrzSjAK3fpRXqzDlq5qewL/adxCFLCVNw
	 vwveX4n00zDCgGxQeXo4e9Fclx+kQDwXjFfDQqmNHbe2Dd5lkHSsWv/6qd4NUXK3XuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9dGhPXkF5fybGQPWWCMqIGqZtY7L/k+cbfx9SzNUbl0=;
	b=cI84LWeW529KMdghF6QxyNxlIBP1DYlbZf0MEvu5b3k6+uOW2xo/r0inKWqws7lsZKYE
	 ptqq66yAQHw4nmiat8eV8oANcF7VVtBVQgAN1Z8vPizrkrO1dlHvVi/13RLXfdh8p8G15
	 ijm67RfXJ2kTgk1HNNDy7XpVrMyoBmYYzxzM3KnLQRE5q3ro/hUg/xnudr2JNX20ntbVm
	 yhPkrCnY9naTxBMD5rEkMnMCMDnk2MYQCYwrFXR6NhijAQQzIQ18kBPde4wVWAsjYVS3H
	 Qc6p353l49bL4BOPaZhpcM5dsJFtmeZ/8dCQGUM2+9pbXQXAoCDo77lBoA53qsMlTmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0e8FYXJx;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9B3606A333
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA9B3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0e8FYXJx
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso83055766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793790687; x=1794395487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9dGhPXkF5fybGQPWWCMqIGqZtY7L/k+cbfx9SzNUbl0=;
        b=0e8FYXJxpc02eZ5f5Z3Dy627r9wHcblee3p00UDAVss7m0HHieZ7BNV8ugV7wINDTl
         ahbP/wDIakMygyWdzNmy24SMpvBdrMOWcDTDLB6nfyGOdm8l9hulDVGPeduCDyqmMWAT
         nrpDIY7GWyqY923w2NmqbOhX3OlevSe/Xs5CZakOOb8wR6zxmaaia+dGWSLIqHTb4g1l
         D7pMgrksLKPwHJVEeVN2Fwew3Xugipcs78Yg/HhLvX48/9N7OQ/UZ3DRM4HxtxPsMOou
         Ym4nI7LOsjzSKOCqATVO63v78fZ2r3Pj5/jAjXlzlyKHJd0VHgoTM3ob/3hbQPSJl0ux
         9iAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793790687; x=1794395487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9dGhPXkF5fybGQPWWCMqIGqZtY7L/k+cbfx9SzNUbl0=;
        b=t/bgzRxzoHPmcOknv+kdzh69aZ3Xy/SmtR882LV8AYtYzFKvy8hgQ2q73Z+0gr1uWz
         U0G8xDfGJE1AnE2u6Q3GAZm9f99fMkM6DOAKl3gK+kWbkRHAwDned0GNiavdvAEuTvPs
         +x8AcjjrQmVE2u12m8TE5TKzz/KUxEA9CtYj6hD7Ji18Or5rfFzJf67isCQarNmruyYl
         5ltLJtkQkdX7bGt5mzz93KNheopWksw+S/Yqxf4nrjS/5ZTLjpvXdK6T7RhevOjncTBJ
         DDam7Uv0mu5JioQ0LfHyM/FOsNEKx0ZPL8cWpiiIeJMUB0IzN+Z/1CiuqVN/fDdSfJMg
         2aGw==
X-Forwarded-Encrypted: i=1; AKwUvBwL+zl3RvPsZ8BH4LYR7wFIH8sumXH2NIpkN91MqAo77Dtb/SYus8tj+pNMlQBtCQTolgXxwQFvd4WJDxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B4oXnaD64RZHteIGzbVBAQZYRJ+WNtvC9c3Rfji6E/BKsAiol
	JZR4AN4hynqtbl6K+UvgAa9MeY2xzAfp1ADVCrk61z4z4SrVXcjNfGen
X-Gm-Gg: AYBFou3qj0/ZoGVDVrXHFP9ggZFmir0p3sF/0u7aFTl3jZrvD69cGd8Ud00+4lrjI5M
	T/+dFB2w6uZgGo2RzC4U3/iYwyy14qJJ7gGmwRzsgcHX97dfnIwijGKsmpn70JEwfP0rRBU4nrh
	Qnx9vOq5OBqxc8sEUwKcJ8RsXywrIynlggaF5yEj0BYxeNbfqklqVnVlJtxUnCGlDmrIni6c6cU
	W3Am+8OCz20iXCebOcAnNXpqnX7oxXnlfXEgQAJ/KZpWKw/a+NljhwBSlDwVoYvq83sJI7yAblh
	m9OcRJFt+gWHT27IYoXoSseEZH2+HDEKDyT3aF+B7E8kKPS3q3c/Kg1Xr9zBVXB5MCzO0P4oZ2D
	cp5D2uy3FqhZiPotJWgXh5jyzMCi15UYZeuwqFgf6OY3l54DtVYLBTMKJ5TCLs6KViPcjNhrxA2
	D56U4Cl2+NjEM1mEB479ioT+BWAa4BdlRLCgdk8/I8KV5E3uTc/2ZFHh7Zs6rde4TnURoCZH33a
	qvZsAXCpd84NUGQeITMTRDZP2VwPCLdilZLfejeWBkSTMbqZ7FtwsVQ2VMhZ17Xnzc2twdQBhqS
	KNPqj079BGJQDQ==
X-Received: by 2002:a17:907:980c:b0:c40:36ca:9d1b with SMTP id a640c23a62f3a-c4ca7aaffdfmr1376456066b.40.1793790686850;
        Wed, 04 Nov 2026 03:11:26 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4a4bb5sm55813666b.80.2026.11.04.03.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:11:26 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 4 Nov 2026 12:11:24 +0100
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	"Liam R. Howlett (Google)" <liam@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Uladzislau Rezki <urezki@gmail.com>, Michal Hocko <mhocko@suse.com>,
	Baoquan He <bhe@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Graf <tgraf@suug.ch>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
	Lorenzo Stoakes <ljs@kernel.org>, Chris Mason <mason@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>, stable@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH 4/4] rhashtable: fix vmalloc() deadlock in atomic rehash
Message-ID: <ausS3LQNkdc6lBy3@milan>
References: <auMbCuecFeRmBFSK@pc636>
 <jfvq7vkx73vzp2ukq6nwnb3v3g2ezdcyppba4oa5lpzmz6ls6t@akc46gonndgy>
 <urkgmijyytg3rrislm5fdzmfggqavzpiry23f6lpkqonvy2tqx@d56stj3eixfa>
 <auaFhOa5EBz4gJwK@gondor.apana.org.au>
 <xdzcyoou73blpfdlgy47i2ktrcsffnclerzojpgrxphid54gjc@nicdcvzqx447>
 <auqtTjXhD8is-y9f@gondor.apana.org.au>
 <CAHk-=wiE0KG+jkhmJWifXuAVivtB63WCWtdEpGAex7-T0SHd2g@mail.gmail.com>
 <aurAxRpCwzeyXeVj@gondor.apana.org.au>
 <CAHk-=wgPvbYRcKpQ8WTH-EYZRgMG0KSH+cZxY5-Hyf+X7JjWsw@mail.gmail.com>
 <aurJZ81qnbiHH_P1@gondor.apana.org.au>
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
In-Reply-To: <aurJZ81qnbiHH_P1@gondor.apana.org.au>

Hello, Herbert!

> >
> > None of that says why.  It only repeats what I already said: it seems
> > to be due to kmsan doing bad things.
> 
> Fair enough.
> 
> When I was told that folks needed vmalloc under GFP_ATOMIC I didn't
> question it any further:
> 
> https://lore.kernel.org/all/aeiHkG7X_dieMdw5@milan/
> 
> Looking back, it does look like it was never explained who these
> folks are.
> 
> Ulazislau, so who needs vmalloc GFP_ATOMIC support in the kernel?
> Or is it only used by out-of-kernel code?
>
There are users in kernel. For example:

drivers/GPU
    /* Allocate the file in vmalloc memory, it's likely to be big */
    iter.start = __vmalloc(file_size, GFP_NOWAIT);

AMD-GPU:
    kvzalloc(size, GFP_NOWAIT);
    kvzalloc_objs(struct amdgpu_coredump_ring, GFP_NOWAIT);
    kvzalloc(ring->ring_size, GFP_NOWAIT);

Virtio ring-testing:
    (alloc_ring(0)), gfpflags_allow_blocking(0) does not allow blocking.

net/ipv4/udp.c:
    err = bpf_iter_udp_realloc_batch(iter, batch_sks, GFP_NOWAIT);

etc...

Apart of above, the obvious user of GFP_ATOMIC is the bridge forwarding
database. The br_fdb_add_local() holds br->hash_lock with bottom halves
disabled, on rehash event it invokes rhashtable_insert_rehash() to allocate
a new bucket table with GFP_ATOMIC | __GFP_NOWARN. In that scenario kvmalloc()
can fallback to vmalloc().

This path runs and exists because syzbot hit the old in_interrupt() check
there, leading to 04aa71da5f3 ("mm/vmalloc: do not trigger BUG() on BH
disabled context").

The vmalloc() fallback improves the chance of completing the insert on
the spot to minimize -ENOMEM hit rate thus minimize queuing the
irq_work_queue(&ht->run_irq_work) to retry allocation in process context.

According to XFS code and comments it wants non-blocking support for
kvmalloc().

But indeed the v4 cover letter didn't name a consumer. The bridge
report came later.

--
Uladzislau Rezki
