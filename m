Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9733F274B46;
	Thu,  1 Oct 2026 13:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859629; cv=none; b=CS89Sd7TdfPi39jQJhHuB8uk6ywihY31b67GvZ5Eo+0AZ+bySLb9nB8YJetzhl+HjGMkbOpGvFSXw42zw0oR45s+r5ghl329sLuNya7kXFdiorEAmigrGtYoGUq1o6r8ZXhltZJDn3GJc9JZpEoiopeZm7hrss96tfWmVh/nqe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859629; c=relaxed/simple;
	bh=liI+FNGV2DQjh5A0J98szsYGeIvV0zlY6tpuTOfkCRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRNyxikjX1j9wrbekwCGna62g/N4379TXo0ezKM9GCVxJW7oeDcs6X5UEtLyklAoNyihWU56n6eNeLzOkluFE0HkkZej+19CU4VpoqhbFmzQbuWXqAWT8C8svhGvhvawl0MbGp9BDEL+o+UdeJg7csfT2/Qx/7rqn0hg7TSp5dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQn2sKy4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQn2sKy4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0B01F000FF;
	Thu,  1 Oct 2026 13:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859628;
	bh=569XK+2UREIktKnTiXYpTH+2d7k78k3kARw50yVAoEU=;
	h=Date:From:To:Cc:Subject;
	b=DQn2sKy44IOwbEw3DcnXa80U93KWqQ1YcOHV61JIzOseFvIYwVngKgH7g/3xsw7PJ
	 U9GG88Nc0LNKhqzHaAtoK4v3uvUjWfPcWBGsEEFFUfzPP99JNWjxPgqIVBsdb/PTNK
	 YQD+HQcaFW4cC0+k2SLt5fs67Qdqb4eAZuArTblSMdgyMoHdxAfxmb86NOw3kqCB0T
	 ZNKd2o3L7m3wFfo+A52m2eBjGQOq18CjNQE0KoibCfEIDofxwUhk4jec058cheyGZA
	 XbsZmDJ6dFH80usXTgE2tHlY3ou79muewxdRMBMPCJXvewuZCMArQfBLr6TkZw/Nxt
	 j9n7T6UU0XEuA==
Date: Thu, 1 Oct 2026 14:00:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the kvm-arm-fixes tree
Message-ID: <ar5ZaM3exK1YreJg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jumjAdm4DO8y481I"
Content-Disposition: inline


--jumjAdm4DO8y481I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  bc502b86a3cfd ("KVM: arm64: Use stage-1 leaf size for VM_PFNMAP")

is missing a Signed-off-by from its committer

--jumjAdm4DO8y481I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+WWcACgkQJNaLcl1U
h9Aoegf/UcwRDwEo7MelNNbfSZjOSExhj4phbA+I2hLTX7mrlZZMXVQKOaDAqR02
iera4uttkGTa0pV9SmAJsLzFUnrGS7tSLjRsO+gY6sTiNDgbTf/Q8F4q9NQ/Lvcj
LmED3vfveHMGLzTMCzH4EX+jGqku3jcBs1WHVR9kALauJK/mMBLncZsMCkVrkZfD
fFfKqs8yHjiI/hlZYJvPtyiKbbOhQHgAODObNSWbwEx5MNe40f3OJGL/a1M3rnG8
U/pWPDT9Sy/JyQUa2e6a2FMvGKXdTggKdDCyTP2eVow0REnkUZtPzjPlY1r5+3tL
9i9Ofr8NrU1GY7ZqdATkO0DZKieeRA==
=KRY1
-----END PGP SIGNATURE-----

--jumjAdm4DO8y481I--
