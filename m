Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3485552958
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924337; cv=none; b=Z6ABVL1A8DIOV9WDCEKeVxhyYG5KylXAnQIArjSh7Pb403OT3kdmZS1++767UbMBkByLD4T6dD6ZkQJFiACT22TEbXVHKZCGK5yFSEdI/Puhy5CcjfseaUET4rOGKn+WgzzzaX6l9g1eY8CUyWuieXnT0lQNbOxAczu7eOPMcNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924337; c=relaxed/simple;
	bh=FmD6FNbWp9/w6PoDkjvhKUx+Pyh3k1MJEzE3JeITIz8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T0E23SjYkhDH1L/GVIWbOvEBZARGOpVHNUXCvHdncAXgDNUTpIfCcXg0DvXDs4h0RvJ7/E0CvPG0/X7ggH1XztNzayuYDWQt3FQ0t6Meg6Pkwc94KqzqpOPkzO91QU5fZwHiYEcf9QoMFDfTh1iMY9jo2Y/VurUmQhPFs8f0oOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Pz2wW5W0; arc=none smtp.client-ip=209.85.215.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Pz2wW5W0"
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so1440260a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924335; x=1792529135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQY9v+3ERouGCwmAz/IXWdzwQGXdtnY8j3MIGUYv9ls=;
        b=fMJNEaeWCzKTSAuhJps+1pAsGoFELOTTKj3r4ZCcnt6qVT4Oj8rTP8bcp4M4Sy3rWv
         auuuj/0XPy8SC6jk8CSEefay9t2v7xkNUDDI4O1yzcfiTD++Lrxd7SbqC72jhKq3FImw
         T839bsCZfDVgiCZ/j+7GvvU5MMXvSNaNe3+zsq+l7ncoVTJqi1/iBQIAPOmLL2G8l86j
         Rez6SFUkLrI58JADKmTrmfp1EInTDlelNHd4u8gn7VvsMq7psriP+D2N6/DfC2AXbROL
         2EEqJWGE7RzIOC3Lk3ebpeyGcnJw7pjgPpikMCOouHKO/lCJUmSoYGDDrkpc7Q1VzqKb
         KrrA==
X-Forwarded-Encrypted: i=1; AKwUvByXslBPFlQYctmXx5V4/9PRs7siRBof9eoteAeYKeWpCL36FhB3f5QlH1h2yV1mBuuJNoFYnbKkTuwHJ+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAN6X37S5TYLsjbSH8olF8Nv2zlPJcJsP2gzJQoA8rlUHvWKWR
	NqZae0SmDNFgSYC95QMugj63OTzE5zr11y7OfWMjfAH2bTKbP0BJUSlcItD7iH4F9xu+DBnkCLe
	4xry0qV43I2zqz4c+WUxFBvCOOVpjSo8xSQu3SaUfb/Bo7D+1AUXI0u2YBt3tJzQiFopYQy//Tq
	JZ7nIvXXwF28Vz5L4QgxzASTMu+wqivULfDq2byOWMSvmxPRpjFfqwrP5TZJUx73WHxlNdpR9KQ
	cWc/ebSjxbN97iSZij6A+8x
X-Gm-Gg: AYBFou3CNuwVW7deubhOigHarcbCj//uU3ox69nWi/JGspYaXdorpBpDsyEHfH3VJ/y
	fYzaaDSL9W8VJEPHshyEH9FVqxyKY8z//kax1z7U/SjnIDEeimoX1OBHFq9hXg4KTAfroZHq9WI
	9S5m9qojX9j+L7Cz6UGoh48XLPQvj0d7VG7msOZeXKHbovHiazlSZ9chHb7e6JIK42HjvSceqfX
	BhjXCeK94y1apbNy3RXPoblrxnOchyL4borQmTIU7JWreftB5Pc4ZbmIZIjqo0RuRE9Uhe266s0
	6Sv5gDVvseyi6UjAQapVi5lhk+krm+4rtqVpreZ55aGwDYTtR6sZA5H9fnXmxa4TSWTugLndT9C
	IMl/+qAtQnLfBkX8F7zgkplgPW1XX1b4nVB5O0wE+QYPMpyR9D4nUQsa5xLuiIFlz9PF1mj80mn
	jwKhPm3nK0I2E/MrpVEcmYyHMyDHZIWvReTaE+o69QIX8=
