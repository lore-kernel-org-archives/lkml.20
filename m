Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614B73630AF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547864; cv=none; b=HV0G8cTFUEfqBVQA35gPsWp5vQEy+cvapso6b6diEmxXGJDfBdcfaElCV0kZc/7CYv/efxOXh8pIv3kgkTAawrMiXr0sHnKvZpzvapSBoKOSEIvT6ivtbj9NARGEef/7U02x/WX4eZY+o4mZXtPZhDao7Vpt2Etfcw6yMHZRppM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547864; c=relaxed/simple;
	bh=DsKtfQdenTWjSUmhasvFTCNyvqUqdaYSdqBbCZp55hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKQJ+YP5kXrVZ0G5xlf+9fuoHxPLPPmLUvByvoI0FB0Axj8bSd70oXvN8CcDX8Rm8NumWJ4l1ELB4Vpd5cUBr7npwnv3aPKzbvs1zfl2xKjZTyox8DvoDFIHKNf7khBI8Vm8j/rlDqBnnZjI0lFU88TsLuhCI768tcTbIF+SGnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=nC4zUhJv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N2WypruA; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="nC4zUhJv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N2WypruA"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 52F2114000EA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:10:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 09 Oct 2026 08:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791547858; x=
	1791634258; bh=ACRoljLpxnSoZ3+WG//lu+YTh3y9mGkv8GATa/LMDQk=; b=n
	C4zUhJvF9N2H7UkbdRygC2IEKFGfmqCLob225VC3+s3isse9nmtYvaGVekQvIzIp
	7mI8tv6CkV0LKDKfviFseypEFfwBPFyPdoGc61FFoIUWe4BDXCiG5FmFT+sJzHe1
	n0JSHquw9/GKudKtC3OiP8COpDiSRIvO5KW1R+mYSoEa/7lF7fD4boL3Sf/CboT3
	5Ghu1yO6hHc1AGI09n0BCGRdPDI13zn7T3yfTEjJOUYC8HUa57aX5RlOPp5rfeiW
	il435b5GCFRt90dAystYM743emzc3sNs0PJQ4lqzo0Pd1FDEbVnsJdWTDjqvWP+Z
	vbi9h/aOslxOI4eOByvTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791547858; x=1791634258; bh=A
	CRoljLpxnSoZ3+WG//lu+YTh3y9mGkv8GATa/LMDQk=; b=N2WypruABQaUUcwJS
	/G2IHmGNVtcNkb+PuieQWlaTADBR1vTmYDhRQOYuoMsqEt1cXppSNI8R/28SkZd2
	Oj+DyQ4+pPrINc1pWMvizEs1HYURtfeDxFf00KFezsYzixpCe12LqXoHk0jgZ4Rq
	8FdqveZbXg62nmd1eNbnHCwQueVjoLqnRJY5hYQZmuuWJFp/nKSuGGoSV8ji+tIp
	lDol4lLfWtittQi5EJslmALkyKxCnrZezyuRtyiatXVZEuF/DKDkcx61gy6qDCM0
	3RGqZnyNl2Qykel+py+NqXW6wKSjd3jqpCaTfAZ+3+5fTiXffx7CB3XMATsCeU0C
	p6deA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791547858; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:QBUB33grcj62SVCSORGsUuJiR4WvVoHtbbb0uyxdM2ZrFnQ
	RNJjIij1NPkKQZAZsuux0/GDC+ZIjaTCI18lm0VQRkxpZuzDPf1CJqHgEYNbOpge
	KTeRigRYuOPrASP4ywuQkvUMLqj/XzRTeTxfBIkGgd10Usu+ktpCjLevcY39UOHp
	k+uqOESVZLGhasmx9QqYZShsBoOPICChcgbYZDPXHl6vM+AQq1NGWhUXswHDZMXR
	+ZrrS/dRGUw+3UYiJbs49WvSK5mBHoTAYfvl+oqojRKK7IMajHvdUs3FD9tBYrVs
	lUnHrUwAu663nwKjlgnuJOYO0efvTxZ5jvEsAmw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:8om65dT012MbZtwiLTkUyi3I2M3FsHZ06q+eFqivAA0=:DsKtfQdenTWjSUmhasvFTCNyvqUqdaYSdqBbCZp55hI=;
X-ME-Sender: <xms:0tnIal2KLIH0M3eImSW4GCWuW1FKQZN3cuPII3Zrf_Qd7Q8bK3ln3A>
    <xme:0tnIaqDA3F-gKS8hZ_Y1EpT5FrPZLBp7E2jyCOybs7UcTs78R-SU-1A3V-eZoNkUU
    J2SSxFZ7fkrjoZUyoEU8sPs777vcDJexaBpwEqb5FXPQN3zYVYe_Mk>
