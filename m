Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685401;
	b=MGRLPBLnYG4AFAfWIOT34JXlUc9hpsNEdkCIqqmv5TOFe+O3hFXxiAIKjlMNlJV0FY7w
	 Gc6LFrGl/+wDJKElg4p6Yry1jclAS+LFOMBeylbPEWz1+HTiK8j4SunzN2u6yIqRKrkv1
	 LU3iOYzbpFvEYHxI0o6NUZn3aSAgVZ8ooATQIzzM3SISmSx+UKbB4gcVGiNzMJPS78oUc
	 oSmPxYMIPpr4grturyOTDLRVOfw8qn7gRTFErhAwPDJS49J94Hzkj0+YjESi10hQzdDha
	 vX3eApp994GKei6SNu7XamF2RzevlwQsSToo4XITWmwcDSrz2yggGlU4+Vctb9bZwXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=GpbUIm6RX7Iel46gw55j7xKHlKF59H1RZ41ZjqItGOY=;
	b=TaSEn1OPvMIcaxYTsjL9LPjGPIdysqNyISkTkngll/tTRYszmarsJVyNpPV8WqA2vULv
	 bdnKyDJAF16WWk5wyhenPS0S4VgczpmkD6j6aU0xkgY59piMSTdxrtM2mHzuDJeQw4k4P
	 LOmHfrPDLl6KUOVMJk6cWmvqVs+2jw7e9QtWRrWfoYRHinSOW9YDSzU/fLK8AIde44ygY
	 174aiCD24JND5QV5IyENivE/1i58Kq0Luv1462LDcPozPYmjt+HpfoN4bhDYHP6g1SaFy
	 4i4+oWU0U8EFZCcjgWzHdyeHs8Bef52IC0itIRRRgjFRtOfUzURKlR/p8YCtDDZdMsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sSXDT7SD;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5231B60A2639
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5231B60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sSXDT7SD
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1517bda04a0so2343891c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792685400; x=1793290200; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GpbUIm6RX7Iel46gw55j7xKHlKF59H1RZ41ZjqItGOY=;
        b=sSXDT7SDopEOwXdk7VRiArKA6rfD15wc/wBymk0WpLF7503Zp0Bn7wxAUvw8tGzwpm
         9+nMwwIxqY2QfpSh/9C011p0nq5/lbN1M8HtVuZKGlYI9wkixU8f8FrPqssGMLtF61F0
         L7cXCp35J/amP99terbcFS1luW2Z0Jumm3ij4zJ9ilcJ9SVW6eCEymXEeeZlqghFaa0y
         36XUVuXBoSH4uTn4+UZM0qa2DkDwhXXuSHYAq1qo0gJqj0OBulPqFh47FfaAMIWuzpNk
         MccvHKCdcskaohIxnd75cF4UHjxSNH16n0XXyoMIznqWTy8Pylqx9HbR0xMn9FnmpK6Q
         au4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685400; x=1793290200;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpbUIm6RX7Iel46gw55j7xKHlKF59H1RZ41ZjqItGOY=;
        b=wG08ru0vrB2/krQ4BE3kPG1bH8aXKCAZpbRZNWuyeMHNWOpiwp/MT7hND8eVOdvm7+
         SpoN8VivV7S46kVnsm8tHNl37PQ2tS93jS25xtYhpXoa0goYR1qk8GLTrz/1ebE4Nz+4
         rrBvp32xpFXrBVIGmKQm3RhLnGix8RdmYlwinOfxvKbGD3Rdp+p2pgROWaQjIY9Tf4rH
         nuIDWs423FbHp86ltaZ9KL0bOy3rTIO3MKuGtM2NHO6pXH8iWKchtiSD0YBk5BMqJ98C
         ljXS+NM4ECHLBqlJC/ylTYT0ovNWw5DakDxuC7RvJ0DUCNVzeQI9QYNxSKALvgKdNcgM
         ANyA==
X-Forwarded-Encrypted: i=1; AKwUvBxhh9tGPWaV4cdcq6VUqUY6yg6kYP7NUVgCkjQ9BP/2wzrS5KSnJbMJBX7tIvZlxGqUFeL9WXql7/hr+GQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrvODb6JQrrg2DRR/Oof+6iNpDoAHjvw55MW7NYpjSoOgCls8O
	FPinilwLNYHnnAFgnGYfPqChyOgYBSSN+svCifx2wziYJ6/VpAUVKijB
