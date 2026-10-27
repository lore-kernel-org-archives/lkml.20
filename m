Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793085055;
	b=1z0OEtZYTGsE7LfX3u0fmAy6pfv0Xt8yqaL/w6xYzuS0PoqvMCDMBqOre2FfSYyn49VG
	 hHREdCdNOCLbEvQf9ZvhrDDvBoQvlJajBQpdc9l5D4wEx4bT0g3PUpI0xuTw62rvy5IcI
	 +BJ81reCqxr9vbIDET6XX30XiBYagkxUtzaqPTe6sZclRTMirUZb9wVO1p+ZTQichyvvK
	 JYi5DVTvi96U6RGASWpzVdAegI1LQeOfomGJt8xW0oCYhasxJzMSV6ckCKfTMkp+xmcCF
	 AGR5NYMSrzS59TC7jgIAXl7kFieFA7920L/ZDf8qz/D2TXkIqA8Bw4oS6oog4glfW/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UZgXNRDybz+RvZYxWwkDSCBQ8npDe221Cmrr41lYgfE=;
	b=F2qEXvlVi7RvLoR26fgF+Co0gLuiw8OQIuC9KP1o+YvAnYYsKa7xCJKJ60s6ek7vBr/S
	 6WDZjyRHvDNtEYzTMBgFeSGSOrEcDUVYzamipz+RiQlWBuA4QO1nbGQwOjXsPSd2mn6Vq
	 NYQw7Ggd8U65Z1/oiuRYAwB02WBOAHpsVurvWY267ZJh2PTr5DqbMMaHhCDnTLRm3IGGh
	 UtUMYKZY9jHsfkgxdWYO7QUK5ItA6nOIc4CRV2yJ/p1hXoMpKzjgZ5gYSO50KNSkRYfzf
	 F6M4eSThZ3O39a+dsY0V+j7cdxNRDOEK6PJ8euRl7J/4LydeXba8jWPWNs0HXcxrxwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dwTpyXHg;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C8D606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6C8D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dwTpyXHg
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so825169a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793085054; x=1793689854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZgXNRDybz+RvZYxWwkDSCBQ8npDe221Cmrr41lYgfE=;
        b=dwTpyXHgcPq55Jo8hHsHeCxQi8/0JH6WIUhkZAVGAfcvAAy4lXod4LbUZAeLWZKhpr
         CDQvUVVRgJp4mrVD8UDXPZOYPzr8QZ6VabWm97VICNo0Qao6b0475hC1H6lyZhfR6nbu
         htu1Q/cR0lO7SbypgUy7XhvKqoy9wWEghGymAZLfL4hOo6Esj+QxvI4jMNw6tbVALqcD
         uR9qd8i7ZB2cZgnX7QjYzumlgcktqToy2h+AJT9aeOX170Hwav356qYdV+ggmYoPTBUr
         riBaWtck/seUkEaM3yXW4wjBRUZNWa5qYiyy5XQpW0Kiw69pNm3trGd+8RyGJdrwpveO
         VJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793085054; x=1793689854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UZgXNRDybz+RvZYxWwkDSCBQ8npDe221Cmrr41lYgfE=;
        b=T+hw49MfOO+tI8NbFZSmnAJoZQy+0RqRoYggymxZr/tMfMXlIHzuk3vM1YjfPKct/R
         SfESt2As0yc58sdtT/2YQ9rNGKuyP2xo3tdoIqkdHQOGzy5/nw9I4XvAt0YJuHuvxJ49
         L1fseqNbSJdG23uVQd2tbyF5Kl4TEuOPGI5ZGE5cNelbQ4fou4AxvlorFiSN0E3g66HT
         fj0faubosNbvzM6mNV7IGNPT3ZzhnkBMYyBUgOoN26sPhuoLCTDWpUPfyRuFpjHzbe7i
         GoXfbj7q2VvtARLPj5qYrESp+3bNpkzlOPgnAqAVbGrD0xxAVuGLYMRLnNZdLMO+8V5o
         9fxQ==
X-Forwarded-Encrypted: i=1; AKwUvByIhz5GhpZOTxxApSvUACSKDcimXkWkYn+yZOv8v8OS+OVSJKN1iGPeofANw6Z1NyZhwEa4flcMJyYd/PI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsTOTUqRdZl1mc9Z/EUN25FaGxecAbJ53GVorWj+nsuXmtFg4R
	zVe92yMlAVSfjvKIHxZFcQPjbFlsgPekXEID6Nh+21byPRNubyOPgYFf
X-Gm-Gg: AYBFou3f2uTmiQMzwquaKF3rdGcxmjkJC+XrMPGA3zmndKWZIZ8qvjtZyKbTk/LQwt6
	/mqPHZErs0YeOXtJIQKileuN+GCNo03dRLpmH5ylalNptr/05ZWuifg1ff+E+6Ip+ZkiMTKVLNk
	ByBeZrMaOGYEgwECOdEhPtvuN31ZqsVd5jHROT10EAIGlSCBnVSxNbBCUiMEqMz9xYlRb4NM3Mi
	hqZJhudMbFVdNedZwm/b10OOc+qQ7VXtjwN9zJClEmdsnExlYnXYsJ7tFESMz4wZphdvx0052he
	K7iSuXOD0yej5JwL6BrpDo8r7xR9QFziEp1pDS+yPvqVN1OrTO+i+udxpUoTdLDsM/erck0yQlU
	6ZUdxtJxmWVQbiLcwaXR0hiGzJ9kUaqAYgRxN+72BXK3jGXFkDiz99qrZnk4sA/o3gF83BEtdEA
	lYMPZrRxhUXcIZDgPDqlFyMtSv8XTEplSFTwIOot7nS/EmtYG2fY0ybqpKMy3EUBpNijgUOgCYz
	+JQWlBUt+AUf8K1q67HTyPuc6wtei+3QRWRT9i9mP5EavBNW/KuQcdhIFSIBNQizQWaGtJ7dQ==
X-Received: by 2002:a17:90b:518d:b0:3a8:cc4f:3475 with SMTP id 98e67ed59e1d1-3adeafd6b5amr7936297a91.60.1793085054120;
        Tue, 27 Oct 2026 00:10:54 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm2277512a12.8.2026.10.27.00.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:10:53 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	work@onurozkan.dev,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	qiang.zhang@linux.dev,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH v2 06/10] rcu-tasks: Validate callback arguments
Date: Tue, 27 Oct 2026 15:09:19 +0800
Message-ID: <20261027070923.3054462-7-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027070923.3054462-1-kunwu.chan@gmail.com>
References: <20261027070923.3054462-1-kunwu.chan@gmail.com>
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

Check callback-head alignment and reject NULL callback
functions in the generic RCU Tasks callback registration path.

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/tasks.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index fcac7361ec51..5d7f234795b4 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -351,6 +351,13 @@ static void call_rcu_tasks_generic(struct rcu_head *rhp, rcu_callback_t func,
 	bool needwake;
 	struct rcu_tasks_percpu *rtpcp;
 
+	/* Misaligned rcu_head! */
+	WARN_ON_ONCE((unsigned long)rhp & (sizeof(void *) - 1));
+
+	/* Avoid NULL dereference if callback is NULL. */
+	if (WARN_ON_ONCE(!func))
+		return;
+
 	rhp->next = NULL;
 	rhp->func = func;
 	local_irq_save(flags);
-- 
2.43.0

