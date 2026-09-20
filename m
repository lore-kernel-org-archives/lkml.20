Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CCE47669B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933638; cv=none; b=IjRb9ds6nNe/FCUhq/pPp9D9CmQm6WOdOK9wPVAwE46zDVizIA7vTO90g8KhUHPuWDznv6b7FsSX+us4OktqKgl9EBjfbfhuSGsseo1JV5hbcSdcuUQdHxLyB+CHP6YgukIUS9nM2UCf2BfpQsEgiSVb0g3Fm9HzuG+nFXy7oww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933638; c=relaxed/simple;
	bh=P2kW8ATtvkNqZncHYca4L+gsqhgusrW42yBbrkJoSd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKn9WIj8EQVoFwfqtqVB6l3dmuyoviZmdl3NRiiwXI4sAAaXo9R5a9HOP3ieq2k+pe6OsYOOYT0E/+vMXJNTj7LRBNlhFLQLj2aiQjIXsPPC8QygKsgwEvNI6rUg670ZFpMCZKbCnSYRuGjpm0TWuHR0pSK7CVxeYv/MuStqVxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkSKAoB0; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkSKAoB0"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15c1so282905266b.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933635; x=1790538435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ecyy9bn6zcz7JfajH979ClHOPnn+4eN95YmsvJYzOX0=;
        b=LkSKAoB0AViZ+cFiYLay5TDPK+Q63DyYLa5vMd45PAJWNuvbnoVg6emOWm9EKGgMPZ
         FucKqIMTbiv8sFsDGVSOOhkP2ssv5M6Ytt/49uryFtfSCNmYPN4onxWMlu4AEbSPC5e7
         ruCh3Jjlpf51Ekcolt7xcXm3jg6FwUZtYF1RMmC/w+9+QiiLuAn+1qYnVdwbdY9ZMSBf
         xJUhgmA3746XlQ/KH0gpAjqYt2PgM6ZEjjLpLAskxZe4E10OcBBPnTbhjCjuI+AXk1cP
         ggpbdkCDHHIlP79TUrVu7J0+dWgj6C1dktDpQ3Ds8Z6FqdHCyyXtgmCLBV1c0o6Jq3Jq
         V+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933635; x=1790538435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ecyy9bn6zcz7JfajH979ClHOPnn+4eN95YmsvJYzOX0=;
        b=LqtGXzwvN6MNufmIMpry4tDL4Cv5rYnj6IlNJcHVNb3X+wYcKAz1APH5yLMqdha+Nb
         BxKS9tyDvPh8pMMyrvGcfm6moWqeJg0F/L5E2Q1mkRUe9AzIN9baeWahKaxGApAw0CV+
         IqGc1/MHAcDWSOCZNlfcLQ+8K4yegCWE16k1v5Dhhlkfc6IXhGrVWhqXDhbElAdSajFQ
         /VQVCSQAf4zCYX5YB2GwJjm4zHIXv1Ww8HrmKHgyKTFYAvzdiDiTVQCi7ycrZYlnNBuh
         YQs04S93Yxs/t7zmADezq3eytjInRv6TsRWpNKV8hr5J+hUuhuHJyAAap1g2NFCdmS1e
         99bg==
X-Forwarded-Encrypted: i=1; AKwUvBzMrmK71OhCjv30rF9EQN0XmsK/TVPhDVRB0V4YWdD3JlaqExqVs7aqY9RfeB6SJGx7n94M84J8rx2c1+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ46SYnmi8bKfpD8TA92bVxQ/AZcpikeVXhv9SVuk3FCX//Tsf
	hw318nAPzzoIs7iXI77ZAUMWcrql77WCI6e8tjahDTTpAIRQBbuJQAmC
