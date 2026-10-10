Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41560374E74
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791625317; cv=none; b=eKW3XJK62w0HyshbKE4oqtx1PPMXv9oMCMw4Kh4tzcWG5wbLKglCGJkzKXxp7oxFx3Zp6leS1x7DLBRFQsZ3oOt0rB5f9o+r4f4uChZTJZ1mabRQDcNQt4G18diBBpYPZ+/D19B0aFZX+v+TTbkerTE27syRJgbd0ijueF7Rr8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791625317; c=relaxed/simple;
	bh=fcAK6r2rcF6i62wxV8cO8KwSl2sDLFS7/mkSRO3X1KA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BYdWPHqkOuYf/Yp3R5grZMbyAV8RpFN1XMOL9Yv10W+mT8MQxcESjuF+aWzs0nLikjY9a+8m6xS9s5b2uYWowoNuOVmvk0Wm1bq+SJKmc9tdagN+Nk5/FO9Q4bP+V0+KRWLh/Bbl9PUwek4bQxuwTqz8iZh+BfHV0I/WLmVW/wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeMoP1ty; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeMoP1ty"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso1029530eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791625311; x=1792230111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NDFNhU8esL7rlE9mU0Mv+uA5ZLgqKd4fX2GtWZW3Ak0=;
        b=BeMoP1tyV8YMNPAK7rNdteRxEtFckFVpsUyyh8ilHKQhY/e4l/9IA/xqnmRcLniJY3
         qp6mHp9R4z0gGgF8EGyrgRY7ie+UCS6dHYI5JLmVnMHylp6gZgGs983Bmj1uf6EXDp8r
         Miwvvjfk4yUtZn1uS3PSB4PbDIT5BKhFM2hHf1pHAQ01MTqxDNyQppOOUiVacRYT+xFf
         4f1kwMPGgllDnpLsq27H/zMn8GzXIs/zeArpXXUUamZIN5NsMJuQ55kvCVozKSB1KzYh
         LUPArqj4QLrzXvRaVpOgtlUXv+YmG+Ym7gmSdxZnTzSMdkLzn9Y/IPBiK207hhQeOZoV
         aC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791625311; x=1792230111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NDFNhU8esL7rlE9mU0Mv+uA5ZLgqKd4fX2GtWZW3Ak0=;
        b=ID/SBFKjtTfD3gFG6GXq4LpUS5ZrIa5M5cgDW+hj7mmCzSPuQZYTMBLvZGAgn7kLCE
         1Q5miRktRz1agpFPw8gu3uqelRtfjqF4+tWPlT/QvVFlOGj9CVv4vjaGvWZw8NJPXhSr
         sw2jk0e8T5swgwXC1J3Q9SD7DTzrqO/nxyk3frUNgXEX2JbMN52CbhWC+JushEQDngE6
         e5Puxk+ztQTu3BWkKJQfpVDMZSZ/zD2niRYvSKjZuQKbqw9BtrYDsrbeK20iGwpv+aT+
         GXf2CcZ/veFU+pBg+BHEk/CxH9CoSGSsmve4Zm/Du7qp7q6jyWz9UxVLFMinWH8aLJgn
         yktg==
X-Forwarded-Encrypted: i=1; AKwUvBzIIQFUANgp2UuyZ+SjjucFlIsBYBZH9xh6lLbQLbvVZN/mFDRbrIFEVz3aHMCeeVmhZb+VVsScVJl7b68=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCPrJF0hXxkdU+cxdr24mRxxAcInciQdtr3UjfDcqtQRlkPhWG
	aCkuAONJJevmln/7o4x2VPYlfGeMBPHIACHrvQ73klCWehy1iSa/YZ0G
