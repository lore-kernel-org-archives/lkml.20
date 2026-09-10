Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ABB379C5A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022278; cv=none; b=LTl89gKFJegzAQeqxiwj17L3TWLro7/JWBFRHKLrHxfkJSva4vIGYbUOR3LsjD2oPu3GL7wBIidUy52jwHtoqwvZ0NXzMCIb21h9VHTbKFgKqramFh9LAC6tYy3BcTDRgiEIJMF2PuKMU3jHycVYsPGEpwtXNePP3+iIqO9xkwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022278; c=relaxed/simple;
	bh=5lywbXSlMAomh1ByTgr47An3DNmTF5ljOwkY+LU+gO8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TlhMF/af78uGfsUwmopr5DyyoXrHS4IEbwwSZlMTEFE/rYbXXYdHWkWKi/o/Dzr6E95f1DTdT7LLgdIb+DoDmONcHR5rcnEi2+760T4T2IO2ZfwLWBkkaOtYg4XRUXI/6u4VbRUG9uaQ71b6YzzKBo82dhOpCSNla/lbh6p1KGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr; spf=pass smtp.mailfrom=korea.ac.kr; dkim=pass (2048-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b=ZV+A2N0j; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b="ZV+A2N0j"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d91ff7d9acso58433615ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1789022274; x=1789627074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlDEc0Wysg4XmstSxwWtu/wJqLCN0sS8gv/9woOxKFk=;
        b=ZV+A2N0jhh+Vcfub2UhpNsrD5B0IwVsgfc/cjagQk+IFVAFHC4crh+uKGaU14nuf9t
         oQ+NLqEjwlpwisjIMskBZHKKBIcQg0Q2rhdxdiu5owNuWxAZvHkSoNg/W8MKAns9Rlcb
         bznQRJV1GpiNBVroHssv6X92RuRmgIFlJVlWDROlmcr3t+A1jdq7jTSaYSzf7MSp9yz5
         cGIahJ9OnzZ3X3uWDoX6ykENk0ojnBhdzzsTLPhaO5ggj/jcoQYIuDlsoMhhxQoa3wzZ
         ZigLVIOpgQqzPL7j3iMyyPM9hPSgvXsdcQidxb8mPqhJ0y+jDyyPkW5Sdf8OBhzKLlLU
         Kzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022274; x=1789627074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlDEc0Wysg4XmstSxwWtu/wJqLCN0sS8gv/9woOxKFk=;
        b=k5cNtKe8Xuze5sUIsDV6D6CvvhSr1a9Rc1VCDkMMxxZAQqrYCOHBwEs2CiMnx5MY2F
         rB7gJlYyxaiCD/ZTSLnY99zL3oz8fXwO2R+PTUl/S54HHRAuQIjCxjzM/bgrPFw1L4/9
         hRtQTZddcRXYZuTZuVoRwJz83D7N67Qme0WPkCk34Pav30u2SRJ4klpgVkAxZ4vuBozp
         oPnv1ttXLa3tOfsey2fSkf6W1nd9cAjtcWGJR9rOoTTp09hiaGC6QY8lzrGlVHuiGd+R
         FCtxhwVcgtvP+g2Na5D96slPQegclEKf0uZvnQ46WJibgZYS1QgmCjQXPaW+/D9aZ/TX
         rvcg==
X-Forwarded-Encrypted: i=1; AKwUvBz4IUYvNJEfJR/ptbOduPkOy2+zTMwtYF3MK03Czv9NGdtm1/DVgmyoKExc5U1KXGDZcHV7jX3fa8OaDYw=@vger.kernel.org
X-Gm-Message-State: AFuF++l2vvdtUfBJupArpzHGiz0KnJQMx62o09S6TPo1FgZLBzzd6cgT
	pZj1Vy9591ZJc/xvC+o5EvzoqWjoIZzrtLxL5qvobeEUtbyXcLl06GTmjhXW/od9xBs=
X-Gm-Gg: AYBFou2ovBHoaSBSWr2dxsXNXYT6htFTAZuwghkvZV0aSR/oAvPc0c6OJ+z0WedR8xj
	oAE4ZXrysceEn27Fb1TuoPZcQin1CE/4BNusHRHxeHjYKJb56kAiatx94RKHEWg/xyt5gS3LAZw
	/bahv3EqINUuQ0Ex7b9RrRh8h2LClFiZDDTUY70HIgtvp37OssruCTCIeb7e4TgAWNA+2Rc90AX
	pBFsCeSIfj2BLNoIPNP9bSOnKvJPQbO3PnI8/y0BJyJR9RIrOY7m0Jn3FkTDup2tgCLhqutEKjJ
	AntVotwk7EaRfebQN8K1Qxh4cT0ytYcVTI98e6ZNHctZSsSpmBN9vQMo1a6SSSmmQZ8hGuec4XF
	4CCpdc4RJQz8HAmdj/8637YeA7MERuAmpJ3jUwBoSj6FiS5gwxt0rRRakKbswMPgyEEJ4wCIi6Z
	hmORJcZmzFVgeYIiuF2QplKhWTFPi6ATOPr2WKG8Aun7w6RZ3gt4vTd252XrsCuq+y1BnoJrfTg
	Z65tgKaSKJlSWMb
X-Received: by 2002:a17:903:1670:b0:2d9:438e:b70d with SMTP id d9443c01a7336-2db1232c88emr606673835ad.1.1789022274350;
        Wed, 09 Sep 2026 23:37:54 -0700 (PDT)
Received: from icps5-ESC8000-E11.. ([163.152.219.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497fbf8sm84835435ad.43.2026.09.09.23.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:37:53 -0700 (PDT)
From: Hohyun Sim <tlaghgus0425@korea.ac.kr>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hohyun Sim <tlaghgus0425@korea.ac.kr>
Subject: [PATCH net] net: fddi: skfp: fix NULL deref when setting the MAC address while down
Date: Thu, 10 Sep 2026 15:37:43 +0900
Message-Id: <20260910063743.110747-1-tlaghgus0425@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

skfp_ctl_set_mac_address() calls ResetAdapter() unconditionally, without
checking netif_running(). ResetAdapter() first calls card_stop(), which
sets smc->hw.hw_state to STOPPED, and then mac_drv_clear_tx_queue(),
which walks the two transmit queues:

	for (i = QUEUE_S; i <= QUEUE_A0; i++) {
		queue = smc->hw.fp.tx[i] ;
		...
		t = queue->tx_curr_get ;

smc->hw.fp.tx[] is only populated by init_tx(), which is reached from
skfp_open() through init_smt() -> init_fddi_driver() -> init_fplus() ->
init_mac() -> init_tx(). The private area is allocated and zeroed by
alloc_fddidev(), so on an interface that has never been brought up both
queue pointers are still NULL. The hw_state test at the top of
mac_drv_clear_tx_queue() does not catch this, because card_stop() has
just set STOPPED; the function proceeds into the loop and dereferences
NULL. ResetAdapter() does call init_smt() itself, but only after the
queues have been cleared.

Setting the MAC address on a down interface therefore oopses:

  ip link set dev fddi0 address 02:00:00:00:00:01

  BUG: KASAN: null-ptr-deref in mac_drv_clear_tx_queue+0x68/0x2c0 [skfp]
  Read of size 8 at addr 0000000000000010 by task ip/302
  Call Trace:
   <TASK>
   mac_drv_clear_tx_queue+0x68/0x2c0 [skfp 6c01d4bab63c36978bd0a7d7e90837adb44cc37b]
   ResetAdapter+0x29/0x100 [skfp 6c01d4bab63c36978bd0a7d7e90837adb44cc37b]
   skfp_ctl_set_mac_address+0x57/0x80 [skfp 6c01d4bab63c36978bd0a7d7e90837adb44cc37b]
   netif_set_mac_address+0x1e4/0x2c0
   do_setlink+0x684/0x2680
   </TASK>

Address 0x10 is the offset of tx_curr_get, the third pointer in
struct s_smt_tx_queue, on 64-bit. mac_drv_clear_rx_queue(), which
ResetAdapter() calls immediately afterwards, dereferences
smc->hw.fp.rx[QUEUE_R1] in the same way behind the same ineffective
hw_state test; the transmit queue merely crashes first. Both are
covered by the guard below.

Skip the adapter reset when the interface is down. dev_addr_set() is
left unconditional, so the new address is still recorded in
dev->dev_addr. Nothing is lost by not resetting the adapter here:
skfp_open() deliberately re-reads the factory address on every open,

	read_address(smc, NULL);
	eth_hw_addr_set(dev, smc->hw.fddi_canon_addr.a);

and the comment above it states this is done to discard exactly such an
address override across a close/open cycle. An address set while the
interface is down could not have survived the following open even
before this change, so the guard removes no working behaviour. Guarding
the hardware side of ndo_set_mac_address() with netif_running() is
established practice; skge_set_mac_address() has done so since commit
2eb3e621c4e0 ("skge: set mac address bonding fix").

Guarding the reset as a whole, rather than NULL-checking the queues, is
also what the rest of the driver expects. After a previous open/close
the queue pointers are stale but non-NULL, so there is no crash, yet
ResetAdapter() goes on to call smt_online() and STI_FBI() ("Enable
Board Interrupts") while skfp_close() has already called free_irq() -
the adapter would be brought back online with no handler installed. The
only other ResetAdapter() caller is skfp_interrupt(), which by
construction runs only while the device is open.

Found by automated driver testing against an emulated SysKonnect FDDI
adapter under a KASAN-enabled 7.0.0 kernel. Triggering it requires
CAP_NET_ADMIN.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM KASAN
Signed-off-by: Hohyun Sim <tlaghgus0425@korea.ac.kr>
---
 drivers/net/fddi/skfp/skfddi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/fddi/skfp/skfddi.c b/drivers/net/fddi/skfp/skfddi.c
index a273362c9e70..feea7baa4816 100644
--- a/drivers/net/fddi/skfp/skfddi.c
+++ b/drivers/net/fddi/skfp/skfddi.c
@@ -928,7 +928,8 @@ static int skfp_ctl_set_mac_address(struct net_device *dev, void *addr)
 
 	dev_addr_set(dev, p_sockaddr->sa_data);
 	spin_lock_irqsave(&bp->DriverLock, Flags);
-	ResetAdapter(smc);
+	if (netif_running(dev))
+		ResetAdapter(smc);
 	spin_unlock_irqrestore(&bp->DriverLock, Flags);
 
 	return 0;		/* always return zero */
