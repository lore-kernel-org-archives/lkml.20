Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F02912C534;
	Fri, 16 Oct 2026 00:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792110924; cv=none; b=Rm0fqDbHHBqyqteUJeIGKymROtM4CdPT53NVqhOxDuX4mX6jpIlfSNSOQWEdzM3h4NYuI5IY7jno80BJ6uPWqRPMGpPl62KJQneb/xsEhF7z7bTKBZo4EzsbVDcTYQ5gt3kwtG6JRjc/PMNjB2Wje1Z4Obqq+VM2lMOvhIpmIS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792110924; c=relaxed/simple;
	bh=xxn1GWBfhzu4RCOGqjEeQXDBDYerbAspkaoCVl3MWN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P4c6VnnGVT4i+I04HtNGLLYvWin30esLVk5RlpB7jDxnJyJYLh6Omk2mKYSDQ1HbEDz5HDmphjbHOwChL46g4WHVBvjpemiL5XnBNyzoCiBX+6A9Kfl8NghGb/YLS67dLs93jLnDJ8GqMp8in+N3vGcg9KvQ6j8ffEle8LAQXX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4lYvsXo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4lYvsXo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E8D1F000C4;
	Fri, 16 Oct 2026 00:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792110922;
	bh=u9FtEXgr6fPy+emPg0envDU/1snx5F9G1YjcjUOBCrs=;
	h=Date:From:To:Cc:Subject;
	b=n4lYvsXoAM21o5snYtSLnlqFUdHIduktjszzV+0tSF/BKWbVixfxVpGQBPnvhW1xA
	 ktWCTFX9y7oFEbJtYRvogBW1f3EgVj0I4nxn/lEWjOyZetU6CVb2V46UZH0aCl8aIP
	 mZOzl9csXwzH+Ccrlxo8x18INKeKzRtCsx9NfB7C8zzS6ZZq95pheAxMCj8nsjc01O
	 YiNz71QSi1xc6tw5rOQcFN0AKbB2Pe15avdYf2JS11vH8xn1FOyTMZBwseZi9RV9P5
	 E/kbvueeqbKfXXbicA3m1eQBrjXoOrGkoGZj4cbMYNHW6PIipdlejAWr3XJx4ehSun
	 nzMCEkaz3tTxQ==
Date: Fri, 16 Oct 2026 01:35:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the kvm-arm-fixes tree
Message-ID: <atFxR8JARwEk3qfh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IIOUTLPjx9Hfv5F+"
Content-Disposition: inline


--IIOUTLPjx9Hfv5F+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  bc502b86a3cfd ("KVM: arm64: Use stage-1 leaf size for VM_PFNMAP")

is missing a Signed-off-by from its committer

--IIOUTLPjx9Hfv5F+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrRcUYACgkQJNaLcl1U
h9DCNwf/c2dntc1xS+sRMCHIVQ9SZ7qRpjW1a3nPnI3Zn+E7308IeX6r9YNCPYEH
1yp5uqfKp9qApmV5FO4vpVwK+5YwYhIcWnzD/BRyg0jPbEZ+ZVgTlAeo/we7Go38
gVhZNFM8aoQd0QGQNI9ZnlzJpqruwDWNzieap72//m7ahOwtjBUBapXsHqknpb97
GBIAYBU6p5xa2x+VMVtTEGahJ961trVFkaKyEgiNph9xqR6irQap31LavNBpebW6
fZcKozzwkvi9ij/YW9JNpvzG+F3v5Yqvjs2Hwhn/NThpuPYg3F97I7awkQJyhzrx
/qDpuIHmh8IWpBbwf9c3AYHHMuI1VA==
=XpDC
-----END PGP SIGNATURE-----

--IIOUTLPjx9Hfv5F+--
