Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742122;
	b=G78qmTzwmpJgibz16hVBUDQKDAoWDU8XH+Jb0v5hbNPvsJy26dUJDbTTScxFmp/g09gt
	 EySuBnWNBsmq8cmqADQksSb5llxTrdOm1yjo1JwbAnpRix7qhtymym1mkJlK4oplespC6
	 4ixEHnf1GAMJSd1Min01xyErc/iTMa3nzUlmrsBaNhry+p0uDOeYcL3ArRi0hMdwpSTM+
	 T0BVXRA8xN4Jh9FdoxzaFcwivLy0CyJpYG63dOuK4x4J/YbprpBsKjnhErA7kgLLTz73i
	 rcqhxHsLdbDMoU7ahFjSPAV2N8cVH1IDiUnSD8sd3OC3G5HLWNyIxXI7IQlQaLBO39Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742122;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VgaIpfAifMBYZuSSU+Z5bDdVbl7P7y9p2U3XNGCqUJI=;
	b=JpMFKNf1TOQ98nnU1Qal/TkiZuqFDYgF9DxTdBlKNJXYwRoZoH784zflFxGPaz9GoagB
	 Fb6pcKhBGdxBUD9a10zQEggE4MlWhLIyAsJDpDQVBehhMqLV4zfmiCaa1HYfBmyEyyq/a
	 YM+LT0JfY6HsFp/vsvspml2/8lDkecooXcEKGKqgWa96lS3iUetB4o6d2sf8DY+FS7O1E
	 l6t5UqAI/S/eCQBI0HQkKYXR3zbRh5YBrTfXkyvn4IR58B7C6+Uqjg2/ySMhjBDykpvN4
	 Yf7SWHDRaCkHLiYWs1Jqjo9xP3aifojFhAVyMZbyiGiA0Nk/n0dFhKMLvRNQV8Yko/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AR1aBXIb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA33606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AR1aBXIb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B131F000C1;
	Tue,  3 Nov 2026 21:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742121;
	bh=VgaIpfAifMBYZuSSU+Z5bDdVbl7P7y9p2U3XNGCqUJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AR1aBXIbZyIxz6FnXAKHXRi0xw/IT3HH0SNw7eZVZP20XQ5BAKNbPcFIzTvolNJyv
	 Os8jwK33QdB/JyC5RSE8SK5nuuD9y2jaT99KhCwvdyidEaRHFW+exyIKajEOkBkgNP
	 AboNYJv9DFy3eE5/z9bnidNCUHum1MOy7dL05hi2qs9udi8gKsrJqRdTVMi93zkmva
	 SbU0v6pKOWCaanoz1Fxq1i84cota2f/uNrMI+cQiw9LO2F8JZOS9T4ZFfW3iuvKvGd
	 GUFfGFDafRwFRXNYrvQZlCaHAm2hxiZ2NDS900knVGYYj0H8C0lXr+5zXrp9Ci30ys
	 jjfP3SxiCKIOw==
Date: Tue, 3 Nov 2026 21:41:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
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
Message-ID: <20261103-pushcart-very-04a34d0ffb0e@spud>
References: <20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com>
 <20261101-lrsc-only-v4-2-4e1d010463b3@mobileye.com>
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
	protocol="application/pgp-signature"; boundary="ekmL25IDW+nRfJUX"
Content-Disposition: inline
In-Reply-To: <20261101-lrsc-only-v4-2-4e1d010463b3@mobileye.com>

