Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1262348C75
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319796; cv=none; b=DemPHeGnGOoqoG7QZ7VKDGIHWwdGKYb4s65ruYYis3YlSOosJoDHU2vHZYkZlxqGZxlknPb+eE9YQBNc7+DzoaTrwfuiqlpYfyonJx13M/NzZKj5JD8Sa67e0IJ/AT/UWd0WJzFkKc7DVCz2wFItt/vSMw8BZWeeAIIJtBiGI14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319796; c=relaxed/simple;
	bh=J4/PepV8PBz6sQAShbl8+v2xr61BId7+YnU/sMtjwl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BjZuqFigo8FP5Gkub/AFWVquIrzVsbfvlK3BQ7EzV9Ihop71B4I/Z6TtOAQG234upEskH4LegnOaPBEsMqQBZyT/tQp3BxUs5U6DIK1Is2bOyDJ36YKWXmeer/Uf1vuIBSPXMmgQ96d2lHhgWjcfQIJIBy/xCm5QNDg8mpL4WkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzGChSv2; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzGChSv2"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso5813275ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788319792; x=1788924592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGpqtN0vRq8epNdTDKQRGvsPqQN+AJIy2e00tUkEjAI=;
        b=LzGChSv2YAMXI+FhA0TKp6zLEcqtRYUhHWxyOqLMHJ/1i4LV53b1H0wx6YNfP1lazh
         vYYGQg9/l8XQSCrEN08Lxf0SQCGE7dDi9G+asTTnHXfBI/5X0Hd3BwHKsuOZGEvog4cW
         1mDDU40CHcbdLlFmFM+yn609Q7fkdijlMUk9li66SR0qPNsYf284Eb7q6GaybTIoBokU
         tNsChVg8XP3qMysmd7OG8pRPuZUe36zgsiet66yNB/u5rGRFIg6k8QjOA4+XgTlHk7kM
         JzpJp2egjUFi0VEgnwBzIbUjophMrgRugDV9OExEI0I59Cv9lGG2qOOyvT4uEEdx4A7B
         9Q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788319792; x=1788924592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pGpqtN0vRq8epNdTDKQRGvsPqQN+AJIy2e00tUkEjAI=;
        b=DEa3vSv3tAtqxZcc+qBnY+vAqggCD++LuJF7g41YMkjISrKJP7xjJ+FlirN4349FZn
         +C2/37V7Pzjop6hVTD+JVcqireXdi5eLV1lZEMlVVMUyoOseXEH5S0Zrdj7wXJlWuxP3
         smcHARQiHKWps4TX3aBGiRABknVauC6fbrWF8C57Vz5W4BG32/c/1saN60OfYAVdAU+V
         AbjYGwPOeoERO4fdn7/fGMAxLEHoCbREipVfdqV9iBVDcyBlvdjuBbb3KdN5fq4nnoLP
         HXDQvDjVUkxyqCD0N8GeEZWUf+I35fwrIduT6IRjRpgSeqIVBCr7WSMt2GipEaQaIBh+
         x8Qw==
X-Forwarded-Encrypted: i=1; AKwUvBxArlZPukiIOV+mO0ylthlsDy3JkvSWrPw8bzJS7QjWyGgP6G7HYNVGMN71+d9CAUrAH88jNvSr1UaEPbg=@vger.kernel.org
X-Gm-Message-State: AFuF++kgxmXdB51PXKKchdKKm8BpoFMsp2he/x5bXIJiZm59nliuno/Q
	ZfObcK9dL/1bMsfdqfgmTx66KLxmiyM6XWsF6Fi1HzlZrRresfKHIEth
X-Gm-Gg: AYBFou1crNQ7Iv7k1J6LSHoAidvOiSbNSOLOk5k/Ac9Dk2vAV8R94WtClfWbE9A9CBC
	QUVuKQs1aF7k81xHJdEx9Y4GGQaKax0Cytz2q7VwoHVE0oT4EaiENCPc2i/ACh+QnUH29C5uxX2
	sq3qWeYqIseeULYtN3li5ua+VO8sJ2ImBpiJDwZy7f6OLDiWnucpvwY28vvsjtuvaAzSjJ3s3IF
	WHSHqujZ4laDdFKdcIEcYxMGBDaPhBPouJD8svGzHB+WZziEfRxqvjormrd5wQaDJC0ImwYmG6+
	47naqWN8KBb8cI1iL41aFmqFn/cd6e9KLyz5Wgg/LJJvKx8ePUjiasOxdMT4yEGaSF/uDJo2asx
	fZzJqeknfLd542YAnys1R8dEB2bLOwnYIvM9oaAbIs2bwcvHWAK5y711u+c4Bam480U97bgNDGY
	6T9QjmmJuOx+hdfUqpvrF5fM4ohVg00ZYLjgOUjZWA
X-Received: by 2002:a17:90b:2552:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-39aedec7bbbmr2766953a91.5.1788319792006;
        Tue, 01 Sep 2026 20:29:52 -0700 (PDT)
