Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E715D47A876
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816351; cv=pass; b=DJjcaoBniet+Ota7oi13aRwTnXhCWfqa+n9TU0jcafb6dr5U0N1fD3GetbCc5F+cMqnn+QLmeBwAVRyRpRon2XGGdd+vd1gVEHThwH3DjRK64Qnu7CNO1aoF6npOfHsYBiMOtVnv7X2kfZetYyHe+XygXOc+3XJjxvmkOqEC8Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816351; c=relaxed/simple;
	bh=gGrNTBjii+g6uIsj6txOBfGumy2pNID11P1zmPmCOWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vsiy8O2aDjNg+/jMFLAeBT0eNlapXD/cdxqSP6S115bTX2J7M80otmgWuwHnQhHlNkpKk0b21iX07FkWoTPdtFO2uzgA71I4k10vBRKNAkAxjl3+uoSdG+2QRp3yAXwb/R+fwYR4mtP0M2/mTWR5RCF6ctlShmZLq8gB9QiYewY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aMDpyKm6; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aMDpyKm6"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so69755ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791816349; cv=none;
        d=google.com; s=arc-20260327;
        b=n5Dl30AeqG07PryosR6QU5jIKK83+vbN0b606X5k7FTgTu+qCFv/zzgqEjuQxVHTaD
         8xBBD+DyZGM6pusR0ilj1p0y5IS04qYlxmX6A0y8SG++jw4oOHHkwy+YhudbwFv1MqnO
         MjIOPVolZUGNP3N4nCHAv7EhZV4/IDU/0cP1vrTTet7NXTgAZ0HAZ7Ojls/sntYiK2JF
         HK3K2JBdHt+4U4YHPHyvw8BFyS9XEHA3a/dV8yGxxH5gyTyhDNFnauTxa1Ad3f966GY6
         hO+Kd9pCeRaEPGB5Ru6LWr7C/Mhl2JPcPC9UZuUwgaWmLUoGXIxuoT4NnIVAc8BA2203
         OjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gGrNTBjii+g6uIsj6txOBfGumy2pNID11P1zmPmCOWs=;
        fh=r2G86NTu0zkoKScYZcOC6vdjQjPq2VzDsLEH2s2ga48=;
        b=kqRznTNh+doX8kA4k/dbVoXm1xHv3YO8gRmojNHUGqHKABkzaOlYOfxA4h6KBOBubn
         Kq6+kKFH9jEoV2IF+lTcf+jeL1W2llLt6qebywqNb4tS5GTQFd/a3cuSdpXPHnH4Hn+q
         ghOYPoeoYgT730bnNrlYhbfGNEB9Lopvjf+fmNIFWMV4weia7hzdFPEM1fPO2xWJwyud
         MnQeIetDSFDsdl0JUaumF73b8IS5vVvHbjoPqhsSl0zpo0RF2eoh72MuYQhBUlqGMB64
         HY+2Boj6DZ/ZS3w5C3GAkcNSPPQhu5rJ6dxmTeDwQOC+On4RScr/g+JAxDy7euAp6iFI
         kM6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791816349; x=1792421149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gGrNTBjii+g6uIsj6txOBfGumy2pNID11P1zmPmCOWs=;
        b=aMDpyKm61Dj4iTeFbZKh5kA8qVzqM1Nn/OvWPYweC9o3OrELzTjp10jAUHpq4KKlXo
         pbpIM1+uhrwn4SH4/GO8L3oUMvvy5CS93hjhq07OxeBwqg01lr0wAVRJ5EElJoxsP3Cg
         +9OXX+J99PrFvFcruk13JI6ZPiLvvBFE3a++qf03XNndGVFC67cQRPe45vr33sxdSPrN
         YCX1TalQ6lDvefnd004OJTwBsalkZla3FHqday5Y/7JPzIO+b+/Jj5FJkqJ9bNAyWx6S
         J5/UlKxHI0gthGhLaGikUJmxbayHyqr5jb3Lil17hajiD+trv5jLkm2o9JsWNF8wZGsJ
         H29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816349; x=1792421149;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGrNTBjii+g6uIsj6txOBfGumy2pNID11P1zmPmCOWs=;
        b=ouuFTS0YIPyJbKh64GZud2ik/vrRHQCbJdQEU46tQnKHV4T0uXEoWJ9O4aibArngsm
         W0CjyU6FNnrf5W12d/8NEuUcggWbeFYwN0vJ6OXPBFv41puYv9gsgvSZT9J8kFgJn06h
         PGoH0NYaA/3sW4iZReBN0RtrcLSsSTzFdsC1b/QV5UVuuAwImaYNUAMnRmx3uIrhjB2Q
         ViHNfoVvUv+fQWA0EXx6+zTnA/eHkQuP3LvN9OlnG708rvxgyRj3mR6EIl0vxzrHpCka
         k228LSPpCnKkKcDGSImi+AEvPdcKWA9vZ+lqAB98I5b7oM7jVQmJTmF4h8DrGJQCMsgx
         dSog==
