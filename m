Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F8F27442
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 05:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791090604; cv=none; b=ZEaJskMlW6/1xBueZ+ekfFbnO/vni2Ij56YVG/38sk+47qvkdWrvi/uXFYJBP7Vz83MKcq3A475nI4QGTyxNmSsXkgkOxAUlBDfJv3/Kyb3lCzvcwZiayQ8hlRxXT2FjU4eeFyaDXRq3HTeWiQKnV84mQpsO8Tl+Ss7Yzmsw2i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791090604; c=relaxed/simple;
	bh=IXzXisik/Zy5HF8UDVd3aRDCXeaSkyvSVfGa+Dmmx/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YK5PPO8cv8mo81RTCNCqeAWRJi4tiRjOWvqOoAFSanre2xQgE9uknn4ba3a7laYjS3LBXQ8lKEd4ruPgqEexfiX8B20BRU9PSwvMri6BcWJXK1BZPpybTo30UmgDvhlw/jhEL4VsF7qCfG/t4vmnArlrb2YtGogBLsYsN4VmfLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2Z1UPor; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2Z1UPor"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccda24afso201358a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 22:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791090603; x=1791695403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O39FQFwyEOH81dyYEdu1kpPgRRCGO2BOYjVofQBwRYA=;
        b=N2Z1UPoreiUxFkjhHjnqbI4m8j5gvYudz3SKJuJwaMbFtOknNJqQSHpM1UDPl32k6i
         HTnmgmQyk90jqhXXMA884wTyg7hoik4xJA+s2UwU9BmcEAggnzKnf8Oy/XHMBrN3wIZN
         sUu1Gqdzw4lDRSXjVB67YeF6FNdJkvhrgLrNr4asU4YN1hQvCB6DyIFWlgoP1UR/t8s0
         AMz3weHcudabo/kG2DMg+66QlKcQfRCzXDnpgpnNrUOdUrzMc2GRWZe3br+I4t8IfuV3
         AsmZ+Mro2Qzty2LGZrzUnhEvSPZ6xNiSB6VIqUGO2UBgr6fBP1BdsFcn4SQNlDdLAoQU
         BONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791090603; x=1791695403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O39FQFwyEOH81dyYEdu1kpPgRRCGO2BOYjVofQBwRYA=;
        b=u1YkXJ6ncK5VzZ4csDyxAwylvOEgIY5VRQUbyPA0YwLiQ1DrPGRsTaepqgqEOmp7lG
         1fWRfzr4Zrt7oTHmbDL50G+f5qmMIfV3fO5fg5qyuSDoYryRNwR/TbXfFBiRAkEk0PUC
         DmAXKt0LpXhONMMl3Cw/2w+ytYLjj16Y58sm6MKnuBd1ColMjueiWpZgwdTia2VxaJHE
         2NCKdyU3FQZ8gWbvXj7q53vXqyA4wzoiRhFyQp1kbo5XOnP1FhHwjpw5i0eAp1Kq2UKx
         jD92XZgGEikGo0loxTUnWu55muDO+Cp9BAq0hUlDWKOX119+2Moe5kIq8qQwI3MF1/Tt
         +nYw==
X-Forwarded-Encrypted: i=1; AKwUvBwUEA7hPmXwf7mDP0VqqNAmxwxdTemiqEoMYeneuSdyRLgyK/FkjkfBgRmjfxyXhaAvEkqFLv0TlxYGR54=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeIu1hazpya9XZiMUAibJcsofNd6IyND40hk6meJGgXvquG9AH
	Uvmah4eYVnc71sJul0GeV9ADT4TCgxcffp5tm91F7R3kxy/ID7zVxZQk
