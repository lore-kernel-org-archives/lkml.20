Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261973DAADD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031205; cv=none; b=tnbVJIdVoKUzjSPDfalC+5icLD46uteTXSoxKyfEfUt6eUljjZ9GCm+n57GnnntO8vLaOVmAqypa5vkrrfAWlXpaCmkY7rr19KgfdxMFN9abZOBzNrz43vdRzMNwF1BQwyDF/itL/vtmUZUPcNizLWsNzpG57kM3IsmGjfniBQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031205; c=relaxed/simple;
	bh=FZStNsMs2iriGK7e9KujuhmKPVMrb/FMjjGfoQ39NjI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EQh3vNyBo2R7Hh/e04Gag6qnu4vsBqVaz46wmi1THBYfVkRlX/0cW5zYfS8aqAida4cVV+ZeSd0/5g7rW06+1wmMGp+3uPYfXOElg6xpqNcdNfWN8/d4OF6I+7T/rS/fg6XfZISFxxI6GG2O50c7+YPdvGYrC55LzptBC/wWVSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAzxYuyd; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAzxYuyd"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e441e14a1so76932785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792031201; x=1792636001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFplvxZRSsha+wXsqtuuqXSDkXUdJ1l1AD0B2sqIS80=;
        b=WAzxYuydGkUkcyg6QI6kBVCZQE5Bz8pgSio209WYOxISag5wvirMNuP0M/zGeOgJD1
         mne9DWK71ftn9xFWpC8ZSjufHDU1STWbPJjGpDdvLfY9+gxeww7VtL2o+ULW7Q7jiyAy
         oLAeFgq6juTk0FlqGJlAzO0/IrcE0ANQVTieDc+HKbjKWRkYAThMjB8HlrJhPkl5n969
         pvLqZ7zjG8d+/6fnpNH/5Zjlr6RxJyujKyRrXjIn8X9Gmly9N0SHEz8mBoiEaEit/TD1
         /sQBLlGV0fuJ+1GtHYIkwAw7ToprffuAqzlW1hU7NCuHV3oxVBOOpUcGUHYR/3Tedcfz
         sGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031201; x=1792636001;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DFplvxZRSsha+wXsqtuuqXSDkXUdJ1l1AD0B2sqIS80=;
        b=DjNsUt2NHG/4A9LxorMBmC+27LvkiAorhn3Nmn+sGuPM2UvVTnFMqgX4HeTuwa+p3s
         LGbkbOn+m4t9W0gFlPS7pLhKxDbMRh122n/f/H8nCitxLtu1J8XGPpgRGme/DrEeEc0+
         b+QShaqASDerNW1mghpsxNAldq88T48MNQBF2N0XQk43oWyi3uDautPQJ6LL+2qOHOMO
         xYrRaAtuUlCEj/fEu0FuO8Ijpy+flQP1sLsMhgvZlveM8dhKZOObQQyp5r0AHm5ORUss
         mj4XXxl1TEkKP/602OVlZxOZQ2DUGdQWB5cXx4fAZe+/ylqjOSufYeHhkGX51mjB0/iS
         ofTA==
X-Forwarded-Encrypted: i=1; AKwUvByTZ08ymjzYys20DeBhGPwvaTH6g5lSGbJNxA1YqpEo9NLGqtkm/IofoEnBqsfbFDsZ7bD57NDrdnVNf6w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfVVNyT1opOPuCeWg2AA0gyQpM6SlPENy3J978o8HAK205z0oT
	upQMZaUaDSsITtABDlWOznYAneavwEimVxQKoGMjdeuoYnqHm7Jz/yxsn9wjvlI=
