Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6090130D41B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294445; cv=none; b=Ps/A2JFl2LqewpST++q7+hCGaTTR/YS8LVQD+j0ZGM3HHfaThDKDy6Oz+y9HeCxmxns4QCW2zNwIvWgJ6K3UccvTD+zvttDIibIE+VmbrpB+s4XXR6rl4TFA8bUOw0F977nIX9ZnSMmEy/V1LqksHAZWWHnaR8hFvX7pCtp9k70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294445; c=relaxed/simple;
	bh=dhOHOd5iaY1ZqxvsmmHDO+43mejiMHcT4jgTkHlKHV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S2LbTGBMXv3ws9a0u0xntrd9XEQAkaYExcjK0jee9Vty8EHToj2RwEAKakm9uolNVcf6mSjHgWnqgBgCkPEqtuFmiSSwHZGX2TWHI5i5IPY80w4e/r0UFeWr955mWtNKPH5g3Il/UolRt4A5hsPl7JIu2tb6iLQYO8nK0o152OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=7LH3xAvc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BxuKOdWh; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="7LH3xAvc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BxuKOdWh"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3AEC0140005D;
	Sun, 13 Sep 2026 06:14:02 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 13 Sep 2026 06:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789294442; x=
	1789380842; bh=qQoWl2DdoztWHBwxZPjC62IJTGMp8AXdnfB8ORilBcs=; b=7
	LH3xAvcnSviMgFv7bapAO+JggpHCSlJU9KK/qmtvUda3Wo/q4dSsC5h2Fzvh3j3o
	QK2ofRTr1K5mXpAb/4qHG40e8ktmqeE6fJRqcLpVF2WbWBMpO2LXvYbcwPeVkENQ
	gIU96koKXB5mYDqA+4mLTDFOPUKjeZYnecGodgEm++9MoQZUO5N4h/x/O+ZDKNH/
	BK8KeKzTBE4aykr/jQrg9OU2wRs7O/FsQrZVR0XkWw8P3wmilc4gMtkyUdLXEwxT
	VNPoEYqfkB/YdzXU7NqFc3ZbMG05zRMGlyfNTpBs7eclLH74HCuwIlPuUxiwh+Au
	8tCsb9wVRuJfVAsy57vFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789294442; x=1789380842; bh=q
	QoWl2DdoztWHBwxZPjC62IJTGMp8AXdnfB8ORilBcs=; b=BxuKOdWhRv8kEubxn
	8hNqApGforOF3mXSX8GPKSoM9c2EcYT8uGxQS1sqzTV+qunXEdn1RBBKhJhJN1tU
	yrW9Y3AlSQvFrCfTPsz7AyVKLzyQORammxeNV/WahZEG6/56Cl5RdZ2lMbjwRFfK
	xgP9zpOEV2Zw35tYog3XfpMJu0cnWTTxmE80OofsfMIiow4NfGirHkn7n4hHUvXK
	dNCyA2naOKKu3iBS6TGahtWvko6bHTMZ1AIk+C+aKytRefanfvoUbQ/mCBPRoL5W
	JXg15njAAddt30oirhyZaM1fdchZ6UptxPXi9y7dbtB7lfUqSdp06zk+7Fp105FY
	nMOsg==
X-ME-Sender: <xms:anemaskf7DnHy_CFqb7fTOAl7wylIY1r9weLUxZADEhqTAVpP-QODA>
    <xme:anemapxnPpG6OhtxTwanNFoQVlhbUXYcMoDH2w61kKgYHcTxzQ1xZdaG0tH73TvV4
    FGcqoFBgeW-9yKGdCI0xVmOZ5UQPgRMqp4R9rcX5NH6BII-KK2wPMoR>
X-ME-Received: <xmr:anemaiPDPp5WD6QcWdUp_DsKolWhCDgB338OlcjbXln-YymHR_blG-RyW1d3mrKsKBwobH-BROtt-Jmb7tMZ5HvZexgQeTS-VPPlm8kTAytgCQ>
X-ME-Proxy-Cause: dmFkZTG2/vy8D0TbaMZOOhOpGNWwOGVtNK7N3/Ngp133it+bhfjOwGH+I3f6TifYcbFCix
    d+aExY2U0cYC7fsd7F/Fw21a1yBHo7Ftaz2iRM2h3gfR5T7dXWR8r+smeEK8E28yK4bIYd
    ixLHKJoqK4EZNfSK1zEMlMFiFzl5g6Jx8QVFNKC3RJa2Os6FyyhShJlD7ix43o2qA7rLeH
    OUwVltsbra+ufek/Q756DmmV1U+01AJ3ER4g0bUtgnCg5AB941tbiwQ3ExpQ4AI1Dh8OQh
    oY6X9VjBXg0YPP0riUEHb6zHa1SaebZS3x/r/3AjkMhIWic2pIMC15GtHju9uGnUtrHKoW
    XXSD93dI1L08C/skWwJqbqpiJaw898QkkTTD0SVXiXDj03xIpid6AEhKn192r/tl5lsFXs
    Eoec9bWwPRb3khMFAdUJ9W29x9M943T7ReMw5mexno7bme2xcLDhhiCh4gAhbx7ThSAByg
    64+rQeNMm6Y/yAhfUFY8U4ye1jhvX53A5iK3DdKyQqo5FVkkNZ0Ue8VMsEcsGDF+U4h00L
    nsvGoSsPnhFpJZ8VQpE1eKvGVsJiF4oJmDG8dKNOMeFbIJBV8x8ATW+ocSVpBjIl8OL8i8
    3ffwmVykmRISb6UAfkZWJZz23tr97MTgOG6t/tlT3wZvCK+Cv30swLlWafWA
