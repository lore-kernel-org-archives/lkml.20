Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484447;
	b=VMWTNcyuwvLRVrPYUzeA9MFIRy2Nj9+YGSikHTWe+F25BGktQ72Ta5c4h87fyjf4WZ2D
	 QEZkm7hdjlEwCFFXDwU6QxQ5fztdocpnTa4UqpHKC+omkcNSjn5t99T1G2+JVKI6qyzCp
	 DcxCCNPNNRXwJnoL2JPuHFzXKGIWP5LzT5YpnSFeIChaQFdL2oh41X6Kw/cXb81v0vxlQ
	 ylwt5KadRX07SMU0+1cLrCY8W5KeFFow02pnLpTtjTnmXv9DsZmkI+jygFmgT+3LOcVE1
	 SQwhVfdU3ErmZJm8U42zdSlinJXjFzp1eHGV/mIMZQ0YAABASWmbst7XvrqeyJC5eSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484447;
	h=DMARC-Filter:DKIM-Signature:Content-Type:Date:X-Mailer:In-Reply-To:
	 Message-Id:Content-Transfer-Encoding:X-Lms-Return-Path:Subject:
	 X-Original-From:References:Mime-Version:Received:To:Cc:From;
	bh=Br+RwhEUUjij+LQeVh8KN+b6c87vkCnWluLTXLQF6m4=;
	b=C5avexenoLrvV2BnXQP5mNXbwCISRciMrZ9eHAREz3M/a6Hs1ksDIznJVu+8KNwK5nfD
	 QBXYelZN9vLzLSXHmHqXwz+L9DosClF6Gi/Rh+ss9QPUVXCOXOCI4pWCXXqGp05h4S7TE
	 UF7nYCXHU3IM0IgYdDdG8bY3NrSsbZNEuPpp54LHOuEB7pBJ7PQPaoeIu2ee5SKQwL9TS
	 LErEOFD2+Fca7+LEAL1cTCl7xRsCT72yZ/ejairS7G3Xc3xZc1uozaEYhVG7eyn+D23WU
	 QRHyyYXAIydwaxP/aMDk8zVANtUM2U/fe0rbKlWNhgtCnF13Oi0+h64wjNfOGwz/zLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=w4Y4kjo9;
	arc=none smtp.remote-ip=209.127.231.30
Received: from va-2-30.ptr.blmpb.com (va-2-30.ptr.blmpb.com [209.127.231.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C3F606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9C3F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=w4Y4kjo9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1792484437;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Br+RwhEUUjij+LQeVh8KN+b6c87vkCnWluLTXLQF6m4=;
 b=w4Y4kjo9R9evDZzjuKM13vSvVSPv6tNy9R9p82g0GvtZITTnyNtLyR9USU6vCJp+Dq/RmX
 A8MNAe8NFAbAUqE8bYcQ+HXm0rNCCPMYWihtCjzW+lIS92WgbpeCsHpFlC0RrweoUhgceW
 VGe4OnVOzGhBygTw2gQhWsDyk61mzB/MjA1nIBX1S/Gs9L4ycMLqOp8+BWjd1qN4285HB3
 VTMtMxBAgGRS6G1usmDtg9LOl++MI8yk4zePj9xr/ReRLHCpwZcPj0jBqju3nmRaymb80q
 ZB9dBbRZnd77CahnZYwPLrCjbjfw0nbUeD7mcJQaXNGsh9EdajlQbbVvGdDzEQ==
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 16:20:15 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
Message-Id: <20261020082015.3673761-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26ad72453+1586e8+vger.kernel.org+sandie.cao@deepcomputing.io>
Subject: [PATCH v2 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
References: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([14.155.180.235]) by smtp.feishu.cn with ESMTPS; Tue, 20 Oct 2026 16:20:34 +0800
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>

Add the device tree node SDHCI-0 controller for Micro SD card slot.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../dts/spacemit/k3-deepcomputing-fml13v05.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 84f66dd8f962..09e3d46a2ea3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -2,6 +2,7 @@
 /*
  * Copyright (C) 2026 DeepComputing (HK) Limited
  */
+#include <dt-bindings/gpio/gpio.h>
 
 #include "k3.dtsi"
 #include "k3-pinctrl.dtsi"
@@ -184,6 +185,23 @@ &combophy {
 	status = "okay";
 };
 
+&sdhci0 {
+	pinctrl-names = "default","uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	non-removable;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
-- 
2.43.0