X-Gm-Gg: AYBFou2rQjky6BtZlLcx9uSw7kqf5fJcnQMNWwYwC+5ag1eWMdEx4926xP6AXfc2LCq
	57JKiQtjWl+e3VHlctvEm5GSQc73kuGtVplgmhC9kgLW2dugj/ahTexK98KVQUZiXKwWOQTCB/3
	35YtOM9ZSqXW1ZDCM3aF70OxPvZ8FxMQe2I6xQKT7RsAppt5XVnekZWOBGrmKKZXDkqQ/33V8C6
	2VEf/xNVsY7naO9Op6JnbrR/ldxF7QMPQzazWNk6JBqPMIbNBDIbVjBl2MQ5MEc7Lh6C1Te4fDy
	XqYTI7Ce6AOEU1QAAwduNYdmrb2yu7BvIJFQksD/4ZSTSYoGnNDcNRkE+EEiI8awMrVnUiGmtNw
	7b/Ey4hEu3RYsZ0Tveq/8fuO2lgwKJ0Ef1neZUvpWfcghuP/T9ffKuHBJZecgNFkhETu8gHzU2P
	DUGAWRZwcjeA6U9bGysZcBKz6ZtfXh6l6J7qzcKrQAroIyCd+byIvSChX7HnVytnoJqlhlzDT90
	JxRr14u5hmWqIOplhUvO5dDqdoVhMT0x8CUuahaHGQA+4FapUzqbJNyc4u7xm7vDfXNVG+fSnwB
	OGivQUUM3AM3AbfbHZp7Y1sPOKxO
X-Received: by 2002:a05:620a:270d:b0:93e:7939:43f0 with SMTP id af79cd13be357-93ebd247f8dmr2978360585a.32.1792031200865;
        Wed, 14 Oct 2026 19:26:40 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef502608bsm652354085a.25.2026.10.14.19.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:26:39 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH net] net: hix5hd2: serialize timeout recovery with interface teardown
Date: Wed, 14 Oct 2026 22:26:35 -0400
Message-ID: <179203116093.2621539.3718842986255459438.G202@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The timeout worker calls the driver's close and open methods without
RTNL or a running-state check. A timeout queued before an interface is
closed can call close again after ndo_stop has disabled NAPI. The second
napi_disable() can then wait indefinitely. The worker can also race with
an ongoing close.

Take RTNL and skip recovery when the interface is no longer running.
Use the netdev core close and open helpers so a failed reopen leaves the
interface down, rather than leaving it marked running with NAPI disabled.

After unregister_netdev() has stopped the watchdog, drain the worker
before releasing its MDIO and descriptor resources. This wait is outside
RTNL, allowing an already queued worker to take RTNL, observe the down
state, and finish.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 57c5bc9ad7d7 ("net: hisilicon: add hix5hd2 mac driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (arm64). No runtime testing.

Related remove-path change (devres-managed netdev lifetime):
https://lkml.iu.edu/2610.0/05627.html

 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index 02282dc..12a5657 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -12,6 +12,7 @@
 #include <linux/of_net.h>
 #include <linux/of_mdio.h>
 #include <linux/reset.h>
+#include <linux/rtnetlink.h>
 #include <linux/clk.h>
 #include <linux/circ_buf.h>
 
@@ -890,8 +891,13 @@ static void hix5hd2_tx_timeout_task(struct work_struct *work)
 	struct hix5hd2_priv *priv;
 
 	priv = container_of(work, struct hix5hd2_priv, tx_timeout_task);
-	hix5hd2_net_close(priv->netdev);
-	hix5hd2_net_open(priv->netdev);
+
+	rtnl_lock();
+	if (netif_running(priv->netdev)) {
+		dev_close(priv->netdev);
+		dev_open(priv->netdev, NULL);
+	}
+	rtnl_unlock();
 }
 
 static void hix5hd2_net_timeout(struct net_device *dev, unsigned int txqueue)
@@ -1283,6 +1289,7 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
 	struct hix5hd2_priv *priv = netdev_priv(ndev);
 
 	unregister_netdev(ndev);
+	cancel_work_sync(&priv->tx_timeout_task);
 	mdiobus_unregister(priv->bus);
 	mdiobus_free(priv->bus);
 
@@ -1290,7 +1297,6 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
 		hix5hd2_destroy_sg_desc_queue(priv);
 	hix5hd2_destroy_hw_desc_queue(priv);
 	of_node_put(priv->phy_node);
-	cancel_work_sync(&priv->tx_timeout_task);
 	free_netdev(ndev);
 }
 
