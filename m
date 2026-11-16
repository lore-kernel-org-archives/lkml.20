Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869452;
	b=I3X37VG0CWsKELHbsu7oun8SKEfZSVnE41x1ETGL4FyYzhwqYLDfDnlvdvIwq+bEQLP5
	 oHSt0b5WvlckhiNPufHhWkt1X+ZwG50fxyS/xcmghFLhu0vj2nJ618gNvwhfqmNwBCbPx
	 ufFajfhPMRPTylhj1d53iLUNMo1B9zd6NnO9H8kkL1gtllB3NahW0K+/zJcwvF8J+X1s5
	 7q2DYKkfo81utu3/NsAxs3CrYJJUqrSEtYwg6061OAr7HcaYVj/IaeQ5D/CNP6adrpjPy
	 aZ0d9mNs737N9KocCWNNHNDSvn+UYAAJgUhgsdHKZzTtydI2/E9Rpxg6UgNDDe7norQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869452;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=W5N2UpU2WP2XosedmWfVJ2y8q8qrsyj1aKQr2fEVN1o=;
	b=ej3rjrUVcMAowGdy3qMKK/tG+J77mYMnTxZnFHlGwiINOgedn/AJIy/uPokAQrSXVuUW
	 Qup10tsWdJRS7XNkP/xylfGZMWIbvmdbKIbpG8VM7mntOwmcZ6uu8uQRAoJobgnrQFWwD
	 VtK/3YlKf/OeF7XK4pmYCQp86/UN6KtCJPwm0keFkZgIZjXJxHno8z4lD8n24i8shZfKH
	 G+FF5rYEdjgxX+waLqicJKKRsRndTqfk0lY8OK16S0XN0g+8IqBDfNkGmGDvQxKKm/DSu
	 zi0gsQCoJ1gSFHnJ3ay3zF2Pdbfcc24Du4ls9227o3m5Q1yFUenhRQJkiVedOrO7vuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b="dqeK/mvV";
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b="nw/dLc8f";
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1522606A331;
	Mon, 16 Nov 2026 22:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1522606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=dqeK/mvV;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=nw/dLc8f
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869433; bh=W5N2UpU2WP2XosedmWfVJ2y
	8q8qrsyj1aKQr2fEVN1o=; b=dqeK/mvVTKZIIsh8snI2c3abbFJFfysUJsNsa/6hQSoMV6mq74
	Vb2v/blFU9bTJ7mDyrOsV6zwjXw4UsJfPCBw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869433; bh=W5N2UpU2WP2XosedmWfVJ2y
	8q8qrsyj1aKQr2fEVN1o=; b=nw/dLc8fOdbAgohWjbM/uxP8Zp0pDOdKVu1DHvXXEycSD4Bsfw
	2GiZwv9xo70JtdPPTq8dH5oCklEvMN1cGCNK0SO3PWNIDNik65RLsZOkFvj8fE0Bs8heOuP48AL
	yV4l1nk3Kxs4CKVS/iaWfiLlqKYCmZQah94a4zFeDe+MYupAL7iuQaG/nkHYjk3LraTSPV8uaZ1
	YEW3oxaK6bur6UE03FUcbWadktaFPQ5y4I76jytQWguVJcJhhYPAxDTfSGnznhLQ+r8LbyPMEE0
	6I7m6xAQ21gN0GzJljskin6bembULAnFb00eR6CuBil6/YfgTpevzi5JbjZaUWLxNAQ==;
From: erebion <erebion@erebion.eu>
Date: Mon, 16 Nov 2026 23:50:32 +0100
Subject: [PATCH v5 02/12] arm64: dts: qcom: sm6350-lena: rename
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
Message-Id: <20261116-pdx213-upstream-3-v5-2-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
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
 phone-devel@vger.kernel.org, erebion <erebion@erebion.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794869432; l=898;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=PqK5DzmB7gm2n3sxiBk3xW0xmQVbP+Ec2QYj1wB7pf0=;
 b=WXnt3SmM9lCg4wbKsx2nY7xSoTi9pxbJHJ9TE9bf4tEHBeOirBvQwPydaKfF9ZAN+6GBDK5SS
 qwRmhRlLocuATn04SL8q6v3nc+PYBL2tuBjR3gQAP1rIrcurSIv9m2C
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

