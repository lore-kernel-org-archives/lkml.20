Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857133;
	b=mAaw6OK/s2t6By1GAgzNvBf2BsJwCnQkPtbNBh1a//lZzHYkKYDeVAi9GoC3Mhynambb
	 duCtGZWj3JnRvYwfLAmFqiccG/KKrIVEIAxXyDlNFHPiSOoZuPapqaHk9nvEZ8eYRaI9o
	 Ov8uiOxjwD9argh9N7XpPpIvvc6nPB3QwwYzzfzdT3/A0iOV81xqLy3GQXjuG2gMiVOpU
	 tdI/StagQGXmPOVyvsgN5CQG83sMY1UgpytdsXqf0dflI6YXdmAhu/b/iQ+Lt7d1BwDM0
	 IMNpZFjYep+3WYazakjsKTTk027+HKXOcBcD6LxHt9wsb9XAYxPFqq5eu5C+3ZmD5rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857133;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=uG7Y59klaNcsBdo1r/tOSfUbj6BNoaBZXydmsvvjpo8=;
	b=J63O2zwbf8C2ZHI6Q5mA1q6P+HTSp5dPzAnBeeQAgVw4tMCZ/RrQ1PmA1i6jHik3MdAW
	 haDDGB/wmXtOheWBPHI84Xg+CzybCz0fT3yX2lD7+ddpWhbp0VW0qQDOBislDKpyK7nHf
	 4hDOqpIa21npyHdqUYzx2AmVNmxQRHNETRpELKRBMx1IWNiCwZuDVYToEErkX2RN1l8+8
	 zUK5w/LQZdMsXPRhhcdOWk6BRYrnZOMJzOImicXbrWrUJUAN5M94bUCeOprEPaAXDsGlY
	 5HyjgCcwGS7HqOdH/kz8AjRbOsAR3SSbl48T559zzw5yN1bQ5jbe3gH03WQq3JojOtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ehppgzcu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E775606A883;
	Mon, 16 Nov 2026 19:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ehppgzcu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EB41F000C4;
	Mon, 16 Nov 2026 19:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794857133;
	bh=uG7Y59klaNcsBdo1r/tOSfUbj6BNoaBZXydmsvvjpo8=;
	h=Date:From:To:Cc:Subject;
	b=ehppgzcuhLKcxjktfPImgJdSJRf/ujWpn57j9VJMI6uJSWeZkk7rvo0B/ub4DHMkT
	 PnWS/N4HJLUmzpendzC2iNdpA24eZQKcvTsQURiJ1KigvZC5KFbKZrWr1x2bmRbDqb
	 B9eysOpcWhFWsrwPqKzoLc/hDfs3rIPCxZlhFS4O7lqL7l+GOk5zr+iqEPAF8r4L7C
	 Ce3xhD9ANKyE14DX0sOcUsMcGIkWGWoFlvKPOHvS3TMImD77KpYHA0LlSA6e1K+a6w
	 nTagO01wLzZT3hGgR/ZCU3cU7iJPLkgxomvgi9mS3afvyh0U5nhA1AU9BcI9neIpWB
	 +DEd/3fls5ALA==
Date: Mon, 16 Nov 2026 19:25:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mfd tree with the origin tree
Message-ID: <avtYqaVYgbIu-w2B@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="zmw7j5LsqpQNANrR"
Content-Disposition: inline


--zmw7j5LsqpQNANrR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mfd tree got a conflict in:

  drivers/mfd/loongson-se.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  5310684a8d3aa ("mfd: loongson-se: Zero-allocate driver data and initialis=
e engine completions in probe")

=66rom the mfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/mfd/loongson-se.c
index b87098010c175,23af05d388aa1..0000000000000
--- a/drivers/mfd/loongson-se.c
+++ b/drivers/mfd/loongson-se.c
@@@ -190,7 -236,7 +236,7 @@@ static int loongson_se_probe(struct pla
  	int nr_irq, irq, err, i;
  	dma_addr_t paddr;
 =20
- 	se =3D devm_kmalloc_obj(dev, *se);
 -	se =3D devm_kzalloc(dev, sizeof(*se), GFP_KERNEL);
++	se =3D devm_kzalloc_obj(dev, *se);
  	if (!se)
  		return -ENOMEM;
 =20

--zmw7j5LsqpQNANrR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7WKgACgkQJNaLcl1U
h9AC2wf/fAk3pQ48dk3w1bM5L+edCGQevZ576fev1OuLirxxcd6XvBJuCd6YMki+
J/rB0Am8xDy+qYKgrBIcRnz12l7BOIplN7gxDT0TteVVnj38eQ8rNO9CTnTJFj/b
vxsyb3ewf2qtwj65e1I5U5KnIfBkaGzRyXJbNxtB9SfZIBg98pYqfzn14Jxbm4Al
LrYtc7eNn7VRvQ2nBr6mcfVlTXGHgBCsdEOLINJyTo+4f7Az/rAhL4GeBj/5AtYV
LvvkOWt4vZt3pw6KUlWEgcSGE7Nc3YAgGwwNIcAiIogQbIhPJoFzb6iBJGRF/Mm9
UjWcUbU9++ZoE9nzIYcnYeuErvAjCg==
=oTOo
-----END PGP SIGNATURE-----

--zmw7j5LsqpQNANrR--
