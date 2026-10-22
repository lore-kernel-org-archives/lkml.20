Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661787;
	b=2fXCjgWc1sixnyweL+uvXVyCUZwgwtwZci999xDYhi4pE1sNZ0Nlvok/NQkJDJs7a+Po
	 aghANfeRewalTZCrLtU22XsHXkkK3lFG5M1dfp/N0obbBmyir3pK0sG6WKRIFT0wyTUtU
	 ibno3QQNj9kJ5YfmfiabZq0SBu4fazbGcO0Zs76LWcWl1cOy5hjCo7UfPy6y4s6HiraRK
	 tEJjIjqIQ24kgd6D9xMrKI8F0ay2CGhcsdnvmPEeYaqzOxfs41kdIJae14WbvM/qOXFbF
	 jx7FIX8geHDyacnstfTGYfDX63Vt2yV6Epu++nIKRsODVpFXIJ7DiBXT5yFyzfXG3+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=goNBE2gyDXfkVuotXxQksHTb5GB/j9Cz6WD7aCZPTR0=;
	b=fktgSjoOtuPODNq3SWYg3EZEVtUXstjusvIVNtamOdy0wEzNIJpt2Au7zFVxL9Q/GgfE
	 yODTAYr7UHUBZ/nTu+qrISZM7VY5UGI/ku4QkrZ47zPX0egdvp55h+6qoiYJY8TMwUBAf
	 RhdYUT/mWZHyy16AjJdq4/0iYn5p5cfaGko5AUtjTRk21habwYmhEUFAQLNBGtLMxY/uB
	 G96Tfw2C856H4PcQHVkGcxnXDw3/AFufWt153brYcFlxk8CWwEL9zAXLVAZJr4ZCZS2y2
	 qFIhIdgCIez1HqDxcno7Gpyqi0ZKciR6+Fi4gdVeve0V9KXSoZJSppEPXgmJIKz4cfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z6Gc3KKg;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8CD606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D8CD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z6Gc3KKg
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso4114045e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661786; x=1793266586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=goNBE2gyDXfkVuotXxQksHTb5GB/j9Cz6WD7aCZPTR0=;
        b=Z6Gc3KKg/oYAyfA63MIOzEmNGfHOAR/1Lhci/ackt8SRuDfk37Desc6os+fkBrryV3
         PvczyzJSWYBJR/mEJoMbQxyt+Tln0KuEh8sThqbaEgH3N2S76Sn25SUQZ13IGWROgA35
         aTQFIF7OL5X77aIAec39hFln9l8ZOo0lm8qYzCTkznWspomG7pZcdMu+E3as7mjukHky
         n60co3jOknhHrKl0cYCHYyDGYCvhCFUJq5fuImDk2m33wdz5/hI9mjD9Hru3ddzT9xFh
         R9pPXKtydSMY9Nr1u6EBS8Nn1YuxroQOkoks/GrhxbI5wyRKPARcifwiHG5VnKLr420S
         yp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661786; x=1793266586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=goNBE2gyDXfkVuotXxQksHTb5GB/j9Cz6WD7aCZPTR0=;
        b=e1BfTN5wswRZI7nF4ZiXAYGTGVzKc6Mb0Mg98A1p1yMJ9TOHao1E83zZj+E/T+Jx7r
         wOR7tyMy851+lU720ZTh+P8YZXNYdOD/nGOJMooFK2BkvwNdFoE+rodSWlmyMjlrfPia
         a+q4cQL9WQQcjjUTRqJ8HBkbgRo8U+cDsQwG0L4OrvP7qJGXGAk7PEVn/N1AmfoxY5Na
         wIbcDt8/xwHzuTD4SOlyffO8KeRARZgYEMKmj4TNKRuR95mdUcE8wHfXDoo5N1+TaYwQ
         aV4xDqSeo4dHqU0pUKDEUds11ncLFwid+C5BPfMIZBGEHC1k0WWSxhADJecEaJyuxDjB
         bEGA==
X-Forwarded-Encrypted: i=1; AKwUvBwCy0B868mmKEjzKjTxvVgttgddr+22eFE5+qNMwhjk6tyrXNB9WrO8qpY6ASZkUDOnHtaB2uYnmEeCLMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJw8XXnlgI2N9NczpPgKAETS289hFmndmfmil1NguMsyUhk6ZS7
	sAzbc/QKvCaCXtIv/8bve6a32Y5mkqfo+cjnczHVptiHuePt1jVf3854i42dQlilU4Q=
