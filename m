Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331316;
	b=RA5jfLfxjjiGCeCcX9wZyZahjz1/t7nIFtTnowCtqxjtp8jshB/jmYAZbohU1duwPt2S
	 VpFFFmFyrj3+EYczncJyTL0G0OD69dEqT2x9lrhl6wDYqJrc+3a55INc08imm8NK6nJOa
	 dasQWtOVgjeCBE75dVyE5/MC44gU4i5OHsM+HgqxWBp8VfIZk+oB4uF6DWDqXaB5s1LsG
	 5/WMNqKIav3rHlCg49VeyXYH2amNxIcHfLqjkedDpTakpiz4sLlIGSz2al7GY3iB0lgs0
	 mwBo0xzcQl3Omq25UsMzE4LCIoI7KslFHvzFKSwGKZ93kiy4NLUHb/IOgeEQ+6yR9YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331316;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Hool60VyVPPuV9j4bE2qOmk4HnIvQiZg/cOhP/ivp10=;
	b=U77Sb8SqvMdmOGxuRiFNvP1W/DMlHkgpN5wsxHgnkluP0KInSl28dj5bnYtVHYhgXmHI
	 dlvmn0lvKoXF5+CNZvVrJM/MrtyVO0dfM6d5C0F1sTSfSJHr+vrCv+m629JzP2bIqQUQA
	 i+OnSof51c9TLV0rGQhDw5W3DxWH2y51wWELpSo/9P+WKO6/ANiz6SCrZnBPjJzuNZnI2
	 piRLfBZ+6p9y3JxYxpTYId5iG0fyiQGFXpBJLLLfA9D/ssiZf+MbV7ctrv9nkZy3xWFpf
	 Rt/FUJ/AgMHnjpocl0Y2vSvYO4B73hzg0Zc9glFDyPxodbdrmlK9WYQm2SOuWAAoYVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94BD606A321;
	Tue, 10 Nov 2026 17:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C94BD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:9bfc:b113:5373:d0ec:2ad1] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xQpXU-001C99-1e;
	Tue, 10 Nov 2026 18:21:44 +0100
From: John Crispin <john@phrozen.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH 1/3] dt-bindings: arm: airoha: add AN7589
Date: Tue, 10 Nov 2026 18:21:41 +0100
Message-Id: <20261110172143.296304-2-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110172143.296304-1-john@phrozen.org>
References: <20261110172143.296304-1-john@phrozen.org>
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

The AN7589 is the next generation Airoha SoC. Document the SoC compatible
and the compatible for the Airoha evaluation board.

Signed-off-by: John Crispin <john@phrozen.org>
---
 Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha.yaml b/Documentation/devicetree/bindings/arm/airoha.yaml
index 7c38c08dbf3f..bf432d256882 100644
--- a/Documentation/devicetree/bindings/arm/airoha.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha.yaml
@@ -26,6 +26,10 @@ properties:
           - enum:
               - airoha,en7581-evb
           - const: airoha,en7581
+      - items:
+          - enum:
+              - airoha,an7589-evb
+          - const: airoha,an7589
 
 additionalProperties: true
 
-- 
2.34.1

