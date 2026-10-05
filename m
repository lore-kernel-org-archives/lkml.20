Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CF44D796A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220605; cv=none; b=VHDii72SE6s6aKrJ2AhpKGri9c1GVCsj+e43JvJlBk3lHEDjw/MXwRX0XF9WhgkLV5ddARTTiaU35xUkqTL6Ori9Pg2GKU2P3NoUCjTlUJa+wyz7aJkpmD9pPsxl69z96qVR4YMgfFCXi3ssnVeTDo6V7iy10lOZPVt65Lb7qPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220605; c=relaxed/simple;
	bh=8NuyF6qDUWQBXBIkLeP3/lavelfuwnWRCmtSE2YKnuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rtk0IQGaGfCBBLs80c6U1KJ5hC1Tinby6XnXrTjs0kKMhZN3XvoqeJVBteicdD5V3WpDtjn1CLD7LbOLgoSYAX0Qq4kopi1UTh72YXFVYiH+MUhLDOlhICSJ4Lq31Qy/T97mgmDms3LwTFhDE222JELdHyvh9KtQJo1J9jPeyE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBBcsIKd; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBBcsIKd"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a7d725ca09so713652a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220602; x=1791825402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtL6vbzPvQXVWHTKwirmF+KIwLuuD5CR0v0OHwTiljs=;
        b=cBBcsIKdTf/4BM0kB37KIEAy8UOCwt6erlxIBf/0s9m8sWiH9s6KTjZG/xgjgnnKmB
         vksAzdqXZnKnPuqx9/06JECP01BeUCmNFvV+CHyv3oTocAapkIHFVv6UYSG4+yFzNQV4
         0T8jkn0uPcNI+qhgjXkRJTUn58+xcVxVWC7rXq4a7GBsvOkJLyGzFez95P7qGhL+9zfv
         F1JC9nn5oC9OaH4WKSS4VexzXarso1GqrPTZro8LSscwIZHSA74348qxYrmz6KUZERt2
         4IdgP31u8tU/gimJ+M/DXrFX/HeeStwt4AqsY+Hmy+SSeQSlFalUSSts3j0fCz9C79Nh
         A0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220602; x=1791825402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtL6vbzPvQXVWHTKwirmF+KIwLuuD5CR0v0OHwTiljs=;
        b=1LaXOMrVDiFJut0gisr9NTcR7Lc5EJAFg/yj9y/cxhP5mUifjeQKv4ruEaYPEDxeae
         ulZ8R8CjqZNPAUJGnuzmzpdzi03Gj3dGqxBQdyDoljUS6OKwC2UHWMEEHL6pQmYWlI6D
         NQX8gqReCV2HB/qU22i44MNYhU1M+cFaU1ndpzELwlQdfORrfmUJYP/phi4gKEcAW7i2
         fW8aCfzdjLR6C+NVkIPoZc5Oaons4JNGFbgyc+iNok/NAn3b6VrpKegiIuBEhdjqHLO3
         y0r3z5UIWcfNJK7QrR/SyRCCIpoud78nVh59/cfveWuXB/yU/AMpIG4cW802H8WoVdjm
         4VNw==
X-Forwarded-Encrypted: i=1; AKwUvBz305qO5NSVW9k99NBXjfOadoQ3xCDSjblx/PekpUiV5X9oBZKOk9M6G8iCmwweA2w6E550NcKZ4YkaydE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYu8Xh2/1yPN44NUIlIYCFkcSBrCj6M/jK08+AI8XPsvSL+7ci
	shlulBMz3m9TpHwNNhgpVUIQ0dlgcNVy08datFEyo3gzA0Thv0DnRxLL
