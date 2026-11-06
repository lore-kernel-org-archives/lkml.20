Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793988052;
	b=cw7Lc4y0hnMMkG5YhV+0OZIr9oW+gnxmkddfwVFJK2eu9os/Wq1TtOudIQciJZj3ptGF
	 zf3sa0K16tCtiWSHmbshcuZ1ewm/mxxm6uhiQ2f3gwkCJ4Cx4Cdl+2EbUaLioYYcAJ1rw
	 u6RsgGft6a9rwzV21rXyqtXz1bWFEOS9Hdwt5ZJpHgDNYPpPqLllX0wmhuUzV7UccqWAg
	 ar2unOq/Z8cUuK6kQk+CDrtjNlSPT0LqX7fsLrgXpSpNUNCaYQ1rFkAnDUZblo4Kjvms4
	 AR74ph+0bZNQgy48x/8QgS5OGDMKlFFYP6oONq1YrqvYX29Di7WRdQw4VnpyHkj0LQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YnPe9jMocBvynbA9CNTJ1Pl6eniz/8su5Gj2vJyxmpg=;
	b=SzkVjH2breCdGJxOE2cd7ojwwcIoQvzj6ZAcLcOnO7qpnxmwnXsyZEFNkTkW/s2Y5Hse
	 +8BqsbpJA6d82Eh8A+6Ob7yxTF5bVKV63mMlR58JUeOM9mYZllWwITdtwDF7YXKRFHWZP
	 UvjBC+6XDM37/pg1B0HmOIAcuTHHor8KhndmuwqscRxuUhgt2HZclIYefd3XNMNv6USvC
	 MrXrg6q6HiISsX7xMfQHPkLMBrAGGTpV1mPpvYXoN016A7VUU9QCRD8INo+lo9KID5r3G
	 rBLKBq92/p5Qzl5QpHg5uFqA+5144/iR48mnle6CGx3Pbj6QSKdR0kqrs33yWdN2MHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QoecesZE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A90606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A90606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QoecesZE
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a018493d57so13235e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:00:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793988050; cv=none;
        d=google.com; s=arc-20260327;
        b=rCzEt4JmFe/FqZa1v0+Te9tJS+w38tiLCkCa3gi3f1Ldnq7UH7uVj35YcKbkjJRd2j
         wwnC8EjEU2FfnGKjVTKstGXn1RaMjW5EZ/QfWmBhxMeTHgb0eSb00RefH0g2nUW1/yuj
         0LGaUyDvWMsRKig4A2ZiHZn4qjnebDjhvl98SQWRjTJNF3l/ZkTUtSGcHO/riGogWBjJ
         F/Z5KrpPZgfpGkynQPhcM6NskIF2OFkmRICs2WYyKStzuSEupqJdGaR8bC27fvymt5UM
         h588yNzDWOfbHan2KBq2+8uFVXhFEsA142dkXjBl1rNx60CdQn4syCj0xM151FiIvsRU
         YArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YnPe9jMocBvynbA9CNTJ1Pl6eniz/8su5Gj2vJyxmpg=;
        fh=gSKwBE94Sonbk9WrRaDdu6QoEFEcZa1kgXu/hwCUPJo=;
        b=kmeA8utKOqdi7xdPWlljtnZ6YRJKnFP8W5WxLOTp+F6N2lWsgNjPgEk04TYf/rWWz2
         YP3MwzXEvJknVza6iceY+3x0LR6ZHtRAMTSL95KNEyXC3xFOqLp5kSLHWCxi6bnSN/Mj
         DQIFMd2ihzoghDQGoKepkFcpsOBMaF2OVuI3UbL0zYX/W+DJJSdVkivPPVF5h2KKHDZ1
         4zRqnkcxOqG0/TlS+RO5Ubd5jOWN4vfx3Yl6h/KYzF9k11QidRdShJiMaP7f8IiB39Hq
         4THHw8Ken1ePT510wNuT1Kh3mMIjRjrL/+v3Bla7wb29nx3yahCCtQKVQZ9aScDgqvlQ
         UdOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988050; x=1794592850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YnPe9jMocBvynbA9CNTJ1Pl6eniz/8su5Gj2vJyxmpg=;
        b=QoecesZEWdYh3VkL5qejF7mvJeTIRcWMeBzM7OpHnLqetsCHZK3GbCb4NGmtB8nhMW
         2GjUkRjQdN2500zoQiAqGqwF23J3T/2CHnerTz9RVr6QAUZgl+7r5vDGroRMzWI0jlrB
         8CriSf8HgaZn7WcDdIwuhMGmKtVOP0ATgA/mdAXS/Q36ZtmwST7JHinv5NS4feWIjfKH
         aEY7TmDxa0fVv+OxA5nKSDUpPZFrvNz8ky9qr9+I4JUMhbKKOIS5bKCfm9UGE3vTupcL
         eMNRQBsbdVMRtNrGOpudi4H+DFAwNJX6aTunShMWsRuI842LARoXphuXJ+Y1RamLrtkb
         vadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988050; x=1794592850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnPe9jMocBvynbA9CNTJ1Pl6eniz/8su5Gj2vJyxmpg=;
        b=Fl/DZ/FGBahI8dN4vg8lHf5hvIOIQV8/ZRIZfPtbz1L4Ox1psY3X8GlWLJDTvhWArX
         NuwIpqoBuxGhn29w4vqIGRauY9SfwOW80uJ8xxNakVBUstPx192WcmiCWejHXxkrXQR1
         PQDV33IFskgZ1aQ+miGfgKlyJH641g+fGqBLhhAOUkn1vpisnuK+mOttM2Y0+1ZecvX9
         uQ15TUkYicbYCl4VeDMIIwU/dEEA+dl3ppRUCKM30fd/E8av+2240w3cCpiz6GChKa3I
         LsNdbEU04lppW5gbDKYeBjg0QfggHOc54tBJI0RswTt1t6xWS1yhQHWLaGMQsi8qMdsB
         E4ww==
