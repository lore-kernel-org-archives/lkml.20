Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792535405;
	b=BEpgyN9isIw1DacgNfR6NJDfuIcFIe6NLhToGVa3qb98PpVt8RdcfAl4SgLwzvPjD7xM
	 9XReG+DlG4qy1+lk3txm1yn16J+8VBpLZpGlrd2aNic9SmCjVUhn3vVE6QvWZ0FAh7CcG
	 5c9iGn3kBLtdKCOtIwuMbBe8utmJiVRCW5vNlpOD64YeE8R3sd5pM13Zyj5y5qqj+J4LD
	 fpdNaLMJGg6UIu2sSJUo953r6aeyEr0ya+80hFSWl3fAxBH3iicknT7OG13djgHExYaOm
	 SGrzi9v2DW46+l/zNlPyrMgazuEp6E0c1VunwrEDdozCngewtBebM3Zrb+pPF2KTVaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c5assFKVMGGXUkEMinTb1XrwHt0i1wfhDNtcpFfaGgY=;
	b=IpY4THXvVgQD1LEL9lx0WB/Mpo8YOkBPyYPq9rN+jdMKhH38JmvPiL4OZQfSNCbKU+wR
	 BUxEen3cvV/eObT93pWC9ceBLtYeV9wJwkLyJjk26t+5v/NV4kzht7jn+Fvehkqr/Xnm1
	 EU3xfQM1O9z5TxrjCJFO/Put4WoD8EbouQPyfuxhHVA7TUPDXhtModP+xhfp6ZNsXvFVr
	 D+OGS6zoBucAhHQlEE6hb2V53okDUF/nnC/cgXlFzcwyqzdCFe6vDsruUWA9FDdKKZzAm
	 7ttUuvIPnes0NU2l7KgjiXi3u6RuGWhRDFFCREqAsuMmIICAMW4TlFa4BGxN5sayO5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T4+D2npb;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD5E606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD5E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T4+D2npb
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso21869a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792535404; x=1793140204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5assFKVMGGXUkEMinTb1XrwHt0i1wfhDNtcpFfaGgY=;
        b=T4+D2npbKehi8mG3vCsjpP/dcE49IbSfKR9nhngdAG/p0kWORvvktmyiSdh2ytzOh0
         rg0WDbr0tu82Z4pXRxZS/QiXwUuBSDYGU2Uqd4fdnq2leNFgyoPcZmlKYHsLB73tAwKO
         IpAyUHcoh1qupgoXnF30to4G53LIjdvcimGxWzIrMU3kagtdsriyhlXGlJ8Y/sLSkkv9
         S5mlsAAE6vL/S/2TLBYsuf5jIZINIAYNH0zL8Yaqd7st9BfuzSyVk6f6ohm0T5vs99x6
         FUxb0t2i6qXAEe2aQ2ch9if20B17T2Csmbef6Y0QAxn0pHO1RsNFpuZerWbswGTUUdYO
         a/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792535404; x=1793140204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5assFKVMGGXUkEMinTb1XrwHt0i1wfhDNtcpFfaGgY=;
        b=RFKFr0EF/Fv+BhxOlEamao1jmcJt5OD4FC0o3zIPd+bj+mv3Zm1FbpWYIB+KbSPVa8
         z/QCYYjFwsg3I9CrFY6O1I9su/Gw2DKvSV8Xxgzx0j4x81sE9dxJJ3Isq648MIfRuYjx
         itIrq4c/zl3PvYNm7A9RE5cfQ8PaSwC02GQ5pnD66CrtWTIWjPe5yz+DUL4pULFmeSIU
         gXhviRS3zZMlwMy4HQlVidC2Xd3LCuaNkp4Tp0VGrf8qcSHkUDfDMGCQZog8yKsBfbRK
         sTa8LVDJoBMwM9ny8NAugt6kYMhKs4Kyg1kLedElGlmueJzdnTYHfie1HIi2WMRUEjAE
         jqaA==
X-Forwarded-Encrypted: i=1; AKwUvBwOUhaOYzIzTRht77tdWPrYkSIVGW8zfGm2IOr0o+SppFmSFmxvm+wlIY0qLnl0ROwkyj/jJCIYV6SmF8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKd03gPDNtr96NHOgRpi+GwgeYLrJ/89qcLqEZuTzmMW69G5gyD
	pstdvRi+P4J0XVgbzM2g2MDkSpRaPkFMJRZFc9nsX9DriZ1g3sNdGdej
