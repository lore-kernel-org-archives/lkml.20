Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174627;
	b=vnU652MYGX8H5C2+/8nFdcWYEzQ9TFqCGJbCR40KH9L3IRW9p68iHr10fapBrvlL47ML
	 +OCEz5EYQqFStH2LLDsIZk4dsUIlJTEw3YwPYKuu4Ty2q/JRcq/z8VuSYlYFQfUemBu5g
	 KDiy6jc4sTtFerp0lqQAxPByG0OCwOS1q7tlXyV1PTE4DGfEki+qhkIcDQsYCf+yj3eaW
	 l30vvu1igwtcSPNIfT1ugBrJr8qrhU2hLwy8GCR1jiUxOtqiiZcFUS0t2K1/GKYc3odwg
	 iJYoyu6FNOdBmHvR8Bw6/11tBcffqc0ZcGSL4X9PRgyaMjt4VxIB3nJMH7BTZRgWXGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1uKmhZ2eC+qczkvgumkqf4irKvpY1pztTchTW2mAuZQ=;
	b=E8oYp4D4xuoUvIbuLnYSz+ZW5G0wHgaDa8hoCyoXclEOIaWmkMrw9pxx/7Ef5OsszpSP
	 V5mthOQUlKwb8n20bcOkE5CjNSiwqp6athw51mlpCoipa9rGeqlV5vVzvkyFUgmR/xctj
	 ey41KObaVwLrLx+DAN7B7QjANZTjB1oOqF1XXPrGZuJSUDC43ccXHct8Kb5sTCCW51K/e
	 dedrrzMGbMc0rPtwvTsfgkGxUyIWRH0xHtbirRewdlmNWbM6o9wu+fIHxic5Ogq9Bgi9R
	 ILABS+1Y2eU6egWbdfynXuCMudxGRgMcslGEtNG6ZbTbgPA9knHJSyVmAWK6o0IaX4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v68hfK21;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48289606D805
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48289606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v68hfK21
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso344805eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174626; x=1794779426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uKmhZ2eC+qczkvgumkqf4irKvpY1pztTchTW2mAuZQ=;
        b=v68hfK21lQ5Hpp6H94BkhyIKicXp1oMnounZcROjkcX21Ge+SN2YqDk+BUSXNjCv8C
         9ekErNOYK0UfM0HdmxgwZ/eJZ7vgFN5fa/MITp3I3OzkMILCpY9nNN8LS79256xGt8Zz
         sA6qsQs/H9/OA71UJltSK7zSXeMiWsHSbwYJ44AjgBglLq6uhW+uSoGWDo7d9zd2Dthr
         j6oQunmI/GnIQSGII67cEGpdupg3RmgjMjgE59A9xAAa9mxaO4ehBWxu601Zsmr19ui3
         5QQxcugtos4Xulm/UiYO8bvi++fGZ7lUWEE0rCoyo+aqcYEHr/hoLe3+Ng7hZsYzsQaZ
         +16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174626; x=1794779426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1uKmhZ2eC+qczkvgumkqf4irKvpY1pztTchTW2mAuZQ=;
        b=Q2xNZp0LgJW+348t3BEHLiNM7367FGDd8Igyzem7tCE0RhTwgOXK8XlC/WAZVxU/7d
         E8YDLdXS0vwoY5ExpCOSfmZh3DUF2qJEu2a9vmABxR15hrJSrCx7XVUjIDbshtqqLOw0
         wHKK6XleW65GY/jirRtHIQY3Lz9/1kOzlBNf6Cx+ZUdWysQfTIA1h1pCNFFIWKDQzv0J
         7heIhCxsicJsxE8vZkUCR5ePtJG0EJVnlWGgo3c58nrk+oQcOAglsTxFe4IwgnYxHUnq
         pKC5rl/2C2CC5nYGMqgu7eUzpISg/vZhJ3Xzd7BdRR0J5/C6VJjek4MWFDLCp4cWfolj
         Rjcg==
X-Forwarded-Encrypted: i=1; AL+hErHXccisGDjtr9hFrvZBWl+rFtB5EyXmZHEfmYwLiqpZSsP83/3SDZTlHE04DYopg/Zb6w9rrlwmNmiIkNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z96hgpOBK8Dbdur00rCYmZAch4rzxwqKQl1wscgXnGkK3WT+rxr
	K+QT7eHkoB2gubr1YkghGndQCYpPv7yuqVDF3EKrYzA+soPelCfFpsi516rtnVSfglz4aA9c
X-Gm-Gg: AYBFou3VPYo3g6uUGKpEAr792f3ntEtkNpjixQhnPdQ778qHbS104R4OibUbENZ5NuW
	JkpIaeP/T1xAekxinIHMkwGcZxC3XRXRP22kx4R4uAuuNfgj075zpgC/DpJ6+XBvNGtkEfuCxVL
	+64kD9N4XMx5sU5g1t5XJ2HNRRNNo/Cewdb/XWWUOrStFGkP0W4gYrgUxH2X1JQEkaiaYnlqZFk
	zIZ2HRCxDzXrPHfTSDKXozKwAklIgT1pxdrAXIivrNkwV8auDn5y0jPibInFs01WGtVb3sKolsi
	pb7yTqQaj4dZyKlc6Z1lVMq/gv710lUb7f2CubHNr1zR7Tl0NRDup/CK2PsPzFtExd5xFtaZppd
	GG3dQyLHs9p9vBpdqdSE+w75dHSnRh8Iib2Rax0Ih055FU8jtWCZ3Gw8MIOCZUJ/V9V//6j90pL
	gkSCZQdXgghhB8Z78grQyRa62K1e2yrfBN3tNupvOiBGKLEavNNi1ZDJjzI+fATMa28qOADelE/
	yUekNHGaXPV+Ue7/oYatHLUiqE6gl1to69ixBDzLFaLNsCq8hdjcAeUxaiVXSpQblOilZAQ9rnQ
	3Cf4TVUSUb14FD0vDSaYioIkCdQvAe+LMx4qzy3AXjT0VGr3kg==
X-Received: by 2002:a05:693c:62cd:b0:370:ff2:f78d with SMTP id 5a478bee46e88-37256614c62mr4822924eec.8.1794174626129;
        Sun, 08 Nov 2026 13:50:26 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265efd2dcsm7587575eec.17.2026.11.08.13.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:50:25 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
Date: Mon,  9 Nov 2026 05:50:09 +0800
Message-ID: <20261108215010.351256-2-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108215010.351256-1-cyan2254650260@gmail.com>
References: <20261108215010.351256-1-cyan2254650260@gmail.com>
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

Document the ALINX AX7Z020B development board, built around the ALINX
AC7Z020 system on module.

Link: https://www.alinx.com/
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df2..87b331f296 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -20,6 +20,7 @@ properties:
       - items:
           - enum:
               - adapteva,parallella
+              - alinx,ac7z020
               - digilent,zynq-zybo
               - digilent,zynq-zybo-z7
               - ebang,ebaz4205
@@ -34,6 +35,11 @@ properties:
               - xlnx,zynq-zc770-xm013
           - const: xlnx,zynq-7000
 
+      - items:
+          - const: alinx,ax7z020b
+          - const: alinx,ac7z020
+          - const: xlnx,zynq-7000
+
       - items:
           - const: avnet,zynq-microzed
           - const: xlnx,zynq-microzed
-- 
2.56.0

