Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A6137E5D7
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792251227; cv=none; b=dyp1g9uboTeFnTBpfuqUUCuV57UmWPx9812cQYn8fKVGGwTvz6wlTc89Y+2a09EnegdcP+nLmE07FVVt9c8MWwjiafjmU55QhkYbDZ4+mbiW2mOvBJQiP6TJVZUO001NuqXVaLSlJjR+a12ZYYc0yPjUL8fBtnTrXvbvpx8COb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792251227; c=relaxed/simple;
	bh=uPaB9OJHolrLRRbl1w4PgtF57F8gqupfMeQXpLLU098=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYVAugdK3DGVE7vUWFeT65Lh8mwgDlQk7kwZbPjQgC/Qie8DzSv9kAgBXGONb0ZHI0AHtAR0oo0iqTx//uwGBYCQRx0vFDR0IRY/78WrSy/tn4u8Rf++mfgAFyUaIJfabjqt6QDEhCpR/1wsDom0PQWeUVBcT/Wp21dGO94nX0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=MITGjBFf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UPnNqBQt; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="MITGjBFf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UPnNqBQt"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 8024EEC0073
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:33:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 17 Oct 2026 11:33:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792251224; x=
	1792337624; bh=ADjjzmoXUB4fMy4pX3enWCPt6EVC+AV/otsZdQD4J0Q=; b=M
	ITGjBFfhhSBEM9muhhtqgkCbXHp6S07N+OorzrZqiwMJysFuWeittpVaGVv5f7vV
	XIhG5Dk655Jrh/TjqPj6W9eDOEaWfGO6E7ElT6IY75n2TLOLDQSuN2V1/K8/5ej/
	UK4xzQKAy6f06oRVha9wDZR+qABU7muO5MITMFum9RM8Tg9wFvse2+g40EqL50Qx
	OnB26uZ2rw6SWiXsmsexu7XkBbkgf82JvukqNWx0o8w1y7fJJvTMIYvR0+Bw3Dd5
	DtdL+LQU8jaMf60BlLnUrvjNBH3RqJu05BsfhXKzeG+7XGS+d7ZjVXZ/vPoWwu1f
	5x3jojYe/IV4wUuhCl5FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792251224; x=1792337624; bh=A
	DjjzmoXUB4fMy4pX3enWCPt6EVC+AV/otsZdQD4J0Q=; b=UPnNqBQtw9VA4qlj5
	tqc01Vb/P8veqlJ6rHSGlcuyNLHKylSJIcyfYnkTVyq+in3d67cEulmVgcUxyCKt
	yv3+9RyHXNKb3L4atAvhYRNCzhllzpOTOgy+Q/FFBuM5ORe4m+J7FmZpeBctx+rk
	CQGKMvdf5tRIeU2/Q1LwPxg7d+/xNCxdP1+WwjpmeGwX24//IcSvcIUeRs64OJe8
	HDcAwQNtHran2T8J75RJUT7qhvil723t57rzgjoVL0gNgN8Y295uKImQRffa7MXX
	9wNLdGVe3l1iy0tWC4wFeQODo+8NRPFtm58GMDOtMN4WKddDTw/ZiYbGpnNZYdgt
	rvXdg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792251224; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:BoTELv95Yf9YV/zTKUS+JUC9GmFKbdtO613MewJNkgdal63
	rYZ1cy84SN7MDNh9F2BbFiwdXfKSy51FKx+aFQrpRW9+TNXtHruB5YM4IyLmWO7a
	fZ9gNkah3dTxoYbjDexevaxJshz0U796BUAnUHY4ECAiHYUR3XuAlWrX2CLtqiTg
	4Bb9qioSpssk7MAIZbQkHuFq/ANKoQl7l307J1G6FKje7iXm5TPu/2E32WOMTCol
	UVfVWab+L/uD6VknquPnmL8XDakNLlKO6Kq+mkN40zybGCjc8+I7V++MmHd+y9sd
	WHNvGL/gv7/eJbbuF3coZBa6aZmOB41xEUTL9Jw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:PbB5s6JtlPLh2HOAT0lnWkktbHN6e6es/4YveXJB/EU=:uPaB9OJHolrLRRbl1w4PgtF57F8gqupfMeQXpLLU098=;
X-ME-Sender: <xms:WJXTaon7Ivlfnx_RY17QzEFEUjiS2pfgxMtzM1by-z-EE_sn4MXfGA>
    <xme:WJXTalx4CFoNN3rRoEf1aIRM7toutWLhzO1nOaMfOLofgl8HcjVxdnYWJ9oGp2ju7
    -JxKKoKZbkg5AZ4ben4cQt8v79YpMDIa8123B7wZoJwqK-NBUuWN6fhWA>
