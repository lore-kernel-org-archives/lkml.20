Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0BE3E6DD0
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513825; cv=none; b=mr9KUhBpUECTL3g6GmAjqbjfNT3XWrpIqIPgim9uCw/pWGfb4vx0rKuDFPAzfFZaj4XDa9GokRqbkzJW9M8VusX9p25aMkKIiUUfG16BTWkWTuayy9R2Q1/aIcBChkUtvaPIBL3sit8SQ36W/ySk46yhm2jnUnFtwJ93PrLPG2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513825; c=relaxed/simple;
	bh=KFZLHeW4QWq63AQsoHgQ8Ad8reEYWl+8y5c8wWJkQd0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UrPAoTSFZ9iLVAA3DEOFuno7QD+f+Saw7Q6mNi9BNL5jEpkxSyHvbJBCmnwJEjRaBI1tRLsncd3hrIdBTHEpuQaRisb2w4IsHXfEyN9RXxGNEtkNeiU5TmwhZDouP4Xim1upA/0N3iDL6H6Do8hoyvQqpfU7nyoBLMgsXt5lg1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Lychuylj; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Lychuylj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=mzrykso4qrd5bkozswvj4hw3gy.protonmail2; t=1790513820;
	x=1790773020; bh=giD9bG5c0BlvLJRqS+3cfs+C0yabAQ/w20zcMODeHf4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LychuyljJu/9mKXtAi/aTVNTmhGxEL2lTLBRpC+GbTD/M9y+molQw3narb3lcpqKh
	 oyLEi1kT+0HwyzGu3QPSqzjr4kA1mQzSe1O0DNYTGam2ugnvyBheF2CMbrQxjdBxY7
	 2rKgqseGuEvhY7US5q+4Ny4DdywL03FP56oDnRS9pCghdQRJcsDmKjaxKK8og2/LLG
	 agf/LAnONUXrguTbovcn9T9N660Zx2z2AFYg06pCb2EczQJ42/GibxW0jF4rlQ1jVB
	 JvY35Dl3CxJ850/myH7uBHQiIBLn7h29UA0Kzfm6HbTf5FqJ73wLM62e+hnZZVP+Vj
	 K/Ol+hGeGgTCA==
Date: Sun, 27 Sep 2026 12:56:55 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Sagar Taunk <sagartaunk@proton.me>
Subject: [PATCH 3/4] rust_binder: thread: wire up `transaction_buffer` `alloc/release` tracepoints
Message-ID: <20260927125622.676342-4-sagartaunk@proton.me>
In-Reply-To: <20260927125622.676342-1-sagartaunk@proton.me>
References: <20260927125622.676342-1-sagartaunk@proton.me>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: c4894d762723a5d05d90031686f9fa2bd79a3db3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Call `trace_transaction_alloc_buf()` right after a transaction buffer
is successfully allocated in `copy_transaction_data()`, and call
`trace_transaction_buffer_release()` when a buffer is freed via
`BC_FREE_BUFFER` in `Thread::write()`.

Signed-off-by: Sagar Taunk <sagartaunk@proton.me>
---
 drivers/android/binder/thread.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thre=
ad.rs
index 18a14aa8a835..9678c0decc7f 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -30,6 +30,7 @@
     process::{GetWorkOrRegister, Process},
     ptr_align,
     stats::GLOBAL_STATS,
+    trace::{trace_transaction_alloc_buf, trace_transaction_buffer_release}=
,
     transaction::{Transaction, TransactionFlag, TransactionFlags, Transact=
ionInfo},
     BinderReturnWriter, DArc, DLArc, DTRWrap, DeliverCode, DeliverToRead,
 };
@@ -1046,6 +1047,8 @@ pub(crate) fn copy_transaction_data(
             }
         };
=20
+        trace_transaction_alloc_buf(debug_id, data_size, offsets_size, buf=
fers_size);
+
         let mut buffer_reader =3D UserSlice::new(info.data_ptr, data_size)=
.reader();
         let mut end_of_previous_object =3D 0;
         let mut sg_state =3D None;
@@ -1483,6 +1486,7 @@ fn write(self: &Arc<Self>, req: &mut BinderWriteRead)=
 -> Result {
                         if buffer.looper_need_return_on_free() {
                             self.inner.lock().looper_need_return =3D true;
                         }
+                        trace_transaction_buffer_release(buffer.debug_id);
                         drop(buffer);
                     }
                 }
--=20
2.55.0


