Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD4335E549
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 14:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791036579; cv=none; b=Lr0QOkFMUKA8yBc5Lo/kwFu3+UfysL2rCgHOyxJrEhQ5biHaBvIqeo1ScMLeo1tpTujxFZyFxI1wQp66VCBIYW0zLgL6FJDRYXf5wqeuZQ9kWij67w/3GdY7X3aUAWnprCiMBgfWqJ6wAkYQB2spMMZdqit/JM8H38BC03/58nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791036579; c=relaxed/simple;
	bh=YbyQY7JoE6UOw92mTJzHWd+BaqMC9pONrFNAMHRtJ5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZVa6mhYp6KSerhA27CUA4KxdjbmsD+m2wYv8U7WwcQ5fhjIunlyaG7GzyIosTSky19nNT0bKAjTy5/WOybwHpA4EEnZ8U/JSodeeNY6iMddz7Mm8mV4pOzZgSfYa32MOhRSBpCqzCzTZdBIy+1Nyc+LBRrRDncDxyVXgezKP/wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGCRv4w+; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGCRv4w+"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c4f4daso333189f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 07:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791036572; x=1791641372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rG4jTd4nM+pkECs4oXcMHGsR3oQ3Ii3v3Uq1Mfg9zkc=;
        b=NGCRv4w+emBtEM2pyi1sPC6sQnAPbo63O1BbXiMnUFsqnYmydzQkRg33rqQ/W61KIT
         jYSKHiM8EUUR77NIfW1MMz0J1To3mAvJZz91/FZ/jbg5PRtTP8WJsjA+bjIV+FW3nNpP
         1QYn4w/gxSrNpwUeOw/wvaEtFiq/vxym0Tp24m3Qg4kIS4/eWJSiF+I5QdxesvpcJF1K
         FxNmY3shlVJ43q0g1JG7B2HyIJdwfmgFOl6in7xohvW2AHMHORunDoX+gBkN3vFciGLS
         wt0jZ3wcB6xVvKJp8BmQLxjChr2QTzzL9BkeYzCQfyQi2oxOWkKzqsLZqk0EORxvD+EU
         AWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791036572; x=1791641372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rG4jTd4nM+pkECs4oXcMHGsR3oQ3Ii3v3Uq1Mfg9zkc=;
        b=UH5u3B5/AhVt2s1sGsZdpbR0gli4TL0RO01upngUdyWoGwi2pq1k8gCVno+hYNgKIT
         MHVpyzZbgna9K/bwnPaP0bTkoR1wvuOt3skAWhG3CHQdRSRrHy37gTIyPNE5XzhcTph/
         jkP32v0ncsLxpr3X08sKHUgckKSO1aVx6pRMGVTfMxOwTzIOOkyo1r6/cozuUGP3x/t2
         wkbrBy7drxa46g2B6kz+GHKMVDLaqziaqQvUqcIl5gDqQgz8ZUvUYmlaPAKmLhp6QGrc
         86kxQG4yNhfnQhOj27hvSZWroTs+ws1Mv5o4FtdySK6B4i/rMTou8lt5oBclLllQ6Fby
         GrIA==
X-Forwarded-Encrypted: i=1; AKwUvBxcw3aiFlDISAQidw1VElmTiqR9RZUnpl63G12iYcO97Q9giVBobd6PIKlCAv3FakKRqKJvLjWVwp3rS6M=@vger.kernel.org
X-Gm-Message-State: AFuF++nzCvGq2YYILvZ2GBYS05hW+NBYwmITLJAQGpmg4qEp0ZUDgzU7
	lx5a26hSkc8Gt6236vr4JMezgvRzBA6NLCxoWjzgcTDDp3s/1J5OyvVl
