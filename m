Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595124;
	b=XQl6iaRcsjP7HSebZs1Ww+VSrSW9CohmgQpgF7siNiqZb3TVMUpU/VA7+BHGmTDFLsGV
	 xNeC9gUNofUAD1afeGHUamJeoI66nv++mQP8Dz3CEKi6zQ4IgFPjswsndK68kJ3hXB6LK
	 DZmCT3FhlrKkwf6n7dIXEJdTfRdFAVAgH2tIq45e/Tsv+E8bw/Zst/ASImU2jzxd2WfcL
	 m/ddvY60eAKQv9ZKzyEXMcSVz9lwzLvuSjltj07hdyevtUJ5SNczAiStgxdOuZCjoKjFd
	 69SVzLtmyH/zoVAJgoNq38tYA0euPARPvlJ0SdxBFDWrCuNibgGtvY3+Iu/HwkSBFWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zf2ueSN0brUmLpX9oxEjZ4Lyidgx3hF8zuXYpXrD3fw=;
	b=mYJQJXhnOZRYz0gbjByUr5DQHCePy4la3bDS+maRLYL1PCeKU/dJO58Mfn1NdQ/KLQsp
	 7lL93Wd5l/MWiRo6DkyWrQZ87m0DgwGMg6EbDRcKKoYPtbObSkbmgoWU/ed2JWBLh+kC6
	 SfkLJUBfTBZmbnNXcpMykNeQAd3BTjQwqauh2cmOhyeJxEln106FWtopECmn1bvajUZ/P
	 bRB7xcmHa2q4xvDtHIlm7415geSJI+0v2ram8w/LkJYsxLDeFdaeZNxaIDS1dptzjahei
	 aZGtoqcEa2nqsCyH1PjdJje+gtb85anlR2qiWskqgQKcJaYvnS6uQqBXWh8HbjSNfxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="Msh9aI4/";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49E5606CCA1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D49E5606CCA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Msh9aI4/
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so663605f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595122; x=1795199922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zf2ueSN0brUmLpX9oxEjZ4Lyidgx3hF8zuXYpXrD3fw=;
        b=Msh9aI4/HOayHoSMiNbjIa8+/U22qq+eRXVL42dWMkCkpcOotQBzssFMMdtIrGJuGX
         MrWd4Y/i8ebfuMGVe/ZDvUTsMyUasyUD7nogrpOTVNfLP5yon7t3kXDm05DcWBN7yZoh
         MPC2lCo+yF8OxM9qFiEZvAsp/mm13XsXHb9QKogt3E8+stImcPqdNIsWTNKjg73gt9c/
         ROOk2ONhGxjVkpTdfZSC3p3oJ5Rz6c+akL5RAIcxZVlDLSGwbaG42CK7qb2VjHKlVa2A
         AJR8mWPx5p+05aIVDp2sel0UIZE2W5fUtKJ3J3xnfZkwSuLyhUNia3yB6i65kov2Kmgw
         U82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595122; x=1795199922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zf2ueSN0brUmLpX9oxEjZ4Lyidgx3hF8zuXYpXrD3fw=;
        b=pYlRaANGgoEeKsMPQAXDuiyG3aYXUA/TWzJZwhpXU5B3nIWsk09EOQ44tfcMXlAGE2
         N4NljvQ8ahA2DJNnCPowbMZ/xLXapsI7W3JLfcsorv/8++Ft8cDij+aib1k3qyXTQO2I
         RzM1N0FX2O8SfxEj27xDeMFl52USGSshoVetqldnWItDGjplbz022PbNBWB545mhBDAS
         KnqKc/72xUhWkwoTBkbT5GBoOl5t/NBtu20QxWLQlywZKwG083mVvFNjxP2uemFh30k6
         v5vT+C9pzMhsnFJoGx7QlDEIgCXfZs2qz+IpH6N0yP20IAngtanNOMkzATTrmiLrfK6e
         TZdw==
X-Forwarded-Encrypted: i=1; AL+hErFS60Ap99PBK037c/dWdS8xKFzPjxnTciaz3E77zZIvO/Rs2y6quypyBwUZLiMQ1vd+pMWFwuI6s5BVplA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dcKYrUth8NBvYM79HB9EhnShgEiMS9a/52aqiGfE04tR7L1lE
	hTTxNbLOPy3AminwMzNPlXxeE6VsW9ScdOEGFdb9xNW0OMOkp6hXH4wHMBHzbliTSHY=
X-Gm-Gg: AYBFou1eiPmcvLcYwhlGCqi8zA+0bD1yEWqiC3K/6DAvR1vf0kcgbgWFjSozklEjPAU
	exM9O1QpxECzDc1OSz7UJjDHJyMvR3rxVpwbptL8ug6vkNeFLBqGdUcZ4gYFwG7RoEO1Ba7Et8s
	bEQV1fevo9k3/J9B7rhLC06FmuQvTdSd6/3uqfYPmdiiP/kU94D9OrNaSnJxE4KsJO4fJXKEEfk
	tn+Ii3ZtBFxTnCfXnFNbNUDb2v85alehp1dV+uJE/9fKXtM6jzPGbj/d6UVpoIU5mEwDS4X+AZf
	ZGGZ5KqGRnw3ieH6TDFGR61kLVcvf0akoB+iBjGI2VQUo6O9UzIVO+u9gaTM1Wzk44PsU1zDwX5
	TkhY+YJXLsVzJwxHRBq3vcI4eVMEAn2458AO7ue6abMY3ytayN6hIMVjHapyD4NQUP5sKJ0l6kA
	QDMQoaEs0EOUpKJzR9V1gMrx7kuYMMNT0rGXcyHTmcnk3hgoJXuKArn47ytQ411DXZlvqb6GAlV
	Rr9xu9ludrePPP/LWGtPU4iK8JkWKht+v/+1RaIlk8/mGAk7/g00OwKwrAUsbBa4MQmn1rCRsS0
	DXtdRCtAgFLmx4S1KIpROAZupcx/FWM2lvU35HE6ZR1R
