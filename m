Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB30545DA4;
	Thu, 15 Oct 2026 15:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078458; cv=none; b=ZXW5xSgfL4IUxgUtVegb2laKqZqP3e6QVq65kOx8hosi5cHiOK77YcewpGdk1f/kzWi8eRMpsDsiaYfZX6xGhSsNjTqe8/n/AQ1JJr2edh9awTB0TNY8G7bslI/6itMB2vR6C6uoeYetZdak0YRF8gfzXJNSVwvqgL293KSFnEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078458; c=relaxed/simple;
	bh=f+SPdZj8+UTSH9p70a+wY9ahY2t6NLDJ6IZpV8RvhU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VjKyINRRc7vM5NXpYkokVQvQbvPA1O/OR4bO7lWQEYSsZ0L+Lkgso71ArJ/i/GwGxmCfNNXJ1GJa6b019NTmxgy302itk99MTovER+dXjrzjOkJA4H2ZqHSlPuvxbi3bEmSkeyjB9gURYfZk0dy3+RQ56qfhccwSLgqBx2Jmztg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKJnlDm5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKJnlDm5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F701F000C4;
	Thu, 15 Oct 2026 15:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792078446;
	bh=doN+dCbQy4DCSNYmIlUNQHoigLzICB92by7Oo9TUszQ=;
	h=Date:From:To:Cc:Subject;
	b=MKJnlDm5zLXsAT1us1wQzPGWfz15iiOr+atSUC/dzwTSROl6ApMXWL2Yv/5E8hEv1
	 CGlzE31TmatQVsT7LR0yVWmkftIGBYAT02tiBu6mCwBFfN67abVveEvwqsHIZZCGwX
	 TQBfJHZDJrDzjLLJWqFPLvGiN+E+SdczFWhfwWaR1JsUWoz6z/DLH+FqY3oXtK2zho
	 FXn3fhN6G/9Fgn+Au1T+kFfcSIBVSfa0TeBaKhLpRGArUdXfUDjx4jWBDDV55o9WNL
	 eLOpi2baRUz/7JAq5S2u95p8TP5K2yJgtAXoHdXtGO9NIWd18TnZW189qL6G6kVG8H
	 O34Yao8sVJRDg==
Date: Thu, 15 Oct 2026 16:34:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Gautam Gala <ggala@linux.ibm.com>, Steffen Eiden <seiden@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in final build
Message-ID: <atDyad6Dg3msWmW_@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wqqMKXvB7gTQK+/6"
Content-Disposition: inline


--wqqMKXvB7gTQK+/6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

In the final build, today's linux-next build (s390 defconfig) failed
like this:

/tmp/next/build/arch/s390/kvm/arm64/../gmap/kvm_mmu.c: In function 's390_kvm_mmu_prepare_memory_region':
/tmp/next/build/arch/s390/kvm/arm64/../gmap/kvm_mmu.c:83:22: error: 'struct kvm_arch' has no member named 'migration_mode'
   83 |         if (kvm->arch.migration_mode) {
      |                      ^


Caused by commit

   325380d8e7893 (KVM: s390: arm64: Integrate arm on s390)

I have reverted that for today.

--wqqMKXvB7gTQK+/6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrQ8mkACgkQJNaLcl1U
h9BRXQf/QKmIXKxw6f37y3U+qujl87P1ElzgEZcS4cKIPmXbbEg4A67gTKsmEKZR
3uTd5OHb9ZnEEFMe6kJ51XV/WFypodOTP3kfQ5Uli9GE2+7FbIpMr7kN6lfRFp06
TN4B/IflaCUKSzuuEIkV0Ger14XxU5Cp6w3dXOMLb1djaHxrNeswslhsUnKm+Qhv
s3RD8ipEeDviu40Dy4PUfMRSFQCQASOlPZWhmnU5/kebHI7KxFTA+6x+eqim5BA4
RfTQ5urcny4RpTNZ2nH9yIKcgP+6Dmh/ioVBEGzFXqtP7n6XLIg3Gk60NONySQfj
D99LEB9ZzF4LFXDySgZC2QHYbxmirw==
=4r0V
-----END PGP SIGNATURE-----

--wqqMKXvB7gTQK+/6--
