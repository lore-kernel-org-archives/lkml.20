Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798721;
	b=UWRnKOmHbVQ/rv1lNHeQ6LN1dssLThZgADgf1nuR4FVw5Qvy+BRIqZOWxKyvpiqd4J1g
	 TDXVPWDjDY2na2kifcWJ6vJacajY4tOGbHiswcqnDhhsv12U2hHdWhs8Gg8RDxr2eitZI
	 7/buWLGDh3XO2PCti0ekEVNp63J/pKuRNUKyvm7YCxGGnczqB3HEZ6Jyjj1wc41Hv2Gkc
	 9SlRSHJvYOLQUfSLBWOy2JuyVnQEofj5nurF7MtQqM+NxSllg8LaAuYPDOxUYrZfPwcLN
	 HEhyBP1sDtclwA3K3ZDHt4O6JsRcypfqH2wmq7Epi/c4Kx2rsKFVHSh/cbjXwJ4Oo/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vk26c3BTQSmOJJ6zClJ284dH3SqVTC5An1nrNJrjOFw=;
	b=xDh8ys/fAIwNLqoTL5pTr5NbBUestzvhZ/802GBWXpD1IGiYovBzbU6TZqfA+CWoNZvP
	 nMU3bpxXkDS4RVr14qIFbYB3l6LhgHFSRfRtJfBETqDztwA1dcZhlKczU1VJ/cLNVE1HQ
	 R2osTnvkd8nqCdmZblleqiAPqUSl83avhOjbajQhXbVyl56WAr/opgRa1Fh7tIBGY53c7
	 lIpxTLx1J323wekqtamCP+GR8TqaEKYmzcSQltAbiD82BCmTE+S6XwURp7i7G9btNGNi5
	 MoIuMXkuyQpcmjXFxrB2dyHDLAvYfQPpg/QvYCllMfzJ5NI3aGViRS6rYE6w066kvxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rua0rHHO;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F52A60A2603
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F52A60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rua0rHHO
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-81ae6aefdceso1171523a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798719; x=1793403519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vk26c3BTQSmOJJ6zClJ284dH3SqVTC5An1nrNJrjOFw=;
        b=Rua0rHHO2a3kcD8ZA4Tsh0WbhveH41g4Xi+/C93f4hEgEg7G5EUy6PhffHnkWI4v/I
         KJb+m7CUycfvMTlH2lbN4zIwd4qyfg4eTl2aJ9PJU6JqtxSH8rSIGNZKdL1fpbCe441S
         4jFAewl/nCJXSCl11RxFDnjvtKNtRhIlz9dJnkANrQ9nyCz1lW9HaJ4RtYAUhwLcWsdS
         fJKRjBgEzUUzYQNMe99dwpWkc3EwEVdgYq0ADVckG1f3y+eCRs/L+Di36nVjF2xGtaXz
         3MRKqh+pgYijC/kEneIbh1qE6vQGQgZsfMM+aJfuR6cCBHtc+R1tad9JSm4yBKhCDOV4
         k0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798719; x=1793403519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vk26c3BTQSmOJJ6zClJ284dH3SqVTC5An1nrNJrjOFw=;
        b=c7mEIjNTeFpvk/PJLP5XyZUTkTzyL8RuMuSRDwk/6kixNmTgov8bRk8Lb8NdbITg8S
         EaiLZHsCByOCXUph+U98Q+ta0VBkXpA2vEJEx09gxEcQANjnmAS5PpmecxRR8vExNk3A
         K44WqewScITH27viPU1j7u7dte02hHmI4VbKXroblNpGvnrgk8CuTcZB3Q52IgXI48Et
         axwOfjFepNAEYfCFulRLTk9FrSm5j1gEzlg1loCFVBoZf4FS0aNRpf9CCk94Njsyj66O
         IZwrIRP5ok5bj1E0B73BrrsiZNWYbH4cJOJkISsLhxpnq4nA/PwyBSAZLDHbEZKVIkIx
         7+Ew==