X-Gm-Gg: AYBFou21AAGgV+MYtoT9dG+sKGxm4Ap5Gb+hGeNAPpi53u8V7hC6ZM2y+DdK036QE+2
	Z2ZKhjy1P43q/mbzcU5kJ6RicaoFEHIcjQDIsdNTtjfj0elsKGYvupPG/itH0Dxps2OJUrz0q2L
	saRDG+uozaoTwC7LpYnC35t1Kjr/ADKn6mGAeU+l2EQeoosJB0r1tskQ1JIXJNHq+mkC6IIW3ul
	ranugVqamMSLxLv8dDLQqPHfLbdblUNSDiCeSTUGZA7bfFpDe4D6kMXJ//IfCDNQ/W/h/DlIw3J
	ZaoIBpEkOWWRPgrMCeZq6Lua+i060LVHv9WqfDGChWACyUMAIy33ghaevpmeWqP9XsgKdLtN51j
	R4toRq7NCbByiEvJonBznqBnSWEXJSfigk0UexH5KC0H6z3sevOFTvQTwoChenUJWtGG+V4LZvd
	QlUEMkUQDPOtm+v7p8POMU8aTdmfpgouyLve7YNZHDbFckRxTy/og4mO2+4asm+ecCBdIGtioNH
	ejiVoLRujp1lYArJG2wH0TGK2JWQr2PzialOcDypkaxrpUlKq7CmrubFlblD7SfY1ULrLtahg==
X-Received: by 2002:a05:693c:6394:10b0:34a:48ce:b687 with SMTP id 5a478bee46e88-3537e010c56mr5390949eec.32.1791625310936;
        Sat, 10 Oct 2026 02:41:50 -0700 (PDT)
Received: from kanishka-Inspiron-15-3530.kiet.edu ([59.145.191.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca67b21sm13438922eec.11.2026.10.10.02.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 02:41:50 -0700 (PDT)
From: Kanishka Solanki <kanishkasolanki456s@gmail.com>
To: akpm@linux-foundation.org,
	vbabka@kernel.org
Cc: surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kanishka Solanki <kanishkasolanki456s@gmail.com>
Subject: [PATCH] mm/page_owner: make page_owner stack depth runtime configurable
Date: Sat, 10 Oct 2026 15:08:43 +0530
Message-ID: <20261010093843.103169-1-kanishkasolanki456s@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The stack depth for page_owner allocations was previously fixed at
PAGE_OWNER_STACK_DEPTH (16).

Replace the fixed stack depth constant with a compile-time max ceiling
(PAGE_OWNER_STACK_DEPTH_MAX = 64) and expose a module parameter
'stack_depth' via module_param_named. This allows users to configure
the stack recording depth between 1 and 64 at boot or runtime via sysfs,
while preventing unbounded stack usage.

Signed-off-by: Kanishka <kanishkasolanki456s@gmail.com>
Signed-off-by: Kanishka Solanki <kanishkasolanki456s@gmail.com>
---
 mm/page_owner.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/mm/page_owner.c b/mm/page_owner.c
index fbbda7ba914b..fcb584070f1d 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -15,11 +15,10 @@
 
 #include "page_alloc.h"
 
-/*
- * TODO: teach PAGE_OWNER_STACK_DEPTH (__dump_page_owner and save_stack)
- * to use off stack temporal storage
- */
-#define PAGE_OWNER_STACK_DEPTH (16)
+#define PAGE_OWNER_STACK_DEPTH_MAX (64)
+
+static unsigned int page_owner_stack_depth = 16;
+module_param_named(stack_depth, page_owner_stack_depth, uint, 0644);
 
 struct page_owner {
 	unsigned short order;
@@ -172,15 +171,17 @@ static inline struct page_owner *get_page_owner(struct page_ext *page_ext)
 
 static noinline depot_stack_handle_t save_stack(gfp_t flags)
 {
-	unsigned long entries[PAGE_OWNER_STACK_DEPTH];
+	unsigned long entries[PAGE_OWNER_STACK_DEPTH_MAX];
 	depot_stack_handle_t handle;
 	unsigned int nr_entries;
+	unsigned int max_entries;
 
 	if (current->in_page_owner)
 		return dummy_handle;
 
 	set_current_in_page_owner();
-	nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 2);
+	max_entries = min_t(unsigned int, page_owner_stack_depth, ARRAY_SIZE(entries));
+	nr_entries = stack_trace_save(entries, max_entries, 2);
 	handle = stack_depot_save(entries, nr_entries, flags);
 	if (!handle)
 		handle = failure_handle;
-- 
2.43.0

