Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907908;
	b=DlaaUvod7b7yRKZuRlQieX/dPZ6g4dikrQeQy410T6J6s48lub1h8isSNqBP9vCtfzuN
	 AKsBX/PssivLuykHcV/+udobSQUtOFoITTDW+kvXw3dszopjZJ9DctbRujeMlPCOURtPV
	 rLBPWgBUuwdpHNNiGv2iPppO32p+VkQo9YnaXG50S3FKENjZZefBBFJS11hT0zk/PFVxM
	 O4a9U5oV/UgTEOHBGnv3XDv79/pHyeJ7Q0UgXVjrjEAdBUFIP6Y6sUkcr8SnIgL6JJ4uf
	 +A8lW9CVSMgiMWbb+MTj8feigKwrK68aX3aiS9dOVCAMEMFBLx2AKrpgM9eSFEMtP3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=;
	b=k00SipjNhchRUurQ/PgdzdKwhrtHcjMBw0mJ4+k0SKNdsFS29nMINBQG+uvdgiFlQTnZ
	 5r+bGo+6Zo1EgsS+HyaSa2rXdhjwWPpepzRRC/K9LMh9kbprXlnYq7EpDjbt2+Sgumyc8
	 +uvXny64k3yvsspfsx1nE1fv3QaFs87cDnIWEoGFW+OekUSAvVxYQ84+JdDgf3mt6jDMT
	 5k5FkTUDIP0pRKPrCyJWdq+UMLXtu8mXyPUk+YX6nMcXpmGNcBFGQqyT1x+Gtfp6kwt3T
	 lTVTq5slDmRDmflj5R7As1iJJOHaLM/gqrC9gYU1ZgNysuR59vfLTBwOA5t5RwTOCgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fXvGOO6H;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057F1606C891
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 057F1606C891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fXvGOO6H
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so24004145e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907906; x=1794512706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=;
        b=fXvGOO6HFchZghMJ/v5+oavqAdwYE0FUczZPmVcjMiUsOmN8ET9E9lp0Bx2YdISBDs
         roUj3howt7B+J0uMVmcDh6WdKyZyp3SC7N31jGFtIHav/6hKW82Df2Kt02OjQ+slaZy2
         GsF6YUn4Nc+2weRAUGWJUtnPQRyrdkU9S7C2rLRJdWPNsTqni48qtxvlr7wYLCedQJk4
         F/MlCN9qRxnIQrLA3yXNoiZi1rzI8EdYyyZK1q5aoId91yTE6UJOx83RTNIJz04jkpuh
         6wq+U+O0kEL0B+qvjVs8yunDGqJ4RV+w38VGakbcBHiGjBXWu2u4+misUTWgqfRtJyn+
         8iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907906; x=1794512706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=;
        b=VT2bnfiNPmohRNlHPVyNFWklyJqNpgZIUDJQL8ayi3EHft7Bx3ZkSQNAs01hcMwUpc
         ej+hEHVP45hJgrjle4L+teBaBwin5SKhvVQ+IL5txd1ByAICIV2NCVCtZcPhQP82UDLa
         GyR2JHPiMWDtrcPUY03aHm3Yr550PRFS6LMB4VncUHAciEAt3sLkeMh4DmugQi4OuNKE
         PEXOG5NjKw5HtdEFJUqRR7tlmFI8npkb1YTE66JkBXYx1YRRGg7gIh1Ty+pf2NSDFFRv
         NG3LJm71bVV5ysbTy+toeJr/IaBE3pGaKMFnrrRYbvk5XosL9vuVi5YEJb9l+7esYWp2
         iDwg==
X-Forwarded-Encrypted: i=1; AKwUvByuBg8BZHoipg+GU3nIUgA52ahldYJjFFc3W0UPfKGEOWr0ncfqAvChAd/PTz4ZcJeQ/CEN/uWSZlVeovA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hhSO7ctDPLYuWr3QEeV4nbPBJfL8E79HNxIfyL0hCA6BYe/2I
	qqwbRulqrAjcNkzU5X4ozHPjPj7OtcpCY7jmHpRAI9pmDK02jNk79KOg
X-Gm-Gg: AYBFou2SKkPGHMBmTaWIOMs4iSpYiUqq2mwoBgOMIJi9PXyOV25RKKkoUw2+arN/2Av
	F1wMAJtPJodvwI+K0wYGfeACX20yMER2F2cRf+hrXJRLTHIKAqFp2YIsvbBMVUR25ukEfCGyUNY
	8+iW0O35KPVOeugJvQgB1c6iYlfpSef4jQMD8Y9dChWxj+XmkBSlDxDRrfTabPAXJ/7ibYB+2Bb
	cSXwvf96Xhi8vnwI2JikwfdOVKrCMtf/c3wvAiaL3NYBqOqEXx5zxwX4vPG2Qvng8eavMfq59Xf
	81W7HwhJnr6Voi30IOlZDXvYwTaNTWz77vc4NIbzlwCa22ZAKBLiavXxZmOyCTV9eV2DbSeFYBp
	6X/LulSq3aLO+eK/TL16ikHJ6Zhg4xk+Jxv72AkmjE5QjWydf0DmfBMKvqkK7nVJ9XjIfoY5fSo
	yX7oSe8Ig8WFCBryxymtnLkKjtaOT2H1dhMOqtZk2xWPQAxLPVo5UQLekIORn39zi72FZWOLFjg
	lOnsKMLwCMpvoAUfzurFM9ubyKx7BLmUAYUchkwUoshw4opet77Od3x4NIZEBl+aeGeKqmGvjJg
	N5VUNufBu2tlOutSNQNGJ/as
X-Received: by 2002:a05:600c:34d5:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4b6db1c5e0emr3268735e9.2.1793907906381;
        Thu, 05 Nov 2026 11:45:06 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eaabbsm4204265e9.2.2026.11.05.11.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:45:05 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 1/8] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Thu,  5 Nov 2026 20:41:32 +0100
Message-ID: <20261105194426.1113050-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105194426.1113050-1-l.scorcia@gmail.com>
References: <20261105194426.1113050-1-l.scorcia@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 055625362951..8ecc44a88a14 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -75,6 +76,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -111,6 +116,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0

