Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C07335064
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789818629; cv=none; b=VkrhfuR7FWLlzjNuSNPDwwraci1lDFWej9yiTpy4X35gmDhn/9i+7uAz8iuwAQusLody8WSASb5FnnIpAQ6dkUB9Gae8EFKalFaLehQEZ6SIrFqAPpOMBIybycelbJPa6R7HKC+SJSOgwrNIgCZ5e/d/Lg32li49V0fjTnkZolQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789818629; c=relaxed/simple;
	bh=3cZjN3yQWi7doSaFJGraeLsMsPT29701VUpPaVVbfVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BkIe6EMKmTzctdnFsplpZqwOl2HtDaV9KCEgZbnMiJe39VVdwJc761g07ivVLJkxjEfC64M3upPyWr7tQQSKt2rJ5UF9UaAF7657SY6hORtU4Z8IKcPDlKakU9iuPwHnO6MLzotZ+AJab3ByDkAr1oW4jvZFQ1EURuf59wOdPqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=SznTRBWI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XyCPmR50; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="SznTRBWI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XyCPmR50"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0E2037A0124;
	Sat, 19 Sep 2026 07:50:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sat, 19 Sep 2026 07:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789818624; x=
	1789905024; bh=jv4mHr9IO9W+MZ2jxoce2Milt9A6D3iiEQBMAcivPhA=; b=S
	znTRBWI8kU6nqGUb63/HivVV+Gy6TnhnmSvKsLz0DnMFaXIitjf8FWj8oIZMnE/V
	EFpguUgzRyXus8hxMl2HOj7SapHU7huIz8OTcpEw1tafiWeeZM2akZZJgZiIuasD
	E61JSwIneAg9m8P0m15OTT7bgUkyqveQ9URR2POGl2350wwMbOZLn/eLvUx6eSRd
	uoWAk8/NV2WMnRj44wJVh7VjrO+KP+fZh5xjnSVyNko5Qc8cNgaWlCpyhrMxeEOy
	26Mht1C238txtsuPZoyfZq7ElvPiPwYdmPn3M6Z35enOlfMl4hGVr7MepFOayyf8
	uKLgwW7B3agGsuLzxYv1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789818624; x=1789905024; bh=j
	v4mHr9IO9W+MZ2jxoce2Milt9A6D3iiEQBMAcivPhA=; b=XyCPmR506goUkQgnk
	/Sx9oIK6aew4UFvKwFqrTYFICvhcAWVpD8XDTTk/WuHfs3CMUWd/fh2yys1jt4fH
	C/DlyHNQIEBT+brfbDW/DXNIuSdXEogHXczMXieI9nDMHLBwXAi6JheCXxciLWOz
	uoFXUtwTLfd72+tjs5y72IcHOT1hQXcx4lWo5kW8Zd4CpQZV08PilHNvop4Rc1OO
	SCVPytme47x3uWWA1LP5SJ2CBTiQLH6Hz9fq8KL+F4QHSu2a/LKl4Vq1Fdtf8bs8
	9+06OMAppLDAR+DkgwyrRTKagYLKRjo5zzozWArJe3Xjsjce8Iq30hpvuvozzu9z
	j/ezQ==
X-ME-Sender: <xms:AHeuaso6YssFiDHLt4lpXXUsSCHL4i_GeX8993DOSAMOKgjvVBgtdQ>
    <xme:AHeuagnNtl8Rh9J7un_WZrc26BwF25DjZujOr42GFOI9-xSmTbTAFrkcRW7gVhXqk
    GYN4_hI5RjgJlB62xrYHt-BflCA8kUbVVg3W0wo2di14cQ6XEd7HAHX>
X-ME-Received: <xmr:AHeuaozgHbl6Qn8oj3KX2f7-97LGEzXJlx9YvWrV-2qjYyQuq9j85Q2RDIBx5etTD-FGUkoYrZ8dspQ6HZ-wZ2aTBCpbgOUvjEvxnYgdtTkUNg>
X-ME-Proxy-Cause: dmFkZTF89Q54GLsKvm4RbZqlKDuUewYy1TCjGEnhC1YTwWhDVU1Gg8XUBhEJm2TFxVZvvI
    zZEWEbHGf2ZL/pZjpc45k/hrCyAQtJRuufvPYfjuTBfotRHi0VhVl9zEH589EBWb5B7mV/
    tfUd2RmdbhW/gTVcrpgviK+UD+Y5c9VHkMn0OFtbpmRapD9LbA6ckmj6VMUOy2adwzCJaQ
    BezE15MGm6MTQkkQRzD5EoBdxPXwsaCP1b5MkvdulSTaCPXedkrrOZFrvrHQtWUmA/MQcg
    pYWPbDXBkfElLnA8ESdXyHxJfOUX3+Xp1s4Nd0Jf5roMulsmIdACOHs9ds8uKd54CVcFsT
    koyDEYOTx21vvEXFaP/RefA6E0WkPbJIs/6G7TIihgjLKpKmHM2iXpzeSDISN+Xmu6VBCm
    Zw2ajynrz5q5vwvRhGC4O0aw/2/76ffv+/q5B+0Zk0D1XCuckB+MbjyFs7F5EGG56PpVCk
    kNgJppF/QyYcaMx+YQE5LzZHiKoeYZs3e8eopTQvEk4uFMOHh/o03WZT2q1p15tq8EmS0h
    gBgCTNn7q4EinGk3BSONNo/PMK9mhFF13xEPmuJd3nAubmHAOs8FrifE/kOW1SFxGnpvU2
    Yki4Ps8MQ5Ekk3LprvyEuHeXP99gbsrG60+iLEr8I2xkvPv78eLCGoAgkK/w
