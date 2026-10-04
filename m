Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDCE3B1ED1
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134475; cv=none; b=cQrU0uHDzqxcTvULoTMSmLaSjdXhHJb8X89rM9aT5JcvIdWldhwZICAhXzX5efuu1PZilHo3DBY8q5ceaXq8zSZy8hjKqJNaPkehUNI9SWDn4KMla+uznOOzYT8I9fGR+JFMasnQYvIr5UYOQRRUl1OunaEaa0RWPkw1jY1Ad+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134475; c=relaxed/simple;
	bh=EAAFOqf3wmhorsMh+GsgYfXBmxlYQ3uWSZ47M6cFQ3E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oCYP8h+lB8i52s8fLKdxUict88VMSNbysKbM79074yGQaRYBc60kZfLfzYslYpx5ZzOoZFOjwPwcOEkg2+ClJZsdJgPq8uNxv2OTF+JcO6Wczhxsli64Prl+invp7vUS0fkWr7GH/TdnPK30aSS2OR7O5bAdAdOhKobS7HWrjNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRc8M5K5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRc8M5K5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D536B1F000FF;
	Sun,  4 Oct 2026 17:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791134473;
	bh=5DHJ05YuSaH+xr8cKdC4cMoW1ZLSjTRGXK11CvcxzcE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=dRc8M5K5uZMZIVGAAwj7Y7uhyYSUbAcWbnq+NtuV/keIDnxjDLhJJIcmxQIkLoCzR
	 33+SxYgjWcYH8y9a1+FKiwzTMFn5drCn7RebxPcOa+PMlUQkU4D7xznSJc25AQfrWJ
	 I0I5UYHGbP/vnztJHoPEcqicUXsjX2zH8/9PJTh6ZS7/oO/40JhyTmNxxgwQ/6PKVA
	 tIF9Nu0lWRhVXfnXJUCP49MXSlKlYbsmKS6w9TY6oKunJkslNtsNgrLS1bBdnP7QVD
	 1SE6+4jXIwIl5NSkUaDznyxrjDrCo33BvokSYO2oeVm86q/I6+pirNn5xN3BNE6URC
	 2mW0Jacr6qckA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,  Mike Rapoport
 <rppt@kernel.org>,  Pratyush Yadav <pratyush@kernel.org>,  Alexander Graf
 <graf@amazon.com>,  David Matlack <dmatlack@google.com>,
  tarunsahu@google.com,  open list <linux-kernel@vger.kernel.org>,  "open
 list:KEXEC HANDOVER (KHO)" <kexec@lists.infradead.org>,  "open list:KEXEC
 HANDOVER (KHO)" <linux-mm@kvack.org>