X-ME-Received: <xmr:0tnIatdBVGPLrxvbjDohcgJX-AHiFSx4owp95_UcUSjTSbVGojEXg23pvQb1STHJV7W2wvZJnbqfQ6YrsdnMCVl3IG-zElujmd69FoRLMjarzg>
X-ME-Proxy-Cause: dmFkZTEebFEt+pFrP9koh+qFAZ0KFxcdRzYXR8D5//vpTuK4xUtd7uNM16Xh6kh4X+VLKf
    3KZsS0L+nnqf77o9X/1Ewtl2JmxmA2WTTBVlDyew2mwxgoE8jdNIO/UGqgVZ5lP0sPzu5e
    DbozLadpVApv65vXrE5zskhqqIgaoR1M6k3wdcSczgsOVHbDF3x4xzN1TEJ2zaVroB4qii
    63DxsZI/GYx0hq1DmoL13O8njYH1HlaSVb43jFWlg4HtP0sqOO+cEAaTvm8o3t3LM9W1zF
    7GHBEWwMxkAHSY82lr09+EGLevqCE+dCO4p5nfIncXrfWvxQ8KPMlWwOAyobRGHaOd4WV0
    f3OSl4O+bNsEHikL2qdfxNEQsiY0EEXb/TiV2ci80fFf52+eYEgsEuuVqYWYMu0iTMadkX
    neXCk0j5L7ww2rE/D5adrBAsBzLXBc7QJq7YXaTqlw+cP1GTjPXdP+K3i44aILU2Ud3SYh
    h4TNyATMnuo6vDypXwnbLfLNlmTjHJZ+/mq7l6UxmfPunU030qVK1Zb2ADy5/nLLoFgBgR
    pOlXApvh12REkxcJrV3WCdags7I7ibcOqdceUb5kasLSoRT7GotvQKKEjAdHXjCgxbBrld
    +tmA0fe4ehbzLYB3g5Ag7lqtj+5YtkntgY2FBVkrV63x+v99OGLCD6ecc60Q
X-ME-Proxy: <xmx:0tnIavgd07_9sGWEwePpyRmGGSnNQRAco8Y3N1z5R3b8H5GgiXoxKA>
    <xmx:0tnIalpFBeb66m65kALRGTCKb-ZP6jZOvFeu3_ZsZUxYGN_t27fPIQ>
    <xmx:0tnIavFaV1l8Fr9aZevX5GVkQ8zVu-rcCqWSCcnSJWgivRl-p96zvQ>
    <xmx:0tnIavlGkI5tnCxvBMJ_ImZIKPZAHqjlPrXPi4CZADrV9OUBz9iioA>
    <xmx:0tnIaqKVyEgL0W9IXW74SDK5TtRltOqihsxfCmCzC6dtlFOUWI3lZPjW>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 08:10:57 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] firewire: core: use sparse annotations and lockdep checks for split timeout lock
Date: Fri,  9 Oct 2026 21:10:47 +0900
Message-ID: <20261009121048.282982-5-o-takashi@sakamocchi.jp>
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

The spinlock protects parameters related to split transaction timeouts.

Add sparse annotations and lockdep checks for this lock.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index e7cff597855b..f290ce25facc 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -205,11 +205,13 @@ static u32 compute_split_timeout_timestamp(struct fw_card *card, u32 request_tim
 
 static void transmit_complete_callback(struct fw_packet *packet,
 				       struct fw_card *card, int status)
+__must_not_hold(&card->split_timeout.lock)
 __must_not_hold(&card->transactions.lock)
 {
 	struct fw_transaction *t =
 	    container_of(packet, struct fw_transaction, packet);
 
+	lockdep_assert_not_held(&card->split_timeout.lock);
 	lockdep_assert_not_held(&card->transactions.lock);
 
 	trace_async_request_outbound_complete((uintptr_t)t, card->index, packet->generation,
@@ -893,11 +895,14 @@ __must_hold(&card->split_timeout.lock)
 
 static struct fw_request *allocate_request(struct fw_card *card,
 					   struct fw_packet *p)
+__must_not_hold(&card->split_timeout.lock)
 {
 	struct fw_request *request;
 	u32 *data, length;
 	int request_tcode;
 
+	lockdep_assert_not_held(&card->split_timeout.lock);
+
 	request_tcode = async_header_get_tcode(p->header);
 	switch (request_tcode) {
 	case TCODE_WRITE_QUADLET_REQUEST:
@@ -1318,6 +1323,8 @@ __must_hold(&card->split_timeout.lock)
 {
 	unsigned int cycles;
 
+	lockdep_assert_held(&card->split_timeout.lock);
+
 	cycles = card->split_timeout.hi * 8000 + (card->split_timeout.lo >> 19);
 
 	/* minimum per IEEE 1394, maximum which doesn't overflow OHCI */
-- 
2.53.0

