Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3931B142D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788573325; cv=none; b=f/zt+CkNgDXEKkB366l8tdSZt0BE9XSbuRlSWTclAxDNq8eiKhtSZeQjWpvQvueWtMp+uxIV0C380OPIyjOYOf2NQLHphniVMgFAzhlySsM1Pm95I8miG6gv757JNBCgPv4ZKZol6vlDsO8ZDdlnCCTpNybLBiF8nyxWYECHbtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788573325; c=relaxed/simple;
	bh=XqniSnxjZywG1UJ0scWRsx8K04ODl3ZvGr+5qxPtkCc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g+7aSFWidq44gGEtdNCjlX04/3ThiJuA/T6gsdNinX7d3/UBIjmngxusvb4d79IH3MZLM74KrT99seLtTCFXoJfC0XpeeDKGTDIRANnyP1WqjJv8xMRi3N1DJmlFyaOr+2VNfbRIto/TixRt7+zbfu47Jr6uTepBfrEgF/hiTNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENoIpTYo; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENoIpTYo"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so14704345e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788573322; x=1789178122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGqr/uumCH3i/wD1gHE7y7ihUxVOE4Gxi7P61fIxB4A=;
        b=ENoIpTYobYbBK93UEdjZ0EOcLebBhAwxMAE6G3P02k2YSsbaLxzfFtsbCbDPQ6N4tJ
         /40qDeWNQKW6VA9ShH/hHMuzUlHWdvl1SfT9Xvw3vX+8mlJeOKC0L32cN8W+qs/7TUyb
         d4IYwTESbKKUvtQoaAukFRu9Di81EBfQzG2LcBklBqU73oxo2DOqXyAIxHeHB6aV9Q6p
         IJmCdtHE9YhmYjxz0ju52iRifgEhGuFMet/b9l/5pwUVXJ5iOl0JR9lzbcdBCjyYfvcp
         UjENxil9FxZuqiTrN9+tzBs/6ltqsaJ+UxEjjWiFQCNdQ9c4RuZxbZyBnDrwX+2K6QBM
         Kwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788573322; x=1789178122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGqr/uumCH3i/wD1gHE7y7ihUxVOE4Gxi7P61fIxB4A=;
        b=V4thCyO9ys/NYrrdgOrIoGkqfl6CbO1AL5xEdPWZg7GHThH24VUBJbBzLCGV2jj23k
         M3xtIGYnzv/x6hWanbaSbmy7sUQqXxWjoC+4L2Ju0ctiRTC/bgSf3gw0ztWmdft1sa0k
         8mDmkJAcFtq5Qihl3jU63c6x0uZzU6HiN/MeCEhwfgK4VdQySR/GXTCxY7kI0tLDLa1u
         CcHGPwS4kq4cmZQZYl1eBawJKYyKaj9DU1uzVfpYpdxHQYxGTqtKM/be1sqnIaZ4I+dj
         /mLOdtUeh+qlXbNtys5VZkX5JBIE9ciGYmrLue2xGKhDcgb794Hohz14Wi+t7ZCLyOPL
         pMAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjSKB7aO1QpKcL8wTQeWEugV4LnTQBv0ef0Nw0yNA4iDGsviF/Qsjs0zlcuhvcEkozVEjf9SufHrvpEVU=@vger.kernel.org
X-Gm-Message-State: AFuF++nn6w1oZkNqC8jzPnlwj80TKp1S3mk1xsXMFMNt/V7oQwtGixe2
	RruGnM6RmdxcOSReDgVSRCKSpC2gwam+DomEB019shwlpLoJhLy0xJ9D
X-Gm-Gg: AYBFou3E5nEwlBWhauaIw1DNlHZ6eM5fib856pnfPZPpuXZ0rCQioab77UU7wwpRQQi
	p2e76Jpd7NmhF83fTHxbjkogie15/7h2sN+vjqxpvM6G6bdHdzN6evvTn0R1JCG5vIHeQBAOQnE
	YwEzOqNVrVyZ7L3FKzjYQ1opLJv0umZ+SZ1W1Ac38YJeMrANPTm4Yk0NJnxWSAzCJ5Qcf6frHwu
	acgGo1cE7AIApzZ24FejS0bve7ABw/oWKhdIfQuke5ATO42rN+i9VhKc7HiINpZNHPgKKcLAStK
	ybq+1p92stR669ROcma8/skz3dsqXDb4CqHgd3zAy5fmzy4a5F/yRPGHkJBChJS5ZGZh0geYblq
	/sx9EtdcNF34evOxsbJyOS/DtiacmF33z2VchRLTsDAAq69cyk8fpOV4obpHzaVoYlNtgPI/qQg
	5MUqsxY7r4/76VM+Zb/Pnj8XzpUfVhrCBipZ6Rm2LJVgs4AnvAgZE9Jr2+hG2wQMF5iuhUxoP5s
	1pf8KialVFeVUS+E0Gp7HN03lKZu1pkzfmPb+RoVzklaFqnisBAZzxiZddtrJoQ+Fm9MYqCxmmR
	Unplj+yvjETwd6bejXBnhxj9om6LKDbblJ5NKrzc8haU0w1jsBha3tt5XHXW8iAohyc=
X-Received: by 2002:a05:600c:6290:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-49cf7f3d239mr199069625e9.0.1788573321755;
        Fri, 04 Sep 2026 18:55:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff8195ffsm51258345e9.14.2026.09.04.18.55.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 18:55:21 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Liam R. Howlett" <liam@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: maple_tree: Replace removed bulk insertion API
Date: Sat,  5 Sep 2026 03:55:09 +0200
Message-Id: <20260905015509.76265-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit e3852a1213ff ("maple_tree: Drop bulk insert support") removed
mas_expected_entries() but left the documentation describing it.
Document the current preallocation interface instead.

Fixes: e3852a1213ff ("maple_tree: Drop bulk insert support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/core-api/maple_tree.rst | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/maple_tree.rst b/Documentation/core-api/maple_tree.rst
index 12bccfb6aac1..836342fb1eec 100644
--- a/Documentation/core-api/maple_tree.rst
+++ b/Documentation/core-api/maple_tree.rst
@@ -214,11 +214,10 @@ Advanced Allocating Nodes
 -------------------------
 
 Allocations are usually handled internally to the tree, however if allocations
-need to occur before a write occurs then calling mas_expected_entries() will
-allocate the worst-case number of needed nodes to insert the provided number of
-ranges.  This also causes the tree to enter mass insertion mode.  Once
-insertions are complete calling mas_destroy() on the maple state will free the
-unused allocations.
+need to occur before a write occurs then calling mas_preallocate() will
+allocate the nodes needed to store the provided entry.  The entry is then
+stored with mas_store_prealloc().  If the store is abandoned, calling
+mas_destroy() on the maple state will free the unused allocations.
 
 .. _maple-tree-advanced-locks:
 
-- 
2.53.0

