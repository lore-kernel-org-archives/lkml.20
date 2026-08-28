Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A80330594E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787952179; cv=none; b=eGrxwQqcV4apLSJ4xgZ6ocqCU1/dGVtM1b06TtV6TfePN1k0H2AiJnBkgJyDzlb5GPpeSwZ6B9031AiC58BsfRIhkO44YzufEZLKfWgbmAyp5dJR8Z8afWX2aKmqV6fGcBgjU1itEEFWzAwpBg5VZ57CIhhQz855HuW2jpNHQOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787952179; c=relaxed/simple;
	bh=ilkhL42F0lSsISjcvlBfgag1mnnrZd0+GKvd3xLegfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eYwGh46Qbbbd0zGXXd3GZmYi/hAUK3PF/anAdnYEeN5LCEN35dBLCGDb+iZuq1xNBYoNaIHNzMyZWX1xUxUG+NnD2mm/jNkETmE6YX/Ezhb61GZkoApWe9L5kfT8R1WtriPAjJtuAtmmfNqI+3TNFoz0bbTU/IsDI/xWZ6bs5xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3akYGoh; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3akYGoh"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d53197d8b5so11488295ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787952178; x=1788556978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x4RsPwvgALDXZ3rlfFmtjjz/9D02RRFDmv/U3zq8FwE=;
        b=L3akYGohe/Nwb+ZoxXiTqQugjPQicnt0kTRmwm0q6UFN2kWyj4WUlUG5F87eov63Kv
         2WcDGXjVz8XE4DE/KlAKnOf+0m1hcs0iDZacif7AauCU0gKK39mdIQL5xwPtJ5CUA0EZ
         IZVpfFIkGvsP81Jbs56zfp7kP3QSO82t41TQhp7l8iMxS8/WYn2NPl4QMngfuw3wdIkP
         izG4cVxQHgjyZnRtZQ8dImGvfuRXPNdKpHFPXLmEVhkodUH26umjRz9afYIYEg+vmhdc
         f4kcH9xQQQm3zwDPbvt/8TZMaCztwWJCXZXMM5z8v6vNFufgQoSrm6NdaCP3iA/+AQEr
         WscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787952178; x=1788556978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x4RsPwvgALDXZ3rlfFmtjjz/9D02RRFDmv/U3zq8FwE=;
        b=Q/IC8432R4RQJcKwKBFlgPvBMPfjfqY1nT/biAqTaR85mj0q9zqlFcMNN0e7BWRFA5
         XfkrkWLDUb2JJ3zzpnBL0LLO4z5nE92RkjCyjSQ2yraUfBzcjy4KhT43bIf/OvPz3deZ
         H3NvDolraZwacJ9JSOPx/6NdGkeHQuNtKUhDxlZSqy5fvLA5hUgYvI2fcFJhG4sSeIIK
         7JQkDttfwyj1QKf1FmU3xLZMawvkyIjv9JMCYg5ZX1pHGRNB76WjTkRPWb7GvAW4tHuH
         iD0qZ2qnPMr5A/pa1Mv8V6bBcrHr3uFLjm6tnlJXvao9BUhUWLsmW0wwarMo08KJeRDS
         tgAg==
X-Forwarded-Encrypted: i=1; AKwUvByyw5jp1eADFaoDteef00pkgYTFd1dJrwUZcoTewln/ZJzBoffIBF4LDcCwJ0XrlqvCNJBxFosMccDAxKM=@vger.kernel.org
X-Gm-Message-State: AFuF++nC5cDuXucOBrIxFCfdcpoZpORvoS1VGT074fP/l0SWOwsOdDJs
	owUs1DoOCPLTB/sCKH4ZGB74NLFAQ7n3MlU5nYrtVecZpyT9P5JmhLoc
X-Gm-Gg: AYBFou2xFFQv4LDXf//+5m01m02UlJetp9w4nddlivpVeX4lWkVwsdYnT84PISaPGiK
	brHbPaYAy6K6hqf/fvZyvCBpnAvP1KK+zKnDP4pTgtJWSJG0CS1tl2TV/4eypvHRJtQSPCaHNQ8
	Ov1pu0MYxLXXI0AxWE0zxq2HMlOdEBlD7DPPplYbxW3w6OMUigTpNmgwW8Feh31Pkj7DNXkNlvK
	WpSkOTcJMcIVTgGduyXl6pYR3LBhLVabg3RtmCCzraXo/1sQ/tsFH4MffrIvPfOrIFs82jqUbh3
	rfriLSf81obDxv7yA/KJs78meY/5hXJ593+HMndxn3vVMEkwwT8gbHfTpVLoSfmFNcu5tuSmhjO
	IB5g8IDLy9SYyN++xh2jTmUeIPWLXcq0uCQst3VmOoIyx/ENyibIbrBRDQm/z0DfaPm/SVf6sGX
	6zOMM4+UTpAVgYEKLI7C0PFyVg5k/vstjSIxxDULfpET2PPc59n7rmgwAU+tO7PnT9wSkUqekWD
	qKgGcFtajKVJNP5X2BWaZ+3RUHOGx/PHwhcV8PzVTBttSgvRFFrl+0I14BN7ax3ROigX6GZQ2Ne
	UCw4lFT8FBFXdVYJdZjJLB61uY9P3EQrz74zNcvA/3j5HfbI
