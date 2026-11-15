Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768827;
	b=ECRLB4qAmOuqx+TBHNflmmlXsiXLyHV8/Se6NwxY2W8X//3zcDvmt46Ww7YjI8mw5UiR
	 p9l5UDcrliMLN+ErPvxFn2mJTkuH79YtiisteKoVpkwpYPuLeQo7eFeMsSX6bTv5oQYj7
	 Qb+8fviJ8OUWub69gor4Pe23cRDR1kqwBp9I9Ac7cuUT7gSgMT7qmTFtf8PtWfK7JedHV
	 Kz3tCJE5iGQJIG4rrQuMvZM5PQUIVQmRi16Vmd1MmvwsCNH3g2J9EAInHmzlGrBzLtpRL
	 5I0D+gH1aT9xTqo8Vf3lYp31yeSJvGYdBGDUPmMVc3yzuxfUmfQDKSsSU8K/RI8j2+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRhuQlMYzHQu/cSsivJpIzm9mt/nTPkd+5XFG9V8Aww=;
	b=icOboZ1kxW+1EqtUwdwtFBAMf8x6NdHUY0FTd7nBGJDnyB5wbNYgUlAUPI0oLkrDsUr0
	 mRsXmwuM4Lu4doKTiW4MDMwtJ3p/r9/2cS1Q323Hw5CuAB1V6NoWc3h68kkdBuFbkffn9
	 pd1J445SGh04L8dxRYiffXkWOOSPDNegBODaOqt9bUDRTszIUGDyJMXML8z5wP+6RvTQG
	 amDnorUv/DsE7iNfEc0leSjwmB9szTide9n/8oyaBTvAv6lvVIbRXJ1Alkc9cCpvZWnyv
	 r4iP+3CvrLyRWzx7kJupHLeTqNGDVqMr6e6wOfpO85urkEKB7jPqzD75+tO05JPKqYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b="Qz/OoFVD";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CEF606A33E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2CEF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=Qz/OoFVD
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso6362095e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794768825; x=1795373625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRhuQlMYzHQu/cSsivJpIzm9mt/nTPkd+5XFG9V8Aww=;
        b=Qz/OoFVDqQMRaPKbKcxSvz9uGdYbVzG0xRmKwvqw5qZ6XgELSRG4l3eJ+IMjRAHkAi
         F2lsYVRUdXmsF87YT6tdcNj63BXq+CA0gmOIUcGmZ9KcVBs2g6ZS0Sqhw1O48l6ylLQb
         BWhY7Begw+pBgFzgY4wemsLIze6Uh0uO4oQFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794768825; x=1795373625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRhuQlMYzHQu/cSsivJpIzm9mt/nTPkd+5XFG9V8Aww=;
        b=YrwhAZpxjrw77sEH5yFn/F5oXpnqrH74TwCohfXHdLGgsztA6Zjviybrz1hNruDAYT
         y3ldwzxL2FrD7u5tmFJ0w6FGkEO8u4lZnY4ollG3z0+wy7OVPrDNG82l9B910O5hdhWN
         eulLV0SNDacqaiJ6lGf95/gXvclFlNb2MAfMDrw/apMyDIW80sVIZ2D9qQRqdZTmejY8
         68QdWIkLGV/7QDKc1ic4g0ZWkes0WOlRH4Y8vPUQYvHjgUah+9Fz7sqmBDDPVv5acNbg
         vDfdMyneDRrLUjia5XfUxsfb3r406G0oDMYEbDQOCtN6GrMA8JLkO8jV1NGMgLFigTFB
         uHGw==
X-Forwarded-Encrypted: i=1; AL+hErH+hyBHeBOJZNYdT36tqrknr28WCEsKBRWjNr0MlyyYufoyT0XuJfBvWJO6p/KBTviH9vDHPhreBTBjGRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GIxE0RKug5N7EGgZNYwOw8LoELBu2tdqv2Ri5KKXdspsssRIQ
	378tcQGv15t3aeisz1Es3axRr93zttxe6ClyMiTGx+qYrTpOaeRPV9YKguxBNxIeyE4=
X-Gm-Gg: AYBFou34TvEhU+a54zZkS857FVuWhvdfuamlB3I5+Bgq8XbSU7lXr/tkp4aWxAuq9Fi
	eHtnlpwisYCo7smVTMGwWiquIYi4AhB4XX3kTVrYjHNfYr5NkJI3J9iDkx5SdvuNsC/n+4Ey/VX
	K5ybrAmNbbJGpHGsuUU6dzGkGRg5nqMASYRGab59fNii3NucJMgNgXFG8b277P7/gsoNki8mVSQ
	CyzzcybhgdbCHcnbC7s5SQHONmqdFvoNh+vqll12u2YnqQQc/Y7+QDEvobLg0uV6GmoG1vWfLZ0
	cyM4B0A2e4YNhYnW4SoQmStxcOoYUpo0/HhswWIeF7ShosfCRbUvV6fdfkOm6VKXbaddppY/RcQ
	wR4VdAEDWdK2f0KZJgOHQffIS66rgvrl7khKdmpt+lVBdu2lmi3E9RbmXp82EQiNypYN03dvCN+
	4iXRt9+Nwa9Cnjo50cFSrGnYaROpnLdmnx5Mt9OIdH863TdF5tUoSDricH+sBXkwjxi7vkckX2k
	qnAJk3vuVcZVkvZZe5hPeQOMSUsiMfZ2DxsRsxU6GRc5o/FmU25XCodeEoCtTwiaxc7UgZ3L94A
	MX+vQlxhZi5hf8gq4OToB5765IZiJGwp/A/HSTziK5F4CRw8rB8dLWkf6KFJAxyCHYPATXMFZZu
	RXOn9Iw6a3TPvZtkuxFIUf9e8G1/DNzzJeOAy/G0FyZnK7sbRXnTjlIDvYi7PujnKRHf6lIVzfs
	0sEbeJRx/ShSXagw==
X-Received: by 2002:a05:600c:8b16:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb5d382639mr158238605e9.12.1794768825374;
        Sun, 15 Nov 2026 10:53:45 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm508419145e9.1.2026.11.15.10.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:53:44 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] usb: dwc2: gadget: make descriptors visible before the endpoint is enabled
Date: Sun, 15 Nov 2026 20:53:35 +0200
Message-ID: <20261115185335.782678-4-vadim@yuzi.co>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115185335.782678-1-vadim@yuzi.co>
References: <20261115185335.782678-1-vadim@yuzi.co>
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
the start of an isochronous chain. It costs one uncached load per
transfer. With it there was no BNA in 6.2 million transfer starts under
the same load, and none in a 60 minute run at 1080p60.

Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>
---
 drivers/usb/dwc2/gadget.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 046b5b045..fe37250fe 100644
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
@@ -1021,6 +1044,9 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_hsotg_ep *hs_ep)
 	depctl = hs_ep->dir_in ? DIEPCTL(index) : DOEPCTL(index);
 	dma_reg = hs_ep->dir_in ? DIEPDMA(index) : DOEPDMA(index);
 
+	if (hs_ep->next_desc)
+		dwc2_gadget_desc_visible(&hs_ep->desc_list[hs_ep->next_desc - 1]);
+
 	/* write descriptor chain address to control register */
 	dwc2_writel(hsotg, hs_ep->desc_list_dma, dma_reg);
 
-- 
2.56.0