--ekmL25IDW+nRfJUX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 02:51:40PM +0200, Vladimir Kondratiev wrote:
> riscv_early_of_processor_hartid() rejects a hart unless its
> riscv,isa-extensions property contains "a". That rejects a Zalrsc-only
> hart even when the kernel was built to use only LR/SC.
>=20
> Require "a" or "zaamo" when the kernel emits AMO, and "a" or "zalrsc"
> when it emits LR/SC. A normal build defines both toolchain macros and
> still requires the full A extension. The legacy "riscv,isa" fallback
> keeps its rv{32,64}ima check.
>=20
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
>  arch/riscv/kernel/cpu.c | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 3dbc8cc557dd..5d1e39d16e59 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -82,12 +82,32 @@ int __init riscv_early_of_processor_hartid(struct dev=
ice_node *node, unsigned lo
>  		return -ENODEV;
> =20
>  	if (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
> -	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
> -	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0) {
> -		pr_warn("CPU with hartid=3D%lu does not support ima", *hart);
> +	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0) {
> +		pr_warn("CPU with hartid=3D%lu does not support im", *hart);
>  		return -ENODEV;
>  	}
> -
> +#if !defined(__riscv_atomic) && !defined(__riscv_zaamo) && !defined(__ri=
scv_zalrsc)
> +#error "Need AMO or LR/SC atomics"
> +#endif
> +	/*
> +	 * Require each atomic form this kernel emits. The single-letter
> +	 * "a" extension satisfies either check. A Zalrsc-only build defines
> +	 * __riscv_zalrsc and checks that extension only.
> +	 */
> +#if defined(__riscv_atomic) || defined(__riscv_zaamo)
> +	if (of_property_match_string(node, "riscv,isa-extensions", "a") < 0 &&
> +	    of_property_match_string(node, "riscv,isa-extensions", "zaamo") < 0=
) {
> +		pr_warn("CPU with hartid=3D%lu does not support AMO atomics", *hart);
> +		return -ENODEV;
> +	}
> +#endif
> +#if defined(__riscv_atomic) || defined(__riscv_zalrsc)
> +	if (of_property_match_string(node, "riscv,isa-extensions", "a") < 0 &&
> +	    of_property_match_string(node, "riscv,isa-extensions", "zalrsc") < =
0) {
> +		pr_warn("CPU with hartid=3D%lu does not support LR/SC atomics", *hart);
> +		return -ENODEV;
> +	}
> +#endif
>  	return 0;

I really hate this in particular. Please make use of IS_ENABLED() to
simplify this and enable writing it without #if stuff.

It's effectively just:

	if (IS_ENABLED(RISCV_ISA_A) && of_property_match_string(node, "riscv,isa-e=
xtensions", "a") < 0 &&
	    of_property_match_string(node, "riscv,isa-extensions", "zaamo") < 0) {
		pr_warn("CPU with hartid=3D%lu does not support AMO atomics", *hart);
		return -ENODEV;
	}

	if (of_property_match_string(node, "riscv,isa-extensions", "a") < 0 &&
	    of_property_match_string(node, "riscv,isa-extensions", "zalrsc") < 0) {
		pr_warn("CPU with hartid=3D%lu does not support LR/SC atomics", *hart);
		return -ENODEV;
	}

but I would probably opt to write this as:

	/*
	 * The hart must support lr/sc in all configurations, and AMOs if the
	 * kernel was built with the full A extension.
	 */
	if (of_property_match_string(node, "riscv,isa-extensions", "a") >=3D 0)
		return 0;

	if (of_property_match_string(node, "riscv,isa-extensions", "zalrsc") < 0) {
		pr_warn("CPU with hartid=3D%lu does not support LR/SC atomics", *hart);
		return -ENODEV;
	}

	if (IS_ENABLED(RISCV_ISA_A) && of_property_match_string(node, "riscv,isa-e=
xtensions", "zaamo") < 0) {
		pr_warn("CPU with hartid=3D%lu does not support AMO atomics", *hart);
		return -ENODEV;
	}

That works, right?

That got me thinking though, I feel like this breaks some of the
extension parsing logic in other ways.

If you putting zalrsc and zaamo in your devicetree, we never do any
backwards processing to set the a extension (we don't do this for any
extensions by design, we only populate "child" extensions based on their
"parent"). If there's some userspace thing that expects to see a in
cpufeature or w/e it'd break. There shouldn't be since a has always been
supported but who knows. You need custom userspace anyway so I honestly
don't give that much of a shit about this going wrong.

What does "worry" me is hwprobe. Currently you've not modified hwprobe
at all to correctly state that you do not support
RISCV_HWPROBE_BASE_BEHAVIOR_IMA. (and brings up the question of whether
you support RISCV_HWPROBE_BASE_BEHAVIOR_IMA_FD etc!)

Maybe, again you don't care cos of your custom userspace, but this needs
to be holistic if it is being done at all.
Personally, I don't want to lower the minimum requirements - the people
designing this stuff to run linux should have checked to see what our
requirements were (and have always been...).

Thanks,
Conor.


--ekmL25IDW+nRfJUX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupVIwAKCRB4tDGHoIJi
0lm8AP9mrnOImhJQGzJIPznzB8j87rQ77AAOBIAP8OUgZ7ysYgEA/w2ZJcLx9MIL
cNXnPWLXEJdZQ0kys/ePoROG4bbOZQM=
=tN95
-----END PGP SIGNATURE-----

--ekmL25IDW+nRfJUX--
