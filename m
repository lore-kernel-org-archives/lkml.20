Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB4B3E0088
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033594; cv=pass; b=F4bCY1o/50pkMidy2EHW1bhMqgwdE6VZFexNUi/sMGfmahH0Knt1/uuruOXNcxX6fl3KIrAewUWdaKh5yi/VNqdMrIWB0yGWP8z3cX+rQEorc4X5j4oZ2GUMGQoQY82ykyqttzqcJqqOrHNNDM3jCCgVleDmi0PZtsktLIcCrL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033594; c=relaxed/simple;
	bh=a/6f4QF1Wsww9ttIAYJYc9lLbaHe4jO/w79IMMKFNWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EYYQVq7AOnOvBEdPb4L9FPKUddBZanw87Qxb7P+KHb3AOO5dAkIMNj5D0F7tUPVGkChFpAVzFLYqy2jDGQTtMFh+oNzR2EuMVCQskQs9eoCt5T0cBavjHBWyn///0tJfi2Qq4+aYD24M/tFKZ98UJHqgeTAGqfeQjnGAIb7ru1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnC6fRcK; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnC6fRcK"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso2991795a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792033590; cv=none;
        d=google.com; s=arc-20260327;
        b=nvmxtiGUkewJVUDBHYabQOpnJHkzXBBLsSMpeNvgu78q6ZsKR9AdWwV32JkuUvzfER
         OA29Amlc0wiO3WXxRctyCvZLU/ffy3X/0QsUrPCbxKuVXls0syuSBdF2DbZUx9tPEmoz
         xunvB6FuwuXO2Q8IpFImTk+y/i7x+VVEOhL3NOPF+FC58/nYkj4UpxcZ0moCm/PoHjfQ
         /uEFXSXwB3XWqv4dDTF6N1e8tkmJxnrlns9DBrIwROQlZ2taVRdqgbTXqflu98vC0iNM
         I6J8+Qi3cQwK2FKW/BW8soJXrOLYSZJD1BYE+3fNfYdIPKupBF1os07qi6GiqeIcBy53
         T2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+dvlObEQLQudKXYWPDBhDHwG3kWaespOtx9QvaoDVJs=;
        fh=/sVAzSs6Z6BYw8Jjr6Zd3i9GbCPkzIXoZSH7hR+BQ34=;
        b=J8NBTIzjwtuGw9FSmJIujLJvSx4z39UmJ9sC/UfdfkSxE/bfk0qV+geAFSOjbTXlly
         v+mooQ94Lttd2ry6xrn+oHnQrLvmT95/qGMpICDwM3mY/3ee4Ih+PsjGknx5GqWCGceg
         wLBg4kiC394FJtpVIKLz/ARtkTSiLsJynvPQfY6t9+bk1YSlPvq6+KMaCgMWhi1qpemC
         CybjHY86eDJTdd3J4j5DYuhszKEhslZiZPZPdGNLonRrD8YRn0GxNZoqgsm4ft62sL3p
         vpWjwH905dBUV3+X8i/BARryacLAD6VQic/0SusFcU5770qGSRBbNUtYBI3332m905oC
         kS/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792033590; x=1792638390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+dvlObEQLQudKXYWPDBhDHwG3kWaespOtx9QvaoDVJs=;
        b=lnC6fRcKpTml7l4+wwdWnuUnrCwhPhuSUR5PuEhTWEp3H4d098V1NXv+1xOsGgoDeu
         SUf/XYdvyGUU2DUchE3TQFGeXzgBYWtIRN5BTQbtEnCY5IQ6jF1hQY/VXPRxuDzSXHpH
         auQVT1Z07Gvac4NchPjV0DKzchfrjhTKemjkZQRSlJIJmvgPk+afqvMDr23Nz7ol/m3u
         GIig0txhMVOAnzsj6zKJ7oAYqkafGbDML92v1uaNyng1uQOr83fxAdRznH1c6NZdfbwz
         NqJe2Yjm3HyAmDd7eugsJo4mLO3T2G38RzhJ8AOIKspMXSTbUTxf8nOHNZ7+aNXCKOCC
         PWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792033590; x=1792638390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dvlObEQLQudKXYWPDBhDHwG3kWaespOtx9QvaoDVJs=;
        b=XRaGPUY8SG7JktCF1oFc+o89O03FaaUlwUiPQTbLsxW4KPJ6WOUWB+p2ijfIUC/w3a
         L5P0MEPU8TP47Uu4CoI6WqEWJeJCn3RJC6GZiwE4BMmtEAgtmqPMqag/NNCiW/CrU1Em
         IlWoofeJot5m1hxqkYOeluKGHVre8uLVG+YSWzf8w3UEl87Xy6NjxlPfxfFFN21NKEV1
         7zQLx9OKc1VHRC5rzftuqu9/JyC+Y9zOl+ug9gcVROtBsd0PWJh6Lc3P+0OYrDZFlN2N
         5wjbEHSKJE/F+DGRFN+bJdVtaZfDzjHLVJ5pXaxnA2dnPgyeuZGTQD1JSLfzBi8fa5xS
         8jxw==