X-Forwarded-Encrypted: i=1; AKwUvBwJPEasLWFXf1Wdr3tdGiRCL7qwRCVesnUZ8NX18b5FUR1+2/g/gEGQjnHxZ55lUFPcUda5wQI3otba22c=@vger.kernel.org
X-Gm-Message-State: APuU4Z83ZEtt/5avK4NJHpHcIXRLeEitG2dYjAGvXsN7Lom4Kv7z/GcV
	2G9+EuWu+hFB+r57QjoDncJ/+vha27u3pftn3bP0teRT/SqMjQqRQE1uGSl2aEpdv+CtX1/gquL
	9Q3sdyNCpczNjRSI2M7F++XjJB9O2L5QIHKH7PezO
X-Gm-Gg: AYBFou2RQGLzKIZIwMsUbow/odEc+8bDXw2yYzblNdMvQIUKDnVgIjhEs8SHOOsPSPz
	Ul+3UUXvW3G4jVzoGfS8yuMgT6MNWceiSSIqHaPB4iWwCgs2SsCe/1Rb78OhHwmkNRFLKu0s+u3
	2lcU3Wc/0oX6gVlxMJp6WzD0zU8l/vOmIA4yWC2RvhSLOiM6fUkh0QqJi9S+h4K0cxpRX5Qd5C+
	2bWYAd7mJZFosdrqIZDcnBe2kaXijP4IjMveo0AmzFD4PzNYZC4U9ninE06g05suOEWtlUSoyzf
	woXyUhjsX5EyHWQSGKYQBcN0frw1zAIfc08rxqrXeH2lkuWzQh+T47HU9aq0kUZ2e2YRMwABnbG
	z/x/IsH+BzJ+skcm/GD3PbURZBfa77Sb8Eyp267qsArePqlCPGCHDkidtfCTQRaiNqCfLdA==
X-Received: by 2002:a05:600c:c3db:20b0:4a1:fb0b:1c9c with SMTP id
 5b1f17b1804b1-4b78a30d10emr50205e9.10.1793988049366; Fri, 06 Nov 2026
 10:00:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
 <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca> <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca> <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
 <20261106173054.GH663069@ziepe.ca>
In-Reply-To: <20261106173054.GH663069@ziepe.ca>
From: Naman Gulati <namangulati@google.com>
Date: Fri, 6 Nov 2026 10:00:35 -0800
X-Gm-Features: AclHuK8x57W7AnFw360PBbTWaHMwGgtNX68cpPd5ipqmMu4tcyLJQyWTDt3UxIA
Message-ID: <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christoph Hellwig <hch@lst.de>, Luigi Rizzo <lrizzo@google.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
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

On Fri, Nov 6, 2026 at 9:31=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Fri, Nov 06, 2026 at 09:21:08AM -0800, Naman Gulati wrote:
> > I drafted an implementation [1] for premapped TX and RX buffers on top
> > of the existing networking page_pool. It is implemented entirely in
> > the networking layer and extends page_pool as the default RX
> > allocator, to the TX path. There are no hooks in the IOMMU, DMA or
> > page allocator code. I wanted to understand if this implementation
> > correctly captured the feedback on this thread. Key components of this
> > design:
> >
> > - Chunks: as in Luigi's series, memory comes in 2 MiB chunks, but each
> > chunk is mapped once per opted-in device through the DMA API and
> > records its IOVA for each device, rather than using a shared IOVA
> > window.
> >
> > - TX: page_pool accepts a memory provider for pools that are not bound
> > to an RX queue. Per-CPU page_pools take 32 KiB pages from the chunks
> > of their NUMA node; TCP copies sendmsg() data into them through the
> > task page_frag and allocates its skb heads from them.
> >
> > - RX: an instance of the same memory provider, sharing the chunk code,
> > backs RX queue page_pools. RX chunks of order-0 pages belong to one
> > device and NUMA node, and are shared by that device's queues on the
> > node.
> >
> > [1] https://github.com/torvalds/linux/compare/master...NamanGulati:linu=
x:netdev_dma_pool
>
> IMHO the netstack should never read from shared/decrypted memory. If
> you put it in a SKB you have to be sure the only touch after that
> point will be a DMA read from an untrusted device on the TX side
> (sending it to a trusted device would be a fail) and the final copy to
> userspace on the RX side.

That's likely a fair callout. TBH I'm not very familiar with CoCo and
will spend some time understanding the constraints. I kept CoCo out of
my implementation as I approached this solution from the overcommitted
VM problem where we are trying to overcommit memory in VMs and use
these pre-mapped pages to avoid using bounce buffers.

>
> Everything else is very security questionable.
>
> It is unclear to me how any of these page pool proposals meet that
> requirement since page pool typically provides memory that ends up
> widely used in the netstack.
>
> Jason
