Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434495;
	b=PW4aGJe2E6dYSO0tV3S8saK7pfOECaxwNjwmXqQxXZF7xBcSzekBDMl2Bp0Yd4S4bFXX
	 Nr/bMEivSxmv+EJShPJqHlkhY6/Ta5hCCcY170r/PpEk9pgX+DAQMuwrCOBQs9/0iG2ca
	 ujH6R7ojeFUWnLhKaN16zqnlJEePJOvV7n16AU3gF76jvWx5XMRqCRRz23eKpIIqNJIha
	 hsntvsGQVELwEP0zlOFb6tzDg7Hu3WiGCPQd3x4ePbnxHKqHPFUPp/p2N3jr6NraAMwlx
	 2zEoA4BabV8I+5/Qwp+K92dTRX1xUla4TvIAAb+/oRRrERmzTHkFoDIZIw5wWy/LyXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LDehY2ey8raTB73kpwdcCBrfjZ1fLoT0KNa2suqSbgA=;
	b=mHP26j0gxJ+BqLtiuYlXIdDm88qMWtTxfkJRVEd+UaVNL5QRFAmciBpYLlgsJ7lqir/A
	 LCttSxoNjFbtguNd+HPjAjVjWkSsQNLgRYEDbwrhuKOKB4lS8ugGaQHFBBFQ1OAvsUM7H
	 rHXemykx967CBcAhG46q2Pp4p7BcxHEpX+UqtsScmxx2B3Rj8H7vCF4ZM8hlce4NapyFI
	 IfgFXYIrJtLBulIhveaR6WvWpz6uoJbbNdbNvOJH8KY/0ceeMSYXufMBBYWpA3e7YTrtC
	 iuDy4aXh28HNoXYGd7YGr7o1ek1F/a4urEx/gWvVgdLm209QuI52TAieScz32TeGGdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y0lXKXpT;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556B060A262F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 556B060A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y0lXKXpT
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5ecda93627eso1121062e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434493; x=1795039293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDehY2ey8raTB73kpwdcCBrfjZ1fLoT0KNa2suqSbgA=;
        b=Y0lXKXpTrMih1yvmwmhNCfqv+mfFDku++DmoYV5yCRcIbaamPy2Nsg9iWGCkgXO5jz
         qQ6wgNBizA4gvL2pMjWBgZNHb0C8F4ZqnDj2BBAxQkUkDCKcrwv8xEdkX9IOJYaWhaXq
         TV1NEOkQp8wjP2k90AgXacCSQ/uFAzieP7+OeYkph1ycXMkZ3H20gI7UBYHRmVAWqXWo
         LblMZOEOVZGzdeQm7oAwjKfsfIc0veD76mtET8H2/9BESedFUSItFPm3O1yneGQzK9us
         Q0+GgRgmToooAUph7RsQ6kuBiHxmK5nudTd8n63HhmvcftTr3N4PRrfF+ylGqHZfDz7T
         YQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434493; x=1795039293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDehY2ey8raTB73kpwdcCBrfjZ1fLoT0KNa2suqSbgA=;
        b=jeEkNZVpGVvIEwox2To+J92W3mVkAVjeOOkMs2h7316SqY6YzcHUPhkSvqVM9vkQN9
         CSYF1Pbxk1FE7vaBhxpWSSb4CmFdYutVQDDIqXt313oa7FUPZSzmC3JQK8LZnzXMHPUN
         Q+l4YNBTmrsNh1Y1XuKiWqX+1ELx4SkyQOmLlJgrTooDr1vU/IyaGdqr2uhM6y9dNPEZ
         61XxShx1yxR3VpgWKB6TtSnjx4/KR0y/Eu9nPerixR7yTe65NxbEybgeQft+4tnXOCOb
         /1NkaDk/BtRRbq2ISuq9T3lFMl1sFO9Vc/d2i7g1ZmdZxamR8a4olSTipsT+VnuhTybV
         4jmg==
X-Forwarded-Encrypted: i=1; AL+hErHiP8s/4q3H3NCZVxd5YQnktU8wMZqlqkvKQC+aAnos7DljF692clCGcWD0mAEt7alxjm9NmZTVtm5WkOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tlibfSOClWOfZTbL+bDUemZ054g+iPK5KeGc1nE/SYCPylmYT
	91B3CMM5F5XXRlzzXz+UbcFiJog+aKJgY/7WCaDf5jIu6jRbTgSZxc8=