X-Forwarded-Encrypted: i=1; AKwUvBydbySDvZyjBXIUHnPEKeqPQxtvC4PgvYzA/4cUmIRL/y8poNvf+JGAV1NddDOXASOS44JcBRqch+RwfR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWUIuN6FiRwxkNLLwWfaXimosiKAUfHgKUmmVQZp1SzYYDv29B
	O5QIYa4NIgn/hMbfT6Yy2/4MUPK6CbGEiCWyKR3PW7FWOwDFUY/b2F2HSODYRBDTIWqzk37nZ1T
	lr4Po8LS4TJx1gJ/DnJ0mTvOmMrGVsK4=
X-Gm-Gg: AYBFou0x2lfHqfnhj91yVdO4yWEbOI1iTZJljZ069MmOh7wcKHMO/cWrxWwv/1p0UQE
	zCxBn/DeHp3MokiiDzXetuQagBgMuh0As5/ZTukpSxsB2sE/MBaG2iOY3OH1xOknFlRoAJn/VT1
	E/Ra0UbeFMtsT1YFe68zwf0w7EME/mewfL+k4X1jpikm4WKdli335Jg61+u5Yt52eZrIkXqepxP
	M4R9koKzT0SIk+a3bLU7eVvZSrHoi3481psIIDAMl/Kehu+VJpGRJPNLe6D1xFtI4irPsqZC3MT
	AxlzzC0n+CYn8/WHvn0FHCWfJiXeVQWoqarsU5rg5OQPajYB7fONyYpqHtot/EfokMSBoKQBb0S
	G2xDQ9Vjnag==
X-Received: by 2002:a05:6402:2115:b0:6a9:f88d:c092 with SMTP id
 4fb4d7f45d1cf-6b17c164de5mr14448573a12.0.1792033590058; Wed, 14 Oct 2026
 20:06:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928011123.450800-1-alistair.francis@wdc.com>
 <20260928011123.450800-11-alistair.francis@wdc.com> <DM4NT7TFX4X9.1GFI128LI5ZQ4@nvidia.com>
In-Reply-To: <DM4NT7TFX4X9.1GFI128LI5ZQ4@nvidia.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Oct 2026 13:06:01 +1000
X-Gm-Features: AclHuK_848dEWLvQB2EkuYfPoUwZxvDK0SarfXUUCm147LPc2u1MU8LpiLVD7tI
Message-ID: <CAKmqyKNEup=x+bwmPD_8x0s4ssPkqFnQtSGqJ_82z9oDP=A6cA@mail.gmail.com>
Subject: Re: [PATCH v4 10/22] lib: rspdm: Initial commit of Rust SPDM
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: lukas@wunner.de, linux-cxl@vger.kernel.org, akpm@linux-foundation.org, 
	Jonathan.Cameron@huawei.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jic23@kernel.org, bhelgaas@google.com, 
	alistair@alistair23.me, djbw@kernel.org, linux-pci@vger.kernel.org, 
	wilfred.mallawa@wdc.com, a.hindborg@kernel.org, gregkh@linuxfoundation.org, 
	alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, 
	boqun.feng@gmail.com, bjorn3_gh@protonmail.com, tmgross@umich.edu, 
	gary@garyguo.net, ojeda@kernel.org, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:17=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Mon Sep 28, 2026 at 10:11 AM JST, alistair23 wrote:
