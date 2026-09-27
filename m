Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC72B3B813D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496642; cv=none; b=si/OV+ma2T0LKr+fO8UyEo0okaKsAXILvlSU2qHmQB7Ip3cSMQQ59Z2txRONomDbk2Y6rRLVICHkrVBfOYmZD4Iltbfn1ZeJ0QanPildiL0kY3iRHy8UV58dmsffC6pUkmekoWGtEyTt/Q+2tAJQZ7CG6qKvDtGGMyx+54FLIN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496642; c=relaxed/simple;
	bh=nOi2ShRCU0TeMNd20nnqu8qobdbTpIfXNd+xI6yEhKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cMAqzzkNGMAb0q+AorxlV+ZHBLsyqvTpPJBTzSGr5qqn2koD2+TTEXw6sOZ0dIAmOpkbbXJMHSeM18NOkmwGFq0/2iiq85yvdtyuQjkDTcm8QumlDNcDnpZO2O0fFb6JiFUIiUTGya65x1Sk3jZiLbLlRx3/NxVm6pVu2u1oenY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyF4bhyB; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyF4bhyB"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so12001685e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790496639; x=1791101439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T9NtVLRAdrEtPzIkGo9792VQNjKKs+MEA/K2ye7PZBM=;
        b=jyF4bhyBh+6thmQzHEYgGnKTWO19unlLenGC4qtFwO18wdbUgk9zRlK73SGQQLk+m3
         231tcIpxhIUwr5PED6awXu16D+NTnN+v0x7vmuItPe3+Quu35klPr1mwFB5u/9t5+CA1
         zdJ4hXXVgqG6b3bp1q8tk9RyMbzhA45E+ZtcCLIcs8zrJLvCONEqwGfNSuqotF9zzZPp
         XkrkAJx/bB4nYP4oVdb3WI59ZNLI1N31rbpzDhHWWX4nU68mNUrQg9QN1A9Ge5arxsDF
         K/Uu4f0RaZAkr6jN0bkbvmcRfz8wLMe2g5FUIS7mfdzqVGkLl3tUblSLC1DQFeNdZL00
         6AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790496639; x=1791101439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9NtVLRAdrEtPzIkGo9792VQNjKKs+MEA/K2ye7PZBM=;
        b=fIR7C78cf3y1mGsFtbtJTM8yq6z3XAZtolvqNltlZiHGZJTHVprJph7tw+TfMsniBN
         zmfeWyZoUoclrsOXvUgLG01l38U/muas0phUt74FeenZ6g/9SRvwt0/ayaHaqu6Eet9K
         8CkXcY8Qpka0B3dhM9uDYhm1qNM5gkD+h/HoJzIsZBx0DXnetVJmC5v8eGwrvV+cXJhr
         aGqxQhmj9AbmjLAZKFotUfLvyB3LmDCmK8oI0bo57KGHKSmsL9/KNq8t+mAYo6KFGBm5
         ZotodjwekB/bjs4p3D/+YWLtt+ic1MI5ODbiQOe+nL6C84xkJaRjrBngMNv/5ug8ciPn
         CgAw==
X-Forwarded-Encrypted: i=1; AKwUvBxAhUYHD8/0EPnc4ArLvFmLpYjYtLyG7yk3p3MmZpcIPplT3lKHgp3VGLC1NDCekeqOqmYSQz4bF2Yq/Tc=@vger.kernel.org
X-Gm-Message-State: AFuF++l9Vo18AmI4j/6RFuCCovuurIpIvlLlJv8KlhNM0M1gVWPC9Hbg
	kGJl7H++rccCsZVIJP4AHiIMWwAZoJmA+xrv2eaQET0AgnydjNgIXXba
