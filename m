Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920519;
	b=HwHnNq8rE4+1BRK/8Rr9uExWdtkKSrEXCLyN1R+v70f9xi6SX6K6UTjRs9hOoAtIGcLq
	 12m3yh2yyQ+lVqbCYNpvGS+T7tecj12SiRCrdzFLw66C+He7XIj0Ey+ltiXxKmVdwWAsj
	 YllZnP0OTYE4u1HFcR46BHYP2VBRRg6W26Qe9LOwZf5l6jzqoxqNj3GEs9cFw53IK+o3o
	 ue1xxTbzLlPrUVtaDFkTUAKNY4SjwR/HrGWUQZa6f+ZFFGlFI3X1pUEHkt5L6LmDFXxAQ
	 2Tf+b/PwnVyhe0h18yVNZ5BfF7w9yMAcvFSbLbHKvJsD3i/moDggiAuvMr+4JqRWs+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GMxN5KAMb5liuMLzGoApFS7A/XMBgfd4eRZi5r3s3Fo=;
	b=XFQDBiFlXv1eJUGE6oKflzgylhqXY5PZ1Uy1nwkL0fsmH6WKx4oTGex+qoHpcV02Ps50
	 /bVrRnp/Rj5mH2sEh73viZPkkuvlPKaiJN78lxuDdBn9I/FHFfPojEeiMgUJx7FV+fA1W
	 GTBp2WCkHyQMWGLCw0w3CGdxUXby09wlFiqXDUigiXh/ctlkXwXHtSzFOyLU+6Bru7AaJ
	 f7UphaHL6kjTci4ckzq0Avn644qibPA7trL9k/m1R2U8GZZMJKKTf1/LpFWdTmdDAFzeH
	 Bb2PP4zC/y1YGKM8ZvRUAl+HDl/LVIBCArPYPDnQvP0oQopIfGrTyvENmDuQvv5j2AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQfgo8Lp;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74474606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74474606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQfgo8Lp
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so18154a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793920519; x=1794525319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMxN5KAMb5liuMLzGoApFS7A/XMBgfd4eRZi5r3s3Fo=;
        b=DQfgo8LpjtJ0DmzZazlGJfEkeSYgx5z6dIYiQC2tKD2mCrzoaANa9OCoP7oBoIh3iT
         P9xXkWdxoHYBEd6HaFnF/00b24qhoOl+SsqEI6OCLvaLlroy7LnZ6GwelTmQgqi9oQ8i
         Oa4slV6xDUuVv9Sr5WSjhhK4HE7aRNV7N+p8Hg7CTSBpv8O8SARlx6jUfj94J/sQaShL
         rdmOEPZFfUl5mTzzfSugqm9V90vCtG+3VAv2HVgIwxyw0TTFvKtjlKm/3tjTzfQqj4vr
         UXjOKpNjyEYPux0ob2mGr1OljwVNL7rg9BH8seXbIxtdMaFs1Cp9iqUMJaRMhy1nD0T/
         Z2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920519; x=1794525319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMxN5KAMb5liuMLzGoApFS7A/XMBgfd4eRZi5r3s3Fo=;
        b=EHTsVs1tCNrLrTmFAIAb12sF/sw/rQti8s39Kvfx+SCHj8sB7SM23sZMXN0kuMORJq
         nvSoyEhNFIZ9tR7bhN3KKhfJo6JKgWwo9qxWy+vVwh2qbDaGTIEMFQ7Tyu0r5FledOJD
         yILT8rYfIlBUSouoxiBMARB1Ef2kmEH15Y1zqUZ5i/z/2POfwvvGNj2Y8lkzHKpOFL1h
         IaSrrfcH/FkdKdTeitr2YDbCl1s20KLpdZb/WnemVLxHTNyy7FOQMmkC0GOe5lkyYQLs
         uGn/g4dv7B+qs1TNzl0yyQ5u/rORPXfDRQw/1XY4nRwWNWBRSq3kUSb2Bm8EB5t0povX
         1ISQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGRYg1hAmWTfH8ry6ovZej9VHv2ptqrTHW82YPt/gfhJ6Y0LDGKZ77p5NrVEYjyCBT7YTW3r87dym3pSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KibOtHdzOIcuiJ+8bojkxiGOn0anHioA2cPGQo5Vf6wUzM4rG
	iuwxK7nFlksl4d0Xmp4/lrU3OQeYmthpZnc8VKG3LuNipZv1k4Mh4MfE
