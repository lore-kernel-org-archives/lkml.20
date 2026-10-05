Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C05E4D09EB;
	Mon,  5 Oct 2026 17:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221680; cv=none; b=fInZX28unnGFgpjnMulKv2cf/jiF+RPeTPHCcN+nJE4soWiprFUX3SaZSbayXtVfDR80oevlT6+PrIXLUvUR8xwY0obKE5g/vC5FXaEC2SNvQjXChe/vHddcEcfqloIaCSqN7Yet4yr5ypIB5sPMU+17ubKHtIywZhgxo5DwpR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221680; c=relaxed/simple;
	bh=1/QNs/RXd3I+xhGhK087MWiQ67GOsTw/k2ZWqVa4kDU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=iNrIWsTorwmfZqA0oGTXEeB66FellY3Fyy2MwHFEyPlgB7SHN6mIChU1B+ZpVjVwUavOVaYhGSUZHNiRKzbWAGjkU/s59LoAIKEMVphWpS89GTpWlmUA4YP19MpZ+AnZ9VqexepY5w4gonp/KpuB7gj1u+B+wPcpvXkLfFvYJx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=bXqYQ4az; arc=none smtp.client-ip=43.163.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="bXqYQ4az"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791221668; bh=Wur1NLL6aiOKmJUmUiVG+uZqeCciMOf0+vtQvT0dX/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bXqYQ4az78isMeuuje31mqDDx/uRhPVqFxFvWjAHSq2pILF8sNxwDw/Lem5Gfb886
	 EGjjoTdglHvdBGFHU+eAL52uzs4DkR4klVaBnSYttMuuLC8Va74/pixYsN5IR1JEsr
	 NtnhloYOlyfS/qUO61M2ual9/Nxq/XRAC9/qZbgw=
Received: from AERO17.taila7786d.ts.net ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 8493A252; Tue, 06 Oct 2026 01:33:09 +0800
X-QQ-mid: xmsmtpt1791221592tgriulzwz
Message-ID: <tencent_7F0804BD55E49660DCDB095C80B5330DC50A@qq.com>
X-QQ-XMAILINFO: NPa98HB0c72N6mKWPBkJHsTZnIIWm+8XJ+0yQej+3GaFYVus4aT97VRnhNSFs5
	 63ScrPHGQ38HJDljaN7iDYUC90pYwel35V+YfbwSYbmYixYbH4ld46m062aG/CrLY9npbw25RMzc
	 1ov82jxNCod7EKBIGvjh8JqysfDRWjKEUo9mWyMRMtJ+qq3OrkzQS8CHvY2dZwQHcf+21WmIiGKO
	 MjKPmrqkOuEuHZScGAWhW3F6Z2o24k17tgMD3ujj59RYv3F3612gtK4+HW6/bHcYcTcPu6BUOVGI
	 1nyVmM73fgw9+1BXEreVvJY2cXpSks+lYFLc742hu/K89CLHw9kUHPAjrXIrvfnKq/oDT+Kjm35j
	 Cg3VarSCdODgmAJksx2jctizuFfPw5p1Im3MTnYxt+f4QlAmqpPzk5RAX3C5LlQ6bsgoOvWzqIcs
	 WWA7eN8em8/RvOgjTuLYgsjtAA9b34TULk+BMdi5HJKocHGZ0JdNh4nZenV+KNF4rH4mvAXGCSrW
	 +pTABPi5zuxqJWHvWLE9br7VEHLD8oUJ5pm7IxB7DrOyUu+Xjf9iWr3ybV5XnHJqDsAPddp24MU8
	 hzcd+7CGey9I1fyXVJfeWEe7HTRPKRmiGIICRGs10rBDbgSJr/tvamlkiUM4cY5slyasryBFuBlP
	 tgeNJH6QEhP5iC0LmhWSVpIU/TnwF49+Bv2rQPe1/dD53JGjzW5sC5FJeyUtneewivyWvRhmpPpC
	 Q4VUZaUhrp3r4a6OWZIyPRFWLWfSWORzkfPEnZAuThK9At0gnvMKZbPuNZBiWd8SbvP2vO7jG70E
	 gqPAS8nnuJ3PThoDh9zic6dwpBbz8X5q7sSsKhfcLEREo2RGrnWh2nh9uzQdjvS50NK3nwwdrk9a
	 0QZ4/8uZ32WfuHGLKmSTbwvuYhvOU+E94WRqvKcceVlWcyb73WAC8Am1VYPksKTuo+ritiMVvRv0
	 6FEPEMpvKV9tTz3Snz+KCg2iPf0maYAknc2uK0QRkKl+oTkhaZIcRXIi1BBRcRQoB+c0AWd9yhPP
	 rc0ETX2TZLWFESSAEFxvaGd19q7GUiyAIxF7ZRcxt06FXpPL1gpJ/JbS2tYJ7zU72I2LFqJa5/oY
	 0nXtsdNOK42z+FoF9ak4tyKwF4PnBG8owbMF4GV5BXt81as9DKyf8aAF/KXbkKSCfuvEQ3
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andrew@lunn.ch
Subject: [PATCH v2 2/3] dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
Date: Tue,  6 Oct 2026 01:33:07 +0800
X-OQ-MSGID: <20261005173308.710986-3-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005173308.710986-1-2254650260@qq.com>
References: <20261005173308.710986-1-2254650260@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the ALINX EdgeBoard FZ3A compatible.

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df..ad7c71f9b 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -46,6 +46,7 @@ properties:
 
       - items:
           - enum:
+              - alinx,edgeboard-fz3a
               - xlnx,zynqmp-zc1751
           - const: xlnx,zynqmp
 
-- 
2.55.0

