Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882154;
	b=IUGoNuHj9NY3PKHH2YJQIrEiY9K3fpT2wtr5NBwP1GjAtYyiD5mh9fvJQn63pgKCungh
	 MAiuaPQZOZ+27ISCpAdPIexJijM0MoLc89YDN7RJgDAsMqDGrz/OLJZa7yazonbyAbcEd
	 4g6NLtgw3apbKBZl0kngZ0Ot2HOrna2sTh9FD2VlO0IXfUnnB4ecbnrraMgQboI1Km56z
	 A9vkYGUsQkdyIxJFoe5E6chROYY5qtW4gSxf8NY9uRfyPVlW5PicLYfUPllo3p+EPyWg0
	 LfAqUPHLetsU26SmPj0dBDkhrkXzh5lLXl+k5T1EPQhS6GRrjBdA/OOz7up2Kj2S6jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C/jFN8eJhh5ybkPCJN1GH5EEF9QQtG/kp2iWAhig7A8=;
	b=1QfkBwG08w5H2i5pdk6f0pp+pOfpCOpiaixQs0nJ20130vuurHZjDOJeu1TkSQLVrCSn
	 LzRjaEhDu/mCMgiJk9Wh+lg3ZTX3tsT6orrXuTajsWpi6xQEJs9E5AYoP9qizeH3XjacP
	 Cpc7czsbcylBM49XeOhBdUR/beP/l3mp0UwndEIno9cDPQo+sorJdNhCypID1JSRhypys
	 Oq4svvfVUsJF+yFsrtlcEcgZPxNwEZBt9U5RfA4Q7wU12xxcB+e2/XmEWaFiodwCpT6ti
	 BqGpQ5Vmt2JVkqlCJQXeXxbwHk/HT2qXETnPSyoavvJjtiKKNnDU6thqE7LHhZFOWBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dxNeF09D;
	arc=none smtp.remote-ip=74.125.225.128
