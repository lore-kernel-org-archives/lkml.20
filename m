Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864421;
	b=PiUKekgbQYuuSIFcsGtSDNlPE19YDhHneh8WLRNvo7HwGoY1fc0XFN0oPVVPm1FiQSmO
	 R8INXF6Z636Rnm+Oj8p5SWNQxLvUTldCfXVziMMymne1BJqIVipR98ctpoiCacWActhL3
	 F8GO15C58FLjRjhSYVgw2I637sb6Qdv/d/+PpODYhHONLkdLf5gHCwSHuoT8ScrugZ122
	 lbGhcrxMYGYQbMAs+nnfDkVtyKf1JAx8vgwuMnuypmX9ju2qWpuWF5rlOmPAIvF8b5O0y
	 KnOB+6W1mpORsnVKMbnNHmOVfGOG40XnG2APZoa0WLCtIQ3Y+5HLikaSew6dRY/88NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
	b=YL+/oiJ5zxVNh7toS9X9YBsTqVJJaHK6CtXq4CJG67ToeloJzUNNF3LCfQJbrV+TXS+J
	 kgLW4ZDI/UXD9yWKNE9tWa5Cei+SPxfdlwQHkJCYsMRj5tk/pjVf70VTrDyQykN5pb12r
	 RgCJNJmdfCntsi6e1ZvTg17wOD/tdgpnAQ03pnNjBzsV5Iyfn5oxn8qqXmyNMiZqeoy8z
	 sh9HDlMDOqoUwdNxf3cWeFhQoH8LtIAoxeRNMDLQb/SScIxWHyBNk7AVf7/aJ6wVvcghm
	 bsRVs8FDwGO0p3UkYyk6HphlvpMM+KQvG7Dg9WlXKMHyQFHyYHAyYrvCyqluP3PD4fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLkgL2gk;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA11606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBA11606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLkgL2gk
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso25500945e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864419; x=1795469219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
        b=lLkgL2gk0QHyzdlrISl0quTs24SlvKBMOFoH1j1nhSiSS7JrK+rmqPoGnROwp4PajW
         VeDHrF2l/KpppBUbfWOTOW5Jyih8ZdeaJORgZp7fZ1X4LC0f3uKoaabUuJ9TyYvtFXQZ
         DeC8HfyWDeKEMkb86Mvb4GrBoZFekGhg+QFoxcILtp4GPkjIrUJTxwXwmYy7wQi5P2qm
         QXYM7HxQNkhbi4kAyQPpLc1ypzpHNgh6uTB3bmXhVTpqihvt2TqYQ6MlbLWHh4OGTL0I
         SUPSh3Lvd0vX4kNZX6t31437DW1cmDuLnDDpn7okWV7cTDtFCrWfSYavOzRWSnj8Y7zD
         H3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864419; x=1795469219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
        b=i88WH4mvv7H9o65/APD5E+aRsm56fkZbV3s3s7fGo84pjUS2n+CRG7qklZe12yESMm
         LLx0Q8bVnFIVvhqqKqlXSboAGgchYCfVyK5ouUfe44BX9o1OxyBzaWF1aGF/g+unNyPQ
         ASssL2b0F1YSyXUdXvOPz6Xdu5IpW1RvnCBOarP6m8YOaiw2jO1VagHRgbeR6SAkK/+2
         AQ3zNvHKqGSpR+vV4VHArt0rK8jum1a1dCzUlZ9mT0Oszng/NlVb5w5pVgOfrYoSQ+mn
         d86oxsdyRZbpAeZAh6wzVNb0igmtUvYcVk8jXzF1uVUCeH2WE2gsZyzcZe3eFg8YA9DE
         HhNA==
X-Forwarded-Encrypted: i=1; AL+hErE66isN/+/QD0rkbbL1wUJ3FqICw1IeMk4RjdceP6V4dgXp/WOjWejKb63Sm+LKEz+qLU4JKJYezdc5BcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8epaKs78JG1SVDFDZyoihEI73D7ZmzKeLJRxbmoPVcFPZi7fsF
	bBpDeIvLV+1TcpmYydJW/+v/eAKk/EUXBHUC0D8SRBMsVw5q05dS0KW0
X-Gm-Gg: AYBFou3driGr9pUdUZEMiqzxD0DylSayRwR+h2LBAKSVBs8ptwJDZK6wQ49uSS+BxBg
	8pnbL6Hrhd49CdbmVAfCiR3k61ZIA/WG55gxwRYndaHkRWBajkMqOLGBFZSRqEYnorilfKr8A5T
	cPi/d54dpT9pkB4aZWL2opJis7rLEC/Sx83hNs5QUBPclOrBrKiHvCzQeSXa9ZO9VwQaXmicV2b
	rCk6Uy0LWqseA6UuvUM7F28nLT231LObBNQrcQ97t76GFZsw0Vvyd2l5+EHFTkgHVaCEeC7rVP6
	jTVkN8XZ34acnC6x1BoNlAZc4bUZFl4g8+gNveApvP5ZhccmrGga2wKaWGRJK9es1LOKhocI8eq
	6keTNQiWKuVVYOquNsVBJYzM1PbBefFn5OCg0qGBFRHy8KB8yISeXri/VaUNzbk93N/qdNSF2sc
	eASBHBbaFmGCa6QxnqVUHPKY3GD2MHJlEWYYDICdKV7qUnZlRkuOMCYEkZnrZUY/dZUJI86XMjI
	SOkbDyjWePRvv1N2WUiY18ijmnn7MLRjs3P5I9hAGZfp0OsnHBUz9jg4qKkG0ca8kqAiumNFCMI
	Kk2Z/uVmU2NfLb/m6fxLpQQKbuJNR27A4nFHSDb8
X-Received: by 2002:a05:600c:482:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb55a59c9dmr184592375e9.22.1794864419406;
        Mon, 16 Nov 2026 13:26:59 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:57 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:20 +0000
Subject: [PATCH v2 04/16] dt-bindings: arm-smmu: Add Halliday SMMU
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
Message-Id: <20261116-halliday-dts-v2-4-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1185;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=48k8tRM2Ds8B2KdX/k6MNHyKgJdAqOSEc8lLmnEqak0=;
 b=jdhSJvOgnkWCr3N/XewHYvU/DMh7fs9E9l4PMB3CyD3bi1r+fHKz+jcOeuCkYmmgxW1wl/a9T
 LhE9PjP/kP5CRKJpxWsTiZqjVGzsx7uCz1lP4rAnXmBZayBQqDt+vzF
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SMMU-500 on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..925afa8cca8d 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
+              - qcom,halliday-smmu-500
               - qcom,hawi-smmu-500
               - qcom,ipq9650-smmu-500
               - qcom,kaanapali-smmu-500
@@ -629,6 +630,7 @@ allOf:
             - enum:
                 - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
+                - qcom,halliday-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,ipq9650-smmu-500
                 - qcom,kaanapali-smmu-500

-- 
2.55.0