X-Forwarded-Encrypted: i=1; AKwUvBwbvMA6Isk95czotfztyrXV8MQF8U/Vuk9D8Z49g71eQ2gvdLoT0BLu6u3UrJd94+cQF+zKWUVjNyFgdvs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5qyH4Kts3zfqgp89RUbkZXbxpevqwzsvaVA2DIMyyVP7232lp
	aKO1nybsyBiXhAKNabgBwXd62ii+QptrPA0m1/h6GNyVTH5W3YXRBme9
X-Gm-Gg: AYBFou2xzwfJduhwg+Ry1NoIXddJbfCmUplTAyfBqRFiU1jaFJyP//9bs8IP9IM81Kp
	Hm2QMh2CkUsrM104Rgbz5/n2rXfS8yN4SHt++91kp+0vPjY4C6mI8CzRbmWsz0OcLzkabIVVtSk
	QbphnFwg57LdugF9xMvuXAJB+IuhGQzkfea58vElv/2EBSAFUdQ76TzvOlOIqB6VvYaChM+DNRX
	PQ/2NS1OjQe3oJ06fwWFsMAoGj0QFpg/4p0XUsdx2wmrQXuZpdi5qjQ2t4hy0J+BLXtd509Os5Z
	rFunFat3h5nnEp5JaUykFDc5UOwgKUe0j9rgaUqNXnPQPNasGke6uio+7K6Q1XvAskIuAUM5U26
	sADYoVU7QpJ/iwUD8cfnoLkrCPBmts25SGCu6rA8ucAVQKsHgf3CAyB4wP2MZrj2sioZiEwwZl+
	NFnruVSKGiBban//H8TXU2wheO+0BR51oRvNf0u8JnV6bzIVH/Mq/BaDTyyK+uSiBbEi0QCLTKQ
	l/We5QIfRt1Mmock+vb5E+VKurqyDlqXTZXsTP4bnGgfYYtbYtTr3gMHNxE3NpbsRfBvPnl85x/
	pNH6HbEQXkLYMxGKoRRRUeUZyM09N6pa3ofwPXQp6CYXeyzmOTMdApe1RRp8HqKa45J2T3EebWq
	Y7uK/Llcz/WuP6GIX8dxWJ6AXV/PF+SOcj42DUWQe/FTkRsX4lzTXQOYozdBoRPQvoy7YXsr9+4
	0g1JcdTtiNrOK8tPpilte7an3I
X-Received: by 2002:a05:6808:538b:b0:4d7:2721:cfb0 with SMTP id 5614622812f47-55c002e295emr491276b6e.31.1792798719329;
        Fri, 23 Oct 2026 16:38:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:24 -0600
Subject: [PATCH v3 5/9] dmaengine: sun6i: detach completed descriptors
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-5-ef1acb0be768@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
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
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index d3a63c866645..900bb629ba3b 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -198,7 +198,6 @@ struct sun6i_pchan {
 	void __iomem		*base;
 	struct sun6i_vchan	*vchan;
 	struct sun6i_desc	*desc;
-	struct sun6i_desc	*done;
 };
 
 struct sun6i_vchan {
@@ -490,16 +489,12 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
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
 
@@ -536,7 +531,7 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		pchan = vchan->phy;
 
-		if (pchan && pchan->done) {
+		if (pchan && !pchan->desc) {
 			if (sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
@@ -582,6 +577,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
+	struct sun6i_desc *desc;
 	unsigned long flags;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
@@ -601,13 +597,15 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
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
@@ -983,7 +981,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	pchan = vchan->phy;
 	list_del_init(&vchan->node);
 
-	if (pchan && pchan->desc && pchan->desc != pchan->done) {
+	if (pchan && pchan->desc) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		vchan_terminate_vdesc(vd);
@@ -999,7 +997,6 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		vchan->phy = NULL;
 		pchan->vchan = NULL;
 		pchan->desc = NULL;
-		pchan->done = NULL;
 	}
 
 	spin_unlock(&vchan->vc.lock);

-- 
2.53.0

