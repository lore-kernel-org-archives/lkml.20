Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793038190;
	b=XYPzzENPISj2ZsCSlXNe7ygyd5jjMrRSxEZPLux8bDpWew7Lj8olTETe5RWNUx0m32zl
	 5jlubaLKVJeR05zx0me4HFrmKesvHTR5poYDvnJFFuZzCJodzIaPACaWhxp4POHttBdvz
	 cPAaypx32Cw3/ZAlIDxzvxHCgtkihgyX2yoOjVPOYKTWb3DN5tAsLEEyapOluIY+6oyB2
	 H0VBVNTbN5H+zfmzDaYQF/Li1wyZrgy09PzgmqBzCqrNN3IxqLL+nggjHQsZso97Ce62L
	 R0LX8HeL0dxPNpzoTeHwbqKN5PBJQYkyC+Q54MswNXYT/ABiiEqBQeRnCiayTmPrkwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038190;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=9qg8CezQBnAfLuqyFUGhfk9+41KUyU8Lk4icphWUOg4=;
	b=Zp/xVIVwdmVVAPRzGxgtpW1jSCNY9a0H3WhRIvB8fTjHaRHJX2BcD6vnmFD0xUVejigG
	 vRHOqzklDsyQT11g+vmXBl2zFc4jbhEu331zzSRXScfv5RcYYKL6w23ma4ZTXmAq7wPCT
	 PFoJ0HCoyWBIwdHcbzgTn6PEo4PsjJ2FPuQ49r/070TlxIufJBLJo5iyUKt3GckQlQZyw
	 AhzE8jaCGce9l0Zr2QufQaNJSGNHHgu+Nn6JYbrX1l3Em1cErrtONPx0wB7l9hHYtCA4h
	 F0Np7+EzHKQK+1dqud86JSIQvgPALJ098H+Zh0siC5ri2T/X9+nssA1EMs6+fDEmbsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ElGEn7jr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82E0606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ElGEn7jr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793038189;
	b=tQ/i3+Eig8NE7DhMBbEw6Zp56BeCQNFp6dGEqi3CySF+8XdDWCvf8YK3ecM4E80u2avr
	 sXvsvj0UTuEk9ndRlzbk2o9/joZtB+1Q2qX3rn+EyphzBJ7XCQW5lJ9TCCfmJ3PzSxWkF
	 RWQCDnwZB84dI2upOQKZh5wbhMsoswCVTCZvOlGmDTnmGCrbj08sAeTWMPreJAXU+eEkF
	 1kQ1T4R6cpFy0/Hqo2w76AZRmnL68DnneRaq/WGXoOnPr1Wsuo/tTVlZYWmHpLjHFo0A/
	 SL/T3PHqKYBzDyQ5ESIWRvUbIQ+3nYyOExpIeEITCjhOkDjqoJU5exkGuzPHDrB2PUA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793038189;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=9qg8CezQBnAfLuqyFUGhfk9+41KUyU8Lk4icphWUOg4=;
	b=rE79YOwErrzQ4mRZFAhaVGaAeh3aGwaiG5ZNYFm8/tJ7hw4iapQ9x6oVzCa+61CAAtJf
	 1c5GNoIGUSV9M1HjGF7B3NQQKvgdCB01csRcHp76Y8n4gvaKbTFfEEUisnOLYzeBqrRmk
	 8VVPpUb1KRaNl4liRaiddNZnx2VKKf9RZAvvzKxKYFw/J04TwGyUHRTVstNwu6O5FS+lL
	 wjjtStWg64wlf0woLjmQQ5wlv6DDYBo6VfS5hFl0KgyBIH2SmfmhNUTlUxuFkXPlysRfE
	 eCFWObfjWqsEaf5JmCJwQsojHUuRyxt1Irr4uchS/ySUzVGj014HjUh6czLcvalW2Ng==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2F6E1F01825;
	Mon, 26 Oct 2026 18:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793038189;
	bh=9qg8CezQBnAfLuqyFUGhfk9+41KUyU8Lk4icphWUOg4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ElGEn7jrDmDZceNxu355KAd43NJ+oxmdHtNCOsXRtCODjAyfaLApoNGDuAP3Vvjji
	 EqhBdkAy5y9vSXe7eU1QqopiO1yx5+ZTOqQE13EMxvMqlPXPD0TkdhMRE5VkeHiBdy
	 +uMvUNd8jrLW+vt+0HNI3x7XAUZn0VWXY2iBaIrC1ephxCiz1ygmzSbNxrJO8pNa3t
	 oHHl7sQxOmXYhMrK3ARM+uL/Uzf1MbA68ooiMF3lvsYzUfWGGzBImjyzu4+2C01FqI
	 TtC/8WFlMJvLQisyj46eHWQJgOjGaG9i2gvED41Cd8bAhP9/Q93t5TIDjGY/63QdWu
	 unXMqe83G9IYw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 34BF344E1E;
	Mon, 26 Oct 2026 18:09:48 +0000 (UTC)