> > From: Alistair Francis <alistair@alistair23.me>
> >
> > This is the initial commit of the Rust SPDM library.
>
> This commit message deserves to be a bit more verbose. :)
>
> <...>
> > diff --git a/lib/rspdm/consts.rs b/lib/rspdm/consts.rs
> > new file mode 100644
> > index 000000000000..9709f51849d7
> > --- /dev/null
> > +++ b/lib/rspdm/consts.rs
> > @@ -0,0 +1,92 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2026 Western Digital
> > +
> > +//! Constants used by the library
> > +//!
> > +//! Rust implementation of the DMTF Security Protocol and Data Model (=
SPDM)
> > +//! <https://www.dmtf.org/dsp/DSP0274>
> > +
> > +use kernel::error::{code::EINVAL, Error};
>
> This can just be `use kernel::prelude::*;`.
>
> > +
> > +// SPDM versions supported by this implementation
> > +pub(crate) const SPDM_VER_10: u8 =3D 0x10;
> > +
> > +pub(crate) const SPDM_MIN_VER: u8 =3D SPDM_VER_10;
> > +
> > +#[allow(dead_code)]
> > +pub(crate) const SPDM_REQ: u8 =3D 0x80;
> > +#[allow(dead_code)]
> > +pub(crate) const SPDM_ERROR: u8 =3D 0x7f;
> > +
> > +#[derive(Clone, Copy)]
> > +#[repr(u8)]
> > +pub(crate) enum SpdmErrorCode {
>
> This is in `consts.rs` but is not a const... Actually everything in this
> module looks like it should be in `lib.rs`, and by doing so you could
> also remove the `pub(crate)` visibility.
>
> <...>
> > diff --git a/lib/rspdm/lib.rs b/lib/rspdm/lib.rs
> > new file mode 100644
> > index 000000000000..1010bd38df6d
> > --- /dev/null
> > +++ b/lib/rspdm/lib.rs
> > @@ -0,0 +1,96 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2026 Western Digital
> > +
> > +//! Top level library for SPDM
> > +//!
> > +//! Rust implementation of the DMTF Security Protocol and Data Model (=
SPDM)
> > +//! <https://www.dmtf.org/dsp/DSP0274>
> > +//!
> > +//! Top level library, including C compatible public functions to be c=
alled
> > +//! from other subsytems.
> > +
> > +use crate::bindings::{
> > +    spdm_state,
> > +    EPROTONOSUPPORT, //
> > +};
> > +use core::ffi::{
> > +    c_int,
> > +    c_void, //
> > +};
> > +use core::ptr;
> > +use kernel::prelude::*;
> > +use kernel::{
> > +    alloc::flags,
> > +    bindings,
> > +    new_mutex,
> > +    sync::Mutex,
> > +    types::ForeignOwnable, //
> > +};
> > +
> > +use crate::state::SpdmState;
> > +
> > +const __LOG_PREFIX: &[u8] =3D b"spdm\0";
> > +
> > +mod consts;
> > +mod state;
> > +mod validator;
> > +
> > +/// spdm_create() - Allocate SPDM session
> > +///
> > +/// `dev`: Responder device
> > +/// `transport`: Transport function to perform one message exchange
> > +/// `transport_priv`: Transport private data
> > +/// `transport_sz`: Maximum message size the transport is capable of (=
in bytes)
> > +/// `validate`: Function to validate additional leaf certificate requi=
rements
> > +///  (optional, may be %NULL)
> > +///
> > +/// Return a pointer to the allocated SPDM session state or NULL on er=
ror.
>
> The commenting style is a bit all over the place in this series,
> sometimes using the Rust style, sometimes the C kernel style, sometimes
> apparently something else.
>
> For Rust items, please follow the Rustdoc style. These functions though
> are the C FFI interface though, so they are useful to the C callers and
> as such I think their documentation belongs to the interface file (i.e.
> `include/linux/spdm.h`).
>
> <...>
> > diff --git a/lib/rspdm/state.rs b/lib/rspdm/state.rs
> > new file mode 100644
> > index 000000000000..c894cf30bb87
> > --- /dev/null
> > +++ b/lib/rspdm/state.rs
> > @@ -0,0 +1,241 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2026 Western Digital
> > +
> > +//! The `SpdmState` struct and implementation.
> > +//!
> > +//! Rust implementation of the DMTF Security Protocol and Data Model (=
SPDM)
> > +//! <https://www.dmtf.org/dsp/DSP0274>
> > +
> > +use core::ffi::c_void;
> > +use kernel::prelude::*;
> > +use kernel::{
> > +    bindings,
> > +    error::{
> > +        code::EINVAL,
> > +        to_result,
> > +        Error, //
> > +    },
> > +    validate::Untrusted,
> > +};
> > +
> > +use crate::consts::{
> > +    SpdmErrorCode,
> > +    SPDM_ERROR,
> > +    SPDM_MIN_VER,
> > +    SPDM_REQ, //
> > +};
> > +use crate::validator::{
> > +    SpdmErrorRsp,
> > +    SpdmHeader, //
> > +};
> > +
> > +/// The current SPDM session state for a device.
> > +///
> > +/// Concurrent access is serialised by wrapping the whole struct in a
> > +/// `Mutex<SpdmState>` at the FFI boundary, so `spdm_authenticate()` c=
allers
> > +/// run one at a time and the locked `&mut SpdmState` is the only way =
to
> > +/// reach the inner fields.
> > +///
> > +/// `dev`: Responder device.  Used for error reporting and passed to @=
transport.
> > +/// `transport`: Transport function to perform one message exchange.
> > +/// `transport_priv`: Transport private data.
> > +/// `transport_sz`: Maximum message size the transport is capable of (=
in bytes).
> > +///  Used as DataTransferSize in GET_CAPABILITIES exchange.
> > +/// `validate`: Function to validate additional leaf certificate requi=
rements.
> > +///
> > +/// `version`: Maximum common supported version of requester and respo=
nder.
> > +///  Negotiated during GET_VERSION exchange.
>
> Field documentation should be their own doccomments before each
> individual field (see [1] for an example and general good practices when
> writing Rust doccomments).
>
> [1] https://doc.rust-lang.org/rust-by-example/meta/doc.html
>
> > +#[expect(dead_code)]
> > +pub(crate) struct SpdmState {
> > +    pub(crate) dev: *mut bindings::device,
>
> This makes me very nervous. I see this is passed to C callbacks. We need
> to maintain the guarantee that the device still exists, so an
> `ARef<Device>`, from which you obtain a pointer to pass to the C
> callbacks, should be the minimum here. Does the device also need to be
> bound? Looking at `drivers/pci/cma.c` it seems to be. Then this needs to
> be a `&Device<Bound>`, with a lifetime to `SpdmState` so callers only
> use it while the device is bound.

Good point, I have converted this to use a `&Device<Bound>`

>
> Just storing a C pointer and passing it whenever a function needs it
> cancels the purpose of using Rust and make the safety requirements of
> the callback you pass it to impossible to guarantee, as nothing enforces
> that the device still exists or is in a valid state when they are
> invoked.
>
> > +    pub(crate) transport: bindings::spdm_transport,
> > +    pub(crate) transport_priv: *mut c_void,
>
> Here I also suspect we want to define some kind of ownership model for
> the private data instead of hoping that the pointer is still valid when
> we use it.

Any ideas here? It's just a pointer that we pass back to C when
calling the `transport_function()`, I'm not clear on what we could do
to ensure it's still valid.

>
> > +    pub(crate) transport_sz: u32,
> > +    pub(crate) validate: bindings::spdm_validate,
> > +
> > +    // Negotiated state
> > +    pub(crate) version: u8,
> > +}
> > +
> > +impl SpdmState {
> > +    pub(crate) fn new(
> > +        dev: *mut bindings::device,
> > +        transport: bindings::spdm_transport,
> > +        transport_priv: *mut c_void,
> > +        transport_sz: u32,
> > +        validate: bindings::spdm_validate,
> > +    ) -> Self {
> > +        SpdmState {
> > +            dev,
> > +            transport,
> > +            transport_priv,
> > +            transport_sz,
> > +            validate,
> > +            version: SPDM_MIN_VER,
> > +        }
> > +    }
> > +
> > +    #[allow(dead_code)]
> > +    fn spdm_err(&self, rsp: &SpdmErrorRsp) -> Result<(), Error> {
>
> `&self` is never used - this should probably be a method of
> `SpdmErrorRsp`.
>
> > +        match rsp.error_code {
> > +            SpdmErrorCode::InvalidRequest =3D> {
> > +                pr_err!("Invalid request\n");
> > +                Err(EINVAL)
> > +            }
> > +            SpdmErrorCode::InvalidSession =3D> {
> > +                if rsp.version =3D=3D 0x11 {
> > +                    pr_err!("Invalid session {:#x}\n", rsp.error_data)=
;
> > +                    Err(EINVAL)
> > +                } else {
> > +                    pr_err!("Undefined error {:#x}\n", rsp.error_code)=
;
> > +                    Err(EINVAL)
> > +                }
> > +            }
> > +            SpdmErrorCode::Busy =3D> {
> > +                pr_err!("Busy\n");
> > +                Err(EBUSY)
> > +            }
> > +            SpdmErrorCode::UnexpectedRequest =3D> {
> > +                pr_err!("Unexpected request\n");
> > +                Err(EINVAL)
>
> These blocks are getting repetitive. Instead you can implement `Debug`
> on `SpdmErrorCode` and `From<SpdmErrorCode> for Error`, and get rid of
> this method entirely as callers will be able to print the error directly
> and have it automatically converted to the kernel error type.
>
> <...>
> > +    /// Start a SPDM exchange
> > +    ///
> > +    /// The data in `request_buf` is sent to the device and the respon=
se is
> > +    /// stored in `response_buf`.
> > +    #[allow(dead_code)]
> > +    pub(crate) fn spdm_exchange(
> > +        &self,
> > +        request_buf: &mut [u8],
>
> This shouldn't need to be mutable?

Nope, it doesn't need to be. That's just leftover from earlier versions.

>
> > +impl<'a, 'c> Validate<'c, Untrusted<&'a [u8]>> for SpdmHeader {
> > +    type Err =3D Error;
> > +
> > +    type Context =3D &'c SpdmState;
> > +
> > +    fn validate(unvalidated: &[u8], _context: &'c SpdmState) -> Result=
<Self, Self::Err> {
> > +        Ok(SpdmHeader {
> > +            version: *unvalidated.get(0).ok_or(EIO)?,
> > +            code: *unvalidated.get(1).ok_or(EIO)?,
> > +            param1: *unvalidated.get(2).ok_or(EIO)?,
> > +            param2: *unvalidated.get(3).ok_or(EIO)?,
> > +        })
>
> Here you will definitely want to leverage zerocopy's `FromBytes` trait.

I was hoping not too actually.

The SPDM responses are a bit complex. For example NegotiateAlgsRsp has
multiple dynamically sized arrays, and the fields change based on the
version.

Using zerocopy means we need packed structs and even then I'm not
clear on how we can handle the KVec<u32> or even the
KVec<RespAlgStruct> nicley.

The current approach has the obvious downside of copying the data, but
as the data is pretty small in the scheme of things and not part of a
hot path, I think the tradeoff of copying the data with much cleaner
and easier to understand code is worth it.

Maybe in the future zerocopy could be a performance improvement, but I
think right now it's a large complexity overhead in this case.

Note that obviously SpdmHeader is not complex, but I think they should
all follow the same pattern.

Alistair

>
> > +    }
> > +}
> > +
> > +#[expect(dead_code)]
> > +pub(crate) struct SpdmErrorRsp {
> > +    pub(crate) version: u8,
> > +    /// This will always be SPDM_ERROR (0x7F)
> > +    pub(crate) code: u8,
> > +    pub(crate) error_code: SpdmErrorCode,
> > +    pub(crate) error_data: u8,
> > +}
> > +
> > +impl<'a, 'c> Validate<'c, Untrusted<&'a [u8]>> for SpdmErrorRsp {
> > +    type Err =3D Error;
> > +
> > +    type Context =3D &'c SpdmState;
> > +
> > +    fn validate(unvalidated: &[u8], _context: &'c SpdmState) -> Result=
<Self, Self::Err> {
> > +        Ok(SpdmErrorRsp {
> > +            version: *unvalidated.get(0).ok_or(EIO)?,
> > +            code: *unvalidated.get(1).ok_or(EIO)?,
> > +            // `try_from` rejects unknown `SpdmErrorCode` discriminant=
s.
> > +            error_code: SpdmErrorCode::try_from(*unvalidated.get(2).ok=
_or(EIO)?)?,
> > +            error_data: *unvalidated.get(3).ok_or(EIO)?,
> > +        })
> > +    }
>
> Same here.
