Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792707459;
	b=Ykv9F5QzH/8qIfPap13fxkrfe1s0XUTXNuPtuMdBQvMdiOTjmvTej+Z4eE3NWU5ZrocW
	 USoPHuUMY5eYYBt8s5P8FqMwcHME+3dRxae4Qw9uzRQydxJ82AgbL+t3bERrsHIzCRY5m
	 UPHtCX8ztQH5l+KS4tjI+gQscRlM9Jpl5V6mpnzbogakjLQtjtzLKDU45IzHTNfo6CuNw
	 mx/gHeL2dpetFSHHU8j3bsvyGoEUtHJg2xAcxbmadqc1Sgq42kYCOHOC2xK6upEPMa8Qc
	 GmZK9rRFzoxIXIYYEUjoboGm445rbaqtUQR1UGzebyUphqBOC6f8qgJw4xjfWazIdyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792707459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZeRVw68ns3dubaW91d1DmHv0Hys0HQ5dAgi65zzLGos=;
	b=pBjvJCrSloZcrSuydTT45MWpeXkS2du2GLkIXOwh7EvI5iL12C4aQZDmI62+I4yPAB7G
	 6BfWAGVIA49XZ3/DV8RyTkfrNmDgR5seOAiAH7bdxDjntjmY7pByNQaF6r2E62FU8wdN7
	 BZyOllRhQG4kWhAPSLtfuwSAIHpWd6ui4BCUO1Iq27DGyXW9ChI/s0bv5vT/wXQCM1G2b
	 WWltwmp4I6rQ7rZvNljmIqXBZWD/xSz2yC+TakUatajGHzPf2t7qMFAG9DyO9HWyR+pg1
	 UN+DdZjrzmvqvSB017Nl8xKOaf5yorRDKYwE0bFwV5J0dXxmQQR6hIksgKBPCQH4eSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Qhkr3iQz;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853A8606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 853A8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Qhkr3iQz
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so145503a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792707458; x=1793312258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeRVw68ns3dubaW91d1DmHv0Hys0HQ5dAgi65zzLGos=;
        b=Qhkr3iQzU5r+xm1zqm8l3OMO1Z6GhDd8+H1b+P9KkQtJzuuXsonkyYS3OXYgyGs+3U
         Z+3OZ2elaZY5S3Y+mTHHQcwz18T9n6oC13gzUJilud+/5YC5VIsoiYQNhJ42aD0MnUuw
         X64/okuKz5cFTjkgYAoD6nqqIxbaYXdLXfv+GUBSNclWMwtS53SOmteVm+eNcex7GV/O
         siAK7j2f/IvKkM1oh5+0qxYANQKDJlSTNGMU5je8gzrJoBxHQFYNbgSHnkLkVCI5T3By
         bHfVGDxmjX1iqra8i6ssQYw2C/SaMWyxX+ou3TOPZPWVmqsWKPAcJ/Edo+UAAnKAKqP6
         RQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792707458; x=1793312258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZeRVw68ns3dubaW91d1DmHv0Hys0HQ5dAgi65zzLGos=;
        b=PjBLZowVHDS99TFmxFWPOjRLatT7J2QXG9BIY9Zkcm5hxMm+Yltae5J6Nqr9NzmwNv
         94RrLBNzrSUXaRj4wHoBuEdTbcleeI3JCZmHQJf8+jspwwfecKmijyEbZwLvCCc9Q9I3
         dFktSKpLvMKv3Y5Y5QU7FAebKZzBzTF7EJUYk8oDXM0hp3jGQw40dFAPEE2Ira2VWSZe
         c26p9NIpMgGkJAcwgmuNzsrKJxyGq5QvBtnGFVvvMrXNQgvc46S+n0NXfUamv57oj6im
         xY6QRgEMfYyTpzRevW3jNJT1Xpv8paWRkpNuyFZf3d95BVAA4Wnt/Nd4vjcmibCLacfG
         at3Q==
X-Forwarded-Encrypted: i=1; AKwUvBx1Fw+ZEpW/BN3JBuWyOHNeyEh3mwLalyB0CncV+YdAHUiL9cekjQqjsGqNNL2pb9VJo9PvRX31n46Nkss=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5hPAJG0+QMvXu6P8KWidFncJUNPz/F4NNsXKHJGDmjRIiBhTQ
	3JS0NqhWMojtGtZe/u/E+4eQ+88SMB4KYwUFgLP6fuiZGrX7Wn5OEC1ZsZ9k/wqnrDcoWSo/R0c
	6Iv3eqFStuidCa3T4Htw0KZorAeX4RwREYI1H
