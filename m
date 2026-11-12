Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794458198;
	b=KwPXlHMzdiywefl3LZF6WV3xcrxrQ78+PYfjLUT1Ac5XHpcM1VXP4j31Gzc+SGAsLsrE
	 wbQ9owUufjVpxzp7hNx9QVvCypO251ZuC8DBP4+bEoZ7OmzVY0wn0L4pYC7z6OkLY1y1+
	 66vJuWv/zDC6pGS5nWgpo3DpxrcOmg4js03cFvEP1SVJPZyi39SmSgoenf41J0RmC5qPS
	 LepyEYex8jUGKb/G1q7fYcVrBVRd6oeHQwizZe9os793RtxFEhifOg1Scj20k3zdDuKq2
	 T5mn+Bi3nuRgrHQZuNnhkggsN6flHRA0ZpWoUzIMHFZZ8xPDzBTsxcatx3MfSeSjOHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458198;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YmUuivT0EMX67lgBQmx7GF/aHT+tj/D59DmrbUzvoZo=;
	b=CPlSFr0qo4XEzTqxl733/zL2nBsJhn5jcBMqg4z+eRjfDJqkxBEHyQiAhwGc4GtQH3Ly
	 IkRTo1j2ltdR8e5OdXOJUPufiGsEgN9btZR++lrU2a50+NYnuyo44blpVtFcDRXYrSI09
	 4FzByerAznjYwJKg1r2/2ZfPLTRxxj+ZxIEtRmh5N6FP9itIlmtw2ue8GD7LrnUiBmOJY
	 Rq2+Np0kSVDkTYrGDTH21/S9wDszDPogM4d074n+WVlDyytKC4kELhcbOmVR9MUZaayDk
	 inVxuLIBjfWxJHDnA1r2OgK4+c3mbm0VPkqryJMslXnRze9nRcCOLkiF1PdnrxC7++A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S1GjAXZL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EBE60A6F6B;
	Thu, 12 Nov 2026 04:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S1GjAXZL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794458198;
	b=s3i3z3YMeiukBQGmhoisDEq0O3AMVtiaK2uePT2UMCwbMci3G8yI9LGyv9ERhnYTSD59
	 URy9aOM7urctTdlqjU11yxXltDj+CHQ+nqQcWv/4cj68mVJ797g4WVtFer+UkWKzUunVH
	 9UEHrphmedPgHgGok0FpmjtHcaa+3/wPIdlGqjcYgTWLGwHScTr4jp1odbqLOpQ8RMvFr
	 bKyIlSiylSEx3zVr5xyarkxYH7npnsdtFAifwhQEh12SOMvG6SC62od3xMxUdBL9kxtQi
	 CddA4AxgBri3s61N5dVR5M5/dTD5CBV+5rJOZ6vhmcqWa+BQ7CgHDSeegJaZ6joM8Pg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794458198;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YmUuivT0EMX67lgBQmx7GF/aHT+tj/D59DmrbUzvoZo=;
	b=D1zpaFJSLCA9v17QpwVpjJmfn1lmiUNk4ybhsJ9CPaPwUHK2iuqUQBMmT87M4LTIGizS
	 HKdiL/OyJaNOpYOaAW/Q9wql8GpsREmwANUsIB6aGn/axnwvQPJIsAK/5nmL2ocG/LDpu
	 Bk7c8AHbhjr80OVT60gU7SpzlBA5Tg/+4Y51Q+s1afNWtGKkyXxUrKxI3b7yP1Yh4BdbQ
	 Q2BgG+hTZawUsCMAGoJ9WPiE2DIP0Mv1LKDMg016WOMTrHLmcPL89OOw73WryiLcYReRa
	 cCXTbDUOgZq5y2MBLU3DMCP4gAU+5nDoUn8NQaK7d6xiRhUFZFGKN5ItpJFfjdn65rw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 970C01F00A0A;
	Thu, 12 Nov 2026 04:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794458198;
	bh=YmUuivT0EMX67lgBQmx7GF/aHT+tj/D59DmrbUzvoZo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=S1GjAXZLPbvGjn4n36A4xWfLWG0s4BuzgzVB8006z4NjpolpK8Sr20HoU6boXHXnd
	 jshvxhpekGOhoRzaBUpdXNOwBJkP3ZDZ213X1761g2SuO8ENAtoQsOl/8zXRv+yNrp
	 0jegKQaVrwm7NoAI03C2ZcepQSKh8U2QgYY+g7yWJ956koGKkCpNVX0yZ+mIST+qlB
	 IA1Y78M0ab9wxp6EZG/f3UB3OltxgrktHg9tZ2XdvKQcWAA+QaJA9F+ZdDDH3UJEcV
	 YGuycaV4Oe05YIb0cbIzm7EGdsSSG15BVnq86BIDEThDtvFE9ZDz6zHhh+XgxPkw7L
	 sVTGgD/k0Ca+Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 26303492A8;
	Thu, 12 Nov 2026 04:36:34 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Thu, 12 Nov 2026 10:06:31 +0530
Subject: [PATCH v2 3/6] dt-bindings: display/msm: dp-controller: Add SM7250
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
Message-Id: <20261112-dpu-sm7250-v2-3-8e925a3a8a7d@brar.si>
References: <20261112-dpu-sm7250-v2-0-8e925a3a8a7d@brar.si>
In-Reply-To: <20261112-dpu-sm7250-v2-0-8e925a3a8a7d@brar.si>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Ishu Brar <patches@brar.si>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794458192; l=893;
 i=patches@brar.si; h=from:subject:message-id;
 bh=fk9Wge3pIFZLtITAxHYwxjW6mCu3Vw/5lCV6h5Kj994=;
 b=lFiFzJzuq5yboIkJUyzITfFHnIqDtDJUcnkrunQwSvBe6hYP9DW/DKAy0hYAsOQTftpAxBTjj
 MF3mNaDU2hIBQ6GcZwmNy8U5XpVz4V3eQ8VUd3xZiZNxMTAQhC/csAs
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

The SM7250 has a single DisplayPort controller, the same as the one on
SM8250, so add its compatible with the qcom,sm8350-dp fallback.

Signed-off-by: Ishu Brar <patches@brar.si>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..d535e090ea2e 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -53,6 +53,7 @@ properties:
           - enum:
               - qcom,sar2130p-dp
               - qcom,sm7150-dp
+              - qcom,sm7250-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp

-- 
2.56.1


