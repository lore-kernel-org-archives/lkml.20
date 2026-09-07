Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6694C77D9;
	Mon,  7 Sep 2026 14:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789623; cv=none; b=NmYXEcAlLzCHIrG+YZzyIKx8ltrBh+MBWX3XPXVqCMPn37aBmvjgNt5yvG2UMEgdY8JP5hFJI77zb5Tz1d/uwW36a44vv1RN9gaXDahJaWpr335MeyYRrRFyABs9K/lQCGPRQlm6LHi8K8znrHIGeWC9h3+be9V6IaZpuBJxlwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789623; c=relaxed/simple;
	bh=EgLK3o+julTVE6C/8v3utQVcxVTdU7XWXdzws8YaC20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjS4YP3RasGJMMLDsHY7a/meNZrP4rH32NkA7BsxfE/NvafzDD7R3w9vBJ2TCL3htGXOY36S+fj9AQOnPUblyDWza9psWtHsc7n7zfAIIZ85yCDv85Jctlj41SC/ZPA3ppI9gZgC7hPWotTpzlmJS4lwontzWCbR7zS6oLeKbx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtOe0lI4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtOe0lI4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985261F00A3D;
	Mon,  7 Sep 2026 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788789622;
	bh=EgLK3o+julTVE6C/8v3utQVcxVTdU7XWXdzws8YaC20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gtOe0lI4tICmFeXO0VXaSZWun1zD97NtGKzB00Fxz4Ka/Zpm56GHzGCFmpkzXvwya
	 IjgdW5ASTJB+qKa5sg3xhHy+2z3Tif4EUzgG6v2G0AqXAMe/0BNO4ao6/A+PGKiEDt
	 LiunuR042Q+3iJ1jf+LikMpBoAosls+iqBo1ld1uAEuNgD3FyixqBGd1NK8XwlELz8
	 0aXr47TpsMtDRS4WsQVvIrdjIekWTZVzwY14LA7ppw9cLIVA/gJznyINUg586mqoJr
	 i4bMWj2QqqCUzgdxYWZPl2+vXlMSa8ApBf/xkklnj7o+nTfBb5pP16MUu53RogA7JW
	 PhrukphYxcyLg==
Date: Mon, 7 Sep 2026 16:00:19 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Rob Herring <robh@kernel.org>, catalin.marinas@arm.com, 
	will@kernel.org, rppt@kernel.org, akpm@linux-foundation.org, 
	sudeep.holla@kernel.org, jenswi@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org, 
	ardb@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 02/10] of: reserved_mem: Introduce "ll-map" property
Message-ID: <ap7CAowlFTFhSFP9@orome>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-3-vdonnefort@google.com>
 <20260902172436.GB1440252-robh@kernel.org>
 <aplF4NaoFk73d-c5@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ihzba4bzldpza5m"
Content-Disposition: inline
In-Reply-To: <aplF4NaoFk73d-c5@google.com>


--3ihzba4bzldpza5m
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 02/10] of: reserved_mem: Introduce "ll-map" property
MIME-Version: 1.0

On Thu, Sep 03, 2026 at 11:03:12AM +0100, Vincent Donnefort wrote:
> On Wed, Sep 02, 2026 at 12:24:36PM -0500, Rob Herring wrote:
> > On Wed, Sep 02, 2026 at 11:47:04AM +0100, Vincent Donnefort wrote:
> > > Keeping last-level mappings is interesting on some architectures as it
> > > allows mapping/unmapping pages from the kernel direct map without the
> > > risk of splitting blocks which, under the break-before-make rule, may
> > > trigger page-faults the kernel can't handle.
> > >=20
> > > Add an "ll-map" property for reserved-memory regions. When set, it
> > > splits the underlying memblock and sets the MEMBLOCK_LLMAP flag.
> >=20
> > Where is this documented? Any DT property must have a schema.
>=20
> Ack.
>=20
> >=20
> > Though I'm not thrilled about more flag properties. Handling all the=20
> > combinations of properties has proven to be painful. Can this be implie=
d=20
> > from the compatible string instead?
> >=20
> > Rob
>=20
> We need this before the kernel direct map has been created (paging_init()=
).
>=20
> I would have moved that directly into the driver lend_pool.c, but then it=
 is
> probed too late (unflatten_device_tree()).

Any of the node_*() callbacks from struct reserved_mem_ops get called
prior to paging_init(), so these could be used to manually set the
memblock flags in the corresponding drivers.

Thierry

--3ihzba4bzldpza5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqew3AACgkQ3SOs138+
s6EXOg/9GV2dPaIR220HG9xlVLIy2HRX3X54lD7NjYUcMI5dH74ozC8XZ0/nWFsD
64xYzCwkpDDlOUBftQPPgM44IfYfqHh4kLJjur9/fq03owom1beg4m9zIVIw4dBw
ejIByjlSLI0Jy0xt5eQhc9VfpkfrO5/Oq44bkGKeBtuPRefpomIIcSV5C/aU8QDa
cQv6aVjg6ZR2XncJrS3BA53s5Zc9Khwv7/O/Lb85rppj7aEHj7newBIEakVNB4pU
lmOAY1Q3ckSBZ4xZkjGPGOc9eSMxdpXx7JLHPERWIXTz9qdumMHpXKT+WXUpRtgv
cYT/O3KlrdSOC8K8t/2/lXVQ3J4HKSxP3T+cxvoWmkPHSeE4w17I9+62IhX0V0n2
E3mxg820SetJTFz5VJAXV8QeheO/ZGqieBraWwvQcyDmQnqKddmQdFd8EuqKusC6
M4vCBNFLt2/XEDoir9Q+3zqiDVJW32wMboSGe4P6VPhW8ojvOs43jE1owQRXCuOS
Z3gqcw1c0fcxuvHYTEV77UI0la6H5DeWQJWJiolfJs74swqdx9Rp9sMNlqvGcHdS
dRb5ltaA1WoYYMBhatF1gLHeFoZDvcOfmzF0dSNNEUXgR6g26s3Y5bbTVkB6+7cx
hSybBcQOnVt7rYODTdksd+66a8PcOeXTzpy33pFoG9LaH9wWFbs=
=iMEe
-----END PGP SIGNATURE-----

--3ihzba4bzldpza5m--