X-Received: by 2002:a17:90b:48c1:b0:3a7:e126:4980 with SMTP id 98e67ed59e1d1-3ab3a79c42amr10790712a91.43.1791924334995;
        Tue, 13 Oct 2026 13:45:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ac5f006ca6sm377685a91.2.2026.10.13.13.45.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:45:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-535851217d9so75960001cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791924334; x=1792529134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LQY9v+3ERouGCwmAz/IXWdzwQGXdtnY8j3MIGUYv9ls=;
        b=Pz2wW5W0gkrcJgTSW2cuKJsfJazPuhpRP/80BRi6Z07p6CqEnYjVqpn777E1PREnR9
         HDotZmN1CkSyADfa0cSr7Qd/ebqSs+KnTEh/c9DidgIm+BAiUnI5dmvrGajS6DfGyrAC
         R7ZrMwL+w9YVzarc7bi3/1qQOxBn50LzSEPPs=
X-Forwarded-Encrypted: i=1; AKwUvBwjw02iy62wQUeTio1UVHgUka9CMK3I1xxQRJhqjZAU/sQggaAwvv7I/QkQ2p+Qqrm+yQshebXhuLbgBMc=@vger.kernel.org
X-Received: by 2002:a05:622a:1350:b0:533:8900:4eb2 with SMTP id d75a77b69052e-5359fe119e6mr228861621cf.58.1791924333606;
        Tue, 13 Oct 2026 13:45:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1350:b0:533:8900:4eb2 with SMTP id d75a77b69052e-5359fe119e6mr228860941cf.58.1791924332878;
        Tue, 13 Oct 2026 13:45:32 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535f4eee7bcsm15879231cf.30.2026.10.13.13.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:45:32 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Justin Chen <justin.chen@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Zak Kemble <zakkemble@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Nicolai Buchwitz <nb@tipi-net.de>
Subject: [PATCH net v3 RESEND 3/6] net: bcmasp: validate minimum RX packet size in bcmasp_rx_poll()
Date: Tue, 13 Oct 2026 13:44:36 -0700
Message-Id: <20261013204439.3494046-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013204439.3494046-1-florian.fainelli@broadcom.com>
References: <20261013204439.3494046-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

In bcmasp_rx_poll(), the driver removes a 2-byte alignment pad and
optionally strips the ETH_FCS_LEN CRC from received packets before
passing them to eth_type_trans().

If the hardware reports a descriptor size smaller than the sum of the
2-byte pad, the Ethernet header (ETH_HLEN), and optional CRC
(ETH_FCS_LEN), subtracting the pad and CRC lengths underflows u32 len.
This adds ~4 GiB to rx_bytes statistics, while the undersized frame
reaches eth_type_trans(), which reads past skb->len into stale buffer
data.

Check that desc->size is at least (2 + ETH_HLEN + (crc_fwd ? ETH_FCS_LEN
: 0)) before proceeding to process the descriptor.

Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
Assisted-by: LLM
Reviewed-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c b/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
index 9ad5a982542f..d679c796c8c2 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
@@ -523,6 +523,12 @@ static int bcmasp_rx_poll(struct napi_struct *napi, int budget)
 					DMA_FROM_DEVICE);
 
 		len = desc->size;
+		if (unlikely(len < 2 + ETH_HLEN + (intf->crc_fwd ? ETH_FCS_LEN : 0))) {
+			u64_stats_update_begin(&stats->syncp);
+			u64_stats_inc(&stats->rx_dropped);
+			u64_stats_update_end(&stats->syncp);
+			goto next;
+		}
 
 		/* Allocate a page pool page as the SKB data area so the
 		 * kernel can recycle it efficiently after the packet is
-- 
2.34.1

