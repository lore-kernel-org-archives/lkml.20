Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661790;
	b=M+HtoTHVRkj6P849MY92Jim1X8LmzicR7BVvYcSeRgqNwDTPEzDVzmC2yy1OKHuUMc3X
	 tPuXj8PNWAqtlK6MMCSy0d2kbCB+Fzu1MaJ2UXXHEBy1HlszBP6WJfkSHYnnrTe7o8a33
	 Op2xKg7byGTkf5MKopJ8j41N04VUoN6zZWx6LekANWVRlB6W53KFiHj2fHoyuWXFuh7gx
	 C1Lor9Sl01IKs/HV/nNh7QlI4VBjqMqlFx3RMlPEGELsssXw0bV19fuvK9L4VaQYHZ+WI
	 NZ30TFQZh/X1xsn5+mmC2IdHyMvy/NQw2bXXGPPdkbhNX3uw4ZJnBsSk0ybNpOeHNUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EJKNlBEgCm7p+7oPCoUM5zbUFRV+dndiBCZolGIq55k=;
	b=N6+HdYXjaiRRJjiQsEtMLRU2oKgxNw4co811SI8W1dBRVdGjwD+xgnOcNpAORIqxNFNd
	 UBIsaVgsUOSsFaLBGbRg6EMKFP8Thdyv6Vyb0YkAEXkQlCFT2GkCFnZXZ0NlWYtBGSmsn
	 v/n92NQ0chkF8upFCwglb0ORFkbYCwtS8swSQ2T7Y6RHWpAKFSgu0pLKcqr1cIZP/3DAp
	 6HEdCqoSYf4M8ik8OoCfJgZv4OpPFipskqqvl6mJyznKZ7DsFt5Vrxkhe4qwcUevWQ7CC
	 3Ya8t2kEcOoIUDbhn8IjYvahPTw4EPv39DrXZHzcQzsFK3sFu+VUrA0cOMJHWq5ePjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H9yeTlAh;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE5260A2620
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DE5260A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H9yeTlAh
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so1719845e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661788; x=1793266588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJKNlBEgCm7p+7oPCoUM5zbUFRV+dndiBCZolGIq55k=;
        b=H9yeTlAhmisCua6DzWdD41f+GW8SU8mecq4vo8AnQAqO9/Px8uwM5dHew5UGa+Cz6j
         RWzmpG2LkyDXIlpWtNhuv5iJtPwn9AQgCCIga5QB6OuHBfuhrAEiScykJPjrkRusldX6
         dOtYH4sPpxHj6ij3mdz/187XGF8mx11uti7jd9fyHW3fxmoe2SL0nDVkKOdlCeyp6+rN
         ndCvEs3YnWwup07xVLhPl8n71TJyVnsZZWEJr1c18Vc7OOJXv0aUCbMCC14wyE+m90Yw
         ge+RxBCc0KuVWOaeGgOSO0sUr0hM3OMX4rXpr7HoyVYMW/Un1s4YZKewf3HFUWiBvelN
         1OPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661788; x=1793266588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJKNlBEgCm7p+7oPCoUM5zbUFRV+dndiBCZolGIq55k=;
        b=XSVmrxgjup/A/2tLEwuO/65i8wQ4h+RkrC+QZfvpgvd+vm35Y/rBFCPstSEPLZOB7k
         gz1KsH/H+TJGYg78r3TsAahP5swMh5dGrHKE6o7kc+nSs3Rl3cvNC77Sp8il5yso3sVd
         5W8nZ3OLt6lj7pDMaeOO1I6v6c+yUIisnixZH63qLojAQTpD+E8wcWJwusrXE99j7PSd
         gPO1HPQATA8ePuPn37YrxyZvz1JpWeq+TRD4YfZKCZTIydXSlm5yPiiA02ETcjg5M8hU
         0Q4I/rU1AWJoAGwvqLrx8toq8tOPk6GALSEXVPoAZljJ8kNFvzf763iljT8hMrV2YPnl
         8wog==