X-Received: by 2002:a17:903:9ce:b0:2d8:d4d1:3139 with SMTP id d9443c01a7336-2d8d4d14ad6mr29857925ad.16.1787952177826;
        Fri, 28 Aug 2026 14:22:57 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d8750057e5sm6569735ad.66.2026.08.28.14.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 14:22:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Manfred Rudigier <Manfred.Rudigier@omicron.at>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: gianfar: fix DMA unmap of time stamped frames at teardown
Date: Fri, 28 Aug 2026 14:22:55 -0700
Message-ID: <20260828212255.46046-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

free_skb_tx_queue() walks the TxBDs assuming each frame occupies
one descriptor plus one more per fragment.  A frame sent with
hardware time stamping instead consumes one additional TxBD for
the time stamp buffer, which sits between the FCB and the frame
data and belongs to the head DMA mapping.  The current walk then
lands on the wrong descriptors: it treats the time stamp BD as a
fragment (unmapping the still-outstanding time stamp buffer) while
the real fragment descriptors are skipped, so their DMA mappings
leak and remain attached to a skb that is about to be freed.

Fix the walk the same way gfar_clean_tx_ring() does on the
transmit path: identify time stamped frames, derive the head
buffer length from the time stamp BD length plus GMAC_FCB_LEN and
GMAC_TXPAL_LEN, skip the time stamp BD without unmapping it, and
start the fragment recycling on the correct descriptor.

Fixes: f0ee7acfcdd4 ("gianfar: Add hardware TX timestamping support")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/freescale/gianfar.c | 30 ++++++++++++++++++++----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/freescale/gianfar.c b/drivers/net/ethernet/freescale/gianfar.c
index cf636fc5aafa..c5a716d91fd1 100644
--- a/drivers/net/ethernet/freescale/gianfar.c
+++ b/drivers/net/ethernet/freescale/gianfar.c
@@ -1064,21 +1064,41 @@ static void free_skb_tx_queue(struct gfar_priv_tx_q *tx_queue)
 	txbdp = tx_queue->tx_bd_base;
 
 	for (i = 0; i < tx_queue->tx_ring_size; i++) {
-		if (!tx_queue->tx_skbuff[i])
+		struct sk_buff *skb = tx_queue->tx_skbuff[i];
+		bool do_tstamp;
+		int buflen;
+
+		if (!skb)
 			continue;
 
+		do_tstamp = (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
+			    priv->hwts_tx_en;
+
+		/* Sending a time stamped frame requires two additional
+		 * buffers, the time stamp buffer itself being between the
+		 * FCB and the actual frame data, all mapped together.
+		 */
+		if (unlikely(do_tstamp))
+			buflen = be16_to_cpu(txbdp[1].length) +
+				 GMAC_FCB_LEN + GMAC_TXPAL_LEN;
+		else
+			buflen = be16_to_cpu(txbdp->length);
+
 		dma_unmap_single(priv->dev, be32_to_cpu(txbdp->bufPtr),
-				 be16_to_cpu(txbdp->length), DMA_TO_DEVICE);
+				 buflen, DMA_TO_DEVICE);
 		txbdp->lstatus = 0;
-		for (j = 0; j < skb_shinfo(tx_queue->tx_skbuff[i])->nr_frags;
-		     j++) {
+
+		if (unlikely(do_tstamp))
+			txbdp++;
+
+		for (j = 0; j < skb_shinfo(skb)->nr_frags; j++) {
 			txbdp++;
 			dma_unmap_page(priv->dev, be32_to_cpu(txbdp->bufPtr),
 				       be16_to_cpu(txbdp->length),
 				       DMA_TO_DEVICE);
 		}
 		txbdp++;
-		dev_kfree_skb_any(tx_queue->tx_skbuff[i]);
+		dev_kfree_skb_any(skb);
 		tx_queue->tx_skbuff[i] = NULL;
 	}
 	kfree(tx_queue->tx_skbuff);
-- 
2.55.0

