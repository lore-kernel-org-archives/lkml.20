Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727189;
	b=Qz1wR5PVD6ivSw1KF43njPiprjtDNEPMN28jI271nyphNDBP7r2MkaFnQgXdaxgh2s+O
	 Yx/cLZdFAM50f24Khur2aB341C2vDIC+e4LdAob6dvaIYcY/Ajlcgm+99eRHt6JHu8gON
	 Fu1zuKBEuwEs6qBz1J0uF4val2HFLJekgmdYLpG8wpPwnrVFKAJWmK9ipWzU/qUQAETxO
	 m5f7WfoOrWg0TQ0I41Gw/gimEcKkQDppn2rymMiOCX+qB8CjsK0Q25qe3s0yrnaa5QLQg
	 NPHfmFAlzYIs4bS9j0CD3ycoQTtpmVCUjZPQHH3m9jHSxQZhvejLNcD/a9Ke8m5jaYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hMJO0jh8npzNZRfudhQp+egNqtUXGRz6DdGt0iNHMSk=;
	b=OWtfhCs2VervWVPh0RGlt0g+vUy57Srce8eiYZhNbn0e5V/9g2/7xbi2gG4MqwowTwcS
	 zRk5AQm+tolDl440gNzpAiM+GeUuQ5ArtMbtmul1rarwGRK28kV5SON0a0BWPpEZycMjw
	 0Z1DD8bJ2WR0+P+bLa16z0Zi0z0tGHSk4PKL7Z5nA7ttnuNHTDliAFDpw8Wu5t80wA9Wa
	 BPFLmDwWobi5LfeK0AZN9PWhLX3yiuu2Xj+VEvNI9Yheg5a34OUiV0oVDd//NDiC7q6Rd
	 GDDopS7BDfj8bYCadrTXUGzPfc97/tUEPOMLOLMeAxYuX+Cowqbjaq+3N+gzgQoiNWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sPVz1nKz;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C4660A2614
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72C4660A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sPVz1nKz
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-843cf077f10so4437168a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727188; x=1795331988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMJO0jh8npzNZRfudhQp+egNqtUXGRz6DdGt0iNHMSk=;
        b=sPVz1nKzRWfnReZ6NEqE3CMLp36TjHEJLyd+KKgV/6BQX+8ofo47KYVL8TGgm4aJM6
         q+BpwnaMrKtGJciyDLs65GMJc0oF0niCzvcukADjwu1m8Cm1IymEJqSb0KIfegFx7qx0
         m+LQRlj/A2q5QitB418rQn0GbJ6LH09rm3GZjdqxMUW4MenlRdLfl3y7Nkmz2Dulhcqq
         zUiRMz0QJ0+0uO7Wu006BqRDFthZErYICskFAuoTXpT6bipELwSMT0SLCq3QFOqgzu+X
         ++ZgBBcXY26eMZyA/iBXnRJCuXJ73t96YZIgvluVj6UO9fGgKRYx1N40oAgKYk9dX3X/
         5iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727188; x=1795331988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMJO0jh8npzNZRfudhQp+egNqtUXGRz6DdGt0iNHMSk=;
        b=jTq6AkmAwWakZtwHYgsKqj1I3D96fqA90ZY7bXF2f7VmaKm/m+1kDeSMCoejsh41Ys
         cWE0lWvABTrax/ZdM2P4qZgfdSZZUxG30P8Zah6F9ISte6eHM8knhCCtIT9m8BQQ7cg6
         BnYAU91r4/qhMcV09zKIJyzVWIc8bZuRtRBdXCRUZLU5BV/PJH79414xDxiw/eaiE0ko
         ZajPh0g2cio1ArJFf0SFWKdgcdijHPtN7rGQqNwWc3OB4ay7sUKKBnloLzcJ5c123qd/
         kyWaidpsbExYj0NamCz21VBD21M9ZC8K6Io0ZJ6iedSUh7zUB1DtUPr9hf4eg0Eo0LoY
         xWbA==
X-Forwarded-Encrypted: i=1; AL+hErEweDSFgjIqzBuygIq7VSEzc3XACaYj0Ac0L/Mje0LkIjgLxUg8FwLn3ZPnPr7yAPv4YJgCVLM1BjiiaHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jPxEQE6pzImsVvGQfM1jDG6cg9E3/DrYRlWW6nEgj5r7pZzlx
	18AoBmvcjWPK1JuWMQltxlBXQbIw0slzwOs5stMyPdwnqPLVcxlxpSFY
X-Gm-Gg: AYBFou3nALqX4aqBigp2SHBzx0yRr98BrRNqgu9Rl6lKRKWDtSd/5LYgtlI/eCCOXRq
	KQWGzGaZUUjlAxim/fM2Ibsh4CqGfadNvmNFP+z6djm9++6E5sgIpswCmiUY/FPKdXxuPGurmWW
	xLwScLTuKJN1rHt+xAMdz/db+FcMUri0SqsVh9mOy4sLKmxACC3f7ODcSPVkWripTmBhCw0vT0X
	niWtFgDSc+vpnNCBF0naXG+l6GwntRmhhIunWNABBCSbtRttl26mFOMGbOZJuhJGPzl2Xjacvhh
	pwbdxUx6xR/c5jzeL/+J1BdaTdqX24z/4atLCwzpJbAE/viPeA6jcd04DL5oC+LoQn7LgmVMMLc
	mTb/XFDp+V+i4fwl/sypQYsn3/tk0LaJ5z3FzGr2hGt/Dw+xSBocia0ZbM4/RmHoApFsInLAl7p
	JwrnTAFG6Rh+9kSpQnyNqzONnzDXEtljcOgAo4aqSVrihvSLbym9LILZ1cU6tcHEOJeBBCfCSig
	IbYpwl5ojGSFzQN+MhgCboGG+U0GeOttOGXNOuMDhBBufnTFx35oS9gTA3+YSTTC0/kGrjIjxds
	APLT5KOw3IL64aWsFMBrGsgFJTWtaqAe8e7OQOz4hGT/9AQ+6aejjq6irrdpFcpC8+MRo+MTaee
	UUEwLn1hHFSJBNvDHqmWMy1JeesqUxgMIICZHp73XtoY7PPWLs6JaqGbid+lvJC6VRSUexj446Z
	Kb5+pjMzDp+qV04obumide2XWfCYrD9Im0KpCCvb/R/UzVKaHTo2E=
