Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061E2474261
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253144; cv=none; b=S906ujjRGwb3cHQupifhUYhG5XocNgCYIyxq1hFLIFTbY7aMGqp2G5c9O4UZr3Tpe8jM6I8gcEvO40GL1GXqeIxMCSPWS9EH6FoctjcjgPb1J/sZSVD1W4u5fzpTw5REhl+O4ndo4HdWEAWY6fS4uEBjzR6q7K+LkA8ccB/2xsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253144; c=relaxed/simple;
	bh=pMEbDuBRkVjTzutAX6WB4Uye9UNziOebWD94UCX5+eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p6IIesMmIoUYpFgwkexfDjOaBuHcnGRiqmVBd/Og4Km90ryBkoHgIlyW1jtNanr1L/9zbIL4DkDN49xI2jKXiMLIRzWS36TCQvOlZIcrHHJXWn0YqpiAen5emho0+gFoicEgeHJGv93Ke96TEBlyMfKBmHLdFXsrgKoAVp23UpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qkYkGnc6; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qkYkGnc6"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c25420fe973so107295966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788253141; x=1788857941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GOwg1HZyXLTOiSDtndwH6Webw2VVu0gCNVdDiokm96s=;
        b=qkYkGnc6RFOlbPN157AKjXuhGGXSD4QaWrBqPOmGY471JMGRGxwU60hogJnYMTmsJL
         E/XKDGNZEEHsZs7e92eMZuvPUDOnjmLoAv7VVWxuhRWUaGcZ4R+vL6Q2WCpopD0tgQin
         Gz6G7f3L/wjgnE2Oyvzv17zINVb/Do2gVPiSUqnImG7pmozgsq6Elc0m2z7yHmbJQStS
         0UQE03EszSLRi59cqgbuzY/IWemCDw+KL5VrgtN7ybMxogJjyU031g+P1XXDyHgZpWiR
         uImipb8Gs0tsWl+Rdz45iOLg+h4H0lTQXPvCowgpcUfRRL3hNaEPdTH9wfY63+s+0buI
         c/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253141; x=1788857941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOwg1HZyXLTOiSDtndwH6Webw2VVu0gCNVdDiokm96s=;
        b=GT53SyHDevUVdXPaHUAf6M0W2SQJx3fZ4rmWtzRvOHcc+FVZ0KmdI3Q61OhXZXu9zk
         5d7n6FVEX/5T/aeM+z7UjrWkpeIVESQ6/5scld4aP9vvVFOorZ5xlda5BnNHxCJsNI67
         d+9dn42Ev2bvdcfrXebb6TN8TMyfuAI7mDc6i5CFInPhnpUFFQTFZLi6dCD6LuGFgpQe
         ooY1TeHyH5mpzkHX/X9XxL9enMuqnLkIpImcW57MM8IwxWz6+L2jWXyfVg88amFgK5bd
         YKw8jUVAtyau/vC04YF8HwsMk/K842jFcU6MwqJJtc3cwuJ+xYdv9OTQ9fa8qr5UZgbh
         vGBw==
X-Forwarded-Encrypted: i=1; AHgh+RrqyrbGZ4ENYJXQPdtsjJEfdxMa3nf1sBPxJ0xEuTVV9b7Ut015qTJouYNE2sGr5La5Ea9KnA9BdkwyTe8=@vger.kernel.org
X-Gm-Message-State: AFuF++kTsvxFoFAERUxrKqNbdV4gYrmZZ1eWxfPxiGuQJCpC3nFUbyDT
	j0tp88Hjh1A1eerxOol/s+GWVF3xCVwcq7rNT06Oa7hMlQgacAwH1MO6vApGobqR/Pw=
X-Gm-Gg: AR+sD12zfNsQ40odh0J8+Pvpvvt0gjVCezMMXGLUKbpdjUp8+O0CzsuZUCFSbGEZa5j
	v1lm11WbSrcsAF80l59hAb7NnOasBJeVZ4B2Ox2JF0Sefd+Q1mU6teYp9o1TIYOSkqjmW/CwRq8
	E+Y0GwR0Ze8dQqvx9EmCFudd4XB767Fcq5JIRdm2nI7AqKn/nc5wyHkvTHNDao1BDIo2uG17fLz
	lnWaA61m0/BDHDKvLdeBtoGGEUx/ELG2uBZL0btgyHkEuHHQrxoZXCfx07RkcKaphHEpXFqhczv
	7wOurLY4RYRj8kqb/Rk61arz0ddAswPX/od+iFGvGHf1AgZu6cKYl6N9Sr1xJxLr2F1w7OPcP9u
	3u4MPICfCzx/W/vrd1xw3UAwgJY/la1dwmIIPHe8Jt6sbr0Gns5IykrRKUz7IJilsKnzpjqOQJB
	g7FYexUY3uMeYwqmcPE6rU4dYcEWMjoarlXct6VfMKrGJMqtQ/GGEGA7sfPgnxuRRPuqtfyY41h
	JsIsKE7DMPYc21FMnMxRdnQaye+fDu/B6pG857RtTE=
X-Received: by 2002:a17:907:1c09:b0:c21:6f8c:2335 with SMTP id a640c23a62f3a-c2557465a51mr2059911166b.16.1788253141098;
        Tue, 01 Sep 2026 01:59:01 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2564e314a1sm511942566b.42.2026.09.01.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:59:00 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 01 Sep 2026 10:58:56 +0200
Subject: [PATCH 1/4] regulator: dt-bindings: qcom,rpmh: Add supply names
 for PM6350
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fp4-regulator-supply-v1-1-68288ab70aee@fairphone.com>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
In-Reply-To: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788253139; l=1244;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=pMEbDuBRkVjTzutAX6WB4Uye9UNziOebWD94UCX5+eM=;
 b=b+VJg5THX2bwt/KVwFapq/kFH+wKEmslAws6Lc8BPKglYjojvJ9XS5dXePXyG19KNzlNs4P0i
 imNTyWOu/KzA08qNyb6QtFe5NCQqwpGUnDJ1ALyDd3zp7Q9XphBFPbb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The supply names for the PM6350 regulators were skipped during initial
bringup. Document them now.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/regulator/qcom,rpmh-regulator.yaml          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index eed2ce7fa861..9115885e7985 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -187,6 +187,22 @@ allOf:
       patternProperties:
         "^vdd-s[1-8]-supply$": true
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm6350-rpmh-regulators
+    then:
+      properties:
+        vdd-l2-l5-l7-supply: true
+        vdd-l3-l6-l8-l9-l10-supply: true
+        vdd-l12-l14-supply: true
+        vdd-l15-l19-l22-supply: true
+        vdd-l18-l20-l21-supply: true
+      patternProperties:
+        "^vdd-l([14]|1[1367])-supply$": true
+        "^vdd-s[1-6]-supply$": true
+
   - if:
       properties:
         compatible:

-- 
2.55.0

