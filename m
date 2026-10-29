Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277398;
	b=orMsrOlEGpBouksNTpOTMUQnXLxYiwWMinZ7DBomY3qclxTpjxKvRQG7Dbk7E925Xg73
	 p1Qa2i22LGSJT2GTDIoOZgDMN/UQdA2IT82gR2kbwwnHykCc0+SMCCDstByKn5HDm8Kpd
	 OeD6pFxBSiQjXxQVKJwmvswstptk2xvqG3un0oVcvg+8Q/PJB4FZG7nxuqGSWL4E9LT7d
	 Yg8zX4HitVsbRdHlXENnQkkFA3a0cfMn+4VUl9h72RdJXFV50MltYLqshcJrWmG22ebMQ
	 DGx5Z3y5/ORwt/25qQXe2SlOCyNoqBJSm9f/SobKw16TR+ZvuCloRhGkvfeWxnASI5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277398;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=+/luh6WGTlhkUZ89lJkceAsV6ypcW34insANuZaFpUY=;
	b=CLzD0TOvelCfYi7ytnBYM/aNdUFzMhNuhGnEXzn4Sg8X7NLH4l9is0txYJSqE6dSAZzl
	 Jgpg71CjxqUhvp6pJTzqaLERGET7ANOTxwUZg+wnCJx/Re1qpKENDoXbp9RXBWJpI0HxE
	 3g41kiuEzWYY+ZgWtGenb7kfKKjW+Fsgpi/Rg5wv6kOJCMzftqViKtwW9pbSZrfsNxaFx
	 /n01yZsMVcgKoCmRmTLMFJogZF3Rvs+ndKhPBAmes8FFPNq1p57PqXpYQV4TEJH4JpIWf
	 G5zTn+/xSBCQLtKcEMA42odJvjI4hu1urhSRDPTTNI7mT8XOYV9IzpMQUITkN9wYC7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=tHy9bQ4z;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAD5606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDAD5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=tHy9bQ4z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=+/luh6WGTlhkUZ89lJkceAsV6ypcW34insANuZaFpUY=; b=tHy9bQ4zpbWvn6ZjqJSS/mzTm2
	q8dgwX5FEthEyCv50iEA6qZVM8o9MIWr24ONfl7s/v3W2hsA6wmQgT5WvXoErT/NkF0+o6EqBZO7q
	C8zP/kxT2t/NoJ6TT5YLlhk2iFD+DUNfoa3evwmxNGRLXIwNE2gykiOQBkdqlDAJbHRJHwFzkk8jX
	7G+0XnTLvXT2p8PprbFCyzfTKRG2VurUxiJvuBcUKhQfJqA9++7JVMPznC/GS2z8g26pdW9i6g6RX
	0XHmd1PO29Dpuu7LdgV5M6YtJmccs9Epb40WmFs4uhU0++GMeZHHEMPP26xd0lf0Gg22xIo6MpYkJ
	uuSIL/Ig==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMPMx-0031XU-1a;
	Thu, 29 Oct 2026 12:36:35 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 29 Oct 2026 05:33:45 -0700
