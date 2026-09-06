Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C79C3D9699;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788670021; cv=none; b=D0YlcWZIJhxjxCDIphn5ISQj63RQQTve3mla4i4NBO8Wf21JLcs/Q4Fwtb+WJDtpolzLZg7Bpq4b/+B1ObyA/BpmHU0dCVFAbj7ZNND8WJF8DXx5trXK9nJk1Ov0WctsOjWUPLJMbzife/EVJ2nQKQn5eo3i1ELk3H4Qh/W3EgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788670021; c=relaxed/simple;
	bh=94YUykDJzjneOKnFmtYOq460CkFRZAGPAcv4chtjAxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qk9+XVSPDnJCkDfuMxHQuuv38JasN8dHxneEVXYIg3B5WKRCY9LYTy9vW/kIljaEqYo3n1XjuDfsH55RcThRMpMaIo9OEbSJF3VrExuPPjmFcwmhoRWY0jeHLjuyRCM1licNv1bCnYYBxSX0zaU8fJSfoBvPfFFw2JQmq2Ltuao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTAtsiWy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTAtsiWy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9465C2BCFB;
	Sun,  6 Sep 2026 04:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788670020;
	bh=94YUykDJzjneOKnFmtYOq460CkFRZAGPAcv4chtjAxM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bTAtsiWyTrC2SZPueX9YD46SyQOJ8sJ7iwcpHKGVgvCliT07krdfi52iL4ILB2Jsn
	 VN8lUvC9PnsHpkGoYSTzSWvGHHJ+m9304hRNPhaEDzCeT7ROQ/rr5WQp+iKJcTg79B
	 bAZkdRVaFR+BBvF4PP5XUj49dnxJ3MPNJn9T1A4qzJhK5UNZkHyYtzcxKp5uojyHCi
	 e54LvH4Xs8LnXq7oBDvmbOOlpzlVakTowCZfsZ1O+JRQfwmx2m02tunyR20NRhqVzI
	 2zM3KGmMud4TJbOj8NHXo0EfWWDmOh3hSK6EcwFR3pxcQgsRmRLHHpXz8mJEhiV+Di
	 BqustFMEKCImQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B305FC79F9E;
	Sun,  6 Sep 2026 04:47:00 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 06 Sep 2026 08:46:40 +0400
Subject: [PATCH v3 01/10] usb: dwc3: core: Allow glue layer to pass
 reference clock rate
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ipq-flatten-usb-v3-1-13e4e0f63123@outlook.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788670018; l=3846;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=XS2lUluyNIQ284w/BNk2sQpv86j1/GqdSRhm4g7gG/k=;
 b=ln773ZOe+KluNYTyTnUGM8nINo99XePdPYdT2B6W4sXaG5m3uysRn3WLXjPAJj2+E6wocu3gW
 YPANHaybeczDbUGjlKbq+BYYQu/ft2U9vzXc80xPfuRywuau6TuTBoa
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Add ability to pass the reference clock rate from the glue layer to the
DWC3 core driver. The core calculates the reference clock period and
frame length adjustment based on the reference clock rate.

In the flattened snsp-dwc3 model, it is currently not possible to pass a
reference clock that differs from the default since:
commit 613a2e655d4d ("usb: dwc3: core: Expose core driver as library")

The new glue layers (incl. Qualcomm's) set the ignore_clocks_and_resets
flag in dwc3_probe_data to true, which disables the core driver's clock
management, thus it also doesn't acquire the reference clock from the
devicetree needed in dwc3_ref_clk_period.

There's an existing DT property 'snps,ref-clock-period-ns', but that's
been deprecated. In addition, basing the rate from the period is often
not accurate enough to derive the frame length adjustment value.

This prevents moving chipsets such as IPQ5018, IPQ6018, IPQ5332, IPQ5424
and IPQ9574 with a reference clock rate that computes values for the
period and frame length adjustment different from the hardware default
from moving to the flattened model.

So, add ability to set the reference clock rate in dwc3_probe_data, then
have the core obtain the clock rate and use that to calculate the
required period and frame length adjustment.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/usb/dwc3/core.c | 6 ++++++
 drivers/usb/dwc3/core.h | 2 ++
 drivers/usb/dwc3/glue.h | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..6ff0e4822b49 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -420,6 +420,9 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
 	} else if (dwc->ref_clk_per) {
 		period = dwc->ref_clk_per;
 		rate = NSEC_PER_SEC / period;
+	} else if (dwc->ref_clk_rate) {
+		rate = dwc->ref_clk_rate;
+		period = NSEC_PER_SEC / rate;
 	} else {
 		return;
 	}
@@ -2334,6 +2337,9 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 			goto err_put_psy;
 	}
 
+	if (data->ref_clk_rate > 0)
+		dwc->ref_clk_rate = data->ref_clk_rate;
+
 	ret = reset_control_deassert(dwc->reset);
 	if (ret)
 		goto err_put_psy;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 608daeb7ef10..4181d57a6cd3 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1032,6 +1032,7 @@ struct dwc3_glue_ops {
  * @regs_size: address space size
  * @fladj: frame length adjustment
  * @ref_clk_per: reference clock period configuration
+ * @ref_clk_rate: reference clock rate provided by glue layer
  * @irq_gadget: peripheral controller's IRQ number
  * @otg_irq: IRQ number for OTG IRQs
  * @current_otg_role: current role of operation while using the OTG block
@@ -1261,6 +1262,7 @@ struct dwc3 {
 
 	u32			fladj;
 	u32			ref_clk_per;
+	unsigned long		ref_clk_rate;
 	u32			irq_gadget;
 	u32			otg_irq;
 	u32			current_otg_role;
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index d738e1739ae0..ed96b10d8cd8 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -33,6 +33,9 @@ struct dwc3_properties {
  * @skip_core_init_mode: Skip the finial initialization of the target mode, as
  *		it must be managed by the glue
  * @properties: dwc3 software manage properties
+ * @ref_clk_rate: optional reference clock rate for the DWC3 core to compute the
+ *		period and frame length adjustment required if these values
+ *		differ from the hardware default.
  */
 struct dwc3_probe_data {
 	struct dwc3 *dwc;
@@ -40,6 +43,7 @@ struct dwc3_probe_data {
 	bool ignore_clocks_and_resets;
 	bool skip_core_init_mode;
 	struct dwc3_properties properties;
+	unsigned long ref_clk_rate;
 };
 
 /**

-- 
2.53.0


