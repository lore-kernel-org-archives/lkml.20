Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186FD378D9A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788485661; cv=none; b=pN68mycXB48usTgDLn8XfhvX0RgiKWBEoJPTOUEVDJqmcR6xcFkOtv1myW8RrD3U4YKLFwzEICz6MRZo7ExpHIJ3Paq5CqIfyTzbLp05Z7jqi8hr8xaPb0Lw/vrc5ikAzLCRgGcKzUUqaugafnKK/lT2rEFLmPmmOx3h/G8wKHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788485661; c=relaxed/simple;
	bh=mp+W/NanRi6LcS0jIyEjAdqNQV6N3tjeFQnIyxmGDfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ir4h/rG+9gn+MbpRzkes8Hu6l3GDDx1or2O4W9IGJnbcvZVDwzUs4w62shvBirJIeanqCe2v2vYZANCNnV1StHSOV3YGhkNBziU6PAkOsQEL7CNNXpI9PSM0g5ti9EFd+OUHppZsWhdcXE6KeRcB7fR3mfcpVpIn8rqaTTzCJtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqkZ6vA+; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqkZ6vA+"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso252431a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788485659; x=1789090459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnSRfmxyuoGSVIEIapT3+f2N+j9Dyvafdc53a5iR7kI=;
        b=gqkZ6vA+bxBYWvZXv5QDaxrG+jr6Uj3iDEU0d7h3LLScyxpyG+FtRg60BqZ+G+wdQ9
         j7PL9IsGXeBoWlQfZ4b+I7gJ9AbGFg6XVRf6NyJbg/H3ZYuwLLrBnvhf5HZIgLNPWO2e
         iwXfeGrkGR6Da1FaCacMKtUk4zxwTtHDeyaqMzwN0JCg5XX4EC2z5DxHfF1Y+bnDcWTo
         19yNJSqELtsmr89POnKIipq/WnqGFnnCXe8hRnZIbtAsQzprPDOHwUpjT4iMK0P2pB4o
         HjWJQKAApjOgd1iIwciv7adGzVnBP5sLe34ysDaNoCaClk02KVoLjihF58htQZJivcwk
         Ue9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788485659; x=1789090459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnSRfmxyuoGSVIEIapT3+f2N+j9Dyvafdc53a5iR7kI=;
        b=mL01a/6wI6GegL0igMOJUQnV8xhGR4TFfp3TPFDBbt+3ET14QX+RgvxaApzXeQLMma
         s0niYXysgVpws/YvT0bzYheObD24JJnLzCBZejmFSzgUQNOKuD8Y6GPAp0A7SBcwsJm9
         uS7+/waEc04X9gzPWaH5ff6xKpP5lipB2A5vQiJAPVncivuUK/Aitu2LJoqohkJFQilq
         4Yo7aX+zYWrXcBeMoMRNfSkywoeqndGy91w1CbWKefZLV8DHpmasYuVbAd3o4oBQwnaH
         PavxDy0n0KepJEeoCyYDeD7trqpWjRSAQroRQUqd9bKD2yG6sW3/If3vw+BGTcP/vBg4
         hvoA==
X-Forwarded-Encrypted: i=1; AKwUvBwCwkz/b2p7N5owce7WHtDmG2zkeI2KhmJQnmJJr5KTYnRLXkD6TSQRdJwdhzHyA0HemHJDz/cwDPwSz8k=@vger.kernel.org
X-Gm-Message-State: AFuF++llSQLVd3yTmZgN71tb6PQEdofPrYWmvYlrr4cZU4canbjezBTF
	SehXe2eG0L9mcaiiHpWJYe8GqgIEEI6iA0IWGqIBKAJAhZoNDjBoqIEH
X-Gm-Gg: AYBFou3sT5bRfqsmzgUFFUmTh/Vm9JXvxIZQ1VLxFmzm+0R3WXyKxsDzPaR8dvVfT3Z
	53lXkjLS/FNkSiXQQEUpvigOAPZwpoSvlc49pGAaJ0oLNoy/9aQuvLLk/NYXec9uvdPw7MSsQP0
	Af+k5MQrg0zwt5iJSaklQCHG1CdDBFqKF+4YuotD1WolBPIHydQiYOoq5CeLFA6XJwFo0SxHY4o
	pIbQrybs4987DWG4r+7UIYVHEgZ59LEYh2SbdTD/S9rvmxG0rGu++RobyivkZul4Fovo6re054P
	MWig0QntH8gSdn7u0n9BKjQ9gKGHo2nl+SqmVWwkDkPiGjJwYgyrp0DFXTL162gyiU3UxH96Riy
	LFTx3P71FQ8msHAViubHZDPnuhZckNUxa/YbLYicH348+gG+4uXyU92ZuSGk9SQ375JwIw73Ly2
	iqnrvWzAlRQd+0AbYV8Xd2AGEseaUzz6VL1UQwG+NlyZRs+fAZ7q0iibMd9w==
