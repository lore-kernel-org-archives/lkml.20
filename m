Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839C749E126
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946552; cv=none; b=a5qvZ+4QmceAV5/GqAHe/+xW5a2K5lj8DwS6vEVQ3bYu318jIxbLSNgVbi0ylgtxTbv/KbvpAvxvgunkCA5gAybD/JNoVbWVMzFCJvi8/q3scR4qb/eHyE0y5VMg+0S3NcfGs5jN11Ucbtqn7023GNke3WaGc3VmRHLPa8TYW0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946552; c=relaxed/simple;
	bh=XRS/mWwKrliAe4ZJNPHKE1MWxJyRCL9gWeiisLRjTss=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=LwyyMcxFBPNhXXXkoKVoSOHp3XXyA72N46qN69b+QXgHMpQokkm0GKhuchQONIgtmPMZCfNrZ5vR7Uc9cxjvXygGtmKFz2nMeM4hHoG5J1k4nD0YGpBjK9uQreKr80rfF5y6z833y2v9tnsAJWQhh32vvxQXj20AeSMtXlVy5gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=pOWuN/6A; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="pOWuN/6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1790946538; bh=GamuCfB929C+YoWS5LHLglaWEaj49jBStkDaqp+SB8A=;
	h=From:To:Cc:Subject:Date;
	b=pOWuN/6AnvJ4Bi3vVFZ7XtuEUjTxHNuEI3PJgciJwymfJVbssOCkDffrIAKy+F0VK
	 1vVak87QLaOuABe5CdKnxcF2a5v5uq9lb/TMIQ3Yf+DzYg3dSokli9gqKkiAek58ft
	 AT8GQ6UyaUA7j8r/ht+4NsM0mlSxuNHpcIRuGdio=
Received: from fedora ([2409:8a00:2415:a610:c023:969c:f448:d40e])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 2379FEDF; Fri, 02 Oct 2026 21:08:55 +0800
X-QQ-mid: xmsmtpt1790946535twe9hy9i6
Message-ID: <tencent_41FEF4B2AA27128459C679783AD4D039F207@qq.com>
X-QQ-XMAILINFO: MVuDTlnnQDnq5U9117x1nDdJPS8z8thA9rmd1JdFt1D7XoF0MyYpVD6Z9l7Wwk
	 NXuK+uWNl1APHTABqkOXeHarJTg70CGlhTFgzwTebYkmyLLCNzL52qMxm98AgXvF7KQy08Dz4cxs
	 otguNI5T1wln+DvrsILvihmr6J+/W0d6azdF4fiXSAd3AX90ycTZc6mpiAuBBWmUKVAEu7GEzF7o
	 jLbPsXx6yGW7pNQCQ7uQWKzPA6I65x/4gxQxBorHHwSP/FLkGx0si8R9dnZPo3M9kh3VVF2Kz43e
	 rHCc9ikfOMeZqfqqT/WuuBu+SK6OxA2n5F07cY1nOF/vDynBb5LG1Qblh/vAfWfIyDRQJx8O1tV8
	 IQloIJalavs6VMwWB8NjAy7/BYED/vkrEhJj+aiO6wdWz71KHQKgU0wPKe4TZLSigQHuq2sgidMY
	 U+Lw7oh9uEowRf01nVOQAZmSfgoiI020EFCLjYGH8BG+CldlJtKJu/kYQ/+QsLXy0xrTQWPFJLdI
	 3iIrQbLNft7ejajdLt5ucyLQsWY/86xtLbpSES644dbzLS49fOSN7YkZHqWn6pTCeCdiM18X8dov
	 VruJrGfltZXVnc+rh64leB9KzDAZwBTT8iKvyNB/VzBvNzt8KASVW+Fxu1FXdcxzETNJVlNlmlGk
	 aIQ0ZyEAQwq0dHmVkHgxYbpfc+WenwCiBk7tmwE6OvuU5lq7wP88LIj38oDlV1/495CCP67dNvdv
	 XoY95xi2BWqUfm/54fHvLD1P99hLBLTeQdxzerLib+JpTiX0uXFVIPeoq+0cTfOMCFm5G802pvcP
	 k8v5s2yqQNC1q6JSNC0HqmHHp0r7NhHWMd0/gjcW72ISQnNGNWZihBqNd7MkPRU9vywFefLDZ6GS
	 xRWqRDP+UUkoQUW8Xsa2JXzgrq4Yj5Sp1HenqXx2UMHI/loO/6rsiJGr6xxbgug3fixEpjDl+Rc9
	 06z4ypFvfkVudI0X7OSeVApx/i4J+jTu9A0WGrAC6W5K9K78kCkF9vayg+F6XJboW33L9f15l/o2
	 9aiCYFkbq4WY2htgRYFDBFxCjfDUEqSZ1eu5EAd1WGpqPjegv+0RoNKFzmKWSVPV2fMsvnNuYvo/
	 i9PlBBN7Xvk1YMtquPm2K/DXKcyZI5XZuDmE8UDj9dn0N0TwBOPJsUr78a+g==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Tianbo Fu <3064575448@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: octeon: remove unnecessary parentheses