X-Gm-Gg: AYBFou3lun09nVPWp4iqZESTGnRQS6ykGlawC2KsD1VPmF1ZLMCLyYxrF+E94vW71Dj
	zNe2Ebl5ldjJkxwerZtJUfOuKkfwuVrI6o6Bij9ohPXG+WhjIEY6XEXuBmHXyTxXMhcJZMU6oIq
	Po8ZsmoNgRK2OFNjtT2VtpmNfPXWWu4JljL/EBZC8vXgpHB3GCfhEY8MMfzMqWm9qvDPoTi5wc+
	IFgnqxH+XP6H+eHGm9mzRSNjaWwSa8k7JfE3Wy3B6jXC2UZ8AZdl7YFmu+OPG6YZq5v/MwFARVE
	6rpmpfI//uWJ4+buC5Olrr3/cuBhQgpFrGAqppwHvsjnVwlCnCKALNm18I5uYnxQdVbLIQ2X/Wj
	nbH2+MlaL6SWtmZxBCLhiwQBSHx+vsim+hq+tnIxEez3MxXMy99ePgt2gl+JAgkG5Yxjdhbc2os
	bg98miZZiqYs9hDEAV5XGRnOLRwkP12MDAw8Amt2sZn87KLLFSdEd+R2ef3Suy6YQ+WxTCePE8G
	/WpsPI5/o+MZWpI3G2hgY+QXxkD3KQKrBvIK8dpTs+fdSxfAcRFTq5STC0sWqTZnIhI3ybmAJX0
	np6YuQp4mgfBWwTj2gr4e0hTqv7vYFIkLi3ce5cVAIvMAGXHiavhu6/jZvli4Kz1VJ9QEMcXo7r
	O0w==
X-Received: by 2002:a05:600c:6208:b0:49c:fa21:1c81 with SMTP id 5b1f17b1804b1-4a0278d021bmr94872445e9.22.1791036572164;
        Sat, 03 Oct 2026 07:09:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bfafasm184098025e9.8.2026.10.03.07.09.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 07:09:31 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: netdev@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Keerthy <j-keerthy@ti.com>,
	Kevin Hao <haokexin@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net 1/2] net: cpsw: unregister secondary netdev on probe failure
Date: Sat,  3 Oct 2026 16:09:14 +0200
Message-Id: <2f459154f5bca89a07dc978c834e98198c08c331.1791035789.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1791035789.git.kmehltretter@gmail.com>
References: <cover.1791035789.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The legacy CPSW driver registers both netdevs in dual-EMAC mode before
requesting its IRQs. If a later IRQ request fails, the probe error path
unregisters only the primary netdev. Driver-core devres cleanup then calls
free_netdev() for the still-registered secondary netdev, triggering the
reg_state BUG_ON.

Track successful secondary registration and unregister that netdev before
the primary on this error path. The pointer cannot indicate registration:
cpsw_probe_dual_emac() sets cpsw->slaves[1].ndev before it calls
register_netdev().

Reproduced with QEMU fault injection by forcing the TX IRQ request to fail
with -EBUSY in dual-EMAC mode; real hardware was not tested.

Fixes: 070f9c658a59 ("net: ethernet: ti: cpsw: Push the request_irq function to the end of probe")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/net/ethernet/ti/cpsw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index aa3531e844e8..4fc59f9f23fc 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1550,6 +1550,7 @@ static int cpsw_probe(struct platform_device *pdev)
 	struct gpio_descs		*mode;
 	const struct soc_device_attribute *soc;
 	struct cpsw_common		*cpsw;
+	bool secondary_registered = false;
 	int ret = 0, ch;
 	int irq;
 
@@ -1717,6 +1718,7 @@ static int cpsw_probe(struct platform_device *pdev)
 			cpsw_err(priv, probe, "error probe slave 2 emac interface\n");
 			goto clean_unregister_netdev_ret;
 		}
+		secondary_registered = true;
 	}
 
 	/* Grab RX and TX IRQs. Note that we also have RX_THRESHOLD and
@@ -1764,6 +1766,8 @@ static int cpsw_probe(struct platform_device *pdev)
 	return 0;
 
 clean_unregister_netdev_ret:
+	if (secondary_registered)
+		unregister_netdev(cpsw->slaves[1].ndev);
 	unregister_netdev(ndev);
 clean_cpts:
 	cpts_release(cpsw->cpts);
-- 
2.53.0

