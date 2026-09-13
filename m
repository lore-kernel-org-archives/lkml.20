Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23803348C6D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 02:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789265918; cv=none; b=hqr+X8SzH6lSJp1FBtWEw42p74SMgPVK4NqgOhx9oSqeHk6WUzwaiieYdgxr0GIrJ+lOc6NR2tpQyRTQkwejHZeXLTgFAkWztutCF7vuEfvm+dzjX2Uy66rqiW/wld4Vgna2+ZwSNopWLfsEl0Nhybcxvuh4b8vO+vunxXVhle0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789265918; c=relaxed/simple;
	bh=16oi9ly1u2ldB9w7kIk+fAa1tFvrCNW02ronDoL8CGw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=grs53R/A3+8a6x1RonUsGFt4vBdwKQdzsxU6K05nYeV3wvos3aB2+JQOBpwskTmAQvqW/wHlriTN/Fz/qfvKEUFLOnL9icVL1RjBqIO8VoB5dve7P2jHgGD6KWBTjjWQZeJylFCGUALocw8hlY5mGMwvdnjTo+ClDCKDBYFp5uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=B4otVLyu; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="B4otVLyu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1789265903; x=1789525103;
	bh=oP+Fm5f7FOJsKi+1wYYcRlqrgXpreIiFFEpdGNZk4ZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=B4otVLyu0ZCWyCLmQlGwTrNvov/HnGEypzQcbDtMiL1+EBQOIVaBm9AQsDjidwSIu
	 dJt6NfMuL52oyhmE4uBc2cSkzkMTPwLr8X4O7BHQn/IBJqwaqLWJhViPMe1em3Z0WW
	 I6yBLJ9ojLM9wF3O8cA2PL7ghAc1dp8Nv9zPUkxsst1Bj5J8W5mRdk97tFdGYJfLJr
	 eqoXsloeCwWAnY+Srikfh7gO/fXzqmOUfhlzd9FTEDAgtfJjd8DJNjqPB348zwz/wF
	 Y2t59XzR+RyUTM6Fed8HAGmrLrY5xEGN0VmIIklNE5DMRpVLIIT4TDhdAlAKA/s3DY
	 ekr1pfRKMUCYQ==
Date: Sun, 13 Sep 2026 02:18:15 +0000
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Sagar Taunk <sagartaunk@proton.me>
Subject: [PATCH v2] rust: net: netlink: Migrate to zerocopy's IntoBytes
Message-ID: <20260913021805.19062-1-sagartaunk@proton.me>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: 9c8dc56ef59e2931baae90e8a8d4c826a3937692
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Replace the kernel's own `transmute::FromBytes` and `AsBytes` traits
with their zerocopy equivalents. Specifically, this updates
`GenlMsg::put` to rely on `IntoBytes` for converting attributes into
byte slices.

Also, add `Immutable` trait bound on `GenlMsg::put` as zerocopy
splits the `no interior mutability` guarantee that `AsBytes` bundled
together.

Link: https://github.com/Rust-for-Linux/linux/issues/1241
Signed-off-by: Sagar Taunk <sagartaunk@proton.me>
---
v2: Split into a separate patch per Shashiko's review; validates the
    attribute length with c_int::try_from() instead of casting with `as`.

 rust/kernel/net/netlink.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/net/netlink.rs b/rust/kernel/net/netlink.rs
index 22ef3dde36fa..3c2b142a7402 100644
--- a/rust/kernel/net/netlink.rs
+++ b/rust/kernel/net/netlink.rs
@@ -12,11 +12,12 @@
     alloc::{self, AllocError},
     error::to_result,
     prelude::*,
-    transmute::AsBytes,
     types::Opaque,
     ThisModule,
 };
=20
+use zerocopy::{Immutable, IntoBytes};
+
 use core::{
     mem::ManuallyDrop,
     ptr::NonNull, //
@@ -84,7 +85,7 @@ impl GenlMsg {
     #[inline]
     fn put<T>(&mut self, attrtype: c_int, value: &T) -> Result
     where
-        T: ?Sized + AsBytes,
+        T: ?Sized + IntoBytes + Immutable,
     {
         let skb =3D self.skb.skb.as_ptr();
         let len =3D size_of_val(value);
--=20
2.55.0


