Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF543395D99;
	Thu,  1 Oct 2026 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865229; cv=none; b=LQMglWo/Bvwi8w8QeG7O1cAV0kEAdfB0U9oiSm7AO+NTQvx9gIxqQR3o/0w5KLjRfgJ31yDU2mwEuPLRo/BaPvxSfChUPlcXk61HedtT9cUbspvaeLmZVWRiW69APQM1FfmP2CIO50G3KTI1xF72KsxEfcuTbCL8GmUWcTn9iVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865229; c=relaxed/simple;
	bh=WddxleOzRrtHtUxEsaO59tONVuiOsP/Fs87jT7uu3rI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUlaeJzOcdCG6HiMkKqGaf6Ukk4fshYwMAtJWMagCW2M2g808kq+K+mIc+O8iiycgDN23W9DfDWrtvHjgHGIykrsPs5+9jcl/oTKeF+etM+yZOdy72SCciNuR43/e+DHcFmQYoFLdCOGme0DuwyflbFHZfhT/59EiX7NnCGllxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLDPOn1u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLDPOn1u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853A91F000FF;
	Thu,  1 Oct 2026 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865223;
	bh=r1olU9nsDlbRnbfF0Z2aZofH79Z6O5j05m7u9kjnR/4=;
	h=Date:From:To:Cc:Subject;
	b=oLDPOn1uDk2Kz/Fwlyngl/V0q6cXn9McaakqT1o6Z20e9sll3cejQRpfUXhEpr3sG
	 +ZSZsQxOcSXYBlVIsOVqEYkXK6bVBpbLfpueUCZSIChTd05dtXIu6UZbNPzJKzD/gf
	 w3GUw7jFry3mD6UIIROTbDpikYFdmKBYmz2clIJHHeliJEjtODvcMfrqtVgo9QLuWs
	 ySo8W1GIvYbZFgKOocq9tpc41sYM5Wr6Qtp2yINzWZuAgyeFllJ3TALsrsFpRuqt8F
	 87ewD5EzRJ15TeUFFl4ZWhbJJzc5t+LaWL1qtpHlNj41f7/WtBaRp+iH+FcD6G8JvV
	 GIPFlhR8fD4vA==
Date: Thu, 1 Oct 2026 15:33:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>, Will Deacon <will@kernel.org>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <ar5vQt0-amiSYUdQ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DEyKikEuJ6F04K97"
Content-Disposition: inline


--DEyKikEuJ6F04K97
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got conflicts in:

  arch/arm64/include/asm/sysreg.h
  arch/arm64/include/asm/ptrace.h

between commit:

  eab76a8e18803 ("arm64: Remove all usage of CONFIG_CPU_BIG_ENDIAN")

=66rom the arm64 tree and commit:

  c7e18ba462536 ("arm64: Share arm64 headers with s390")

=66rom the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/include/asm/ptrace.h
index bd291bd6cfac7,4d88ed5cc4259..0000000000000
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@@ -66,6 -68,14 +68,8 @@@
  #define PSR_AA32_IT_MASK	0x0600fc00	/* If-Then execution state mask */
  #define PSR_AA32_GE_MASK	0x000f0000
 =20
+ #endif /* ARM64_S390_COMMON =3D=3D 1 */
+=20
 -#ifdef CONFIG_CPU_BIG_ENDIAN
 -#define PSR_AA32_ENDSTATE	PSR_AA32_E_BIT
 -#else
 -#define PSR_AA32_ENDSTATE	0
 -#endif
 -
  /* AArch32 CPSR bits, as seen in AArch32 */
  #define COMPAT_PSR_DIT_BIT	0x00200000
 =20
diff --cc arch/arm64/include/asm/sysreg.h
index cec36606f6a43,b4f5dedff5ae8..0000000000000
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@@ -826,27 -838,43 +829,30 @@@
  #define SCTLR_ELx_A	 (BIT(1))
  #define SCTLR_ELx_M	 (BIT(0))
 =20
