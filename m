Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792705938;
	b=DPnp7gHBC+20FMtH2vwXWe7Y4JcN9jxdxJ442xjytB++c5Rw2p7rA8g79uI7CM3YlUM5
	 UYmGvmQIT8HQKFa/rIK4mK1pjATzCrDz/8hhvXdM5IwDRSe2AB+ovsOAfySKtULEYGFbE
	 ib/ZpixsYn1AOcpUGMc4rm0eRUbQIhqXoNHZiTJ0s4GT+hAlAfQNWSzGFNkN28ugRLnVn
	 neIh2hjTU5jzlBcH6ww1p3sH+ANal002OfurYfjXcJQ4BUgoiU6OJcIgFZeuUEkNCk7Nz
	 7NS/MDVBPzJLDY7hp+mTTlH12OOClKTOQcorXG2RG+gRLqAO/+Q/RGHa7Ect2PEenbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=enf2YbTyhYZro8noMVoZG0AyfViHUg43We1xb8wdUb4=;
	b=vOLEkV3bjyVNly6K6tfYBXnMJIshTtNmyfh8pKdAPhx/Q0LoH6dR43xWG/lTKr5NYQik
	 0fIpqbvLVJJtqfOnQZyvFRdUHj5YsyoWV663GKtfH76f1G993uGw2nhZviYrO2+P0cQDO
	 UMoFTH2gaD+8h6y2HS1iZXkw2G25DNtka9bPgowBN4tv8CovB9Q9Vgqxysy0vv/ncKofz
	 zLF1LbmXJ/bgb3u1dT6xFiN4dlJExHJ50knUTdjFrYyKcDHOjQjdozlW19ICpHrXz5vxF
	 rTutYS98LB8v30wx3rb7M40FV8Ga4cxlCm3iGJjQSzu9Tn95GAAa9JRzL3we4bzZrAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="vR4/0e5/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881D660A261A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 881D660A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vR4/0e5/
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9f6a16afcso9805ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792705938; cv=none;
        d=google.com; s=arc-20260327;
        b=bfAaO/bNso5TWHXYu5rRynTaCD/yUMZnJjy3gI6DjfoSlSpgWJA2VvsFCvMeEdzmlX
         q8hEVrVIQsYXs28TQjxjaI0UndMY19vScJQPI174EvqEaKl5E6aHKNxbC0ISrkfNamCl
         Cvez3MUwP25kr0XU5tOATzXF22F3B8ly8iQry5RYgXwuT9VoCbfMwZWzFxhGNx6HUlXU
         am4jIEV6zunGNaPj4q/5DJVXKA8asJtG8CeVxjCk/fx1USFjF7WaMd8VR+ZA3M6/LK4o
         zxOxADjlhsj8/qhrJawgNM/PjTxJ4jK6NFJAnD+wWnGZdGDjSmj7rqXopkJMMBkRldkt
         E/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=enf2YbTyhYZro8noMVoZG0AyfViHUg43We1xb8wdUb4=;
        fh=Mzj7V+m4nHBfa7SIanJWEwvLRXg1LMdyRc5cECYbPz8=;
        b=bMVViawYJmrqNEfXR4nyl66FhmFTJHA5YW7YQBPqiwXf2ANXrIBEKp99UQPa0ddEx0
         zmZAMfN2LAeFiRNVlycBL3pE7A/FfjW3YqJrzOjs6yUp1186ga4PczImkyUMrynamkSy
         wacfWqbNoewcHd/c+LYnVUKU6638GvB5USzigNJ5shrZZCzYKoFQFp+V+gFNxLXv5DIP
         JhFetZbDp35wIaPRhvsp1eXRkTnfLjwqVgNG4FGv1Fl+b9tViU9ZUPvHxql0AljCdpxn
         vr3o3VRKkmBXfvn0fmp8oK0NIN8pI4FIvtfciFirjWQuhF3zR7ZXb2LDN++vbPx5ebeL
         Tiug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792705938; x=1793310738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=enf2YbTyhYZro8noMVoZG0AyfViHUg43We1xb8wdUb4=;
        b=vR4/0e5/JRr2Dvd4ShtgOGqzPoNeNshuP/PbMN+6K27p+PRJxj0xOLZjLQ/0htGd/f
         uxta0kWk2v6K//ugXcRm+sW0jKp0P3QNBL6voAO3LLb4nuRCm4UFAVXfUpOZJywQYAnC
         3btTEhQJA+D19G47JVsMiU1n0aUXjxiQG/VEmTkjvn/pN1ZXsXI/18HpyxiWmc4vSMg6
         U2e62gj9byzpQnohPAaQGDH+cIei+N7NR2J056FqjaB1E1v9J+SP2T/xSC0pagBnoX0G
         3ZXOX8cppcTK/h6fDPvw2QXvsjcpJlPxLdL6RlMJLljJrIh2z9pvnW79r4DpkITY4dUY
         N/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705938; x=1793310738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=enf2YbTyhYZro8noMVoZG0AyfViHUg43We1xb8wdUb4=;
        b=eP9QMppetumSOs/j6ppVO9DbbAyobn/EcDVlO4swBRzhXAGkFXs3xHp41OFsm2en3P
         yYicFMrMTwMiIXHGGp4ym/a30QKDjtzGazE7SUDYP/UoXwr3CBI/DF1YjWWsg7jknu5n
         SBjc3149MCulolV4/WZ0/p/iOiEuy/1oZzJPqJsnWGFIzE3f+nCm+A85ufrs4WkTbmnu
         0aucBkBNkXc/w7lLp0A8VuskhsMkISaJE6JvBSYfy/jhKOskY8BCRi7UG+tv7eJO3UVs
         /tHUQa11Od5OES2mXi/JK3x2QjlT2+c+A6iwTi89WSICdqpgxcTec8qFDC68K5HAEGR1
         LJ0w==
