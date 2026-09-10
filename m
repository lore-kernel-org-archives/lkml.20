Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91EF45D911
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044144; cv=none; b=bbvDVcwPf9+8ccu/bcPl8FCSMc5QGpgro0QzFUZkc6KR30oWJp/5zFhn5SDhbi3bilV6iLOY7/ffksHX0rhOhpclbsbssJT8Qp2Oc0eBWs0NnaHH9nFEKpJK1SF6J/U3WONGE61wV+aKRFUse2a3+bz6pmKf+4KSOVuRyUoXbUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044144; c=relaxed/simple;
	bh=8Nhgl85UqN7JQx2CBcnw7jYv6wkT5XU8Jx+KGKUJbB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MMjCPz5kke0aHgqHED96XWx5IPUICHiZ6eT5u5LEMZ2zbp+nMQqiqWwX19mG3Ismx0VlUA5B/G22W2eQjVkKjIhU7xeqtF5rj9ZnUCB1NDgZmMRDdHbwSi+8BIfzB/JM0UTVqvd5f9Cg4aCk8mVF1J6efWkBZ8Eo3XodYxhIYXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YtPFd3nK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YtPFd3nK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789044141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ouNZYOOt8CIaEFrfD0VxsHURoh7bbScAMyQARtiv7Dg=;
	b=YtPFd3nKMBHNQ7zzzpnAt5A6rDcsrb7V2P+ORHW6woCcfAQS+ospQVGv99uOK80feft4rw
	1R4QWfsMTk2BTZfuoH+d7rzOqMfAcMWowQ7j9QYBFnro696u+3AIRbQ84FAro/niouJ/nf
	uD++lxRCvdtPby9Ps6kadVKYoBPiMHo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-147-A3v72BatP6iKOAO2Q2Fuig-1; Thu,
 10 Sep 2026 08:42:16 -0400
X-MC-Unique: A3v72BatP6iKOAO2Q2Fuig-1
X-Mimecast-MFC-AGG-ID: A3v72BatP6iKOAO2Q2Fuig_1789044135
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 825C91800614;
	Thu, 10 Sep 2026 12:42:14 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6504B30001A2;
	Thu, 10 Sep 2026 12:42:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH v3 07/13] lib/crypto: blake2: Provide functions for zeroizing blake2*_ctx structures
Date: Thu, 10 Sep 2026 14:41:26 +0200
Message-ID: <20260910124138.417439-8-thuth@redhat.com>
In-Reply-To: <20260910124138.417439-1-thuth@redhat.com>
References: <20260910124138.417439-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

In certain cases crypto code needs to zeroize their local blake2b_ctx
or blake2s_ctx structures after use to avoid leaking sensitive material.
Provide blake2b_zeroize_ctx() and blake2s_zeroize_ctx() helper functions
that e.g. can be used with __cleanup() to automatically zeroize the
structures when they go out of scope.

While we're at it, replace the related memzero_explicit() calls in
lib/crypto/blake2*.c with calls to the new helper functions.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/crypto/blake2b.h | 9 +++++++++
 include/crypto/blake2s.h | 9 +++++++++
 lib/crypto/blake2b.c     | 2 +-
 lib/crypto/blake2s.c     | 2 +-
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/include/crypto/blake2b.h b/include/crypto/blake2b.h
index 3bc37fd103a7a..eda1604bce780 100644
--- a/include/crypto/blake2b.h
+++ b/include/crypto/blake2b.h
@@ -37,6 +37,15 @@ struct blake2b_ctx {
 	unsigned int outlen;
 };
 
+/**
+ * blake2b_zeroize_ctx() - Zeroize a blake2b_ctx structure
+ * @ctx: The blake2b_ctx to zeroize
+ */
+static inline void blake2b_zeroize_ctx(struct blake2b_ctx *ctx)
+{
+	memzero_explicit(ctx, sizeof(*ctx));
+}
+
 enum blake2b_iv {
 	BLAKE2B_IV0 = 0x6A09E667F3BCC908ULL,
 	BLAKE2B_IV1 = 0xBB67AE8584CAA73BULL,
diff --git a/include/crypto/blake2s.h b/include/crypto/blake2s.h
index 648cb78243588..bb4e6870ed196 100644
--- a/include/crypto/blake2s.h
+++ b/include/crypto/blake2s.h
@@ -41,6 +41,15 @@ struct blake2s_ctx {
 	unsigned int outlen;
 };
 
+/**
+ * blake2s_zeroize_ctx() - Zeroize a blake2s_ctx structure
+ * @ctx: The blake2s_ctx to zeroize
+ */
+static inline void blake2s_zeroize_ctx(struct blake2s_ctx *ctx)
+{
+	memzero_explicit(ctx, sizeof(*ctx));
+}
+
 enum blake2s_iv {
 	BLAKE2S_IV0 = 0x6A09E667UL,
 	BLAKE2S_IV1 = 0xBB67AE85UL,
diff --git a/lib/crypto/blake2b.c b/lib/crypto/blake2b.c
index 581b7f8486fae..55d6c437f311f 100644
--- a/lib/crypto/blake2b.c
+++ b/lib/crypto/blake2b.c
@@ -148,7 +148,7 @@ void blake2b_final(struct blake2b_ctx *ctx, u8 *out)
 	blake2b_compress(ctx, ctx->buf, 1, ctx->buflen);
 	cpu_to_le64_array(ctx->h, ARRAY_SIZE(ctx->h));
 	memcpy(out, ctx->h, ctx->outlen);
-	memzero_explicit(ctx, sizeof(*ctx));
+	blake2b_zeroize_ctx(ctx);
 }
 EXPORT_SYMBOL(blake2b_final);
 
diff --git a/lib/crypto/blake2s.c b/lib/crypto/blake2s.c
index 71578a0847423..24f7f34334b01 100644
--- a/lib/crypto/blake2s.c
+++ b/lib/crypto/blake2s.c
@@ -142,7 +142,7 @@ void blake2s_final(struct blake2s_ctx *ctx, u8 *out)
 	blake2s_compress(ctx, ctx->buf, 1, ctx->buflen);
 	cpu_to_le32_array(ctx->h, ARRAY_SIZE(ctx->h));
 	memcpy(out, ctx->h, ctx->outlen);
-	memzero_explicit(ctx, sizeof(*ctx));
+	blake2s_zeroize_ctx(ctx);
 }
 EXPORT_SYMBOL(blake2s_final);
 
-- 
2.55.0