X-Received: by 2002:a05:6830:838d:b0:7d7:4fc7:21a with SMTP id 46e09a7af769-7fa1ff66b12mr2869051a34.13.1788485658946;
        Thu, 03 Sep 2026 18:34:18 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:40::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f470a34fsm1740895a34.3.2026.09.03.18.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 18:34:18 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Thu, 03 Sep 2026 18:33:59 -0700
Subject: [PATCH net-next 1/4] psp: refactor psp_dev_tx_key_del()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-psp-prep-v1-1-d47e9c4c375d@gmail.com>
References: <20260903-psp-prep-v1-0-d47e9c4c375d@gmail.com>
In-Reply-To: <20260903-psp-prep-v1-0-d47e9c4c375d@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

No functional changes.

Lift the list deletion and tx spi validation code into
callers. Deferred key deletion code paths will need similar checks
that a tx key needs removal from the underlying device, but will
diverge when it comes to list handling and when to call
psp_dev_ops::tx_key_del().

Also, move the predicate for tx key deletion into a helper for
readability and reuse in later patches.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 net/psp/psp.h      |  6 ++++++
 net/psp/psp_main.c |  7 +++++--
 net/psp/psp_sock.c | 11 ++++++-----
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/net/psp/psp.h b/net/psp/psp.h
index 86eeba823ced..8acf9ca84b55 100644
--- a/net/psp/psp.h
+++ b/net/psp/psp.h
@@ -53,4 +53,10 @@ static inline bool psp_dev_is_registered(struct psp_dev *psd)
 	return !!psd->ops;
 }
 
+static inline bool psp_assoc_needs_tx_key_del(struct psp_assoc *pas)
+{
+	lockdep_assert_held(&pas->psd->lock);
+	return pas->tx.spi;
+}
+
 #endif /* __PSP_PSP_H */
diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
index c9c1a8826b7f..2556f0d46ef4 100644
--- a/net/psp/psp_main.c
+++ b/net/psp/psp_main.c
@@ -147,8 +147,11 @@ void psp_dev_unregister(struct psp_dev *psd)
 
 	list_splice_init(&psd->active_assocs, &psd->prev_assocs);
 	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);
-	list_for_each_entry_safe(pas, next, &psd->stale_assocs, assocs_list)
-		psp_dev_tx_key_del(psd, pas);
+	list_for_each_entry_safe(pas, next, &psd->stale_assocs, assocs_list) {
+		if (psp_assoc_needs_tx_key_del(pas))
+			psp_dev_tx_key_del(psd, pas);
+		list_del(&pas->assocs_list);
+	}
 
 	list_for_each_entry_safe(entry, entry_tmp, &psd->assoc_dev_list,
 				 dev_list) {
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index 1a2a6b7516b0..045389671d7f 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -85,9 +85,7 @@ static int psp_dev_tx_key_add(struct psp_dev *psd, struct psp_assoc *pas,
 
 void psp_dev_tx_key_del(struct psp_dev *psd, struct psp_assoc *pas)
 {
-	if (pas->tx.spi)
-		psd->ops->tx_key_del(psd, pas);
-	list_del(&pas->assocs_list);
+	psd->ops->tx_key_del(psd, pas);
 }
 
 static void psp_assoc_free(struct work_struct *work)
@@ -96,8 +94,11 @@ static void psp_assoc_free(struct work_struct *work)
 	struct psp_dev *psd = pas->psd;
 
 	mutex_lock(&psd->lock);
-	if (psp_dev_is_registered(psd))
-		psp_dev_tx_key_del(psd, pas);
+	if (psp_dev_is_registered(psd)) {
+		if (psp_assoc_needs_tx_key_del(pas))
+			psp_dev_tx_key_del(psd, pas);
+		list_del(&pas->assocs_list);
+	}
 	mutex_unlock(&psd->lock);
 	psp_dev_put(psd);
 	kfree(pas);

-- 
2.52.0

