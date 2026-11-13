Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533112;
	b=HHrrCNR17uN/BlUPVNx9kNiaeTHDrN922/ZVQVDKy/sJebvhWmjYdt6dZcPfGCR/jCh4
	 oITTj4ap0SGctdZqJx4EB3G0CaW816Slpe9zJQQtHd/WLZaorlTbbvHuqJgigXcltaHyO
	 ddoYJ95DshTN+88D+U+rzLD92HzPjnQMu8c5I3CnGUvxLWHqRi1S3IZnYcj2x/r0TLQsT
	 2J62650PELd750ntXymlV01M67xUNrlWsl2XdV3XOHSdVl1+8od+2BXhUIDmseD2/H+PB
	 QovYx9K2uBPESm9zBT4xMeYIQcbFdDVCf1oRBH71v0WLSDu3rJM2rkUq64aa1nXEZWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533112;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=0h7+1aT1XQG6/iyNPVj4qop9eLcBso7vpCHfOCz/wJg=;
	b=AWqg2c5fvwdFQ8TKNy34VpXEN38ijatTCHYmshYM7i7U8uCKwVYMntcDgUAxwp+DvYrj
	 tCK+ExZkCPx3iBdVG0gZPmpYHWlHiKM33WQsxYOfCkHpbT39KV6jvCQGIyZFrYEdss/1t
	 TT6Cl05IQkXRDAYT0XhTmMy5Jbn9rfeb4oGXcMCN+hdj2DhDabriUPs2Y9qVusknJ20nw
	 CUVl6xXTc6m4fuMjs+pGqDZEC2JBZL35Z99NdAOhL351mauWggkUIk/u2z8dwFBkAYIS+
	 kS6c72PerSBPc8luVL8zUG8Ma/fDcPBBEaK0TuzJnmcVhHT2bXw9jIek9bIB1zp8i/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=99b0vDAF;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=UiD6mtuL;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A2960A5BC8;
	Fri, 13 Nov 2026 01:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26A2960A5BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=99b0vDAF;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=UiD6mtuL
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533098; bh=0h7+1aT1XQG6/iyNPVj4qop
	9eLcBso7vpCHfOCz/wJg=; b=99b0vDAFXTfCfZXOlFL31mbL40yfSS9bdTVzBXeA2GO/mgeGRd
	WYU2rCtVGcWqtBlPngT3J7MogqpwoA05jpCw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533098; bh=0h7+1aT1XQG6/iyNPVj4qop
	9eLcBso7vpCHfOCz/wJg=; b=UiD6mtuLGM0oklJR0/FbX2PPZqXQHyvcx+ya2UUpUxzp6ST3pS
	5yKA+XAcEVYpYfgt+h608Bj4A16idB9ho104Gv5eW03eWn0I10yyvZjzLLmq5oLBbJzOhjzHR00
	BB5AWNYNb5AxbGqPbbcA7D3+H5v4oznwKh1VgWv0uw4U6JvszSyFXC37IkMDwjDFa9UFYvihcRe
	0TxM4JnLGu/2XPKfIMD9adLR9WEkW0PkdCJtnx4+GZt4JSXbavqQgwIE+Jsv35TB9Is+Gqbgiy6
	BT1dnjgQ8d9erKd+O0Ql+lIF9jkl8S4T6+/S17L7QyV7KlV3+5p4Q4y1Myo+K1fmKeQ==;
From: erebion <erebion@erebion.eu>
Date: Fri, 13 Nov 2026 02:24:54 +0100
Subject: [PATCH v4 10/12] arm64: dts: qcom: sm6350-lena: Add PMK8350
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
Message-Id: <20261113-pdx213-upstream-3-v4-10-4b01c50a821c@erebion.eu>
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
 erebion <erebion@erebion.eu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794533093; l=986;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=twKdrU7I/cmmPD/+C53vMHzqRkPt8uPHA4z20az+l8Y=;
 b=TFqZ9Ztx9nwSR5pp90PxPloKA+cGRt2o2bpCSL6lyg8quI2P1jjZedj9QOQsi+bh88c74kp59
 ZWEKIMtYGASC9+NgJ4PVurnqeyG9Gye+4fYWHnLToLvcgkSQYtvmueg
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Configure the thermals for the xo-thermal thermistor connected to
PMK8350.

The trip points can really only be considered as placeholders, more
configuration with cooling etc. can be added later.

Signed-off-by: erebion <erebion@erebion.eu>
---
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index d37f5090dbfa7..79097ae409bab 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -105,6 +105,18 @@ active-config0 {
 				};
 			};
 		};
+
+		xo-thermal {
+			thermal-sensors = <&pmk8350_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
 	};
 };
 

-- 
2.53.0

