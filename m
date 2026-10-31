Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793416085;
	b=yBDEnylrJfsaW+YgiiUedajKBPhJGhjCXy1TO4ygK1SBl1GcgAPzw2F99ynu08YcaA+N
	 Lc0V6P+VDTFSHRd12WTtTVVo7fdt/CaFIWib2x/LvgY5Fy3Rq543hSK8jrGgQ7IEXUzVQ
	 5ku8T3rWdhWAT+/8dNWr6tbMul3euVjz8rISLl5vI+oxuAvLGFC2NJjrAZGGeSkIrRJEe
	 b3BvDfaTFPwFYsqRIuNtZxjQtPn2XcsVR2Kp5oJz2ULYw1gPYp7W4a7txkBe+wqGBjXMY
	 G/C8mO9YP8Y4QB5clfSTeFttY/7Xe3o4BXKTy/z675Tej0rE68JClX1npGHcYrz6bGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793416085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=o1FEkdA5FmB+YAQJAjjfHQSd/ZADRSwbH+6EouZmhfo=;
	b=voCClY7MoJ9HWOGzuECAE0E/Q9FWCjDUccRK+mrsOsVgAZQHGGSZbApDTM4Mai51wBLf
	 lGINTyYq1HPmwh7zX0IWNipLzweLiGRHisI4b00QPAro/tiP/ks6gAWdorLDihFmQRg79
	 2JdtlgjofQBfhtXk+9hvojYzyqdFDpfB4XpcNzpFeb6UXRSv6wfEMsyq9zFUkwbzYTrVW
	 v8Mr1/WI/HyUtgphSMAn3GUyp2pJVXVBoFeaYEVa0yWePNTiwN3ZB4r+z70edlVQLGdaO
	 KOVtrnEAreXF4J2/J0ezhOAd5UZjkYofsTExCTGpOvUmie6iCE/Nk9LIgFC+qywo8zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="QlV/qh5n";
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB90606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB90606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QlV/qh5n
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1663fb7e005so1611689c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793416084; x=1794020884; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o1FEkdA5FmB+YAQJAjjfHQSd/ZADRSwbH+6EouZmhfo=;
        b=QlV/qh5nuwjJSVPmqCiy6TZK3xq6czlH+3GBteMaXm7j2/n14rVRVuPRp2dzJt9NdZ
         7BJHgz9Bc/h5DctKdcZUvocJEyDzz0L5QEPmmfUS5unb46ZKXb9MfRYC+UNtpapnanyC
         a8zJYzVu3YVw77Z6FM2r99kuE7aP9vaJF3jnHb3igy48pTlQrO64hb91NonWE4PdyKBZ
         jYWkZXaI0NjufX6jKw+6+Joq/tEMD88lYGxoq5Gdt3jhpwcg7r8dr2ky5dGAJy9fzEzQ
         k//Yt3GaaGYOqKyyYIVFCl+fi7S/UoX81d5q7UuJnvgcBP8P4uEcIIH0EBosOXuQBBH0
         2lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793416084; x=1794020884;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o1FEkdA5FmB+YAQJAjjfHQSd/ZADRSwbH+6EouZmhfo=;
        b=GgenO/L4qp7kRK7fyihKZQpnyBROml+ssklO6H3UM5cPB0KhYiWkVYbVsUvrhD7l02
         R6g/zNxAwq3USGUJVQ4XrgnyfHi4H0ovPR7nS70r18pEPKkc7WiogQKCplngg+fiyxEk
         NETCop2VfKDWj7EKNVy9vSix+L1zQG9NO6cJQYRlAraBadeydHoNEu2zTgE+tH3P7U69
         hP1A0PgAQa7Y3pXIW8pYyB7wO5M9/Tah90mdgJe+2X4AsR8uU+GHC/w20UvFJF84VOQ5
         mf4YWK1ssaWoL3Eq2W7tOT5MbWSDWhYkXv4420/HdsyosPoBOinCT+kELoB8zQOAtHMs
         I5uw==
X-Forwarded-Encrypted: i=1; AKwUvByt/FOPzbL/O5AI6PMdhlS8zVYWvKUF3R99MbQdtGVnxA2jE8TZI1U+9QcyY9nZq8E7Mj9fXwOg18GOA7E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmf8t+IlIJDyoqL8ZHEs/5lvYHUyj0mfztcOquONva0EBimeIq
	5+V9qRB0jvp3r4opyOdJFlzvhGMDXTu/1VGqQbldK0sknrLBjIZ6pJF2Ye19wR5TYAeoKklz96L
	Q7l7eyxFOwc7oP//N3kUNCg==
X-Received: from dlan17-n2.prod.google.com ([2002:a05:7022:eb51:20b0:1a7:7e65:9dcb])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:b887:b0:143:2719:f800 with SMTP id a92af1059eb24-1ac5f742576mr5088128c88.40.1793416083588;
 Fri, 30 Oct 2026 20:08:03 -0700 (PDT)
Date: Sat, 31 Oct 2026 03:08:01 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261031030801.4100693-1-jenhaochen@google.com>
Subject: [PATCH] rust_binder: use Atomic::add() in BinderStats
From: Jenhao Chen <jenhaochen@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Qais Yousef <qyousef@google.com>, Ben Wei <benwei@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

BinderStats::inc_bc() and BinderStats::inc_br() increment command and
return statistics counters on every Binder transaction and reply using
Atomic::fetch_add(1, Relaxed), discarding the returned previous value.

Because the return value of fetch_add() is unused in Rust but must still
be produced by the underlying value-returning atomic RMW helper
(atomic_fetch_add_relaxed()), the compiler is forced to emit a
value-returning atomic operation (LDADD on arm64 with LSE, or LOCK XADD
on x86) instead of a non-value-returning atomic add (STADD on arm64, or
LOCK ADD on x86). On arm64 CPUs with LSE, value-returning LDADD requires
a round-trip response from the L2/interconnect to populate the
destination register, whereas non-value-returning STADD (encoded as
LDADD with WZR as the destination register) may be executed as a far
atomic without waiting for the old value to return to the core.

Switch BinderStats::inc_bc() and BinderStats::inc_br() from
fetch_add(1, Relaxed) to add(1, Relaxed) so they lower to atomic_add()
and emit non-value-returning atomic increments. This also matches the C
Binder driver, which uses atomic_inc() for these statistics counters in
binder_thread_write() and binder_stat_br().

No functional change intended.

Signed-off-by: Jenhao Chen <jenhaochen@google.com>
---
 drivers/android/binder/stats.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/stats.rs b/drivers/android/binder/stats.rs
index ec81dc7747db..68cb0cf48865 100644
--- a/drivers/android/binder/stats.rs
+++ b/drivers/android/binder/stats.rs
@@ -32,14 +32,14 @@ impl BinderStats {
     pub(crate) fn inc_bc(&self, bc: u32) {
         let idx = _IOC_NR(bc) as usize;
         if let Some(bc_ref) = self.bc.get(idx) {
-            bc_ref.fetch_add(1, Relaxed);
+            bc_ref.add(1, Relaxed);
         }
     }
 
     pub(crate) fn inc_br(&self, br: u32) {
         let idx = _IOC_NR(br) as usize;
         if let Some(br_ref) = self.br.get(idx) {
-            br_ref.fetch_add(1, Relaxed);
+            br_ref.add(1, Relaxed);
         }
     }
 
-- 
2.56.0.317.g454f8302e1-goog

