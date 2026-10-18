Received: from mta1.migadu.com (out-206.mta1.migadu.com [95.215.58.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B3D3E0092
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365190; cv=none; b=bETIlSiHdpV3w2fEr22DYMY+wuqm49DIVK5uY4uQWLbWnXlbcXeU9nkMliaSnMd+2tSP779UEUhqe/W65sWplfjoKAYn8FPRXIi5gD7kSinynuCScqfJJ9JkIjqk3cj0OUk1TkR+/JYi2fgz+xYmo+RFdKSulT2SgZK6/P2Q7UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365190; c=relaxed/simple;
	bh=zulGnCjG3xKqjo1yXunWbQZroFYZUmgU4u66ii/MkgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EV0Rs13FHG3NtJIgTKXpTmRB5/dbuppv+nQnSp9b71A+NdFvhztXOkBzA9vDVe++ZZQpp8LHSVc5K20vToyFNCF1gjmvmcTBi/K0r9uR1eWFgwVxfA7BE0mDxz1guCmUdp1Au8/sPKhyan8lBmz9E9kbBDr055qVLBb15F91TP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=B8UTZtHI; arc=none smtp.client-ip=95.215.58.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="B8UTZtHI"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zulGnCjG3xKqjo1yXunWbQZroFYZUmgU4u66ii/MkgY=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792365187; v=1; x=1792969987;
 b=B8UTZtHIy50POgvwQAJUWgyyp3Oub9PzF9V7+pDk8kurvLl8poFhm6l25Mi2OuLH1cGtdheg
 +lwFJV+ah+ySmXzhqy9sOiKGsqCi5ZmsAGLrGPcWdwerltOzoVt1QiMI+WOGDf+Cf2tJRU1J9kZ
 N/hpz1bk0QIZ0LrZ19aeVZwvRTR8+mslMNC8GUwVB0vpHT2jjQVihoif9x0UXPX7TI5QdioMHse
 pe8xFucZ2OHxofF2KodpbBC7a//aH2a38eVWUKIU0vkeitwpJS/36HqOIGCVVq8aYLH7D9dsTqN
 ogH+1MMyNXRlPDO6UMRxVd0Tsh/jvSZpPYmWGIb9ViMfA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e0d20223680a8f58;
	Sun, 18 Oct 2026 23:13:07 +0000
X-Mizu-Trace-ID: e0d20223680a8f58
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,wcd937x: Add USB-C graph properties
Date: Sun, 18 Oct 2026 20:12:29 -0300
Message-ID: <20261018231244.1266926-2-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261018231244.1266926-1-val@packett.cool>
References: <20261018231244.1266926-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This codec can be used with a USB-C SBU mux to support analog headphone
adapters. Describe the mode-switch, orientation-switch and port
properties similarly to wcd939x.

Signed-off-by: Val Packett <val@packett.cool>
---
 .../devicetree/bindings/sound/qcom,wcd937x.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
index f94203798f24..f15b9a9d90b1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
@@ -25,6 +25,21 @@ properties:
           - const: qcom,wcd9375-codec
           - const: qcom,wcd9370-codec
 
+  mode-switch:
+    description: Flag the port as possible handler of altmode switching
+    type: boolean
+
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the WCD937x Codec node to an external USB-C MUX IC for
+      handling altmode muxing and orientation switching to detect and enable
+      Audio Accessory Mode.
+
   vdd-px-supply:
     description: A reference to the 1.8V I/O supply
 
-- 
2.55.0

