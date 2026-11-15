Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794731110;
	b=UM6fMmjjZCvR4QHdpSrGKjFJN7sfo5oKu3kFgsqSIAIDYtgbwCeFwoc9R+MYbmFhKI09
	 JBXaOTnzm1MOvwaofpsZVqYBGqOuoOrH+PgPDDFKDVXQ98sacnKItedWMUwa4p70X9XhE
	 iDQLLSDfBzIMFAkA0JPvvJQndD0oBC30t1cO7WecDSE9Kb7hru+HX5iJIAzXYAF+v1hd8
	 2QAARzuL3N8acQOUS584Tpkou8bbT4xN9k/KXYIWi2hZ992SZ2/3wgoC1SK2/0eRMqELA
	 xQhUW1najo+tQsMOYNYxtTkehCWuyJjvSUpvpEN3VBTgRoedaKCZ1rmKhqJn8WbGvyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wnoWZ39CWKlVGBavzBsrpwv3xdsKQNy7nRW5s5dEtYk=;
	b=B0r7o3pQjeZPoZrl23lV4hchifS/c0eaQolxMgxx3njZZaYs6sM1o2YFLiiv0Y5iBMMU
	 HLImPbo6Pgzs6055RzW+QwhlDk5Xbv/ORkfG5zF14fPp37s0sRwkRLKWWQrmuSS1DsGns
	 0zgL3/Wwzzqxrv/tC8Xpb/Ksd67nYozhls8oKwQ1lGRPpsFlWL6zMDxPJX9Jw+x3DYua5
	 20fU2nNN64PK+K4UY9FXtQyuL5tyFtAUSFJThQ0U9vXWTct/4Ur6ZxfELsAYIpufOExlI
	 LcwXUKhmuFOR1IT573oNK7/pEJenyM9PoUvnG+b23Ww6OAc5TrKT78pBQhvcQSET0nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPUH+C+d;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B95606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B95606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPUH+C+d
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so5580805e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794731108; x=1795335908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wnoWZ39CWKlVGBavzBsrpwv3xdsKQNy7nRW5s5dEtYk=;
        b=wPUH+C+dlgNprvFfVN8anGSl4ZCUEuWMG85Jza2LpZhALRotttfpJcHf0nNXoJxD3K
         HuyMkCjdefbQnLp1dxVyzbZWIBAtKI8JpCM0Kda0V8QXhK3PM/9gu14Thx/jgSqy9faq
         yOYfT2bPqRpFzn3a0zXGcJLLQhcVi5L6aG7NxkiTnOxeofuI26lJPLxzFvEdf0Kbxi1u
         xW0RdESvOjxwU+ygaXqPqSuCTWNg9+vf9Z6tmmY3KmDQULNAhsIPPH4gwmqBCmtPzorJ
         Gk8vNnd4kSdpJoepuh5Px8TB1MjgkwM61ncajdcsOJ0caAUAOAuszWZ28oq3W4C8i92H
         8uUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731108; x=1795335908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wnoWZ39CWKlVGBavzBsrpwv3xdsKQNy7nRW5s5dEtYk=;
        b=jPQ93daVlz5vQt34O7YEWELwH3PMSb+NVVNUqwD/zcikQn4V/N1fVUo1woH/JbZ0vq
         5dGFx5IkDtrpBji6bh18RqLJjGyFuqPQlmIQn34GoiWQWUi2f7atsIom4A2rrwauojEQ
         CbVOuNkjUFrBMxRUrA6XdaTIcI+Qz+FUdscbrtMUH1Yu6s6QYXPFD/bNjF+LkmhQnvEp
         IuiqPoUM0+Wfq+oFwWbOpcmCCWJ+gOku7IxCFnChqLLIxL7jYkueeMTp6D48/o+nXJY6
         YfSyLmZMbhiZQuZGnMzVxKkRbj0tXrSr8+F82sdp/4z+NPLoEUyKmKNsEXnQQj0C4VfW
         d0hg==