Received: from devobuntu.lan ([2600:6c5c:6b00:316::23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07baa594sm3099307eec.22.2026.09.01.20.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:29:51 -0700 (PDT)
From: Matt Vollrath <tactii@gmail.com>
To: intel-wired-lan@lists.osuosl.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Vollrath <tactii@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH iwl-net 3/3] e1000e: fix NETIF_F_RXALL buffer overrun
Date: Tue,  1 Sep 2026 23:29:13 -0400
Message-ID: <20260902032913.661570-4-tactii@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902032913.661570-1-tactii@gmail.com>
References: <20260902032913.661570-1-tactii@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When SBP is set, the card may deliver frames which would otherwise be
filtered out by LPE being unset. This would allow the device to write
up to 526 bytes beyond the skb's data allocation: over its own shinfo,
and beyond. This bug is reachable only when MTU <= 1500 and
NETIF_F_RXALL is set ("ethtool -K <dev> rx-all on").

Ensure that buffers are large enough for an entire 2048 byte chunk when
NETIF_F_RXALL is set. Do this by moving final rx_buffer_len
determination to one place, right before RCTL.BSIZE is determined. This
will correctly re-evaluate every time the adapter is configured, not
just on MTU change.

Signed-off-by: Matt Vollrath <tactii@gmail.com>
Suggested-by: Jakub Kicinski <kuba@kernel.org>
Assisted-by: Claude:claude-5-fable
Fixes: cf955e6c96cb ("e1000e: Support RXALL feature flag.")
Cc: stable@vger.kernel.org
---
 drivers/net/ethernet/intel/e1000e/netdev.c | 53 +++++++++++++---------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index 063fc8cd2673..80d5a0010df8 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -3036,6 +3036,33 @@ static void e1000_configure_tx(struct e1000_adapter *adapter)
 #define PAGE_USE_COUNT(S) (((S) >> PAGE_SHIFT) + \
 			   (((S) & (PAGE_SIZE - 1)) ? 1 : 0))
 
+/**
+ * e1000_set_rx_buffer_len - determine the Rx buffer size
+ * @adapter: Board private structure
+ **/
+static void e1000_set_rx_buffer_len(struct e1000_adapter *adapter)
+{
+	struct net_device *netdev = adapter->netdev;
+	u32 max_frame = adapter->max_frame_size;
+
+	/* NOTE: netdev_alloc_skb reserves 16 bytes, and typically NET_IP_ALIGN
+	 * means we reserve 2 more, this pushes us to allocate from the next
+	 * larger slab size.
+	 * i.e. RXBUFFER_2048 --> size-4096 slab
+	 * However with the new *_jumbo_rx* routines, jumbo receives will use
+	 * fragmented skbs
+	 */
+	if (max_frame <= 2048)
+		adapter->rx_buffer_len = 2048;
+	else
+		adapter->rx_buffer_len = 4096;
+
+	/* adjust allocation if LPE protects us, and we aren't using SBP */
+	if (max_frame <= (VLAN_ETH_FRAME_LEN + ETH_FCS_LEN) &&
+	    !(netdev->features & NETIF_F_RXALL))
+		adapter->rx_buffer_len = VLAN_ETH_FRAME_LEN + ETH_FCS_LEN;
+}
+
 /**
  * e1000_setup_rctl - configure the receive control registers
  * @adapter: Board private structure
@@ -3102,6 +3129,8 @@ static void e1000_setup_rctl(struct e1000_adapter *adapter)
 		e1e_wphy(hw, 22, phy_data);
 	}
 
+	e1000_set_rx_buffer_len(adapter);
+
 	/* Setup buffer sizes */
 	rctl &= ~E1000_RCTL_SZ_4096;
 	rctl |= E1000_RCTL_BSEX;
@@ -6087,30 +6116,12 @@ static int e1000_change_mtu(struct net_device *netdev, int new_mtu)
 
 	pm_runtime_get_sync(netdev->dev.parent);
 
-	if (netif_running(netdev))
+	if (netif_running(netdev)) {
 		e1000e_down(adapter, true);
-
-	/* NOTE: netdev_alloc_skb reserves 16 bytes, and typically NET_IP_ALIGN
-	 * means we reserve 2 more, this pushes us to allocate from the next
-	 * larger slab size.
-	 * i.e. RXBUFFER_2048 --> size-4096 slab
-	 * However with the new *_jumbo_rx* routines, jumbo receives will use
-	 * fragmented skbs
-	 */
-
-	if (max_frame <= 2048)
-		adapter->rx_buffer_len = 2048;
-	else
-		adapter->rx_buffer_len = 4096;
-
-	/* adjust allocation if LPE protects us, and we aren't using SBP */
-	if (max_frame <= (VLAN_ETH_FRAME_LEN + ETH_FCS_LEN))
-		adapter->rx_buffer_len = VLAN_ETH_FRAME_LEN + ETH_FCS_LEN;
-
-	if (netif_running(netdev))
 		e1000e_up(adapter);
-	else
+	} else {
 		e1000e_reset(adapter);
+	}
 
 	pm_runtime_put_sync(netdev->dev.parent);
 
-- 
2.43.0

