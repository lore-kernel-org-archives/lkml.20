Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811349;
	b=kw4mcINWrAx4QsFVzk4Q7GeMXsIKulsPiNhtw5KIVwsTkxJGhoiWumb3b1nnhgyf/40e
	 KUrYuvHCXrvv6wVQUs17uRHc6b52BbJDD1FBPTH/0DP7jEB9QRONKXQWYcYguVReqt1lE
	 PxAJsmDatz7Zm5rqWkFeLqvs/vOGnrvyBZ19xiR8FHprOtwRbLE7XxNnB4HAOrsSpmu4m
	 SvbzEwun4kY8ATL6V+0oCa9Uzkyozkk8peL9uDWNaiKGXzC/Hs11+QutJuXJUAPblmiex
	 cWK0FoEVM3A1bMzHNy8DPQx46UhvOlulFZ/4aQBcjtIXNUHLPIMJdw9P6WthpNcx7nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zN0OMa6DsitFd0I63/8rm5wsSSArSxIu8WmzT7WDGsU=;
	b=q+MpTvUbdM0pNeclhflqMCN5e6eBaLbZwGVjWZpXNhkuQGim2u4QI8nTmMo2XA4cn+lW
	 /uaVoyV0KTy2qv55Mg1b4w43GX2p42U7R+6mrVyn41aCfDoNTgKVFkx83Pci/lkgYJWR7
	 8hqwBW4AsyWEZ3SIYN4IyK4/TaCqiGrR8c/N4gKTAgyCvU+TKu9tgrRyGKUQk3EhMn/CH
	 EsF0zretXBAI1qKpUAigm/Lm6+45WPxTE/ONXdrLxgL2RhUwUTXEUHQ4xTuU1IMe9iG6p
	 QLItNI7WBECB8BtnptCDLZIM8uZ8b8DHWPxOlRXFk1pTIEJMMN6R5hbx5xNneFV75kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GfhIGsI1;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF42606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDF42606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GfhIGsI1
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a18fc7a38so2022752eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811348; x=1794416148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zN0OMa6DsitFd0I63/8rm5wsSSArSxIu8WmzT7WDGsU=;
        b=GfhIGsI1A79J7jj8MJAkxgJjudxW5sb6BpufeqVLWo4k5o9TBPAOkoCPeNcDs2elCb
         91bVJsIm83LcNhiO5mYbF39oD7VEjY9BiK+zk6u8gqDTaVdUFDv0uslgPSVOPnH1Kwk0
         hW0fpiJUPDSulT9sjmuAXODm7KaVFn2/qcZ5VCjidr1u9VELGD6xVErSX1p9jDOreK11
         c0wqkNvo4FFRBO0j78kT2Pted/n+mcjMpXtVQKHfEYds8sVK4NeBEAWete0R+fJr2Z8Q
         gVmU+4MLZBzoKT47koTB0I9kNjDp1iWCjikr7bMtNUnkLsmXm+5nFGPVV+slNHi8wJzC
         BIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811348; x=1794416148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zN0OMa6DsitFd0I63/8rm5wsSSArSxIu8WmzT7WDGsU=;
        b=xMJE8ZuoWZn9D1acZzfChU05NEvX9TTVStYd+8S3d23qz8P0p00oFI55C7+zyLlLuY
         UYhllyH1IZINOnUsMX3B9XXkz4ymdx3Rqywj8r/zwwdM053gyIvWcjqBKwgAujJydLXO
         /NoKcA/OGBxFg8iSHEhd0z+sFOGMocvjQK4V7c8qWUjB21/oKskfGUdfjbiUXXj9UD+r
         b9MBM5I/NjfgotB5JetrU1L9LPAGXClTdoY6eVq9/xT0hvsoHiXekeVk4i0RB2Bia/nn
         j0wvbHj+dWV3PDSgbSHG1k8Hu3MLPYILBApwFEc0mdxnlUJIKp3z4KgI0r+npxW9c+pQ
         9o0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVD4gJgrv/dRIku+Zhqil6qTgE2wDz1XbvLDlH3VQb2w7FsXlXk5Tig+ZRpAII2xYhQsY0+rRL3Qh1zT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VWTbCFdeiVhInRfGAD8J8b+I4hI6D+kicUcW+V8xTOEObpRlz
	pWnJDy8YATTN8h3l6HTQTLJbWOASwDpWBjN8gsiyb/BX3wJ2PW0IZ7ax
X-Gm-Gg: AYBFou3C30GxkQNYCSMyJBRtrvKwPABJUWE1smBj+V6qLxAccoFX6LdQaVymMgL6bo9
	D9L6I5KC0EfszVLygqopYVotl/Tn0Iz4ckoDJLVZX72cNbb/0SEWq8xxVCpcvSwsIRKfE+qEAg0
	giR5Jse8VS2N1UIZWyZkDTbqotcGBMobRDi54AkgEmBc+PdJ2i5w93s44Ah+FZyXVvJ8cRvlM7o
	FyvzRbR1+pQLu0RlbEMwl91ayVZYm3GmBj5SyBWuKjww3UKv/H07lK0S5u9YA4E9pGN7I7/POih
	f5b+zjBOyGFojRFmvPaJ/FZkfIpqNRlgDahP1KP79NSdEKV8jk9Ln1KoZUMSmc4RS/oo12sWBC3
	xF1rpRme6QYKjZ1PI7hQu93KisisxJH/pXf7J1+NkmIVeagDq8wthMI17rE5rjNI7a16ZtFdZEH
	u15gMG/Bq1TyNigFCVt69+UKrZ8M0yoiVjP8Lwav+M+1eYPSgsVLSH3SBZ5Sxxb1s+wdvB6K9w0
	ogJW6I3HMEkjT9qT7ylG13q+yew30DzIjpR1nKhbLTWl0By91sM+vnisEmMGu9OUfjiqeoE5ZVF
	mhY1VvmoPWIeDAy0uXXJyoDk/I0rH4/RRXucDV4hRu5SU0Cp8uFUIozMXCWp
X-Received: by 2002:a05:693c:6092:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-36a423e52c8mr29321886eec.23.1793811347548;
        Wed, 04 Nov 2026 08:55:47 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:55:47 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
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
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 03/28] hazptr: Add scoped_guard() support
Date: Thu,  5 Nov 2026 00:54:21 +0800
Message-ID: <20261104165504.2430480-4-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Add a scoped_guard() class for hazptr so that callers can pair
hazptr_acquire() with hazptr_release() on scope exit.

The guard holds a pointer to a caller-provided hazptr_ctx rather
than embedding it.  The ctx must remain at a stable address while
the hazard pointer is held because the slow path can chain its
backup slot into the overflow list by address.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 include/linux/hazptr.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index d37792af3493..3372b1cdbee6 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -341,6 +341,43 @@ void hazptr_release(struct hazptr_ctx *ctx, void *addr)
 		hazptr_unchain_backup_slot(ctx);
 }
 
+
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
+ * cleanup.h releases via hazptr_release() on scope exit.
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
 void hazptr_init(void);
 
 #endif /* _LINUX_HAZPTR_H */
-- 
2.43.0

