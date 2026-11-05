Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895796;
	b=uMhrVS6o7oHcTTuucM/oDPHLR0vqSxa7ndjKNra4q1Des7CiJPqnMsYSyDDvS64dRVUl
	 uDPJNEZabqB9tq9f1bZxZXxvSaoc6VstaSlAAR3SZR1B09vMGjzagPaFvo1YPj0qedY4O
	 2i00S76tSIkGn7HiMucg8GoCCrehHTVR/ID/InPqJlhmVKxRhNFHw13pym3fSwkidKazS
	 OD/Thne1getOVLwwBEHIHZJ3W8RZeBxCpFjQKGHBbQAQvIKMXSU26WWcj15Zc4VdyHYRS
	 xATMbpbNL/eBJWlsfe9CesUyDxVXuxiAKpI93q3WUIbSm9AIyEfHLMuc6xXN1/2qiWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=coQkw57ZP+vtxGOFNXxyJOYi0uTeh1KAeZgHd3m+lMA=;
	b=RGYz+c631jHaOOZxWDrWwxB5YA2csJxVnF1h/todNsJHajrAb3LxyDSsPdz12bZsJyWd
	 nNutEPtKSj+dMLcUKCM9op19EsDRYKGQwh/Tlhz3iQ7x4/Ui8dx6cUeS7LoqMi6C4S1Ft
	 KqGzn5A+suC8h6fOfR3jGPK+Ntji0QolqXbjTArBFqSqE2Rh6qn/MhVS9QlyYNECtKluf
	 A0OVZu/MYzGz6VfLx2OYmoa8TrpQk6cXJ+7+Acy30b0NIwIbo5bNZJxPKv7txMU28TgAY
	 h+6VzZkXNOp5/7VVdnYPpSNaQcf84UXmk3Ck9FqMG39yih6utyLPmjR4RYcepW3w2mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=XVtulKYA;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE97606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE97606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=XVtulKYA
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso2244136a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793895793; x=1794500593; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=coQkw57ZP+vtxGOFNXxyJOYi0uTeh1KAeZgHd3m+lMA=;
        b=XVtulKYA+d2lnkmNdJQPF+3Clphkg793QbmwzgnueMRJxFmHuAGqBTrvq1dDNSXEcT
         DfU92+Djmg3iL41qbtBM16KqdGI0fAdtr2VrmTU29t76XWf7QW86dZgosRpC9WjLV0qR
         I9GrRf42uBZj5iZZ2R1AbfZ4vLro4tQe32Lcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895793; x=1794500593;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=coQkw57ZP+vtxGOFNXxyJOYi0uTeh1KAeZgHd3m+lMA=;
        b=HDNoIjTyMutlbXBR+XS1Mf0mVADCFvvHu4aMuRPUPLWiKuv4Mda94BXrrm4+seuftq
         6cMybvF5/PIFoFZTKTgUdxlK/WZW8C7hkKKYn5VJ0DjQwnsJ5Ey45fqmMOY67W/Pc/24
         dqk7jPL2BXob1GiLfQn6poklLy6e6rrOVFzBrbWLYljcPkgxa0He4pV8tX4Z8Bwl8qTC
         3ARcJM4vEmiIHEmtsutqzY7q7fgbXc0oyiOGep8OYTgLsennt4mRFZcN+2m5x757QeIV
         80gGJfxe4Od6eyC3hH4Msx7oS4gF/7VW5fq7b/LD50eoduhSBTbSXOi8ITU5G+fY4rGE
         PKNw==
X-Forwarded-Encrypted: i=1; AKwUvByGo1y53ueTnuIwx+qVT8qNDpKbfKWgoAeRXtMbPxtgXy9c4CSsb94FuZJ2SoAIjVjHVZKtvdJVveaQHJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/a6SFgulBxtzCr0KKgWpby3NvcRg9fMKedZHjY8jz8RJudwpO
	W39+LDSE2TWudIe7oIz/kv83ae9+tf+EF8fRt33o7qM/ZdKvQDD00JT6fLxKPP2hTaBSGZqKbkx
	KkBJSydI=
X-Gm-Gg: AYBFou2HTscjcgNnqQOLAz99Ev+sjhgKrxVG59UVooL51wfbA3ctG7koPESrLCATkRQ
	0eqVLI/ql6NBg2hyyyfFngP1uY39dVTm5+GfGuvsTebATEcBYy645qNsxyf8OL6Kom4ktNzmLlx
	PdcW0TZVdKAoOhYOrlQE3QIpRbGmwuiq/ajKN54kpWl6VWtzCVx+6aQPgSJXW5uVZ7O/ZC1b+cn
	dtwr0qvfTSWq6nB2HK4TRMoFbrEO152oTLTXgp4XPbJkELDWoIAP5Slbu1kJ7jfAOB4naSnYsn5
	6ATuQhUUQiz7TiXLxZlBNZDEtNTyiXNAFYZFn0wNv7kj4I+p3u9EtLTx7qgFkY4W7Z00YqtNIa/
	JRMJUJncuNSMAiy0raNcPTHRPZI/58LJovyt3bD8rrgHnbKR3gIz+AKPWs4IM75gz3OoF9xUuwG
	9UAwFjxyPnVclti+0QKCrNZl3TvkscuUwialIJy2/WdoHngtK46cC9zzdJnLk35AS/cIQS6rlMZ
	vpGfOZcIcgfpoXS6iiRrVBoSb7njcK3TzZVB0VVJgKdQQx3fX1zpGRgWE0FTW5MQkNOtmPbOEo0
	cOsdkSBpAWRYIHY7lzDcQQ4iFkBqQ7Ed0BhXoW59txImBDkgaYeLpQoh/oLmdp12JjnF2Ra9Cr6
	G6A==
