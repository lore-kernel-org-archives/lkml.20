Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184422;
	b=ZlmsE7R8aKVXTSU5R07mHhM7ZdozC+CLFCFRzjT4ICGTCPs/h0mqWM86f6sT7siCV1Up
	 CwBrCWdKqLJxTxalKvduE2qMr4KWtOxfrp2Wbi3+zUBn3AweHhTBrQpg34oPpIDcivmPH
	 e6gNYR1GnzTAGGyGWt/+NvIvk5Jr6ewRmHarje4+t1Ev+xsLkAjPzkG0KM9cOhlqa1kI4
	 HCotrSOSz5mooQdF3A1HG0Mnl0/lccakVcQ1i8FYMuAfMPwG+1L/gjKRYT5+2cHjxmpug
	 NIMgbQFRwUFLo9RoG4FZiZ0/+w65pGvQGn3W8YsYUoOa4yaNeXd8pvRhPiKcDx1Oc5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=r6Z+1pNGTBfmPrEnFxF8VVutZ1rF2maRRdQm8+3OOLA=;
	b=WYzYLdDE4x1wZ/wfqpKwRu7a52c2+7+6MeQuF8W2PrcdzE252oiMHWkeqfQdCPVmj1fx
	 CJPCcNpVfcYSU83xUAF150nRLRK+8EmZtnKJxZlFPtW8ATsRzjquYo0aYNAz4Bp4yGtvr
	 VdswjS30d36+BkKYqtw2pCYrGVmw3qYRrSNUWXJ+vUxPftXLRCXOLVBSF8pjI2l8oZ0Gd
	 riKUmEIUeprNSE935zvsJbWdC6M/dMM4Bhi2cvI+PNjE49UbNk31furtN2sD4hQM/KJ9N
	 by4cxBRmOExevo7LEir3OsGGrsvOMPfarSKSXTHqw6sjGCCEXQwGPP2OoUWOOuxK9RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="uD/fC9fw";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA53F606D81D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA53F606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uD/fC9fw
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so3157695e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184420; x=1794789220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6Z+1pNGTBfmPrEnFxF8VVutZ1rF2maRRdQm8+3OOLA=;
        b=uD/fC9fwd35e4pRCBo6Ir49OZrB2lX+E5PGdQnHcUkYxiqu2ZiGRETZ2zJmW8sZlTd
         A5/c2Xw6hipV3YiwOTPc6CN0uAO33PQjgwXUPiZreZzu4FdcrszHSfLcFtjRZOPT3itQ
         xle2xxFDmZmDqyMCWSs93UsfOpeLxSN6ue7xOrrEm/NzYT0xzZK/eCHB+h5f9jiXpkxi
         ypgX50w+AjK0hyhr8W1Y5z3Zeklf121xyaUU04Mnsch0HJVE6Dc9AjOAXq0dywq2opUJ
         SUXNk4QGfcfXnyUDSGqSEEHPKlnphwjmf7JR4/7BbHKuz3djlAWOEVbyJKz8FiaAylH2
         4tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184420; x=1794789220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r6Z+1pNGTBfmPrEnFxF8VVutZ1rF2maRRdQm8+3OOLA=;
        b=g5M6xchIUCsDuxM8UHV1dfAb01qn3a2n+RoiYDIY1GJ5w7/7J2zYpUr6xyRVW80fFA
         w13bzgjCoFEiwTLuTLm8pK1n4ewiMGtmhYrILqIAgAvGlOUSZRbdRyqxhg4f+Uog3umH
         r4j4Cd7e+odP3ltUPQazcJcPBHNiEtoVXaInCxnzjibxF6PWEac4QUnpjr8UK3HSMInm
         lxaEdNr+fPgT+Fb8Wft8fLg5M+sbzVLDxIoQvbpCe4KilCpn1KAUt0GZTkxzkH4IRU1w
         fMAj/PimELlU89iotdvBOvqLVDkD6rLquMvHFPTn0QDD4qxOSqhrSU97Qqm7qfjN3l7n
         7Cuw==
X-Forwarded-Encrypted: i=1; AL+hErFanxGbGvEfaAO/O5ejCrYjJpe87ahAkcm5BbqP/u2losu8hjrKnHWX+5CzSx8HoRcDqLMFHtVrIlrolaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6HB/bNNIloTZ0Kiv2GlILOKrr5xWI0Q6y+dV4TW3jvphaqB0+
	vxuARxhxM8sju5XWkYdkjuC3hDMoEjw2CN+TZJoxa5dckoeqGVyNXE7p
X-Gm-Gg: AYBFou1vzIr/7NjTiPploM0WV8JebR5HyxAsahkpUJbbHJ7iHX7oycU4K4NhdkMytGI
	m/a/hdDcTm3mtRCKXVKbohv3U15W9hgEjPXlrAakf1GQlv8paET7AAOBUBZtjB1hkAFjQwM03k/
	pXdmcGbRB9UsyJjqOp6BkAL9uEfYXgIub7XPiNd5NgOC3K07WoYNB+HK05RgjJc+V8vgcCBNWFm
	bcCc7gtKij/RT7mciit0uPSN7ovRphmCvypDdnGeXOHgvFTLFUOFvNYD14ugVVsHvoJfa1cnCDf
	PrI811ihCFfD7ZSkm8/pKn62lS6U/NO833tzozfddp/ksqFNQirf3Vs92eLthz3AdSqmoLdpZlC
	sop/mymlOHmWvR8mCiZ85iiL2ZaidX5VBes97+9ZVerP7lv0mRhRFPK13kXFwNV+P4L0WqzLscQ
	OFd92GDdH1LhbGwd6fvRMO8A5GBEimHLtKKaOVQNLJzP55W/EcLphgRaE8v1AEvtBp1Fq2CTXJa
	3LG1AnR2S3jGqViSjradCNEVWGpl54wop77sd1C5BdoPlXIPSgg5mhwiBx75raSCs6CWE/E1/4H
	qQkd2kRKpCPzjwTz+0cVFWh7xb0xxp4aGpNgUQP2q3fNftTFD0CI77lfoRtzwg==
X-Received: by 2002:a05:600c:5253:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4b94d762eb6mr47593435e9.3.1794184420329;
        Sun, 08 Nov 2026 16:33:40 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:38 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:15 +0000
Subject: [PATCH 03/17] dt-bindings: interrupt-controller: qcom,pdc:
 Document Halliday PDC
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
Message-Id: <20261109-halliday-dts-v1-3-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=840;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=4hUtXzlXhIrBYYJFfDKQPQ3vEIzggE85cdjdS9WjQ78=;
 b=/Hr74fQlfTdpftwl6fj+vsUmb0ZD+laYeVxlhFK0akfSM/Zr+bIuUmQJNpniQW71Vw0S+OnBe
 X7HjWxQRJOhA4SO/MxeQgQ2JNwAjEDgqTYH/3IGyH4DzNXVVHXtyQib
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Power Domain Controller on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8401d3b48e0f..cf20041e86c8 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - qcom,eliza-pdc
           - qcom,glymur-pdc
+          - qcom,halliday-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
           - qcom,kuno-pdc

-- 
2.55.0

