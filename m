Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AFB4AA01D;
	Thu,  3 Sep 2026 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444867; cv=none; b=XcQCZyVMzzCjlKTUl38Pefs/vuU+94rxnkIFhkEGaQaslqO0ntH9N3oXO/Lc5OMZQtyDNjuQJus3rllaDwIsXgho2VByAvst9bx0y5vnc3CPrctW6RxXXrOUpfn8d4aE3cnZAm+d3zk6jDQu6OVGbkHgGA5xtp59MY145Mw71TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444867; c=relaxed/simple;
	bh=J0bvimGPAN2X30p/5wm2vkA1BzgImHC4FAJ/QZbPY/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBE89m7HNaj5J0i9Oh7Pz2SUIssYGD7aLxnr26s4Ui8dv1WAbA2/WbRUeCmCb/CI62ldqCR4ercRG+NmdXXIcGT64yw1hSwEiHxLbVk6Lc9Ozy0FrH8v5NqgQOv2vNkXce+DJv+/XVcUiICrZjhE6L3eoh/l+1bYS95k9wSFI2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hQef+cIZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2j9ImPhK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hQef+cIZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2j9ImPhK"
Date: Thu, 3 Sep 2026 16:14:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788444845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uxueduM2jdpHpFUA5itz4EXdilGmVrtEHz4rhg8u9T8=;
	b=hQef+cIZdKQ0Q3jkwKG8zUbKIdkgj9a0EPC2xOvVUCEW2vd8qGsbwgC+RGhipC57ysg7d+
	7XQUF5vKGQE3X9tfjbfDoR96xyML77P1wklHhxH4eyDEKaiJpFuCA1BOhpU+RIHg0JpgS7
	NkrsQL6A2KPwSRMzaaxG0Bpl0AkHcDi+z6izxoqnyMYGjMkqD7IGuGaHiwOTWrUzS3fpsQ
	TlpM7q6OQeQfqddPmOknixHkvaZXVOUE4haXQtPjkZqnTCmsqSzIVqEjJEC3e7XkWQEh9t
	8Jct1HQ4dpWbGMG8h9TXZE7l3OEZFZFbj2ioZ79wGN3oSv9ZXYa0ad0vDr0yew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788444845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uxueduM2jdpHpFUA5itz4EXdilGmVrtEHz4rhg8u9T8=;
	b=2j9ImPhK3/So43hE3QV25Jr9ScBylZdCxnq+KoGBJeEMIr6+2tWu7WsK5gZTkQVlKXekZQ
	hRNHEiMXD7qAb/Cg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] USB: mtu3: tracing: fix pointers dereferencing
Message-ID: <20260903141403.3bNG0z7l@linutronix.de>
References: <CGME20260804100540eucas1p24c59c891e91eeeeea8032d1c80312ea3@eucas1p2.samsung.com>
 <20260804100531.88576-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260804100531.88576-1-m.szyprowski@samsung.com>

On 2026-08-04 12:05:30 [+0200], Marek Szyprowski wrote:
> Commit b5cc230af5e5 ("tracing: Warn when an event dereferences a pointer
> in TP_printk()") added a warning then printing an event dereferences
> a pointer, because it might be already freed that time.
> 
> MTU3 driver is one of the drivers triggering this warning. Fix it by
> storing also the DMA address in the event structure to avoid
> dereferencing gpd_ring pointer during event printing.
> 
> Fixes: 83374e035b62 ("usb: mtu3: add tracepoints to help debug")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Just run into this, made the same fix :)

Sebastian
