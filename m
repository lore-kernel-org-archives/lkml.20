Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA68F3EC83F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513822; cv=none; b=CRdEuy4AmRVlsMd84pKWj9Glk9XnzXNnTyiSDMKFcSjMxx8Hoox/5lowoGgCJmt5Vv2HYHLt3/S9sNNQKZJd0n6IqRwYSMzi7dSGxuQxUZzBbu5i64femg5O/3glyw/X7ZTN8dLTS2SFLyUFp/3vRu+VzZqfr++nGYe31Ebg8B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513822; c=relaxed/simple;
	bh=yqi2kteooyBx8ThccKoW7isdxwBj34xqtU88ic+sIjc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LkBjFgqJ7PZVa+F67D9dD03ZzEl/AadoPcPOthsr48ABd+9hO2RTEcBjQkZydKcQBKImS4xcTBkRpbkwu5vf6yLaI8nQUpTzI7KLMT/A3SrcsNqCfxrRWD5uSIzbC1wf6uU1QX52xKjxks8yYL12hp46wy+G2MR/1SWa8A9epHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=LQbVQB5n; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="LQbVQB5n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1790513812; x=1790773012;
	bh=Wm2ZWUfojZW+vr2jQnG1aCWOUTbBYK8lSYI/HQe4UJg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LQbVQB5nkDcuwA/Qd5awOiDES98Yx0dUh44m1Kta4/4FST+x8lBW6DjJI4JsLYePQ
	 H8iuyHZBW4bBqrTELuVtKE++EgVjFdoyxb8iumkrLdE9VlZRe/Q8NklXrCAOIw1Tbl
	 hjDD8yuOm0IDn3HNsYMq/QncHyp3Nln0NVWw/12+yJsy7xkkrrEn1PNTz5/2zkveI0
	 PFwaFcU1GidxEalEa18yULD547/G1j8VlERTKFmI4HJxsn6SFXs0Lt2kYvdNhSO6qg
	 JCYABcpK1BysglR8P3ohUP92+t3xVSXFXJue6IZEcqiKR/m/vovWgcK7IvtwKOUOdW
	 JA28uPv+WXKAg==
Date: Sun, 27 Sep 2026 12:56:45 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Sagar Taunk <sagartaunk@proton.me>
Subject: [PATCH 2/4] rust_binder: allocation: call trace_transaction_failed_buffer_release()
Message-ID: <20260927125622.676342-3-sagartaunk@proton.me>
In-Reply-To: <20260927125622.676342-1-sagartaunk@proton.me>
References: <20260927125622.676342-1-sagartaunk@proton.me>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: a81ea9c56adf59e1d9315a9c165afc23eb3ad5b4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Call `trace_transaction_failed_buffer_release()` when transaction
fails in `NewAllocation`'s destructor. This provides visibility into
the failed buffer releases.

Signed-off-by: Sagar Taunk <sagartaunk@proton.me>
---
 drivers/android/binder/allocation.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/=
allocation.rs
index 165cb797eb1e..f14c70a07dd2 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -20,6 +20,7 @@
     defs::*,
     node::{Node, NodeRef},
     process::Process,
+    trace::trace_transaction_failed_buffer_release,
     DArc,
 };
=20
@@ -325,6 +326,12 @@ fn deref_mut(&mut self) -> &mut Allocation {
     }
 }
=20
+impl Drop for NewAllocation {
+    fn drop(&mut self) {
+        trace_transaction_failed_buffer_release(self.debug_id);
+    }
+}
+
 /// A view into the beginning of an allocation.
 ///
 /// All attempts to read or write outside of the view will fail. To intent=
ionally access outside of
--=20
2.55.0


