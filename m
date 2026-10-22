Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792711659;
	b=iso5ChS79jzUcu3kT4nZD0zMcBX3xa/wvEfJozVMgoJnd36skhWXn87MGkzK+qyxXXP4
	 JFcGmABngiSU9Ktjm+FVdWZOLvwFEDrYeohSRLa6fr4DSlqJkXT1LEhK4/xZlh6wJA0Fl
	 aSzt4gXyTM+LvNdyptaijXm9Fl8+ej/+KjRjGb49fgd/ZAJ+fLzHbTURwdiPsAjRMJHSW
	 rcxVoWtuMZXr3izZSIxi3RNryXJrPCwmodvvQ7DwgSggPomOrTUlu8kM6vuv6kREdFcCH
	 Cpq4fsvsZGPLBH0cnadgwncWBE86Qt2GAH7QAQqqdo+dHf7cebel+TxGtrQeU6KkO2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792711659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=VDRZ+CQOwSmX2v/BIgM0gLF5iLJG2Nr4i5jrVs22WNA=;
	b=t2XNlS67pRFaGkTYLYQDGxkcfWA5t8X/fMVBOh1Z7jO0FXsDHAklW9F22x3e4UN5Q1v9
	 kxMpbUAkQvybh22yHAPksLFJoS8BEZKkDM5rND4Rjk9EIg4cUnkkQ8uvrXKxG5lI4VQIi
	 isGR/TwpqHf21umxR1kVsZiv40tZ7f+pxwjIDBMNUgmdrDl1+aHRBLU/b0/X7EMoAhHNR
	 ajCf6dvstwwuvDqup23Q0qvj1ZkLQejCW8nQAUXVhfvlbFd7LSzwYVlsHKtqXjdKRIgwg
	 37ePVIcuAbu33/pGmri4U2nfc4sriV6xiE6ZWCVYY2THzADrYT2UkdJrub+Axis2HKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--suseendranb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=XfHnRs90;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB010606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB010606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suseendranb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=XfHnRs90
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac6795617aso273619a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792711658; x=1793316458; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VDRZ+CQOwSmX2v/BIgM0gLF5iLJG2Nr4i5jrVs22WNA=;
        b=XfHnRs90VooasADCCSpYl/nGudHwVvDvNm2HopkUkhLsWDw0pllP2ktQbjtZlMVKdR
         VzjFrBdGpbChpmhf7NQHL+GMxqmVAGWcG4y7ED7hqWE7hZ2eLMmPVZhYOYvNI5DJRY4E
         88b3mgtG+mR6EaU3GzeMNSRtrOOzNmaGq9y1lsU4LNPfC3mXDEbojuMaaySERz4GlLgn
         a1/nnEsccYoACQkho9vUFShVpD6VuGEeK9mpT7rE59cyZ3vuBV47FrI3McfzYy4lp8Gt
         4GlcHKsKzkOOdGNQE3aY5IxhLZKlLPZdY0oxcxjTQikhyj85xg+nsrLNZnxlSJKnH07u
         l6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792711658; x=1793316458;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VDRZ+CQOwSmX2v/BIgM0gLF5iLJG2Nr4i5jrVs22WNA=;
        b=0Faani+W4ZXPDQUFSEb2vWaq+PAjHy3vxP06Fb6EbCzZL+9G702P3IY8kEh4kE0YEv
         jN2IBmUeTKgs5RsJX+DPG/RfF+Ar/zqltvJSN8ubhamj7ABRqQgOCqQHtNnWu3VSjt6f
         jRCVu0RXzoyKC9xs3YDTkUWB70Izk9/FEffatu7Hsx34wCOloY4afe7e1seqC+dnaNxJ
         Uu/MEaajgeEfTfqKgChBHmghjyfLkySb0l6pE+EHRaf+BMI60b+4EqJZSB8L37/EAWfN
         yBYzqVfbUROIXSpvUSgHOND2EfJRo942guG0KsrP1yvxw+5nL3lHOOxjCHL0/v9B4Fs6
         p8ew==
