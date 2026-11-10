Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284359;
	b=fBcgBj9MhV+0JUGS3Js17uPv74iMXBhYH+20ahZIWO/GDSiyjqNeXYDxbN+Q/o9g6H4e
	 VG44ZmTrZNZjXvHOPv5t1GrqxIK0SiFgUnpZHaeEVqD7dfGmmY9u7i2jve/DYTg0kFBpd
	 4eeQV1tnLzgWNM9cDO/aOAIoAAYUWaQYRMZNzW58U/64dF3MD8DIK1Tda45ZTrXdYJEAj
	 XV1lQvt6ywR/EldhZlKH8Niz1apxWl2eUbA1lK4vIgIyqPeWXTKLQ5YlX70gM/BRs+aCz
	 T8caVnrgAOLtZSTf+r7DanXd9cB9K65jQt3DynZFp+fMUdwk+D3d02iH3zDki4DPrkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jPU4IMrUNrr8h45vc8EL5JTCvYSHe/yNNj7XMONjgu8=;
	b=Jlku+mNJJoYyyNmBeyTGJivrfJub0dqckkRouMJJH6aKZM7d7rcwj30Zy1HfNzImKm4d
	 TsKv+7Lm8wz+p91OuuwsZhJK7z42Dn2iIIW9vq5KLZUiBe1k5hdWlCHp9kl27aznfwXGP
	 OxKomA34pwTBGmf7NSR7A5IlV92Xp75RWVHIJLF65QCj/I8XyL6dnpe/CloLAaz035TRi
	 TflRAnJkH1Cse12fRtXSfeaN4UAPeQMBZccBZUuzjCZOfA/AM6x+ARjMjA4HR8umvLuOt
	 gTjVv1q2NlZ8fHfAvQ5HpeWzNHh3UyYoDIcDTY09+ANr44DFewuvLUzaAV/rsiOm2Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ovAYrcEU;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE7D60A261C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE7D60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ovAYrcEU
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2460612c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284358; x=1794889158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jPU4IMrUNrr8h45vc8EL5JTCvYSHe/yNNj7XMONjgu8=;
        b=ovAYrcEU4YpDj+qS9Kyezyn7VjwJYTQDYf/0Vweej35GM7wXA/wOoKS7MWECpqjyVb
         TtebLwvQ8/cDfHo5BPUx3cqMp9bm31UwYU+rzH+jPVJ5pUHQqy5ISGkvu1J6oCmdC3Ww
         k3NXlfzLR0gFgTX15eqxD6aCfQ6oVPF+kU67mQmQCBQk/kPkBZwaaIL8856LeMuif8S3
         DHdpkLtz5XpfHtWYyox+VVAx+JTuTi0g4xur9KhGJYaYK1XBVAVW2Oh1NeiyZiP8EGSp
         MEAzO99G76otNRCOY6hvZjYKWBlhU49J7g292qg5I2GkfK3s6t/lRAmBrcgTumrCByD1
         /D9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284358; x=1794889158;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPU4IMrUNrr8h45vc8EL5JTCvYSHe/yNNj7XMONjgu8=;
        b=snLvYmYg/sC1Y/YWTZStU2n8YDSNRm1buydiOPJq4UzEsocFrh2x3peFDGMjH79yqN
         U+QXW3lGh1dEZrE2McrLmTv+x6WaLOsjdogQVUVwJ3387Sn47rQqUFzdhjxU0GS5eV9H
         U0tHV/8yi3rK9I9KSD3749oKp6lM9Z+0EIJKVS20Rs1u0MFiHu2WWC9n6cLlG8apkTOz
         29LFdQKr9wB7Dc+2oBY4K1ZAlLSasCvFWJqfbSV7su6pPnHkTNp8BiH1sNO/sdJyi7Uj
         dtHrINoJHOVkKgXOFWtAVYIVBGq1xHoHywUeLQGpUgRa+0hvV0e6/h4vgDcT17F28LJI
         pyPQ==
X-Forwarded-Encrypted: i=1; AL+hErGQAhsdum/AZp5pFCZYlB4YFCljIXIHFoDXUhrB3NU7aL9gXAKl6UQPHahoS6PqXYZgDACU4v9xX+Vf4fk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9adQ+OI9QY+Ho6p6zITAMVBIRTZ8Y4Raf8i0wD2ChzPzHMM6ob
	rJ/a5B2HmJexJWDF2QChhcD+meAbh/ewXY9haqYYjCvfIiX3I2DY8HY3
X-Gm-Gg: AYBFou0XvzAwrCMp7zKIQr+A3pz1HMul7SGr5sI5XDjxAxIyEPqQCKz2/q6WcII0OfA
	ixeOBPmo1YgsseqGKpYy1qlQHmTLOEnQXqbBIdtz473/ySujPBuIURpsIZ9FJ0YgKUmRKEoNUJf
	GeiTyp+7SYpUhxycbAot5J7XFeF8pKPSt7ul30aOaBViwOHhbyZWQrn8dV05F8axK1mDeYL7rWv
	rFaSqK6QFjA9P54cEhO+Vxh9ViEI7FmAFFAiDQlA4dJlVfuz2mPpKd1nSCBJpRBem5SIXjPV1sy
	YmKaX7DsHM8mBaaU9RrcToUFvBSIfx3sJDZRFD0mS+hI424/B8eBdEZsn0Bjdh3ZlWLByHgI2Dd
	8FQk1HcYwfzlK3HSwL+a5vkbPBUPACfRgHGIZJ/XSUpz7u7DIKRoGoj2ytmOWtujwV2qyUj5mGC
	t2nsMSskxSNX7p7GUsVRwN36TUGp9BCEyIVh1eUs2M1Yx9ac3tO7PkBn+0x//5HfjTHqlD+Pw0D
	JwN4BX0k9ed1ZS/T2G4R2iyombu7ome27+3NafmKGBOzan5BTH1D5ol/r0+t6LcSpTE4GFnPOuy
	uAL/0JDJC7TRJhyRsCNb0edYpDV9yqJPNdmriVBoSMrWY86OxzaB3ZLnETr/iK5JDfvI
X-Received: by 2002:a05:701a:ca05:b0:190:3950:43e2 with SMTP id a92af1059eb24-1b3b6000497mr2107814c88.8.1794284358348;
        Mon, 09 Nov 2026 20:19:18 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:19:17 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	bvanassche@acm.org,
	linux-pci@vger.kernel.org,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	rust-for-linux@vger.kernel.org,
	jgg@nvidia.com,
	akpm@linux-foundation.org
Cc: gary@garyguo.net,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	alistair23@gmail.com,
	gregkh@linuxfoundation.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	alex.gaynor@gmail.com,
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v6 04/25] X.509: Make certificate parser public
Date: Tue, 10 Nov 2026 14:18:11 +1000
Message-ID: <20261110041832.1730924-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110041832.1730924-1-alistair.francis@wdc.com>
References: <20261110041832.1730924-1-alistair.francis@wdc.com>
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

