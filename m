Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021848;
	b=dD2/ku1wkienY1NyMAaDTSxbKl06alx5m+sD3rf7LKoToNGs+Z0JgVp5POwHTLdbMnjx
	 5i5z2FWOyM/OnGLtdvoCHYkdERfwX3RwiIF2AsdvoeNCpGxcl///ENT45SDN2xGKc/2S7
	 deaX4BVXmi8iDCgTnMnQi3qkUwclMdUvzcqbNekKqQqBWSU2PwwMdGFApj7KszDRRYjJw
	 AmZAGogGxPpEqP5BheE3ncJWG4FCyRMETKY37uuiGkx00tpbOaDeFy/Y3d0UyjP+VNziu
	 1JdSwYKaakksC8Hhr+zP8ETLNAak9ZZ0NB3TmifAZZNp02MfhiiDiPbGFVp1JerOTEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5/nDEjYNgzKRTDu0EMcZtv3+LL0G8CbjHSauZYoB2v8=;
	b=ZYDlOAGj4qG1hAHkSJFHbtiJTP1T/wZ6nYhO8ka4fIui110eD9/XEgg093+m+dN3I6Mp
	 I+8rf4pZRxK2yzWZ5gAnnbz6fdK7mPIxi6l/m2qIGqhzk3iuUNPleoMFdKjVjJdwOpM61
	 DFadITLIJQstbzneJiOyF0SeCyYQTpyX1sl9GpksnM+4uPgSYIGe5KI3mvZSk1YckJf+a
	 mrTjOp/cQ95r8L5yse1+/scp6cT104iahJ6kWn/LbCNUy0lofaKDdJ3pplePAl/w0eZpA
	 +GPYuszBVxo0vFAntDyl9AteYsU5HWLGEmC9o+ZOKSwmbQSQUB9hcyTnIlWH6oLIBsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c+k62WVc;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DCC606A333
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3DCC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c+k62WVc
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8246b13cbso26459455ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793021847; x=1793626647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/nDEjYNgzKRTDu0EMcZtv3+LL0G8CbjHSauZYoB2v8=;
        b=c+k62WVcM2EQidn0PH9A8dwqGTw3K3bRtvDZEDgP3V7ABXDe7UsOiG4QMTrfKDzl+n
         T/Xtp2A1P3L3fYQlVncj0ZiAEjOTZKjN7rhxBN0C3hmZ6CgEsEVR8HdvDzWm1MZv7brn
         yLsojyQbtA3aeVFLdk/1RzAi8SAYHT0+oAju07FYm/Y2bsrDg1RuUY01C1eFxqSU6NCX
         kEAYDya1FOjjzyz+pDiZ0vLS4eqf4Q1pjhnAEhAtsrmTRH4KvLHhOI96WWjSLpa6ZLQB
         6fpYBxzI7Bc72jZs6aYVlt87KYgyynTJlwlCKxMLR/Vz2M7Zj/jT+b11lQeJ9bdNtLXh
         nQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021847; x=1793626647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5/nDEjYNgzKRTDu0EMcZtv3+LL0G8CbjHSauZYoB2v8=;
        b=XaqINtRF5b0IAKuxDjYyu+hiKkOxpz7IH9FmGK8APHDbGxKym8h9niyqDfjQG+Dr2R
         yD0BxMsbnUiRwdOEzDpS41T1FpLhxryc1s1wVx1X9+G5965I031jqoCjqb7Fxu6w77De
         DkIdXKqJDZqWHINdDiOn0TlgTwyTTscn1x/p2JwHedw8xUE7g3pRts0U4Heo4/+GPsJY
         +C4wpeUOd8h6gEoz3nylPGKQdRcW0hh/XyI+P2TdMkfpvlVGCV5mg8G33uh2UpdCK8mV
         C4+Tbf2sE7nBLGwna/d+5w5JFfaWUKN6zrGCaLKz39tnOgMC0b/K1gpgPTjVkmJlnVPl
         aH3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxQVQJMefB5kObikRvHFaJhzyZSOVe/WxF1z62zrQOP1jGHRFNIJJedKkwXn5hYDP/ZjAROQZC82Vc3fiw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTFp8RdGhOl/t9hWlqR94JICH8lAo3eIuMH5NRvAt+t2aKduj7
	Axjck+TntV3yrEc+2IJGIQ+eCbXZqvslUQ686bGFjQ94ZlQBTG5nyr4qk9ECjNjvYDU=
