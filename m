Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793201943;
	b=jP18dJin/bcrDyAdelj5v5t+t5a6MjTK8jdYq1RZCqXBzvS7cOm/jvP4NTTXw/V1zD32
	 sKtCcoJh9WoEzAPvRIrhwEfHhai4kUj6SD4RlY1JKQkiQk72ngNuUruWLzGtlvVDHk8pD
	 NfUD8IgfkJP1fYf4V2JluoHNzA7UpJa7FGbxLwZH6Bu0ed55d32QlMUxZHryISHNzMlIn
	 SKLuaQbu9/2dKgILZTVGemDUYlSdwiNyDWR6lvgVr3gbbBEdGmDJJ64BFLXGfVplkiRgU
	 lxGEr+/6Bd5DP3z0IzuUtakPQcubb3rl+YBVGQ+Gu++Vy1LCdBAwSx02ICd71y/ox6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y7xxxnWLJ3cqzVXeSgOYrxm108qFnX6tdnhI16mhQOo=;
	b=CSrEjcAHZkWJJAZVoXrpUnYzFpb0+LeMdVZtNnEZbxqNICasFiVlu+FwM5IAyT/wwznk
	 LvINy1VdgjteCoVqd3oahEBR0GqRgLfd38Oz0ncZlrpVRZonk3XlquamKZlHg3LDUzIzQ
	 dV/Wd5ZPa+MsU5cebAPyCGXQ1WNwjYY5kVojQ7ZJ7IJm7fsVZNs9OlnspwefjsPE43Lg3
	 GCVHYsR4+q3kVqfzuHKKMCqQUOWSjlCm9WsgTWxP1jDdWuUowHnsIGuAZ+ir699CzI8m8
	 gsxqfrJAKoRMFKmhRRQfJx70FiVzBJj3upgW5HnjpfYlAANN04hbnCM+Oi337UY1Syw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Jo/hfhVR";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D39C606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D39C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jo/hfhVR
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4550d8ab15so151988466b.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793201942; cv=none;
        d=google.com; s=arc-20260327;
        b=d9do2wKC5hM3opIkNQrsjDua1E3vaAzmBkM3D5uDwM7NfdFH6uTZpGyfydxneDGGDu
         TRMRzz3Bt1RO1pLGbU6r+H1uCUaSRAeO2j+RUDyyBmtcn5aUkHuNRE3PTC9nvF0pdrkk
         W4/Gvno3qCQJXSrc/O4D3crq+XNOdZEhLAhmyW1FRnLcGl6rKRWTWyUyylsTbze4O56C
         s4Xvnnxd4or45rteiN2pQ2+yZX3wFieBJN5wcJoaDX+lmPLwYytg+QiGGd4OUXrce6jA
         vI6V76i8AWsB6ggDotKtZOfNm9i3zYt/T4Xaikbf3bPix29FFQQyYUOEiiDH9EXJGkRi
         WYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y7xxxnWLJ3cqzVXeSgOYrxm108qFnX6tdnhI16mhQOo=;
        fh=cgbu75a3ig3EftbXTDhg7CDKUlhDNElFs4ZvXKdS8RA=;
        b=CdakyQPbbMX4WOoi7tToS4wqAP/NEOWYtcL9jUQZmfxt9Dj6PpbsXbmB/UaOvAwAPF
         TF0gbC3Hgwsq1CJeWjpCW2wqCYmobT+ZEC1Gn0u6RQu3pTsjSqbcR9VQg/2x9ESFKtZn
         QxBTxmkrQiWXN17JqdKR9TPBe7Lnaqtv5Zl2Z7jofvwe2IkPt0Ryk+sRA3ftPWLvLKUn
         FPUmKs0pIbqgN0Yu2y/QI2bG12idkR20jkYoume+w34LXduQHCZiqLVvkxXY8XOCo7O1
         5WTRXwwWBNaZzMVcZilDYU7yjQAl2xdY0qY4JRpwua//P/u7veR3LQEKwCwX43K5Dr3K
         6xdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793201942; x=1793806742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7xxxnWLJ3cqzVXeSgOYrxm108qFnX6tdnhI16mhQOo=;
        b=Jo/hfhVRv+oZjqTkmJ4+dL24FIaKzcvsi3pdmy3HAlGeHEIfzZHjqlPLUyOGXe4+CW
         wsuVi1Utas9P0WXG7bx1cnkNHsHu/klbTZtjQWHIr0gxVjwzCPPzuBGrqvAordXXNadI
         OKdm3dGndlPEzpukVWLfFzGLXlrjvSxK+70XEYUozWgQy7wPa1gAK8FtfZ5f8iqrzuNZ
         dfZLFNf+mKjskkbpSgi/qIpHqqRNbqzXAhA6LhPTDB36MNu9Fgg3wfujeERwjNlPWwwE
         /KZJ00iqzA7S1HHj3jqFAOSCjJyC+Lj6ef2AIsczC7rTqBfJsZuEbWzJpxmsK8s5UTpe
         i4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201942; x=1793806742;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7xxxnWLJ3cqzVXeSgOYrxm108qFnX6tdnhI16mhQOo=;
        b=wKXAeDCrOHaqqBTrTuHC6TiKLAe3NSYQmCGdr/Sm7o39qNKAl2SRTkeSV/qnCK/8Hr
         ByYGgm0KlVv5OhyIrsEFyngfSVL7cnR+U/nyvQ9A575wkW/E1XBaVDi9HPICkDRPkNdE
         JV9ABKtIldUKT7C61rBZv/OK8wyvNDgd+z/netBIIUu132H8+boRztxPYIdqPbjAnIeZ
         n+sUEPQ8vtFhCTbzse/tA9CHi9ZN7MIgGJgL/CLvX/gGqwIilCban6/1Lbu94XqoAVr1
         /AScHN2pt2bkUhs5igTR/Bdkq+ZpIOkYO1KL0dYLC+BwVrUi7BqIpF6oolmZ7fPoUcpq
         h4dw==
