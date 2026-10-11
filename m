Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294DE28CF5F
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700313; cv=none; b=J5XGMevNq4NhRho51MBzWGzkC1Duo3O8jveH+3IctoHSU86a5uM7p/4UJwL/yCR9J3qjH7VEYfJsImEIxxS7FpEZFgOh3Ss7J3/EU/S9SnK8XsBQvkiSjZhw1oqruwi6aus5dFX3DxyZNo0TvUsHdpF5B/VVkMV0SylLn2CbYvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700313; c=relaxed/simple;
	bh=hae5Oe7mgg2EuNgTCf39KLjBpAEja9CAKYEIK9CECRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r6WSGv9iPb5AJQnaI/5/467BkN5YWxfbgaDWFplzGyZg7cYRoVqrCHtnPgZE7P89D8io6aB5s0p5NwrIhGOjG51Chwu4MBl1sT8+M4P3Y79RCs7adquzkmDBXPgVHBeiiOehAgxvAbUzb6uf4Hf2uHvTyP8qoC9nU5vmR5T1GOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=oL5NFwX4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=F3HK0Sov; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="oL5NFwX4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="F3HK0Sov"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6160014000B2
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:31:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 11 Oct 2026 02:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791700311; x=
	1791786711; bh=DPCmBEaAxB5LsZRp26wpQNik7ufIh+pC8rcG5haZpQQ=; b=o
	L5NFwX4Gd7UGCMZmTxiB9IVaO8LCSRfTLYTLGjcsQCbEofE2N+1JhDkiCgswueVt
	6fXMFEH55b2IK2oFxw4hnpQQAGpAnKeXmaKsUIN7A+xfqEgUHiRUU0eqbRsw6A5R
	hrnJ1DDFSzhEwBSgFo8kaGBBg5hYDVELkw/N08OLstXTcH1RvcFbXO/wP1WbTS+C
	dspvsmR29mZ71cJ88Uf3SipO0dZI4pEAboR30amdxxXjZpKPkTbhOUSYE6gMndB7
	JTU2jkhRSAcSp1Yojm8VMH8F1E1PQNvimFEQahhgeK9wvqa0kPPhxsca5qxmHGEQ
	qGxpXh/ji79avaj/2hfAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791700311; x=1791786711; bh=D
	PCmBEaAxB5LsZRp26wpQNik7ufIh+pC8rcG5haZpQQ=; b=F3HK0Sovi9Z0IRdfT
	CZ3YjXZLcfjdsV/LeLlsj+HkwOSlv3n6aBHC9QTjKWewTLMpEKzSktM/DfZ/o5tU
	h1CM3c6XUVxW519yeSTRSw6O4Kzy8arBTM/VMIE0muvWezy7uTAbBWgrALCuB0ks
	Yvyvl+DfHyqCNc768hMtTk144xIUrEPBaRMjbOUhifuhctqViAGB2fm42S20lWLM
	lUC5WEOpH0cKURXCT1fLy1tqwg0U+TWjEex1lYhaURjJROqi6yUvgITElnj3np91
	BlVqTYNwN5P2x0qHL0mI8kEzekMkS500yaM/P9B5vKq55LsiojvMNdi1Zkbj6F2o
	kcBig==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791700311; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Qdvw/12uGmRZjwDneYVAk12Ig8KLGBpAlGakRtZI9oUSjmg
	g232D7dIRp43HjdiJx8kG9eTgUkYk6heTv5sQcPdbmw0nQ3stg3pY1I83UiAqoyC
	z/g0bfbAI/NhVwbnjyCkYy5YJjm0TJOR84d4vvGTPkaPfIF8PVGdk2KJdXx39W+K
	a3N2k5rEiqlhR3AufwVTdzcDlX7Onnwn6+Oh8JrLkWNX3DUwRqr9TJVMQMjO+MHq
	lBt+o9xOjmZ6s2i9v2H45Ah66Gy1CRMFXbaKw1IxUC/zRoWwHx5q9V/km7O6C6BF
	D1ufJofZtHjrbRDrc/20bAi2CRLJH961BZcW6BA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:cSnGGh0FT0vqJ960vMHQDOSr/QcnazniTJeAtFgLcKc=:hae5Oe7mgg2EuNgTCf39KLjBpAEja9CAKYEIK9CECRg=;
