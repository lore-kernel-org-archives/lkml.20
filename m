Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776932;
	b=AhXRY4qkBhUWdv9VHIP1SgskuskhA0i/McBHMm7i3ekUWkm2C33Sp+Fw7tBXk1UJJs26
	 /9f/b2SzDQBL0D5Fv/k+kIaiGlw6tzSwH/Ld2tDOy0P99IEjKSVriPNhEzND5yB35egyJ
	 r4/DIcMeadQ7L8R/wqFW/vpVj3rGAouMaufI7BT7w7YTpp4t5p8+3/I/oDTceJt3OdjWS
	 vFn/aqxow9qrmtQgMAFHZ8ansrcJE9IWW+TCaw8zpGxbxEumYagI2o/oydeZ9zDZzJi+/
	 Um2eouK8BGjZFK7hBsPfF+yVUoPpHEsa+m1pAp7kTPHJ5JMbq9yV3k1Fo03e9qcCk/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776932;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eLEmq3EOrGZIMwAreirF8EBFdtGikzzH70m8KdFqnxw=;
	b=eRLterExLDLIBm4daX3ay6vkPtvrnwSrZ6cNTeeRMhlic+PVsc5N80VAdixrKWRxuPCn
	 Q60bJhXmHZbE/+CoCKh91b+N4ttI4RaRRbl9WEDjgL3kOO9r+WEAw3ysGi44BkIV2Jm2M
	 SYdiUa/hUTq1u3mXDeC3HPCdsqQdXCJbviUCMq13N1j53aqo6HuyOmWTVlMT2wB3S8qNh
	 T456mpO6yopy69TnPPls+6N7APlYFW4YanUPv7VV5UNf2GhO80Oxl9jhJkw3NhOGt4XT8
	 jzswW9eJe+3B6KV+CFCI2aKNKMfvkoCmitu3fyoGzEWxJOhED6xXekJMuVlVty61mfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oSVIuG3c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D8A606A337;
	Wed,  4 Nov 2026 07:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oSVIuG3c
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776931;
	b=vJncmXvZ2UiuIp+D/mvaFlo2kkuM8QNrFcaBcet2lbvOUGTvVKPxRmSIiop9UsTO9yO5
	 iUjo/LMHvhkzP157u8RgwWS3qL4SRQ86pRe7n1jNPACXcDwnMdLzyE8Z82G45ktnUTosj
	 66HCfW1vlU3x0+uJeJZA1Yt5g++MB1Mkrr2Vxeqgu5cN7T1+gzPvPTqRyWrFPjTm2JQ2I
	 WwdrUloASYfD5cUcFizi8BqybhdrBz0ATPDa21aEWoEBckUnS81wxDp4n7+rZOMVIEc2r
	 vReDCCiXTxp283mCTyC9WiTbVl5jaD3zGsbM//C/Uh9Uq4sn4COW3bEVcFsycX2ue1g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776931;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eLEmq3EOrGZIMwAreirF8EBFdtGikzzH70m8KdFqnxw=;
	b=RBDOvuG90WMICdzjverpUFkA3ckw2VBJYkQA5mwICYN4hpIMta9vuzBJhZWthtIMpCUC
	 hPZF3OTVXmKK2mm6GECNLXizQNd5Vznuf0BkM280Xk/vPcZqEzgICKEKftVDUyuWRzb+F
	 3ysWWPVRNxKoCvkcUkxU386vWdeq72DGDJ4eHIwt0bSWOnNgD5LemKdpmaXBdqUny84hE
	 IoKdoAE8akz0oD21sDz2JwxayV335K2eyHSh1UScSU6i6pWaZFfL1QqYVwt7xNtYjgKM/
	 1GdWb10jkOazlzB8KeCWJlZEbR5d4y/an4XFXap8Q+1TtMVel8p2MlrLJhKi0Qx9b+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 187BC1F00A15;
	Wed,  4 Nov 2026 07:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776931;
	bh=eLEmq3EOrGZIMwAreirF8EBFdtGikzzH70m8KdFqnxw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oSVIuG3cY/xmwKeLJkDfCIOUXYgxUMTdfafQ/0Yc+cS2/mi38FygG5wIhazVyYFUP
	 eNQS2c2h5KemtWbqlWE5cBMRLYLCmGt+YfiMtb3dSWdHM5vHLjdVCUvsREs9fL6QlV
	 O7pQxbnxjKof9SvV+W5qmoncxyY5tWxoOJl65Ajp5+Q3gm4j2ARNsmNIADUC3GEPjq
	 Z8OcsrxOmRn10W/5hFNOYQgk2yJgSASUX4qOXPH0bdc8iHl43kIaLcWTz/1B04fi9d
	 ZN95GUj+uYwRBh8Q4LkuOM9LsSGo/WeBljQl86Jj7t07rQkPwLDxBlwIJ1ss2VJYy7
	 s8m6/p5u5OOzw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A2F9446D21;
	Wed,  4 Nov 2026 07:22:10 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 04 Nov 2026 02:22:06 -0500
Subject: [PATCH 1/3] dt-bindings: usb: dwc2: Add Siflower SF19A2890
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
Message-Id: <20261104-sf19a2890-dwc2-v1-1-d959375e26ab@telaak.dev>
References: <20261104-sf19a2890-dwc2-v1-0-d959375e26ab@telaak.dev>
In-Reply-To: <20261104-sf19a2890-dwc2-v1-0-d959375e26ab@telaak.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776930; l=810;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=y6CqO/fqkTYFYGM/WugYCN4cRmBu9+bliuNhbXSwqbQ=;
 b=4a6RgqvjF3gfLx2o9U80bxzb+8Hd5FVq7eSWfhku+r1rTxlvh5KAJ7GOtCvC/fEXYCC6AHRV7
 dhnasCqWMiMDEcRoBcLEwCfsZY2EdsYMZ+6Cy7YUcTpcYWvy8w4K7ET
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The Siflower SF19A2890 has a DWC OTG 3.30a controller, with its own
bus burst limit and an OTG interrupt quirk.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 6c3a10991..8217e84be 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -59,6 +59,7 @@ properties:
       - const: amcc,dwc-otg
       - const: apm,apm82181-dwc-otg
       - const: snps,dwc2
+      - const: siflower,sf19a2890-usb
       - const: sophgo,cv1800b-usb
       - const: st,stm32f4x9-fsotg
       - const: st,stm32f4x9-hsotg

-- 
Git-155)


