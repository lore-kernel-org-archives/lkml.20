Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3C23B19BA
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257127; cv=pass; b=IK7BHuBO1nBDI2CgTnikdYs3vfAh4Oz6IIwc2vpE0mribehViX6YvWWixnhmVsbK4nJc0Ga8BHERLeaRtAS0UNFlxEU+drlPK2ve0Dg7ZIcvMHzVYonMtcPuV7soys8E6e4gIYddzk72k9fbD+WcyvHUUknQE13MMZ/KNxbzoQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257127; c=relaxed/simple;
	bh=TQ0S3+GvPqkyCnzw3WaiERWE0gQzxysyRgtfYYbHNSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jf3IIQ2irDVm3RJpWgeBLdZACO0g3lqDDzwXSNAIzPXGSm70SdkLvZracX1Eet1UYH6MFNSICRat0D8nqyi3Cm5Zo1W82+Ie+VmVs/RRhJPaJZGlndr0mg2bT298KLNMqllP+zcgbUG38SrCE72oz1FGPmo3UlxXAWDnJ4qc/N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MLWWHBXQ; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MLWWHBXQ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8623790f8so38925ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792257126; cv=none;
        d=google.com; s=arc-20260327;
        b=D0qgnU8BQykmAwiHRyYlVuBFOwecIPtoOIqqTrdW1j4ZXWy6ggc4WVNutCTGVS0H9A
         sk3QtVWS4fK9V+A2z7C/D7EKlFezpoDO9/+WW50KZNsCb2nhwFYxJjJDf+di8Fj7Xz6Y
         k9QYSexZE+RTcB/7p0LKGCfYecueeMtBObKIJ8NHvGloJlzEfWdd74T36g/YL5eu4aQO
         hVTgSCn6Ap55HA9n1u1Uv+l3EcDT0lff894QREurX/13IIdMyRiq56+LEgZFTdk9OBYP
         xF5wKAQqHQ8RbmrZACvJRd3DvhfS0mJcGBsSdx8Ozb8pzkKr/tm3qJDOxrDpg6TEJ+wO
         /USg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TQ0S3+GvPqkyCnzw3WaiERWE0gQzxysyRgtfYYbHNSY=;
        fh=4eHRSMtzTBgMFjSb8Hvka+uLZFjflzH+AEFPEsemKcQ=;
        b=UUWmEaMei6zjP/0pe/LSOykHgiUJp9Rf7m0Q2fOH5s7OWdglU9uQWAUoKEZAFlm+uC
         fDK5UgUTc49CYgHvNAJRfND1SeTBdJND7g5iipJKIaj5/68CIuXlMu/JDoKFBcHdIcQh
         2MI9MZty8oI6XLxTEvT/gwC1lLkIWmQC5BoiU5aLQYWaUhUVVM46NRJGSRdM1iRmvY/H
         HSwWYNVhpU2ed3RNc6JJWGgF+d9SVbubEPTWAEU1pt7zQXNe7zH/5hT9c8m6dVD+BrA0
         SDJ6u/JHrSr/ci8cx/LNQwblamqSJ0UTFBQ77+LXqVMt6iDGdDd+M9ahR1k5cV5XEARu
         m48A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792257126; x=1792861926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TQ0S3+GvPqkyCnzw3WaiERWE0gQzxysyRgtfYYbHNSY=;
        b=MLWWHBXQq/y8RwIU84GS50PyppI7TkQc6XbV/NDzoY3yGuCiDuq4QBUWs5tAHTwhpN
         QMRdv3VIw/a4fRAF3zmvmDzS7DmLiwK7NhAM3i10FCpVUfr92kia0GQ2l70/ijjOnp27
         p1jtj3BqoNvRPFWjQK6LyTYVsokb+hhfwjI47OT21GRSQmJt62YnP24VmXoXbXKVZ/ls
         hOHWX/OUFxcNyAgahr8COpMSnn/YkkkuOXUAH/UsFdP881sHySIXIrQdM9TRTygPTdR2
         lWaU2+DlgxXyNz9oeHhd+wx3+Z6Bxb+0lk7fcbIVC+8x7eeS34QGVQ542jxGzXR7wsyA
         hXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792257126; x=1792861926;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQ0S3+GvPqkyCnzw3WaiERWE0gQzxysyRgtfYYbHNSY=;
        b=fquWKBACdHelb7/Oyofn5fubejI0THToBPnTm5iyAWsmGTrtH50BXBx46e95C8zHjZ
         ua6DIGmW7EsC6DxVKaOQt7Sn+vfgtBZTWhfrRo3WcAceAH5JMMbWxIwymoZqIi5itqUf
         mVckSY2/kvxAEptjXWyxBg2Z96ogG/H2W7o9efNUdj1hFBow6DXnCsSZBz+LaiJAS9f7
         6UxgZc5Zn6kaUdQKTO5K2AnaUgqoG9X68tGW5NRQhHOIzaB/wOmYH4qk1L80ZtWokAYc
         t44hkoz5iBL2HXqgNEyA3OolCPE0zZ6ttl2sZTGImS/CiOBVqQHerlPzdTb+39BlrN9M
         HH+g==
