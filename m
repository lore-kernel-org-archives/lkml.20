Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443524B0C9D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622547; cv=none; b=N8OJGxGXvMxqSa7AaEmS1teAejbF+47qTkihshyc7ihZBIVbCYw24loDApz2nrtTEFWmifWeL/AcH4rC1DV/tau2l/ORodFxMOFNrfu8ZWL8e9YZ/4YZFHA7GxnlUUQyyLzrpj3tKreJEFJBtoOv7ZVJ7IvJKZiYC2zxBHyCY8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622547; c=relaxed/simple;
	bh=GvmssypO3wFrEaIA/09y7tkUfGE1ozQEU6tFnebwajA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HdLekyoX1DrYJri0BWOZH9/5j/kezEmcn35n4WpOCVWtK5y1eBPkMyFWb86O8trivE4VNWZ8RMRR/Vkx8vYgYYjeJi2cmCm3ZAWt72KuTHLUIvLeu+NNDNU+S0gU0BB9u/Nip/KvX/ZYCT3HSGywLNb/3/mNEGMESYPcsvqnmPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLXWQDYs; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLXWQDYs"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso91035a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788622545; x=1789227345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lm42doHswCi3RtZeu7IIEEdGs2pytFeZf/X0boG9eKM=;
        b=BLXWQDYsEuEDb+L+/BqcaWkGdfwqWbYkwLpMqi9bkjFH7mEDRF8Gh6cnHO2V2GfryR
         J/E7t1T+lGX+qw8XsP+lQSUQySoeQXvQbGHMgW/nywCLlxz9fbwKvWdwy40+mbyizGxD
         2P5LlzR9vx4LVnnWPnCQFNxFmcToorqDSX/1hSdLtKzPR4MRAjWhi6Zf2DcNpuR+28mf
         LTphv1djz4eYeP1Qa9ZW30i54NGrL1v2gcvG0SgQ65ctM9ZE8nVELSR+VxCkIIMy+At1
         9xGYRUmhY5dnuY8O8PuBh4cNrQhfpkTSWuj3Tknbl9a+BlZvQLcsA+p7egaBByymiDgo
         BrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622545; x=1789227345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lm42doHswCi3RtZeu7IIEEdGs2pytFeZf/X0boG9eKM=;
        b=UG/B5tjFU8L+6hZvhcvCFFbzkHBaYAx4yF10YyVoVlbo7lEucTPtqS83Wdx86fVUws
         5SoRP3y5VjDT1ewOgztdxKFlqvSW5cYH/ChQYsndyUk2DVccIAalgc1gu8eygrARXcJ1
         l2pTyF03Rx2qCYhA5h4HmtJq7YJruMWPKUZ5mmA9lWbjDdnY41SW/7H61Z3mphGGaJW8
         lVYjZ9/ITvaU1pOo1CLlSwYYI7yqwIvcHSejOdN2avv213ByC3hwIEitfWMrKu0TEzXw
         mtWl1aBvgpBcIJRH0RhkzajTidJVOCBGK7sF245tU/0HCDguqTPra+QtL6GUGuyugUoE
         LAAQ==
X-Forwarded-Encrypted: i=1; AKwUvByZQf0cM9t1NDIhTmyGhtux5/oiMlK3+9Bg52voRi5cgR8eKhHwxvPo6bTeeC6+3CzCNQNGQQnrhTzAops=@vger.kernel.org
X-Gm-Message-State: AFuF++kWBX5LwWtmRTZAYJmuwxbtffk+vACQWcXG+nogRVRxjLLubnBB
	ihR+36OUiN+v9y9jgME/R/0qy8CyA4qNmOYAWrsPbh5T5C5i/8IloknO
X-Gm-Gg: AYBFou0E1mH6SATJ3lVke/O6I7pqI0vVtCbZIadiurrzViS5BXLIAmj4uzU4buIWdxF
	UxzGBYysQ8xj4ZYy+J2Df72ZNz/PjZpzg0drFGHflpeQSrtyrI5rY9mzaySo6Z2OH9RkTApl3BG
	vln1mrR+l3TOXBZc1HM8iBdll8DQs1MN0b+Kz3v+XnvGVgVTTYzPVMq1hQ/mQHGuAm1nDZ/zKlI
	GL2ucjN75VtHrtwJ9HfdEbipFZAjrSTEeNBFYHLCRhOw2VP9tlIyWlkj+1vB5DWzWisTciM7lLi
	CuPAFwOw2hp8pv32SyZCJnTcFzKSO6shGaLyby/22ZDzapKOJuXJAofS8MftpPGOWRYZNHqK/t/
	aY7jSLH7VH5YubjjhMjkk7TsFfRswEMVIzrNMMJmCzJNJgtW99oof53nmaDHWrt/s0etf8OXMXQ
	4ur9JkNwQAigabKZdOLEz+bxKfjO7ptWFeocbFtKnMUt4wrY0M2xcr9B1uaOF3KTkSwtWoj26Os
	UBhGKl/p3jD2lkBQU6lvPom137/AysObAMGGF0/kIXLFM+coZ4C/9Cb5WUpd0SpRa+BEuqpuBcC
