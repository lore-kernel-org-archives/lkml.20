Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812686;
	b=mkDQJrvV5cHLB9est71GyrJCtyz6iFzAwCou3YPRbU7Q67Fn4QPFEmxEiKACCBe9irie
	 CItssBaQPzbSzcXf1mD6Z+gLbgtUVvHTbz5eWlq93AIP/YJL3ERl3bInaihwtl0r5byrX
	 s3akszXA4Kms2Re8E58CJEBVrzaSgoG8lP/U3ajf7k6sYLEnmFssQ2JtXNZSYypRIoROr
	 S3nYBuCIIPXtIYvviDdZqsVCC7ftFK7jO1dc7psTD+EE03tjAJj1tfb7G2FzshqemGfEB
	 /EqjSPYqz6uj2L7D63hAPewSZAIoxVpfJPVZ/sChHdsuomL4WzFSRwmAdDwNLOIkqqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zSxGe6Q14H8NquynYqn3HN0rwyDzChffFiquw9hj2d8=;
	b=DPa/9+awk9NJkZNpbhJuO7V9vxMmDTPGCv7c2/NnqCfrA9dAkQxjctVRTzH1vbH+lWx4
	 auFaoaQl7uoaJqgZ7oHtlSLA45FpfOdNIC/EVar1MCaFU807HDMFh4E4tF2w0eIuvvzY9
	 Bs2AkhftXmPXCoMSsO43jZQWYQ5PxWAhcdcibCKs8DbOss/b75Cl+hC+WOF2uHwhdgyIQ
	 avs+YKxdf/UL02nx28ZV9zQQt/s9HK7rM52oESuJDAYRQOnr1RMa6h6kMXZ3CURC5/kCb
	 sRq4wYf4GQ7lIxCTsVlb2SXBs/JDlU6hJ89lzuvhWQQPzTQMy/VuLcxf9+Bhghgs53w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=GT77bi4M;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F830606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F830606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=GT77bi4M
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490a0e72588so1339845f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794812684; x=1795417484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSxGe6Q14H8NquynYqn3HN0rwyDzChffFiquw9hj2d8=;
        b=GT77bi4MhlE1p4+nyf0Kqmyw1ggzQcUxeT2RFO/MxCMhwDcvHcSGihf23+tDoIsWO+
         sSsveMw0HCysXorRX6n7r2+bPisiAT8u24HYXYRAiR+f0cQ78//JZiRijEEScZfmK+zD
         GFB2Dbg4XF89DFIF8XGVfPqZzED9JFtCZ0rtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812684; x=1795417484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSxGe6Q14H8NquynYqn3HN0rwyDzChffFiquw9hj2d8=;
        b=sWu/ELticwWr2BL7GVnqTTrlVVCghsy5dzvXqzeIb2q8MP45KLXh3GhfUdkjbUO8Pl
         Qpjjgi5lbxEe4O4cj9pNgRBlVu/4Ty13obDqR5O0EuIjlf0wWbAlSZV8Tx9cBEU1gyHZ
         I6mgyWav+LdSb1v/rVfkFZD2OfifuaadCR8Q9pcncVPaLJd9J113Bx/WdgIr0LXZMuUj
         m4PENSePgRuVzLGpum37kAwadeu0N/VTU2rtFt7tDldp3rPRPb00dfhRbRxVN85GpoUL
         DH5fROOZlw52n+mtwMVOS1VUlgPHAx1r2Lrd8fhWG8/Xo/4zjmAO9aNvZLUt8MdZj7DO
         ny5Q==
X-Forwarded-Encrypted: i=1; AL+hErEuM3yjuD6aRIHk+bnkKdo0VPRiKechhpeOt3rxIxu2MinqX9DPgvQTTR3HzTS1FuI3wJL9UIaJMKeYaU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fY5ZFLvFx4MMULUImkWlx7aR13q7yfIyLwuRUO4jRsMUM0Fpr
	3Hfk4oSNHi7DV951MB1VC+WQ2qK8vIigW3ZG1MWW00gTBL0X9uBzUZ3dKR6WV6j9Jts=
X-Gm-Gg: AYBFou1XQZBkKSwS/gQKCU3VLLyd2vaen8LQ1tVhICB3rFy5xTuf3+7O0ZPVd+CoH0O
	D81oVzU9hWPjBkX92tk1k7u6tVZE3TAIvRyJhbyE3dnWf+OpOSMB5MEQWD9XC1bEJiwy0NMaYiF
	bVqMVKoPlCGA7Qe53DkEnmTcBSbDDSUdpViuobOlYRumy7WEW0fRqR6sojzQhswB81znjezbru6
	b7DUG8X0c4TmG9yAx5mPi5UvSAeUQcLU1CSfR8B8Cb+LQRnFuUlKj4xYecqlDXipaO/XdmHi6bU
	JnEYfOWMQV/6iH3w7YZGLe+78X9MIqFtVkWmt/62NMgvPxE4wNC4StE9DJsct0W71nNszLcQUQW
	fmG6pMs+nAV3dh/LszUdS+i8asNuOwe64k6+s3oppghTeSi1JiXfi43iGQjWVhL1FsZLULVK9Pq
	gkXORLcZy+L6Yp7w4whY0Qrw/Can+mk6JnyFP4j2c3OAKU1ZjsS12VZE6KzvDlNJEpdnHCJdptb
	bqZTiDi4pwBgaNNfhzv/MrB5xD8EC8qpgC7JYKewWa7MU7g4izE57xHWIlMiJrBeffc2mNLxKmv
	/zWSF7aE8lWmv5SBfSo+EmaVLerrSa+JGqgloGXfHqJshHdp2IFMFOa8P60YVE1NLzlhaOLyn9O
	nRiKP7W0R2KeLznjrbLvsU+Fy32YP8r9drMTN44bPUBEoitGJXOICrE3x9whnGWvirslqZaVFxB
	+RZrp3KuW5+xfYkZIsCZInDvCceKNWFaUaSZw=
X-Received: by 2002:a05:6000:2082:b0:48e:7470:9e98 with SMTP id ffacd0b85a97d-49c726dadb2mr21533685f8f.39.1794812684482;
        Sun, 15 Nov 2026 23:04:44 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm21866706f8f.45.2026.11.15.23.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:04:43 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com
Cc: chenyou910331@gmail.com,
	inochiama@gmail.com,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vadim Yuzifovich <vadim@yuzi.co>
Subject: [PATCH v2 2/3] usb: dwc2: gadget: restart descriptor DMA bulk and interrupt endpoints after BNA
Date: Mon, 16 Nov 2026 09:04:32 +0200
Message-ID: <20261116070433.2813951-3-vadim@yuzi.co>
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

In descriptor DMA mode the core raises BNA and disables an endpoint when
the descriptor it fetches is not marked host ready. For isochronous
endpoints dwc2 handles that; for bulk and interrupt endpoints it only
logs the interrupt at debug level. Nothing was transferred and no
XferCompl follows, so the request stays current, the requests queued
behind it never start, and the function driver waits for a completion
that never comes.

On a Sophgo SG2002 (DWC_otg 4.20a) with a video pipeline loading the
DRAM this happened every minute or two to the bulk IN endpoint of
f_mass_storage: debugfs showed the endpoint disabled with an 18-byte
REQUEST SENSE reply current and nothing done, the 13-byte CSW queued
behind it, and f_mass_storage asleep waiting for its buffer. The host's
command timed out after 30 s and it reset the port. Read in the BNA
handler, the descriptor is 0x0e000012: host ready, last, short,
interrupt on completion, 18 bytes. The chain is written completely
before the endpoint is enabled, so the core fetched the descriptor
before the CPU's stores to it reached memory. The next patch closes
that window on this SoC, but a BNA on such an endpoint should not leave
it dead on any platform.