X-Gm-Gg: AYBFou0V/FuEeExZwSEEls6xZW/PJJHOpL3FHzHkcnc2L/6A1eQrXig7KD6SvBn12b9
	J0FVnSTuuZimNLJU529foTXnNC/VPdQnxeDUGizlbI3ZAtsNSxa1JMi6L2SjULijX8ukUZntZKI
	tvtxdgGkrXozCVuW294tuqsdnq2gnCeK+c5RCu86rmn8G+/qVNfpum6OU2JQuQ6q1YQGPTHUv0r
	mh3GJ20dOxGdyr8S5fx/InTTwt2Ohhbn0iP0e2sDOUEWkkcjp/+j5RlsVyTh5uQh2rY1vIvnQiJ
	4nRFLj3ULem/OEVd4TjRn1VbC4AnmtgovUXagxXdGfTeCF5IV2MLzqQtHGZEk+HnS/Wg0DcOosK
	77qvrpVAR8lP2gV0fKvqSSQYyo6/cwT4bVdqx7Ot2YnLXm3e01lvEBVLHYb9xw291BP3+MQeTJE
	UzKK+1RmF4LQWJvB52+BfLfZTABQFa5q3DlDAx8gF5R8NxZ2WpSc/SxaZjww4Diqc3Kliz4dFmA
	qMoiE5/OgiYO1q4WMy7RyJWKT4rZtvpfeb4czi6DeUJ5P0FDUQwNDnISiuExhL7bnVHG5pM
X-Received: by 2002:a05:600c:1385:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a204baec93mr38224445e9.14.1792661785913;
        Thu, 22 Oct 2026 02:36:25 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:36:21 +0200
Subject: [PATCH 1/5] arm64: dts: qcom: sm8450-hdk: add DisplayPort audio
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
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-1-8a189c71938c@linaro.org>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=834;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UWXXuzC/enK1xjhdLzN2w+vJuBnYK+K3pjEzgf3HLbs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkWO2ra7tqkUJAk5fYcrGA26r8irPaElpk1AkSB
 UoAXgfqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZFgAKCRB33NvayMhJ0doOD/
 wLPt3RnWZv6Re51uWRfnacz4vZKAixI2yIt0Z61uZDMmMHZLbOWYQ5NFQVisQdk7m0kH8O004YdkUB
 F7CRSZ8TX157lgh1EwhR9iE0SeSf0fCYGqk47G4iEr4wdQV8Xw/qpmqjW1YtP1gcK2SCtplbLcYGgR
 3VssKsOv/n58OUJOfoNmBuPbNd33ZUF5ONpVuIVl1c8km65mGgXlZY8Dv+j12p1A00DsXlIYn/0d0r
 HDQVCt8t2CtOHcMUU7/QbRPcTHv0AShhjJYC6xjFWqsF+pKMcI9q1rUZ81Cmm5h+jSKeJXx1MjVSjX
 /b6Inrs6ELdCuZt4TKJp2lvM4EPWV64mZdJmGBZ8GL/2iiMWkeklLbkTPEV6lZPXae6LrBRZj7Ncf8
 8sCesuWb6BJzlezlBoKBt9+owNX8r+1e9qj9QtnuKLSSiNqrJvzpzJxRT1v2tCgTT1InbqcmiblKOt
 bd/4/LHB9FiIar2tJzoLAntQVKM5N1jlTkoTIqCRJioYuLuRLc9hiLlvDp0fEbC3vCS+vD06TriBfg
 7/nkGWRlh2ew+6N/u9MxT1xvetLK9sO6cg+mMGEHLHFHHoZoy2Ru4ImEI8Nhg3T4vUm1XMxkqA6vde
 146K/0zTO5QCJ7nGOiA63WTHtaPnG4Mjs+50OLjxpxOePrfLgIT6j8Fnko8w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the
DisplayPort altmode output.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 9b55d17869b4..00dc873d91c0 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -1113,6 +1113,22 @@ platform {
 			sound-dai = <&q6apm>;
 		};
 	};
+
+	dp-dai-link {
+		link-name = "DisplayPort Playback";
+
+		codec {
+			sound-dai = <&mdss_dp0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
 };
 
 &swr0 {

-- 
2.34.1

