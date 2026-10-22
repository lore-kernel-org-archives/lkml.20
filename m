Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661791;
	b=GbZqq9p3gyUThTwBkOy0errWomtv9lIo1Vdb6rKiRMJxqtaISNelillwYbsAoyPLmA9G
	 FW0OgViDEljmiKHUsJrtNNKKOAognEqYwb6cIRHvqJBnZ87b/AQfTGN7bELsLbWkc+MBG
	 Q3txMZ5cltJ8h97T1aX9xgNjOZq3sWgGU5Gln/wlAckUvZIBteYRlPM5BXE1A4ZJz16Km
	 hM+/lkf3lQNvgRIa3RN8vsBSB2rYzw/+xCLo+HQs1qXeBam/GUvd2lSF7lUDw1H7cZ2ty
	 6cceWy8BX0ZIgkyqnmjhrlphSLiKGj2OikjAxJm5RkLUGJgKrFygds5j2klMaOxTYng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TeRZMXuej1vip+D/LnUqBGpOH5R2x+fKEjyc2dQze2I=;
	b=jzK67ZUVJxEnYfQRzmuMGMc+Oa1PsExkFLnRSeVQZ1sadNVW1NVl6jirH8Ibo9vddMOb
	 AkL4HjuLD7/EJEr+VDwPU5d2KtEJb55NobyqTWTSzMRTlj1uRO4Cz/7aVqGdrUp6DQiQl
	 YtDh/jNkRpeNEl0QkXTvdmmejSIIzUk15kTyjY5Qi6srdMJvRuvbu+Ht956flRFYzBC0k
	 AvpVC40yhju3ryscRz4VqDtP25wkPlFACtw5/KnYcegF76AWNA4o020D3wvDqXuHkoo8k
	 K00Pj6dBYni1vIwRPZnspSBcUc8dMm+z7UyWfFZ/SnT4ni2z0AtJV4Clyk2SO8IM2Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=b6b73ZRy;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9755F60A263E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9755F60A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=b6b73ZRy
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so8180055e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661789; x=1793266589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TeRZMXuej1vip+D/LnUqBGpOH5R2x+fKEjyc2dQze2I=;
        b=b6b73ZRyxrybytJWvg9Gt+ZEM6ida9EMY8QbPkHfRjXge9jB2CaVy1nBOLIw0L6n64
         mdFADsjiPvEmIP2sDeMSqLDr2vCLq15xSLVzZkorVGTV5YCZ0boHzADnzP2sbkJ6j4IL
         dCCQmbEuwxmobeu5A2OAxUAEOp1ANOlYajWPNRHJLY4HMN0KrMyWmU0x1zj1NJVqLqYe
         SrcxUxrOObJlyvsUxpyD61N2ygXhpchdXLkdw588YQ1qkXi5x+3DxY/Y5WyGXW1zMptL
         xKUqhYRpYDc1hhtMzg6d4io2wFuSzndnC8bwvePFHJMvDQjlFPmQ3yQ4FfWjiu34NXhY
         jK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661789; x=1793266589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeRZMXuej1vip+D/LnUqBGpOH5R2x+fKEjyc2dQze2I=;
        b=Fr9RM8RGIYh+FXWPp8FmAtvnFTD4DwjNPn2nXZEzBbFbIdjLv4m0MgIjV0yFCzDgvT
         07bHDUGX/sWpdAhONFhlZy0D++UL5VoWlctghMWp8s2SjxgiWXdUB4MgKO795JasIBOH
         HqE02fKKvWU8CAEThgwcdwTpISBqdwHOybfiQHofVg6Ngz4Nb1UrsjF+hTKKT6lFPGH8
         tzMRhhVOyzvPnw7PMhxZQ8VAWQcSfOvrDCzY/E630P24NwNDoKKH1vhEEUJwgogUULrY
         NfiK3qlkVRLDbjA5YFKZpUEf6xGnz3Hr7CIuPlIr4/z72PxGNxaOo7xxX5UqdT1XHDDr
         7QlA==
