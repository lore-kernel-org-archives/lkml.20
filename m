Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B04B48F856;
	Mon, 12 Oct 2026 15:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819424; cv=none; b=uZfgGN/dkP0bx9l054uKnSDANNkyBneoCGZEU1e/C3yIUZ7TiK+uaxj9e1sZZDbecR3I9gJhfa6PzyckZwo5EiHPOTvsszDXXG2uSEI3yTQ7eXOov0giM+0TckvmEtf0GjAiPrGc3niT/pKjRuMsQBzpFBPoq5s9ivCTMjHOQ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819424; c=relaxed/simple;
	bh=XTUl6kGMbrFpsj+MMuIE7M3C/fDLX7z7GzOaGHw3agc=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=PI4054aj7usjQnnnIRWEEU6oZuwctwheN/YF7Cqiz+CGiTj9tLgYfRtsi3OssD3/GeTyL2q3wJVfYtB0BeHBxEMAnC2LnxCuuhVkEapnTnnGmPa/x3EqhmohJ5Gjm+j7/zcm3wzmK3fcx5KLd+rK0A44nynukAU8caW3Do/dpTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=V2gtMxzj; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="V2gtMxzj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791819418; bh=uxS0TJZOGGb7V//cZksNCcUPwiQMXTq665YIZ+C4AzU=;
	h=From:To:Cc:Subject:Date;
	b=V2gtMxzjEvUA9pFd/OfjyuHi4glS6dwh2EGkpgleGYyvWh1PdArMNtH3b8KP+o5Da
	 oLfLiPn0A7zkpYVBeQOI6X0O064TmCWzdt3afC6miZXFyciHRXwdTLsvgEyKbO4h42
	 s8ygoSFdjZqykBQRuntTf8WJ1VTJNTrllLPCHe1s=
Received: from DiagonAlley.floo.lan ([120.253.195.162])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 93732427; Mon, 12 Oct 2026 23:36:55 +0800
X-QQ-mid: xmsmtpt1791819415ts80xmiy6
Message-ID: <tencent_7C5DF9D5552EB31E8CFE415048CE592A9A06@qq.com>
X-QQ-XMAILINFO: N7n3pNzaN4IBSwNh3XyE8+SO7hRu0roibbtKkAEb8QkDwrfC1WQOHmrdTZX2zy
	 mxzMNFRpEtDNCw7ZLPeOIW1TPCthSXqFsNSveP43VUHDwfBiKX28i7sVqdRrvRAkqCMdA8UYLliA
	 s+Gyjhi1NiWgqNhjQCtgM6fpxNdrd24GE+FmEhyoKHlks+pbTq899Iel9Pw2bq9Fo/lColwyhBf7
	 6WXrzOu0vf+9dDFAyHr/VTOQZ75BAAoFrv6+XOIDXyik6H1HAFmj3AaKfVgBecQAzt6jcl7Tr5jw
	 +Pr+AopH1DWa5vznre6MqUUSCwgQcLuiv2yccodxlYR8tAmSUQmvU4lINlJ/UsbPU7c10jQ9XBYE
	 4Q0wYMK7odmF0xBtaqdQlJQB6NEOcsu+hqWNTmx/dvwWJDgsLqL4ZqaNGDJfaPQPcB8+tlqyJNye
	 62riDZNigv2na0RNQB6ZC0+zxxAMke0jR90KPHU27yrJC3L3PMKpI9Q9mLF4z3F1mKQowrqXTJne
	 IPZWCyri5e1HIFRWCKcXACitM/G1aPp4ZeLnNC77osEKZKnLdmCLAf7WfvHESfa2eNHCA5jmMeN9
	 fhM+UFp7hPtXc5yVk3fm5G78+Bpi2xAlDdQkJisgHehQ9cHAzuYgMHfmC5Gj+JpR/uFpeoMV3IWF
	 hRsem4I9LQsZm1Ej2vUzZIASwktQoMZAYc/QAPxE2hnJ7rsjFO6SCLnj7IrdSwHQZabkvTNaEdYN
	 cDI2lcK4hcFwaobMu/wfS1pp9cq4TLOYf1w8eBbuO3hGrfXWlRRfw599UV57bOcS2CFVpFaEtgSR
	 Gq+cd7ENd557ShjQWeoFvDnPDXkst93e84nbqYGlljruUXnhaYECMwMCiOIvdtrFxSKLsUIK/2Ez
	 vLOtpnHpHQtbHS3EtRj12bjq8BWQ/0CzFxga3hsviXVSQUOs1G2R5BDbGqi9NB5xKx5JUpVSK5OY
	 fn3W2nVaGHSgYEoad7anJG5Z47f9wUvktrV8xShkxs61hs+3g27QWUe7aHKuCmPmx5owAP6nEU9U
	 KBRbLs2I5d/7cQtTe0alUect6K+EnbybvG0GNsnQ23l0LGxAtV/Q6IJqoSB8cSyv40pqDPsgudhI
	 SEVjNQge9uZHQyZWG3XpU2joMhh/mxDk0uDgKi7nGGKUqS8yKGgoEakqxzN0cWEmuf8yRouFYXx9
	 nG/TVej3861pwg1jGkpQ95LAsL
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Mingxuan Guo <gmx472@qq.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingxuan Guo <gmx472@qq.com>
Subject: [PATCH 1/2] dt-bindings: media: i2c: dongwoon,dw9768: add Giantec GT9764
Date: Mon, 12 Oct 2026 23:36:49 +0800
X-OQ-MSGID: <20261012153650.1718231-1-gmx472@qq.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GT9764 is one of Giantec's VCM driver parts: the vendor's VCM driver
application note (AN971) covers GT9764, GT9767, GT9768, GT9769, GT9772 and
GT9778, describing the same 10-bit DAC with the AAC actuator-control
extensions.  The existing driver drives it through the same register set,
so it is documented as one more compatible of this binding.

Signed-off-by: Mingxuan Guo <gmx472@qq.com>
---
 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
@@ -22,6 +22,7 @@ properties:
   compatible:
     enum:
       - dongwoon,dw9768 # for DW9768 VCM
+      - giantec,gt9764  # for GT9764 VCM
       - giantec,gt9769  # for GT9769 VCM
 
   reg:

