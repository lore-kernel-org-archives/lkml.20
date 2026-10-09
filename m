Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3FA484234
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547861; cv=none; b=b614njobshqGKaeCxmFjEBV05bAROeXtzy70lEemshpnHktFLVOvJfueLOwhJbgzovagSQnBasv6mXNMqQ3mzH3s5Ob/lHMFDcOtd2ye+pT3SsZC6vSdu5OSVyXzuW22XhfGkZS1Iv26WppUv4gVNcQ/NTukmo1VfGmcQpNZUrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547861; c=relaxed/simple;
	bh=vsylojyvDlt8jnk924VGPLJf2lnfTFbM2iHmUyTwCio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pRgbHcW7FHQ/z7vDIzRmm08hqDJhMLlLFra7DYrTy3zAeZNcmq4bs7P2dcXQg/7HXEKpqPxHsD/qjHV9ALJ5CR6ims56a8yiHkJy4ifjASOz9Si27oVBzC/KlrZFoGzhpVgOv4ua/V+7RNoCdzVgG4NKi8EaZqPMHYakqIWATJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=ZiVeJoO1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wILP+DqT; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="ZiVeJoO1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wILP+DqT"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 85A86EC09D8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:10:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 09 Oct 2026 08:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791547854; x=
	1791634254; bh=1z5oqTvYnahY1njcgmA3TSwAp2AR/y1IUcnTqKybm0I=; b=Z
	iVeJoO1tYQloxb9uUkUgPQ5lpKdF+SRNopU/QaLWgeWPebk2AAiQQ0hOmYy32wTQ
	j4ISB7f9+QQor2Hg+BKG+hOAi2P6OgtfyrKzEOZGOaO6UU+vMIJr73TrC6ACZXBY
	Y/vSz9ol76gyhDtaVcdLTC+gyPnbtArFI7yxjQXSMuqTBKBdFP886oyv/lKGKuKU
	Z9lEjThPDZGK5C+4UoOxHcyUtr+hjPAM/YI6XwVl8HY11eZaRe7B1r6z9bmSlcn/
	0IG/0aYX4yXCBhuhI+eMpn2WhV9pLcydoZwDP4x54qBIRMekSH1roDeJZbQjcdUx
	8XFw0rtJmAQv1cnPm4yKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791547854; x=1791634254; bh=1
	z5oqTvYnahY1njcgmA3TSwAp2AR/y1IUcnTqKybm0I=; b=wILP+DqTq4oviybxf
	pMO3Z3JOkYAWjib2+LDV0wwAgP7c46dY7fPsnVWbcikgZdbdwoiYjeJd1xe96tes
	2pLuVUgkCaNmU6PIY6k53XjZ4QFYKvoyilcFN0AJ1SH43RReng0vRn6XwJdNzmPv
	2pBL1cEJQv7x5MMVqT8uEVxIgKcStWdinrHRclZd4aKHBUhfxBN6p/FPRKRIUzzQ
	yMxn5R+V/UbiyaaWWyjDruGWgBUbSVB2b0QMOYQwYP2z5nlVmwun8JgEbqkWZUfK
	Lj3HTgf7SCa74gqg3vdmSewf0Rur/i9b0lJ+fDyzVI3Qnbm+NhoXXi0gRu7OTUfw
	Cbaow==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791547854; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:xFMfoDGRrYPDLSYNonEBX0maR7yLp4KyRvd1MSMGKj7lSLr
	K5Jd+Nph/e35FmszUwDzsUzGw6Ns9Pk5EHZbEZ35rk2/rkcHM+P/A+F8n2+B0jPg
	E9CPfhTfcxISlfjYO5CEVqEmD1B3YdmccYHUyyENMX6TKn5c6BWHchshGcWvIAD1
	jPS0JbYikhEODDYkMs9Q/u5U/mOMyKmN8e2Mus0d5wYcNc7yGShhUudQLzaIs93B
	WD0c6Pn+U0sqWyKcCTA6o0mVPSMsthHUlRHG5jvrnRCkDcepub2HRT7r8yE3WNm6
	r06+7tCh28J8izvAGjENQ+TC3uVS43y3HpiqFlw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:xhRlNmNC3wqIdyLgOQgGHXB7A1t8kV7b/LVx6PVw+2I=:vsylojyvDlt8jnk924VGPLJf2lnfTFbM2iHmUyTwCio=;
X-ME-Sender: <xms:ztnIao7XEWUu3mRjPALsc7s06IzNjF7KW2jssYV-AL9dSnY_EGRyPQ>
    <xme:ztnIan2kBBP3XpTudC8KM0jD-AxbJvt_8LZwsLVc-5Ri_UXkLnYwz_sppcQWa8WJR
    e41-qbI-JpYDuLBmiRn0wgB2mND-RzsarLuG-GkKwXF_lhHbtN9-Ak>