X-Gm-Gg: AYBFou0HSKP0IC2gElWswADywcrlF0vC1YL3CZ2cmMr9J3RQJiHttCYfJ9ROic5mD/6
	6P8/JWKjXtj00HC2n6bmEVN8vlPBaY3jDPpeSfywrzF5PAV+tNxL6k4ag7VE/Iaq4JINZhk50vX
	3DRmYxjQgRqYfzX4tEWbVz5JuIOaxCr8RAymRjAigPztErUmEbDvRFKH1BqTeasYzh3Y4wLYJAK
	MFpgS0QF16vgrVS0KZoBsOazgMBnVXO4CTG4VqQlsvBRJ/vOOU2nr0N0Sn87yWPnLgLyHvpPFrJ
	u4/NP/6oqP0UPueJB3IffYLTfUqgk+TONaAKVk9PFr59E+Y/s90pHvK0wnom68YvuKPQCA63DWx
	LDLDeykem/Kn0iYVZv5TYRTovXwsCDFq9TAyWt2EEFjdvfv2nSFgoeJiW5/u6agcte0B0mVMhBP
	71nynBJvHYiziRjeRu6w5APEnt5EQLdOUBaTOXb438RyUq6lkVF5iJfl3i8scbL7c9xFywrAXvv
	ym34VC6mzVXgAHQITxBk3SgzoA4caf6YyD0F2YA
X-Received: by 2002:a05:600c:a4c:b0:49c:fa20:cc08 with SMTP id 5b1f17b1804b1-49fe67060cemr178391235e9.31.1790496638952;
        Sun, 27 Sep 2026 01:10:38 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a002d1d8d5sm12462615e9.0.2026.09.27.01.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 01:10:38 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	daniel@iogearbox.net,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net] net: axienet: free outstanding TX buffers in axienet_dma_bd_release()
Date: Sun, 27 Sep 2026 11:10:34 +0300
Message-ID: <20260927081034.350422-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

axienet_dma_bd_release() walks the RX ring to unmap and free every
receive buffer before releasing it, but frees the TX descriptor ring
with dma_free_coherent() alone.  Any descriptor that
axienet_free_tx_chain() had not yet reclaimed still holds its skb and
its streaming DMA mapping, and both are lost.

axienet_stop() disables TX NAPI and stops the DMA engine before calling
it, so nothing reclaims those descriptors afterwards.  Bringing the
interface down while frames are in flight therefore leaks up to
lp->tx_bd_num skbs and mappings each time.

Walk the TX ring the way axienet_dma_err_handler() already does: unmap
every descriptor whose cntrl is still set - axienet_free_tx_chain()
clears it on reclaim - and free any skb still attached.  The DMA engine
has been stopped by then, so the hardware no longer references the
buffers.  On the axienet_dma_bd_init() error path the TX ring has just
been allocated zeroed, so the walk does nothing.

This was reported by the Sashiko AI review bot.

Tested on an AXI Ethernet MAC behind a PCIe endpoint: traffic passes,
and after each of ten down/up cycles and five module reloads, all made
with traffic running and each running axienet_dma_bd_release(), traffic
resumes and nothing is logged.  The leak itself was not measured.

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---

Notes:
    Found by the Sashiko review of v2 of "net: axienet: bound TX completion
    cleanup by the NAPI budget":
    https://lore.kernel.org/netdev/20260917115657.20697-1-maimon.sagi@gmail.com/
    It is independent of that patch and applies on its own.

 .../net/ethernet/xilinx/xilinx_axienet_main.c  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 1722b7038f34..02bcb89d1bbe 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -187,6 +187,24 @@ static void axienet_dma_bd_release(struct net_device *ndev)
 	struct axienet_local *lp = netdev_priv(ndev);
 
 	/* If we end up here, tx_bd_v must have been DMA allocated. */
+	for (i = 0; i < lp->tx_bd_num; i++) {
+		struct axidma_bd *cur_p = &lp->tx_bd_v[i];
+
+		/* axienet_free_tx_chain() clears cntrl when it reclaims a
+		 * descriptor, so a non-zero value means the mapping is live.
+		 */
+		if (cur_p->cntrl) {
+			dma_addr_t addr = desc_get_phys_addr(lp, cur_p);
+
+			dma_unmap_single(lp->dev, addr,
+					 (cur_p->cntrl &
+					  XAXIDMA_BD_CTRL_LENGTH_MASK),
+					 DMA_TO_DEVICE);
+		}
+		if (cur_p->skb)
+			dev_kfree_skb(cur_p->skb);
+	}
+
 	dma_free_coherent(lp->dev,
 			  sizeof(*lp->tx_bd_v) * lp->tx_bd_num,
 			  lp->tx_bd_v,

base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.47.0

