Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D883E16A9
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294449; cv=none; b=stUWYv0W2ELR28yvqKDmZL5koP+BV8b+rb30Au1haQxI6a1dY3bdYtViUmSzF/JV3NGmAIQt4nyv5p/XP4D+NRF9s7WVK7XHdwNStFib0jbdlcUm2C/zxim9hhm3NgpJnbawXERVKTNUBUhSC3dVMGGVWjLfhKu0NA/5fj9+g2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294449; c=relaxed/simple;
	bh=nFq8l1G9kfc7LCrqcMv2OZ4h5mcafNV3F97OhUmMrKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P59ExbMpE+1pWmZ6u59iqWk07+ejaDBYwFS0+MqyFJhZZYrZf81pawanJIjXBojwD1k4N2sGrYhXZ9drYKDJE8bpKslJ4dyyfVds0M0WNsjz3lsFZJbsJe5YB7NAnizicyOBw+bcxdz017mHCx6N5sCylkdzfGdftuQa8t7t3Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=pd3xGA8L; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XTZv/W74; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="pd3xGA8L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XTZv/W74"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 14C51140008F;
	Sun, 13 Sep 2026 06:14:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 13 Sep 2026 06:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789294447; x=
	1789380847; bh=YYo67wZB/QxnbnXQL9vD7htB9ipv/tpYgs4Ntv7xZmo=; b=p
	d3xGA8L+kQZ39Fnz5lE7iSlLgfna5WhXGRkVA2ovEAFQiu4Dsp1YHFlSgcWJYkgI
	fOZQLsgunfOcpOQIXUdSpLp9OCzx7oWetH8JeYNtRddW/jN7+JnRY4sMaqWT2f7P
	6zj0bN0nqDoIes3JWo7Fxg8a5osJx6/4Y6ULZ/fsk9uB67+oDsCJG7+QMITubO6N
	+AQCKz+rmONxiDN9a33PBSrUDyeu13FBsoAzeYR6ko8MKUJcqYpmdli/Z40PwK48
	bSZuin+apdOb3dps8z5KR6GG9gxGgsEcSGR2tXG7NhHfhIELUOoI2qu0I31KLZ7f
	wVFWFRyis2I/JIi1UHU4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789294447; x=1789380847; bh=Y
	Yo67wZB/QxnbnXQL9vD7htB9ipv/tpYgs4Ntv7xZmo=; b=XTZv/W74pKCbnk027
	1roeufVsmkHa+Yg6vkO3IiCXUT4gXhOfEeWxXZbVnoRpKSSZdiKGQuvqSkIxMxQW
	5tKATuKj3ZLwKr9VwJ4mSu+Aja7wCuCjLvsxqMjO3Kc316N0gZOEM3IlleJt8cnQ
	xK4OKNO2epFpmSADc20b8NuOJkuoXvsbfyaJbJHal1NrCi19O1Nl41Fkw5flCcXm
	i3wvWrM5aU2VciCaI1LDb/rsYAlITaldRrXK+UytGo6C8U3MZ7rT2i7On6y4GLc/
	rYv3Us4nCdimVu0tV92bwOeSC98x57DK0kxMNEycF1f48GVxsoZ28tSZjMZ1+mp5
	Y5gaw==
X-ME-Sender: <xms:b3emaoXYd0MCRly4Hd1lV5ENa25xPt7j5nWCXV_E6kypRatL_F14vA>
    <xme:b3emaqj3BH_-SBiKVyp-r4t1ElUHqNsm_jVFOw_eXVdYd4qVMdQfC5Kr4BwtbXU07
    pYtBI2yEW9Af3kSn81LgunJGrICyiHZiTvK3VZ8Uun4FE8c3D5Zgdo>
X-ME-Received: <xmr:b3emaj_gRHSCU-IN79aMpEHKPnUref7eoaQ2LeTntSgQ4uDKM4opmHYbMu_E6Xd3JZ-bcJJlf3hTqwCge3yrF6DUIHxOrjicmOgSWk2GN27usQ>
X-ME-Proxy-Cause: dmFkZTEQXMGwWqbWvsXCocDgzN5+n/eLn+00fTSurvqCLvHMCAsM1cPRsJWA+ooHxQvH1/
    fwnoZBkskPXn6FuvrpVNEDBS09idfLijDPLEZyFcW6kHnzFJAFDRAk5Xvq9sLxt+qyYddQ
    pQ5WIM9VicXaa/Ii8X2ZZ+/EuIlfzgz56BURFaVT5cY9mToVWnzUXT2wZZLPbyE82R9n8v
    kHzSVXpO096VhR8TtCGA/fGyEFYr0PeULtyOL4sMAm5sIXWZhK/hLW/t1/2QhKz6X/HO4o
    KUbkRsRPw5vjJtc0WDBlkQSUcpwmQ05uuOloNWDABx0M+/to8oj4u5EvVrUv1EggIAMghy
    xXp8C2Rb2MEmlEVoUnQi7EJHCQdQwTat/YiiLJtQ3iSbXlYVd7HZhERS0ONXev18q2H2Y7
    HBsXkKISWd82Q0qqtugo0oIc5YPaawL6KTKoPyV5Z0+BGNbhxGfBsynv9DQGHqjLgqJmrN
    a8jAhysP2KHZGRcAAQMJ0jjNkWvitUtocIEWG5nus83B9haB2JpCU4mMTBohOfyYnIOIoi
    QMXqs1yq0mWgt9kvzruJVozw1qd3JmT4qR4YqdMJ1/tzVn8uH6ureNC4NI4khyL48EljGN
    gwliUK8+gaYVlQyAKVR0Ml4ACCR4ii8Wj96XQPOKBHTnrZkt5ve36E8VgI4Q
