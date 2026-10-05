Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB892F39B5
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219470; cv=none; b=dfD+6SBnoCL5v9x7zpSs8umrq3LUbad4mnDFd2u3rJiklLff1v8aSharoHVnWmSB/lrcQcyWpL52lRnbt7zhlifjkfIF7iYkP5gJySdEmQlbzKMY69E4JKQYLDM8YKIbAOJpApJ6tVbodZbd8AdSzNzyFOYndT2pbeo2Ot4wV6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219470; c=relaxed/simple;
	bh=Ar2OHvmiUNMsM8DzKMRCZEqeFW06YtAaNc88vN1pBMs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GSsFNL/1M7awYqUMIEGhwI8oRGRk323tfPSwz5hMisNm6DcKe6yoQ5HICfiY2kyJWKMAd1jOo4SihsQtGP8m1y+IM01jOPbtWibaHFOWLKCF16MAkuomqywONF04yZgm/aj8VwE/wwtFreOQlPVH4Syu0fIu9cPh8kDYv9FERzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LgRgX9Av; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LgRgX9Av"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791219465;
	bh=Ar2OHvmiUNMsM8DzKMRCZEqeFW06YtAaNc88vN1pBMs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LgRgX9AvXNOJ7oWkwkGZy3DHgLwoi0tiDo3dr6QoWQ3qX3HzHnh7P1AMRui9oYE6M
	 +J0p4eyZ4VBaXJ9GwgSA1TTq8kI21qNJ5UqnBV0EJKMiO5gEYJnixzBJgyYJ72j8Tg
	 /g0TxvMUzuiAcDYh39VoRzjHxfzZosCQTRMfiBeTqZ2w5K4BPSneKojKSp7tedBR8K
	 DH1n503ZqrwM9AYo54D2dgiQk5bFgtR95rMUpChQ70RlZnfzBtsOK0ktAQxsFWqnby
	 pXDSdDxR3R26KoXPziWZmx7L5fi5EzNWmL2jm+WWL12hP2AJPFOEn1xozscW39E+Nz
	 7UZf5Z/PEaIHQ==
Received: from fedora-61.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 80BDE17E0088;
	Mon, 05 Oct 2026 18:57:44 +0200 (CEST)
Date: Mon, 5 Oct 2026 18:57:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Rob
 Herring <robh@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, "Marty E. Plummer"
 <hanetzer@startmail.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt
 <eric@anholt.net>, Robin Murphy <robin.murphy@arm.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Collabora Kernel Team <kernel@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v12 12/15] drm/panfrost: Skip cache flush/invalidate
 when enabling perfcnt
Message-ID: <20261005185738.010bc483@fedora-61.home>
In-Reply-To: <37422c77-ecdc-46a0-8896-3a5098417426@arm.com>
References: <20260929-claude-fixes-v12-0-62beb08de207@collabora.com>
	<20260929-claude-fixes-v12-12-62beb08de207@collabora.com>
	<95174a67-0eee-4bf7-b883-9f1138c74a6f@arm.com>
	<20261005103855.655f8199@fedora-61.home>
	<5af99ba3-97e7-4a05-b91c-7d53a508b635@arm.com>
	<20261005173741.445715f0@fedora-61.home>
	<37422c77-ecdc-46a0-8896-3a5098417426@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 5 Oct 2026 17:05:14 +0100
Steven Price <steven.price@arm.com> wrote:

> On 05/10/2026 16:37, Boris Brezillon wrote:
> > On Mon, 5 Oct 2026 16:06:02 +0100
> > Steven Price <steven.price@arm.com> wrote:
> >  =20
> >> On 05/10/2026 09:38, Boris Brezillon wrote: =20
> >>> On Fri, 2 Oct 2026 16:14:38 +0100
> >>> Steven Price <steven.price@arm.com> wrote:
> >>>    =20
> >>>> On 29/09/2026 04:44, Adri=C3=A1n Larumbe wrote:   =20
> >>>>> The GPU cache flush/invalidate operation is unnecessary. First off,=
 the
> >>>>> GPU doesn't read off the perfcnt sample buffer, only writes into it=
, so     =20
> >>>>
> >>>> I don't think this is entirely true. The GPU performance counter unit
> >>>> only writes the counters that are enabled, counters that share a cac=
he
> >>>> line but are not enabled are not written by the performance counter
> >>>> unit, but if the L2 contains that cache line then the write can hit =
in
> >>>> the L2 and dirty the entire line including stale data where the
> >>>> unwritten cache line is.   =20
> >>>
> >>> I don't think this can happen though, because _enable_locked() is
> >>> creating a BO (and its GPU mapping) just before enabling the perfcnt
> >>> block, meaning the buffer is known to have no dirty cacheline pointing
> >>> to it until the first dump happens. And we do flush and invalidate GPU
> >>> caches after each dump, so again, we should be covered.   =20
> >>
> >> The situation isn't actually a dirty cache line at the start, but a
> >> stale one. We start off with the memory matching a clean line in the
> >> GPU's cache. But because we don't have coherency the clean line can st=
ay
> >> even if it's inconsistent with everything else.
> >>
> >> CPU		|	GPU		| Memory
> >> ----------------+-----------------------+--------------------
> >>                 | clean line            | matches GPU cache
> >> ----------------+-----------------------+--------------------
> >>    CPU allocates new buffer and writes zeros
> >> ----------------+-----------------------+--------------------
> >> Dirty cache line| stale clean line      | unknown (cache line
> >>                 |                       | might be evicted)
> >> ----------------+-----------------------+--------------------
> >>    CPU cleans its own cache to memory
> >> ----------------+-----------------------+--------------------
> >> Potential clean | stale clean line      | Matches CPU
> >> cache line      |                       |
> >> ----------------+-----------------------+--------------------
> >>    Start dump without invaliding GPU
> >> ----------------+-----------------------+--------------------
> >> Potential clean | GPU writes data, and  | Unknown
> >> cache line      | hits in the clean line|
> >>                 | even though it's stale|
> >> ----------------+-----------------------+--------------------
> >>    CPU flushes the GPU's cache and invalidates it's own
> >> ----------------+-----------------------+--------------------
> >> No-cache line   | writes out clean line | Matches GPU
> >>
> >>
> >> Of course for the GPU to have ended up with that stale clean cache line
> >> means that the physical memory was previously used for something else =
on
> >> the GPU, so the newly allocated BO has to reuse memory from a previous
> >> BO that the GPU has accessed. And it's all "unlikely" due to the small
> >> size of the GPU's cache. =20
> >=20
> > Hm, I'd say it's actually impossible because every unmap operation is
> > followed by a flush+inval of the GPU L2 and LSC, so for this stale
> > clean line to exist on the GPU side when a physical page is GPU-mapped
> > again, it would take a bug in the unmap logic or in the MMU HW, I
> > think. Am I missing something? =20
>=20
> Ah, yes that's true :) Although there's no need for us to do an
> invalidate on the unmap path...

My bad, I'm confusing Panfrost and Panthor here. There's indeed no L2
flush+inval on unmap in Panfrost. We do have an L2 flush+inval on map
(FLUSH_PT) that should cover this case though.
