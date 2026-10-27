Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793064105;
	b=NTKZTMfRfcyWD6jmqr5r5/xNzWBsgx2TTAdFItge3UDIckYJJdj4OaTGI30UM7V0PxmA
	 Mxxaefm66b8r8QfijST1Y6nYAC56N839XTPBPnFLlTAfIgWn7xZZUZ1S1+jZbfgnqUpGP
	 J11y+RUvIUKcbvW4u4yzloNvDQB2JA/GZs/IiHf8aWamUS2FGCjLaaqAuFcFnU1FRFJvq
	 Wx7EeBGMWgQuUlJMRk2mluVUoqYG7IGkc7tvd37nr0D5nnVQ39kGu7Neq5IUOtFG31iEL
	 RZSVDub54H0bvqKjtZZAh1u6AUGIHhLKWiDEbcUV3fFvcHzAZm4tjzuAtsWMcrmkKVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793064105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rWQx9VY8cR2DvJ7+DHW9RafvsbBO51tt7dAAOJXSTAw=;
	b=5PyTOEHeEXcc7D5bVMxAEQOeU/YmgufI8R2L2aFstnfNe1TBbBuTWUgGVcdYnDKOGzsE
	 t3ZptN9YGuPYH3q6wg+VYvrP6hyZ9XNM1qPQ19Ozu5yYwPjWVT6IEYnAX6ZplkUgFl9R0
	 WmEqv2NzdeWfH1oQIjcuH6/HjUQWJsbrPEc07s3YZA/vGwiz2lZ/OUztcrC9wxuxKnEpu
	 +3Jsma5yIF4gwVSxEpPAd9MSL7FzDEJqrD7Evn+JusEWmSJmbdSaxeMvdxZ02UgmuwavL
	 1a+PfZYGrTkL9GZhYCd4RpIoJ1PBveW13vULbdom8GANDozp1sj/usLPlZV5UbH7vvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fy2DEXGO;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE9D606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE9D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fy2DEXGO
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so41705225e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793064103; x=1793668903; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rWQx9VY8cR2DvJ7+DHW9RafvsbBO51tt7dAAOJXSTAw=;
        b=fy2DEXGOY0KW7ImdHWYGqCc3PAx6ZinfeX3WaX9ixRwVpMFQYQJcP0AUIv4s/3kV7U
         raUEgk0gsL62pL1E/d0Q9+8lWWHgttbMDnzLbIRlrAs32agga/y5IAdTrS5dnqGXWVvB
         oblpYYXBxehQwRWkwfbtToCCOXUVgt5n/3mM8txKteFnO9gKSplzTskchbr4X+7vm1x7
         JUab69ZweQXWu+orV3YKCoE5OamvaCoWP9Hs1SzLGLZkCwH53HeMXG4PvdrcZJNU8NRw
         ejew2yvSIdAe9nX6KsBGoB0DmhibQcOqnFPceumLQ59Y7eLq309B07MSQxiIGxgGLshu
         OwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793064103; x=1793668903;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rWQx9VY8cR2DvJ7+DHW9RafvsbBO51tt7dAAOJXSTAw=;
        b=T/Z5Dlf2t6RSKleEJkB4y3OQONUgnvlCG4GnHBAQPFA6WoGogJPD0kvWxD59VETkX9
         XbXcLiCJyWsnoLoL3F8k9lAUWsGftzL1K3c0TiIkN+wlM1pUmy7alhvn3smr4YT3qC34
         HVj7Jxna1ghogLDtLSQfFhdnFM0eJgeTkuskSGuGUyQAcQwaZX7BHg5/x2gDb3/qE2rF
         h0nBQYnDbT7VF/5DIwAM1+/NYlDD63zWe6nGiwtg6ovIDCC/7fsY8cIuXnkHs0SzR48l
         d/MRswM/ukegzLFhcs2VGlD2ib6fcxvPU/IgyY2KOMgO3TXrrpgMa0vxgTHBUJ7pXio3
         D+bA==
