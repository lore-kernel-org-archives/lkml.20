Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D46126C02
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592039; cv=none; b=MMHuCa+fNPTvXfRPN1srO1B1FgrngagAhKlyBaaZIfLitV6CXSMpfDOlNQXAsqO1aw9rmNBFQMQsPlffjBOnzTOR8PGd+wMrLVE+dmnPvDEjcbyFfqnVNUT3YSBTbHFt3IQ2A0Zp1hnaij7jCtMBSOjYMQ6jZG4Idu/4xfrUkJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592039; c=relaxed/simple;
	bh=JzPmVao8FK9SYW6EqLoAZ+WBysafs2v13tUyYWLjmGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZL9CTtorO489k/PGMJ5lqPbb6qcoj8jLeWfVHGRD7YeWNaNDLJz4DkUykCVKgDqVahRvIMbnGedpahOyeYeXOOMcjL1DJoWp2bZ8PcXgugHNU9P275i1b+KSl4KxYMRDIC5G6jAo2ZtD1RpQThocxrh/wUK4Zt05gHlQV02uQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McOHYnrV; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McOHYnrV"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48442ea8f59so30895f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789592009; x=1790196809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWcBC68WNKLZwVwv+eWu33G6o/TkwBMc1Uo2TtiwMQM=;
        b=McOHYnrVZSHoRbI7jUEh4KuKYRzELH6uFkRR1CmiXqeV22lEWGnqxopJNtidgjNW54
         iku27ARGI+xcXGJqXjzz/T0s/0+7wi/p5z73zHuwU2d+Vu1aNSagm/oKYmLiby2dRaMW
         aHDTKIDwk8Htt2G6bfq4VHElO5SRHcdDqz2ADTHjSzfNdoAEyi3iQ1GNG32EwSF9YxcU
         25W9Ecv2CnEPqK36upzazTX5hn0xi95EDKpWfYuEZGoBkY9A/PpnjoRrp1jJDAJ2WhP7
         eM1qXd8seIbjrBw5Kee/cp4EO2Fc0B9feju3L1bqiAEqvnEiwvN/oehQL6gGyr/NqZzS
         9yTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592009; x=1790196809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWcBC68WNKLZwVwv+eWu33G6o/TkwBMc1Uo2TtiwMQM=;
        b=kganKeTSfz7N8I0bxoXXLch2XvOEul3D19sLzWN2kc0lXllsHElzUokWmE7AdyPHoQ
         lAzsQX1qucMox6d/+HlFFqyd6mZE/Ys6Ch6IE6br54tKT17yr5i8xR9XC9cVsH3Wozb4
         p0cecjwTu432NGaB3DFezB0RBcUmoyKE4iFQet967CevSHw88q0pxpz0chSW5af2hEIM
         G8Mgir23qzYaBWWYSxJiaEE+yu86FznVtzKRE8cccDzjhjXmiNdRmMKjkdBMP0v9Tgzr
         xoNNWDK7Y23PlsLHTjXkzPVSeTu5X4tgWPPnHcsoTa9VQJmiA9XJxqCe9Rd5IoJpyNhr
         693A==
X-Forwarded-Encrypted: i=1; AKwUvByXrPpwqdlVmjGT60sdVs4VzE7zMSOINPPvL7XLX8IyghM35aWSqmzSCZB0C7TsvFd5GDRkrqB/VJUHt6w=@vger.kernel.org
X-Gm-Message-State: AFuF++mPy6PM21YwoggfBxs6ngSheAQu9UpeZFp2d6DPHSAZf/tB+vek
	qOAQ3/e/z0z/7nbA/tvrJXbNEqi8UVAOJCp4vda/iYj+2Rq3drVAkERL
X-Gm-Gg: AYBFou3dv3tin47QIMQXpaN0fPU1Onq9OnT4SDtDHZgWptuKKTqD06XRb5LMGACBRts
	yKso7j8/G/i77W/NR4SsBMRLnTyXV1rwuqo3b8kH1QLq5KgVRYvUxK/GOIRjZIdLihQmxd9CDGN
	pcPtv/fm4MYHU8ADccVUQm6uI788+AxNuia+hhGMrjifBUefcV0flCkEFiP6Ag364+tyNietpBc
	f+uqa9LLVzQzEtZ4YFjbE6fSw2+kJZHQRULWxCjniIVP8TebaRRG81iVwq6B5xHCX8oxbQsZ9vq
	GKx2izGfYBi2dn0X+OunE1GT+MLuu1WKBxv+nIeWAlruijb8lyMpXHzCCUc1Y2fKfJQVsdhcVSh
	fKvyYE8XmGQ9OakSB2pOYnGco0HNU7U8hbJ8HOB2L/S6M4PGhhIQKxZ+akzEQqX/WO1L/eVR3a/
	6j8SF2zVYLwu0tnXOSodQL1+yz7LY6WGudtdN3ZllkRdywIH7SVfcAim9MfEUkEZN+cC89pg==
X-Received: by 2002:a05:6000:2612:b0:485:8226:c696 with SMTP id ffacd0b85a97d-48713c59e2bmr1379935f8f.21.1789592008945;
        Wed, 16 Sep 2026 13:53:28 -0700 (PDT)
Received: from antoniarch ([78.210.41.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7678sm11086166f8f.2.2026.09.16.13.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:53:28 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/9] dt-bindings: rtc: abx80x: document ABX81X RTCs
Date: Wed, 16 Sep 2026 22:51:30 +0200
Message-ID: <20260916205138.16771-2-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916205138.16771-1-apokusinski01@gmail.com>
References: <20260916205138.16771-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Abracon AB0815 and AB1815 are RTC modules with SPI interface.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 .../bindings/rtc/abracon,abx80x.yaml           | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml b/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
index 355b0598411a..d105570bcd5a 100644
--- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
+++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/rtc/abracon,abx80x.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Abracon ABX80X I2C ultra low power RTC/Alarm chip
+title: Abracon ABX80X (I2C) and ABX81X (SPI) ultra low power RTC/Alarm chips
 
 maintainers:
   - linux-rtc@vger.kernel.org
@@ -21,10 +21,12 @@ properties:
       - abracon,ab0803
       - abracon,ab0804
       - abracon,ab0805
+      - abracon,ab0815
       - abracon,ab1801
       - abracon,ab1803
       - abracon,ab1804
       - abracon,ab1805
+      - abracon,ab1815
       - microcrystal,rv1805
 
   reg:
@@ -61,6 +63,7 @@ required:
   - reg
 
 allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
   - $ref: rtc.yaml#
   - if:
       properties:
@@ -73,6 +76,8 @@ allOf:
                 - abracon,ab1804
                 - abracon,ab0805
                 - abracon,ab1805
+                - abracon,ab0815
+                - abracon,ab1815
     then:
       properties:
         abracon,tc-diode: false
@@ -96,3 +101,14 @@ examples:
             interrupts = <44 IRQ_TYPE_EDGE_FALLING>;
         };
     };
+
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@0 {
+            compatible = "abracon,ab1815";
+            reg = <0>;
+        };
+    };
-- 
2.55.0