X-ME-Sender: <xms:Vy3LakIP8J3dSgR5szgLVmGQIVbRNZHAxfzpYYz_Nve1-1bNlrXBRQ>
    <xme:Vy3LaiEUnmElpMZTqCcE4dnFYxQ6Uf4hz2zEWKW3rS6_f6DP3btkhg47gTSgfvmBs
    OzI8WAViQOFU0Pq1ThQ5n-RACFtYJ-prjfNg10qkWbdxdRFNQjxEnH0>
X-ME-Received: <xmr:Vy3LasS1lqxGd5J9qs8An9Z67JRXWFYjbMYKkQsekG2nuRQ9VVUzL2WG9XVG0WnDclGZ23BO33QxS_FzMJ9qnnKD6faMW0DcBdgwZ3vUWFoOR4g>
X-ME-Proxy-Cause: dmFkZTGFS8qHmcjxDPmSffJ0757mmHR0PWt6unCkY+ASghbes4WqIB6FPaCfTxKwLMI7bP
    gCfcUCfM60H2VvIoM3/Ep8flvN2ME7Eo/y/RdCOGk4eczoyzuX62BeXjK38ZURzw+TpIHs
    nB72xqFmF+8vw4Kr9HRSFqcqBLzhWNcd49DbeIcmvhlfINdI86s/gU+7BlN0PCLdd54CHs
    oCjNvDP6xf38ZXATlS+eJolPS0pUJxWE4Znok8eaqOqga6J8pEihhJjNbx2k9LoN6IzA/3
    3+/E4qm0uy+yIEK26jQy85s4xwUaWM9T3RkGIh1ewe6dv6CfQQpd1ehLGsOE2OIePwFanK
    i8jU+9J8LHuyJhPRjlIAGLYfIiEXagiEx1kMGINA0mVBnWW2/PUzBfO337riQGEhgsOmyf
    2W42zbEyFO8LwuYrks2yg5vS+D7FbTyPH5KsxLqCnq4qe1wLWay4RUvGwFKPdjNZ/3sjaG
    3ZCOSZuJrHzNeJquNAmeXHld/C+d+s/1Zr5lMOIA70EFU6tFkYftcu6y72vWAnZ6RYlhCO
    a/pzuVtYfLhmYuJTJZ5geEFu0kpCDv66mSK1JWS3Vyzpy0hRTzsB8V1D30VNojDkrZHKGo
    EMwYzCOcAcAJE7RremXgqSdeWST7Zu4tAybZhBWnb5vQ7VSjbmeVS+iVWL/Q
X-ME-Proxy: <xmx:Vy3LauFnwQmHah-24DmnLZOi3amDiIWdAiZOFZS85rcbsGOxdSP3Rw>
    <xmx:Vy3Lao8TrqfMOWouIaiSn3wDDh3jojd7LNTP8NVMKIVSlA_3C1qlVQ>
    <xmx:Vy3LaoLFVoY1hhygzlBQxCSFAp4B9ve4cR-KfJPY8weKR1llvf73pg>
    <xmx:Vy3Larbsuix6nDvtYy4dofRDw__4tSsTVngVcjPhbgniworkxI6P0g>
    <xmx:Vy3Lam_3UP20IUogw4hfd3RmWsb4wMxB6V5UMxw1TaaVDuTWl2hdv-Ia>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Oct 2026 02:31:50 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] firewire: core: add might_sleep() checks to transaction layer
Date: Sun, 11 Oct 2026 15:31:41 +0900
Message-ID: <20261011063146.497455-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011063146.497455-1-o-takashi@sakamocchi.jp>
References: <20261011063146.497455-1-o-takashi@sakamocchi.jp>
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
index a0379fc3e60e..1b9c642abe43 100644
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
+	// as well as the address handlers to work with mutexes.
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

