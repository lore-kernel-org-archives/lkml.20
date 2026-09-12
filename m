Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF8337FF53
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789183347; cv=none; b=ntHXwM8LS+vgelkXqIox8KtEMYcYIXwFX5AxZtZTaRLOCwY+pBNQYj6Nj757tK6Wtk9kyVPq7YCGFx3+iNCV1oqF5yNksJLV+IpXJPZ6DKKzznjyZSK/HbHRJhsjbLqeN9hJhGTYQnk+unxdUwhGgccGcyItgTYtcPxPLppARLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789183347; c=relaxed/simple;
	bh=Kj2SiKAO81rJoaPzDgRJEOlAvC1EwkpNWQ9temAnC9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qjKFrbF5UgbDuFkThgH/tH/yeG0XUpGCvcLRL3N+HwtO+jr67hPqQFg6bSLiHnRzh3C2ZNpSgappkR/wSAh/P6QjVfaKtAHJr3JP9IKK6RdCD4eO9YgKM3cnlhfjlnB4E580l+7zvcVVK8V7K+7fwkaomgZ9jrgetKrKO8q/2Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=zDr+UrHl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bvm4AOP3; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="zDr+UrHl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bvm4AOP3"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 996887A00FE;
	Fri, 11 Sep 2026 23:22:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 11 Sep 2026 23:22:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1789183343; x=1789269743; bh=y1zJDS+noS
	dnh3kM4xwAL0xVCiVetv5rOtbXAdFdnoA=; b=zDr+UrHl8SRriMIo7ix6dAOj0R
	z2n4U4Pwlf1qJjOf0cu2VLV9q0OLnzFYaB8WV8IGq+YQygthwOwjUGKTE9fqoDaj
	Vl5l8tcaOLoYtQ8QL20mpT2xZmFl1WF5iY+Uy2WAP9tGpHUJ6ZGRoD7YyL0xk8iT
	jBUDClYN1KIBCew96ZpPucIaMpMk7cK7J4UBA/QxMcG8KyQ/dRr+Yrs0meEvHkY2
	VE16oZ9beKquFFbA+6GGBtXpeSaWwnZNu2DVJ7G0LI0YKJV9SlxonGKu7JCUKFDr
	W5a9BI9E7vpidXx/Ci68uY3uyL2zRaH8wDGlUJnhBHef/CtDQBLeBKuRVrOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789183343; x=1789269743; bh=y1zJDS+noSdnh3kM4xwAL0xVCiVetv5rOtb
	XAdFdnoA=; b=Bvm4AOP3uotWPlLvWOaHkyv4HbaKULd7ZzfNFK2pyynG6Rysc9j
	Gr3Lx8a6xXOlJljmU2/LvvfrgmXuXzYVIEu32y+5B9tZcqw7M+xbN+o4Y6L/yrj6
	H62u/jtVYwzQwmWRufw3Jp1NHtZ+Wq7g7R9MHGaEaHnmx/DIC+h3TKc/VXrncJ12
	c0Xl7XK/SHhWqxBvDyPd+Scesv0L5R8S5bXNGShrMVoWYEKHwYlDZ9TKUBzG0oXE
	cjUQhsU738fl0a9an9OWnjLCbusH5qQNL6QqheRjufWbwndl0lWc9VItqdlhtedd
	VVi7Q2abbMVglP0I6ME2WiwgBvH6aIgc+zw==
X-ME-Sender: <xms:b8WkasyPCJkdqfUY_RbL5H_A2CsEETUIH3jdAc4lX0kXlhKdUKsiuQ>
    <xme:b8WkauPKwHnCh19RO_Fur4iJ9ZsSjI4rLxwgQHy4TXgvV-nlyfYZSBDryuQ7B9kgE
    0SDUenqsOl-rrOkaKgA0a52flMFarnp7RrszXtoCjUWUdz2LUgw1faJ>