Received: from mail-wm2-f0.google.com (mail-wm2-f0.google.com [74.125.225.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1AF606A337
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC1AF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dxNeF09D
Received: by mail-wm2-f0.google.com with SMTP id 5b1f17b1804b1-4a2d6bfe8d6so6354435e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793882152; x=1794486952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/jFN8eJhh5ybkPCJN1GH5EEF9QQtG/kp2iWAhig7A8=;
        b=dxNeF09Drx7SP+/EAEAAySXQDWD+PZ5Bs+gCemajEGb8/AqPnDNXfGIkUodmf0BQPv
         7PmPDF1I2XU79FVq8IXE3booYtLfQl9sGtuzPtkhpa0HVn4iZOeN7+u95wSPjMZwlWZ9
         Xzs7srFlcYWXThszNe2wDs/0kfSdBynxYErtbdEkU41Dp+IE/flGo2UzpRXSDv5LGSjN
         sWIcLOHi+8W845oloqgpSLcjIsKjzUzATme8gdez03xmriLdbGHRGcdBHfWrwXTgB5r4
         IgZsz3RM6qEolQbne6/IWafy2Sh9gXPoRyhVc5FI6COB5A21e5GjePyJcx2pM4ii44XT
         ni3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882152; x=1794486952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/jFN8eJhh5ybkPCJN1GH5EEF9QQtG/kp2iWAhig7A8=;
        b=piM2bxE9btA/4av7vcX3iGsMqtOB67/P0I/CvFPR9RTunvf4r8/yBLr4WWQVX6Tfoh
         jW8+NsAr8Kv35nZDXOmuYjOkqXgnE9IOzKyEaPCDGRdKMeCrfpwvo4twA62OtYg1BlpO
         cgXMquTTxvNjfyYQbD/B88GsWDssCtSSO2FxuJUD63VLTGH/zXuM41a0RrCmbSWZcjES
         gRqt9xURwhYLk99+COJiq9ny8xPuAMUzPC7gdp8faf+JxnZ8Mo3LorHZJ9usst7vEJE1
         5wRbSBDE1NZ0/wIwkfz/QyrAc26XUQWSPsAwdLztjS/HekyK19xYpk3odp6/BcUSfF2y
         d+aQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVlbr2cqX8sbwP8novNU1/3kzTMW8g2oB6zqE3n9oxjdWglGCs3BXdmdlTZbBtyRwvtDJiwSYdDemaKC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ENNDQIL1y3lavZPbaR4UYZEsN1KSNA48nW+8npTvhnig+lNrg
	k8o16yGc51zNKXal87WiPeUL2n/QccSrgZyD0BfZ+Qs6qFO0ETG7N0qf
X-Gm-Gg: AYBFou3Ne9mapQzA9MyxwFKkN31vBiXFnHnttD4RJu7TrnZ1EI03h4ht8x9Sq9MzwFF
	5lrzH2g2gsxr3qcgfhnN18BPgxWl7c8cKcEBAzcFQdWHVUfk+w5f4OXme4agQpxRUcFqBsFs73m
	i9rQif2tnHPRodWji0kJ9YxSkGiencgBgIRmKW+Gpy9sf+Lla6v788B3mVM/BjNJLcNu0yQbbs2
	LpsI4gt/UZTv1Ifc6nLeft/5Iky4yYS9rePShy9Rg6UsbCZc5QRsAmlRbg5UgSbKmBNGLmJcoQ6
	KzFnQwdT6zn+3q0SOrWsOlIm26t7SRK9R1x39CUh5aio1dEHRRj5TweeNaY+0ZzHPwqNYkYByDm
	PBiTQdksvP5KvxHmJgVf6QahiZh7s5VrjoNejWk+RwTGOgbfAetXwQ1hbT8cGEFx0T6T8vB683n
	w9gW/oxcKJMRKL8a7ittmo0xaRxr0RT/bXxqmoRos0qHq1LFoDAd/B/qjHbXA/yyE4X5S+dMj2b
	4uu5Id4FRFunN1q7Z63lPfmCnVznvRGhliD9/kxFLHus/BmHV8wWfSbo1dHL6wlNwmiDek5mgir
	EKD/mi+PFJ0fk/NCUuecX4bNF2gxdGfwkdCp
X-Received: by 2002:a05:600c:3547:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4ac1889d442mr421740485e9.22.1793882152080;
        Thu, 05 Nov 2026 04:35:52 -0800 (PST)
Received: from workstation.. ([182.180.105.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm114419535e9.3.2026.11.05.04.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:35:51 -0800 (PST)
From: Ali Tariq <alitariq45892@gmail.com>
To: netdev@vger.kernel.org
Cc: Ali Tariq <alitariq45892@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Tomas Hlavacek <tmshlvck@gmail.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and emac_suspend()
Date: Thu,  5 Nov 2026 17:34:37 +0500
Message-Id: <20261105123441.2524171-1-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The emac_resume() calls the emac_open() and emac_suspend() calls
emac_stop() functions directly without holding the lock through
rtnl_lock(). These functions rely on phy_disconnect() which reads pointer
with rtnl_dereference(). But since no lock is being held,
rtnl_dereference throws a suspicious RCU usage on
Orange Pi RV2 (SpacemiT K1) warning when lockdep is enabled.

WARNING: suspicious RCU usage
drivers/net/phy/phy_device.c:1831 suspicious rcu_dereference_protected() usage!
Call Trace:
phy_detach_internal+0x490/0x5f2
phy_disconnect+0x90/0xc0
emac_stop+0x114/0x626
emac_suspend+0xac/0x126
platform_pm_suspend+0x72/0xe4

Hold RTNL lock before emac_open() and emac_stop() with rtnl_lock() and
release the lock when functions return with rtnl_unlock().

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
---
Warning Log: https://kernelci.cloud-v.co/scheduler/job/549#L2168
Fixed Log: https://kernelci.cloud-v.co/scheduler/job/557
---
 drivers/net/ethernet/spacemit/k1_emac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 71a80838bffd..aca25a9e1e9e 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -2033,7 +2033,10 @@ static int emac_resume(struct device *dev)
 	if (!netif_running(ndev))
 		return 0;
 
+	rtnl_lock();
 	ret = emac_open(ndev);
+	rtnl_unlock();
+
 	if (ret) {
 		clk_disable_unprepare(priv->bus_clk);
 		return ret;
@@ -2056,7 +2059,9 @@ static int emac_suspend(struct device *dev)
 		return 0;
 	}
 
+	rtnl_lock();
 	emac_stop(ndev);
+	rtnl_unlock();
 
 	clk_disable_unprepare(priv->bus_clk);
 	netif_device_detach(ndev);
-- 
2.34.1

