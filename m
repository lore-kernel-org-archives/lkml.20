Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78DF556BBC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924343; cv=none; b=Wd3drDkELXH4d8BBKTPctCWpd+kEjbJoqY2ds/Y6Q1Wayd3U7lG0jjXwEf7NruvsNJzKyHdsRBWrnnyidFPpeCpg+lTVNt6rjmPB0FOhxU+5hWT3anDSVqZWOE4Ai7SBzLyp5+JzBIs1IHDgoZgAUX+On59BMbeesFrXyjQHU7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924343; c=relaxed/simple;
	bh=0BgAVYlymJMII0VGNR6T79dO0Vsgbex65fcphmm3SgU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rsDPShgodPEJVW4uzxISor0ZgaiW/r4ft+E/9RxX5R4xThta4aVhHR0dCmIWiJInpBTWzhnDj8blcUns6ituaLu/DwIHnQCBBUbwTw+ddFMqEtX1VokC81ZBJkqEm6HlSHRl0xnBruDHxP3rnk3+2qgk1Fy4BmVhnVEbBLcgAlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=aCWDO5E9; arc=none smtp.client-ip=209.85.222.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="aCWDO5E9"
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93e55db58cfso344360785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924341; x=1792529141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0qT31SDh86SWXXSgmpic+OSeenZgL4DO9M+aCZaoqs=;
        b=0940fBf747HBpEwqskRXBeOyZIK0NDEZSV+Wp0104u6V4msn7tLnj33AxiR8ipe96w
         /EhAmzf5U8FbOkjeaJzknCUYIWqI3wnjEA2v8e7RxxRmYTHgoHENNhAuss0aqAv1rSwM
         jpRy46L4YcE/zFn+tzRgyOooahoxxo2N71kk5aY00h21kplhzD6IEF+8CYyl6XoE3Zvp
         /DxMdnC+5P2Jx6bORdBuV3xDsVu2J6ZRJbrg34wgWh97YGgdvpqYyYpd1HMfrPqoM2ax
         rblrgaWmKgV8gxCNCYzrAoxM0fZPWa1dRdq25o26yuyAyxpvzJmik/GbOMkjKBitROkT
         Q/9A==
X-Forwarded-Encrypted: i=1; AKwUvBy5ruczsaLX+7MP8H9NViAGWZ1ip1ok05Ys6Av4REaoK/SavAiLOvvZqg0djhMukQ1l9K/2/3pKz1Vj+Ks=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzrJudPqe0NT8aG3lDQlX3vOObznphd960GPwOddaBXFwpzK6X
	mA4UVdx7p5GEt9Unz0QdwLq+Is6cv03MRCyteTW0ZNXZ00+rzUM3JbwKZjYRjgTmKbav43RgcBH
	tB2I4EeCUiypLKwvwmw+fB+CefQeWGrHWggLJKww58aQ6EBq8KU49pwlFwQn7Wx4tj62n/kEAzR
	H6oBk691Mknaajkt7uY1K4h8sVsMNcJoX98rv4u8aEq5OrQykuAa9Ij/8x+7uy9HZbPX5g232/b
	NqgUAmE6hSSpLAxdLj+jo6A
X-Gm-Gg: AYBFou3zgORAX/6QG9JH+PNmabePM2jZLOE38UKertgw77yCWBdnBCGnwqmX1lCH9I7
	nsjmDmim5LYWUXaLZPjVOjjNTN/GuHwmihOBOXXKFYVmnSVs3Uz8ZaowbYzpRcSt094A3CsiWO+
	KQq04aYQHSPPMpIj26Le+2Ra7qSIweZSjZ+mRtmwHSEybG8cjx2ss5o8xXOfRV6vSK/qatLoQ+7
	Vf/DbBaz7qy+asVelduq+3x8e1fYkwFVAXLb4fQ0doujiN/hs0ZJCbn+NBW8ltQXj1cYkHcLHAx
	wE0/hAc0XUsgOxVIxgs5IhIOTPwVA3KoupQSlovM8h6FcbkW1vsIkuk7unhc241fjjasSID93tD
	eFVNmin/ovWuufdMYZ3Cw9DrqIP7RvFSRPwytTQXx5jCJ33R5/d9La+JvJMx8eN5LBD4OZMx4gm
	0wePIePAvoFJpv/ev5e+Ohg/4hZXcDy+96WIgQJIwWnmQ=
