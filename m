Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789641;
	b=Wp5c1uyzIyvjMwu4iQV28gJjLf6sxyghepSrgpRv0igIJk5HrAwlhBlacHjMonj7nUOB
	 r7C4d6SnaSsx7RL7KqNDeNoF2qF5K2BKw7Af7R+dVZfFQPYMrvFiJUpfepn9g8Tq6gU3u
	 aEaCHGJ/m2qnX/mrvjrNI73cuXtKeNn8/G6i5TwLWGk7CQQdYyhQrW3tai5l/pYlPDt5M
	 1awJ/EsyF03HSIXAmq+5uk8g3QnUUNG1OMrh9omGgBBiR47+KNHd0uS8oXvN91AkPoOkQ
	 LUrqjMZuxNvUYK01DkLPJJB8YEjnFmGB93YUZvvN4qJFv9OFBhVz4GIpXk56uRcAjkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789641;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=mr6TqXgtbsRpH7YcJhsJ3zQQdGBC5zTXONlOxYcraG8=;
	b=5o8S2CQkHqf5sDZoGaCZGr+TCRV/QOCP3N0xROnD4e+B/7F+tJv4ehDJYWz0KHibhZkq
	 IZ6D6kfD+ssCvvm0S4dYybhvByJMVgP1+U4QCKAnfqjctPHpUqqg1wobvS+b2YBiZt+4X
	 Nn/MQrLxAVDALhTcB2/EqjpiFoHjoTI8zCjKUlLRd0F9xJSZFfOk7xJ0R4AMiSfDjuVhh
	 NIS2mxMNc3khJoblGQp/Y2CFTmZ9Ro2rB1Lv0Zf3UMiNn0fIBbg4Wly3VKZjUUlPg5Vb4
	 kotoiqar/paThqNvMytDNsjkhz8ZG5dDgvhjZEa30yAdd3LsuJKWAkXj4CUlO2Xc5jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MgXQOSBv;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F27606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44F27606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MgXQOSBv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793789640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mr6TqXgtbsRpH7YcJhsJ3zQQdGBC5zTXONlOxYcraG8=;
	b=MgXQOSBvMR60WYfIgpu9f3Wfv1u0uZ3ByWposmVCSco8UK+pdbg0cSUjrGWA4BgpBUNK1v
	GG2MZ0CTwkBGwMpg9Gzu2rIMFp1D3J0+d+whIhtXjESshQ2C4BqAMiodNBdy/leCBih1Sh
	0zq8NHvrb6V7I41Wiv9nwd+keMkbmlQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-6F5HHHkzOV2WTNhpUocNng-1; Wed,
 04 Nov 2026 05:53:58 -0500
X-MC-Unique: 6F5HHHkzOV2WTNhpUocNng-1
X-Mimecast-MFC-AGG-ID: 6F5HHHkzOV2WTNhpUocNng_1793789636
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8FB7819560B1;
	Wed,  4 Nov 2026 10:53:56 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6005930000E8;
	Wed,  4 Nov 2026 10:53:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] lib/crypto: Add a sentence about zeroizing raw key structures
Date: Wed,  4 Nov 2026 11:53:52 +0100
Message-ID: <20261104105352.135540-1-thuth@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Let's make it clear that raw key material has to be zeroized, too.

Suggested-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Suggested here:
 https://lore.kernel.org/linux-crypto/20260930201434.GA61218@google.com/

 Documentation/crypto/libcrypto-zeroization.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/crypto/libcrypto-zeroization.rst b/Documentation/crypto/libcrypto-zeroization.rst
index 76b6506711634..fe9f94413d1f2 100644
--- a/Documentation/crypto/libcrypto-zeroization.rst
+++ b/Documentation/crypto/libcrypto-zeroization.rst
@@ -47,7 +47,9 @@ The following types of structures hold sensitive material and should be
 zeroized after use:
 
 - **Key structures** (e.g. ``struct aes_key``, ``struct hmac_sha256_key``):
-  contain expanded round keys or prepared key material.
+  contain expanded round keys or prepared key material. Note: Arrays and
+  structures that contain raw key material (e.g. raw AES keys) of course
+  need to be zeroized as well as soon as the data is not required anymore.
 
 - **HMAC/MAC context structures** (e.g. ``struct hmac_sha256_ctx``,
   ``struct aes_cmac_ctx``): contain inner and outer hash states derived from
-- 
2.56.0

