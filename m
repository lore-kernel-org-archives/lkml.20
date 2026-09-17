Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A00339DBD4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789673320; cv=none; b=UJGO8X0wpNpJZKcSuy0+zTik4X23Cc18pEL/4hJT+NaBFTFLfN96Yz4RqogwjUjyp2vb8jcNfBm8e1a7nzTmva+Et8AhAELIrBvL5cXyTpkDe7Bxj7QZhnR4ftxO4tK5bTAYqPDCACgxX0ggsKrxDsjlTGpQ2ai8JuV9tFjyxI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789673320; c=relaxed/simple;
	bh=kiJ8keaXl4aBoqSuNH1yUdc+yH4rf+KYUY3jg3YGXM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fY46EgYm2MYmXpVanTOr+EiOKuQQRm/zfLqLpd3jnKvF4af88Hq6e6OPVzIKxMkTvQ9/p3eakf2d6DQ++iCKXOg/cCwrLo2E6sluLMyKzx6jbzi/KjvNxPhuaM6zdYrnlObbMd7kGCPAxamADHjYS/dnWAlGn6dpCBovQN8nbsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLGpnZZr; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLGpnZZr"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb3so384246d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789673317; x=1790278117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DYFrXGjlvtshGh6uTDLzwFW8Ia3Piduo4Mx7nxDTOKY=;
        b=JLGpnZZr6hMX2bzqzZmvuKBY0tCL+A1WNuyhVvEKADmCWzjOngoYa3ElDAOzgOM2eJ
         h9qeQz6kggy4l/YzkWARVRmv2V9ubHgTWsF8+ZIVWsibseqruiCE9AD0t9n6ciIIRwZf
         Kpo//GhxFbUwsE6en9ZAJumEcxe2ylD6bauj+t62wsHCw6+m143Nl2WrORjEFlMp9ndD
         NDrrbnKmWwCKO7T6FfUCFHuwpJYi0OuSca9WO5B0LzCTKut+XHn3ic4j0rhKH67MKLf3
         f3c/J9QwxawuAbGgv61Ou6DMCqyP9Vk1dmP2KbAr/5waaveN+aSsSX7iWNzwBBaeLDmY
         jtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789673317; x=1790278117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DYFrXGjlvtshGh6uTDLzwFW8Ia3Piduo4Mx7nxDTOKY=;
        b=OOclW4/sJno/c5RggLlgyM0E+cLFQff21JpyhKVIr0YZt1oIiCP75MYlo2XQlwqr3t
         xGNkSFzuJc+pTV2YwQydbH88+dyXLgHN0bxPSumzufvpnIbSUMPX2glQQ7bhLjRueSiH
         Y+0wCPg2XKg+TRXVStfUA4ZOnnISd/nimiVIDT42fkZE9Ab/2MAJSJKwrX5qMaGKizvN
         MHSdnlEwmXy7ny+VdehEU5aZODN9OYDiZuMCRnxdc3Dr7Lht1YSXcYp6BxHPxLlVh+2H
         ytyL/av1QT5Q3wPYJi5+dtJBwgH3q9k7ijgsrJTSW7XvBzs8dSY8IzO0zS/ut6Ky+F60
         f0og==
X-Forwarded-Encrypted: i=1; AKwUvBy2XSiHJC/AUlB7iaNXfgrkzdzeri+BU9Xb0lg0yPwYkYtYCw/gYbPYv1y3G9+DIZAdoJHgL6j7O4drPKM=@vger.kernel.org
X-Gm-Message-State: AFuF++kOvOaTBGaMdPmM3E8I7WFMFEY9ThZWXIFwF14rcLFRyIKxpstB
	kJPxs0dr4wdxcNVl7iAC7Mi0IrPb+q4mYDNJOHs/7ssFW2FW5B4PaG4=
X-Gm-Gg: AYBFou2Yz1clP9jeuBMyn577c8Kvkr3edXEW+R+0e+V6mYkNsKG8WDmfoziw3TmYDvY
	affLaGrMekdjWblMq9S8i4b0hBVRcMrqMn9cjciuGs98tPKu5U/gOleoFgl+vfbMt8hneDyU46/
	oo53gr1spnQNJhO/mxllntYd5ZZvQj2FTyPOb+7WJXXSX3qIL7kgrHYDV4sZfevx73ou19MQC4M
	YSvq4Q1bNU6Bmvqj02EK82T8qBGWOluF24IiX7vwQluqmUULSfG4OYnnpdb//u3HpPD965u1e36
	L7Izz+daiITqGaI4RvTS71BEx9IgePn/lJK8zw3m46BtI9WEeymIxuRmjkQGPyrGlOIs5GarR5x
	T0I2VDHcEyQeLNGXQU3/I73ZVmq088mHvN8y51N2C8UhvCU4MWOpOKd4EyKUT+KyRAi37q4VuTN
	ASXdmROJILHXAc3kRrpiT+dTngPeOofcWdLPD8JQQHmKCNmCn5aTWeCps3Yv3/yGHCJiKWyCzbx
	5WRrSCoL/9ZD7xBQQ10YZJsid1M2VZWSO7kNAGxu0N6ZTjK0rL68uUkvaAS6zqrv1thm4OQMjf4
	kxKKURPakffoiHJ7a4Sen5+p4xhM4ingCc2w
X-Received: by 2002:a05:620a:6cc5:b0:939:ee44:36bf with SMTP id af79cd13be357-93bb785b995mr1306780385a.29.1789673317506;
        Thu, 17 Sep 2026 12:28:37 -0700 (PDT)
Received: from localhost.localdomain ([104.39.169.225])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b78255316sm525568085a.29.2026.09.17.12.28.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 12:28:36 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] net: gemini: Free the shared queue after removing the ports
Date: Thu, 17 Sep 2026 15:28:35 -0400
Message-ID: <20260917192835.58126-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The software free queue is shared by both Ethernet ports, but each port
remove callback frees it. The parent also frees the queue before its
managed child devices are removed. This can free the queue while a port
or its threaded free-queue IRQ handler still uses it, and free the same
allocation again when the children are removed.

Keep the queue owned by the parent. Explicitly depopulate its child
devices before freeing it, so both ports are unregistered and their
managed IRQ handlers have been released. Disable the free-queue
interrupt after those handlers have drained, since the threaded handler
can re-enable it. Only clean up the queue if it was allocated; it may
never have been set up if neither interface was opened.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 4d5ae32f5e1e ("net: ethernet: Add a driver for Gemini gigabit ethernet")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/ethernet/cortina/gemini.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 4c762229ce42..e493d495f2ef 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -2364,7 +2364,6 @@ static void gemini_port_remove(struct gemini_ethernet_port *port)
 		unregister_netdev(port->netdev);
 	}
 	clk_disable_unprepare(port->pclk);
-	geth_cleanup_freeq(port->geth);
 }
 
 static void gemini_ethernet_init(struct gemini_ethernet *geth)
@@ -2656,7 +2655,10 @@ static void gemini_ethernet_remove(struct platform_device *pdev)
 {
 	struct gemini_ethernet *geth = platform_get_drvdata(pdev);
 
-	geth_cleanup_freeq(geth);
+	devm_of_platform_depopulate(&pdev->dev);
+	writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
+	if (geth->freeq_ring)
+		geth_cleanup_freeq(geth);
 	geth->initialized = false;
 }
 
-- 
2.47.1