X-Forwarded-Encrypted: i=1; AKwUvBwkR+gkz8sklEZ9huBecVzfHxoSLyg6uJs1KnZqaRr+4aS4qm2PrJjMu8A0K7Reqv0eItIn5On9UbYZRfo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDnHTHNYPHd/QBDDG9LymB+OStUGUt5tLBzbhHr3HHSOUZWScH
	1O3X9gHyhjii9S0LR4WG/w0MJFuJ4zXT2CoiD+YG2yJSMoJ408oueetjv0XhqCeH0QBA2Rn1iux
	YHMe05sy33qzwq61qr+BB8vwsT8aV+L+OTMYMrpKJ
X-Gm-Gg: AYBFou2Zkz0/vbjME6oFRhwK/sxdSt/fbSXkjq4xAGawqdDNUykIN89c28MfoZQJV6A
	WBWaIZhBubvHcmn0L2xoSguxWV1etc1JVn8TRzdlpHzZRengqL3AmqOI0Hue4Na9LK4C0vVklIn
	Rr3cCil5zGwhBwliKDR4mgl3Dapyv5/wIV7FHeLB1GsK2w6Shl3Ag+8XOIdeq11sZQ4wGb7LXSs
	OXLNBktfLy1Yk2+V1zfhRAMnxJ1TkGXSZhvZngs/tFhPPrhUuKyIUUfZjbcBAIiHOybYDUy1S6O
	ciFGResEQmy2ZZXfHkjRrWURC1vUcUxmhfRahsRTj3kxOn02/3u2dvx0lOtJl+TsJjPcYf3HDfh
	TAKP0lriGQRWdYubZK52+EWxoM40+SH4kQ/dhNi+5WddkRWKSxacY4dKDWjU=
X-Received: by 2002:a17:902:e881:b0:2e6:1917:fa with SMTP id
 d9443c01a7336-2ea7ed0feb4mr728955ad.7.1792705937217; Thu, 22 Oct 2026
 14:52:17 -0700 (PDT)
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
 <20261022201229.GH3381610@ziepe.ca>
In-Reply-To: <20261022201229.GH3381610@ziepe.ca>
From: Luigi Rizzo <lrizzo@google.com>
Date: Thu, 22 Oct 2026 23:51:40 +0200
X-Gm-Features: AclHuK-9aqzBfV-60_dzPgAjNzAFJyPZLZoLZFY0CUqnWbJGyVX0XJhPkps5rLY
Message-ID: <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
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

On Thu, Oct 22, 2026 at 10:12=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
>
> On Sat, Oct 17, 2026 at 07:11:28PM +0200, Luigi Rizzo wrote:
> > > We should probably just find a way to describe that this is a POOL th=
at focuses
> > > on physical contiguity in some configured granularity.
> >
> > Before embarking in a global renaming, I would like to get opinions on
> > acceptable alternative names (possibly with a short prefix usable for
> > identifiers in the code). I could think of the following
> >
> > DMA_PMAP (for PreMapped or Persistent Mapped)
> > or, ahemm...
> > DMA_PISA (Pooled IOMMU Superpage Allocator)
> > both using dmap_ for internal name prefixes
>
> Can someone explain what outside netdev would use this? And why you
> couldn't do this in the netdev page pool?

