Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34AD41F5D7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959244; cv=none; b=VQjWVrSRISsy58ok6cCQ2+BKZ7CX5Ww6bLORqqjv8BJMKbUruwZtA0zguAVdCLtWJZroBM3E6b29ui9CiNdPaE+LXfFG5Vr231nDtB/19KjORi1YBMzUd/mR6gdPhCDLnBM8IOsvT1SQx4YtsRFQONqf9Hr6SepR8IVFCqk9HaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959244; c=relaxed/simple;
	bh=n2wwRH1MGpcbmaNe00q3C0ieRztlK3ueHbSjCEF1Lhg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EKKnGg1/c7FtSsqR/x9nOR+2KiflltU3JoasIGgcZ9NNRHWLC+2d+RX/F/enlC/ICKTDG7kbZP/N6NAtQzD+ZAp4KiHQzJf7ALHGsnR4pc3q3wZ1imidEctq3z7GYpNrVhwfndatysygiNghi2U4WtfP+pRq+lpXhHKH1fZ7JzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePLhKkex; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePLhKkex"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so30113695e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959241; x=1792564041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Hzaer1RZQoriyuUgW8AMXxGnkkWZrxnciM8HyXU7+w=;
        b=ePLhKkex5mhKAoJuu3xiKelTjVj9j6WqMk18jH/tS2IGFEnDKS05aM93w4r7UNis8y
         y89ytrtv1bsL3jL/Xu2GBV/zHZ0fX3fahhgzLDhZsQomZAfGIp7D/glcd6IFUEOBIeSZ
         gyQTbXo+86BckEmRhulOZLRStga2cNgJ1UJgF54kTpWra2X/Ma3OjtZQiiaQdBZEfBvL
         4xHYs5OpU1g/iLuzjZv/f+stn4eP3d1cbsDxv40mcoIzLhqSumHXrDoixZKJRoSaaCQt
         zkY1HNtluJUOOVOQ4dkalR67hFmTcl1Hop3z69v7aC5utDlC3xeXuvdDftxadv/8kyMZ
         lpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959241; x=1792564041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Hzaer1RZQoriyuUgW8AMXxGnkkWZrxnciM8HyXU7+w=;
        b=TYqN6SySmeKvJea1gzOjx3gHGBflUzzppuCWGrmyp7dzLnBsQT7be+iDW3+Ym1I2H1
         9RNesHduE+0aqXxJ4w5Oj2E38VDrwzRV9gvIa4GOxNKbqR6dQ+zL4Ta9VKK3EHXq5IBV
         86ClTejqRhzkyGmRVdCNBCWPJ+ZtZhVzPisfMxLe+26MSUinNXAQW6+DnQWQZrJXzzMi
         FMnZeaQp/Cgi6u9QOSL83a5Wvb8jtyOevcuBm7/JHKjQEXKC25NvN8mQ/DEb3QD41UNb
         Q9dx3+VHO5W1ybShgq/jlutqAxy7PatjCWgKAhUDftgRbuve6FYNA+95xnMtOa83YPsJ
         C6LA==
X-Forwarded-Encrypted: i=1; AKwUvBxJh6w9qN7f95lYAbjBrgssqkI1gxhhPYb/uYH3+MiysXFIiK1XAVABhxaDxfiQxnBhDO7UI4EmQ4QdvZw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5LqeGfR06h0kbNO9v52DwgOVGy0oAgaLPvMmWDcXVE8pr40TX
	XhTG18Dv0jdz8jHy0lS9gE8YB0Y8yHVhKsXd6rcExTJINYLU882rd7Jx
X-Gm-Gg: AYBFou0LchK17FLRnCeiXXcDUM+xvvMYb8CEw9kqAN58Y9HxmOq/f9Vj71LYsLjojtl
	LQc6fcxYfhLjOyruJU8mIusAcD+RyVTGWNmoWeEOPRNFMem5pIU8vX8LuRP6/rv6mOTtvSG2gtv
	IH45D2Cn4VobBLDvSi9iBL3JqDFt6PcgFySQEkJE4Yhb2HLoDxFKfX1Qx37ucKHA523Fx8TvFOC
	qfGDrD9LzTna1pVHO+JaqdRJ16D/vCX/FKsZCIhvOJB91oRvhR7/nSl15t77P57UkzdthEyHiOP
	rmkBBzaHuWNgP6ky+pm9KUrXI3vw1Ml1NMs9tm5DUfK623ioBLzM0kPgJ2MLD+4XZQM9YIcTdsE
	Ug8Fmld+OkFj56RbbyLHFV92A10V1cbKztnu7rbPSJwLK5LeiF3L0aD9jcMgaZf5/A3spRWtyLx
	l/iW5Q7uzwJnFaIJN7ElQEePdnjBeEcFL/Huogo4i0i1vc7BkAj7IrqOsxI6DqYmQY6EqNkocpm
	vA/YMTfIYJ5DRAri044NczbYV4/1fz21tQZS3r28he7SSsQEgR+nAXGyXa/j3TKe4HC99bt7inn
	dpVFmdbYZTBdxQZVfeKD+NE1hrM5ivgJz1iCtWWHl2DhiVSstFu3NY8yQ9e0LlqLnTcCzqSDLfS
	5K/DC+IJLxmek
X-Received: by 2002:a05:600c:4e8a:b0:4a1:78dd:dd28 with SMTP id 5b1f17b1804b1-4a18e4d2b31mr294041485e9.27.1791959240912;
        Tue, 13 Oct 2026 23:27:20 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aed1-da01-ddff-863b-8308-ab16.310.pool.telefonica.de. [2a02:3100:aed1:da01:ddff:863b:8308:ab16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm528846745e9.4.2026.10.13.23.27.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 23:27:20 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	netdev@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Joao Pinto <Joao.Pinto@synopsys.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	bpf@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 3/3] net: stmmac: stop DMA when IRQ registration fails
Date: Wed, 14 Oct 2026 08:27:01 +0200
Message-Id: <2b70886410b5e9207ef170a48aca1d2d7ce24a68.1791958735.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1791958735.git.kmehltretter@gmail.com>
References: <cover.1791958735.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both __stmmac_open() and stmmac_xdp_open() start DMA before requesting
IRQs. If IRQ registration fails, their error paths release descriptors
and packet buffers while the DMA channels remain active.

Stop all DMA channels before releasing those resources, matching the
normal close paths.

Found by inspection. On a BeagleV Ahead (TH1520), fault injection in
both normal-open and native-XDP-open paths reached IRQ unwind with DMA
active on the baseline kernel. With this change, the DMA process states
were idle before unwind and resource cleanup in both paths.

Fixes: 523f11b5d4fd ("net: stmmac: move hardware setup for stmmac_open to new function")
Fixes: ac746c8520d9 ("net: stmmac: enhance XDP ZC driver level switching performance")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8fd7d2173..5c4df26a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4206,6 +4206,7 @@ irq_error:
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
+	stmmac_stop_all_dma(priv);
 	stmmac_release_ptp(priv);
 init_error:
 	return ret;
@@ -7259,6 +7260,7 @@ int stmmac_xdp_open(struct net_device *dev)
 irq_error:
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
+	stmmac_stop_all_dma(priv);
 
 init_error:
 	free_dma_desc_resources(priv, &priv->dma_conf);
-- 
2.39.5 (Apple Git-154)