X-Gm-Gg: AYBFou0po1yokqQ0VyESMXGDKpEc+jLbuvXNyzcjOoLlKHXN6fGInMSPBpBnt7NWajF
	TdlK5p92JVlczfe9VBpEUlRk2a8E+jBxDPNl4Yo1eAjQGVespP2gKh9Je+JeSB70hwEi0oGmMHN
	km7oR9q0iZtBoMUVWXMw1o2LILl+KQt2P7mvBwuhQG85CHCB0X5vAzufVB1sBGvBLStQ221O3ll
	LchGDD/4td/nxEReA+0rEN2FD33OBtZJ5o6WjMBGoXOQR73VNpSw6dhm0SFy74OOcKClDngloaD
	ZGy8d6sWWQesMGzcYRotFU7oILUfja5XuxH1s0mGtKiQ+X8YgRBE9kTibS4dHeSCHVBqZgoMyQT
	O6/Rrnz6fagp7e5Y69DqDHMANIzXxeK4cylM=
X-Received: by 2002:a17:90b:3b4b:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3adce74cd8dmr182025a91.37.1792707457866;
        Thu, 22 Oct 2026 15:17:37 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ada488f10esm2924461a91.2.2026.10.22.15.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:17:37 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [10.17.2.234])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 370D94029F;
	Thu, 22 Oct 2026 16:17:37 -0600 (MDT)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 27598DC48A1; Thu, 22 Oct 2026 16:17:37 -0600 (MDT)
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
Subject: [PATCH net v2 2/4] tls: device: fix next-record sequence in core-driven RX resync
Date: Thu, 22 Oct 2026 16:14:58 -0600
Message-ID: <20261022221732.1397620-3-rjethwani@purestorage.com>
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

tls_device_core_ctrl_rx_resync() asks the device to resync at the next
record, passing rec_seq + 1 together with tcp_sk(sk)->copied_seq as that
record's TCP sequence. With the original strparser the current record
had already been read out of the TCP receive queue, so copied_seq was
the start of the next record.

The TLS-specific strparser leaves the record queued in its normal mode
until tls_strp_msg_consume(), so copied_seq is still the start of the
current record. The resync branch is taken when tcp_inq() does not
exceed the record length, i.e. typically when the current record is the
only data queued, and the device is told that record rec_seq + 1 begins
where record rec_seq begins. This can prevent hardware resynchronization
and keep subsequent records on the software decryption path. Further
resync attempts are made with backoff.

In copy mode copied_seq is already past the record, so the sequence is
correct there; the only exception is a FIN consumed along with the
record, after which no further record can follow.

Use the record start from tls_strp_msg_seq() plus the record length
instead. That is the start of the next record in both modes, so the
reported sequence no longer depends on which mode the strparser is in.

Only drivers using TLS_OFFLOAD_SYNC_TYPE_CORE_NEXT_HINT are affected.

Found by code inspection while working on TLS 1.3 hardware offload
support.

Fixes: 84c61fe1a75b ("tls: rx: do not use the standard strparser")
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 net/tls/tls_device.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
index fbfe6ec3df04..a6c4d0cc54c7 100644
--- a/net/tls/tls_device.c
+++ b/net/tls/tls_device.c
@@ -839,6 +839,7 @@ static void tls_device_core_ctrl_rx_resync(struct tls_context *tls_ctx,
 					   struct tls_offload_context_rx *ctx,
 					   struct sock *sk, struct sk_buff *skb)
 {
+	struct tls_sw_context_rx *sw_ctx = tls_sw_ctx_rx(tls_ctx);
 	struct strp_msg *rxm;
 
 	/* device will request resyncs by itself based on stream scan */
@@ -877,8 +878,9 @@ static void tls_device_core_ctrl_rx_resync(struct tls_context *tls_ctx,
 		memcpy(rcd_sn, tls_ctx->rx.rec_seq, prot->rec_seq_size);
 		tls_bigint_increment(rcd_sn, prot->rec_seq_size);
 
-		tls_device_resync_rx(tls_ctx, sk, tcp_sk(sk)->copied_seq,
-				     rcd_sn);
+		tls_device_resync_rx(tls_ctx, sk,
+				     tls_strp_msg_seq(sw_ctx) +
+				     rxm->full_len, rcd_sn);
 	}
 }
 
-- 
2.50.1

