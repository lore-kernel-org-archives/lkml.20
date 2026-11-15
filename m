Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735200;
	b=jk0rn79rrWdZ99bP+ucFS7i/1AB+uaWGmFd30EdEk/eHKiRamC4riVVRVBvTA/kRkKca
	 n1Z2FaIJyYkvJMWlpXKa7QlY6we3Nrs/vc/ZQypsv68cDgEVdm7gzmrt1d2zapMA+AErl
	 ryBIHD6lzuEy9noijzIOdkGauaoqhuzSAFNvk9UN/vUFhcBXkmMtUmim3PwC50sMN8YeT
	 cC8JbyWGPTCxzLE+/rNW460Mz3pG0EBMdkrew6quMrRkPpnhMLnrr0eQoqkgIqt/Jb2ni
	 5ZUFI8whU58B8eENg6ltXKF7WI5oVElNupCirDOKJ/E5kab/IokZ02fJG+/lu0CCVeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=bPluMEVsq1fcd/2/kENoSJW0juxe38/N67JwApwlVx8=;
	b=HK81sKRlv23YOhSizjFozZWYKhYhB49FAhW/bvAXTPLn+MJQIYYfV9da/L079DYJjtqw
	 PrT4kmUVELccog+Xj/OaN2pDv7Wf/cztDHfhR71ElnAU6RDNW7qLZebOj3jpCF8QIjw+0
	 uajZASwTus3ETfyV2LEDgayVk3qls95OyqTOvnOD/d7eIbi1938OXO1LjTXVU+TSLM5+F
	 ZqH2JN68lechPpaJyt2bzkMV0FThcNhLNRtH5a/YHlB1MRxIX+D2BYyUqNVOhA3YZItfG
	 mFntRFfnyRGUyk4P3OOJJw/wckFGBYVXtmpOGkKni3uPOX/jkq3O+F5AGVKYoyWw2Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCsOlmBq;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5815C606A8A1
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5815C606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCsOlmBq
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6aa9606ddadso2375631eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735199; x=1795339999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPluMEVsq1fcd/2/kENoSJW0juxe38/N67JwApwlVx8=;
        b=SCsOlmBqgEDJ6BmeoTUMFusmIni3X/V3Yt2R2U0E+/irtRlSJl1YACWDg77DdUKsGL
         IyruwbNdhGjrvQDDHY4F/XDdKtvmN1BifV4F4V41h773/9tUkghJRu5XeLdr2UKzSCw5
         mOs8kcatb2MTwBMoulEBiEVdl787QFkkCeW84Kr+JbW3Kw7DdeowYVhHElQQu3z+tVH4
         m5WgTuewHGZs9Ysr+zQ3Xec1nOnFOKc9G7HRqlb9bWdoA0MXTttfRuhFkqFJ4CGN5oDd
         MMj5SjR0WbZYhM4lNrRJdNivCOiswaYpbSXNhuzf38Rnq0bd3zulE0JnxAEm/8/zWoZr
         ykpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735199; x=1795339999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPluMEVsq1fcd/2/kENoSJW0juxe38/N67JwApwlVx8=;
        b=We/1uKmJ7crolUyp/tbJGr9fOQjaPdIQukOYOXC3aQHCQu2gF16nXzLoQpBuAm4K4x
         J/51GpysTBq0OGvHyYJyyPCrrhu0MyYTwG09O0luxoqL/lek4892s1Ss72SJ2EWCx6+1
         QppxgJc+e9POMAcAFk276mna4dyJENKuz7HfmVX0pCTPuoC88IkJzygfFj2EygTnYd6t
         rRazZd5ma26VYHqs4BNyQZN5qa5ymyeSDgobA6gpY5dIvdw9zKAHbTyW7NIF5+xUx9tz
         dvoL1L4zxNi5hFF+pBJsRqw9rJFeiWmP0eB0xGDUEMmcZ1s5Wcp2WSXW47T/INu6voje
         XB9Q==
X-Forwarded-Encrypted: i=1; AL+hErHVq3JiB1wVQ3J3O7b3KvOrLPxlBfFmuki5Q8yeAaCRGoSdG+HJNhSt40aGnSIU5en9w166J705kUoOR8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bnADUn2W8GyEJ42k3x5861PRBewa7LdVOBC+fTpatgvkAA4z3
	Ifh0jEsHJtWY2SLgeskhfVxZIMvjIzk1JsDJiKU40ejSoWsCBGnSspLD
