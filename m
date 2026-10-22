Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661789;
	b=TKPdR1Qn/VhxUAZTtkbJaBEqRadEngbYXDY8T2cBuALZfdGWppr1FQQJd+z/O6RJODgL
	 S48L5g/013j4U3W1K03vOEjFpa9oh+WEBuYMPIXs5gV90Seq6sHYf2AkYwVA6e2mYBK4p
	 ygmJvIanu1WIqrCP15Tm5dqD8YUjYavnI6TnZJsjUU/+YByeoTqAF5ZHBplIzc3u/iKRX
	 S/LcIPc+M3jfTCxB0Nrq3kVL4YcoNLTwyWuX51ESIJmHWDWzfOClq+5Q0OLt2yvAsRCKy
	 7gQW6RaTlneZrU7KTpb1UsAqP6+7HntqONTI/5Q8SGUxzDyQO0fb2M0GT7cwBZ/13Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=BZOYrejQOL0YgJ7ClyEFN4icr9D3tepflpUCdoC5Ddk=;
	b=2NxT4cBTRDjYVN7B/+VOrvG6j7sr539yUMC94VjKXZbfMViZviA0KeH9PFH2lgewST75
	 CQKF5ITMqWBje9oAsFV9zIO2F2Au9PCVla8rubKLZKYJIqGU4jvZfIeDAoAp0RLMi66Jp
	 5z322H0H9b5oQTW8q4P6LseI9L+Lk/xWsXaR6449G/sIzIBBUxkATQCQj+swudd9OruY/
	 DuvniCZGE2diEr4edy6NKXk50o9sLtlp7sNzoBVhmBlnA6K4Y5Hkiu+C4JnfN5WcgcPAx
	 Xiq/jGA95KXKrVkHOJ8wzAE7vq2sgPTW5GJHKLhbYRY2To4priowcjFEkaasFw3ZzAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hUkzxamG;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30DB60A260E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F30DB60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hUkzxamG
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so18886505e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661787; x=1793266587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZOYrejQOL0YgJ7ClyEFN4icr9D3tepflpUCdoC5Ddk=;
        b=hUkzxamGHFvhVCDtj1CW/b8pkYnSHLfJeOmS8a3kCaoCPNzCnN6B0KgfBa3rjLe4yH
         LXzbuLZugymxBtGzo5FzvFgDIexyWkUf53LPcKGCLG12nKpGq8KePWLs6kj133rSw+2J
         BEm9vm3AV0t0XIYCQnsK+uTo5w/eTSdhql2rf2B3/4SPY7TlnbSZ4Pm6OQ1NKqbnsqBR
         YQwZQNPvwyikdiulas4iFn+NBEkAo3Et6umiy/WGNld8dbDzpuJXPNP6D/ZYWUNMY6AD
         DoY+M+5dV8DeB6Cu2ZPweWylWY3hvRIaZNYbn2qDXW7ViXOrR2t8TOZI4cRc5YHW6+Pw
         qDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661787; x=1793266587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZOYrejQOL0YgJ7ClyEFN4icr9D3tepflpUCdoC5Ddk=;
        b=W8RvUMQBQjoeXPR9sfWGvbjsuFKP+G2vNs2Xwt5n0zdfNJaxkcRmXpxV6ZwzQPhLOl
         fCXczsanyDDvugRgyQG9qV1//VMsCXAJJShbUQipdBRWG4rMamkAwMkbFyP7f9kpat/p
         VR3FYvVlKWHzZhNyw3WygbgCoIAaTYju/qswdef4foWScNQVzZy+iUXsfz8Jh9dGFjiV
         mnxQJtzIL0Caq6osza9T2SFYa6BXGH0LC3oW5skRS/oKyO0oeUnDLYWe8lb/n6b7kBT2
         5nwm8+slDxDifySsgv7SWcfkNvqtQSu6nL/0OcvMo8dB1If0cgtp9HFpdGS/xGbLQ3Kb
         +Qfg==
X-Forwarded-Encrypted: i=1; AKwUvBxeVqsOPU0sHwLKXGbz6iu0xBNc0XoaAGMUYc9htNj93JHL+EERspparxFMVD+R4TePNt+PdwE7DBWiu9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLE8oHkOBR7l3dNIuKm5D05BxW9ZYZ9KB0/hXG0mdFE/mb3bd87
	2zYQoE865QNYslBsVqNMvlAJSfIEqIIa+VuJ0yDCI40VREmaj7/ZRIaqUaulz+mubSg=
