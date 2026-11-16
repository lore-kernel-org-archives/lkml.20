Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812688;
	b=5IlE76qXkQ9byr3fJDxEDsd5zwn32QGarnKuPYKY2CHPfqjqpc/QtEu0HNMVMmVwYfrd
	 gKG6IMDN9rWLr5UnI0fj5uGWNkKdczb84UAsWAGtm0fsz4bAQ/Q1UPLdQ5QqcNQNUFoJK
	 lObYA6YPD8sWNGI3kmIG7+Ktl5OmxiJnlPT6BKq9eEpKJtwTWUzHpnoKhUzBuIwXVC33S
	 /z8bIB9+evcTted/CrD2RZZpcWdZO8n1bs8NJtVD6OX/+nApOg5nwXQXTe4iJJmF2WLwz
	 LBWH03CC4lTFq1tw+G8Vx4eXS90gq7WUbNRnxU7AfnRYfJExl50g7IC+sebcQ4T338A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=omQopKG0vJN/8IAN9W8FBopNM44OY3QKRAS5YIysdeY=;
	b=SfP73oRe5XrSKYmQRhHdG4U5JI7HuQC74IeJdKNmI3VrHeZNIH0S0aeRAjf336l8VMAE
	 UFev4vRRuPz6UFWaglDuY/P3vfkwIz2ev2TvyiNG1DYYJr1p1NZm0tKnKQEpzWIA68rKP
	 a4w57aR0FBdqL/2Yy88qSWdDEPVoYWQBWn5ScGjBrefmWHDZU+lhZVhzpIkVMLc9D21/T
	 AkmNutifOKNIhqNc3cQIOkZ+4JMvjJ/ol8G7QeBqbcKtlENbE+7WxttdNFsNI04Ddv62R
	 kQkEn0qZuHOvM1UKRG6BvD6a1svbWxjecs2P6y7OWcUxo2o9qT72BKadp6BFcN5vgfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=N4TBKIhZ;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A21F606A88D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A21F606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=N4TBKIhZ
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so2971395e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794812686; x=1795417486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=omQopKG0vJN/8IAN9W8FBopNM44OY3QKRAS5YIysdeY=;
        b=N4TBKIhZUREx+oko062InQiY/JGmQZFhHL9mJdq6v9lX+SqJ8zGFXOtJsAj9Y8fVAo
         iX19tVhA5QIr73O1O/OLq6FYIHJR1RqFETQ68iU2ZA9Tn6074FFOp5GnTgUXsXwFlR4O
         V+QohIK7sACnWx4dPtQJx7QyjnA4c4M02rBO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812686; x=1795417486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=omQopKG0vJN/8IAN9W8FBopNM44OY3QKRAS5YIysdeY=;
        b=Fn6zoZshE9l7S4VUQR4mIvJPpYzxB83eVPV1paIzr56GhMHcK8JHqL11tbpjAfL4w5
         ZNaQZcNrp2+wrvILxwmUbDOnwZ/wzndi14yLhBQ23SoMGLM2JZw4NeD0J+4sZFYWTgVf
         knzWEr92/3r0ii3oX184u7UAk0jhCYO9oFulKfimmf7oXtG0aefG1t+0iYq8miO2DpzO
         sZf6r0EQysFP6Yiyy8v3ZERiQSh8SpTXEOWklnibGLhTNhlqZyVcqvq1urOyhNDLtHuV
         K4jo6U7EGd8pFQ0epAcR87/SpFivvQNtYytMULn1Ik1BBCay5GEJmQiz+o/2Mxr1GLDD
         FywA==
X-Forwarded-Encrypted: i=1; AL+hErFzOWxEIVqde9mZODXJRIsXRYRSZufgW/8FvgAJFRnGhw5qSF+23rUFL2yY0WasMXIIoPvgsFs9K4CD8lc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NXbGkEEs3zc9RVWyPLXHPi6iWEgEzdtko8JGeUdywNMDpUBkR
	zFoo+CgXSHSCZXBkEKEANyKUI7FQSyjSRAnIRJTw+EDOgkfhfh/U1uy0LbS7ocCcZKI=
