Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379814503E1;
	Fri, 16 Oct 2026 12:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153722; cv=none; b=cVpjO1tulyzag81QasTqnprKBcAUOqOxW5XVCaOFU5Q3aSQauLFBt85EIlcgnvHw3fbbuvK3T3jcRpm7hWehmw2ksm1l+HbfOxzn55/b+BhtElrzGR5eGLL0dt+Uf3ZBCmuekW3OYES5XjbV5pl6noOo3oc6sKE/ldNZMDAUqnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153722; c=relaxed/simple;
	bh=Ci+qeuizBvNEXM++PzWXABL8IMzirWE9+W/1loLvDMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XGi1IPftQZrT1KcQV1WjsZcN/eqe9P4bsPRzVN1LxrzdOhcD9+gv5IkKPyBBCQgYsXTLQhMITeQ3IZliWDkSOVbr+mEDyWD5FnG7QHhe/kEhL0eN6X0NE+17nTMtIV0xK3Yh8dNwW83S0b85gh3c/FHRmhmdZOsJfPjy1autmlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCvG6HLT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCvG6HLT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870741F000C4;
	Fri, 16 Oct 2026 12:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792153720;
	bh=ynCxfEMiK6gYb8O0ALHWYOoW1DHEx8JLaiKTnQTfg+s=;
	h=Date:From:To:Cc:Subject;
	b=kCvG6HLTn9vz0+eVlmdBfDvtHxUrIBj2x9I7mU8a3Q/ANmdkq/uDuPtBpsoQdtaQg
	 g+7e3wzlC7zXPYr0GTBrZZ6qBIyvkGawccum/zphWDQgZtHRwAnc7MPwwJ2SMGqLNO
	 ZbjcoaklC6Ywb6UP+B5cpjuyu3ioAScPH+8rczR+aF2PhlSStSaFqdXAImuCQnnjoE
	 BfvhDpDqBScqoY0ybmES8oqKgqrf72P93WEoKGyhvNSoHONg2B71Nva3p1Ra5jVgyE
	 /ut2kO0Di6FA9aJwMYsnSK2I/9GqaCMn73M4Tcjx/+kufCD4qwpWNB3v+F50Uont8/
	 kkMVyPkEsVUtQ==
Date: Fri, 16 Oct 2026 13:28:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: =?iso-8859-1?B?Suly6W15?= Jean <Jeremy.Jean@oss.cyber.gouv.fr>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: linux-next: manual merge of the audit tree with the origin tree
Message-ID: <atIYdNSykms3dLCk@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SrVIlEROateHTo6a"
Content-Disposition: inline


--SrVIlEROateHTo6a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the audit tree got a conflict in:

  kernel/audit_tree.c

between commit:

  aa650d87a4988 ("audit: fix exe mark UAF in kill_rules()")

=66rom the origin tree and commit:

  ca12826b4aac8 ("audit: Fix filter rule accounting after automatic removal=
")

=66rom the audit tree.  I'm really unsure about this merge, it's not clear
to me if the unaccounting should go in the initial loop or the RCU free
loop.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc kernel/audit_tree.c
index f2e81be8265e8,2d68d2ec2b2a1..0000000000000
--- a/kernel/audit_tree.c
+++ b/kernel/audit_tree.c
@@@ -573,9 -550,17 +573,10 @@@ static void kill_rules(struct audit_con
  		entry =3D container_of(rule, struct audit_entry, rule);
 =20
  		list_del_init(&rule->rlist);
 -		if (rule->tree) {
 -			/* not a half-baked one */
 -			audit_tree_log_remove_rule(context, rule);
 -			if (entry->rule.exe)
 -				audit_remove_mark(entry->rule.exe);
 -			rule->tree =3D NULL;
 -			list_del_rcu(&entry->list);
 -			list_del(&entry->rule.list);
 -			audit_rule_unaccount(rule);
 -			call_rcu(&entry->rcu, audit_free_rule_rcu);
 -		}
 +		if (entry->rule.exe)
 +			audit_remove_mark(entry->rule.exe);
++		audit_rule_unaccount(rule);
 +		call_rcu(&entry->rcu, audit_free_rule_rcu);
  	}
  }
 =20

--SrVIlEROateHTo6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrSGHQACgkQJNaLcl1U
h9Cd3gf/ZMu59hSgCQyEdiJfIQ95/JDJ9SSZ5G6L6RU4XUA/fCYeM8P/+iROaAaK
UUnnlezW+uL5yRGNHadlKxZzAVcLtBe4cHj/SOu/EsrgbW/+QZ8LX8XnM5xlih+w
gk5EsRYUUUFJK35EWHLas/JSe4nDoDSBNJQOcsgzYWBFCxEL7rwjnDqwlEQl6Uhv
zlO6eQgObE6rQC7OkrRrD9GEPW2S3dH0doZkK5rtoiVyk/H8BdM/LeJxzDwt2bBt
xNmGU7tesjlr1slWy8z7+EAIr6aCoWOrImt5cSrABnvFGq9BaCPLsZKK0S+MJEP0
NJV5lX9WQj550h6WbPGIFLCFDRO16Q==
=DGDZ
-----END PGP SIGNATURE-----

--SrVIlEROateHTo6a--
