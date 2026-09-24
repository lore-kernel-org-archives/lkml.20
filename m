Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4005536897C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257893; cv=none; b=dwzC8PfgIYV/eDYJ5dUa6NSiGaN7otfsQr7xAz49TFobcIuJf+Y49CvHcikhM+zwu6fCpFI5H8vl+4yVO84Mn07uoy5wnT9A9dD/gMw3ZXJ0cxOL8Lw/HD9EhnhathaAkk3qrvCZITSn6iQGvR+JH6tOvhVrwzATZWLoDsSAVzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257893; c=relaxed/simple;
	bh=t5Wpp+R6LXu2QFtUVal1E1+IOI54rGsNMSUJETFP1x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSjSW1l3uQ8MyE2Hpdj4hqrM3489qCz7bT+dHk/FmZFPp8mt3N2v06c7TJNCz6DIPYQWghQ2wQ1gMgi6LYMdX/zZS1Q7mdQJvh0gNjUlV9BVikeKs///BFG5Vt3ymnPgkrvf9MuO9y2PfF1dVNX41mDakU5TFNHuGRhc8TJykeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFSdZ2hv; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFSdZ2hv"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so1246792f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257889; x=1790862689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6HASGHD+lRj0S4qpBGA5C8WQuEbo4NLHpp5wcEzg5F0=;
        b=QFSdZ2hvscJH4ULY8Q8T5gNztDEm9JUdfhufK02Xe4ufffb+HyojzEB1ymXyHQRkwF
         eeK2IG2/tPUG7dasTVYa4kIb5b6QSAiOehTjHfHG3ik1QydUDS8SQ3RCM6eOIc9HOTpn
         oqzhTzM0XZRF12NtZujV7o7npAvmNALwt2BiuglYtTQBuea/VgTqqeDsojFeU+CfLFml
         /HOB3umd0cg/CnCy0e4TbTrkxqeIe1CRmdI8DcitBWb2Ac5/D70yD+AKvCw9MVLOlYer
         MEeE/iheerP+yuRSaa+VhRLPOrA4Jir88Z2yGiUS6gZRRtFU5ztd8IvYthAfklC/p538
         HFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257889; x=1790862689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6HASGHD+lRj0S4qpBGA5C8WQuEbo4NLHpp5wcEzg5F0=;
        b=dQPK2oC6i9aSaMisxhXeQYMMHZWzE4qnn1A12EXAdONKSpy77fQ4p0TbqfZpHjeDuI
         OO70B7fUvDqUmWj9RZHq65YNxdZa83Ey5oXnBBzQ/jfwoEZ2jQ1rC5j6rUOr7EZvzVuK
         Dmsfj9+oDLoi42Yww24snEeVaPax1H92D/wMoJZkkifNxfEmr6VYqDfpX5xcfxg93uD8
         t+vj7f+3TFpLj/dOdLEfDEO7abjYbyFyFjCgmbUP2Qt3kf78G+xOh/GuYkXo4xMG/XKx
         W0cmTMtlEnQvGJymBbapMz4gPA1CzEtrGFs4aBDYl2IPE/3AvQMgt6HSBkAJ83kEcaZj
         60Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzHwqZ7vjsJR6eYzfmOl2IGvpdaRrtz9KCDONdbz81oxIZQeOa7mGcjYlyTKSmA1CKdkbQOOmkcyKbXl+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++m2nXD8AX928zNCebUAEOR1b0wRG/ubSaQBdiuzfUJHIxl0wPoS
	BMKlozoGUEaLMFfLmg/S5+EhaLJnCwdsL57eJDl60sG0uJDrYGp7GTuk
