Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593168;
	b=qrML0KgNaT4TnA4KHNkBJLjJFbRVFS3+v3b5FVz/JEbWw1y7oipdDa9vRuuW7TMYaNsU
	 GpI1P1LS7DsF1tzGqXivmSBIXPS5vWdkFpxRFI17Msep/cq3E+FaxLj2Mf7eeNhO/5agA
	 I7APMaiqguQiKN3xHzVApWKMpO24omXznLc6aLe4r2Baw9utt3vKanAjxSZH0OJX1BCUs
	 CcYGYx5zZCrHfuDvi3cm05sMV+M2OXJjWf4QQnayW4Ha0si4rbx6E59jmlEth7gSMlqk3
	 az5QDNxiDJZctOJhjgACMJcZ+51fdJdp0N6XtNXWRSaD/Wx2sUWWv/IjNX47yBYiaSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593168;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=mC7Gsu3Vc/6MW9/SCE4rWYySUwxsKQDflEa8p46k2Xk=;
	b=OPdi4PBmBC0ZcKWEF5qrLzqs7UdCicx3LoLCZtCwsfhCVIe7aoyyAXW40WfVd42eFz2r
	 +bHuXbdH/ls3/FjdFDP/xd2KNnOchU9SRNZhlbd4vaAtL43+h8xBg2snBxBcWUjIIP3gv
	 AwRbEKRU4fbNbdJaO1PtutDl396woNmMfTb0pasmFMY3qnOXnbq4SzGIwUJPxlXy23E14
	 iUqyZvtaVTnBOFjL/umHJoBs4CRkplQkEeqSD8BYTpBZ/4syybHAEhmxERvNTfb7jkqGn
	 khoFJgdd9FJppxCtS1w6lTxZZ7sYl54ozoIItWBgkKS24KmQxFXTbVgg5iY/c0YpGqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=XRUFLWNv;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=G8ZWYFZC;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34C3606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D34C3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=XRUFLWNv;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=G8ZWYFZC
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 3A77C1D00209
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:19:27 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sun, 01 Nov 2026 23:19:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793593166; x=
	1793679566; bh=mC7Gsu3Vc/6MW9/SCE4rWYySUwxsKQDflEa8p46k2Xk=; b=X
	RUFLWNvYGLd/LneodFOx+kl2bUvVfd3i8UnugF30xFuPfbVKXKODmSglcmaNc2IW
	5oiXq5lv0a+4AVPCFfs/1Ck3ehU2hjj436qxbjSi4HERL1SsmkLF4MzCblGklh9f
	JFFL4ZOyokOwR8P8nLnvAE4Sy6UpSYICRbMYAksJsfl18mxAXyp4twvwnUAASZxC
	Xvrj+a2Qe4SM80LTtw0UGlzEDVixcIh5OhSbC9fcQKC1MUInfddJGIzi4zuLEM0A
	7IwVkLBughSY4fA49JETKTavEQU1aJj4zheeZf5gO+9mAALo5DhnsLVEtmlYBEY3
	t5q+aERe1D9jbcnVmDwRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793593166; x=1793679566; bh=m
	C7Gsu3Vc/6MW9/SCE4rWYySUwxsKQDflEa8p46k2Xk=; b=G8ZWYFZCV9Z5yr4w/
	1tVoAlZp41iC4Hg7so/BRe7tpK+DVNVYc+YBoubeco1SsM21FscPDPczRefEnjb4
	oFsEK3Kv7iSvHBXbqpeF21Xbim5BorpcNKbdftgO6hY2mSIrXtxLAfddNcxoAupT
	VO6dkKCU8Y13eUlle4FGqUC7R0Tnc45veA7O0LO5Pw0+7Kyrc8BMcvDSZFVyZHuA
	gK1YkZ/JUTKgBOchAsitTuzamgpv3lajBxcgjG8Oxm5PrVNNQfBH8cqoLP9cE2PY
	E9EI8qMhNzTvu5fOdHz+KcnoeYaHXN5qfTKQotpFlHYKDbtdR8jFfcWmPB51Ge4Z
	W6GMQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793593166; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:DgqTc/BfLCTQ95VeCrUn3Gt4WXap+Ryz8WB+JlTQ1qHo5jC
	x8UwG9s4MBmE0DaOkbZr5g1kfuGUuBcDNW55c6XhUIEdHJbE7bGgVfhhzX3PKtMK
	Q6T5906aaDnmBoVlRkpR7eSkoE7rCEvEXL0DMnxKnIBET7poRv7Uj1Na7Z83HONA
	wAclS/JpBkE+nnnOTjHRBllZLbMf883O8dp9N1Ml9MD09M/BtAeW1g9Pg58UKM3T
	ZPTihYsj/F6Yv4nMREXwpJFBNUtPSkf4bLpQLkruvhYz3/5MzlNsm7khesbbHI9B
	EszRyS1wE9zp7objuLtqV776EU8S3WrS0Zv6ZPQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:5hgCIufw+haLa2OWS53Yhytwt/djCKfWHPu6DHOZA2g=:1l8IjlEcES1mGrGfeePbhR/zr7CDAYAaYPxrheQ5uD4=;
X-ME-Sender: <xms:Tg_oagJt1GCb1m0GT1IezUsrManB1BFf7Fiq74IA6hkEqp3APn1Vsw>
    <xme:Tg_oauF-FHam3hj-RSw9dtqcICeK_cXQVzRhNF21iJOL15abjdrLgt07-kXzQx6jP
    MbG7CWhgXVKofBU06X8HQkKcil8IbVsmUkbm0dGE2Cn_KIO58boiagV>
