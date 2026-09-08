Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465C83A75BB;
	Tue,  8 Sep 2026 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854072; cv=none; b=YULAFFPtM8ZrZkdXfjBJ6Dlzd3Dk8PIZwer+K8b0wVOpJEhJ79imEkpzHg6LjQHOPWzG1agzVBLK3JUtupU0XLLl4F6QvZyLSoh1un/Tu5z34N3YuQny9Zp7hZUqim1aRaZ4eSxmSAMpgyMiNUE97fsPhG0FuPgA4vJkexh5a9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854072; c=relaxed/simple;
	bh=E9yMmleXOTM9DrTMSOmecTwJucO7kDBC3W1TZzoR0hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NfOVoWYkRzqP88BR912023uCGGuiy3w1N+MumczyneurtV8gN7bWa+LIgMt9uFgDzAlBBeKtyzCZmlbLzpGTfm/P/bpYLQkRE55x21qmyy2u0RKfXmzXLPicawAwAERBvN89tkpfC3a+vCJ71llTs/H7ONyRa0t36wBolPxw7IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atj82x0J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atj82x0J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4371F00A3A;
	Tue,  8 Sep 2026 07:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788854070;
	bh=aHh8YnkpdvGLGzXjrKPt+ZqsL8ZCEOOEbyoUUXuCA0o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=atj82x0J6FZcnPOO9V2QBFrZVMLnXV6+L7gRTrxJCDFWwGLuKskR9FYkcO99T2tY6
	 Av39A1LR01EvQY6lk96zHGh+3Awo+RF4RqzElWvJVzqL8s/rBmSOwWBQWj24LpJNjg
	 9x34/qhMzybjs8ltW2tOYha6//AYSZz8ng8zklI+29JfT26RaiBgl/QfORB5CrDEbL
	 GgCxniKm4TEH3nwgNsDYY6nbHGbHFcyqCUWEYk3shIfdHDUUE1xtnq9y/qJq96zpIJ
	 lMR6+G4+uUO29CZ2XnPI5GkxIq/sdttn+p98b0t6DPRSLUUqPnM1vyYqZie9kgFRtX
	 R0nWdh2xvy21A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 08 Sep 2026 09:54:06 +0200
Subject: [PATCH v5 2/5] phy: core: Define TBT phy_mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-topic-usb4phy-v5-2-73aac69578ef@oss.qualcomm.com>
References: <20260908-topic-usb4phy-v5-0-73aac69578ef@oss.qualcomm.com>
In-Reply-To: <20260908-topic-usb4phy-v5-0-73aac69578ef@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788854054; l=1957;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=DA0DJZNhVBAei58r6kWRym01jHw8XXps7yp+Nt6anW4=;
 b=pqWCXETOl9wgh85URVM7rBQfJCqCz7QdX+LklhlehiaqCPqzN6B36KQi9M8BnAZiMwmqNKez7
 ZeZ9szP9WUYAEjhCVP1fxLL/zzhdeuhvnNtkVENBVcvlTncN0Cb6zxH
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

There exist OS-accessible USB4 and Thunderbolt PHYs that need specific
configuration. Define a new phy_mode for them.

Currently, USB4 and TBT3 are defined as submodes, because they're quite
distinct, most visibly in the electrical/analog aspects (slightly
different frequencies, timings, etc.). This results in a need to make
the PHY aware of the actual mode needed (at least in the Qualcomm
implementation, but I believe that'll be a general need).

Newer versions of TBT are basically supersets of USB4 with higher
host-side requirements, so these are not defined. This can always be
changed as necessary.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 include/linux/phy/phy-thunderbolt.h | 14 ++++++++++++++
 include/linux/phy/phy.h             |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/phy/phy-thunderbolt.h b/include/linux/phy/phy-thunderbolt.h
new file mode 100644
index 000000000000..5f48059814e1
--- /dev/null
+++ b/include/linux/phy/phy-thunderbolt.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __PHY_TBT_H_
+#define __PHY_TBT_H_
+
+enum tbt_phy_submode {
+	PHY_SUBMODE_TBT3,
+	PHY_SUBMODE_USB4,
+};
+
+#endif
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288a..3a2ace2cadff 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -20,6 +20,7 @@
 #include <linux/phy/phy-hdmi.h>
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
+#include <linux/phy/phy-thunderbolt.h>
 
 struct phy;
 
@@ -45,6 +46,7 @@ enum phy_mode {
 	PHY_MODE_LVDS,
 	PHY_MODE_DP,
 	PHY_MODE_HDMI,
+	PHY_MODE_TBT,
 };
 
 enum phy_media {

-- 
2.55.0

