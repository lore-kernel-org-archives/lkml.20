Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509701;
	b=fayZC+GJA11QMCn6b2BZ659YYqEXJhhbYYVm1QFX6oCt4qjuCTOQ/RnyBOVEBP5AZpIL
	 bdt83nnJGG6GsSi8JgzZLxQL8V1xKDdeb03aCK7UArXPJ0tvAq/Wwv1Ws25JM/qRjzwVY
	 d8wo1c5qzeHzErLaAG0XTEDXAUCuEZou2ccOfV8t67b8s2ng0cLdks+991+Ao9hgWRw/z
	 j3p3drhXkCll/HMzMezyaHabipfMAUBb599UZl8l8RpEmOpTpMi1Yu4TEuAVto/v0MP0J
	 nRT5VtpfLfrtKGK8Gs/vmEvFX9s60TSvod7HatEnFSV54VYAzAlO/XzhCICqYNbpbZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509701;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=dbA9v2GFLuE7MQbNQqlCM3yUzuiDV/yT1FrV7mttJEM=;
	b=sZmuiYLkl9EVJmWAw7DM+cEnpnti94ESeA844ukBe6kuMQX4IJXxFL4lkY7kHGdiQWKC
	 WwnqEnNAmAuGb32CFzTox/yjBEaPRfe1yWa9iEqbZhjKlyri23ZvX3a4oUq1ywljZkZyp
	 vtE3YuzVx9tpoEB8y0YR2JD7xxhKUDmj9/akoBTPc5oYsjOjMV5WRk2aW7/42EdK6rqBp
	 A6MZu8Ac+lYyVSK/hLyodrcFXirDNKBky8xjbrfRwBKh509AGFe5qat9ztXIHMCuaERAx
	 BCJP/mX5ek3X/628IzXVx0mUvenQqBpjSIGJKBhrDstub97dlbMqIYXPPR9phd10a5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB1D606A895;
	Thu, 12 Nov 2026 18:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CB1D606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:f2fc:83ce:6656:246:c906] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xRZwk-002XXn-0Y;
	Thu, 12 Nov 2026 19:54:54 +0100
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
	zhengping.zhang@airoha.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: airoha: add AN7589
Date: Thu, 12 Nov 2026 19:54:44 +0100
Message-Id: <20261112185446.1314808-2-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112185446.1314808-1-john@phrozen.org>
References: <20261112185446.1314808-1-john@phrozen.org>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

