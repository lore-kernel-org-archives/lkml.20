Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778420;
	b=vUSvPJF/G5DxRinKoHRvTPeLqy7oUFWzAFEtX8AwaEziWPcQHDHhB/XUiBxYrMCrK64i
	 ZjAgNNUI4hCCXG8Duz9pIUEObHAK4uUkyVU0nGqJXCrT6+9ZCx46l06c+KIc9OxIaCJxT
	 TWKSLkj6GUQSKfO6bt5NOf8RgDre8FGroQmvLZNjeWnGWQbB69idjOTzKsy4QqRTBG90e
	 rodsHydZIoLHm+iMND+RNStv84nGw6Rl0EYpR63OHPQC2h7aSrC6V5wOUfp2fli4OnXOi
	 avE5koIEhVDyZaUvBFaBx8a9dgx2s0SBJnwRUkaAlwBPjJEvX4GPsGNVwha3U1kasrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
	b=lDw5TlVEpaZ4Z98IbVGPjiXwHQ5lI4U2XjR1v2l6U1v8SaLS/EYHu3HzsayyB7r5T+9L
	 S9yZxyQz1qYMDxPz7gwWGoXJVxquh4X/yrzTLWaLRcq6hcSufI2f+XvmV+qAZlmZj2S9Z
	 leNEeB+dubzv3RVjp+WqqQfm1GS5en47tRz2BDYK4yiA3theKx14dDLbunKx1yWqaty9j
	 nS2vO7Tt/YvrF7mRKrxvoZy3AsgBpVbi66HiDHCYrAaJdDZ3fDtvDQqXoAt5btK8StYPE
	 /rhB42Yfv1493SqyM469XpIeESYypcf+hX6MGfHLA1wS8XwtdCvOm+JvVDhDjDQQdJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKoYC0Yr;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7263606D814
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7263606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKoYC0Yr
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36cad25b8b0so556132eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778419; x=1794383219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
        b=jKoYC0YrzN9VC1u9oq90fiiO2uDEAFoopwC5u/qAKYEgn3ytKayoWaV656V4el59KV
         RxmBVUsaO4YpnBBMPc7Wq5/z9Bdzd924jqwio3tKwn4y33OTEWoyqSyr5RyF303cgIcF
         H9dulUwkrVq/a0E0x6cbEemNYVggGVPs0EAFkqaY9DjIfhQF+Uj5DjIYcIh83FhYnbX2
         +Du8knaOHX6vQtFGpekj6/kSlwty8VrFjXTPPtmeD7DbunqHfQCNr+BstZO9nDzMmITB
         m0EtAvhzfY5zVt7+QMIFpO0PZWHuZyZkeHjDTa6Y3Dh/vc6Z1rQTUiyUef/M3AgXddaI
         4KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778419; x=1794383219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
        b=COMxkAR2fv0gFJb/FJiMMXDCtEd/JSvJaIgoXoCTonwZWCKMMe5gXHfRxLBBcad2Oz
         9K/4VnR4hKdsoLWi/s9dTJnioCiJZJAoxeBbyOvuk7dG9nioU6ACoelyYuOmMYZUKFC6
         7wzNfRRsFsoCwrtKuwobwPVrG/wO5wC5WaITG/4fB845y6tDjS9NvEm0ke5t8Sv2b6Uw
         +RRpUeVrmEjZKfimIjh56b2CuACz40PR+yn0BkLUP4ot69nZdb+5fmXk4bqlOKJmQt+m
         47Ihsm7td6+LAm9ldZjna2U9QNfifZdDcqCYmpsI4HNKUKIlpxRLfJH8K7zaRH4Sc5ZR
         hDnQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4w/XlimIzY4v1RG3P7yavjKAAoUXdzAm6vPECrcBDce0Wv9TyeybmEkRFV2RIaVDol2tXdZpvpxTsfrM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ttRtjq7bhDa0N7Mt76j7U2ZD+tii6Y0W/Z6FCeIuBVHZVCiRw
	0mRXom927Kt7TaAHNrw9N7BOIibyJ2DNxKD6/bNUWem/3GXu8PodP5CVbo6+Qw==
X-Gm-Gg: AYBFou2X4+Ot7PrfvHHuayPKG/758UR29a8+gZhsZikDMtT+iVhuwC1eIfbr/rDKcZe
	v07osI5H3GsoKMO/zzkOzLbpoUY3MK1jxr8DGwvaxut0L1CQxaMo29h6wzP/4pNhjUCeju1j4Ar
	zqE3Bel32CIiIBneG09wkvBB5aTjRB7tADTf9Luz6zFjbgHwBayzMHaS3JJmR4XMmXR9elaqp54
	cEJMWze8ZQxhn1XI69sH6oVRFh45XaCnsBPHlhBOUSJnOCwyYlxqumCG7Pmp/FmiMCDSZSW91+x
	/TaD7Ulc6Ss4hsNSQ2vwFHEAmY0eQZPslmSOD+yu/8wXa/pDj1hWkypyrPvzkViYfyInKI/PEzJ
	OW0kNHp/wodMfWZeZGWt6/H4sk049F3rSaeNBoi2r4dvrVmW5fehyvMMJe9SNXZvFXPnAeBC2B3
	8mgF3N08bW3IgDxRvjPo6xX97cbxaDtA4BFqbiXETTJcfgcKHzAiE0EyQkBUszQ5TcgMAE+Ahfx
	YGWsQlCvxz9sXAjKeSHgPBJ+WErr+HkynEKK4/jzB25wGs5EGF9E1AUxulq9eOA7Ko1w8fMghm1
	Gpd4S4LrCHf+vakbdGY5jFuB00wLHzk/Nz7G21OcewayB724onfwo9W3NkpCR9BX3Ox4rJEFHCa
	KJayuIA==
X-Received: by 2002:a05:693c:880d:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-36a4241a810mr24748355eec.29.1793778418484;
        Tue, 03 Nov 2026 23:46:58 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.204.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm4566016eec.8.2026.11.03.23.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:46:58 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 07:46:07 +0000
Subject: [PATCH v12 4/6] dt-bindings: cpufreq: qcom-hw: Document SM7250
 cpufreq hardware
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
Message-Id: <20261104-master-v12-4-57fbe9eef978@gmail.com>
References: <20261104-master-v12-0-57fbe9eef978@gmail.com>
In-Reply-To: <20261104-master-v12-0-57fbe9eef978@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793778372; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=C3ow+chGT1NNdSip5xA3Ydc5tLXGcOB+9coWbmZJeQY=;
 b=WKZd2fnmwMJZhaG92c4eTNHvDKdlRwAx2VMbZDZotKHNrMZIh4MVUi10aoDcVp/SN2N/9Gfpx
 TK983WV69hDAxRUjkumKjpFlxJY8oJfvTjwndQDKjm1+IJssrvs3fZc
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..f8cdb652f 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
@@ -201,6 +202,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
     then:
       properties:

-- 
2.43.0

