Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661788;
	b=KFXhgQhsdXhC8FQ+IbKpSVANlkihtEOD06pGwNbHGhWcHdKABC3kwPzYkSzIF95826L9
	 sVgKemfBmx2u5LCUAf1EPBwBNQeKwqr8+aGoy6DveAs2Oggd7M6yF9HI9SB1qMrAo0Mof
	 re5qsSGAfIEr3DIrT6J8waA3K4A/Zo/J72qvtEFUgQnG0g1ccOE56M4uOL6gzMJrngBOz
	 fID0W8lucvK0wH8cK1yarSB3eV4UnbmiqQ1wh3pa23sHDIP9OSRWdKNk68Xv3CggjlSP3
	 h7JzJXjUAGrLOlXoCUu1iayDBCSjzuhM8pnXty62+t4DxS/zhEcidj7IYnfux0/v+eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=F7HesuqHCUKfnjxgSq80MIKhfjnfNKfcHJfcl0gxIzE=;
	b=XFEu0GV4290yxFTTfIhqpFz66gBbobjHx9kH6ovSWFaU5VFektGDu6T++YgASCt/lIlg
	 wjMK7Qa1RWJhQkOrRy3buk6Ot1FBRzxzoW5ZAWvtUQG4nsCWdALh2hdhP7TyvATnJyeof
	 HMglazaZFZN5s+gfUFgEobJ1w2WNxUUvoxAYF/aoZmfD+9eexfitoHDr6pjlq9YmrcdbY
	 mPlv/KlYZhjKQqZHFBsNuRMcQbgDC3r+ZMr4EEXq/hZcEUYqOoMeO6lZt7b1SQUoKUDoX
	 QLARoRCoOvXuhrrRasfZd4d8yvfU3O/QQsxBeD29CFdE6RHzKRmJAOeQrQ7P5phAaBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KKAAeyCn;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD63606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CD63606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KKAAeyCn
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20b122af8so2181725e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661787; x=1793266587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7HesuqHCUKfnjxgSq80MIKhfjnfNKfcHJfcl0gxIzE=;
        b=KKAAeyCnPcWgRh0IZ8+4xHbrmYgnquXBo5L8vA33oB3DfLBplLtZvb4+tdyMEx6CZU
         MC/jafSv4nbwsU/OuW9nYrpFDTI47VT6mrrkFvIbheV71QwQURpQYb25Sxsqs8yHJlYx
         WhsmQB9VBdQU2vp8qeVtTnu23rAIkIXJTk+w77kW20e22S3vdXtyTanaYbonqaq9NeNb
         2vXMrPvuVdL/66liHN4KjBL6YpajHFMr7kMJuIgU2BlauIfi+VBZfYdZHxW6PUsD5Mk6
         jQZ4jRloIfzo63wr0gcJnLVPbnYkxRCrkn7cS0C4ZhFEB6DbC3yDw97lmF6rXJnzdOyG
         jaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661787; x=1793266587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7HesuqHCUKfnjxgSq80MIKhfjnfNKfcHJfcl0gxIzE=;
        b=0jJBIb2E7uJmAltdXDI13WkBuVaV+LkMUEJFKhStBA7aHV7iXqCHKCGgS9U0JK459Z
         IxWwCHgGPaglVsTXUwkQDmXaDqesIH8xrUzhwCZCwgwMUvUjS3TfL7lwwU4lsglYHIHN
         cwxW+1DCPzaZXbo99N+8JWmtBy3JZX5zVMe11sm02hrX/CjOvrSj8KO6SxulUviYcv33
         bVbvnI+Mism1n6pI5tg81shmRGDXy98qJDcGADBTt6o8SWzoZta5Sdu62yAtJK5sCec3
         m9CVtOyi84U2iXSiQaAM7wTVinlKdEVJ6amUzaEmTJSRU4vlusWZsccASq5UAGmtpAN6
         9MJw==
X-Forwarded-Encrypted: i=1; AKwUvBxazqdiDA69tThkeOyarVoFZA3cKSb2GRNLcrcfKbxi/IMaMWlW5mOQSato4FMSJm0K9h4UocsgYK0X4eU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6000ZAIdcRLaTYmCvMai46BDtWTvI4n9xWc4ALoNZkkBs2Xeg
	hfGdpfhYUFGQZrwzL1AGGxHP/8GLx0n96xTkvQ+p7SoDeq1tYlnUon0zwuyaS91RyEE=
