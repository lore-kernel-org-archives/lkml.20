Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078777;
	b=tzs6Eme2Uq1nUsfZmrktYW4i+IEbwR79hcDaaUn9/AXOr7bMsHhLRKep7oldB88dOnHf
	 trZk0MuiRRSy9q7WH/YDW0p0kpq33MShkD8YlkbpfOsBCDYVdvmPsr0vuMYaw2XlTSGpx
	 45uMQTh72SHqO+uheFiDih4rB3ivIDgl9EdXRp6LDf/h8dGwrdwigM5TGYAJBVeqfn9ku
	 CDT6CTGMg0rM4jHpqnuyUM0YcI7NJf2N0syH/npnXi5K89sVPbXsbtrCfSmmGjEgdiE1b
	 WS2aWAetKpmhl9Avub4YqnZIVsD/Bh9SflbAHUSp3UJqyQ3hR/5TcRAE5F587Fy06wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jPU4IMrUNrr8h45vc8EL5JTCvYSHe/yNNj7XMONjgu8=;
	b=2/a1NzWvxlcrtJSNgzuExvCuE0Dbvzs1XCiP2EjyF5BAA9VGk6uIypUDCcxFQdp221lI
	 sHS2li3JgGvsd8Ci1vpw218tIHqZFrtfe+f++B/3arIp1hXILebFemFkcpkUAg5j9CyPu
	 LG/JOHb20QAT8P3AlreGKjGMELYUCSjQB0cJn17xg1i4wdD9O5/bCmk+yh9lNVwL664BD
	 wj8gHsFqJzo7Z245iJAIl/zmWbOlYK51HEnHFe1n2J52qB2nHkFFlNq/WTdpgbsdEVi8R
	 Kr5EtUsRii2O6YOF4tBHCYon7pEmQ22CU/P+3U6YE+HJXT4h3Zuo36LIrE/dbIp3oXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cs3qXRCT;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246D4606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 246D4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cs3qXRCT
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ea138a3497so24148585ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078776; x=1793683576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jPU4IMrUNrr8h45vc8EL5JTCvYSHe/yNNj7XMONjgu8=;
        b=cs3qXRCTz9nB2wngbl4nhivYX1L5cGCnAZIM5Vc4Sie58g9/yh8EBNZXs4YlJF33OO
         8Kaj7KE6oiinLgTv6Q8F7EediA/jRQgxS/K5nddpxBBhkUd72ZiumOJpZ1GUT4JOyeKf
         +Vc5DsmvIggUiKD34y+OoHVuQHyHMscIJKDp+v4DW8qL1aSVKdbbcLMTkWmDNxrIyX38
         6lDX7nY2WxLCv+b8kBslxNsUKBKakgWXoFGdJxtVmWCKnU/PfzPcSbZqzS5EwAlJrvGX
         krMLCoLoxcQF/EyU4mQw/1+BnRutXseAQEQU9Twe9XAGPrmDvWzDvg3w6enASb8bbzVD
         QlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078776; x=1793683576;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPU4IMrUNrr8h45vc8EL5JTCvYSHe/yNNj7XMONjgu8=;
        b=WOd4Fp7MMYF/8QpV/kEEcIKMbzA7TXL/Oi7/TJ+ijCwq4hMqvEUemvPPLXtERQSapm
         bZc9QtKdWgKBlMpX79lAabcB/nfWiiTGYcpJT1SDFVprIzDwgQPnKrM1Rldh3Kt8pY6B
         pCndoUSj6miQcblC8rPlWL2bDO8YewQuvqUBEoX/UTExkbVV8Zx4u+uTzsvX43zbcmPi
         +ZC+D9FG4xr55wqFSl9bnTAdVc5bZfS3e8DzgdAKEaDgya6Hlgvs69kWVfqBQJs1J7QU
         sANf6UidhCzwzoDwQU8J/O4WZhaXlbF5VbHy9YQTQx31Oq0TGTZVfYTGKLqgPRSF71Ht
         9uLw==
X-Forwarded-Encrypted: i=1; AKwUvBzlHnNUU+Myju9dziIz3VfFz0H9jCtEvqmS+fs+U++fSsUzZ9qck9Bz/0znoQdpMNmBuL7b6oUJgvErFs0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIxivv7FZVtcdQbL7dAM5CW2oKIOzSDyBWlJyqQyXGBEpwndPY
	Co4Z9hAPokVnXfeO63bzPW2BP38jlpiVsBAlw8EBXGtknqwxKQCNTyFx