X-Received: by 2002:a17:90b:528c:b0:38e:7069:7117 with SMTP id 98e67ed59e1d1-39b3d3f7890mr7019686a91.0.1788622544549;
        Sat, 05 Sep 2026 08:35:44 -0700 (PDT)
Received: from fedora.iiita.ac.in ([103.119.35.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26123c99sm10493484a91.11.2026.09.05.08.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:35:44 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	ayushmukkanwar@gmail.com,
	sashiko-bot@kernel.org
Subject: [PATCH 2/2] staging: octeon: fix out-of-bounds reads in tx path
Date: Sat,  5 Sep 2026 21:05:30 +0530
Message-ID: <20260905153530.36693-2-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260905153530.36693-1-ayushmukkanwar@gmail.com>
References: <20260905153530.36693-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1. cvm_oct_xmit() and cvm_oct_xmit_pow() blindly trust
skb->protocol == htons(ETH_P_IP) and dereference the IP header
without verifying if the packet is long enough or if the header
is in the linear skb data area.
Fix by checking if skb_headlen is larger than
skb_network_offset + size of ip header.

2. cvm_oct_xmit_pow() copies packet data into a fixed size
hardware buffer using a hardcoded memcpy() size. If a packet
is smaller than it, memcpy() will read past the end of the
skb buffer. Fix this by using min_t() so that it does not read
past the end of the skb.

Fixes: 80ff0fd3ab64 ("Staging: Add octeon-ethernet driver files.")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260615172734.42038-1-ayushmukkanwar%40gmail.com
Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
Note: This patch has only been compile tested. No runtime testing was
performed as I do not have access to Octeon hardware.

 drivers/staging/octeon/ethernet-tx.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index 5e536827f87a..452bc9fc8a5d 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -361,6 +361,8 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	/* Check if we can use the hardware checksumming */
 	if ((skb->protocol == htons(ETH_P_IP)) &&
+		(skb_network_offset(skb) >= 0) &&
+		(skb_network_offset(skb) + sizeof(struct iphdr) <= skb_headlen(skb)) &&
 	    (ip_hdr(skb)->version == 4) &&
 	    (ip_hdr(skb)->ihl == 5) &&
 	    ((ip_hdr(skb)->frag_off == 0) ||
@@ -571,6 +573,14 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 	work->packet_ptr.s.back = (copy_location - packet_buffer) >> 7;
 
 	if (skb->protocol == htons(ETH_P_IP)) {
+		if (unlikely(!pskb_may_pull(skb, ETH_HLEN + sizeof(struct iphdr)))) {
+			cvmx_fpa_free(packet_buffer, CVMX_FPA_PACKET_POOL, 0);
+			cvmx_fpa_free(work, CVMX_FPA_WQE_POOL, 1);
+			dev->stats.tx_dropped++;
+			dev_kfree_skb_any(skb);
+			return NETDEV_TX_OK;
+		}
+
 		work->word2.s.ip_offset = 14;
 		work->word2.s.tcp_or_udp =
 		    (ip_hdr(skb)->protocol == IPPROTO_TCP) ||
@@ -587,7 +597,7 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 		 * does.
 		 */
 		memcpy(work->packet_data, skb->data + 10,
-		       sizeof(work->packet_data));
+		       min_t(unsigned int, skb->len - 10, sizeof(work->packet_data)));
 	} else {
 		work->word2.snoip.is_rarp = skb->protocol == htons(ETH_P_RARP);
 		work->word2.snoip.is_arp = skb->protocol == htons(ETH_P_ARP);
@@ -596,7 +606,8 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 		work->word2.snoip.is_mcast =
 		    (skb->pkt_type == PACKET_MULTICAST);
 		work->word2.snoip.not_IP = 1;	/* IP was done up above */
-		memcpy(work->packet_data, skb->data, sizeof(work->packet_data));
+		memcpy(work->packet_data, skb->data,
+		       min_t(unsigned int, skb->len, sizeof(work->packet_data)));
 	}
 
 	/* Submit the packet to the POW */
-- 
2.54.0

