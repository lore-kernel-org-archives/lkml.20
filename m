Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC8B41F5C7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790872761; cv=none; b=Ix5qXmy9yCqLxJ9GIVKTXpm8jcRxscSrouQQrEnQ6Ct3VMrybvkP6EgQ8ab/yiZnyJxctM+6LKOfXxgcvZ36plufQcNy5FTwMU+FYXUVg/anl7eTVokM0YMEofyODVsyeaYWrlRIYO9MXwR3yuKd5Xq8J9lIZNYlyLdRZprx84M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790872761; c=relaxed/simple;
	bh=5eEyieqmHMszBlGZ+dTh2KjTjHoncpn9M6WHXl5Pdb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ExS3MljqMdCfFjOOG7Np7Era/VKDi7xZOv37e1QBcvfwKhXbhXvkbg47MsHiT8VU+s25vp9QZuPCRm5hLmrcGZy7AzGHx8qKvJ7jzfAgTC6eWUmAVnHlwgrTSL8rW5dvt3VX11DA/LiSCaXu3ujEOoFRTRkKw8Jc9Htxr1P8V6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzMRaz6C; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzMRaz6C"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-81eab67b951so2151388a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790872758; x=1791477558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aAKEBIit+v4BKWlpY/14WoleWJpA6zoSyagZIX4Dlao=;
        b=SzMRaz6CAdMypJbNANJJ3+BfkL8cbHaGc/M4MNuL3PWgOK1Kpoh32kajjAHYEVMWKh
         eK/eaQZ39kkf8vrYhYQu5nUDPxE7ucSb4dVfvmWe9r700kYxIACOEWYR3pd85zyU82bm
         use12r6z5fmMqESnpMzc3Wb9XIg5ANkesJLvgAZqSC3Q6NwWh6kCKjo8KZWerZnUb+2J
         qZAL5v/NNclgq0yFDVWcXjxB4z4K+IMvBHw0G5ml5GBTokBDu9dgxtLSq5HfolvUtOdT
         3zMfkgYFF3TTNM6SpRvl6SyxsMyiLxQ2KwyOAemWouA0FreenUMr0FC618kVrk8DUyb0
         Y+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790872758; x=1791477558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAKEBIit+v4BKWlpY/14WoleWJpA6zoSyagZIX4Dlao=;
        b=pquDYv+QrhKLNmB3xKIzSTOPdsqC076NgBvWK1LarDdcyvF0h1CH9oFmzxn4jKzpqH
         Wv1J8cHTUojrej5VnmWdeqcjLLb4AFKyjkVyv/udpAwpTL23mWVkkgAAImNUFzTuN4rl
         V0Px/wZGupko9hlp/0ppSxXiEpwKmPW/bVENZ3FxpQ/N6Sq+4+K5s+rzq705x8ZDyKoL
         axUeIYA/v7bw7BTDt6Fa6XdBTzWv17qCrnDnyrV9JkShG2hdnqW8zzbbtKT+iMcf8xMs
         Z5X3XZAgcbl43+1AsI7AmnEtCTw4/VpGMczWisI+f/QnnBMjV4wknMjoZ3b2vAFTGc6b
         FqNg==
X-Forwarded-Encrypted: i=1; AKwUvByouzypvBELaoeAjeMAEyKFK/jS5EYarB9qJOnkR77R0pijtDoZNb/F0vNZEaw1tnzCtvT0n/QKnB+zVP0=@vger.kernel.org
X-Gm-Message-State: AFuF++nYL4gJwTHryJN0SO37GPQ69fPK78BzTLyg4GXE4MIxDUFy8bg1
	3+QKB/jrkZFI71niHjqtm3OrDclI7UIWghuW3nDOQftJL+rnrgfOOlJA
