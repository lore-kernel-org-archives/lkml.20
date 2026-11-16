Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864429;
	b=yzCXkDstrm+80v2bUZSWncxbMVH2HpcaL6Aa5GqzAXjyqhgcL0Wa8pIU9+u7tKKZtkkb
	 MQHqo+iRU6sgY54ReQsGby2dj1T5u5kEiTrHALiWrFD60Zkbu4eu1SJu4nya8MXo3KHLv
	 Cdf3KmTFI0WU5D7zLRD8OCGw/D+KOrO65GjjMEaqh4TO1gKoOFsSEbR3DSzdTdyar7hu9
	 i6K+y2GaJBnsNokN4/9sAbrtj+FFAHmyGyg2/a4+RgT8FDW502OrpvRS7ei9k77CvsaT2
	 MLIy6D6X5zisBkQ0b3+LmVo5gaZ0yOOKuctteE3q91u1cYqBihBaFMuFzKfiQ6ORCyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
	b=YgM8ccQf9dvkmkACpIGAbgZc5Ca0b9+zbx5v+WgQeSFtG8I8oBmMsDMl7kYyddRqnSvr
	 KvTR9vE9wQ0wSqNxCybSf9ELXcmpR5SzVnJxIZqPoNWnO9VQwfH7G9qqHeWtCzTIxb/Gt
	 H7Xm+BEJXaW3NUWBa39T2QMLWAv6B/Qi+Ozi6GZ7dLl1mEL94F8hoH0sYPaQGc1pwEuJ2
	 NelNNXCnc9wAmmsHKli4I7LqDCO4VMtGRDdrO7Ahd8ScLPbXu+vy2XhK/bk4If8j3EXgG
	 iRKtM5KUaeljm6E9LdmgsmZSBSEKSyAiWscQEJU5EgaqsX1wydHxh1Ra+SpeeyGEUZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxwUmdGf;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6633F606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6633F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxwUmdGf
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490f38e9688so230647f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864427; x=1795469227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=MxwUmdGfyUtZntWN+dJoS07xQM0pQ+yVQaLKkkqz5GCWi49NfYHKbWARqZKhmg5l9P
         xd2SuFAw0lCCpffBXvhmGo2xZ9cKfJTe4nfCkkB9BpB2Ewjgp1tqMuMhU61bgBaeqDer
         UroYO6LTJwf9ez7KYEQngDY0mihFGBiJsqVzaOOYNpC2W+5MvHXboThdP/oLwUGq39Rs
         z3V0OzRqMtLQ8bMsw120HXUpxzOyVHbrTE5sD5sy3vWlDMJF9dGPmPZfIctKxwRS7q/O
         Qo1H+zS0NL/QScukZH8Xbrny5RwvwyeLCvlSK/QSvqJ0ZDVKOmrNlWLe6r9KV52N5Qpb
         /zUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864427; x=1795469227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=VRauQabviSINv0UFZP1Zg0rqrUGLA4jAVfOvvIqjfSuwsk4EKV47k1drVFGJYqGCoH
         YS0HXGU5NdYrYxtOoX7Yv1G7PHLwuYp26ncfsD9oZxxiw8sEbofA6FaSCS3XnvaTxlhT
         vFA/9wLaSgD9QpMgyofOabnVfB3Rrrl+Bal86ojZeQR5IL+tMCf1qScSkcA+YjwOsXbL
         jhjMFTHxWJkzLSk7UbMX/QblEzrf/zgyi3Wlf55ZIravfk12/WCRv5QRd9uKqeuYN2L5
         YI8MVZPKPVqo2tGi5DJQTAHkj7e0RkUlguUBgX0s7jHc7doUf+b/JeVzOuSlPVDjamVP
         /iAQ==
X-Forwarded-Encrypted: i=1; AL+hErGo9IAhhNdOhZuFUL21FFFEfocUqso9IqqJfOG5mwHA/ZmRRfMkkxz6fFk/pai92Afm14qUIEmW5gtXUj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pwQ7V7HwhUtMKBA3eyj7XJJUvkRF0bg+/Z6r/w415sektQTOu
	Rkr6KwBN9onEvD1dUcTxWpufXpt5csyTkRg7mNrOkBVq/9gjHHsc2GGm
X-Gm-Gg: AZFdTZe8ZQtkpKzX2fVdP16IypxD1pjKF2rl96O2pleRmprGoBHxB9jXPyZWz0YMkWw
	bcP7oHeWuLFu/9ycl96xjxm+8XV/WhEi06Un36Dev0pPpaLJzdaDxVLgI+9gMhin2FLMlmcKOf+
	Esh8IRxoYWLgdRbEZipbGVONtDGUgSGYn5UTTlurXV46WiCwdGYMoo8VsJp887XkFqvclEl7ff0
	kMazCIS3UF5SGLaq/H0Q9/Wo2ZpT68WQt1IJxH0M9XC6r7hCtGLhNuzV7bBuGGp9WJ73J8HDv6Y
	DBbezQIn3ybRpdqeO1/caTpVuIHhKHj+UWgkQXjIworY2y4t4qy84le8C6uUDM+5ZAC/4u8ycAP
	8bsTlpSYQT+ewzetzcACRl4MIZpxHofPvSWj3Js+VOXLLZ9vyyIq2qpZkBuWnNYzHlwc19TikWr
	JtbKtdMZDk2LOusvVPa5OqcYA+4JdiMemWrA8S1MQFq36gByFqGhDWjqM/P5Aav4RceHWnoxO9F
	ABhF7POxb1jMg2l/Skf1VOlJV+lqZWVw367pNlEPfwkMNnWyjniyyIds47gqRnMfvHaW+HaPjqy
	5aoRgtjiAeA4p9yhEytwPo4LI0Rfw6+H484G5COxVg==
X-Received: by 2002:a05:6000:4a01:b0:48e:7833:2e7b with SMTP id ffacd0b85a97d-4a36c30c79bmr1458441f8f.1.1794864426917;
        Mon, 16 Nov 2026 13:27:06 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:05 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:21 +0000
Subject: [PATCH v2 05/16] dt-bindings: usb: qcom,snps-dwc3: Add Halliday
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
Message-Id: <20261116-halliday-dts-v2-5-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1289;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=cCyX7eu7E67i1+mb+zFb+/V3MZ2Z8Bvs+BbDvfy8HQI=;
 b=jodb8KTCYJuS0IWgZE7KB4t4x5w4vx+XqSva6vd9XaFcHbRLapvwh0kujvjIVh3aEijgselYV
 FDfNsOtrAj3APDDTnmVV1I35ZxWejVLlN13Q6QOSjvxv3VTGu5EUwMp
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the DWC3 USB controller on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..7a8b72d2929d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,halliday-dwc3
           - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
@@ -209,6 +210,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
@@ -570,6 +572,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3

-- 
2.55.0

