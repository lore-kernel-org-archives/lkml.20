Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA65488DAF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044141; cv=none; b=VP6mlB2yfBUlpAhcYQ2mfnUZvIOAzEzZwIqW6B2d/s5QN5mgxwHlWEkYS3oqM7KLAvDby6HpQRa/kG3PsInq1/qnhRBUA0QMxTYicTwOmr5z/D/qXNFnIvPdHBE27X4rlmDVa9Q0ulVkMaQzw4j+Idu4AMsH7uXfV1sgRVXSPxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044141; c=relaxed/simple;
	bh=jlhtz27GSry8dABqGr+SGBe1KYYN8UQBI18T52Q8X+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LLZolnOgPNoHJf+Q7DnQficpc9cLRejrFRLmkiFQP9gFlmjX3n4r9ieptAaEAWqFRKAK3JKK4DBDkL9QQkOfzZuyACELoVUWm/dUxAm8FGPjG2w8Bdnc+b2KXmrHwIRb9NJE2rDWm0lhIk8w6vcjqlkxUSbkl9GIrW0axwKtPk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PtksU38H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PtksU38H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789044138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T46zRcaSlVLde9uhnONtqfo/sj56j7rPD8ZbLDPStgs=;
	b=PtksU38HWBniqOnU/0SZqvXDHrT4NRWXzOfVRlQp0MLkTOlvAq6fYnn3QZMfDsUNeF6FLS
	Ze6vwFjzKGFU1G4FppfoZVwd37cry6db9LLGwpn22SYd/AkNaLQsMS3m8c2N+0hJAEJAyD
	NjzvePm5Bf2nEHwfWdWY5CeCHCwaCg4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-283-klihdb6uN42lOfBTdnLaWA-1; Thu,
 10 Sep 2026 08:42:11 -0400
X-MC-Unique: klihdb6uN42lOfBTdnLaWA-1
X-Mimecast-MFC-AGG-ID: klihdb6uN42lOfBTdnLaWA_1789044130
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 48E171954AD2;
	Thu, 10 Sep 2026 12:42:10 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B31293000239;
	Thu, 10 Sep 2026 12:42:06 +0000 (UTC)
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
Subject: [PATCH v3 06/13] lib/crypto: sm3: Provide a function for zeroizing the sm3_ctx structure
Date: Thu, 10 Sep 2026 14:41:25 +0200
Message-ID: <20260910124138.417439-7-thuth@redhat.com>
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

In certain cases crypto code functions need to zeroize their local
sm3_ctx structure after use to avoid leaking sensitive material. Provide
a sm3_zeroize_ctx() helper function that e.g. can be used with __cleanup()
to automatically zeroize the structure when it goes out of scope.

While we're at it, replace the related memzero_explicit() call in
lib/crypto/sm3.c with a call to the new helper function.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/crypto/sm3.h | 10 ++++++++++
 lib/crypto/sm3.c     |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/crypto/sm3.h b/include/crypto/sm3.h
index 371e8a6617054..d044ca80213ba 100644
--- a/include/crypto/sm3.h
+++ b/include/crypto/sm3.h
@@ -11,6 +11,7 @@
 #define _CRYPTO_SM3_H
 
 #include <linux/types.h>
+#include <linux/string.h>
 
 #define SM3_DIGEST_SIZE	32
 #define SM3_BLOCK_SIZE	64
@@ -41,6 +42,15 @@ struct sm3_ctx {
 	u8 buf[SM3_BLOCK_SIZE] __aligned(__alignof__(__be64));
 };
 
+/**
+ * sm3_zeroize_ctx() - Zeroize an sm3_ctx structure
+ * @ctx: The sm3_ctx to zeroize
+ */
+static inline void sm3_zeroize_ctx(struct sm3_ctx *ctx)
+{
+	memzero_explicit(ctx, sizeof(*ctx));
+}
+
 /**
  * sm3_init() - Initialize an SM3 context for a new message
  * @ctx: the context to initialize
diff --git a/lib/crypto/sm3.c b/lib/crypto/sm3.c
index b02b8a247adf2..23059347b4493 100644
--- a/lib/crypto/sm3.c
+++ b/lib/crypto/sm3.c
@@ -258,7 +258,7 @@ static void __sm3_final(struct sm3_ctx *ctx, u8 out[SM3_DIGEST_SIZE])
 void sm3_final(struct sm3_ctx *ctx, u8 out[SM3_DIGEST_SIZE])
 {
 	__sm3_final(ctx, out);
-	memzero_explicit(ctx, sizeof(*ctx));
+	sm3_zeroize_ctx(ctx);
 }
 EXPORT_SYMBOL_GPL(sm3_final);
 
-- 
2.55.0