X-ME-Received: <xmr:WJXTauNkVJiIMMqcYPUIUG9I75saLHciW5I90RFf-MN4DWRRLjQhqUdbz9IgWeI8VDCJVy9kdPxrcK29fsAsWgMO9DEHIWxXrP2g16sIqlnK>
X-ME-Proxy-Cause: dmFkZTEuPVtk5oU+9kKr/VKi80A7PntwoPFxV086eipBr/p6C4LLpdkBtGLFdevazLChXh
    0C94iwMeOf8qYKlf5VkYSQ1waQczSG+xsR5OC6eoVczdfghZtQx+mIVbVIsuTWzeU1Nd1s
    oYlGM/4EspT1m/uIPYLDLGqVldoKWRImsbOscfe1TQzGfDbPh2hpY06DJXbUW2a5die3qx
    SZ380Z40StGNuhGnkBNQDU+rxpkod4R+BPaT8ldzuqhazQNAJDwznDqPNmzmRtKleOHLiQ
    qvxoLobD9UPh+nGoyRc9zL3BJfotSAg3v8rYcbx+t5IkSrwowmX5M9foHkgitsW2fQPrrR
    wv6BUSh0yZmht/dDJfyJUfrTC13Gw8+QHMZOu8yHnL6GknQHRZFEB+0F7K0lqMNBzf1CoJ
    uXwd0OcK2jHUiwGfyVrAyeew6rrJLVxNiOoH/YJJ3GfITmb+UL+UE5cYFmZe6djZ5KkQTU
    qBWpHVhcyorWk6wsB7xBwffN7N/7/o/WjbxvtH0PTVPleFriYo4k8CZHqzPFM/f5l7VXIx
    RuVCU+ndyQK0qC0wDdZE5D5J8lyyYEdHiABcH+5Hl5YJOs7s0vYhgDnrUva77UKhXDLFLl
    BBbJ4ODBPGVerJ1xTvfPDbO8G+YyRLtsx7Vis6hEQycSpejTw7niv4e7RVtw
X-ME-Proxy: <xmx:WJXTahTSbidFczZeccaFZT5jNRka-z42GeAJRpWM2GphMJ5iqrYSdA>
    <xmx:WJXTakYd8jiGwLSVkNQSaUwXRjTc5fQTXAQTKa4oj2UUOjJnYrmHvA>
    <xmx:WJXTam1SvSfTKssFKJC3N3tXfRFFS8yA5B4c6ikK8JuCIAVCY7_R7g>
    <xmx:WJXTasUOpLpaNHGqxLfjB497CWdCbyKb5utJhWc0faNikI0KsG1G-g>
    <xmx:WJXTai7J7MLKLCzpFz3wdn7_p_rUix0gFsUAkbIAb9S6iWoougIjeyYg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Oct 2026 11:33:43 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] firewire: core: don't disable error work for transaction
Date: Sun, 18 Oct 2026 00:33:38 +0900
Message-ID: <20261017153339.267337-2-o-takashi@sakamocchi.jp>
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

The error callback work is scheduled only when the transaction instance
is no longer on the pending list. Therefore, iterating over the list to
cancel the work is pointless.

Remove the code that cancels the work while iterating over the pending
list. Once scheduled, the work can run and invoke the error callback
without being cancelled.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 48558857e726..029bd9cdc570 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -44,7 +44,7 @@ static int try_cancel_split_timeout(struct fw_transaction *t)
 	lockdep_assert_held(&t->card->transactions.lock);
 
 	if (t->is_split_transaction)
-		return timer_delete(&t->split_timeout_timer) || disable_work(&t->error_work);
+		return timer_delete(&t->split_timeout_timer);
 	else
 		return 1;
 }
@@ -146,16 +146,22 @@ __must_not_hold(&card->transactions.lock)
 	transaction->response_timestamp = cycle_time_to_ohci_tstamp(curr_cycle_time);
 	transaction->rcode = RCODE_CANCELLED;
 
-	enable_and_queue_work(card->async_wq, &transaction->error_work);
+	queue_work(card->async_wq, &transaction->error_work);
 
 	return 0;
 }
 EXPORT_SYMBOL(fw_cancel_transaction);
 
+// Ensure that the transaction is not on the pending list when scheduling this work. Cancelling
+// the work after scheduling makes no sense, as the initiator must be notified of the transaction
+// result.
 static void error_callback_work(struct work_struct *work)
 {
 	struct fw_transaction *t = from_work(t, work, error_work);
 
+	// To detect programming mistakes.
+	WARN_ON(!list_empty(&t->link));
+
 	invoke_callback(t, t->rcode, t->response_timestamp, NULL, 0);
 }
 
@@ -414,6 +420,7 @@ __must_not_hold(&card->transactions.lock)
 	t->with_tstamp = with_tstamp;
 	t->callback_data = callback_data;
 	INIT_WORK(&t->error_work, error_callback_work);
+	INIT_LIST_HEAD(&t->link);
 
 	/*
 	 * Allocate tlabel from the bitmap and put the transaction on
-- 
2.53.0