X-ME-Received: <xmr:b8Wkal7SaNqBS_S0tHvF0q_WarPH2iI-5RF4ezyKCw2X5QRgHtepDvaGx9i6ryBgKfPVpSDOdAVzvoxKdL-n-ghcdcRQ8-rYd8ioM9mJnY2L>
X-ME-Proxy-Cause: dmFkZTEkeWHj9Fgse767tiVeXe9xjd23X7/IOYKYbndwpAgyNpaxx8htgCkbMIFLgUBkUA
    5SDdEPz4WYed5+flCmSvVD/n/SXV7cMYXSI46nCVZLPSCZ9RbDnWa0SnLLy+7VDg7igNxZ
    vwylpWYLwrhzYi2EjvPqTfEgZXHTRnUxaENROWP8PYOzS9TMh9HB03EmwHKVcRpYQGYthG
    zA/nKMkTcmCziIMFx18P9U52LEbmhGHfYDx3C/LKH+AFGCX+NR0P5fOp4GWeUaGjwtyObG
    v1Zgc/zZXghjGQu8yBjfvqKaW4n5mx7QlYHy6rleSU226DXoTHlnCn2ekMES4QI0ZbDXC0
    MZ52MjdGX3xMEChQd06ondcEqTpBJd4I295sPPIG8pNw4vxdIWvtykvynMXwLlHI/8Lnae
    f0bgnmCIsOSiPLwVcbnHXKzNV8QNkKHytNZSwmo7ylO9vmXHDAWfXy9E6dRkS4GPh4xj3G
    PxhdrhwnS1mpwYVGzLvgsToQWwf4jexZd+N7zYvymgeIrsJIvilO3l+AwQ443IrP0/lDxn
    OrWrMXy5xPOX05/c8ljJR0NT6M6/SPpbkuKqSbuPgCC/1o4AYCkbqZuYR3R4Z9oGXhkxUt
    TqXl9zZVIFxBa1qDsH1dFSxdz6gY92rDDylo2XSU2zxwrKZLtm30+C1dPD3Q
X-ME-Proxy: <xmx:b8WkanPx4Tve9wvgDm68b2fDkugmXkP57u-e63NspBT-uQiyVWkJPg>
    <xmx:b8WkarnSuam4WAdwklcgt4VT6_5X-TTtdVTzOFivmNSTadntG9Sh4Q>
    <xmx:b8WkamTmzpkY4nJfEwuomO0NpB4HYXHlAPq5VcrdE5nsjpDxA-_3vA>
    <xmx:b8WkavD4w7Ad11ha0BDcCc2tqBOrQV1-U38tJBtgqQhRZ5HX2wFFAQ>
    <xmx:b8Wkasl3tREtDSsz81RCQ6viSkIhcxTOrpRMTUpvmh1Fj3axMkV4AUBB>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Sep 2026 23:22:22 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: ohci: obsolete flushing field in at_context structure
Date: Sat, 12 Sep 2026 12:22:19 +0900
Message-ID: <20260912032219.3379821-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The flushing field in the at_context structure is used for the internal
branches in handle_at_packet(). This field is enabled in
at_context_flush() when either handling the selfIDComplete event in
the threadedIRQ handler or calling the .remove callback of the PCI
device.

In these two flushing cases, the pointer to the work structure retrieved
by current_work() should be different from the one in the at_context
structure. Replacing the flushing field with a work structure check is
preferable since the branching can be self-contained without relying on an
external flag.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index b7df280bec51..7d797755bbd6 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -162,7 +162,6 @@ struct context {
 struct at_context {
 	struct context context;
 	struct work_struct work;
-	bool flushing;
 };
 
 struct iso_context {
@@ -1338,9 +1337,7 @@ static void at_context_flush(struct at_context *ctx)
 
 	disable_work_sync(&ctx->work);
 
-	WRITE_ONCE(ctx->flushing, true);
 	ohci_at_context_work(&ctx->work);
-	WRITE_ONCE(ctx->flushing, false);
 
 	enable_work(&ctx->work);
 }
@@ -1362,8 +1359,10 @@ static int handle_at_packet(struct context *context,
 	struct driver_data *driver_data;
 	struct fw_packet *packet;
 	int evt;
+	// Check whether this is called from at_context_flush().
+	bool in_flushing = current_work() != &ctx->work;
 
-	if (last->transfer_status == 0 && !READ_ONCE(ctx->flushing))
+	if (last->transfer_status == 0 && !in_flushing)
 		/* This descriptor isn't done yet, stop iteration. */
 		return 0;
 
@@ -1395,7 +1394,7 @@ static int handle_at_packet(struct context *context,
 		break;
 
 	case OHCI1394_evt_missing_ack:
-		if (READ_ONCE(ctx->flushing))
+		if (in_flushing)
 			packet->ack = RCODE_GENERATION;
 		else {
 			/*
@@ -1417,7 +1416,7 @@ static int handle_at_packet(struct context *context,
 		break;
 
 	case OHCI1394_evt_no_status:
-		if (READ_ONCE(ctx->flushing)) {
+		if (in_flushing) {
 			packet->ack = RCODE_GENERATION;
 			break;
 		}

base-commit: 5cd70119ea77f631e0ceb4aa97f608f2983cbeba
-- 
2.53.0