X-Received: by 2002:a05:6820:1607:b0:703:38e7:c3e7 with SMTP id 006d021491bc7-71ace4db572mr2822047eaf.44.1794727188373;
        Sat, 14 Nov 2026 23:19:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ae860ebd7sm1145321eaf.8.2026.11.14.23.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:19:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:19:39 -0700
Subject: [PATCH v7 06/10] dmaengine: dw: simplify transfer-complete
 handling
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
Message-Id: <20261115-submit-dw-dma-synchronize-v1-v7-6-8d58f3d49e4d@gmail.com>
References: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
In-Reply-To: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

With hardware-LLP residue handled by the status getter, the descriptor
scanner only needs to process transfer-complete events. Return through a
common unlock path when no event or active descriptor remains, and flatten
the completion handling.

Only one transaction is active on a channel. Detach that descriptor before
starting the next queued transfer, keeping cookie completion under the
channel lock and client notification outside it. Preserve software-LLP
block advancement before completing the transaction.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 92 +++++++++++++++++++++------------------------------
 1 file changed, 38 insertions(+), 54 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index d9127337c849..3cc8579f8829 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -297,74 +297,58 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
 	struct dw_desc *desc, *_desc;
 	struct dw_desc *child;
-	u32 status_xfer;
 	unsigned long flags;
 	LIST_HEAD(list);
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	status_xfer = dma_readl(dw, RAW.XFER);
-
-	if (status_xfer & dwc->mask) {
-		/* Everything we've submitted is done */
-		dma_writel(dw, CLEAR.XFER, dwc->mask);
-		if (list_empty(&dwc->active_list)) {
-			spin_unlock_irqrestore(&dwc->lock, flags);
-			return;
-		}
-
-		if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
-			struct list_head *head, *active = dwc->tx_node_active;
-
-			/*
-			 * We are inside first active descriptor.
-			 * Otherwise something is really wrong.
-			 */
-			desc = dwc_first_active(dwc);
-
-			head = &desc->tx_list;
-			if (active != head) {
-				/* Update residue to reflect last sent descriptor */
-				if (active == head->next)
-					desc->residue -= desc->len;
-				else
-					desc->residue -= to_dw_desc(active->prev)->len;
 
-				child = to_dw_desc(active);
-
-				/* Submit next block */
-				dwc_do_single_block(dwc, child);
+	if (!(dma_readl(dw, RAW.XFER) & dwc->mask))
+		goto unlock;
 
-				spin_unlock_irqrestore(&dwc->lock, flags);
-				return;
-			}
+	dma_writel(dw, CLEAR.XFER, dwc->mask);
+	if (list_empty(&dwc->active_list))
+		goto unlock;
 
-			/* We are done here */
-			clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
+	desc = dwc_first_active(dwc);
+	if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
+		struct list_head *head = &desc->tx_list;
+		struct list_head *active = dwc->tx_node_active;
+
+		if (active != head) {
+			/* Update residue to reflect last sent descriptor. */
+			if (active == head->next)
+				desc->residue -= desc->len;
+			else
+				desc->residue -= to_dw_desc(active->prev)->len;
+
+			child = to_dw_desc(active);
+
+			/* Submit next block, including for polled transfers. */
+			dwc_do_single_block(dwc, child);
+			goto unlock;
 		}
 
-		if (dma_readl(dw, CH_EN) & dwc->mask) {
-			dev_err(dmaengine_chan_dev(&dwc->chan),
-				"BUG: XFER bit set, but channel not idle!\n");
-
-			/* Try to continue after resetting the channel... */
-			dwc_chan_disable(dw, dwc);
-		}
+		clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
+	}
 
-		/* Detach the completed transfer before starting queued work. */
-		list_splice_init(&dwc->active_list, &list);
-		list_for_each_entry(desc, &list, desc_node)
-			dma_cookie_complete(&desc->txd);
-		dwc_dostart_first_queued(dwc);
-		spin_unlock_irqrestore(&dwc->lock, flags);
+	if (dma_readl(dw, CH_EN) & dwc->mask) {
+		dev_err(dmaengine_chan_dev(&dwc->chan),
+			"BUG: XFER bit set, but channel not idle!\n");
 
-		list_for_each_entry_safe(desc, _desc, &list, desc_node) {
-			list_del_init(&desc->desc_node);
-			dwc_descriptor_free(dwc, desc, true);
-		}
-		return;
+		/* Try to continue after resetting the channel... */
+		dwc_chan_disable(dw, dwc);
 	}
 
+	dma_cookie_complete(&desc->txd);
+	list_move_tail(&desc->desc_node, &list);
+	dwc_dostart_first_queued(dwc);
+unlock:
 	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	list_for_each_entry_safe(desc, _desc, &list, desc_node) {
+		list_del_init(&desc->desc_node);
+		dwc_descriptor_free(dwc, desc, true);
+	}
 }
 
 static inline void dwc_dump_lli(struct dw_dma_chan *dwc, struct dw_desc *desc)

-- 
2.53.0

