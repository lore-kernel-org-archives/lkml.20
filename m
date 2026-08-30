Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92E735E931
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788132176; cv=none; b=HviCzkgbHWxbvup/1im6GvfoxpRXpdo111YxUmtakn1NLymd3ZKK+o8p8M0W7zSpvd+A/a/6XnFfIBi2RCqE+KEbJhvKRb7Q4sKrmop6VvIOOCbgueoXLunw9gXwun9yyQisQNJ1rqCrRD8hj1OVhWF5+WmDkuOGHPDZvA5DuSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788132176; c=relaxed/simple;
	bh=DVj+WxYMaH7xErgtRURdPZIYrygxVAeE8S+6pSHRAj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GPSf1sXiMOsHa/xWWcKw1WL6Qg7FLJaEDoNs6NGczkqHxnRIR09zhZ9mDa8WT5sSyUysuP2we+EQV/dV84NpAAApsnhaJ0x2Ns4wJZOBgtduy4RSbzkmIARjUwgn+iNpGEHl5yzeRvACiykhqSwp1CMILFN/G5r+2coF5i5ilK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTeZw+Nq; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTeZw+Nq"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8615bb9d857so2978947b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788132173; x=1788736973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGMddz4oxHyMD/VYwjKLQUQ8UAQjzIFIQ1x/LerDgfU=;
        b=FTeZw+Nq2KYYn97EkC+fvhK/53kMym6WJ2hnmDeYhVn/O0fl3gGUgn6XR6pBvalh2Y
         907JT5ZBb82HlYC5966Htpz8rPLzR/NkNY7csNsWTc6ojeZPFDqLIPHq8TfrfbDRtEym
         CVMAxhTQLzrCapOL47Vc5Y6A9+nRSAqQaVkYqkd/iTMj/rmE8wehDX68e5miOkeDP/2h
         joZNc93JJ3kXemRwFWwjekG3EMxSTGBA4t4BK1i8UKKqyuELgbbie1Yhz2cOnKYEreCM
         9qUYbSZm6ymyLhnPhVnMe8cGNt8RxoBS5GpQY9QE1Yi852Xug5JUdqpzl0rgBWEG2b9G
         5ErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788132173; x=1788736973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGMddz4oxHyMD/VYwjKLQUQ8UAQjzIFIQ1x/LerDgfU=;
        b=jQiXju+yJosQkAQOE/1Exf66Bvaz0zineudhIuA8axoKJt498uz3pLYICoHdrTREn1
         o2G3xOSVIkAiCEe+ERwM8TkLKravayqPruaeUa28cBMUsIR7of/Z3O3rHyRyTLvs5rMY
         zNIawoMIItJsi5tpFfCOP/9ylMbYK8EdnA9jZMlCVG9iJkgwr3CLKDP7fLiCmRHkIQAK
         Iow5lR4m9c5e6hawD+UWakioIqPMfxh0UEKUhIPVEUIF5IcgUTiQqt6WGi/W1BAIGn29
         bMyfxQSmcDtq1pdM3+JOFBBKmQqwDA3sFAyioAHf/fLWSwvEE/jZFtmkxEadaUan0/p3
         zQLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMXnyM0e/l5HK6KuMY6M/DRKFEMY80G5F+tMET5iUUIbOLRLl/mNPGw7sqT7YDCjz2ng67YqfqSdpUIMM=@vger.kernel.org
X-Gm-Message-State: AFuF++m6CF9VQ9ragI0eQky9tctmlSk1fUOtj4ZAWKWDAo4LmUCFwbcN
	G53Pm92KwzYznfZQrxAMk6bh2ZJm3g2XGzy2EzZC8WxN23JoAq/Rotmd
X-Gm-Gg: AYBFou1u1N0GN6B/3F8uR4bz3LgvCe+M7r0GV/3Nt7aYnId+qXc85UlESZB80GiI6pT
	SJj6k+JcHYUE9/Dd6hQFsfa9ZwA5T+1lqfqqNyQvCBYwoNVq8F+SCrBVEgio9jEU2h9rNDXImkr
	kMCnpBbAfpb8trzSbnGf/kq2/2R3/de91X9BFnSwMn8bAq79V5q17uFWQZ40R4PqpRmNuP5Fh76
	LNrGzOmgWAdyIEXUk4VzSJw1O7sMiApJoF4uUpBsO6IsVnPndIAz7Fp0KvoxkcwpdoypDNfhN6M
	mH3VhiTzAOA4j82aVS5t2utt2SVc+xQG5siil0rRlM/cMZsTOGu5iiHwAPj6F2hcEXXr6utKpW0
	Kt6jFpzlPMHbQPHLBz3PUjJgjQsljrr2eT/XeGfg5zcFGWbqkg0ICBAbnsKFYsu3HhER92YLyLf
	qwjFvcR2Ij9j5IV5MulmxjWIOutAckdxP2TxxuqOPE