X-Gm-Gg: AYBFou0t0ElDepOSsEbo4vzSRa17cdP6c/1CaGiBQXcfFP1IaLmaSw8HdJQM+81rZ7B
	ZnFpmgMnOVPlskSGI0cPfFjOH0UrZ6FD4Jwfyzi7xUoWsUeLE2+sp/lwV0OWVfjEuz37UPjX13y
	CGjwrIvMwY1o8uOnZ9zMkN+/bxGQ6myVyDsBNE51ugx8N80YVf/n+dUoRc9al3IrF4tWTYvJjXH
	pdoX0YVCifdSEEiwx4P/ArO7B0tsGc/5mjeOA6JQ0dK46MQNKbnf9wJtq8itP7p/jD6d6xuKs87
	tDQxbgmVHvISAMVx0xaw3Q+CAC+z+8aC8VKZnUbm/JQKlo88y7yuYLZz4i3H3yJgqIdHDksDSa3
	hAPsr/7f3kLqSwQjhUtM8hBNNDY2u7l7SP5DSvDL1P00xAvNLNTqTxEhWkKua7gSd9cp8G8VKlv
	1xkkHpLwH1uzjCQQ2+FsYlspcFqQ7CPrVmFCFyqz/VvgUeifKNmkPd3EpHP8i9aIF3j/m7yZ1gP
	tussyjoMu2rbEq5AgRje7k9EeLRQA==
X-Received: by 2002:a17:90a:dfd0:b0:3a4:bc68:310e with SMTP id 98e67ed59e1d1-3a6ce7f684amr7983000a91.39.1791220601705;
        Mon, 05 Oct 2026 10:16:41 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:16:41 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v3 04/15] hazptr: add scoped_guard() support
Date: Tue,  6 Oct 2026 01:15:18 +0800
Message-ID: <20261005171529.1378809-5-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005171529.1378809-1-kunwu.chan@gmail.com>
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a scoped_guard() class for hazptr so that callers can pair
hazptr_acquire() with hazptr_release() on scope exit.

The guard holds a pointer to a caller-provided hazptr_ctx rather
than embedding it.  The ctx must remain at a stable address while
the hazard pointer is held because the slow path can chain its
backup slot into the overflow list by address.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/linux/hazptr.h | 51 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index d1670121947a..275cbe54b075 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -320,6 +320,57 @@ void hazptr_release(struct hazptr_ctx *ctx, void *addr)
 		hazptr_unchain_backup_slot(ctx);
 }
 
+/**
+ * struct hazptr_guard - cleanup.h guard for a single hazard pointer
+ *
+ * @ctx: Pointer to the caller-provided hazard-pointer context.
+ * @addr: The address returned by the matching hazptr_acquire().
+ */
+struct hazptr_guard {
+	struct hazptr_ctx *ctx;
+	void *addr;
+};
+
+/**
+ * hazptr_guard_acquire - Acquire a hazard pointer for scoped_guard() use
+ *
+ * @ctx: The caller-provided hazard-pointer context.
+ * @addr_p: Pointer to the pointer that is to be hazard-pointer protected.
+ *
+ * Acquire a hazard pointer using @ctx and return a guard that
+ * cleanup.h releases via hazptr_release() on scope exit.  The guard
+ * only carries the ctx pointer and the address returned by
+ * hazptr_acquire().
+ */
+static inline struct hazptr_guard
+hazptr_guard_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
+{
+	struct hazptr_guard g;
+
+	g.ctx = ctx;
+	g.addr = hazptr_acquire(ctx, addr_p);
+	return g;
+}
+
+DEFINE_CLASS(hazptr, struct hazptr_guard,
+	     hazptr_release(_T.ctx, _T.addr),
+	     hazptr_guard_acquire(ctx, addr_p),
+	     struct hazptr_ctx *ctx, void * const *addr_p)
+DEFINE_CLASS_IS_UNCONDITIONAL(hazptr)
+
+/*
+ * The ctx must remain at a stable address while the hazard pointer
+ * is held because the slow path can chain its backup slot
+ * into the overflow list by address.
+ *
+ *	struct hazptr_ctx ctx;
+ *	void *obj = ptr;
+ *
+ *	scoped_guard(hazptr, &ctx, &obj) {
+ *		...
+ *	}
+ */
+
 void hazptr_init(void);
 
 #endif /* _LINUX_HAZPTR_H */
-- 
2.43.0