X-Gm-Gg: AYBFou0sdgo0heHc1RRroANWqf+0tMrDDvMOsMRaGfb7jMXiro6UkyVorTvF1ye8vW2
	hfGkKBcFhCzcbJNZ3s9gyECucvqBhWRHO+tdrpWV2qjxul176ZriVs8kMGgDBWDQXUQ1HMLIWfY
	VBRsJRonteWUlO38lJni9YVB54L0PnyhNXLmJNidH575I8mN1iBSJCXwgPUyAt82dfEyvL2Gfk7
	uFOK3BXGl8S6TLuXXYQUwOPic0adS2DB0zUVZHH2awlHbjaKy+s1QyNkcJK32qYw8saQm5ewPOQ
	6cHXFgkR10kq7vt3ZknN/U5fbKiVvYcHEP1ZdbtJOfi5kIQZDI/e18S7PPaXADOS1qWysUiQd4k
	rxB8CUH0z/lkdLVS5PxjfCHSVxjE+VVAfn5RtmEDw0hnvlZVrAoJ7eQP9DvgV59mkHXMopkG/h6
	JmDus/7KqiVEjpsO2QDEnqA02X2Lo9+EeDP9eQ4P6w4naioBGanSAjsTypFtDBPMdss8GTKWWCw
	GOhR28vUuurkCG0T3nb+1n/8rQtwIRHT/pgN9Cz0121jQ2TZT/0NY5ERnga/qlpdwuRNFKj3xS9
	Bn9/KB2rOFrl45uKyM4fUEtGxI+4EV7U03lZIZedCQ+JUd90I6HhpFUsavQRx3UrTCE4ksVz3eG
	Srd3NejM6S90Cv9Mana5qbwI0QvfoXNeLiWxswBesS/TqtiYaSMpbtONCDOqL9mU8JpesFtOXqp
	FuckCbepon2HK2og==
X-Received: by 2002:a05:600c:6096:b0:4bb:5de1:e923 with SMTP id 5b1f17b1804b1-4bb5de1f26dmr146040465e9.4.1794812685829;
        Sun, 15 Nov 2026 23:04:45 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm21866706f8f.45.2026.11.15.23.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:04:45 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com
Cc: chenyou910331@gmail.com,
	inochiama@gmail.com,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vadim Yuzifovich <vadim@yuzi.co>
Subject: [PATCH v2 3/3] usb: dwc2: gadget: make descriptors visible before the endpoint is enabled
Date: Mon, 16 Nov 2026 09:04:33 +0200
Message-ID: <20261116070433.2813951-4-vadim@yuzi.co>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116070433.2813951-1-vadim@yuzi.co>
References: <20261116070433.2813951-1-vadim@yuzi.co>
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

In descriptor DMA mode the core fetches the first descriptor of a chain
as soon as the endpoint is enabled. dwc2 fills the chain in coherent
memory and then writes DxEPDMA and DxEPCTL.EPENA with writel(), whose
barrier orders the earlier stores before the MMIO write. On a Sophgo
SG2002 (T-Head C906, DWC_otg 4.20a) that is not enough: the core still
finds a descriptor that is not host ready, raises BNA and disables the
endpoint, although the descriptor reads host ready, last, short, IOC
when the interrupt is handled.

With a host sending TEST UNIT READY to a CD-ROM LUN as fast as it can
(about 2600 a second, each followed by REQUEST SENSE) and a 1080p60
H.264 encode loading the DRAM, about 0.8% of transfer starts raised BNA,
99.5% of them within 20 us of the enable (the latency of the interrupt
itself), with DxEPDMA still at the head of the chain. Without the
encode there was none in 254000 commands. BNAs per variant, measured in
turn on one boot with a diagnostic build, at about 780000 transfer
starts a minute each:

  unchanged                                   6215, 6510
  mb(), read the last descriptor, mb()           0
  th.sync.s                                      0
  udelay(2)                                      2
  descriptor written as two word stores,
    status last, dma_wmb() between            3728

Mapping coherent memory non-bufferable on the C906 did not change the
rate either. So the stores are still on their way to DRAM when the core
reads, and a load from the descriptor waits for them.

