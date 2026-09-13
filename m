Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0833C3C1D53
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 06:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789281682; cv=none; b=E4SUUMxb4rC7oV1l7cccalgyKE2dnOUiY//WfIPKFv/WTu/XzZZBOQ4rJ3VLssBmAJ6Z7Ryh/229X+PYQqrJvd4obWUY0553H41598SB+rW9K9hjQ+garRVsS3EiC823PZaMfX52su1jAlpSOF90Evn6c2pOPZ9ofV8yOHoqubI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789281682; c=relaxed/simple;
	bh=2isl3eP2I9Ofhmo1cfW/hgvgC4igkB3in+RmAUkHUsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QPrg8c9c9GcCQWniHW8QoDQk8mR9ghwACk7NJ+jl1WzuNaZJ500INSFxpS9rzKpN2utTDL+bVnEPu/ZG+HgW6Ask9nmFAd8iNuc4xhnCYBOo+W9BPrMgGVRxwTFZMD+UjoLs5ZCtRCUepJ4BMVHtuAc/ysrzlFGpA5r3OC6kXL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GR+H538B; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GR+H538B"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8692a8568e9so725189b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 23:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789281680; x=1789886480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R0suMaCXibllLZ+k/N5xA3Vj2voIiuPLg/g+cL0xmFY=;
        b=GR+H538BqwCfDO9qfWSW9TT/DOPKVAuZCJxBbctQclKCVpLHjf00j9F2/7mK6OmMM8
         pm4ALT18Tsw0yQYamL7WDuWFUN3Z0U820MUW0ACvHktbisRU1RlmkUJV+FJ5Ya9clnRJ
         X0zEVT/MvBCEXKj2lQULcDZa1g5u4wPLK9Rwh4BfbKFqixODgP3KJwaafvuR7qdnUYsl
         e5EtlsUsRlBvBOJllbrLUEjX2WwqTZAuMWaiUe+FGwx3lZo9wSpONKOvRbiTcrpsueuP
         ck4oN4EDhTWboH8HU0JAup7oIlqvTOT0GqPzatqkQ/qtk0Vp7GPDLafbCJvhdeJRA18U
         rRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789281680; x=1789886480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R0suMaCXibllLZ+k/N5xA3Vj2voIiuPLg/g+cL0xmFY=;
        b=nxFPpanGMuyU1ggu0B0SIek6uJlYBHLV5k1az6tIoj9/bs+lT85vmGnc8UXX+g9mUC
         1i5wEVBq4XUsdDaQOdBzFYyLwLrbxRjtcBbjEnvnkCX0Qg43gnGe0wYqGgp0M3nLWV8v
         1bjDUQtNJPvwuPGu0pAu1rUMMhZH/mcylLoWEBVYDEJnehrtZmgQc7Rs7zz609FKzcf9
         jbhgsx+GtdUL/iWDb6IXn1k97/9HvNYq6NPc9evtataEg6Nuw/m0TlHQvuUtXtJCFJDv
         Zrswvu9Op2CQ+wEX04dcAPpKplfbmIj3RqvUlfgREtRk6aOKMGecCPwpHzq8b0wtnSqz
         IAUw==
X-Forwarded-Encrypted: i=1; AKwUvBwPAt+cUiT6qpZWsQvVvP6Bf5yAuP4yy+QdiOsOJIBAWFT0Qoif+2QB+pMnwRR3cfEMJwVbvePNtQT7wio=@vger.kernel.org
X-Gm-Message-State: AFuF++mOsXUKBRTXPcMXTt6QH04IXtBmKsbGmFZ8iy1ZPTeqZ46WUDV5
	ViGMAu90+wTNVkL//AtmzrtMScwVRlKaE+1j2tsGY199OMssFvlLZXI=