X-Forwarded-Encrypted: i=1; AKwUvBzyZx67IcT8txdDlwH4a3hI8czajp7owJnHHHjQxCh6wPlEHX+puptC0xy0TCojPsjGSAAIZPGbQAmr9Gk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfIVy2ncrev9X2JwXnrLdUD9FSjDS/zcX7QmcSUt4+QeNCysIY
	VGlA7F4PTNC/l6CoqyE0KPzFUim2zKSwcZDWmfl16w2ODCGq6jtSWkSy
X-Gm-Gg: AYBFou2I79E3Ew9sN59LcaTgdj+oE8VK6sNxi7dMlJ0IIg9GRKj9LXS9FyChpU9nfag
	+uD7wWFgH6YU7uawTaXJVIDasFtmN5+XI8ku5lNCZ+n5csioxB4P+SU9pMqocIGOCJjfEZC5hPn
	IpS8Qq4jc8k7pH+cJTM6zENV6lpKZsoRkskJ50dl/kiO7P1jA34iE9CqA88FFijTtKJNDtfYEwD
	vp5ijanSwm9/3DtKYhCSUfpCZ5FfUqvzJ7ytKG5mMJ2ZN7kHLVBq4M812PzCXfLKI30YqJ2Vx/a
	zt6PNs8uGaKB0Am8rxSqlOA8h0Ertf++CdsTgwVogleZdPwQyO1Ii9dwjH+4HGXpT/eNxQH0PYX
	n1CgF1dcMkPn1HsbpOFffoR66HqEvLmMIifXTiUZ7iSScuMlm0ekhpW/F9AQVNFcqjp75M65xmy
	oWTKRtfYvYPfOMy6f1luDArkmQRCEjlL/coq1bTnTa8tI1RgYB8dwMSrGuOizHc7DiZTHHlgTZ3
	hIeWjN2h1d19TfzPcI9fVBuaS8U4lUfvXg+j6XFQeciLp1ofzQIJMS9OyexK55G/9qVRzdw3w3t
	e+uMQgOi+k4RSPG/ZZH4ZrU94PdY22wGm1xhotk=
X-Received: by 2002:a05:600c:4e43:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4a64d6ba846mr84362775e9.31.1793064103398;
        Mon, 26 Oct 2026 18:21:43 -0700 (PDT)
