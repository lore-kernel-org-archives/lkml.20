Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575945;
	b=smVZwW01ipp1QJhTg/Lu63/P1Zn9QTB9IPFe3BmAgKDTblAeEljht2+AMOVdOFvJEGLd
	 De52QbZCpLLwEo4Pub33WYxUhk5N9cJ5L9GyZjtsEgPnBqgP4ccU0WgSy6sjIsFByOero
	 bIWn4nZyBTbV0Wvn1blu68m4EbD1+VLyWJJHPy0u362F/d5H0uUdCoGpqzc0ZTDIZLnyi
	 P0y9l6EHR6fWoXRaHLyCd9pB9ZeCrWqFZRlRXAqH+Oa+VZZweZ95JHTfkg1sFsXQqcxPd
	 Jw0eAmNh/P052pmIfJPg6iIcCMfgZsukTDTJOygyf+K7Mdf7v1Vd/OWlX/gLp7IMyKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575945;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=rtgj7uGXBAQ57urpWsYPPYBFpOSCUOJzGYz9yM6xn20=;
	b=bXJ0G99UHPfhZOKZS01V7BaxTvzqwJMUUnmAapOBzoD1hGNxQ1rReepuE7tu8FcWRY9b
	 87O4NJN8Xm7K4ai79w2dFoNluZsuBYdVJ/GM1FlR9MDz7vz8uSj8+dhrVwwxgBIdKjBGJ
	 ZNzK4Ua/Qq5jnGJ0tqieY/fL256zNbvY0IC7CrtilWPQ2Voq0iBqbnS8e4heHV2dC2Bqo
	 j1WQ/j3UGMR4ov5LB/QbqHnfKGhp9wxPACpEvehfbOGfzB0/2HAk1V4xdYzOeYurDgjar
	 eL07ZFBMPM1Q56kzOj+78S7k2pokoB69LGsbfzRgerIHTRqvrvbqo8V8zbrzN6RYI3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=IBxImPXn;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=H+gTZhPy;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5CA606A33F;
	Sun,  1 Nov 2026 23:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB5CA606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=IBxImPXn;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=H+gTZhPy
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575935; bh=rtgj7uGXBAQ57urpWsYPPYB
	FpOSCUOJzGYz9yM6xn20=; b=IBxImPXn2uj/ftkS+UNxRZC+63C/hdfWHHqQdmpyDUprIkJFwR
	ED4e9C4cyHvcr5t6GZaNqVXMJicDJqBYeCBQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575935; bh=rtgj7uGXBAQ57urpWsYPPYB
	FpOSCUOJzGYz9yM6xn20=; b=H+gTZhPyfLCi/aYh/gX3Wqybld1Qd+49q9klccRKR568ImdGvK
	YQZAhfGI1ux2RlM4Vzhr7xj2uQhUJd3PyJFTBfZ0LwHKmvAeXzXdMt4NsonAkIaQJWgZvIT6sRY
	SS+FtPm20JZDtIB12vU85N9vR7bp8zYha9A/CklQ+AEJWLu7t1i5zVhY40cL3RgZjL1rSpk4nS6
	R3EnzC9rF78goNGpaPBVZ4ltKRVgFOpOg4u4iC8uzhDEbZDJi/Bn6a3G5tWqfgKaK8iAeMBOu3B
	YR2egQB8eA25ZKdQjTFkBSeMWW7KHJVebSUJN1tRKKs8N+Q/TytVXBRtfhQjAwV1lkQ==;
From: erebion <erebion@erebion.eu>
Date: Mon, 02 Nov 2026 00:32:14 +0100
Subject: [PATCH v3 10/12] arm64: dts: qcom: sm6350-lena: Add PM7250B
 thermals
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
Message-Id: <20261102-pdx213-upstream-3-v3-10-cdc3be96d257@erebion.eu>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
In-Reply-To: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
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
 erebion <erebion@erebion.eu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793575929; l=1262;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=u2GwnDmDYcipGyAPUW3uEIoJsCI2qcfaYNBM+JyG38k=;
 b=IBOrQXl5+6tEX3D0k3A8HJObNyiP5YSvLWxOECvaGd6z6aJ+0Eoth+PPOS/xMiKkQ5of5rZ0q
 aBeyMowiTs3CSU3wvr/VwdCCMjFNvdxUrLFkapoqf/e1lKuC+PToj+3
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Configure the thermals for the chg-skin-thermal and conn-therm thermistors connected to
PM7250B.

The trip points can really only be considered as placeholders, more
configuration with cooling etc. can be added later.

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 6d5aa2fce4c0f..4e9707712a651 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -91,8 +91,8 @@ memory@fe901000 {
 	};
 
 	thermal-zones {
-		xo-thermal {
-			thermal-sensors = <&pmk8350_adc_tm 0>;
+		chg-skin-thermal {
+			thermal-sensors = <&pm7250b_adc_tm 0>;
 
 			trips {
 				active-config0 {
@@ -102,6 +102,19 @@ active-config0 {
 				};
 			};
 		};
+
+		conn-thermal {
+			thermal-sensors = <&pm7250b_adc_tm 1>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
 	};
 };
 

-- 
2.53.0

