Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262544;
	b=RHvlNKerkPUfaB5cfd4kgp3Q/nQWLxwPrqfeneK0U3Jh9n5CJOj47YjuzVCjX9TG6nW2
	 RyXBIaRVaWR9Vr+ab80KritHAIFH5GXVXlbSFx5JsJMRoRbYcaYcyel7OVkymS6XOKR3W
	 w7a5Cbxh7phxZ3rW0NUKVHrKmR4OeVMj4Y/FWfFNYXwrzT21Jbt+vIN/jd9DSQnJuIurK
	 q5oC+U4OMgjkmCTnq+Y3LTGs8dMMMGlo6W9kTsCxLn7g6Z0wSqXMOvzGAO4z9S+DKSfDO
	 Ea2i9dckp3HTiPXMboR/yJhmwseAswzgEQRot0VBX1h4nzdYijTr8fpsw8BrckYR2Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262544;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cnbWzp8SRYw9JefcoG20foTHGQw84aM7Os7qfOEDv2g=;
	b=GmYOZyQ/9yotxO8rN/kHKFydO+mbVJbayGsczCNxjJ+FNrA+/973M7hQpSYcDfYl7K7P
	 yRBimR37jXkV0bTL6lsw/M9sifih5Uz+tTtetjChY9H2ocSNTSNCMRthOxV+A2wg2JzIM
	 hpeJtAsTSnHEefOeHI1GeDYqSkm4fpcrlPSJmo892hXLS9TMuxR/DOMB70KZXiz6yWPHr
	 Zn70Web6a7CSE6x5RWBYrKM4Mmd/hBARO1e6hpf04hO4F2VE4N+0gqJLR+S4R8/I1UReN
	 kju7Hqy+Y1LqftO5bq11iD/YXiy7+qlbBGtoL+W3J3PEkYbKuysn0X0aPVchMppyPiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=nm3X2TUk;
	arc=none smtp.remote-ip=95.215.58.20
Received: from mta1.migadu.com (out-20.mta1.migadu.com [95.215.58.20])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49F7606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E49F7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=nm3X2TUk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Jz5VysEAlQcAxLlojRgxtAz9V5M3QMUrbakks1zM4k8=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794262542; v=1; x=1794867342;
 b=nm3X2TUkLCtFAcB756h2Sjpim385SJKevpzzsFjEam/gxjtEqGNPmb13cV3KL0fJvJFick9F
 Cwrtvg/m5WlYvrODPKPpfD3gqG5g2pyJqxGly/VGlEKeDR+5z2c42TtCy886+fNM/uXwJB64mcP
 tpxDwDtNuSNC3V6QUW7gROVMac0yPyJh0zP3iuxUrQiC967sL8+G9MB5EKZbaILjLk/wtrWcXqj
 xjnBqO0eUiZJZACy2j4DmfVybZ8BNzQ272jxNC9b7saBrh28QFZKvwgU5009SawVzJd0b1ezFZo
 njTMnQ/iU9BMESPAjkDZQ5hE5ygAZu6ZL/5jWpil6SEjg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2300422c34a38f09;
	Mon, 09 Nov 2026 22:15:33 +0000
X-Mizu-Trace-ID: 2300422c34a38f09
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
Subject: [PATCH 2/6] dt-bindings: arm: qcom: Add Motorola Moto G9 Power
Date: Mon,  9 Nov 2026 19:14:31 -0300
Message-ID: <20261109221453.658316-3-val@packett.cool>
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

Add compatibles for the Moto G9 Power smartphone, codename "cebu".
There are several display panel variants, start with the Tianma one
which will be the first one to get an upstream device tree.

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 37443849d0bb..9c463fce515d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1073,6 +1073,12 @@ properties:
               - xiaomi,lemon
           - const: qcom,sm6115
 
+      - items:
+          - enum:
+              - motorola,cebu-tianma
+          - const: motorola,cebu
+          - const: qcom,sm6115
+
       - items:
           - enum:
               - motorola,guamp-holitech
-- 
2.56.0

