Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92133B0AD8
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700317; cv=none; b=Y9+KBtHQmmBabDACz31iPEtLwF+I3uY3Hh3uW7ftYljSAvX1XZ/uDuM5Tl+LVz2r3HUHekqPXU7yIqZMqcMzpxx7XmhHCuP+O8AgrGa4PSAuTKQ8UW3f1ce8SEBJisw3fI+Q39LSkC+XzMQPrLQhWkbwIby9ITAhSRqyJETd9yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700317; c=relaxed/simple;
	bh=Jolqm3L5SYcODmNkdITK7XGmUzrNbfRH1YGeIASlI2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cSR02ySSABD6wGuVUv7Zaq2ybGXdqe33Flp1/ukhV6r4d62DLIvx2sB6bAX2gml4suD6AgnCfhFcG9Dfg9frvKyMRcoAzoCTNVoQrCx/w8of1BYjrLq58Y8Va7TrPVb+vBkTgjKH1ZAk0wajdNunHHgF4+mYu09Y9C/sqWxML1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=fz79malO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gIdjKdX6; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="fz79malO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gIdjKdX6"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1C3B114000D4
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:31:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 11 Oct 2026 02:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791700315; x=
	1791786715; bh=BsDD1PvcFatFNGWPxcvqQdVbGi43bPcEQspXUDXB3Vg=; b=f
	z79malOAuiE2UoyTDMYjCK4Bj2/b6Tuf/X2qdULPlToz1F76czNj3GcvbhruUGan
	I/CzB102Srr7M2XeT0zc0Hl5KbTGaW+Et2GHPpjn4qbLBEzET5CTA8mja+AH2/n0
	QzFT7CGSzRTpLSIWsNjHpgCVH0xFa2HScuZT844YwctNV/zbpFuJTyQLZPycNjkI
	YkxVPyLsw+yf5s8IiNm8uWv4Nuw9LIZytKPZz6iFQlvE5Mkr+NnVKuX4eMYSfvWv
	dRD2YL/rbH+Lcg73wrbc6mou8XPGbG1sTIBrDkjyX6oDM+tsYCVsjPRjDmp6E23K
	tbBwZ08DZlTE1kdu5So/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791700315; x=1791786715; bh=B
	sDD1PvcFatFNGWPxcvqQdVbGi43bPcEQspXUDXB3Vg=; b=gIdjKdX6/eWFPhb/+
	MQ89+6W/rCQD9yVmijKFcAS7QovZYKOGdcPGdHNGrYUe87DBS+CEuHcNHTI0n8JE
	mvqwSLc5c7nWx08YC7VUFhmnCZsrDBKd7vDGkPOgJTh36dQn6okMoISEVUU8zEbl
	OVMKthtoVlLFolUhaLj2TSq9YObc5QTaXq1iJl7KFOY/5r/cymjYy4ElY1KFxDBi
	gwfFhZ5ZOHsE109Uig1QOIJNC4lGbkdC10kh3xmhXyV/n8fEL9wQOhQqQERnPs5v
	I7Tyan4rMbBaC/BF1RvBcDEXWO1bhu6Pu/pc8nHCJaWZAMRfvYm5Y5DSxDH44qsQ
	I3KTA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791700315; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:BtuLbbSfc3NvSzngJh2emR4GJc20pFhgLgB/pLUejDcmMoI
	yb4GIVf3SqC8LQkJj4A36jl4p86ZTzwFSuWwy8ztH8FSHOxxtlFL4oP+6fiKjhj8
	GFgafTLtz5T7b8fY72rSbOucmewPjk1k5ryyZhQYYYwE6UZXjKHIQxAxi2jFegAo
	PxzoM/jEa+6DgiSqF8GJ1FZ84n/dbQHtauMXcG0j33f7W54XB3Ba7P1K9yRv2QbE
	YD7P9r0F4M59zOCy60GZ/E+hpWWRCv3PbH2fGz4RT2Kjj0CBaS9yE+j/XNUi7mJV
	uJvqHm3oquGsa5FY7vKEVsAT2zx5cIti1XkpMtA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:TDDuqSlN71D1Afeze33CgjrOtzlXyPcha0zTwqa4J8E=:Jolqm3L5SYcODmNkdITK7XGmUzrNbfRH1YGeIASlI2c=;
