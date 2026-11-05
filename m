Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.245.251.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910159;
	b=F2hxeFqebOOcUpThBOUUqUmPUWDuEeBgc+CZC5uVku3/pk4zS0PK0iko2KXGq5E6y4Op
	 MxEdsb1P1nm4O4ur3jzdcPSufxIsj3+5yVyGoBHLE3mjYff1xGns5yNN6jd/Bzc6XPpdP
	 OwybaGnB93afbR+5zy0t95D1nVRnDc9Ww9xMAPLWJ8nhKc0oAUrdIcKUt49SOon19vwQA
	 vXjbbhspxdBss23uN4nWvbxmWvKRWuST6Txi60+uV73RuUcMCPISjwM5oNjDct2P2zxSQ
	 F4C+wJF2TsLA3LnNsPUkV4XVoN43ueszW7KNAZfv/kZ8Z/G1mdTDyaiNe0eCeeMHGCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910159;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=S6/GdF6jTDLamz1c8AHvOGiXT6K7K2AClu0N1DJ1wA8=;
	b=d4kMSOnC8E+l+ynn9EJqx8kV9zIXrGGJbEhraPs+7/BVNsr8XP+MCInFiRi1+rjtjFis
	 eXJaFS3xjAR+ZhFjH413dbPWNQ8I/cf0+LJOHoPxLtgJGt1uIbjorQlL1AX+mWFbD/DzY
	 duImFeuXGBGn9N/hi9EOfDzAE11iQRhH9R6lIJPWdgb+vcWlN/IF8Tr9mbOCqaURG+piZ
	 XeUfzg2IL9wV081rCBuj0tor+KxCgWVEIzW5Sk+HaOGiDkA9sWUeLqrN3Qus3qke27ydf
	 rA86vFHHQIO3TxH3bP4lbD8QEvj0EKwJeygQfa7m13VF/VuEIfT7iOMV7cV3eOJNnLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fhannenheim.net;
	spf=pass smtp.mailfrom=fhannenheim.net;
	dkim=pass header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=XQyrxQgp;
	arc=none smtp.remote-ip=188.245.251.181
Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E31606A32C;
	Thu,  5 Nov 2026 20:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E31606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=XQyrxQgp
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1793910149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6/GdF6jTDLamz1c8AHvOGiXT6K7K2AClu0N1DJ1wA8=;
	b=XQyrxQgpcVVQEWILG8ywMGIF0b2kugCUggrfQZ5TWfvX6MAidmwT6rvXp8U24HUyTdJACT
	5EtqlFPCnkz4qftevMgTYaeGI2GUTor7MPJv1pzcvb0Au1NyhJcjyAw3C8KkOZbMyFytop
	HeOPi38XzVp2aNEyR5fFDbZvIS7mdI4=
Date: Thu, 05 Nov 2026 21:20:01 +0100
Subject: [PATCH RESEND v4 1/3] dt-bindings: arm: qcom: Document OnePlus 8T
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-kebab_dts-v4-1-c6bbe6ded92e@fhannenheim.net>
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
In-Reply-To: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>, 
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frieder Hannenheim <git@fhannenheim.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=674; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=NQUQKX6vdIpRc5m7OmejF4IqzMpYkMdMuguX9oiFD+s=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDFlvnha4/bivdlPNzGzRFb1IvtvutcYLHY95T2JaOpPn7
 O7pO+JlOkpZGMS4GGTFFFmcp0v+sK8U1tEP/6cIM4eVCWQIAxenAEyktIfhryCP8dr0z9H+rk+j
 U1QvxWge7zm1+KFntE3JOreSa68tWxj+6Sx7t/CTiJm54dukz6e7Kl/0bHSyfhFxzHOth++3f5r
 GzAA=
X-Developer-Key: i=git@fhannenheim.net; a=openpgp;
 fpr=439719F83F79132C2F57FE216C0173C8B7931E53

Add compatible for OnePlus 8T

Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..c21ef16e9ac8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1067,6 +1067,7 @@ properties:
 
       - items:
           - enum:
+              - oneplus,kebab
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp

-- 
2.54.0