X-Gm-Gg: AYBFou0lFgcZH4OXAT4+MNt4St4MjZ4X9Flx484DqTwor46itHOmSlbi1QF79F8snUu
	VEXqdsOC/L8CW0Rcxo2XWDkCWC/Gk6WsxCdcKwM/C7gAfqtd8z87HJ5NOYn0u1+A4kc9iVMY4o2
	s33qh31u3ObHRqwi3Y0WFM+6iDwnu8QBcfdtpb8kB6YN5PNLm6kjW8cpiD20V134QNirMVvoKQX
	fnNoAhXtedYi8pv9+85vug5oVk5DRYQaaRCQgTmkscxprHHGJz+mmWSu8fS4dk31ZjjjCZKk8LL
	pEsOLlptwEsic1uItpQ7KlAWSe3CYFbMGcM9WgPi+G8KAJyILxc3JTKVFLM/0yL6fbtlIe23/Jx
	eEkuqJzZbaYbtRgHoIEQxjo48tkD2R6MIKyuSgUyDqpH9IwcdcnX7adbXL5M4D+yEiipxTeGAn9
	VCp8CcU3/onhVApaH2Bsc1uNw80fIlbr6fDQj+V/vHGmdiPKWCtReHRg3YV9Oe3uVVfJvJyhjIz
	lSh9U++9zSBORhxMJKaPh7M5B2dD+2Dng5td0ubZh/VqAiHFd48GVEuGJkfQSsisAFBE7Yv2vBR
	QwdP0+LifpuZI6H7
X-Received: by 2002:a05:600c:628d:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-4a1fdd170f5mr99283825e9.15.1792661786569;
        Thu, 22 Oct 2026 02:36:26 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:36:22 +0200
Subject: [PATCH 2/5] arm64: dts: qcom: sm8550-hdk: add DisplayPort audio
 playback support
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
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-2-8a189c71938c@linaro.org>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=857;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hreQtrvscUJJdl22qtTpfQsMNJBU8/Pv38wJioMLi+k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkWzY/AnMYELYGe57U6RsFJV4K33005WEHPXZEa
 I5JsDk+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZFgAKCRB33NvayMhJ0UreD/
 9RHj2TqNvZhc8tCAqohC556Wv5dLj+qJ8xFQiqadrhwQ3TifglV4kZCYwvpamw37cMwVBBniQ6akpj
 Vj9kv7p9jHB3USMQ/a1UmqQdDenwyZwsJL/Z/bSy3zOU/anKx8cYCyx9JK8WtxIT3zIDuYwIqwqw86
 atvZZ5S5R57dWFiaYO24GFYkdP8MWCZW+NfwFK5hEl6I2ngvKnYYbThv6e2//0dH35NdK8xAPWFHsd
 CHx5X2+IG0MxhZJuRiPPWDGZ08c/9qMkmAAnn7vgzg+SOIsfwHgfoJQZax8o/p0ovfkD63oGjVMRg6
 zF4c3ILYvg0f3E+PP4IguyNpJ16cT2zIstY3ivPQafIl3eUHUY/SUgQoPCIlEpMuRfcZBP240+Gzta
 ZUAv4RmJqTpp3pi1MxyRjMpSNcAZl3vDPVxAAWg2b3ust4VuMUfaEGIUObHedASTcxlkWS63Xm4QtZ
 mK98IU4TkO9DKkM9FoenGrG7Jzh0J5Bdc5UPNfMhRsAiWjJ30jN7yB/QZGeVZLRHGM4hKJHUrIXLHU
 4EpQJ8iPRE140xE2KKne2x47ohznkYrqTZRGoeHMblkN+MX85iDeSo5Gw5oXbgmy0KPLpf5hq2hY2s
 RFKECkjfaHbJcW2R1jxJQ0xOi03LIxrmPfTYRmsiF5/kBKAH5X8iLuVdmVrA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the
DisplayPort altmode output.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 6c09816983a2..d28a51b6e7be 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -294,6 +294,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		dp-dai-link {
+			link-name = "DisplayPort Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.34.1

