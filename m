Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1EA442397
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361596; cv=none; b=dCgGQ5O8f7/jtVuQ4wfqs2mvglorZKGLXByvQ+sBrRM31I4uREfDprZnOFpV4nbrNsr7NoZ9wefI25pzI8dsqx6ErgPn6Sxn2USwOmGUJ7chFbnG06tKIeOs1SGdoXg5KiZf19a477umgb/pbBXXjUefdl3SzfOkNo4er9aDCJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361596; c=relaxed/simple;
	bh=9WEKkcx9Svwoa0/ndt8sME5tWAZ/JM+5CyH/No5fGuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DT+eee53cvXQD4CrTqae4s+jvFar8wG0/2PG27jWSmwpyD296BJmcEUWf6vpDxUGrFMLpJWQSXqSwf8rJmDgOh77ShldavXfDRWvBywdoKPsBOmAsMSmlzQ74WhzQ6+Hff+6npkIldT4W7uhKopzZs+02/faO9E/6wg8qx4vWls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c45111bebso1044639f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361591; x=1791966391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tB0xtSwA0keDPf16UgDp3Oe50ABzW8mrbEXvFRXPXyk=;
        b=zDG/OEXp4ToYbaBLeAyDnoZkQCAkVLMvH0RbxV/0C7pvskzEQMOUyDTPH9wj2ru+/2
         hHp/KF8bRF/KkgIZ2HW2LOnIuDfPMCzIwlbzdbCrQe73M+Dzz+M1WWLMmneEYn+B9jpi
         xQyxLG+1gsCLdIgs4OFCtQrRW4rqr2/mtplDIP5RhRaR6AJs2losQLaprVmnCCG6ZHRz
         T1axD/+FjVt7iS2q+CNCtED90EfKOZr672bCVBjQT705+7IuUDeYEamfVoIH8+1qudRX
         2ZmyzHB3GEKZirXfjILLbsde+gRfcJeCRjxumtUMvg9c/eo+676PQuwfAeXuQFb04uYi
         FBqw==
X-Forwarded-Encrypted: i=1; AKwUvBwZ/1GXXLtLJkMr0I89r/fn5OUWOijFsLPSwuS+IlRwtTA0McIUfBcpC7TJMal7c2+p0cqtE6tMNIkv430=@vger.kernel.org
X-Gm-Message-State: AFq9FYKO9bJStehTJrC04LNhDYosmKmb50AVlfIwGpt+uTcMTj34mLfX
	/vTcuRzsVKAeFad/VNrCh72f6b/AnVbC3wzVsogaOZFDTFvpkAZOeoAP
X-Gm-Gg: AYBFou24tv1frSXX5mzhc8uG/f3Og3nf9tCo88tJO+TLC70kQXWypMXAzlrWFXbhj30
	/IGPQkSQJ7cF0jPhS6OkRr6Tl9gZl2jDBN1rHMvU0M0FNK46DhjpRw4NrC7ePvDfHKP+/l4CjM+
	6qG2wu4EUO2o6eD5xUtOQeraC46qYIUhPMiS8ENNK6yarpMRDFRpjD4KKm6pPbCfGBqG3w2aKIh
	x9PN4Emps3jecGAZxeS1hIj3bLYZThc58fx58J8OYk+sMzmvHQdERi3pyk2KDRaDlDCcfzdgRgC
	G6j2C88wno4JEQ9QwDLQ+Ek2r3nA59zzlLf0I1Hey2C37AQhaS2ViPgvUCmxuNjhCpXsGSjrbl4
	yNf/b4Yksy3sju/4wO0mQYlCs4NRQeL4k4RhFmJnj6/6lJzpIscxPk2YbwMgMyLGtgmjgg7LtBM
	cnBha5gwdGL0GW+f8Ncgynvw1ZlAApp/H94xCQvxX//l5dZoyLYVaieRpohgOu5KOwVvstP7H8A
	qalM4XeIJtAyAtyezEj9m6AZC8l03kyT+0=
X-Received: by 2002:a05:6000:4210:b0:48a:fa0a:34d8 with SMTP id ffacd0b85a97d-48c7277eb69mr2959645f8f.38.1791361591588;
        Wed, 07 Oct 2026 01:26:31 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:31 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 3/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Wed,  7 Oct 2026 09:26:23 +0100
Message-ID: <20261007082627.63807-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The T7 has the same ethernet glue as the G12A, but the controller
reaches memory through a pipeline stage that this SoC inserts in the
bus path. That stage has a gate of its own, which no other member of
the family has, and nothing else in Linux claims it. It is therefore
switched off as unused, and the port can then no longer finish a
transfer.

Describing it needs a fourth clock, and the fourth clock of the
existing list drives the timing adjustment logic, which the T7 never
uses. So the T7 gets a list of its own with the gate in that place,
under the name the SD and eMMC controllers already use.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 90ef79161ab1..96118b4d1560 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -57,6 +58,47 @@ allOf:
             - const: clkin1
             - const: timing-adjustment
 
+  # The T7 applies the RGMII RX delay through PRG_ETH1 and never enables the
+  # timing adjustment logic, so it has no timing-adjustment clock. What it does
+  # need is the gate of the pipeline stage the controller reaches DRAM through.
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-dwmac
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GMAC main clock
+            - description: First parent clock of the internal mux
+            - description: Second parent clock of the internal mux
+            - description:
+                clock of the pipeline stage inserted in the bus path between
+                the controller and the DRAM. Without it, the controller cannot
+                complete DMA transfers.
+
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: clkin0
+            - const: clkin1
+            - const: pipeline
+
+  # Delay definitions for Meson8b and newer (including T7)
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
+    then:
+      properties:
         amlogic,tx-delay-ns:
           enum: [0, 2, 4, 6]
           default: 2
@@ -106,6 +148,7 @@ allOf:
           contains:
             enum:
               - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
     then:
       properties:
         rx-internal-delay-ps:
@@ -143,6 +186,10 @@ properties:
               - amlogic,meson6-dwmac
               - amlogic,meson8m2-dwmac
           - const: snps,dwmac
+      - items:
+          - const: amlogic,t7-dwmac
+          - const: snps,dwmac-5.10a
+          - const: snps,dwmac
 
   reg:
     items:
-- 
2.56.0