X-ME-Sender: <xms:Wy3Lah-LXobim8NJI01st8Uvqjh89K4y1fcVjZyxRBcE3o_gkTxdmg>
    <xme:Wy3LajpfrXFZYO057N6GYDI8c9sEbmT5Jjvwvq5Us_XR-11W8kgG1FoWn55VNyfCE
    TMoZ7V5a29gudbG3z6pEJzUYkagZQzeK7Rjxs7hQaQ8JE6bJG4Vroq9>
X-ME-Received: <xmr:Wy3LamklnilbXfa016DHz_HVi4pMgnvvkYq18l8syZUB254mwfo7djOmeoJ9Aym2_35adC-O9yAThTA2laUKrioHylVRWlrGR3wcxBHJ4BVE4LY>
X-ME-Proxy-Cause: dmFkZTGGlZtVBCiqvzrzDhZ4IhObHvCaC3HQYvEPG6JMdOpJVjvPDHar++CcsZIzTa79w3
    NwFdnJ7HpSzjyVOVYxXyDqRMIo1icjr5k0EiFvM1LDnuVE4Q7CWBXsrfVy6mVOCq7gu0ij
    vnzpfxH1a66Vq8y0RzbvSFejC9c2NziLGnBsnCjYVUfdGVLUWSbDY3JPg4p8RVQAqkNfln
    4vrbAS4B/cbk0QEiBuXiUqpnScp6uKqYd3p9cTzlYA6JsfD+HZHmB0gBryUi5UootR2wAk
    LgO1hqGDJa/Up4/VV8oVYkFBN6zZSbGSaA0YsFYIqo8nwYp80E3KaKq9bw076cpOSNyrp5
    7iOjd+nu+kcaGfCJWlgO1GNdB0pyiU6B5TfvxY3yY8g28NFiWyNld2ceVNuo0+hRcSYigz
    9EuuSDl0NN6+l4XSDp73wLhVm1H58eA8SWdo+hZoFY+i021AjTG9RH6CUwUfINaP8Tuuhu
    iESj3ou6yxV0RIH2PtQ73B4X+nwkJ/Ymt0/9WOOZD/2fdzInvHGwRIifH8JU4mRKs4htvC
    wOhS1QHhLi6CT/qnc7UJ5bMKHToc/KdII5r3rYDuINV3nkM+RlvALcmjq89KRdNfNVSscW
    Ofd0uZXAErH04RCDciQXWHFd+3H6ysNhI5Gz8Ohnp8pFdGbSsyMqAgSVyZxw
X-ME-Proxy: <xmx:Wy3LaiIvVvYqxpvWcwWa691repzqMC0P3EF_cxSYIIhRA9wY56NhZA>
    <xmx:Wy3LajxQ9xvp7iybxzHXCAszIXlU2ZLuywopJfPCDtXXrrBhJJmNoA>
    <xmx:Wy3LaisJhcuI6GK2iAD6M5ZYZYStGciLb5d5UmbHwH1WnOZOVN3d_g>
    <xmx:Wy3LaquRAyA8vjH3PLH2KqlvYvPlIVB6QZ98hXS2LQvoRwRkA0ufpA>
    <xmx:Wy3LavQx8TemxhBbW3ow0CuaoypyvjmEhvzR1cNk74e0zlwjp-QlkKf0>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Oct 2026 02:31:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] firewire: core: use context analysis annotations and lockdep checks for split timeout lock
Date: Sun, 11 Oct 2026 15:31:44 +0900
Message-ID: <20261011063146.497455-5-o-takashi@sakamocchi.jp>
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

