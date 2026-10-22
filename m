Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675789;
	b=axBiv/QGeadKEKMRBnoy0LppltYI+MWgh+pRTH064VoZvwrasG47F52wMhfHI1r95uUn
	 +EbBJyY9pjLTdvrVaCMnCcw3f9UPB1zg8PZuxARysb2d6+xUhT/JZHkNXWCkyVtG4EOzL
	 2yRRs5jQXWZIPq0oSy+Wfmaav+DNJxVBPqykSVLoSUHqfKXmxJ90WzmxR1Kjmm4T8s7yn
	 By2SccE/gFlMyBTevQFxyI3xqIL/z3EMSWsfldr4zhAmDID75d6aipAaiO90tk2o2MbdP
	 ksCPSnvj+Gt9rCJuJEnvrIcbM1LF7W2Nc/7WVxPDe5dnwkv9CiAqUA9pDmNxrVJxn3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675789;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AnqmMFqEFPzN9pgWUkIKDXgFbu33bdpsPqR54NgslOY=;
	b=ctNes0PBiEiIjuNt8R3EiF9GfBATjmIDdyWv3e+NhcjGMmcOICsYQGoDM64RlzI8Fblg
	 /LlDgKeCESyTbJRwh0ODdCnOMSPbAl2frGFpb5Bk4C1JIpVB1iofBCGNW/sFJhqTyMPFT
	 gb2gtky3GpUC0SS1ta3Chp+6bkwPk9JU0cdSedfPROtar/y3wR8B3KVGHCqjYWr4teeNO
	 jlNruKFRh0BjqVeymTvIDtSHaGgAAn11eqv1kz9kDTNtDNZ1Wc230fDJwsCZnRLNb+hji
	 WUTI2AlmfgeTPjsVV08TEB2C/0eHdg7LDxjBdcaEjoKRayvDGjpYKCgQLWAEJC4BCJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=S4z790oy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E920606A323;
	Thu, 22 Oct 2026 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=S4z790oy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD661F000C2;
	Thu, 22 Oct 2026 13:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792675788;
	bh=AnqmMFqEFPzN9pgWUkIKDXgFbu33bdpsPqR54NgslOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S4z790oyKjJ5ibyjkrETS1ROM6VsCTXT0lzLkd5p3POQWFrfQxPD+qNNu3KLKXuIH
	 PrPGgx/iSTqC4CSq7qDJFTicFcFcdOR7M5CdUMOF77XNz6tbjV9fK1Fk0jsnc78Q6T
	 7h2zG7IrPDd0ENi4F1Vh/S1t+sTc7sN0Ilu7wrGw=
Date: Thu, 22 Oct 2026 15:26:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Francesco Lavra <flavra@baylibre.com>
Cc: Kuen-Han Tsai <khtsai@google.com>, Kees Cook <kees@kernel.org>,
	raub camaioni <raubcameo@gmail.com>,
	Sonali Pradhan <sonalipradhan@google.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Felix Schladt <felix.schladt@gmail.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: Restart timer when eth_start_xmit()
 fails
Message-ID: <2026102226-frugally-wake-024e@gregkh>
References: <20260727165441.1969927-1-flavra@baylibre.com>
 <d1534d72eae4fd210bda0b485ed05d3ef0147728.camel@baylibre.com>
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
In-Reply-To: <d1534d72eae4fd210bda0b485ed05d3ef0147728.camel@baylibre.com>

On Thu, Oct 22, 2026 at 12:24:23PM +0200, Francesco Lavra wrote:
> Friendly ping

It is the middle of the merge window, sorry, will try to catch up after
-rc1 is out...
