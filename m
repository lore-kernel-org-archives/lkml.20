Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328470;
	b=N/vWTOfmodEpAxE4Iy+FGjnS7DVU526s7r0T5dXV9eq7lbyS6v/td8NFkEa28qOawh8C
	 J9MlhIGVfxAR8myKjBGmxE1Mb7x/YEikUP00enu19XrKg5a2FV8svTin3mU+dPjKWa6ww
	 Fe5iFSOTC8/dXS2+pQI1juzW/j4P2TnV4yBNW+GFhMxyRiw4E+q5rJXefvLS1mMi7i1G5
	 6LDTzKRIeWEBZOf5ZByZn2kjqWJtHq+sUxlf1raWucLfVDBqnYq32o5rYflCP2lFM8Zgt
	 ITnWrlpeItgRN4vwmyRpk/8FG3YXjH59uFcX156Yi7Cth/Eswh26EZChLRgmhaW3nDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328470;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=3zADFTLPotiN1HvQd0CI0De+okoD3y4M0G10ACPIEV0=;
	b=a4iOTfj2pOPb6+jES6YzCb0AFa0/ct9I2pSyN3JKyw+mGKJn1Ej67m3VmmJka9ViWoZZ
	 B5ftBcHSeB6OP24dKnUckLlE1SwIpQnZ54mZBn1ND8K36B+6CrnQYTolOF4+rHXMOY1hO
	 Enz0ZWWWBNmS1ViGr+hlg4StBKWPnaQfZvsPPKQ+8YKXkUtnqqnduyNAhR261huJbSiYE
	 wHWFFz+CEhIampTgf6tq+Xs+i8Gfbg6WPhh0s4guOlWX4cGqWl7PuoIC3JB+oR6CyM+6B
	 Lpj0Al0li3FCTHrvppTMVHnYSLCFV0Akq+zESDSlsR1SelyXPGfiSEw1W5xUMAlR5Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OI7S978v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC8C606D1D6;
	Tue, 10 Nov 2026 16:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OI7S978v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E8F1F008A1;
	Tue, 10 Nov 2026 16:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794328470;
	bh=3zADFTLPotiN1HvQd0CI0De+okoD3y4M0G10ACPIEV0=;
	h=Date:From:To:Cc:Subject;
	b=OI7S978vbIiG8y8nYaz+siV/4V9I5n8fVRvol+A06CBzt6KEGGQMOSExRU5j7mpwb
	 JKgJnb0tsEWkncIq7/tNGfepV+ttK5Vdyi1M5bZMugax73nh77SjDmKMtCpW9gDa9t
	 mjKujnVss8KXADl30DVcquQ5YZZAuiwlK8J5IHhqh0kHW4QF7WRlICPWMi6c5srVrv
	 +e2d4CKHaVjO8R5gSp+YzpJi+cBeH1RdKB6u9XQA4/zAYLl+pYcQv/XGjKSIBnjp0L
	 cjtcOBJeTlvnmkG7wLK/eEMdXNn15AqbnX5H32ClXIGS7SFxmK0CroX2shlhUX+QiT
	 ftVn5b8yVK7Iw==
Date: Tue, 10 Nov 2026 16:34:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the ntfs tree
Message-ID: <avNHkkbVKqHv0s8Z@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="f0wi5hnpqVdlNYwB"
Content-Disposition: inline


--f0wi5hnpqVdlNYwB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  926d2928270a5 ("ntfs: convert a named $DATA stream safely when making room in a record")

is missing a Signed-off-by from its committer

--f0wi5hnpqVdlNYwB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzR5IACgkQJNaLcl1U
h9A5ZQf/XMbaa9Ghywwe7xqGqUePJbPEtc4ZUsHdaT4N/udCbVue2RxKj0eg8xSD
SJd4EMQYsoALxidiRFgYrhir4NxXsz/B22yGad0Ukfp2Iqqr5YGek/JoAuQBYXnF
UZsyhuSQjY/edDg+4KEa52gRSnknY6E4aV8d4dEiR9u7elFaQfdbD8Dd2o6efK3c
L1Sj4IR7SS93kkyhdi513WKyn9vwVUiLb1Y8xYJBa0iaeH22HLMpApJIowi9UWZm
/Rm6yh5zIB1GnsSlTVWOifFOtINx7nG3wsKUSN9OISh5bNxb6IREdBZDsd0WR9U4
6OpyJRwD/WmXD+vYV8FuFPlunH1nsg==
=5uy8
-----END PGP SIGNATURE-----

--f0wi5hnpqVdlNYwB--