X-Gm-Gg: AYBFou0m8d4mJ79kYFjkQOj3bru4GU9chSDwrc289QUIGGmcuE94PB3YoaDmS/b5OS5
	Py/975zEgrjCEJpVBEE7gTItgYqCYYqcjlIbPQvy3IuUwdHk0Qoqynp6ujE1a6uq76Qf4r2u0TI
	h01QJUEUgoemjszWxS0E/PKQ902kwm2twj9WCFocstUpXkvQ+mQV/gpd/LfRHl90egFuEsVdkHn
	YpJ0E+Q1+C5de4fVNxX1F6Q6uNZzTqDq/oXYZdduibA2WXLKXGQrcIWSLmBL01bBEBRx2+bcmPl
	s2iVh+0YYnWHlJXPuNSkB7cApoz6eCmLXjUNtkMY1+QWpShmrNySO4BSX3T6pMCz9Ul797M/Wc+
	QwK9p3kqGcQF7yBzAgvCXHtigSJZ6FzhUC9CTuWKYW2m7aHGJ51cWoBdv3eTzRc/2zDYtRrg2BW
	ADEhqBrpXYynZU0ZzJUvZVF9Sulj9MqsTfmG+yac550TGUbKLbZLVxhluM1CEz4rvCp6HLlNH1R
	YwX71MtHTtFfnJsse2yc5KqDpRX
X-Received: by 2002:a05:6a00:13a5:b0:857:72f8:dc94 with SMTP id d2e1a72fcca58-86ccb545129mr9955871b3a.21.1789281680275;
        Sat, 12 Sep 2026 23:41:20 -0700 (PDT)
Received: from localhost.localdomain ([218.212.26.103])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a5c052csm2989783b3a.58.2026.09.12.23.41.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 23:41:19 -0700 (PDT)
From: Yige Jiang <yigejiang86@gmail.com>
To: netdev@vger.kernel.org
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Masahisa Kojima <kojima.masahisa@socionext.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	Yige Jiang <yigejiang86@gmail.com>
Subject: [PATCH net-next] net: netsec: fix device_node reference leak on phy_np
Date: Sun, 13 Sep 2026 14:41:02 +0800
Message-ID: <20260913064102.37452-1-yigejiang86@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

netsec_of_probe() takes a reference on the PHY device_node with
of_parse_phandle() and stores it in priv->phy_np, but the driver never
drops it.  One device_node reference is leaked per probe, on the success
path as well as on every error path reached after netsec_of_probe().

Neither consumer takes ownership.  of_mdio_parse_addr() is a static
inline taking a const struct device_node * that only reads the "reg"
property.  of_phy_connect() borrows as well: of_phy_get_and_connect() in
drivers/net/mdio/of_mdio.c brackets its own call with of_node_get() at
:364 and of_node_put() at :373, which would be a double put if
of_phy_connect() consumed the reference.

The node is still in use at netsec_netdev_open() time, where it is
passed to of_phy_connect(), so it has device lifetime.  Release it at
the probe error label, which every failure path after the acquire
funnels through, and in netsec_remove().  Both releases precede
free_netdev(), since priv is netdev_priv(ndev).  The ACPI probe path
leaves priv->phy_np NULL and of_node_put(NULL) is a no-op.

There is no end-user visible symptom on currently supported platforms:
a device_node is only freed once OF_DYNAMIC is enabled and the node has
been detached, so on a static device tree the imbalance is inert.  It is
observable as a refcount that grows across bind/unbind cycles, and would
matter under device tree overlays.

Found by static analysis of reference acquire/release pairing rather
than from a runtime report.  No reproducer was produced and the change
has not been runtime tested; it is compile-tested only (arm64,
CONFIG_SNI_NETSEC=m via COMPILE_TEST).

Fixes: 533dd11a12f6 ("net: socionext: Add Synquacer NetSec driver")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
 drivers/net/ethernet/socionext/netsec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/socionext/netsec.c b/drivers/net/ethernet/socionext/netsec.c
index d14a6584473c8..79a0a324c921d 100644
--- a/drivers/net/ethernet/socionext/netsec.c
+++ b/drivers/net/ethernet/socionext/netsec.c
@@ -2149,6 +2149,7 @@ static int netsec_probe(struct platform_device *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 free_ndev:
+	of_node_put(priv->phy_np);
 	free_netdev(ndev);
 	dev_err(&pdev->dev, "init failed\n");
 
@@ -2166,6 +2167,7 @@ static void netsec_remove(struct platform_device *pdev)
 	netif_napi_del(&priv->napi);
 
 	pm_runtime_disable(&pdev->dev);
+	of_node_put(priv->phy_np);
 	free_netdev(priv->ndev);
 }
 
-- 
2.50.1 (Apple Git-155)

