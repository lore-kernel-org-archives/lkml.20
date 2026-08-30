Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0551F35674F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788132141; cv=none; b=iulV3ALhEtEIMoOlTA+UDA1nJlXevukxVWiF9dug4oQmT6GIlJJOA4H1hXIiinZ/TadqmfnLGEJRPobgoA8GXv0nQXetfHfv7ChgAL/MnWM4LZPBNwhfVbXlCPZm4hSMpmgb0/pZ4WLasbgRsiy6A1QHONXD4DpnwezjbAAtlAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788132141; c=relaxed/simple;
	bh=Vd7t/VCSbdHAy1kCjXH7yJArhfu/zvuWLMP+dsSFygo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gnIgF6LSSuPfrFTUpHgznU3GNKSeSFbBOKo1NPvxWJktdAs502nLgZf3KmMeeA5yZLtNQnxM4J6fYaqePED4dev5xJyOX6A+mA2IboLL8Pt+9HanOxj66mAsNBf4qVp0jiSIalkc6KA+BJQ5GNa6HrnNDMqiLWVfijz2VOneTwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iE0qg5du; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iE0qg5du"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-85a50f6a7f7so31876837b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788132139; x=1788736939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0uXGJNgPYreSiDYBBxdQJQqH0DPau7askhrNGDyNQM=;
        b=iE0qg5duG2FHjiYohT99/cShNRhkZm0iwr0LTazbY+7t3b9/02VqF5lqZFDbH9FVIl
         1jNm+etMm/huph6IHLrTYu8oWWwftiOQtItCftr3yavotrLJsehMmatcxJTWrtXq0Sx9
         aVWQedlfiiDtxTmo4Q1Z4jT5ReXDMv1MRuQ3QtBaNMZmr22TByAmUgOqTYw8meHu2Zo5
         CxVxmxOjCZJtlUO+FL2tzawdzj5vk0o4LIThCk76vAXJrH9FRa+4S7MGicOp0g/viVRM
         mRZWu9R5rnrXNVAYlotxH9UKs64Z+A+y4u0XQ0bNX9yWe5gAgx8n60Nm1cT2T4NnVY8e
         c8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788132139; x=1788736939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V0uXGJNgPYreSiDYBBxdQJQqH0DPau7askhrNGDyNQM=;
        b=fEt2sv/xs4zNy17tgiVb1rB2ESJBvqHvJ32kk0PmxbheigqKURC5zXtzbGgBu5N72q
         Y3kjWO2L5Y/nzJmB9MZtEr9V833bOpL37MZk001PMHK9PMP8e26zWaZNsT/X5s017wqE
         3BT+d+OWcYibROUJqmXvUmbNxfWSIvXuIWuXRQKKtO6Og/gYsDfZm/Id2x+8nKNDL+mG
         gqDlIDq/a0zDC/z9H7Ms6cUs6lQvgpJKXrUfHHEaUknlxUd9F0K0Yai9s5jNw/zm6ra7
         ewB3jx0+9T6DHBybcq/YprA+BHSJmghWs/SIgnoVfqDT8bnwCEvkM6M0evsQgw/LUZxx
         ygDg==
X-Forwarded-Encrypted: i=1; AKwUvBz7WZn8UHktnmO4ooCBGzZJ/jtnIsu8oaLaq5DHNktPU8VkTlGbqIWv68QX+nlUlnsD82k9ou0YxPQ0vtw=@vger.kernel.org
X-Gm-Message-State: AFuF++myoG35y/FU962uQr7eYra4T4nIp4fhMcD2yfKOqyVpKqCB9xle
	HCLOJqYo63MNCXJpI3ATzjXWZr7/McD0yaZxpPFvrkhZwqT6FjoRRaGs
