Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792842752;
	b=5Q2h7cCHPXDg9e9QdLXfXWz/b8vk4tpqf5EdKKTMCjVW4hc+OblrwgRosZB8u95ny8o8
	 DWDvA2KuwEvPybc68RhxZCJNeSVvt55lpJ8uUp2rcIZMQ51U10OCkeeAt94sWIWR30rxv
	 Ipk5MoTlojZifixf3T0JiZUmfs/bvHa4OR8m2BypAkixzrIJJCGPATRQAuE/8V8oCYZyU
	 TQnf7kZ6AGUR/189+ATum/7YoiQD4pp5UOGWYVmhjAdPIcQZcwqG7SZJ1LiHWzHF+Ee/N
	 8WpfmerAmw9Q/G20IyPKJGfldbyaC2T0YJbNsJYZAUFmE7T51h5lQbAUfHr8pZosgdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792842752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AW0iDiDhPw3HeIJ6Qu71m8tTntH56Z6IEED1Lqi8fUo=;
	b=OWnauoov5V++YwJpI1I/JcPQl1iaRnZDdmlapKErYUNFE9bhirdhAT21wFeVlAuRBhbT
	 3OaE1Nqp5HtX7aqBRQhx6W0628pjaiB9+2nUUDEnJx2RSHji8rkAa87NN4y4/sJUXR6bb
	 zVZ18DXpXAPZ1JlEwgPL91aaztRpKU9kEh0EseaG2Ve9JaM//1aSlr4sHH6I3dy7oH9k3
	 +jMHejqY0EnARj+0FJF72F6IWvoR/keTgJVaYFOaTHtIr9PcIL1OqZ4nowhcz/x6BolqV
	 cDdwhzIW4IeFaxpedGc61EsG/Th/xr1WdptdlVa8kvgm8Mta+chpaIO+2ia4KILq/aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bBjEvhib;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6EC606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A6EC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bBjEvhib
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15943c9be84so70095c88.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792842751; x=1793447551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AW0iDiDhPw3HeIJ6Qu71m8tTntH56Z6IEED1Lqi8fUo=;
        b=bBjEvhibJdRdn3Noct7rmn3EONm1dVpRAyq95BwvIWi8wdzowrhCah0aG0FUif8gNw
         8OPZpCMhdB6slqTRFJB7kO/5SikM8K/X/pjrKnrTCJuTxbA6DMaPPOuPpGV3epTbvlM2
         GSdAqn7+G+xMgXUImktrF49tZVZJcC8qula4fDXsWxFHuFqr5nyONHYzD5Og2QPWAQyq
         3uNqw5hksdcm/6IcKJylKaffZQkI8QD/7q0igHZ3dd0yZOpvT3DEW+NYWb3mtgfxgrzD
         3KLAjlM7YPht5dor+Ode+Vy9Oo9TTfYhQmiuqELyTAFHtMsB4+cWETcPuSIf2qhI2FQ0
         5c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792842751; x=1793447551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AW0iDiDhPw3HeIJ6Qu71m8tTntH56Z6IEED1Lqi8fUo=;
        b=diPqWNFHmNr/Bho4ivohl13PDovbkippV7PcDSnbMv1kQHb1oCC7chZ4XhQn1vFgHY
         6D1dYW7Kn9MOq8nTq4sSC6E3X8hmyQ52BZITk04CYEiRRg7bvwvJNQg/JdfbAxsYaa1b
         kuWN8CZ2BRpin1uc1CQi/ya32i1HVSLvGIWmPoZtnNiImTFDV4QYIwUIeTAjFmSPY9om
         a0dnJWXvzTZgUlR0Qs+gO9KdR6gQa1i6OHK/Op0eTB5nR/QwgsVuejqSTI4sFO4KrJM7
         ODyjHrGVsbs+sgOKho/xkTQk9PBZEThYP19KZ+8PLC6A9yPeI/swdZ+5ZF8jaamWFsQN
         YSjA==
