Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780972;
	b=eTHXJoZSZ5ZIQQTKE/QkPXVI/RO1nYsUzhUuxv0vaV9WFyxfbDseYYtq4L48I3XzTPaH
	 BtGtkshkFSDEouTUDg12T0ol463E4uwfiFCYI1/vyVe20/+2LFpO1dxhpcMGzwVwpwWwL
	 qzgsPnTxpj1ewjQt1sE7ZqQFF/dMxIlV+bUWFGTvWfAgJp7W476e7rN1dZXBHWM7/dPoU
	 8Wy1rUwdUmZCMqYC+ESvcF0/3A5O7xuXql6ZeRjmJPNXqqNRts2GrI7ZGJJlmQ2R39/LI
	 X9K9ANcl8QWgJAf6pFAJlBlWQywBsM8g2ugMzs8akrXOwXpuXPmXPsUHSbmWFBCWJpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PqNMKX2JAKOcdDMHgbj/E/YCDonhqS9mo8xwaEZBKXY=;
	b=Fbux2ggn1ZOi7KrQwAlPwo8/unGFQHkal2E1BvYdwhdURq2Y3LT++Ooe/10aeaAx/s5Z
	 tzaeVN4WII+RbUKOVqXEvpYW/u1ibdFqP1cEB2U2AdRSyiLCVcBqY3G8TC+f+s4VWWAku
	 fOAkDvKpTmCOhks4GVLb55xHRb3zb2LQHxDTmlhD2u8XE/e+U/q4+nEFffx96q6JuHCeP
	 ZO9b5BumCST/E5RlK/OXtW6Ql5g0zNSoPjcsHr3YOt879jMwZv0Zcnu0vIeDueIMxd2Bj
	 kBUfmyIqsOarlfiPrhEIit54GvE5w75MNdVebZ+1ANZ2dWbAQOcJtqai4X9/qiBhvuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="e8Na5Td/";
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B97A606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B97A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e8Na5Td/
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-83bbcfba0ffso755372a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780971; x=1793385771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqNMKX2JAKOcdDMHgbj/E/YCDonhqS9mo8xwaEZBKXY=;
        b=e8Na5Td/jMa9nZR4f5MQvdLoMXTRwMZy8Vo9M5MJWvrNyRIr1nDrHDZ7bdiGT6MG2z
         QuM6Tbn+W+a+DaWYDajzZMqkLMJHOujuHdASNVZx1QfB1Za0EeVw9QCZGUPGTSSKgOTW
         gO+UKNHKBrgtSBARHw3p2WnBxSeT6u6q59EB61FI9jbspCowXl1h/7WCFUdTptFsMv2g
         AC4JQnL0G5UGq1GONHkb51xAE4oxSyDOZdQRAncKUCZpnVuve8+QkvNHfxRpea8IWdQ8
         QqBLWkF0F5j+UEasRsTrf4slcTB6c902obUaM1ERrKglvilyOJqNoqJfdUorknlSm0cm
         0m7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780971; x=1793385771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqNMKX2JAKOcdDMHgbj/E/YCDonhqS9mo8xwaEZBKXY=;
        b=K+beTiF4CLU2m9AKpZ12SMWch0REM6Z3NZ1TXarqMjUL/dEfnnFOyjF4simxHEWJxF
         WLj+paDS7uhXvU4fzAL7z47qNsEWq/0ik0x6c8PTjRAn1yx5tj9dhSlkRc5/j6V5Vmyf
         5KuebfdxkCtFy6Ei3Mvli6FwVEkxriVoKPiJnNFzdvBl7lIbBU5X1be59cPS8x2+CnNA
         TTGyJOdnDkdfBDnmrkRxB22nncPmMkpuOAF0DRLn2AmvOGfNcH/X9qUrVRO6BRI1CZyl
         WECT7qo09WQMeJ+DT/m3bQM3tn1cEgsK9iIfxCapoItgRf01E60ihFcVk3wxgfdkZPj0
         qVZA==
X-Forwarded-Encrypted: i=1; AKwUvBzJNPRtqtUmX14Cn6vtepFLIiUfMNz8zdM5DRFy+V0c1BSHtfkGl5k/uVW3o9NBq3Y+Q5vzK/USg5laPc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLR+ZqG/nr2nS+zleHx0S36ztQACCjW1jd7wBzHj733VEF/LpOk
	PEVQeaHnnd9+af3EIkF3AKdf2oR6aTZ+MGAphkk8CftNJ9fD7X3rVZnt
