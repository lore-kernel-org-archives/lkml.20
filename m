Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB24F1F938;
	Fri,  2 Oct 2026 23:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985443; cv=none; b=ex02JBAERu/V8j2tXciGbf9cjFEJava+zQ+0w7KmRKpZ9pkMXihagWzJIaBHt4pEAjmYo6cDwPe0VvIe1+MWzM2sOCXCkBPw0RBQegOoBYWYiZIF7k6q6faEB7sXYl7tzRNbYh+Heq4SzvFNiPjRnI2airBD7eDiFTStDXhFVbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985443; c=relaxed/simple;
	bh=u3M+YjOLwTCHkcAfSRTPaMmvGuZawj2f43sNQOdGTwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tnHFh+pv5x+UIXkpkZRvf0OvFb0Ii4x+3bUKaZsZ0z2cYhp3WhgqaAkjRLPJo7xhxYBBPDERdl3Yg6tsPu0oqFKWHgUeM+1dOujy7vptWozinZkRsMo6Bd4ZPqoai/YVfpH2J8KqlKCXKUVCJmMiDuhJ/ZU4fjdFtlzc+eP96zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sppg+HEZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sppg+HEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512C81F000FF;
	Fri,  2 Oct 2026 23:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790985441;
	bh=/l/jF3wfO5lq3SKfm4yS9ReGwk0og8BEpQBXmuGsxwM=;
	h=Date:From:To:Cc:Subject;
	b=Sppg+HEZC0gb3A3Vxw8mNUjhQgzQILuM0X/QKXhgJSFDT3KsnXIxuY1LgooPDmEfS
	 z2fqwTpdU0qgQFbL7vn9zf6TYqB/XDYWjuaTCEzObwSOHtv6i93PHYa5E9iODB/FAb
	 g31q/qJ5bsmTf/Rx3ILb/2TdNZfTuk22y1a/8MjztFC+YE+qUZ6DC7JTIfv2ymMCj0
	 a3K8gv/tP89+YxcTV5qJrQbn+QcsACRevxnLCs2lLBHjYiLy8Dltgf2mJMeZ2kxTpe
	 iZ9zwzaeQPmhKN9it4GWXHM+F3C6SVDT+hqeM7dD/Ha/6EfPUu+9t0C1SyTprUxwBr
	 8oE0hQXmFVuHw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A9A381AC57D0; Sat, 03 Oct 2026 00:57:16 +0100 (BST)
Date: Sat, 3 Oct 2026 01:57:16 +0200
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the landlock tree
Message-ID: <asBE3Kc-zUsT46XS@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8OLJbbKeYBVJ6wZM"
Content-Disposition: inline


--8OLJbbKeYBVJ6wZM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the landlock tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ld.lld: error: unable to find library -lcap
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make[5]: *** [/tmp/next/build/scripts/Makefile.userprogs:29: samples/landlock/sandboxer] Error 1

Caused by commit

   98fd5ad4a890e (samples/landlock: Add capability and namespace restriction support)

(quite why samples is being built here is unclear to me...), I have used
the version from next-20261001 instead.

FWIW the x86_64 allmodconfig build here is actually a cross build, I
don't have many cross libraries installed.

--8OLJbbKeYBVJ6wZM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasBE3AAKCRAv73Ows9A4
ifLUAP9jOCwjj2iJg1KYrtpHc9UOQQZ7eOC9zuTKQh0kJkCK0wEA9FgG3haWxWOr
SJ4N3NAA6MGKUeifE1IKibEQZlPu2Ag=
=3Cq4
-----END PGP SIGNATURE-----

--8OLJbbKeYBVJ6wZM--
