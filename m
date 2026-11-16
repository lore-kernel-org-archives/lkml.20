Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814803;
	b=UCj6k0sZ5lyFB7u0Ph5lnWe3VzV75RuhdWsLKkoGQ2trpmzTcvS37AIXiAu7Xa+dBnjb
	 4e8J+9pkLzNI8PMCsMX/fpaar3xgmdf6M6kNol3W6vitNbBlWuLqcVwUl5HvwpUZsTBGG
	 1+s7PQKDNgm3RaHxQg4eCp0heQCMQ2JUzuyb6zz16Va5eRs0V000XocW05ZKoFm4LuPIX
	 gOIaZrmoLi5CxAxMgSSW9qEFyLPwHQJeh2GzXUok8ln1SPzw/dSX3C5vIE10RBRM2FoZg
	 LGuq+N51sziLmVkV1yBOvMjZBMI8OeQMctubEPBVsFWIyEUgSMlqNIiByAzkYog8k+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814803;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5pVRHQ0W1QnsapmLoeXG0oPwr1W2UYGQoSAiPalwOLQ=;
	b=QPMND8eT8hWIs7dtSNs/5mesGdp/VfvSVudKD3O0kSkv2WxbN3MiiJLzJI8tDxP9xABa
	 twB+kH7MiFgj5PqCkn3Pa3M/6wRd5hjqDq9hjB1rQk0k26mjheiUSGRkUAHY3QnhkIH4U
	 mNrypz/xvwyVikR2//XsNdh/sPrCEh0dl95BshYVY8v5G1Y+B/1TvdBCrIkguNUHQTa38
	 RtnDUQCcIkN+FmehMm9I2CeIS5yuto/ODfNYWh/WSToh1vHGkJXr3pCIb9LRcKRRgHww6
	 yxzMZSsn5Ay58QbgVHcXeosNYPsXaLzApUO1awamdJRE/Yk7hRoxLrsRBjvU/h1MZCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJtQUNLa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA7F606A884;
	Mon, 16 Nov 2026 07:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJtQUNLa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814802;
	b=oS9KyMBwEv1Si5hwkUNzRjWF0WgxNj1kOAoc+Iu+qqqe1A/RxUCb1hFNoG20NBH1Ra11
	 vJg9p/Rkdhl2fUq1RiR2GT8R6A8lOBxhfBftYEFMaKKr4RZKhE/8hcEoE/uAPpsOLz/vf
	 5vaaJBjQ+bbsBcKh/jBlFLCRhRDcVY/j4ggOi64zZarMISYjZQUnZUUIGaWlqJ48K/6Ys
	 OqjSSowv3GA/AKDwlUpaz+snb/0duHlEq3LnjchdDh3qyRVP8f6RHNtdhNQbUvW3iBMPQ
	 fkbjYoaOqL3m3H0kXdDkujP9oWK3I8glkGZTBXDSh8Gg54ifc6GaAgIJgPadmWaPk1Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814802;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5pVRHQ0W1QnsapmLoeXG0oPwr1W2UYGQoSAiPalwOLQ=;
	b=Jo7Vioqsl+YrrQJvFxx62RKjmhFPH0bekcYg2rNCh1HUr/I1GnuzvYo7m/BlJOpVwRER
	 CzwnQJGpc/EvWpdePFDoCwIopIlNsv33Y71+d24w3YNGKv99BmSB+N4fL09CyxNejgIAM
	 MPuhTVattPOBJSkR9pLAw0uD488cXGzTwXFOm+dp/epxs5xcG6ckhJD7vNyqvrBd3L8uh
	 XaXEUdO2bXU067lcPdB/PwkQhEP/4M7GFdA88kuqpEbr1FONqM4bqthnHGID0CP8daDzE
	 7qF6mi6y6io45Vpu9QQQPyUbOXZCUM+ky0cPt8i8jSKpR2l46TS5dLpe9K2mZsBIxfw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACFD61F000CE;
	Mon, 16 Nov 2026 07:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814802;
	bh=5pVRHQ0W1QnsapmLoeXG0oPwr1W2UYGQoSAiPalwOLQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FJtQUNLa56kn2mPPb61nbe60KLrlL5J1Up5afLGV2JOOzr6BKRQdpIMCfZVDERMDh
	 m53SGf1ctAlUXG1DgpmQ9xxyeLi3n1he1V8VmxKuvCRxZ3Pa82S96KgI0V6OXQ/Tl2
	 PqLuSG3I21YlW8j1MbjR9RikHVQKF5KCaM/MGusDij/zRN5wuHohvZKjiQNljnecT6
	 x0VXJTZhKDsAwLOycNtXFIedtjGb93iVduTiwqyqHnlpe2RGs9vMc6u+hEXIErDJ5A
	 ikRfLHx22ZgFiTiKguWDYBX1q69nisUly4TCW2eieOXX2j713G63cRKxc7zkPH8bzw
	 Cg2DGR4WgqmBA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 882B44A3AD;
	Mon, 16 Nov 2026 07:40:00 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 13:10:04 +0530
Subject: [PATCH v2 06/11] dt-bindings: arm: qcom-soc: Extend pattern for
 Molokai
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
Message-Id: <20261116-molokai-soc-v2-6-9dc4dddc4e96@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814798; l=1603;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=s8vou5fnIx9b78zzhsGDbecbDyuWppmcjhnd69/7TKU=;
 b=aGyPlDRaRC4/1gbVOiD27FkPook0iz2k1x+sP6U22SOow+SpGXoGmflZ1AGifnqDi9eIFNApg
 sgikoEtBor2BFyTL0S+YDssVtB98aSLYXXVZIHuPQoyGOhBcPZzwuXb
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Add the Molokai (SM8845) codename to the patterns of SoC compatibles.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 179aadc86a9f..19904e5bc947 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -30,7 +30,7 @@ select:
       contains:
         oneOf:
           - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|molokai|nord|shikra).*$"
   required:
     - compatible
 
@@ -42,7 +42,7 @@ properties:
         - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
         - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
         - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
+        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|molokai|nord|shikra)-.+$"
 
         # Legacy namings - variations of existing patterns/compatibles are OK,
         # but do not add completely new entries to these:

-- 
2.56.1


