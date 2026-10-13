Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0F2551989
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924335; cv=none; b=n3qByzXmoJ4GZ2YynKa97+9FEC80EGo7EI27k7VRTh0/JgvKlNh3GXdlqiyyN7gJDP2cN37GdQgRi2f7BCtyQ4LJmi0ImcU/wc51coY2w7P+9FFH+9GB0CPY9I7AAq7CrIRSxFAMDxcR9CTJoJ+Svk2SDCk5xppFdYQjS0olFOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924335; c=relaxed/simple;
	bh=RbKEQ9Ao6sfM8uo8Xav6MW10A4+TnfLMYt6FY1stsN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MkDl+qTyrGkneVFZsoMFDViY3lw7ypiXFP7oN7sKhOaxHXWgAa5JBMfOEcy0ltFR2mk3Qh+Y6arA1njeNi6NzUyj2PjxlUDoe0YNpKGNJKLXXYMvyxUW2N0syPCf00LGi3rokhUulvKjfs958M6gZZUPsUvyk8QomLLOdGS+0Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fiAR+DyT; arc=none smtp.client-ip=209.85.222.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fiAR+DyT"
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93e6f83f0bbso314751685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924332; x=1792529132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fn6fAIq7HU354S7iJBpqt1EqT6IYIhNvzY1GRRTqbFI=;
        b=QrGiCQi5ENb3AvjDPFiOc2WqF85CAJd9AMEZ7kzctsHMGzLV8wHFxgsmxWUFsJEwcw
         T9b8teEBveXdMA6FLHWiFG48qjz9or9EPOH1HvW48CicgC3W2R4nDOX03csA1CMbmDWJ
         7kORBKaBkTCD3kHNXdLzEzdL8A4n0xjFjAsk5Q+TkxYeEyhuafJREzqoKnZEAmphXMyC
         DvyG9VR4WLTIFQZLxOcfgcMpEtt/0isrS6P3ROeEoJXgJHmllPOQBS4bLWULV7U3GIYA
         APq9OJN9UFh/PWbXd67/4dTY9ZpgBt0BxMzW/PN+SfLFjE5podcKwgBV5FFZ4aUibxQA
         H+rQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAOOx4TkNfHtS8f9pjrlUPOzb1CrF+tygY5QrnIXcL0XaMBeP03nPsWmAzV8zfowcjZu8zq51p/OrxLCo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMAaHPmssQkMhp8Q914TGr36mSk23oSr7fFGJOY77PZWY9WXCz
	CHweom1mDlqTOQhj2/NXtederMWTC+4MOXYxu8yw1wsK9LNZu6mCWmrAZw4cTrHsXvE0NKgdRPw
	OoPuZpyxTaA2AC1Oxo0coKCHAx0OugbjywhVJ/zZMDwHTQENjCInIVN58ytFBKPKZ50CBhBZIP+
	t7cappoWhPTzBhDoO3Gfdcp6OY084MINBIkKOJCC4CmcyEJTw45VVV2w9LY5pPB/Ckr3WiGmDtc
	xI2DgpMe7As5sj+ujXdlswb
X-Gm-Gg: AYBFou13+kEysKHlJVXHsqgPlEvGw7a7jHSlFXvDT9eguNFZ671u3jGj7IX8pgFcOB5
	YKlqvbCBY/G44c7VtBx72LvMfCp1i5W2ieZXucVneMXeP+Bdbe3dpM3jWywiOow7cC1U3DSgEPF
	b2TUNLZBWHOU3sbdvpdm2jVQjTp2FbZ7sYGIqN6wDL/dhbhtkKZbkS+VKiT5ydv62H/U/EPaV9X
	n+z04Is/uNJFDoVnY70l7xLl/THAtL9pAnmjljxdf5Dmdy4z8OfEpIBs9aB9LPTrLwn3svsTMmF
	72slueF+eGjntQZvsfnvNtYDOBiRGgHGNdDBfWGE/nisc91ro0zSuIJ21N4gHfraLrdCRqnJUCc
	8IjpDyr4KJwoPvhk0duFJTQWR0i04mdJrzCQSEkugEp3h/6Qh4KwZg2SXc0SjtYI838uq7IT3yL
	WqF1LR/4otmatFk1CL3uk7uRtaUbxNtLbGnYgWXVRFfqc=
X-Received: by 2002:a05:620a:270d:b0:93b:d79a:c462 with SMTP id af79cd13be357-93ebd26b606mr2254478285a.58.1791924332479;
        Tue, 13 Oct 2026 13:45:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93ef5076d3dsm84876985a.12.2026.10.13.13.45.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:45:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5358515b4easo64753521cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791924331; x=1792529131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fn6fAIq7HU354S7iJBpqt1EqT6IYIhNvzY1GRRTqbFI=;
        b=fiAR+DyT9EdSGFqGe/wz+Wz+LmoDsj1d4vJz5ZhJD/Y7+XM4Px4lMjm7mR7/Xc3eBa
         AQN/i40Uu47QPDGrbBXkPDeJWx0f+fz/igeL9m3AXDvpmVrbGpUYclto8lpwb6RIl0QB
         ziqqhsPX2K/DZQsYZVo9RVSmLIfmIBjxh2am0=
X-Forwarded-Encrypted: i=1; AKwUvBzg78OimEg+6JIgmiFtZAv0T1LHqxMfoTJASrRF4pUTSJB3d3rvkb+UA28/BXB/124y4CCBh91IBDHeJfo=@vger.kernel.org
X-Received: by 2002:a05:622a:4c08:b0:535:f3e:745e with SMTP id d75a77b69052e-5359fae3fcbmr231779741cf.20.1791924331137;
        Tue, 13 Oct 2026 13:45:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4c08:b0:535:f3e:745e with SMTP id d75a77b69052e-5359fae3fcbmr231779361cf.20.1791924330705;
        Tue, 13 Oct 2026 13:45:30 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535f4eee7bcsm15879231cf.30.2026.10.13.13.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:45:30 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
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
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3 RESEND 2/6] net: bcmasp: unmap previous DMA mappings on TX map failure
Date: Tue, 13 Oct 2026 13:44:35 -0700
Message-Id: <20261013204439.3494046-3-florian.fainelli@broadcom.com>
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

When mapping an skb with fragments for transmission in bcmasp_xmit(),
if mapping fails on fragment i > 0, the error handler calls
bcmasp_clean_txcb() for previous iterations j < i. However,
bcmasp_clean_txcb() only zeroes the control block fields without
unmapping the DMA buffers, leaking the DMA mappings allocated for the
head and earlier fragments.

Call dma_unmap_single() before calling bcmasp_clean_txcb() in the error
cleanup loop.

Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
Assisted-by: LLM
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Reviewed-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c b/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
index f2176ef3a127..9ad5a982542f 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
@@ -285,6 +285,11 @@ static netdev_tx_t bcmasp_xmit(struct sk_buff *skb, struct net_device *dev)
 			intf->mib.tx_dma_failed++;
 			spb_index = intf->tx_spb_index;
 			for (j = 0; j < i; j++) {
+				txcb = &intf->tx_cbs[spb_index];
+				dma_unmap_single(kdev,
+						 dma_unmap_addr(txcb, dma_addr),
+						 dma_unmap_len(txcb, dma_len),
+						 DMA_TO_DEVICE);
 				bcmasp_clean_txcb(intf, spb_index);
 				spb_index = incr_ring(spb_index,
 						      DESC_RING_COUNT);
-- 
2.34.1

