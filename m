Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864464;
	b=zwQ1YxYUIAaRign1y4kqalzs/ZKmd/SPylyWBYSPfCA70wchQ2jKnjaUFnTLy13J/k9F
	 OcyV8h9xDOPxTp/T4L0CagoENtPTNsza8iz8l+c65rGK9qS1UwPHLfAfXFkeq7s2I/+vR
	 N/2cxPE4enVkzMw5FUx2zZa3smScUVw1PTbhKsmZktyBmibTkC6ojM34gqf15tbxjnff2
	 KeIYBsgI53WFCIScJ79qfpoR9Yog26UGWh7JvCrjbeKkfX/bh1kmbiojcP2PM+7LkvuYt
	 QNhm1tGXi5o049hZE0FdjCjkms+OeKsAwrMP9Ghtl3oEOFoz/q7/6VViTqp7Fg0znlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
	b=0MPmL6I7GnP/QRe291r3G4XHmgG5XLXY5OoR7hFj2WaQlnlmE3bm1v6MAUOb8520Jx9U
	 kBPS8tb8Rv0nke/rIJ9p04FcuI/BUjV5oFeICLMDSlCohiZOgGg6nvj26jRr9+62PkT7Y
	 Bj1ESUMQCOd4RQvW1RERqWHJE/n1wxgr7qeJAKabThK6kwom15p3/zBIDBkVQdRYEMnw/
	 SCDY0Pi1GMRVRIkGqtTKMfTaGHDdJo+J6w8yfQRv6S7Yb+3VmKEMolRHfo8Z7iTc7lZWP
	 ZQ/1i0ALZh0xDxYMD2zpzbDiQdRfuQyyQyHzN0NaSu4aa+IRbbs3zu9e9s+5H0P9vsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jfokKnjC;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F542606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F542606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jfokKnjC
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49412eb1474so2016073f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864463; x=1795469263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=jfokKnjCoBhGXval+BtxxMIEBcJuEILgvyGX7VwyLu6Emt86PG0cHN8zHavEn/go1l
         JnXO60BdmcgsdTFaKXKwOqVgTgnKxvxwuDZdga2JS6GdbOlVDW2WSZOvNyIBuw0tf4Qv
         RAvGWInSs/2O0ObHsKhseNZU76QAiuroYJMR8Mfw6u/mKdWrlCyyVnQXsOqyb/6w+Z0i
         Yg0nO/MHmkz/gLvmULkydyzWvLIWSx2UfOxq9KIjYxFsMAxV32ihPcPbvWf7DuMidRCi
         vSW74NEJbetjLwGeeuNOhALF8E+VDVV0qaT8Cg41pI24K0Mkon/0zMakEo/amjlR1J/B
         S9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864463; x=1795469263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=lU4ZppkpWZ4AfbgqpCzh482gGZUMqtJj+jn6SW1Huk+ChJdeIuFZjIWydGBKL/+kC0
         vShOnShV7BuQjui0KJ1NmiNKtAXwQkhLLoCOK0+eH8vcYIFnRKajmwz+S8LVt5sQyo3V
         dmbFmrVZtfOnIAyR5rkkDYOVIaA4bp6rY9ik4+QXVlXU/fYWRVt79tpEqhVThVX3gNOb
         /WDt44nzN/YnIprM6qPIIGLqOHlFQ9FMfcd7nMqiHasibHz4ih5NXuYYYbmrAuzWHkBA
         xWCCw5/SmE6o/8YOYPMMcCA/FfHbmxN+NBzFQUvI4Da3WZCk4Oc2Qf/KaN89oKDJXO8q
         vUOw==
X-Forwarded-Encrypted: i=1; AL+hErFofVBVdfXeyE+Z1p2JW4074MNxR2Q6nH0o3jqHMfrgbABpzgNFcTXVFYk+3wWoTJs7ofwJGxJj7BgV1Rc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wV/AT5F5oijyfy8CnQButAabUG4m5PeSFeIOTlwZjmk6eQhT0
	0jMrDjFtve+l08awSR7FTX7ZcsVEnMXTlBIheMnu0AAULhZjBhjdJRC4
X-Gm-Gg: AZFdTZe1KuT+mDXNwbVzMCURd4uLyLRk/thah/mRlF6CLyLqBB02/g8/dEW/6zByzx/
	xvmm4+hyedzl3dQgIR5bp0TIGfS3HCnzFhCjXuiZP+1ERqfLfiIiP8QQS+haZksaCwCfUUYKlOb
	RCLzs7JidpU0dFvbmGUXZl19RXwNyTLvJJJzWv20m1ziSEA8snNbQM93sLSn1FzCL7SLnM013jZ
	iZIe7fd3ObarPXJAsBCN27vtuPUl1ZcMIqKxdiVgJBkCRAKvtifrGkGhRh+z00O2V5XzCTGEUTl
	jTC+fCW52FVaeaL94htlfg1hvhqlmLr8H5L/8B+57vZM9sMejG1K3QOBvCtM2hOfBPJXk4GwO2n
	WG245tM/YZVdHfhAm+JJlYdzjZNKoKphOBuk42b8qSZv5jTAwYqUM2NU5Wlwo1MJp9LFYcFh0oD
	0e6YtKBydJYJa9+r3KKTMlvlqX430yY9uxC780KxilOoQewC9oviLQmjbSVLl6fDfKTGwjA4Km0
	l1UjVXfRrY7JYbSB5lwWXsdc7HiGsVsKQ2I2yTKjKyrovIWAg60k9iIN9l35+ungpIGBno6TabP
	DZlB+HIpcYV3urCHZpD9GTDE1OuLfb9ikuz7z2f+
X-Received: by 2002:a05:6000:438a:b0:491:36b3:22c with SMTP id ffacd0b85a97d-49c6e68dc41mr30686056f8f.1.1794864462819;
        Mon, 16 Nov 2026 13:27:42 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:41 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:27 +0000
Subject: [PATCH v2 11/16] dt-bindings: firmware: qcom,scm: Document
 Halliday SCM
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
Message-Id: <20261116-halliday-dts-v2-11-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1106;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=OQO+LwEeY64jVYcmV4r5bBUUpcSQt6/n4JPVT4Z/sxw=;
 b=lNijzEKQlyljkWzaxIS9zrys8uC5qiwJ2YpuyG3Kr+5tC+QMb+R4Db6kOwLBwj0GYnOv/QX+7
 5U/HlbRtrBQBhLGehnhSLzxDVWEhcpke2OLw7yIeYTlC6a6mrQFU5kI
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SCM on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54b00..fb3da66443ed 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,scm-apq8084
           - qcom,scm-eliza
           - qcom,scm-glymur
+          - qcom,scm-halliday
           - qcom,scm-hawi
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
@@ -225,6 +226,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-eliza
+                - qcom,scm-halliday
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
                 - qcom,scm-maili

-- 
2.55.0

