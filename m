Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9C92D7DD8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917199; cv=none; b=btiaIrPpVwZsWMTUUqPKeApw+TjvBZV4+3JA2V6v/ZCpvLFgP3fnNnLOpz/BD+iAdnDrqL7XeoAh9MIPnbjeOi67JVfTqif7P2riZTpd+Te2i+NL+HV08BXGowpq8yHFg0uH77dhfwOnfhafc/G8Zf2dDWosO1AJ2kcbV/EV5m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917199; c=relaxed/simple;
	bh=acFlXcEiT572ZJiXrFiAgDdQAsAnP97RVwbtXkKqf64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fGDnqmUql5CeLkUDVb3PrGp7bmMK/OA2ZNvpDskp9wReLjSouTfML66Y9JoSyTmDkyPiGHLqVA8LLRxElN4exbcvCRAmGGU8mvgmeD6ABMnzqSDOa2jU9P2V7rr4lDHqllIo256NOJF0H6So00JYnB7JvFAAh0xy3X4bHyKHqIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ptXafzjw; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ptXafzjw"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so3000800eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917198; x=1792521998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVHOpieiCoFh8hF+Mie/r7LlqSh7kncM/953p3AKcNE=;
        b=ptXafzjw3W3p1wTIVm3ghyuVk+PH9Nnd+/zZ4UYwiT/k6GKfpD9AZfY4Jjb+UYKoXr
         U0ZvLGBAj99ARRgl9dZ3rzVpPq+uQZV/zKJ4fD9vanFj+12A2aGYBtrWBmia8t4uliAj
         o9czzf0DCJbyQI20INenpctfwEiH36DEkIJiEaDhbQAjLEN6GxAZfZlLU8AHMfsf1thi
         XHi3hqWfLize8RWbEBskk5jeJS0Q8bsja1NN/Py0/y2nJzj8KJeuvroM4y+M/xL6Fddo
         1ZejWyL0E7fwmRLuK5wVgaw5fDPgu/PDy8CeON19vbix3LccalWSRIXxIq0uPlrAicgJ
         1QxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917198; x=1792521998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVHOpieiCoFh8hF+Mie/r7LlqSh7kncM/953p3AKcNE=;
        b=a1NqA+ja8+d7kcI9Y0EcoxG2lVrefjWhzcBletTAm18ZzAQqHkGpX+tMABbIlocuDt
         mZJGvrnU5N35v4oWGLZdiK7wjh0OA6pfikAy7m+hDvLtu6wVDcQkO5ElG4Q1wnVWMd12
         WGV9LzJYZMzQf1YFjDpSkUxoj04Lq4wFDgTwvPMtBeNyPd884RCNvfGI0BjZFobo+Ory
         PRR6yR2UmGfy4w8dt23yHfAD0zMsPXOXAiPKbw6mTJdtYp0wDEbhoT3oNAg1fbhTsSKT
         /N4W8au+wQnPIIua3wtT3ny/4qhysF1udTzAFa3K+ZxxHpdJvYLD60uQuO+eKHKWFDIm
         zVgA==
X-Forwarded-Encrypted: i=1; AKwUvBxwfQOhffjfH7gHl/vRr3g/5oAMIVHPNefmZ+IfNTHgonZ58gN4hu2xyhX+INVf5fsadPaFBgt7VQgwNZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKj0VMOw+IDN99v0Y+cuRoU9/m2YqplGQby2MzQmu6sEjeETjTu
	g8RHCEVc5pQQjmfNO1tFoEnnmtFGnYFqNQ+McV5ldXhx5zCpCfXX7mDo
X-Gm-Gg: AYBFou0Wu8TBY/xHpMj3iLaNfWt13mrVdew7luFc6xjfCsnCKEpPDeRL29vetkV4asW
	fV8gb3lewjNlflIIAGhWvNAbdr0PFlfkCmq4PjvGURsTCnW9jAXJgbqzIEaTh6xWaJFcDQnX2WH
	vLeUfnH4n6kUZ06tvIGXl+kwKutMdm3gIoC2JP8m9V4tU3mi9LEpvS3qJQxfmz2FSB+RUEC3gUR
	wC0sIsJc/PC7Ebw7DBqEal7QzPmbDXAWntM4UuZ06l6zbArGTa5KfU2ld8VLyiHu//zb52nvOwe
	KRC4ZcbHd73Rj1j7uSoQDfO4CkhgAc9XF9KqO5og+Q4m44Wk5t+v0vgbhFpFQHmZoBrWBlxi8eg
	jXq8f6gsruuxqVkmkKxUh5AUgfrPUXp0Cedztr6nh0/ifweJQVUXryFabavhpsvkok6W6Jq9c8H
	VgTyUXJmTlv400YyCAAfYldzNeiRbF1Wz7nNaQeGAskLfb8T+6xLw0OJKPmSWj9VA6/OxPF/z+q
	W+hNZBxA2sVBf7Bq3pvwON1Mzhg6YZ8j8yn9x3STwfXdl9JvGb9d/rUX04sxiTd1TRTjFY=
