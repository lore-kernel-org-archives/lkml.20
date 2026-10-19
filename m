Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792448793;
	b=yL2nvIUeNXbMybzZKhaVq9pruYbMJ/0hjFfDY+lgWanLf/GMVVNZBZ5G7NjZo53Y8rO0
	 Th3jJde9ziZpf1xfET4z6pw0aoq36beQj9D5vQUfMQlHVxICDuBs6gthMKsPRZDGePYha
	 3/eu+2XVRs0mzaOSZIxJ+gYnbHr3c3AyimPH+9rnjGq7WysGyvYLOAJMyNiNcjcY4aWzQ
	 y4HwtPENLCXLVy+2FRBXinr8pASJchqT9gS+H3D91ndGjT3rk5PS2fdJC0awDt25xUyF2
	 tzAOeZpMikUthPDZZzrXIMDLJBQX4ssmckN6ViiViGh9Gq8yfwHQPrgL5N30wwpQamA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5CcGNBxA/7HKGEBtVuQ4LgJyCODKoj4rV1rvYEcwUQg=;
	b=fWdLFj+bXAxumH4SCabbXCSxNK8zhkYXwHXkUbW8DAx67+Z+9tlZ/BOk0/WK9DkpVfMI
	 jY+19AxHqwVzvHu17qcY0bx8GzCthLKC7/E7aW4SyaoAj65JYZ8qX+thtLcbc+JOBs8KP
	 NGJyYJtfMSvTC45dwOlxrKH3WfK2Pa89XJxQJixLK+u7tDyhSGcktL52rRrrvbVldeass
	 dMubdUuiUyxN1WuDwNhltCEQWGtKO2rQ4V2BVSPtnQ18AHEpOdRWdPuq9a7tpcxV94hoe
	 1A4kWEEuC13uRk7fNhPpmAKShKHmzsyaYSiYJZ45xFdqyW/odhwq06Zv5o3F04KC65w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=N3fCF3Qw;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFEA606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DFEA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=N3fCF3Qw
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so956319a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792448792; x=1793053592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5CcGNBxA/7HKGEBtVuQ4LgJyCODKoj4rV1rvYEcwUQg=;
        b=N3fCF3QwS+gCHAtDHerz2M74399hcHFUsiKCKhqXD64dw5kYaJSPlonVlav7+0jY2Z
         wqNNet1817nhJdtK51YwbwYMaCenhsxE6ss9QI+svKJPxERN+vnQUgAP5aY0MM2g1jAH
         uylrIh7vYSSWu5vomrad2NrR+fAUjTH5eOd7hoIrog/XKMR8a0QwItw7WkXI23+DeCs4
         JU7hxC8RNRQH4dDQ80P8YXETDvBhE7mhXVNwIEa+zms1TmdD9I4aVBy8O821H0/aSHYa
         b/7fY9nPnT3NrZAHqzdE0JwjFtok2LejMhZvy45QqMbyQm8aILWSjoa/gLHzlhX5ube6
         pK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792448792; x=1793053592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CcGNBxA/7HKGEBtVuQ4LgJyCODKoj4rV1rvYEcwUQg=;
        b=whtm/QLGcNIrcZtRgeg4Cmd3OGcnM9amPsjIkFR4+m04H4Qzu2dABtxASPkuiQfu/j
         tkM4Q5jbnlHvGMBK6BqdJ6XcUihRkgPf5z/1n7Y2oTFkXzCL1k5Cv1p82mC/WD3w5ANi
         lcA9Kb2ZE1jkAS843fMlQXPQ5nmg6I35ZkGX2yEZyswT2yzvCEiLfJm4gKkTs9EL1FJX
         BId+69btb3Moasq5If1UfhFJ2HskY+Hgyzl3bO+d96Hwt6gNwU7I9k+96epmW5w8maIE
         IMZBdQygen69eKbCJElz8Gh+OVtr+IiaB7tUvJXK9nJUdm98hvFKYbdGKo7XnJihdSDJ
         ccAQ==
X-Forwarded-Encrypted: i=1; AKwUvBy33xAm6wndhz53G2T3vSPyLTMQbFI/wtVdg1U2hPoaoxreUANsrA2EvM0UHpy0xzc/9kqVOxXuEm3EqEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrwNSYfw6oHuyjxh/UT0yzFU5zzDf/q80XbbbCH6w/8D5Wnnpk
	E2fiYN6gU6K5WNT4G67nSwgXEkKO9sEvTOUpsI9w4U8euzar8cwJt9vLqeWQBhJswUz20RkMBmQ
	zfkNW2nqL1UDzXD62LfnE7fdvOP+LysHHGz8s