X-ME-Proxy: <xmx:anemalRz5p9GKyE5JKUFl3gDjISfhazgBDFPW8j5PFhZwXb1s_mA0Q>
    <xmx:anemaoZFwSWClE236FSbSemRYBvIRh20l8Ne4Udad6upHoVJZt6xLA>
    <xmx:anemaq31GrVAh9VZv4eJfAqd33gv1U4A6rCWZhFSkP53L2WCp6jzMA>
    <xmx:anemagURLgvYgmUt_yjfy8oKWUFvpQ58O4MB19EzKm4R1KMA2dHn6w>
    <xmx:anemam6_soo9ZjaeDr_jfKUjJlzGad7IgxYjJ_F0vIWb4WsgfbnyKhPG>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Sep 2026 06:14:01 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] firewire: ohci: use in_range() macro to detect CSR address ranges
Date: Sun, 13 Sep 2026 19:13:52 +0900
Message-ID: <20260913101356.156420-2-o-takashi@sakamocchi.jp>
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

The current implementation handles asynchronous packets sent to the two
CSR address ranges on the local node specially. To decide whether a packet
is destined for either range, the destination offset needs to be checked
according to the IEEE 1394 and 1394 OHCI specifications.

The current implementation uses both conditional and switch statements to
check the offset, which makes the range checks difficult to reuse.

Add two helper functions for the range checks using the in_range() macro.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 7d797755bbd6..c8cb7bdcb4ed 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -1534,35 +1534,38 @@ static void handle_local_lock(struct fw_ohci *ohci,
 	fw_core_handle_response(&ohci->card, &response);
 }
 
+static bool in_config_rom_csr_registers(u64 offset)
+{
+	return in_range(offset, CSR_CONFIG_ROM, CONFIG_ROM_SIZE);
+}
+
+// 5.5.1 Bus Management CSR Registers.
+static bool in_bus_management_csr_registers(u64 offset)
+{
+	// 0x22c = CSR_MAINT_CONTROL following to CSR_CHANNELS_AVAILABLE_LO.
+	return in_range(offset, CSR_BUS_MANAGER_ID, 0x22c - CSR_BUS_MANAGER_ID);
+}
+
 static void handle_local_request(struct at_context *ctx, struct fw_packet *packet)
 {
 	struct fw_ohci *ohci = ctx->context.ohci;
-	u64 offset, csr;
 
 	if (ctx == &ohci->at_request_ctx) {
 		packet->ack = ACK_PENDING;
 		packet->callback(packet, &ohci->card, packet->ack);
 	}
 
-	offset = async_header_get_offset(packet->header);
-	csr = offset - CSR_REGISTER_BASE;
+	u64 csr_offset = async_header_get_offset(packet->header) - CSR_REGISTER_BASE;
 
-	/* Handle config rom reads. */
-	if (csr >= CSR_CONFIG_ROM && csr < CSR_CONFIG_ROM_END)
-		handle_local_rom(ohci, packet, csr);
-	else switch (csr) {
-	case CSR_BUS_MANAGER_ID:
-	case CSR_BANDWIDTH_AVAILABLE:
-	case CSR_CHANNELS_AVAILABLE_HI:
-	case CSR_CHANNELS_AVAILABLE_LO:
-		handle_local_lock(ohci, packet, csr);
-		break;
-	default:
+	if (in_config_rom_csr_registers(csr_offset)) {
+		handle_local_rom(ohci, packet, csr_offset);
+	} else if (in_bus_management_csr_registers(csr_offset)) {
+		handle_local_lock(ohci, packet, csr_offset);
+	} else {
 		if (ctx == &ohci->at_request_ctx)
 			fw_core_handle_request(&ohci->card, packet);
 		else
 			fw_core_handle_response(&ohci->card, packet);
-		break;
 	}
 
 	if (ctx == &ohci->at_response_ctx) {
-- 
2.53.0

