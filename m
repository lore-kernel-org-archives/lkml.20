Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB622D0617
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791324372; cv=none; b=LEvkDDNw6NK0Lcp+Kq/r1i1uQixIDAj4vkEfcSifMYXTqLDChR4fOREHYuVzuzVrIFT8NVCYXECBrDecyF92E9sCXyS6pZtmJ4Kw2nmUuYv95911AmQx88gGvbRQUq540JjiOm8+z0sD8WZjKAKoNnRco5O1ychbWyKQ642a1DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791324372; c=relaxed/simple;
	bh=c/drCJen5LJMtn3pQqXT+RbL6rm/KkIjmd4Ej7ez9pk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K8+JNlTzMiGMRTzLXPHAjQXtwKFboe9wx/stVxhSjM6zNa+XXq6OGOR3fVxvcYNphYb7FxS/zIh2/u2eKKONA0t20nZo3auserRLF041t1PlQDAREnUqBLBN7YU8v3/Ia3IlA84UCePbpAg6S9QhSJobw5V0s9pYr4QnjnGRYc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=Xb2csrNa; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="Xb2csrNa"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4f59e61f295so794504b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791324370; x=1791929170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/J703MqDk74gwFcythehYWn182MykFiNjG1Hjsd4aM=;
        b=Xb2csrNakjRLjNRB8ncODQgCjnoOrcaNFjigLK37WK34bGwgjwXqOvpC2rcBxHBszU
         H0oQdbn1L42Xrh+UW9VMA0RzxO8GH2YWmt/mDXs4A3ty4Vh5CKc5ORPnDJ1hU2/O6Hbk
         +/63XA/Debbbi+u98D1pGrHf2PAEt67OFkis0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791324370; x=1791929170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/J703MqDk74gwFcythehYWn182MykFiNjG1Hjsd4aM=;
        b=g0mzI0EfvOg+r9ZltaS+r9csOqG+gWg41ayC+fKphR1vu8geooLPGNwQLZIcn1gy7R
         Dg2r5sX2sIcGSi8UiRW2ehvrmIMwzURTKYDg0Mq37FS8tCQF6ryxJMYK3HUcE0H3qdge
         COPvhwyPTOPdzkZ4pYfgA4mfKuWjRwxgjHoF0gNlPAtumR+imihS52fFTFRLXB6w9M6r
         7H6V4nGtZQgUdgZJPtkIrjsfm1IMf9Zi1j6Nc+BNCKIVsdGdXelMQTY5MxQzRBDGv3rD
         4OP8J5aQbIYQdojyon02gOvIzxVBOzMxO8s2X9dQvzSLErTsfgO0bszeDGO+v7Hzzrkn
         NKpw==
X-Gm-Message-State: AFuF++kuEG06/xpEzswOhi2XTz1IKfrcQDAZ0B+H/hlYTRXbALMiLQRm
	w7qkcwum0T39LeEaQogE90M5h9YUVfZ/x6pFt9inUgo7qbQKCQlSExXKkYLcL+dTkrE=
X-Gm-Gg: AYBFou0U0DcoX0GOugVP1S2hx5bPdh2o3uR6QaUNd60zxopf8mj7JGv1mSfhanh2Iex
	dZGmOR4hk6ur9uCUfQUJRXkkIT4D8S9RVb951avti7D8xZ7hEQWD2ZvzdwJLl5WnTVl1jKNp5In
	xew7jJ6PaEfJbwBsH3XOK4bLuCtaFaYP8DztQHea7Kv/55O6OVxA7F9YEVCCMnF/wNc/jBNl23U
	iqCAMelZDqyO5QY9ZbmDFvlEmXhdCjaqdTiEsw7nhTgniXCP8feJCopBbJg1kOjehy1pcwEkSeq
	hTRFSoyX+uUC2dfTqCkbgfNNUCMD/nwCa9iuhuXTy6y9kWrVyJZFIWq4b7W1dN31LxsK4PO55x6
	BaHeTjQ6QSouB81kC4IaZhjlVXExUfU1LMBXZHl5UNAZxVbgmJ7G+FobuRX5o2e3QARQ/hCS7Pl
	h44h6zi9ja4jZn3b6QYaQtdb78DtkLfcq9DcfH5/6a7jiqvvTWjC7ZGpuEnkq7D9Bnzk1hWaeHw
	1A2vZ2+GGM+5CldN6d/THS3s0RWVNc8RlFK0/dNRJgTbmQDGt0M/Q4diYIXoYBH0FUQTEOKu5S7
	SQ2ub51ddQ==
X-Received: by 2002:a05:6808:13cf:b0:4c3:95d:91f1 with SMTP id 5614622812f47-4fc435fc500mr735773b6e.1.1791324370150;
        Tue, 06 Oct 2026 15:06:10 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4fc48e35ba6sm508311b6e.8.2026.10.06.15.06.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:06:09 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org
Subject: [PATCH] crypto: algif_skcipher - Fix receive iterator advancement
Date: Tue,  6 Oct 2026 15:05:23 -0700
Message-ID: <20261006220523.31218-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

af_alg_get_rsgl() advances the receive iterator by the full RX scatterlist
length.  A non-final skcipher request then rounds that length down to a
multiple of the cipher's chunksize without returning the unused suffix
to the iterator.  If the receive loop processes another request, it
writes past that suffix even though the returned byte count includes
only the processed lengths.  The socket splice fallback can consequently
publish uninitialized bytes from its newly allocated pages.

Save the iterator before gathering the RX scatterlist.  After processing
the request and releasing its resources, restore the iterator and advance
it only by the successfully processed length.  This also leaves the
iterator unchanged if gathering or processing the request fails.  Keep
the existing cipher request lengths, continuation flags and scatterlist
cleanup unchanged.

Fixes: e870456d8e7c ("crypto: algif_skcipher - overhaul memory management")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 crypto/algif_skcipher.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/crypto/algif_skcipher.c b/crypto/algif_skcipher.c
index 1e61fe6e24b9..21d077a54dd5 100644
--- a/crypto/algif_skcipher.c
+++ b/crypto/algif_skcipher.c
@@ -107,6 +107,7 @@ static int _skcipher_recvmsg(struct socket *sock, struct msghdr *msg,
 	struct alg_sock *pask = alg_sk(psk);
 	struct af_alg_ctx *ctx = ask->private;
 	struct crypto_skcipher *tfm = pask->private;
+	struct iov_iter saved_iter = msg->msg_iter;
 	unsigned int bs = crypto_skcipher_chunksize(tfm);
 	struct af_alg_async_req *areq;
 	unsigned cflags = 0;
@@ -193,6 +194,11 @@ static int _skcipher_recvmsg(struct socket *sock, struct msghdr *msg,
 free:
 	af_alg_free_resources(areq);
 
+	/* The RX SGL may be longer than the request actually processed. */
+	msg->msg_iter = saved_iter;
+	if (!err)
+		iov_iter_advance(&msg->msg_iter, len);
+
 	return err ? err : len;
 }
 

base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab
-- 
2.53.0

