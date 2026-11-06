Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978224;
	b=sOqH1ElJ3RG8C2DcmknnFC8ZCoOJpycjbacwf4Fp25QehRqzxc9M07fXepCJ5Zl+jC1J
	 IImUNvww6Po1EXKqqTloOKYL9zWHl//dvkqMQ5K7c5GnJh7f16NGR5pKU61cQ6KmnkLtf
	 Oi/v1eYZHCCHGw6ADuJQJbuSBibC//aYoaWBQ61mvRGktHAcvWHJ/58LQYa/A0qzjQwnL
	 pE0ypXN/QX8sM0/pXLvX6QJ9YwccSXOOSm6I5LD7gQbuWAqztL1xXU0uO/TqzH5tEJvJC
	 BLfTIqJg0jtZYiXs5p1SrshRBPQtPCUvRJIUzdxioLtShjqMN3NRsrPy8Sk8tsb5A+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
	b=wTqUNcza6puPj8uqnp9hces/HsA/9MnQ5bm1dj6wvKb6Cdw74xAzIg9smkLjIJ0vZMPP
	 S77Y8QrVB7AQ2Hb6Zk7nS0sKvGawQw+jdlxO2UX7iolvJkdudjmmtuYMdB9fFDuZydJs8
	 3KXsAbQ3mfs/qtdasZSh6WV7Vj+lLBV7xHGr9Xl6gk5FzzOoSq86UZb8m1nYsbX2vvYyI
	 aipnXKIMvAjrApwDDvnI/VgCqSfwxNpzOW6spiH7icByhNwbG/KZ3ZaSvlK8fZBRNP7pa
	 HTzBoB2m2y2oPUqfs3Fb4u0rPzqazBDDozMYq92VnWacPrf99BZ7jhniZQRCrM9D4aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hm57Ipyd;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D201B606D80C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D201B606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hm57Ipyd
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2327418eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978223; x=1794583023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=Hm57Ipyd4zR0uJlvm6dhRylUqkiMorh1ZS7/8CIZIjoXX8W4jWlo5vqp5/4jt/ydkk
         QdnaSgyNWo9/sN8XKK+gMrZJWjv7mm0ReLPBCbwPhKKXSRBomJWJX2ybDOwfKE2jsL7H
         0hyiMTRiYUD/u4oVkNMkMQY1VNevjc6LJcpFos3UhIqI4WVQUnOzO8qd0wmw0mMvYCUt
         ctfNM4AbnSRx9Oczt4ISPdBQCx0OMHEduHduejZq/YeIJRkTPIozhgJPnBHJ6j2kOFr5
         6T6mcZs0HwP7b1+duob7/uJn1O+7ANzgsU8uocJiS2aqejFMnIVJITikaUoSF+beZXCt
         4ukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978223; x=1794583023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=Hm2A+uvr3PnpRgg72v8cVrfkPQAHGRtVsu8bICfSusBjSCOBjuRXDP9mY+QBJjYMyo
         rT3/uOZCUrELGdZe+F+uQ9o5b1UnNdPMIX1tpiK3rGYT86uSzz4eWh4EniD5V5q05qOu
         ZcG9Y8TLgViZrPQmIY9aCFZ9jBPBDiXL/9XsU3PQUmDDCBFasmWIwWRBquxRFlXZDZl/
         549lIDDu+cHJ0AEGDfoZYM9bIUjMIRQOKpVJcHnM3eAYOpdozI+yydCU0+ednDDjMa56
         y2oCDYFyu+SBFkzI1aE+tdPP6UxTH2QzAFxUTn3cg3hP2ckatFU38ZJzDTR0dNKul4ma
         1szQ==
X-Forwarded-Encrypted: i=1; AL+hErGZoztzPP4IF0RJOFwX4VkK+pDwRW7r6T/r+AATAyaoX5PWv3cKXtUxAzLpwfVflbzK0ETteqTIPWriNPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nQ8xgQGo1bc6xqP88TyFDIpEjVbo3iLNtWsv6G3oHKaNRtNMt
	gDFQcIebR45Rn3LSog0zrWPHJlG+vWzi2wrUxZ8tyCNpZc1De/qpHG+D
X-Gm-Gg: AYBFou1UamEPkRY4gW97CJCWHbAcBaFm19QKWk4GVHcNCdkojLA0D5fhQOe8CG4J428
	9zagDLJbxMsMfwK+LraoLqJykE4odX/IlrnvuOCRMaw5ZFgidcejgSZLd3FcVnEnHCkclcVZwqT
	lz406OWoHBi+BaHTwsRecRSBCQHtd2u2ti8Pg2vFQCBMQagsncL0SGlVf4ET2Qm0XLu5wRpXxG2
	tO7p73w9lle21dywlttiF3fchcfy5fUHjY+5Vzm3r+IjRyp9yFnPi/irFnWXhIElaljow1esi35
	GCG9HiODjfwIqbMu5oS1eZBWZ4YBUQpHH94s7xLE6DKmekC6qDIrE9RwbVFa5NuUFjUryM8QdQp
	jQf/yRNbKIPGB5fGzNiVS09hG696g/vW2RDDjJulEpg/wX/zHQqkE8lUo7kNCbGOS6Gg8q/Nwu2
	7VAur1qm3klFTCBREwYBVyAOQYSzpVjxM/P/Dqh3Or0uawC8MdYsnweFv+iB459gHYC8mBc/DGD
	yvZ1DBuDPvZXEcj7fldq/xbKA0bkiy8JsM8P61E1g9tPkFD8uVaynU2on1PcUlpzq2cdVgbAa4u
	xGtHNaNXnkd0fqDz6aD98Niw6G8uzr5itDOnvzRyXFfbSHBPDvRKhjZrzlcs//2anHHm6hKTpzZ
	dCWly+qM=
X-Received: by 2002:a05:7301:d81c:b0:36a:2382:7dab with SMTP id 5a478bee46e88-36f75a2b011mr4038390eec.6.1793978222959;
        Fri, 06 Nov 2026 07:17:02 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:17:02 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:42 +0000
Subject: [PATCH v14 7/8] dt-bindings: cpufreq: qcom-hw: Document SM7250
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
Message-Id: <20261106-sm7250-v14-7-7d167e993f9c@gmail.com>
References: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
In-Reply-To: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Sreeshankar K <sreeshankar0910@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=tYOW7ZwAVWXKL25nNQ4vkjon/atY4Dhfdawj8MhM0Nc=;
 b=pBWXHjOFV8yy/kVfddEOkI1z2Vr9iOnPMtTW0sfnFDwT+AdWHZ8KZUKMMqogu35cKmAlw7fOZ
 Tzds03Lu9S/BDhGPFs7OOqoZ0Ml+RHtklhdEbV5ZxocuZ/BaH/Yzk/7
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
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