Received: from [127.0.0.1] (smal-20-b2-v4wan-173097-cust1152.vm20.cable.virginm.net. [77.97.36.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08dcbfsm153270855e9.2.2026.10.26.18.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 18:21:43 -0700 (PDT)
From: Filippo Falezza <effeffe99@gmail.com>
Date: Tue, 27 Oct 2026 01:21:42 +0000
Subject: [PATCH] usb: dwc3: qcom: Restore UTMI PIPE clock on resume
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
Message-Id: <20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTvQicSCVxEXNvljR2gtmUaF0
 rub6vJbvLeSISuMzs1KGS81fU4VcmgoDLfpDtZYTa51J2ldx/EdjlyWUTnDygj2KXkvvSBKpJr
 NGUk/v+Xl+reV/oGw7B/ati/nNQk7dAAAAA==
X-Change-ID: 20261027-dwc3-utmi-resume-5ff551b1ed1d
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Manu Gautam <mgautam@codeaurora.org>, 
 Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Filippo Falezza <effeffe99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793064102; l=5275;
 i=effeffe99@gmail.com; s=20261022; h=from:subject:message-id;
 bh=GvluqYDhhYQr8wvM6LTH8W6K1E9SiSzkvOIai5qx5+Y=;
 b=AdyArBgtFbMjZvpLXC3d7HU+jrDiX1Q7dqWhd6M3TsoWvH+xVTRatoqweFuilIRK6ap4ASmTi
 L2oYpc1dVnWDm3n/P4GJpqQI3/5yt0gYI9sO2/YbX/0vcvlS/Nngs3c
X-Developer-Key: i=effeffe99@gmail.com; a=ed25519;
 pk=7PPwl4QILojrh+ATB5QOpvXVmmoxaxyLQhrLRLWEL0I=

Boards whose controller has no SuperSpeed PHY set
qcom,select-utmi-as-pipe-clk, and the glue then programs QSCRATCH
GENERAL_CFG so that the core's PIPE clock domain runs from the UTMI
clock. This is only done at probe.

When the SoC reaches its deepest state in suspend-to-idle (CX power
collapse), the QSCRATCH registers lose their contents. On resume the
core is reinitialised with its PIPE domain unclocked, and the gadget
does not come back:

  dwc3-qcom a600000.usb: failed to enable ep0out

The link stays down until the driver is unbound and bound again.

Remember the property at probe and select the UTMI clock again in
dwc3_qcom_resume(), after the clocks and interconnect paths are enabled
and before the core is resumed. Move dwc3_qcom_select_utmi_clk() up so
that it is defined before its new caller.

Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
---
Hello there,

this fixes USB peripheral mode after suspend on a Motorola Moto G 5G
Plus (SM7250), a phone with a USB 2.0-only port that I'm bringing up on
mainline. Its controller needs qcom,select-utmi-as-pipe-clk. The first
s2idle that reached CX power collapse broke the gadget: "failed to
enable ep0out" on resume, and USB networking stayed down until I
rebound dwc3-qcom by hand. Rebinding works because probe programs
GENERAL_CFG again, which is what this patch does in the resume path.

With the patch, the gadget (NCM plus ACM) reconnects after s2idle, and
the SSH session over the cable that I use for testing survives
suspend; the phone has run with it on linux-next since 11 October.
The other boards that use
qcom,select-utmi-as-pipe-clk should benefit as well, but I have only
tested this one, in peripheral mode. The legacy glue driver
(dwc3-qcom-legacy.c) has the same probe-only programming; I left it
alone because I can't test it.

The patch is on top of usb-linus (6b4b543fa187) and builds with W=1 for
arm64.

I wrote this patch and drafted this note with the help of an AI coding
assistant (Claude Code). The testing above is on the phone.

Thanks,
Filippo
---
 drivers/usb/dwc3/dwc3-qcom.c | 45 +++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..6334ca7ba30f 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -81,6 +81,7 @@ struct dwc3_qcom {
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
+	bool			utmi_as_pipe_clk;
 	struct icc_path		*icc_path_ddr;
 	struct icc_path		*icc_path_apps;
 
@@ -335,6 +336,23 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
 }
 
+static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
+{
+	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
+	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_DIS);
+
+	usleep_range(100, 1000);
+
+	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
+
+	usleep_range(100, 1000);
+
+	dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_DIS);
+}
+
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 {
 	u32 val;
@@ -388,6 +406,15 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 	if (ret)
 		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
 
+	/*
+	 * The QSCRATCH registers lose their state when the controller's power
+	 * domain is collapsed during system suspend: select the UTMI clock
+	 * for the PIPE domain again, or the core can't run without a PIPE
+	 * clock ("failed to enable ep0out").
+	 */
+	if (qcom->utmi_as_pipe_clk)
+		dwc3_qcom_select_utmi_clk(qcom);
+
 	/* Clear existing events from PHY related to L2 in/out */
 	for (i = 0; i < qcom->num_ports; i++) {
 		dwc3_qcom_setbits(qcom->qscratch_base,
@@ -419,23 +446,6 @@ static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
-{
-	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
-	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_DIS);
-
-	usleep_range(100, 1000);
-
-	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
-
-	usleep_range(100, 1000);
-
-	dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_DIS);
-}
-
 static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
 				 const char *name)
 {
@@ -680,6 +690,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	 */
 	ignore_pipe_clk = device_property_read_bool(dev,
 				"qcom,select-utmi-as-pipe-clk");
+	qcom->utmi_as_pipe_clk = ignore_pipe_clk;
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 

---
base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
change-id: 20261027-dwc3-utmi-resume-5ff551b1ed1d

Best regards,
--  
Filippo Falezza <effeffe99@gmail.com>