X-Gm-Gg: AYBFou0t1pD+o8a6cvTLcuOHhwg9cXoNprw35oY4oGhuG1FRxQpD4f/X1G/yYVy+YVS
	iW111glqMXlvBcbRY9chebQuN7RMRL5Jp97F5Rv18KbjAdnxKCw8u4RntVcBTLtc/8QNurScNQj
	E0cImm36QkEdEG12EPsK7HkQxMK6kVLlEq3k1SkfrGKvc8uxzDFqa4kzadLav0Sve65MBy4uZM2
	oyuwF1309sv7dft8Sj2IolsYURY5Yu7rCilXyKszyBF7+8t6v8cvtDmKkz4yY6MKaVQUdLL7rSw
	1+aGFv/YbtH8H9iVWBQ1SJC1tAIgy/HetXzhxi+YM0j311Ob7yYcQYDAidHuv78jQrABWm8wJRQ
	5XWtTD7hSaG5sNvc+UW8mbvvPi/T8Ejc2cBSOA3T0Dag0kGvkAhnO9uhgLG6eOc3z/2tVpQ4KQI
	HFQT7D/A7dKfXQvffYy4pp8baME3A7LXkSCWhte5jAJwN6JqWZn4mOWGf7B6ExchERKL3FHWUcn
	+xhgwWqO1FaLpXrsm309aHYy8AyhuEkZr/WNOMOcTMY3t0kM9kjtbGWfeWJLTSDg+MSjasOSA==
X-Received: by 2002:a17:902:d541:b0:2e9:3dd2:a90c with SMTP id d9443c01a7336-2ea9c7bd583mr74901225ad.20.1793078776372;
        Mon, 26 Oct 2026 22:26:16 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:26:15 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	alistair@alistair23.me,
	rust-for-linux@vger.kernel.org,
	jic23@kernel.org
Cc: ojeda@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	alistair23@gmail.com,
	wilfred.mallawa@wdc.com,
	bjorn3_gh@protonmail.com,
	gregkh@linuxfoundation.org,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	gary@garyguo.net,
	tmgross@umich.edu,
	alex.gaynor@gmail.com,
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v5 04/23] X.509: Make certificate parser public
Date: Tue, 27 Oct 2026 15:25:17 +1000
Message-ID: <20261027052536.1722081-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027052536.1722081-1-alistair.francis@wdc.com>
References: <20261027052536.1722081-1-alistair.francis@wdc.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lukas Wunner <lukas@wunner.de>

The upcoming support for PCI device authentication with CMA-SPDM
(PCIe r6.1 sec 6.31) requires validating the Subject Alternative Name
in X.509 certificates.

High-level functions for X.509 parsing such as key_create_or_update()
throw away the internal, low-level struct x509_certificate after
extracting the struct public_key and public_key_signature from it.
The Subject Alternative Name is thus inaccessible when using those
functions.

Afford CMA-SPDM access to the Subject Alternative Name by making struct
x509_certificate public, together with the functions for parsing an
X.509 certificate into such a struct and freeing such a struct.

No functional change intended.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 crypto/asymmetric_keys/x509_parser.h | 42 +--------------------
 include/keys/x509-parser.h           | 55 ++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 41 deletions(-)
 create mode 100644 include/keys/x509-parser.h

diff --git a/crypto/asymmetric_keys/x509_parser.h b/crypto/asymmetric_keys/x509_parser.h
index b7aeebdddb360..39f1521b773dd 100644
--- a/crypto/asymmetric_keys/x509_parser.h
+++ b/crypto/asymmetric_keys/x509_parser.h
@@ -5,51 +5,11 @@
  * Written by David Howells (dhowells@redhat.com)
  */
 