X-Gm-Gg: AYBFou2n8RN1uETUCnxlPwmLOwL/XT8EbAQ/oP0c/ZND8bvjm5YdEX42oAEl2jXgwZQ
	LeNr81HEGDgJ1gqiNDf4wuc0aQ5kXaOzq93NfLNfpzFMQ8LTWKuCyWqnR8FLbuorthRuK4goWGy
	Zld4PdgOaGT+j7t8wAJxoOaKYuxz6a5VRyW2yW1CXhZJ7FS13H18ZuKp5yA3qjMfMlIpR6Md4kc
	soa+EW5JVTGykdIWqVIBhc8eIZGb03Wpoia9cKaj4cBjM+GcqnigISVoFbJnDGugGDWAKsaeVAj
	eJNA+WWzYVnIr91mgGorck11UNObRT++ekqLDoM7K1CeWpv94EwMnk9Yx+mL4qs3n/77U/d/BG3
	EDDEznI82/bFG47SVMd9SE/jM6Dmq/oOUmP6y0Blj+HVwYVfFqo3nKQkSJvJfizFh1Hr6U+DdXy
	jP+ovRepcpqsos6s16XsMwYUmb1Iq3i6a4mm1RUqbTURQ/d2dJu3o6ilFqZQ7oZ8wgTj5BYK4Tm
	5aSb+BXLw1kaF2T0cz2tNVhnPrn7HZJX6l0B08ubvKPrT0A+LoRuzdZNZc=
X-Received: by 2002:a17:907:3cd4:b0:c29:4d59:9833 with SMTP id a640c23a62f3a-c2a1569a4b8mr756590066b.15.1789933635349;
        Sun, 20 Sep 2026 12:47:15 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358ff8edsm211768466b.61.2026.09.20.12.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:47:14 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: netdev@vger.kernel.org
Cc: sgarzare@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH net-next 1/2] vsock: report pending receive data to io_uring
Date: Sun, 20 Sep 2026 20:47:09 +0100
Message-ID: <20260920194710.1114748-2-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920194710.1114748-1-devnexen@gmail.com>
References: <20260920194710.1114748-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AF_VSOCK stream receives never fill msghdr.msg_inq, so io_uring cannot set
IORING_CQE_F_SOCK_NONEMPTY and retries a multishot receive even after the
queue has been drained.

Fill the hint at the common receive exit using the transport callback that
SIOCINQ already uses, and report 1 once the connection is finished so the
caller performs the receive which observes EOF, as TCP does after a FIN.

A vsock loopback ping-pong with io_uring multishot receive drops entries
into __vsock_connectible_recvmsg from 1.97 to 1.00 per delivered message,
and receiver CPU time by about 3% (25 runs of 50000 messages, p=0.006).

Signed-off-by: David Carlier <devnexen@gmail.com>
---
 net/vmw_vsock/af_vsock.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index f840498b58af..63309708c916 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -2543,6 +2543,38 @@ static int __vsock_seqpacket_recvmsg(struct sock *sk, struct msghdr *msg,
 	return err;
 }
 
+/* Bytes a following receive can consume, 1 if it would only see EOF, or a
+ * negative value to leave the caller's hint alone.
+ *
+ * Called under the socket lock after a nonnegative stream receive, so a NULL
+ * transport implies SOCK_DONE.
+ */
+static int vsock_inq_hint(struct sock *sk)
+{
+	struct vsock_sock *vsk = vsock_sk(sk);
+	s64 data;
+
+	if ((sk->sk_shutdown & RCV_SHUTDOWN) ||
+	    (sock_flag(sk, SOCK_DONE) && sk->sk_state != TCP_ESTABLISHED))
+		return 1;
+
+	if (!vsk->transport)
+		return 1;
+
+	data = vsock_stream_has_data(vsk);
+	if (data < 0)
+		return -1;
+	if (data > 0)
+		return (int)min_t(s64, data, INT_MAX);
+
+	/* Empty but finished: keep the caller reading so it sees EOF. */
+	if (sock_flag(sk, SOCK_DONE) ||
+	    (READ_ONCE(vsk->peer_shutdown) & SEND_SHUTDOWN))
+		return 1;
+
+	return 0;
+}
+
 int
 __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 			    int flags)
@@ -2606,6 +2638,13 @@ __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 		err = __vsock_seqpacket_recvmsg(sk, msg, len, flags);
 
 out:
+	if (msg->msg_get_inq && err >= 0 && sk->sk_type == SOCK_STREAM) {
+		int inq = vsock_inq_hint(sk);
+
+		if (inq >= 0)
+			msg->msg_inq = inq;
+	}
+
 	release_sock(sk);
 	return err;
 }
-- 
2.55.0

