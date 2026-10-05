Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E5C4B95D6
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791212835; cv=none; b=YbIK+6zKLmvJj5qpaCbVXEE4gDlsRAQJcREKe6qNoDSWgVECIQa2pWUoi86yuti3VlRUh3D3JTZpRtJb2VmPPFqdKj0yq1CCbZhIKvQHQpe57xm3kVeqwSE0G+vAjcNInH8PYvgnM+wjqxe+FcFSBvbnujH4NzVBjdwXqyjMh1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791212835; c=relaxed/simple;
	bh=iPfeZ1pvE8U6ad/VWKL619ZklTO17ImScbG2yGjxAUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiE9+XBSqXrIMSI2Rx9e9lszw+0LOTicNNuJBtj10AIVtlB0iYSU//EFa4Of0JonGDoVjvp8tNl4OqQQ3cIc9JVcstf/NtCj5pxkYiyFRO+D5DfT0VTMz1WvXns8Ue7GhTSpq4X7aEFccPpsPE0teBcShXtFtwV1XCDjexJQWjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQNnATcZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQNnATcZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA5C1F00893;
	Mon,  5 Oct 2026 15:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791212834;
	bh=iPfeZ1pvE8U6ad/VWKL619ZklTO17ImScbG2yGjxAUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eQNnATcZ53KbVtJLtVuXDRrssveixvWX+45sLhiBd5IJs/8Lfex2aQKrAy4e3C0Av
	 PU1v0Yl/zHapQHuClLg6v5zbbNgBbHk35h6qdnD8HWqFwjZZ8l2XMOOxvVfDge9/S6
	 xLdFzIcjgkM213Facnp04hF41GYg18CxbbIiZjylQ4l0Pyklu6XKh2h8BOVd/QDXyD
	 0iR9x1t/l6hWNQiYtIQaG/QZQ80owZh5o0DlooXVNhyh4BO8+oyKFZPLlqLjMrxQLb
	 OMRE+pK82PxG6FZcj9O3HZAihZ5KFRq40qKuGjUtXkU9xcJyhc1433UCUI+qkLcFmd
	 uGpgzFVTsjKwA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 453E116B2223; Mon, 05 Oct 2026 16:07:10 +0100 (BST)
Date: Mon, 5 Oct 2026 17:07:10 +0200
From: Mark Brown <broonie@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2 1/2] arm64: module: Emit BTI veneers for cross-section
 calls
Message-ID: <asO9HgunrGVLdpc9@sirena.org.uk>
References: <20261005110511.157016-4-ardb+git@google.com>
 <20261005110511.157016-5-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cDTElpWIoLj2lYO2"
Content-Disposition: inline
In-Reply-To: <20261005110511.157016-5-ardb+git@google.com>
X-Cookie: Use the Force, Luke.


--cDTElpWIoLj2lYO2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2026 at 01:05:13PM +0200, Ard Biesheuvel wrote:

> This means that calls into a module's .text section from .init.text,
> which may need to be routed via a PLT if .text is out of direct
> branching range, may result in BTI exceptions due to the indirect calls
> performed by the PLT veneers. (Note that calls to .init.text from .text
> are not allowed.)

> The 'solution' is to emit yet another veneer - this is what the ELF
> psABI for AArch64 mandates in this case.

Thanks for doing this - it'd be great to finally get something like this
merged, it's been sitting for far too long.

--cDTElpWIoLj2lYO2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrDvRkACgkQJNaLcl1U
h9A51gf6A8PYaiLV8T7mhlzI64at5uWtH9y77bPA68B59G2rRuLyg6axZlyhFAI7
nGnzXgpTFs2B520ojNPjBOYyABI+rkN16ETrKP+q/K1HI29oX3bs2jvC6F/qpRYO
T3M0pfe8A8iNvz/JGQ5vZU+TldrjpJEq/cM0mHghhUoFzKQtR2pgAGUCRtVOH16D
u/q6R0xjO1zWhdRPBIKguHLEwjTkYn47Er5RQBTod0ffIOlZH51EaauKHDKqTCif
SHrTtpPiahw0qoGZ7cdKFvlXRcgSXqlZGbYfwD2z2fGop/T9kU3QVRhNvuTWRvJZ
//suEcsPwJX3xvaVj7G8Msnm710OpA==
=5LQf
-----END PGP SIGNATURE-----

--cDTElpWIoLj2lYO2--
