Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593165;
	b=efsq45GTDh9S/+gb/bkGbNLIwthyAxDuo7twViXwOnV3Fc4+AC48po4KrDIH87d04n0b
	 +F81k2bIFL2srykkBVWKH0Pm1XUtedqSuwgpvppYtE+NHyPUKcSBqKQ/o2He3D9KdBXv9
	 SELkyvyq5ylc+YPaT6wxocK/ZITH66E9d8c2J1sQZZvD7+/xqH83LGn2B2ADFqofYsoH7
	 DH4LE51YARYKAyceG8HQviJEr+YR4j2MAYViR3qeCxq5jhFjTa3UZoI8PQ3WgdQuXNjl+
	 cqcrY9c+N2EOKIEu/0y/w1LXC6aSBUWek3bYzCWZSCvNdR5MJ5IpqojW2/nXweqk1cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593165;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=4ZJ80wecbBxq60oEk8qDq4iPX/zE1zlAQta/IozJtn0=;
	b=GpLESfh+iDe07Z40oDTS5P2i+WU5GujnyRxvBZknobjNQCDy0QNTktrDd2XtL9KmtqO4
	 WbdakcLGOl+knbLtrzhF6dSkIyg6hIyTOveMwXI361b1Q8DroAOVSsPPRm/rpYtk95qwI
	 rgT0xU7EHhGYOtub2gMiaeAjruhV5HCbOlNipxSGgOONUdRZt7SVXDcR7SH15AXwd57xh
	 MdKv5p53oDEP51zGgGoukJkc12W9c3L9dBd4VtHBq1m4ypqld4HQqNB50a8nqFMAURt6j
	 nLCbVB2ruP/E7PbVnf8SLzDbKTF7IbdTW6O2LlKqlDt72moFxRXEsF6Syglx0kPLMcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b="FLs/USST";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZWPqxRsF;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0742606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0742606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=FLs/USST;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZWPqxRsF
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 2FE751D001F0
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:19:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 01 Nov 2026 23:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793593158; x=
	1793679558; bh=4ZJ80wecbBxq60oEk8qDq4iPX/zE1zlAQta/IozJtn0=; b=F
	Ls/USSTJJQMzXPpI3Zr3c+E3ZK7/Fa6uexIN1Z4pNJMAJ5KYdOwOfsP1RsMfN7ci
	M1si3TLrxzhwqbb7RBQqktsltiEhCcAuOLwV+nv9iqS74kqsmoohMhA4qIAKGSfy
	jPFcnl+HK05fFm4Uj89QtPAjl46+2JSCGPt9Hu/lr7CvhSzN7edTCTWzNegIUfmP
	kZJolGenzJ3/d8xYdFsRnGTh4q4K28RaYUmjo/s4PFuPQM7oUZvf/teGr96nefux
	tufb5NZWMsGkE04Srdw8lQely5q3SkcAYYnq3+QWVGaLxyS+iXHqV8cSfwrhk/fI
	F8Yld0O59xg3J4/kKNKPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793593158; x=1793679558; bh=4
	ZJ80wecbBxq60oEk8qDq4iPX/zE1zlAQta/IozJtn0=; b=ZWPqxRsF322jIkVqT
	RRDmVtUFxS8p2Lh4A/7tNV30vK7UzVm0UqmBFjHJ9lieIUWR2KLYYQuKjEP1OsEg
	cg/eNbzBTh2huULdGFuKkOfrhVMWgx/bS7i6NrAkBMDNubPuU14zVvNJcSBKcsta
	QPySAcNwztgnzOtiG0YBcXyEC1UG8scZhQy2Yfx8nk36ytFFBEhfiOhIY71TtAgd
	HdKclx7Cv+kEpnLZHPSaqAxKQUCUkZBxf8QYbykJEaXTjFgqAS4jnwNyj+0u0pu5
	6NIpB9/ya9ZQ35rwIGk6e81yrKPYBe06lY9t6JJCBQegAcCI/L6ocplYqFKcHDbg
	4yH0Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793593158; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:i7cugg3RIhxLiq/XdKBgqcL2EBbtvuhXjMurVMv+pu0Yr44
	xjF+Sjo3fF6Fszat4TZirin3Ni3Evltrjp2qjQpOCckjUcu/vm5cPz2y6TBHt405
	VcIfb1iUdFVY1f61tcMOtSAnIB20TyHNADDEf8dW+0CEMLPPzO/AYaitn3ZsXyCq
	1vY/a+Dm6N0tmqHBnzOfVX9OQirY5QXawhKoMfX//N/WOmZmGzdFa6P/getWOKgT
	MtKn9BNCvI8X2n0WZ59mFie/A0wsiuOb/6oAQr0zQLayMHMnOd4eWhWfMi1Qu7Mk
	4QNgmbG+uQteOgJe902i5aQewWyof0pA9cZOewQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:joaxChaPW/Kp7phNjtFGh/FqyQjTAgGKqOiFCIT2NW4=:a5sbIlLKP3k0ed2XgkIlGE93zUA69C50kmzebp/nl54=;
