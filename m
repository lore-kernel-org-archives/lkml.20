Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08464EF145
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960994; cv=none; b=asHsil6Ls4t26MQgiWt/YIdhrMQGeNaDMCAhNjmPGdKJN/3ocHJ00GU6bs9SBChFQlJt18jf0MO87f/wWvpxZOTfw1Xl/1UV0NQSaJesDjsWRPBXRht9DKrldBqtCCV7AtBiNAeyzkt7Oz5kYJOHcXlZvj+17YQt5qpd7Ws+6lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960994; c=relaxed/simple;
	bh=8NuyF6qDUWQBXBIkLeP3/lavelfuwnWRCmtSE2YKnuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ShPDQimuQKhiKeE3FOYCPENuzQldCnKIVZ/NdQ6bYxRO5a/KsoXJIE3YJ2ePMX++x9Vm/y9C15aJAH/E4JUFLjk9gN6e1HRMg9beaLaMdAfG8TSuL/lRa0pmB8BCPmU06NRlpF8FGglJRlVZ8mNqgcNsjLdS/NYAjyzeJ8JTY+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNjFMNFv; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNjFMNFv"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2e688de2eso29059765ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790960988; x=1791565788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtL6vbzPvQXVWHTKwirmF+KIwLuuD5CR0v0OHwTiljs=;
        b=WNjFMNFvKfJ/1IDsq9qowgsjjFhOqzTdxDhAn5mfmVv2jV/R4X+ceVNQMQqs11atoJ
         Eg1fu01GcZ1ii0pJExuSRo2TUokI0P54HGPAELFfS0XSOVDlInbOQ8yt1Pix+BOWA6Fj
         KcH+2omNMQh2taPwqtDmr3TOElqqTnysA12XZ6MtS5syW7jcchtlCdvSpm9gmrZXYXyy
         fdGs7wPA4bWiRlyPt+H1It17NCvrQAag1XGULJl2wsfxYKjWWdGXqRDj2KRlvt5bKlPK
         RBXxJ8PCvkQ3dpQsDQ38sGOHY4qUVXU3SpcgE2Ds5k1nauOc9P4O0qyqpwSGpY/utol6
         aEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960988; x=1791565788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtL6vbzPvQXVWHTKwirmF+KIwLuuD5CR0v0OHwTiljs=;
        b=2gXFTpCtF9PMM8wzBSZN39FhuRIuoaTwR1Q//k9EnzZkdPeFfAWJVPTQnktf476eFR
         cZnCMCb8uEZzdn79SWrOhYQoHywD+O8862h2e4jgToZJiRrVKImcMw7hDLYW4NGb86lc
         rNojVVfqGPt2zTkcdkfJzbObuynczACje8f1Q6soDVf1mpcBj+t97Y8um7AE+pxFWZUq
         klU1rGEP4ULZfcDJsJTbp1kl7GZgbx+LrzQ6w3zUCpI6YTC2+DHsYRr4tqXFRaxi1nGq
         ta4RdeDpTjZ3As0c/lbU/mcbq1GrDKqMnxhSBsFtjlBMJLvjmqSp2IfSYblprEtwaS+k
         JGew==
X-Forwarded-Encrypted: i=1; AKwUvBw0+9Zyryp16R1mNgWPGThbetxTdd+anraQOhXlUUMkgB6A+5dhn0lSKo03zap+Vr6nY44CY/zSjG6Yu+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIScfhMC4RFxBEeQfh2xuxkxDh4+euf4FogYsXEYt792ue1gOgn
	JrhcKyUdJ4F0Yz3Hf5FOW8Bl4OBXE47U0DsWmxF27d+X9TrIswiQd9GC
X-Gm-Gg: AYBFou3Hac5jaC2bRtfkYZdRoBEYzRM11GR6HzQiBRh7GhE+lGJ7deB25AEf/p7/CR3
	L5qaEgfYhXkneLRdmCxUVQc/zGI+El5e2xfnM17stCNBXBBY7oesCSMfhdO8hDA98kxwvyqHgoy
	0amZbRyFvN/k/1nGECwY6PAh2KLuy9A7oT7koj2jYLeJgUeKjvayCG22dK5viGxnvv0po0QVQrR
	BQFRrHa06VtKX0Z81u/+vRCFqKJPeMmOgXIMGp8e+Jkcz/39y1LeimhuvjRXz/dFeVGV2VfPVIs
	Gv8o45vPmJm6vrhgbSHq0H7WAZazoHZl1dL99z8LhBUBzHJwmwOsYY4obNB73ClPpAVNkLn0+/+
	c3ygvzWVEpOV+QyLvPr1/lH4qojVNB9y5WdP+iIEJjBOqrBjCrpmgdg7xETTDQksMUoMU8Q0JSC
	r4ZxU3MIXKjA5QfKxqgfZeDurQE3VZtInE1yKP5mnQM1KgfSWhwegR4wdpSOltQ1sVf7QLZbTUC
	J7rkXn2hwZNB0oTWA==
X-Received: by 2002:a17:90b:564e:b0:3a4:e9e4:37f9 with SMTP id 98e67ed59e1d1-3a6ceaeebe3mr3029048a91.31.1790960987338;
        Fri, 02 Oct 2026 10:09:47 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:09:46 -0700 (PDT)
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
Subject: [PATCH RFC v2 04/15] hazptr: add scoped_guard() support
Date: Sat,  3 Oct 2026 01:08:36 +0800
Message-ID: <20261002170847.3653663-5-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002170847.3653663-1-kunwu.chan@gmail.com>
References: <20261002170847.3653663-1-kunwu.chan@gmail.com>
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

