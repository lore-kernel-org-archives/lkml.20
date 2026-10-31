Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793459352;
	b=mubOGWReV+1+3ASSix/b1WUXuAJlYz6jCJCJQXg2I6P8Dql32L5TM4xynL6SHJgIWSlx
	 f+V3TLTDGGrfzC5ZwVC6oRb03YD7Za0DSsCzUwzTNwBSvgL1f/Sm6YTQcu0JsVAPpdC+8
	 q993xnwFJqV3O0xHXWeSSd+XdSjVZwIbusbRg65qv6/MtIcMwAhcA16ejihV1K94czJMx
	 YeYQnMJm3G/WaAuuOZLDsPAWWexkZCvnR2X0ipNB+cBWpifFmiDt9M4F99q8KiJYzUo9y
	 tk9sUePOTNMeQUwdI6lcQGLSGiE9dDaUgh6i3e4jr6DakpLch01tg9p0244sq1E/Ocw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793459352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ApMb2OflRcC0/PUCQmOZRkYrswz1sWG1q4LSGSHVWsg=;
	b=cINEwYbhi0PC1+i4uuuVIUCcdcSkVZg0uPsCLPPS1GJEZaf2QtkJJD9fb7lufwBvT0kV
	 dRK1G5spwTT+iN50cp0kLSQSNjWiVONOkZ576WwjyOqaIJS+GfLCe0iis3Wkfm5WSiHEl
	 Tfr7OsxwZepSorAMsMNgYu8+XioyJTtj0FW58vwZWNHXOTUTgnGQYhYwUaCoFiku8SSK7
	 1bxwKRDrwg3A8bs/uRMYLY4MkPYwiFao7TeNg2mHrclEU+6q4xoigRb2IvwGSlPWlNp1y
	 irX5R1PvH8tY6hcw29Wk3muPbyyHvA1Hj6ZP+cLTv4vtl0XOgrqLtkFBH4JjAQDNF6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N3j6jHYp;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B551E606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B551E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N3j6jHYp
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso2169277a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793459351; x=1794064151; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ApMb2OflRcC0/PUCQmOZRkYrswz1sWG1q4LSGSHVWsg=;
        b=N3j6jHYpiN52cT5kPDX5allt+nss6IZSBp0823jLijcPDlMzGwUKnMCcgBxrFsMUFN
         ghHe4bLL5I9IYiKN+e0gE6wMWBApC4GwhMc5/fG7fiuGugFEj4BKR6msqzGOY1wIeHMb
         W+DMMaMwpzsYysvYAIu3z4ndvWZM3W7syHf42IsNXpz2JwVeWRCmo1nkt//GrGZ7CA43
         C0+GXb0HTT0DSDp0HPdLg1trebseB37Jb4o9wHhViuCpscetlWw5J/6v4RXZAruISIER
         2AtDkOlSDvxJic9Ii1/yfKODlfeXU0BC7ldAUVjky1LuMK/BKIb3rHJCLLabQXFzfUds
         vQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793459351; x=1794064151;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApMb2OflRcC0/PUCQmOZRkYrswz1sWG1q4LSGSHVWsg=;
        b=RtRKhYwcm9GbUzqFp5P/WWeW+P0Ka/mh4jaft2F7EF7SsWFPBB5t4ckxhhVCTWzlPd
         nVhIoyvlhBCsLQq1829thOJ3esGc8UxlGSqoXk1Xp2g3XOWv6WsRMlZRsaS5ZAw++mVe
         3gGeqHNwrYnCc2xkv9kYh5STueSTaqNEWjKEvnV5hS3yWNyufguBTQ9hCMKJUpv134TW
         0Q1ulU2KtNRLRTfO09n74cNlGbuQi1ZOnLS3MPzp9pPeC93OzOTaQO2aqKMcHWSGmjFK
         PQYfLcwId/MgxVTNjvVcF8mRJvZlVrwLX2IT0zYB8/+4sFeELexmRiMdM2Zcz7nYCcZ+
         8WSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC2PLCl0DC3hiDKxrYW3unteR0Zm8WWoJjNLxvB78coVpLbeZZI+Km+rLzd/UElaMOikCpqjZUjMMaL2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOlVnPf38k1htxf2U+8rPXGeFbehdyfh48EgYtiFoUexLOZqSr
	8HuXzg1aZAC9h5SHTvHmt3q5TSaO0JhgVPo/b7B/pIg+moxHSB4gwnwDm91oBgpf4Kpp2O5ruxF
	M4iAnWCW0YJuxHexRoNIjlA==
X-Received: from pgww14.prod.google.com ([2002:a05:6a02:2c8e:b0:cc7:a092:edd9])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2d0c:b0:3ac:8ee9:c8ed with SMTP id 98e67ed59e1d1-3ae897eb0b1mr4777450a91.13.1793459350901;
 Sat, 31 Oct 2026 08:09:10 -0700 (PDT)
Date: Sat, 31 Oct 2026 15:09:09 +0000
In-Reply-To: <20261031030801.4100693-1-jenhaochen@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261031030801.4100693-1-jenhaochen@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261031150909.3807811-1-jenhaochen@google.com>
Subject: [PATCH v2] rust_binder: use Atomic::add() in BinderStats
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

Reviewed-by: Boqun Feng <boqun@kernel.org>
Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: Jenhao Chen <jenhaochen@google.com>
---
Changes in v2:
- Drop "No functional change intended." from commit description (Boqun Feng).
- Collect Reviewed-by tags from Boqun Feng and FUJITA Tomonori.
- Link to v1: https://lore.kernel.org/r/20261031030801.4100693-1-jenhaochen@google.com/

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
