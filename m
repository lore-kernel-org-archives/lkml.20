Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078785;
	b=e54HpfVs+WooZw9qNx5ZAOittwlWXwbYxC/aygq8dllrxZWfjUnvzn5wWkqIvMHeBTIa
	 ibq+YcHsGOn1dzpHB6KT/Ued0T6GZ+MuSBpYSrkdH5kNtDKJqlb/lB1vJ6CcW11AEfa96
	 uBL/v5DLwFY9H/4mNyRYE7CXXnhW9N4BQa5Cpl5kLbm1i5/UJLmri8Wuw69Ne6VdbSldu
	 vskpRs4ah9WeuTizrCPtQdzQO0Q1FkBrlVV2DpU626lJOkOBq/E3nsxitVaOQMw7C3lw/
	 JX4dKeEUUoUot4qizeXElSXMkFScBFNPGbt5/IsPo3OlCWplG7a100A7TQlJVA/o7Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DF2GX2Vr9/zlICZewnCnHZ+XwMhrVOLtr9YXmakaBJ8=;
	b=xCcnLSFl7BkFkLhqWfQ+PT5puy0U2Q1s1lT3hkCNi11tp8VNODB21V6rB10AkloPPEIO
	 8b6ZRRom+HxIVMivaCT2+s8xkuIAMImGZU3OdjElDPi0XS0QTwRlG8IJGXTE0I3cRPw57
	 7ntzgqRJLEHKYhGq1z56ES1exa0PItBRnfE+hx7vndUJimvW/yTbiwttl/vIM2cjaSqAj
	 viLfTQBrKYTqzlLT2dnp809DrhBxqV+spOXb7yZUTtgufb0VpkUWT2Vx7eAbAivAShUNN
	 zQ0xk+m1MFCip2E7yQ2C0kZgWvz7qtmTGTaUhj6XX9VK3ypEGWfLcCGWf98D6EFmC9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ppBUU5Jt;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED39D606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED39D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ppBUU5Jt
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e987b4a710so2528635ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078784; x=1793683584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DF2GX2Vr9/zlICZewnCnHZ+XwMhrVOLtr9YXmakaBJ8=;
        b=ppBUU5JtRQffnmvz2rPfVCMM0am1iKNTT99vWsxtfGruBwur7u+9uMc877XNtqKgWx
         nIVOk9/LHIxR2M6QwA5WZvMpE75bn2BdBs19T+/oTV8He95F8ZGDE0Blcw5sWb/8pZC/
         c8ujYPR/A99kQKfnnuCMEUueJWGXuEmq+WzbTUqJzCrVRNDPORf8hL6d9SAx5WS++S4m
         GdnHr557QDvgp4i5dRMmTe2xa5zvSPTz24vrxafPuEG5UHK1fTBQwqOgKYqnF+/UNTWp
         7lzZQePJQVfpNjfYh0hTJDCZgTmefumMec75BK2aGFPYKLmN4nZdkL/8el6bwtDSqldb
         qUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078784; x=1793683584;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DF2GX2Vr9/zlICZewnCnHZ+XwMhrVOLtr9YXmakaBJ8=;
        b=DrawQVP9fXxou2OO77TjoEc+SbzvUw6+G1fq7TaHcBvIVe5jlxo1kPtShDmHzHYViE
         x+ZUbJ4b4vuKLJra5fJ/5kwWrwTzzwdgWe0PFUTbfDaDeghJtoCvUvTy9A+70GUFHayf
         DorzsqGK59CwKkNEy8OPQrJNAdq0671ZIL52X22bTPx4BBZYTaB4Ag3O09HpRdWTrsCi
         0xoS5zKzA+d/0dBC6TrF2KO2NQofqWGhskSRLp0fDJ5Nih60iPMD1RVYL84b1EZgQOlI
         dRxkg0mKVVCN8HUyF2zt7g0r/tpLAp5DoDJ+D+taxYiXajCFqShnBqe8XGx0oqO/hRgY
         yTZw==
