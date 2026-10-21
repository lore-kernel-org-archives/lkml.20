Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582712;
	b=j0S27vDXPXnA/EJEqi3aV4flDH82+jxVyDNdM1ffO4ehCyjR8rYpnjuC38sWEs6do1s/
	 6ZrmqBpwrqMFvFUqCOKayn4uOKuUuH6PWNSWhzYHiW159uuY8hlHaOurb6R2/OEN50dIK
	 ot9Sj+DsD8kp+PY0AUxpytwHIZvMUZ8LcqzVjoMf+OJXgqY7fC+kQbi85QuekJF5GIS02
	 HwUPuyBK07wHGFA6AqKyC5RmXRuQZ3QfPqnkb8LOuJ1QG8huDf1OvMNTk2EHKVBMqYfyE
	 dtZdCPmvpvnktMmZbFl/gNH6xvMNzYgISB2tZFdlnpsUP8dsEhwJBUntuYmwa0TTwvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wWz643dbsj/ZlYo+epLXd9Iw2Mt+qid7bAcxch49zgs=;
	b=2TKp9mowcrJkLzsA5PymbiE3LoSqjaalqwCMa+Ty3m7cAaeAc84OUQ2i/WdlSz/nfxTH
	 /hgHeH4jPmk5EGDkfWrLozE2F8T1h/ekBCx0moLxMszoa3eO4Yi2RKvysfs1VmoEgxIDs
	 d6iUg76t/kYn5qDZ9C+K0NglxJXkec3xFNSlhDUJpycLvLq2ap7Y/8zQlHyB44xR5DMHg
	 xt0LJOnkQ7A9mYLpjwyORQh5DiyeBUsMkTO1HJ3oLQepg9dTzyeGROihvVqYRSQWgCb2d
	 vGKf7pkKd+KSBUFaXB5C2oKJEw/ekHPnMHErPxNnLb2qFaPumo3ymNwbswJKfqXyAyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=cJGv3AXp;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723B8606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 723B8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=cJGv3AXp
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so324389a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1792582712; x=1793187512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWz643dbsj/ZlYo+epLXd9Iw2Mt+qid7bAcxch49zgs=;
        b=cJGv3AXpnzoDMycDhzUQcXIqU+devmFsnBPW6LT9HviQ80FIvQmkYWpFHd13GosVs2
         cr4JCxpb4H4em4AJmgcJRsuojb+4lNxFjtK8D7tPdQD2etqm4rxd3IUV2taS52Bzc9Yw
         3FZAiD93Vwosw/TsDWpbjzwL3E6cPs4Ob23NgWRVHPwKQjmvijJjjUdggJQBnHftJ5bY
         ap01OxvPU9ubnYFda2OEqaIM5EGA6OXFBleHILh4KfexhdY8oUX7RLUwZTasWNLOxW0U
         LD8fYDIRFFxaM6wnd9SylhenQb5OcXwZwmDtBOhkPDKGJ+Y/HEdXpnIB4ro8tmxzPxNP
         eO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582712; x=1793187512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWz643dbsj/ZlYo+epLXd9Iw2Mt+qid7bAcxch49zgs=;
        b=uh4ml66Hq1QJHC4mLfcISIgosu8qv/MikZzRtsmvvdTbJM5NamM9eb73GjpGsC7JB/
         SMQ6Cn063McBUQ0rb7AJaWGV7Lznz5ifdBKThbMzLm5Cf/1/srJv1sKKlvcY2huXNluP
         Ig6PKdNtoyw9dkoRk/y0eF8QKOZpLxiW/SCfOiI6sFdAuzhLILam01yAR7mVYTj1DXdT
         K+bMXOuys/ywsY4RoYyX4OKacEOfGWTahdenddsQVWs1vYXmQiplBXMAG+FZ8BacnzM0
         /awkeBe8rjbPHGFsstc9blH+RoziZ+sVaaXv7KXKLV1oWYxq8YCVnb0vApXIwKJgsb19
         pDjg==
