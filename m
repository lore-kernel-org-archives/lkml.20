Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C047647F3A9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199561; cv=none; b=b/0sOF9TOQsfcjqYBgbKdr+juswp277VrFhG85hIC68ePEC5m4oArRJu6T5rnfW3r2opUgVWWL+xTQ5lQpgcyRkipCaVIJ4CI+3koACzZpfHABqtg3sGTIz41IFHutj4De0g2Szo4IwtaxoPH55vJpAYS8TSkytQhiZHrxfT2mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199561; c=relaxed/simple;
	bh=jwzuKQuNYiJHhU7cC/hJ3yFGXTkAR/s1qwarkVD2oj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1yMB9LG7wJDoR4VyYRO6Fk03xSwn6VBd4KsGU+N1Ki0Ix+g3jdVX+CDcMECwasuGxDxVt0C1OxLrbCkYo7XcM+EuvCMhF8QQbSEO9N3xmqxtdiCgft+YL5eKH+SMIWLG48ToGPvelLS3sA4m+YyGEf+6sVfmgo7alJTE4yHAG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=FI7ImMtI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vwuPvjNQ; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="FI7ImMtI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vwuPvjNQ"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A6E8D7A013B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:25:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 05 Oct 2026 07:25:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791199556; x=
	1791285956; bh=axaSKqFblYtHmVAtbAew/xsFWLa+bncOZXrSNJ+n0KY=; b=F
	I7ImMtI/Hi05Hw6mmt8WShbf4xTw/XJ9AeSGFrAbq6X+okeRQrmW4/JW1jEh70Nh
	Toz8ZssoOvC6oxUe5J/O9bLr9Z3eeXeg3WYOVqlDX9fd2KrSzE4CbkzdMf8oUftZ
	o8kxfI56qtul2T/Ch17NyNzXsVPvAiE23utE/Xo/HWIv0bNbE/Ts9Y6+NtBljzbt
	WvM0UrF91Y04DZf5oPN9I6b1EJqQJc0B2nSYBBPduUmCnfQ/KPbkXiHFnd7RpDO9
	MMWrJPe73Yc/Uaab7EcmVlNIpmMrMANJHGqgEZMKUugDfiP8E7LBKxx1DHgA14mO
	QGHJUPpmd3gjQ4QUFZFxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791199556; x=1791285956; bh=a
	xaSKqFblYtHmVAtbAew/xsFWLa+bncOZXrSNJ+n0KY=; b=vwuPvjNQNtM7CHY5H
	PU3f2gT3RoweOnkcAhjO5kZEuuht76DklJIbqPn0ITYr5rDWdTrsdWNKk03BtLR0
	OlvLOYRsPe4yyNuJWK6XhIr3bDCsmR5Tcrafyda5/bBI+Jq0uajW0TIOF8vbRHqh
	/O83ZGJ+KutWXKvukbRFWWw3nnzPm7P/MXCab/YeY8XjO4EIDdy9lDhFT2WBAq9O
	UFnwfMHpUfrslV7W6xNt+pHaJ109MpBIHK1V3gtL5YtLCtEgNJaQhzH+ThqB7zf8
	BB24gHrVtLdyuxGqbcbGHO2g1fGFybx4dpF8mU+CogwEUyI0swwDxwTVfcM9EABI
	KnUDw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791199556; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:eI6JCOcxCKG0Emt8LH6pzC9d90ornmcAqixI2CfjuuLvSTy
	SrtxX0ylVU8kZXv6QVMd0CsWmdrory03Y8/+LZqRNonRo2gfKGtbzMalV8k6cmv+
	GhNWHw/PINEfKZ/f0F6rqDVFB1q47ttQFTkWSd4KQ3p6qdOJmbhs8V/Ntb15Eniz
	q3+6wINUVq5PkEqOsVrmbtzq5v8cm4fqiFXMwqtjNRMZdvkNUhemvCT0G69okPx6
	zhY8kwFIzA4Th9tHmZDbx81fQ32duxBdOdVmhsAwEtPm13xRUthqXvQrgGZwJdd9
	jSfFyYWT2ALaKl57E0/HvHmrQeqONnFGl20MVZA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:WhVTEvSoutPRr5WgjajI3jAJkSOHTbnG3hwsjYvmco8=:jwzuKQuNYiJHhU7cC/hJ3yFGXTkAR/s1qwarkVD2oj0=;