X-Forwarded-Encrypted: i=1; AKwUvBzBP0X/WuIeu6+69KvT+lCS7P9C4WW0xrMcb9VCzo9Abo2sI23JeehZmGZOKt+5fwpFcrbL5qi2lQuXwDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIonqkj7AsXLELIXeY9FmHZ7HeMY3hAKR4+2rk74WW+o+OZshFB
	DVP5kPmuX3V/wKxl52WktqyEud+xnAbdk4aSikz26CSDLKkv3Yv9sMbv
X-Gm-Gg: AYBFou0JkKc4+FqOl8THWzEiy4g6epTJsPJ+eZzRB/9DnRsyVebEK/Cx+PXj2MS5BYU
	9vr0jX5cpWtjUSbnE+rLrRSwaa9Tc9nOQPTULKXlpJlZfqvX22do8uAI75sKYYjEQqJPG1PcYD0
	a9c0eToG55XsvPQ4z28Vezqjil4vGAC//oK0MrpTmOcj6nztiuSDMO1/UetWhlJV4dTyr+8Rwyi
	TC8fFUT7wXJBxAebI0fxnbjnncxZJUF7K7EZmZFtxRMjWbYMTlOatLTPs7w93U9ayyRywh9J87v
	z9SXUY2T3ECFu6R3lILh8iaNkIKdV+Qes803UeB7a4FOt5GSoadvUm1/l+QV5sllzr9ldUHaAfi
	ds3z8TgEZIS5NYbJPkIVA7DKSJ4FijthMMK1wROBMRbFrfdEl8G79ug8La4Ebbd6BctEWvODqu/
	TvmDbiPqX2A3GvOBjRI7m6NOZdDvLvcWtNJdqtgDEAACS3efYjCTAtM+0y21AtlbgAOzMdYuA2p
	JJi59ZPmUQWI0OjWxKI90gwUPqaeV1myzbGL3LuO22E8zVUAMS8cETxShWy3/3vZ5WGNmlGwA==
X-Received: by 2002:a17:902:e80b:b0:2e9:5313:8f7a with SMTP id d9443c01a7336-2eae3d1de56mr9703925ad.6.1793078784280;
        Mon, 26 Oct 2026 22:26:24 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:26:23 -0700 (PDT)
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
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v5 05/23] X.509: Parse Subject Alternative Name in certificates
Date: Tue, 27 Oct 2026 15:25:18 +1000
Message-ID: <20261027052536.1722081-6-alistair.francis@wdc.com>
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

Store a pointer to the Subject Alternative Name upon parsing for
consumption by CMA-SPDM.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 9 +++++++++
 include/keys/x509-parser.h                | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index bfd10f0195e01..c3ec2846695a5 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -596,6 +596,15 @@ int x509_process_extension(void *context, size_t hdrlen,
 		return 0;
 	}
 
+	if (ctx->last_oid == OID_subjectAltName) {
+		if (ctx->cert->raw_san)
+			return -EBADMSG;
+
+		ctx->cert->raw_san = v;
+		ctx->cert->raw_san_size = vlen;
+		return 0;
+	}
+
 	if (ctx->last_oid == OID_keyUsage) {
 		/*
 		 * Get hold of the keyUsage bit string
diff --git a/include/keys/x509-parser.h b/include/keys/x509-parser.h
index 8b68e720693a6..4e6a05a8c7a66 100644
--- a/include/keys/x509-parser.h
+++ b/include/keys/x509-parser.h
@@ -38,6 +38,8 @@ struct x509_certificate {
 	unsigned	raw_subject_size;
 	unsigned	raw_skid_size;
 	const void	*raw_skid;		/* Raw subjectKeyId in ASN.1 */
+	const void	*raw_san;		/* Raw subjectAltName in ASN.1 */
+	unsigned	raw_san_size;
 	unsigned	index;
 	bool		seen;			/* Infinite recursion prevention */
 	bool		verified;
-- 
2.56.0

