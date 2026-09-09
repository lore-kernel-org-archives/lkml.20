Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7F1582B87
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985950; cv=pass; b=HkBD3xrc9XDLp22H94TgFDHmG3ZgvoM8li8gMRxEToEQslRd8nWAE32S5hAq/ZHaqHyOWillOoPcQ5ohZqcsHxlW+4kbzISFvqoGEDakTbfadKDfx+/3AzFATRrc6pXEJFETC1ny/0Urg9LqAh8OS/3awynZvnm5wS/A7dVMrBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985950; c=relaxed/simple;
	bh=RDnvDdT3gqyBnSoIqf9qQ2y2LD/nCKQusFnx59PqfCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhNxPh18EMhqOpf+6pNSihIcyO3gW/wq9wNoEMIJmp6gNVctK80/Kg9A5W16XDnDW57/0J1Iv2jAd6gYtYXCMOYNtEjMvA600ck6U27/yKsPLHRoPPB5SrnriDWfmIwgRUYeMcOX1ksCGu1FM2oxKUX/6Ky9/jcJlcbU3YEcGFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJ8pbEpL; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJ8pbEpL"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37dcfe9b2so778215b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788985945; cv=none;
        d=google.com; s=arc-20260327;
        b=L7AknF+nB/MsaXGzG3pPcikqFfu/GyqWNbSPin3vZJrXVwsljY4eJv1dVF74+LM8Jt
         b+VljKzCwRs9VE6D7VZ1oXMauaYs/zkfetjJtq6/QcneS6x8Z3TveZFBNWvZA6nC6LPJ
         Qtx8IlolGoIiCsle0mce0vHP0M2HiBuTi/d3AWawzousQ7DDll7vghI/qXOLHC4Tbe/J
         nX9D39piPAyub4+NIUbwMuCQLAxid0pv8TPrKBb1s6+tUMmxcuuYWr1OeBoH9Msrurl1
         9s8miElOJzmmP/9kAfQroNLGaFwnrTxdMS2JEvKsINXOlLLaOHKearH/avR0pCbVIY9G
         BVyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGmxbhzdNURowH0NhYZYh+4kKqv4nS/H+afPTxx5XOs=;
        fh=psa9gpA2mrI4Dfk9TsJyOAwf4HJfZwHaUxDgqG9bO9w=;
        b=TY5il3jisCkzIRtu6wthst/RWvI+ewPLQYxeXTqXVW6ZweO7QMQ0QG7UvuxtvlAabk
         61kY/JqzFnhNSE1Jqdm5vC1yGblkAly1q+n+XJInJsrmP1XHBGYNEnByVisC7D19F5Os
         rP3RjwNCuRpwck+iBYQPSRrQvW2k0zqEhwxo7DLz83dJnsF/WFK7j0Wws9g4WQLf5WZZ
         AZWKTrjTo1F0RCI2GwjpWy1BrjqMaAivsvarTiHl2xNBhXERtnSt7S8QB3oUfvIGu4Ji
         b6GfMcoOpTZVVbKKOdvYYU3ksBuVG3zmvp3NptAPcDQ/uPGnXsy662VrBBwhk9r9ctg2
         NYRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985945; x=1789590745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aGmxbhzdNURowH0NhYZYh+4kKqv4nS/H+afPTxx5XOs=;
        b=ZJ8pbEpLzPNlcPD1IYu60zMFiWvHJaKQNR+vV+YEI7uzxYHaI3A5mAP9CLoTIiQwrq
         YmMLsS7Bh/9+wTdW62fg/KslN4asUictQ9qeWgRCtadIAbnoF9Gir2R5dTJOij4yK/U3
         NgR6jPaUtr9GybUfrHO3a2gJtJGr14aHx3Y+/CrqaxPpH/LYelnG8D47UbXvi9h4JxC1
         7G4bWPOHAcab0Vgi7lnxrN6twNt3zcJbo22UP+4PfidB0JM2vXQuUMCCjFEDEFd9o5Xh
         775n2038bEhBgJqAdC903eaFfyTa+zh8FiKBvLkzM4JZ5k+Op89y8RbZcKj3Lf1RqE9J
         /K6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985945; x=1789590745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGmxbhzdNURowH0NhYZYh+4kKqv4nS/H+afPTxx5XOs=;
        b=FKF+TR7yDZUn+rGWvZO+9V9Az7KwkLqEUJQeA7kqI5QhvmSoUbwcymJxCSLWiGL9iR
         C6YZWlfKhC2CJi/zYbgXuEvjaX5HV3QhxmhggBVcC8NzaAxR5IQbP4le3wafGN7HvEm2
         O1BzLGHSHX3m4+QQvk5SZ8XaSGXY/a7AG1Czl+W0lcs+r48qai+4Ey6IYRjzJgEr3I+F
         McBm8ZKPvko6QeXikVES0mT0eHrreTvgLlk7cDxyHyhnLH9Zs1UwkRd2v9aBo8GMbB4l
         2D24aD8XnKZUXPoyBguxWPfQILi/KL5Uo2nga66kHxcHUU5XhUmSajSwqFOkfMIHRCF6
         iN1w==
