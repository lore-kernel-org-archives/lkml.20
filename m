Received: from mta0.migadu.com (out-223.mta0.migadu.com [91.218.175.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B3B303A04
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792253381; cv=none; b=GLUOvK0GC1XO8FAoHukJSpDpN4eJ8wHR7WohnQdIKXv830y10LWGjN99T1uzz6ZVZg5puThzE0/WYme9GF74VwXipFHY09bGSdUHazypH/BBSPeU5dPy9wTtbZUQqnO8XhDGf1clt7rrqb/FxfJMbAUtgATLHHWo7hJsdKy5Q3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792253381; c=relaxed/simple;
	bh=FFUgdh8idoo7uPYiHxk4YzUlj0DtXIIOClOikNHRtTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LF5RP3O12TBFcndjZf2w2+F3ZxhbmJR0HFnSe0IjHhmBhqDPZEFuq+XAGzp6aJKVc4ieFDbHIijwI0RGw69tlu6CLqhf6npRJZelfK57KRpw0QCeP3rELcsVy4G8RIo3LIBOXrFwK3UWjes/wTNCGdxiH8aqvs2WQ6SC9LbMeYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UucuTBcN; arc=none smtp.client-ip=91.218.175.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UucuTBcN"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FFUgdh8idoo7uPYiHxk4YzUlj0DtXIIOClOikNHRtTI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792253377; v=1; x=1792858177;
 b=UucuTBcNzZSdaIfb3BB9L1+6C1gVPmTlN45NWJp65BRtQd2w80Zj8VvFvRrNXsIoYQfTZx4b
 wZ4Q6tfEk4ti9HdqzXhVz+B7RF8tiG2Mk5Z8s0MvwDKCsQIZr2xd2XWWxly9hN4P8CWX7KReQdo
 BSQHetLP94UtyjUm8qNwo1BY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 4bf64299f0d71374;
	Sat, 17 Oct 2026 16:09:37 +0000
X-Mizu-Trace-ID: 4bf64299f0d71374
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	chengming.zhou@linux.dev,
	dsterba@suse.com,
	hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nphamcs@gmail.com,
	terrelln@fb.com,
	yosry@kernel.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	senozhatsky@chromium.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org,
	kernel-team@meta.com
Cc: Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v4 2/3] crypto: acomp - enforce MAX_SYNC_COMP_REQSIZE
Date: Sat, 17 Oct 2026 09:08:54 -0700
Message-ID: <20261017160918.2738626-3-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017160918.2738626-1-usama.arif@linux.dev>
References: <20261017160918.2738626-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Herbert Xu <herbert@gondor.apana.org.au>

Enforce the limit MAX_SYNC_COMP_REQSIZE when an acomp tfm is
initialised.  All existing algorithms obey this limit.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 crypto/acompress.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/crypto/acompress.c b/crypto/acompress.c
index 4de1a2ad577f2..c8b4b8589769e 100644
--- a/crypto/acompress.c
+++ b/crypto/acompress.c
@@ -92,10 +92,6 @@ static int crypto_acomp_init_tfm(struct crypto_tfm *tfm)
 		if (IS_ERR(fb))
 			return PTR_ERR(fb);
 
-		err = -EINVAL;
-		if (crypto_acomp_reqsize(fb) > MAX_SYNC_COMP_REQSIZE)
-			goto out_free_fb;
-
 		tfm->fb = crypto_acomp_tfm(fb);
 	}
 
@@ -105,15 +101,19 @@ static int crypto_acomp_init_tfm(struct crypto_tfm *tfm)
 
 	acomp->base.exit = crypto_acomp_exit_tfm;
 
-	if (!alg->init)
-		return 0;
-
-	err = alg->init(acomp);
-	if (err)
+	if (alg->init && ((err = alg->init(acomp))))
 		goto out_free_fb;
 
+	err = -EINVAL;
+	if (!acomp_is_async(acomp) &&
+	    crypto_acomp_reqsize(acomp) > MAX_SYNC_COMP_REQSIZE)
+		goto out_exit_tfm;
+
 	return 0;
 
+out_exit_tfm:
+	if (alg->exit)
+		alg->exit(acomp);
 out_free_fb:
 	crypto_free_acomp(fb);
 	return err;
-- 
2.53.0-Meta

