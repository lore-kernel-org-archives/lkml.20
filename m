Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978214;
	b=tAPXKeZ3vn4aXZ5tFwIvZSOTfWq4I/0Uk44mIc8Ayo7x4MxH5iwpx2/zpZJK8glsU+xH
	 coejKu5EkS6UvYoWzoAaDikehmVReQFWldEDNKmXFy7JKF4srZET2dONsNC29iyLWoUwc
	 Hd8Ehde5cwdcI7KopIUg/N+wvNuGy3FgUtV+XmiLetnyjYpD+c7GaGt7qvgRMSSuu6Irx
	 oJWgsj6mg2+PCzUtrFyFakv0S+Wf62sapuA2nvrBFVc2NuRkVlS/z22zGQt+4vhu2ezVi
	 Pv6Jq4PxAfknmCj0E0UrNxrKBjzwOvlLbhmzIYIJxS2t0IKsN38RPBdqjffpLMUsUnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
	b=DSC2+atEHSfcjZI7mfDZsKfEHO9VCbuCewdhtEmLSIlZX0aJx6t+zEqjV74tn4anNTAC
	 ymHN3tLvNs+bHf+DO4FZu4Np1N6a1whvZVMGVzFD9h2mgsCdf16Jn9dAJoqbbGBzCLj6n
	 jSCnrak3bLOuaCG7HJ/nmFr7jjKUHCsCY+QIi8t4LyrBmOP5/u+HpVbpI0Fd1McufEus2
	 YIXCncSYZf+CW/SzFbflZmC2MZlWUs4xWEvv5smkv3RclTnNG9whfSLnUidlyd7XiadQE
	 4+H14XzGbWrP/zn7mDKh/Qfgx9Ng9zVvZAJfJPLIGRurqXfW1vRrtUrs+JXYi6WjrSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJ2mv+wU;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97582606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97582606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJ2mv+wU
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36dbde64409so1003314eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978214; x=1794583014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=UJ2mv+wUuXXO8u7SnP18fog6WaoiWwvWKnKvySMt7qV+3dlB2tt7iqeGvpAW1lrpi1
         z26GL514JQI4LJBgGjfHjRWMXWdE+euTdx0gAVgfRRsDDwK4O/3wCVVkVMr2atlDb6Sm
         fFLUzM0NZ1RvVn+om0BPvHoP4E4az7uFs5K9W7DWpegBIKSJZ7wMWJj7cAeQQAyrVeld
         cBfu7mHCX2BfrtH2PNu/Zr+UkPcmxPKP94S3Qp5JGnA83bfvm59addxBC5XCsj24ItmS
         bV6qYppWswv+1CAuZ9YWG7jer6QcEHI3i+6GZCmzAbLANmEVqn2zxFIhiDDaBvwgrXU9
         oi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978214; x=1794583014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=ctliOMk6HLFnBrKYHW9K4eEc9xPeIQMRKntQdla4zd4qaO8BjbVC9Hdo2NE8ad8f/6
         Ub9B+1vv4z6TEyyXJIhyG1ToAxvyWy/I7nPAMfLIThxJEmsohIms1BManqvOf2a/3H1L
         caivnHvuxwNIfPfWZX3cQsDT2pFJfb7KgngFq6PG3HFYJN/nXaZoqj5zvCJwkz+PuhQq
         IzOyM4z5G67CckwIYg99zfp3M+CudTwaauNhWtl4Vvl6W8HXCKvZg67gI4CLxHzAtIxf
         tkK0CP7PRmwdcUfjJFMGsOvh2Llp3+EfeHcEXTjz6CS5/WuUHKxDelS/i6xquL7Nk4AQ
         YJrQ==
X-Forwarded-Encrypted: i=1; AL+hErH2jxkpXHdpTc0aCW7bZY4WG8IEWobcXScVybr1L3YUfvdvurqnZ7EWtlomAoZ8aSwkDi+FESymYjs997c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hjWYLMZiNJO9cZb0sQWY31PQZEyD07sYQatu2e1U8snXJtTUo
	DPmyslgDa+o8IHX7Xh/jecS5ybEfyyh7G7907KIkytKKM1iFpRp7Bl3t
X-Gm-Gg: AYBFou0Mt5ft7zOduglUpB8ICBNXH27wN1RIuedWAsuOquEPcn4cOXnQ/t2JylHgFfa
	Vs7Ks9qnHRMjEej/GZICXu9OFpunSjdPJa8sktiVqwhezdZliQXOGm+pze+ECdAFTyWX99CWLz/
	rjaEjSRM86171V85MG9UcMlxUZ2jpQXY54ET78IFA1YJ76mQaFEolpzGPp1/BmSv/tFn0+AXe/L
	ZXFJiftwZByq71vik+Vf2xghdSVDKj3AvS8Wn3YafeZT4UlF6GOf36/Trkt44MD0dUa3Zs48WDz
	nFSUFMn1mRrNE2ALdcNPNA1ISe5cjfpuuuJcCU6Y86d5OyqiiLyyL+C+NCqCeJCh2Wbtms7srdQ
	Ds5Xq2Z5hAlPMqYsMqsuCG4FtYih4fVfK9bnGRfJRYCdRfORXm/VvxACVSowAwRBehSy+zSDuvi
	W7U6GOdDCarxkn2om0sQdQnzLoEaN37iN3koNo3waED8EWZdAeBJTeDpwGZ/mEXl/JT6AZqmTf0
	kF9zQCNIe8y1Bu4K/hj5Tc5gxCKFTENDu2AzYDkJkij1xDs7itSgeg7tNJmIQfHWqMAprvRl/tY
	Mk16Cjlp58+b9/wct6ATwdYyNrBIU8UzM5/XwfUAF/BGqsBMTkfsjrknOQ/97qJ1PFjEs7dmnN1
	gOFFD7GE=
X-Received: by 2002:a05:7301:190b:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-36f75441608mr3747167eec.8.1793978213641;
        Fri, 06 Nov 2026 07:16:53 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:16:53 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:41 +0000
Subject: [PATCH v14 6/8] dt-bindings: firmware: qcom,scm: Document SM7250
 SCM
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
Message-Id: <20261106-sm7250-v14-6-7d167e993f9c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=rejlxjgmjiSGoOQieemcJFRPRnZEl4/NvRv6It0RMUo=;
 b=OJ/c3M3Wj0MaC02qVOKVTq5RLwsCER55eDtOI+BRvMbrJSwx6IJqxbkHqxxEctBHahiXCn3E/
 t4J9wrrf/FLD651S4+JcGBDdZwjERY/JULmn2DDTAIq5nBSrcU7QL5V
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54..ee02a9c20 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -76,6 +76,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350

-- 
2.43.0

