Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12E1349B0D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705706; cv=none; b=NhzaLYHQbpVkJbqxlczggPiazaF2gnRR6Twjl3YvYmacF7I3qhfHeJSQZQrQaV5718ecF+keIMkiGKN2ZHBVlJPy26L6ChqQqvS2sxGbR3AIfPQnx35A3Tdf7zkX8/15mnX5dGBabelyZl8nswlAZV+qN8XrCHQKX2zSAIPGNDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705706; c=relaxed/simple;
	bh=gGqMfb0mZ00dpgEGGq3pBv+M6NbKCtJNRN37oILdpbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bKv2rUlP9gmDbVx6rXWA2PKABzw5UkuCN7bSWlN+NsfaXL/7wwKuHoli5b+gl8d1NUOw1ZckVPshwiuqwve7yYCwvgLYAAulPuWDfYK/EgWirVKVqENLqaj3tR3HdPQFUUO1iruxlSaMRYBIOKsPirPL8iwkCEnKrX/3qhHs3Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJ61Aidt; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJ61Aidt"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396cccbba91so220531a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789705703; x=1790310503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTJNZFQzN8h55ADSd3YdqRemM2GmjoMFnZirfF3PNDs=;
        b=rJ61Aidtg3CD/rJxjVYtToJn73tkPidw5Fevt9+xku+gPusIK+XEy7W77tyk3aoX4Z
         Ga/Omdz8VAWjtWqPJDd9KbNKMnI7a1LBWU1XmX0WZWdSqVNpybaFZVeohiXQVvXxi4jX
         WZ+dijLMqNn/32girLMoXvHgwrdZM01NpTr4JwSDwI+7hHFsbe8HeeHZZMzDBKQlkZTE
         EFppCfYmoO3flcYV9/CVuhQjmlsDm3eRZKaWVzE0y87qHic41eZMsVq7T6ScdkdGIKzX
         WqbgZ0kmv6COBUGjdmt+DhvEJE9wrDZGaO1ok+v37SFMPsFiK8kUK8V9H1B1wm3k348G
         Vhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789705703; x=1790310503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTJNZFQzN8h55ADSd3YdqRemM2GmjoMFnZirfF3PNDs=;
        b=zj/j+nLF/bIExLmgIpkL44VseRr/smawFPM0vflBFqfRU8mPxr21NeDAs9CDmmKiyr
         CBd9HXGVxDxzQNJE3AkiXjwFRDRQrpWg3i9jjc9rt+lehcI1rdtNjVoSZC4V18MXNYtP
         9/mZ0q0TCICxCyN2LChZ5X8P8PMsAb7adRVYeNfTXxZZh4vhfMyjctKH2zR32Vy6HRvb
         EngjuPqOh3GnmdKJ8+u0xdXsx4BGvGxpZ99w6uQ4Rl4a3/b9jCkdkVZ2tZoM186BAMAW
         IBlPjp7nCtAg+YRGDQvDI+pgKG/459fZAtvddTNqYZvpqGf5kugzsZ9yImYyPOxQ6VjX
         VgEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXdnenh8faiBsWKNAf9B5PSmInr/geXE1Ce/DLjLZ1Wnuiiw5ETsC31+FYTnxdaQ0wI7Gkw5x3AKqc/lI=@vger.kernel.org
X-Gm-Message-State: AFuF++kZhEOjeL5+alylmCCI5YKVGXK/7R2ZKJPsHtYHTgU1KP9HYnun
	mgIqWQxxDomeFQkcXjnsT+ILZDv+/6uJT1FqzfGnq5+O/Op/wyDMZK502cPXgg==
X-Gm-Gg: AYBFou37+Lg4BdHeRH6qA8M4zam8W9ivf71xaLP/535U/5ZVEDbl59KND1as+HDzLol
	gRtBXP0/X1b/lgwEaiAZ/WTztARseX52DiHv2Pnm6O6kZk3qXEIGiX1KORptFvyb6pyWMTF7cjN
	Cm4jG1a9XHWPqUo73/9gZYdyXcvyr9vpy6Vsl2QbfBxk60qZZvh6MKgOSG7PryDU/gv+hvABFMy
	UjreQ+vyAvojGh700lTKegXGn7MMjnCCrj7ETOtnVkUkeZ13+pt8vfRZ/pWMGQVaSTv7Y/atFgP
	1TcR1/2pA6wesynnQaVaXnFm0N5gS5dQz3307+6/O5ECIGj2AJUh4IGKBatXND+SRpU/cqHSOvZ
	YeYUasH0mD3nNuvDBusGmUriL19UdzpA2R5C68e7FbE3N8zqlEKgJNs9KoCuqU3ldU9H+yBmX67
	IwHx1qdkthmyJA2HQ2LUBUW1+LaqtZ0idQaL15pwCBtiwO0ZcqadvAEFE1w/isaPO0Sa4t0QoLL
	wjzZTbelzxIyFjW0vZ4C661DRRRWOxBMLZVXxIZSF1zfTkm6PrtGILxBUKzywPVcbDBjkPrDbdX
	+wFd8+GeshLhmZuuIfOADxxZhQ==
X-Received: by 2002:a17:90b:548d:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39e54d11d8dmr2910601a91.18.1789705703042;
        Thu, 17 Sep 2026 21:28:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e361b8e1asm8119606a91.12.2026.09.17.21.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:28:22 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Jacob Keller <jacob.e.keller@intel.com>,
	David Yang <mmyangfl@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Nishanth Menon <nm@ti.com>,
	Wingman Kwok <w-kwok2@ti.com>,
	m-karicheri2@ti.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net] net: ethernet: ti: netcp: fix pm_runtime usage counter leak on error
Date: Fri, 18 Sep 2026 11:28:04 +0700
Message-ID: <20260918042804.13101-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

pm_runtime_get_sync() leaves the runtime PM usage counter incremented even
when it fails, but the error path in netcp_probe() does not call
pm_runtime_put_noidle() to balance it, leaking a reference each time
resume fails.

Use pm_runtime_resume_and_get() instead, which automatically drops the
usage counter on failure, fixing the leak.

Fixes: 84640e27f230 ("net: netcp: Add Keystone NetCP core ethernet driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/ti/netcp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/netcp_core.c b/drivers/net/ethernet/ti/netcp_core.c
index eb8fc2ed05f4..4f9e20468bbb 100644
--- a/drivers/net/ethernet/ti/netcp_core.c
+++ b/drivers/net/ethernet/ti/netcp_core.c
@@ -2225,7 +2225,7 @@ static int netcp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	pm_runtime_enable(&pdev->dev);
-	ret = pm_runtime_get_sync(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable NETCP power-domain\n");
 		pm_runtime_disable(&pdev->dev);
-- 
2.43.0