X-Gm-Gg: AYBFou0MrN9DbNfnXJr4sy7n5qBjNWe6NqjKO37XQrYuiwFwno1kaPXamUxOXVnOiKg
	mLgxg7gvgOxE3rM3oDaoFmaQ//EhORnBvECKSDb7yv0/oettV06XcqoZMVB3tvxKbw4b22Mqlw2
	W0Ir+clQyHbh8r002uaK3Qla+7EiL/IewtgiLWKtOkNzwiNMNXTosTo7X+5mIe9WbjzEtA8wgaF
	yGCPmyp1m7DUGSmsRnH43Zcu7L/AEXHoT4M4wnsaVG15fsPA6qk69PvxgNuThDZynOwIv8EGnfE
	uhHQeEcsZVwctVkE++F+OGDlLyrqJ3TcTALOUoIznMpCJxm3tQ3NWqmxTdOMAbK6q01h7gDyHGw
	+VxEvP7nx9ROxuCTBHpAudY0dAP+xEpjR3KgKj1wPRMnWztgfKybWQ7tubkIHQZvGE6SItXuwmg
	NjFX0jMOZ0XwsILGeYnfYTPjIzPQNl/67Z8Ks5BtE/vp6tFGfKri6kBRJEnNRommfFtD4r553oT
	pD2bOOQJyL5ACRVZFONaXNbP0ALqVNnxqF25vIpga6r5RjSC9jEMBEeVmeyaqO8O7CThC5n1bEQ
	mwdePKTVbdYGumz3OhdlbO7VYQQy6vx9mVLGEj1Y4AqipiA9AFSRAUazjK0627G1z//s5e29lam
	HWCSf75SFdNKGJtFFsOZ8a5Iwscd73nyidM9kNoNN76Q/RGeBzMFrqXEwVl2uV1LUKdjGLOEKI4
	+sCzq3UbteMq2vvF9lLX0aPKA=
X-Received: by 2002:a05:6808:1911:b0:50a:6fcf:d287 with SMTP id 5614622812f47-55c00232f05mr72486b6e.37.1792780971361;
        Fri, 23 Oct 2026 11:42:51 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:40 -0600
Subject: [PATCH v2 6/6] dmaengine: sun6i: keep cyclic state with the
 prepared descriptor
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-6-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Preparing a cyclic transfer sets vchan->cyclic before the descriptor is
submitted. A finite transfer on that channel can then select package
interrupts and take the cyclic callback path instead of completing its
cookie. Merely preparing an unrelated future transfer must not change
the active transfer or the meaning of queued descriptors.

Store the flag in sun6i_desc and consult the active descriptor when
selecting interrupts, completing a transfer and terminating it. Finite
descriptors retain their zero-initialized flag. This also makes callback
retirement depend on the descriptor whose lifetime is being ended.

The shared state was identified during the H616 cyclic UART RX review.

Fixes: a90e173f3faf ("dmaengine: sun6i: Add cyclic capability")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index c244ef572492..c9a72cfe3f44 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -191,6 +191,7 @@ struct sun6i_desc {
 	struct virt_dma_desc	vd;
 	dma_addr_t		p_lli;
 	struct sun6i_dma_lli	*v_lli;
+	bool			cyclic;
 };
 
 struct sun6i_pchan {
@@ -207,7 +208,6 @@ struct sun6i_vchan {
 	struct sun6i_pchan	*phy;
 	u8			port;
 	u8			irq_type;
-	bool			cyclic;
 	bool			paused;
 };
 
@@ -504,7 +504,7 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
 
-	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
+	vchan->irq_type = pchan->desc->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
@@ -607,7 +607,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			desc = pchan->desc;
 			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
-				if (vchan->cyclic) {
+				if (desc->cyclic) {
 					vchan_cyclic_callback(&desc->vd);
 				} else {
 					/* Completion transfers ownership to virt-dma. */
@@ -908,7 +908,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 	prev->p_lli_next = txd->p_lli;		/* cyclic list */
 
-	vchan->cyclic = true;
+	txd->cyclic = true;
 
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
@@ -997,13 +997,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		/* A cyclic callback may still hold this descriptor outside vc.lock. */
-		if (vchan->cyclic)
+		if (pchan->desc->cyclic)
 			vchan_terminate_vdesc(vd);
 		else
 			list_add_tail(&vd->node, &head);
 	}
 
-	vchan->cyclic = false;
 	vchan->paused = false;
 	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
 	list_splice_tail_init(&vchan->vc.desc_allocated, &head);

-- 
2.53.0