X-Received: by 2002:a05:690c:e15c:20b0:81d:e7d2:a46d with SMTP id 00721157ae682-85d65ee90b5mr61045247b3.5.1788132173517;
        Sun, 30 Aug 2026 16:22:53 -0700 (PDT)
Received: from devobuntu.lan ([2600:6c5c:6b00:316::23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e677606aesm39025937b3.45.2026.08.30.16.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 16:22:53 -0700 (PDT)
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
Subject: [PATCH iwl-next 8/8] e1000e: return skbs to NAPI cache
Date: Sun, 30 Aug 2026 19:21:46 -0400
Message-ID: <20260830232146.36948-9-tactii@gmail.com>
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

Use napi_consume_skb to hand skbs back to the NAPI cache. This closes
the loop with changes to the Rx path.

Signed-off-by: Matt Vollrath <tactii@gmail.com>
Assisted-by: Claude:claude-5-fable
---
 drivers/net/ethernet/intel/e1000e/netdev.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index c906175ad38d..a28ee0750f4b 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -713,7 +713,7 @@ static struct sk_buff *e1000_build_rx_skb(const struct libeth_fqe *fqe,
 
 static void e1000_put_txbuf(struct e1000_ring *tx_ring,
 			    struct e1000_buffer *buffer_info,
-			    bool drop)
+			    bool drop, int budget)
 {
 	struct e1000_adapter *adapter = tx_ring->adapter;
 
@@ -730,7 +730,7 @@ static void e1000_put_txbuf(struct e1000_ring *tx_ring,
 		if (drop)
 			dev_kfree_skb_any(buffer_info->skb);
 		else
-			dev_consume_skb_any(buffer_info->skb);
+			napi_consume_skb(buffer_info->skb, budget);
 		buffer_info->skb = NULL;
 	}
 	buffer_info->time_stamp = 0;
@@ -860,11 +860,12 @@ static void e1000e_tx_hwtstamp_work(struct work_struct *work)
 /**
  * e1000_clean_tx_irq - Reclaim resources after transmit completes
  * @tx_ring: Tx descriptor ring
+ * @napi_budget: NAPI polling budget, or 0 when called outside NAPI context
  *
  * the return value indicates whether actual cleaning was done, there
  * is no guarantee that everything was cleaned
  **/
-static bool e1000_clean_tx_irq(struct e1000_ring *tx_ring)
+static bool e1000_clean_tx_irq(struct e1000_ring *tx_ring, int napi_budget)
 {
 	struct e1000_adapter *adapter = tx_ring->adapter;
 	struct net_device *netdev = adapter->netdev;
@@ -899,7 +900,8 @@ static bool e1000_clean_tx_irq(struct e1000_ring *tx_ring)
 				}
 			}
 
-			e1000_put_txbuf(tx_ring, buffer_info, false);
+			e1000_put_txbuf(tx_ring, buffer_info, false,
+					napi_budget);
 			tx_desc->upper.data = 0;
 
 			i++;
@@ -1340,7 +1342,7 @@ static irqreturn_t e1000_intr_msix_tx(int __always_unused irq, void *data)
 	adapter->total_tx_bytes = 0;
 	adapter->total_tx_packets = 0;
 
-	if (!e1000_clean_tx_irq(tx_ring))
+	if (!e1000_clean_tx_irq(tx_ring, 0))
 		/* Ring was not completely cleaned, so fire another interrupt */
 		ew32(ICS, tx_ring->ims_val);
 
@@ -1816,7 +1818,7 @@ static void e1000_clean_tx_ring(struct e1000_ring *tx_ring)
 
 	for (i = 0; i < tx_ring->count; i++) {
 		buffer_info = &tx_ring->buffer_info[i];
-		e1000_put_txbuf(tx_ring, buffer_info, false);
+		e1000_put_txbuf(tx_ring, buffer_info, false, 0);
 	}
 
 	netdev_reset_queue(adapter->netdev);
@@ -2060,7 +2062,7 @@ static int e1000e_poll(struct napi_struct *napi, int budget)
 
 	if (!adapter->msix_entries ||
 	    (adapter->rx_ring->ims_val & adapter->tx_ring->ims_val))
-		tx_cleaned = e1000_clean_tx_irq(adapter->tx_ring);
+		tx_cleaned = e1000_clean_tx_irq(adapter->tx_ring, budget);
 
 	e1000_clean_rx_irq(adapter->rx_ring, &work_done, budget);
 
@@ -5019,7 +5021,7 @@ static int e1000_tx_map(struct e1000_ring *tx_ring, struct sk_buff *skb,
 			i += tx_ring->count;
 		i--;
 		buffer_info = &tx_ring->buffer_info[i];
-		e1000_put_txbuf(tx_ring, buffer_info, true);
+		e1000_put_txbuf(tx_ring, buffer_info, true, 0);
 	}
 
 	return 0;
-- 
2.43.0

