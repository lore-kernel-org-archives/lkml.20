Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64470486BA9
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 23:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791503082; cv=none; b=VVAfIixW00o0JotX74C2ns79WwJObRQzVBts8nDN2jA8jFYAbVA3SNrhOBirNucyYIjVMRXPwQ18rW5QXypF3KEi+9qf3p6GPG4K6p0vkHSoCZXG5wDLgjSTiQD1wEkisW+gKei++D3At0Hh7aiSU/W8VAZDhAoQxJoPtypsEV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791503082; c=relaxed/simple;
	bh=SWza2C+j/4nuMLrrYoHMp1tDgW07WMeQHCrxZZAQUBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZzkV6EIvMpuBEyqxgRU6jrXebBHTIv384asjUxz4hP99CMpL+kmXQvntmEmaK9tfRqgpHdvLqjriFuGPqMWrihV0YNZGVFdxurefAjfm19LETvtmrnxm1pAEUCK2TakLTP1kEHINnkyMxVDVgfMl4H3p4+EODHCs3gsctM0mqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=CnMTW5Tj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=V7rwMWLi; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="CnMTW5Tj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="V7rwMWLi"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 787547A0078
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:44:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 08 Oct 2026 19:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791503080; x=
	1791589480; bh=d21w32WOAfiQyo/RP2+JYrY+dRW0c+MboANwrEkz3cc=; b=C
	nMTW5Tj5WTs2m5uJu9SOP7iR1yexamXe9xNSuTdpZJBd0aJR4QW6Rs9KePltCDNx
	uU59FG1KLUpNOH0UvR7RmUACiQ5VDTxy11KnNjyTUv9P3hOOcOcVlNORmt6EXg+H
	50ADvdQpX8BRWalcBrbJuYJZHoSsMnOnvWxGU3wzFpOstpTUptWNneZyxK6OdBW5
	ybR/Oz5xXAKAKok2qXeVzSnWgbzSZ3NHOXOkapBgFhKMBvhr+VwUv8fymguVJ/6t
	GbE5dCgZ909MN+KFpWdUf6CN4GNT58+VhX/BqEUL3mX2XovgNWCE77ET8Y2ujyW1
	uKGTksVmjORKvDsAbnTNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791503080; x=1791589480; bh=d
	21w32WOAfiQyo/RP2+JYrY+dRW0c+MboANwrEkz3cc=; b=V7rwMWLibhX6oETPN
	DDpXE7WotI7iZ3OIooU6WuLKYjV1Cah69QJLalVA+hf5GSLvEuU6GkigMwgO81Wf
	4QmbqyWgSXjl0QTmUF2LIXg47n9dw1wxA/Y6jBTQYKirpXqzLIQEdr7KPnrwEkk8
	ls3E+yr0dCWbitmo41nQq4bz7KnSQzCehu7rPOvghe95LfA9oT1C+B1I0YeSNaPP
	o/S/DfmpCPbrTxRELQyq6FjNMyq3kOwcNPDKzASuAVJ2zSghqm08XbiJQR7BbSJv
	F9pKG+0M/Tp/4OM+mrGZYFLZo9UloCmDr6x0eSduV6xygDw5TI2wYAELV5FXcRrw
	gB5XA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791503080; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:MZOWq+PfWWwXxdQkbGgXG4VnH/qrjA/DDvMJLXNkbFMf1dN
	zHyEWZRJNH3GT3af5nZv+ZDtv3RYmk8WAxqVmStZUTvh3WRqubaSOWexHQIUWMcz
	eM4Ri+TdDve49ImXHrLrYHvBy/q3njQ8P1hOooFw7Yzc13wgRwTC4Euf/LktMZh3
	fGyMdRiBAUAHs4RTwBpY6KULCCclXBRBHw/GRvP62mrdhWofMkTPItVfHy60AjMI
	kxkIOOhmXlyFV2le+fIkf/DPzht70EY+m/91U37CXEWGfDwF+IWFcZiSUPCFZikl
	jlppy1nzwdTO2u2MUY3hd/25cO4JGMYeYt/2xTg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:VzXTpxNDHULcJDRkBOS/FaaaVqMqsrIQX9eHAzoxnBc=:SWza2C+j/4nuMLrrYoHMp1tDgW07WMeQHCrxZZAQUBw=;
X-ME-Sender: <xms:6CrIapXEt5_a0Pp5RZdQcFM9ioi2ENC4wTihomRQDubjMCAH-wXJig>
    <xme:6CrIanjaErOX4iHYvqPHjPnJE3BzTf9OFcvRn3WlA-oeyWnjB5aKCShZ6rQm6rM9g
    K98pwxcC6cWdOTsaIN6To4Rvgp0xfYgBef7YW7a6tq9L59ia_HW7MXb>
