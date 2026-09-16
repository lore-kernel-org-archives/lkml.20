Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCC04AEBED
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552262; cv=none; b=u/n9KXA6jsUsMGzWiJDG3283aQ8T9T8ccMuj6EYMtS5cG9wiepnXZ38Eig5oKdh2sj6FoO7L/TOP/FgR4ASY4VaaZM3rhm1+VJ3UpRdfedFR6krSjmzY6UENYZro4ShQMllayn0f5ahf+CUA55ztyzuFoXbkt0QWtrKzST2qn3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552262; c=relaxed/simple;
	bh=qyoMQLJeiLB3R3jNlUUwjIL2eoxPZ7NoHL4nW+PB7jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3UbkC66an9uFrzZ+3RdlDJ6gWtwEKcXRZKGnjc2asN3OdhCKRLxTQcPYSEmrr2Ix+VT8AYMQrdkt7URkJK1VVESpAWeJMuZV0ZaHmZYXsQ72rdITHPRuMDujrDWIDgW8pCzjAL46qA32LiWALZTy0XTubapoQMF8utjYnR6ehY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rl3i4T5u; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rl3i4T5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789552241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w8OQ5sTROvl8un9Vo1lqJ9fpMZcWAu8IoU4XAMbOsgU=;
	b=Rl3i4T5uF+F4dejke/99pQvFZ3VyPHogLBCW8gE6ZkkmgVhQeK2daABzlx6YjD1IgzC0Od
	i22Se/3/unsSfxVDkEgMIQhj+xNrl0jiaFrunz1UKkochbvtMnLESCtp4682oyNkt9jnwl
	JR/kJ9p854BZqrze7JBcNIMKnFcQ/bw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-139-SEUGIpghOP278deey_Amgg-1; Wed,
 16 Sep 2026 05:50:35 -0400
X-MC-Unique: SEUGIpghOP278deey_Amgg-1
X-Mimecast-MFC-AGG-ID: SEUGIpghOP278deey_Amgg_1789552233
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30BA21955E75;
	Wed, 16 Sep 2026 09:50:33 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1D43B1800446;
	Wed, 16 Sep 2026 09:50:28 +0000 (UTC)
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
Subject: [PATCH v4 01/13] lib/crypto: aes: Provide functions for zeroizing aes_key and aes_enckey
Date: Wed, 16 Sep 2026 11:50:03 +0200
Message-ID: <20260916095022.604354-2-thuth@redhat.com>
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

Some crypto functions need to zeroize their local aes_key or aes_enckey
structures after use to avoid leaking sensitive material on the stack.
Provide aes_zeroize_key() and aes_zeroize_enckey() helper functions that
can be used with __cleanup() to automatically zeroize the structs when
they go out of scope.

While we're at it, replace the memzero_explicit() calls in lib/crypto/aes.c
with the new helper functions.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/crypto/aes.h | 18 ++++++++++++++++++
 lib/crypto/aes.c     | 10 +++++-----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index 3279cfa546085..9fe868161e1d3 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -101,6 +101,15 @@ struct aes_enckey {
 	union aes_enckey_arch k;
 };
 
+/**
+ * aes_zeroize_enckey() - Zeroize an aes_enckey structure
+ * @key: The aes_enckey to zeroize
+ */
+static inline void aes_zeroize_enckey(struct aes_enckey *key)
+{
+	memzero_explicit(key, sizeof(*key));
+}
+
 /**
  * struct aes_key - An AES key prepared for encryption and decryption
  * @aes_enckey: Common fields and the key prepared for encryption
@@ -115,6 +124,15 @@ struct aes_key {
 	union aes_invkey_arch inv_k;
 };
 
+/**
+ * aes_zeroize_key() - Zeroize an aes_key structure
+ * @key: The aes_key to zeroize
+ */
+static inline void aes_zeroize_key(struct aes_key *key)
+{
+	memzero_explicit(key, sizeof(*key));
+}
+
 /*
  * Please ensure that the first two fields are 16-byte aligned
  * relative to the start of the structure, i.e., don't move them!
diff --git a/lib/crypto/aes.c b/lib/crypto/aes.c
index f1549839b3de0..07c1d912ac365 100644
--- a/lib/crypto/aes.c
+++ b/lib/crypto/aes.c
@@ -539,7 +539,7 @@ static void __init aes_fips_test(void)
 	if (memcmp(fips_test_data, data, sizeof(data)) != 0)
 		panic("aes: FIPS self-test failed (wrong plaintext)\n");
 
-	memzero_explicit(&key, sizeof(key));
+	aes_zeroize_key(&key);
 }
 
 #if IS_ENABLED(CONFIG_CRYPTO_LIB_AES_CBC_MACS)
@@ -827,7 +827,7 @@ static void __init aes_ecb_fips_test(void)
 	if (memcmp(fips_test_data, data, sizeof(data)) != 0)
 		panic("aes: ECB FIPS self-test failed (wrong plaintext)\n");
 
-	memzero_explicit(&key, sizeof(key));
+	aes_zeroize_key(&key);
 }
 #else /* CONFIG_CRYPTO_LIB_AES_ECB */
 static inline void aes_ecb_fips_test(void)
@@ -1040,7 +1040,7 @@ static void __init aes_cbc_fips_test(void)
 	if (memcmp(fips_test_data, data, sizeof(data)) != 0)
 		panic("aes: CBC FIPS self-test failed (wrong plaintext)\n");
 
-	memzero_explicit(&key, sizeof(key));
+	aes_zeroize_key(&key);
 }
 
 /* FIPS cryptographic algorithm self-test for AES-CBC-CTS */
@@ -1069,7 +1069,7 @@ static void __init aes_cbc_cts_fips_test(void)
 	if (memcmp(ptext, data, data_len) != 0)
 		panic("aes: CBC-CTS FIPS self-test failed (wrong plaintext)\n");
 
-	memzero_explicit(&key, sizeof(key));
+	aes_zeroize_key(&key);
 }
 #else /* CONFIG_CRYPTO_LIB_AES_CBC */
 static inline void aes_cbc_fips_test(void)
@@ -1194,7 +1194,7 @@ static void __init aes_ctr_fips_test(void)
 	if (memcmp(fips_test_data, data, sizeof(data)) != 0)
 		panic("aes: CTR FIPS self-test failed (wrong plaintext)\n");
 
-	memzero_explicit(&key, sizeof(key));
+	aes_zeroize_enckey(&key);
 }
 #else /* CONFIG_CRYPTO_LIB_AES_CTR */
 static inline void aes_ctr_fips_test(void)
-- 
2.55.0

