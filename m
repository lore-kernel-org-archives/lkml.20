Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018013B5310;
	Thu, 15 Oct 2026 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074820; cv=none; b=kYqSezSKS3ufbu5lRgmzcdy2CtrKGztIEL3rv0IP5CJlnTXkafQjw+PaqS9cE1dIH9fhqC26eHRRFLAQpMwuW7ACC+TrJu5OXBJXN1N0DO2fGU51hAwf1PgC84jJXjtpBFXCZ8I3hZVcYRkpaqyIKJrc83cUtMq4Tsz/9o7f0ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074820; c=relaxed/simple;
	bh=lfd9gQKjca9NaEb7vjvwdkdXg+zvc9o4T9VGjjV5SDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qw67GSTjSaeB7UYYhAfwMWVlwxfh6ZA49e2UCTD3+DKIfTKtyJZKFDF/bwderRrvRt0/9QfhshNAbKSFsSLDsLuGmSsAA3RDwACKAzMbpPz7LWeFAJNMJez7ucNPss7gbhlcW/YGTIHReTH8Ozq2WXbXKTZVU2I/MvRsQUUgksU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZTZ+92V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZTZ+92V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3DE01F000C5;
	Thu, 15 Oct 2026 14:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792074818;
	bh=eegDdad1A+cIuupTw6io0wkYzgZYFV2DKnj/Y1ZWS3Q=;
	h=Date:From:To:Cc:Subject;
	b=mZTZ+92VpdIcC1BlKnCsaKILpEos8QE53xepxNlByhRZyapJf/xzVgyfdxraulKP5
	 2DehFzazmxcYkX+Rfsp2TpKXj1bJy9UGt7tE/r6trTCqKb1PjksXCfO/0Kw9ME422r
	 lXLwKQd/GOop7EORhDIk49HeA34K7AzxJOJ9w+SPW/bVMWNgNUVa5dhMriZ8ml1boG
	 BISaSsMcbpEoprgN/TivFD324eUhiwwKgXYdw7QdmtOXCCXSrVIqxKxh2rcAKap+56
	 qEj9NFbTyYqVBMxDVQKfOQfG4Umdq9uj9IK1z/K98IOtQOo09rR0BreZVEeJWbJEPW
	 cKAarViglc0Rw==
Date: Thu, 15 Oct 2026 15:33:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: linux-next: manual merge of the char-misc tree with the rust tree
Message-ID: <atDkPrlfMSiLi5XW@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZduleBV5OIhY9b0f"
Content-Disposition: inline


--ZduleBV5OIhY9b0f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  rust/kernel/miscdevice.rs

between commit:

  a4082121eeb5c ("rust: miscdevice: use `#[optional]` attribute of `#[vtabl=
e]` macro")

=66rom the rust tree and commit:

  ba9d2c7ea7f8f ("rust: miscdevice: add registration data to MiscDevice")

=66rom the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/miscdevice.rs
index eacea29e3fb07,ecc142a1b7ea2..0000000000000
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@@ -10,8 -10,12 +10,9 @@@
 =20
  use crate::{
      bindings,
+     container_of,
      device::Device,
 -    error::{
 -        to_result,
 -        VTABLE_DEFAULT_ERROR, //
 -    },
 +    error::to_result,
      fs::{
          File,
          Kiocb, //
@@@ -142,29 -180,31 +177,29 @@@ pub trait MiscDevice: Sized + Sync=20
      /// the VMA initialization by calling methods of `vma`. If the functi=
on does not return an
      /// error, the kernel will complete initialization of the VMA accordi=
ng to the properties of
      /// `vma`.
 +    #[optional]
      fn mmap(
-         _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+         _device: <Self::File as ForeignOwnable>::Borrowed<'_>,
          _file: &File,
          _vma: &VmaNew,
 -    ) -> Result {
 -        build_error!(VTABLE_DEFAULT_ERROR)
 -    }
 +    ) -> Result;
 =20
      /// Read from this miscdevice.
 -    fn read_iter(_kiocb: Kiocb<'_, Self::File>, _iov: &mut IovIterDest<'_=
>) -> Result<usize> {
 -        build_error!(VTABLE_DEFAULT_ERROR)
 -    }
 +    #[optional]
-     fn read_iter(_kiocb: Kiocb<'_, Self::Ptr>, _iov: &mut IovIterDest<'_>=
) -> Result<usize>;
++    fn read_iter(_kiocb: Kiocb<'_, Self::File>, _iov: &mut IovIterDest<'_=
>) -> Result<usize>;
 =20
      /// Write to this miscdevice.
 -    fn write_iter(_kiocb: Kiocb<'_, Self::File>, _iov: &mut IovIterSource=
<'_>) -> Result<usize> {
 -        build_error!(VTABLE_DEFAULT_ERROR)
 -    }
 +    #[optional]
-     fn write_iter(_kiocb: Kiocb<'_, Self::Ptr>, _iov: &mut IovIterSource<=
'_>) -> Result<usize>;
++    fn write_iter(_kiocb: Kiocb<'_, Self::File>, _iov: &mut IovIterSource=
<'_>) -> Result<usize>;
 =20
      /// Handler for ioctls.
      ///
      /// The `cmd` argument is usually manipulated using the utilities in =
[`kernel::ioctl`].
      ///
      /// [`kernel::ioctl`]: mod@crate::ioctl
 +    #[optional]
      fn ioctl(
-         _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+         _device: <Self::File as ForeignOwnable>::Borrowed<'_>,
          _file: &File,
          _cmd: u32,
          _arg: usize,
@@@ -178,21 -220,23 +213,21 @@@
      /// that have different layout on 32-bit and 64-bit userspace. If no =
implementation is
      /// provided, then `compat_ptr_ioctl` will be used instead.
      #[cfg(CONFIG_COMPAT)]
 +    #[optional]
      fn compat_ioctl(
-         _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+         _device: <Self::File as ForeignOwnable>::Borrowed<'_>,
          _file: &File,
          _cmd: u32,
          _arg: usize,
 -    ) -> Result<isize> {
 -        build_error!(VTABLE_DEFAULT_ERROR)
 -    }
 +    ) -> Result<isize>;
 =20
      /// Show info for this fd.
 +    #[optional]
      fn show_fdinfo(
-         _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+         _device: <Self::File as ForeignOwnable>::Borrowed<'_>,
          _m: &SeqFile,
          _file: &File,
 -    ) {
 -        build_error!(VTABLE_DEFAULT_ERROR)
 -    }
 +    );
  }
 =20
  /// A vtable for the file operations of a Rust miscdevice.

--ZduleBV5OIhY9b0f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrQ5D0ACgkQJNaLcl1U
h9CGXwf7Bwb62Ia11/V5AHdetcDQBvyJEuzJoEtVnbZr56ZRUAz1R4qsbDVmRQzb
SGOQ6kOzJAFteY635hIx64Vd9vm2hJwV5d89jJoZaSbnHsogB2sp4jSyjkCDuTm0
6MeSbfgA01ZhZqhN66SI7/B0OGQaQL9z8eX0GYH78Y6OmKJrRu0UJZHTKhCz17Bb
XLW9TbIZVqs5zqZDRWVRzH0dBFjmyHt2OQZ5+Y2sfhNyxOCivDYMfLB1wCUG/WmP
QpQnUlkoLputfCCWcc8uYgwqQsh6S0szUIMezST/y5gDFgIAKLJaYZnBNp0sTZDm
Uh/6H8cB/Ckk3Z3EQOu6neuuTplWJw==
=7eNV
-----END PGP SIGNATURE-----

--ZduleBV5OIhY9b0f--
