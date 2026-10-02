Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA41C3AEB2D;
	Fri,  2 Oct 2026 18:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790964791; cv=none; b=f1bjZA1WkTxQSgRb7/oZfADKTIVE5BQXZmFN1Y28GKQNHLx1V0Q6rh7QSr1QP3A5JukP0+RhQy9k6K4LaSNDJLSEgkenqg5XHs2uHCBEeEGPakfUCZx6O9+Y1jzD50ikLWKp8/SFV+8d76smtC55lY/X/ouRjweLQcS/qe0eAtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790964791; c=relaxed/simple;
	bh=CietY0w3YZpW+WJoQA9liqhqaCQ1y8QvASrw/fG0ONU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ahiGeeWrS1RD4cM57gEu0BTE/q9mc9wBlAb6yi8GEDZxtM3s5G3mSFiLuGfP0ZqlzdRvIWapZ6KxrpW0VSo62GgmjW07Erd8dqLtSWA+wYxtl51TClrK7cPt+Daf8c0zJwpwNhcGGwqLpzfxNztEICyHsD1imsPFFgnMXAuHEwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejR8fM9Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejR8fM9Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038E01F000FF;
	Fri,  2 Oct 2026 18:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790964789;
	bh=XAjesu/Rm2Wh9qY+YyOAaCB07ChPPmcaTyAaSs8MDQg=;
	h=Date:From:To:Cc:Subject;
	b=ejR8fM9YK1DZCSGi4uUho/KxWp66evxB7lUil95z5LPvU6Txq3qtlEwZcVYhTGzco
	 ZA19LiJKae5vjWvk8LPshOQaQZcoGeucDIMxSprvZRrHALJ/YvQyL9F/IMOlTMSlNO
	 leTl9EzWZh/GuuZmfcVA0SKTcQtMEgCedIW7L/eS5UfVH+bwkmGuQJZ6OXIBcPekOg
	 lfGcZ60qFgSIyf+cM30HjbHgZ35R2oit26QP2Iyf8s2E6zyNVEYstJZU7Lwc0ZUWcq
	 EaY8oW1nJ1pWln5FRF7qOS7HFmgMNTvcGixmn0yXF8IZsYM/vHbEu+1nfJVnBeL7Bt
	 z28xg4iBVDebg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 25E091AC57CE; Fri, 02 Oct 2026 19:13:05 +0100 (BST)
Date: Fri, 2 Oct 2026 19:13:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: linux-next: manual merge of the drm-rust tree with the rust tree
Message-ID: <ar_0MTEPHARiUqc0@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eKnPMsofAaWlv7EM"
Content-Disposition: inline


--eKnPMsofAaWlv7EM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-rust tree got a conflict in:

  rust/kernel/mem.rs

between commit:

  948440b3f429f ("rust: mem: add `Align` type")

=66rom the rust tree and commits:

  1fc1f82756b1f ("rust: mem: add `transmute` with deferred size check")
  ef605a433d809 ("rust: mem: add `AsRepr` and `AsReprMut`")

=66rom the drm-rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/mem.rs
index 33676760bee2a,f2d4cdf87d00b..0000000000000
--- a/rust/kernel/mem.rs
+++ b/rust/kernel/mem.rs
@@@ -2,69 -2,233 +2,299 @@@
 =20
  //! Basic utilities for dealing with memory, values, and types.
 =20
 +// TODO: `Alignment` should be moved here as well, Rust moved it upstream=
 in 1.96.
 +pub use crate::ptr::Alignment;
