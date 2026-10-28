Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197017;
	b=vxpdhrllkBufKlXApeqTzipxtc3OYWwAakDhUFiWDoeJEH5d7bNKHJzApwCnSmgtzImO
	 IntoUvZNcTCYsIxtpfkbDN9fjAIYdAPo63JQXwsEo39+XmT8woyMVhfhtN9C2YzGxGjl0
	 xVo1hAGiL0fS6XRL7AS5T7m7lPfNqwGDovTmtjz+PtvJednDVSXzLgbYYz1PaI+IZQQOA
	 EO68Cuf0Weh1dt62S8JyFLFo3x6p+0zvurmKqkq8jXOHQR1xb3PYBnVgfKsrnZKCp5bhV
	 NvUKTkOqhGIC89thcvNk9cPrLjWe+4IdAha0rmxtp+iISmsnXoe0tzpa2aQXtyrAvaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197017;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=emSS8rGhFSAVh+HSifwB6oqPZ30JVlQSlhM7wMUoNhg=;
	b=dYX90nJZ85rPAh+L7vvcYWRXa3G+o1xFkRwP9C7h6sVVm2Jg5ssftlV6Epq2MCJSRpzm
	 0IA22kG8PgfQIxB1jNBoGa4zzsfhWteUuiboYwlaEBd3TxLoJLsk94R+XtOFqdBlXOn+d
	 j7pOokTl9qT0I3d6125v74WwZBf8NaUE6jmg283GLsgI3Ku2ThmFb4vIfVwejU60rlNqQ
	 w4KZ5CHxVHVuR3KEpi137+1l//SjrKgmHVf9BEDWR2vyGePD8csm4Vw9t/6PYcrUmuPkH
	 U3shAl4x1+ONN2YbK+aJ0etQSC8gBPVa5EF/UH+36xGFtcoW9GKhTB1aD30NmRFmCNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEpzLNv3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0081606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEpzLNv3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D581F01828;
	Wed, 28 Oct 2026 14:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793197016;
	bh=emSS8rGhFSAVh+HSifwB6oqPZ30JVlQSlhM7wMUoNhg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nEpzLNv3PknOMyHQDCqjJNXNxk/Uc/Xh6hGOvqmAGnYRM75hq1XI6GjwGRVh3QDUU
	 WPyMbIJ96JuiX9TIfrkO7CHN68+xWENn8oz9SnBTMQTtDod7Jw+YJSqjqKB0z6ueQY
	 J+YjJc/Tp5PBrDEN9hIQo6SKn5oz3hKTGYGOCTydvTr5e4+QLq14Y2E28qKbTLrpO2
	 2DthOftJEg8ZxPlmZOeZrR6Bu+RaBacV3FP84D0QE51AGmBqfDN7DZMzEAwYRcikXa
	 cu5ouLFHOwwZcrz5yM3YVxIOLEklM3lPuD/O0NMM/rfTy5E/nfNz73pg2CuQsm7rv6
	 wHzuZ3koXF/xA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: <akpm@linux-foundation.org>,  <david@kernel.org>,  <ljs@kernel.org>,
  <liam@infradead.org>,  <vbabka@kernel.org>,  <rppt@kernel.org>,
  <surenb@google.com>,  <mhocko@suse.com>,  <baoquan.he@linux.dev>,
  <pasha.tatashin@soleen.com>,  <pratyush@kernel.org>,  <graf@amazon.com>,
  <linux-mm@kvack.org>,  <linux-kernel@vger.kernel.org>,
  <kexec@lists.infradead.org>
Subject: Re: [RFC PATCH 2/2] mm/cma: reject CMA areas that overlap the
 kernel image
In-Reply-To: <20261014145731.3431527-3-radhey.shyam.pandey@amd.com> (Radhey
	Shyam Pandey's message of "Wed, 14 Oct 2026 20:27:31 +0530")
References: <20261014145731.3431527-1-radhey.shyam.pandey@amd.com>
	<20261014145731.3431527-3-radhey.shyam.pandey@amd.com>
Date: Wed, 28 Oct 2026 15:16:52 +0100
Message-ID: <2vxzcxstoqp7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Oct 14 2026, Radhey Shyam Pandey wrote:

> cma_init_reserved_mem() takes a base address chosen by its caller and
> requires that the range already be reserved. That makes an overlap with
> the kernel image indistinguishable from the normal case by looking at
> memblock alone, yet such an area is fatal: cma_activate_area() hands it
> to init_cma_reserved_pageblock(), which unconditionally clears
> PageReserved on every page and frees them into MIGRATE_CMA, overriding
> the memblock_reserve() of [_text, _end) that the architecture installed.
> Those pages satisfy ordinary movable allocations from that point on, so
> userspace is handed live kernel text.
>
> The preceding patch closes the way this is reachable today, where a
> kexec'd kernel runs from inside the default CMA area and then declares
> the range it is executing from as a shared-dma-pool. On a VEK385 that
> reproduced within ~300ms of /sbin/init starting, as a copy-on-write
> fault writing to the read-only linear alias of .text:
>
>   Unable to handle kernel write to read-only memory at virtual address ffff00084030c000
>   Call trace:
>    copy_page+0x48/0xc4 (P)
>    copy_user_highpage+0x14/0x30
>    __handle_mm_fault+0x318/0x1340
>
> Dynamically placed areas cannot hit this: __cma_declare_contiguous_nid()
> either rejects a fixed base that is already reserved, or picks an address
> itself and so avoids the kernel image. Only a caller that passes a base
> chosen elsewhere can, so check for the overlap explicitly rather than
> leave the next such caller to corrupt the kernel silently.
>
> Note that failing here is not by itself sufficient for a device-tree
> pool. fdt_init_reserved_mem_node() responds to an error from a non-nomap
> region by calling memblock_phys_free() on the whole range, which drops
> the kernel image's own reservation along with it, so the pages are still
> released - as plain free memory rather than MIGRATE_CMA. Callers that
> keep their reservation on failure, such as powerpc's fadump_cma_init(),
> are fully protected. For the device-tree path this is a diagnostic and a
> second line of defence behind the preceding patch.

Why leave the dangerous code around? Why not update
fdt_init_reserved_mem_node() to expect -EBUSY and skip freeing on it?

Other than this,

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
