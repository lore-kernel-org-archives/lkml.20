Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B14B483BC3
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789818634; cv=none; b=YH7lbdxufXXY8yn4tkzJYk+FB/Z8Ng7XJynehxr8BiO0BQ72DwOH0Wd5NwEYR2tTKzgOwvzwkNL8GIaZAXO8vMGdh7QenCfANS8CtxSgqyq2jXyw7t2bDAuWxYeWO4gFbah7+NazvWZMqJTT7FnGYCNkRVtKgoojfHLhOkpxxa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789818634; c=relaxed/simple;
	bh=QBW2WJom6F96um8zbRdUAfViZkPtHjygaPiegFuqIQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwGkNuxv1R3uITWIX3Oto5iMc5JDIRRc5PmLdRgqhrjw+hBItJSr8cOMtxd2amHDKjcRjWKZQzJ+ehtzqnXUBjL9IAYMbMmWki+2U6viYnmKyEGVUoG4j/MIz2v+NxiFN2uVbq/MLcH2nYZnTmI0sdzpt2X3rojLcGyRnKGxOj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=IkQ2XvnF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XGibccYb; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="IkQ2XvnF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XGibccYb"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CAA697A00F9;
	Sat, 19 Sep 2026 07:50:27 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sat, 19 Sep 2026 07:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789818627; x=
	1789905027; bh=8Gthif1Xa3IhwFp5gzEkpwzQMdkp7XiwGWHZs5Cd9eo=; b=I
	kQ2XvnFI7VaYdwAua5FhW7Bnry8cw12THX4FmSkOYhkvD5QnCY/Ba/+cyOYHPszz
	1yRdo3Fl5Fn09Ksa5Be3AOmXBNdkjj39kUDgaxxz4wVTm/G/GuXNVSAwcN80MQBj
	0kqwcU6DUrlgG1QyjesDsCqCSmPVS97wfnADAlu3quA8CE2Z6Kpfjq61zDfOssBu
	5yiZA4TjofnVG4AZFKn8aUXLnVTXPNHtmb2rB2hkTFLUU8gql4s13wboJE1g0Ixk
	fIxrw/yvDlAKNNaskUwWasVg09fjxqfn8guTfAJ93VQDTDTsvhXGEaNOeLIVkDfb
	BHxllqfOD64ha9pHd68sQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789818627; x=1789905027; bh=8
	Gthif1Xa3IhwFp5gzEkpwzQMdkp7XiwGWHZs5Cd9eo=; b=XGibccYbtjjiHQX2g
	G5aluT9VA2jwbWhULbTOybORnI1g1mNL1tBPlRlhsP3sBRXCO0BrIlZo5hHnCs0o
	D89JMdkfwzcb8i1j4N8RYPZLguuCJj6o9PJ9Zxnb/wQEEDo6KfxVGhLwPl5Xfuuk
	YVyj1aEE+Jw53cWLYsNwqqLndwpAkWoCBWKlzSzReN9dC+HR7UofjsBhKG8oMTek
	ZROYjJqeXOMXHlEteSqfmpD3Kda0gYMa1KIrnGaVjeTmq7Y+6LsRd4wbLwfpGD2J
	Couigwg0RC/1CTK51gd50Y5wRI8kmT73qkDY3sSva2dJ9SpkJHr623LyqNx/yHh1
	1BRUg==
X-ME-Sender: <xms:A3euaiKgjuB80Q1901qZjvwS2oKRn9Jof4P_Ifu3BHULy3q6h-jdrg>
    <xme:A3euaoEDywOfSVaUIMwZTvPOznOaViJMTl4t55C1Q-Xm8uZ7fUoZPmJFOtmKIaZ1I
    n-KEsXIwPEy3ebIcZmTaZDFCohtxzZj0b0Bkg9kwG-3HWVSoEgDQbI>
X-ME-Received: <xmr:A3euaqThSAXb7z1-bn4bpXydiuQIcMJin1siKVrwy0WXrIf4SnmlvAdIboYTVl3Ys9pjtWQU4JI9siRAVhHCTiS85tjEKRL2Gd7o85v81Dv_yQ>
X-ME-Proxy-Cause: dmFkZTF89Q54GLsKvm4RbZqlKDuUewYy1TCjGEnhC1YTwWhDVU1Gg8XUBhEJm2TFxVZvvI
    zZEWEbHGf2ZL/pZjpc45k/hrCyAQtJRuufvPYfjuTBfotRHi0VhVl9zEH589EBWb5B7mV/
    tfUd2RmdbhW/gTVcrpgviK+UD+Y5c9VHkMn0OFtbpmRapD9LbA6ckmj6VMUOy2adwzCJaQ
    BezE15MGm6MTQkkQRzD5EoBdxPXwsaCP1b5MkvdulSTaCPXedkrrOZFrvrHQtWUmA/MQcg
    pYWPbDXBkfElLnA8ESdXyHxJfOUX3+Xp1s4Nd0Jf5roMulsmIdACOHs9ds8uKd54CVcFEH
    1MFdCDZRNW3BCkNx89Cr+TxiGR3g63vFoR5pCOF0lI3k3X3rZ7Dsv3+FHYjkEUGKJ6pWxh
    bxffBfEfywV9ahZl9WD5yLK0j4zJt87qJioXp2fOk/YaSWwxwR5LZRlE0PDQxu88w0IHAI
    Hmi8JQ49BX9q3yhDmVScuZf9D1ZMsZpbjk/31vbYKXJv0/FCEKsmU1F9sF/FYA8WybLnkP
    QsOp+QHhpNRqy6ip1WYfQAL/M2n44O04Od7YXxta/BD0zO9NHBP+6ZQ2ALAM7yi0CgIKvr
    7NBUbFKJsaCJByDTjhdVWi+NU+itT2ZtXqLt1NFPXfwiwR7x55uGNOUWeSwg
