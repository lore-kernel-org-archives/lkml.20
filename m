Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A824AB3DA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595526; cv=none; b=j8ZHzhRfBaI227YsCcJ+HbjJ6nXSKpXVnJafeIlOxY0z84WDSndBcnRiq/FhVZqHEOFzeC8zHo0DHHDWTpPm1bJWURL7nncPqnTh9NKIFUuoJY9/AXeHFGy84rzfOw2JpGoC4SmuNTOQcbq7NUBHdwlQEuuN6uKZg2jOo41UX9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595526; c=relaxed/simple;
	bh=chepO21nsfjqXOtqCbP4d0DXR0pxAHhbCjhGGisK2UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpEa+rBzzXWzPU1bq0TAZ3NvU5JtVsjshW0YIAWbd99snqX2Cgzn7CsEgro1KiXs4C+rI51I8gjORCScV9R8RJuVMhlXGiCtIgL/tKVD7TwQxjEp4K8WjNFIEwcM4tYoGUd5nz6uDg2Jgp9/JTO1Qm5XzPkc3TN7+Z6SZaLz6as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBb7z6/F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBb7z6/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2BC1F000FF;
	Mon, 28 Sep 2026 11:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790595525;
	bh=XNGkhJEfxOeYKYpixMtJoNeTjPIucLbHny1mogdj/aA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QBb7z6/FP3AmSw3CsJ02RRRqAX29w35VTu2NoKyC5xhM2zLjlKzaeDVJVSsJnvbp9
	 UD77NoHmrGRCMeWcqNkQ/bXaA0kpvfeByfO+0dsmb3JW5iqAYWaOB6pWod1Flvj+YS
	 kM1dW/SpQyP2E13Fyx3lKmrP6Zj2f2MxNgA45CA+v4f+RDXWgxs7SXe0fwzmeIAMzc
	 /kbUOqOu8MzrwTII/JDJiEet94/hwBTEiywIW6vz9co0EbTKM/c4r6L06T4lBcinll
	 8V71vTx052R9vzPl3BXKWOBoSyTVoZktkofcfE+cJiMEMk3reowpfoHp9N+TOilRT3
	 T0AJJzMwNnZhg==
Date: Mon, 28 Sep 2026 13:38:39 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Shashank Mohan Jain <jain.sm@gmail.com>
Cc: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
	Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] time/jiffies: Don't saturate usecs_to_jiffies() on a
 truncated limit
Message-ID: <imuoalnzhebreu6btt2qp5itwz67eckm5favcjrinb42lwrqy3@prd5dpnnt5fl>
References: <20260928093601.79224-1-jain.sm@gmail.com>
 <20260928093601.79224-2-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6fqjv7tfrcm3raqn"
Content-Disposition: inline
In-Reply-To: <20260928093601.79224-2-jain.sm@gmail.com>


--6fqjv7tfrcm3raqn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 03:05:59PM +0530, Shashank Mohan Jain wrote:
> usecs_to_jiffies() and __usecs_to_jiffies() return MAX_JIFFY_OFFSET, an
> effectively infinite timeout, when
>=20
> 	u > jiffies_to_usecs(MAX_JIFFY_OFFSET)
>=20
> but jiffies_to_usecs() returns an unsigned int, so the limit is
> MAX_JIFFY_OFFSET microseconds truncated to 32 bits, an arbitrary value.
> With HZ=3D300 the out-of-line jiffies_to_usecs() also overflows 64 bits in
> j * HZ_TO_USEC_NUM, and the limit ends up at 1431649098 us on 64-bit and
> 1431649781 us on 32-bit. Every timeout between about 23.9 and 71.6
> minutes then becomes infinite: usecs_to_jiffies(2000000000) returns
> MAX_JIFFY_OFFSET instead of 600000. For instance, a PIE tupdate or a
> DAMOS watermark interval of 30 minutes never fires at HZ=3D300. With
> HZ=3D100, 250 and 1000 the limit is 4294947296, 4294959296 and 4294965296
> us, so there only the top 19999, 7999 and 1999 values are affected.
>=20
> The check is not needed at all. MAX_JIFFY_OFFSET is at least 2^30 - 2
> jiffies and HZ is below 12288, so UINT_MAX microseconds are far below
> MAX_JIFFY_OFFSET jiffies for every supported HZ. Drop it, update the
> kernel-doc, and add a static_assert() for the assumption.
>=20
> The bogus limit was also hiding a wrap: when HZ divides USEC_PER_SEC,
> _usecs_to_jiffies() rounds up with (u + USEC_PER_SEC / HZ - 1) in
> unsigned int, which wraps for u close to UINT_MAX (usecs_to_jiffies(
> UINT_MAX) would become 0 at HZ=3D100). Round up with a remainder test
> instead. The reciprocal multiplication used for the other HZ values is
> done in 64 bits and does not wrap for any 32-bit input.

