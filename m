Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792704046;
	b=V/a7I9vIw4r+ga+CG95rTqdPzf0+6c12w1tjPCx6hgfR//tkpGjW2bQ6xETTRK0ZirAk
	 pMlpQwO2cbVL7uzVHw73++HY/+lef83/x0SJV0mkYzj2ryOxHDRQNUVnebgpX2vE3nno4
	 1e+zPW6IWKOcMy5btqLGRae1IRUzPWtZpp77tWGMVr0QV1NbBmfuCyTu1JrD/SYRmUfll
	 qlFw8YoxAm75mkKghS90WAYFa70+mAFlqV0EFt5zTMnr7rowab3VRkMgbbDS0Pks35JUw
	 RAcE0RA1dv8ntJN3sGKI7bMIuWDfH4I4rNO7oKwdOuw6vY0RzAaWmBSzS+l8m7TjxgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792704046;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=80wrSG/B3VGkS+ZZcthzUgcL0p6ipfvHuu8TjHdZlpk=;
	b=PpNiaAwA9Q1oQJgaYBzcqdv15tuUg9iOvKafWCfkDULdHKsncTPAxAyjC4NiedENvla1
	 n/+FncF0KKv9kFXVHQqBzlVliW2h490ZAxilUjmBTw4TIWQkpDlqKRKhtaa9lm7YcJrXJ
	 kMlycgwvrZ4U5JDLs7iBbn3m1FdokUoyZlNPPKlANmYoYLXxhhriKGO2lV9d0Eelv2OnY
	 VGgTHvY/4j3PIecZqycCs/1QTwJ4igo8A81oNc/WWllLqiPaVNMkhVRDcbekFXhvS/9V7
	 jlEv2EN82sU7iOs9j+cdvMk0O6Ad0eD4OMTsSihJTs6U/UpDd+1DCKScvqwEQQ2H8vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=I1Lg6isB;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D90606A323
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25D90606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=I1Lg6isB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792704043; x=1792963243;
	bh=80wrSG/B3VGkS+ZZcthzUgcL0p6ipfvHuu8TjHdZlpk=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=I1Lg6isBhZlphlQ3vltRNAJlyhjxdVfv07YFnWURqYMETlcmVW/9GQYUlSxyYHuv0
	 i3owUd8c1lmcV9aa9HJkbPUsrHNq+IoHkeXsvD6cc+WkzLQeejdQRmlEpV5BJo48Uv
	 XFDnkR/a+crx7rw9dMy+ADuVqXvq5oN2+9v5RDyNjw+5OHHomp78uHIF89NI/SJ0sL
	 jTYUkOH+Q9MJ4X6GBUs9o2VMBpJ2vhE9mhtuoUAuXECRTY4E7CxJRkruZ2wJc80zrL
	 V/YrdwGsutTVcBR8Swtafd4Jf3qAljcwmMpe6MW0xdbA9QVKg7VJPUU9fZBmhJqt0T
	 +7NsQy+i4GJsw==
X-Pm-Submission-Id: 4j9fFj4nLyz1DF5J
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 22 Oct 2026 21:39:43 +0100
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Motorola Moto G10
Message-ID: <3878c144a3adef2b734e660d0870fa3488d36570.1792703903.git.me@michaelmcallister.org>
In-Reply-To: <cover.1792703903.git.me@michaelmcallister.org>
References: <cover.1792703903.git.me@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Document the Motorola Moto G10 (capri), a smartphone based on the
Qualcomm Snapdragon 460 (SM4250).

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..963fd482be 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1051,6 +1051,7 @@ properties:
 
       - items:
           - enum:
+              - motorola,capri
               - oneplus,billie2
           - const: qcom,sm4250
 
