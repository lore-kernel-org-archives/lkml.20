Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF1039A4DC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267991; cv=none; b=VnmA4Mzk/tuA5Zplx/xfkjM+hYwbgqnq0n37dtApD+gIj2htyUfpb7LFQ2WumhHtJZh5yue5xPmaQr1RMBJ5qTpfFhLy7QrDBrRGgQkAhaFek2UevrPL611Pih+tpA7cM4NV2bE5KCrHc97/kxF+XWGdeXmC8F+ttkZStMIBKqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267991; c=relaxed/simple;
	bh=xGV+Gv1zqRvGD2mfuz0yHeN5wqnyyMJk9ADt/XAWP1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ra0CyCvEWrxML3vGIfNtNwrk+prII/pggBITSHuyeX0hCJIEFyI4x5Xh8ZEEEGkH+HAY8znxWyz2ajOlBEQQCWxRTRZqiFxEdIgqceh/PROrHG/t42yaqXR4fj4iyflhCfpZUNfowqRN1mEVWb80p2vy5AoDSN4fVNCQYVje0f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCrrYGa3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCrrYGa3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5036C1F000E9;
	Tue,  1 Sep 2026 13:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788267990;
	bh=xGV+Gv1zqRvGD2mfuz0yHeN5wqnyyMJk9ADt/XAWP1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YCrrYGa39iPIIdxeOK9RNW4H55Nix7jC+fAqlBKusODxqlo8yjWO2ezNKOIlCtAdS
	 duh/h3NnMTx4S+3L00YK6grOMqgUmjCa1ARbu9CchYUDeCG//aaZKtkOxyVqsZUMWb
	 FRIqT/5NrRpxVHr8nk6+qqpqtNVrvuNeTtSV76MJqOwitI5s8qq4CLUyYNyfciD4KH
	 F+DtrWcmH+s86qIfiAsNqUu1EU+mrAP1wQOJzxlwe4hPPuH/3qT7hC1Zp0drULU/2h
	 mvhJa82F80jvg4KAJTCTD8Gs2ViyboO2V/hCOsRcb/RWTpJFhM841ePQ4KXNu+qXlg
	 yP53i7JuWAi5A==
Date: Tue, 1 Sep 2026 14:06:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, conor.dooley@microchip.com, schwab@suse.de,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: hwprobe: simplify has_fpu() to check D extension
 only
Message-ID: <20260901-overdrive-footgear-e4c373d3f6f4@spud>
References: <20260901013746.19386-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="knxIKpuYmzosOGQq"
Content-Disposition: inline
In-Reply-To: <20260901013746.19386-1-skunkolee@gmail.com>

--knxIKpuYmzosOGQq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 07:37:46PM -0600, Ivy Lopez wrote:
> The kernel never supports D without F, since D depends on F. The
> D-extension flag is cleared during devicetree/ACPI parsing whenever
> F is not present, so has_fpu() checking either extension with '||'
> never actually produces a different result than checking D alone -
> F without D cannot occur in practice, and there is no observable
> impact on RISCV_HWPROBE_IMA_FD or userspace.
>=20
> Simplify has_fpu() to check D only, matching the expectations set
> elsewhere in the kernel for this dependency, rather than relying on
> a redundant OR condition.
>=20
> sys_hwprobe.c already calls has_fpu() and needs no changes.
>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221874
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Suggested-by: Andreas Schwab <schwab@suse.de>
> Signed-off-by: Ivy Lopez <skunkolee@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--knxIKpuYmzosOGQq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapbNsAAKCRB4tDGHoIJi
0vmnAQC3aA3ZnZrnrjHLb5s6jto2jc8fG9Lqg5JDTbNtC8E2wQD+L/FINBB28A16
APxL1qmL1nuayot1JWJ3Bft5qlsKjAM=
=OOzQ
-----END PGP SIGNATURE-----

--knxIKpuYmzosOGQq--
