Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768826;
	b=cFzL270ROP7DnPoQ/PadX6kpxYPoImFnQEwslzVEB1MDn5iR5TiYUge2PTCcGELfJ2Ln
	 wXtAIwobr7tz1wza097biPvhI+fHoBAL9TuAS/QRTVYM2wDeYfwI2DRrWlfmFXV20rmWg
	 jSpi3Pl3Mx9CSuIhqRa3St/nEIfCOiFama/HU3gT6PRx53mXdJVdtwhIuI5ifklHSEf/w
	 0yY2DN+pVtnjZWd1DmKZzPKeW6TDXW7wPL4VbVaPTbd5ROyKPDUCnpTs1EJXBHgEOaCXf
	 yqo7qEznVyobv1WZHv7bK5CBg+nJYHrDFMwr2WuIrk14uZHl0GQyCaTN9BdsmD44IcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ze2yB5gk+HNq39+e9lOoLqG+BRZOAZ1FVtK2xhfyPmE=;
	b=HqXog+MXHArn/Yhbc+kK8dmoq0hXH8vI+dONpiuNRy2JpKAfpO0A6YY+6RSEkbmOKLza
	 frUrqXuy5iC85mwh+HNQgwSr2zDFV7Dyg8BDCPXmAy7c07zXD85Zyo8CJGJtfoilVPB/H
	 nEuCGK+QH526va9CTLx2VP0EvmTR5risBX58I3zxxJw0iNDojLIlTq4YkJ7PO+RC7AjEM
	 v7K36sbw804xUXeNspNXq9kgnzeqYc3zPvp6DWoUkS1SJDHVl1oU1wH3neDso/Uo6d/wh
	 HA0Z1VVD6GIzpxZh4vmRTiRHytsLeORk7099MPS2bkpdgAWZ64WXAMz+M09sfuGjSLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=fmYESyMc;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B5F606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B5F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=fmYESyMc
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so2569165e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794768824; x=1795373624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ze2yB5gk+HNq39+e9lOoLqG+BRZOAZ1FVtK2xhfyPmE=;
        b=fmYESyMcOcPNBrVIG9pTz/GX40rE7ARFytSuS5HISaCYxWT8ylusIM5to96koZ3uIg
         1kFPQYg741ZgL2bugckZzNhBUIdlxeKMx4iaB68PqxsXF0LcKS6Wky/WFO8RzvCML+Zj
         CbTpFPPl25R6QbBBK6ORL0Si1PzhV4x5QfTJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794768824; x=1795373624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ze2yB5gk+HNq39+e9lOoLqG+BRZOAZ1FVtK2xhfyPmE=;
        b=I5hYXXPjhI8PmezO4i4V/wTfi0H8ObjNlp1vzZJpi6gQZZLfAWJM03ihBn5S/qRVmU
         JxCVWtVe/dAG44JxZ1vH23b+IemHKkTivmNaa2ipsu3FefHBQIsJE35BKXby8BHzEukX
         j6UnTOW6AUwN5PH/SkyEvTcoVK8G2gJ6J5MLmEAHqzHwKq9B8ociTYfWDoSLz6c6Dt/w
         +QaLYV4pnaKaMnF/18Nn+VvWUHTzEaA+7pIVNssRnz9YrIHaV7YOMEmoQSHCXW9Gr5MZ
         86/UlQ2nlB0JVDOepQWLVcVVoQXMHYJAFD5wK8qQZIW9p9Q0uaTIL22VQVdGL+oB1bBE
         fxJw==
X-Forwarded-Encrypted: i=1; AL+hErFe1fV/avnCs2bdZtQ7cobswCjqOsjcFU4AsybvNzmiKIzI96XPXjqXrEsoR3jI3eAIfRynrT1S9cWJ17I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EVCvV/46K52rgJbD29HuDylA+sH6TZzpC7dMYcSM/UcjYxMJc
	357PQZz+761H08zY5q7l7ZXPxxZ0JSnxxdbsL+3FNoZQ+4FQ4+vSlqlIpCRYDSdxMsaNnLEuGc6
	byHuqeTH2Hg==
