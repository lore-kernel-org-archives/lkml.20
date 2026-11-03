Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722400;
	b=EvZaiefXCEp7gg8xOzgYcNPnO+iRGVjAvE6uNsFJcikMn6Th+3ulUlzNwthbUMYjtry4
	 nqCaI4QmxPosNCYDzsko/FF1HE0f/K5BVuOFqCcK0+LiGyaSuZ3wSwlahhej7c0DcRhkW
	 8d8pfaw1MYSt71W0N4OGJwEa91tvZDkPEfoFUEhQgYN7hq5SbCEHJXVWoxKI7zoZlgb8m
	 TZ06J9+FyZbRwTDuApFie0jxwmD5vAs+euF97I6RjDK5DK9D2HojXNgfX8Wm+/rmBhVBp
	 hJqQvTA4FQmHyyXh/OhJ+C0ODgtyZyglLtger3sBYMCetDVJohucAHzUbKh7gX3FKew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wWz643dbsj/ZlYo+epLXd9Iw2Mt+qid7bAcxch49zgs=;
	b=fmWONVZZAtLe6xf+bS8Ung6xLTT/DBTn01exgRv3bfVFcL0aw3KUL4pzInmKIc8iYTHE
	 uXqlQBMXCdXmjsbeJUgdqqFhwgxDlCFhtHDqOCxCAQf0qT9Ibr+hFmnHaPbLIEprEl7N4
	 BH22FDnUk54RJf4PijfQD5kxjKdMaH6muaTz3g9j5ZpIBhQ8nLkT6Nzc7hr0NEHVHQA2Z
	 Dnr4dXZjfjxjseUK9iSoT/S4ep6ZnP8qp0WMB7spQhDHn6drGfG3fgMcpftmkm8fkal3x
	 qSf7sGBRA9j7QbCmi7HrR0G9T0snGQvRQQyiSFAZ4uvcUofBhtbVef9v0TONAfz218g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=StUgSqvG;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E167608363A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E167608363A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=StUgSqvG
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a3c08d6928so5545123c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1793722398; x=1794327198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWz643dbsj/ZlYo+epLXd9Iw2Mt+qid7bAcxch49zgs=;
        b=StUgSqvGx+PN4GWlGASt0ZFhCnxPkfU/ta7LXI8aXfwBZyp8ApPK+MS3lOZgL71gj0
         rGDSW1EDnQOsu0HtCIB0TS3cLcvJOa0jHLxigPEC8Z26WaSlw4uX7eLoW352EyAtT+s7
         vzsAexLLzZ3oqbAzqfAZU3Rwepu/az3RtD5b0aqNKr/XuGvJrDKZRszWWdwRL4IQ7Q/x
         6hmQtpQbce8zK3mtUTlmRHW4xqIvomsIObsZ92FY/DR+H8M6BSJG75e34X9rsQngvdI8
         CRZ6yF9Y2OyyVl2L8Ty8QG3xsJ30/gAidtlRTtPRIKJlFSTyZNT6n9//XIAsiO72D6sO
         c9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722398; x=1794327198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWz643dbsj/ZlYo+epLXd9Iw2Mt+qid7bAcxch49zgs=;
        b=DUsYAG9PvzrTtKwxOeBcpCM6iAhdLX2zXCey9ME9B87w2PwdcclInHilwahd7TmiCQ
         g/YeQ4XsKjpSIYvmdcg4/cAE5eRY7jMo2ORK8Jbbk+pcsKoCo3fd+9dvfjiGG387k+tA
         dOKPy7F6WVoiIZg+tovz3EdbobWNvVREplU+MvL1sBzEItGGb2ZiS5iHCjL4gxAwqPOq
         zZyQtD4SdOYXcQ1erfJ+BB4uXqDLUiWJLalRa46g7WvbXHghrhduQGyfyR2N9gcGAe8w
         7EoH8pwL6Np/ryRL4hyHcgGW4jY0FW7oetSVOOaOfsijsbUjtGsuQfi6ddgabK8ZA5SI
         jrEQ==
X-Forwarded-Encrypted: i=1; AKwUvByvwz/P6GDVjGEKV7Xx9cxMoL4q14vp9AfISq+VWiB4+pBkx3dexafW39Z/EG0X55tMaY5VtLYYtzAlU98=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OE7nQQSbGmxpZLvglm61iuABkv5KP71tRM69M03VHbFbiwjHY
	81weSkUuflfJCs07D0O0ojzhXb0/pkcC9PGCLmtf9rhwbAG4nGCVkt3kBoeIR4WU0Q==