X-Forwarded-Encrypted: i=1; AKwUvBzE0YF6tznhrH84h2hYMCrnZkELEbyEMtrezqWt/jbQernOdRe1dZhHIRiwAKXFTLh8FtnCCVgcKh44SkY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhafP3Hqqs0Pwt/PC1FVU8DZK5DfaGt4GXKS5Wz5EHSAvccGOv
	bnWpot1A3ZypC/r1F9FdQZ2sO+6IBD7kMynNLiq32b5YsiMuJ57DxOJyD1O5epO3nSXcqxDOMO/
	7nFUnFaotwa/8d9H92kex6x+Zlg==
X-Received: from pgp15-n2.prod.google.com ([2002:a05:6a02:62cf:20b0:cc7:d8ea:a7b5])
 (user=suseendranb job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3dc5:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3adce0ccfb4mr376742a91.49.1792711657929;
 Thu, 22 Oct 2026 16:27:37 -0700 (PDT)
Date: Thu, 22 Oct 2026 23:27:33 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022232734.496064-1-suseendranb@google.com>
Subject: [PATCH] mm/zswap: validate dlen and normalize comp_ret on compression success
From: Suseendran Bhaskaran <suseendranb@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>
Cc: Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Suseendran Bhaskaran <suseendranb@google.com>
Content-Type: text/plain; charset="UTF-8"

In zswap_compress(), dlen is only meaningful when compression succeeds
(!comp_ret), as compressors do not consistently set req->dlen on error
(e.g. zstd, 842, and qat set dlen = 0; lz4, lz4hc, lzo, lzo-rle,
deflate, and iaa leave dlen at PAGE_SIZE; hisi_zip sets dlen to the
hardware-reported produced bytes).

When !comp_ret and dlen == PAGE_SIZE with zswap writeback disabled,
zswap_compress() sets comp_ret to -EINVAL instead of -ENOSPC,
miscounting the page under reject_compress_fail instead of
reject_compress_poor.

When !comp_ret, set comp_ret = -ENOSPC if dlen == PAGE_SIZE, or
comp_ret = -EINVAL if WARN_ON_ONCE(!dlen || dlen > PAGE_SIZE). This
allows simplifying the failure check to 'if (comp_ret)' and dropping
the ternary assignment in the writeback-disabled path.

Fixes: dca4437a5861 ("mm/zswap: store <PAGE_SIZE compression failed page as-is")
Signed-off-by: Suseendran Bhaskaran <suseendranb@google.com>
---
Previously sent as [PATCH 2/2] of:
https://lore.kernel.org/all/20261021205626.3286270-3-suseendranb@google.com/

Changes since v1:
- Split from patch 1/2 (which is going through independently).
- Keep existing writeback-enabled behavior for comp_ret != 0.
- Normalize comp_ret under !comp_ret and check 'if (comp_ret)'.

 mm/zswap.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 37f34e406c8e..1e727abcf9fb 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -873,6 +873,12 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 	 */
 	comp_ret = crypto_wait_req(crypto_acomp_compress(acomp_ctx->req), &acomp_ctx->wait);
 	dlen = acomp_ctx->req->dlen;
+	if (!comp_ret) {
+		if (dlen == PAGE_SIZE)
+			comp_ret = -ENOSPC;
+		else if (WARN_ON_ONCE(!dlen || dlen > PAGE_SIZE))
+			comp_ret = -EINVAL;
+	}
 
 	/*
 	 * If a page cannot be compressed into a size smaller than PAGE_SIZE,
@@ -881,12 +887,11 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 	 * only adds metadata overhead.  swap_writeout() will put the page back
 	 * to the active LRU list in the case.
 	 */
-	if (comp_ret || !dlen || dlen >= PAGE_SIZE) {
+	if (comp_ret) {
 		rcu_read_lock();
 		if (!mem_cgroup_zswap_writeback_enabled(
 					folio_memcg(page_folio(page)))) {
 			rcu_read_unlock();
-			comp_ret = comp_ret ? comp_ret : -EINVAL;
 			goto unlock;
 		}
 		rcu_read_unlock();
-- 
2.56.0.257.gf7497c7d27-goog