X-Gm-Gg: AYBFou0jK3AVNJViLwX7uZ1YSzMXpK74F17vd2O5Y2/7ZNE1hNWdD+rbbMz4JY+x1zs
	7Z90pzjLYB0QFUBxXQHuID2bngsVhHbtpD4SNis6HQV8zNkwl0OIuMaf/zopjHIQFc8fi0V0jRV
	5rp4sNf64DyKdM1uX3jE5JqtUOSVTsWyUkmMe8oS406BdLh7QKqudtwDUxLNIfvIc1bdt8Il5xR
	hsjMNBK5Qmn7+q7WV1yD0B6E6sjhcsJPcBrQI/6N0H+YHgHTFH41MPN64nBG06JWp7aovsmm/jf
	vD3AKK/o4a7tOtzc+o9xWKAYeE6DInkJnrvztl788hiuyCfUjZCbvqlcEWGfNi4ia1jAULwRgpd
	wKDpAi3DEX3vC9uiTCeOVqPEdMAx8fr9vYiV2AjCv/9oKNU3u2qouE8ny9JUWyj0stTscwIYSpp
	EC1jxnW+75iYSBXYZHUg5zP2cLZPyI5fA2GbGzqlMHqFThdM4wswbg/5yOexIPWDzKuqRscfhpj
	V2AickIXME/+QjTXPOS0x4XpIDUa+OJrGC4IJHN8SB4+bdpmfQt/vIFNVFZUrvBMzgz791EK3aA
	9fhWJMJC60eWW4ow7kNroHGV0rNIS+g7SeyDOKMdd5/ftq86cW647xh+zoIanWgGn2XzGapGS63
	DqHIEjYFgK0NUrS49aHdfO56c53NmrAZQWz2AToN048jIomMAtm3I+8iOkP2CeuCjrPj/QhoxET
	z8f2X7jl1HRVj87w==
X-Received: by 2002:a05:600c:1c0e:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb68e5bb4amr88504125e9.16.1794768824018;
        Sun, 15 Nov 2026 10:53:44 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm508419145e9.1.2026.11.15.10.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:53:43 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] usb: dwc2: gadget: restart descriptor DMA bulk and interrupt endpoints after BNA
Date: Sun, 15 Nov 2026 20:53:34 +0200
Message-ID: <20261115185335.782678-3-vadim@yuzi.co>
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
descriptor anew. Report the BNA with a rate limited warning instead of
at debug level: unlike on an isochronous endpoint it is not expected.

Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>
---
 drivers/usb/dwc2/gadget.c | 41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index b0e129061..046b5b045 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2305,6 +2305,45 @@ static void dwc2_gadget_handle_isoc_bna(struct dwc2_hsotg_ep *hs_ep)
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
+ * port. Start the request again; that fills the descriptor anew.
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
+	hs_ep->req = NULL;
+	dwc2_hsotg_start_req(hsotg, hs_ep, hs_req, false);
+}
+
 /**
  * dwc2_hsotg_rx_data - receive data from the FIFO for an endpoint
  * @hsotg: The device state.
@@ -3257,6 +3296,8 @@ static void dwc2_hsotg_epint(struct dwc2_hsotg *hsotg, unsigned int idx,
 		dev_dbg(hsotg->dev, "%s: BNA interrupt\n", __func__);
 		if (hs_ep->isochronous)
 			dwc2_gadget_handle_isoc_bna(hs_ep);
+		else if (using_desc_dma(hsotg) && idx)
+			dwc2_gadget_handle_nonisoc_bna(hs_ep, ints);
 	}
 
 	if (dir_in && !hs_ep->isochronous) {
-- 
2.56.0

