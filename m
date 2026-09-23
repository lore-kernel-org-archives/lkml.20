Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD45951DB03
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165140; cv=none; b=ucdmCURedPOUHPoo67txyzKRGbO5oXYJkLGdYP/XFlmggng+dmtridKA46TUs7a/eDBAGXN1ZABalTeyzGHVJS6wWsbx9t6J4TN0oTtc76U5Sv7Qd+5/dGAUq4WEzQSJS2gqzwyt5S8XhYb5S5sP4UK/b0RREEx1K37wrcAxEzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165140; c=relaxed/simple;
	bh=u6BlPqfnX246IQYqasnk26G+irKQ6AhLrI1E4kh9qXc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SIycBRhzMuZTOtXa4CpLxjp6EDda4oO817yGYwWVIS2DRURuNfhVPXdCfHV9tN4K8jRq9X2Ab/BiZ98jm0hYisj9c+ptg3BbsjVUuHmtjFD0lYKjt3OEzUjzohTKY+KsJ3OTbKlJkMgxsJ8MyhVv/Ms+Ftgag8HuzA9+VF/siLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=T4lmsJ8P; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="T4lmsJ8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=yftbyle7ozcaznszoawf2llexq.protonmail; t=1790165125; x=1790424325;
	bh=8mHgQgHYnmQVvZTt78PdSgMJEhjtqfge7wQlTrJctNo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=T4lmsJ8PnezOqlkE1qX7cYNJi0joOgfkqcpBTbGx9TXfQngW+qn3KxTfKvCaEW33W
	 fbTJDcEJkFnE85fYnvNbpqbK6jYQrihT9KeVLgUFKlE4le1HQRZr4YEUAjIdMdCUzC
	 ap2kZ14wj0EnS0jxoym0VyzndFo3swJXoM1CxAkwWC+mXT1yVjr9uJFc5HQAB4xfHq
	 d/S2THaYayarbZsoI8cvpMbcf5URAi7ffwF/u6FAEVzLlg/R+RhWOGWPPT4/FJtUcH
	 KZdIxAO5Bw8QN8ja91V3Seu73KqNEimdImD5L/4IeYHaTQam8hVHizD6uiA8oT4LYz
	 S0FU05HqCE/2w==
Date: Wed, 23 Sep 2026 12:05:17 +0000
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, Matthew Maurer <mmaurer@google.com>, Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Sagar Taunk <sagartaunk@proton.me>, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v4] rust: net: netlink: validate attribute length before casting to `c_int`
Message-ID: <20260923120504.9100-1-sagartaunk@proton.me>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: f95d144d66500ca3285a525e0ba5c0e01c7d28b5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

`put()` trusted an unchecked `as` cast from `usize` to `c_int`.
When the length exceeds `i32::MAX` that cast wraps around to a
negative value.

This ultimately resulted in a kernel panic when the reinterpreted
value via `__nla_reserve()` and `skb_put()` became enormous.

Validate payload and header both fit together in a `u16`, rejecting
any payload that wouldn't leave room for `NLA_HDRLEN`.

Fixes: 5eaa5fbb6e6c ("rust: netlink: add raw netlink abstraction")
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Sagar Taunk <sagartaunk@proton.me>
---
Changes Since V3:=20
Rebased on the upstream rust-next tree.=20
No functional changes.=20

 rust/kernel/net/netlink.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/rust/kernel/net/netlink.rs b/rust/kernel/net/netlink.rs
index 22ef3dde36fa..2f8733a694a9 100644
--- a/rust/kernel/net/netlink.rs
+++ b/rust/kernel/net/netlink.rs
@@ -11,6 +11,7 @@
 use kernel::{
     alloc::{self, AllocError},
     error::to_result,
+    num::casts::u16_as_usize,
     prelude::*,
     transmute::AsBytes,
     types::Opaque,
@@ -86,9 +87,17 @@ fn put<T>(&mut self, attrtype: c_int, value: &T) -> Resu=
lt
     where
         T: ?Sized + AsBytes,
     {
+        // `nla_len` is a 16-bit field that encodes the total attribute le=
ngth
+        // (header + payload). Subtracting the header size from `u16::MAX`=
 gives
+        // the largest payload that still fits within that field.
+        const MAX_PAYLOAD_LEN: usize =3D u16_as_usize(u16::MAX) - size_of:=
:<bindings::nlattr>();
+
         let skb =3D self.skb.skb.as_ptr();
         let len =3D size_of_val(value);
         let ptr =3D core::ptr::from_ref(value).cast::<c_void>();
+        if len > MAX_PAYLOAD_LEN {
+            return Err(EMSGSIZE);
+        }
         // SAFETY: `skb` is valid by `NetlinkSkBuff` type invariants, and =
the provided value is
         // readable and initialized for its `size_of` bytes.
         to_result(unsafe { bindings::nla_put(skb, attrtype, len as c_int, =
ptr) })
--=20
2.55.0