X-ME-Received: <xmr:6CrIas9StY--Oes9VwRc8yOML6s7zvTJCv4uNl46mAExSMhLqXoV4xmMxUqYuXgw2Lj9xWQQLulpJwaf4PlO7BW967miDtcJ2yLMNt3ZgW8dtg>
X-ME-Proxy-Cause: dmFkZTFXiP3ByqRhi+bwfuEeoAus3yLRLtXhJHCwP6MTIYwZlCSl48rCsY0UEii+0QwUS9
    xSx1ysA4oMb5BPpT1i5hTXOpWF8kB0fBm+jF7w8IjL9KNqD52nb/FIROI28s5WcMn/Sm3C
    bb0rs+G4cgc9GOF7iMufmCeAHYWWbaMdrGiimryatdAJwvTko+Yk8d0JfUesu/g9kjRbuM
    GszrLhc+YMK9NFdZ55jRsRqoU5n5N2Gk9DnvUfk5ZZ82Ux4K7iAVHDrwSBl0tF19iwVNWg
    vr0npOA1jDggXakKdKRzmShW3vvNSVNQ1/A69o/HOmrHHA8oLUp1XCgW9uD0Czwoo/VLJK
    kpwRyyRmQAuxU8pSggPfNLBAxmkGKs9apih+SvFLQkV38sej5aDBLX5mSAhiiIZ1eoheJ9
    QAcweAeRwEaLQCxO4tnFtCw0YhMWEiWNIoTpsccFfbbwX8V9EOCxAMt+7BBBHWm9qrgJIW
    Qoj8yRRMdBHdIBZwpuIOa5X9e3GXymcylbpWtHoJ5mF6u+FAmWvjvXc0k8DkQm0vhAr/qr
    sM037FKhGNBFtk3nWDG7aldNeo5aWvXg+iz0qc4m033qRtaObbRnEyCXtg7TpARKk+4e4a
    ERqYL879NF2w5Le74hiNMrlsRG6Rgw6+v4nCIrZniKASrzCowvm4STdq3iYw
X-ME-Proxy: <xmx:6CrIapAnBo_eoI2tdUpePJaSKJs4x0g-Ai9n20-d_Qs3gulOkpNMtQ>
    <xmx:6CrIahLrfqH0S3bFw6kay4TUKUROv4YldAZrqHBXnr6-d04LqVFXfQ>
    <xmx:6CrIakk6psxInDFQKSQzgkAousz-ok42qdc7CHlViRwi0Mt5QETOnA>
    <xmx:6CrIanFv7rhL8imelvgexTSm8Sj00L1H-Bo3tPmXsph2v2euE4p3Mg>
    <xmx:6CrIapq7y2anPuDQw65jqlHVXCYcLmL23l0vj_60s1nIBS9oF33yPv-V>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Oct 2026 19:44:39 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] firewire: core: add might_sleep() checks
Date: Fri,  9 Oct 2026 08:44:28 +0900
Message-ID: <20261008234432.251412-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008234432.251412-1-o-takashi@sakamocchi.jp>
References: <20261008234432.251412-1-o-takashi@sakamocchi.jp>
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
index 39715cf79ab9..ac7a9bde6fef 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -112,6 +112,9 @@ void fw_cancel_pending_transactions(struct fw_card *card)
  */
 int fw_cancel_transaction(struct fw_card *card, struct fw_transaction *transaction)
 {
+	// Allow the call of struct fw_card_driver.cancel_packet() to wait any event.
+	might_sleep();
+
 	// Cancel the packet transmission if it's still queued. That will schedule the packet
 	// transmission callback which cancels the transaction.
 	if (card->driver->cancel_packet(card, &transaction->packet) == 0)
@@ -473,6 +476,9 @@ int fw_run_transaction(struct fw_card *card, int tcode, int destination_id,
 	struct transaction_callback_data d;
 	struct fw_transaction t;
 
+	// Due to the call of wait_for_completion().
+	might_sleep();
+
 	timer_setup_on_stack(&t.split_timeout_timer, NULL, 0);
 	init_completion(&d.done);
 	d.payload = payload;
@@ -509,6 +515,9 @@ void fw_send_phy_config(struct fw_card *card,
 	long timeout = msecs_to_jiffies(100);
 	u32 data = 0;
 
+	// Due to the call of wait_for_completion_timeout().
+	might_sleep();
+
 	phy_packet_set_packet_identifier(&data, PHY_PACKET_PACKET_IDENTIFIER_PHY_CONFIG);
 
 	if (node_id != FW_PHY_CONFIG_NO_NODE_ID) {
@@ -682,6 +691,9 @@ EXPORT_SYMBOL(fw_core_add_address_handler);
  */
 void fw_core_remove_address_handler(struct fw_address_handler *handler)
 {
+	// Due to synchronize_rcu().
+	might_sleep();
+
 	scoped_guard(spinlock, &address_handler_list_lock)
 		list_del_rcu(&handler->link);
 
@@ -1089,6 +1101,10 @@ void fw_core_handle_request(struct fw_card *card, struct fw_packet *p)
 	unsigned long long offset;
 	unsigned int tcode;
 
+	// Allow the call of allocate_request() to perform object allocation with GFP_KERNEL,
+	// as well as the address handlers to work with the sleepable lock primitives.
+	might_sleep();
+
 	if (p->ack != ACK_PENDING && p->ack != ACK_COMPLETE)
 		return;
 
@@ -1127,6 +1143,9 @@ void fw_core_handle_response(struct fw_card *card, struct fw_packet *p)
 	size_t data_length;
 	int tcode, tlabel, source, rcode;
 
+	// Allow the call of struct fw_card_driver.cancel_packet() to wait any event.
+	might_sleep();
+
 	tcode = async_header_get_tcode(p->header);
 	tlabel = async_header_get_tlabel(p->header);
 	source = async_header_get_source(p->header);
-- 
2.53.0