X-Gm-Gg: AYBFou2cg6xrZllg+JycRIIjiJNOs4PEdrrFTE6QawC6Rx2yxezdpwZfd8UFDGASbVt
	gn77WKjo4rsqD3y6wVHkAj6A6PIoCwnJWvuOSEddfqi74ZPrcYqAGiw0/D1JafLgPSy1ddP9f+g
	Ckjaaw8c4XMaGiOs3YlU0/zh+2dbxphCbvDqZomDUe5BnrbNTxLO2gcJJdhHbdJ7g5sVQ8DSF1C
	6HM9rG6LdEu8vibpu0hWK+RVf5SBP6jOW9s47653o2lHQJl/9vPy7HfTpWAmbxI1C/tTIlLT4ri
	l13w+fxPQ6Sxv3yxmTaq2BDIKd9gAXtmC/LcDe8pAo8D9GcHHXxmHM/YRZD627SckJdKiAZM6TH
	ocEOyCbdjVhNVeIkh5LknpB8Bh3qybwXRYJc/rNijqI1O7XSKNbZ+XpWcKbGaYQbxPX5Do/KxTM
	ekqFrV+tcem+oyBs3AyiLnfWR0ptyxHSG123BmmYyDqwtMqL13Xe2JajSDGvGN6d65c07EpRApS
	jwzfUHkgz3eAY0pfMo224cvWVRas5YlG8ZbtJRS7gpOGKQnqvlD7Wg0eVHQJRZH+Z0kq50XqN+K
	hk5AssWV22z49lpwiw8HjXXjwkkm3/ogBp8HOxQ=
X-Received: by 2002:a17:903:2c0e:b0:2e6:1c21:158d with SMTP id d9443c01a7336-2ea9c80fc23mr67941085ad.50.1793021847107;
        Mon, 26 Oct 2026 06:37:27 -0700 (PDT)
Received: from yafangs-Air ([240e:46d:2600:484d:51ee:4f49:b5a8:aabd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a5cf0sm17447055ad.52.2026.10.26.06.37.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 06:37:26 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: jpoimboe@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v13 3/9] livepatch: Make klp_find_func() non static
Date: Mon, 26 Oct 2026 21:36:45 +0800
Message-ID: <20261026133651.40061-4-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261026133651.40061-1-laoar.shao@gmail.com>
References: <20261026133651.40061-1-laoar.shao@gmail.com>
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

Make klp_find_func() non static to allow its use in other source files
by an upcoming patch.

While at it, rename the parameter @old_func to @func to better reflect
its generic purpose.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Song Liu <song@kernel.org>
Acked-by: Miroslav Benes <mbenes@suse.cz>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>
---
 kernel/livepatch/core.c | 18 +++++++++---------
 kernel/livepatch/core.h |  1 +
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 517fe42..9d25685 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -82,21 +82,21 @@ static bool klp_initialized(void)
 	return !!klp_root_kobj;
 }
 
-static struct klp_func *klp_find_func(struct klp_object *obj,
-				      struct klp_func *old_func)
+/* Check if @func is present in @obj. */
+struct klp_func *klp_find_func(struct klp_object *obj, struct klp_func *func)
 {
-	struct klp_func *func;
+	struct klp_func *obj_func;
 
-	klp_for_each_func(obj, func) {
+	klp_for_each_func(obj, obj_func) {
 		/*
 		 * Besides identical old_sympos, also consider old_sympos
 		 * of 0 and 1 are identical.
 		 */
-		if ((strcmp(old_func->old_name, func->old_name) == 0) &&
-		    ((old_func->old_sympos == func->old_sympos) ||
-		     (old_func->old_sympos == 0 && func->old_sympos == 1) ||
-		     (old_func->old_sympos == 1 && func->old_sympos == 0))) {
-			return func;
+		if ((strcmp(obj_func->old_name, func->old_name) == 0) &&
+		    (obj_func->old_sympos == func->old_sympos ||
+		     (obj_func->old_sympos == 0 && func->old_sympos == 1) ||
+		     (obj_func->old_sympos == 1 && func->old_sympos == 0))) {
+			return obj_func;
 		}
 	}
 
diff --git a/kernel/livepatch/core.h b/kernel/livepatch/core.h
index 38209c7..361a091 100644
--- a/kernel/livepatch/core.h
+++ b/kernel/livepatch/core.h
@@ -17,6 +17,7 @@
 void klp_free_replaced_patches_async(struct klp_patch *new_patch);
 void klp_unpatch_replaced_patches(struct klp_patch *new_patch);
 void klp_discard_nops(struct klp_patch *new_patch);
+struct klp_func *klp_find_func(struct klp_object *obj, struct klp_func *func);
 
 static inline bool klp_is_object_loaded(struct klp_object *obj)
 {
-- 
1.8.3.1