X-ME-Received: <xmr:ztnIavDUxDdZe6KB8GFV6pSDKNXtIhHEBnUqP0qHgJTX97OnPt4ywrwZBbnRCxNhPReT7p6t4O126Qbw1x1VfNiearhpGZm7VFX-UpXZnxQdTA>
X-ME-Proxy-Cause: dmFkZTEebFEt+pFrP9koh+qFAZ0KFxcdRzYXR8D5//vpTuK4xUtd7uNM16Xh6kh4X+VLKf
    3KZsS0L+nnqf77o9X/1Ewtl2JmxmA2WTTBVlDyew2mwxgoE8jdNIO/UGqgVZ5lP0sPzu5e
    DbozLadpVApv65vXrE5zskhqqIgaoR1M6k3wdcSczgsOVHbDF3x4xzN1TEJ2zaVroB4qii
    63DxsZI/GYx0hq1DmoL13O8njYH1HlaSVb43jFWlg4HtP0sqOO+cEAaTvm8o3t3LM9W1zF
    7GHBEWwMxkAHSY82lr09+EGLevqCE+dCO4p5nfIncXrfWvxQ8KPMlWwOAyobRGHaOd4WVb
    hId5j2nFpbv9vZ2oLuWiu6bM4GXPHnpiICkDnwF7OTHQVRXMFJUwYLuG/FPKaFN5IBSbq+
    R+CT3EcbInrZHXOrotmArnflPK5AdA7D73MAi0JyJV4sCDuKzzP5+0HFuzoEp49S5AiAOq
    ul2H2rUraqMGSe+w+DAUAhDE0LY12Zv4q7m62F14utlrbj6Lgvu4z62fzCGjHiiHannt+X
    dOjHoFcMjLVBEZWJCD/GnQFVlS7Qt7s3DYOTcQRb/DS1EewYw8neY6C5OhD2wofoETHseU
    2wEkQDixSvg3kn5ravZLaBbysEJlAfH5ynyWDBoHWHkKCVX9bXgVMNza7W6A
X-ME-Proxy: <xmx:ztnIap019qC6ZiZgsW5JbJrIa8VA-wD_7T8IrIcbMJPt-hfw7RbVMA>
    <xmx:ztnIapuUUCtn9qB--SbLnmaVaJkUAtkxU4rMzjKRDr2oiO_pMyqz8Q>
    <xmx:ztnIap5_iPF9twdgT3lqQW24YyxEifCiYsnRncDU_ENRyOw5uPi_Tg>
    <xmx:ztnIaqJS7FelvkHVSMjzfmtksUuTjcJ7F26K0yDEW8f5-CyVmhkM5g>
    <xmx:ztnIalZDYvOqg2G4MZl6VAA8NaojgIIEtAfoqdSWn38qZDn2YMk9l03Q>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 08:10:53 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] firewire: core: add might_sleep() checks
Date: Fri,  9 Oct 2026 21:10:44 +0900
Message-ID: <20261009121048.282982-2-o-takashi@sakamocchi.jp>
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

Some functions are now guaranteed to run in process context.

Add might_sleep() calls to these functions to document and check this
requirement.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index a0379fc3e60e..be8b2b7b887f 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -114,6 +114,9 @@ void fw_cancel_pending_transactions(struct fw_card *card)
  */
 int fw_cancel_transaction(struct fw_card *card, struct fw_transaction *transaction)
 {
+	// Allow the call of struct fw_card_driver.cancel_packet() to wait for any event.
+	might_sleep();
+
 	// Cancel the packet transmission if it's still queued. That will schedule the packet
 	// transmission callback which cancels the transaction.
 	if (card->driver->cancel_packet(card, &transaction->packet) == 0)
@@ -488,6 +491,9 @@ int fw_run_transaction(struct fw_card *card, int tcode, int destination_id,
 	struct transaction_callback_data d;
 	struct fw_transaction t;
 
+	// Due to the call of wait_for_completion().
+	might_sleep();
+
 	timer_setup_on_stack(&t.split_timeout_timer, NULL, 0);
 	init_completion(&d.done);
 	d.payload = payload;
@@ -524,6 +530,9 @@ void fw_send_phy_config(struct fw_card *card,
 	long timeout = msecs_to_jiffies(100);
 	u32 data = 0;
 
+	// Due to the call of wait_for_completion_timeout().
+	might_sleep();
+
 	phy_packet_set_packet_identifier(&data, PHY_PACKET_PACKET_IDENTIFIER_PHY_CONFIG);
 
 	if (node_id != FW_PHY_CONFIG_NO_NODE_ID) {
@@ -697,6 +706,9 @@ EXPORT_SYMBOL(fw_core_add_address_handler);
  */
 void fw_core_remove_address_handler(struct fw_address_handler *handler)
 {
+	// Due to synchronize_rcu().
+	might_sleep();
+
 	scoped_guard(spinlock, &address_handler_list_lock)
 		list_del_rcu(&handler->link);
 
@@ -1104,6 +1116,10 @@ void fw_core_handle_request(struct fw_card *card, struct fw_packet *p)
 	unsigned long long offset;
 	unsigned int tcode;
 
+	// Allow the call of allocate_request() to perform object allocation with GFP_KERNEL,
+	// as well as the address handlers to work with the sleepable lock primitives.
+	might_sleep();
+
 	if (p->ack != ACK_PENDING && p->ack != ACK_COMPLETE)
 		return;
 
@@ -1142,6 +1158,9 @@ void fw_core_handle_response(struct fw_card *card, struct fw_packet *p)
 	size_t data_length;
 	int tcode, tlabel, source, rcode;
 
+	// Allow the call of struct fw_card_driver.cancel_packet() to wait for any event.
+	might_sleep();
+
 	tcode = async_header_get_tcode(p->header);
 	tlabel = async_header_get_tlabel(p->header);
 	source = async_header_get_source(p->header);
-- 
2.53.0