The spinlock protects parameters related to split transaction timeouts.

Add context analysis annotations and lockdep checks for this lock.

Link: https://lore.kernel.org/r/20261009121048.282982-5-o-takashi@sakamocchi.jp
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 31 ++++++++++++++++++-----------
 include/linux/firewire.h            |  8 ++++----
 2 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 4466499dc1c9..bd6d28f9bc50 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -206,6 +206,7 @@ static u32 compute_split_timeout_timestamp(struct fw_card *card, u32 request_tim
 
 static void transmit_complete_callback(struct fw_packet *packet,
 				       struct fw_card *card, int status)
+__must_not_hold(&card->split_timeout.lock)
 __must_not_hold(&card->transactions.lock)
 {
 	lockdep_assert_not_held(&card->transactions.lock);
@@ -213,6 +214,7 @@ __must_not_hold(&card->transactions.lock)
 	struct fw_transaction *t =
 	    container_of(packet, struct fw_transaction, packet);
 
+	lockdep_assert_not_held(&card->split_timeout.lock);
 	lockdep_assert_not_held(&card->transactions.lock);
 
 	trace_async_request_outbound_complete((uintptr_t)t, card->index, packet->generation,
@@ -896,11 +898,14 @@ __must_hold(&card->split_timeout.lock)
 
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
@@ -1373,28 +1380,28 @@ static void handle_registers(struct fw_card *card, struct fw_request *request,
 		break;
 
 	case CSR_SPLIT_TIMEOUT_HI:
-		if (tcode == TCODE_READ_QUADLET_REQUEST) {
-			*data = cpu_to_be32(card->split_timeout.hi);
-		} else if (tcode == TCODE_WRITE_QUADLET_REQUEST) {
-			scoped_guard(spinlock, &card->split_timeout.lock) {
+		scoped_guard(spinlock, &card->split_timeout.lock) {
+			if (tcode == TCODE_READ_QUADLET_REQUEST) {
+				*data = cpu_to_be32(card->split_timeout.hi);
+			} else if (tcode == TCODE_WRITE_QUADLET_REQUEST) {
 				card->split_timeout.hi = be32_to_cpu(*data) & 7;
 				update_split_timeout(card);
+			} else {
+				rcode = RCODE_TYPE_ERROR;
 			}
-		} else {
-			rcode = RCODE_TYPE_ERROR;
 		}
 		break;
 
 	case CSR_SPLIT_TIMEOUT_LO:
-		if (tcode == TCODE_READ_QUADLET_REQUEST) {
-			*data = cpu_to_be32(card->split_timeout.lo);
-		} else if (tcode == TCODE_WRITE_QUADLET_REQUEST) {
-			scoped_guard(spinlock, &card->split_timeout.lock) {
+		scoped_guard(spinlock, &card->split_timeout.lock) {
+			if (tcode == TCODE_READ_QUADLET_REQUEST) {
+				*data = cpu_to_be32(card->split_timeout.lo);
+			} else if (tcode == TCODE_WRITE_QUADLET_REQUEST) {
 				card->split_timeout.lo = be32_to_cpu(*data) & 0xfff80000;
 				update_split_timeout(card);
+			} else {
+				rcode = RCODE_TYPE_ERROR;
 			}
-		} else {
-			rcode = RCODE_TYPE_ERROR;
 		}
 		break;
 
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index 89db958dea2e..a3660ad1a1d4 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -99,10 +99,10 @@ struct fw_card {
 	} transactions;
 
 	struct {
-		u32 hi;
-		u32 lo;
-		unsigned int cycles;
-		unsigned int jiffies;
+		u32 hi __guarded_by(&lock);
+		u32 lo __guarded_by(&lock);
+		unsigned int cycles __guarded_by(&lock);
+		unsigned int jiffies __guarded_by(&lock);
 		spinlock_t lock;
 	} split_timeout;
 
-- 
2.53.0