X-Forwarded-Encrypted: i=1; AKwUvBxhKIpRoO12KyBtNUiE4e84PhdR1gP1jCjnltcs63JDjg6e4IfM7bc14jpZUJbuyNKIZ5RyVyzxNN5GgF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLos9OF5oH2aH0GiMEFDIOmbGWkBO3xx6mgl0pKTzsdJmeOrIha
	p9fSkYrn0+lcwNYKzfyYwkVzaJo024BQvgfEJM3Hf1MAdcIM9sOuh7hG2y/j6v3xfio=
X-Gm-Gg: AYBFou3CuvJNTBM/xm0aefMmVz5jmiAQz0AHZg2q+HC/zws36FNeJ2fZu1TjKvEUHK8
	Ueh8qjjcUb0hEYa4tthuPXlRL2l5w3GW3B35ls3qkz2BfpfJxuCtv5Fnlc5TCqpuDSrJ8BBPjuf
	HGdmnd1yVlH2aH1LUHUoYp/cI1zIupK/3Q+DjHwO6YOasgXveZsakScIsjG8+3DYr5gBLyIR9v+
	VFMRKqq+5qRvOALhiGY/C8NswOskZvvSK0hZ7mLZV9IiAaE885BkChH/bG2YCWRWbd60nihokI6
	etHcs+JHAsd1fxIRoE79Fl33a4lcLf4rFriLTGYq63T1gbHMHWQj1XBrOPij1LOQcHqksoq7MiL
	L3OLJlzr6UDSwKM2ZKW0AAffyIOL612S6+OXyYRr/8QbYVjqCOgWx4UOsiEEe3PxSXMM8CaLQTo
	afHHZR2zvPIoV3BpIvXlismtCWsiWBxSfK7Jv4suAU9NGop/wRNONmb5MF7AjncW4o8GJuPbtqC
	L7kClnKPryDV2UVD+LzaOFnDKJQw+sAN9aqyhYUJateBcz2PQayGvyY6bZw4u9pzknjMgE=
X-Received: by 2002:a05:600c:c16e:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a1fdd2aa12mr101703615e9.12.1792661788000;
        Thu, 22 Oct 2026 02:36:28 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:36:24 +0200
Subject: [PATCH 4/5] arm64: dts: qcom: sm8650-hdk: add DisplayPort audio
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
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-4-8a189c71938c@linaro.org>
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
 bh=Vzm3fMq8aK+Ti8sUZ/4U0hRCLJJYQ9le4GA01KYf05Q=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkXfSz6pon40QvPlwPcCqOBNsGmIGdye8IN80bT
 v/jWoNqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZFwAKCRB33NvayMhJ0Xn+D/
 9H8I7lfUORQxWJ+UfKeeMvM22W6dCz3bOszJL49C8ZmKtetMpLDbp5xtbr6XPkv14s5pMC+G1p5y+/
 TA8pb6E/i5FhS8JXXDRlsZOxhz5kHxpYAV70R03L5s/DLr+2i2Nhn7bFfx9lwRrhV2rhmcBL3qsBF8
 FpIrGfBwQe68aH5bpHIo2yBDRWNpvEEivV6/KcBsIbs5lEaLO24Y81bgy7fwxFtFar6xA6I47mXsb8
 bDkKawZhYvkOqW+flyFsbT8mcz0axUI4K8h6I8iD5KM2R5tEPGAeQ1dAQSrr4VOhAuPi1igMgXamow
 u+HK5SSg9eD5obIvt6dNk5Gs4zodPg6QANj4B2xgFU/Ne/F5Ancye8aYBG0PcHeOMS8iLHkPAjmLxa
 +AzMBvxXnoKBMK8BFP9P/nqvO0xXek1HJyK9chgBT93NWKGTQznPcVFM3xcr3FBQtrBnNk0bYBqlN8
 J8DpSYMiuPEOrrKsiMzqO9N1g/tJAn9rPpUpHpBAGEn2nYRaJyr93Z8Sc16A6NwNT/w7YjjCYP8F1A
 j1+obPRPwreIZCgGB3XNzMXkmRT5uhMKkInLNMXPY4kkYOpdvkZS9HuMvxuTGKes2GasY1K76Lrpfe
 0V2FneMUZ8NAtyUaBCCQlVqdermwR1M+RDscJTqoNR3FMikFHt6QSMqgXNNQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the
DisplayPort altmode output.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index eba989e6766b..9e603ddebd72 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -234,6 +234,22 @@ platform {
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

