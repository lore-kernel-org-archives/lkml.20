Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45593E1D11
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294449; cv=none; b=sjzy5HOf4nQDhPKTxfcsfmJFUryXGF9sIjqmyvnbl3NJRtqgHwHsDTYAbEkrtkLKTWv8BeEj2h7JzLBK7W2mZ4u66jCuD8GR2i70bYct/u3Ofuh5m9WqtBXbxA/MVUf6seyvFBlMC1OS2SI6PJeORgYohNH4ZNmPLBIqxuA4s/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294449; c=relaxed/simple;
	bh=OFMIvSrCNckt583wQZ5szz6EZ+YgIB8EOdg7dB6a+P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iT9antZH8T2Sio8YWizcdoUbVH+aU6TsstHPdBY7XFwCGi5pNFkmX8mL4YFAasuHb26xMQYGB6dWNgd+BGDWmaY3PzMwvYSSjYwbpiX/MBX0pkFhF6nGX7n5ZhOu0GEkh7ysuBitIlO/jrxNmflKAaZqraO/DmCbfsL/jvffis0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=4l3vXjGI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uy00HYRz; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="4l3vXjGI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uy00HYRz"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id D71B7EC01BE;
	Sun, 13 Sep 2026 06:14:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 13 Sep 2026 06:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789294445; x=
	1789380845; bh=S5P06Ntp/PmxB7SbKz4waXQKUzWFyQ/AB81m7jyroSo=; b=4
	l3vXjGIxRxefrx3uK2RTciA2CuHbleqIlYB8mPL3Z+16WnVe3EQAjGeJDGf4GUrJ
	McoFfDzvmQ6B+smLlxOyHjodC06SUKBYkSH4rFHXNdj3oyfqBwma4mjAZYphiEfh
	eLdr1BDJ+fyUoyraAzJkyCR4QXYummAN3pDsPaE63ToV00vvwcAqwhMFLZVsEB7E
	ne96lDz6aYdXDhhag1qWgaQJQCCwoLKJZy1laALurRFFRXXvIMC6mdsxI5YCLlFu
	Ij1R0BBMu4vsS1O3eoba83IDWTugmjYwUJZS3utfFCfPJ3nbjtTAKXkDjBhpdP4g
	NMcwPYg+shgX+wuO04/Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789294445; x=1789380845; bh=S
	5P06Ntp/PmxB7SbKz4waXQKUzWFyQ/AB81m7jyroSo=; b=uy00HYRzVmvlt4l1q
	Ee0vNNldO05brJFdy+PWXpHl/oYLupsAyKwXGcXa44rQgssfszB++whyCIECbH3I
	qPmFKk2hrNoO5Tts81k2XpX3JfNC6QrswOdyY7bynl6lgIFEMJWJCTzijBcbGdwr
	oSLcO7Wfvx7Zjky8AwYShIqZWCHykUGbC6PUC8eOfEErN/XXTgiDn7wIUzhWJtmB
	PUMIzcfoFP90uEn07rIgfRTOAzp2C5lSmblNhuYvF4AQU1FZA286/vsYmFyyaCqH
	TmdXctyQb+B+zFvBx7H0S1w/9hHGDwaFH9TuOQTY7BEuuQk+vrWY4RKB9f/i44jO
	zw9rA==
X-ME-Sender: <xms:bXemasyJYYwIBWzsV-Rleah0nJ3UDM7wm8iKXT-e3RwruDIrfeAYWA>
    <xme:bXemauM8P3_dij1sdMJxuNTi_eEHiPYfIh3IG7owfWi2sSXHQOX5VE6EkZzRuBfPc
    28csaL8MLnHJ_aq_g3-wIQgQSBzhXfXcVJlbEHtH6nSStKOzPkrn43G>
X-ME-Received: <xmr:bXemal5cq-NO0XU0XlnM93hK2bZEQun_LZkmF3mxEvl5_lqfCJVa4QGjSJFhp6Un2H4LOhUCCMdMAOo5LmsTyh8MupzjT0h2bh_AXJ0prpCmeQ>
X-ME-Proxy-Cause: dmFkZTG2/vy8D0TbaMZOOhOpGNWwOGVtNK7N3/Ngp133it+bhfjOwGH+I3f6TifYcbFCix
    d+aExY2U0cYC7fsd7F/Fw21a1yBHo7Ftaz2iRM2h3gfR5T7dXWR8r+smeEK8E28yK4bIYd
    ixLHKJoqK4EZNfSK1zEMlMFiFzl5g6Jx8QVFNKC3RJa2Os6FyyhShJlD7ix43o2qA7rLeH
    OUwVltsbra+ufek/Q756DmmV1U+01AJ3ER4g0bUtgnCg5AB941tbiwQ3ExpQ4AI1Dh8OQh
    oY6X9VjBXg0YPP0riUEHb6zHa1SaebZS3x/r/3AjkMhIWic2pIMC15GtHju9uGnUtrHKDg
    5tFWzP6hZzz2NLtE3Fb9XJmRE1S7Xvx/In1M3c76QV6nbveG0rOyOHWTmthlyyRugpeVOX
    5eiBrlgzNSup6KFu+mZLM6YSGVLDZ2FPl5b6+Q3jDQuQrbLsl+3UDzi5eBjYxy53LHhIN1
    4omkOUsAiGtOH062J/dDWSmJXC9HdCKwJA0g+XPqO2SM4L9sk0NJ6S51FBli8jhrf7+uW4
    56FuUJwvbF9XyTGJEc6uNBTgZsHTMCkHfOmxQLA58jOeDXwv1dD7mZZLex5BdKf7w3OaPh
    wwxWO0dV4HO4bnomh/mvxyI9XLdlfQRtj11zCc4Qj5D72kb7fBx4ZNH2uf7g