X-Forwarded-Encrypted: i=1; AKwUvBxZtOJnvxg1fNYx9Io+IJVfGNx5+DUYniMsmaP5dvs80cKw+l9OPRDCTQWg8AmGxTH/2VJDvBH8AvMVx04=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlvq8vvBsn1aMXHKyC1EQG8LVlnZ0e8Zs3PRp90UioN/F7KeUg
	6Bdp5u756f+AcBTm03GEtJTHQ9QuKyxAw293X44pG7rFuVmLbiLDaNsr
X-Gm-Gg: AYBFou2u/er4906XBCrHJR72DXxPw7GJsu2CRe8Yq8IPXDt9ebEpI+EyHusX+SCZO0P
	VFYdcYlpAJuLFiau1oWJbp+DUENR0NaDBoa+pQw436wCRHiC+ag0o5LhKyvgL0pWgN7oXKx/Plj
	MGWtBqet7yKfEh7yOoAu95qZGM4j6rERbxf3mGDEW1Z0Zev0s9ckTa0MkekXjAB8D/b5NwnoKuv
	QlHR2USK1mUpVQc/9jGqsAtwcx5RpBGQ19keNs8aLbIGM2LJmtYwEyrt1g4I2AgvBwzHn8iaOgK
	UqklcFU5xcGq8W0ziRjLJFBvJquXKrUns0yIvkQPalOpQBZWylzo0iQBm4q1VrmSbyJbLF8XFNB
	qVMbOivhojx33aWEj1ywp3t8hluRxkWv4wMX16+fAkz5P/qfDHEPL1HVyWD17WvwIXa3en61ob0
	Pbsqd46XZfxtnoKjNih1NzHn3JB1L/K5RwOZjvwKK4DdyUhjDJFbCby9E/G+XhT+A2sUXUVZgym
	we8O46/6gwRqiXOT9sVFzN844aswX/uikyHXEbv4f3jeMApr5bCSNzyw+qfhMau9zbL6ejJds2y
	ftf8G3LVv4XkO03l2Tr/cUMg3sbkboBvVxpV3dM=
X-Received: by 2002:a05:7022:4582:b0:190:e602:c769 with SMTP id a92af1059eb24-19933e0f4e9mr4773490c88.1.1792842751119;
        Sat, 24 Oct 2026 04:52:31 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ea25sm6367060c88.5.2026.10.24.04.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 04:52:30 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH] usb: dwc2: Disable gadget descriptor DMA for Sophgo CV18XX/SG200X
Date: Sat, 24 Oct 2026 19:52:20 +0800
Message-ID: <20261024115220.823159-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
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

dwc2_set_cv1800_params() disables gadget DMA (g_dma) but leaves
g_dma_desc at its default, which dwc2_set_default_params() takes from
the hardware capability. Descriptor DMA requires g_dma, so
dwc2_check_params() rejects the combination at probe time:

  dwc2 4340000.usb: dwc2_check_params: Invalid parameter g_dma_desc=1

The check then clears g_dma_desc, so the final configuration is
already correct and only the warning is spurious. Disable g_dma_desc
together with g_dma in the platform parameters instead.

The gadget parameters are only set up when dr_mode is "peripheral" or
"otg". All in-tree CV18XX/SG200X boards use "host", which is why this
has gone unnoticed.

Tested on Milk-V Duo 256M (SG2002) with CONFIG_USB_DWC2_DUAL_ROLE=y and
dr_mode = "peripheral": the warning is gone.

Fixes: 63aa7ab955e7 ("usb: dwc2: add support for Sophgo CV18XX/SG200X series SoC")
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 drivers/usb/dwc2/params.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 091bfcfef753..6941705e426d 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -226,6 +226,7 @@ static void dwc2_set_cv1800_params(struct dwc2_hsotg *hsotg)
 	p->otg_caps.srp_support = false;
 	p->host_dma = false;
 	p->g_dma = false;
+	p->g_dma_desc = false;
 	p->speed = DWC2_SPEED_PARAM_HIGH;
 	p->phy_type = DWC2_PHY_TYPE_PARAM_UTMI;
 	p->phy_utmi_width = 16;
-- 
2.43.0