-#include <linux/cleanup.h>
-#include <linux/time.h>
-#include <crypto/public_key.h>
-#include <keys/asymmetric-type.h>
-#include <crypto/sha2.h>
-
-struct x509_certificate {
-	struct x509_certificate *next;
-	struct x509_certificate *signer;	/* Certificate that signed this one */
-	struct public_key *pub;			/* Public key details */
-	struct public_key_signature *sig;	/* Signature parameters */
-	u8		sha256[SHA256_DIGEST_SIZE]; /* Hash for blacklist purposes */
-	char		*issuer;		/* Name of certificate issuer */
-	char		*subject;		/* Name of certificate subject */
-	struct asymmetric_key_id *id;		/* Issuer + Serial number */
-	struct asymmetric_key_id *skid;		/* Subject + subjectKeyId (optional) */
-	time64_t	valid_from;
-	time64_t	valid_to;
-	const void	*tbs;			/* Signed data */
-	unsigned	tbs_size;		/* Size of signed data */
-	unsigned	raw_sig_size;		/* Size of signature */
-	const void	*raw_sig;		/* Signature data */
-	const void	*raw_serial;		/* Raw serial number in ASN.1 */
-	unsigned	raw_serial_size;
-	unsigned	raw_issuer_size;
-	const void	*raw_issuer;		/* Raw issuer name in ASN.1 */
-	const void	*raw_subject;		/* Raw subject name in ASN.1 */
-	unsigned	raw_subject_size;
-	unsigned	raw_skid_size;
-	const void	*raw_skid;		/* Raw subjectKeyId in ASN.1 */
-	unsigned	index;
-	bool		seen;			/* Infinite recursion prevention */
-	bool		verified;
-	bool		self_signed;		/* T if self-signed (check unsupported_sig too) */
-	bool		unsupported_sig;	/* T if signature uses unsupported crypto */
-	bool		blacklisted;
-};
+#include <keys/x509-parser.h>
 
 /*
  * x509_cert_parser.c
  */
-extern void x509_free_certificate(struct x509_certificate *cert);
-DEFINE_FREE(x509_free_certificate, struct x509_certificate *,
-	    if (!IS_ERR(_T)) x509_free_certificate(_T))
-extern struct x509_certificate *x509_cert_parse(const void *data, size_t datalen);
 extern int x509_decode_time(time64_t *_t,  size_t hdrlen,
 			    unsigned char tag,
 			    const unsigned char *value, size_t vlen);
diff --git a/include/keys/x509-parser.h b/include/keys/x509-parser.h
new file mode 100644
index 0000000000000..8b68e720693a6
--- /dev/null
+++ b/include/keys/x509-parser.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* X.509 certificate parser
+ *
+ * Copyright (C) 2012 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#ifndef _KEYS_X509_PARSER_H
+#define _KEYS_X509_PARSER_H
+
+#include <linux/cleanup.h>
+#include <linux/time.h>
+#include <crypto/public_key.h>
+#include <keys/asymmetric-type.h>
+#include <crypto/sha2.h>
+
+struct x509_certificate {
+	struct x509_certificate *next;
+	struct x509_certificate *signer;	/* Certificate that signed this one */
+	struct public_key *pub;			/* Public key details */
+	struct public_key_signature *sig;	/* Signature parameters */
+	u8		sha256[SHA256_DIGEST_SIZE]; /* Hash for blacklist purposes */
+	char		*issuer;		/* Name of certificate issuer */
+	char		*subject;		/* Name of certificate subject */
+	struct asymmetric_key_id *id;		/* Issuer + Serial number */
+	struct asymmetric_key_id *skid;		/* Subject + subjectKeyId (optional) */
+	time64_t	valid_from;
+	time64_t	valid_to;
+	const void	*tbs;			/* Signed data */
+	unsigned	tbs_size;		/* Size of signed data */
+	unsigned	raw_sig_size;		/* Size of signature */
+	const void	*raw_sig;		/* Signature data */
+	const void	*raw_serial;		/* Raw serial number in ASN.1 */
+	unsigned	raw_serial_size;
+	unsigned	raw_issuer_size;
+	const void	*raw_issuer;		/* Raw issuer name in ASN.1 */
+	const void	*raw_subject;		/* Raw subject name in ASN.1 */
+	unsigned	raw_subject_size;
+	unsigned	raw_skid_size;
+	const void	*raw_skid;		/* Raw subjectKeyId in ASN.1 */
+	unsigned	index;
+	bool		seen;			/* Infinite recursion prevention */
+	bool		verified;
+	bool		self_signed;		/* T if self-signed (check unsupported_sig too) */
+	bool		unsupported_sig;	/* T if signature uses unsupported crypto */
+	bool		blacklisted;
+};
+
+struct x509_certificate *x509_cert_parse(const void *data, size_t datalen);
+void x509_free_certificate(struct x509_certificate *cert);
+
+DEFINE_FREE(x509_free_certificate, struct x509_certificate *,
+	    if (!IS_ERR(_T)) x509_free_certificate(_T))
+
+#endif /* _KEYS_X509_PARSER_H */
-- 
2.56.0

