Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793202008;
	b=LxbQr/VbDliLsk8qxazayQO5j7efvrECvvE0+ZP3FzD7/Q4IEW9oENevVSofucigzrmL
	 FBODO5Xvemdrx/b0DpEgloQFmO+UQGjuFjuHcebXDVdyagaHIMJ30fgOw9dPS6FrOEMfp
	 tdSHuEo3B2Wo0U71ZFRwQdvAcXIGJ+eH3ovjBWv+/fSR3ycjdVON+ZmxztE3IlMpCAlyd
	 FBAsg7yWRh8x2SHrBKUiz13ntEroNQ+3xeqfXjk1OHLErbjw9cWCWIKhF9gC22I0qOdcY
	 3Aok3TYAdFenoczaklz/0SQOX2xeoQIDbNlDkmIQcvS522rKuOD11rn840jePVh+Pwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0L3UJe+6XjER+KzlgRD/7xotzxSyGvuQzLO/yjOCn+Q=;
	b=nQr7JgvGN6a8JNTWBMvFpwl5qTrXUj/sWB9M9BYmKJ65vIXHezV48sNeWj4VVEwPnhCF
	 KCoWm36A3dPzeXa9V25GDxV6BrEuJrjKrsfKXXVeq/tCqtrboxrSQseyFTAsMnzLK59HY
	 V4M3SggyHBXYTnuyholprCqPqtVadnfkqAHu+ksugV4/hqpV205tBaGftNku4S8BnireD
	 GOTl8Xgue3SrLfJcks4dyL/v8u8NuQIsQxrhDQW5io1cDR9z17wl5pcf3HFtZgDVllC6C
	 /Eqy42A8Z4By2yMokYt6Q16jv4eTCg3F3IeH45igtFmEXTOsW2BgH4Ku0PI1ErSs7Mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Lzrv5baS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1909606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1909606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Lzrv5baS
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c46d41f6af3so165820066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793202006; cv=none;
        d=google.com; s=arc-20260327;
        b=LITVjBNhMdz5feVnbZaW0Z7UXE4HMmTlkBV4VoWPDHtSgMtzQJhjugENrtWyDnfejb
         bLA0bvSP5ctYOKhzEAG8UqNO5/WwySxagHMjinIIgoC85h41G2TB5EIFsYdUu83dCGum
         crNDvpc9kzhkz3srJkBda92rb4BaTtg47SNTj5x20Z/85/Euc4Op4BK0ZpY8NZA7REkQ
         TPUCbH6BmD4UfwzGHguu3oOWLjfn8z3zWlV0uXDgeze7S4pN4i3aa7UZUevNYxb+DAkz
         D+I0n7N8JkCVlAJVL6USjVxql01sPGm2W/yY+kVn1JX2fPWzp3o/CtnTrKe5vcT7hcUb
         GTQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0L3UJe+6XjER+KzlgRD/7xotzxSyGvuQzLO/yjOCn+Q=;
        fh=2HP/g1MaCElmqO9viokoXTkqOLkSBRnjM/ByUvTgF7g=;
        b=svSrhcVsYqVRDtaiL+wkUrQ2bSWuHUMcHLTiqQifqiehslsl6NkWot/HaZAH9j0YDV
         bUQzg0NZ0dapGNX6SXoYpvAwYHMpqKQ/HVOfmSDFCty0GySPS2fDuvtODuLevIZ7ldog
         Y6sUuHNdq5Aq/+0PeOSMDR/3GZoGm4x9nfzz2NWSms6YGnGqFsEdyjDjquesADpMsNCk
         YAkBnsbkXKUECD4eZpTqPrku80kCKmqefORmxSp+NhAp8izev3MQdDnJUtav8c5mCqzt
         g99mGp3eS47pGAj/X4r8ZBmjbWodsEOINorgv5+9vgP5xQVvMSbJqbk/U+nGuNYjCVdx
         ZAhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793202006; x=1793806806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0L3UJe+6XjER+KzlgRD/7xotzxSyGvuQzLO/yjOCn+Q=;
        b=Lzrv5baS7hZO56ak+j11CZOpo9nSwSzqR++f9YLzcEmSTxWwZQFwBFUDMJCR2ak458
         4zMWtmZpd7fl6+iHDAzFDsltCruFoM9m3rKAF1nbPQ38QQ97sY2Oupi3jTQRUS0z07kY
         /4Z189+g74DrIJpLSPIaqW0Bv5NK/A9ybyIm4LoLz8S2Dg6JPDCBW/twsdfd/BstNY1X
         F0WE1g9ZDMJ4pA1yfDaNgvWXRaX4rRhgbH2DVsxdAtmw362z1jqaE4q9w2rVRSV1bYNz
         pdw0GNIfu1bkawf3pNYOq8fyug2JYA/oXfjTKXh6bb7aKySduRXo4Bb5IJ2R/4FiPFli
         vAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202006; x=1793806806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0L3UJe+6XjER+KzlgRD/7xotzxSyGvuQzLO/yjOCn+Q=;
        b=zpONu4XV8g78v/IrqqtDnmAuRfTCu4F5welF73oAH+tQshxwXZac8xmFKK/d7EVb0G
         mpQ3MpohxL57RptoAhVOwMw3XzUFbRn9Dnp+icp5X7huUMMHCEbxRFhyVJIekAI+M/p8
         xSRCQZZY48+NWo40zsmY3d1frr4KTXynzP8ldtvaVR65ZwVqFzcOjqc7zgFtnIQLUG7z
         Laxo6YHtrUCiqm0ys9Nw272CMu4OlsbjjN7iQtnukbZddlN5eCGi8pizshJ8nNYO8Fnq
         Vh38MUJ0qdfezLgvDBWzpAdh0IX8VCyePQ6FvVYj9etoQlodEHBafQZmeAdVOEAIDCGP
         Y/iQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnVw9m34BhubAcaw5boDZSeXxjkOYf5tFV+3fFV+HDkdYtb1qGF0MeuSv210J7h412iRg3bQz0822EDoo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQPWtNnvq3ndbWpXVL/PSdiGwF8iyA9nq3N3wV/Uv1NBVLYpMZ
	R6kGQyJXPp/jM+4+gZPH8Vit/D9IxvmLb5DmUB+bAe9FHIGsaeGqzTnsawML7NhZYVsc7mR7oiY
	HExjRmAfs8a4aeBKcOpzD5GLf5ie31Jb5M20hYIxg
