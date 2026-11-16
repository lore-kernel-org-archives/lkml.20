Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869444;
	b=I1cV2wK4hdBhApxF2zFRuTul549fNgWATgXtG2M7MbrereM9CEcL9Ow3N7AWcU+jIV9y
	 4Qwlxysg17NZtG0VD9PEylyTUM9VdGlUqIol7Xk+DzQbpJRi1hL5tFJTtDq4GlPynjHDL
	 vEdo76PP1Q/uL5QUHbQYg/zBlIAZsP50IbwTWQNif2khQutgOe8CMGWf97g0qkqsLNPQ/
	 1aC5LHU63L/3bRUhTVSS8l+DELyNGo9GoD71izOMYdzr+Pv624j22QnqgGPEJhqBTNJgQ
	 Nf2AC99DaV6sDz5OGZu76FZFaTgJoun2ISxcJOpMs4f8d3fAb3VZGxXyJi0dCmzcq0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869444;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=4xD30dmOEDObdpX44+YP/xF1IPjXhgbvg/zotJpsoE8=;
	b=veJHO7GLaLOobi1EvENYGufz8I3rQNt7Vt1bJFhjdQfzZnidJuP/prw5vw58rIeTXIsj
	 MkXFm7J3hFOyGYmQp/KzuezTUrWsXcwewzGKJZ2pSsnuW2HBv6fbuPdBaA1eW7oGBve/K
	 sOf7XcjMEao4XFVrZuDG4xbVJ9cQTYO8sHgidjPApknqJmFeu0OO+k7mVFQmQmaUsnzMY
	 OH0CsLgclzH20G2S+HPDYRw2Sx5+zs/96dNXsnvHKQutWbUKlzdmXzrQ00t5+snXulNEy
	 EcrK/mvbVKXjiLRkPu7H1bQ1lh0lhQ9abi94KGbJBIfW+69mJDY+8zQC6Zw6LWk59Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=IlLamek9;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=lUWsVRte;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BD2606A884;
	Mon, 16 Nov 2026 22:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62BD2606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=IlLamek9;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=lUWsVRte
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869438; bh=4xD30dmOEDObdpX44+YP/xF
	1IPjXhgbvg/zotJpsoE8=; b=IlLamek9/lAYn4CpOFndyEXoRJmXQb318CKphmizU9+WPTGNbO
	xs8BxeMKoNiI8+2HG+PhLLnJDFekw9MbT2BQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869438; bh=4xD30dmOEDObdpX44+YP/xF
	1IPjXhgbvg/zotJpsoE8=; b=lUWsVRteXsowyhMDOfNWCyPyw2104Xklst5BYcAYcfKYq7nfZO
	kuuZKZ6Xca3S1leF0YQyrTFe9uH/PKimIF1sRSl6CZpNiaeNZsHT08ejBAyrjSffaZFC0sBRkCw
	TSVJOAybJdBMo+4QCtHHKQ9UpXmbQQM1vdBGXlbKmsod2asr+DSdBiYoYn+yunuPR0oxz0Kjk9p
	a405xZazGth3+38s5bg6ibc0DW9vTBpbL7mTOUPDoxhDfBbFEhcApuXbFFzGymk6O69O0blPeG/
	f4fTpSL0gR8C/Tf4CFwWE+bG5oBoeY9Q/b/aX1opCO2XR3s3DpYO3exZV7RMkNhCH5w==;
From: erebion <erebion@erebion.eu>
Date: Mon, 16 Nov 2026 23:50:40 +0100
Subject: [PATCH v5 10/12] arm64: dts: qcom: sm6350-lena: Add PMK8350
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
Message-Id: <20261116-pdx213-upstream-3-v5-10-7318a19806eb@erebion.eu>
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
 phone-devel@vger.kernel.org, erebion <erebion@erebion.eu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794869432; l=986;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=0JpiTi0xlhB2fuE37TCd6PDdbjp9yt0CI/NdiN5N/Cg=;
 b=A9HYm7NTN6P3pp2yK1nWgMvg+gxkftE8XMqNGXI27ZOpkMSCkOx3PKRFfH3UFs59uN7lN+MIv
 Fgru9r3jycCAh3Pmnp7MdN2BVLP+AHVyT0C7WX3siGEurMg7q1EXYrK
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
index 0bb714eed13f4..b86fe11fd5296 100644
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

