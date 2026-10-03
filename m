Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40E7396D03;
	Sat,  3 Oct 2026 19:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791056813; cv=none; b=fPZds+t0H+1PWD8gD+dwv6iqMqogaMuaSo+Woi+2rrOSamUeyPhqXrVCJFj8sQ7PvLQtjRw5DjZEEJDN2sw0jw/v/4x8arLb1KOUp4Zz60BFZAiQTfX4H3ZpwntdDAS0aUDkW1bZQJ72tIXlInc3ijDUZSnf1EmRLph3sFb/d9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791056813; c=relaxed/simple;
	bh=ue588Q7AJV47UtM9kt/kmmnS5u7Bhca+s57rjNQJF0M=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ryyWfCezDe/LlTlvEUjRjLFFrsHfjhxCQICy94f+A+CgViIqhPqm7Lk7DVaz1fE18bwQBYaIWeouwvzEZfiNdrdzdpazr1PSfvFS6gRYUcVBrCevpPzTXH7FCEYOeTTFk+ghKgJGgqud8pEweUe84hMM3A7DdqMpxWg8qDRGXL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ZlwXJR5l; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ZlwXJR5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791056795; bh=ZxRTK280eRaJSscUvQGV3b3Nu054guVEz+hXl2jXrLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZlwXJR5lSuWLhR9rn8DnUDDk+O4P7gqtnwMVCx6yVMFUOSqxxUzSWzTlG+h//PXbl
	 QAJJZX9M/DvxnfgiFcsQO6VcLtaDiAd6TMeWBXDW3gPMMPCMtZsqFIn7SYzXF10VP0
	 EwowSMItzkPxx6UM+Ke0f3oH37NViX875EJLIiW8=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id B9D93CB0; Sun, 04 Oct 2026 03:46:29 +0800
X-QQ-mid: xmsmtpt1791056791t1v47z577
Message-ID: <tencent_E21E2A584AF8EE0505C2C0809838621C8209@qq.com>
X-QQ-XMAILINFO: MMh0UbolYUoWrwNkUdw303N3AeqAfUAua9/UDfJxCA7lu/Rza2p9g002F8QBul
	 RXGmBJ1YAKYX3+/6K+lWMhpjoinANsNSnUYYmJlXzRHPzl9wpzlaGKXCulMhQC4DMUrmegmjmqTv
	 C2JCbi4MG3fEqQoRAB7lnD2w4cn0womBiFlaA0/aknzpLp2aoWb40Le1nhPhUcm2XBCDVCSqNr+D
	 Odq7B5V/XmrBRx3wtnhBOR+W46OMsKdOFOemXEXJ65Tg3r8V7XM1mWCTIFTwyLiVSfaXugoeSczP
	 G4PTZC/SRq6nzROY4YF+mppkP+p3x4tF801CDDPRt1UixNfkWqai8opNYUfH+sA1EH0IQjvT4ysh
	 DjNhEQ5QfUNKp+smTv+A4wgOWzT8DG7wEO7bOSZ5ORc5tU02e3xUCMo7dTc22WF4awe9HasK8jM6
	 tP3xh1aaL+3o2c3+kR2ERzStzhGHM2n2VHN91/QXZHFOQyyZ5x1p76VvEbPT/21MGwv/kyNAfBq6
	 J5lMi9PjBfFf3XOmU4YT4WxgIEUAab8yi8JofWlaX8NMj+Zgu0hSSfhfLVz+ExNUbvyJADxlTMQQ
	 UtmEvqj6oRxSP8tt0wKJLGClvHUv/AUFqVEBDCkJB4gDXSB1xsdOfC2raN7+E3X2X6uRB3VfK+LZ
	 C5pJOZJZMHfb2ALkToUZHEJeGKTQdWHtfGPljdkD+yjVTj6ibC3d2qZQiCCISRi/2kUIhVCPXmP0
	 nCTD7jB+TjPFJrtuAbh1q/vqX4zDftvHk5EHys2oDKBGvNz/9ZDbIiH4A0I2dFpvSK6Gz/a0nGte
	 2l/3WcOcrk2iPkORVFrp6GgkfzkABARTCc3OKEl5dQnJio8dtsn77LJalFVayWZLHWAjPVz39v/f
	 vDIAgj3LHrMCd/dvKB1LYHPQwbPmQA518aJ2WRlP1gyfwVHqLuJLVGYObfQkrRIX2zbbj1tyoy2x
	 mzU6B26/Wueg2PhGCMFj/XhuGD3z5431BqmFeK/jFj66qY0aq5KeQtLWLQwwPKJrOx9Vpq7ttrsP
	 A5+6ko4jhDew0vYBC6v8s7jeqrva/JmomEPiaT9A==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: Add EBDEE vendor prefix
Date: Sun,  4 Oct 2026 03:46:23 +0800
X-OQ-MSGID: <20261003194625.936288-2-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003194625.936288-1-2254650260@qq.com>
References: <20261003194625.936288-1-2254650260@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shanghai Xin'yI Electronics Technology Co., Ltd. (EBDEE) manufactures
the EdgeBoard series of embedded compute cards, including Zynq
UltraScale+ based designs.

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..9c7375d4f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -483,6 +483,8 @@ patternProperties:
     description: Zhejiang Ebang Communication Co., Ltd
   "^ebbg,.*":
     description: EBBG
+  "^ebdee,.*":
+    description: Shanghai Xin'yi Electronics Technology Co., Ltd. (EBDEE)
   "^ebs-systart,.*":
     description: EBS-SYSTART GmbH
   "^ebv,.*":
-- 
2.55.0

