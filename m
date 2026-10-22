Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792707463;
	b=r+njmGqJ+8R1h2qjNwi84cPpPHGx4Mji7OEfcZVvOU1H3AUXwkFOLFpHwhv5uQl9iVq2
	 JYiXANof36mrJdC8KzJ4F55WLUIpZp2wiqGN0fzij+qn+bMBQByYKUUGStDCbSlmUOAOF
	 w1ZX7eTdlNA/BVhwPn327RknLZ/jP0PnmR4bevtCXvCXGwboACPAtbWCJDTJSC4PG5JoU
	 G5zbpHgcksv3UTnUAMskA7JN88RVt5G8DfyxdoIRJqMgSnzn5QkR34EpEdfLL2j8w157b
	 ggbU6UkQsaGxaqfAjV0YEwZ0d5T91izYXA5GuHW8htk+DsYIw4u/k/QgRBjilDNs+Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792707463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YNahYpdiHw66I6uTFiHrxOfpUUmCwHBpQrn5JBUBdX0=;
	b=ZCtoKjgkUCnMSd7/jfnFeg3CzAdcz67MOmeY1LkTJwddjSOl3MXHJeIn6+134/fR3t9q
	 RZrjGrJ2tnuAjW+i9uIE8V5w7qTP8ekjMKgOXe5zP9Qbj4hxXVqekaSgfEVMDDT2aXXXR
	 96973Mu3Gn+YQVvGbXkSKwhxNkhr6n4YshEyRy+6d3qMTc8cb5puJZ9cbQSvhjH/v9YIp
	 z7fnRoehlZOx75vTCBNkcnalb/a3slBu+1z/Dm+kOj4gNu0qQobiWWdJXelbiltOnu0Ao
	 8XheSOna05EvL53mdUnswyVgSsplh626VIjVsPyIH6SXBNwakF0aeRqW9ckLO7+XFUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	arc=none smtp.remote-ip=209.85.214.225
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F34F606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F34F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2e987a2ba0cso1674995ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792707457; x=1793312257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNahYpdiHw66I6uTFiHrxOfpUUmCwHBpQrn5JBUBdX0=;
        b=ITdXEEFwOsKvT22iHUZFrynJxZnWnuXSRIjKtFYLTUPo+CPVpGf4DJwgUQK+asp28r
         rxfE1Q820IdErvASV5C0Nb5Yi1+B+5cK3QyA4UGS7U68YSI2vAOab3c6BjurOxQQ4OU2
         ySAwgGVlP4vX1MbiKQop7GR9GlGYCHs99BSCCuw8nnPtkZhbOXSjhO1t7qme1+83tecA
         gRC07vMD/kfFDpl45eS76+ZAcs2crPcvQD6TgnJXzpAJPpwboU+eFgRrhRjSVB4Umov3
         CkSsdQXSVQioBPhdFTWrKpnQHAPvZO1Nvn1H9EG9crVvlszx1lJFyJsJA4swEbkmeJYG
         km8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792707457; x=1793312257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNahYpdiHw66I6uTFiHrxOfpUUmCwHBpQrn5JBUBdX0=;
        b=gjxh//XMDGjc2ElgcLFCaJQdTlZ09ABV5YHzRtAj5EhNT+bzCwPW9G8I4aEUEDQ8Vv
         WjfsPxHfCGCTBiON4uqiPhBFdHgf2LO0+UeOhiQhURrNjzF3BMlrb1nej2yb7uaoXu+W
         vdB1a/A6SI1cn7LNWFvvgdJs3q4L3R4D4HCSRg4IISfHXr/SEDQQnWUXc6Abrvt3tkJc
         OoniyC4N4vzxiLXfHbU3Qw8qlVHjf3jfuubVungC54PuUAYnuT8U+PBc75mRzjvTZ/u7
         n+ZfZ3/KDJJFCHkRtzRPbMBEeuBnxoJAJHHP2aC84z36gG0fAGY2ZEG4xwhG5wQpsNtx
         Lc8Q==
X-Forwarded-Encrypted: i=1; AKwUvBz4K9sN64foznEJ8QJ+RLimbs+wKKlr8ZFER7/PLQMMGEwFKzNz1Wo4nIYq6JM+aiZ/WRPn/UM5n2X9PY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUutROEJ2ns76wNjsKmbwBLTRR7F1tMW1JktXkDXtfJq+s//kx
	/bzZWfd0CHXK8pQkUTR8EespNNV8scgF+bz2sRCqDRTiLqP/VeCe7IIe4bF+3+4XrHhK+qNJsBA
	G/tnLXOwTtI2ewFcMijVSX7UOIgmPiBSWSeF+tVb7tTJlB6oNKDfU
X-Gm-Gg: AYBFou1Hlag2WuC0rNip7PELITyPbdXNGT8kpUgwvM3KWkS9PKwfl7csyjunVFIIznp
	g7QrxnuiWKyQHf9TUhXAraUmqZjgBBdas4QWC+oYr3Cq5Exb/HnWyzH7KoJQakgyhRHMZfCmw+f
	qyEzNG5qa0eJEuxBBjyLMjP4PL4mObncZTYZEkDANBDRbumqbSZisEOYRt11aiE1sqTTFCqBSlf
	uir6O5aV9YY5pVAhjHsRsQJM5ZqRaYqlXddkkKwlQNabs2tJkwrcJpIWlovDisTDQ7CFI+22jzZ
	p/p0TPZPe+HE1wx0iHP5oqDBEOTzc0oosN5QQ4ILhiSsEaa2jHcjiZEW2W8tRXvAeCVdmZIQdVy
	0Sk1bbM5Q43ZzMUOIppY=
