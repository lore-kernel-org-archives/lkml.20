Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590264;
	b=Hjp3qz8XjqcOGRYFGcqdyF/MZmDXha8k6DTzDo5f6FfkzGD0DHYh55dZoOohO83RquzF
	 /QrpTsumf44xs/OT3OnB+Nvh/eksAXQ9KldJlHvvelCwaKgiPBnj40J1zIUgpjxrR8dS9
	 olbG/3Paj1SoL9VSDavQckhzcI3+B7edt1LPMFoRZVP/Q9J9VQxeU+I6vK9HqjMsOl5Iu
	 KfGMwu4zoBepzx5nspjFlEnIRg3651uGK9Ak+stLupf9OvJ5Htpz9uzc1QnxMBm73Wif8
	 vr9UjNvcksZGESZmmrnwzM9dxHTwk/JGy01Cs750hAFF9042vHj+NCMAWlhu1nJtezQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590264;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hihKANaFN7ZRmE7wCF2vMCjr0gw5XzFZ3kGAEbB5LRo=;
	b=4d9gTvzsGCeJYlTUIU3IOoZt2uUA83AJy6J/bxqbOqo2/9WKJ1Jn0WfV/9qHBESY18JC
	 W75H4u3Ft6G26CsNEZ6uh3ijrWIHMEOhcIJAknYzPKJARpSzIo8FDbZ/D5M8P8L5EXOys
	 2+CtyM1v4SSXIh3iJlvfrq5y4Ktm0Z0sl3AfIrcG3IFUIFi36F4uXZKC4czs7u2xy5aK+
	 NbTGiCVDPQl7Th9l6lVx2If8RSazqAfU8U9FAHbnkKw7poYaGjcmIg3mDUqilK6e1VA4Q
	 V5QCHkZ8JsJYff4mRwisLzC95kEsbfdg3Z4MOlUbgdIAb37VY+/4Q0l+UEaKYkQ/s/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=FsyL06mO;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=TbLxSRmE;
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA36606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FA36606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=FsyL06mO;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=TbLxSRmE
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id D323D1D001E8
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:31:02 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 01 Nov 2026 22:31:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1793590262; x=1793676662; bh=hihKANaFN7
	ZRmE7wCF2vMCjr0gw5XzFZ3kGAEbB5LRo=; b=FsyL06mOE7JIRdwD7whZqpbxDS
	14URcp28Q+cQqmh85IQZqLX2JnP88ZFRp11Ot7/lnCDnq2UyMRHbARkpRj9Uimci
	O4WwJ2ChzIiyk4Yruk7vVTrp9V0eHNkw0LrOBA9DOyR2c7wb+RodjAtVglaLULR4
	4/QkKqlWXCVGBKl7bxdYpbuk8qUZ3mxshlA8QHTJvehUNvyPQcrFFwP+7EY9t1rF
	vJxZh70bv1IXluaD/R5w3E8ggrjM6S7KIgOsVt0f4Jb3JILFM9Ist6A2kczU9x8Z
	FExkJaaG4MXGnlBFunm5RNtRbXHmAub/ItlF3JyG8cgB77aa61sumxXaFUXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793590262; x=1793676662; bh=hihKANaFN7ZRmE7wCF2vMCjr0gw5XzFZ3kG
	AEbB5LRo=; b=TbLxSRmEq7Ei28HB6mjxFA0ApK/KOs6Ob9o0yrsi98MxqbR4opx
	3P6yCE9VrvdjWJ67HRnn3FQyxnvsktpQv7CE84iGxRwVPY2h+ijP7qUwgnqJLQ9l
	YMDZTmEReiwWiT5lpFaAcc3qsl/gr4jTu1Ddxp6WP4KQUMgGl6h/1wzYBjJjqYrB
	2zqlnhZBNkyYfk4U/9OROQ45oHmHpH4B+yQI/3klmmAx5Tqj6bvmX70X4ZcT/EiC
	+I47tXVmyz46ZdTmaF/wtr2f7FdDuwE/We3+xAM4dgqzwCaJmKwdmaFRlr1010al
	9HMnCye8p4hi3+bY3cGNO5E7bCkUeOWd70w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793590262; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:SikGRpdY2tzxASCiFLSJGMNF/w8ZX+V50t0NB4j46sG1hom
	wlIP2VDOavxSyWpioHvRwudSxTPsuUwT+Uc+hOVFQbljR40NBp4B8iUyb/XwrCmx
	d2eY8Tr+W/dTouMXYi/4moEAdqS6TbUr6g1jO9AW2Td91Q/ElCGBdhdQGgkvqYM9
	x91yK6Ks8S/i8QKv3FoCqvATDCttONx/GjrX8Ql1MspRhomt6DcXje60xa3jG08C
	3VXeNSKvebDOl3OcNOFs/nkl3ysO9VxleUCPx2nkbY26eLg+3f+DZaVrM3PaY+3q
	9g0z+58/27cu3L+OTTfS6Ahut1GUlZD+r62Wf/w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:VrRBHYJgRJNomnexM87jSqA0KRS3/jWZMFNV56mOO/4=:XviE2y+AnCYSe5ZTUUrNQibrqFPOo1Y0I8Cth3YLsjo=;