X-ME-Sender: <xms:RInDalH299HeELxtVtcC0xmz-zSXzaVaiw5s_YCZ13f0nn_U4RzjwA>
    <xme:RInDaoTvZqZq5el48oDIxQvKGfeWaIf_6Z0MCoQfoQfJsP1WY0ybURKCi31TOhDYH
    xekWnXEe4cqx2F2GbpmkAI64NZ792XhwgoXeWXii23k_V-UMg0HIt0>
X-ME-Received: <xmr:RInDausQe4RvsCVwGy5uAaF_n9PRaXYiE-IgkcoEWqDh4GqLJlODOEmCLrbktWZDNBLCBq2QisxkcjlBpG3TiccOB5omyePoeRVClqRaPZwwIQ>
X-ME-Proxy-Cause: dmFkZTFsLAB/46N7NTQopLtbJNSMIHF8XhXzy4UUjrgvNMaARRkaSxhUyEWYrGGPGhJ2TM
    kzTQ4OkOpALXnKmDajc14H+0Nzi33/On7h55xzPuBtlLgfksSCP/jSC6eAXzuPRCmKU0LD
    4doC6QORNid8hiWSCc4ZFXyKGLeaTucn4QZv0JK5gHAfqiBjKIxNuw73Viz281KV64Gi6/
    RLnWS+cKZ/vnJKh4dhScqltBex9q+Ih1vahxtlJktN/ELpKybegv3tiFWzyOQ3kk0azui5
    CPm6+zehhPGLdw6fFO7OMsQA2nhSThpg8Q7L8ZgOSd4Swh4M7AQRhtEsLIifm0VwWNRehv
    3Wh2L7fz9QBtEiA2es8ykNfVtK8lea23lhzmwr9NCbLXlav10zerGtv798i5Bvicc+54DS
    77c/yZrbCr7F7sTUIC07+hDH7Q5ws4bcMJ+DX3CfVVrNo6xzOct0O4Orz1ypj68pzT2EPS
    COs3QGZc3/Otskbd5u8BUQ/yA6gH/S6DKvDIeOGBiCjjeGD5wQAsqBe6fFBjZX6VVG6xN/
    TRotvEIOZdoUbpVJNnORh9SD6SdWAXr/F26JtYauUVEdcgmaerY/HkA5wkK6mzjatTdp1b
    XCKnNsz+pWlbMy5wTBFHzn3CaWSGDtvIDft0AsEuMVYX218RSQ7Vc+MLuecw
X-ME-Proxy: <xmx:RInDanxB1fmF_mti_DJuzB2sNjEzvStJvCSrvXXkgug0hlsXaqxnlg>
    <xmx:RInDao78hrp96yx5x7_iHTRYbZwlo7jq_KAeMi6jca4Y9oFrQbUqbQ>
    <xmx:RInDahUUG1tf31nz_n-1sPUst5H-4-0vW4jVQQ6UmnZJiM2Wau-8nQ>
    <xmx:RInDak1zbAxO-Eeubac7JhrqasnZGvjXJFe49ScdANzFgZmnWJWLwg>
    <xmx:RInDajZAHY_CTyeh-k1_lQ8Qj7dvjZhjhZitZbbDGRag1wt6Q2qiEjvg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Oct 2026 07:25:55 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] firewire: core: fulfill kerneldoc for fw_cancel_transaction()
Date: Mon,  5 Oct 2026 20:25:44 +0900
Message-ID: <20261005112544.240552-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005112544.240552-1-o-takashi@sakamocchi.jp>
References: <20261005112544.240552-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fw_cancel_transaction() has no kerneldoc even though it is exposed.

Add kerneldoc for it.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 90419760d8b4..18a731eecae3 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -99,12 +99,20 @@ void fw_cancel_pending_transactions(struct fw_card *card)
 	t;								\
 })
 
-/*
- * Only valid for transactions that are potentially pending (ie have
- * been sent).
+/**
+ * fw_cancel_transaction: cancel transaction.
+ * @card:		interface where the transaction has been requested
+ * @transaction:	transaction instance to be cancelled
+ *
+ * Terminate the transaction by either canceling the request subaction or the response subaction
+ * of the split transaction, then schedule the transaction callback to notify the cancellation.
+ * The transaction instance should be kept until the callback will be invoked.
+ *
+ * Context: Process context.
+ * Returns: 0 on success, -ENOENT if the transaction instance is not found in the queue for the
+ * pending transaction.
  */
-int fw_cancel_transaction(struct fw_card *card,
-			  struct fw_transaction *transaction)
+int fw_cancel_transaction(struct fw_card *card, struct fw_transaction *transaction)
 {
 	// Cancel the packet transmission if it's still queued. That will schedule the packet
 	// transmission callback which cancels the transaction.
-- 
2.53.0