X-Forwarded-Encrypted: i=1; AKwUvBw1YxLvRE9kMMayuNiJG2GvsDZpQezjv95vD86rZFaTaB1pYbjV5E6TOW0i7UbaNPiAbfkdzHtK8lQf7B0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8EZqk03Yl4h3mH+zukUGzaZyDv/2lP27/QpSnpE774T/38dtM
	WrPb+Se66e2dkGrkvchBFIn7mxDqCWtSxClu6p+x75erzYqWZHzbeCyKVC78D/cBy54PZRSBipV
	sn/FQeWGbwfzFJa+6BDlc7vihT9XitHa4byokGjn6
X-Gm-Gg: AYBFou3Vd/IywNVteawQdNsvQEFxBHNLfGmUWi54JHbUHjwgjb+WnmRt8khaZATAQi6
	ZJ/YCF9I/M+rpf/bGTpCV27WutNhBGQ8VTxThgjnSAKaS/EoM2wwiKdjXf7gXrJHNVw1V/fkUVF
	z+HEtXSMpcxqTyda2KuxgpQaKFhTOC82BsH0al880mqOsPTJePCTybncuwXRi/lzHIwujVlnTYD
	KPxF6oYyAK+38b9tA2LsYYUCVSNCDpZu+V5ZQjyEmOoMMU4bIves8y9Lg3l5S8bmeDB6IsXQ4O1
	jkUGbRpTDwBOJborc6UoqTL6XkePzFaJbtGTdgJg9dhkzUC2WnG/HvIagXJWOy19v7usisk3MPK
	V9SGe34BxKnuEq0qO7/A2ekR35HiY9yPISA0BEaEZlXLoAmt+G3czMv4nonMaR+1FX3QYwOstn4
	ZkF9VNedTym+A=
X-Received: by 2002:a17:907:d308:b0:c3f:7ab8:bef1 with SMTP id
 a640c23a62f3a-c49bdf2f80cmr259829766b.34.1793201941132; Wed, 28 Oct 2026
 08:39:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027025616.1632690-1-kevinloughlin@google.com>
 <20261027025616.1632690-2-kevinloughlin@google.com> <20261027053843-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261027053843-mutt-send-email-mst@kernel.org>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Wed, 28 Oct 2026 08:38:46 -0700
X-Gm-Features: AclHuK-vBr-9NFy3pcmA7HqGTQSybdCjlTCvxPcN7DJFBT-excWUi_DEsSkfHKE
Message-ID: <CAGdbjmK_vbmxX5Dti9+RwEiWkxQDHz+Dg9ToNnyEd_z-2ncdPQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] virtio_ring: support per-virtqueue DMA mapping ops
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: David Hildenbrand <david@kernel.org>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Alexander Duyck <alexanderduyck@fb.com>, virtualization@lists.linux.dev, 
	linux-coco@lists.linux.dev, linux-efi@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Sidharth Telang <sidtelang@google.com>, 
	Punit Salian <psalian@google.com>, Peter Gonda <pgonda@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Jacky Li <jackyli@google.com>, 
	Steve Rutherford <srutherford@google.com>, David Skidmore <davidskidmore@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 2:42=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Oct 27, 2026 at 02:56:04AM +0000, Kevin Loughlin wrote:
> > Allow individual virtqueues to override the device-wide DMA mapping
> > operations via virtqueue_set_map_ops(). When custom per-virtqueue
> > mapping operations are configured, vring_map_one_sg(), vring_unmap_one(=
),
> > vring_mapping_error(), and the DMA sync helpers dispatch through
> > vq->map_ops instead of the parent virtio_device DMA API path.
> >
> > Replace vring_map_single() with vring_map_indirect() and
> > vring_unmap_indirect() using the device-level mapping path (vdev->map
> > or dma_map_page_attrs()) so that indirect descriptor tables continue to
> > be DMA-mapped for host VMM access even when a virtqueue overrides buffe=
r
> > mapping via vq->map_ops.
> >
> > Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
>
> Please, don't. The automatic mappings inside virtio core are there
> to keep simple things, simple.
>
> Everyone doing something funky with mappings should use the premapped API=
.

Thanks for suggesting. I will use the premapped API if I end up sending a v=
2.
