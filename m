Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668054;
	b=lXm8Pm/PjNNRkrri189QSyOf45JMeDJCkKao+6RAEknpTmzZ7APclPJHK9ljZKljUJ9Z
	 tNfhHyX6SiDJNPfLB9b8XYOzcqOegI/kjCxW39jLPHXVhf136IdN0iBS5FW49lZro+tR6
	 mc9bC+q39VZMGD/RdrOPYX/l2r4sXZp+2KQ/AlxNdv8x5D79SIBJ+vcHgVWCFmFQSAiGt
	 dHaDtBiK7aIaZt0qNUk0/m5Ark8pf/jMzF6GFt0CXWBGILr+KUqo7EMH/xDSWRCWJubR7
	 S6t7p3w8DjjRyXPlpSW/JI8jhaqA2puVt5zcr56LI/U5OQzOmdEW1pao1uBUtm8qDAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=rgRd2KV6kD1NlWNz1iQZ1uAx06L1PCjsN94PDtPnamo=;
	b=XIuNiYbqkPyHlu4rMskm4mKdn07lAsGuUBAJXObXj+JT7vstozgFjhWfNXdX6Bl0RTrc
	 5nZTGS41Y+tGtYpUUFBIGKQfPnTeLQr1Burme2NIg3DDYEN244n2O7ivcYHAiHqxJP3ZM
	 wu52uZ2iQUGZG2QcevfIJHe5XEVw8MkRSyRCX9+vVTGM1Bv9Zzr/hougtTK7XfmWLknYp
	 6J4ikiw9NT6lARUvwG7v2kvBKJ10qgA8roLlFjLnj99qoo9vOgWkSr32+CvFVU0k6383W
	 56xTu88abSFg0Mt4zQ9dvI65Ec6+UC6GOE+XDxNv8jeTol0UTCbiIaXMQXQ52toQNQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OVeXZpU1;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34E1606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E34E1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OVeXZpU1
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-843cf077f10so4316391a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793668053; x=1794272853; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rgRd2KV6kD1NlWNz1iQZ1uAx06L1PCjsN94PDtPnamo=;
        b=OVeXZpU1pHTrFk6hsiE25uJUry6d6qqzgIE0wtg9KD/YQFUOwqgvq3Aklp3whw/D7a
         coaSsTCKbZWtg/VyITUwR3KFSPIsLkYqLcltyODOdJfyZyIttEZHMiTzPEGmCnMfRxCX
         6bhObHJAD+hf3sRkX3d841m+lvSce/MVB8vvrgl8+UfJWk2tM8uYxme771d7MWcXWU6R
         kR/45Aqx0x7bx54ellAqYc8Cf45ACFl5HE+ZHm/7ZwZfdf0WF/qtOhy6hyVFIik7L6w1
         offUDNAG9K6Msh0Gqjm3Oo/bCBKMlEaQY+9nwVpd2loyMZKHFcQAij0jsm7x0vrV9b4t
         BL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668053; x=1794272853;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rgRd2KV6kD1NlWNz1iQZ1uAx06L1PCjsN94PDtPnamo=;
        b=PFmdf+/yxQlsiy5oSO4i0xYEXzF6hb9rekt/x4iIJyh1ufjZjN5FmO0VDuDDvtxm3M
         cNeTfKYf4zJrRe843mxC+rjLc0Lm7E7APBecWQBT3N8qNxT4A2UqgTSI1OgIQzeteAYj
         FJWxr+jEKuo+xyl30qkdRCBTSC9wEHm0LWfPXKs1WKQH3Qa1LU/BNpRbTiIgPDsrVH1n
         m5tQHGi37V/Gp1M3w8UaGz92Akhe8iCaNdMfLw3KnC/XOpltA3sG0OwiUKgpofB3O9RQ
         F/xO4nNtECAnqiH9G+A1HT504EI8WvbMgYt+Q0TfwbczeTNREt7Sd0yfqkcHqmScseGI
         oirw==