X-ME-Proxy: <xmx:A3euakFWiZPbjCRRtHCt_qyRQEaQqaeJwYos97TGNP7hTYyO8lHZnA>
    <xmx:A3euam_SePJmzk--m3GSDJ_o1BoUz1FDam7dOy5TziJVeN44XGQlug>
    <xmx:A3euauJKp7xc0nj-soBPxYHz-Emo8aJTsAahxyHnkzVvuBGDgz81lw>
    <xmx:A3euapb2V9lslWW3v3N1tPI_-37IUfYOEmU-p60q8VnDrgwqTUNS2g>
    <xmx:A3euak936jNEJmOaUi0klW8ZK613rtfuam1BwIDMErshLaOpMJ4JN-bf>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 19 Sep 2026 07:50:26 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] firewire: core: use spinlock without irqsave for card split_timeout member
Date: Sat, 19 Sep 2026 20:50:16 +0900
Message-ID: <20260919115017.859169-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919115017.859169-1-o-takashi@sakamocchi.jp>
References: <20260919115017.859169-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Asynchronous packet callbacks are now always invoked in process context.
Therefore, the split_timeout member is not accessed from IRQ context.

Use spin_lock() for the split_timeout member since disabling local IRQs
is unnecessary.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 995c2001bee0..91ed85b7aa22 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -204,9 +204,7 @@ static void transmit_complete_callback(struct fw_packet *packet,
 	{
 		unsigned int delta;
 
-		// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-		// local destination never runs in any type of IRQ context.
-		scoped_guard(spinlock_irqsave, &card->split_timeout.lock) {
+		scoped_guard(spinlock, &card->split_timeout.lock) {
 			t->split_timeout_cycle =
 				compute_split_timeout_timestamp(card, packet->timestamp) & 0xffff;
 			delta = card->split_timeout.jiffies;
@@ -900,9 +898,7 @@ static struct fw_request *allocate_request(struct fw_card *card,
 		return NULL;
 	kref_init(&request->kref);
 
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-	// local destination never runs in any type of IRQ context.
-	scoped_guard(spinlock_irqsave, &card->split_timeout.lock)
+	scoped_guard(spinlock, &card->split_timeout.lock)
 		request->response.timestamp = compute_split_timeout_timestamp(card, p->timestamp);
 
 	request->response.speed = p->speed;
@@ -1340,10 +1336,7 @@ static void handle_registers(struct fw_card *card, struct fw_request *request,
 		if (tcode == TCODE_READ_QUADLET_REQUEST) {
 			*data = cpu_to_be32(card->split_timeout.hi);
 		} else if (tcode == TCODE_WRITE_QUADLET_REQUEST) {
-			// NOTE: This can be without irqsave when we can guarantee that
-			// __fw_send_request() for local destination never runs in any type of IRQ
-			// context.
-			scoped_guard(spinlock_irqsave, &card->split_timeout.lock) {
+			scoped_guard(spinlock, &card->split_timeout.lock) {
 				card->split_timeout.hi = be32_to_cpu(*data) & 7;
 				update_split_timeout(card);
 			}
@@ -1356,10 +1349,7 @@ static void handle_registers(struct fw_card *card, struct fw_request *request,
 		if (tcode == TCODE_READ_QUADLET_REQUEST) {
 			*data = cpu_to_be32(card->split_timeout.lo);
 		} else if (tcode == TCODE_WRITE_QUADLET_REQUEST) {
-			// NOTE: This can be without irqsave when we can guarantee that
-			// __fw_send_request() for local destination never runs in any type of IRQ
-			// context.
-			scoped_guard(spinlock_irqsave, &card->split_timeout.lock) {
+			scoped_guard(spinlock, &card->split_timeout.lock) {
 				card->split_timeout.lo = be32_to_cpu(*data) & 0xfff80000;
 				update_split_timeout(card);
 			}
-- 
2.53.0