X-Forwarded-Encrypted: i=1; AKwUvBx70aFHdNT74FW91XhZNXc9GlWoreuvuaHpExQeuRu0B8Ldzsty2tLxbqDbeJDq7KIuvO58MRzcCXA9smk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXoNEoaeN2ZkO44RQNWhwq2hdaJ8uyYG6QpOo8NdlCi4W4xXAZ
	0mgW/RJr7oDV2Cnb32ozNPvDaldYoApcMyJE7U9oWiAuLwptamL8iizJuTAmSV91SXb5XIG3uAh
	RMVr16kU4Bz5eEwXS3Bk7pbrrHRFGvwsLccVxmqZC
X-Gm-Gg: AYBFou20M9NYppSfa6zpn0kuXh04/zAajzLJRj9bZoAcLfbAYSgz/3DSXYJybvK8cb1
	B0Qi+3HxblNn7BjOC+ezyGnwVmqjLFS3XVcMMFpNgXoJ+wP4NaJNfcJsnHOW9t56rD7r4HWp759
	sVu24c5zvtWoTVqsoHWOeFJy5c0x7LFmnpKq/IuOO0GRa2Eh8qUSq7NjeymJ1b9z9pKSWf4ELo5
	whnx5T7fUFWUkQRpodSPkmBabO89oeMngE13IU1pXqgztytOwS3gtRBIwLGfJycIhaqfCmRba+1
	e/L/ULIC1RjF+RB3jZoN728YPw6UwcEQtKWiEU3oOWeDAD2E6mrgxs0S
X-Received: by 2002:a17:903:144e:b0:2e3:981:4cc4 with SMTP id
 d9443c01a7336-2e9b3252cdbmr3330175ad.9.1792257125060; Sat, 17 Oct 2026
 10:12:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com> <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
In-Reply-To: <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
From: Luigi Rizzo <lrizzo@google.com>
Date: Sat, 17 Oct 2026 19:11:28 +0200
X-Gm-Features: AclHuK8222c3YwWa2EndazmJS8Umg9HTADwML-hsKq06OdSigMokkN9A-iBy5wE
Message-ID: <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
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

On Mon, Oct 12, 2026 at 9:44=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/12/26 16:45, Luigi Rizzo wrote:
> > On Mon, Oct 12, 2026 at 3:51=E2=80=AFPM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> >>
> >> On 10/3/26 23:22, Luigi Rizzo wrote:
> >>> Here is a subsystem called DMA_PMD on which I would like feedback on
> >>> architecture, possible enhancements, or kernel components that could =
be
> >>> reused to avoid duplication.
> >>
> >> Here is a feedback to a subsystem called DMA_PMD ;)
> >>
> >> Why is basing this on PMDs (and embedding it in the name) the right ap=
proach?
> >>
> >> On architctures with large PMDs (512 MiB on arm64 with 64k), would we =
really
> >> want to use 512 MiB pages, or rather something smaller (e.g., 2 MiB) t=
hat might
> >> possibly also have TLB benefits (cont-pte)?
> >
> > I had to call it something... an earlier prototype used the name IOMMU_=
2M,
> > but I didn't want to suggest that the design was limited to 2M (it is n=
ot).
> >
> > Aside from the name, the _current_ prototype restricts to 2M allocation=
s,
> > exactly because too large units are expensive and wasteful.
> >
> > In the code, decoupling the allocation size from the PMD size is trivia=
l.
>
> Yeah, we should do that.
>
> We should probably just find a way to describe that this is a POOL that f=
ocuses
> on physical contiguity in some configured granularity.

Before embarking in a global renaming, I would like to get opinions on
acceptable alternative names (possibly with a short prefix usable for
identifiers in the code). I could think of the following

DMA_PMAP (for PreMapped or Persistent Mapped)
or, ahemm...
DMA_PISA (Pooled IOMMU Superpage Allocator)
both using dmap_ for internal name prefixes

Other suggestions ?

cheers
luigi