From: Martin Belanger via B4 Relay <devnull+martin.nvme.dev.gmail.com@kernel.org>
Date: Mon, 26 Oct 2026 14:09:44 -0400
Subject: [PATCH 1/2] nvme-tcp: start error recovery when read_sock fails
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-nvme-tcp-ctrlrec-fixes-v1-1-ebf6ff7eff34@gmail.com>
References: <20261026-nvme-tcp-ctrlrec-fixes-v1-0-ebf6ff7eff34@gmail.com>
In-Reply-To: <20261026-nvme-tcp-ctrlrec-fixes-v1-0-ebf6ff7eff34@gmail.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@kernel.org>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Martin Belanger <martin.belanger@dell.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793038187; l=1609;
 i=martin.nvme.dev@gmail.com; s=20261014; h=from:subject:message-id;
 bh=ggidawoLoKfpkMXbqKndiLcxYd4qxdMDfKr5YsSgVnk=;
 b=VFIrA0yEclOqssaEnOt9moNoMSkIDzLHTFipPmWLmams9r1umzRKoQ4yGnggqc3TvwySHMjIQ
 O/XZ2KJkldcBMOfXFCYA+Xnyynr571JTUsbUbcw+dTFqIxBB6BqNv5R
X-Developer-Key: i=martin.nvme.dev@gmail.com; a=ed25519;
 pk=4K+XXetGK35w2LzRRddd/bbHawZU222BN+YZRuSpN+k=
X-Endpoint-Received: by B4 Relay for martin.nvme.dev@gmail.com/20261014
 with auth_id=1176
X-Original-From: Martin Belanger <martin.nvme.dev@gmail.com>
Reply-To: martin.nvme.dev@gmail.com

From: Martin Belanger <martin.belanger@dell.com>

nvme_tcp_recv_skb() disables the queue and starts error recovery for
errors it detects itself. An error returned by the transport reaches
nvme_tcp_try_recv() without either action.

nvme_tcp_io_work() returns on a negative result and does not requeue
itself, so the queue stops receiving and remains stalled until a command
times out.

Report the error and start error recovery when the queue is still
enabled, which indicates that the error was not handled by the actor.

Assisted-by: LLM
Signed-off-by: Martin Belanger <martin.belanger@dell.com>
---
 drivers/nvme/host/tcp.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 7190eb10c248..a03476f0f69d 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1431,7 +1431,21 @@ static int nvme_tcp_try_recv(struct nvme_tcp_queue *queue)
 	queue->nr_cqe = 0;
 	consumed = sock->ops->read_sock(sk, &rd_desc, nvme_tcp_recv_skb);
 	release_sock(sk);
-	return consumed == -EAGAIN ? 0 : consumed;
+	if (consumed == -EAGAIN)
+		return 0;
+
+	/* nvme_tcp_recv_skb() does both of these itself, so a queue that is
+	 * still enabled failed inside read_sock() instead
+	 */
+	if (unlikely(consumed < 0 && queue->rd_enabled)) {
+		dev_err(queue->ctrl->ctrl.device,
+			"queue %d: receive failed: %d\n",
+			nvme_tcp_queue_id(queue), consumed);
+		queue->rd_enabled = false;
+		nvme_tcp_error_recovery(&queue->ctrl->ctrl);
+	}
+
+	return consumed;
 }
 
 static void nvme_tcp_io_work(struct work_struct *w)

-- 
2.53.0