X-Forwarded-Encrypted: i=1; AKwUvBwl0i6MT3Mwr15g5g8dSr1arnQNshmbeiuvyt+x77SeJKVT9UgV4f4YcTq6GFT925vrZl1j12V67SwQDHM=@vger.kernel.org
X-Gm-Message-State: AFuF++murrFpczhR8H3AGfi7PagO7NDI6K/bGiRt1SKvE3WdK0VrbhME
	7eWXXRloznz/sc+Sggwf884noa4Bz5RfWiJ1dee1vk/t2LfBoAqlKB+en0Fkw3cs0oFTqGiiH12
	GrbulKlBLVM3a1l4xcBPIOjDPpvi29iQ=
X-Gm-Gg: AYBFou07tXq58J9Vg7FmA3XYejNMfIq+lLEFs/f4zpSr9uW2Q5Im2YqevoMyw31x+OM
	QgeLgddmQEExdMXgm+BexIzR5B82RGjJsiD3WpnCTwFquy5jfmw+GDeU8FHgTETzoThKesD8wWu
	H72XwfKDN77uiaep6Kwd4JqswJaVFxrdIDnL7AqMRTRJeiT1tK4pnhp8GwKun5EkjPJ3O9JMW7D
	A41AVsdg9bG5J1PUNsOXyw81nRHkpGOvt+LmF9UM9dQtG5gR/KFx+8fbiNkkZDvXNJtJoaoCpdH
	m/uXpFHoNmGJuJNk7Fv+XIIt7KdmTMB1Z5v8Lt714Kp1paIdfLGQ73vwI4L5yTjM8BotsErZ/It
	G95ueROIhTeN4Mw==
X-Received: by 2002:a05:6808:199b:b0:4b3:7a14:6b25 with SMTP id
 5614622812f47-4c0250d649emr9426459b6e.14.1788985944982; Wed, 09 Sep 2026
 13:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909033246.2779303-1-georgeandrout13@gmail.com>
 <2026090955-lustfully-fanning-33f9@gregkh> <DLAR1FIFL0Y5.22A7AJKNW0YQP@kernel.org>
In-Reply-To: <DLAR1FIFL0Y5.22A7AJKNW0YQP@kernel.org>
From: George Androutsopoulos <georgeandrout13@gmail.com>
Date: Wed, 9 Sep 2026 16:32:14 -0400
X-Gm-Features: AcwNN1UhJN0ysufwaCf-45J3Jdkut3tQFJ3a4uYdflnPIbeGW7A1nWp9glQ99fI
Message-ID: <CAESH5oeL4+rgO1PODjza1PiTzvfOBmCP_WtUoAyaejwSCcQkSQ@mail.gmail.com>
Subject: Re: [PATCH] rust: auxiliary: validate DeviceId name length
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <iweiny@kernel.org>, Leon Romanovsky <leon@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 7:29=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
> It's not actually fixing a bug, so I don't think this needs a Fixes: tag.

Agreed, dropping it in v2.

> I'd rather document that this is only intended to be called within device=
 ID
> table creation; in const context a panic is just a compile time error.

Agreed, replacing the `# Panics` section with that in v2.

