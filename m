Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262531;
	b=WpveDz/72YN+JwrT/sq6E0aoanl1FcNmOIkL76VKTPDnE18H6xuupKl2io/wp2CZWO/K
	 S/hskpcY181eNTIeE0r/ykeADJOU9OXB9YNSY+3PzWRylUJsinfQ7QxUkbJg9dyK1fWrz
	 yjfk+D+fghmBXUeWFvj1q/MHwb9SyqrbXNzbdyAVkhlxjLrq/FEA0yZyZz/V8xPO/43Kg
	 5qUashOqbSY2TerQpWfNL992G31/f3qA7vJw+wA2lN/vWkJ00brDWBLb2fp40qsLblmJc
	 3Vd+QzHlTHIRCZmKUPBo8gwXrOdixsRQHXIqS6/aUChdL4yS6XfVaTI6rKEa95tJXFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262531;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4lKRGPKRjEBS3HRBukS+pW+bipLW37WZwjli8JaaFQ8=;
	b=Pqvuo3B8MWqZcq+VxwoxePR/a2G4HusgRjcjG1tOYF/D4SSZlaUryvbNIj7/g70HNUVR
	 3Wil6aRkTesEFO7If8B5k1NFXBoNRwQASQ9hSI6FPL+f/63FUAWrcT9854J/W6/F0PM6d
	 utdXJ1GeakRdnxWRk3uEwKgL5gpcTOPi7Vk3+JaeuFE93tX7tHGPeeFHR0IMgh0L4zGjJ
	 7JTqc9C3YbfDXn39kK0djfDS9N0j8+JERKq/Ra0yVhx90yRGPtL6u8pCbyXm+jzlxt73O
	 RfF2CnD/t3aItAlptrJjlGEuyS7r+GvYJFhodefop0Ls5WrKxtAmF9tnJWVZz/GGNQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=dmS3X8f4;
	arc=none smtp.remote-ip=91.218.175.118
Received: from mta0.migadu.com (out-118.mta0.migadu.com [91.218.175.118])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6168C606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6168C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=dmS3X8f4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5rXea88LMQSd6M3OaqGX1Vmyk7bSpvO4oRK6rdtigS4=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794262528; v=1; x=1794867328;
 b=dmS3X8f4MbVLBfOsbMc8SZ4iw9NtzyqDUJz2rHi0DIgT4wvX+UUnepZ+G/Ztck4O17Yzu2+G
 r7njJcp78HvSME8K3UMcnt+W5yovlYif+LFB72RoMgqIdBwEWdl+RCdueJXLbCr6lHHAw+umhqR
 tTss/689E1l+2DX6fh7xehCgOVAwPjoTnclwXBTd7EoWpIhU1fwUbxTE4ftK43yHyBq2KwQpBDf
 rxqcDaCsxoDiWLkRMv/ITJOTP2N/5TX4UjxJQvOCi9JF7do837OpO1RCEqHKwQ21Uv2P7bcnGqw
 3PWRPSV6w2ZF99Tu52oxuso1pIL4ljfQ0rZn5fqtQWGxQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4e9c1d3d8c71a54a;
	Mon, 09 Nov 2026 22:15:25 +0000
X-Mizu-Trace-ID: 4e9c1d3d8c71a54a
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Michael McAllister <me@michaelmcallister.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: arm: qcom: Add Motorola Moto G9 Play
Date: Mon,  9 Nov 2026 19:14:30 -0300
Message-ID: <20261109221453.658316-2-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109221453.658316-1-val@packett.cool>
References: <20261109221453.658316-1-val@packett.cool>
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

Add compatibles for the Moto G9 Play smartphone, codename "guamp".
There are several display panel variants, start with the Holitech one
which will be the first one to get an upstream device tree.

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 74f46697a363..37443849d0bb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1073,6 +1073,12 @@ properties:
               - xiaomi,lemon
           - const: qcom,sm6115
 
+      - items:
+          - enum:
+              - motorola,guamp-holitech
+          - const: motorola,guamp
+          - const: qcom,sm6115
+
       - items:
           - enum:
               - lenovo,j606f
-- 
2.56.0