X-Gm-Gg: AYBFou27RgkeTBjIpLoteBqNzf7QBmV3+s8igSWCOmu9srpWSsOYedMXa8BEvivDeHq
	mAtKKjtuYgfiVMiViARTrdYSSqwDYoIOnhFrLZy1e/1PQ9qJpo61QflW3zJBm6VjkOdH+p9oO7p
	621fEXmyekhy6I+tKr+q3dhUju71MDvoaArLGuelO0RMu7whYsJr9/R2lbsMD5E2wBLXJCVBIZI
	LglIDV535GfM6Ny5zVQ5tibeV24cTxo2Kqh6kduF7LH/wZFnykDPVPo3FlDaMbHX3wtY3Ix+97q
	B6BHdOBm0iA6UBRtnt3n6oCt6Gfds9MWorr3mK4WYS1oWvBHToNFFyD9hqKhtn1Z1qwDKK3S/SO
	HfqtAPBQltVEknZ9g69h81Ab6VtjBou7VhSZLyNAgzvXTmDPxw/QIBzDMgGIw6A7C1LIojONsor
	xQeL2xZiPvuvrwDd6hMhyJYIpfj0CVHj2uxiuzF4MGPZdwI3xZsP5X6CnAKtlo/BBrp6VLTdEPy
	4kwmIk2lVuFTNieyeMEK9lVVCC+ZMxJUh6zEb6+oIKHYMdjypAMRrcho4zXjP1AyY/MUppo49AT
	cYOn9m58V89tuYrZItANvoLFOOOZ
X-Received: by 2002:a05:6122:510:b0:5ec:4112:6839 with SMTP id 71dfb90a1353d-5ee1c43fe48mr1334532e0c.15.1794434493132;
        Wed, 11 Nov 2026 14:01:33 -0800 (PST)
