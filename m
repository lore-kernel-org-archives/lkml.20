Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810874;
	b=Q4kDjbHlaThzpF6OMHpXu8JTkEd+bX+mTJOpLzJO9zFfLAmLwWMr5YSvC2gcisPmvFde
	 R6WPJ16b9zGurJy57chfLBcErFqxNfg6MuywqK5+Djg+US5/CbQSZM5NEupGWRcsnhp2H
	 UQ/cXtQ/633joIY6V97zedd78Y9WnedZrR4ad+q+mtglfCMXhbqYW7yi5CxVeVD4ubAsv
	 r+IIsgYRIsH3KNzQph8WLZIXPrNz4KHlDwbr4H9vSFXxMjizzYMhNIgwtCMqe9JYPZwXc
	 QcER8wQYKjUeWF9ZPbl2RuIukr5I5mhLPfEM3UOMfkt32S+S39NTaq1d/CintTq+8gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
	b=jgNeyATV+p79WZ2c5gm/ORrD1QXit3L4JODAHCAkZG00fmaIqyzFKoir6Ao/D7NbNV3l
	 JtctJS3kxZ13/P+8UoUXkxsRJ59XVTlRddowdUtlVzZR4gYLkBj/LVGltu7de6NLAo2cs
	 qXirl/K5QYvaIRCL/VJp9OqExjmnbTIxtoOcWkdMxj4+y0OzPEGcjofMC1dvp30ZCiTjI
	 kfcmFh4555PxdMzNbKr56swkT6UCOi98eq7JUydGxBY9GuMXnk7DojNc+FP0AyWgxYvi0
	 TP4d2SDaDf0TP6VAigfhX5VB3q2Y15Z7l82swFMt2iT4BM2llSZURzNUzL+e24k7GTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ONOs4D47;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8A9606D820
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C8A9606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ONOs4D47
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so973829c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810874; x=1794415674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
        b=ONOs4D47G6dqE/Qb40F45Otu1UBvZCRCmCPEKocfpcbZqCvSNlBXHBerYhItVEIbmg
         Y7ZdBRreRAhQHcdUZammYaeLXW+7wCAsiMF5J0x3HDr8EhjSabCJsMdggUOVB8Haxe+p
         0I/cAqbuJ8N/5vS1lyvYAwDWXbQSP37AmbbAY+zjtnhCIu2M8IRYL2UdBwJlDC1junfb
         145qvg9naBCNpwwSGwnym+e9D5Q6yQltI+mH2d8EaSN/8kKa6arGcWXs9ogEmghvV/7a
         IPH6wseh/tHEGdw4uXSTm+9Qwu4t28Z+HtZ93qbIyJ7jua1SSc0KjmCL7sz4BhncdqjI
         MDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810874; x=1794415674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
        b=I7EhFsv+7EXonc1i6ObKwswbwC5HUfz5ywxRDL1zqbKIFar+Yp8E5UMAZg/+OQ4+n9
         QfXqREF5Z21PwD+wLNR2vyyKmDrT1gMkeGQDVbrXCioHr2kqS7+kUFmBiPQ9eLk2OQKF
         am0ox6ixvXJSulgwGj4a2cqtrw6VbiOZWIHEWsqmSUdY8SsZKNvd/iNHtVfgblHJxG3N
         QmHBfAAJhkkxr0W9BdlOYRJ2jJhWbixpVe1mydkO9wVy4J3rIykcUlzr6k32mV2Cu4Xz
         Ue7QiDZ6ZLnCUqc6j6vdDj3ah5Rn7yitq2eSOZZ9I6E+HILiSSdO3d8Uoi6KCjSW3A72
         R6pA==
X-Forwarded-Encrypted: i=1; AKwUvBxC4AZ4/W7kd32gG2/PwYdhtKe54OO85e0kUCZ67AFcKB4XgxNysinxZUPinG5sitoSNk+R3oSPWUlUdR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HGdwibc1HtxJkONVE3hjZuW7UrIP45xLHLhlvetWni21vx6J6
	fEanQo734Wwb/X/rI543JpLVRYtkfdsWTOKPoQsCkj2O5apX6K31It8d
X-Gm-Gg: AYBFou2NAMx7T8JuBAESXYW+sFQK41JxeI6XHpOwAPC7jTt6PC8sNpOy7VzdeTOiZ7X
	D+xvpvt3yxePPyBo0glqTkXNG0oAJFRJkoMsHl8CAlNOY9NO6yiFmQSEhtHdYyGtNg6PltWgoki
	jpsQqtdNEskRTy9r6L65Ys5jSJ7Jh6HGEaOAgoFPxl0rL6KVfaM5wTL03EhKU/09kLTRFKZGVUs
	Jk8fRna1RN/U27hh59QPNPcgw1GJuLY4eT8VW78Wip2FBtEx8+tPaYKQ/M9XJ6ZegboHXw4zZQl
	/GpJ8e8PpZWE/keZgnYcw5m/D9UECrW+56Ey8PT8QPWohKbcYvJTQdxEulB73eexktQ5RbPIUk1
	OXezJ1D26Yg2jNEBYSoH7tiuYyFJQ+m9E4pjTEkYnDgkrlxm5jkFIOHCry+pY0To1I1eXGKhXJ2
	DqSIUbsKNIxSLvbvdAM8J62t7w1s5RhH45LfILkoUylQli5zZFszQmG1L5+bmGqL5D1/eY1FwGa
	Suzmf7uWThE+RSC2eiev+Up84Kx2VCTepvxWXRZ1eD9viGjZtdcduc/L8Th+L3wBzfD1XL+M6wd
	UvN4UrE0gJqZoxh/lnXQWLJB2UHGse62hUi4LOT9HrbkbyL2VbV9OsYffGbyKu/luHaS3ewnOiO
	Gujldm5s=
X-Received: by 2002:a05:7022:7e0c:b0:147:a685:9125 with SMTP id a92af1059eb24-1ac574556abmr25831860c88.2.1793810873589;
        Wed, 04 Nov 2026 08:47:53 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:47:52 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 16:46:39 +0000
Subject: [PATCH v13 7/8] dt-bindings: cpufreq: qcom-hw: Document SM7250
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
Message-Id: <20261104-master-v13-7-355b65c6f764@gmail.com>
References: <20261104-master-v13-0-355b65c6f764@gmail.com>
In-Reply-To: <20261104-master-v13-0-355b65c6f764@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=C3ow+chGT1NNdSip5xA3Ydc5tLXGcOB+9coWbmZJeQY=;
 b=0gSOTjAaT57IzIzDs2ys8gXMuFwlQSYBUyrknvzdEMuCtxzuwu4EGZ2k7kNLvFUEfhKoPMpX7
 w7QqxqnrPSgCDIYxCy4duxqgXgLFgE4j4KOPpGEsEqWdkLXATzLOJPl
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