X-Gm-Gg: AYBFou3gIG/zReRRcrhfzQsac8ni68ysoPVl0357nlUhpOzLrwtNFXsjWpk7z1qd2sT
	8XBRxXMpWoWJCN2PzKzBatk2zLbJOC6DdG727Lkxqf2XTkZ2yb2pERKAisF+zMbvIpewNMB3I0o
	RblwBvMnAYOqGXSb4TKIREMQZZaBpQrr9so6p55Fz10rH42oIkXrRFdG8LlaAsN3asU2KlVuMIl
	sfiooOIaxwJUix0NE7hs8UTMKRbNFV5T7aY98+ir8mCUa0eH+RoBe5LmQv+mzQFJHjY2iNbOKPc
	rSJZlGvexkP3l0q+oTeFZJBcGCh6JHP/BtPSQ/pzEfI/iYuTdOy+syFntZmwzYBwdzchZmKv7E0
	jddBvhmFpx7MHIR+Wh2Xnt/Wgxi8sz4KsOcf2Ui0eXyyE3TEJZvOpvTePtVV5lF2O3INO6w3S+m
	nB3g1sH5upZLhNNyj8oekd6IjRwNorCuZ0hgxHimjuj3mHJOjAQhAqO+XjNyDppkzhAjuwjNrUf
	4OatWdNdMy9uc2ahyNj7g==
X-Received: by 2002:a17:90a:2ce1:b0:3a6:dc2f:f087 with SMTP id 98e67ed59e1d1-3a6dc2ff4ffmr1693679a91.53.1791090602694;
        Sat, 03 Oct 2026 22:10:02 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7e4b00de6sm100531a91.1.2026.10.03.22.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 22:10:01 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>
Cc: Stephan Mueller <smueller@chronox.de>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: [PATCH] crypto: algif_skcipher: rewind rounded output bytes
Date: Sun,  4 Oct 2026 14:09:46 +0900
Message-ID: <20261004050946.3131044-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

af_alg_get_rsgl() advances the receive iterator by the unrounded RX
scatterlist length.  For a continuing skcipher request,
_skcipher_recvmsg() then rounds its local length down to a whole chunksize
without restoring the iterator.

A later chunk starts after bytes which the provider never wrote, while the
syscall returns only the processed length.  When copy_splice_read()
supplies non-zeroed pages and publishes that return as a dense prefix, the
gap exposes stale bytes from a previous page lifetime.

With unprivileged xts(aes), a 31-byte MSG_MORE request followed by one
final byte advances a 47-byte destination while returning 32 bytes.  A
hardened v7.2-rc5 image retained all 15 seeded stale bytes in 4,829 of
4,829 records.  With init_on_alloc enabled, all 72,345 gap bytes observed
were zero.

Rewind the iterator by the tail excluded during rounding, before rejecting
a zero processed length.  The crypto request uses only the rounded length;
af_alg_free_resources() releases the entire RX list before another receive
iteration.

The fixed target-like kernel returned byte-identical dense 48-byte output
in 4,771 of 4,771 rounds.  The unmodified kernel returned the vulnerable
32-byte short record in 2,409 of 2,409 rounds.

Fixes: e870456d8e7c ("crypto: algif_skcipher - overhaul memory management")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 crypto/algif_skcipher.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/crypto/algif_skcipher.c b/crypto/algif_skcipher.c
index 1e61fe6e24b99d..291dbd69893257 100644
--- a/crypto/algif_skcipher.c
+++ b/crypto/algif_skcipher.c
@@ -135,12 +135,16 @@ static int _skcipher_recvmsg(struct socket *sock, struct msghdr *msg,
 	 * full block size buffers.
 	 */
 	if (ctx->more || len < ctx->used) {
-		if (len < bs) {
+		size_t excess = len % bs;
+
+		len -= excess;
+		iov_iter_revert(&msg->msg_iter, excess);
+
+		if (!len) {
 			err = -EINVAL;
 			goto free;
 		}
 
-		len -= len % bs;
 		cflags |= CRYPTO_SKCIPHER_REQ_NOTFINAL;
 	}
 
-- 
2.55.0

