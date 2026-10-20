Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792522123;
	b=STKhgfEvyLNESbUHODeIIvMEwIJqkbCVhqtlrlFtbR/CB5QaZfEzEQFOc7ErE93I9LbU
	 IyQP3Hi/2ALW1sR/RbRI0ti9k4q6Op1Wx1Y7fmseibZ8BLXtI5OtX1Xh2H1T6pz+KRnLW
	 zaA5NxF+nMe5mS63YQlAxI/vCRAzYTCaL/YBJ4DrstGRP1exs40vXe35e/9Jz3jYHKBRj
	 Cq0MTYfxlYMOQKGiuAIj86ZI8M88Rf3cP1sflhS+DYfsDHMBV/sPNP/KQbodaYsk4q+Uf
	 /8faaS6ABHKPowj11n0jjEebai2Ev6QNHAJ6G8CjeY7ZpziwJ0B9P+RN8abRAEYMmyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792522123;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-Original-Sender:
	 X-Originating-IP:X-ZEDAT-Hint;
	bh=6qKhWxwsKv3uK6K5cquL3JpxHt7rzdaJjykXvUrc6ug=;
	b=bcaRRwanPacB7MrpuqgB5CZaxlcIYItivjoGYy1/00MAkAgDViwmI8LHeZH63rOeVU+g
	 wadaExBkmLFIaSGiCapu9oE7gXMln5aYGQSw0PcgMGA1uBsCFYEe1DSXzfpe1RyC1DW8v
	 Mpj5WrYKZXgdjgIWxhKs9jAfIeCGskv1uj3iBtsUm7sF6+ODzWsYS9057/ymrKVYa9c66
	 0/s7Tr01VNfBRTHytnzY7R4KMW2QwB+l3ftC6iZSKWQtJkQNg9dSnaAleV/C9a/LTXtae
	 6EpLkRxRHvN8Cu2LFvz2C0NNd5FQefazS0WIayj7dQcyDsYDl6a5kKcWVWXD91vShlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=physik.fu-berlin.de;
	spf=pass smtp.mailfrom=zedat.fu-berlin.de;
	dkim=pass header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=MNCZ0Zqw;
	arc=none smtp.remote-ip=130.133.4.66
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8696606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8696606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=MNCZ0Zqw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=6qKhWxwsKv3uK6K5cquL3JpxHt7rzdaJjykXvUrc6ug=; t=1792522121;
	x=1793126921; b=MNCZ0Zqwc01JwiwOJ5InArdb9UyXisDSkQQUDABrvMpouhtz3SdthHoMditWD
	Jc8R1cZ0Dp3wqiHbGyQC/EoKkJQHevclZk8GIGmhSGmKintEQ8G5Mbah3EJuMenwD2dlDx8AqeGbx
	vTFa9P+P5upUOg9FuOJfmgQLjYTPwW7Y3bBXqZRxa+1gQFH1no+BVbll8iOg01xSLgscdJgDBACWE
	Z5o4cKzZE594f+Phf/F9+vUhcWyysDN78EmUV1Z8sunavUZRRQ82xNnMqq+DyOck7t0bRZUNGrv28
	uKpwX4k4QkwzsHu9t49Xz7BIDqF76qjjIzjCGcdCaD2sXwqq+w==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.100)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1xJEsz-00000001lZR-11Gd; Tue, 20 Oct 2026 20:48:33 +0200
Received: from p5b13a90a.dip0.t-ipconnect.de ([91.19.169.10] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.100)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1xJEsz-00000000GpC-01z7; Tue, 20 Oct 2026 20:48:33 +0200
Message-ID: <2f65337241e230cd26c130bc3183ad230c7c40e4.camel@physik.fu-berlin.de>
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: paulmck@kernel.org, torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, Bradley Morgan
	 <brads@mainlining.org>, Arnd Bergmann <arnd@kernel.org>
Date: Tue, 20 Oct 2026 20:48:32 +0200
In-Reply-To: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Paul,

On Fri, 2026-10-16 at 20:51 -0700, Paul E. McKenney wrote:
> However, it sadly does not permit easy implementation of all algorithms
> needing on two-byte atomic operations because there are some systems stil=
l
> supported by Linux that do not have native two-byte store instructions.
> There is reason to believe that these systems will soon no longer be
> supported by Linux.

Since this paragraph has produced a headline today [1], would you mind
clarifying what you meant here? What architectures are you talking about?

Thanks,
Adrian

> [1] https://www.phoronix.com/news/Linux-7.4-Two-Byte-CMPXCHG

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
