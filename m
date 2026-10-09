Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8114C14E5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547866; cv=none; b=qvPfurr2FRRibCzANol09BzlRTS4Bekh4vhba7xgPdDC1I5DsEu5zVjYiAtyRtOHgQIJbuzi3vs0bNFycKiXkt95FtFMkegsJcZHeVK/aB+JnSJoX47Sbm8fkvETTxAf7Iz0KU9pNYrA/uPoSi9yoq6INT3PhcN/t7IdD/7M8R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547866; c=relaxed/simple;
	bh=USR4LTdlpa+6ikqasNNTJ+WEi3dc9Th+sLnt0RoIJps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YoVhOqdAxbruomsI0l1Hqjry89TJAxUwkuYX4COBuhh6Zd4K9PvXonE81krzqPBDLrfg7s3ZQ+roqSGOUc3e4tCRtxLltJQtguXIndt/knyOLKOpIU7gdKaCcFE1GL4+mPLJiSTueVAsOtvAXopGSMttDMjhSxPEzv9GETij6eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=vzA2iGfx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GWQOhyp/; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="vzA2iGfx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GWQOhyp/"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7E1C6140007C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:10:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 09 Oct 2026 08:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791547859; x=
	1791634259; bh=NlCOy96F4wU3+Qa/eLol6kVQx2mXuKqq1KHZGABQeq8=; b=v
	zA2iGfxi3oslXwh3UqV5M1LC2ZWDcAJAL/8UKhgkWWpPisHknC5xZ2iPztTVDh3k
	fF21MXNW7lbVT3wPOrpLX1Zi387E5o9eoinmWjyjAiQ6bkWoIPD0Q5mgcauPHHX8
	GF3LLWNcSAY0PJ/i7TEaR8Kr8iKGTuW79q15lvzFIjV04p3ugJDranduXX72/Ikg
	b9mCpEoiLTmF5y/DX+mfzIPmCpDOg5rAFSG/vUvIACL98QAJJkkUB2I075YF8rWf
	v/IiHtj1kYKM04TceOUxfSPCBkoupDaJEBxOjBlvC2n9r3UgPtfJ2/jXQ7UXM5f7
	Z3/jWhg8/oUhhugdRD27Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791547859; x=1791634259; bh=N
	lCOy96F4wU3+Qa/eLol6kVQx2mXuKqq1KHZGABQeq8=; b=GWQOhyp/ipd0GzdNE
	IVlQAKeUEo5kEXWoFLSOe9XPH7UD+J1lvJlyavxB619klSGuUdUCdyNiaN9KKigz
	FWlvj+JEXuneltU7euZ70oATsDvHvyi0ObjTSa4TsEhmikUok19HgT1Sl+W52x7C
	nJzlzqfjTdrFBjJ8cUwWBHF8HgXDbMlzelYXp+SyJmL9yMy+lm3LCPl7rZu7W8Oz
	CC3FzIAu452MWhVaRCyboBl61or44LQoNXIqnEW/Pyl9M2mVDurTB7Q/nMENpNk6
	CITY/jLlak/dQcaxyCA3X963s4StOqZGH8imc4bL2N6RdH6m08Gcl01Kes5DV99s
	mUjPA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791547859; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:ofZfNP0ZvLtgBbKqXnTqNKCuZBdjBhYibcz/5M1TQlOCm8q
	4EAMHmiJBbS2MO0e3SeIV1Tio0vsiTBjTSF7iFxi13T5VuPFiKum0jkbxeyea4IT
	HjhxBTRZSSFMQQ2Dkd85RAlbr07CBUqypSNVpH+NbnNR5Sf1fL/astrETuqCo4B/
	JOVH0wpbjChbe6D/B0QhElsIQBgQfwFEHa5iakR0WxJCtoCGquSh0ObtcVXo/sTW
	da5h68jFIxZto6ww0cP3COQXUlLwXI56W3nfR+JyvYzUipnp1uB63V518Y4Rj2Bh
	XYzg2m65H1yQUUxez4gJaHhUfWX4ZUmORh5/3Qg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:mUaK8/w6X3I4BpVmbq/5JqSPQGi5uBGT+r3P0MVUsgo=:USR4LTdlpa+6ikqasNNTJ+WEi3dc9Th+sLnt0RoIJps=;
X-ME-Sender: <xms:09nIaiSvsnbVHnQw3EwpjRo9S6rPPLQjtSU20yz43Vbsmb9Ln-WQNQ>
    <xme:09nIalszeei3y4v-eamIEpGJOBlefIJ4bdWwo4NzX4xIUxfIrVcr9uAbpl6Vwl3Iy
    e82X4vM5TY7MV-3Th21NAHr0BWUQDUJsvtx1zPmX0S5AJhzpVRPllO2>
