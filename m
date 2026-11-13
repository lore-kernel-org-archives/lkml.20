Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533112;
	b=0sDH9QyBZUXNAxMb4AZrgrAGvMwfFUJ+8ereHg7DMk1NzK300WgXFPBaTxTja47T//yX
	 4/LD37ti3SbSHl/K2+hQedxXftuy1SVfPkFJ23vJac43s0Mw5JC4Uw0Bs17h8GjvdNJHj
	 E2toVvwbmd2o4NwuBJdU/+ULd+I3/+BJgXysCcZaKpZMFKk+DqI9Th12BUWKQUraa90RS
	 +te1JYu1uS6BVBfxLTOL9ilkIgd0P9bLPaTgCw6umErwwn5d5hosHU/4qndrk/uStjvHQ
	 5A30HBY1HuZ36arEn49yDEZuNex/VOFuprcbYWZJzxQjHVhOLl3QG4EEq2XTnuA64ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533112;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=htH3B+ATk3eIVVdnJU5zHhEGsQGg5W7iIPjjlogmzXg=;
	b=d7G2ovJxLWFZXZqdFxS6Hw2/k1z3Pur74HA7967rPVUqH3ml88IkJuL/iB7LmyCwZlqY
	 qJpLsUxLK41ZJtxaonMzzhOp3lRAgaMAX0OpW4jV6LIyAOVlk8jwXbCm943fd80rxPhVp
	 rRhBvtgV4qcMshAa8IcHf31tMR1A7QkcwjWiM3Hw5nD9m2tej5HnnK2D3QK4voITW0Lm1
	 TEYKjSnYVfq2BoPKQbKtO0w6SzRUaRAhznQ/7Ru+WO1OsPCBt5n6wqw1n4XF2jH62xib4
	 BPlwtsmJNc0GtvGpYhw3SyTyQVkzGhCk7B+9/IbmtvbwepQwcjxnHVgpQoeUyNxK14A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=GXcc1N4B;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=HlR5iYu2;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1DC60A263B;
	Fri, 13 Nov 2026 01:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D1DC60A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=GXcc1N4B;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=HlR5iYu2
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Date:Subject:From; t=1794533093; bh=htH3B+ATk3eIVVdnJU5zHhE
	GsQGg5W7iIPjjlogmzXg=; b=GXcc1N4BFFkb4xriVVmaGW/3s1o7MVpZPCTQ0yxTF4BiQUhaaB
	E/1NvZNVIsrLmE0o19olpiIvvN1xV1GT3zAA==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Date:Subject:From; t=1794533093; bh=htH3B+ATk3eIVVdnJU5zHhE
	GsQGg5W7iIPjjlogmzXg=; b=HlR5iYu2GVwebBW7XNLoWCEpy9POhsH+zJZmaspRU3gjhL5EiV
	gS3/f1kTrUewEK8+ZNdB2kva28Ej56nSSwnEaamJ5W2RhC3Zcm4v5tW8bZHK78N3wGTGpxFvOoV
	ZQjao50lScZHN+FSbWFlSZMaykjWklhr4Iw8xLQaXz0T55KV+z3xEedEo7xAGxIJUcTIXBLGkOY
	/sHAimq1qVVoJzuIfGj54v8zxyH7GmPBrBwQ0P1OUvC2B7tzrIus4sPLNGHTFBd8vwtWwOuePcg
	Xuf2R71uB5oFZ5esY6WAwJE7ZYUcK2gGrjwdy8w7ivp5qyhW/bPoEeyTvbpM/wVzMlw==;
From: erebion <erebion@erebion.eu>
Subject: [PATCH v4 00/12] Enable more nodes for the Xperia 10 III
Date: Fri, 13 Nov 2026 02:24:44 +0100
Message-Id: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XPwW7DIAwG4FeJOI8Km4QkPe09ph1icFcmpcmAR
 K2qvHspnSZNq7TjL+zPP1cROXiOYl9dReDVRz+dcqhfKmGPw+mDpXc5C1RoVIe9nN0ZQctljin
 wMEotnaJOHdq6p4ZE3psDH/y5mG/vjxwX+mSb7tD3ROCvJR9LjzFBQ2Rpp3H0aV+t7U7LYEHct
 48+pilcSsEVynDp0qN50mUFqSTkVwsdNRbca75E+U87Xgq34r8EZoJqA8iaqdHmD6F/CACFzwi
 dCeusJu6Nw6b9RWzbdgMpfmJndwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794533093; l=3869;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=3Pa5pf9Jvc8z2x7z55gyE6mseTXvtO+1rGpJyBjOJeg=;
 b=JIPzX0dqmqsEg3mlQ6AJWvaO+tnG49BV6g44WuUm75GBDLTRDHQhtrNsBpjSdCuRnKGVUvZeR
 gjR8CRwvMELCiZ2s5SWP7F6wbeiqyTH2JkUMontvOEmWdWu2TCOwkE1
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Enable some more nodes for the Xperia 10 III.

Signed-off-by: erebion <erebion@erebion.eu>
---
Changes in v4:
- &pm6150l_flash: fix extra zero for led-max-microamp value accidentally added in v3 (this was setting the max value 10x to high), remove Lua's Reviewed-by
- rename touch-en-regulator patch: fix rebase mishap and remove a regulator that's not part of this patch series, remove Konrad's Reviewed-by
- IPA: remove redundant properties that are now set in sm6350-lena board DTS, remove Luca's Reviewed-by
- fix pm7250b thermals after a rebase mishap
- pm8350: disable PON, as pm6350 already has it enabled, remove Konrad's Reviewed-by
- rear_cam_sensor: fix gpio to use correct one
- remove includes that aren't actually used
- re-order alphabetically: &pm6150l_adc before &pm6150l_gpios
- remove a superfluous tab at the closing brace of rear-cam-flash-therm@2
- enable remaining i2c busses: fix rebase mishap
- fix firmware paths to use upper-case "Sony" instead of lower-case "sony" for consistency with other DTs, reset Luca's Reviewed-by
- remove rear_cam_sensor, as it does not work and I haven't found the issue, will submit later when I get it actually working
- Link to v3: https://patch.msgid.link/20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu

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
      arm64: dts: qcom: sm6350-lena: Add PM7250B thermals
      arm64: dts: qcom: sm6350-lena: Add PMK8350 thermals
      arm64: dts: qcom: sm6350-lena: Add PM6150L thermals
      arm64: dts: qcom: sm6350-lena: enable remaining i2c busses

 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 457 ++++++++++++++++++++-
 1 file changed, 456 insertions(+), 1 deletion(-)
---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20260829-pdx213-upstream-3-d0b80f749b5b

Best regards,
--  
erebion <erebion@erebion.eu>