+ use crate::prelude::*;
 =20
 +/// Trait indicating that [`Align<N>`] is a valid alignment.
 +pub trait ValidAlign {
 +    #[doc(hidden)]
 +    type Repr: Copy;
 +}
 +
 +/// Zero-sized type that provides the alignment specified via the generic=
 parameter.
 +///
 +/// # Examples
 +///
 +/// ```
 +/// # use kernel::mem::Align;
 +/// const ALIGN: usize =3D 128;
 +/// struct MyStruct {
 +///     _align: Align<ALIGN>,
 +/// }
 +/// assert_eq!(align_of::<MyStruct>(), ALIGN);
 +/// ```
 +#[repr(transparent)]
 +#[derive(Default, Clone, Copy)]
 +pub struct Align<const N: usize>([<Self as ValidAlign>::Repr; 0])
 +where
 +    Self: ValidAlign;
 +
 +impl<const N: usize> Align<N>
 +where
 +    Self: ValidAlign,
 +{
 +    /// Create a new [`Align<N>`].
 +    #[inline]
 +    pub const fn new() -> Self {
 +        Align([])
 +    }
 +}
 +
 +macro_rules! impl_align {
 +    () =3D> {};
 +    ($a:literal $($rest:literal)*) =3D> {
 +        const _: () =3D {
 +            #[repr(align($a))]
 +            #[derive(Clone, Copy)]
 +            pub struct Repr;
 +
 +            impl ValidAlign for Align<$a> {
 +                type Repr =3D Repr;
 +            }
 +        };
 +
 +        impl_align!($($rest)*);
 +    }
 +}
 +
 +impl_align!(1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768 =
65536);
 +
 +impl<const N: usize> core::fmt::Debug for Align<N>
 +where
 +    Self: ValidAlign,
 +{
 +    #[inline]
 +    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
 +        write!(f, "Align<{N}>")
 +    }
 +}
++
+ /// Transmute between two types.
+ ///
+ /// Use this instead of [`core::mem::transmute`] when it is known that si=
zes are identical but this
+ /// cannot be proven by the compiler.
+ ///
+ /// This is equivalent to Rust's `transmute_unchecked` intrinsics.
+ ///
+ /// # Safety
+ ///
+ /// All safety requirements of [`core::mem::transmute`] apply, plus that =
the size `Src` and `Dst`
+ /// must match.
+ ///
+ /// # Examples
+ ///
+ /// This can be used when types are known to have the same size, but only=
 at runtime.
+ ///
+ /// ```no_run
+ /// # use core::any::TypeId;
+ /// fn to_u32<T: 'static>(v: T) -> Option<u32> {
+ ///     if TypeId::of::<T>() !=3D TypeId::of::<u32>() {
+ ///         return None;
+ ///     }
+ ///
+ ///     // `core::mem::transmute` won't work here.
+ ///     // SAFETY: We've checked that `T` is `u32`!
+ ///     Some(unsafe { kernel::mem::transmute_unchecked(v) })
+ /// }
+ ///
+ /// to_u32(1u32);
+ /// ```
+ #[inline(always)]
+ pub const unsafe fn transmute_unchecked<Src, Dst>(val: Src) -> Dst {
+     // SAFETY: This is identical to `transmute` except that we bypassed t=
he size check; which is
+     // true per safety requirement.
+     unsafe { core::mem::transmute_copy(&core::mem::ManuallyDrop::new(val)=
) }
+ }
+=20
+ /// Version of `transmute` that performs size check at monomorphization-t=
ime.
+ ///
+ /// Use this instead of [`core::mem::transmute`] when it is known that si=
zes are identical but this
+ /// cannot be proven by the compiler during type checking and can be prov=
en during monomorphization.
+ ///
+ /// The signature is equivalent to Rust standard library's unstable `tran=
smute_neo` and that of
+ /// [RFC 3844](https://github.com/rust-lang/rfcs/pull/3844).
+ ///
+ /// # Safety
+ ///
+ /// Same as [`core::mem::transmute`].
+ ///
+ /// # Examples
+ ///
+ /// This is typically used in generic code where it's known that type wil=
l have the same size, but
+ /// the compiler cannot prove it generically.
+ ///
+ /// ```no_run
+ /// trait IsU32 {}
+ /// impl IsU32 for u32 {}
+ ///
+ /// fn to_u32<T: IsU32>(v: T) -> u32 {
+ ///     // `core::mem::transmute` won't work here.
+ ///     // SAFETY: We know that `v` is u32!
+ ///     unsafe { kernel::mem::transmute(v) }
+ /// }
+ ///
+ /// to_u32(1u32);
+ /// ```
+ #[inline(always)]
+ pub const unsafe fn transmute<Src, Dst>(val: Src) -> Dst {
+     const_assert!(size_of::<Src>() =3D=3D size_of::<Dst>());
+=20
+     // SAFETY: Size is checked above. Other safety requirements follow th=
ose of the function.
+     unsafe { transmute_unchecked(val) }
+ }
+=20
+ /// Safely transmutes a value of one type to a value of another type of t=
he same size.
+ ///
+ /// The sizes are checked during monomorphization.
+ ///
+ /// This can be considered as generic version of [`zerocopy::transmute!`]=
 macro that defers the size
