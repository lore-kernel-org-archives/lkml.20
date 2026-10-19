Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452898;
	b=rC6BGz+oe/MQTRNPh4kXRZPOPzGnaTx85xoSnravnOBUUP0MAUdfYiUXVtFCRUBz5ssZ
	 WA2eY+jeUechxMCdMSEl4aezzRGMVaV0dfrUCSeCILcJV2NcOduYxXf16I4uZnyGqdHlz
	 3lenBML+3liDP04OcpNb7+heft4jgaBlU0oktEGzjWFMJXIFgKdHQVtUBAz71obej1IsT
	 vpE/3lt0V2nIPtx1hOVt2ptBTyLHlFY55XvvVhAK18zmQeZ0ZF10MyVdxrNBCunYVRMtb
	 YmrT310dl5zRh1fnBfmFHgzjna1t1NNDWmlkzWRdYwefCA18tv1VVAHgaFWzYc4FORA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=jGwB2YpKzTsLsCyUbVgXall2WPAD+FiuQOyllj3FCWM=;
	b=203yEf9b1hCfBmL3/WdIYUPToLJlYrD0rr1D3MGdnxdS3yz9fEB5KY/WEd0YCd1qwS+6
	 K+CKgA9ZjdboWG7GYV7ZeqZAX1LWPUpyJmyj7jPN2NUI21mY3VAuSViD9fiJnW6bAf+6a
	 lnBDEjgj3R2FDFaY4kyT+qI5AzfuGGhNO4c7+qxXQVUyFdSsUudTRjBloP4L/6EwmACH5
	 jzX/a4upzrCbSMqVOre3P9tbH9FJzUPzj77VhzFbJIbWaOw6V0+zdT8DER81137KHRp3L
	 LOh1v/HombuPcHJMGXbA6ZG0aY5wSdFYPCzjmU6/SzFq9fOmsoLleL+ausmkobZMojA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FHFRpOka;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD330606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD330606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FHFRpOka
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-151ba226e1bso4327311c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792452892; x=1793057692; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGwB2YpKzTsLsCyUbVgXall2WPAD+FiuQOyllj3FCWM=;
        b=FHFRpOkaIICGRNcFLtRzeNK5rhYzA6+DvfeSZOTUBL2Boxb4Z2M/YZFBgtoxP3+v6c
         aSLh0ic4LtDI4r7zSVkDMH0KZOxrnLd+PZKk1Z20Lsa94z+STTaFR5H6PJBPR+W9hHzi
         0P3wi1hXX/3qjlqvaoaNTv3TUfeM1NjcIrIT9rMr8u48R2EPto1DajKVJrkF80bt7VJl
         e2pejN+r4YG3KsXeIkLIzn5F3Wu8igfOhZAxCvarxfu4fKzc0C4oMMPS0pguBY2bG39a
         vwYM5ijphT3TbE6NFfXgs2zKs5R7qm4j0H0RK4QwFj8YH3b5ZPC66zjg7SSXttpGarLQ
         0NvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452892; x=1793057692;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGwB2YpKzTsLsCyUbVgXall2WPAD+FiuQOyllj3FCWM=;
        b=U900QMjfIfJiKEml5vNRowsfbirGYHfLEjltND54QHTpKYGWbFpQoRqLsBs2C1jY8a
         pI7GB6JXxJ37Zh0wy0ARvo6989tzgG3o6gV2OS5f5m/Un27p1dX+NVutqJb9b/pobRZJ
         qLvlbrKNjRByCI62ggS0Z6iYYH6Ib3xuEv5w65BuL27DHrnFgURgQ/gGe1G0OEUNBQDZ
         Mptb+D+XLgV5R8y6inPKNhGMbR5VJP8JPHeCvEK7TwyG0d5pYYX54iGJtwTum6vmQrWH
         I60RSRthzu5SKF3hsKNbUnsrRESh14spjLlKH8hIZpM6xEa3PwDaIUfW4/Ho4u+ot4La
         +eWg==
