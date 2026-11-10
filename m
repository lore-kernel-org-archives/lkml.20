Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316619;
	b=G+jd6HRQO1W9WV+tIX1FK/fWH4CM+qQp9Ddc6jq7II9N47ZMSOcjIf2u4Fp0PmkUyuVW
	 bQrGYkN2lrOWw8rIRRFQ+mAW1rfcuV7xjO2n00pfi9cYQ1KKUql8RzVGyrc/qNHSSzok3
	 RDznCyObo9BlFl6KB9Q+2lV/9gsufSonl+G+HN6qCO3wepS0wIy5HSoelaxihC25jEWXE
	 ZSzJN3t+2LRWSFc/fPqb7fyhRSsSQd60vwpfjcOJjzuRM0ysFUqiTXAeGpjOFLkkdPFlX
	 3DvUttQFpUHxfIt+Kgbni2ypPc1xJzV7TYN1OcAPDcR8ubNfQMJNV753/1HzKeZtD1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BZRtX+IhjKTjKfwch5jHovAc0blotez373I/yEDH7QE=;
	b=JYcYCY3fACBOEtHWIpzXZptoHMREeGhamjdvmkwPKmnQNDYuPB+6X0CH7SndsOEoZS35
	 lkNeukn5kLDVVr5FfDyS7yKXxkdEPLVfxguMicIs8QfwEXkVaJRUOPrnrY89zaig1u+lC
	 Cw70sHXEV1AUfYNoCrbpPfO6c6AyCzfG68P+7oK5tkLq8fLJl4PFxLAWP5lIHzvIOmx/i
	 p2wtyB545bBQmZ4wBpLrWpKwSKMXY5+qWxoBEZseDCP6ZPL/aErRKgdMOEqHbWqmIfrNP
	 TtxGNX1vD1v7eRbs9C7YENFeczqW3QzhcG2X9B6n6tn3BoUHd4FZX+AEiPNTafJpjCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcgP+zqi;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A100606B19B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A100606B19B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcgP+zqi
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1076895a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316618; x=1794921418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZRtX+IhjKTjKfwch5jHovAc0blotez373I/yEDH7QE=;
        b=WcgP+zqingM3nyFJ+9sfUXEK8gpvM+ZQJ/zr1hPdHTOLJNOS+d7TDuiiX3YW90DJSi
         cR3AXAhjMKZLfOP7zOArHF3+aKuhRoX657Yg2YWIR6s7DK1m2EJte4FLvcRJucsndahr
         SM/9nhw8yhIe7t4QFG5xq9bjnMWJxAqcYa/4OQjsDcBuMRS2GJmwaIebhBPKtGdIde8V
         iWgXFQc/aHCZnqugf6To3toCRf5Lv7FeXv5I7AqPiFPb13D3eipQNrOolGFwkUDWLFyz
         H8F+KGAYHAxEDpujUwEvwfUZbE0nmaQdH7G945Ng2Xc9Z9A6ypY9ezySdh+eJHC3GwnY
         jkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316618; x=1794921418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZRtX+IhjKTjKfwch5jHovAc0blotez373I/yEDH7QE=;
        b=DGIximeRR1UAh+tYguiYucOPd8AyooxisviczpgMm53jl36O2z5VFMAsMJoUKsiOwe
         AAtMUWIHKmrdd/mGDtdJh5WaE/py7IWJ7FK78d6gpUyGNxLkMpFEWvEnwJu8zEvUldMh
         cCavBFcuoXtYddDol/RURWdqdF/ui6JK8JWJqyppoxqvcIQvMpfemL+9MFQwN5uCyf7r
         pZ7p0LWBAcwy0SZWTAOm15wsoFBGpYKaw9gVdei0T4OvDiMRMGShFtUQ/Ka3f/Xt7n1H
         kgFWYBQpMgZ/A/baSKfpZBFDHkE478RPyGIGAp5cbK/ORAnYp/4saL2aWH//I91n+H3s
         MrzQ==
X-Forwarded-Encrypted: i=1; AL+hErGDgOyLz60Z7t9S/rtlm7AsNPHiZouEFMcQ5Ra7ashqK8+3l2ExduaRCb4cOwoKi28RB/rTy2WPhy+6vCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mFDKXdrH5Xr/SlzPaaRpOlQdGQCBSa9Rmup4k8poIak3G5aOv
	5om09qPaB4rOSW9Nusxu4vUFV/oRpl/Ru3kKJqYYeL7wkVdsndZYk+3WBJpZgw==
X-Gm-Gg: AYBFou1po9Rgat+krc1wNnhgo7In3xygxQHD4tgk01cLQY+NMdm5YwchscFEx2/wjiR
	mOTmKFCNiIt8eT+IHkzKK/Oke/JOTRE9BKzbJYsQaCkDXff9uhjQcAqFUd/L++4NtbZygRh6Mc8
	9HKumrV12CQZe6otEF0jXZeL2u8zfR7lhrT83VseDd9kT/s9mUHeN3WJcgamwdwBUR+aaP41T6Q
	CUx2f+8Izq7BJ24CZ51ihtCDbAjMaSzVuF5n/W1XNY7Y00nVXs/ZwKCsDBoYAnFeUp1lSSMPeVI
	zBJV1dJpy/fXdXjGyXrW6F+5poMmVS/4cRA3zw/uUgjGEFHt+rkBEjG01Vkf2KNkAHNHVxfRVWt
	d7vVMH1+0ao+Y6Cswh3/vMzNKhpFUUveAnB/vMfG8Tyg0+UhbfMeEOVSTuBFmqG6TzZz1X9p3M8
	BelBtC5C/SCe9/jknvQ19Lqnu2c9xPUa/ypmOiyvsN9KOQOq9XTQG6KVrCY7I+RZM3TKsr4/IdS
	C24c8hYEBdaKLS1qhCIWJFS2UP1kQ5/ISzAr0VXvlHs+ihphO3v8wGDUkzJAJRtidbILX6Kh38m
	7fE+GRU1rdMU+WNNKSRvp9VXrCq//sDF
X-Received: by 2002:a17:90b:564e:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b1678cf0a3mr1858564a91.3.1794316618492;
        Tue, 10 Nov 2026 05:16:58 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:57 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 20/33] dmaengine: xilinx-dpdma: kill vchan BH on remove
Date: Tue, 10 Nov 2026 05:13:20 -0800
Message-ID: <f0db74d4fbe705ad4d50798c20ee38cc5dbc03cc.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virt-dma now dispatches completion callbacks through per-channel BH
work. Cancel that work when removing a channel, while retaining the
driver's separate error-handling tasklet.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/xilinx/xilinx_dpdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index 687fc8ef3d8e..219ba9a63050 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -1685,6 +1685,7 @@ static void xilinx_dpdma_chan_remove(struct xilinx_dpdma_chan *chan)
 		return;
 
 	tasklet_kill(&chan->err_task);
+	dmaengine_kill_bh(&chan->vchan.chan);
 	list_del(&chan->vchan.chan.device_node);
 }
 
-- 
2.43.0

