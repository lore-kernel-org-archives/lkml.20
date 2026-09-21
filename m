Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F1E2147F9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996184; cv=none; b=O2Z7SWnldmED99Rj8J5ALetqjBs7XpwPwZExeDrhXWZRnxC4L2esCS294Kx1f97fNogx8xs1A4g6TWTZ7Hs/vJtkQSliVo5wrXHhAA9/vkgjxuOq/FVzhtKQ0HMHfuxEwvPxIIAw/A8BT0dN5XAwLV1blngw0xuxodie4vPmuNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996184; c=relaxed/simple;
	bh=eiuWmlpWIrVmvRukmtMzZVNhvzYKEvXfj3/9QCPxu5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OCRk4IWGSPR2WnbDQ/Ng4BxJFdsYAs1f2bZYyK/Dy7aNrKd9rsv+nqLw4GOBCp9abz1Jjs7y9sZZO9zlOyY8Ck5pa4oXaX3e40KMJk2DXhjnf80bySf3TsyLqetIDYqms1fjUCobqDw9oDBvuF3Xgncm7yNG2pW6/kQ/QKKlYxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbH46PJU; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbH46PJU"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ceb47d55so533662a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789996182; x=1790600982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=snQf0hJkQsH7Jj4aS5id74hgw0NIowrU4G8FGq6/9fI=;
        b=gbH46PJURVM7ZTREuV2r1oNue8DRiPFq/kT5g7aJL3XK4lYzByd8eOkTSgiiB7jnpj
         yQDsXEZXreurjXy/ZoNr1+ONL802AjHj7Gy5kEiP1t8/hJAnRp63CCQWzhaGFo5L6sv8
         CTEzWr1vfh9Dx/HSYjTHUhHbIz6gXR3CB2eaPug6/0RyHeXHCvVNby/EouSqxEpocaUd
         dYmz5PBMW9SooxNapP4pl7MriU+wEGI49pN/wxKRVNVBBzq5pLs9SggDkDplycfIrC27
         F63d7oFB61q0NFezBPL0d3YYRcNdC6TLu0wIVcQ5+AUbTzUJu56hMrMNPZJ1A7bNs8rj
         icHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789996182; x=1790600982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snQf0hJkQsH7Jj4aS5id74hgw0NIowrU4G8FGq6/9fI=;
        b=lpAvIcnhBYBOMAokJccaiTg1b7wY/S0Vbu+NGiyIYhKOpBPYmPkAqENZBguD/fzhNN
         3RNgt05V0x7ok3xeK6sKe+Nhx4Q5g4yTmSBOeUK9/JsIaxPAayLSWjcLWN0bLVhmlmDt
         6dE4C5/U2cwroFRrSQb4neJL+/neT6f0mpK4IAhzoXhz0k2ubKs2jJoR1V/hB/6oDPE4
         CGA37DUop/vKCgGCcWNcnme9xDrcUI/odSkKwdOYKV7zGaLUKxHsRMMADSi9hQquBCfC
         9xJS3CYLyvWmNPzcdn0ZJH8ikHaSOc8ydHKxhTbfwHG65+dq9MvMlHyGJae8VYxkr4Qr
         yI0g==
X-Forwarded-Encrypted: i=1; AKwUvBwUUUkBRtJ2qd34B4OR4qG1pd28U0IzMN77Ee43379kORBHbfdqI+goKr9YfIfBVskVlWnmBPCxfSHf1Vo=@vger.kernel.org
X-Gm-Message-State: AFuF++nIqfmAUlbpZME8/goyiRGPNS7qLphS1HmNfPDhwIXmWKDwAmW2
	tyArX1YWjmxeNS3MmaghMyHtm+j6o3rsbiIdst6F9R9eZfTycgytvEmL
X-Gm-Gg: AYBFou3temrHtXKgQbRqV+VE+TCa4K02alQd7WvPqEhlJG+5RqKysu8ZFBz9Bzzeb6u
	UjRkU3Wuj4c3DJZRvATz+9j92gda6grlPL/5yiA/Sq5KWou8BqIPEuBHGrOVycTHRfFM7sDm4xT
	Ec3qK/+dtFqTQcmiQjB2l0LkQDosOcBStC3yDSGIPOawWHqSQeLrG7AE0og2MbBKBk+GpFDuJ0A
	J68yrxkrCaqtg9fU9o4ncu1doEvH9DXc4fMCHp7LIdKRoqCFhznOyALiXWALw34zH/Zn/dH9EHb
	U2qFTEsHkwF24mTqGk50jE07votbUIHlk5txoBerOqT8b8xXBPaocsE8twUpA75B/JJPS3Wr+WJ
	Qn24dLcIUt1AAa0fgV1s6k7IhaTHTkNjRc/cnDktpDLzjZ1nsqfxX7S37ws2hlHGw+9wzLtTbZr
	mwbkdDyKb3OBTVJTaZHYQ79Wm7qAyhSUfY3lOaYDyZdANsc/F2pnvsnQ==
X-Received: by 2002:a17:90b:2890:b0:39e:3dad:684f with SMTP id 98e67ed59e1d1-39e5546c89dmr10847172a91.4.1789996182395;
        Mon, 21 Sep 2026 06:09:42 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a023e44854sm5275079a91.4.2026.09.21.06.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:09:41 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Justin Chen <justin.chen@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] net: bcmasp: fix MDIO child device leaks
Date: Mon, 21 Sep 2026 21:09:29 +0800
Message-ID: <20260921130929.403129-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcmasp_probe() populates MDIO child platform devices using
of_platform_populate(). If initialization later fails, the probe error
paths clean up interfaces and clock state without depopulating those
child devices.

The normal remove path has the same issue and leaves the populated
MDIO devices registered after the ASP driver is unbound.

Add a separate error path for failures that occur after the MDIO
devices have been populated, and call of_platform_depopulate() there.
Also depopulate the child devices during normal driver removal.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/ethernet/broadcom/asp2/bcmasp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
index 972474893a6b..c4087408a822 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
@@ -1309,14 +1309,14 @@ static int bcmasp_probe(struct platform_device *pdev)
 					 sizeof(*priv->mda_filters), GFP_KERNEL);
 	if (!priv->mda_filters) {
 		ret = -ENOMEM;
-		goto err_clock_disable;
+		goto err_depopulate;
 	}
 
 	priv->net_filters = devm_kcalloc(dev, priv->num_net_filters,
 					 sizeof(*priv->net_filters), GFP_KERNEL);
 	if (!priv->net_filters) {
 		ret = -ENOMEM;
-		goto err_clock_disable;
+		goto err_depopulate;
 	}
 
 	bcmasp_core_init_filters(priv);
@@ -1327,7 +1327,7 @@ static int bcmasp_probe(struct platform_device *pdev)
 	if (!ports_node) {
 		dev_warn(dev, "No ports found\n");
 		ret = -EINVAL;
-		goto err_clock_disable;
+		goto err_depopulate;
 	}
 
 	i = 0;
@@ -1369,6 +1369,8 @@ static int bcmasp_probe(struct platform_device *pdev)
 
 err_cleanup:
 	bcmasp_remove_intfs(priv);
+err_depopulate:
+	of_platform_depopulate(dev);
 err_clock_disable:
 	clk_disable_unprepare(priv->clk);
 
@@ -1383,6 +1385,7 @@ static void bcmasp_remove(struct platform_device *pdev)
 		return;
 
 	bcmasp_remove_intfs(priv);
+	of_platform_depopulate(&pdev->dev);
 }
 
 static void bcmasp_shutdown(struct platform_device *pdev)
-- 
2.43.0