X-Gm-Gg: AYBFou28wvdPPn1DiwbodoBwxZBWyFGe5Zi0sVmBbGiaBuvEPI7eazj52BAIqLOqInR
	ZD0vDFQ2Bi6Sz7cmi/NnG6sKWqYueNiUgi/i7/38D5iOVzdscXmMdNpQSyQ5NZQJtSoKuLyaCZU
	JWlSuZ7zjPPZpHdC1odY/pmLAk4p56EyUVUN4H9VZ4wAHjNN8eadDw8nd9fwRG19q0MQvc8qztM
	vELTcZoqBbcXvy1JIaDPOTYXYedKCDRqv1y1ZCQOEXa0unIUg5v8M7IJvTlOPmsBHbBXzE0s8u2
	kiKIetMJO7Ji3RelwjlRLJG3klH07742jE+LNZhpfOPihaMzSxt93nAxE7GapLQJvsOL+mwnl1Q
	ROuf/w/bf5IaZua5uG5f4IX6JiUW5juYOIe0W5KmxV2l7S6uHSvwblbWBX4ZUC6PQJdx2EKhSP4
	P6s0DpyV6a1XWE/xY3eWAPv9dbn6842KDsi/ihdlP3OZJ3cYbJtx8bhuCbhI7wq4vbw+v1XiTEF
	W7qwB2qsPOD7zRXXLuUAiGshRsDjq90S6A6WWdEKJuaUo2LcUJ/dedw9cLelOPLpJoVAzGAYu8u
	UOUwnYore2HWAZVqOm5RUIFNpKXAkctjnZRBnpNC
X-Received: by 2002:a05:701b:4248:20b0:191:3c:aae7 with SMTP id a92af1059eb24-1ac5c64cb0emr21210142c88.26.1793722398223;
        Tue, 03 Nov 2026 08:13:18 -0800 (PST)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm47214021eec.6.2026.11.03.08.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:13:17 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 03 Nov 2026 21:41:52 +0530
Subject: [PATCH v5 5/9] rust: crc_ccitt: add CRC-CCITT abstraction
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
Message-Id: <20261103-gb-uart-transport-v5-5-f8e326d6561f@beagleboard.org>
References: <20261103-gb-uart-transport-v5-0-f8e326d6561f@beagleboard.org>
In-Reply-To: <20261103-gb-uart-transport-v5-0-f8e326d6561f@beagleboard.org>
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
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBq6gfgEajv6qnlQO0MwzBfWGAC30/mhzQRLpa0N
 zjhW++byS+JAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCauoH4AAKCRAFzvXHieVa
 dKIUEADO4HBzwBbsfV/fxA0i8rusLIV/+aq0NlWSzoEl/NaNe78WxtSXrEu57bIZA3qG+9L4krL
 eRgFmWxtelmCEF9EwphJm1GCGN1pPFs/tvt6xlPs9fqNdvb2/WSX2D/WJmVv+N+TwQVnmXo1X71
 k61RUFTVGdt/XnNmJfoKMJPkxknBspV21QUY7CPWM9x9m0PG22RmD4J95ouP8asAyByug5BoU4e
 Cg1FLF45CYPPMti5u0DvGX3m8Fpn6cC+BbwruTqnMm5f6Zhnrtd94uaQQVjs/Kmrwg2nVxPPC+d
 C6kR+c5hZ9wNFMnbO8p2DF74EnHMZXkMsq0ZbLkpU/A8yoWPiA0mrmkcgMnAl9mX74Fj7P1a69i
 DYLtg3gOJmNCV9RSDrlrV4Kdj9L34ZRsiAJWp4mVXMk3QmPFmMaefAdDmtRD3AkOIj3CJLYvSel
 tNR5qZmbJBxawtyqq3dfW8P037cBMc66HY3rnQLYTE8/SGZru9KR3t1uTBW9Nfs2BIEzomLvzT/
 5DzsGQD+pFXaUQZszqQWGUh0Cex7t2QUgR8lkEqK6ANZBAwvUdAa9Pb9Dyo6IXYMzC4mXJXsFaP
 cOGB/eYDXSYjiqT2KvyWRaRk7oL/DeaM5sdgFDK2pvw8LMgRrG9OAUvNmMo7D/qG0XNj25nucjX
 lVWK0yZhEskc6Gg==
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