+ /// check and thus can be used in more cases.
+ ///
+ /// # Examples
+ ///
+ /// ```no_run
+ /// fn to_u32<T: FromBytes + IntoBytes>(v: T) -> u32 {
+ ///     // `zerocopy::transmute!` won't work here.
+ ///     kernel::mem::safe_transmute(v)
+ /// }
+ ///
+ /// to_u32(1i32);
+ /// ```
+ #[inline(always)]
+ pub const fn safe_transmute<Src: IntoBytes, Dst: FromBytes>(val: Src) -> =
Dst {
+     // SAFETY: `transmute` is safe with `IntoBytes` and `FromBytes` bound=
s.
+     unsafe { transmute(val) }
+ }
+=20
+ /// Type that is layout-compatible with a primitive representation.
+ ///
+ /// # Safety
+ ///
+ /// - [`Self`] must have the same size and alignment as [`Self::Repr`].
+ /// - [`Self`] must be [transmutable] to [`Self::Repr`].
+ /// - Neither [`Self`] nor [`Self::Repr`] contains interior mutability.
+ ///
+ /// The above basically says that `&Self` can be transmuted to `&Self::Re=
pr`.
+ ///
+ /// [transmutable]: core::mem::transmute
+ pub unsafe trait AsRepr: Sized {
+     /// Primitive representation of this type.
+     type Repr;
+=20
+     /// Convert from [`&Self`](Self) to [`&Self::Repr`](AsRepr::Repr).
+     #[inline(always)]
+     fn as_repr(this: &Self) -> &Self::Repr {
+         // SAFETY: Per safety requirement of the trait.
+         unsafe { core::mem::transmute(this) }
+     }
+=20
+     /// Convert from [`Self`] to [`Self::Repr`].
+     #[inline(always)]
+     fn into_repr(this: Self) -> Self::Repr {
+         // SAFETY: Per safety requirement of the trait.
+         unsafe { transmute(this) }
+     }
+=20
+     /// Convert from [`Self::Repr`] to [`Self`].
+     ///
+     /// # Safety
+     ///
+     /// `repr` must be a valid bit pattern of [`Self`] and satisfy type-s=
pecific invariants of it.
+     ///
+     /// Alternatively, if `repr` is previously obtained using [`Self::int=
o_repr`], and each
+     /// `from_repr_unchecked` should correspond to a unique `into_repr` c=
all, then it is safe to
+     /// call as well (this means that we're undoing a `into_repr` call ge=
tting the exact bytes
+     /// back).
+     ///
+     /// No guarantee is made if the result of a `into_repr` is passed to =
multiple
+     /// `from_repr_unchecked` (i.e. copies are made), to allow for cases =
where `Repr` is a pointer
+     /// and the user of the API wants ownership transfer. Users that want=
 the ability to call
+     /// `from_repr_unchecked` after copying can require `Copy` bound expl=
icitly.
+     #[inline(always)]
+     unsafe fn from_repr_unchecked(repr: Self::Repr) -> Self {
+         // SAFETY: Per safety requirement, `repr` is valid repr of `Self`=
, or it is previously from
+         // `into_repr`, in which case we're undoing the transmute so it i=
s also safe.
+         unsafe { transmute(repr) }
+     }
+ }
+=20
+ /// Type that is bi-directionally transmutable with a primitive represent=
ation.
+ ///
+ /// # Safety
+ ///
+ /// - [`Self`] must be [transmutable] from [`Self::Repr`].
+ ///
+ /// [transmutable]: core::mem::transmute
+ /// [`Self::Repr`]: AsRepr::Repr
+ pub unsafe trait AsReprMut: AsRepr {
+     /// Convert from `&mut Self` to [`&mut Self::Repr`](AsRepr::Repr).
+     #[inline(always)]
+     fn as_repr_mut(this: &mut Self) -> &mut Self::Repr {
+         // SAFETY: Per safety requirement of the trait.
+         unsafe { core::mem::transmute(this) }
+     }
+=20
+     /// Convert from [`Self::Repr`](AsRepr::Repr) to `Self`.
+     #[inline(always)]
+     fn from_repr(repr: Self::Repr) -> Self {
+         // SAFETY: Per safety requirement of the trait.
+         unsafe { transmute(repr) }
+     }
+ }
+=20
+ // SAFETY: `bool` has the same size and alignment as `u8`, and Rust guara=
ntees that `bool` has
+ // only two valid bit patterns: 0 (`false`) and 1 (`true`). Thus `bool` c=
an be transmuted to `u8`.
+ // Neither types contain interior mutability.
+ unsafe impl AsRepr for bool {
+     type Repr =3D u8;
+ }
+=20
+ // SAFETY: `*mut T` has the same size and alignment with `*const c_void`,=
 and thus `*mut T` is
+ // transmutable to `*const c_void`. Neither types contain interior mutabi=
lity.
+ unsafe impl<T> AsRepr for *mut T {
+     type Repr =3D *const c_void;
+ }
+=20
+ // SAFETY: `*mut T` is transmutable from `*const c_void`.
+ unsafe impl<T> AsReprMut for *mut T {}
+=20
+ // SAFETY: `*const T` has the same size and alignment with `*const c_void=
`, and is transmutable to
+ // `*const c_void`. Neither types contain interior mutability.
+ unsafe impl<T> AsRepr for *const T {
+     type Repr =3D *const c_void;
+ }
+=20
+ // SAFETY: `*const T` is transmutable from `*const c_void`.
+ unsafe impl<T> AsReprMut for *const T {}
+=20
+ macro_rules! int_impl {
+     ($($unsigned:ident $signed:ident ,)*) =3D> {$(
+         // SAFETY: `$unsigned` has the same size and alignment with itsel=
f, and is transmutable to
+         // itself. It does not contain interior mutability.
+         unsafe impl AsRepr for $unsigned {
+             type Repr =3D $unsigned;
+         }
+=20
+         // SAFETY: `$unsigned` is transmutable from itself.
+         unsafe impl AsReprMut for $unsigned {}
+=20
+         // SAFETY: `$signed` has the same size and alignment with `$unsig=
ned`, and is transmutable
+         // to it Neither types contain interior mutability.
+         unsafe impl AsRepr for $signed {
+             type Repr =3D $unsigned;
+         }
+=20
+         // SAFETY: `$signed` is transmutable from `$unsigned`.
+         unsafe impl AsReprMut for $signed {}
+     )*};
+ }
+=20
+ int_impl! {
+     u8 i8,
+     u16 i16,
+     u32 i32,
+     u64 i64,
+     // `usize` is not normalized to particular integer for portability.
+     usize isize,
+ }

--eKnPMsofAaWlv7EM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCar/0MQAKCRAv73Ows9A4
iWXTAP0VPyeMF82bkbFqdlcdPwhRhPK2kOQR5cFZLJ3M5qydzAEAp3ySGIVSIItm
reSeEalkCtYhk7FnsWT4Vssc7HSJkQQ=
=ejpE
-----END PGP SIGNATURE-----

--eKnPMsofAaWlv7EM--