X-Forwarded-Encrypted: i=1; AKwUvBwAnzjNfZZl2V9j9Kp+SiF6uhamEle28uNt/t1UOcG0nbjwNBVKPIcWepf1ZLs2JXSNNN7Vkm+ZW4NUQ3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAjEoUlbBGDUnNzKz0uA5ycXX76RvHvdzbzd30ffpScm+th2uq
	qwRCupHrnoRk4ByEQXoGZ5lGw9azhI1R2LJ+Ik1xqps7COjJbVrG5HtD
X-Gm-Gg: AYBFou1ggK9BddFonXrkp04+JMTvFnfyOmUeUZxe1PHw8xrHanZpnoc90a3O+xskVk2
	CF/SI4WUjrFnnnQWGEvriFsu6tcOq2ZP9nKRNcx9cmyEwz2LAYzD7Fg66JDoAGYgmhnXGNs+c4l
	9l+FiabOtEwqKxwMqaXKVkOh8Nj9fUx8aVfuEGh/bg//Y1qZtQwaIiKnpyUTYk/Y9DNFg5AIdBN
	uCEOtxrOpjuS7O7DzIsHOj5yVrMs5DiewbVGKxJtcVM0Nx6xF4/BJy8O/DuRT3rLNrOLbTbH7KX
	4LjUl+AKziZ5Bp92m0Oz3DWHbSXa4QufRvFB8ScePbYKDjXXHLQLVNqX/wbHK+rPHNpJ142e9PJ
	GlUjV2R/NVSqg6W5Cq8jb2jUB+qf4CUJlfIyAHr8kRR5BIZPJFgDQXT/crhoWg3sDrURqdlpjrt
	YQtA0uyu+UposLtS9wt2Ru6oWKmliiFoaHVkp20qgOQNKrFoT/H8y3KmyGGO55dXM0KUEh7naLG
	26WvXnMrTpi3fn9AlQ4VLbnfPPt7Bzn04XGJohxNSgyTs3wZrw2dX0ioZ/XVZCGGPssvaiBNbfX
	t9JkkG4eiSVkkAI4N7i0dc2pcYp79fyr0sPRdcUgNwlDyTIHmgKCAEhTE1Wq4chiLa2KgQ8/BcL
	dWPLRXbG2eboas/IdsEh0TC/O4kVro1Qcs9eYt8ulBZyEaGG3Yyy9tuKGcdFXbRLJ01mTp4QsRp
	mP6QsORi4TD24x8Lty6rhTVAFhKAKHMrAUj363DaBjI7Od1TNClz1W
X-Received: by 2002:a05:6808:f0d:b0:54c:d3dc:b544 with SMTP id 5614622812f47-5640de7a69cmr7834429b6e.32.1793668052739;
        Mon, 02 Nov 2026 17:07:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56523cdd0ffsm430286b6e.8.2026.11.02.17.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:07:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 18:07:30 -0700
Subject: [PATCH net] net: stmmac: rebuild VLAN priority steering when
 filters change
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-stmmac-vlan-prio-v1-v1-1-2b37767e4e08@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBA0auUWTuQCbWKVxEXMU50xKQlE0Oh9
 O7Gdvn/4i2gnIUVLt0CmauojKkFHTrwL5eejPJoDdbYgchY1O89SkEtMTqP9eMSTllGrIRnPob
 h1AeyhqABU+Yg84ZfIXGB2z4b8WZf/iys6w+XZMbbgwAAAA==
X-Change-ID: 20261102-submit-stmmac-vlan-prio-v1-8e5f674f1201
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Piotr Wejman <piotrwejman90@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The RX queue priority callbacks preserve previously assigned priorities.
Passing zero from tc_del_vlan_flow() therefore leaves the deleted rule's
priority mapped to its RX queue. Clearing the whole queue instead would
also remove priorities belonging to other installed rules.

Save each VLAN rule's priority and rebuild the complete per-queue masks
after insertion and deletion, starting from the platform assignments.
Resolve overlapping platform masks with the same last-queue-wins ordering
used during initialization.

Make the GMAC4 and XGMAC callbacks replace the target queue's mask while
retaining their exclusion of its priorities from other queues. Program a
priority's new destination before clearing its previous assignment.

