Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503661;
	b=FnU5swZ9Jlnlgbpz0pixw1+1nT0Gl8vsQ5lsZGWxSEXAYqGgLbskpchqhgHe9NkvMLrC
	 BLtartyAirtgvM4bYmTTPY+JNpinAI0hRp3/Ch1jw8pVBBQOr5bDW3D26bDNs9pq+iZ2y
	 blLfeCrXLt+guZtNajOUijzko3Ae2MihYkoBA38ruJZ5d2ykwHaFaXn04/gIqMzNWFPjB
	 GDvD7IPGKGfOlByM+i3u+kIVDA0eAJ+rVKuz83hlJaI/eFR8QM+2Yi832gaPQ6SGhK1g6
	 6Tw92D2F2mmcG8scTC8l81k7GAjPiet05mDq4462ukL754x+MP24jrNuGpWeYWhQzFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503661;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=+w7h44Cbif1i93KDuDCMcItKGOVExsel6yrv8eWkHQU=;
	b=VYKYekC1irZjiK/21jrAd30Ktrq2bpXSbqIjUM3EFC+bx15NeAXdPU6xedlAnyn/V0+w
	 nTVyfWL4rpMiRLe/AWkMlClWtRM4f6ieq0WQ2VkQ5tvQ9Y5VBfb5/fn6DS7c3OfkKVZN3
	 bdl+uykbuu87UbtE3GY0vB9FpJBxN6+X4Y8CgShHiaRcsYIwqDjns6joh6YeibibUyjkk
	 2mRdq/9LxcOJE2rfsFHo0fUhC4y2IAWQ6u5C4WzLZvCnSzjADDLb0tlZg1Pf7T24oZUby
	 jU7MQBU+zd5D3QetFhsrBtvhx2fj79jMtjlK8ebZ+iDBPbRCSjQ4aotcMgt+3WbdjHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xc+8Tkhf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD17606A322;
	Tue, 20 Oct 2026 13:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xc+8Tkhf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CE61F000C9;
	Tue, 20 Oct 2026 13:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792503660;
	bh=+w7h44Cbif1i93KDuDCMcItKGOVExsel6yrv8eWkHQU=;
	h=Date:From:To:Cc:Subject;
	b=Xc+8Tkhfl129RB1hhKQUGeQrzpFH6mqnrbr06fVWz7+wrpdScsnDRP83SCmSl5z15
	 ytdXBsWe0/8svFSLO/FUJUjSgDGff523uqPDcy3f6A0IEuGQaDihY0OvOIntYNjhb9
	 IG1NPl8+JVclaYs9/uR9Y2TTxlu+5WL2XsKJdBFkyjvbjTG/+HnaOQ1C/7wUdzuUvE
	 W/37RRRrZnNEoW2208EHpZtdJ4dcgfOqX8n2hGx5pSyx9XDm8sv7AfCm0EDflkciqC
	 A2FPjZlcUrubdUM8pe8qjg5ZUCdt2l/iaJtTBBrQWACf+iUUfH5yBjMLM+tOkxl4ot
	 YGPv+bheIenlw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0D68D1AC5994; Tue, 20 Oct 2026 14:40:58 +0100 (BST)
Date: Tue, 20 Oct 2026 14:40:57 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Moore <paul@paul-moore.com>
Subject: linux-next: manual merge of the landlock tree with the security tree
Message-ID: <atdvaWI6T-HXhtix@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="nB+bB7f2GISM4Q0f"
Content-Disposition: inline


--nB+bB7f2GISM4Q0f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the landlock tree got a conflict in:

  include/linux/ns/ns_common_types.h

between commit:

  436485132d236 ("Automated merge of 'lsm/dev' into 'stable-7.4'")

=66rom the security tree and commit:

  0cbc5a0d65b05 ("Merge branch 'lsm/dev' into master")

=66rom the landlock tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined include/linux/ns/ns_common_types.h
index 47a5cfe2326a3,fddc62be3b626..0000000000000
--- a/include/linux/ns/ns_common_types.h
+++ b/include/linux/ns/ns_common_types.h
@@@ -116,11 -116,11 +116,11 @@@ struct ns_common=20
  	struct dentry *stashed;
  	const struct proc_ns_operations *ops;
  	unsigned int inum;
 -	struct ns_tree;
 -	struct rcu_head ns_rcu;
  #ifdef CONFIG_SECURITY
  	void *ns_security;
  #endif
 +	struct ns_tree;
 +	struct rcu_head ns_rcu;
  };
 =20
  #define to_ns_common(__ns)                                    \

--nB+bB7f2GISM4Q0f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatdvaQAKCRAv73Ows9A4
iUjvAQCNFWnHVyJjTpQ0axxqDnR3b0Nv+F+7wDxHBhGKK5ZGIAD+PSanOxcz0R+x
lMMwbr5cYheNXrupFtCdRd69zGBXdQM=
=OxWq
-----END PGP SIGNATURE-----

--nB+bB7f2GISM4Q0f--