X-Gm-Gg: AYBFou2wdecSK4reG25Pxfz6xgUC5x7SxHH8ed24NkVrqIRqLcMLpRDsHuu/iLGLX0F
	KyyucXwoQ7OFCOg3pCid//TvjYUr3jzKOalZKU/eUZ5GHcjjFqilwecMExRVZCWCRuliA14W61E
	a2h3P5M9TprolISmQY+gcRLoQlZ0aDtsSE3PGQa2lKvX+81EKBJYoeB3Gv+I/rcLkZvkQJZ6HlD
	VmSf8xs1X7JPw4XJ8/rMfwIAdpxDtxsK4vM6S+EBItVJ5D/fJpvTaPiDmKlAKP/TTIpXXHel0jT
	MoGYzZ7uMrzB2eRdgWOwg8Eei7G/w7gmnQrTwDb/e0ashwsLM5g4zCDyrgepw1MgOxozYkqsuQc
	akNpGOrPoyNePIOYwOC3z7ukGk9BTLBojfP3gKqeEDIr93PUdPRP2Fif5PAc/xMyW8J3n+bpKSk
	F8VWqsKvBymP4XW3Smg8/xG6weNcJtRh1QgLKkFhdRca0tbtgF0oeC01Ukneqsrm+aS9eicCmvu
	TSEPm8nkCNTb7iknuqkq4IlrBL094PbAGOSGcNkwnrmSpODCBuoycpdX4ofqD+KPreIW/uy6EhT
	laH7OKOd9UhxNnWjIJHADA25EtdpupCtJTQEu2Z7DH1u4a26WIs4T0GF/9u3A4BGNacmfgUwniZ
	VZfyk60xBAvGr4yiUdtzY7Mj71+XBGuo6WbqAeQmRTswlvCkXoaFfwOxAD4yKqB8ia5ZOzyTjRN
	XnzjmnxF0AopvCBkRoNej6YL5BkqDRIZzWkuT6Q5J8Ftv/+T2O+KY=
X-Received: by 2002:a05:6820:1627:b0:71a:ee76:d7c3 with SMTP id 006d021491bc7-71aee76dd86mr223150eaf.7.1794735199376;
        Sun, 15 Nov 2026 01:33:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:53 -0700
Subject: [PATCH v4 5/9] dmaengine: sun6i: detach completed descriptors
 before invoking callbacks
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-5-043cd476a45f@gmail.com>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

Finite completion publishes a descriptor to virt-dma but leaves pchan->desc
pointing to it until the allocator runs. The virtual-channel tasklet may
free that descriptor first. A residue query for another incomplete cookie
can still pass the retired descriptor to sun6i_get_chan_size().

Clear the active descriptor pointer before publishing completion. An
assigned physical channel without a descriptor is ready for the allocator
to start its next transfer or release it. Use that state in place of the
completed-descriptor pointer, so residue queries and termination only
consult descriptors still owned by the physical channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 5d39a2c0c2e1..c30e244e50ea 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -198,7 +198,6 @@ struct sun6i_pchan {
 	void __iomem		*base;
 	struct sun6i_vchan	*vchan;
 	struct sun6i_desc	*desc;
-	struct sun6i_desc	*done;
 };
 
 struct sun6i_vchan {
@@ -492,16 +491,12 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	if (!pchan)
 		return -EAGAIN;
 
-	if (!desc) {
-		pchan->desc = NULL;
-		pchan->done = NULL;
+	if (!desc)
 		return -EAGAIN;
-	}
 
 	list_del(&desc->node);
 
 	pchan->desc = to_sun6i_desc(&desc->tx);
-	pchan->done = NULL;
 
 	sun6i_dma_dump_lli(vchan, pchan->desc->v_lli, pchan->desc->p_lli);
 
@@ -538,7 +533,7 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		pchan = vchan->phy;
 
-		if (pchan && pchan->done) {
+		if (pchan && !pchan->desc) {
 			if (sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
@@ -584,6 +579,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
+	struct sun6i_desc *desc;
 	unsigned long flags;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
@@ -603,13 +599,15 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		     i * channels_per_reg + j < sdev->num_pchans; j++) {
 			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
-			if (vchan && (status & vchan->irq_type)) {
+			desc = pchan->desc;
+			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
 				if (vchan->cyclic) {
-					vchan_cyclic_callback(&pchan->desc->vd);
+					vchan_cyclic_callback(&desc->vd);
 				} else {
-					vchan_cookie_complete(&pchan->desc->vd);
-					pchan->done = pchan->desc;
+					/* Completion transfers ownership to virt-dma. */
+					pchan->desc = NULL;
+					vchan_cookie_complete(&desc->vd);
 				}
 				spin_unlock(&vchan->vc.lock);
 			}
@@ -985,7 +983,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	pchan = vchan->phy;
 	list_del_init(&vchan->node);
 
-	if (pchan && pchan->desc && pchan->desc != pchan->done) {
+	if (pchan && pchan->desc) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		vchan_terminate_vdesc(vd);
@@ -1001,7 +999,6 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		vchan->phy = NULL;
 		pchan->vchan = NULL;
 		pchan->desc = NULL;
-		pchan->done = NULL;
 	}
 
 	spin_unlock(&vchan->vc.lock);

-- 
2.53.0