X-Received: by 2002:a17:90b:1d01:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3adce0c8601mr212606a91.9.1792707456674;
        Thu, 22 Oct 2026 15:17:36 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ada48fcfd9sm2854915a91.6.2026.10.22.15.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:17:36 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [10.17.2.234])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 01C50439BE;
	Thu, 22 Oct 2026 16:17:36 -0600 (MDT)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id F374ADC48A1; Thu, 22 Oct 2026 16:17:35 -0600 (MDT)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Rishikesh Jethwani <rjethwani@purestorage.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/4] tls: device: fix record start in the tls_device_decrypted tracepoint
Date: Thu, 22 Oct 2026 16:14:57 -0600
Message-ID: <20261022221732.1397620-2-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261022221732.1397620-1-rjethwani@purestorage.com>
References: <20261022221732.1397620-1-rjethwani@purestorage.com>
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

tls_device_decrypted() reports the TCP sequence of the record it is
classifying as tcp_sk(sk)->copied_seq - rxm->full_len. The original
strparser read every record out of the TCP receive queue before the TLS
layer looked at it, so copied_seq had already moved past the record.

The TLS-specific strparser leaves the record in the TCP receive queue in
its normal mode and only calls tcp_read_done() from
tls_strp_msg_consume(), after decryption. When the tracepoint fires,
copied_seq still points at the first byte of the record, and the
reported tcp_seq is one record length too low.

In copy mode (e.g. when the receive queue is short under memory
pressure or with a collapsed receive window, or the record spans
overlapping or mixed decrypted/undecrypted skbs), tcp_read_sock() has
already advanced copied_seq past the record. It can also consume a FIN
that ends the record's last skb, which adds one byte of sequence space
absent from the record length, so subtracting the length reports a
start one byte too high. copied_seq cannot tell whether a FIN was
consumed, so the start must be saved before the read.

Record the TCP sequence in the strparser whenever it starts parsing a
new record, before anything can switch it to copy mode, and report that
via a new tls_strp_msg_seq() helper. The value is then valid in both
modes without having to track which path entered copy mode.

No functional change beyond the tracepoint argument.

Found by code inspection while working on TLS 1.3 hardware offload
support.

Fixes: 84c61fe1a75b ("tls: rx: do not use the standard strparser")
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 include/net/tls.h    | 2 ++
 net/tls/tls.h        | 6 ++++++
 net/tls/tls_device.c | 2 +-
 net/tls/tls_strp.c   | 3 +++
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/net/tls.h b/include/net/tls.h
index e57bef58851e..e1e48a25cafa 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -123,6 +123,8 @@ struct tls_strparser {
 	bool msg_ready;
 
 	struct strp_msg stm;
+	/* TCP sequence of the first byte of the current record. */
+	u32 seq;
 
 	struct sk_buff *anchor;
 	struct work_struct work;
diff --git a/net/tls/tls.h b/net/tls/tls.h
index 60a37bdaaa25..a9f7fd79c69e 100644
--- a/net/tls/tls.h
+++ b/net/tls/tls.h
@@ -227,6 +227,12 @@ static inline bool tls_strp_msg_mixed_decrypted(struct tls_sw_context_rx *ctx)
 	return ctx->strp.mixed_decrypted;
 }
 
+static inline u32 tls_strp_msg_seq(struct tls_sw_context_rx *ctx)
+{
+	DEBUG_NET_WARN_ON_ONCE(!ctx->strp.msg_ready);
+	return ctx->strp.seq;
+}
+
 #ifdef CONFIG_TLS_DEVICE
 int tls_device_init(void);
 void tls_device_cleanup(void);
diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
index f11d0528fc43..fbfe6ec3df04 100644
--- a/net/tls/tls_device.c
+++ b/net/tls/tls_device.c
@@ -990,7 +990,7 @@ int tls_device_decrypted(struct sock *sk, struct tls_context *tls_ctx)
 		is_encrypted = 0;
 	}
 
-	trace_tls_device_decrypted(sk, tcp_sk(sk)->copied_seq - rxm->full_len,
+	trace_tls_device_decrypted(sk, tls_strp_msg_seq(sw_ctx),
 				   tls_ctx->rx.rec_seq, rxm->full_len,
 				   is_encrypted, is_decrypted);
 
diff --git a/net/tls/tls_strp.c b/net/tls/tls_strp.c
index 6cc222008d95..5d5e8c3fd5ad 100644
--- a/net/tls/tls_strp.c
+++ b/net/tls/tls_strp.c
@@ -526,6 +526,9 @@ static int tls_strp_read_sock(struct tls_strparser *strp)
 
 	tls_strp_load_anchor_with_queue(strp, inq);
 	if (!strp->stm.full_len) {
+		/* Save the record start before copy mode advances copied_seq. */
+		strp->seq = tcp_sk(strp->sk)->copied_seq;
+
 		if (inq < TLS_HEADER_SIZE)
 			return tls_strp_read_copy(strp, true);
 		if (!tls_strp_check_queue_ok(strp, TLS_HEADER_SIZE))
-- 
2.50.1

