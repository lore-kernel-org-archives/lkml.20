Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793697274;
	b=i1Y6awp5tWIPQPp+kZmVn89NEBagO53MddJCIdiw4kdbBe4hv69oJkAA+liPOKq7pyf0
	 rKBb0B33I4vPwyPUlB2MQiPZ4hf+d0MUH22BTopJA7YHvGB1H2jbLhPE+Pi6kFsEIMPJQ
	 IDsCaSmiS6tQlGd9lMsAQ6jpSXlSaUEg1+Obdsg3WtMUwWem1IUvwgQYY/uHSng853f1M
	 AV3c8OceO9fPSFUoTC0nWK7nQdP2JiXQBMfGDVemWj1b9YZ8akCPAZPj9JgMo2GoKw3rJ
	 k8V4ObQ9Sv1V9uXIIiBSs1u6BgtR3d0vSYpa98ih0Mx1iAtJbqvzbN2wk9IPQE20teg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i14dmH5BR+9SimyzQMrEk5iidp8zGrGHl7mp1tLTg74=;
	b=NnTDrhjUASs0rJ82OcKFeu1Cg974hiu8l/HZDqc6eIjaDw6igLYzDxpp84veS+iJeV43
	 fF+OmyverZJQZUjLe6HXHG8Ujykk7ZrcyjSbJ9UHnOPSOuFtC01zJJjb8lz5xlOND1ohr
	 9EQjTTD66/WIrn6Y9B7PPe5wKzHRPxq85aVzhsD5nUIpPzLo1Wv65dM7KAehGQHkdIfy9
	 FHEuz+Ep4kT4rcgO4nF2bEDgsQ5rC4dEcgE3RoQHWpLPULm4m2NGg8DpOUQjT0HXTUsrV
	 bHykcsF4dikYqS57pnxTt1JtLqKBtvMUDc3oC3FdxgWpLNPyTIYBdbKUfIVID3nElpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BFRA5WkF;
	arc=fail smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9DC606A33C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F9DC606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BFRA5WkF
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5383c97c8cfso140131cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793697273; cv=none;
        d=google.com; s=arc-20260327;
        b=Qv4OEB36/eJA3ZU2yklL+ksH6u9Q6Z11XBxudGJFYDP6/4F5f6tov/BSZTFZcNR82y
         meKfVomIrKvBNQAXOJusmuQLyy3z83ILhF0SU5+peQCJNgRQjYqLU4FQxFCo6aH6eVIt
         r4MDayQftTqesP5At/5CtMSOTUIGgKc2VNr9jyfvUqN6s7mSc2EtxAQ3NzWwB3avLc64
         w2zQAngAmUGrcFnbngUtBOiw0gSLLFSbQnWuk8hc9D6TYfzCnYxRZjw+QzVGfvlaCXUo
         +XaktPlotkA95bCTRg+oBPk2VkMU8QKi9IpKH7gAp1sYFFPSnTqNZd1uXzE+iLrFKA9O
         GIJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i14dmH5BR+9SimyzQMrEk5iidp8zGrGHl7mp1tLTg74=;
        fh=TjhFyfH09K81NaLgPmfmJns3Un6kVM80IWHn4/phDDc=;
        b=d/FYlH5A7kaSX3QuWCcknWZ1d1FxGIPoG+yIisn8Rz1ircCbZatfCmRZWsrwO72CIR
         SjveMPzRZqYSz9c+zsch/EQStVSmubBT2cv28tef5l+WCtxw056WGq91INilnQnajSbE
         xK03TR8KNrN5OOZpyhwY9MqLs1uGPFtrih8AT9nvuB2BMyJIA3EXrT3N+PBSqET0QTOu
         lzS/D3sTy4LpF62R24H6EkJ10ZWwdZymMDYIku3AmiPbgx/ncWGDCJkjLhSzoavx+/su
         cbv9g1IcGB8XmHTF2I+8NUH/7Utyas4Y5aWiv6njRaff8y1bAGdB7AFTjwUzPBYbHQNV
         sHUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793697273; x=1794302073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i14dmH5BR+9SimyzQMrEk5iidp8zGrGHl7mp1tLTg74=;
        b=BFRA5WkFVzwofI4Y9qPUhFW2qtyO8NlwR48s0vcWHVm26tP/5OcdiQb7uQdbBFJ3l6
         6eWpgCHaYgj4N1eDLLQrwwhYiXTq7d11vqjE4ug1RgS0ElbGzpDYB2KQ9TkFp2okdQER
         yFf4tAgPt9WLDcmCO0BQmFV0yYbVZ8lRUw/90MMImfZoLthc1w4BHcofV8LGWl/B54q1
         nfF6Nupkbu20jzw4PqHlTu1tCWB6DY7rzVVWK6hzYnJCfcxYQPAhj2SwIldQyFdPZHAJ
         lQvb1sVV0SVYiVnLmhmTyS+xxxRLOhf7PlY2k0ra40cMDEjxCqbzHGepPLgMmkzh219l
         CA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793697273; x=1794302073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i14dmH5BR+9SimyzQMrEk5iidp8zGrGHl7mp1tLTg74=;
        b=YuBaqAWmU8bOXU3olb73Xc9hc4ZThGKigsB7ZmE91PLySwf9fuqEAEj1lFu+ay6rxk
         aPyVJRfvcPi3sW6QqINSQaHWyn1VQM67KwQsG95+9Fyy5jeYxF6uxoonsgwGTUpaOADd
         aatW4pvS5ZvQBHIG+2ld1Nezm/UwdUvmgsgcqaqh9dsf9jBlUNdwRx+fh2XI0bct/Oqa
         xryBHXFc7pTkac65zwTlfgJ+8q8zsy06J5zplpLaTgwlUQnEM2AIGjyvlrbtmDQfQSVJ
         L/4v8PcdnA/K1asvh86jnG+t8Ha/59j4SvOJoc8TKOs8xdNGVk1soczLse/xrOVSy9hf
         NrXw==
