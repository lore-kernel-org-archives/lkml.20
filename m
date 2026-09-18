Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B136E4E235D;
	Fri, 18 Sep 2026 11:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729592; cv=none; b=rhLRlqg/ylsVHFuncVYkpa/FQ70qiV+D1lG4zqgTqXcgZngWZdQjSHSA1DOQ6l49KgckDvluKEN5Xxd8xYbN+zqO9pl7V8ADw9p3flBr1Tk6G6r2PgVg4LEsZqeX8MsoR95oz0BcxGu/tEDiZY+ja6fZXHSf4LbqQxkS1OeUsYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729592; c=relaxed/simple;
	bh=F5cc7o7407V4qJnHJ+bZ6mu8Xzf37tOTpeR7uECiP7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VyoiBxUt+71kZQ0S0jvN2edC/zFMAr6NFTd0Qy0OzL4qEXZRFTobGegwork0RmRBr+rh+cdr1tpkOymtoe+YSgPri86B+GDjfyu36nP8Uta+8TEmaTy5mcpEaoeposhOKEh5/xbiRX9TJV9T2lxKTSG5PiuKiRZ8deGXK8ZWcEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASdo2shu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASdo2shu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3401F00898;
	Fri, 18 Sep 2026 11:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789729574;
	bh=zQ4kfNXt8Kw47XS4rE1ve9dCHCC6XtKxFfp71srqHO8=;
	h=Date:From:To:Cc:Subject;
	b=ASdo2shuem2IcpQlYtCWOS06ZxFmruwlgRPrwruS/G70IiHT1Ah8XpcffVhvcpTPH
	 H4qHjR+2sfd+PWaP4PCmusjW9LU0t+D4ujWhB+l1m2/LxjnaX2GGOV/J7m5brcnt4Z
	 F9UX+NB6ZmZm1m88FaBOnSuzST/V5R91jKdSd10AoOKc+ZNOH71nxDHd5gtnpzY/ZV
	 Dn0d1+SW4d/yiuL1JROPYO3FwiexgENOqxFEfQoyPs0DFSOnD8SUqyC4l+Ctq/gYTJ
	 LWFTx7MqfPPdg2E9wWti89MXyyVVn70UsvijdjWV2cp6NnKc+0HfhGYzpNqJ+XPQ+B
	 Nz0Yde2MA3WpA==
Date: Fri, 18 Sep 2026 12:06:10 +0100
From: Mark Brown <broonie@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the rcu tree
Message-ID: <aq0bIgOyDwt51Lot@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EJCxfmGq+FQZE1nh"
Content-Disposition: inline


--EJCxfmGq+FQZE1nh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  3819612d99983 ("doc: RCU: Fix s/strategem/stratagem/ typo in Requirements.rst")

is missing a Signed-off-by from its author

--EJCxfmGq+FQZE1nh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtGyIACgkQJNaLcl1U
h9DcDwf+M1HcP5Tk5HLWBQCIofczSktC/4MZsiAVzka2YlNuRxzJFM5j0syhPz2r
YUwMa/nV47eVMfuJxV1Jsq5igH3ESqGCcbEXSxbBcxdbUo04mWdKSpcO+que0rFU
AMBkbAf1+0NGEPdBSBtdhOYEbUEXiYYunFQBphQGJXg/b2GFl68FtBBchEVARkDl
wNRCqzk+uo6EnT+2qQe8EtFfRgDzIe8z8yE9Dtr44yVJRb7Ro1raMlvh805tpwX3
765aw8WFA+8+6EcyrVRqsbzH9uSrtJ2WAM7asranJLfed803ZgBsASNumQIgBnZn
mN9ov5Dz7btOqD33rLUwUI4povCiuA==
=PxOi
-----END PGP SIGNATURE-----

--EJCxfmGq+FQZE1nh--