X-Gm-Gg: AYBFou0McZSunh0REkXiwmbeeUdOqtXOgg9Fdl733K1UqrURWmJbh84s0v965qWAzBk
	dDQQB+0PTmcszyMLMukkRoTN7mqbuZEKvtpxVDih5GuMP9IoFvCsZYmZGWVPJiUvD5MGcfLAnD+
	1AO1TxlwdM5vK6WR8JfJYCH1nt50GOMfrawvf3u8GKxfRRNt2N6mK+lXnLv+FiBqGv5e4xlXgFH
	WC44P83ngfwRRpkeQyCE6+JJuSJO3Njl3Qwgt8z9wVN8AZ3NNjnFM5k2DICGwLlz6YhGdPMJ+KV
	yQqQvPd/KQw/IGoKmb++utNsIR+uNxk8D30m3grERms3ZzsRoN/Wy5dwc2uUU6rvlL54+4/DMIB
	WGlxz6XvHNVAb1tigpDTZ08xMwwmYa6MEjvGnJHg+4LtjEHr5YW5alXhf/B4l5CxOi5JuhnddHV
	QoSXg4Y0aE6kTDf59F3qlOGivzco2YKzuTNVMlUQO8T3jnTbABksSTe62tHe5CfQUeCTZA
X-Received: by 2002:a05:6830:374c:b0:81c:4784:a5e2 with SMTP id 46e09a7af769-82283f6568emr216716a34.6.1790872758576;
        Thu, 01 Oct 2026 09:39:18 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:41::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8227aa6cdf1sm306233a34.26.2026.10.01.09.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:39:17 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Thu, 01 Oct 2026 09:38:58 -0700
Subject: [PATCH net-next 1/4] eth: mpnic: use WRITE_ONCE() for BDQ head and
 tail updates
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-linux-mpnic-v1-1-6422ee74233a@gmail.com>
References: <20261001-linux-mpnic-v1-0-6422ee74233a@gmail.com>
In-Reply-To: <20261001-linux-mpnic-v1-0-6422ee74233a@gmail.com>
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

Convert writes to BDQ ring head and tail in the NAPI path to
WRITE_ONCE(), so that a buffer NAPI depletion check task later in the
series can READ_ONCE() those fields from a workqueue outside of NAPI.
The remaining writers in mpnic_enable_bdq() and mpnic_clean_bdq() run
with NAPI disabled and the instance lock, so don't bother converting
them. The NAPI depletion check later in the series will run under the
instance lock.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
index edb07b7f334b..49061c7316d5 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
@@ -384,7 +384,7 @@ static unsigned int __mpnic_fill_bdq(struct mpnic_ring *bdq)
 static void __mpnic_bdq_commit_tail(struct mpnic_ring *bdq, unsigned int tail)
 {
 	if (bdq->tail != tail) {
-		bdq->tail = tail;
+		WRITE_ONCE(bdq->tail, tail);
 
 		writeq(tail, bdq->doorbell);
 	}
@@ -483,7 +483,7 @@ mpnic_pkt_prepare(u64 rcd, struct mpnic_rcq_state *state,
 	pg_start = mpnic_hdr_pg_start(pg_off);
 
 	page = mpnic_page_pool_get(&state->hdr, &qt->sub0, pg_idx);
-	qt->sub0.head = (pg_idx + 1) & qt->sub0.size_mask;
+	WRITE_ONCE(qt->sub0.head, (pg_idx + 1) & qt->sub0.size_mask);
 
 	/* Short-cut the end calculation if the page is fully consumed */
 	pg_end = fin ? page_size(page) : mpnic_hdr_pg_end(pg_off, len);
@@ -513,7 +513,7 @@ mpnic_add_rx_frag(u64 rcd, struct mpnic_rcq_state *state,
 	struct page *page;
 
 	page = mpnic_page_pool_get(&state->payld, &qt->sub1, pg_idx);
-	qt->sub1.head = (pg_idx + 1) & qt->sub1.size_mask;
+	WRITE_ONCE(qt->sub1.head, (pg_idx + 1) & qt->sub1.size_mask);
 
 	truesz = (fin ? page_size(page) : ALIGN(pg_off + len, 128)) - pg_off;
 

-- 
2.52.0