X-Gm-Gg: AYBFou2MANyrApc4M1rz+41ntTXB0he8cR63uIZq4DfXADvZil4iiWS1JJPZTAsv5A5
	vwI1HbjPjPmfbdAJbCquMq4anPZx4jWoc1YW0jjgLJYDOt1bYTwINbbPhWwRj6qf+liUg6qpUbR
	nchpIOOBbYKR9FcanEM1pFXkYGa7hVpxgV9CWiQpz6+UuCPISp3DBIjFc/ZFsVHks71pE/pjXiy
	5lHDif5b4fvJubP02FrSoUY7SS3N5APlMFczpA6dIbAVq45oDczg9/1lNjp3dPmD3ueJns9p1iY
	LUqZo44BYmtLRKPNWWbuB6t2Cflc2569tTJyXGiqUtRtJSXZ1FGMdzQXYr7rAysiipMhHDSH239
	izHTo41kW5YvBTt01tcuxF2/i4sQeJFTrn9UyG73ojhjW7bYyeSBSrpiAe6fU/OBTPUJbbJWIZe
	OJI7hbaTRy/rwEw0eCS/hDi0tG8RHcKBv7UNpa+UP1N6d+JrJoa+ORH/GGeIu8L+6JpJzCWn/6g
	Fk+Hhoa09mtxOxoiMTKqVXMXQADtI+BvyXmPNxOP9YM9B+gAp8zg9fGhRBTcIhlqk5wx+mSrJEn
	FNFvE7/HChgWs+epQHzE6/rwaZFAOJCrF3QL3mKe4y1BumintX6Vi6leCjEPDxEiPtVwlYPCuPI
	YxmS8MnDEy9qi1UrrV9rl6ppgy8iUnPCbo1TezPqroFkqS2jZONs/d3Si3ZY292mthvGSdDhjNC
	AteMc=
X-Received: by 2002:a17:90b:254e:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3b0db701624mr483657a91.65.1793920518697;
        Thu, 05 Nov 2026 15:15:18 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8ff96sm851345a91.13.2026.11.05.15.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:15:18 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Jeff Garzik <jeff@garzik.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: ibm: emac: fix TX skb double free in emac_full_tx_reset()
Date: Thu,  5 Nov 2026 15:15:16 -0800
Message-ID: <20261105231516.120321-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

emac_full_tx_reset() cleans the TX ring without the TX lock.
emac_netif_stop() only keeps MAL NAPI from polling RX for this EMAC,
mal_poll() still calls emac_poll_tx() for it. A descriptor cleaned by
emac_clean_tx_ring() has MAL_TX_CTRL_READY clear and looks completed,
so emac_poll_tx() can free the same skb a second time and both race on
tx_cnt and ack_slot.

On a Cisco Meraki MX60, each MTU change to or from a jumbo MTU does a full
TX reset. Toggling the MTU while forwarding traffic corrupted skbs within
minutes (list_del corruption in GRO). With the ring cleaned under the TX
lock it survived 10 minutes of the same test.

Fixes: 1d3bb996481e ("Device tree aware EMAC driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/ibm/emac/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index b676b286e339..75e51ace16f7 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -745,8 +745,15 @@ static void emac_full_tx_reset(struct emac_instance *dev)
 
 	emac_tx_disable(dev);
 	mal_disable_tx_channel(dev->mal, dev->mal_tx_chan);
+
+	/* MAL NAPI runs emac_poll_tx() even while polling of this EMAC is
+	 * disabled. A cleaned descriptor reads as completed, so clean the
+	 * ring under the TX lock or emac_poll_tx() frees the skbs again.
+	 */
+	netif_tx_lock_bh(dev->ndev);
 	emac_clean_tx_ring(dev);
 	dev->tx_cnt = dev->tx_slot = dev->ack_slot = 0;
+	netif_tx_unlock_bh(dev->ndev);
 
 	emac_configure(dev);
 
-- 
2.56.0

