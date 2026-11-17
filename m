Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894398;
	b=Zx305HGLuPLPOPBecf6OObrBp75YX5eDfMKuy+goHiufPkluYWMPvFgIlBrB4CKEliAs
	 g/65OkOoJDqss1ixcNJyc9WXuCQV8US+Ft9MfxiWEO4R5ZOlBgI3pTI/1KsVACNacMGaa
	 yfO11SJ9g3c4uGF54mRwod8ws1cPXGr+mqA2mCFBnLxzQBIOUPbNu6QjExTAWvwovkosU
	 MUg7PoFPryqxmmZM/64SeYbvoc4FHDofzB9oI81klFyuhslWUSnEbl+lcbQv0WdD1U/iU
	 JffdCczNYTfogP47amzZCecuBQ8SjvxmBzygJwo1tQrRNoquZH0hkBWthkZNw8zxFwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894398;
	h=DMARC-Filter:DKIM-Signature:Received:Cc:Message-Id:Date:
	 X-Original-From:To:From:Content-Transfer-Encoding:Subject:
	 Mime-Version:In-Reply-To:X-Mailer:Content-Type:References:
	 X-Lms-Return-Path;
	bh=SelY6loGjDsjq7wsSeapANHBoNBqYepjvmOSjN5Go4A=;
	b=OP5CSCA8jj4QvVcGwyRCKAGNgNEC3kJ/5NgHkIvu9s8Nkcu4nq11dBJ+zsAE5FZMy++N
	 k/oC16RcGHcgnnwchhB49im6ylM7pSPBA+pt/zuaHX2bxx164Uy0DeWuFzp9B/JlGHUJY
	 Ml3g851FHYgA1ouKZrpkOWfMPkv7uegGqFBQ9e1O4LD7PiSfsrd09+erqQgG1FhqZk2Gt
	 ujIKIH4SRzCdMaiocTveawNPJZSF41jcMwBQGkDu33n7eCBx0wOkCPK+XImNj2ygb66Dg
	 OPNSW6AvMUYxjqaqeKJNiUF/PiKAmf/kLLlOHMM3KRVCc2t+F9LfWB6okS1DMKxxJfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=uDg9Lnpi;
	arc=none smtp.remote-ip=209.127.231.36
Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85D9606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E85D9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=uDg9Lnpi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794894393;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=SelY6loGjDsjq7wsSeapANHBoNBqYepjvmOSjN5Go4A=;
 b=uDg9LnpiFwfrOwLppREomLJu++FN/ku190g3AyQgBNk8kBzqWlCcpa5LXAtGFOYwXVUhps
 oOfsch14OD8H1juRAOTpM6d4s9v2P6GO05odec65y3ggjhE9KxYGUlIA3T0A/TfA2S0xTv
 M/1sfsQUz1M1M64KbSGnwP6og/HVo+8Rrj6pGVbEA2fhbdf6Q6QYY28gT5FjqOfcsx2if/
 qxXYKGxUjiyR6fhUw4IZ5Cp5SNLMADPn7r1CTskANvt82lxSLqczdXuF3U35C3eqeCMj60
 PhuSaBd8AbVVIqp3NsQmL7JcpGhcIc0eme7TH6ROtT9WSZFG+gKJoleXgUltGQ==
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Tue, 17 Nov 2026 13:46:30 +0800
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20261117054615.1048836-1-sandie.cao@deepcomputing.io>
Date: Tue, 17 Nov 2026 13:46:15 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Subject: [PATCH v5 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
References: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26afbea37+b34657+vger.kernel.org+sandie.cao@deepcomputing.io>

Add the device tree node SDHCI-0 controller for onboard Micro SD card slot.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../dts/spacemit/k3-deepcomputing-fml13v05.dts  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index bcd533484a73..a80d32fe6f7f 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -177,6 +177,23 @@ &combophy {
 	status = "okay";
 };
 
+&sdhci0 {
+	pinctrl-names = "default","uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	broken-cd;
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
