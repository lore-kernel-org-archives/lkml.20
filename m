Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533106;
	b=4fwkY5C3a+n9BLVSdnx5xeFOwiszeowP1yGRbsbAqMoMWO56Q2OlO8Fu/cj7nFSLk/KI
	 xfBNT8l7YuZShuVXib54a0eue48n5mtUAYYcfuKF9eqwsDPqODsuV6fIYQ1e2whAlfBGp
	 OrbgyNRduTNHVAgkeMP9ts/bw0RYSt4y0+rZQmauGGwCozMqiz3s8XWHjI4P5UE0ZdZ74
	 r25b1rQaBcTcNQtRUDWdNcemdnLNu3W5AWpLvJCvFPNObA/RjQVIcF++W/VnuV5p5JA3J
	 Y6ZUzYy4WpXrcIURsVCUWxSvVAPQqTHDb0T8hMOonnrz3+jcHjKSYGvQT+K+eIzDJiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533106;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=W5N2UpU2WP2XosedmWfVJ2y8q8qrsyj1aKQr2fEVN1o=;
	b=2GB808StvZxu2C2RYJZXhxlJIm+XHpXpOi851ZKveBA5XavOeF2Qxilnbz/5C5iCHLrE
	 H4QdmratTO4nRIlFTLzGsBrUCbOmb++DHB2DdggqGUOIagEkz9R3zF1VZMQosEoK8J5uT
	 qPMQXiH1AuNPtQOAl6feFBQaDyFyPYuQxf1dMz1it9xXF2xUXNQw/0b3WP0fh/FYPiNJt
	 m+S6UAmPyi6/+jBRvAhd9Aop+mCjL0c48FV2jt+mc7EFZFIXPGgPd1xcFwlm+pMInLOxo
	 etA9OeyPVjC1bXnDmNc/nlxTNyjgvDIy5PCXUqNmDqGI+8fpxeLbE0s8cMfWkGSm2Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=MjnHBAiE;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b="VWff5/SZ";
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57340606A8B0;
	Fri, 13 Nov 2026 01:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57340606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=MjnHBAiE;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=VWff5/SZ
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533094; bh=W5N2UpU2WP2XosedmWfVJ2y
	8q8qrsyj1aKQr2fEVN1o=; b=MjnHBAiEDaVAfPG8/bfN1F0ChFcUrFayBdTIddksngM/Ai8T+M
	BXII0j0t9cYANEFxJXq46l8athZmUHeIwuAA==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533094; bh=W5N2UpU2WP2XosedmWfVJ2y
	8q8qrsyj1aKQr2fEVN1o=; b=VWff5/SZacMVrTaKOESo0XHubfdxG4RlSAhxZ5Yc9JjBM5bkth
	zZyLG2NIxhbM3XnWjecPM8aeU1NphpErinEVo4Tzcrq/z03Gtw8LQQ0QAb/ZWk69mcBXN3APOWJ
	GB/4ieXx0UMGFcpjYteaX81csoiVeOyFCmnwriJIpl9l+mifdvFgW5iDE82rX/n0k2uJUpseDl7
	0e1cQq3Ccwi/QZwVDGFMM3TZrpCnclxLYntvMmG0cBAeTFHTQdYnRxQ53gIdIErFeonnWhlJwa6
	0V1VYTc15qzC06FuILg3DhZMAlJHlg69p1nFNtfAb0FaAuNy50NNl+NbSS4Ug29jTxQ==;
From: erebion <erebion@erebion.eu>
Date: Fri, 13 Nov 2026 02:24:46 +0100
Subject: [PATCH v4 02/12] arm64: dts: qcom: sm6350-lena: rename
 touch-en-regulator
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
Message-Id: <20261113-pdx213-upstream-3-v4-2-4b01c50a821c@erebion.eu>
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
In-Reply-To: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 erebion <erebion@erebion.eu>, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794533093; l=898;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=PqK5DzmB7gm2n3sxiBk3xW0xmQVbP+Ec2QYj1wB7pf0=;
 b=KE4yKtSMgh6v+LrULyfjg3QcyVawVraTiNPAaxWeSkJnPmJenVRvuM9fkPTZ23aXXPN/RL6/K
 y8dlwnzO0H9CcppyUH1qXWsB2wg5ADx9B/LVtV48SCBZbtleOhbUKyH
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

rename touch-en-regulator -> regulator-touch-en, to
keep any future fixed-regulator sorted together

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: erebion <erebion@erebion.eu>
---
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 4d78c500d00d3..ca44219e1a67d 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -46,7 +46,7 @@ key-volume-down {
 		};
 	};
 
-	touch_en_vreg: touch-en-regulator {
+	touch_en_vreg: regulator-touch-en {
 		compatible = "regulator-fixed";
 		regulator-name = "touch_en_vreg";
 		gpio = <&tlmm 10 GPIO_ACTIVE_HIGH>;

-- 
2.53.0

