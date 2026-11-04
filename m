Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829359;
	b=a5Faj9cBP08W5CYLFq0VnuOC3+zVDS00HYyvclW68V8c3cxZ2YSfPwy/rX2L3KIPoV9Q
	 FztiQwyT5/XAuXDHCdaNAEhRnP7G5hJBJVKYlakniak1hsAxWCBfy0hJOSbHCUVSgZ6S+
	 PLlg5ohJH3cHD5yAaWLcV97TdeWrMoUmMfr0+nmVYb79MtyWfKn0R6bmdCwF3HsSVtQxs
	 PloayIpA3LeOkG1qLD5ATqU3pPbB/1c0W+yC73qkhtp2oUsdfVUkeYyi6/LONpfa9ffMz
	 QJlinXiJUYxqnzJ0Lvg/6TCSZHDKqBeKDdlZJlb0USZSWfa+Wo0cDam622Vs0rnmYtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829359;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=D4h2FEETnVEpGv52rXuV56YLxzG2GQ7jhklvjDnNRjw=;
	b=nkP9hgz2mY35jm5HxKPjuEkwslRziTFOLQgEIxM2fbyD7uWRIxOOplAC91BF+A9AN3KE
	 kwtnnPEG913bopJ8zQY326bg6NVAIMUNDyXHAk+vkkmKZtVTcSJLF8I1CITuGakMRGqy1
	 dj8fMfd8nHfgb+uCHUodxdMY5wyMWO4yNXRzYkAiCLjxX/h69E5Rgcr3OMWHW8eEM1qFl
	 uxN5TxqhKSL2LPC2GBxuzM+bOANGitbC548Q2t1oeluZQFvw10uEOn2Arjo46FnEBw0Uy
	 sv6rHixU+tc9AWBPgs/yGv9uQ6wUJhv7V170edBqrzg2VaxffDXrzE6ncgbDIatsDFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dk4t3nQ2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB2E6086E42
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dk4t3nQ2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35261F000C1;
	Wed,  4 Nov 2026 21:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793829359;
	bh=D4h2FEETnVEpGv52rXuV56YLxzG2GQ7jhklvjDnNRjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dk4t3nQ2AyRHkhM4jWCe+9MmcV7SZgCX4BWc2JWJDka0i7hrsK4FyrAPoA+m0TwSS
	 yyeysme84OC2s9OdiT5qaV74+IFr0N3l1EIWLnzK9XhF9m4HsN3ZYh31KRYI+c00nq
	 uHxVWrvOP1x0FSHaJhWMFmx7r4ZbjGqjGquJe2ZXbaSbbCrl3I6zXhtjSz7Ue2MPqx
	 ZpNkbjQoHfHcu0lXzceooyku2oNsU2CHYX/joAhPueGGFDW/dEpc2wc4PYiRvFzL2Y
	 pxtmcMNuUL6kOyCCWYiok3y2G1MwzfJq7nyMnY+feLaBf8QvllWxBSIZJ/AgHgsHuh
	 gsXrqpGYqNdBg==
Date: Wed, 4 Nov 2026 21:55:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] riscv: accept the atomic extensions this kernel
 was built with
Message-ID: <20261104-saddlebag-starring-4380fcc9293c@spud>
References: <20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com>
 <20261101-lrsc-only-v4-2-4e1d010463b3@mobileye.com>
 <20261103-pushcart-very-04a34d0ffb0e@spud>
 <507f3761-1104-4d15-8fb0-c2fca037ddd4@mobileye.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FgSR+QDkNdZGN1o1"
Content-Disposition: inline
In-Reply-To: <507f3761-1104-4d15-8fb0-c2fca037ddd4@mobileye.com>

--FgSR+QDkNdZGN1o1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 01:23:52PM +0200, Vladimir Kondratiev wrote:
> On 11/3/26 23:41, Conor Dooley wrote:
> > That got me thinking though, I feel like this breaks some of the
> > extension parsing logic in other ways.
> >=20
> > If you putting zalrsc and zaamo in your devicetree, we never do any
> > backwards processing to set the a extension (we don't do this for any
> > extensions by design, we only populate "child" extensions based on their
> > "parent"). If there's some userspace thing that expects to see a in
> > cpufeature or w/e it'd break. There shouldn't be since a has always been
> > supported but who knows. You need custom userspace anyway so I honestly
> > don't give that much of a shit about this going wrong.
> >=20
> > What does "worry" me is hwprobe. Currently you've not modified hwprobe
> > at all to correctly state that you do not support
> > RISCV_HWPROBE_BASE_BEHAVIOR_IMA. (and brings up the question of whether
> > you support RISCV_HWPROBE_BASE_BEHAVIOR_IMA_FD etc!)
> >=20
> > Maybe, again you don't care cos of your custom userspace, but this needs
> > to be holistic if it is being done at all.
> > Personally, I don't want to lower the minimum requirements - the people
> > designing this stuff to run linux should have checked to see what our
> > requirements were (and have always been...).
>=20
> I will drop this patch and keep advertising "a" because formally it is
> true - all "a" including amo instructions do work but rather slow. Also,
> not worth to complicate logic here for (so far) one very special SoC.

By that logic, do not complicate the kernel at all with this zalrsc-only
stuff and drop patch 1 too. Please do this properly or do not do it at
all. If we are introducing the ability to configure the kernel so that
it runs on systems with only zalrsc, people should be able to run the
kernel on such systems without a) failing to boot or b) incorrectly
reporting to userspace what the hardware is capable of doing.

> For this SoC, we will compile user space with upfront knowledge of all
> hardware features.



--FgSR+QDkNdZGN1o1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauup6QAKCRB4tDGHoIJi
0tyTAQCr6BHIWi2JnJO0X/6lATO17o3V+TmKTbRxO0npO1HrHwD+L47N3tNstjUd
VjHMaGKyJDMgYEPbpqH1R4fmYsBEuAk=
=stpy
-----END PGP SIGNATURE-----

--FgSR+QDkNdZGN1o1--