X-Gm-Gg: AYBFou34SX0q89q49UhOZL+sL/EHSEcc3jzwZDYvMxvGazdbD2ccOweUTDJ7J4grH+j
	nMmpZLY3tvwmDQXf+6gTZun5ZKHixtpL70L2RkuhD2XZnJ4eTpl26aKbnS4V3qJRd9fKC3ajS4U
	RuUKEVeHadVh8wqXNSsOLCiCcR6UTPCAXtvU+HcMfeOH91k3sgCaZBReVQjgg7VTs4VT2120a7a
	2TdCj54SxykR+QRszzkDJ5iL2NnX8bldzXEm1U0jtxWD/ZR5zeoM8zOp9xZBfwbCrInmKP2RjI3
	D8NZMmFBsdcePxgVlgUh01hbQ6D6Rrca7n6mN2UZ4Cvsib84+a5dvzT/EYvBvKqRYA9YTMxVCQb
	njB7YGtDeDRmeMwUB9UZna5YJNjjHc4p6okILkqkXCpqKwU3ahZ2REp+VgnwYHi6cObHtaejRo6
	OYp2cNWSM2J1sYsKI5NaPH7ScsD3VXrb01ooU2cGU+a++SUW7KRV40MaDl+jGABqMnwQMIYlIw4
	ZSYwhTju4G+Rb6mJOCW2wwhXD0866g3PTqquyq9is+VaUFNkIpu98V5MMSbAjL8B4s305tdpF1x
	CR2c
X-Received: by 2002:a05:7022:eb46:10b0:159:aa67:2893 with SMTP id a92af1059eb24-190a632f2bemr7128725c88.30.1792685400457;
        Thu, 22 Oct 2026 09:10:00 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e4f2eacsm14594124c88.23.2026.10.22.09.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:09:59 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 bridge@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Horatiu Vultur <horatiu.vultur@microchip.com>
Subject:
 [PATCH net] net: bridge: flush FDB again after unregistering the RX handler
Date: Thu, 22 Oct 2026 08:26:49 -0700
Message-ID: <179268538303.70821.8213834342995341232@gmail.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

del_nbp() flushes the port's FDB entries before it unregisters the RX
handler.  For a normal port, br_stp_disable_port() has already moved
the port to BR_STATE_DISABLED, so no frame is learned in between.

That does not hold for an MRP ring port.  br_set_state() ignores state
changes while BR_MRP_AWARE_BIT is set, so br_stp_disable_port() leaves
the port state alone, and br_mrp_port_del() then sets the port to
BR_STATE_FORWARDING (when the bridge is up) before clearing the bit.
A frame received between br_fdb_delete_by_port() and
netdev_rx_handler_unregister() is learned with dst == p.  Nothing
removes that entry before destroy_nbp_rcu() frees the port, and a later
frame to the learned MAC is forwarded to the freed port:

  BUG: KASAN: slab-use-after-free in br_forward+0x55/0x3c0
  Read of size 8 at addr ffff888079f4e038 by task br005-poc/9379
  Call Trace:
   <IRQ>
   br_forward+0x55/0x3c0
   br_handle_frame_finish+0x1300/0x1d40
   br_handle_frame+0x90a/0x15c0
   __netif_receive_skb_core+0x953/0x3040

Commit 8dca36978aa8 ("net: bridge: fix use-after-free due to MST port
state bypass") fixed the same race for MST, which bypasses the port
state in a similar way.

Flush the port's FDB entries again after netdev_rx_handler_unregister().
Once it returns, no frame received on the port can be learned, so no
new entry can point to the port before it is freed.

MRP ring ports can be created when CONFIG_NET_SWITCHDEV is disabled, or
through a switchdev driver that offloads MRP.  The race was reproduced
on a KASAN kernel with CONFIG_NET_SWITCHDEV=y, using a test module that
accepts the MRP switchdev objects and holds del_nbp() between the FDB
flush and the RX handler unregistration.

Fixes: 6536993371fa ("bridge: mrp: Integrate MRP into the bridge")
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 net/bridge/br_if.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/bridge/br_if.c b/net/bridge/br_if.c
index c52613431f88..8e774329af01 100644
--- a/net/bridge/br_if.c
+++ b/net/bridge/br_if.c
@@ -367,6 +367,13 @@ static void del_nbp(struct net_bridge_port *p)
 
 	netdev_rx_handler_unregister(dev);
 
+	/* The first flush can race with an MRP-aware port whose state was
+	 * restored to forwarding by br_mrp_port_del().  The handler
+	 * unregistration above waits for all active receive paths, so flush
+	 * once more before the port is queued for RCU free.
+	 */
+	br_fdb_delete_by_port(br, p, 0, 1);
+
 	br_multicast_del_port(p);
 
 	kobject_uevent(&p->kobj, KOBJ_REMOVE);

base-commit: f4377bf85887f57b59abb5479f7660a81ffe4449
-- 
2.34.1

