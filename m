Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362644;
	b=eumLnVE2/K2whfXEODP1cyaWvwrw4bcUvG8m8EAcCu/DAfmkwabV0HJF952T7Dd6rJyZ
	 VxaGx9vWPb9ymOYxpyFkqeeIZyaIxDkuIiNggwKsw9lop6mmpufqcZSSIEaVKE4YO7QFE
	 8W/pqMusbVSqASq5nM62KigmeA31Qt6r259gB3C4b8jdtYjTM2yb/7z9SzBvl3M6QPTCn
	 2bQjcd4DNuN/y5lCobzt3iM6nDkEIOK81Upf6lPVc74bme4JBZP1PY6uhYL81eAnjQs6A
	 LFuTEnA8GKbNOCO8k8obqJaoqCQCFMojFsEdbWGEaa6/PLozWQx990r9omEUNV6gnFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HpxrkdHX+pHoxS8QiLrmBd8NFzaZIUXGXtbQN2oLq54=;
	b=pyEtYfABsfssHRLup1K2ju5dOtbPj6RWgFpSDrttKkcq3WnhENOPeNljXkoZIQVCeNIN
	 zOAqKL84QFi6KauodBGK95KQsyOf3m8Sa8/ORPJ/n/YFL8b+0ViwU7k6qVS6RSH3lx7q1
	 nygpQGzki4QI91p3A1KjfTLVQNCiVB7WhSYOmcl5pJ44T0seA9GB9cDTzFKbhjUEKPOYw
	 tEy3KiAehRXBsBUSPzIR2FoVrc4baehTvrKK80DEGssxi0cF73HBxTn9KYg6SWpCSc8DY
	 Hwjm5k6xYavn9hm0hxgw1OD22GN/9Gghm8/C4+pmws2BuhWF99l1I8toWzVUr3eu1sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SExPc0px;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC22606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CC22606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SExPc0px
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so610376a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793362643; x=1793967443; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HpxrkdHX+pHoxS8QiLrmBd8NFzaZIUXGXtbQN2oLq54=;
        b=SExPc0pxrHXKP0ZT829eqVWuNQOocfBLkPZpMCKVd5V7/jh8ldGjq6kZKGN3llEO8U
         KI1tKluJpotNwYx8pg3rada5ovdVeCRnwGKjv8CZbF+EMKk85F+KUhJU/2qbBCbOWsWM
         HfW49msLnrkSYfzpk2V2UAGSP6l2MMS7RRbpEuX8yuPDEmGZC3feOna6ATBrJWGFzQEE
         WOjdzr7fiwTKjns+noJTb8tTC3EO1Py2DQyYzRbG1qL4DOABf/vQwDNEzxtjOn3sZkxy
         RnSdRQoFEwu/05DVWGfUpUz521yZhaRlCal1i/KildTgIkdbKA71zVeAqi48PXPsLKQu
         xZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362643; x=1793967443;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpxrkdHX+pHoxS8QiLrmBd8NFzaZIUXGXtbQN2oLq54=;
        b=mkyWvXLMG+/YfVsQ2z0aMikpc4V0l2IXJBtyIat6BFJduK55NIgHgUA0LMqtjXWg3c
         xbkr6FAe4qyMc0f5DP2bGgs4KeJiMoUe4jMKfJtRH9Z+MK7U/O3f0BoTn1O7n+2nhM4q
         SKknF8L2fdFzJPNMUh8+rrUiaL5CrIX+pJbevhuDmZckKt4ZUnLvLcMu8H5DyC/+MJ6D
         xzRMf8+epryFYJNRupimNFR+QVc71kuXHT5dejAtKqOGfj+vUJPwoc7I2Zy3WOppXjcN
         wDcfbqAmlDGZrp4w+QY4RRjk0lTW3zesfjQlosUybcoNLV5yM0k6cB92MaTW0kzu2TzM
         5OuQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4L1X4NyWPI53Gs/RBEu5yT8agDjGB5nES+GzEa2LL8SV1rvopTY5Esii/Aqod6s5XnLz4cZGUiBSuFUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0kEKgwGbhpoakxhuPDRorELLln71q+5JwQR8ezzbbulI/Yj5m
	W78DG6bGerwBnvgs/T0ifhLn/POymFSJhELSgYIoiXhbLm0k/5igMOjnElmb3UkknodsWAc+ckJ
	4SniOXNb89L/SwJcgPTre7Q==
X-Received: from pgby23-n1.prod.google.com ([2002:a05:6a02:6517:10b0:cc7:4919:5ed9])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5106:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3ae8983c798mr1659513a91.42.1793362643165;
 Fri, 30 Oct 2026 05:17:23 -0700 (PDT)
Date: Fri, 30 Oct 2026 12:17:00 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261030121700.260975-1-jenhaochen@google.com>
Subject: [PATCH] mm/zsmalloc: inline obj_malloc() and obj_free()
From: Jenhao Chen <jenhaochen@google.com>
To: Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	minchan@google.com, liumartin@google.com, benwei@google.com, 
	Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

In zs_malloc(), the fast path (if (likely(zspage))) allocates from an
existing zspage via obj_malloc(), while the slow path allocates a new
zspage via alloc_zspage().

Because obj_malloc() has three call sites across zs_malloc() and
migrate_zspage(), Clang at -O2 leaves obj_malloc() out-of-line, adding a
function call on every fast-path allocation. Conversely, because the
362-instruction slow-path alloc_zspage() is static with a single caller,
single-caller inlining under CONFIG_AUTOFDO_CLANG (e.g. with
CONFIG_ZSMALLOC=m) inlines alloc_zspage() into zs_malloc(), growing it
from 254 to 691 instructions.

Mark obj_malloc() and obj_free() __always_inline and mark alloc_zspage()
noinline to keep the fast path inline and the slow-path page allocation
out-of-line.

Signed-off-by: Jenhao Chen <jenhaochen@google.com>
---
 mm/zsmalloc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 6258a4f5e9fce..5d3443f14a48f 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -960,9 +960,9 @@ static void create_page_chain(struct size_class *class, struct zspage *zspage,
 /*
  * Allocate a zspage for the given size class
  */
-static struct zspage *alloc_zspage(struct zs_pool *pool,
-				   struct size_class *class,
-				   gfp_t gfp, const int nid)
+static noinline struct zspage *alloc_zspage(struct zs_pool *pool,
+					    struct size_class *class,
+					    gfp_t gfp, const int nid)
 {
 	int i;
 	struct zpdesc *zpdescs[ZS_MAX_PAGES_PER_ZSPAGE];
@@ -1209,8 +1209,9 @@ size_t zs_huge_class_size(struct zs_pool *pool)
 }
 EXPORT_SYMBOL_GPL(zs_huge_class_size);
 
-static unsigned long obj_malloc(struct zs_pool *pool,
-				struct zspage *zspage, unsigned long handle)
+static __always_inline unsigned long obj_malloc(struct zs_pool *pool,
+						struct zspage *zspage,
+						unsigned long handle)
 {
 	int i, nr_zpdesc, offset;
 	unsigned long obj;
@@ -1321,7 +1322,7 @@ unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp,
 }
 EXPORT_SYMBOL_GPL(zs_malloc);
 
-static void obj_free(int class_size, unsigned long obj)
+static __always_inline void obj_free(int class_size, unsigned long obj)
 {
 	struct link_free *link;
 	struct zspage *zspage;
-- 
2.56.0.317.g454f8302e1-goog
