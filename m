Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEF32D7DD7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820089; cv=none; b=gAk8RsQe6AEhTRMNXgVcCOgUu4zY8juA2EHf596shLAwKlgjkdClUiJQs9zwjla0uSspEvRPz3QS7Ic+Rskcfer84a1JD0xL3gQq3bZb1MY7F+KxHIyzNEj9I8wYrR2ApQZ0VTWOSG78roxDHrgvr/pdFWbprBuGPH21WxSZn28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820089; c=relaxed/simple;
	bh=joa6RM6ktxOVQDu2XvVi6s+0Yg0dPrzFg1gFR3Nr0a8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e5AovjfwkeJWwYy82IOmDHO8eqIiMzhEX68YH2mxcGXvrPMcamgqb4xtprBvyXJWOmliT5FpIE7cyTAZkb+rz5C/3RNegLkxlKo8zP9+Hm+Eyvql62W+wj9DUXgYM6drT60RODLlxGDNxaI2lFcS/Xcbyr5kqP1/1U5YVprj4M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1RtzEAW; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1RtzEAW"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35834f72d94so3444748eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791820087; x=1792424887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9/p9hlIUpy4pciplLAexWshVdUELSi1RJnPYvzK8GQA=;
        b=L1RtzEAWzk3npGSueZLjJQHQH3Vd7WTFRXAJZsfY6UNUw7c1swjkmw3LiUW/6yIjhQ
         E38j5l4Ta0+1HN+ZJYP9et9/J0UERugkwFuFtUld6w7Kjggc9sEismudnWsZ6/RYXF6B
         6Ny2tFopPC+n3dHGErF496udH6Npan/WEJWAZVNnXfwdQ16S8QYaWPJOxXLtlUF6dF5k
         78Rj3JwgsfhOYa51pOQ1Sfk6F4t6yV9r/1EwHWi3d8Wi+AJzRu557KWVYAmulX2kW/ia
         tIhkNZzhg7tSrz6VrqZWEQLZ3WmZLbZEn1MDRjr7xvrQVhxhhQDYMnsbWrQzYgPSTPpt
         XFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820087; x=1792424887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/p9hlIUpy4pciplLAexWshVdUELSi1RJnPYvzK8GQA=;
        b=UDSniM8+S+97K4d0yX8ZxL3z9aF/v6Sd2/Mz1e4VzTk0vTGHZo483cSVWpwrLU8jes
         742060nDCQxeRP5PvLCvRCXizTYLQm6oYMVOTKKG09G41RadCc05r3Q7gWZHh1BTPWrb
         IgtauvcnSVZleWBIxk9EwrMsRqIbaPh9orZXECJ00ZMzdkoW2C3EvaW7kFPLv9qtWYsR
         3DOoDThDv0UDVcPYtjtIBD6bb1EYGlkdQe6G19f7z77zxy2898Yu1C+ToRNycDKTi1HG
         0/B/5dvDqeRxt9Q6AfRADXB+t3p8my9gLoFan79/kaU4lPcLzuQ+mMSHqSnwMnmD5JdR
         ACjA==
X-Forwarded-Encrypted: i=1; AKwUvBw5VScVto+ipjbJVjXDjpjp0vaH6BEz6HtvwbIx2qmcZP7Ja3umYXjOdaYqp3CxVALsjwcH8HaogeZE2A8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAYgf+KrBA53hQpNmSh15bId48htFEw1DPlgYtFYQ+zNhMVREO
	wxWk7IadCWckdAVmId+QQcA8bWIX7Xgxp7Yi9/EptDLmr9JLqeIHB9Sb
X-Gm-Gg: AYBFou2Yoei4P/tnidoOrwYO0pr3VqOgbMyYbnFIir+Z67ZN83ZfiAhSbG6lZRtxQVC
	ZwcNv8jrozRafd0F95Njs7DGKYi1pv9k+OVtGwG9qMk9cYclYWxTdp+b7fBfpTBKwiQinYe4iwz
	MB3OzjzPIzVn1UrXEwyRV4OKN9aWHNpLOAHPD8JGjVuljEQqAtmJjjIpRp57KzH7pVu9DaXE3Xk
	5fgruA9qVXBfAHUVFu7Ud+3MQzitD28wBZFSG8NauwyJObF0tDAI/57iCfAIzgf89Dar0LBWk7U
	dXlEoAODa7YFgivDrhBk0C9wx7y5FtUXVa3m2/X7sYhhXQOmSDhnbvNQ4GHnz+G8MUVFylxHeHO
	ZPqJeC35bX0O5c6fSETRndOUX83r6DRJULkQmAmSNDZ9eZplM3Mhj0txKFepjYbjaiw4JfirE4T
	/XZTaKlktVD/Pqi1Wfzlb2Q8wTuxUuO2GN4sCIzRxqhcxhpJ7C/HTlMIB9D6uDmaCU5nP03Zhk2
	TGYWmQSLGJy/khiDe36gt08E2BV1AMqeRvViR7ZuBIYS19JS9Xk9FiECvOQN2szSqJkzZbj3g==
X-Received: by 2002:a05:7301:619c:20b0:35a:ca1e:511b with SMTP id 5a478bee46e88-35aca1e547emr3700116eec.36.1791820086698;
        Mon, 12 Oct 2026 08:48:06 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:c1bb:8d21:6c07:8107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b690af3easm6256328eec.1.2026.10.12.08.48.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 08:48:06 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH wireless-next] wifi: nxpwifi: Use str_on_off() helper
Date: Mon, 12 Oct 2026 21:17:54 +0530
Message-ID: <20261012154759.42423-1-sinha.aryan03@gmail.com>
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