X-ME-Sender: <xms:Rg_oavUKjJKYo97zaQdd1cgNTZyYqaqnHvOzKbGG0enJZfVgg0IkMQ>
    <xme:Rg_oaghGG7FWM8aZaNB17KxVC0p_sEwswfJNpg_k3wi3VpqP6fIopN-PguB8u7OJt
    e3-HAPqkIRH9f6mVJlsWoUpCNtcrcwWZ3WEHQdS9xAEHzt-Vt7QT7a0>
X-ME-Received: <xmr:Rg_oatXsfwaYJFUKjRoqyz86kfGQK3FyuFtnC7XjwVXlvRuuoxZyShFtt5WB5feq0wc-PKEBnDlDXBvfm3dMkrp37k0VbsXo21Y7ekEoJR5KEA>
X-ME-Proxy-Cause: dmFkZTEotuZ1ARIQS2kTcKhurtDCyw9TiUsuDsemNcTAuLGe1PjpywOF6RgNOJbbxX9IfF
    qtGUTS0vQql/3jfllbj0ddYECicsswbB+iH1f2JGy0zqoUOwH4WXcgpPGYBas3CfZwiV3i
    R1nZFyGKX5JmOKYl2NiaTvlmf/yS4dMdHOCx8STgt/d09meN3uMrmo+2Z/lZ/klclLOKlZ
    oHUBOSVXiQJHA0LcBXH7gxWxU+p6oRskza7gsjs71k7qhWpngUD+3gTULtJ3IImLnlqz7Q
    q7hz3NUu9qMJGiY5wXjZQTbswetdGR+PaTrNVkd7GTWMTxeD/XZj3VYl35qDeQqGC1m7Yf
    2ydWGUT8vqZtjdoglyblMssPacrGxZYtbDE1nPL4wFyzuWH3L/fl5+HzZmahPNCeC9OP7p
    LUQzJ5JBN8aRxV3OY/+vqywEvyZyf+nKeXkVpZzr6DyeAF/aWUJV7OAyOP8+u3opePMMtN
    FxiL5/5MYeUTHoT+ikimswlH0lmnP7Erj2gnXD0mnFgO3HjBLFuAmNa+PPhQdul/mUGcoS
    kIXvfra/LaZltQhs8EiNrZ1Du6wf4PDUKQL56cAJ4pNKr1N4ihoHLM5B0oR4KW2uQKDIXp
    J3EhZT+9EwuAloE9tnbPdDjqpTZZhzBp1AuKIucWZuXUiHC2oMFCdA0RGBzw
X-ME-Proxy: <xmx:Rg_oanPnL5nZ8DI5kNj0rPNpbLIs2BlWJUjDFHppEnFHZn5SU2fP4g>
    <xmx:Rg_oapbVLA0Q8WJPeiqR5VpKNPcPaGmq8ZYoA_ZwZFaGCOCgZegAZg>
    <xmx:Rg_oajq9wRIgpGJsnOoQVGDSPp1KYRoNvZi0KOrsVhHYqrjTpaR5ZQ>
    <xmx:Rg_oalYxwrJv79k0ar53b-_UFsaxoAySfNkQ-2ockIr8bVmkcmoSXw>
    <xmx:Rg_oao6nTBmjnelf2tGvvZxrVWejxjW47rZDKmzfBZcPTZQ_9oUIUQ2h>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 23:19:17 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] firewire: core: add context analysis annotations for address handler
Date: Mon,  2 Nov 2026 13:19:05 +0900
Message-ID: <20261102041913.1187814-2-o-takashi@sakamocchi.jp>
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

The address handler list is protected by a spinlock when handlers are
added to or removed from the list, while readers traverse the list within
RCU read-side critical sections.

Use both the spinlock and RCU read-side lock annotations to describe the
synchronization requirements for accessing the list. This allows
compiler-based context analysis to verify that the list is accessed under
the appropriate synchronization context.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 0ebe70a4d440..8d7e0f03aa6a 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -590,12 +590,18 @@ void fw_send_phy_config(struct fw_card *card,
 	wait_for_completion_timeout(&phy_config_done, timeout);
 }
 
+static DEFINE_SPINLOCK(address_handler_list_lock);
+static __guarded_by(RCU, &address_handler_list_lock) LIST_HEAD(address_handler_list);
+
 static struct fw_address_handler *lookup_overlapping_address_handler(
 	struct list_head *list, unsigned long long offset, size_t length)
+__must_hold(address_handler_list_lock)
 {
 	struct fw_address_handler *handler;
 
-	list_for_each_entry_rcu(handler, list, link) {
+	lockdep_assert_held(&address_handler_list_lock);
+
+	list_for_each_entry(handler, list, link) {
 		if (handler->offset < offset + length &&
 		    offset < handler->offset + handler->length)
 			return handler;
@@ -613,6 +619,7 @@ static bool is_enclosing_handler(struct fw_address_handler *handler,
 
 static struct fw_address_handler *lookup_enclosing_address_handler(
 	struct list_head *list, unsigned long long offset, size_t length)
+__must_hold_shared(RCU)
 {
 	struct fw_address_handler *handler;
 
@@ -624,9 +631,6 @@ static struct fw_address_handler *lookup_enclosing_address_handler(
 	return NULL;
 }
 
-static DEFINE_SPINLOCK(address_handler_list_lock);
-static LIST_HEAD(address_handler_list);
-
 /**
  * var fw_high_memory_region - An address range for high memory.
  *
-- 
2.53.0

