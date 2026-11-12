Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494830;
	b=T+5JvUJHr+hPd1tY9QUSUDopJ0AOkIJZuuGsQO96MjbASDAmuDde2SIJJ6NvvhGL9m8d
	 3XdP0TLdsiaOyL8je0yzt6C4qCdwphLe2X8D7J4thnIN6uWLYdFDku4J7r0CdLEmEGvFR
	 Nv54/2t+rRoqchHQa5EdzpGS1DJNwmev1bl0kz+AfRFGwqrk/KicKkwCtFR+pX1GeZnkw
	 kkwfQluiqOyKVM+YjdJuGshAVmtMcxgH9CvPASRqikoy/a7jwFOPfSkp2mWdd5SXjZT4w
	 TvD1WmqA94SBYiR/mJYX7f+CjxTaZls49yZ9W4QQEMzjXpKDBHU26oNkeDQTcJEhEhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BIgDiiCX9yRZLQGXIA3wPjKWsuYyC54v1yTwFIZpwnY=;
	b=MPCktogf9rO+D6l9GXrVqug/RMGnhU94ikhOZLCjqtGy3bl57LYN+X/qI2vHg8wdll1t
	 7twiaKkqay9wakIUjZjnAVzSAesFpLNfXfxfrB2iWf5KFmroqgoOyAL5RmyRbl2pxzadk
	 jFiJGwSda5SehXJU7GtQvWIPMrK4HvfsNeibchxWxFdRmIqu/SBp0RfIyoybXKSUP5Yq+
	 o+JU0TjmVzlaM4xhu0Q8Y3yRovVY7Xhw2JvgAR1MsenaahFNPrOftcOxoSOMAMxaMAm+q
	 ESVuFj+0I2yIbvtErn4OIWQlwvt3+S31tMTAlprJJDEGSFdHEKw+/dGmgFqxdTnwnwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MHy9D8Lz;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D80606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1D80606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MHy9D8Lz
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3791619605cso223636eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494829; x=1795099629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BIgDiiCX9yRZLQGXIA3wPjKWsuYyC54v1yTwFIZpwnY=;
        b=MHy9D8LzZ33JLCJ/8z3aMLAoYhDZY0mrXk3LH478DDMx0OO2dt86uCmPYN5RRr0Ddk
         UiF5miTNHxGyfroty2y3cp6i8WLNzIEvupTeP9LGzMK39ltLj90J7nAcmjpKDdJhi+SG
         cmPBpefFU7K9flcxRSxoyCccbMVS86zOumEapYn244sE4dcctSjUZrKOe5KSrjy3XFG8
         jOP9iPqxMh9CtmDRiImpr2VQ46XALVUBCrauuUzDidue+D5En4nPUpcAbvcRd1+DfMF0
         c10a5sjMExsjxCuf1DhbrTrp0M1TyccHMTHw0DTGNmL8yjqqsyq6/Hyjc/Jf/6aeY/EC
         D/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494829; x=1795099629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIgDiiCX9yRZLQGXIA3wPjKWsuYyC54v1yTwFIZpwnY=;
        b=Qsu9OBw20W2/X7XZa1arpgHb8MBvKTPOBs4wA+UJlmbgX56lq8zChYxATLmi2Ei69/
         i+E66A69901YK1nL+p9ZKCWy2ayKYwLMz11CsM/3PycL8s9/zfFFdgfdf7t41rThMCCf
         XIANQQy404MI0dwdQ4WKSXOgvTbTYWpKF7NFM7+MJOOsoGbmSHIIUMzk5cx8Gx4SC4Va
         XUrXIilfDfLlS7hjHTQfEKcrsz0EAQHMITuy3p/93IDoNftlZmG/rQPvNrQSYvo7FqBJ
         ctlDFXPvyWW8Yof4Kc7+k9ntAwqON6u45xu6x5mkynoeqPpYGE0NtzAI/KQpem/9aoBu
         U+tA==
X-Forwarded-Encrypted: i=1; AL+hErFtC2XHdY6qaHHFwXjHauyzfVot1uhaittWSpbd6A5/t99zeUKon9aSb4+Bt9CGf2c09I+7nB81+khnIkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YUO9XSiXxgf3V+yV8+cNURSqC8LhZS3Kk38cQQI+PW8eCCDnT
	USnYsDhlT1iT/2olK21rTEbl8e2N6Ahn/wpcpfjgQJqd0ht3KN8LaG3+1gxrJA==
X-Gm-Gg: AYBFou1jW27cv2IY7Z4KDNArEsopliwK5Bi7e3/7hfpR5UXkDCxpc1AVIE8PPbihwXM
	TIuHXeLp2tV5fq/CWbkhJRm2IYap9toWJr4sUrLt6B9qZwtE6Gx2ttE9RvNua3Hqgs9OPn74Ab7
	bCongEI6Jd5m01zDTyMDNkSXaU80jdFaUfg6xRy4CcZK1xKiORHkTV4qyJlo934VFBGkYTn38bY
	Zv8u0MGi189HZTJd+ZPqR6q6WqtdxeB8iK88i6meOxuoGbt9nzI6yBf0EI9AkeCXyLE0Fh+k9dU
	hJeQ3PxV9uXR1e/TOFWbhHtvG6k5QeuX++zNzupmFTPRnaJtbasTbb5vZjOjUsgN0KJtITFAH5I
	YbpGXrI80yxgGjLXW6CUrLEd8eN6Osbb/gVdSqQMc5Ubgneb0DU9Zoy+Qpz8j/gpbdGowLvv45h
	LplqTq1hob9D0DNkKsAqxwM28GN1xFdvRPC5PC04vZfyX/Zm9JpHM8yGVbfyKQraYxxqgeutyrZ
	kH/O9gxnMmOxRPzC1l7BIoLuOIjmS/zVqO0L/Nrsdubw/QVHCAxdqk8Bw0fFIAe/LfZV+EM35sA
	8fpDc2FRCuZ4DG+gpkm5qwla0LfqoeHjRNYVO3MktcFAGBXdn4JU
X-Received: by 2002:a05:693c:62d0:b0:360:b8b4:840a with SMTP id 5a478bee46e88-3768694e3a4mr5915728eec.39.1794494828615;
        Thu, 12 Nov 2026 06:47:08 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37925b77223sm214734eec.18.2026.11.12.06.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:47:07 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Hao Li <hao.li@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Roman Gushchin <roman.gushchin@linux.dev>
Subject: [PATCH v2] mm/slab: remove outdated comment in create_kmalloc_caches()
Date: Thu, 12 Nov 2026 23:46:52 +0900
Message-ID: <20261112144653.840367-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Since commit 16a1d968358a ("mm/slab: remove mm/slab.c and slab_def.h")
removed SLAB, no kmalloc cache is created before create_kmalloc_caches().

So remove the outdated and redundant comment.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
Changes from v1 [1]
- Remove the whole useless comment

[1] https://lore.kernel.org/all/20261104144753.2266231-1-ekffu200098@gmail.com/

---
 mm/slab_common.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index 01c64ef661e7..10603b9cbb53 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1028,11 +1028,6 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
 		kmalloc_caches[type][idx] = kmalloc_caches[type][aligned_idx];
 }
 
-/*
- * Create the kmalloc array. Some of the regular kmalloc arrays
- * may already have been created because they were needed to
- * enable allocations for slab creation.
- */
 void __init create_kmalloc_caches(void)
 {
 	int i;

base-commit: ce6518e61e3b4bf4f97f7ac6204049b9eba7eb75
-- 
2.53.0