X-Received: by 2002:a05:620a:4693:b0:93e:6064:8996 with SMTP id af79cd13be357-93ebd0c3204mr2350336085a.8.1791924340638;
        Tue, 13 Oct 2026 13:45:40 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93ef50420c9sm77205985a.9.2026.10.13.13.45.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:45:40 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53513d2a70eso76774691cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791924340; x=1792529140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0qT31SDh86SWXXSgmpic+OSeenZgL4DO9M+aCZaoqs=;
        b=aCWDO5E94m+KJD3Ob78aP1eeEX0F0cEnKR0YoKvi+bNqJ+SJqWW2czNMtTyTsJT9Nm
         PqpA+Crl7AulPz1tbjqTEKpxTMLujjMACp6b7c3oQgJEoPwRyqoNMJSUgnieZfxRZzXU
         LyBsI+8EG1901p9CrxsKEBRtIitA7s1YT1zXs=
X-Forwarded-Encrypted: i=1; AKwUvBx8OUXCPNVZozFmt2YD5AOQQAbRmgWgN/1T7XcAbLTcRTan20k8xSXsrp4zPlhmYp/7nZaciO5TjrRqU58=@vger.kernel.org
X-Received: by 2002:ac8:59d6:0:b0:530:b2e4:91c1 with SMTP id d75a77b69052e-5359fdf3dbcmr212167811cf.58.1791924339685;
        Tue, 13 Oct 2026 13:45:39 -0700 (PDT)
X-Received: by 2002:ac8:59d6:0:b0:530:b2e4:91c1 with SMTP id d75a77b69052e-5359fdf3dbcmr212167451cf.58.1791924339085;
        Tue, 13 Oct 2026 13:45:39 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535f4eee7bcsm15879231cf.30.2026.10.13.13.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:45:37 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Justin Chen <justin.chen@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Zak Kemble <zakkemble@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Nicolai Buchwitz <nb@tipi-net.de>
Subject: [PATCH net v3 RESEND 5/6] net: bcmasp: account for offload header in TX short packet padding
Date: Tue, 13 Oct 2026 13:44:38 -0700
Message-Id: <20261013204439.3494046-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013204439.3494046-1-florian.fainelli@broadcom.com>
References: <20261013204439.3494046-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

When hardware checksum offload is enabled for an skb,
bcmasp_csum_offload() prepends a struct bcmasp_pkt_offload header
(20 bytes) to the skb via skb_push(). This increases skb->len and
skb_headlen(skb) by sizeof(struct bcmasp_pkt_offload).

Because the hardware descriptor processor strips this offload header
before transmitting the packet on the wire, the wire packet length is
smaller by sizeof(struct bcmasp_pkt_offload). The padding calculation
must account for this extra header; otherwise, short frames are sent on
the wire smaller than the minimum Ethernet frame size (ETH_ZLEN +
ETH_FCS_LEN).

Furthermore, small frames with payload in page fragments (such as small
TCP segments with CHECKSUM_PARTIAL) have nr_frags > 0 and were skipping
padding entirely because the padding check was restricted to
nr_frags == 0.

Perform the padding check on skb->len before the descriptor loop using
skb_put_padto(), adding sizeof(struct bcmasp_pkt_offload) to min_size
when checksum offload is enabled, and re-read nr_frags after padding in
case the skb was linearized.

Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
Assisted-by: LLM
Reviewed-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../net/ethernet/broadcom/asp2/bcmasp_intf.c    | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c b/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
index 693e8cdfe960..a855e637b6f0 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
@@ -236,7 +236,7 @@ static struct sk_buff *bcmasp_csum_offload(struct net_device *dev,
 static netdev_tx_t bcmasp_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct bcmasp_intf *intf = netdev_priv(dev);
-	unsigned int total_bytes, size;
+	unsigned int total_bytes, size, min_size;
 	int spb_index, nr_frags, i, j;
 	struct bcmasp_tx_cb *txcb;
 	dma_addr_t mapping, valid;
@@ -262,16 +262,21 @@ static netdev_tx_t bcmasp_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (!skb)
 		return NETDEV_TX_OK;
 
+	min_size = ETH_ZLEN + ETH_FCS_LEN;
+	if (csum_hw)
+		min_size += sizeof(struct bcmasp_pkt_offload);
+
+	if (skb->len < min_size) {
+		if (skb_put_padto(skb, min_size))
+			return NETDEV_TX_OK;
+		nr_frags = skb_shinfo(skb)->nr_frags;
+	}
+
 	spb_index = intf->tx_spb_index;
 	valid = intf->tx_spb_dma_valid;
 	for (i = 0; i <= nr_frags; i++) {
 		if (!i) {
 			size = skb_headlen(skb);
-			if (!nr_frags && size < (ETH_ZLEN + ETH_FCS_LEN)) {
-				if (skb_put_padto(skb, ETH_ZLEN + ETH_FCS_LEN))
-					return NETDEV_TX_OK;
-				size = skb->len;
-			}
 			mapping = dma_map_single(kdev, skb->data, size,
 						 DMA_TO_DEVICE);
 		} else {
-- 
2.34.1

