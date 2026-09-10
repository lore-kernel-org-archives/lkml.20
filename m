Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B30D48F84E;
	Thu, 10 Sep 2026 14:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050060; cv=none; b=eR4sehRtY8c0W5VRdn8eTAlkRO0aPRF34ovfDoC/upYEt6zgtS99aIJgs57QZez+ZQFnqtvm1hvDfCuVQopsQj1D6KlaYv5ScZ+TrHURPriWVKWcKrNpQACHnHzCf2+8KwNLxgY4DzGfvxHv1duhTepvOK3MPbCBXCAEHCNdD4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050060; c=relaxed/simple;
	bh=v9RtHgULu8yynDwB0O7QfnvLkapEN0f5ee0NqdRUTBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kcjmfw8qhZqTTDqDv0yZtwJYV3266debcMOZ/cOELVwfpw5+FzT3euFLu0i0xYB2yz/T9/t5wsDCTvJGosSjEyEPVDcySXG8VPgajABgef+NYMOBh6Jh85K/zfiSrA0JH9iEYPcLMkZXpFwTGdKslSkaHcAjkr8RJuubGKiZULs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9p2zzcZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9p2zzcZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B8D1F000FF;
	Thu, 10 Sep 2026 14:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789050058;
	bh=eav/Iw17XCwC1UInqe/g/zS/DwEZ05QKlMSfvgkxZHg=;
	h=Date:From:To:Cc:Subject;
	b=n9p2zzcZvBocXjRxdArwFdbuopc/SvOCh1/SSlByI5Aj2I/P2zHTCMmiCuoJiR8X/
	 mGwk5H7xmxqZyU6J48xaAPjlt5DuWBPUuXjMBSAgLbS9c7xnYxYjj2bn4cXjIjUkuK
	 ap6gDJwM+vrDDpsOYYxw8YNarICXw0B6AiT5ydeVIKrA/OgnjlvGB/yWsh2l/h6Z7f
	 NX6JgVw7pQCtHSNLyLKI6So043aKQebgImGdomACbY10Zzjjd4/9OU4KfJvPkuwIiV
	 ylqFke7lm6XSmfpMjBI8lSR6sn6ii0vfAEQpetGPweuBRsMWQqv+DysqvKLl+hdp2t
	 TyYMCsGOHRbkA==
Date: Thu, 10 Sep 2026 15:20:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Igor Korotin <igor.korotin@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the i2c-rust tree
Message-ID: <aqK8xm5j1Fe54B5e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cwPF6PjIGgxc+UKX"
Content-Disposition: inline


--cwPF6PjIGgxc+UKX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  61ddec70c9bcc ("i2c: rust: mark I2cAdapter methods as inline")
  90311787f483a ("i2c: imx-lpi2c: reset controller in probe stage")
  c19f6f452664a ("i2c: imx-lpi2c: properly unwind resources on probe failure")
  d2b83deba536d ("i2c: busses: drop redundant dev_err_probe() around irq helpers")

--cwPF6PjIGgxc+UKX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqivMYACgkQJNaLcl1U
h9ABxgf+IrgG7lzS0gSPWl3XsID5OadGsyHJYFB/qVQSfzOaeORvm/VxKfAGjmjq
PqhDYE43GsiDyBgKbFPhb5ulTxmvzdMgp6GKzwNaC/dEtjuf+IWC2eIf7/34Bi6h
noWGJaQAO+/wQZMTqFD0SAhX9K9/Vb2l5ONmCApZ8wkT8nlI3F6ERFRbdc/7znQ9
apyZ5HzSP0w1lpHghtkpE4M1Pyngam571VaCnsphVebChxsdQ2wejH5wmY/vdZk5
PAxe+rIZRhnd4+kghscv0hi9MXaejQQqq9Tha4SLJB49DXRQk5UPlLIXCYw6Bsdj
yizRbssBo6BGu5hRv+o7TdICeLbzCw==
=xcIM
-----END PGP SIGNATURE-----

--cwPF6PjIGgxc+UKX--