Looks like your fixing two things in one patch. I would suggest making
two patches

>=20
> Values above the old limit, including UINT_MAX, now give a finite
> timeout (at most about 71.6 minutes) with every HZ. No caller uses
> UINT_MAX as an "infinite" marker; the callers that clamp to UINT_MAX or
> range-check the result (TCP_RTO_MIN_US, TCP_DELACK_MAX_US) keep working.
>=20
> When HZ does not divide USEC_PER_SEC, jiffies_to_usecs() is out of line,
> so the check also defeated the constant folding: every
> usecs_to_jiffies(<constant>) compiled to a call to jiffies_to_usecs()
> and a compare. Those now fold to a constant.

This commit message (and the others in this series as well as the cover
letter) is too verbose, hard to read. It is not obvious what you are
doing and why.

I suggest a table of erroneous values. Like [1]

[1] https://lore.kernel.org/20260923134237.3628505-1-zhanxusheng@xiaomi.com
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: LLM
> Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
> ---
> Checked in userspace over all 2^32 inputs, with the current code and
> the code from this patch both extracted verbatim from the tree and
> built with the generated timeconst.h, for every Kconfig HZ value (24,
> 32, 48, 64, 100, 128, 200, 250, 256, 300, 500, 1000, 1024, 1200),
> 32- and 64-bit. The KUnit test in patch 3 fails without this patch on
> UML x86_64 (HZ=3D100) and on qemu x86_64 and i386 with HZ=3D300, and pass=
es
> with it. Prepared with Claude Code (Anthropic), model Claude Opus 5.5
> (claude-opus-5-5).
>=20
>  include/linux/jiffies.h | 22 ++++++++--------------
>  kernel/time/time.c      | 10 +++++++---
>  2 files changed, 15 insertions(+), 17 deletions(-)
>=20
> diff --git a/include/linux/jiffies.h b/include/linux/jiffies.h
> index bbd57061802c..d3f2663e4435 100644
> --- a/include/linux/jiffies.h
> +++ b/include/linux/jiffies.h
> @@ -575,7 +575,8 @@ extern unsigned long __usecs_to_jiffies(const unsigne=
d int u);
>  #if !(USEC_PER_SEC % HZ)
>  static inline unsigned long _usecs_to_jiffies(const unsigned int u)
>  {
> -	return (u + (USEC_PER_SEC / HZ) - 1) / (USEC_PER_SEC / HZ);
> +	/* Round up without overflowing for u close to UINT_MAX */
> +	return u / (USEC_PER_SEC / HZ) + !!(u % (USEC_PER_SEC / HZ));
>  }
>  #else
>  static inline unsigned long _usecs_to_jiffies(const unsigned int u)
> @@ -589,14 +590,10 @@ static inline unsigned long _usecs_to_jiffies(const=
 unsigned int u)
