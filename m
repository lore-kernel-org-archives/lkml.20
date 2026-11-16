Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869437;
	b=qiJvYbyRy71CJikYgmMHEXYos4CpeKpNa2GdG9dvizvWbqGXX0T84m+26SReuUbeD6yK
	 oC6XJVLjLkWB8BRiYzEMZMxcJc/r2obexYWa3kmIJP427L0LeIWNzDqdfuYH9crEWGccB
	 Y0HDq3CO+Woodw+k9O0e7zEhB+94lYfuA9s617z7rbhi+ErjvZOgF+HgoP0Zc9at42tYa
	 3NAl1Dfgujgs/MfYBqUZa0eF/SRwxBOYx2I7Gr7QvO/J572br3MZ2fEC7BeAyG7qZfSJk
	 fbXqBJmaT0SsYqJtUGi4IhGmSAaoAWwA/t9PtIA3fqoyAbtJeJOhDFgjwb3tfE7r0Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869437;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=e52zOd8idiTOYTVhJAx/KJakLcPRSskdPFGDRB39pPc=;
	b=Inm5xiALrOWNkKy7UsWqa9X+N88ypw69vPoFUxRbeQwmRmo2acmT+7pZVXdqkYjl94fP
	 AxJvmoiR8BQH4i1IH++uUa9BZ2lAkfEPqd6GG+OjOR6ZTw2Zc6zXgNbA3rWR+c8wkjZPR
	 0AuucaHk/CXgitB5CeJg59Xenrne4Irlr/D0rrBF+TAh0vjBbQN95pWKfkgoHavbSkWvK
	 pbg9QIp+dsZW4Ns78HOcxsLKmU4zujtV09GuQyTOXHZdQ5fIKReSBLpEZOv9hjjp7rwZk
	 uL6+UUBpimrgKdg4FCmi62KsMSp8XgkBMdQbCLrJ5FbjOJytqqN5vacf7FcvNnbZBWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=R7UY6+Mf;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=MTzFpfxO;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D61606A880;
	Mon, 16 Nov 2026 22:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90D61606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=R7UY6+Mf;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=MTzFpfxO
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869435; bh=e52zOd8idiTOYTVhJAx/KJa
	kLcPRSskdPFGDRB39pPc=; b=R7UY6+MfjIKtW/4n+YQ6Hck2lr0hdvfnsCnsHeZ4ACSPYChWZn
	51iVNCarIH6OkiO25L3hPodNYyiDVZN3JgAA==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869435; bh=e52zOd8idiTOYTVhJAx/KJa
	kLcPRSskdPFGDRB39pPc=; b=MTzFpfxOZrOH3jLt80PoeC3j2JZnUNtCWwMG6f1p136E+pc692
	9fGZNvBl2vf3mArSfm91RX8AnNo8hX303gQUkecjz8DcgxiDZU5yPCurMB7P0EJt0oyNMUDO7x2
	q8NmJmcBwUD/STyKe12QtEb3Z8wg6zbzLa18v1wHcRSGG6CkBy9IKTq88jsxr+uiLXqyuYY4/3T
	/ODYTNS4l87+0gT/1kEVmrQ7ibK4q8kPUKn0bFmGP7coFg8H82W/8TYV03rFTMSSZzcgTcXYyqN
	5rFrTIKOAInZS4hHWVK5TzNIs4qSk5wwcp0adqlUL7ZExH1Dw1yc2cRadRnzkwTpDdQ==;
From: erebion <erebion@erebion.eu>
Date: Mon, 16 Nov 2026 23:50:34 +0100
Subject: [PATCH v5 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP, CDSP,
 IPA & MPSS
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
Message-Id: <20261116-pdx213-upstream-3-v5-4-7318a19806eb@erebion.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794869432; l=1272;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=BBhnRQuB9kegfveG0S+7V0DZkpgL29LVtDImi9jrxk0=;
 b=GDHDgP5cCv1RNqrfg0KCwDDpBucuWg6Wqpm4Y/6zKH+mujgrlt3LDyv7M1ggUmj3xfR+1Gu6U
 ecqnqbL5IsNC9QHXGg4iTebosgHaGUySBbvBSsIZqYh/G9NF2nsEYr8
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Enable the ADSP, CDSP, IPA and MPSS (Modem) nodes for the Xperia 10 III.

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index a393b7533ccbf..e8808865bf6fa 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -68,6 +68,12 @@ memory@fe901000 {
 	};
 };
 
+&adsp {
+	firmware-name = "qcom/sm6350/Sony/lena/adsp.mbn";
+
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm6350-rpmh-regulators";
@@ -291,6 +297,12 @@ pm6150l_bob: bob {
 	};
 };
 
+&cdsp {
+	firmware-name = "qcom/sm6350/Sony/lena/cdsp.mbn";
+
+	status = "okay";
+};
+
 &gpi_dma0 {
 	status = "okay";
 };
@@ -316,6 +328,18 @@ touchscreen@48 {
 	};
 };
 
+&ipa {
+	firmware-name = "qcom/sm6350/Sony/lena/ipa_fws.mbn";
+
+	status = "okay";
+};
+
+&mpss {
+	firmware-name = "qcom/sm6350/Sony/lena/modem.mbn";
+
+	status = "okay";
+};
+
 &pm6150l_flash {
 	status = "okay";
 

-- 
2.53.0