X-Gm-Gg: AYBFou3UbeFQZKiPzd4rTwmlshfRjuAyNH1Gp9Hp/kY0OiT6mK6+DCvkix4a9tFwLIk
	nnuXWwRuFR7+dSdPQoX0dyaShHub7ZhQwTTIrviwpl8AyDZsQoG/urkPFDc02US/ViiH52SyT1Q
	x4NRMmJuDzjkxLKKMiO1mvHMoDqZ3s5IubRl1hUkt1vEAI+lPu27HgXGc0grQhgtd8prqSiafMp
	Hpw1UMgPtHnfsmLu7iVeAc3/NfVp7lwdK28n6LN3zK3AyoxYG+z8x3VnN1vSeLU/ko4dGnm9tmu
	Va2m8KW77f/owSiVScoP+FR3beU7rZqA4KeXH3CmOt6hTtmSwTf/i3QyrQJSmdAUMl3y3nRbmDE
	278O6ul85qj4wzisQcuVwW7t4iStz0s3/21pbY/2p/Oho7WXjhjbhkUmf6kX82pNQZKXIhPaTzK
	GgYu74ZeplLaqvaMfztjLJ/q+Sb//kUu00gmIKfWeI
X-Received: by 2002:a05:690c:6912:b0:858:d6fb:2b9f with SMTP id 00721157ae682-85d660db315mr76627717b3.5.1788132138950;
        Sun, 30 Aug 2026 16:22:18 -0700 (PDT)
Received: from devobuntu.lan ([2600:6c5c:6b00:316::23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e677606aesm39025937b3.45.2026.08.30.16.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 16:22:18 -0700 (PDT)
From: Matt Vollrath <tactii@gmail.com>
To: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Vollrath <tactii@gmail.com>
Subject: [PATCH iwl-next 1/8] e1000e: add jumbo Rx CRC stripping
Date: Sun, 30 Aug 2026 19:21:39 -0400
Message-ID: <20260830232146.36948-2-tactii@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830232146.36948-1-tactii@gmail.com>
References: <20260830232146.36948-1-tactii@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the hardware is configured to not strip the FCS (CrcStripping=0),
the jumbo Rx path would deliver frames with the FCS still attached.
Follow the standard path's convention by stripping the FCS at EOP and
leaving it out of the byte count.

The jumbo path was omitted when the CrcStripping feature was added.
Since v3.3[1], the jumbo path has only been used where the page size is
over 16K, which practically rules out LOMs, BMC sideband, and the need
to leave FCS on frames. The bug is only reachable only by setting
CrcStripping=0 on a platform with nothing that needs it.

This change prepares for convergence of Rx onto the jumbo path in
following patches. The set of h/w routed through this path will expand
to include LOMs.

[1] Commit 79d4e9087a6e ("e1000e: disable Early Receive DMA on ICH LOMs")

Signed-off-by: Matt Vollrath <tactii@gmail.com>
Fixes: eb7c3adb1ca9 ("e1000e: fix IPMI traffic")
Assisted-by: Claude:claude-5-fable
---
 drivers/net/ethernet/intel/e1000e/netdev.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index 844f31ab37ad..599600ad695c 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -1631,13 +1631,23 @@ static bool e1000_clean_jumbo_rx_irq(struct e1000_ring *rx_ring, int *work_done,
 			}
 		}
 
+		/* strip the Ethernet CRC; it may span fragments */
+		if (!(adapter->flags2 & FLAG2_CRC_STRIPPING) &&
+		    !(netdev->features & NETIF_F_RXFCS))
+			pskb_trim(skb, skb->len - 4);
+
 		/* Receive Checksum Offload */
 		e1000_rx_checksum(adapter, staterr, skb);
 
 		e1000_rx_hash(netdev, rx_desc->wb.lower.hi_dword.rss, skb);
 
-		/* probably a little skewed due to removing CRC */
 		total_rx_bytes += skb->len;
+		/* If configured to store CRC, keep the FCS bytes out of the
+		 * total_rx_bytes counter
+		 */
+		if (!(adapter->flags2 & FLAG2_CRC_STRIPPING) &&
+		    (netdev->features & NETIF_F_RXFCS))
+			total_rx_bytes -= 4;
 		total_rx_packets++;
 
 		/* eth type trans needs skb->data to point to something */
-- 
2.43.0