X-Gm-Gg: AYBFou2jXcTEA2kYnD3jXerb0o8kY3zuESw+r0KYEfbXg2GRFSCIMDWp/V7np8m0Bex
	7ryVK1LXNB7rMuvwJN/LpVuLzNL6sKPhLWU4QcqYUkS0qkfZx00fzp//12duP8Rl4od4UCu0cOx
	T++hJFY8HtWi1cifxFdOeVx4PGyQZoKoS4g5oZANI5bZ8N5bx4H4RKJpI9jZIPtyDOVc1zOk7O2
	rAngOkdxRt27pNQS0CzwYnrUlIXS5iTmE+CM0OkDV0Z/vHvTDiv+PFS9ETovy7+FenEVpqLCjDZ
	ofpoCWJUCghUTS7mHCdpeOhB2Ooy2VMh04s7BQGHau8t6ct2QVdz+sGtglxx9ZrggS3l4smWDyb
	uzzuFQnX0ufhxG6aZ8H7hvwEeQJHNmYf4+88=
X-Received: by 2002:a17:90b:4c49:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3aceeb95f82mr8443199a91.10.1792448790997;
        Mon, 19 Oct 2026 15:26:30 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3acd0dfe366sm3131066a91.3.2026.10.19.15.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 15:26:30 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [IPv6:2620:125:9025:23::2ea])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 4AC7B401CC;
	Mon, 19 Oct 2026 16:26:30 -0600 (MDT)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 44F77DC0D6A; Mon, 19 Oct 2026 16:26:30 -0600 (MDT)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: john.fastabend@gmail.com,
	kuba@kernel.org,
	sd@queasysnail.net,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	wilfred.mallawa@wdc.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Rishikesh Jethwani <rjethwani@purestorage.com>
Subject: [PATCH net] tls: check the right open record in TLS_TX_MAX_PAYLOAD_LEN
Date: Mon, 19 Oct 2026 16:26:25 -0600
Message-ID: <20261019222626.745408-1-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
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

do_tls_setsockopt_tx_payload_len() refuses to change the record size
limit while a record is open, because both TX paths size the record they
are filling against tx_max_payload_len. It looks for the open record
through tls_sw_ctx_tx(), a plain cast of priv_ctx_tx to
struct tls_sw_context_tx.

On a socket whose TX side is HW offloaded (tx_conf == TLS_HW),
priv_ctx_tx is a struct tls_offload_context_tx, so the load lands in an
unrelated field. In the tested x86_64 configuration, open_rec sits at
offset 144, which aliases sg_tx_data[2].dma_address. TLS never DMA-maps
that table, so the check reads zero even while a record is open. This
alias depends on the structure layouts: other configurations can read a
populated field instead and reject a legitimate call with EBUSY.

The missed check matters:

  setsockopt(SOL_TLS, TLS_TX, ...)          TX offloaded to the NIC
  send(fd, buf, N, MSG_MORE)                leaves an open_record of N
  setsockopt(SOL_TLS, TLS_TX_MAX_PAYLOAD_LEN, M), M < N, accepted
  send(fd, buf, len, 0)

tls_push_data() recomputes max_open_record_len from the new limit, so
max_open_record_len - record->len underflows. The next chunk is appended
to the open record regardless of the limit. The record on the wire
exceeds the record_size_limit the peer advertised, which the peer must
answer with a fatal record_overflow alert, exactly what the option exists
to prevent.

Dispatch on tx_conf and look at tls_offload_context_tx::open_record for
TLS_HW. TLS_BASE has no TX context and nothing to check.

Found during review of the TLS core.

Tested on two nodes using mlx5 TLS TX offload. Sending 256 bytes with
MSG_MORE and then lowering the limit returns EBUSY with this patch and is
silently accepted without it. The same sequence on a loopback TLS_SW
socket returns EBUSY either way. With the limit set to 512 before
sending, records carry at most 512 bytes of payload. Without this patch,
lowering the limit after a MSG_MORE send produces a record exceeding the
requested payload limit.

Fixes: 82cb5be6ad64 ("net/tls: support setting the maximum payload size")
Cc: stable@vger.kernel.org
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 net/tls/tls_main.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
index fbb274287aa5..8f11b8629492 100644
--- a/net/tls/tls_main.c
+++ b/net/tls/tls_main.c
@@ -837,12 +837,23 @@ static int do_tls_setsockopt_tx_payload_len(struct sock *sk, sockptr_t optval,
 					    unsigned int optlen)
 {
 	struct tls_context *ctx = tls_get_ctx(sk);
-	struct tls_sw_context_tx *sw_ctx = tls_sw_ctx_tx(ctx);
 	u16 value;
 	bool tls_13 = ctx->prot_info.version == TLS_1_3_VERSION;
 
-	if (sw_ctx && sw_ctx->open_rec)
-		return -EBUSY;
+	/* Both TX paths size the record they are filling against
+	 * tx_max_payload_len, so refuse to change it under an open record.
+	 * priv_ctx_tx is a different struct for each TX configuration.
+	 */
+	switch (ctx->tx_conf) {
+	case TLS_SW:
+		if (tls_sw_ctx_tx(ctx)->open_rec)
+			return -EBUSY;
+		break;
+	case TLS_HW:
+		if (tls_offload_ctx_tx(ctx)->open_record)
+			return -EBUSY;
+		break;
+	}
 
 	if (sockptr_is_null(optval) || optlen != sizeof(value))
 		return -EINVAL;
-- 
2.50.1