X-Forwarded-Encrypted: i=1; AKwUvBwW4ILdBUWxgRf5F0thg6xIILTFdHXjrwblmQBxBi2FK2aGQAM9on8IPnWtZKhl4kHzpiVcIsbKyqfBBPE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJp4UkFOhDLXJlfiTZFDUwdQTaOE1pGAGG3SjhCJKh3phMqckw
	H/KuovCjoyEEoRsz+T8kMMuZyfFz5+HhRAjeaO2AzDJeBqVUlMHXFMmhwYGLNeXUQw==
X-Gm-Gg: AYBFou07clOZdWCnyPgNuLCV/nNuS8y4c9PVA9dkD7gvwF/qPVuMzBNEt/Yb9KFWdyN
	L0t8Xc4S0E/11ZdVGU2P6dD6lHgvTyyFfuP5SNTXeGwLI1zSGsxMAo7sfxrC7Jkp7ttcrquymOT
	PpwjuMkquBLNpfTZyHBw6t9r+TjFXc3Kk9R7ga/N95B6bozE5lQv+WDmuEtieCAtNDkrhGQVq9U
	jvLsLwVI5kdDLy7m+IMLV14DlSjeQXH5i7cSudQpGDd5+mKOOwESXcPDWtLYy18k5OzozH/SPz2
	1p0/dfZtBfl/edCA4l3s8JS8wNdXOt4tgJTv7ZW1tDzqVdpXwO/1iLTZR8P0yWt7qUpYzvKJDYK
	tkAhNojpfKcOB+u0QvQBxsJeWt/grTX7l80+SLHmAjhtzW8vPqtb5CBhuAl7LXtszXk9xuFQDgX
	d+tzblOg/gVQpEYX1hI0HVzoX/9gOwez3xIzxNC9/1Y2AwOdwetlCeKlAFs0kIod9soyGFbxHu3
	+T6mZy3GlSVeNYytAHOHIjicU619JEuvwLR6e7+wY4YmFU4476x8u+UF4bAFLLw0OVZ
X-Received: by 2002:a17:90b:1348:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-3ad86c8f9eemr895764a91.0.1792582711694;
        Wed, 21 Oct 2026 04:38:31 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813eb9casm4023732a91.15.2026.10.21.04.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:38:30 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Wed, 21 Oct 2026 17:07:50 +0530
Subject: [PATCH v4 2/6] rust: crc_ccitt: add CRC-CCITT abstraction
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-gb-uart-transport-v4-2-c308ce821d45@beagleboard.org>
References: <20261021-gb-uart-transport-v4-0-c308ce821d45@beagleboard.org>
In-Reply-To: <20261021-gb-uart-transport-v4-0-c308ce821d45@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Markus Probst <markus.probst@posteo.de>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3228; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=0tQbZbHo8xI21dpA2bFknxB1c/WDEfciyAdGxnoZAag=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBq2KQTQnIftl+noEjMJ8/XEZ9Vw9FJN+PHvbr0D
 EGbn4VaEriJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCatikEwAKCRAFzvXHieVa
 dE0TD/9d1fp4dvMbYCOl3n2qgYzevhGpBPpkCPYapWpVAxTE5M8PjQkmlR29Aeth1obsL27ttVh
 WQvbmzZv8KCIzdbhG1R0fV0h9ZAy0c1MK/h2yhmtq2mh2Llx0kyvx9LFd8slNm6ShiL5KjYNnxb
 sqf33Ehp+eFPkR5rfD3ylQp2tnFLd91RYYO2+0logX9I0jaFJ/bcwvonOM4spZcM3zQtUegH0R9
 2JzfYvcpcn4c3zGxl3Bb0RBd8CF+aOPb6s6MqDC9ODOr9XKyO62bZmPbbOFad6mZ5mS6CqCzUYX
 wW2ukfojE7BLnHx7vMPb2W3cFi41gK8hjPsykvfGldN4PpRDUWWSidrMFFwVt7QzOWsbgoIK2gF
 1azyIH2bBi/rUcyctDvN5m0Lx7gNZyTtoAwMAZpy/tPvldsT3f5pineT1NysKg1td1OPvcwwxkj
 sTJjwS8C0ftNelnP4AeXAbew/jG/wIqx+FbskVRC7Ws+I7FQ9lSosFsrP10f9up3mZ8RjxsM4NG
 Lu5JRAJTa/z7raBgKYVXkQAXYUp7Mf/xHii/l0q5R6CFAIT+w8c/rWE29rpk7QafNRHhFMY8/0m
 DbshmxQO9B+Lv6YJcDf2VQzHLQ3hUYqhM/KrYCIWi3eCkZWH2aNQ+NIQDJJMIYeHALmtRMq8T7Q
 xkYmrZPrVWfDZYw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

