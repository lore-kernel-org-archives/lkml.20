Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A650E3D331A
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792305068; cv=none; b=iqXRFUZoWxdX1aF6o8O4x1aovs7MCv0OeCfBHxD9NKTTsvzeaq2KafFQiJpr6dTKZbEr4THLnnZ0+6GspkfNuBk/3guNLqggHdU/kooOYvt3DXifLNQ3h53NVwqp7jlT+kFp1btRHyCpR0lKuehXF5bl22z6TqxyKZLTZOoMzks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792305068; c=relaxed/simple;
	bh=ajNlCJvvzyRmLLY+CGj1rmxzalLfBaU3i7pKftrnT5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FHVsA2f9bvqS6wZN0iW2dfhjM+C4yNFfZQzGtoxP9+PgeHDD+IQXZiXtqsIWS3bI34acEDL3JRqWH0Dhg2GjouZsFv83t/GcTWj5dHstPu2RF1dRHalsxO2W8NAs4pnxVTQY4B9fKgqUmkKoUBOb7Cj7KRNBVSPjIOr+BvMI49Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=mIJG4xII; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ai3US+Oi; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="mIJG4xII";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ai3US+Oi"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 873DA7A00CF
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:31:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 18 Oct 2026 02:31:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792305065; x=
	1792391465; bh=rwwld+0708a2gB3QzrbTgpZVFBNZ3nwb6QYs7/Eyc5s=; b=m
	IJG4xIIgBPtwaYte8jW4lOSzJ8nePnBH2nN3j+GihrJFxV91sivlmlio4Ac5Bwy5
	bgLU7p6lePUYGE3h6g+WBC/hAndVuILzglGudqE14v+/Knig/5oQDFbrY44IC2tr
	D1hT72VzLETbEHCx0HqZdH3Xvu+DI9SobBXJQdl6EzfUr685LkLJWEOVUKTVcZ9f
	nJrfjtyhj1QmP8JEQa2htv+y9S2w1s7D4Sjwp8xyk09ub4NUKHm+xQ7VncAiePMF
	LMxckURUqEfdP1TYlXrRmRLcxs7l1jUqM6Q4s3wkAtpYTX/dvF+Kr64FfNTf6LCk
	W7TLYZ+7b9hqyRYGaW06g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792305065; x=1792391465; bh=r
	wwld+0708a2gB3QzrbTgpZVFBNZ3nwb6QYs7/Eyc5s=; b=ai3US+OiqRSNybcnT
	A6xk6myRYssimlpt+uaUP3yOeCZQNgtRm0poYQOJUAuSJ6NpmseSDrCCuMGRBhZ5
	dUNLWI3Qe02SsePR7JzYOT2fREtWa5jFd8kcqkbaPh8WaUrOkpuLSdQUaTYykvsT
	NaDmw8mN0Rd5WLFYfCi85TaCfZTxxd3cpOR37wPgA6tyg0MTbwrw/RlDBztr4k+Z
	QpE2QoqgngxMSv0q6zm4GVTivG7xtSx97CxM6MlxQVFs02D2pCoC7YtV82AlTy8F
	yK0qJV32NBcJymZO0+F1Aavjj7nyfecWxWwdKrbeYYGWDKcUXOtiqeixL7DcJzuC
	Wi/LA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792305065; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:lwxEeztfG8Dxz1vsW2xcQ70fFGdH9PZwIxLrBuvusoG4PmQ
	t2BWQuVEUg5g/7+X149sr+czxqzJ3baGh5cW8Mcak9BURkAQ9u5BTda8bWHRaaLe
	2siwX+imZCj4uVhVo+qozgSZLp3sDvpq6FzqgOxjRG9X6q9tpp8FdXx7CRIabpZy
	wZsy85EK6YVmd3ELnsyw2Eob9QJmyc+5bd7f18ww/0gcXgrMxfxEt41bXyjcZrri
	ayQQCuldjyNe0M0T3zIsnDdG8MMmEMwQoUqh+89Doqn0dK+4FVo5assuDGoLfSGW
	p8syL+I2G8ot6gPc6ezOX3FjyOfVnhILUESRh+g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:3rvvcJHbPgZZhYwMNT+kCrAnw9X173ODkacmJezNdXs=:ajNlCJvvzyRmLLY+CGj1rmxzalLfBaU3i7pKftrnT5I=;
X-ME-Sender: <xms:qWfUarpX7BrrtoMIIBV86Sk8J465GzKtCfF_11K9UWZZFYFXhcHbKA>
    <xme:qWfUajm_xCAhGGYpOoNdqW8N99_8f6-M3pgPWJSLzOgEcDoqNLAQHtd0jzafgskIk
    tb52sul5bq8YATN7o_zgT__GCp03UG5MNmy51XjkZMjX2TguUi7O0jY>