X-Forwarded-Encrypted: i=1; AKwUvBx99kGoYoLCHXQFjEahiAVES34vfPMrEHIKWPqfb54ua86ZZvif40JEYLfhpTj2VsBaC1s5wFnSI8yuyZk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDabYBjVAyJFn1N5h2ULG5Z/uFjg+jWYHjBGGYhTdNjZrrtxoT
	4WHHXoNXQ9guEGSKkQJbXV/ggO1p80tE809Tg1GIukJEPnp79TBw/ZYkZcY8bwBcL7FGmMbBYLt
	OkaFV72xUS84ZHJ2T6na4Nq829+zKD2k+NMVf2dG9
X-Gm-Gg: AYBFou3nFud5CDSimdXFiQkWXSyFWXQ5UeouNRpaUQWbXp9Z7460g2/fzoTRcCjwQCD
	O18fF7zEe85EHjaXGsx4kYQ+Y436pf2sYkQbXZwco4x2TjyimNQC7Z1hWEb84AQIYsRYVxwaJyD
	UJe2EtVYVRpPjYlBilpjllpCXvOU1MkMV4ZRxJ0naXciVkIwuZZqxfQ5WTD7iZQS7GPhRpGy5Jk
	WkCKGaOUJQEFF2EFUncjElCYtLyLLxnMZXMjmxc/+7K+pz/4b7fAnY28wXZgu6IBSbBD6B2m5kP
	p3VS78izN19tvYQlZJ8qsllYxbsay/510ZgO61kn8734DuzThm+F3LcL
X-Received: by 2002:a17:902:ebc6:b0:2e2:d665:6ad8 with SMTP id
 d9443c01a7336-2e87bc2190fmr6225715ad.4.1791816347416; Mon, 12 Oct 2026
 07:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
In-Reply-To: <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
From: Luigi Rizzo <lrizzo@google.com>
Date: Mon, 12 Oct 2026 16:45:11 +0200
X-Gm-Features: AclHuK-i8fHHmdGq1sG19E58z4J25P_7xaX9lSE-RrDdVmPDw1ep2a8coGIVdbw
Message-ID: <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
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

On Mon, Oct 12, 2026 at 3:51=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/3/26 23:22, Luigi Rizzo wrote:
> > Here is a subsystem called DMA_PMD on which I would like feedback on
> > architecture, possible enhancements, or kernel components that could be
> > reused to avoid duplication.
>
> Here is a feedback to a subsystem called DMA_PMD ;)
>
> Why is basing this on PMDs (and embedding it in the name) the right appro=
ach?
>
> On architctures with large PMDs (512 MiB on arm64 with 64k), would we rea=
lly
> want to use 512 MiB pages, or rather something smaller (e.g., 2 MiB) that=
 might
> possibly also have TLB benefits (cont-pte)?

I had to call it something... an earlier prototype used the name IOMMU_2M,
but I didn't want to suggest that the design was limited to 2M (it is not).

Aside from the name, the _current_ prototype restricts to 2M allocations,
exactly because too large units are expensive and wasteful.

In the code, decoupling the allocation size from the PMD size is trivial.

To enjoy the reduced IOTLB pressure the architecture needs to support
IOMMU leaves with the correct size. Looks like ARM supports a
"Contiguous" hint, but I am not sure how to tell if the hint is honored
(ie the IOTLB actually uses one entry for the full contiguous range)
other than measuring.

cheers
luigi