The module is gated behind the new RUST_CRC_CCITT_ABSTRACTIONS Kconfig
symbol, which selects CRC_CCITT, so the C library is only built when a
Rust user actually needs it.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 MAINTAINERS                     |  1 +
 lib/crc/Kconfig                 |  7 +++++++
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/crc_ccitt.rs        | 26 ++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  2 ++
 5 files changed, 37 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 252b6d7ee163..772023e0e5a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7036,6 +7036,7 @@ T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-ne
 F:	Documentation/staging/crc*
 F:	include/linux/crc*
 F:	lib/crc/
+F:	rust/kernel/crc*
 F:	scripts/gen-crc-consts.py
 
 CREATIVE SB0540
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index 927fc6a6b2b9..628da2d30fc8 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -32,6 +32,13 @@ config CRC_CCITT
 	  The CRC-CCITT library functions.  Select this if your module uses any
 	  of the functions from <linux/crc-ccitt.h>.
 
+config RUST_CRC_CCITT_ABSTRACTIONS
+	bool
+	depends on RUST
+	select CRC_CCITT
+	help
+	  This enables the Rust abstraction for the CRC-CCITT API.
+
 config CRC_ITU_T
 	tristate
 	help
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3791af0aadc7..55d1a2d7655a 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -49,6 +49,7 @@
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
 #include <linux/cpumask.h>
+#include <linux/crc-ccitt.h>
 #include <linux/cred.h>
 #include <linux/debugfs.h>
 #include <linux/device/faux.h>
diff --git a/rust/kernel/crc_ccitt.rs b/rust/kernel/crc_ccitt.rs
new file mode 100644
index 000000000000..6042ada16967
--- /dev/null
+++ b/rust/kernel/crc_ccitt.rs
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! CRC-CCITT computation.
+//!
+//! C header: [`include/linux/crc-ccitt.h`](srctree/include/linux/crc-ccitt.h)
+
+/// Computes the CRC-CCITT of `data`, starting from the seed value `crc`.
+///
+/// Pass the result back in as `crc` to compute the checksum of a buffer
+/// incrementally.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::crc_ccitt::crc_ccitt;
+///
+/// let one_shot = crc_ccitt(0xffff, b"hello world");
+/// let split = crc_ccitt(crc_ccitt(0xffff, b"hello "), b"world");
+/// assert_eq!(one_shot, split);
+/// ```
+#[inline]
+pub fn crc_ccitt(crc: u16, data: &[u8]) -> u16 {
+    // SAFETY: `data.as_ptr()` is valid for reads of `data.len()` bytes for the
+    // duration of the call, since it is derived from a live shared slice.
+    unsafe { bindings::crc_ccitt(crc, data.as_ptr(), data.len()) }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f9ef36217bb5..637442761d34 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -61,6 +61,8 @@
 #[cfg(CONFIG_CPU_FREQ)]
 pub mod cpufreq;
 pub mod cpumask;
+#[cfg(CONFIG_RUST_CRC_CCITT_ABSTRACTIONS)]
+pub mod crc_ccitt;
 pub mod cred;
 pub mod debugfs;
 pub mod device;

-- 
2.56.0