X-ME-Proxy: <xmx:AHeuaglPHrA-G4_VKxelZGwISphLt_CPBcIB_8GZG73SX6c9_kPF1Q>
    <xmx:AHeuapdvyr2EOTfE3yL9t8dZWetcipMUP-qtkD0rN0ZqrWjCnkkLEg>
    <xmx:AHeuauokeTJNK7FUYs3ZRr8SXSUx-yhvBQ0pfuQqWKBp77gKwiXWAA>
    <xmx:AHeuav779HzPTfi4p2e7187-YHsF3JZEohOYhhuJCBMlmOw3nTtiMA>
    <xmx:AHeuajc1_tJaDbuVf6uFKPUbPR28tNTYN7Kc1Z32o6HKeti3qgV3fgM5>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 19 Sep 2026 07:50:23 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] firewire: ohci: use workqueue to handle local AT request/response packets
Date: Sat, 19 Sep 2026 20:50:14 +0900
Message-ID: <20260919115017.859169-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919115017.859169-1-o-takashi@sakamocchi.jp>
References: <20260919115017.859169-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Local-to-local asynchronous transactions are currently handled in the
initiator's context. This requires the request handlers to support any
context in which the initiator may run.

Use workqueue to handle the AT request and response packets targeting
local address offsets, so that the request handler always runs in process
context.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c  | 21 +++++++++------------
 include/linux/firewire.h |  2 +-
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 45f03095a196..dddb08dbb45f 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -1546,7 +1546,7 @@ static bool in_bus_management_csr_registers(u64 offset)
 	return in_range(offset, CSR_BUS_MANAGER_ID, 0x22c - CSR_BUS_MANAGER_ID);
 }
 
-static void handle_local_at_request_packet(struct fw_ohci *ohci, struct fw_packet *packet)
+static void handle_at_request_local_packet(struct fw_ohci *ohci, struct fw_packet *packet)
 {
 	// Emulate split transaction.
 	packet->ack = ACK_PENDING;
@@ -1574,7 +1574,7 @@ static void handle_local_at_request_packet(struct fw_ohci *ohci, struct fw_packe
 	}
 }
 
-static void handle_local_at_response_packet(struct fw_ohci *ohci, struct fw_packet *packet)
+static void handle_at_response_local_packet(struct fw_ohci *ohci, struct fw_packet *packet)
 {
 	u64 csr_offset = async_header_get_offset(packet->header) - CSR_REGISTER_BASE;
 
@@ -1589,7 +1589,8 @@ static void handle_local_at_response_packet(struct fw_ohci *ohci, struct fw_pack
 	packet->callback(packet, &ohci->card, packet->ack);
 }
 
-static void handle_at_local_packets(struct at_local *local, struct fw_ohci *ohci)
+static void handle_at_local_packets(struct at_local *local, struct fw_ohci *ohci,
+			void (*handle_at_local_packet)(struct fw_ohci *, struct fw_packet *))
 {
 	struct fw_packet *packet;
 
@@ -1603,6 +1604,8 @@ static void handle_at_local_packets(struct at_local *local, struct fw_ohci *ohci
 			// This case is active when the call of at_context_queue_packet() returns
 			// error in at_context_transmit().
 			packet->callback(packet, &ohci->card, packet->ack);
+		} else {
+			handle_at_local_packet(ohci, packet);
 		}
 
 		spin_lock(&local->lock);
@@ -1616,7 +1619,7 @@ static void at_request_local_work(struct work_struct *work)
 	struct at_local *local = from_work(local, work, work);
 	struct fw_ohci *ohci = container_of(local, struct fw_ohci, at_request_local);
 
-	handle_at_local_packets(local, ohci);
+	handle_at_local_packets(local, ohci, handle_at_request_local_packet);
 }
 
 static void at_response_local_work(struct work_struct *work)
@@ -1624,7 +1627,7 @@ static void at_response_local_work(struct work_struct *work)
 	struct at_local *local = from_work(local, work, work);
 	struct fw_ohci *ohci = container_of(local, struct fw_ohci, at_response_local);
 
-	handle_at_local_packets(local, ohci);
+	handle_at_local_packets(local, ohci, handle_at_response_local_packet);
 }
 
 static void at_local_init(struct at_local *local, work_func_t func)
@@ -1672,13 +1675,7 @@ static void at_context_transmit(struct at_context *ctx, struct fw_packet *packet
 	if (destination_is_local(packet, ohci)) {
 		spin_unlock_irqrestore(&ohci->lock, flags);
 
-		// Timestamping on behalf of the hardware.
-		packet->timestamp = cycle_time_to_ohci_tstamp(get_cycle_time(ohci));
-
-		if (ctx == &ohci->at_request_ctx)
-			handle_local_at_request_packet(ohci, packet);
-		else
-			handle_local_at_response_packet(ohci, packet);
+		queue_work_for_at_local_packet(ctx, packet, ohci);
 		return;
 	}
 
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index 1c71ff69c42f..2b065f03565d 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -337,7 +337,7 @@ struct fw_packet {
 	 * For successful transmission, the status code is the ack received
 	 * from the destination.  Otherwise it is one of the juju-specific
 	 * rcodes:  RCODE_SEND_ERROR, _CANCELLED, _BUSY, _GENERATION, _NO_ACK.
-	 * The callback can be called from workqueue and thus must never block.
+	 * The callback is called from a workqueue. It is not preferable to block it so long.
 	 */
 	fw_packet_callback_t callback;
 	int ack;
-- 
2.53.0

