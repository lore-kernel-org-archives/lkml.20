Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864441;
	b=Ga5yuKzq55Nn4f72DCE1LBaVSEK3jgwOggGLNyV+7wUQu6xNbNVefwdLT6M5hA1mbzfo
	 njFXfOMkQYESz8uGMFQaosAuIL+0mP7KFTYEmNvFLzUJRHzgJ+X1bYuz3oIWf8Q/phEP8
	 Jcxza+Mgz8bZTENT8TjZQ/pU5Z4/ZObwDQOwldZz1IBFS0S0R2nD5rPY6mwb8jJkBS62B
	 vKqp+kRv3fqwo9luABBjWD0c5MFvtBeZa4syJR4TT7sEPYmHodQgp6V+trAuNHxtV0Md6
	 xrjZRVJbugEMH9OhVyywxDA1Q8++NXggzu2DGElvDjf0d6hFl6np0m9WU9Zc96lgScA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
	b=Z/JvTOOU+Ad6WLBo+0THtsXX2L5ifOeg02nCUPeQqSwANNRfGNgDU3w3PSLpISfsE95I
	 oxW1ty9gXYDH2knW6pDAY3W9itYduuWe0CpgrV3cA5EOl1nznnn+NZ32FY2squJX14ojt
	 bRn4fkhx0bSYr8njnO1s5D0aEOC3Qh842w+SLJmlpe7BsMtn4q3/17YyJySC5MYV7sdlx
	 6AV7H0gZmIxY3eE50HaQgNRfd9jBbMInP29vxDeykvTbk0Te7GTPTgFGnd24T7FQMpnCW
	 gaN7I8oZRTO5+OQzJjSIs9RjVP+RgyUqWZrnTMAZYd/1ASo11dooOiNGVkpSr2OZacA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AG9pfL7W;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC80F606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC80F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AG9pfL7W
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso27635685e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864439; x=1795469239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=AG9pfL7Wd/r6/98cIDo+nVLfIVZ9Px+zjsXE5kwL5C5mXq0vvRxtAzXqCOjP57c76/
         QDAdB73QojRTusWajXwvXLflOajjTrRtPUzzN2iBmylVD9h5CuWtCva4RFTGQ3WAXdqj
         QUPHfhV8R3R6+D57fWZz5PoRdD7Zh4aEwbeRy6IRy5hp3spzPFQuezFUatlivFZZIhX7
         UvyPXGEihmkcLMT0slqp/7SwQoAyDHmifQcdngvOwon8ytHUPr4DHYsG+dXREzWIOZZf
         o6twMtZmZHhO517aRhzfH+NpS/QusUvv1lm6Ilz7LGycETpzHg6Fbdmdyo/hrzPzp1uj
         QbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864439; x=1795469239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=mahAqINzPkvEbVUBLJuFTWHZAyoKJTuiX1xE1KlZ6x2/o2yMueoLwOwh9gGBU7wdtM
         q63SGh1Hhytgh2MSW0JOHAnzUYFEnfWhiFa7pVbD8zCrExZQzO1DRbB3XHCZ/Uw3poj5
         ODZ6GVA9c49AJ8dkwVygDsCggXvMUYBoJwCVi6+//3urEVArBweG0Y1Lfz2f0yhDJ0s5
         477ixjw1MaS6I9epdLN4UQh/WFeYHGKwr67TJHWWJ6ehrbOaOdHR+/xpVlOAvbmhNCnh
         IGXtvln555Wwo+3BWwR21QoFLnSBrCf/BX0dbskpaAcCRq4VpHFMEZ8yDq9kniQuyxHB
         W9OA==
X-Forwarded-Encrypted: i=1; AL+hErEqkpv2/nC+gb7LkJoJddMJkm19FE9CDeLjVwzVphMmtzvlC6hqRCW9kxZAA+3JhHSmR/ph59wFJ5dhkiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8E/jEvw8BiqHcaJiaL5QeqzBkfWloWMpAtr7x99EEdS3v1mBOx
	aUywWrWzB8u2ezwooytdkW6XNWsQU7DTxPAhHr1gJM7+gozav1NwiFsr
X-Gm-Gg: AYBFou2Wu1Z7SELRwfPgpw0etEFiD7aFXHw0K9ob8cmgGynMlp9h+C20mCRF7ZoReuc
	zskC6tCNbX6lbxeUAUU69povH4oAs8C69EezHHOGBbm/z65hZpK1PKXCP/UaLEqxXEjldVVKBgT
	8q+IpbehQH8LyKL1f70RoNhqeVfMt2QMBwbalAou6Ga2eqgE3UWbC45z3aIa3Pn+0j8SWXsLouj
	5Cw9bpZXtY/oJ7VtNNP66VzlJvVarZPFpCoSHLuPif3SJRP6LuB4nFlatyztauvMqbCBnieV278
	xBecCm83BYLU1ae6oV6eqDNzfRTzzVzmEfW9XxC/lSMlrsXqs2yyaJ3e1onjEKSkR96TJa2/Hdz
	2ikzgVkZDPNh6q/NCNE9XJ+qOyIDu9ehpnG8HREOK9DQDzkI5vXIJw7Jhq7c/bOp+wqkdh2HisU
	I6Icy0yrJvMbIMiohmkcSi+jBYomaunmQjREzxBsS4OqnoG7ZkoHNTuYvX7+qR6W9A4WSm/SiYx
	X87BkGq2F2EHshP5kzPLSfnCCo6Q8GwtoXkLpbL/QUz2rRN6f9DJRDa+D3a4fX0Pqqxsw1ppF/J
	TxQ7MaojHkGS8b4gCKYOCEjKRxVQhyMXd0f5iJ0J
X-Received: by 2002:a05:600c:3487:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb55a4f1b4mr255653315e9.13.1794864439353;
        Mon, 16 Nov 2026 13:27:19 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:18 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:23 +0000
Subject: [PATCH v2 07/16] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 Halliday
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
Message-Id: <20261116-halliday-dts-v2-7-2c92438c6c46@gmail.com>
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
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=993;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Os3dtyGi4Umq8bQ7AEz34h0NK9e+Ws6GY42XJz6qujA=;
 b=JAnPagjMpge0X10XiR/LbxFcl9vIwvXlY8rdMR3b7TnG2zjS5Ef/3pOUFBSYZcopY2HJ+t+/s
 qtEtnXV/IW3BvhWLgk5yEo8YJikc5cpwNQrDqesXNsRHoPh2k6l5Th3
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the QMP UFS PHY on the Qualcomm Halliday SoC, which is
compatible with the SM8450 one.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 10435a0b5230..a42bba9b550d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -28,6 +28,10 @@ properties:
           - enum:
               - qcom,qcs615-qmp-ufs-phy
           - const: qcom,sm6115-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,halliday-qmp-ufs-phy
+          - const: qcom,sm8450-qmp-ufs-phy
       - items:
           - enum:
               - qcom,x1e80100-qmp-ufs-phy

-- 
2.55.0

