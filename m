Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567101;
	b=hJu3hmmOVzmdBMvmRGbbfseqaG5IVMcVfWNP2TpQ3LxD+cUnbBtOxnHbz7cQD4o+G1qD
	 OCYf6zfyHvxewLTkRQVsnqT92haPVmGvu9L59wvdNYk3hn+Fc01U4bNvV1b3wZTk3V8ZG
	 EW76yiLLxMWm/n79GPbFbGIDKPOAeR4RX7dn7X6+vK1cFuQo2+vckP5w83OvKGOTjlO8e
	 bnCcQCgmW5DBfhSQTkmOD7xpqqAsgiWnnCwr3nez8Dl77fsind5v7aCgmWnYlKeU/8HZE
	 rO7E/KjgRyNeNqLoRQh4G7c0q9H+feo6xQIJUi7FwtA105CiaSDM+1+kA97/gZCX7Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567101;
	h=DMARC-Filter:DKIM-Signature:X-Original-From:Mime-Version:X-Mailer:
	 Content-Type:Content-Transfer-Encoding:References:To:Subject:Date:
	 Message-Id:In-Reply-To:Received:Cc:From:X-Lms-Return-Path;
	bh=Q08JydL98fy47nVJqLqGFTrZaaBqSEW743Jy2fzuf48=;
	b=oyY+hdQHiSvPhTpKFU+hBc/Z4+H33oAjlezWBRPeCQ/aW/ezJQwsp1Q6DligSqM0XFwt
	 7AAJJf2hDAx0zyiIW3nEaf1LmrmZLpxU/RgILozb4ZIg35zw1n8Kiv6A4SoBpM3oUaJlT
	 V9+nsXEypnMAXxLHb40yel/871bInoVH+HMnb1TMttLxUE+foJy+i/yUkGaClK+9xEIr6
	 zE4w3E0yA8iMz0rVde0y24O5Il29zpcJOrXw0Dv6KxP8w8yUYCR7TImYb9shqmL554qe/
	 mqui2InfuaeO3r1bsqUAAKZ5zEzeZbvCbbxelUnJnd9FriU+dv/3dZWRJxTzPKJiwSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=NBvXPIJe;
	arc=none smtp.remote-ip=209.127.231.16
Received: from va-2-16.ptr.blmpb.com (va-2-16.ptr.blmpb.com [209.127.231.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA67606B25F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA67606B25F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=NBvXPIJe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794567096;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Q08JydL98fy47nVJqLqGFTrZaaBqSEW743Jy2fzuf48=;
 b=NBvXPIJeAwsGVemlL+AyS/y5rVYY/U/aRagK6dtGNGt02kxhPff+0Lpp79J/g1Z/zB9HYn
 oVHYzkSNTnOHX6iYyx/lE9kmJOELjxh8SGTkTmZXICpaQ+weqPgNypaXFS3lxwbfYY1cq8
 2Yvcld6xaeeGDKubOif1zGpiLCXEan0xgIKTwSfbNOeIMWFGloV32Ahz4qe+AlsVRdzCA1
 v+hjZG9oyaI6XfLdd1whVW0DT16TuSelWz2yq/nEyMJPOzgYLNVNiisBaveqdvMkccKii9
 /AOtpTrzOlQr4E9guMiQbfnXTTAWWdKZEZgP10EJBx7pW+s/Ub6HDg36lg8xmA==
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: b4 0.17-dev-ce4c1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH v2 7/8] MIPS: Loongson64: dts: ls7a-pch: Add watchdog node
Date: Fri, 13 Nov 2026 18:51:14 +0800
Message-Id: <20261113-mips-ls7a-wdt-v2-7-e8abd6b2f77c@oss.cipunited.com>
In-Reply-To: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Fri, 13 Nov 2026 18:51:33 +0800
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
X-Lms-Return-Path: <lba+26af6ebb6+66998e+vger.kernel.org+rongrong@oss.cipunited.com>

The Loongson-7A has a watchdog compatible with the one on Loongson
2K0300.

Add a watchdog node with appropriate compatible strings to wire it up.

Tested on Loongson-LS3A4000-7A1000-NUC-SE and Lenovo KaiTian M530Z.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 7ba7bbb9c013..498abf1f9a85 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -75,6 +75,12 @@ ls7a_uart3: serial@10080300 {
 			no-loopback-test;
 		};
 
+		watchdog: watchdog@100d0030 {
+			compatible = "loongson,ls7a-wdt", "loongson,ls2k0300-wdt";
+			reg = <0x0 0x100d0030 0x0 0xc>;
+			clocks = <&pch_misc_clk>;
+		};
+
 		rtc0: rtc@100d0100 {
 			compatible = "loongson,ls7a-rtc";
 			reg = <0x0 0x100d0100 0x0 0x78>;

-- 
2.55.0