Read the last descriptor of a chain back between two full barriers
before the endpoint is enabled, for non-isochronous transfers and for
the start of an isochronous chain. An isochronous chain marks its first
descriptor host ready last, so that one is read back as well. It costs
one uncached load per transfer. With it there was no BNA in 6.2 million
transfer starts under the same load, and none in a 60 minute run at
1080p60.
Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>
---
v2:
- Read the last descriptor back also when the isochronous chain is full
  and next_desc has wrapped to 0.
- Read descriptor 0 of an isochronous chain back as well.

 drivers/usb/dwc2/gadget.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index a7eaf75ff..cd1773836 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -854,6 +854,27 @@ static void dwc2_gadget_fill_nonisoc_xfer_ddma_one(struct dwc2_hsotg_ep *hs_ep,
 	}
 }
 
+/*
+ * dwc2_gadget_desc_visible - make descriptors the CPU has just written
+ * visible to the core before it is told to fetch them.
+ * @desc: The descriptor written last.
+ *
+ * The core fetches the first descriptor of a chain as soon as the endpoint is
+ * enabled. writel() orders the CPU's earlier stores before that MMIO write,
+ * but on the Sophgo SG2002 (T-Head C906) the stores to coherent memory can
+ * still be on their way to DRAM when the core reads it. The core then finds a
+ * descriptor that is not host ready and raises BNA. Reading the last
+ * descriptor back between two full barriers waits for the stores to land.
+ */
+static void dwc2_gadget_desc_visible(struct dwc2_dma_desc *desc)
+{
+	/* Order the stores to the chain before the load below. */
+	mb();
+	(void)READ_ONCE(desc->status);
+	/* Finish the load before the MMIO write that enables the endpoint. */
+	mb();
+}
+
 /*
  * dwc2_gadget_config_nonisoc_xfer_ddma - prepare non ISOC DMA desc chain.
  * @hs_ep: The endpoint
@@ -881,6 +902,7 @@ static void dwc2_gadget_config_nonisoc_xfer_ddma(struct dwc2_hsotg_ep *hs_ep,
 	if (!ureq || !ureq->num_sgs) {
 		dwc2_gadget_fill_nonisoc_xfer_ddma_one(hs_ep, &desc,
 			dma_buff, len, true);
+		dwc2_gadget_desc_visible(desc - 1);
 		return;
 	}
 
@@ -893,6 +915,7 @@ static void dwc2_gadget_config_nonisoc_xfer_ddma(struct dwc2_hsotg_ep *hs_ep,
 	}
 
 	hs_ep->desc_count = desc_count;
+	dwc2_gadget_desc_visible(desc - 1);
 }
 
 /*
@@ -1079,12 +1102,23 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_hsotg_ep *hs_ep)
 	depctl = hs_ep->dir_in ? DIEPCTL(index) : DOEPCTL(index);
 	dma_reg = hs_ep->dir_in ? DIEPDMA(index) : DOEPDMA(index);
 
+	/*
+	 * The rest of the chain has to be visible before descriptor 0 is
+	 * host ready. The queue is not empty, so at least one descriptor was
+	 * filled: next_desc 0 means that the chain is full and the index
+	 * wrapped.
+	 */
+	i = hs_ep->next_desc ? hs_ep->next_desc - 1 :
+			       MAX_DMA_DESC_NUM_HS_ISOC - 1;
+	dwc2_gadget_desc_visible(&hs_ep->desc_list[i]);
+
 	/* write descriptor chain address to control register */
 	dwc2_writel(hsotg, hs_ep->desc_list_dma, dma_reg);
 
 	desc = &hs_ep->desc_list[0];
 	desc->status &= ~DEV_DMA_BUFF_STS_MASK;
 	desc->status |= DEV_DMA_BUFF_STS_HREADY << DEV_DMA_BUFF_STS_SHIFT;
+	dwc2_gadget_desc_visible(desc);
 
 	if (!hs_ep->dir_in && !again &&
 	    dwc2_gadget_isoc_out_held_packet(hs_ep)) {
-- 
2.56.0

