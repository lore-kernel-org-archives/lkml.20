Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD0E3115AE;
	Sun,  6 Sep 2026 03:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666766; cv=none; b=kguPIeQH9BL5yo6IjxMwMsJ64oxy4syHizUfRJZxFPiG56nbdMJD2S5IpXJACAWy7CR6X65hLQPTQeh4iUuKu0gr6BE8IjPh+N5UbwCqVDH/yFr/L/D03oiT8ifExV2LR0FdrkA9TjjkhioLrqf5hxLHrWg/LwBG8+8fWpge4K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666766; c=relaxed/simple;
	bh=yjN8BnmDkR0uFIUwMGdTsKJWkiAR16qGHk8nilYb2Vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FYKV1xbW+vxaXOuNLlRJulDDQW+AHHAvtmeje+TMoX+pCyVCZV9Jz0ZHmB/zmGSaGgx+qh1eWMtPQZnBiODx61b39r4D8cyczdMP/yUBiq8TeuOEnNKZRh4jn5lBDbWWWEhglE6VwOLQcURjxaNERWIRJYV6V6nDvt71jLwbnXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmpCUVEU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmpCUVEU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E226C2BCFA;
	Sun,  6 Sep 2026 03:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788666766;
	bh=yjN8BnmDkR0uFIUwMGdTsKJWkiAR16qGHk8nilYb2Vs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QmpCUVEUuN+4gvmCI0XT+EOHgosC4G04uzGV6wAJRTAMTKKWSNFUG+4N/XvrWmSuh
	 x2dWToNOcK9IJLyEWD+rfQOqR5yVth897jXLO/IGUvbOqEFRJ9IN6zAu+ENjp2GSic
	 MzYBGjX+9BXVfkHNl//g5LfY+y/oqM910AAgFIeyUfVKTCdMdfONRljfivo80h7PNk
	 HnXMx4RDi74Ge2v5Cv1ZyIQcUqzoY0frUsNqBvYlVQMgBsShKvmTii0f8hJwc5TnNa
	 xpannECh+iyPAThNBAfYp/hSz9ZMQ5n+vuh/ATkYUaMBtHfhQuAMgHkdGwoTY2m9So
	 5/gG4y8gmbPSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449AEC79F8B;
	Sun,  6 Sep 2026 03:52:46 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 06 Sep 2026 07:52:41 +0400
Subject: [PATCH v2 02/10] usb: dwc3: qcom: Add support for selecting UTMI
 as reference clock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ipq-flatten-usb-v2-2-dab83120b10a@outlook.com>
References: <20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com>
In-Reply-To: <20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788666763; l=1905;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=yWBu+uKd1BoOvs9eAQw2PN8F6cbr1YXtNLEtHmwjaTU=;
 b=1NrJhBoq+aXj8XpxYjzA+nI3lLv4PJJSB494ZT4/NTXskR1RkyxHGTaVIMiFw4cINZG1AFm5t
 SxM78vb+Zh8DKNOCMCUJkq2RMVT7ubB8dORRy8lsUdHQclXv7E5Fq1o
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

On many Qualcomm chipsets, the UTMI clock is used as the reference clock
(ex. IPQ5018, IPQ6018, and IPQ9574 and more). Since moving to the new
flattened snps-dwc3 model, it is no longer possible to pass the
reference clock to the dwc3 core driver.

The clock rate is used by the dwc3 core to compute the reference clock
period and frame length adjustment. This is needed when the reference
clock rate used computes values that deviate from the hardware defaults.
Above mentioned SoCs require values different from the defaults and, as
such, the core initializes with the wrong values which leads to
non-functional USB operation.

In Qualcomm chipsets, if available, the UTMI clock is used as the
reference clock. Therefore, acquire the reference clock by name
('mock_utmi') and pass its clock rate to the core using the probe_data
structure.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..f4c3b370a75f 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -617,6 +617,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	int			ret;
 	bool			ignore_pipe_clk;
 	bool			wakeup_source;
+	struct clk		*ref_clk;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
 	if (!qcom)
@@ -698,6 +699,14 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 			qcom->current_role = USB_ROLE_DEVICE;
 	}
 
+	ref_clk = devm_clk_get_optional(dev, "mock_utmi");
+	if (IS_ERR(ref_clk)) {
+		ret = dev_err_probe(dev, PTR_ERR(ref_clk), "failed to get ref clock\n");
+		goto clk_disable;
+	}
+
+	probe_data.ref_clk_rate = clk_get_rate(ref_clk);
+
 	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
 
 	qcom->dwc.dev = dev;

-- 
2.53.0