X-ME-Received: <xmr:09nIanYdaQsh9FUukg5w9lu3vKFeTzFp_mRm2T639bNvuAViMOExXioF3ve-AeQuopV-sokJUlWKJkzwIWVR84J0mfav3UUR0Eo-Ymve7HXAPw>
X-ME-Proxy-Cause: dmFkZTFd+4pxMxUJUJpWE10xtaFmhVyOknX4lMyBxOhVDNiq4Yaic7kQoHMU+V8NP3vixL
    wwmMOjyNQTHcBRkn+Ba4sDBoinhi82yu6QTxltMo6oGuNgx9WcoaIEOoktDDDy5Ng6WQrj
    3Tyd5muOdN3RVog7sw8sO15njBcWcpBZ7sMt/++IwzxEt0jQ4EY+79G4tTVBik6yL0F6V+
    1C79Nq8N7mpTOZrSQKn9GpOQlcoiY9VZiafX4DrdVQqsnJdaxIkG02C1cY9VUZvn1BEfFT
    ZJXvIkXIlhxsvEf4x8Of4W75dyUiDIVx28Oh50Hbjrx8A9fDS/T5PW5Nb3mVejeZbmNkHd
    j6nHOyCfMARvtRx4znpCKcJl+aVKy7oybkiR8xWq/TWGJFMXcAcKFrt7antLNcPAFf+qu8
    mODVVf1ExdJL1D66DhVeMj4ikmAz9Y2y0lsEeWpUErBTDmScQNaQ42B8/Ut4Tz5CM8X6XU
    +Hg27j9VI5LH9/xEwck8AUSODqrvXIvoLCMXLoy2Rj2Y+NQ6Hy+JgaFjdeRDo1qNGn+895
    aZyabA/C/UVsYwDIgxJ6/UhBNm94H5UJkj/KgembmMCl6UoFIENOnOZQWgTGSHK7G69Xdn
    IYMHF2gOxB9H9KIEhLXVBl+bgX1XuO0bufdqI08S9lqwkyr+xvZlBcX7Ydxg
X-ME-Proxy: <xmx:09nIaqt6mWb0IVexyFar_-d-UZFRxDNjSZJgphGwUcIbuU7UOEUXSA>
    <xmx:09nIapGPx85zDeFwOHoko1SR6RAtf_Wma5GnjODo9CDytyizwUwPOw>
    <xmx:09nIalxech892hlZlbLbBruMZv-5dhRhNvzNozMoXcQ_EIUuQw9ICQ>
    <xmx:09nIaojdxh2USUFtd9f7NdYELzhsfuwu3cI-UjBR9o9Fy-nECFXKfQ>
    <xmx:09nIauHDTCtb_w8Ve2D4Um0mgsc_UcbY1VXEgw2d4jsXQYZYtlSrpYSo>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 08:10:58 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] firewire: core: narrow the card lock scope when accessing node_id
Date: Fri,  9 Oct 2026 21:10:48 +0900
Message-ID: <20261009121048.282982-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009121048.282982-1-o-takashi@sakamocchi.jp>
References: <20261009121048.282982-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When preparing the request subaction for an asynchronous transaction,
the node_id field in the fw_card structure is accessed under the
card-level spinlock. However, the lock is held across a call to a helper
function, unnecessarily extending the critical section.

Narrow the critical section to cover only the access to node_id.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index f290ce25facc..1c07fd0d2dd8 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -450,13 +450,15 @@ __must_not_hold(&card->transactions.lock)
 	timer_setup(&t->split_timeout_timer, split_transaction_timeout_callback, 0);
 	t->packet.callback = transmit_complete_callback;
 
+	// The node_id field of fw_card can be updated when handling SelfIDComplete.
+	int node_id;
+
 	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
 	// local destination never runs in any type of IRQ context.
-	scoped_guard(spinlock_irqsave, &card->lock) {
-		// The node_id field of fw_card can be updated when handling SelfIDComplete.
-		fw_fill_request(&t->packet, tcode, t->tlabel, destination_id, card->node_id,
-				generation, speed, offset, payload, length);
-	}
+	scoped_guard(spinlock_irqsave, &card->lock)
+		node_id = card->node_id;
+	fw_fill_request(&t->packet, tcode, t->tlabel, destination_id, node_id, generation, speed,
+			offset, payload, length);
 
 	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
 	// local destination never runs in any type of IRQ context.
-- 
2.53.0

