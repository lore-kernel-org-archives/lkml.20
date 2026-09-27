Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42353E5A20
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513834; cv=none; b=QWRimY40brBuomRot9GZA4jTIXkcO/YJuJGrYqDILf9ZLngTo1fjTL7nSbDOS/B7ATg5ylicwp9RBjMkmdG2Qoi+GfdM5gcnGTwe3l9qbSqZskoESgNORxWE0M59DlvA9KNJrXcQrZyRpAWZqb1M6mlIJx6Q8IhkfuymzYwrTEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513834; c=relaxed/simple;
	bh=AkaOx7AaU020EpbDApTRo7Tv3ao3P1ZoncljiGmZdM0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BNDZ4YLiezfTQ4pX6X9jYVZ9R8SvGXT6rmXp9n69DAsJMCdZjc8basnXEuRGXjeNm9RfR4iJagVVjqQJ/Bc4dOn/KxRSYEQMZz9CQN/X+sjPzyh3FK+lZImHdYZX2aAoiNODHZ64m3rK03dtyw4VyyfGp/9Cywfpjo2KlRd8i4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=RszV8Faz; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="RszV8Faz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1790513828; x=1790773028;
	bh=wk97yIKhcBvoRCsUkONYf/5cg9ArnxCiMp3PQC5v4c8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RszV8Faz+N6CkHNdmTYVWDNTrqH2ooa1w/buNidP4UGUXIhgFahv/aRDDyMcMQEYn
	 Kk2Ua3+ZP3+Aw7AGOi2MabxUuZVCjkvoqG2HRSXZBc/S+jdqSXxPXdJyOFxLvdYc+6
	 WDuYI5GyEM8tKUbzm8bixZX+zvAHmHXlnL5NBpyrkmZQ1jHuRnrV9LrKOSdV1lwESU
	 HIPVaKTQzI1TL3GDUSSl854lGfemXvbEwsmeklvEpaN3AaEyaQOI+Jd0ogCQOmP2k1
	 hdBpbFT/Ds1kf5X5TPuZ2g+eQe49mkA013H6EWT1uoqRmDOzGGZcBsyq9+PoSGd4Ot
	 mJR9VmdaJ+QjA==
Date: Sun, 27 Sep 2026 12:57:03 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Sagar Taunk <sagartaunk@proton.me>
Subject: [PATCH 4/4] rust_binder: add call site for `trace_transaction_update_buffer_release()`
Message-ID: <20260927125622.676342-5-sagartaunk@proton.me>
In-Reply-To: <20260927125622.676342-1-sagartaunk@proton.me>
References: <20260927125622.676342-1-sagartaunk@proton.me>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: f8dca3c76c42c87943d111c4d12ea3f1e4db4f97
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Call `trace_transaction_update_buffer_release()` when an outdated
oneway transaction is superseded by a newer one.

Signed-off-by: Sagar Taunk <sagartaunk@proton.me>
---
 drivers/android/binder/transaction.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder=
/transaction.rs
index 245f1556b5db..ff5ff23d8488 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -24,6 +24,7 @@
     process::{Process, ProcessInner},
     ptr_align,
     thread::{PushWorkRes, Thread},
+    trace::trace_transaction_update_buffer_release,
     BinderReturnWriter, DArc, DLArc, DTRWrap, DeliverToRead,
 };
=20
@@ -355,6 +356,7 @@ pub(crate) fn submit(self: DLArc<Self>, info: &mut Tran=
sactionInfo) -> BinderRes
                         if let Some(t_outdated) =3D
                             target_node.take_outdated_transaction(&self, &=
mut process_inner)
                         {
+                            trace_transaction_update_buffer_release(t_outd=
ated.debug_id);
                             let mut alloc_guard =3D t_outdated.allocation.=
lock();
                             if let Some(alloc) =3D (*alloc_guard).as_mut()=
 {
                                 // Take the oneway node to prevent `Alloca=
tion::drop` from calling
--=20
2.55.0