Date: Sat,  3 Oct 2026 04:51:29 +0800
X-OQ-MSGID: <20261002205144.232853-1-3064575448@qq.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl reports multiple CHECKs for unnecessary parentheses
around single conditions. Remove them to improve readability.

No functional change.

Signed-off-by: Tianbo Fu <3064575448@qq.com>
---
Hi Greg,

I removed some unnecessary parentheses and compiled this on my
x86_64 computer successfully. Please let me know if anything
needs fixing.

Thanks,
Tianbo Fu

---
 drivers/staging/octeon/ethernet-rgmii.c |  2 +-
 drivers/staging/octeon/ethernet-rx.c    |  4 ++--
 drivers/staging/octeon/ethernet-tx.c    | 20 ++++++++++----------
 drivers/staging/octeon/ethernet.c       |  6 +++---
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-rgmii.c b/drivers/staging/octeon/ethernet-rgmii.c
index 0c4fac31540a..15d2c84925ba 100644
--- a/drivers/staging/octeon/ethernet-rgmii.c
+++ b/drivers/staging/octeon/ethernet-rgmii.c
@@ -148,7 +148,7 @@ int cvm_oct_rgmii_open(struct net_device *dev)
 		 */
 		if ((priv->imode == CVMX_HELPER_INTERFACE_MODE_GMII &&
 		     priv->port  == 0) ||
-		    (priv->imode == CVMX_HELPER_INTERFACE_MODE_RGMII)) {
+		    priv->imode == CVMX_HELPER_INTERFACE_MODE_RGMII) {
 			priv->poll = cvm_oct_check_preamble_errors;
 			cvm_oct_check_preamble_errors(dev);
 		}
diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index 5be43bbf6a1d..e3c773e468b5 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -66,7 +66,7 @@ static inline int cvm_oct_check_rcv_error(struct cvmx_wqe *work)
 	else
 		port = work->word1.cn38xx.ipprt;
 
-	if ((work->word2.snoip.err_code == 10) && (work->word1.len <= 64))
+	if (work->word2.snoip.err_code == 10 && work->word1.len <= 64)
 		/*
 		 * Ignore length errors on min size packets. Some
 		 * equipment incorrectly pads packets to 64+4FCS
@@ -321,7 +321,7 @@ static int cvm_oct_poll(struct oct_rx_group *rx_group, int budget)
 			}
 			packet_not_copied = 0;
 		}
-		if (likely((port < TOTAL_NUMBER_OF_PORTS) &&
+		if (likely(port < TOTAL_NUMBER_OF_PORTS &&
 			   cvm_oct_device[port])) {
 			struct net_device *dev = cvm_oct_device[port];
 
diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index cc20c1e6791f..f13069d6bd2c 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -154,8 +154,8 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 	 * completely remove "qos" in the event neither interface
 	 * supports multiple queues per port.
 	 */