X-Received: by 2002:a05:693c:4141:20b0:35c:8d1f:5634 with SMTP id 5a478bee46e88-35c8d1f58e8mr3912332eec.12.1791917195997;
        Tue, 13 Oct 2026 11:46:35 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:9c40:5aab:66c1:112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b19c6c7b4sm18951950eec.24.2026.10.13.11.46.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 11:46:35 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Jeff Chen <jeff.chen_1@oss.nxp.com>
Cc: Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH wireless-next v2] wifi: nxpwifi: use str_on_off() for carrier state
Date: Wed, 14 Oct 2026 00:16:25 +0530
Message-ID: <20261013184628.29444-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both carrier prints open code the on/off ternary. Use the helper from
string_choices.h instead. No change in output.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
v2:
  - say what the helper is used for in the subject (Jeff Chen)
v1: https://lore.kernel.org/all/20261012154759.42423-1-sinha.aryan03@gmail.com/
 drivers/net/wireless/nxp/nxpwifi/debugfs.c | 5 +++--
 drivers/net/wireless/nxp/nxpwifi/main.c    | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/debugfs.c b/drivers/net/wireless/nxp/nxpwifi/debugfs.c
index ccaf0eae3..fc2f188fc 100644
--- a/drivers/net/wireless/nxp/nxpwifi/debugfs.c
+++ b/drivers/net/wireless/nxp/nxpwifi/debugfs.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/string_choices.h>
 
 #include "main.h"
 #include "cmdevt.h"
@@ -98,8 +99,8 @@ nxpwifi_info_read(struct file *file, char __user *ubuf,
 	p += sprintf(p, "num_rx_pkts_dropped = %lu\n", priv->stats.rx_dropped);
 	p += sprintf(p, "num_tx_pkts_err = %lu\n", priv->stats.tx_errors);
 	p += sprintf(p, "num_rx_pkts_err = %lu\n", priv->stats.rx_errors);
-	p += sprintf(p, "carrier %s\n", ((netif_carrier_ok(priv->netdev))
-					 ? "on" : "off"));
+	p += sprintf(p, "carrier %s\n",
+		     str_on_off(netif_carrier_ok(priv->netdev)));
 	p += sprintf(p, "tx queue");
 	for (i = 0; i < netdev->num_tx_queues; i++) {
 		txq = netdev_get_tx_queue(netdev, i);
diff --git a/drivers/net/wireless/nxp/nxpwifi/main.c b/drivers/net/wireless/nxp/nxpwifi/main.c
index 9e1334810..4d77b9ecf 100644
--- a/drivers/net/wireless/nxp/nxpwifi/main.c
+++ b/drivers/net/wireless/nxp/nxpwifi/main.c
@@ -5,6 +5,7 @@
  * Copyright 2011-2024 NXP
  */
 
+#include <linux/string_choices.h>
 #include <linux/suspend.h>
 
 #include "main.h"
@@ -1088,8 +1089,8 @@ void nxpwifi_drv_info_dump(struct nxpwifi_adapter *adapter)
 			     atomic_read(&priv->wmm_tx_pending[3]));
 		p += sprintf(p, "media_state=\"%s\"\n", !priv->media_connected ?
 			     "Disconnected" : "Connected");
-		p += sprintf(p, "carrier %s\n", (netif_carrier_ok(priv->netdev)
-			     ? "on" : "off"));
+		p += sprintf(p, "carrier %s\n",
+			     str_on_off(netif_carrier_ok(priv->netdev)));
 		for (idx = 0; idx < priv->netdev->num_tx_queues; idx++) {
 			txq = netdev_get_tx_queue(priv->netdev, idx);
 			p += sprintf(p, "tx queue %d:%s  ", idx,
-- 
2.46.0