Received: from Ixchel.lan ([70.49.63.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe63asm4557992241.4.2026.11.11.14.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:01:32 -0800 (PST)
From: Vlad Banea <montrealtango@gmail.com>
To: netdev@vger.kernel.org
Cc: hkallweit1@gmail.com,
	javen_xu@realsil.com.cn,
	nic_swsd@realtek.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [RFC net-next 2/5] r8169: describe the vector-map interrupt layout per chip
Date: Wed, 11 Nov 2026 17:01:11 -0500
Message-ID: <20261111220114.3863505-3-montrealtango@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111220114.3863505-1-montrealtango@gmail.com>
References: <20261111220114.3863505-1-montrealtango@gmail.com>
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

The vector-map interrupt model hard-codes the RTL8127A's MSI-X layout.
Other chips put the TX and link change vectors elsewhere, so move the
layout into a per-chip struct rtl_vec_map.

No functional change.

Signed-off-by: Vlad Banea <montrealtango@gmail.com>
---
 drivers/net/ethernet/realtek/r8169_main.c | 79 ++++++++++++++---------
 1 file changed, 48 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index 6bd137358d1f..a77bbedc8c02 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -81,8 +81,6 @@
 #define R8169_MAX_RX_QUEUES	8
 #define R8169_DEFAULT_RX_QUEUES	1
 #define R8169_MAX_TX_QUEUES	1
-#define R8127_MAX_NUM_IRQVEC	32
-#define R8127_MIN_NUM_IRQVEC	30
 #define R8169_IRQ_DEFAULT	1
 #define RTL_RSS_KEY_SIZE	40
 #define RSS_CPU_NUM_MASK	GENMASK(18, 16)
@@ -489,7 +487,6 @@ enum rtl8125_registers {
 	IMR_SET_VEC_MAP_REG	= 0x0d0c,
 };
 
-#define MSIX_ID_VEC_MAP_LINKCHG	29
 #define LEDSEL_MASK_8125	0x23f
 
 #define RX_VLAN_INNER_8125	BIT(22)
@@ -623,9 +620,6 @@ enum rtl_register_content {
 
 	/* magic enable v2 */
 	MagicPacket_v2	= (1 << 16),	/* Wake up when receives a Magic Packet */
-#define	ISRIMR_LINKCHG	BIT(29)
-#define	ISRIMR_TOK_Q0	BIT(8)
-#define	ISRIMR_ROK_Q0	BIT(0)
 #define RTL_DESC_TYPE_CTRL		0xd8
 #define RSS_KEY_REG			0x4600
 #define RSS_INDIRECTION_TBL_REG		0x4700
@@ -843,6 +837,23 @@ enum rtl_sfp_mode {
 	RTL_SFP_8127_ATF,
 };
 
+/* Vector-map MSI-X layout. RX queue N uses vector N; a source's bit in
+ * the vector-map IMR/ISR registers is its vector number.
+ */
+struct rtl_vec_map {
+	u8 tx;		/* TX completion */
+	u8 linkchg;	/* link change */
+	u8 min_nvecs;	/* vectors that must be allocated */
+	u8 max_nvecs;
+};
+
+static const struct rtl_vec_map rtl_vec_map_8127 = {
+	.tx		= 8,
+	.linkchg	= 29,
+	.min_nvecs	= 30,
+	.max_nvecs	= 32,
+};
+
 struct rtl8169_rss_data {
 	u8 rss_key[RTL_RSS_KEY_SIZE];
 	u8 rss_indir_tbl[RTL_MAX_INDIRECTION_TABLE_ENTRIES];
@@ -871,6 +882,7 @@ struct rtl8169_private {
 	unsigned int hw_supp_num_rx_queues;
 	struct rtl8169_rss_data *rss_data;
 	unsigned int irq_nvecs;
+	const struct rtl_vec_map *vec_map;	/* NULL: single vector only */
 	enum rx_desc_type init_rx_desc_type;
 	struct clk *clk;
 	int speed;
@@ -4755,7 +4767,7 @@ static void rtl8169_napi_disable(struct rtl8169_private *tp)
 	if (tp->irq_nvecs > 1) {
 		for (int i = 0; i < tp->num_rx_rings; i++)
 			napi_disable(&tp->rtl8169_napi[i]);
-		napi_disable(&tp->rtl8169_napi[R8169_MAX_RX_QUEUES]);
+		napi_disable(&tp->rtl8169_napi[tp->vec_map->tx]);
 	} else {
 		napi_disable(&tp->rtl8169_napi[0]);
 	}
@@ -4766,7 +4778,7 @@ static void rtl8169_napi_enable(struct rtl8169_private *tp)
 	if (tp->irq_nvecs > 1) {
 		for (int i = 0; i < tp->num_rx_rings; i++)
 			napi_enable(&tp->rtl8169_napi[i]);
-		napi_enable(&tp->rtl8169_napi[R8169_MAX_RX_QUEUES]);
+		napi_enable(&tp->rtl8169_napi[tp->vec_map->tx]);
 	} else {
 		napi_enable(&tp->rtl8169_napi[0]);
 	}
@@ -5535,9 +5547,9 @@ static void rtl8169_free_one_irq(struct rtl8169_private *tp, int i)
 	napi = &tp->rtl8169_napi[i];
 
 	if (tp->irq_nvecs > 1) {
-		if (i < tp->num_rx_rings || i == R8169_MAX_RX_QUEUES)
+		if (i < tp->num_rx_rings || i == tp->vec_map->tx)
 			free_irq(irq, napi);
-		else if (i == MSIX_ID_VEC_MAP_LINKCHG)
+		else if (i == tp->vec_map->linkchg)
 			free_irq(irq, tp);
 	} else {
 		free_irq(irq, napi);
@@ -5591,7 +5603,7 @@ static irqreturn_t rtl8169_interrupt_other(int irq, void *dev_instance)
 {
 	struct rtl8169_private *tp = dev_instance;
 
-	rtl8169_clear_hw_isr(tp, MSIX_ID_VEC_MAP_LINKCHG);
+	rtl8169_clear_hw_isr(tp, tp->vec_map->linkchg);
 	if (tp->phydev)
 		phy_mac_interrupt(tp->phydev);
 	else if (tp->sfp_mode)
@@ -5615,11 +5627,11 @@ static int rtl8169_request_irq(struct rtl8169_private *tp)
 		irq = pci_irq_vector(pdev, i);
 
 		if (tp->irq_nvecs > 1) {
-			/* RX: 0~7, TX: 8*/
-			if (i < tp->num_rx_rings || i == R8169_MAX_RX_QUEUES)
+			/* RX queue N on vector N, TX and link at vec_map */
+			if (i < tp->num_rx_rings || i == tp->vec_map->tx)
 				rc = request_irq(irq, rtl8169_interrupt_msix,
 						 irqflags, dev->name, napi);
-			else if (i == MSIX_ID_VEC_MAP_LINKCHG)
+			else if (i == tp->vec_map->linkchg)
 				rc = request_irq(irq, rtl8169_interrupt_other,
 						 irqflags, dev->name, tp);
 			else
@@ -5805,7 +5817,7 @@ static void rtl8169_netpoll(struct net_device *dev)
 	if (tp->irq_nvecs > 1) {
 		for (int i = 0; i < tp->num_rx_rings; i++)
 			rtl8169_interrupt_msix(0, &tp->rtl8169_napi[i]);
-		rtl8169_interrupt_msix(0, &tp->rtl8169_napi[R8169_MAX_RX_QUEUES]);
+		rtl8169_interrupt_msix(0, &tp->rtl8169_napi[tp->vec_map->tx]);
 	} else {
 		rtl8169_interrupt(0, &tp->rtl8169_napi[0]);
 	}
@@ -6034,7 +6046,7 @@ static void r8169_free_napi(struct rtl8169_private *tp)
 	if (tp->irq_nvecs > 1) {
 		for (int i = 0; i < tp->num_rx_rings; i++)
 			netif_napi_del(&tp->rtl8169_napi[i]);
-		netif_napi_del(&tp->rtl8169_napi[R8169_MAX_RX_QUEUES]);
+		netif_napi_del(&tp->rtl8169_napi[tp->vec_map->tx]);
 	} else {
 		netif_napi_del(&tp->rtl8169_napi[0]);
 	}
@@ -6091,9 +6103,9 @@ static const struct net_device_ops rtl_netdev_ops = {
 static void rtl_set_irq_mask(struct rtl8169_private *tp)
 {
 	if (tp->irq_nvecs > 1) {
-		tp->irq_mask = ISRIMR_LINKCHG | ISRIMR_TOK_Q0;
+		tp->irq_mask = BIT(tp->vec_map->linkchg) | BIT(tp->vec_map->tx);
 		for (int i = 0; i < tp->num_rx_rings; i++)
-			tp->irq_mask |= ISRIMR_ROK_Q0 << i;
+			tp->irq_mask |= BIT(i);
 	} else {
 		tp->irq_mask = RxOK | RxErr | TxOK | TxErr | LinkChg;
 
@@ -6102,18 +6114,24 @@ static void rtl_set_irq_mask(struct rtl8169_private *tp)
 	}
 }
 
+static const struct rtl_vec_map *rtl_get_vec_map(struct rtl8169_private *tp)
+{
+	switch (tp->mac_version) {
+	case RTL_GIGA_MAC_VER_80:
+		return &rtl_vec_map_8127;
+	default:
+		return NULL;
+	}
+}
+
 static int get_max_irq_nvecs(struct rtl8169_private *tp)
 {
-	if (tp->mac_version == RTL_GIGA_MAC_VER_80)
-		return R8127_MAX_NUM_IRQVEC;
-	return R8169_IRQ_DEFAULT;
+	return tp->vec_map ? tp->vec_map->max_nvecs : R8169_IRQ_DEFAULT;
 }
 
 static int get_min_irq_nvecs(struct rtl8169_private *tp)
 {
-	if (tp->mac_version == RTL_GIGA_MAC_VER_80)
-		return R8127_MIN_NUM_IRQVEC;
-	return R8169_IRQ_DEFAULT;
+	return tp->vec_map ? tp->vec_map->min_nvecs : R8169_IRQ_DEFAULT;
 }
 
 static void rtl8169_set_rx_ring_num(struct rtl8169_private *tp)
@@ -6727,10 +6745,8 @@ static int rtl8169_poll_msix_tx(struct napi_struct *napi, int budget)
 	return 0;
 }
 
-/* RTL8127 MSI-X vector layout:
- * Vectors 0 .. (MAX_RXQ - 1)			: Rx Queues
- * Vectors MAX_RXQ .. (MAX_RXQ + MAX_TXQ - 1)	: Tx Queues
- * NAPI is only allocated for data path
+/* Vector-map MSI-X: RX queue N on vector N, TX and link change on the
+ * chip's vec_map vectors. NAPI is only allocated for the data path.
  */
 static void r8169_init_napi(struct rtl8169_private *tp)
 {
@@ -6744,10 +6760,10 @@ static void r8169_init_napi(struct rtl8169_private *tp)
 					   pci_irq_vector(tp->pci_dev, i));
 		}
 		netif_napi_add_tx(tp->dev,
-				  &tp->rtl8169_napi[R8169_MAX_RX_QUEUES],
+				  &tp->rtl8169_napi[tp->vec_map->tx],
 				  rtl8169_poll_msix_tx);
-		netif_napi_set_irq(&tp->rtl8169_napi[R8169_MAX_RX_QUEUES],
-				   pci_irq_vector(tp->pci_dev, R8169_MAX_RX_QUEUES));
+		netif_napi_set_irq(&tp->rtl8169_napi[tp->vec_map->tx],
+				   pci_irq_vector(tp->pci_dev, tp->vec_map->tx));
 	} else {
 		netif_napi_add(tp->dev, &tp->rtl8169_napi[0], rtl8169_poll);
 		netif_napi_set_irq(&tp->rtl8169_napi[0],
@@ -6913,6 +6929,7 @@ static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	rtl_hw_reset(tp);
 
 	rtl_setup_rx_params(tp);
+	tp->vec_map = rtl_get_vec_map(tp);
 
 	rc = rtl_alloc_irq(tp);
 	if (rc < 0)
-- 
2.53.0