X-Gm-Gg: AYBFou057pmyu9VVAi2RJ8CelBWuwYJ9Bsl8IyIDqlR0yNz0IfV6ImkBUmdNo+fXAW4
	jNyfmmccaBsyLjO7qQTgg9ZdVSQ24+uaZMTAo8WCfT4E5UkaetHanTxiFhu7lbsASKVnBqU6Q0K
	LXglJT/NkAtN8eGEQcd08sUmvH8KtjrG+Zk4atvRMnbffznWVvS05++2K4LUSL0AjtddMB9Nd1W
	JeY/j3f/aB6gy+ZayJofhWwS3Bbtkp798ZgWvRsUUUOCaunut9P6d4RxSjtCmoCwlhj1BqzSVao
	AnTxUCwqbo7xZALSsFqb5iXnjlIJTu+K1u/4ZVvsN1SY4bysuJTVPW6BPN0u1eqF3f4lhedlh6I
	31JJkwNWJJ5xbsjY/rC/z9+ARpRBwXPApJCHOTtKnuA55DuD6NPAIMGqjyWTtc7G/wuppBrxnBX
	bXX9pFdLaORcuZYswUaWgytbgEh3tm1p7AYxVVdW93qF8T0sWVLhqaJskT462XOrh/kpYjftuZe
	UqCp8aT/vDlge7Zox18IF3ZSkujxVPssyUHV4/zof6Aff/m2IhewMa67B4n36abZaShq+ALuPXn
	ighRoFQ3awKofDIIpwBhj9CbA51yTUbJ8K1z+PeGu3Pfiyh0
X-Received: by 2002:a17:90b:4a01:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3ad86f73614mr225924a91.41.1792535404295;
        Tue, 20 Oct 2026 15:30:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813dfa5fsm1123157a91.14.2026.10.20.15.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:30:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Lamparter <chunkeey@googlemail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: emac: release DT PHY resources on teardown
Date: Tue, 20 Oct 2026 15:30:02 -0700
Message-ID: <20261020223002.1749284-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Disconnect PHYLIB PHYs and deregister fixed PHYs during both probe
unwind and driver removal. Without this cleanup, unbinding a DT-based
EMAC can leave its PHY attached to the freed netdev, while fixed-link
instances retain their registered fixed PHY.

Fixes: a577ca6badb5 ("net: emac: add support for device-tree based PHY discovery and setup")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/ibm/emac/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index e7043523457c..4124a90b18c4 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -2810,6 +2810,16 @@ static int emac_init_phy(struct emac_instance *dev)
 	return 0;
 }
 
+static void emac_cleanup_phy(struct emac_instance *dev)
+{
+	struct device_node *np = dev->ofdev->dev.of_node;
+
+	if (dev->ndev->phydev && dev->phy.address >= 0)
+		phy_disconnect(dev->ndev->phydev);
+	if (of_phy_is_fixed_link(np))
+		of_phy_deregister_fixed_link(np);
+}
+
 static int emac_init_config(struct emac_instance *dev)
 {
 	struct device_node *np = dev->ofdev->dev.of_node;
@@ -3197,6 +3207,7 @@ static int emac_probe(struct platform_device *ofdev)
 	if (emac_has_feature(dev, EMAC_FTR_HAS_ZMII))
 		zmii_detach(dev->zmii_dev, dev->zmii_port);
  err_unreg_commac:
+	emac_cleanup_phy(dev);
 	mal_unregister_commac(dev->mal, &dev->commac);
  err_rel_deps:
 	emac_put_deps(dev);
@@ -3220,6 +3231,7 @@ static void emac_remove(struct platform_device *ofdev)
 	unregister_netdev(dev->ndev);
 
 	cancel_work_sync(&dev->reset_work);
+	emac_cleanup_phy(dev);
 
 	if (emac_has_feature(dev, EMAC_FTR_HAS_TAH))
 		tah_detach(dev->tah_dev, dev->tah_port);
-- 
2.56.0

