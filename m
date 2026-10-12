Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA57492E55
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817372; cv=pass; b=aIJfouP9YGNCz1NUIgrWaVT5U1STbQCrVlTvlAJhxki3fjLU5x4FJj/JHdnPzhn1IUw3Rysc5URt+yf7pZV+4b4A/VMoWSq9om1Itpubq6LMIeOjVlNXjoDO2AUdqi/miP7IA0r33sA/sLhshC2ALEnkBDJpV+OGVdH2kdyHEA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817372; c=relaxed/simple;
	bh=9p0AqvEckCKKmioWpbl9ub4ZG0q2KitJ6iNWSAzwTY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/nv6Hy7/KF95jRz6IaDuFcXHpKKVas16SjEwAAUYFHkShwbE4XUoEvR+8HGHihpXsRrXjb1r4OUxM5L+gPFB4NGRabgey0nRxU7+9OnwxxhbXA7Pn8vkbcFC6ePuQzHCUQ1X/XWoFe/f2bI8x6Ap+tn5+cJnOIiok9B+L2BoXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egpQtRhz; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egpQtRhz"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so909380a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791817370; cv=none;
        d=google.com; s=arc-20260327;
        b=E/hdfSrhuwzsWaQ8aZJ/EXNxlgxdj2KveymVRbxOTzhtNw1/KWzVE6Fcrqo9QTmkIw
         awoIe1czxSjmSLHLFLIEmo1ix3nkNFUJpi2oxJrtbkqh2kFA8isdI49Pi01224NL/4hC
         2U7zbdOti4zACQjODdjyEHYpLW+huqdDYDRWug4zMPegHdhxihh4a9G2HUoQ1mze/HzM
         fvlBzhgx/agM5qzaXCQfKqCxGop1cEBV2ndp+HGa8SPNFGp/dsua7Kgc0emlspFcEtjP
         vWQB3fnsjEY7JZ+t96Mcp+8BRCyucvQ4SbVYTw0QMsKrmVwKlzI1AiGwpQ+GGHgyWM8o
         MJVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rhIDuBLHbJsBmFiUrtUWW1GlGqZnHdg0lmt6NThkZTI=;
        fh=S2zTVQlmcXIN8kAvT5nrbkgBsLcoQI16m3SOcPOcUdY=;
        b=Oui3AKJ/cW2JyA5rXuY5dCRO9VzVU9sK/RQqKORbx5V/cltWcGIFZIF+YPjrZ4wpAl
         YpGGVAIiD4zcHDMyHw79sjONpsxFesYNljIyblqrYJ35o6gf/JkV5pdIYdkg/aFaLR5t
         fcoY/F2hFb1/J5gHnurXh4NMLx+CBma3T1B9Ye4fTIfJdvv9a/0Oa+TKV42RuAHkqJ0s
         P7dgAmtj4efGOFW8Zx9ElQEo0481cMU9n9sXu8/34fMEXBxb3+lVMj7lpy9HaB6ZyafL
         6FTe608EPyktLderkHUvNLIIRAPsWCjifInG4IbZvxV9rZjsEDxRjmR/kax6bArv7fFy
         Ue6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791817370; x=1792422170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rhIDuBLHbJsBmFiUrtUWW1GlGqZnHdg0lmt6NThkZTI=;
        b=egpQtRhzSGqWQW7AvRR7AXcGqp+Yyymm/Cc75KZEWZvkOkG3Y7SPX8itba5G1RWlBx
         Ac3cNVJUlnZWf7wU6NP1rzxp0hcNxLZvMQYcaYLWuI2XSXFXYSQaGfFHzrvuNK3nACdP
         7fJJnxzLHQXwI1+alUrzlrl27tg4MKJac6zprntWGnclMlMZUbcKdOszLyPmuYQ+fmWq
         3oiS6q0WuLSpnb8dTCl1wfiqSlbPv2Dw3PkD5AUNVJ/a4O3m4GcApMs8k/q9BjOiyR8D
         2AtiNMhxAuuxBRXclHQPST/iIlvqBBjTToFYuLal7IBLTRtU2PZPER10S/X/ZC1cV0pd
         6Q4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817370; x=1792422170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rhIDuBLHbJsBmFiUrtUWW1GlGqZnHdg0lmt6NThkZTI=;
        b=FcbyBoxZXKJ+lrnfo4RBfN6XlqlFs9QUFGv12xo5s2FayuFjedXD4H6VQEL09KJbpD
         nQ6Jzpu7n07Bbu4FrjWYI6ydpz6mRyGvUcZ0rrDfGufY1do5WJfR0qJGggazYKNn4WUp
         fpE2Kt5e5CYkDrPUvSLH5zeWvLFkwZfbblE12ABAE/acUmH7BGajqT7CGnA5xe6sd98i
         XEZLAz2xtMnc82gcS2pMygCYl8CAAQ0QFvZ8bVW7AU+AEIZMQfnzDg1u6vMOqxnaF/yT
         DHRTm9O3AeA5Dl05CAUMcdgiTqHXxzZCD/Te4jKrDhHtjit/CVLD2LbViOG7ckwZG+2h
         Ck+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzw2FzP0Gp7XnxVhWQi8740MZqKwuPACnujkgGShac0eNcFvEfvRLIZYTCTOwOK9tqDOnlIuj3P3GKhl8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlf7TmAjvO9+TcJBafN3CNiwXozVoKumWsXitSMnPzntDd2l4/
	EdvMfMdvh9JWmX/O96JRP/vcaItiFDR3czKRt04Qc6zksmz7Z5RTw6LOXBotmVoVwRMN36hm9bJ
	ZrUXffTIJD453fYGGLcxS02jkidtqE5g=