X-Gm-Gg: AYBFou22wdLyqbqUIFIhocCPeieuo+o3juIoLsbiDqjITSjeF8MJ/tIXBduH97nl/q2
	hNIsEclI5bqyMOQGmqjvv2oBu7xULX8aX70ddxFkiAYg25Cv04TIORHu94WypH7ivJUYtii3dta
	u/cY6SsDY8Y7L55zcaFdXJG2Te+hz9UbBkpvGRPNHe9YTVkdqB8PRm+9achhA03EEV5mVJ8IWzD
	wXnlrC5IOV5ctY+JrAbCN3j8e8H1HhqWxKeQu611QRmqTb431Mblsi6wjUK1x9apqbyLr0o3Zkp
	gGMnITpsPKhI/JbW7FlldAOAskCSzMbjC51Zgxc2MJmz4ky5XOsJHji+dBiXalN3pLKn5MYvQvG
	O0km+i8djlhyZSW+ED+T552mtbB7gwg7+YpiOx58cgvr1cL8Nd5HBycF/YZ7Htm+aARpo+1Cs/i
	pOGE6x1Jo8LSXgnVHj9mf3SG+ybkOavuopg+pN5PRvbrzAfoTlv3IfHziB0J4lKB7KAZg2WriOq
	nLPNKe+ebQvNOaj58VUxA0+chB0INUzodU5k7ul
X-Received: by 2002:a05:6000:4816:b0:487:11db:9866 with SMTP id ffacd0b85a97d-488716b7ca3mr3656273f8f.57.1790257889326;
        Thu, 24 Sep 2026 06:51:29 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889376sm12060660f8f.33.2026.09.24.06.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:51:28 -0700 (PDT)
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
Subject: [PATCH net v2 4/4] net: axienet: reprogram the link settings after a DMA error reset
Date: Thu, 24 Sep 2026 16:51:16 +0300
Message-ID: <20260924135116.185161-5-maimon.sagi@gmail.com>
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

axienet_dma_err_handler() resets the DMA engine, which resets the AXI
Ethernet core with it.  The handler then restores RCW1, the interrupt
enable mask, the MAC address, the multicast filter and lp->options, but
not the link speed field of XAE_EMMC_OFFSET, and it writes XAE_FCC with
only XAE_FCC_FCRX_MASK, discarding whatever pause configuration had been
negotiated.

axienet_mac_link_up() is the only code that programs the link speed and
the negotiated pause bits, and phylink calls it only when the link state
changes.  Nothing about the reset is visible to phylink, so it is never
called again: the MAC keeps its reset-default link speed while software
still believes the negotiated one is in effect, and on a 10 or 100 Mb/s
link frames are clocked at the wrong rate until an unrelated link flap
happens to rerun axienet_mac_link_up().  axienet_open() avoids this only
because it runs phylink_start() after axienet_device_reset().

Tell phylink the link was lost with phylink_mac_change(), so it takes
the link down and back up and calls axienet_mac_link_up() with the
current settings, under its own locking.  Do it after the final
axienet_setoptions(), which also writes XAE_FCC, so the negotiated pause
settings are the ones left in place - the same order as in
axienet_open().  Skip it under the same conditions as the queue wake:
axienet_stop() stops phylink, and a resume restarts it.

The link going down and up is visible, which seems right: the MAC has
been reset.  A frame may still leave at the reset-default speed in the
short window before phylink runs; the reset has just dropped everything
that was in flight anyway.

This was reported by the Sashiko AI review bot.

Tested on an AXI Ethernet MAC behind a PCIe endpoint: traffic passes,
including across ten down/up cycles made with traffic running, with this
series applied.  The DMA error path itself was not exercised.

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index f16dbfc7dc93..d53f7dc7bd22 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2801,8 +2801,15 @@ static void axienet_dma_err_handler(struct work_struct *work)
 	 * device was detached for suspend: axienet_stop() and axienet_open()
 	 * own the queue state then.
 	 */
-	if (!READ_ONCE(lp->stopping) && netif_device_present(ndev))
+	if (!READ_ONCE(lp->stopping) && netif_device_present(ndev)) {
+		/* The reset also cleared the link speed and pause settings,
+		 * which only axienet_mac_link_up() programs.  Have phylink take
+		 * the link down and up again so that it is called.  This must
+		 * follow the axienet_setoptions() above, which writes XAE_FCC.
+		 */
+		phylink_mac_change(lp->phylink, false);
 		netif_wake_queue(ndev);
+	}
 }
 
 /**
-- 
2.47.0