>   * usecs_to_jiffies: - convert microseconds to jiffies
>   * @u:	time in microseconds
>   *
> - * conversion is done as follows:
> - *
> - * - 'too large' values [that would result in larger than
> - *   MAX_JIFFY_OFFSET values] mean 'infinite timeout' too.
> - *
> - * - all other values are converted to jiffies by either multiplying
> - *   the input value by a factor or dividing it with a factor and
> - *   handling any 32-bit overflows as for msecs_to_jiffies.
> + * conversion is done by either multiplying the input value by a factor
> + * or dividing it with a factor, rounding up. Any unsigned int number of
> + * microseconds is far below MAX_JIFFY_OFFSET jiffies for every supported
> + * HZ, so, unlike msecs_to_jiffies(), there is no 'infinite timeout' cas=
e.
>   *
>   * usecs_to_jiffies() checks for the passed in value being a constant
>   * via __builtin_constant_p() allowing gcc to eliminate most of the
> @@ -611,13 +608,10 @@ static inline unsigned long _usecs_to_jiffies(const=
 unsigned int u)
>   */
>  static __always_inline unsigned long usecs_to_jiffies(const unsigned int=
 u)
>  {
> -	if (__builtin_constant_p(u)) {
> -		if (u > jiffies_to_usecs(MAX_JIFFY_OFFSET))
> -			return MAX_JIFFY_OFFSET;
> +	if (__builtin_constant_p(u))
>  		return _usecs_to_jiffies(u);
> -	} else {
> +	else
>  		return __usecs_to_jiffies(u);
> -	}

This effectively becomes

if (__builtin_constant_p(u))
  return _usecs_to_jiffies(u);
else
  return _usecs_to_jiffies(u);

What is the point of this?

Best
> =20
>  extern unsigned long timespec64_to_jiffies(const struct timespec64 *valu=
e);
> diff --git a/kernel/time/time.c b/kernel/time/time.c
> index 079ab34f61db..470195e88ca0 100644
> --- a/kernel/time/time.c
> +++ b/kernel/time/time.c
> @@ -591,16 +591,20 @@ unsigned long __msecs_to_jiffies(const unsigned int=
 m)
>  }
>  EXPORT_SYMBOL(__msecs_to_jiffies);
> =20
> +/*
> + * UINT_MAX microseconds are far less than MAX_JIFFY_OFFSET jiffies for =
every
> + * supported HZ, so usecs_to_jiffies() never needs to saturate.
> + */
> +static_assert((u64)UINT_MAX * HZ / USEC_PER_SEC < MAX_JIFFY_OFFSET);
> +
>  /**
>   * __usecs_to_jiffies: - convert microseconds to jiffies
> - * @u:	time in milliseconds
> + * @u:	time in microseconds
>   *
>   * Return: jiffies value
>   */
>  unsigned long __usecs_to_jiffies(const unsigned int u)
>  {
> -	if (u > jiffies_to_usecs(MAX_JIFFY_OFFSET))
> -		return MAX_JIFFY_OFFSET;
>  	return _usecs_to_jiffies(u);
>  }
>  EXPORT_SYMBOL(__usecs_to_jiffies);
> --=20
> 2.43.0
>=20

--6fqjv7tfrcm3raqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmq6UbgACgkQupfNUreW
QU/NYQv/ZgNT17TVNHwXqcMrLim7AVclxK/suP36VatrpRORrr2RPAgO1lnJPVH0
0CYM4DriTxFp8MgnD6i/pFifYCo1/unIJ38M9GabuxTMUEH5Wo9pkTc1riJyc2y7
TBTEe48AQ+A6uJbbi3lKyz3+ir4it6ZchsttJE1wxsJHxyZdoOMUiWCPIj7UlR+f
89d9m7XHrUAns+uMuEDXb0i/uMosld2TGV19EaKu8GUdDL3KXu+Jsccfkc+qBSpx
KJ57McQbJh1TKcElh4wDZHoQjZKycEf8ZgEDwJ677a5pAc5jkgAEur2qZdJt5xAK
NI2I3vC+wHannad2C0I3Wv6Bae+mK1ligwtlwZWUd4qC8yMe+C2hIPWdkqpng9xO
gi6417Os+kQ3NU3PnlaQJAyglGGCzIEEKk9Jvo8tDfqlLfWQtfw/9qtwU6qoXzYk
VmOtYEKyB2/wnb0k/gAwMzqmsdXbHyeCQ2UZlcTkBdng1Kva5PZMBsdiX+0M02xl
6G7o8ASs
=Wi3G
-----END PGP SIGNATURE-----

--6fqjv7tfrcm3raqn--
