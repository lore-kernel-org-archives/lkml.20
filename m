Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42006548575
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954918; cv=none; b=GS17z88c7rogT0b8diM/H5L5PzyUTOdOhmbLvEIoxkZBgGQdSpkZaA+O9sAF2TgH+Q8bapGrWQ77hRliwQdkt8E1KHcp1dTCcjWygv+CH9MvfNbqRP5ghvocd5vDb6wE9QfCEXxA9Arywiio1YqzO5sdQXjQXfrNKjbn0CbgEhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954918; c=relaxed/simple;
	bh=Pu553ZQkM91B4VrsGc9weFb5s0yBfWGWM2iMrF015hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uDRxT9r71XxCzQIFxX9m7pQvVyADlpPkIHFhoBUzhi2+LSNusLyjmHw9a3NkWWSUjGATZr0OqV3G7c2cym3fIWWRItTTTDV+Z8fazVibObh+DrXmAmV9XKItv1ZgPvC5C9U/m7np+HxJw4/sBKW83/2JcHgSAblMw1QYoUZ5yeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OyKSuUIy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OyKSuUIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788954915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iKydTuaKi3XtSbexoPJB1tXNpcTYcsS4RpRAKal/7tc=;
	b=OyKSuUIy0D1EZ4ITn+Z+ltwddpWMkQxhpyH1+BjhVVXNfcFEfsrE7Kgnvk7jgVzeoNBgVZ
	lCZkWWxmEdxWdQVKVPeQGevGBTtuwPz7UQa0OnzXVVV2tcM5Nkf/OrL/unMu9VTeP+DGqe
	WUHbeIrDY764QhYybNx1LzRX3xvm5ds=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-2-1YNacfg4OeCapJb_Gxn-Lw-1; Wed,
 09 Sep 2026 07:55:12 -0400
X-MC-Unique: 1YNacfg4OeCapJb_Gxn-Lw-1
X-Mimecast-MFC-AGG-ID: 1YNacfg4OeCapJb_Gxn-Lw_1788954910
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F116F1955DCE;
	Wed,  9 Sep 2026 11:55:09 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B4291956088;
	Wed,  9 Sep 2026 11:55:06 +0000 (UTC)
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
Subject: [PATCH v2 02/13] lib/crypto: aes-xts: Provide function for zeroizing aes_xts_key
Date: Wed,  9 Sep 2026 13:54:38 +0200
Message-ID: <20260909115455.157093-3-thuth@redhat.com>
In-Reply-To: <20260909115455.157093-1-thuth@redhat.com>
References: <20260909115455.157093-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

In certain cases crypto code functions need to zeroize their local
aes_xts_key structures after use to avoid leaking sensitive material.
Provide an aes_xts_zeroize_key() helper function that e.g. can be
used with __cleanup() to automatically zeroize the struct when it
goes out of scope.

While we're at it, replace the related memzero_explicit() call in
lib/crypto/aes.c with a call to the new helper function.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/crypto/aes-xts.h | 13 +++++++++++--
 lib/crypto/aes.c         |  2 +-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/crypto/aes-xts.h b/include/crypto/aes-xts.h
index b9e828265e58a..3a52e1cf40b57 100644
--- a/include/crypto/aes-xts.h
+++ b/include/crypto/aes-xts.h
@@ -22,6 +22,15 @@ struct aes_xts_key {
 	struct aes_enckey tweak_key;
 };
 
+/**
+ * aes_xts_zeroize_key() - Zeroize an aes_xts_key structure
+ * @key: The aes_xts_key to zeroize
+ */
+static inline void aes_xts_zeroize_key(struct aes_xts_key *key)
+{
+	memzero_explicit(key, sizeof(*key));
+}
+
 /**
  * aes_xts_preparekey() - Prepare a key for AES-XTS encryption and decryption
  * @key: (output) The key structure to initialize
@@ -30,8 +39,8 @@ struct aes_xts_key {
  * @flags: Optional flag XTS_FORBID_WEAK_KEYS to forbid keys whose two halves
  *	   are the same.
  *
- * Users should use memzero_explicit() to zeroize the key struct at the end of
- * its lifetime.  (But if this function fails, zeroization is unnecessary.)
+ * Users should use aes_xts_zeroize_key() to zeroize the key struct at the end
+ * of its lifetime.  (But if this function fails, zeroization is unnecessary.)
  *
  * Context: Any context.
  * Return:
diff --git a/lib/crypto/aes.c b/lib/crypto/aes.c
index 07c1d912ac365..34ef5deca0a79 100644
--- a/lib/crypto/aes.c
+++ b/lib/crypto/aes.c
@@ -1223,7 +1223,7 @@ int aes_xts_preparekey(struct aes_xts_key *key, const u8 *in_key,
 	return 0;
 
 out_zeroize:
-	memzero_explicit(key, sizeof(*key));
+	aes_xts_zeroize_key(key);
 	return err;
 }
 EXPORT_SYMBOL_GPL(aes_xts_preparekey);
-- 
2.55.0

