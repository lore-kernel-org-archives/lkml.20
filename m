Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3A94B5CB6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646232; cv=none; b=snL1kZGXIMJg9ae741h7O7yId0KJFl6ztCSIe+3CNaxD7T3OUtJ3FfsSZoVJlA4YoJvrfkthuwhUc7OU5fmdEd3rmyXNlCoYOp5Tei30VCQ4ow9SYCfkGlc1kPC8HMwSpJAa3CR3pYa6wu8TZzg8l1yN/vnuYj5SRSkKd6QkXZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646232; c=relaxed/simple;
	bh=/JmFXBnZ5o6iVoL/3jZKa1soaX4Hw/WgDxT/Fm9DA54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=plQUS+/yYChVu53jJjRMkKfDM8lo7Z/mpnos7l43Yh1phKMMquAox8P4MRdpiDCqceRFYbUAstHbjLSkp72VX1FfpS32soVxruvHFcU3vFbaa23NguI8ZlWSakHhhZNEeSB4ZLVQu+YmRVgiDjSy6ttCDPRRr6f8yMOg4UTZhzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOUKS8hb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOUKS8hb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so4297645e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789646220; x=1790251020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ePwmsMkUKDU1SxF8E4e113FncU/+AY22Hw2g6GemxcY=;
        b=gOUKS8hbOgrYl8blR/OahLwLOP221DbRsqwd/+EuP00Taj/iHcqYZVRwghSvhOy9CE
         xv1bgSEFCzc94oTxUJfh4N0MJPXlDF3P2SgQsw0OyEw7e5sU2ahFUDjZ3Kb0t7pGizWs
         GnjxtlDldNL1i3tnH12RnAcVenHoqmJ111i+Ebv1cUUUbWtya1X668XcjPQ9azBy0+40
         9gA0eibAS4UBSOe97bHl+AGd46DlpT+32uVLsfweIvXll9HFzK/7PMEUmHxibS6r4/k8
         /ls+U+LVgLHrPb3kp07Y7suncdHoh1g+ytu685sJUNrt2Z3KSLtM6HSL+n8fWifXomIy
         yvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646220; x=1790251020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePwmsMkUKDU1SxF8E4e113FncU/+AY22Hw2g6GemxcY=;
        b=ppjNw0w/aBs++rsG34FwvqWUcypEsYOXps5Bk7vfwpA+AXrMInENz/ZoEI+7AHmYGH
         chBkJFxY6zBmxRezQ+l46nUoEeHi8r8KBmGobZ2UgJrGnx59TMIGhykjKGkWbsGCnhbY
         aA1NeEmE5g1LBoed4E/Qw1mrIgK5iOUxmu1J4eLpAU5rLUso2+/N+F0dlDRF+5J2EMob
         H21rG4t9cFGyLx+vq1TtHEl2osOeey4ZBYMEajRRVK76VQZFitujk5k8h/MllVlBoZqb
         Dl4z31in4xHskttmVeRsE4OIpydv4KthpzitCm0w6D77eia1UODipg/HU4uF1TjEmo/F
         Qq2w==
X-Forwarded-Encrypted: i=1; AKwUvBw9Fr5qA5At5AYSEfsS+kGsLfoi4G8l9tUMIIsezM3oRr3WstNhzh2Kl9GHez82Y9ZSJq4CDuv51Q2hMro=@vger.kernel.org
X-Gm-Message-State: AFuF++md3eQpv7iFO87bG7HCalU/67zXDrsD4o0fq2rrCxI+U3wIVJbw
	qdudAZBYdI5x0c+rQARjMn7GXJh60QgruEgazjXRx+CnJP9kKq/eWSj4
X-Gm-Gg: AYBFou3ay5jdmmlybUuveYegmpu3VNoxBQXxHyo4ObFIDa4ZwOrE5d/3Ot8quc6ThZP
	vm0jscDJiMJZRsqp7t0uAcQj37oqr2rCYXgx3UP1emgckYBkK2jeprnlpjD818nF25EXQOnzWTT
	AF4RFID8jTGJW0fKOMvKf4/rBjQ7NBtYP8689wfUZsEjlJJNTkbt58zWQitUH1xYIcv73VzsUHx
	EPASt4ViIPYeAQuQVe1G8PXBfd3bbaLdJHmQ8tIXNMFbpibPn16PSBmdWBl+QLu259HNuNbXPki
	sgNhTM5in6KB1nFx5wpJH/0xaKO08dA/mpabbZFL0RHQYpwkfZ/DoLDwekUC+NcN7T3coPWEB/q
	pFA5J3pCiL+CYz9mQutIg82c8s8PDWW7RtpXJaQMj/oj4MG4JOIWBRFB2LFMlkvfn8X+dvFCjw+
	a5WFsjAyM+nixo+19Xxz4gHva+toIHtdM6/DYYxG1kl7KFVSdU8Fk7b1BcpoklFAPfyerfbsA3T
	Ef76e3Jhge0Nr+sElSgtuu2G4jYzAghJk2Cg+ML
