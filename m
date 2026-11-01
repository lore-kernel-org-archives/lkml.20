Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575950;
	b=cOWKxX9iA7j2FIwFt85UwBDhMcNyK7D6RsPlgwx9Gr8Al7k68FZusYGzQUnNOldh7XPS
	 ZVq1ZTZhwxRrEAACw00l6HxYLU1VdYpSwPi9cBq5XmC2djB3FpmRwaRKKMqpbpM1UZ+3P
	 DFkswG8HOAzd812bnrRNFBC2ViyzWHT4VfFVtF/E9lRKdP4hPibNh8fx5xuJJ7IZOj1bH
	 9WCcmWy9RNaMFrcFXCBIpz3nkXzq1B5iYtlfnNKX7b1pEEXsOkUp+6PYP7gYK+r9XZqfk
	 lJS5S7Nom53Q9pkdWp077jmF7JnXHQt2jNeRkemAqny83YWLdq7r01eXEy6yjVYYaHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575950;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=YdLfVBIXcpx+KBVxrVKXny42OGdUGd1/NYnn2qwiQSg=;
	b=vLhWdVr1gsB5V42UumKYuvHrkTM/39Hoq8p+fWWXow8wQBJxe1Ii/D+5nBRRCAMGi/6C
	 Dd1Dw+0HZm30TFdF0dy5Zz7phRMkWPU5bYCEXMqQ75W/eH8HlZ0eXNlchHAeticcxi1GD
	 Dl1ZsE05JqNS3trdbkECjp+flYEsrFDlJyYklaZHhVWDAiypdo+/ODf5hZjISpvPGYCMr
	 2k1wedKtvCnrrnqyI7SYRMEtbzK001e86mz6wgIfz94jez2jDGUPgcwr5r4cqFJH56lBQ
	 hKei6ep4SpBWSmsXTrGfwKxfCPGP/HESpj8POXXkRvY5NhtqzNOiz8E46Jut99yPjLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=WY7kLVpJ;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=y4DgZdkE;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE318606A32F;
	Sun,  1 Nov 2026 23:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE318606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=WY7kLVpJ;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=y4DgZdkE
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Date:Subject:From; t=1793575929; bh=YdLfVBIXcpx+KBVxrVKXny4
	2OGdUGd1/NYnn2qwiQSg=; b=WY7kLVpJI87L8zbyD5cwQ3uVWsbeHAru9mHA9v6hYTnQ/iWemC
	99nhCD92rHirmuO720QPerwAsT9NdUn6HRAw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Date:Subject:From; t=1793575929; bh=YdLfVBIXcpx+KBVxrVKXny4
	2OGdUGd1/NYnn2qwiQSg=; b=y4DgZdkEa+lsYZMa1xTESGZgvEKEszef1ZizsI/y3rTvUFEswo
	fvRTkctMlCc2gG3k9fBY6RmaiX1KeuIS/FPFj7DK4i5mHYyTW3CT1XMN5XzBZ0GK6BwH9mTu9/B
	Tnit4YJhQk4UIM5L2KaKCiSOG1Gn4q9aJhwwWwsuxUJ/a22Rpsus+NtvbOvQ20SponKdhG569RS
	u+uUWBUCMb2ldtN4oEn5U+Al+PipA4TVA+MQn1oWjGPG5DgJrGpi6v+RNonVAjWdJ9ceDhtaMuf
	b3w0Ue+bB0G+78rMhN9F5KDKPL1ohlB9zsgCAC58rnGKsI6rA06dxbaiWsGTEI9gZPA==;
From: erebion <erebion@erebion.eu>
Subject: [PATCH v3 00/12] Enable more nodes for the Xperia 10 III
Date: Mon, 02 Nov 2026 00:32:04 +0100
Message-Id: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WPzQrCMBCEX6Xk7Ep+7O/J9xAP3XS1EWprkoaK9
 N2N0YsgeBx25pvZB3NkDTnWZA9mKRhnxmsUapMx3bfXM4HpomaSy4JXsoapW6RQME/OW2oHUNB
 xrPip3NWYI4u5ydLJLIl5OL61m/FC2r9AH4el2xzL/NvGsHUEehwG45sslFsFVgv2SvfG+dHe0
 8AgkjltqWXxY0sQwEHEqxYV5lp0+9iE8actzQkX5F+EjAjcFUKSIsxV8YVY1/UJ3qanujQBAAA
 =
X-Change-ID: 20260829-pdx213-upstream-3-d0b80f749b5b
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
 erebion <erebion@erebion.eu>, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793575929; l=2677;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=ePTep/1Ur/gvnFD3B6+t8eCjbWBC3v8rbA04R3CFNgU=;
 b=Dg7TYuEPt+vWb7VWR7A5OlUj/jZzTD1rGuKxe3JzcAUSrEViPam8lCEBmhyf8eeTFNVUORHvZ
 PCO+xCTWwAxA1UCmYTlhXdOrjQW0hUE01miUeWv7PpLSWd5rs2QmBmv
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Enable some more nodes for the Xperia 10 III.

Signed-off-by: erebion <erebion@erebion.eu>
---
Changes in v3:
- re-order some properties, generic properties first, then qcom,*
- &pm6150l_flash: fix led-max-microamp value
- rename touch-en-regulator to regulator-touch-en (to keep any future fixed-regulator sorted together as well)
- Bluetooth: remove incorrect property that does not exist
- Bluetooth, &qup_uart1_cts: do not overwrite a bias-disable with bias-bus-hold as it is not necessary
- &pm7250b_vbus: fix regulator-max-microamp value
- Remove comment from reserved-memory as suggested by Konrad Dybcio
- Squashed the patch enabling IPA into the one enabling ADSP, CDSP & MPSS, as suggested by Luca Weiss (therefore not adding the Reviewed-by from Konrad Dybcio)
- Configure thermals for PMK8350, PM7250B, PM650L as used in pdx213
- Enable remaining i2c busses
- Link to v2: https://patch.msgid.link/20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu

Changes in v2:
- Remove panel_reset_pin that shouldn't be part of this patch series
- Remove incorrect reg from mpss
- Fix conflicting bias pinctrl, as pinctrl nodes from sm6350.dtsi already contain a bias-* property
- Fix incorrect unit name in &pmk8350_vadc
- Link to v1: https://patch.msgid.link/20260926-pdx213-upstream-3-v1-0-1609c18b5c1d@erebion.eu

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
erebion (12):
      arm64: dts: qcom: sm6350-lena: Add flash LED
      arm64: dts: qcom: sm6350-lena: rename touch-en-regulator
      arm64: dts: qcom: sm6350-lena: Add qcom,rmtfs-mem node
      arm64: dts: qcom: sm6350-lena: Enable ADSP, CDSP, IPA & MPSS
      arm64: dts: qcom: sm6350-lena: Enable Bluetooth
      arm64: dts: qcom: sm6350-lena: Enable wifi
      arm64: dts: qcom: sm6350-lena: Enable PM7250B
      arm64: dts: qcom: sm6350-lena: Enable PMK8350
      arm64: dts: qcom: sm6350-lena: Add PMK8350 thermals
      arm64: dts: qcom: sm6350-lena: Add PM7250B thermals
      arm64: dts: qcom: sm6350-lena: Add PM6150L thermals
      arm64: dts: qcom: sm6350-lena: enable remaining i2c busses

 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 503 ++++++++++++++++++++-
 1 file changed, 502 insertions(+), 1 deletion(-)
---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20260829-pdx213-upstream-3-d0b80f749b5b

Best regards,
--  
erebion <erebion@erebion.eu>

