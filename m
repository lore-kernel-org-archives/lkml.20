Received: from mail-pz2-f23.google.com (mail-pz2-f23.google.com [74.125.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854523F1ACF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460672; cv=none; b=t33++moGG7d/gTEf76qQhdlVoCCB6XqZyg4aHg+2RUQGYvzfNiVp5+/AOKe224jjqn3MMaVHyCGbYVLOwMhYK8DTetL1KK2sADf8cvi8GZO8eQeNT8Uhkrj9fVjSSLPAYi6Stpv61YPlc0mkaZpKS5hXgMbJvxsl8nBOg7r9vMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460672; c=relaxed/simple;
	bh=VaSVSvGNOEyimvK4Anlo4Z8wexqycRFEXogcDwlR67A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JHRzt1XRRRpwJRifolwLj+uD4+/qcwrvZFiAL+2IOl5M+InQAFOCnaS/ivqTiYm4X5f3jRYTgrtNBC59N1eLN8VPwXnPJzb0isMLVexij/sdPdF6YRvsl1eCChAgKR6Izdy60gqQwEyFhNakj8mo+JdPHwxIoYve7DSGgvHECcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=AZ4vnQsL; arc=none smtp.client-ip=74.125.228.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="AZ4vnQsL"
Received: by mail-pz2-f23.google.com with SMTP id 41be03b00d2f7-cc4d2fe205dso7778a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789460669; x=1790065469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GkgxmHG570UDfiLBKnKDfBvipL+pxKJzUQX50Pt2PMw=;
        b=AZ4vnQsL3TZW1Wr28/Y1ZGo3lqhXyne4c2FxH5RPrRWpXnf4RhXTdVTCQyrWrBc/qC
         a73amykBPBR1Eujos0/9wua916z2PSj6QJPI87ixEhSGkmEaJSbG8YDZdCq3euW0uHxm
         ey2Op3MD3WsdT2wxaxAd5DZrUGTF2GRafXe7CtfOnmGR8p16N/0FiS6cCSKZCXu+rlUy
         UXKylnZi5RhRjz+Bubfv+xE2IadF0QzuWFimEs0LhFkp4dXFkqGWGm+VOZP0TnWLmxYo
         MtDWPVc+7igq6c0HhshNfVaki2pZtBneii4ByLLJjST6xpUeVrvUUCYj+tgNatL2JpDm
         3hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460669; x=1790065469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkgxmHG570UDfiLBKnKDfBvipL+pxKJzUQX50Pt2PMw=;
        b=cvh0QtaLmMHIkK7K8Z/U1c//htfnK5Iu0eJkMxHhFUQn0kpl7tQhIJZ3dniy7pWwMV
         yYfy3VRW6W6WcX2wQCAnqzZtqxMKmcVhBLjDqXS8RI3+Y46YM/f17ERHP6hwKEJQpEBW
         dHs+WLIHVLxKPJXqd4jmrtLA90xX97FfHcQrF7dlq7i1eMVedJApwlO1ntGAViMv16EQ
         TFsIzY2RfF0MVYM4OsbzY683wePhGbH5VeMUiR2R5uWp/bJyIuWkc4HiZ4UqA2OGLV5J
         M4pcsnua3PVseJS2i3q3y/Q3gIgXa9EhfvF3+Dd1qNMshKPeJhCO4kd9J+9P4vxCPiGD
         gw7g==
X-Forwarded-Encrypted: i=1; AKwUvBzlhHs2FyR0hIKCpaxXJ4vTe0fT+bQeBKR8AipWzaRn/mbY7PmibKTknp0TUAxMadmeKr52vOQc0tELp4I=@vger.kernel.org
X-Gm-Message-State: AFuF++noPtGF9M8ODmsLvwNV+qJZVP+oCtRcdhrr/WAT3avtxc7l/t1Z
	oVOL/2lkNbAqFAgPMCDR+7VEubGI3DL6PofYSl5ok7pG99N9pfVwjD4oQJ8p96HC1Q==
X-Gm-Gg: AYBFou19O3Vno8DR15R3tZaDxYXD3286KlG4KZqCE7yFX3Czxh20+yH22otG/aOZF1D
	qjvY82gD178VPAokUnW2y3ohTAUXCvU+v7LsIODRYP3aSIKS1vNCBFDuTbD25IrcHhqiDrDrd36
	KOJgoJUFg8evPQ2E2typ7A7iNDEEKsWKpA1+nazTP7djY+noDFjx/4BgFokXkDjGHBFUj+C6RQG
	5xG6mqIEmrxTYDaoPuq0mBYWndPFiq3wMLZb27nSTJAwZsL4+RllhFEaHIcvrZsU7XtOAr3MrGm
	v+wp1YskBtbW4JZ2UUF+0i3p2z9f4s3gqcxk3XW0OBQcJnqnar3aiu2YQDeSQujRksILAkNDPSd
	A0vNLlIUBKM6yuDOyx8PdyyiLHKm0w01aBlMLxfmSHKjebFldufR/dyQJXBOtF16cJwou5qmbo2
	7bV89Bha3RevQpJItBi5Ggs9cC6ygszcGQr7QaAvzeGuSsOu228ww9S5HeIVVOl5Ke2LN8g+BkX
	tRh63O6MrWsTlZBZ6x8+YsVBpMcGyA5zgoErVax6GFwJlAIbkSXHW2v
X-Received: by 2002:a05:6a20:244e:b0:3d1:be60:281b with SMTP id adf61e73a8af0-3dd5285001fmr315141637.15.1789460668846;
        Tue, 15 Sep 2026 01:24:28 -0700 (PDT)
Received: from xps.tailc0aff1.ts.net (149-169-99-5.nat.asu.edu. [149.169.99.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365bb6ba0sm29374866c88.15.2026.09.15.01.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:24:28 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jakub@cloudflare.com,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Justin Chen <justin.chen@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [PATCH net] net: bcmgenet: restore the hardware filters on open
Date: Tue, 15 Sep 2026 01:24:24 -0700
Message-ID: <20260915082426.703892-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicolai Buchwitz <nb@tipi-net.de>

bcmgenet_hfb_init() runs INIT_LIST_HEAD() on priv->rxnfc_list, which drops
every rule off the list, and bcmgenet_open() calls it on each ifup. Every
rule the user configured is silently lost:

  # ethtool -N eth0 flow-type ether dst $MAC action 0
  Added rule with ID 0
  # ethtool -n eth0 | grep -c Filter:
  1
  # ip link set eth0 down && ip link set eth0 up
  # ethtool -n eth0 | grep -c Filter:
  0

Initialise the lists once at probe and restore the rules on open, as
bcmgenet_resume() already does.

Fixes: 3e370952287c ("net: bcmgenet: add support for ethtool rxnfc flows")
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
Reviewed-by: Justin Chen <justin.chen@broadcom.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Link: https://patch.msgid.link/20260913190052.939955-1-nb@tipi-net.de
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 .../net/ethernet/broadcom/genet/bcmgenet.c    | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index a2305e6428d1..b916080f4ff1 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -749,8 +749,17 @@ static void bcmgenet_hfb_init(struct bcmgenet_priv *priv)
 		INIT_LIST_HEAD(&priv->rxnfc_rules[i].list);
 		priv->rxnfc_rules[i].state = BCMGENET_RXNFC_STATE_UNUSED;
 	}
+}
+
+static void bcmgenet_hfb_restore(struct bcmgenet_priv *priv)
+{
+	struct bcmgenet_rxnfc_rule *rule;
 
 	bcmgenet_hfb_clear(priv);
+
+	list_for_each_entry(rule, &priv->rxnfc_list, list)
+		if (rule->state != BCMGENET_RXNFC_STATE_UNUSED)
+			bcmgenet_hfb_create_rxnfc_filter(priv, rule);
 }
 
 static int bcmgenet_begin(struct net_device *dev)
@@ -3376,8 +3385,8 @@ static int bcmgenet_open(struct net_device *dev)
 
 	bcmgenet_set_hw_addr(priv, dev->dev_addr);
 
-	/* HFB init */
-	bcmgenet_hfb_init(priv);
+	/* Restore the filters, the MAC was reset above */
+	bcmgenet_hfb_restore(priv);
 
 	/* Reinitialize TDMA and RDMA and SW housekeeping */
 	ret = bcmgenet_init_dma(priv, true);
@@ -4075,6 +4084,7 @@ static int bcmgenet_probe(struct platform_device *pdev)
 
 	/* Mii wait queue */
 	init_waitqueue_head(&priv->wq);
+	bcmgenet_hfb_init(priv);
 	INIT_WORK(&priv->bcmgenet_irq_work, bcmgenet_irq_task);
 
 	priv->clk_wol = devm_clk_get_optional(&priv->pdev->dev, "enet-wol");
@@ -4272,10 +4282,7 @@ static int bcmgenet_resume(struct device *d)
 	bcmgenet_set_hw_addr(priv, dev->dev_addr);
 
 	/* Restore hardware filters */
-	bcmgenet_hfb_clear(priv);
-	list_for_each_entry(rule, &priv->rxnfc_list, list)
-		if (rule->state != BCMGENET_RXNFC_STATE_UNUSED)
-			bcmgenet_hfb_create_rxnfc_filter(priv, rule);
+	bcmgenet_hfb_restore(priv);
 
 	/* Reinitialize TDMA and RDMA and SW housekeeping */
 	ret = bcmgenet_init_dma(priv, false);
-- 
2.43.0