X-Forwarded-Encrypted: i=1; AKwUvByqTo1YNUAjUqfYBGHGBz+sjYvmSnz75e09eojCLVSzxF4Mg0+eJVK1LMtxhUTadpFK6Ux+5EHj7l/gvA8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP38orkS88YzGiqn8aVTkqTihDhM7VcGYPktdgYVyLBTkUoLXU
	sQQAS2uSEwTuqnDBBrPTdUwen8jHLwWw0cRu5DtaiWWsqLgqu0QRsrHHdLvyHqq7JqIF+Q2tKc+
	qRxI/N70EDm1w2ZHrOTvPudGmYl/R3g==
X-Received: from dloo9.prod.google.com ([2002:a05:7023:a49:b0:165:ba5:ba2b])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:4189:b0:181:5cac:8f27 with SMTP id a92af1059eb24-1876658f64amr14367338c88.35.1792452891323;
 Mon, 19 Oct 2026 16:34:51 -0700 (PDT)
Date: Mon, 19 Oct 2026 23:34:38 +0000
In-Reply-To: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2115; i=samitolvanen@google.com;
 h=from:subject:message-id; bh=p5U1adkcwaI6ibDBmAfxywKhSDWSVuWmXkCqpHz9YZ8=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFnXVoqtTc4Xnx1kdd/zrVinptqVnxlVkydJTO1Y59rBa
 P6JyedNRykLgxgXg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZjIpFOMDA9UV7cLd7ZeCZg4
 947UWbsd1R1/hHqTVfas7DnLZiSucIbhr+RTjbzXCSlWskZPvlzj7Wf/Hsu18+jczVN37z3y7r9 lGwcA
X-Mailer: b4 0.14.3
Message-ID: <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
Subject: [PATCH 2/3] rust: hrtimer: declare cfi_encoding for hrtimer_restart
From: Sami Tolvanen <samitolvanen@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="utf-8"

The hrtimer callbacks return bindings::hrtimer_restart, which bindgen
generates as c_uint. C calls them through hrtimer->function, which
returns enum hrtimer_restart. kCFI encodes enum types by name even with
integer normalization, so the type ids never match and every call fails
the CFI check.

Generate hrtimer_restart as a newtype with a cfi_encoding, as is done
for lru_status, and adapt HrTimerRestart to the newtype.

Fixes: 8a8afe9349fb ("rust: hrtimer: introduce hrtimer support")
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 rust/bindgen_parameters     | 2 ++
 rust/kernel/time/hrtimer.rs | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 5059cc74cb3c..6003d5127676 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -27,6 +27,8 @@
 --opaque-type spinlock
 
 # enums that appear in indirect function calls should specify a cfi type
+--newtype-enum hrtimer_restart
+--with-attribute-custom-enum=hrtimer_restart='#[cfi_encoding="15hrtimer_restart"]'
 --newtype-enum irqreturn
 --with-attribute-custom-enum=irqreturn='#[cfi_encoding="9irqreturn"]'
 --newtype-enum lru_status
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 2d7f1131a813..07344ed5fbd5 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -834,14 +834,14 @@ unsafe fn start(this: *const Self, expires: <Self::TimerMode as HrTimerMode>::Ex
 #[repr(u32)]
 pub enum HrTimerRestart {
     /// Timer should not be restarted.
-    NoRestart = bindings::hrtimer_restart_HRTIMER_NORESTART,
+    NoRestart = bindings::hrtimer_restart::HRTIMER_NORESTART.0,
     /// Timer should be restarted.
-    Restart = bindings::hrtimer_restart_HRTIMER_RESTART,
+    Restart = bindings::hrtimer_restart::HRTIMER_RESTART.0,
 }
 
 impl HrTimerRestart {
     fn into_c(self) -> bindings::hrtimer_restart {
-        self as bindings::hrtimer_restart
+        bindings::hrtimer_restart(self as c_uint)
     }
 }
 

-- 
2.56.0.212.g129ede20d9-goog