X-Received: by 2002:a05:6000:65b:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-49c740bc18cmr6379979f8f.39.1794595122113;
        Fri, 13 Nov 2026 10:38:42 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:20 +0100
Subject: [PATCH RFC 06/23] ASoC: dt-bindings: qcom,lpass-*-macro: document
 less clock when ADSP is not used
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-topic-sm8650-el2-v1-6-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5113;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=anakJKqhStxTQEwPnhjGfobE0ulRfpcmSgr3Fb4aTUc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kgeOjyO3IS2De8UB9Wi45k0n8x116tg+Zpcatm
 hwhPBRmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZIAAKCRB33NvayMhJ0dH/D/
 9JjSfFNr6WKB/Er9I6I+r/z4sqML9qRHVR/OvjBf8w3RtGxVCKHsawU9zrtyyyUmjRfmIzflEfOOGR
 vdCspXhmOK+dU60mkMJWeVIwGqBLo/SLMa2DgOxSUt5NzWe9/uxcKDU0+l5F4JQ6oADhpuaKgcNmO1
 isSKVZabEpQ3NOwpAC/lSErMU6XMqJ3Yi1vCiUC2PNobOhurhDUpmer3S2P/GVTByixkk+/bko8unA
 Z8tDcTR577nnUHUmR32gWAYPatwTa7BpE0nELVoHXv61Qtx2FX2l+I8xPEywBDIkP1DK3zhTVxAf/5
 I24n8CkTS7lyryvYqgFQNCMQa14NQeskfvmMU2u5BLk0NAgqBDT4R5b4JosdBDFRivSZsj+jP/2kDA
 x8E9BR+YuWXcbInU7/FE2K2v9Daz2WzelOyDMf4d7OAYZxCp2WowsdzQF4kbANerAPrrGdBeZbLSHA
 uIzPUkCWa+kQOFZ99d68HMHN1FExdlSuB5DfZHUm4xF1luOZbEEflnmBIalrgjUw0K0BrhGNxL8NL4
 Gy1fmSnYM/p6kZ9gOtZ7QOKqTr8XfxsnSRmi/R3Nhj4paVlqvI/hUYOJ+NtDib6ZgzrunKrog2iWu6
 7ejfFHTR9NPQE1APUrRVOBXQ8tMrCi78br7eohdiqikIemtp86xohwC/P43Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On platforms where the ADSP is not used and the RX/TX/VA/WSA macros
are entirely handled by the OS, the macros blocks requires a different
set of clocks and power-domains to replace the clocks exposed by the
ADSP firmware interface.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml         | 17 +++++++++++------
 .../bindings/sound/qcom,lpass-tx-macro.yaml         | 20 ++++++++++++--------
 .../bindings/sound/qcom,lpass-va-macro.yaml         | 13 ++++++++-----
 .../bindings/sound/qcom,lpass-wsa-macro.yaml        | 21 +++++++++++++--------
 4 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6e34..b76c5dfc0462 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -129,14 +129,19 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 3
           maxItems: 4
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
-            - const: fsgen
+          oneOf:
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: macro
+                - const: dcodec
+                - const: fsgen
+            - items:   # for ADSP bypass based platforms
+                - const: mclk
+                - const: macro
+                - const: fsgen
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index d8682ff2e82c..bb150baf3ec9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -38,11 +38,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 3
+    minItems: 2
     maxItems: 5
 
   clock-names:
-    minItems: 3
+    minItems: 2
     maxItems: 5
 
   clock-output-names:
@@ -133,14 +133,18 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 2
           maxItems: 4
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
-            - const: fsgen
+          oneOf:
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: macro
+                - const: dcodec
+                - const: fsgen
+            - items:   # for ADSP bypass based platforms
+                - const: mclk
+                - const: fsgen
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index aea31fbdad37..bae257447e25 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -160,13 +160,16 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 3
+          minItems: 1
           maxItems: 3
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
+          oneOf:
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: macro
+                - const: dcodec
+            - items:   # for ADSP bypass based platforms
+                - const: mclk
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 9fedd80532e2..2ed35d812790 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -38,11 +38,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 4
+    minItems: 3
     maxItems: 6
 
   clock-names:
-    minItems: 4
+    minItems: 3
     maxItems: 6
 
   clock-output-names:
@@ -93,14 +93,19 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 3
           maxItems: 4
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
-            - const: fsgen
+          oneOf:
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: macro
+                - const: dcodec
+                - const: fsgen
+            - items:   # for ADSP bypass based platforms
+                - const: mclk
+                - const: macro
+                - const: fsgen
 
 unevaluatedProperties: false
 

-- 
2.34.1