X-ME-Sender: <xms:9gPoauUyK4qkwuN62JzBEBtfN5IeDcUhg0xlZGZj-IHtoQEg7t9Ang>
    <xme:9gPoaoiyFE2bZtghRmashwH0z9bJChLyY08hJjJtzmtaTpDpJRcc2cRvabe-knU5q
    ThldPqeoUE0lm-BDp7ob7A1SbUVpRVhNpP_RDwDtn6Yy5L1Gw9bXi89Uw>
X-ME-Received: <xmr:9gPoap-xXNmQbULMwA9sx-JxmCbTl4WSEiyq36DXmACdUeKWLaVQstikxUA2Sdc0G6Box_clmRgp2Wuf3fGWHSnWj5jlClRZ5aIILlBmSjZQcg>
X-ME-Proxy-Cause: dmFkZTFQwSoy8odge4VCKS4VYM5c0WwKl6/nxPPqh8t7LiFj9gZhwGWU4fKpzi6wARaINT
    tdwgHCNNzwvCWQRoTBAat5qdFlTQw/DTd03xlv0rMMkOu65l1WWTuoeSVaN8kH1GEgM892
    MeDQk2nYisVLVEQkWETzzd4TEulz65XQ4RGUdF9+XmaZUPnp1RcDYH+7ScNn47JqdbEVWC
    LMV9REmsrTrYJiqoTvtCiT2E25gFlWO6cUaDQMD3VwdTylGI9eJXfHj+ZhagfYW1ZYp3Gp
    a0yOw8V56XKac4prRApqlrd8Qh8SBGeIhXO10VzIKDPYOBvl/tje3XDUhTS3oeMBaVLSBy
    20Lfmi9tuQcY4U/S5tm6/CFZWVOgaYqMtee1iBtoS5rVrJ7nCJzhIxwog1QbnwXXE8RvxZ
    JPIEum4CqVYg5DdvNt2AhQsnlLimuYeUaX7DpZL15IB9a9IuXkeyRXM0ltxrsSr/kyKp8n
    J6X+j02RU4ag5hjHumOzQKORAhW8MEf06InfxJXBRSpkaki8nId4KKN7oYm4eK1uM2EVJw
    /QntzF6FOw7NwLWwj48o/A52rfJPMzRaWK7YyvVoh6surPYhFSRTPpo6qm56NH8IEj8gpv
    dxWOn6ylOsLEU4eqltaBpbhiidqa2dhIL99lyoOPNdTAmA0hWk5qRUZrqDiQ
X-ME-Proxy: <xmx:9gPoaiBmOBJDxrnMawJZ6MTJMkeSGfjE3eIZO1mZKANkTiTPDAkx6Q>
    <xmx:9gPoamLu2C71PhDsGuXDwztH3Gr6olvOoCHk7El6owk9mY558DYV7g>
    <xmx:9gPoalmDs0h5lfyBbEJInnExFRcH9sfGRkUkUUQ-70t9P86FB6FEQg>
    <xmx:9gPoakHr-rSaBkSVkKVhBUsqqj7SXM8ymFVMBSVA_lLHmFlmwKnrmQ>
    <xmx:9gPoamr4_enw-kg2EOkvd_VONDzic07sRXJhiZwij9XBWWpoZn9Bpl_p>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 22:31:01 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: ohci: avoid potential deadlock when queueing AT local requests
Date: Mon,  2 Nov 2026 12:30:58 +0900
Message-ID: <20261102033058.1184485-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
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

AT local requests are retrieved from the queue in process context
(workqueue), while requests can be added to the queue from any context
through __fw_send_request(). The queue is protected by a spinlock, but
interrupts are still enabled when acquiring the lock in the former case.

This can lead to a deadlock if the same lock is acquired from interrupt
context while it is already held.

Avoid the deadlock by using a pair of spin_lock_irqsave() and
spin_unlock_irqrestore() to protect access to the queue.

Fixes: 5fe52c6aa28e ("firewire: ohci: use workqueue to handle error case of AT request/response packet queueing")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index c06e8d87239c..cf49910fa900 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -1593,12 +1593,13 @@ static void handle_at_local_packets(struct at_local *local, struct fw_ohci *ohci
 			void (*handle_at_local_packet)(struct fw_ohci *, struct fw_packet *))
 {
 	struct fw_packet *packet;
+	unsigned long flags;
 
-	spin_lock(&local->lock);
+	spin_lock_irqsave(&local->lock, flags);
 
 	while ((packet = list_first_entry_or_null(&local->list, typeof(*packet), link_for_local))) {
 		list_del_init(&packet->link_for_local);
-		spin_unlock(&local->lock);
+		spin_unlock_irqrestore(&local->lock, flags);
 
 		if (unlikely(packet->ack != 0)) {
 			// This case is active when the call of at_context_queue_packet() returns
@@ -1608,10 +1609,10 @@ static void handle_at_local_packets(struct at_local *local, struct fw_ohci *ohci
 			handle_at_local_packet(ohci, packet);
 		}
 
-		spin_lock(&local->lock);
+		spin_lock_irqsave(&local->lock, flags);
 	}
 
-	spin_unlock(&local->lock);
+	spin_unlock_irqrestore(&local->lock, flags);
 }
 
 static void at_request_local_work(struct work_struct *work)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

