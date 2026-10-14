Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968B556854B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001720; cv=pass; b=PJkuHelseB3MEXKdBLnbIIX1n9eF8YY6l3i2vmZI4yvYbxf2o09uTYPHkMmQjRq99RTgSjmai7poHmC3Fpx1IHqaQcXL30OthzElchThXJAsmwLHmkcvEG1leoFOHO6G7576s9KWoWOjVQaTd1EVBNmEw+PubbKaqiFM/a7ySTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001720; c=relaxed/simple;
	bh=ZDeZDQJcijxdIEcisFFhzJK1uUV77Ej4r8MxO3z/x0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cs+7pDrEVGpWbwy8E0YlSpxNGGuYlBf0wv3gPOEGpEFhjf+tdOUThH0IcKHSOpfXbwwrFnrhIwg2waCDqbR26ahXZecjFdhFQydwTywT44deBd8TU1bEc/lojUxPaQc9YLkzGpgrua2z9R/Hxycaf8uATkj8aTgfHE1idMOKgvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eDZW5tE0; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eDZW5tE0"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8623790f8so247755ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:15:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792001719; cv=none;
        d=google.com; s=arc-20260327;
        b=B/c8OY4H/HpaoglgWOJz9GyO3hlO3/CAF87Npc3sdT8n3w1Zh5oHOFPMFX7EAIGNV4
         qDj60M5SH2gYLVhgerX5nNNZv296N0Z0jyugtN6sXn2xdZJhKpvGnmcD+poMaH+g6khR
         5YHYkyFzG5uE0BSJkWBFrkUF6Q04o953AiW2tMZ79p6/FtAcxauscT0C6K/UXogHBtY5
         r2WYWzvC010J7j90UHZDAKfnadUI/ATKUnkOYaS+6vRd/aRTM5JaBiF3lu9cbIT4acLe
         I3Z5BD6xFTanWdKucUc38aXZblThK3Vpd0Ak7gS44LdzCrp49T7zcvCUeMwvz0xN3cDm
         hODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ukWxxq7IJoiKFikFQrOXvwgn9jZTFnVv2R6ijBLFQBc=;
        fh=Tg9uUayNcVktAtb79sl6OL4a8uf8rkrc77mh18D+PXQ=;
        b=F43GyFoKtsZNrIJ5qGbmWzsDkers1oCsX9ZRWlGQ0WVPuivfe/eRMJCQQ01zWr2Ck9
         n7nCU3OGdVKEKibyuhidnAYSP32vUHzyKhWytu4Qoo5DReBwwx6TQQslkbk2Q2zsyqHx
         aXxejiYDcdE+rhjK6jKsYR6se/a43SVRysGDW4iPaguVjtQRYZ9DPPi305GpCh1UdSGs
         3Vti/gfo4og1uSgcMIkBymrCoVz5VTjKHXFOUqVFbxr8AtoaeDYgmzGjtqsVQ6I0hGBp
         beHYaC94zMPLBYsv7gDok1IPEeavpu7KgjAGhdepjMwOvrXIT+RLkvMbqbHHZCZ7iM/F
         m9DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792001719; x=1792606519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ukWxxq7IJoiKFikFQrOXvwgn9jZTFnVv2R6ijBLFQBc=;
        b=eDZW5tE0H0i3voxRY8dGPIy9d5/DPnjrUI5jZBS4x0h8n/nD0pw0WobLo5KLT9L0qE
         kdA5Ttczp2IexcEIdWTMpnakZrUXPVKi6J4s+PLvirAd+g8KLRld3hKUgoDCEukl5cz5
         2gxF+Budk4PGlFpKYcMhL2RjacadtMLfdXRooXjlvfYTjVdQunaPVKxFFYLTihepN2zo
         oj0NJjwa0roM/fjLYG376bEkDiYLM8x+zsA6pGzOHO0LPlwOwSMPpeaBcFhRNdSXq1Vr
         tB8GEHdz6igWH8FCPOIP/ujQiHNB+uwW9MTPkTqzwj0+PIqUUXNA3uK8+NGyAkH2in6t
         EjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792001719; x=1792606519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukWxxq7IJoiKFikFQrOXvwgn9jZTFnVv2R6ijBLFQBc=;
        b=2I9z2ZQFBLoSKbazcU1OPe0S8ntceZzgxB/RQOiAcwR9sAk7AdaAZQo/afY2wrTv2A
         sFymBhzK3DnBS6NgIa2gi5caja95uWT8GgSmnWS+GzQwOYVwtMTAz9Fs2O7X63JGDy/2
         0rcHC48CIim/OFaSfVNoWEnsihN5L1140hYOzPiFuL1r7QAQSjA5Tp5e7FPR6qmkPb0I
         IZfiLXsKyhz34VjQzuV7pw6UHBYz8OtfnZ/ftVeUcrLWyeOfDQ0PKIKCJw7BRmL5BAgC
         oBFD2QiCDKRzbmOPKwZdM1/AoOQn0OKmTaw/cqsNyBceDhKtBTBZf9ztLJhuNH5ulWkq
         xI5g==
