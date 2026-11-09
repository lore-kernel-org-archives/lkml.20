Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195243;
	b=Zh1MYh5fB/ZGx4b0Ly0LQzGZL/3wb0eEJFPWRl7BMQOGBOeSCDd0OVl8YdScqkXmfyGr
	 8xBQ455jW/GRX5YbxVQf0YzwXgSI3GwByBEBLYasHL2LI/su5jvzJCguA2B/9aya3ULOn
	 rJzZ8t1JwOLFIfvnXtJuwuIpNmRVWvl7sC9+GIAAwscTMoAOBAg04oTfUmaQD5D7mtwV2
	 6wbbAymZw9/2VeVvG/mEDAas8k4THxYzNO3maLwfSASfr/FQwyWvULEhYUhxMAXwggLqn
	 puINX240uth1xiKO+9O4OdiWMtQPQP2nxASCcKwGUwFwd4kn4pNl6zQ3oGBPRPdG9dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195243;
	h=DMARC-Filter:DKIM-Signature:Cc:From:References:X-Lms-Return-Path:
	 Content-Type:Subject:Message-Id:X-Mailer:Date:Mime-Version:
	 Content-Transfer-Encoding:X-Original-From:In-Reply-To:To:Received;
	bh=DSfjtHSZUsSyQaOs06LHZoC4jG8cLJJQqat7HHI0wIg=;
	b=OTT9IlLTWuZFMP0r3gFXUKvp3zN34aYtmRdxEG20XnIDfdsK3uDlfOUnRs3jmHAJPHrU
	 6XlCdT1ykZYLiQzKgOcC/snik2gfygv/uKcykysTEmp7okj5ndovo6CXnvVIN3U264MLK
	 ZkWtKn/0wDq+soPH3/GqteA7YRWCpjsyZhC8TiiTf0EXrgznn4v9yLEHJ7NRAU5iIRCB1
	 GPUn/WMxJ5VSa1Svcd6TrYXnMj4Pnh2vLI6XlYH3WWkf0IAGd9wSj+fZT5T2u70DKHMko
	 HZODraNuYOJRmfMlra2D9kMFM3xOOTtZt4xeWv18Y+iVHeTgbGCV7PkWEXhvBfYrDPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=23VbAndK;
	arc=none smtp.remote-ip=209.127.231.29
Received: from va-2-29.ptr.blmpb.com (va-2-29.ptr.blmpb.com [209.127.231.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF463606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF463606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=23VbAndK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794195237;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=DSfjtHSZUsSyQaOs06LHZoC4jG8cLJJQqat7HHI0wIg=;
 b=23VbAndKn2vzgoyV8Rt3mY6dm38eeUzPdCuGHqwWHrcezmWVtX4TtaAG+0S8ll59IZa0V0
 6wD8KQUI30OFafQNqWDANEt6BX9DTSbQbZ6qresxEpC9H6DOVmjRIELJTaI2y8ajXvcYRO
 2gCA6fyQE7WObssu2ho/KuQvAFuQksEf+2YeresvP//ke/HmDrZsrG7Z6IBg8onOQL8oub
 vDFiLkJH3bxsrZ7M0ihQdcHiiITFsNLCHMIqqD+YKiZhxVAKgToszzI8WQKgUOoK5AgBKL
 YNqR891AkbClFc0Z6oWutu7TeoX1rQc0NUhihwMw3SjDhGNdpM68jAlDRYFJKQ==
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26af13f23+84d9be+vger.kernel.org+sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
Message-Id: <20261109033348.361452-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Date: Mon,  9 Nov 2026 11:33:48 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
In-Reply-To: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 09 Nov 2026 11:33:54 +0800

Add the device tree node SDHCI-0 controller for onboard Micro SD card slot.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index bcd533484a73..051046fe90b2 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -177,6 +177,28 @@ &combophy {
 	status = "okay";
 };
 
+/*
+ * Onboard SD card slot:
+ * Please insert or remove the SD card while the device is powered off.
+ * It works as a boot media. so set it to non-removable.
+ */
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