Subject: Re: [RFC PATCH 0/6] Introduce file handler dependency level
In-Reply-To: <20261001005734.1033516-1-skhawaja@google.com> (Samiullah
	Khawaja's message of "Thu, 1 Oct 2026 00:57:28 +0000")
References: <20261001005734.1033516-1-skhawaja@google.com>
Date: Sun, 04 Oct 2026 19:21:10 +0200
Message-ID: <2vxz4if1l6ux.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Sami,

I've skimmed the patches. I didn't dive too deep into the code, but here
is at least my first reaction.

On Thu, Oct 01 2026, Samiullah Khawaja wrote:

> LUO allows preservation of FDs into sessions. An FD can depend on other
> FDs, and for some FDs this can mean the dependency must be preserved
> before it due to various reasons including immutability and performance.
> See discussion on FD dependency patch series [1] and documentation [2]
> for details. Also see the Liveupdate IOMMU [3] and guest_memfd
> preservation [4] patch series for examples. These dependencies are
> enforced by the file handlers, and userspace is responsible for
> preserving the FDs in the correct order.
>
> This RFC proposes a mechanism that allows userspace to preserve the FDs
> as a batch, and the kernel preserves them in the required order. This
> allows the VMM to preserve a bag of FDs without worrying about the
> order. A new ioctl is added that allows userspace to provide an array of
> FDs and tokens for preservation. This gives the kernel the token and the
> intent to preserve every FD in the batch up front.
>
> This RFC introduces the concept of file handler levels. Each file
> handler offers a certain type of resource or functionality that relates
> to other file handlers. These can be represented by levels. This RFC
> adds the following levels and more can be added later:
>
>  - Default (no level set)
>  - Memory Providers
>  - Memory Mappers (or users)
>  - Devices
>
> The levels are optional static configurations of how the file handlers
> relate to each other. Each level represents a class of file handler,
> which fixes the order of preservation between them.
>
> The levels are spaced out to allow addition of new levels. LUO can use
> these levels to deduce the order of preservation of a batch of FDs.

I think you need to explain what problem you actually solve here.

This seems like a lot of complexity to essentially turn file handler
dependencies into heuristics. Because you basically assign a "priority
number" to each file type. But dependencies can really be complicated
and I think modelling them as absolute integers is going to paint us in
a corner real quick.

And I don't get what this buys us. Why not take the much much simpler
path where a file handler just rejects a file if its dependency isn't
there? This would force userspace to preserve files in the right order.

And userspace doesn't necessarily have to to anything complicated
either. It just needs to write the code in a way that a memfd is
preserved before its iommufd. So we leave it up to userspace to figure
out the order, and in the kernel we only _enforce_ it.

This also lets us express the real dependencies and we don't have to do
the dance of giving each file type a number and trying to make sure the
number sits in the right place on the list for all use cases.

Or, if you _don't_ want to burden userspace with this work, why not take
the files in any order and do the final check at freeze()?

>
> The batch is atomic: either all FDs are preserved or none are, and on
> failure the index of the failing FD is returned to userspace. The
> existing LIVEUPDATE_SESSION_PRESERVE_FD ioctl is unchanged and behaves
> as a batch of one. Note that this does not break compatibility and
> userspace can still attempt to preserve FDs individually using the
> existing preservation ioctl.
>
> The patch series builds on top of the Liveupdate IOMMU series [3] to
> demonstrate the FD dependency. The full tree, including the
> dependencies, is available at:
> https://github.com/samikhawaja/linux/tree/luo/fd-dependency-rfc
>
> I will present this at the Live Update MC at LPC 2026. I will also talk
> about alternative solutions I considered.
>
> Future work:
>
>  - Allow file handlers to be preserved at multiple levels to allow
>    resolving circular dependencies.
>
> Looking forward to your feedback on this.
>
> [1] https://lore.kernel.org/all/alrDpAMknlYN9jL9@google.com/#t
> [2] https://lore.kernel.org/all/20260910173659.1945246-2-skhawaja@google.com/
> [3] https://lore.kernel.org/all/20260921004834.2601285-1-skhawaja@google.com/
> [4] https://lore.kernel.org/all/20260728121138.1103610-9-tarunsahu@google.com/
>
> Samiullah Khawaja (6):
>   liveupdate: Introduce file handler dependency level
>   mm/memfd_luo: Set Liveupdate level of a memfd file handler
>   iommufd: Set liveupdate file handler level
>   vfio/pci: Set live update file handler level
>   selftests/liveupdate: Add API to preserve a batch of FDs
>   iommufd/selftests: Preserve all the FDs in a batch
>
>  drivers/iommu/iommufd/liveupdate.c            |   1 +
>  drivers/vfio/pci/vfio_pci_liveupdate.c        |   1 +
>  include/linux/liveupdate.h                    |  24 ++
>  include/uapi/linux/liveupdate.h               |  39 +++
>  kernel/liveupdate/luo_file.c                  | 316 ++++++++++++------
>  kernel/liveupdate/luo_internal.h              |   2 +
>  kernel/liveupdate/luo_session.c               |  45 +++
>  mm/memfd_luo.c                                |   1 +
>  .../iommu/iommufd_liveupdate_kexec_test.c     |  27 +-
>  .../liveupdate/lib/include/libliveupdate.h    |   2 +
>  .../selftests/liveupdate/lib/lu_utils.c       |  20 ++
>  11 files changed, 379 insertions(+), 99 deletions(-)
>
>
> base-commit: 945d61765894dda2f0344de50cb1ade2e51b66fd

-- 
Regards,
Pratyush Yadav
