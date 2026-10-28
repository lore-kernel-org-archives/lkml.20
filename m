Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209647;
	b=CwnMAZHxUpZ9V7P5LmF7K36TAgNiaXJPs2BD5+JvYAwq9d4Rld7HCr42HMZWSZG/5OmD
	 10W94t/rFwR6jKPadjXmFyAlGEBdOxcuKZMSXJj6d0bI+5iaojZ6ZrGTHJmwgO/oKtM6J
	 HGnHumK2N4y3XQdJNZyncRfYWFqfiFu22czNFZuHxB+H+t0bnmLQBv+lexWHYx4Z4vQ+3
	 rUxfx8rINa0pSf3UapcaY7cfLuhwoN479r+95z/0gm41VROkzwIKtEmLtgJc9dL21iBnC
	 smZEzL1LPuN7xXRFCXO5eqQ3vlrAxve279rVXDyBNTCYwOenQFcSATXK22/nmKYhpww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209647;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Khepq3HVmXfGIh7NMXvkdrEul/x4xyGA8jwlNAtrA0I=;
	b=G2bTLODobBHjGykuqo6g08JhgakwS08VArXNNnzOoX0wOF56VbDdASmyqYjre3GQ1ukP
	 OjrPGfEUiL2M2NKaL/GqToK77RMkQt9g5JLXq2tfzlMsT9+oDLzF+hTl0fCYrdVu4qX9L
	 zkU+6trkKF5v/YjQgahPOX79opsoEuVT9zGaFcgUMyblJaTr4BAWn74+Lu3chnAj+YBbK
	 /pVuIMyO4kUArM/0goctJOn0U5rhtvvofk5FgVejyCKuIRUJRle8pB7ehY1d/TYapvpO3
	 lYDFocXY95Ko+09qwHQkUgtvrfXBm8fpagquDw2y3VpP9cKIwevyvoyv9aQBbojqkKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IECpJTyt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41AB606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IECpJTyt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E011F01829;
	Wed, 28 Oct 2026 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793209646;
	bh=Khepq3HVmXfGIh7NMXvkdrEul/x4xyGA8jwlNAtrA0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IECpJTyt2Oz6ZKLCukTSn7AEY5ufZtSzT4CO7RdGh5QIXY+SFHJS4urIF2K7LwVyl
	 I6brUJaboY+FwvTGyiMIUaTLUf8Ja/AhhrYyop0XQWJINBZ4ZuNaoXlDshIXReHdIu
	 CCw5C7HYvJehb4n7xlCgRc8ZZHzjdtS7J47mELeoTqF1IZKt9RgYMCzmTO2wjeShaH
	 Z0buq46H/qzSrgMVfKeLwWonva5yGNxhLybUdlf1TlNWDWDYdxalXdywzOPOmIGbI4
	 steAtoXXMmsGUamrMBwJWGWOSW8G4Pq2DygAxT8DpqfkUttMw6YiXr3UKYXj1fMn3H
	 FRVnJs7m8L2iA==
Date: Wed, 28 Oct 2026 11:47:25 -0600
From: Keith Busch <kbusch@kernel.org>
To: Erwan Velu <erwanaliasr1@gmail.com>
Cc: Erwan Velu <e.velu@criteo.com>, linux-nvme@lists.infradead.org,
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: honor the volatile write cache enable state
Message-ID: <auI1LR6Ql397Kl2b@kbusch-mbp>
References: <CAL2Jzuz1qFwLSA=iivp5qLCTL6-4rvKmvFzJbOQzjPu6j_7Y2A@mail.gmail.com>
 <atJeazM_rJ0uj3vt@kbusch-mbp>
 <CAL2Jzux8v6zCxfcdd=MY5n0zQMVSa-_8Lki9z-fz7bFShNf7vw@mail.gmail.com>
 <atJk_2FmzjUZYO_Z@kbusch-mbp>
 <f665dc3e-fc5c-4352-8e41-a46b7ae97946@criteo.com>
 <CAL2JzuwuZp0gg1D7wSn7cdgpnhotnuLP6YpPd-SrdVyqhkeiJw@mail.gmail.com>
 <atqZmctbU0siYmVX@kbusch-mbp>
 <7fec6534-9e57-4041-8699-72c5950c7e2a@criteo.com>
 <auId5RuBhMFGirJ1@kbusch-mbp>
 <CAL2JzuzMo3xTMbF6LK97yf6-CB0_NGhr7sGpf69Gv3ONvZQ1KQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL2JzuzMo3xTMbF6LK97yf6-CB0_NGhr7sGpf69Gv3ONvZQ1KQ@mail.gmail.com>

On Wed, Oct 28, 2026 at 06:08:17PM +0100, Erwan Velu wrote:
> Le mer. 28 oct. 2026 à 17:08, Keith Busch <kbusch@kernel.org> a écrit :
> [...]
> > > Considering the performance impact for these type of device,s would you be
> > > open to a backport to stable once merged ?
> >
> > Not sure when a performance improvement is stable worthy. I'm more
> > concerned that doing this is going to expose corruption, but it's what
> > the device is asking for, so fine to introduce it, but stable is
> > questionable.
> If we consider this dangerous for this device, should we add a quirk
> for some devices that could be seen as lying?

Let's just assume spec complaince for now until proven otherwise.
When/if a device is discovered to be quirky on this feature, we can
introduce handling to ignore WCE.