X-Gm-Gg: AYBFou3j//aS1xnyYFSZ3FkFBkxHgkANgJhusibnhy1YI7GMvTh9LRgl2wngAERBK58
	lbbHjY74nTgD1XuajLxfXMVZfjWapOoUa3CZhCu69H1KIiP3xWK/5K/wthruXxzcXEk63xrf3RT
	NxVKRVo+xaS7aDVcTA6X1ybyB0aXyXF7E8K0urQHbkZV+/nVlODLv8VDB5v4sJpHweNirvIw+B1
	eP558fuwFBfhFjxGvLnEZ7e1GgXhmGrIAHHvlgjADeIaeLG4cqMdPmJGHY8cwDrlX1a+FxRAgiQ
	sFMJfpIa7bTzMPPKCos9KneJpEwlmc5oE6gSGKJslGKiH3wgmOwwtg7bTGXJf0UnFp6GkRmC4Cy
	SjKw/NsW1NqZFAIa8/JIv72H1XciJmDfivnQ1ab/mRnV+qMZ9tKkNy4PbI/f9NZ1kxnIE7CTMDy
	rm/s/6X/gPzdqK9PMfxPJDQo7g50/v7J8pUBW5zpdSTb0BLP3iGpvbbVSBEsn4OlYQmlTQ2FYZg
	8iSTUv5HP/Qqc89nnTmd8oBUf5rxAjKP7VZZ8CG9/vD4uMQYZvoSQbq6wwAkoZjRz2vdGA=
X-Received: by 2002:a05:600c:6085:b0:4a1:d0e4:2bc7 with SMTP id 5b1f17b1804b1-4a1fdafd610mr96044215e9.15.1792661787266;
        Thu, 22 Oct 2026 02:36:27 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:36:23 +0200
Subject: [PATCH 3/5] arm64: dts: qcom: sm8550-qrd: add DisplayPort audio
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
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-3-8a189c71938c@linaro.org>
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
 bh=dmWq6B4Pndw6DTEfJIcBV9nouQ11/jt7zUcfeK+gPCI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkXjrv+iVYQ6idNZbpI2VZE5ehZcwZ7jv0Ex5Mi
 S8j3y6qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZFwAKCRB33NvayMhJ0YUWEA
 Cp4xhhWi/+krtbY5HhA8JOPBMUlAXpWMNtbC8Se5P3D9Pbi+pEiLsnrRGfTq14fJycSX9j6rDUaNEE
 qj/1p+UYGlJHV3GY37+MA1EBmQx7Fv2sfgPUDuypGBWAnMSJd7hPrWD2XiiEhFbWXcksxVUfABicOT
 TXGpOdhCLn3FFnKIt8IaWdoITX6i967VzpK6BADr49TG9jvYIPbdveXK7WxZupt6UOHKwWWvOgfSwr
 JbJKXIcHZcyELRKzs3MoU+b6zJ5N4l2VijN1yhsThhLD0tNmncSYsOFYiKjF06QIpSzWfT/uF0X0VH
 oZ2tYlM5TGTNQn4M/PXwX9uHzi+8lf6WpvT4oKxr5usQGWugd9OsGrHI2QwoJmyQpObOUFjVs8BoBF
 6XslsGWAflb+FliyyCREtR09TLal/TESrArDZjdhWH2uQ+OW0/QZCVX2W/Dz6mSPccJ2wshyt+560s
 w8uIpmYwZvJFuGbNJdSPPoVWUMgaGNDazjvSDXcj7rEFAG2YEhEOW3cS++aeCg7emo9vE2c391e7vQ
 T4WZDmoDFJPaCykYnZKGGojULToR73B/eCa8MeHBqXFhxtVJVo47DjgxO82JzWU/BchoA/ditIv+gs
 5z6UTG+7p8R1W99TcevRebM2LFv8NngHFFt2ObyB9qMb42HOuIdIDxDrt+Yw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the
DisplayPort altmode output.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index a3ab0bd3fb01..dccd6fdfe5cf 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -203,6 +203,22 @@ platform {
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