X-Forwarded-Encrypted: i=1; AKwUvByXSEt8PN/Zn746wRtfA1w4uOfuCfSs2c0pHw5PR0gsJpjlRD+Wg3yVvuM09FIBMWi5wIYUOCyl860IIlY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2Mu1Xnde3kbgyIrRm6ugWJ/pddY3DuKgLM4R7kSeyGXa/gKTt
	Az1WWZsPeR5+o0AhRbMGRKhEKbmw0ydfMTo0uHbP6/42tMOkXKnvyEjSHsakTcfTGbM=
X-Gm-Gg: AYBFou33AWwzR2jAT91Cx2uhcAH+x396dHXsIyLfYrHnXHP0V6d01zyBmpWNzBj1HBd
	tcPaY/R8IlgzuOF8j/RpXjCVu8k3bKUu/oXocyCedeTipKX2jOuuuO5LxaH3qnanl+vu2qgMEPj
	8FmHdTyQ4Fnp++UYmQMt22U9HhrcmEx5stF1s2AyfyXcrT72+70TCq9GBctA2MvNCxlYUHKc4IY
	zIeLE5NUrwrUF19lGtvpk9DhpYhlRrPQi5Qq9PAionvUdsiU4R70g6PJ3il8snyhw6edetpApGM
	SaEnZyEJiONtkkHo8cL74GFfP85zjNP+LIgwmJokAEQBOjL7BnCcFpg++g+JMOsSMqGAn6iZM5F
	hn+c+lRY6yaP/Z4N+GzArB66Om7yG0jq+sHBaytxnh775tkCUYQQN3U3tEOF/OJUUBn8D/ejT4W
	4PyrYdKRuf0KX/o8+BfV3vjylcl6wa/UpjxOWKv8m6dzOzv60z9LDTFYeFOBK6K+ejIlQeWkR/e
	mmXmTpzH7+Q90yeVAArQmL6NcDcjKLDLmZG8O8EI+ezLZbuHOxYakj1nwRUy47rCJGVXjI=
X-Received: by 2002:a05:600c:34d6:b0:4a2:bbd:ea3a with SMTP id 5b1f17b1804b1-4a20bbdea84mr8960065e9.6.1792661788705;
        Thu, 22 Oct 2026 02:36:28 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:36:25 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: sm8650-qrd: add DisplayPort audio
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
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-5-8a189c71938c@linaro.org>
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
 bh=h5ekk/v8cfSdkNpefv9/IcGORcNHW38c+dJwzsUJ6fw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkYrcPOhObJb97sLE1075e3wXJZZjVJ46O4pBAb
 Qs7LfrWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZGAAKCRB33NvayMhJ0VQCEA
 DFz8j9yfd8BLHUk329queLQf3+BCEPHHk359q4pNIpE+OI64CbupPPlZyD0ddtksqEAz2eYNyVald2
 IIn21v3Sv54VpYwvuNGWBZbbQKTKJEYjlJgy/aG423Jr2Xu6ErZ9w2BAJ1EePM1k3Pr+ejt2ELAoac
 sALJrGn/2JSnA6sdROpGc3VB2C8QLrj75DZdKqSA3/YLkNcf8SY0UQNbqbSoVLGv8hscH76Hb44d+q
 Ju7IZmG1AbvMxwuKMFg56atfLk/qoTqEYPoWi4T3BifKwT+V0IKwnt/V14sGqB1NMPmwssf14FJSuU
 3dLhFvMwYLbv/qFQezvPht2RbxsCxeVSmR/hXJC5zN4tk0etsas2SvNaTfuPjQgPIUZph4W1IPnLeD
 Bsvp6KRCKYbkXxhFqoED4AhbufuqY6BVc1W5mDoTBSqNYrfHE0KKxTHmLVq7vKnsDLYZ2oVTy+WmVr
 2y4wtRLFx8mDzZ58huJmKLnufKj0fSsEvHSTVGNB38eVm2hLghinLr/3hUI2TZb2BW4wDtaoVaGMED
 gskIllnCXvtcysXZ4ZAmsE5iiPmDkvBleI92NP7NwP/2YsXVeY0nXFjgnB6SsHXRCIdQTCxdHRWKth
 75HmA4iS+of3tKB4ICkxsSjHHlk8OW5J3CMrFir6mzUxKMZ6Zn4oRv5AE6iQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the
DisplayPort altmode output.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index f693ea6a5461..11c58a4aba5c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -156,6 +156,22 @@ platform {
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