-	if ((CVMX_PKO_QUEUES_PER_PORT_INTERFACE0 > 1) ||
-	    (CVMX_PKO_QUEUES_PER_PORT_INTERFACE1 > 1)) {
+	if (CVMX_PKO_QUEUES_PER_PORT_INTERFACE0 > 1 ||
+	    CVMX_PKO_QUEUES_PER_PORT_INTERFACE1 > 1) {
 		qos = GET_SKBUFF_QOS(skb);
 		if (qos <= 0)
 			qos = 0;
@@ -225,7 +225,7 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 	 * no room to add the padding.  The kernel should always give
 	 * us at least a cache line
 	 */
-	if ((skb->len < 64) && OCTEON_IS_MODEL(OCTEON_CN3XXX)) {
+	if (skb->len < 64 && OCTEON_IS_MODEL(OCTEON_CN3XXX)) {
 		union cvmx_gmxx_prtx_cfg gmx_prt_cfg;
 		int interface = INTERFACE(priv->port);
 		int index = INDEX(priv->port);
@@ -360,13 +360,13 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 dont_put_skbuff_in_hw:
 
 	/* Check if we can use the hardware checksumming */
-	if ((skb->protocol == htons(ETH_P_IP)) &&
-	    (ip_hdr(skb)->version == 4) &&
-	    (ip_hdr(skb)->ihl == 5) &&
-	    ((ip_hdr(skb)->frag_off == 0) ||
-	     (ip_hdr(skb)->frag_off == htons(1 << 14))) &&
-	    ((ip_hdr(skb)->protocol == IPPROTO_TCP) ||
-	     (ip_hdr(skb)->protocol == IPPROTO_UDP))) {
+	if (skb->protocol == htons(ETH_P_IP) &&
+	    ip_hdr(skb)->version == 4 &&
+	    ip_hdr(skb)->ihl == 5 &&
+	    (ip_hdr(skb)->frag_off == 0 ||
+	     ip_hdr(skb)->frag_off == htons(1 << 14)) &&
+	    (ip_hdr(skb)->protocol == IPPROTO_TCP ||
+	     ip_hdr(skb)->protocol == IPPROTO_UDP)) {
 		/* Use hardware checksum calc */
 		pko_command.s.ipoffp1 = skb_network_offset(skb) + 1;
 	}
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..9db1fcb894ea 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -262,7 +262,7 @@ static int cvm_oct_common_change_mtu(struct net_device *dev, int new_mtu)
 
 	dev->mtu = new_mtu;
 
-	if ((interface < 2) &&
+	if (interface < 2 &&
 	    (cvmx_helper_interface_get_mode(interface) !=
 		CVMX_HELPER_INTERFACE_MODE_SPI)) {
 		int index = INDEX(priv->port);
@@ -308,7 +308,7 @@ static void cvm_oct_common_set_multicast_list(struct net_device *dev)
 	struct octeon_ethernet *priv = netdev_priv(dev);
 	int interface = INTERFACE(priv->port);
 
-	if ((interface < 2) &&
+	if (interface < 2 &&
 	    (cvmx_helper_interface_get_mode(interface) !=
 		CVMX_HELPER_INTERFACE_MODE_SPI)) {
 		union cvmx_gmxx_rxx_adr_ctl control;
@@ -360,7 +360,7 @@ static int cvm_oct_set_mac_filter(struct net_device *dev)
 	union cvmx_gmxx_prtx_cfg gmx_cfg;
 	int interface = INTERFACE(priv->port);
 
-	if ((interface < 2) &&
+	if (interface < 2 &&
 	    (cvmx_helper_interface_get_mode(interface) !=
 		CVMX_HELPER_INTERFACE_MODE_SPI)) {
 		int i;
-- 
2.55.0

