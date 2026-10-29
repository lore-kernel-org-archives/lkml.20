Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268060;
	b=Q0RERXPFzoubziecJtSpOfN4RrU7WmLOc5micsTUN4QfhC3dBD/zQ44+2U2s+Fh2Sadd
	 MJ3PaIu1Y1BmzTXotqHYToQO9O8m08r0QPn47xUHfVYvpOL7nCjQctlYWvj6Yrm+Vqgvk
	 ib90Xe20l6CigdQBXvHzuJyRLCwACbSycIPABlxVq9bTxD6z4bLxqoq7JxaFfgHna3m6H
	 G+W6t0+FOWRTwUnRmYQjuf8tf8UFYwjB/E5yA1CqgqC3ylAzoZrETENTdBm8uAaWcxVqB
	 nVSismxNNEBBchEoIZau+1VJymw9vt9yNILbUCdZIzL+nuKXHBlBeY5F+PZfCTquJ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268060;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yeV4t3OPzSB6JtWdnaZKbzQatEWvHnF9N6qL9bNahSA=;
	b=e4ry52M8Y55hAbkxj+AgskCr5pr2sva5wouaUa3CGcLwiMmxZaEn1fQihHqUEDsQ/+hS
	 j4TGaUPh/riDvHzccc1NinrWQNA5nD2luu6YCvOv6LHdXLZ8y1wWAkft5ko0wFa3P7oKd
	 oQHAxtIPlb0cseJu4nWsPGNC03ZfP7cw5y2aRDMzfVh3VFeaSUD8vLizg8JgtTVtqwXjn
	 TYFnL9d8P+ZlrdnVVd3CiIbnKMzptYz5LhSFQgCkraPEccjaJ4DNRjFPxtZEtYyY+Ffk8
	 dShw3KxxsFdhNUA3Kczch6VEIg41LijDXjBXa18cePguLFHAS30V4huGUrIA3/UlyyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=RUAB1R7x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AB860A2602;
	Thu, 29 Oct 2026 10:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=RUAB1R7x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0571F01380;
	Thu, 29 Oct 2026 10:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793268060;
	bh=yeV4t3OPzSB6JtWdnaZKbzQatEWvHnF9N6qL9bNahSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RUAB1R7x7M5pnD1bc80XNylyflWHcyxnB4ePjd8HpV2av0pl4IL3zwEcFyFJQrqCW
	 DXqxRlHiLu8vPRUYxNsLggHsKK6Q1mT4nixgTaakIbODgJKBeoSdiXrIW+rhYJGthh
	 TsUYmYgTmkBnSdO7ymWtHHJGrcHgANPx6EFeIj+0=
Date: Thu, 29 Oct 2026 11:00:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Francesco Lavra <flavra@baylibre.com>
Cc: Kuen-Han Tsai <khtsai@google.com>, Kees Cook <kees@kernel.org>,
	raub camaioni <raubcameo@gmail.com>,
	Sonali Pradhan <sonalipradhan@google.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Felix Schladt <felix.schladt@gmail.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: Restart timer when eth_start_xmit()
 fails
Message-ID: <2026102950-gave-vehicular-60ba@gregkh>
References: <20260727165441.1969927-1-flavra@baylibre.com>
 <d1534d72eae4fd210bda0b485ed05d3ef0147728.camel@baylibre.com>
 <2026102226-frugally-wake-024e@gregkh>
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
In-Reply-To: <2026102226-frugally-wake-024e@gregkh>

On Thu, Oct 22, 2026 at 03:26:42PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Oct 22, 2026 at 12:24:23PM +0200, Francesco Lavra wrote:
> > Friendly ping
> 
> It is the middle of the merge window, sorry, will try to catch up after
> -rc1 is out...
> 

This version is a bit nicer:
	https://lore.kernel.org/r/20260817192638.437798-1-cosmin-gabriel.tanislav.xa@renesas.com
