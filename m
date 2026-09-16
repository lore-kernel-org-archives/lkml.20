Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB2D4AEBD8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552305; cv=none; b=kf9/27j9WPESJNO6Og/LvM/jbIWObQD+sU9On2Xxpqu6I8SSko8sgK+bnIQYARdduM2hDsGMGQzUf/6iOs06lMuJbf/miQDRrSBn6C3lWBftxA4MNeGyzdKfd4q2qnsVpMpDaAQ+a1oeiL7RV2g65fNE/UQ3VLBE2s6lSd9jJPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552305; c=relaxed/simple;
	bh=SMz1n2qZSUfU+2cgkcz49kZ4uQA0DD7hBcMOHyDLDOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gth1iLTUER27pUY6N1cn+gNYC6+ZBDOgl36ToZfXQQfWD188wlYmiGJPEzLE0Da5CCtmWHSIJEnrcSRQRro/qADUfKqJCj/v37cDafunq6XO487d5J9Tg3rR3SFxfpP/NqxxEwmYsB41zJF8XQZNWkqa1kjWnunq3nXxSrP2WLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L6oGpZzd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L6oGpZzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789552284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YFi1wI0axV9T/N/bsBEiFja16TRKzsIA5VOlO65mHUM=;
	b=L6oGpZzdEDWIe8vsBoiC4GYvsmkhGCelYbFMoXbtxJ/zM4DUV2W1gSwqoJXm1UtWc0QcZU
	k0d4h9CnftV83/yGiAurT0is6Dd0SOnRvxcK+R9TQ/WKY8wveE87zgS0q4lJ7a9cVtUiBH
	+IEhOJPM+4yKqLuMwJDWquAfAyf9lZc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-91-emr1cyZJM4GTR-P-DOamIg-1; Wed,
 16 Sep 2026 05:51:10 -0400
X-MC-Unique: emr1cyZJM4GTR-P-DOamIg-1
X-Mimecast-MFC-AGG-ID: emr1cyZJM4GTR-P-DOamIg_1789552268
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 009AB195606C;
	Wed, 16 Sep 2026 09:51:06 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 747871800352;
	Wed, 16 Sep 2026 09:51:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH v4 08/13] lib/crypto: sha1: Provide functions for zeroizing hmac_sha1 structures
Date: Wed, 16 Sep 2026 11:50:10 +0200
Message-ID: <20260916095022.604354-9-thuth@redhat.com>
In-Reply-To: <20260916095022.604354-1-thuth@redhat.com>
References: <20260916095022.604354-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

In certain cases crypto code needs to zeroize their local hmac_sha1_key
or hmac_sha1_ctx structures after use to avoid leaking sensitive material.
Provide hmac_sha1_zeroize_key() and hmac_sha1_zeroize_ctx() helper
functions that e.g. can be used with __cleanup() to automatically zeroize
the structures when they go out of scope.

While we're at it, replace the related memzero_explicit() call in
lib/crypto/sha1.c with a call to the new helper function.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/crypto/sha1.h | 19 +++++++++++++++++++
 lib/crypto/sha1.c     |  2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/crypto/sha1.h b/include/crypto/sha1.h
index 4d973e016cd69..bc0046bffeaee 100644
--- a/include/crypto/sha1.h
+++ b/include/crypto/sha1.h
@@ -7,6 +7,7 @@
 #define _CRYPTO_SHA1_H
 
 #include <linux/types.h>
+#include <linux/string.h>
 
 #define SHA1_DIGEST_SIZE        20
 #define SHA1_BLOCK_SIZE         64
@@ -96,6 +97,15 @@ struct hmac_sha1_key {
 	struct sha1_block_state ostate;
 };
 
+/**
+ * hmac_sha1_zeroize_key() - Zeroize an hmac_sha1_key structure
+ * @key: The hmac_sha1_key to zeroize
+ */
+static inline void hmac_sha1_zeroize_key(struct hmac_sha1_key *key)
+{
+	memzero_explicit(key, sizeof(*key));
+}
+
 /**
  * struct hmac_sha1_ctx - Context for computing HMAC-SHA1 of a message
  * @sha_ctx: private
@@ -106,6 +116,15 @@ struct hmac_sha1_ctx {
 	struct sha1_block_state ostate;
 };
 
+/**
+ * hmac_sha1_zeroize_ctx() - Zeroize an hmac_sha1_ctx structure
+ * @ctx: The hmac_sha1_ctx context to zeroize
+ */
+static inline void hmac_sha1_zeroize_ctx(struct hmac_sha1_ctx *ctx)
+{
+	memzero_explicit(ctx, sizeof(*ctx));
+}
+
 /**
  * hmac_sha1_preparekey() - Prepare a key for HMAC-SHA1
  * @key: (output) the key structure to initialize
diff --git a/lib/crypto/sha1.c b/lib/crypto/sha1.c
index b687b89d97cb4..c4361ef77166e 100644
--- a/lib/crypto/sha1.c
+++ b/lib/crypto/sha1.c
@@ -275,7 +275,7 @@ void hmac_sha1_final(struct hmac_sha1_ctx *ctx, u8 out[SHA1_DIGEST_SIZE])
 	for (size_t i = 0; i < SHA1_DIGEST_SIZE; i += 4)
 		put_unaligned_be32(ctx->ostate.h[i / 4], out + i);
 
-	memzero_explicit(ctx, sizeof(*ctx));
+	hmac_sha1_zeroize_ctx(ctx);
 }
 EXPORT_SYMBOL_GPL(hmac_sha1_final);
 
-- 
2.55.0

