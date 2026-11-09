Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219065;
	b=j6/mNaZR/cbze8dV5wh9K6u5j7Aml4Vsm/U4KIfu6OyYJGtKUnn9zvS2aH+ry2lUA6GO
	 fQiM0HCoyyzJGgelE7p82TKIhU+IJ6Y/JH8mz1VGCC6OASGOvr1q+zfyK2gxdhLM6pwbR
	 1KvD/b9jmua8VtAC/6xqunK3lxSIIpH2s3Y11ziqDA7zAOf+iiuEi9FD6rGTiymU7Lp4T
	 nHlf6r7kV9ux+t7ORkOBkZK84qKlmQK+c6LwWU+xihxFE/LFplurfP2/3liKaFwmAyPyP
	 DV9VJ7Fk9QFjAjrFldVLZEX80GSzYc7Q9hHB2upM3VX4yXur8b8nkQj241BsmDFmUZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219065;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wbzKLdeX4uvspnezn7DDebS2QYAphq0U5j3vCU9hkMY=;
	b=yI7fXy8dLqz42H232X/GSsuESgcvwnO0zqvUMsXbNaDDlwJOLpQYmPvJoXKVTaLP2UwE
	 Wwv5VdxftO95RkV88kfvysnjs31quADkiWaiw0coFjWQJP6Sx4HP/RuVZJMBqlE2PdMwO
	 U6nZ6sS+Gpwp4YHMPBno5VoPJDAYVx2J7EwUpxDSKFyLthFzTxTLyzH4TIML2kmtNC6yQ
	 UpXPV1gSkQjn2lOg4J5alXdcst4x7L34We5BpRBgfxlNDOMx7PyLz5EjVSlZ/ZzlWm7JY
	 TQci0tAdyhegXFY6OrLkUrnIULCX/WOCCgGk13gldAR/66kcuMwsnUNgnEkJDGJZIJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yk3s3d9f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FF6606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yk3s3d9f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB091F008A1;
	Mon,  9 Nov 2026 10:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219065;
	bh=wbzKLdeX4uvspnezn7DDebS2QYAphq0U5j3vCU9hkMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yk3s3d9frEWJZPF2MxjOZchcesGfDugA5BuxyDVBmApifp1nrXdBpEzCpJH135Z6v
	 pGzHY0gQfwXYmSiHDmNGG3fWlgsrAVtTUjAgEKgTx+LSJq1LxyCnWmYQK598Fy7BNJ
	 mgdd5EvGuaW1u0OeZ1SxXFAJnBEWulBCMtEpZEE8NzIETSir8TkiU4PYPuX7zsN/cS
	 gvCwafWEipxdq2SZNqRTVIZMR4gtnUoPMtw8wUxI2SLTH0dYcSun490m/D2NhyjRMn
	 LUYAQV+T8Fotdet4iYmRu+ol0wEuPD/vicVi+vMhVpVwFJO7zx1mOW9LpqdhrBtznQ
	 HTzwwcKy85ODA==
Date: Mon, 9 Nov 2026 12:10:59 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen/events: replace __get_free_pages() with kmalloc()
Message-ID: <avGcM7xJfGpOQpVV@kernel.org>
References: <20261108-b4-xen-v1-1-76095f25cbf4@kernel.org>
 <7af392b9-0cf9-46fe-a820-c994942893fe@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7af392b9-0cf9-46fe-a820-c994942893fe@suse.com>

On Mon, Nov 09, 2026 at 08:53:18AM +0100, Juergen Gross wrote:
> On 08.11.26 09:42, Mike Rapoport (Microsoft) wrote:
> > set_evtchn_to_irq() allocates a page for the event channel to IRQ
> > number software lookup table.
> > 
> > This buffer can be allocated with kmalloc() as there's nothing special
> > about it to go directly to the page allocator.
> > 
> > kmalloc() provides a better API that does not require ugly casts and
> > kfree() does not need to know the size of the freed object.
> > 
> > Performance difference between kmalloc() and __get_free_pages() is not
> > measurable as both allocators take an object/page from a per-CPU list for
> > fast path allocations.
> > 
> > For the slow path the performance is anyway determined by the amount of
> > reclaim involved rather than by what allocator is used.
> > 
> > Replace use of __get_free_pages() with kmalloc() and free_pages() with
> > kfree().
> > 
> > Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> Shouldn't you also replace __get_free_page() in xen_init_IRQ()? I don't see
> why this is being omitted.

Just an overlook, will send v2 with this too. 
 
> Juergen

-- 
Sincerely yours,
Mike.