+ #endif /* ARM64_S390_COMMON =3D=3D 1 */
+=20
 -#ifdef CONFIG_CPU_BIG_ENDIAN
 -#define ENDIAN_SET_EL2		SCTLR_ELx_EE
 -#else
 -#define ENDIAN_SET_EL2		0
 -#endif
 -
  #define INIT_SCTLR_EL2_MMU_ON						\
  	(SCTLR_ELx_M  | SCTLR_ELx_C | SCTLR_ELx_SA | SCTLR_ELx_I |	\
 -	 SCTLR_ELx_IESB | SCTLR_ELx_WXN | ENDIAN_SET_EL2 |		\
 -	 SCTLR_ELx_ITFSB | SCTLR_ELx_EIS | SCTLR_ELx_EOS | SCTLR_EL2_RES1)
 +	 SCTLR_ELx_IESB | SCTLR_ELx_WXN | SCTLR_ELx_ITFSB |		\
 +	 SCTLR_ELx_EIS | SCTLR_ELx_EOS | SCTLR_EL2_RES1)
 =20
 -#define INIT_SCTLR_EL2_MMU_OFF \
 -	(SCTLR_EL2_RES1 | ENDIAN_SET_EL2)
 +#define INIT_SCTLR_EL2_MMU_OFF	(SCTLR_EL2_RES1)
 =20
  /* SCTLR_EL1 specific flags. */
 -#ifdef CONFIG_CPU_BIG_ENDIAN
 -#define ENDIAN_SET_EL1		(SCTLR_EL1_E0E | SCTLR_ELx_EE)
 -#else
 -#define ENDIAN_SET_EL1		0
 -#endif
 -
  #define INIT_SCTLR_EL1_MMU_OFF \
 -	(ENDIAN_SET_EL1 | SCTLR_EL1_LSMAOE | SCTLR_EL1_nTLSMD | \
 -	 SCTLR_EL1_EIS  | SCTLR_EL1_TSCXT  | SCTLR_EL1_EOS)
 +	(SCTLR_EL1_LSMAOE | SCTLR_EL1_nTLSMD | SCTLR_EL1_EIS  |		\
 +	 SCTLR_EL1_TSCXT  | SCTLR_EL1_EOS)
 =20
  #define INIT_SCTLR_EL1_MMU_ON \
 -	(SCTLR_ELx_M      | SCTLR_ELx_C      | SCTLR_ELx_SA    | \
 -	 SCTLR_EL1_SA0    | SCTLR_EL1_SED    | SCTLR_ELx_I     | \
 -	 SCTLR_EL1_DZE    | SCTLR_EL1_UCT    | SCTLR_EL1_nTWE  | \
 -	 SCTLR_ELx_IESB   | SCTLR_EL1_SPAN   | SCTLR_ELx_ITFSB | \
 -	 ENDIAN_SET_EL1   | SCTLR_EL1_UCI    | SCTLR_EL1_EPAN  | \
 -	 SCTLR_EL1_LSMAOE | SCTLR_EL1_nTLSMD | SCTLR_EL1_EIS   | \
 -	 SCTLR_EL1_TSCXT  | SCTLR_EL1_EOS)
 +	(SCTLR_ELx_M      | SCTLR_ELx_C      | SCTLR_ELx_SA     | \
 +	 SCTLR_EL1_SA0    | SCTLR_EL1_SED    | SCTLR_ELx_I      | \
 +	 SCTLR_EL1_DZE    | SCTLR_EL1_UCT    | SCTLR_EL1_nTWE   | \
 +	 SCTLR_ELx_IESB   | SCTLR_EL1_SPAN   | SCTLR_ELx_ITFSB  | \
 +	 SCTLR_EL1_UCI    | SCTLR_EL1_EPAN   | SCTLR_EL1_LSMAOE | \
 +	 SCTLR_EL1_nTLSMD | SCTLR_EL1_EIS    | SCTLR_EL1_TSCXT  | \
 +	 SCTLR_EL1_EOS)
 =20
+ #if ARM64_S390_COMMON =3D=3D 1
  /* MAIR_ELx memory attributes (used by Linux) */
  #define MAIR_ATTR_DEVICE_nGnRnE		UL(0x00)
  #define MAIR_ATTR_DEVICE_nGnRE		UL(0x04)

--DEyKikEuJ6F04K97
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+b0IACgkQJNaLcl1U
h9AdSQf/Qk/Y2fBZZeroMGuIxMcw6/mpYqbuF/ibqLUttQAV7hIePC5QA9HSDPOI
kiZqsqvkfyY7m2dlaOyoLJS3VMadEuL8rXqoizweUkx3tVULtkIB6QExaWhuZjo4
+XukaZNIGP9Oc8BV/x+xBx0TqcoVGxmQO3MhX3cK3gSML9WidRJxDOa+qGXTY0dw
ypvFn0a5qLK9km+6qwFWtaj5ZjquPSSTVqcshJQybswRZ/HaM1q47qpVCfECzuQz
FgAHc2awz4zirsC7PgdjdJNsaQWpYjUUKjDwz9RxtFhOj21jHSXBYTixJ/rhBc1D
6zDDQ3cGI22Fk/3VznTSVEMcsobdpQ==
=D+Px
-----END PGP SIGNATURE-----

--DEyKikEuJ6F04K97--