X-Forwarded-Encrypted: i=1; AKwUvBxZRoQI53BIzcO50E7fcwx3QxerS6obj+T2XLtcpAYJpOCaTknckFRWh6+URCbbGhsZozHJkvsnOz1bx4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb+Hoa8fggv1SQZY2BJ6eBpSCo38S1lxPH4ePnJ0HYQtItSHIX
	CuUNRh6FsLspQMHUVqLaTmrEQvJ8Gb9VBikzEeFfQotPIFN0QpcmCW1BEA5xWUPbfk+kj2GA8yz
	WkaQvXvLFdv1dMIT4JKhlIz8XueZihdYeEB8GxQ1e
X-Gm-Gg: AYBFou32QiLK5/mkYiHbql6rHBN07lclaRKMJOcByX237+JCi9GTjo4KihJT69NK4KJ
	nfgwQrEx9ndvxiuKZnpZ/CXWzGP4QENEa6qJsFhaZ7eCRhzRdWoZo1O4zLXtXSu7d3E2YO6Y0/M
	3nfHry00n5nCIlizRxq2L/cAXTlxuwYA9F4QqfuSXSQ6gKFwl5psQaLdGQMtZRN/9N8U02GN5JG
	5kxh8PweWKK93/GRnMom/p4av7HXJ8zwzM72iabtd7PIvJVY+Calx8AgyI3ppOUTCFaEUFtS3hj
	Ziq043rsPsS4z8rLi4clVmMHhgIqt4ilyIlN0LzYeyXxgr1dvGzhcmMF
X-Received: by 2002:a17:902:ec86:b0:2e6:1013:ad57 with SMTP id
 d9443c01a7336-2e939d090a3mr4279565ad.12.1792001718105; Wed, 14 Oct 2026
 11:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <8584c31e-fd93-4f1a-9929-e71c5d9ccd0f@nvidia.com>
In-Reply-To: <8584c31e-fd93-4f1a-9929-e71c5d9ccd0f@nvidia.com>
From: Luigi Rizzo <lrizzo@google.com>
Date: Wed, 14 Oct 2026 20:14:41 +0200
X-Gm-Features: AclHuK9G3FSCwwu9o-cWYwZA7nUn_K71LEEmvdGinw_0nCstr-Fs63NFljz-hj0
Message-ID: <CAMOZA0JiGhVmc0PXajBzha3cBY-sdc3pz8eLCCbt6=hmsEh65Q@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
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

On Wed, Oct 14, 2026 at 7:28=E2=80=AFPM Dragos Tatulea <dtatulea@nvidia.com=
> wrote:
>
> Hi Luigi,
>
> On 03.10.26 23:22, Luigi Rizzo wrote:
> > Here is a subsystem called DMA_PMD on which I would like feedback on
...
>
> Thanks for the RFC. Here are my notes (some points rephrase what was alre=
ady
> said):
>
> - On CoCo VMs it seems that the only way to opt in the IOMMU optimization=
 is to
>   also opt in the copy avoidance which is not always desirable.
>
> - Having the pool generic opens up more visibility from the untrusted hos=
t
>   side. Having device based pools at least isolates one device's memory f=
rom
>   the rest of the system.
>
> - Also, device driver could help with provisioning just the right amount =
of
>   memory that is needed. And per device control also means that probably
>   you don't need to map everything RW to the IOMMU.

Yes on all three. I am looking into providing more knobs for different leve=
ls
of opt-in and isolation, so users may adjust them according to the
threat models and performance goals.

I am not especially worried about provisioning because the system is
already reasonably adaptive, and leveraging existing caches, the waste
the waste due to allocating 2MB units can be kept relatively small.

As an example, the update I am working on has the following:
- a lean per-cpu cache that can be attached on top of a dma_pmd_pool,
  similar to the one used by the buddy allocator. The dma_pmd_pool will hol=
d
  the 2MB pages, and the caches can buffer smaller sets, reducing the waste=
.
  Useful on the tx side.
- on the receive side, one dma_pmd_pool per device will feed all
  pagepools for that device (typically one per queue).
  The pagepool is already a pretty good cache that does not
  access the allocator often, so once again the waste due to
  partially used pages is minimized.

cheers
luigi
