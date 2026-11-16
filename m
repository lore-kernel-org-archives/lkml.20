Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814803;
	b=gNJ4Vt49KLqzzmkYpSc2JH/s15mwHgVlpt5/K0YaWdrsoa6HxScgfagW9/kVVpP/1d8o
	 p3N2d5kAY+PIbTyo0kQTI9yuGB/KjW8eTyxJECDAlcFsDziG6pt5EaEJNvxAqi7FqGigT
	 g4c/OhicZzaZ5hzICuSgdzjBj5iaApfz9pZ01DIB0vvP3X102/jzbQ7h28F1uaAzPc0cF
	 bbiLyhJ9bTVj7aaaVMbhHVvzast1elE2rl524jbdDSQ/XAv84Uck66zIutC9pE7ynFdnG
	 CVN6TI03LyFLWCkzntVXokiAIexW28NGZ7/N7P7Qo/ExT66VQILXK+P6hkEZat47W4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814803;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7VoZi5B/RGjlP6oWSvDU8Mydj7OB/aru/Mv2JH5tkf4=;
	b=l/7KYfJR2CkK0EeoUITXCP54pWuSYbSFGj0HFuJ+UMTXLlYHu/Snhnhktfz7oyF5NJhB
	 UMisTirpFZqRhAbsPXe74b4eQQ/MHLKTNd6eHX/WAfWohlslAVW/XW4kzA6PjM8WNHHGM
	 sW4IHwkJ55socdLIDtUyQzi3aUh8S4ZNB48kFh6EfoO2ae2giKgymKNOM70Pd6sMxBW41
	 6dAR+xjDsoTaZkhOywlCl36fYDNAfnRdRkp/CUgM5UNMyT202YQ0Nw9X2AlHghdi7k5y5
	 WJLJ/raLCwd21kbFbLU9Gu4GJa8JEcuJ2ybdPzamhQL+zMHjJteTMOw+TAgjHfb2Gjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S8trjctr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8290606A8A2;
	Mon, 16 Nov 2026 07:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S8trjctr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814802;
	b=X6TJvZPl8tGHBXQr4Vty/zqyscWyGzAioXK/UibaUn7niimMEbJntqDR6sYjsTTK4ves
	 7Bxzmcol7O46k4nftIzLd3UGeoK+BmFICfK3govWrquECy/iv9iotfzhtPG0BefzYhk8Y
	 b+5DQETHgt5p1rGXfakQS5V6dPQjxvzltkVS0hCOAEexV9ePMHEuykZVfZ0EGIwTpXCRv
	 jVmTB9iwSgtM380mXF5KqyKeoV5LbuoOnxcplVRimhxPneqWTayUgkO/DcciWh+3HK2hd
	 lm96vZS0oS5ZFEKCNZ2OLLjHS1/YEtRj325U97z1QgCy5T9mR8yVk+UfJH9b3Uljmxg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814802;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7VoZi5B/RGjlP6oWSvDU8Mydj7OB/aru/Mv2JH5tkf4=;
	b=GB4+h+EPkeAT0rBuhxnv5CmmRjr7+Lspqpwt9aGS7XBK7fvvviPd4OI8WrAAZm8/ZRg7
	 35n81ma79FXXk00SdDYldBrgZxEqRoayehjvnyoCVK8uLmO78IQfQ1ieRQ+reVPB/4lL2
	 /OTAKRYYq3k8Kh+mDFNpNi734/GDEsaPv5FLjfpctBUe/mt8W7YlX4UuFOZ/lcHvTutRh
	 C6ccegNU8bzoivPrDcSs2KhNYMgKOXcy1AAA2jSolJ2Kr3pG7Iu0ev0e0Y3kkydV308z4
	 F+/Hs9Gbw/0wDe6Z+pA9QHkTGXMeZqFzv5gAVN7xxipFceydD3L/GPU7JaEoFcKp5iQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB1A31F000C9;
	Mon, 16 Nov 2026 07:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814802;
	bh=7VoZi5B/RGjlP6oWSvDU8Mydj7OB/aru/Mv2JH5tkf4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=S8trjctrceQQn01ZgYD7o1Ksl0cpb2/greLra430jiq1s1zTG5X0qRYSi11zncznF
	 OG+9aaS1V8ZMIlTzxu9NZJgsS/V+PFko+6yKuuaqiJ7fKrA6VMwNjdc2SeOKANQWTU
	 P5lBMN3s25mNSDI2G0jrL0xjwcvyQpb5dVGi5zLDv0A6W/XpIUkGHw4ZAuHJErbX1M
	 SVi2xu1NXEaYsGC/INXZRK4jYOj9sn7uswVAdmBrFRqqmkrfp5skO/F8EwQSRLyxCX
	 /snCcNN3qxF7GInrlx3muzz0YIfUNeZV7nB6yjqQVISkDVaZc6fvThV0cdqmt2/nr6
	 NKzo9OrpR/LwQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 70B804A3A9;
	Mon, 16 Nov 2026 07:40:00 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 13:10:03 +0530
Subject: [PATCH v2 05/11] soc: qcom: pd-mapper: Add support for Molokai
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
Message-Id: <20261116-molokai-soc-v2-5-9dc4dddc4e96@yahoo.com>
References: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814798; l=997;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=xGanvpCFXHUkl7y/e9k8BC3NewyILY/vSI54anNoOKA=;
 b=kuyvxksZmvhUk1Ek4/RZboDTbQhLPZNIq0crxLKFpMu1vONZIdjApTP/FEDpQaZveBz8zkRBO
 a7kAg5vNuSnC8S4EfO5D7bAZY1DtBfyjG5croJOtBCduX2q4zRWX21+
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Molokai (SM8845) has the same remoteproc protection domains as Kaanapali.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index e38647f3d7fd..b7800d4f8370 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -634,6 +634,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,kaanapali", .data = kaanapali_domains, },
 	{ .compatible = "qcom,mahua", .data = glymur_domains, },
 	{ .compatible = "qcom,milos", .data = sm8550_domains, },
+	{ .compatible = "qcom,molokai", .data = kaanapali_domains, },
 	{ .compatible = "qcom,msm8226", .data = NULL, },
 	{ .compatible = "qcom,msm8909", .data = NULL, },
 	{ .compatible = "qcom,msm8916", .data = NULL, },

-- 
2.56.1