Subject: [PATCH wq/for-7.5 v4 1/2] workqueue: Move the initial max_active
 setup into a helper
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-wq_final-v4-1-2985ea9f24fd@debian.org>
References: <20261029-wq_final-v4-0-2985ea9f24fd@debian.org>
In-Reply-To: <20261029-wq_final-v4-0-2985ea9f24fd@debian.org>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, marco.crivellari@suse.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2375; i=leitao@debian.org;
 h=from:subject:message-id; bh=odDWIwjBvIjpwXjLA0juHNuEvW3vZJibT7D+9bcTFXw=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq4z3Lv2frivbqFXYJbtvQvfr8wtB37bUj3y8U9
 1NeEWMtENCJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCauM9ywAKCRA1o5Of/Hh3
 ba+OD/9MijBPaBS7qUeuTuEHqwUJCvvI5IPj2tuRxyYjOiVGa1VTEzD3kwqjQjzF6oaPqoc/UBW
 rhHkoTCyAkqwfzw/tBz/2FsVjg8F35eUHfz+tC9pvO5tVBC596oHOhIX2Ekn/baR0KjteO6yByK
 QAjDMGGt1vj4wgG2XLvR5iu4T/6MMC1TJGjsmVAcv7MpY6Digavo/g02pbjYIN/Nn+IKqSpsaaG
 vMjK8pZ10m0TNafoAjZ7dk5zY2Nst/VEOT1Yr4Fkq2BZqV4dImKt5xvmR9xhD1BFJPHI9i8AzAI
 ciqKCjhhFOA5+dz3mTx3nIU4K1vCR1erD8fUorgFXAitMeUIr5VG9pthy0mItZSuv3J9ZJ5zfxa
 FzqtEB+yn9VNVAejnqn/DLxDe91j0eNP2kpiiY43qn18Ilux+0KxJPyyP3Zn6BEQkN9mSYI6G+d
 IkJvnlAkCvgqhGl5SCR8a4TamsjUNPANlqytiahBKQEx8RVYJKaqfUziJhYwkpWVBYcD0RWFq3X
 K2Or264hZFQAaNqfRhbCV6MWDqrINJXf6RdcmPllsO0AYBxFymoE36GPNc4RLQn3lAl5/EYoH41
 83NOSY63KASCI3Ql7aT/Q6bqKzR9kVVn4OpBGDXvuffesLtgcYNYTNsjviGVpGYJ/bLIyZNT2pD
 uf2PlDJGBcg3Vmg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Extract the max/min active assignment into a helper, simplifying
__alloc_workqueue() and keeping the next patch easier to review and reason
about.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 kernel/workqueue.c | 46 +++++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index f2e8071a6f4eb0..826a64c6055d0c 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -6031,6 +6031,32 @@ static int init_rescuer(struct workqueue_struct *wq)
 	return 0;
 }
 
+static void wq_init_max_active(struct workqueue_struct *wq, int max_active)
+{
+	int effective_max_active;
+
+	if (wq->flags & WQ_BH) {
+		/*
+		 * BH workqueues always share a single execution context per CPU
+		 * and don't impose any max_active limit.
+		 */
+		effective_max_active = INT_MAX;
+	} else {
+		effective_max_active = max_active ?: WQ_DFL_ACTIVE;
+		effective_max_active = wq_clamp_max_active(effective_max_active,
+							   wq->flags, wq->name);
+	}
+
+	if (wq->flags & WQ_UNBOUND) {
+		wq->max_active = effective_max_active;
+		wq->min_active = min(effective_max_active, WQ_DFL_MIN_ACTIVE);
+		wq->saved_min_active = wq->min_active;
+	} else {
+		wq->percpu_max_active = effective_max_active;
+	}
+	wq->saved_max_active = effective_max_active;
+}
+
 /**
  * wq_adjust_max_active - update a wq's max_active to the current setting
  * @wq: target workqueue
@@ -6156,27 +6182,9 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 		flags &= ~WQ_PERCPU;
 	}
 
-	if (flags & WQ_BH) {
-		/*
-		 * BH workqueues always share a single execution context per CPU
-		 * and don't impose any max_active limit.
-		 */
-		max_active = INT_MAX;
-	} else {
-		max_active = max_active ?: WQ_DFL_ACTIVE;
-		max_active = wq_clamp_max_active(max_active, flags, wq->name);
-	}
-
 	/* init wq */
 	wq->flags = flags;
-	if (flags & WQ_UNBOUND) {
-		wq->max_active = max_active;
-		wq->min_active = min(max_active, WQ_DFL_MIN_ACTIVE);
-		wq->saved_min_active = wq->min_active;
-	} else {
-		wq->percpu_max_active = max_active;
-	}
-	wq->saved_max_active = max_active;
+	wq_init_max_active(wq, max_active);
 	mutex_init(&wq->mutex);
 	atomic_set(&wq->nr_pwqs_to_flush, 0);
 	INIT_LIST_HEAD(&wq->pwqs);

-- 
2.53.0-Meta

