Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360812;
	b=F179PXb7bKryECO2+kdp/rHI0oP28LPeQpj7D7pcPQ/23m8OFs4ikOPzkY5KF1pwgJqh
	 45nc1Iz+Lq1VjKbAqS3OtHf0VnylmXk5kzy/cICv0uDX3yfcS/EVX12ZErfSq5mSbIIVT
	 oD/UpK1MEgZNZHZFEO/RM9Rz6MTfQJKQZJ5UqvNhKY5JmoZhdI+22QaN1VZpyWrJqghpr
	 7ez/vNjMuZUVXTpxUInCfZl/viHj4ThTzweGZKGZPv48soYPdNbLu4gov4d4ruTeM9ojz
	 rw/9mde8oBm3aGbITJ3TwWTd55JxaGZswZDmexiw4CDbGek/9mIu1hUPhrNHgeie4gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360812;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=oqWVSSqctrfHmeTTyt9hLJ2efeBv2n8X/rPchU52pBU=;
	b=VmFgSgqojgLPjWK5IoEU9nqyLYlwjQtCb4c+gOPiD4ZjG4Nfo84NMeo86hZeD1lwT7dP
	 fAUPihFdIsUim25PiBmvQoYzh9hUnscS9cUDmCVUvKvSXtkVC+TcMREQ4Js3ZGuG4XTwe
	 4I2RPU+N7+JUykuVtf20VBVjvzf8M9l7f7j1F2XGJOY953u0Grktcq0WfSnw3hTXG0ZVE
	 d3aYU+ayK1c/YvA7Hguc38b5CMaRA9QvPk3lpGw1zvHQaeDhLhxnERbH+jL7few6Sd7qv
	 f/uGXlFtqsXIuqDodGZb3KECVRCMB7nP5X4IZ0DFzPC5SKTUfe++pbYRLZjTFI6n8Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="FU/mza3u";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85709606A31C;
	Fri, 30 Oct 2026 11:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FU/mza3u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8250D1F0093A;
	Fri, 30 Oct 2026 11:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793360812;
	bh=oqWVSSqctrfHmeTTyt9hLJ2efeBv2n8X/rPchU52pBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FU/mza3u4BW2PBWUiN/3ijP3eQtejzEnZWb4XR9nj4PSv4TpPeyUmbmDpGci58ua/
	 90uS3+ngaSlaCdaoWBuwBAg8D7kPFcfwfrRcKPIDx0uP8btyFi+GL2b7A406eJ1QB0
	 UUFY7jFmzTtg1cJIj+60bnOVzJekQE3DMhgNEcaM=
Date: Fri, 30 Oct 2026 12:46:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: usb: ohci: double dma_pool_destroy of td_cache when the second
 pool allocation fails in ohci_mem_init()
Message-ID: <2026103020-acuteness-tree-d8ea@gregkh>
References: <592c9a2a.1ae54.1a18c9b41db.Coremail.xuhx@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <592c9a2a.1ae54.1a18c9b41db.Coremail.xuhx@hust.edu.cn>

On Fri, Oct 30, 2026 at 07:39:07PM +0800, 徐晗翔 wrote:
> When the second DMA pool allocation in ohci_mem_init() fails, the
> error branch destroys the first pool (td_cache) but leaves
> ohci->td_cache dangling, and ohci_init() then calls the FULL
> ohci_stop() on the failure path -- whose ohci_mem_cleanup() destroys
> the same pool a second time through freed memory: the second
> dma_pool_destroy() re-does list_del on LIST_POISON'ed links (or
> silently corrupts whatever now owns the reused slab object),
> dereferences pool->dev, walks the freed page list double-freeing the
> coherent DMA pages, and kfrees the pool object again.  I confirmed it
> deterministically on a pristine Linux 7.3 KASAN kernel by injecting
> exactly the allocation failure (kretprobe flipping the second
> dma_pool_create() return to NULL, equivalent to slab fault
> injection): the very next controller probe produced
> "BUG: KASAN: slab-use-after-free in dma_pool_destroy" with the use
> stack dma_pool_destroy <- ohci_stop <- ohci_init <- ohci_pci_reset <-
> usb_add_hcd and the allocation stack kmalloc <- dma_pool_create_node
> <- ohci_init.  The fix is one line (NULL the pointer), and a broader
> cleanup would stop ohci_init()'s failure path from running a full
> ohci_stop() that was designed for started controllers (it also calls
> free_irq() with hcd->irq==0 at this stage, printing "Trying to free
> already-free IRQ 0" on the same path).

Great, please send a patch to fix this.  Creating random kernel modules
to break existing kernel modules is a bit odd of a thing to do :)

thanks,

greg k-h
