Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84324456DEB;
	Thu, 27 Aug 2026 13:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836207; cv=none; b=j2nloIypSeyykTQMV/tuJ4+tNwJboqknJwl2XKKA0SBHf1xo1dhXMFxp90+yYRbY7Avyk4PnxxBi61kETOjrenYEVC2G4067Ank/CYUL4/2IEv9AurqgoLSxe86s1pzkZPkswqNatEizqExfkk48kpn6eB2wBhGXBFc7ytO5C0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836207; c=relaxed/simple;
	bh=O2+pQqepAZYFmMKpaLCDgRLTbZCGa9h2BgF8gV9n/DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EE2oaFMszvfLwDAABkZEqqdLD41oU19g7mIodLk+U5CPUPZ7Clu82KvILjtzzEnpyAVr1qHhu9V+XqE9gyOqYuiuT+pYRmAbtGjyN3R01ghrEqDuCgp2sBzcmn6DcNG+Ay4XQ7UNC0HNqXiQbkHYqlKXcI2d55c+CpZcXGuVuy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aB97Llpp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aB97Llpp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045531F000E9;
	Thu, 27 Aug 2026 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787836195;
	bh=g8dBjai4kaRPYoLJ61eTeUpbGEQT6oQQPCkDBub85E8=;
	h=Date:From:To:Cc:Subject;
	b=aB97Llppr4JktlJYqoql686EMElQvAtfw0q9ESuHZVDgKaMmVobp0TPmmNkFecvdA
	 CwVFRl4Cx7HPMt/bw2LHmYiZTim9JAaFQ+wLBM+6QiiRJU89dJ8c1/lopttR+lUnZr
	 MPqp8MxG5Etz0gcnCYpiQr6pXQkEZNh9EQmdkNOR1Ke81kKI3iK9864vTFHUYgzNFX
	 8Lt50QYUyIEs8slaMhucMnwPaUHkCtq+yeg8r/q/3Cp4VmjayVFOQBb0avh0mpx213
	 mUE/4xf7vCAAqlL5PhmvbKgOhdPGU6BUTvddSzebeeCVyRMXieaRmI0Y0f/Gg4iBCC
	 PCUlsuBcWIaFw==
Date: Thu, 27 Aug 2026 14:09:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
	Chao Yu <chao@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ceph tree
Message-ID: <apA3H9wjxmEywmk5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7aq0KyJ4rAMrgivT"
Content-Disposition: inline


--7aq0KyJ4rAMrgivT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the ceph tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/fs/ceph/addr.c:947:4: error: call to undeclared function 'fscrypt_finalize_bounce_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  947 |                         fscrypt_finalize_bounce_page(&osd_data->pages[j]);
      |                         ^
/tmp/next/build/fs/ceph/addr.c:947:4: note: did you mean 'fscrypt_free_bounce_page'?
/tmp/next/build/include/linux/fscrypt.h:380:6: note: 'fscrypt_free_bounce_page' declared here
  380 | void fscrypt_free_bounce_page(struct page *bounce_page);
      |      ^

Caused by commit

   0137f53184252 (ceph: use fscrypt_finalize_bounce_page() for cleanup)

I have used the tree from next-20260826 instead.

--7aq0KyJ4rAMrgivT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqQNx4ACgkQJNaLcl1U
h9AGHgf9GhjwOq8uCmeR3vIRlVAijhW2qe0pprHhzjh+rFNUQmd9JouP6nla0ZLQ
wpkEF8qDWDr134AI9STrZDZXAr6hiFmGIYyvb422BbLMsH9qNhPDztHKnaM1g4NC
KnEcmU+6OqM16vAfKwUbQrAUfiZp6U0/ql5iC5LE9bMCpVAssN6wI78y1CUB8wdY
vOqzQfzLQpBcD5W91g/ru5IpyHYvfLMEdWRxIDzWvko9BloOYYR6d0GwFM+isxYw
gsktkdO3036nUW/Wx9a+rAnhTkqCIGWWSDfjOGo0JUoFl05kTjxAZaiAzry2PUMn
SPkCVWwxjrXcEe2ge+ZK9t/LjE//aA==
=yb58
-----END PGP SIGNATURE-----

--7aq0KyJ4rAMrgivT--