X-Received: by 2002:a05:6402:2417:b0:6b5:8247:7bc7 with SMTP id 4fb4d7f45d1cf-6b582477d18mr1582367a12.44.1793895792817;
        Thu, 05 Nov 2026 08:23:12 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6f120sm1868875a12.26.2026.11.05.08.23.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 08:23:10 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b5766b2986so1481913a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:23:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByQjkvfzu+5onsAhpzphUUaJj1hXvUaVYAUWFy+SmTP9URRCoiBb+gGQQztmA+Tq/qlmMJVEsaPXAKOHlo=@vger.kernel.org
X-Received: by 2002:a05:6402:3899:b0:6b5:76b9:5040 with SMTP id
 4fb4d7f45d1cf-6b576b95165mr2666079a12.41.1793895788549; Thu, 05 Nov 2026
 08:23:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <jfvq7vkx73vzp2ukq6nwnb3v3g2ezdcyppba4oa5lpzmz6ls6t@akc46gonndgy>
 <urkgmijyytg3rrislm5fdzmfggqavzpiry23f6lpkqonvy2tqx@d56stj3eixfa>
 <auaFhOa5EBz4gJwK@gondor.apana.org.au> <xdzcyoou73blpfdlgy47i2ktrcsffnclerzojpgrxphid54gjc@nicdcvzqx447>
 <auqtTjXhD8is-y9f@gondor.apana.org.au> <CAHk-=wiE0KG+jkhmJWifXuAVivtB63WCWtdEpGAex7-T0SHd2g@mail.gmail.com>
 <aurAxRpCwzeyXeVj@gondor.apana.org.au> <CAHk-=wgPvbYRcKpQ8WTH-EYZRgMG0KSH+cZxY5-Hyf+X7JjWsw@mail.gmail.com>
 <aurJZ81qnbiHH_P1@gondor.apana.org.au> <ausS3LQNkdc6lBy3@milan> <auxDm_YO4oACA_d2@gondor.apana.org.au>
In-Reply-To: <auxDm_YO4oACA_d2@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Nov 2026 08:22:52 -0800
X-Gmail-Original-Message-ID: <CAHk-=whXvVO6a5AreZu3LPBj_wjpzUanwhvu8WqWP2q7g5S7Vw@mail.gmail.com>
X-Gm-Features: AclHuK_lYzOySVnPMTXkh-HXGHC850mf9gNJxZLEPPhkqoVD1gRX0QozBFysw7g
Message-ID: <CAHk-=whXvVO6a5AreZu3LPBj_wjpzUanwhvu8WqWP2q7g5S7Vw@mail.gmail.com>
Subject: Re: [PATCH 4/4] rhashtable: fix vmalloc() deadlock in atomic rehash
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Uladzislau Rezki <urezki@gmail.com>, "Liam R. Howlett (Google)" <liam@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Graf <tgraf@suug.ch>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, Lorenzo Stoakes <ljs@kernel.org>, 
	Chris Mason <mason@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, stable@vger.kernel.org, 
	"David Hildenbrand (Arm)" <david@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 00:51, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Wed, Nov 04, 2026 at 12:11:24PM +0100, Uladzislau Rezki wrote:
> >
> > There are users in kernel. For example:
>
> Thanks for the list.
>
> > drivers/GPU
> >     /* Allocate the file in vmalloc memory, it's likely to be big */
> >     iter.start = __vmalloc(file_size, GFP_NOWAIT);
> >
> > AMD-GPU:
> >     kvzalloc(size, GFP_NOWAIT);
> >     kvzalloc_objs(struct amdgpu_coredump_ring, GFP_NOWAIT);
> >     kvzalloc(ring->ring_size, GFP_NOWAIT);
>
> These appear to be executing out of process context without spin
> locks so they're not really GFP_ATOMIC.

Historically, GFP_ATOMIC and GFP_NOWAIT have been largely the same
except for GFP_ATOMIC eating into reserves.

But I wonder if we might be able to soften that a bit, or add a new
form, because it looks like the AMD-GPU case at least doesn't really
care about any kind of "don't sleep", what it really just wants is an
"optimistic allocation" - try to get the memory, but don't spend
effort on freeing things if there is not enough memort.

The AMD code in question literally has a comment that says

        /* Dump ring content if memory allocation succeeds. */

so while it's possible that it has some atomicity requirements, it
doesn't look that way to me from a very quick look.

The etnaviv case looks to be the exact same thing: it is definitely
called in normal process context (that code takes a mutex lock around
it all).

So those two cases really don't looke like they are about "atomicity" at all.

> > net/ipv4/udp.c:
> >     err = bpf_iter_udp_realloc_batch(iter, batch_sks, GFP_NOWAIT);
>
> This looks buggy in exactly the same way as rhashtable.  It's
> called under spin_lock_bh, and the same lock can be taken on
> the softirq path on another CPU.

Yeah, that case is definitely actually atomic and holds a lock. Not great.

Is there any way to limit the vmalloc() case to the actuall atomic one
and just fail when it needs to busy-wait?

               Linus
