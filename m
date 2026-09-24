Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9DD353A80
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257887; cv=none; b=WA8EmKCeseeyyEzgNUsqDLQZEviZXfW3cuYRcc5TaFBOMftiYfVU3BvhWDCkGJgrKORbqS5yfoBpbSb2Y56JgUAKY7OROu9YLEO9L6d49SJ45ew4MmtAifISu0oeE+XW+QGK72emTZ74F3Aaq+7OktRm/NbYjNEF5t0K6b5cnVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257887; c=relaxed/simple;
	bh=Bc1mcynftwC3gll2peqBJOnUr4rTFQbTyfAM1Z+PmW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUjSzB1SQkIszbygOpKbn+6ll5B3+5/zDlagTbP0g/cPKi/4xBfry94ytHdtH4ET7QQE9XUURqwoV2q7GMuDIFnIGfZbZe+7wU5xMQMabFWO1KTRVvWZZIE3xKa3YxkDqpLVqOlrYskMvGfwbdiDblnwlpKMI/ZYa/DeijZwTnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1O2sm+B; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1O2sm+B"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351832so1298369f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257883; x=1790862683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+SCOGAJarxrIkpGByhDtV4LsMHglOYq74GINs0bv9o=;
        b=E1O2sm+B6mOlQaf7VdSBMwh6SRX7/DKFcmSX7q0m4BavC2TI3SatUEN9VN7+uiu4x2
         9Qm8leLhfVMvlkF9Ui9xclNjr48/r+dUWefy+jl4yVLewmtoJcuTFASUcT80TR4vD8xx
         n7sy70ah1QHwxhTt3N8r6Xr3hTUiJIb0dEjeiTnVDUN0eVQ0nwXrdvVpoDlkvyjVLTvG
         ztfJLQMduWWuIWHUtR10xcmFsEqMThbdkSYYkz0KZVBJPLqRNwEBvgAYZbFMH5RWfFXI
         O/lFuXoHXBiHMCnxu2pH7ZknrixpCKoXug0zpBzlrBvwr9Gise22zjfvpcvXE7dQt5jM
         04CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257883; x=1790862683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+SCOGAJarxrIkpGByhDtV4LsMHglOYq74GINs0bv9o=;
        b=grJkt0lSViiIANl/D9acAnamxBHiRY1uL2bRbp/+nFVYmc1bE3tYOZ0qpea9d1r1iS
         qXs+SegI2wcCY2URn3ccq7p4ZHVCybrNkSwAr3YdEVr3h3C5vgxAt4jc9zhG02seXiUM
         mDa4Xi3JqbXYbm3Ksh0tWONOfoDlbgbE8uHXYQwb0j9J9W9ty1XcfsIoyIkIYhOfPTbu
         73QFKahU/wQte/oaO5u2fRsMogR1YOgHY0RW80TXYfUE/2AqcceWQDg9wDPPOSX8p4nY
         ZlNgTH6yayQzqmY1Npow+cNlxiaQYqO6AqEoXnQAEFjWVi3wqUNbnsOUIMLNWDPtYvwG
         bevA==
X-Forwarded-Encrypted: i=1; AKwUvBxEopGsYEj9w6QJrTvSm+rE0+NAFNruwSBTqWjyPmkelahYoAw70Qp5A6TNjIezXYMUDkDktI1GsaRf9ec=@vger.kernel.org
X-Gm-Message-State: AFuF++nnE58V1+E1+dG/zO+bmkOfN83xZfUHeCWAoCH60RjNPx/8Jwq9
	xegC3OoGhJBbvK1klUN0f2BZUzQCjJUA05E1jpsZNo9XpFCVlpacBE+6
X-Gm-Gg: AYBFou0BC5s/UJH0U35X4RtllPcNLGZlJRztCt0ZPf5vlOzas52d8lXD120UEckJyQH
	649S2NHZlgHjRF12NO1qexQ85y7pMGakWCrugV+rJ+YQvNuUY8PQml5y944FwC6/BB7ttiXQh63
	ygDlwseW414XmjlsJvLYMWRBkNlKPol/qnOzs2mWJyHMji7xhsnoYI0XKlT5a/ouyag3Rsq0TSs
	c0aZeugkKfUhsQwIZ0s9p2fVeGWT6kJxa0GrPBdR8hkXhBmc0BfsgyncD+RluakR6t2PJGHmzjn
	Y7DKZNP5h76qRKNApt1Qy4JnVxfrTWy1R6hMWNQY7yj3okD7OjSyAX8V6kYDhd7nEnIoMG8oBkt
	js71ofWCWXnwA4pzXZQEPO4d+kycZjjXlUSTXGU+Qd6WIt8QF7bC1DvgToMudrnco5m0B9lzOqv
	4DaynVzP032ButMRImARI9E8SVa4Uw65zoEXp6ilIP7lpTSgLJJjvaaa80IZgRLdAUcMBMxwbHr
	um482Bblki0CC53leeFLQV5vqafMCXXAcn2mePV
X-Received: by 2002:a05:6000:26d3:b0:487:a15:b4cc with SMTP id ffacd0b85a97d-4887171e3bdmr4247572f8f.23.1790257883291;
        Thu, 24 Sep 2026 06:51:23 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889376sm12060660f8f.33.2026.09.24.06.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:51:22 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	daniel@iogearbox.net,
	andybnac@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net v2 1/4] net: axienet: start the TX queue in axienet_open()
Date: Thu, 24 Sep 2026 16:51:13 +0300
Message-ID: <20260924135116.185161-2-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260924135116.185161-1-maimon.sagi@gmail.com>
References: <20260924135116.185161-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

axienet_open() never starts the transmit queue, and nothing else does
either: __dev_open() and dev_activate() leave the driver's queue state
alone.

axienet_start_xmit() stops the queue with netif_stop_queue() when the TX
ring fills, and axienet_tx_poll() wakes it again as completions free
descriptors.  If the interface is brought down while the queue is
stopped, __QUEUE_STATE_DRV_XOFF survives into the next axienet_open().
The ring is reinitialised empty, so no TX completion ever arrives to run
the wake in axienet_tx_poll(), and the interface cannot transmit until
the driver is reloaded.  The resume path is unaffected only because
netif_device_attach() wakes the queues.

Start the queue at the end of a successful axienet_open(), as most
drivers do.

Tested on an AXI Ethernet MAC behind a PCIe endpoint: traffic passes,
and resumes after each of ten down/up cycles and five module reloads,
all made with traffic running.  A queue left stopped across a down/up
cycle, with the ring full, was not reproduced.

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 782f903d318f..fb26d2e39fac 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1700,6 +1700,11 @@ static int axienet_open(struct net_device *ndev)
 			goto err_phy;
 	}
 
+	/* Nothing else clears a stop left over from before the last close:
+	 * the ring is empty, so no TX completion will wake the queue.
+	 */
+	netif_start_queue(ndev);
+
 	return 0;
 
 err_free_eth_irq:
-- 
2.47.0