X-ME-Received: <xmr:qWfUavwe5VfDFuQCsxcSu3G9mUoIDwGyjt_K278nHKsBslIaDi-9Ca8H8buRHwg2lQvuOvPVKsKqcs_gmwG6wLYD3_lZnCUH5mdr_SIkueHD>
X-ME-Proxy-Cause: dmFkZTFSXqwzpiBStUyyje/RBGcUd8NmVCLWfVDC5LEhL6gAo1v+gCG5CX1X4Mj46qH6fv
    9Cjm5p9xLr4THU0Tr0kz+Yz1RLeP7aB/fRHn6HqdL9YMGyJ52lLnMvTejmzhBHvnybAoyQ
    e8k/uGNHSozlv9DODmB8LXwCr0VtU37FoK6Yl1Nsv7pTOhnpBjBm3A7036jDhk0f+wWHqt
    ukJtSW8L+OPRKPzK4OpvEx1/PqW3CvInxT2yjPZqWEanl5J7lPbRn15Fai2mRPvEjFwbh8
    fIq2iQL5ybLcftYZGiNeL6QethFwco73HUKkA85vY52oA+qyPwXKsHfEF9FeQjfX0nmKns
    7oVVhRzvEj4UMTiwhYgrr3XxJw/vRgBPZ9KhjY/3UykZxjrFNlQHt2bVW6feD7xLfhD5lX
    dVaL65O3VRJPFfsMtujPj2baXUDG6e50XiH5xrdg7bjf1QCFO5s3n4tTlyv9qhOF2GjKzB
    X1ZsK7DzCDCdok4SY2aym8xA16B9p92vcsJwjP7MJKic67UHEl4tz36Xfmbca/q3ob3/BE
    GM1nt1tZPTJFyXugveUPbRH85V65HbQ0AiG0Sk+xtsxn8RqqHh5QOuS7c+z+JtTqdVtgkB
    BLLlBs+ZsXiMR3K3insbzUgnft0pYl3j7tqNrSERklrRnZoPJ53A7YK+7EsA
X-ME-Proxy: <xmx:qWfUarmETPzn5EcyIsOmGIqU-XjQIZM3y2RaJ0eWyVRE4Jz9uajQ_w>
    <xmx:qWfUaodr888QvcoheRcNQaOsJybqDaGQkTKLjiCW83s1ATdFv3RIdA>
    <xmx:qWfUahoKhiFffHinGg2lV2bIgiql6veNUEY14FHP79WO1D4QI38NVg>
    <xmx:qWfUam6xm8NghV62WEMz1-kQbyWmaNJ8FnuBsTfKHTrz3gUtCHGgHQ>
    <xmx:qWfUaqfNRDpKooh4AFXulQ-IavHDyu-IiS1CLWPtSDs2vz6Y_QIVicrI>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Oct 2026 02:31:04 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] firewire: core: use context analysis to check lock state when scheduling error callbacks
Date: Sun, 18 Oct 2026 15:30:56 +0900
Message-ID: <20261018063056.329226-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018063056.329226-1-o-takashi@sakamocchi.jp>
References: <20261018063056.329226-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The precondition for schedule_error_callback() involves accessing the
pending transaction list. This access should be protected by the
transaction lock.

Use compiler-based context analysis to verify that the lock is held when
accessing the list.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 33f3f272e99b..b633d343c8b9 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -87,8 +87,12 @@ static void invoke_callback(struct fw_transaction *t, int rcode, u32 response_ts
 // Ensure that the transaction is not on the pending list when scheduling this work. Cancelling
 // the work after scheduling makes no sense, as the initiator must be notified of the transaction
 // result.
-static void schedule_error_callback(struct fw_transaction *t, int rcode, u32 response_timestamp)
+static void schedule_error_callback(struct fw_card *card, struct fw_transaction *t, int rcode,
+				    u32 response_timestamp)
+__must_hold(&card->transactions.lock)
 {
+	lockdep_assert_held(&card->transactions.lock);
+
 	// To detect programming mistakes.
 	WARN_ON(!list_empty(&t->link));
 
@@ -109,7 +113,7 @@ __must_hold(&card->transactions.lock)
 	list_for_each_entry_safe(t, tmp, &card->transactions.list, link) {
 		if (try_cancel_split_timeout(t)) {
 			remove_transaction_entry(card, t);
-			schedule_error_callback(t, RCODE_CANCELLED, 0);
+			schedule_error_callback(card, t, RCODE_CANCELLED, 0);
 		}
 	}
 }
@@ -140,21 +144,21 @@ __must_not_hold(&card->transactions.lock)
 	if (smp_load_acquire(&card->driver)->cancel_packet(card, &transaction->packet) == 0)
 		return 0;
 
+	u32 curr_cycle_time = 0;
+
+	// Timestamping on behalf of hardware.
+	(void)fw_card_read_cycle_time(card, &curr_cycle_time);
+
+	u32 tstamp = cycle_time_to_ohci_tstamp(curr_cycle_time);
+
 	// If the request packet has already been sent, we need to see if the transaction is still
 	// pending and remove it in that case (e.g. the split transaction).
 	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
 		if (!find_and_pop_transaction_entry(card, iter == transaction))
 			return -ENOENT;
+		schedule_error_callback(card, transaction, RCODE_CANCELLED, tstamp);
 	}
 
-	u32 curr_cycle_time = 0;
-
-	// Timestamping on behalf of hardware.
-	(void)fw_card_read_cycle_time(card, &curr_cycle_time);
-
-	schedule_error_callback(transaction, RCODE_CANCELLED,
-				cycle_time_to_ohci_tstamp(curr_cycle_time));
-
 	return 0;
 }
 EXPORT_SYMBOL(fw_cancel_transaction);
@@ -178,9 +182,9 @@ static void split_transaction_timeout_callback(struct timer_list *timer)
 		if (list_empty(&t->link))
 			return;
 		remove_transaction_entry(card, t);
+		schedule_error_callback(card, t, RCODE_CANCELLED, t->split_timeout_cycle);
 	}
 
-	schedule_error_callback(t, RCODE_CANCELLED, t->split_timeout_cycle);
 }
 
 // card->transactions.lock should be acquired in advance for the linked list.
@@ -431,7 +435,7 @@ __must_not_hold(&card->transactions.lock)
 		tstamp = cycle_time_to_ohci_tstamp(curr_cycle_time);
 
 		t->packet.timestamp = tstamp;
-		schedule_error_callback(t, RCODE_SEND_ERROR, tstamp);
+		context_unsafe(schedule_error_callback(card, t, RCODE_SEND_ERROR, tstamp));
 
 		return;
 	}
-- 
2.53.0