X-Received: by 2002:a05:600c:198d:b0:49e:7a00:b9a5 with SMTP id 5b1f17b1804b1-49eac4642ffmr84127505e9.4.1789646220111;
        Thu, 17 Sep 2026 04:57:00 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847eab65sm91365315e9.2.2026.09.17.04.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:56:59 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org
Cc: Robert Hancock <robert.hancock@calian.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net v2] net: axienet: bound TX completion cleanup by the NAPI budget
Date: Thu, 17 Sep 2026 14:56:57 +0300
Message-ID: <20260917115657.20697-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

axienet_tx_poll() passes lp->tx_bd_num to axienet_free_tx_chain() as
@nr_bds, and @budget is only forwarded to napi_consume_skb() as its
bulk-free hint.  Nothing limits the cleanup loop to the NAPI budget, so
the number of packets returned is bounded by the TX ring size rather
than by the budget, and the poll can report more work than it was
given:

  eth0: NAPI poll function axienet_tx_poll+0x0/0x180 [xilinx_emac]
        returned 96, exceeding its budget of 64.

Returning more than the budget breaks the NAPI contract.  It also makes
the "packets < budget" test in axienet_tx_poll() false, so
napi_complete_done() is skipped and TX completion interrupts are not
re-enabled on that pass.  NAPI reschedules the poll, so this recovers,
but the accounting is wrong either way.

In steady state fewer descriptors complete per poll than the budget
allows, which is why this is rarely observed.  Triggering it needs more
than @budget completions outstanding at once - for example when TX
completion interrupts have not been taken for a while and a full ring is
reclaimed in one go.

Stop the loop once the budget is spent.  cur_p->skb is only set on a
packet's last descriptor, so breaking there never leaves a packet
half-freed.

A zero budget must not be treated as a spent budget.  netpoll calls
napi->poll() with a budget of 0 to reclaim the TX path only, and
axienet_tx_poll() forwards it unchanged with @force false; testing
packets >= budget alone would break out before examining a single
descriptor, leaving skbs unfreed and lp->tx_bd_ci unchanged.  Since
cur_p->cntrl is cleared only here, axienet_check_tx_bd_space() would
keep reporting the ring full and netconsole output could stall.  Zero
therefore means no limit, which also covers the @force callers that
clean up after a DMA mapping failure with a budget of 0.

Fixes: 9e2bc267e780 ("net: axienet: Use NAPI for TX completion path")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
v2:
- Do not treat a zero budget as a spent budget.  netpoll polls with a
  budget of 0 to reclaim the TX path only, and v1 broke out of the loop
  before examining any descriptor, so nothing was reclaimed and the ring
  could stay full.  Reported by the Sashiko AI reviewer.
- Update the @budget kernel-doc: it bounds the cleanup when @force is
  false, and zero means no limit.  It previously read "use 0 when not
  called from NAPI poll", which after v1 would have meant "reclaim
  nothing".
- Compile-tested only; the board this was found on is not available to
  me at the moment.  v1 was verified on hardware with the napi:napi_poll
  tracepoint (8424 polls, max work 64 against a budget of 64).

v1: https://lore.kernel.org/netdev/20260914114821.55503-1-maimon.sagi@gmail.com/
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 782f903d318f..f643453261f1 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -772,7 +772,9 @@ static int axienet_device_reset(struct net_device *ndev)
  * @force:	Whether to clean descriptors even if not complete
  * @sizep:	Pointer to a u32 accumulating the total byte count of
  *		completed packets (using skb->len). Ignored if NULL.
- * @budget:	NAPI budget (use 0 when not called from NAPI poll)
+ * @budget:	NAPI budget. When @force is false, cleanup stops after this
+ *		many completed packets. Zero means no limit, as used by the
+ *		netpoll TX reclaim and by callers outside NAPI poll.
  *
  * Would either be called after a successful transmit operation, or after
  * there was an error when setting up the chain.
@@ -788,6 +790,15 @@ static int axienet_free_tx_chain(struct axienet_local *lp, u32 first_bd,
 	dma_addr_t phys;
 
 	for (i = 0; i < nr_bds; i++) {
+		/* A NAPI poll must not return more than its budget.  Stop on a
+		 * packet boundary once it is spent - cur_p->skb is only set on
+		 * a packet's last descriptor, so no packet is left half-freed.
+		 * A zero budget means no limit: netpoll polls with a budget of
+		 * 0 to reclaim the TX path only, and must still clean the ring.
+		 */
+		if (!force && budget && packets >= budget)
+			break;
+
 		cur_p = &lp->tx_bd_v[(first_bd + i) % lp->tx_bd_num];
 		status = cur_p->status;
 
-- 
2.47.0