X-ME-Proxy: <xmx:b3emakAAeFzAwZK4ZZcyaYA4Wjv6YR8JO_pXleWFbfotkuwpbWtaNw>
    <xmx:b3emagJO5sXPs0OiwHlORyxkwDy4Ch2d0mbQ0iC5ix8Ew8NGA5D6jQ>
    <xmx:b3emann6zoSPMklSr8CH_cfrhY9CLOeIx9JqeMmClt7iyXU-B6K6Jg>
    <xmx:b3emauFjM4t_JZkproOJ26P5NW6rOL28EEtsveIgJic_NhrROHGOHg>
    <xmx:b3emagpDH2xO2pD5yYy-andNVmBzd0D7wbqxyxiAqvdGMrxq1U5KNhkE>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Sep 2026 06:14:06 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] firewire: ohci: refactor handling of local AT request/response packets
Date: Sun, 13 Sep 2026 19:13:56 +0900
Message-ID: <20260913101356.156420-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913101356.156420-1-o-takashi@sakamocchi.jp>
References: <20260913101356.156420-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For an asynchronous transaction to one of the two CSR address ranges on
the local node, the current implementation generates the packet data for
the response subaction internally while handling the request subaction.
Unlike transactions to other addresses, there is no need to submit the new
packet for the response subaction.

The current implementation handles both subactions in a single helper
function with conditional statements. This makes it difficult to see why
the two subactions should be handled differently.

Split the helper function into two helper functions, one for the request
subaction and the other for the response subaction.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 8a0aedf50a92..bd3e01b2f450 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -1536,14 +1536,11 @@ static bool in_bus_management_csr_registers(u64 offset)
 	return in_range(offset, CSR_BUS_MANAGER_ID, 0x22c - CSR_BUS_MANAGER_ID);
 }
 
-static void handle_local_request(struct at_context *ctx, struct fw_packet *packet)
+static void handle_local_at_request_packet(struct fw_ohci *ohci, struct fw_packet *packet)
 {
-	struct fw_ohci *ohci = ctx->context.ohci;
-
-	if (ctx == &ohci->at_request_ctx) {
-		packet->ack = ACK_PENDING;
-		packet->callback(packet, &ohci->card, packet->ack);
-	}
+	// Emulate split transaction.
+	packet->ack = ACK_PENDING;
+	packet->callback(packet, &ohci->card, packet->ack);
 
 	u64 csr_offset = async_header_get_offset(packet->header) - CSR_REGISTER_BASE;
 
@@ -1563,16 +1560,23 @@ static void handle_local_request(struct at_context *ctx, struct fw_packet *packe
 		// Finish the transaction immediately.
 		fw_core_handle_response(&ohci->card, &response);
 	} else {
-		if (ctx == &ohci->at_request_ctx)
-			fw_core_handle_request(&ohci->card, packet);
-		else
-			fw_core_handle_response(&ohci->card, packet);
+		fw_core_handle_request(&ohci->card, packet);
 	}
+}
 
-	if (ctx == &ohci->at_response_ctx) {
-		packet->ack = ACK_COMPLETE;
-		packet->callback(packet, &ohci->card, packet->ack);
-	}
+static void handle_local_at_response_packet(struct fw_ohci *ohci, struct fw_packet *packet)
+{
+	u64 csr_offset = async_header_get_offset(packet->header) - CSR_REGISTER_BASE;
+
+	// The transaction is already finished by handle_local_at_request_packet().
+	if (WARN_ON(in_config_rom_csr_registers(csr_offset)) ||
+	    WARN_ON(in_bus_management_csr_registers(csr_offset)))
+		return;
+
+	fw_core_handle_response(&ohci->card, packet);
+
+	packet->ack = ACK_COMPLETE;
+	packet->callback(packet, &ohci->card, packet->ack);
 }
 
 static bool destination_is_local(const struct fw_packet *packet, const struct fw_ohci *ohci)
@@ -1598,7 +1602,10 @@ static void at_context_transmit(struct at_context *ctx, struct fw_packet *packet
 		// Timestamping on behalf of the hardware.
 		packet->timestamp = cycle_time_to_ohci_tstamp(get_cycle_time(ohci));
 
-		handle_local_request(ctx, packet);
+		if (ctx == &ohci->at_request_ctx)
+			handle_local_at_request_packet(ohci, packet);
+		else
+			handle_local_at_response_packet(ohci, packet);
 		return;
 	}
 
-- 
2.53.0

