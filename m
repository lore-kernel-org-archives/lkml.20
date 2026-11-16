Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864272;
	b=G5TAMDS1QnN2NTV+9hvyke4N5/kx+y/36lA2+nKm6OiKtLmVyOZnFigmWTAjFASG+vEE
	 DKdnlY2lVjPdPQNSb478rkwJSfsgyM5JnSikiCBDvjEIKqcESByfX49dy0nQzdtHSNlMI
	 1BF8/FIxXsWcrGj8gkP4Kt6nyqdwFeHs5r/jVtFO53YA08yc2CXnPbtNB5zyRNGEnps2E
	 ifBU8PsF7EkGTT84Zx4oQNUwaMhg60qLZuET3GZ0oxEfXIkKixzLU2IWWWxsa8GJRePeB
	 7jeGV+ox6RvOQh0ircNvszbUL8XdwJM9iEp49AM5tUGHrB7dHg3y8PDQnDBWMYtEmHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wREO8yYhEaVkQGcf5OnBaEHgwkaJ4zZ//5ZqjDA9MsI=;
	b=yV+sUngBJpL48jZ/J2lAnGshs2sjRq0l9CLqhTQlRIJihezAXa8Q+3HxgEqOf66GfnTs
	 vovHh13Qn/Hl5oePQBOVYkOrCtMgTc9a//U1oaPktsU5R0kIKDabLwUvuW45jwUPnfKqw
	 BX1X/uSg/kgOTpyzfB3HT+siBUx56dWESiNNj7IuH8cSBicCBvQLHUZ4kgAF6F9P/KoOo
	 w9OoC0QA9pKgKAI6y/6d0wto9F987WEPzweGt0sG/FFF3G+x1HAn8fb/i9yjNm3Cediu1
	 oQ4WV8A5SWkioLjLn4TIDUt0WvKMk59M9+uR/or7F1AiYAN2c7SGgs8VABj6rgq2DDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RV5akAzK;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD63B606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD63B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RV5akAzK
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb61185057so16915655e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864270; x=1795469070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wREO8yYhEaVkQGcf5OnBaEHgwkaJ4zZ//5ZqjDA9MsI=;
        b=RV5akAzKeEP/HsoNcLz+tuXg/klRUBB6/ajYSY8bldxfs0c2Wg+HpBnTCD/Y8LH9+c
         NNlt8M8zDTRk6x9IMeaNnXYBk2Ukh8FupoMFwapHXDDrsGsCkfnllkxfXzLWS40pizoV
         sauVGsgQDC5bTT8n+BJCAdFB0JvrXevd8l7ESWJ4s0tQwvt0MZM6b6ID1XnDE5Q2dzCO
         agazdYBU5OJ9N6j0YgByNIOIFUyEkYZsIG62Rn/LpoAt2mB02bD6aBzOfZl+yDeHTu7M
         viRJimN2nQmnxbvXfZ+sFPTNDg2v1NTHJIrFyJXRNXveqXZa61J3C0t6dC+tbqF8OwTJ
         EoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864270; x=1795469070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wREO8yYhEaVkQGcf5OnBaEHgwkaJ4zZ//5ZqjDA9MsI=;
        b=Nds9P5J28metzrjiaUnmbSgvcuPxfpVNAIXsdDM4fRhe0valcb0vWKpDQfOoDezPd8
         WNCe7XQmBahdg6+dN1T2AFbccWDdUAn0IZvwu7nBmn+KHiwNeEyOrx1QyoeQUhvkMiqK
         UoLzCvKqZuaqUnCFnNZdR4VAZFeH3GUnSWbNks/vVqu4q9O9mERkNV2fwKIrtuu3CDYB
         B4kT/GwbbEATn1oD0q0PYj5itt3OYMvmHOtLCQ07bM8cLtp/nLJdtjoc5Gw/KTSsaSKm
         3cu8EB1uZVFcDfwot1QfrvjCxgtPhe5gynVquKxNSWsddSdPeDLNFksaRgyxu90MSiBG
         8YRQ==
X-Forwarded-Encrypted: i=1; AL+hErFxyx1gk6XXtLL72cAQee+tO7Ge68HcikKadzvc5fVHafdS/OWVMPFSskHCxzaB1d1K/Oej25lAP+SYvi0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xDGTVgovmm7aRoEaexm815FctRTYwQFZcxzvgYanRRez8W0ET
	ikObeK/1WugcyVjvJOif1laKdg+bbGuOCFU/JexPiAOSwDsQLlSlNp/Y
X-Gm-Gg: AYBFou3uVQ0Bq4y6XFexs711xjIcY8XKcqf1DvWL7/ZsCNmQ3P6ixb3Dqw7iYW8f3tq
	1oYcFqsICNA0MCgVvi703oZvGBFk+HEQrBN1b/ADJpZ68x/0VMH8zJtOQKSWVtZs0V4hf3LkyJ4
	6ggvxbBmDjPRWv7+5babZ/K/tpCNgd3aUUEB0zKTNllQF0N34X/zrJlhulf6zhtopyb+t1U3Sbd
	/IqN/feNEa32/bTYfD3S9sb1UUZ2Co0MUCQf+Ki6RMIMKELPYGKOrpxH+N3DdQB9qeoI6Z6qTwt
	yl2BToAO0k3ltFjYXvxjhADxb66HaKoa8bGArNN50sOkA4luR72cPQFTLKqXgsSMg0tcEhZumgh
	z/Ijjjh0JNVmSEvESMpAeZLYZnagqcvLZEHPORqAUtmPtwS94VlBjSKdNTV1s89GxZqbzrdDOnp
	rSul/W7dq7zlFZABkn6Ki9elswqp+XtrubG2VWU3wGgFhOb97qmir5MFrpaUlo9Elq1uOyKmVTA
	e2BY6zbj4DnvSG37iAn/fF5N5gAAZ9z0vVyNZg3GHdplZCAa0Q604WF1ncgfN1cRFamUxVH49iX
	JhCDXjBj6g3JjQFaUNbrvXdIAWJ33IbcUgMJudnzIw==
X-Received: by 2002:a05:600c:4685:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4bb55a91e31mr246195125e9.32.1794864270391;
        Mon, 16 Nov 2026 13:24:30 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2f61c0989sm2414728f8f.48.2026.11.16.13.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:24:19 +0000
Subject: [PATCH v2 1/5] dt-bindings: clock: qcom: document the Halliday
 RPMh Clock Controller
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
Message-Id: <20261116-halliday-clk-v2-1-28208928da36@gmail.com>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
In-Reply-To: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864262; l=893;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=ZdWzIM6bnI4voexzohsmWp0z+avf5ks6mjxw3tb8aUQ=;
 b=9ADXxuWTDwY36Y5okN2pDe1MsHpuUDbA3CsIUSMxe7gUP2WuRMP+n/AfTAr9ogCLf1caA/cG3
 Q3NVDXq40X/B3Zshwa1u8FXTTp0InIEh6gsOU0Rc03SofrH+/GKLLA2
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Clock Controller on the Qualcomm Halliday SoC
(SXR2250P).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 5c9b653bc2aa..72223566da1e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - qcom,eliza-rpmh-clk
           - qcom,glymur-rpmh-clk
+          - qcom,halliday-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
           - qcom,kuno-rpmh-clk

-- 
2.55.0