X-ME-Proxy: <xmx:bXemanOzMi1AMZT3ZWzMxzWa_ORrEryy3i5tXrdqSONTlbhdfC7TMQ>
    <xmx:bXemarlsaM-WsFh8Ae4jAzdwiqVL06m-T-BMbkJJqVJX08MiQuY_WA>
    <xmx:bXemamR4gntJJIPUDOpV1IKxZaxUD_-fwHDpSZ4N5w8l2xIy8skJZA>
    <xmx:bXemavAiZbfIm0_coex2Q8cJMXj0rDFuddUvwFfnRk8qRWvMS7RA3Q>
    <xmx:bXemasnBBXdYKKY-40dcfKwuplfPWXkcJgbNCUlOKVlFF94swIcd6VpZ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Sep 2026 06:14:04 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] firewire: ohci: refactor local response packet handling
Date: Sun, 13 Sep 2026 19:13:55 +0900
Message-ID: <20260913101356.156420-5-o-takashi@sakamocchi.jp>
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
The handling code is duplicated between the two ranges.

Reduce the duplication by moving response handling to the callers.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 54 ++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index ec069657ea8b..8a0aedf50a92 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -1455,10 +1455,9 @@ static int handle_at_packet(struct context *context,
 
 static u32 get_cycle_time(struct fw_ohci *ohci);
 
-static void handle_local_rom(struct fw_ohci *ohci,
-			     struct fw_packet *packet, u32 csr)
+static void handle_local_rom(struct fw_ohci *ohci, struct fw_packet *packet, u32 csr,
+			     struct fw_packet *response)
 {
-	struct fw_packet response;
 	int tcode, rcode, length, i;
 	void *payload = NULL;
 
@@ -1480,17 +1479,12 @@ static void handle_local_rom(struct fw_ohci *ohci,
 		payload = (u8 *)ohci->config_rom + i;
 	}
 
-	fw_fill_response(&response, packet->header, rcode, payload, length);
-
-	// Timestamping on behalf of the hardware.
-	response.timestamp = cycle_time_to_ohci_tstamp(get_cycle_time(ohci));
-	fw_core_handle_response(&ohci->card, &response);
+	fw_fill_response(response, packet->header, rcode, payload, length);
 }
 
-static void handle_local_lock(struct fw_ohci *ohci,
-			      struct fw_packet *packet, u32 csr)
+static void handle_local_lock(struct fw_ohci *ohci, struct fw_packet *packet, u32 csr,
+			      struct fw_packet *response)
 {
-	struct fw_packet response;
 	int tcode, length, ext_tcode, sel, try;
 	__be32 *payload, lock_old;
 	u32 lock_arg, lock_data;
@@ -1508,9 +1502,8 @@ static void handle_local_lock(struct fw_ohci *ohci,
 		lock_arg = 0;
 		lock_data = 0;
 	} else {
-		fw_fill_response(&response, packet->header,
-				 RCODE_TYPE_ERROR, NULL, 0);
-		goto out;
+		fw_fill_response(response, packet->header, RCODE_TYPE_ERROR, NULL, 0);
+		return;
 	}
 
 	sel = (csr - CSR_BUS_MANAGER_ID) / 4;
@@ -1522,19 +1515,13 @@ static void handle_local_lock(struct fw_ohci *ohci,
 		if (reg_read(ohci, OHCI1394_CSRControl) & 0x80000000) {
 			lock_old = cpu_to_be32(reg_read(ohci,
 							OHCI1394_CSRData));
-			fw_fill_response(&response, packet->header,
-					 RCODE_COMPLETE,
-					 &lock_old, sizeof(lock_old));
-			goto out;
+			fw_fill_response(response, packet->header, RCODE_COMPLETE, &lock_old,
+					 sizeof(lock_old));
+			return;
 		}
 
 	ohci_err(ohci, "swap not done (CSR lock timeout)\n");
-	fw_fill_response(&response, packet->header, RCODE_BUSY, NULL, 0);
-
- out:
-	// Timestamping on behalf of the hardware.
-	response.timestamp = cycle_time_to_ohci_tstamp(get_cycle_time(ohci));
-	fw_core_handle_response(&ohci->card, &response);
+	fw_fill_response(response, packet->header, RCODE_BUSY, NULL, 0);
 }
 
 static bool in_config_rom_csr_registers(u64 offset)
@@ -1560,10 +1547,21 @@ static void handle_local_request(struct at_context *ctx, struct fw_packet *packe
 
 	u64 csr_offset = async_header_get_offset(packet->header) - CSR_REGISTER_BASE;
 
-	if (in_config_rom_csr_registers(csr_offset)) {
-		handle_local_rom(ohci, packet, csr_offset);
-	} else if (in_bus_management_csr_registers(csr_offset)) {
-		handle_local_lock(ohci, packet, csr_offset);
+	if (in_config_rom_csr_registers(csr_offset) || in_bus_management_csr_registers(csr_offset)) {
+		struct fw_packet response;
+
+		memset(&response, 0, sizeof(response));
+
+		if (in_bus_management_csr_registers(csr_offset))
+			handle_local_lock(ohci, packet, csr_offset, &response);
+		else
+			handle_local_rom(ohci, packet, csr_offset, &response);
+
+		// Timestamping on behalf of the hardware.
+		response.timestamp = cycle_time_to_ohci_tstamp(get_cycle_time(ohci));
+
+		// Finish the transaction immediately.
+		fw_core_handle_response(&ohci->card, &response);
 	} else {
 		if (ctx == &ohci->at_request_ctx)
 			fw_core_handle_request(&ohci->card, packet);
-- 
2.53.0