I can try.

Regarding users, the next target is disks (not included in this series)

Regarding why not just pagepool, see below.

FWIW when I started this (after the previous work on swiotlb copy elision
https://lore.kernel.org/all/20260824152932.1583506-1-lrizzo@google.com/ )
I thought this would take only some simple tweaks to pagepool and
skb_page_frag_refill, a couple of days with some agents tops.
But the agents did point out that there were a ton of corner
cases to handle (device detach, reconfiguration, memory
reclaiming, reducing locking contention...).

As a reminder my goals are the following:
- reduce DMA map/unmap costs in strict iommu mode without the DMA-FQ
  compromise on security
- address the IOTLB thrashing problem when using 4K mappings
  (very serious even with DMA-FQ)
- help reduce bounce buffer usage in confidential computing and
overcommitted VMs.

With that in mind:

> It is not a common workload to have the DMA allocator be the one that
> allocates the memory. Usually we are DMA'ing from memory that was
> allocated someplace else.

Aside from the fact that dma_alloc_attr()/dma_alloc_coherent()
does memory allocation + iova allocation/mapping,
this is not what happens here.
Maybe the confusion comes from one function name
(dma_map_alloc_pages()), but it doesn't map any thing.

My code (in this version, and more in the upcoming release)
mainly implements a specialized memory allocator with an
API equivalent to alloc_pages() and variants, but ensures that
the order-N blocks come from contiguous 2MB blocks reserved on the fly.

The physical addresses of these blocks are recognized by the
"dma allocator" (I suppose you meant the entity that allocates the IOVA ran=
ge)
so that it can apply specialized IOMMU mappings backed by 2MB IOMMU leaves.

And finally, it hooks into existing kernel subsystem (pagepool,
the skb transmit buffer allocation, dma_alloc_*(), dma_map_*()
so that devices can opt-in to use it without any driver code change.

Regarding pagepool:
For the receive path, I do use my allocator to feed pagepool
(in the next version I have wrapped it into a proper memory provider
interface. Non-pagepool NICs can either use a few trivial changes
to call dma_map_alloc_pages() when filling their rings,
or convert to pagepool (slightly bigger change; anyways
there are options).

Note that just feeding the pagepool with 2MB pages is not efficient because
the fragmentation in pagepool is done with a bump
allocator, so recycling blocks from a 2MB page is difficult
(it has to wait until all 512 blocks to become idle). My code
has a bitmap to track usage, so it naturally recycles at the block level.

Then there is the transmit path.

For skb heads, one simple solution is to use tx head bounce buffers
some of the patches in the series show that option (the next version
implements a proper tx-copybreak).

Otherwise we need to populate skb heads with pre-mapped
memory. In the next version I have a simple modification to
the slub code to accept an opt-in alternative to alloc_pages().
I considered using the pagepool, but the changes would be
similar and the layering seemed really odd, with a cache on top
of a cache.

For transmit, there is a bit of impedance mismatch as well:
skb_page_frag_refill() does not know which device
we want to use (in fact, it is a per-task so there may be
many netdevs used by a task). We could tweak the pagepool
to be device-agnostic, but that would be a bit more
intrusive (more architecturally than in terms of code);
also we need to make sure dma_map() on those pages does the right thing
without trying to map/unmap the individual 4K fragments,
and we need to make sure the skb_free() etc does
not leak those pages into free_pages().

>
> I think Robin is right, this is just a special case of the dma pool,
> and it certainly shouldn't be something as grandiose as a subsystem..
>

dma_pool() could be tweaked to allocate 2MB and return order-N fragments,
so maybe that could be a provider for pagepool, but it has some caveats:
- when fragmenting, the freelist is constructed in-band, ie using
  memory exposed to the IO device. That is really a no-go if we use the IOM=
MU
  because we don't trust the device, so we would also need to
  allocate extra memory for the freelist (no big deal, but
  that is basically what my dma_pmd_meta supports)
- memory is never released until the pool is destroyed,
  so there is a problem of stranded idle memory.

Trying to use dma_pool for the transmit path has all the problems
listed above: lack of device, inefficient release of memory,
coarse grained locking...

In summary: of course we could tweak existing subsystems, trying
to reuse them in ways that were probably not anticipated
(see the above partial list of missing features).

I think that once one addresses the functional and performance
problems, the changes would become quite intrusive and the risk
of penalizing the currently supported code path might become significant.

cheers
luigi
