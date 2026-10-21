Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.203.31.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590377;
	b=vcNb8+G7mveHp0mwL1tdwU7t2adxJ7zNoLv8jmXxDmlym1u+wrd6/yE7k8D9MA6unzcW
	 yetn8jOjtnDucmyKhPFIKiYbnaQWEUfQue0Us+0msuP0BbP+POCvDYpOKOvHCzirwNe/H
	 3kjGVlELZPrIACdXlTlNjQRifJSw9XaDFfGR4pD0bttRu3c4vf9RpJ4QYtOghgWOzNcfy
	 FzbLMcLcY52ZiF5W/TKvT2kWyE4uLKSQupNxIpjcGZHZHkQhbCKRsa0AuM9WqasDPSlLW
	 G2/InW6D4eikiKMSa5aWOJg6pI1RBIcM4XLk0dFAsKrtJPB+YUXGFQ9RJd+6OV8gk0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590377;
	h=DMARC-Filter:DKIM-Signature:From:To:CC:Subject:Date:Message-ID:
	 X-klartext:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=TYPJKV6ncVk8Zsl1Bqc1Zv80DmTa8a6mXCW+pbyQVRY=;
	b=QxoE2qqA93v4aM5NLDVstjYPoC2/VNmy67m8grM3Et6HiQ1ElE8hve7C1IGi54t7gWJo
	 S7NKTXqjuaOyg0dIlKHgHerE6NPpG1deYJgFr9ILXoVrg6jVGsJVNpyDovhXHdtiNCF0+
	 hVsusOZ1oeDdg6CW5LLcfm5C7kn9GPs+vRIrrzawMTsbG4VgwKj9l7W8vr3y6fOy0igpY
	 gBfzzlkVUU1YQyVHTiv5h7b+QpfKqIE/J27gexK0JdkPqCfPi15ifgJM/reNU+K8khEVU
	 4O6G7z7VBHrKDIbUQ2Xf3COV31ggsCaihjlY3DN70hPUz2DCi3wqEZnqk+G0+kK99ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dh-electronics.com;
	spf=pass smtp.mailfrom=dh-electronics.com;
	dkim=pass header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=IqhKyvlK;
	arc=none smtp.remote-ip=116.203.31.6
Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54106606A319;
	Wed, 21 Oct 2026 13:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54106606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=IqhKyvlK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1792590302;
	bh=TYPJKV6ncVk8Zsl1Bqc1Zv80DmTa8a6mXCW+pbyQVRY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=IqhKyvlKq3QxvQovUy793NIdVfJJw/FZqBdC1L2o/tf+t0nJTfwlx2kzgcXWoMXR4
	 t4PjOC88ZGEmtPFGqCwXeKXfBOhjp3EU3MAtYvaf/txY1Ax4EbdyehJWKQkjOr0DsM
	 +IJl3jRWJsTgzeEUPQIpShY70bPdGD3LvzyuEPOymd/4gkF9Lb+bIaTpwlmUOpIFlu
	 bNq+PwFNBA2zcGPH2j2kdybrcveL75nH3xwH3+PuO+a+BsD3Gz94gIEVV3UF7N7oHK
	 d7cBgpkZu56+Od1OHQuAlC7+Eqsnv8janyz/PlM1edhgmpRqk/BP2fom1drklyVQlZ
	 DPM0H6IwR2cCg==
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<kernel@dh-electronics.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ARM: dts: imx6ull-dhcor-maveo-box: Correct PCB number
Date: Wed, 21 Oct 2026 15:44:35 +0200
Message-ID: <20261021134435.17350-2-cniedermaier@dh-electronics.com>
X-klartext: yes
In-Reply-To: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
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
Content-Type: text/plain

The PCB number of the maveo box isn't 525. Change the
number to the correct number, 625.

Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
---
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Marek Vasut <marex@nabladev.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
index eb0b91040110..bb82d97f9d84 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
@@ -6,7 +6,7 @@
  * DHCOM iMX6ULL variant:
  * DHCR-iMX6ULL-C080-R051-SPI-WBT-I-01LG
  * DHCOR PCB number: 578-200 or newer
- * maveo box PCB number: 525-200 or newer
+ * maveo box PCB number: 625-200 or newer
  */
 
 /dts-v1/;
-- 
2.30.2