Keep VLAN rules in programming order. Flower installs a replacement under
a new cookie before deleting the old one, so the newer assignment must
remain effective while both are present, including when an earlier array
slot is reused. Removing a rejected replacement restores the older rule,
and removing the last override restores the platform assignment.

Reoffloading an existing cookie reuses its entry without incrementing the
rule count. Validate the selected RX queue before indexing the masks:
tc_classid_to_hwtc() checks the number of traffic classes, which can exceed
the number of RX queues.

Found by code inspection while working on STMMAC reset/recovery fixes.
Host-side tests exercising the driver's VLAN rule handlers and priority
callbacks with mocked MMIO reproduce the stale mapping after deletion
and pass with this fix. No hardware testing was performed.

Fixes: b3da86d432b7 ("net: stmmac: fix rx queue priority assignment")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  2 +
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  4 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    | 54 +++++++++++++++++++---
 4 files changed, 56 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 259e2ebed8c1..efbe2ec4c213 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -126,6 +126,7 @@ static void dwmac4_rx_queue_priority(struct mac_device_info *hw,
 	 * clear them from others queues
 	 */
 	if (queue < 4) {
+		ctrl2 &= ~GMAC_RXQCTRL_PSRQX_MASK(queue);
 		ctrl2 |= (prio << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
 						GMAC_RXQCTRL_PSRQX_MASK(queue);
 
@@ -134,6 +135,7 @@ static void dwmac4_rx_queue_priority(struct mac_device_info *hw,
 	} else {
 		queue -= 4;
 
+		ctrl3 &= ~GMAC_RXQCTRL_PSRQX_MASK(queue);
 		ctrl3 |= (prio << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
 						GMAC_RXQCTRL_PSRQX_MASK(queue);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 1a88cbaed70c..7ad08651675e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -119,6 +119,7 @@ static void dwxgmac2_rx_queue_prio(struct mac_device_info *hw, u32 prio,
 	 * clear them from others queues
 	 */
 	if (queue < 4) {
+		ctrl2 &= ~XGMAC_PSRQ(queue);
 		ctrl2 |= (prio << XGMAC_PSRQ_SHIFT(queue)) &
 						XGMAC_PSRQ(queue);
 
@@ -127,6 +128,7 @@ static void dwxgmac2_rx_queue_prio(struct mac_device_info *hw, u32 prio,
 	} else {
 		queue -= 4;
 
+		ctrl3 &= ~XGMAC_PSRQ(queue);
 		ctrl3 |= (prio << XGMAC_PSRQ_SHIFT(queue)) &
 						XGMAC_PSRQ(queue);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b76acfe0d958..fcc395321816 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -14,6 +14,7 @@
 #include <linux/clk.h>
 #include <linux/hrtimer.h>
 #include <linux/if_vlan.h>
+#include <linux/list.h>
 #include <linux/stmmac.h>
 #include <linux/phylink.h>
 #include <linux/pci.h>
@@ -210,6 +211,8 @@ enum stmmac_rfs_type {
 struct stmmac_rfs_entry {
 	unsigned long cookie;
 	u16 etype;
+	u8 vlan_prio;
+	struct list_head vlan_node;
 	int in_use;
 	int type;
 	int tc;
@@ -382,6 +385,7 @@ struct stmmac_priv {
 	unsigned int rfs_entries_cnt[STMMAC_RFS_T_MAX];
 	unsigned int rfs_entries_total;
 	struct stmmac_rfs_entry *rfs_entries;
+	struct list_head vlan_prio;
 
 	/* Pulse Per Second output */
 	struct stmmac_pps_cfg pps[STMMAC_PPS_MAX];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 10b61fa2c27c..6707f7621f3b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -250,6 +250,8 @@ static int tc_rfs_init(struct stmmac_priv *priv)
 	if (!priv->rfs_entries)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&priv->vlan_prio);
+
 	dev_info(priv->device, "Enabled RFS Flow TC (entries=%d)\n",
 		 priv->rfs_entries_total);
 
@@ -685,6 +687,41 @@ static struct stmmac_rfs_entry *tc_find_rfs(struct stmmac_priv *priv,
 
 #define VLAN_PRIO_FULL_MASK (0x07)
 
+static void tc_update_vlan_prio(struct stmmac_priv *priv, u8 prio)
+{
+	u8 prios[MTL_MAX_RX_QUEUES] = {};
+	struct stmmac_rfs_entry *entry;
+	unsigned int queue, i;
+
+	/* Restore platform assignments with the same precedence as setup. */
+	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++) {
+		if (!priv->plat->rx_queues_cfg[queue].use_prio)
+			continue;
+
+		prios[queue] = priv->plat->rx_queues_cfg[queue].prio;
+		for (i = 0; i < queue; i++)
+			prios[i] &= ~prios[queue];
+	}
+
+	/*
+	 * Flower installs a replacement before destroying the old cookie.
+	 * Preserve the latest assignment while both rules are present.
+	 */
+	list_for_each_entry(entry, &priv->vlan_prio, vlan_node) {
+		for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++)
+			prios[queue] &= ~entry->vlan_prio;
+		prios[entry->tc] |= entry->vlan_prio;
+	}
+
+	/* Install the new assignment before clearing the previous queue. */
+	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++)
+		if (prios[queue] & prio)
+			stmmac_rx_queue_prio(priv, priv->hw, prios[queue], queue);
+	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++)
+		if (!(prios[queue] & prio))
+			stmmac_rx_queue_prio(priv, priv->hw, prios[queue], queue);
+}
+
 static int tc_add_vlan_flow(struct stmmac_priv *priv,
 			    struct flow_cls_offload *cls)
 {
@@ -700,7 +737,7 @@ static int tc_add_vlan_flow(struct stmmac_priv *priv,
 			return -ENOENT;
 	}
 
-	if (priv->rfs_entries_cnt[STMMAC_RFS_T_VLAN] >=
+	if (!entry->in_use && priv->rfs_entries_cnt[STMMAC_RFS_T_VLAN] >=
 	    priv->rfs_entries_max[STMMAC_RFS_T_VLAN])
 		return -ENOENT;
 
@@ -708,7 +745,7 @@ static int tc_add_vlan_flow(struct stmmac_priv *priv,
 	if (!dissector_uses_key(dissector, FLOW_DISSECTOR_KEY_VLAN))
 		return -EINVAL;
 
-	if (tc < 0) {
+	if (tc < 0 || tc >= priv->plat->rx_queues_to_use) {
 		netdev_err(priv->dev, "Invalid traffic class\n");
 		return -EINVAL;
 	}
@@ -724,13 +761,18 @@ static int tc_add_vlan_flow(struct stmmac_priv *priv,
 		}
 
 		prio = BIT(match.key->vlan_priority);
-		stmmac_rx_queue_prio(priv, priv->hw, prio, tc);
+		if (entry->in_use)
+			list_del(&entry->vlan_node);
+		else
+			priv->rfs_entries_cnt[STMMAC_RFS_T_VLAN]++;
 
 		entry->in_use = true;
 		entry->cookie = cls->cookie;
 		entry->tc = tc;
 		entry->type = STMMAC_RFS_T_VLAN;
-		priv->rfs_entries_cnt[STMMAC_RFS_T_VLAN]++;
+		entry->vlan_prio = prio;
+		list_add_tail(&entry->vlan_node, &priv->vlan_prio);
+		tc_update_vlan_prio(priv, entry->vlan_prio);
 	}
 
 	return 0;
@@ -744,14 +786,14 @@ static int tc_del_vlan_flow(struct stmmac_priv *priv,
 	if (!entry || !entry->in_use || entry->type != STMMAC_RFS_T_VLAN)
 		return -ENOENT;
 
-	stmmac_rx_queue_prio(priv, priv->hw, 0, entry->tc);
-
+	list_del(&entry->vlan_node);
 	entry->in_use = false;
 	entry->cookie = 0;
 	entry->tc = 0;
 	entry->type = 0;
 
 	priv->rfs_entries_cnt[STMMAC_RFS_T_VLAN]--;
+	tc_update_vlan_prio(priv, entry->vlan_prio);
 
 	return 0;
 }

---
base-commit: c3e67bd82b9b9b1a5118f09a429ccefe2aab0741
change-id: 20261102-submit-stmmac-vlan-prio-v1-8e5f674f1201

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

