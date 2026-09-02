Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9388943C06F;
	Wed,  2 Sep 2026 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344304; cv=none; b=Z//u3b25ckYFFf3GTa+dHN+QowC+fq4gHwdy59f60JqsjzHzmBh/bo9awV5f9ry6covGudFw10lstAK8SDzU8xnEz7Qy9ZZcdZCOlnangANhUItaqb2ezE9caRsR8026fcXbeI1uXbWuGMcSGT9YWydJit0jPVeWrGHBwx/5HdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344304; c=relaxed/simple;
	bh=J8XCjJMGn/bPdNUBPCWvTqphP0GbFZaQxR4WgK3LePQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=urCVnfukwsP6Hw7SPrBul08MWumL+MaxpuIKyzKZQyGABSHjJ/AcbWPonuqiQIPWjKyy7xctsDx7HKHIvB0WnrLpRJgP2gMHGwl6ea0t/1I7O+7BZ79i9F86a47AF8xEReInjv9mk+1HdcqmJ9RgI0vO+FKxvnnMVh8505PDdaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPkYvN4u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPkYvN4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55041F000E9;
	Wed,  2 Sep 2026 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344303;
	bh=ES8FPiEzdLSY3baUtj73YmGN39x9JL4SmIMRNRUkqOo=;
	h=Date:From:To:Cc:Subject;
	b=KPkYvN4usMJKJ0F1NCahSD9j1B+voi+N3JM/uQyPFVMYvhySLjKR3/bZPMLpDa/Qw
	 IVji0aku+JgHZzCSDzhpZh7rX5BRi57eTkzRx3/NiJMpwZUTCauzhBDNscB+kGWHCn
	 6elfI2GWdp/EOjA5jfVN8vRotW2mespJYYHGVbc9pGpQP7b04cTxWECuxy2vKRci1i
	 g71dB9oJMUIqkIgnZsob8Lp1Bc/7t+fkTD/PrsGartesf87Z6Rs3KbFc+mBQPw8SHp
	 UvA7+R1Mq5on/0XWhmRt63NRWJ/PaJeS2VCEXeXxdEGZYnfdcf1gr6mK8WkqwohBH1
	 jkbUDmGbhzzvg==
Date: Wed, 2 Sep 2026 11:18:19 +0100
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the btrfs-fixes tree
Message-ID: <apf36908zqybr8_0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KgvFfNFAjXOpepjq"
Content-Disposition: inline


--KgvFfNFAjXOpepjq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  590b991274881 ("btrfs: scrub: report the failing sector's address, not the stripe base")

Fixes tag

  Fixes: 0096580713ff ("btrfs: scrub: introduce error reporting  functionality for scrub_stripe")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--KgvFfNFAjXOpepjq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqX9+sACgkQJNaLcl1U
h9C+gQf/fC8id0ETEU/SUVNLwKnwbeXmrIZW9EdYs65XXUdIqw77D+sJn+jjKe1+
RbrAgc8W9Da3s6NrL9D66JYKm1C+C7GQ6sq9+PdVkNo35efN5VVhTYrfxRO5sCWW
shI/C9PwA+jpAWxQrPh/PRCoMywMFeARnMaB1G2ZKqyMGIsmRf5xNsjKGHtAVHXo
A3Ly5xAlnv/Cu5V3crvsa85rnDFUeeaKtHPZNXbRdGP/BGfU8YxqgBWApMCzn4kM
LGBpaZZx2xYsr7u2IbI+mF1fGuqgUIXj38K4IDj0U2f2itlAL8wJ+cqYPaSezQLT
HYOSCSA1Q5t713/Xvhr4F6SbarUsRg==
=aQRE
-----END PGP SIGNATURE-----

--KgvFfNFAjXOpepjq--
