Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F18224D6
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792251228; cv=none; b=koonrhyK+S2vqh6SC+q/vPXwE9M6CH4D2t3W+OztsnfnkMeRTajx8MRDd2G/JP9BKHhDJYQ9gU0w3PrXkKvwC5Tz+zgIG9/5n/vB5HZg+Pw7CbI8mtTDnbAzJz8gdGFa1LQdFBothfLhX4o48W5W/yesst6SToKs5L/7nLvErDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792251228; c=relaxed/simple;
	bh=A/baWhcMw7e9WAD4UlOjJIp27qwejGGq6tEHW8Y8K2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qMJmWNfgmtCv0E5WAxAsW43DvV0O0Kf9l+UtPSai+CPnaPa/QZdDISigUJ2/t3QVEupUg3Af2QTW4yDQe/WV3IVK9A2Y493TBmSSBpAbxNGH+qjPDkxZWLJLPIr6yAI1FNiivZOZW4kUAxZ2eKUBE0uF6iOyAvCY+V4zF6HQ9Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=e/4B4ki+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PE3+oC9C; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="e/4B4ki+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PE3+oC9C"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 07B1D1400062
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:33:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 17 Oct 2026 11:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792251226; x=
	1792337626; bh=vz9gWVtyN9jbcl9ox/Lgtzo2cJWY/NBmWTw05zBxjfg=; b=e
	/4B4ki+M0TbKHYQwR9RzReFXJYljKYD/4NdwRtbhDeZ2Uls+N18NvXikX2KY+hR4
	4j69E+E+EbhRz0SAqXxYAhp8p/1uPTsUGIUsbUx91/0E0ItPixNbBICzL+TSpXuu
	sn/VRdCMV3nl3lmE+mLyW5JPANDIBCuxEIeTXYpmCKOx03winPQCa+0/qkfp04Gr
	eTiJC1wldj+1SDCVA+yI13HTC5OMALP1ALgqfES8PaUntgv+AxzIxVIM0s9g0Ma4
	e6PqAq0EM0qkkZa4RSV+9WJWIYUlC4xzyjVSBVXuP8B+XWkrM6MNzOQg2SKIlPze
	KjMANpzfoh2BR/GhfWBDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792251226; x=1792337626; bh=v
	z9gWVtyN9jbcl9ox/Lgtzo2cJWY/NBmWTw05zBxjfg=; b=PE3+oC9CBLIdJOlh3
	FJMLOpwxKMw+vSkAPb4z/OXyynotooifuelVU4xk4Gmr+PxBlD9MOl1bBNrWXr2O
	blURBr2h41BdNS1/V9nCLC/nw+owSVU2JF0aDjL9m/coh45a1KzTG9smzi1j91eK
	jc7JZodVt8uuD7AC6q55IaM6GM8FZ/Ew+/0uIGvjm6UBfkWFus3F57+R0Ks16RjN
	rFEIUwb4efh09ctEuINRW3nPTBEyd2mx9nQPsrSoCNt8ysvZc77qVpGiyFVFqsyD
	/cq/7D3i3N9X4tCLcWaPooeUmeWhrO7ROEWHmBgEUKf/6HIIhF+7DdDmRXdwVgGt
	8dr3g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792251226; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:MFNwtDDJB7f5DQhflxZt2NhsaTQ/fvHLEKSN6FbuCfYMt2l
	W9wkzupLtvwLlWiXSI1K/Oy9FdSiMjMLFdEfByoWMOlOQXlg2Rec+sketcVVxVLo
	pZo9c/weZPGIRPz8dTCZpV8I8eIuHCsxIachjc3EfIljD9/cSrnYzUAF8Y6mPUg+
	cTVYD01STtmvEby+PpKd069m9DlqX5YKO7/JzFdpFEah7s09H3hqMlQsCgmWkr5m
	wCRr0JMT0K7eAQZLZUhmRPcYbqoJc+Vz7A4oaU6LjMPcjiQgkcbPqbg1TfEzammU
	jHwX0D47PgPkSfIkHu+UVUTvdbyOXW3G5QKHqZQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Rcl7bV1MZR5MtYVkBFC9X+VwD3+HseLfsed2y4hXYfk=:A/baWhcMw7e9WAD4UlOjJIp27qwejGGq6tEHW8Y8K2U=;
X-ME-Sender: <xms:WZXTaqDEYkp39T0WztBlvlfWMG-WoyedP-WbtwidHGaQoKiiwx3vHA>
    <xme:WZXTaifBD5TkHUzUkkFz6QJk80_i1s6HLSF8-50MS25IBtR0nXZaDbVEMOYeZz_8D
    curb8OWyyCtO6cNP32G26IWUjz2iw7yQABI8Gis9FxHtf5YgoJjFcTW>