X-Gm-Gg: AYBFou0Gjk0DF4QvC7xjFtNV5bU2QmBnLVDC7Ih/RCf1VkZdL0lBEvoHxbAnG5hJrE9
	ufGHv2un9tIdCKVA1YGqbrSO0EKWgJd2b8a2VC0m/5phIHMSbkMNLWCbHkmBhuRd5taUFhp59kY
	UJ9ANQ4Bv3c3HzblxMZAdgwznG3mZdmhs+qPiCxrBrC5APYvNBdZiZMyjqnuBSzKpxxb25JEJwa
	XIdH6tNGpI4Zz2gJW40XMeBhYt9lU9WkvQQjCFrlELIQHqp37mLBQwmS2bsBlqNiN3nznsGUIWF
	d7DGbGCjI+xivtad45dKCvBFlSXMe7ljlP2l8XA/hKuEujUpAQMeI5bn2ELzIyOjOVFPczT4c+H
	S93SX7qqxj1Z+SiunZrpbVdaZrRn0utaJxFi2FswKDU1SR8i41NiYsRzVPgLFsn41/Q==
X-Received: by 2002:a17:906:9f86:b0:c41:960c:8c62 with SMTP id
 a640c23a62f3a-c49bdfecbf3mr243566066b.30.1793202005586; Wed, 28 Oct 2026
 08:40:05 -0700 (PDT)
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
 <20261027025616.1632690-11-kevinloughlin@google.com> <20261027052057-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261027052057-mutt-send-email-mst@kernel.org>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Wed, 28 Oct 2026 08:39:50 -0700
X-Gm-Features: AclHuK_MLzRdQo76ylDi6PC5wwAQyJcXzBectQ_iPw892kOlvxApU7OSZmy7jAE
Message-ID: <CAGdbjmJjBp4WPqkWs0KNLpH2ve+Q+y26yOg1PO4TJHwKfu1uZw@mail.gmail.com>
Subject: Re: [PATCH 10/13] virtio_balloon: add higher-order page inflation
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

On Tue, Oct 27, 2026 at 2:35=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Oct 27, 2026 at 02:56:13AM +0000, Kevin Loughlin wrote:
> > In confidential computing guests requiring page state transitions,
> > unaccepted memory tracking operates at the EFI unaccepted memory unit
> > granularity (typically 2MB / order 9 on x86). Inflating the balloon
> > with 4KB pages would prevent unaccepting the backing 2MB unit.
> >
> > Inflate balloon pages at unaccepted_memory_order() when
> > virtballoon_cc_needs_state_transition() is true, while retaining
> > order-0 allocations for non-CoCo guests and CoCo guests that do not
> > use unaccepted memory transitions. When a higher-order balloon page
> > spans more 4KB balloon PFNs than VIRTIO_BALLOON_ARRAY_PFNS_MAX (256),
> > transmit its PFNs to the host in VIRTIO_BALLOON_ARRAY_PFNS_MAX chunks.
> >
> > Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
>
> I'm not too happy that this rides on the legacy PFN thing
> which is after all limited to 44 bit addresses.
>
> And given it is passing around 2MB chunks, then one 16 byte descriptor
> covering all of 2MB would actually be more efficient than 512 4-byte
> PFNs.

Agreed. I debated initially doing this in a single descriptor but was
trying to avoid also needing VMM changes.

Regardless, after reading yours and David's comments, I honestly think
it's better to just drop the legacy inflate/deflate and only include
the free page reporting functionality if we end up adding some form of
CoCo ballooning support. Beyond being inefficient-at-best here and
potentially making fragmentation worse as you noted in another
comment, the legacy inflate/deflate path is the biggest source of
bloat in the mm/ side of changes for this series.

> > ---
> >  drivers/virtio/virtio_balloon.c | 87 ++++++++++++++++++++++++++-------
> >  include/linux/balloon.h         |  1 +
> >  mm/balloon.c                    | 67 +++++++++++++++++++------
> >  3 files changed, 121 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_ba=
lloon.c
> > index 11f74848fdc4..d162c162b496 100644
> > --- a/drivers/virtio/virtio_balloon.c
> > +++ b/drivers/virtio/virtio_balloon.c
> > @@ -182,6 +182,13 @@ static void balloon_ack(struct virtqueue *vq)
> >       wake_up(&vb->acked);
> >  }
> >
> > +static inline bool virtballoon_cc_needs_state_transition(void)
> > +{
> > +     return IS_ENABLED(CONFIG_UNACCEPTED_MEMORY) &&
> > +            cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
> > +            has_unaccepted_memory();
> > +}
> > +
> >  static void tell_host(struct virtio_balloon *vb, struct virtqueue *vq)
> >  {
> >       struct scatterlist sg;
>
>
> Put all this, and preferred order, etc etc in kernel core somewhere,
> and expose some sensible APIs that devices can use.

Good call, will do.