> >>      pub const fn new(modname: &'static CStr, name: &'static CStr) -> =
Self {
> >>          let name =3D name.to_bytes_with_nul();
> >>          let modname =3D modname.to_bytes_with_nul();
> >>
> >> +        assert!(
> >> +            modname.len().saturating_add(name.len()) <=3D bindings::A=
UXILIARY_NAME_SIZE as usize,
> >> +            "auxiliary device ID is too long"
> >> +        );
>
> Isn't this missing to consider the separator and NULL terminator?

I believe both are covered. `to_bytes_with_nul()` includes each string's
terminator, and after the copy loop `modname`'s NUL is overwritten
with the `.` separator, so `modname.len() + name.len()` is exactly the
required capacity.

At the boundary, `DeviceId::new(c"a", <37 bytes>)` stores "a." plus 37
bytes plus the NUL, which is 1 + 1 + 37 + 1 =3D 40 and is accepted; one
byte more is rejected.

> Unfortunately, we can't enforce that is function can only be called from =
const
> context, so technically it could also be called outside of the device ID =
table
> in non-const context, but it would be odd to construct outside of a devic=
e ID
> table.

Ideally that would be enforced rather than documented. Miguel pointed at
Gary's `#[const_eval_only]` [1] in the other branch, and `DeviceId::new()`
looks like a good candidate for it: it exists only to build device ID
tables, so a non-const call is a mistake rather than a supported use.

For v2 I will document the intent, and the attribute can be applied as a
follow-up once that series lands.

[1] https://lore.kernel.org/rust-for-linux/20260903-cv-v2-0-e93b1613e40c@ga=
ryguo.net/


On Wed, Sep 9, 2026 at 7:29=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Wed Sep 9, 2026 at 9:19 AM CEST, Greg Kroah-Hartman wrote:
> > On Tue, Sep 08, 2026 at 11:32:46PM -0400, Georgios Androutsopoulos wrot=
e:
> >> `DeviceId::new()` copies `modname` and `name` into the fixed 40-byte
> >> `auxiliary_device_id::name` array without checking that they fit. An
> >> oversized name is caught by the array bounds check, but the error
> >> reports an out-of-bounds index in the copy loop rather than the
> >> constraint the caller violated.
> >>
> >> Check the invariant explicitly instead, so the failure states the leng=
th
> >> limit rather than an array index.
> >>
> >> In a constant context exceeding the limit leads to a build error; at
> >> runtime it panics, so add a `# Panics` section for it.
> >>
> >> Fixes: ce735e73dd59 ("rust: auxiliary: add auxiliary device / driver a=
bstractions")
>
> It's not actually fixing a bug, so I don't think this needs a Fixes: tag.
>
> >> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> >> ---
> >>  rust/kernel/auxiliary.rs | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
> >> index 60dfbec8f330..1f3ba86d6d96 100644
> >> --- a/rust/kernel/auxiliary.rs
> >> +++ b/rust/kernel/auxiliary.rs
> >> @@ -137,10 +137,20 @@ macro_rules! module_auxiliary_driver {
> >>
> >>  impl DeviceId {
> >>      /// Create a new [`DeviceId`] from name.
> >> +    ///
> >> +    /// # Panics
> >> +    ///
> >> +    /// Panics if the combined module and device name, including the
> >> +    /// separator and trailing NUL, exceeds `AUXILIARY_NAME_SIZE` byt=
es.
>
> I'd rather document that this is only intended to be called within device=
 ID
> table creation; in const context a panic is just a compile time error.
>
> >>      pub const fn new(modname: &'static CStr, name: &'static CStr) -> =
Self {
> >>          let name =3D name.to_bytes_with_nul();
> >>          let modname =3D modname.to_bytes_with_nul();
> >>
> >> +        assert!(
> >> +            modname.len().saturating_add(name.len()) <=3D bindings::A=
UXILIARY_NAME_SIZE as usize,
> >> +            "auxiliary device ID is too long"
> >> +        );
>
> Isn't this missing to consider the separator and NULL terminator?
>
> >
> > We really shouldn't panic, we should error out and fail the creation
> > instead.
>
> This is only ever used from const context to construct the device ID tabl=
e, e.g.
> as in
>
>         kernel::auxiliary_device_table!(
>             AUX_TABLE,
>             <NovaDriver as auxiliary::Driver>::IdInfo,
>             [(
>                 auxiliary::DeviceId::new(NOVA_CORE_MODULE_NAME, AUXILIARY=
_NAME),
>                 ()
>             )]
>         );
>
> and a panic in const context makes the compilation fail, so it works as
> intended.
>
> Unfortunately, we can't enforce that is function can only be called from =
const
> context, so technically it could also be called outside of the device ID =
table
> in non-const context, but it would be odd to construct outside of a devic=
e ID
> table.
>
> > But what is placing the constraint of the name size here?  The C api
> > just takes a pointer, it doesn't care about the size, why does the rust
> > binding care?
>
> I assume you were thinking of something else? This struct represents
>
>         #define AUXILIARY_NAME_SIZE 40
>
>         struct auxiliary_device_id {
>                 char name[AUXILIARY_NAME_SIZE];
>                 kernel_ulong_t driver_data;
>         };