X-Gm-Gg: AYBFou2/ZVlK87A765kCPXtCFa/jRkwIGpdAuGTYH1usV4DjuSSBZhTPST1b+4r3fMx
	NepdqXcspsG4OsvAL3qPbQqsMnnrsC5orgREkew/0N50P9+H3fAdOLzxPFiJsEHuO3HUGuWUhp0
	RC6Nlxw/U64a+Gtx+9XgA6Yvu0jqxrKtoQZ++hb2SI8UKEV1HNO/I/5zF+uir2Sdjcvl/hgqeAB
	RJ/EjSzTbOIVhWKiaksT768ERgRRkaDLxNy4FfhdhB1SDIr+kOVQeDi05g+2nXjlMZx3LgsfZkB
	37TsMqj3gGi86KHR7+9gce5Gvva7PXWviyu161rGCjE0wr54wt6yrMSsHQ==
X-Received: by 2002:a17:90b:1d4f:b0:3a8:c0cd:57f3 with SMTP id
 98e67ed59e1d1-3ab3a94ff23mr7233060a91.18.1791817370093; Mon, 12 Oct 2026
 08:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <aszzcpW6fJWGcQCZ@google.com>
In-Reply-To: <aszzcpW6fJWGcQCZ@google.com>
From: Luigi Rizzo <rizzo.unipi@gmail.com>
Date: Mon, 12 Oct 2026 17:02:38 +0200
X-Gm-Features: AclHuK_RuYPmfWCEef8B345PmPnIk-csUIxQogHwwsigc85_8kdg-6GHSEnG77s
Message-ID: <CA+hQ2+gMGJH7J0yAx0ooTpWYfC50FnDXvCRRwRaJ_8bJ4b=QDQ@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Mostafa Saleh <smostafa@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <lrizzo@google.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
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

On Mon, Oct 12, 2026 at 4:49=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> On Mon, Oct 12, 2026 at 03:51:39PM +0200, David Hildenbrand (Arm) wrote:
> > On 10/3/26 23:22, Luigi Rizzo wrote:
> > > Here is a subsystem called DMA_PMD on which I would like feedback on
> > > architecture, possible enhancements, or kernel components that could =
be
> > > reused to avoid duplication.
> >
> > Here is a feedback to a subsystem called DMA_PMD ;)
> >
> > Why is basing this on PMDs (and embedding it in the name) the right app=
roach?
> >
> > On architctures with large PMDs (512 MiB on arm64 with 64k), would we r=
eally
> > want to use 512 MiB pages, or rather something smaller (e.g., 2 MiB) th=
at might
> > possibly also have TLB benefits (cont-pte)?
>
> +1 I raised the same point in the LPC talk.

See my other reply, he code makes it clear that the target is
reasonably-sized chunks (2M being the obvious choice with 4K PTE/2M PMD,
for other cases we need hw support, and it is relatively simple to
decouple page size and chunk size.

> AFAIK, this series tries to solve both IOTLB pressure and CoCo bouncing
> at the same time which might be too strict; as for CoCo there is no
> actual IOMMU, so there is no sizing constraint.
>
> Also to reduce bouncing, I think it is sufficient to use the SWIOTLB
> instead of having a new pool + recycling, the tricky part is how to
> abstract that to client drivers as this would be needed beyond SKB.

I did have another series to build buffers out of the swiotlb pool
https://lore.kernel.org/all/20260824152932.1583506-1-lrizzo@google.com/
but I found it does not scale well under pressure: the existing swiotlb
pools use linear search to find an empty region of suitable size,
linear scanning when one pool is full, which quickly degrades to
O(N) on each allocation.
I had some other (not posted) changes to build a buddy allocator
on top of the pool (so searching for a slot becomes O(1)) and
to spread the search order when a pool is full (avoiding O(N)
locking conflicts), but there is a bit of extra overhead in the
light-load case. Also it felt like reimplementing the wheel.

Overall I think DMA_[NOT_JUST_]PMD is cleaner and superior.

cheers
luigi
> Thanks,
> Mostafa
>
> >
> > --
> > Cheers,
> >
> > David
> >



--=20
-----------------------------------------
Luigi RIZZO, rizzo.unipi@gmail.com
 http://www.iet.unipi.it/~luigi/
 Mobile   +39-338-6809875
-----------------------------------------