X-Forwarded-Encrypted: i=1; AKwUvBxCQc254P75Ga93BT/qKbOoFxnbT470+WjxMqdwQOK7PI3Ua5ZfvX5N5a3FT3Ez3VWoaf0WGmjljfa6L4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xp44dCa8MmO8q+5DrFGf+9JaPZht9OAtyWDJeUX/9duJLiTeM
	TS/kxBGFmJKFmzMsKkX7zPGTJ6GNRhbfx+TN5rb5PD1vg0/9nF+VXW8Jzf+HHkWddMxTKZkAyqI
	eET7IikyNTKfbHdBb/lnp0U5mACPox7oBWWR6A8Qu
X-Gm-Gg: AYBFou3mPaIH03P/Wu/MHw88xX+q8ntlk3ZvvNagzpvuGdJAMp7VVLPi9U+0EBJfE3Y
	8BcaMRQ2RY0jVuW0PNx9O5iP6S0EgaWjtwQzKRrSkgfRkrzGbwxC9f6Wm7gOaJerVrBbmTE+1Z2
	FNNKraJWlz1AnSXrm5Uih+W43/Zih+UmSq2ySpoYDkcK/Den+ihEjy/CiEL+FkKnrnsWZWtoLUJ
	Ani5wPaDJDue8VWQ7YJoWy4UylenuhJfJWE2142z9IpNS2DKjC6NEPvgoKyq7QCp9bTMVuZSE3O
	VSiaLdafMaQksyPrxhseKmncbKWcyz0AeLd74uU1j4tHo+kcQxe3W1aF9ouDSWXhDdNF2SWnbq6
	hrLeg17/mY4sZxQ9aQSYLQti+E7MWLEh/qDUHvYq834AkDb9DFE3H+Z65KfU=
X-Received: by 2002:a05:622a:598b:b0:535:84ef:2e26 with SMTP id
 d75a77b69052e-549dfce05fdmr11810771cf.7.1793697272817; Tue, 03 Nov 2026
 01:14:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org> <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca> <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de>
In-Reply-To: <20261103080933.GA4213@lst.de>
From: Luigi Rizzo <lrizzo@google.com>
Date: Tue, 3 Nov 2026 10:13:56 +0100
X-Gm-Features: AclHuK_l2TEIEs7qqznKn-9_c2yONWQ9t4tXrp8CyyoGHrPwnIyHLaBfgdlxlp4
Message-ID: <CAMOZA0+Fhq0_Pm02xGWpex06vb2y5pVzuFxOk=URZB7aq0xJ5A@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, "David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:09=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrote=
:
>
> On Fri, Oct 23, 2026 at 11:50:23AM -0300, Jason Gunthorpe wrote:
> > > Disk I/O is still potentially affected by the same problems
> > > (cost if io mapping/unmapping, iotlb thrashing, bounce buffers
> > > in confidential computing...)
> >
> > The disk folks already have a proposal to address all of this using
> > io_uring and preallocated buffers. I really doubt yet another version
> > is going to be interesting there.
>
> Huh?  If you mean the dma-buf I/O it doesn't really have anything
> to do with disks, except that this is the first user.  The dma-buf
> iovec can work for every ->read_iter/->write_iter consumer, and
> should be adopted more broadly.  Including by networking instead of
> their own totally weird different world.

Christoph, is this the dma-buf series you are referring to ?
https://lore.kernel.org/all/cover.1791975048.git.asml.silence@gmail.com/

I am not claiming that my proposal is a good fit for disk or accelerator I/=
O,
but every subsystem has different constraints, so it is not unreasonable
that a proposal for (N)etwork and a proposal for (D)isk focus on the
different bottlenecks (still there can be learning from looking at the
other solution).

As an example, in networking we have to deal with the following:
- typically at least two buffers per packet (header+payload)
- often, very small fragments (1400-ish MTU plus crumbles from
  data in different buffers
- extremely high I/O rate with almost no spatial locality, which is an IOTL=
B
  killer and the main reason behind my proposal and some of its complexity.
- on tx no good way for the application to pre-reserve buffers
  (buffers are sliced from a 32K per-task block,
  going to possibly different destinations)

cheers
luigi
