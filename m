Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794479471;
	b=ghy0YkM6veXtKZVi0mcyWTQZKEn7VOfRg+eP+XpCOac22BQv3UuOznfdLvGi5TiQZoP2
	 lQ3IM/CpAPgVYBXjpU/54w3woZBwxdoOEhxTNBMcFJwJ5IvkIPBXR5TskSuptF32uNtJZ
	 NaLcQsy/T62//Ql+3aEM5KjViS2grcApxZn7vJgDoOH1fJAzMqtTaO9vjwEWAnKwmFXrJ
	 j8j73RT9/nY5LzOuYLAQObu9pkHEcckiE+f6YdxymnzJl/zxVo5hLTX0UZhrXURHvDdUL
	 u5xmYFZBOM3FZXFQMmRCx0vicBKWM8R5/f98xajzARbDWpztQT6ZlNJ4UDj53xEmoUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479471;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=imBESoRgV2d2CnSmnZxMUqC/sG5K0E9/d8t7a5xctgk=;
	b=jrF3Mx5MWdFyacz/gLaOrhWzmIYtck3dSlHPZkO3OvQ415INHPni6Q+G4RsVtvluyy2M
	 tDhHLKluROzLZu9QgZh9UYaqMt10Jdtkv3MtyHhQ3awJwAUhj/P4JWNLW52Xi3Wl+cyZc
	 dDk4CHkFAAOAHJs6mCeKzhOXjoBvumTj0m0647bPxOzrnN7Ve3eWZIGFTKz+YHPmFma4U
	 vGZr/GbfFWwFC13y9Bp5Rq+KxPYUpCFRN7NdcQkIrlAj8B34KBYVR/8H+9sJ+vk6g0fh8
	 2WpbKnX9E4OtD6tSoW5XXI2BvrcbOXYcdDvVvBxMw3sITwo9keo1ApJ06Hw39X568Yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=inferno0230.in;
	spf=pass smtp.mailfrom=inferno0230.in;
	dkim=pass header.d=inferno0230.in header.i=@inferno0230.in header.a=rsa-sha256 header.s=zmail header.b=E2ZmU7g2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.53
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E60606A32D;
	Thu, 12 Nov 2026 10:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21E60606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inferno0230.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inferno0230.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inferno0230.in header.i=@inferno0230.in header.a=rsa-sha256 header.s=zmail header.b=E2ZmU7g2
ARC-Seal: i=1; a=rsa-sha256; t=1794479448; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=eJgO9PgXfIDvyCESmbPFW5AZpxmhi2O2T4edhtPZMTLmPb7oa3FXvlY+d3aILCRXi3y4ViH5I3+hWV6B6Z4E1gsgAyKAIcwLrhB5ExsPrrf6BJRXhsgT/jBdRF6PSOg0tcwGl4vTKq46dRHBklbDsogLQsjucngZKZDPnpdyXDE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1794479448; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=imBESoRgV2d2CnSmnZxMUqC/sG5K0E9/d8t7a5xctgk=; 
	b=a1NzeROtHpDtm43krFknTsUECXZceELRCFXBm27pMWmSNrDdcj7FNfyWjQcUeru6dAvjUCkJcvmoxIUht/RMAeNqwEQNLYk8ZmdEdgj+9RWIziJpu6X5hIL8Qf8NpP3EiZK3IbsYtSdVB5LbNp1drthAkrJ8+JITAB1bk/Aw2LA=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=inferno0230.in;
	spf=pass  smtp.mailfrom=mail@inferno0230.in;
	dmarc=pass header.from=<mail@inferno0230.in>
DKIM-Signature: a=rsa-sha256; b=E2ZmU7g2Dsxya06MygQiX+8IPPwX0cMkLC88UsMwmuEB9xjhaxLxBnKlRAZCov3pGe8OOZ43mpan+KatIKt03slP0H9COcJ2qtRvjNWe90+rK2OofV4s/9UyIyp4H+c03UvBCR5DW1eh0nqUmci0yqmpCBG//TWO5YcwOrKPc6A=; c=relaxed/relaxed; s=zmail; d=inferno0230.in; v=1; bh=imBESoRgV2d2CnSmnZxMUqC/sG5K0E9/d8t7a5xctgk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.in with SMTPS id 1794479446315827.1478497824277;
	Thu, 12 Nov 2026 16:00:46 +0530 (IST)
From: Aditya Choudhury <mail@inferno0230.in>
Date: Thu, 12 Nov 2026 10:30:26 +0000
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM7550
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
Message-Id: <20261112-sm7550-soc-id-v1-v1-1-57299906d81a@inferno0230.in>
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
In-Reply-To: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aditya Choudhury <mail@inferno0230.in>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

Add the ID for the Qualcomm SM7550 SoC, whose internal codename is crow.

Signed-off-by: Aditya Choudhury <mail@inferno0230.in>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index d89d3b5dd00c..80e6fb741def 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -283,6 +283,7 @@
 #define QCOM_ID_IPQ5302			595
 #define QCOM_ID_QCS8550			603
 #define QCOM_ID_QCM8550			604
+#define QCOM_ID_SM7550			608
 #define QCOM_ID_SM8750			618
 #define QCOM_ID_IPQ5300			624
 #define QCOM_ID_SM7635			636

-- 
2.56.0

