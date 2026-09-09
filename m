Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8DF23C4F3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 03:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788925134; cv=none; b=XhPN/XZjb8wQbyI4jZNrlxen4cSijmOZC80fLFP2J3VihrX2LzMpdRBwmqqyERyFkO1dy6rHzVbHrrRvlxeH+t4pPurGVOvVmDnRI4fRWWo7KlGrCBCKLJhTgBgsrX+R6EwzSHXrqrtJRvNVHmhC0j1tBmKgw3KsZ+O4/8nq9hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788925134; c=relaxed/simple;
	bh=v/nPjsQOCEIKEWJ77rJZFCnUUARPwNEBAmiHhVHNtSw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZfAWjZwYN2twMASXHORMQcACU/CSFtWR2jt1BjoKSkpFI3/Be1mXEpCJEbUlkRzvgn/SXZi1TqX8VSWns+NqypKuFuAByeEM3xkZfJbCSqVksFzqnP+oZC12j73R1mogFkLphr2YXjMKJXp+K/srVJWYDKeJ3kwiEnhQinlG2DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnUysI1h; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnUysI1h"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398beb616f5so678263a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 20:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788925132; x=1789529932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CBiLqTkQaNBb/2DBOx2xL3ycZ7GO8eo7KWlmm4z4Kzo=;
        b=jnUysI1hv/orHZPOUyqwAHIiYHu/gy5V3VY9H0e5hu5TOuna+//FDlYKYidFsW1R9m
         auIy0qQY5j7mVwPyMhpUxxB7+/yqgwveNn46UyKs+DcFF+YLhmC8w9p8Hb3Eu7R2KAUu
         YMmfHHahBnSukFzoNJa7kOyo7BXNFVjRR1XLSrnwYmCZ7gqumvr/jtNrl8Ynn9XWvreZ
         RAJ1ZquioSgXsp/W2T1k5yd4piOj0T8LY82+WTDaMqOa8tGTykbJIhLsLFOquBlmSe+G
         +vB/B/dE3BgxjiyIdWSV1CHqCGGK1Khfb/LhjTFvG+ApVs+U4MmExE8JNPm4/rxtr5/U
         rgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788925132; x=1789529932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBiLqTkQaNBb/2DBOx2xL3ycZ7GO8eo7KWlmm4z4Kzo=;
        b=MJkzEnGNqOHvc6X8bwQDQRapglXg+9VpLAdZvsBI73u3MIcVYls1dpSYHnb5ZSAn8a
         F8MUfiAHJ75KRkKXQdAbkyFrE9qkrx2Y4ZxOQ+Vkzt3XSssJwjh4x4tEb4H4Z3Ujb4vm
         /ECdHdNhEooVspB3dN7w0Ds0n4BSGddwIZpfyiKf3oBGpm8o215Sm3ZFrJaCw/MwIfPo
         mZ/rj5cp9YhNYz92pdg7oj6rYRCI7CRgnTMTulfYcrikHXl5SbVvX+BuojnteN4GuG0I
         KI409wqGN7uD4EzX6ok0B5bgK9HRjWLcNCKz6eZgM32G4tmvi9JETTfzU5fl/ROT9c6L
         cCKg==
X-Forwarded-Encrypted: i=1; AKwUvBzITn3nSukjSigwlrMQ1TMOo2ul2mA4GY6Cm5eHij8s2Y+Lp484I6Ck27pJSHQEH4IqMe1Z7hkdvqNTdnY=@vger.kernel.org
X-Gm-Message-State: AFuF++nBTnQHd/oiACd577oNH05OnZA+9VUL3SXAKj2tMBz9VpJUZj3C
	p7lIw/hNNQGC2Jtyi3SfFEbHgL6knrFb7I9VCG04nkAj0u4qLD7MKWuq
X-Gm-Gg: AYBFou0iXiqmqo6HtV0D4bYDMnkN/BaQzqYrApVcPjVip6uUY5L/Gn5uMGPjz9D1MMI
	x77rc4hgG8Nawto1ZpK0KP+iq5vLLKNtfkzFRt3RsGdBm0ZA2szZ6mtJn+L3I05ncvnUYDA5Y/f
	EJB3VTp9+jsfe7ZZc7YMHmDUfP5K69X81SxTN7lG7E7qZ71C8IvxmkFysQWuAE4EnwUQi3KP5lf
	IWnLNdSy3CU82gGEnSBagT/pOhiJQFgQxDSHdFI6tXBfcPeDtKCpA5dptkk1OdxFV6cs/TsQCio
	yi9Kknv9UWNyUaop1FH6Yd9R5xgZyyU6ws74G/9Y9q1ytLW2IlEcKxt1DjXOvvgKuH+3kdUD5FI
	ZbgVELnouluFHRgXc2epFK3jPpd4RfMjeSlU/mEP56CWUpHT553hw3RziGfu8LaQCfDBDnbm/GN
	0Mewengi260ZVTckros6DZ+OPGkyw4GEdJnhzUDZA2emrZ9RkwgomTQAMnWMxnKvDfyQPbALkP4
	2w=
X-Received: by 2002:a17:90b:4405:b0:398:9bd3:d6d4 with SMTP id 98e67ed59e1d1-39b8bf0ce55mr7805843a91.14.1788925131938;
        Tue, 08 Sep 2026 20:38:51 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f88475sm29419266a91.1.2026.09.08.20.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 20:38:51 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH] dmaengine: mmp_pdma: fix wrong sg length in mmp_pdma_prep_slave_sg
Date: Wed,  9 Sep 2026 11:38:41 +0800
Message-Id: <20260909033841.1395793-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mmp_pdma_prep_slave_sg(), for_each_sg() iterates the scatterlist
putting each entry into 'sg', but the entry length is read from 'sgl'
(the list head) instead of 'sg' (the current entry):

    for_each_sg(sgl, sg, sg_len, i) {
        addr = sg_dma_address(sg);
        avail = sg_dma_len(sgl);   /* should be 'sg' */

Consequently 'avail' is always the length of the first entry. For
multi-sg lists this causes out-of-bounds reads when a later entry is
shorter than the first, and silent data loss when it is longer.
Single-sg or uniformly-sized lists happen to mask the issue.

Fixes: c8acd6aa6bed3 ("dmaengine: mmp-pdma support")
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 drivers/dma/mmp_pdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 386e85cd4882..e90fd2023af7 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -713,7 +713,7 @@ mmp_pdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 
 	for_each_sg(sgl, sg, sg_len, i) {
 		addr = sg_dma_address(sg);
-		avail = sg_dma_len(sgl);
+		avail = sg_dma_len(sg);
 
 		do {
 			len = min_t(size_t, avail, PDMA_MAX_DESC_BYTES);
-- 
2.34.1

