Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184492;
	b=JCa9TGeSRldu5doygh0WhJVUnXE+I+UU++6i6FDW8MyNM7an9QT69EYas6r53raMCPGG
	 IkK/9DoUfMnaiQs1Rs7GEAvB/LCPIbY999ya1yd1uBLj+NOhGtKT2+U5LtdMC/jGIXCO5
	 +jybjHGp9NhcsnmUNfStSiDz5hbuu9riq518vY7oivoEgWegZaj4i0Rqy4L2WPzVz3LuF
	 MJYOkHl6/zJ588EXDdvTVCvEGa45FkEjRSk1VPs49f4GQnh7Aksbxg16JaXQNjRUEzXXu
	 D7BWy3pp3VKznQqyZjcWevTatf77q8xcKe6TxmSrMZfyx4yTidT8QkXhHBrJoL10dcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
	b=IXQKTyLwgjQn7JCqvEDcVDq59VpRILDfERVjNtbmpm8nl4tiQR3Ag4Mo1rrAu1njx3me
	 guBFDiulnhH1ofd6Qu+yHJmFjgIRbB9cXFa6AQGWtwMv9HDdX85m8q7q6Sp73Q+4SUkzb
	 qDUV0PGe93zkg1Pvd27dOZBbIv+yFLFqi3jRvKSk0+JrgsUzY6HrpevplIyNMw8i04NHN
	 Py5RsZ74W0GDylYVcearfM3oSv4W26rN4bWBpUH+OrEGMfyf1VBlLPJu+nW/Av7uQn6DD
	 IiikyPYzoS0QcXYTgD9n6d21h8KVEs55KzYNIrJaS+tbAJBYlsYr1gY/uSSwQrlefmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4mD95aN;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A674F60A263E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A674F60A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4mD95aN
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so1969965e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184490; x=1794789290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
        b=E4mD95aN6utgtguVmche9wruQufBYUmPr7se0FjMNh58DsSqVSMujoYr0keBmRpW8v
         uWQWheuyiSWXxKez1vN9DHsvkz3dIxygT3PejUT5UR97F27EKdO7WTr8MwR/DYX5j7If
         J5n5+NU+o62GTMTKrKJF4U0oIX+yriKVSodOXqH3bAcyiqaL4rHDO9eNXyjje0tgioF3
         kJjFsybCFmRigW6JjznYVc4hYOd89F4ZaDco6gDgRFm/z6xDqoQPjP4mGVKFK2BAHaN1
         NUR9o08rR/2JzDfKTWO51s5/9EiaI8Jvltmy1OQJ6WmNNyfpZkFqT0xbMVSgVs34YbYY
         WCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184490; x=1794789290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
        b=F0+Jk5imJpAaVVmAQpcfqYUUciUz6uqcHaUxw3jfSqEHDqgEi1ysM+sriIvnJcLeV6
         anIqbUkqJiunAe+iR6g0t+qM4Tjz4ch5dpTH77O8ETkARlMkMjNFNJcjZPEhsVdH3RIR
         Dwrk5MfsGt3jow1yAoAEkJ+g+fdsRDp3gjyPy+qEXFZA2qZf0s/6ydT1LmrkFU7KQpyN
         w/q53cfKDJIJZw6XSYsA1CacW1W+wWR9xevkvdAM+DDlNSUR9xzshu1Z5TvpyoXv2ti8
         PaPhB1p/AyYD/cBGrk8VdDd1uvDNte+2J4g7E+O+oznadNriTXQdfEifUe5OPGMss8av
         F6tA==
X-Forwarded-Encrypted: i=1; AL+hErH9Oe67bQTfuYM9RWu9lXOVKoADTeGGKZVqazdn16JQNscOEqlyoNMnUinx6L0FJhxFQxZJKee7MZ7Sw+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/RWH8PBFtS0IR8c1ebzV2ID2IinO6JqWdRJjfRNVRN6raeszV
	vv24CJrAxChcNw8JGevgpFQWWSfSK1+VPwSx2steO1gkyswb4lI8+Tzx
X-Gm-Gg: AYBFou0sXfVHdGYli/b/sHYaguPpEZa8H7QVToVUdTyvO+9U38GHocNa6371z2n7OWE
	+MQsoBaZoVTULwXPSzGhLwV3F/5CfffeF8QUZwm/9IG2WwQ7ZsvTfMk3n6Ixb0k/8hAialesC46
	up3o+cHwLtqrZwwCfA0wroHZfndOG/Tk4QVDZJUuSauWfRP2gs53Zn/2UiBcN9ImIA7b35CqvpG
	mXhVBCIZXwJgQ/0vVeda7w///lnk0J6cm287bohkLXX7YSq5i1Xgr48V2Qg2ha1g3gTuE0wWB2T
	k281pnQWyq5C/kqN+DCZdzU8XcUn60mvZWyonpVbPWPXEVB/6BeysNZoaHecS3nAtA57H+RhQj4
	n/1gWs7AAOUfidtJzLHCLTixJt9qP9wqXiu0byQqmwHbjwfAN/Xc3QvW/WGCCGx/XP388MSfsvu
	h2Tvtxk5Rzx10MDTcyVKxGVNLWdvlDBwDMYoRRDuv8RqQgMcWA8coCoaUed2Fjixdx0DU7sZl7P
	GU7+e/M44g9R8Zqoeo/4AKex0th6SKyjShUhnKnb54WfZV59SagGMeicW5ZZ6uPDsnoG5srcGXO
	mH+vxSaUUJUdM5YUVKip7xpsN+Yy0JgdeJK0CO+D
X-Received: by 2002:a05:600c:6218:b0:4a2:1002:223e with SMTP id 5b1f17b1804b1-4b8205955e1mr111833455e9.7.1794184490117;
        Sun, 08 Nov 2026 16:34:50 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:49 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:27 +0000
Subject: [PATCH 15/17] dt-bindings: arm: qcom: Add Samsung Galaxy XR
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
Message-Id: <20261109-halliday-dts-v1-15-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=822;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=GR/L35KkjRTQHIwoej6N0ZVQiPJDeokJdA0dH1/xcVk=;
 b=+pMC0hU92qIlScFgbvyLG0yeciXJR70jYMcQsgbMkAruvtq441EcqoAR24w8+H8PddfDvxdW7
 NeEMu0FiaHdAmbbpArcsFtCmr29OynUnIXhIC1Struq0XQSLzW/yMcu
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Samsung Galaxy XR headset, which is based on the Qualcomm
Halliday SoC (SXR2250P).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..b96ee339956d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -94,6 +94,11 @@ properties:
               - qcom,glymur-qcb
           - const: qcom,glymur
 
+      - items:
+          - enum:
+              - samsung,xrvst2
+          - const: qcom,halliday
+
       - items:
           - enum:
               - 8dev,jalapeno

-- 
2.55.0