When a bulk or interrupt endpoint other than EP0 raises BNA, is disabled
and not halted, start its current request again, which fills the
descriptor anew. Start it from what has been transferred of it, the way
the next part of a request longer than one chain is started, so that a
BNA on a later part does not send or fill the start of the buffer
again. Report the BNA with a rate limited warning instead of
at debug level: unlike on an isochronous endpoint it is not expected.
Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>
---
v2:
- Restart the request from req.actual (continuing) instead of from its
  beginning.
- Follows the move of the isochronous BNA handling in patch 1; the bulk
  and interrupt restart stays after the endpoint-disabled handler.

 drivers/usb/dwc2/gadget.c | 49 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 8adc90047..a7eaf75ff 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2389,6 +2389,46 @@ static void dwc2_gadget_handle_isoc_bna(struct dwc2_hsotg_ep *hs_ep)
 	dwc2_gadget_restart_isoc_out_ddma(hs_ep);
 }
 
+/*
+ * dwc2_gadget_handle_nonisoc_bna - handle BNA interrupt for bulk and
+ * interrupt endpoints in descriptor DMA mode.
+ * @hs_ep: The endpoint, not EP0 and not isochronous.
+ * @ints: The endpoint interrupts that came with the BNA, for the log.
+ *
+ * The core raises BNA and disables the endpoint when the descriptor it
+ * fetches is not marked host ready. The chain of a bulk or interrupt
+ * endpoint is complete before the endpoint is enabled, and afterwards the
+ * descriptor reads host ready, so the core read it before the CPU's writes
+ * to it reached memory. Nothing was transferred and no XferCompl
+ * follows: the request stays current, the ones queued behind it never
+ * start, and the function waits until the host gives up and resets the
+ * port. Start the request again from what has been transferred of it, as
+ * for the next part of a request longer than one chain; that fills the
+ * descriptor anew.
+ */
+static void dwc2_gadget_handle_nonisoc_bna(struct dwc2_hsotg_ep *hs_ep,
+					   u32 ints)
+{
+	struct dwc2_hsotg *hsotg = hs_ep->parent;
+	struct dwc2_hsotg_req *hs_req = hs_ep->req;
+	u32 epctl_reg = hs_ep->dir_in ? DIEPCTL(hs_ep->index) :
+					DOEPCTL(hs_ep->index);
+	u32 epctl = dwc2_readl(hsotg, epctl_reg);
+	u32 status = hs_ep->desc_list ? READ_ONCE(hs_ep->desc_list[0].status) : 0;
+	bool restart = hs_req && !hs_ep->halted &&
+		       !(epctl & (DXEPCTL_EPENA | DXEPCTL_STALL));
+
+	dev_warn_ratelimited(hsotg->dev,
+			     "%s: BNA, DxEPINT %08x DxEPCTL %08x descriptor %08x, %s\n",
+			     hs_ep->name, ints, epctl, status,
+			     restart ? "request restarted" : "not restarted");
+
+	if (!restart)
+		return;
+
+	dwc2_hsotg_start_req(hsotg, hs_ep, hs_req, true);
+}
+
 /**
  * dwc2_hsotg_rx_data - receive data from the FIFO for an endpoint
  * @hsotg: The device state.
@@ -3350,6 +3390,15 @@ static void dwc2_hsotg_epint(struct dwc2_hsotg *hsotg, unsigned int idx,
 	if (ints & DXEPINT_BACK2BACKSETUP)
 		dev_dbg(hsotg->dev, "%s: B2BSetup/INEPNakEff\n", __func__);
 
+	/*
+	 * A bulk or interrupt endpoint is restarted here, after the
+	 * endpoint-disabled handler above has flushed the TxFIFO of an IN
+	 * endpoint.
+	 */
+	if ((ints & DXEPINT_BNAINTR) && !hs_ep->isochronous &&
+	    using_desc_dma(hsotg) && idx)
+		dwc2_gadget_handle_nonisoc_bna(hs_ep, ints);
+
 	if (dir_in && !hs_ep->isochronous) {
 		/* not sure if this is important, but we'll clear it anyway */
 		if (ints & DXEPINT_INTKNTXFEMP) {
-- 
2.56.0