X-ME-Received: <xmr:WZXTalLF-P2kr8d2jtUODwRw8pb9n1_LoNUMO7XwqkLYHM8FU6aUTLb4Mtc2TyzwDhihkNXMEg1m3_04fFAuVbWUI7m2MM54J1Su4yJ88pkE>
X-ME-Proxy-Cause: dmFkZTE08kiMxFOTEIvYPAbfVheseJeMrfjyibL//Wb0zp/1gcdXqFBuAWW2MBDpYb4st9
    DQc6FSuflQ8YcrGLcCp0KweB78Zwt/1kI12F866+fOPwoBL4nncHOvvE1K+mez7F2U7y9z
    ulsBXYqMpK0sE5xdTowOEYWAeQ3AtkkSppDzcDchIXqHdvjqyuIq2QTC7i65xaH5+uIiHO
    pUiy/ZkrlaghXNcCPMz0KWYxWfGubvuPtZe+iDejxzaWb7dk397dp6CF3nOgdvkIxx5WOV
    a8YxDrZaMLiiH8T0MRZzgfXPXb03asp6ieUbxe7R2YuGZgSOBiP51uBwZrZqA+Ec8fRBgz
    fE03Bq5dn0ldteBEzs6ZudTCJjEK5M//Qr9IO9jaU+/XOzSmF0xaVJd2i7+KSMCjFSDR/z
    3G+agcmVwdXPI/5sC19c849cmehW2+PJDiLonWP3qwrCdyxRP+Ij+4LkpkDzxjO4+nY3CH
    LBf5JPt0IYpRCbPrcID2pWnTGC6SOWZcwH6INY8FAJIHGYnCcO4HZs0TvhGgXLOhWu5rFn
    Ik21Ra7XB42iO9qtiZ/xXRJ7HnRecUodWEJ2tsLKPDjaMI1FiYuYGlH2eB7s08NFySDXBs
    /xEvCujA8iI4cr5/jsZXSECiJJK3rETzoaMGk4JP5FRCeDicoDyZ/OFaILWw
X-ME-Proxy: <xmx:WZXTalebY0VgLMzl8lwjQI15FmrA1HYiQZKAuxaGOs2XlAoGMGAtAA>
    <xmx:WZXTas0AwooN_hlzWoXYNSzZ1wpvaHXLGaZSE1DilRaMl6F2vCLTog>
    <xmx:WZXTauh8IJbkL35Hi5htJbvCJfI5YM-KmEQ_f2NV55KjDlslOGtAeA>
    <xmx:WZXTaiSna6Y67RPuAYwZLxMaGtMJISzx_lKyWooIh3OJH9YxM_tSCg>
    <xmx:WpXTaj2ar66JRqf98ZPZStgXAaIbmyXn0ESzEMqrOa8xxdJb4stR0U31>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Oct 2026 11:33:44 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] firewire: core: reuse helper function for scheduling error callbacks
Date: Sun, 18 Oct 2026 00:33:39 +0900
Message-ID: <20261017153339.267337-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017153339.267337-1-o-takashi@sakamocchi.jp>
References: <20261017153339.267337-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The transaction layer has some code that can be replaced with the
existing helper function for scheduling error callbacks.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 029bd9cdc570..45114da64422 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -106,6 +106,14 @@ __must_not_hold(&card->transactions.lock)
 	__t;								\
 })
 
+static void schedule_error_callback(struct fw_transaction *t, int rcode, u32 response_timestamp)
+{
+	t->rcode = rcode;
+	t->response_timestamp = response_timestamp;
+
+	queue_work(t->card->async_wq, &t->error_work);
+}
+
 /**
  * fw_cancel_transaction: cancel transaction.
  * @card:		interface where the transaction has been requested
@@ -143,10 +151,9 @@ __must_not_hold(&card->transactions.lock)
 
 	// Timestamping on behalf of hardware.
 	(void)fw_card_read_cycle_time(card, &curr_cycle_time);
-	transaction->response_timestamp = cycle_time_to_ohci_tstamp(curr_cycle_time);
-	transaction->rcode = RCODE_CANCELLED;
 
-	queue_work(card->async_wq, &transaction->error_work);
+	schedule_error_callback(transaction, RCODE_CANCELLED,
+				cycle_time_to_ohci_tstamp(curr_cycle_time));
 
 	return 0;
 }
@@ -165,14 +172,6 @@ static void error_callback_work(struct work_struct *work)
 	invoke_callback(t, t->rcode, t->response_timestamp, NULL, 0);
 }
 
-static void schedule_error_callback(struct fw_transaction *t, int rcode, u32 response_timestamp)
-{
-	t->rcode = rcode;
-	t->response_timestamp = response_timestamp;
-
-	queue_work(t->card->async_wq, &t->error_work);
-}
-
 // card->transactions.lock must be released in advance.
 static void split_transaction_timeout_callback(struct timer_list *timer)
 {
-- 
2.53.0