X-Forwarded-Encrypted: i=1; AL+hErGrOLll+wqn8xBTjeOWu6K2wXXcTG3IaZ85crCdrWAWQRqv04/lfdWzSFLZHzk0ZNjryFLfcZxRFjxSnAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0O4QWGw02ywQdsnLCNsWwNwOZUti759lrH4MLp9rqAErkPD4Z
	WFsRiNMxJoOxPcdcymKOFBaXdvpX6Eq+x3yEKSfVEE4JYbA/15J7N9tNsNjzpQ==
X-Gm-Gg: AYBFou34jZCsgvn2/vC17L/eBqr05vhH/fJqcXcelZnS16aD3JS4NCBq8ytjReIvbzq
	Mm/oesxW3k6z7o8Put0KYL5++y7ZvZ0CRfWePvaj1GCBYnjCzAfVj07cYywD14OyTmrOZWi0F5n
	Pn3WK1hYoTV8oY7pHg3GDwkVYIf/RmuBKwQzwyL0t8OmITBbbvY73jZkJztnL3xWd//Ph4eDRHZ
	0rlYEC8DO1fIdMLiecHUfHEXIoAFaEH4NyHl7OUl1MmPM/g2+7S439Ye4DHg/IEMwzkkVqCivQn
	4MpvCH5ou0wY0ENn7yILZExJClhIUUuTbx9qYOrccPHf9btP9H0BjuZFu5A0piqYOQ1uSY+4+k5
	hcMl7WU78yqOyrWN+W8oht3+mYZIIez/IaqiinGmoQhkjM0ubeAYzEvO7TTNKazlNX2L11UyFxK
	l6whorL52/f8sCOxw4meOiBOrpTcDLIhBCnbNjFPyLOfUYwTNMDa7/ugkbfcA8q1hal5cz5g+Hc
	bzAAO4bv4TLLGCrpqqrfcUQRj0gdwR6zWU6+0NsnFSWqsBrD6eD3Yc0jndRwK3IgFriiRZ50lWN
	Hk/68V3JEGvCtPR5zTioHCxUAq40XnVtFHLkQA==
X-Received: by 2002:a05:600c:3486:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4bb55a6a828mr164742915e9.10.1794731107999;
        Sun, 15 Nov 2026 00:25:07 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:474b:1700:dc0a:bc51:e26f:5cf8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28d0b2sm236796415e9.7.2026.11.15.00.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:25:07 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Anthony Iliopoulos <ailiop@suse.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dma-debug: Avoid uninitialized hash traversal in mapping dumps
Date: Sun, 15 Nov 2026 10:25:06 +0200
Message-ID: <20261115082505.2012573-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Booting with dma_debug=off causes dma_debug_init() to return before
initializing the hash buckets. The debugfs dump file is registered
independently, so reading it traverses an uninitialized list and
triggers a NULL pointer dereference in dump_show(). The
debug_dma_dump_mappings() helper has the same unchecked traversal.

Skip both dump paths until dma_debug_initialized is set. Check the
initialization state rather than global_disable so that mappings
recorded before DMA debugging disables itself at runtime remain
available.

With CONFIG_DMA_API_DEBUG=y and CONFIG_DEBUG_FS=y, reading the dump
with dma_debug=off triggers an oops in the unpatched kernel. The
patched kernel returns an empty dump, while dumping with DMA debugging
enabled still returns mapping information.

Fixes: 173735c346c4 ("dma-debug: fix debugfs initialization order")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/dma/debug.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 36c1f7cbb2ae..2f487246d8ce 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -543,6 +543,9 @@ void debug_dma_dump_mappings(struct device *dev)
 	int idx;
 	phys_addr_t cln;
 
+	if (!dma_debug_initialized)
+		return;
+
 	for (idx = 0; idx < HASH_SIZE; idx++) {
 		struct hash_bucket *bucket = &dma_entry_hash[idx];
 		struct dma_debug_entry *entry;
@@ -576,6 +579,9 @@ static int dump_show(struct seq_file *seq, void *v)
 	int idx;
 	phys_addr_t cln;
 
+	if (!dma_debug_initialized)
+		return 0;
+
 	for (idx = 0; idx < HASH_SIZE; idx++) {
 		struct hash_bucket *bucket = &dma_entry_hash[idx];
 		struct dma_debug_entry *entry;

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0