X-ME-Received: <xmr:Tg_oaoSp6q91L3PPyvIeoyyWlJz0nwCd7lyOTqtPBKuVwBE6H1-ObkaeIMqqlNkcZP9_cDmcKSCfzYcsgQo9FWeW3EkirYvXJELyB-Bw8XEqew>
X-ME-Proxy-Cause: dmFkZTEotuZ1ARIQS2kTcKhurtDCyw9TiUsuDsemNcTAuLGe1PjpywOF6RgNOJbbxX9IfF
    qtGUTS0vQql/3jfllbj0ddYECicsswbB+iH1f2JGy0zqoUOwH4WXcgpPGYBas3CfZwiV3i
    R1nZFyGKX5JmOKYl2NiaTvlmf/yS4dMdHOCx8STgt/d09meN3uMrmo+2Z/lZ/klclLOKlZ
    oHUBOSVXiQJHA0LcBXH7gxWxU+p6oRskza7gsjs71k7qhWpngUD+3gTULtJ3IImLnlqz7Q
    q7hz3NUu9qMJGiY5wXjZQTbswetdGR+PaTrNVkd7GTWMTxeD/XZj3VYl35qDeQqGC1m7Gv
    6U37+62HmK5XhYVW9K7SxUakwdDBwjS4UvOsrh+//84URc2oAUnEX16chBDZ4rX8kKsj37
    7oRRLxEmJbPbYgfuLd14vTrR3MOos6y/fuqPUs7CrkU2/aeVHRH8ApQR1bxRlTxV9tasHv
    GV8KR5uW6NAcPd6o4GxwgVSPQqNGZR9W0MLiSsnvHB0wK9v25yzv6pcxF0dCVKC+06oMPV
    bQNCX/qsurEJey5zI2S5DR940AKR+p5QviWqkgiC1m1aYn8kVWmsyQ6fG2id4laZ635ZSa
    AhqGLoBK1HapR0d+CjeIgS8wGoOGMyo+vKhASQfDZBlJVnp048J3I+UqpWxQ
X-ME-Proxy: <xmx:Tg_oaqGwfhbhBD-hBN3bliGtDtDw0MU-l2Hwon189gduxfT-adNlOQ>
    <xmx:Tg_oak-NorQxgb5aU9_yDC7CwfLm19fl0aISs26PLBn2FsQJkhdnpQ>
    <xmx:Tg_oakIc0Wxffq2sOqvLf8HRloXE7ObX8wSu8SOW1mDCGbPXSDN9_g>
    <xmx:Tg_oanZcwrFPKbRIwphI5qQgb5r9AKf81jaXQqpRN7267MmbTM65vg>
    <xmx:Tg_oai8TSgiVmCKCSwcVlrTqHs9SX1NovbfOiLlE5uyOO4aQ6jPqZZtg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 23:19:25 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] firewire: cdev: add context analysis annotations for client shutdown flag and event list
Date: Mon,  2 Nov 2026 13:19:10 +0900
Message-ID: <20261102041913.1187814-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
References: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
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

The client structure contains a shutdown flag and an event list, both of
which are accessed while holding a mutex.

Add guard annotations to describe the synchronization requirements for
accessing these members.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 927363d03846..da1c761f8b73 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -55,9 +55,9 @@ struct client {
 	struct fw_device *device;
 
 	struct mutex mutex;
-	bool in_shutdown;
+	bool in_shutdown __guarded_by(mutex);
 	struct xarray resource_xa;
-	struct list_head event_list;
+	struct list_head event_list __guarded_by(mutex);
 	wait_queue_head_t wait;
 	wait_queue_head_t tx_flush_wait;
 	u64 bus_reset_closure;
@@ -317,7 +317,7 @@ static int fw_device_op_open(struct inode *inode, struct file *file)
 	client->device = device;
 	mutex_init(&client->mutex);
 	xa_init_flags(&client->resource_xa, XA_FLAGS_ALLOC1 | XA_FLAGS_LOCK_BH);
-	INIT_LIST_HEAD(&client->event_list);
+	context_unsafe(INIT_LIST_HEAD(&client->event_list));
 	init_waitqueue_head(&client->wait);
 	init_waitqueue_head(&client->tx_flush_wait);
 	context_unsafe(INIT_LIST_HEAD(&client->phy_receiver_link));
@@ -1971,8 +1971,10 @@ static int fw_device_op_release(struct inode *inode, struct file *file)
 	}
 	xa_destroy(&client->resource_xa);
 
-	list_for_each_entry_safe(event, next_event, &client->event_list, link)
-		kfree(event);
+	scoped_guard(mutex, &client->mutex) {
+		list_for_each_entry_safe(event, next_event, &client->event_list, link)
+			kfree(event);
+	}
 
 	client_put(client);
 
@@ -1988,7 +1990,8 @@ static __poll_t fw_device_op_poll(struct file *file, poll_table * pt)
 
 	if (fw_device_is_shutdown(client->device))
 		mask |= EPOLLHUP | EPOLLERR;
-	if (!list_empty(&client->event_list))
+
+	if (context_unsafe(!list_empty(&client->event_list)))
 		mask |= EPOLLIN | EPOLLRDNORM;
 
 	return mask;
-- 
2.53.0

