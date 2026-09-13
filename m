Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4103EAC8F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302766; cv=none; b=X9y/mMfyywrODGoBYJqYDnnqZmsX9Ds3Y+UXCCCDABlodtiG1XoQvKaZubOnU4iw5UlPhZirwsUl6i71Jw/YxVv/gko66Z2NDpx7TAmpUZfdkR6CKLvBZUiW4FUyMzousePjhZB8aRvEAQqAAiWTvqaWlhCZEMt8UbRhiJAJLto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302766; c=relaxed/simple;
	bh=2Gu3jj/bbPy6v9TykMXMcpf1SKJ1++HGbKCm7btm+8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IlNpuEOpFhdFUi28amwtsryv8KH0ipg6HWieLn4DfDKWK6NXTJF7s5/Q1pAymQNGS7fuiOTDyfTMxnj3i/XJtn/KkU9RLITXpVasqfiBJpsgxN5nFC5QRomg4DdndEhIdFSd4nSBI5Q6V/dO/fUaDEG33395XYYfopjBb94qyE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hrLhsp6C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e5Uilzp8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hrLhsp6C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e5Uilzp8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAUakK822315
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TGISa+34lKvjnngXN542isa8VDFHuqbKo1m
	R1pUEm5g=; b=hrLhsp6C2M/z7Y/zgRIQveifwhhB5pLaKveZKGIPLcTvQ58cGtd
	sG/Q/u8Y1mcirrAFL13w91FeMSMaAuFTsU9VsWuhmI0qF1dzTlRsHc1wtnMYSZCZ
	2OsMZCuUGoo28eEx3fNyZU0myWw7Wiuikj0JqSzGqGeDQaIg38BDWn1uT60PSCWu
	2i1lqVjnGwv1ko3C94lqTixqyClRW/LlBWpe64Jk6roUB+BFOnezgp19d8fXwxY+
	H+CNmddzS5LbmSOqBcis8Mv3JdtmEM7i0n5bqDEs7EMa2G7Kd47oE1EtVIwqvFmN
	xKFg6Fcr9MkNiNNXIbV4dwHE2+vhsk8F8eQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cb5wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:32:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0050a554so336637785a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302762; x=1789907562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGISa+34lKvjnngXN542isa8VDFHuqbKo1mR1pUEm5g=;
        b=e5Uilzp8nyxWyzR6O9TOHLcTuOc0ABcJJO0I7065+6LDJU4c/QY4IbSOH1wt26pHNH
         x+w/oV/3WY7qSuCoT2hAXwipyYyOMskBo7QOB7c+8uiPpINkZENaWS3w6jH+SS2/Z5HH
         xUy9LUoKdteNDK8I/jtPEb3hdGg4nYWcx3EAyrSXzGlVq3+DUAuS0V0Ard6vZmPKKSYs
         8pld4DMMjmpV7xB6I8JSWfXeiIWYfgLkBxqRXnlC4iTbMRITLBlSkMIKCb7D875bF13C
         JqZpc4a8N6mHTAs5p497DbN6uk/ge05rHlKZtSBlHA1AW+1mG1aYInvmZNe3o8NxFIAI
         BC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302762; x=1789907562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGISa+34lKvjnngXN542isa8VDFHuqbKo1mR1pUEm5g=;
        b=Rh5nyrPzF7KB9cCZqR8Q9WjqZ97wFwRGPLl3QeRt2F3wXr2TscgL84w4MpV5nZHupk
         ER+EyJR65mUKeXnYBSFKhE2yBR5psSEsMUo/6+6MiKdMRV6KJ9ikynN5VD8bJgVAEVrb
         DvVAKhGBkCnH3W72NUw/SlUMO2k7zsbUkVty4IHovhHcipMSeswhRGOdPZJ3FJBCkYKD
         3yLf58HwuKf4STnFTfNMHcqkEA1b2VZ1QkNSpWRsGrMOjb8vi6b2vuqldn49pX2TIOJ6
         dr/WbqZezMEuIHBDwJ1UYGOk5H93ycV8ejrwfR21NuWSTgNYDi9UE8BRQU9WkWS1JH/S
         I6hA==
X-Forwarded-Encrypted: i=1; AKwUvBzysLgy9h9B4a5NKvmFi/fdMgP1C1wz0+2/ywh8QzKDCH3D2ADqKHUvwmnEOUtHjLmOSVvp14cg/Kcjtac=@vger.kernel.org
X-Gm-Message-State: AFuF++m+m0Ndwvvz0RnWTuQB9Mfw66vBGIzjwVBPCP2No+8zahRSVqzj
	DWbqx4UG3o1SzFL2HQ7MvrKB9HBX37RrURrf3wdd8IqhOqiUstNTNgTutDd6Az+oGs2foVYbuHY
	XJ62eWt1kZi0fi3dqY8m4CoCr4vXkwS62+P5OMTEo3Ur7j8HXpJDIXcFTl3ldTmCmoVM=
X-Gm-Gg: AYBFou13KLTg8OoC0+pmMyvRNYBbBViWodo2iS4JNndD6NiNi3pQJgzWjF1ARFYLOF+
	ei38HHS/iuC6cHW29INAGieH86tvnYInIP6X2WDo9fAbNdfPQcXSkzjneuTUGErk+krtIYha8LQ
	8QSweU64iwCLTO9FL3GD2lc7ZQOva8sJc9jU9BAMwp71WIqLZbQcJxSlM1GA3WUF/IzhEbM7qN8
	DExt6xe9FeixY7dRQRvnhqz0cv2YJGnxrxaJPfm59WtyVraUh339BQWc84LpVsxXn7zqCvsYodI
	T1CAtC3fk/C+kFCvd4QZGJQrFHyAHTDYigjvgty4nOaBjdmCeTAF6L1bcdu0K9DwUA8xK1qtpxl
	hLXjUoQzmbZSPHZE=
X-Received: by 2002:a05:620a:3704:b0:939:8c80:669 with SMTP id af79cd13be357-939ea1d357amr1749449685a.42.1789302761093;
        Sun, 13 Sep 2026 05:32:41 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:939:8c80:669 with SMTP id af79cd13be357-939ea1d357amr1749436285a.42.1789302759896;
        Sun, 13 Sep 2026 05:32:39 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm19252297f8f.15.2026.09.13.05.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:32:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Khanh Le <khanh.le.xr@renesas.com>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        patches@opensource.cirrus.com,
        David Rau <David.Rau.opensource@dm.renesas.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Yingkun Meng <mengyingkun@loongson.cn>,
        Trevor Wu <trevor.wu@mediatek.com>,
        Julien Massot <jmassot@collabora.com>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        Shane Chien <shane.chien@mediatek.com>,
        Daniel Beer <daniel.beer@igorinstitute.com>,
        Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ASoC: dt-bindings: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:32:35 +0200
Message-ID: <20260913123234.99988-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=40804; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=2Gu3jj/bbPy6v9TykMXMcpf1SKJ1++HGbKCm7btm+8U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppfijdqHteb6ODapLAJwSGQ7ZJi+KC637npI3
 e2QGe+0pPGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaX4gAKCRDBN2bmhouD
 110eEACGD8m3jhkC2KzVVUUe8o8bcCI1gu6hurz7BysVWqrOLr+9N8A1SKkFJEgDmHtm7DPiODF
 6XeSJvJ/o+a3QByut6cqAg+/fK5BbVrMpdt8xEuuv8+LLKNXffpXxFZtgKLeqSKPGr5ld2vuok9
 Voano4Gl7Z+ag0wKfK33pSKMGMqBpPeP6yLw1Yhw7NSagHAygBwE4BO0IHg6VFiptHNTk2qvJfF
 VEZ/ZZxYOEBRFosC41YIa9ARhYgASub/Twwm6OXX4CYK5ee684y/zKVSDs1VuF4aICgOqe6VIh1
 Ow7M8cpfUTMSmJ2C9n+OjHk0Q6Glqvn7nuYyeV7wATTXhFlOUe3p9ogDkxNJFyNLImWe119CJqb
 Hk0saYTpKE07Vz6k1AU+k5QT56ClED9Szt4GMTEWcGoaQS0t3yNiNI6EovnQmjqhzjpFlw1tVxg
 P2eTY+nYhOdfx+JEZsjS2C5myIzWy6auSMDHfio9JHzrxNujxpHGb8bc56YZG9DFq/Ha8eNep1g
 BVVZLM8/g1KqVpThs2UR4wDnyAxDnG9EdwhJCxfeXHU4zf77O2iB3fvBoc/shRXEJFHnmQOsHQl
 M/7UvOak0zBbmVxkWjkjUhCfI2Pz1i0dCQv4n//OjFthZ2cKxc2TBN9hJNZT4IXHj5OSup9j1so Omu8DuY2/sBWK7A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8-G3nsUwC24mDV_6Cg3K8Zvtz045sV-c
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa697ea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=D3JuzSTt47YHJieUixAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfXwnd02CySO8ti
 JtIGAlKbpLZDlNzVzal1LlfkGcdskveSsyxjYQL3x2JSxvnHEcDrWVHr/Hr78N+zds3pmTH1TIp
 szTX1OCHAbf0KlQaYbZL54ikowdUb3E=
X-Proofpoint-ORIG-GUID: 8-G3nsUwC24mDV_6Cg3K8Zvtz045sV-c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX/NZV7wh9qoG5
 XGV27oruV5f6xYo9mnj4ZWrV7QYZ1GOrk7aEMVv8B4a1fw9Xvyji6zk7NNVeUz4ef1izIZjfISX
 XDVA7ms5CqgDYJGWHmskxQ+icGrlvRQtfigJBVRq6aazEjLgIHOqkB93EwsZn8IiC0wPDy77d1K
 4MRHJ1OzAD1ysSIF3dLi6IP9osnBxD56nVbMumr2kgTNVnyWBxktrSUZvJeq52jQPNpHX4B0EjB
 3avkVmNWUPuU6nwieXaboxrOFXqgRe9OERxtlbJShqKFPW7f5F1m9e5rRw3l+1LPizV6tcnja7N
 p6xQ3eDq1AQBi0rPrM2MBqC+tKjq2gkoSIKLcLNpEI3WrPGEWwM2GSYLCi04LqeFApgya0icp1G
 4EmNLekaR4/MaFI0Z7QIheB0h7BP5lFkcygrLeJaOhMVupqoDoBJCFVJhsTTbsrmzSUk7s99Qh1
 ja0gD555CgwKo1rGjSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130178

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

While changing the lines, correct also node name to be generic in
dialog,da7219.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/adi,adau1372.yaml          | 10 +--
 .../bindings/sound/adi,adau7118.yaml          | 22 ++---
 .../bindings/sound/amlogic,gx-sound-card.yaml | 20 ++---
 .../bindings/sound/asahi-kasei,ak4619.yaml    |  6 +-
 .../bindings/sound/cirrus,cs35l45.yaml        | 38 ++++-----
 .../bindings/sound/cirrus,cs4270.yaml         | 12 +--
 .../bindings/sound/cirrus,cs42l42.yaml        | 42 +++++-----
 .../bindings/sound/cirrus,cs42l84.yaml        | 18 ++--
 .../bindings/sound/cirrus,cs42xx8.yaml        | 56 ++++++-------
 .../bindings/sound/dialog,da7219.yaml         | 62 +++++++-------
 .../bindings/sound/fsl,imx-asrc.yaml          |  2 +-
 .../devicetree/bindings/sound/fsl,sai.yaml    | 14 ++--
 .../bindings/sound/imx-audio-card.yaml        |  4 +-
 .../bindings/sound/invensense,ics43432.yaml   |  8 +-
 .../sound/loongson,ls-audio-card.yaml         |  4 +-
 .../sound/mediatek,mt8173-afe-pcm.yaml        | 22 ++---
 .../bindings/sound/mediatek,mt8183-audio.yaml | 82 +++++++++----------
 .../sound/mt8186-mt6366-da7219-max98357.yaml  | 36 ++++----
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 36 ++++----
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 46 +++++------
 .../bindings/sound/mt8195-mt6359.yaml         | 50 +++++------
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 12 +--
 .../bindings/sound/renesas,rsnd.yaml          | 16 ++--
 .../bindings/sound/renesas,rz-ssi.yaml        | 32 ++++----
 .../bindings/sound/ti,tas5805m.yaml           | 10 +--
 .../bindings/sound/ti,tlv320dac3100.yaml      |  2 +-
 .../bindings/sound/ti,tpa6130a2.yaml          |  2 +-
 27 files changed, 332 insertions(+), 332 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/adi,adau1372.yaml b/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
index 9a7ff50a0a22..532550de62d7 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
@@ -52,11 +52,11 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         audio-codec@3c {
-                compatible = "adi,adau1372";
-                reg = <0x3c>;
-                #sound-dai-cells = <0>;
-                clock-names = "mclk";
-                clocks = <&adau1372z_xtal>;
+            compatible = "adi,adau1372";
+            reg = <0x3c>;
+            #sound-dai-cells = <0>;
+            clock-names = "mclk";
+            clocks = <&adau1372z_xtal>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
index 11f59c29b575..8272cdaf66a8 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
@@ -68,20 +68,20 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         adau7118_codec: audio-codec@14 {
-                compatible = "adi,adau7118";
-                reg = <0x14>;
-                #sound-dai-cells = <0>;
-                iovdd-supply = <&supply>;
-                dvdd-supply = <&supply>;
-                adi,pdm-clk-map = <1 1 0 0>;
-                adi,decimation-ratio = <16>;
+            compatible = "adi,adau7118";
+            reg = <0x14>;
+            #sound-dai-cells = <0>;
+            iovdd-supply = <&supply>;
+            dvdd-supply = <&supply>;
+            adi,pdm-clk-map = <1 1 0 0>;
+            adi,decimation-ratio = <16>;
         };
     };
 
     /* example with hw standalone mode */
     adau7118_codec_hw: adau7118-codec-hw {
-            compatible = "adi,adau7118";
-            #sound-dai-cells = <0>;
-            iovdd-supply = <&supply>;
-            dvdd-supply = <&supply>;
+        compatible = "adi,adau7118";
+        #sound-dai-cells = <0>;
+        iovdd-supply = <&supply>;
+        dvdd-supply = <&supply>;
     };
diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index 6fdf605ad59c..2be3b34e4f5f 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -94,20 +94,20 @@ examples:
         audio-routing = "I2S ENCODER I2S IN", "I2S FIFO Playback";
 
         dai-link-0 {
-               sound-dai = <&i2s_fifo>;
+            sound-dai = <&i2s_fifo>;
         };
 
         dai-link-1 {
-                sound-dai = <&i2s_encoder>;
-                dai-format = "i2s";
-                mclk-fs = <256>;
+            sound-dai = <&i2s_encoder>;
+            dai-format = "i2s";
+            mclk-fs = <256>;
 
-                codec-0 {
-                        sound-dai = <&codec0>;
-                };
+            codec-0 {
+                sound-dai = <&codec0>;
+            };
 
-                codec-1 {
-                        sound-dai = <&codec1>;
-                };
+            codec-1 {
+                sound-dai = <&codec1>;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
index d412531ef9a2..2e81947bb8dd 100644
--- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
@@ -54,9 +54,9 @@ examples:
 
             #sound-dai-cells = <0>;
             port {
-                 ak4619_endpoint: endpoint {
-                       remote-endpoint = <&rsnd_endpoint>;
-                  };
+                ak4619_endpoint: endpoint {
+                    remote-endpoint = <&rsnd_endpoint>;
+                };
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
index 70f6c62aedca..ef976fd2caf8 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
@@ -136,24 +136,24 @@ examples:
         #size-cells = <0>;
 
         cs35l45: cs35l45@2 {
-          #sound-dai-cells = <1>;
-          compatible = "cirrus,cs35l45";
-          reg = <2>;
-          spi-max-frequency = <5000000>;
-          vdd-a-supply = <&dummy_vreg>;
-          vdd-batt-supply = <&dummy_vreg>;
-          reset-gpios = <&gpio 110 0>;
-          cirrus,asp-sdout-hiz-ctrl = <(CS35L45_ASP_TX_HIZ_UNUSED |
-                                        CS35L45_ASP_TX_HIZ_DISABLED)>;
-          cirrus,gpio-ctrl1 {
-             gpio-ctrl = <0x2>;
-          };
-          cirrus,gpio-ctrl2 {
-             gpio-ctrl = <0x2>;
-          };
-          cirrus,gpio-ctrl3 {
-             gpio-ctrl = <0x1>;
-             gpio-dir = <0x1>;
-          };
+            #sound-dai-cells = <1>;
+            compatible = "cirrus,cs35l45";
+            reg = <2>;
+            spi-max-frequency = <5000000>;
+            vdd-a-supply = <&dummy_vreg>;
+            vdd-batt-supply = <&dummy_vreg>;
+            reset-gpios = <&gpio 110 0>;
+            cirrus,asp-sdout-hiz-ctrl = <(CS35L45_ASP_TX_HIZ_UNUSED |
+                                          CS35L45_ASP_TX_HIZ_DISABLED)>;
+            cirrus,gpio-ctrl1 {
+                gpio-ctrl = <0x2>;
+            };
+            cirrus,gpio-ctrl2 {
+                gpio-ctrl = <0x2>;
+            };
+            cirrus,gpio-ctrl3 {
+                gpio-ctrl = <0x1>;
+                gpio-dir = <0x1>;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml
index 336e11773694..61106294a1d5 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml
@@ -49,11 +49,11 @@ unevaluatedProperties: false
 examples:
   - |
     i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-      codec@48 {
-          compatible = "cirrus,cs4270";
-          reg = <0x48>;
-      };
+        codec@48 {
+            compatible = "cirrus,cs4270";
+            reg = <0x48>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index af599d8735e2..ab4c7d22dc0e 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -199,28 +199,28 @@ examples:
   - |
     #include <dt-bindings/sound/cs42l42.h>
     i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-      cs42l42: cs42l42@48 {
-          compatible = "cirrus,cs42l42";
-          reg = <0x48>;
-          VA-supply = <&dummy_vreg>;
-          VP-supply = <&dummy_vreg>;
-          VCP-supply = <&dummy_vreg>;
-          VD_FILT-supply = <&dummy_vreg>;
-          VL-supply = <&dummy_vreg>;
+        audio-codec@48 {
+            compatible = "cirrus,cs42l42";
+            reg = <0x48>;
+            VA-supply = <&dummy_vreg>;
+            VP-supply = <&dummy_vreg>;
+            VCP-supply = <&dummy_vreg>;
+            VD_FILT-supply = <&dummy_vreg>;
+            VL-supply = <&dummy_vreg>;
 
-          reset-gpios = <&axi_gpio_0 1 0>;
-          interrupt-parent = <&gpio0>;
-          interrupts = <55 8>;
+            reset-gpios = <&axi_gpio_0 1 0>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <55 8>;
 
-          cirrus,ts-inv = <CS42L42_TS_INV_DIS>;
-          cirrus,ts-dbnc-rise = <CS42L42_TS_DBNCE_1000>;
-          cirrus,ts-dbnc-fall = <CS42L42_TS_DBNCE_0>;
-          cirrus,btn-det-init-dbnce = <100>;
-          cirrus,btn-det-event-dbnce = <10>;
-          cirrus,bias-lvls = <0x0F 0x08 0x04 0x01>;
-          cirrus,hs-bias-ramp-rate = <CS42L42_HSBIAS_RAMP_SLOW>;
-      };
+            cirrus,ts-inv = <CS42L42_TS_INV_DIS>;
+            cirrus,ts-dbnc-rise = <CS42L42_TS_DBNCE_1000>;
+            cirrus,ts-dbnc-fall = <CS42L42_TS_DBNCE_0>;
+            cirrus,btn-det-init-dbnce = <100>;
+            cirrus,btn-det-event-dbnce = <10>;
+            cirrus,bias-lvls = <0x0F 0x08 0x04 0x01>;
+            cirrus,hs-bias-ramp-rate = <CS42L42_HSBIAS_RAMP_SLOW>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 7f8338e8ae36..94062c1d9d45 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
@@ -43,14 +43,14 @@ examples:
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-      jack_codec: codec@4b {
-          compatible = "cirrus,cs42l84";
-          reg = <0x4b>;
-          reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_LOW>;
-          interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
-          #sound-dai-cells = <0>;
-      };
+        jack_codec: codec@4b {
+            compatible = "cirrus,cs42l84";
+            reg = <0x4b>;
+            reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_LOW>;
+            interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+            #sound-dai-cells = <0>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
index a1ae548c4b7b..b5cdc7e537f8 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
@@ -75,37 +75,37 @@ unevaluatedProperties: false
 examples:
   - |
     i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-      codec@48 {
-          compatible = "cirrus,cs42888";
-          reg = <0x48>;
-          clocks = <&codec_mclk 0>;
-          clock-names = "mclk";
-          VA-supply = <&reg_audio>;
-          VD-supply = <&reg_audio>;
-          VLS-supply = <&reg_audio>;
-          VLC-supply = <&reg_audio>;
-          reset-gpios = <&gpio 1>;
-      };
+        codec@48 {
+            compatible = "cirrus,cs42888";
+            reg = <0x48>;
+            clocks = <&codec_mclk 0>;
+            clock-names = "mclk";
+            VA-supply = <&reg_audio>;
+            VD-supply = <&reg_audio>;
+            VLS-supply = <&reg_audio>;
+            VLC-supply = <&reg_audio>;
+            reset-gpios = <&gpio 1>;
+        };
     };
 
     spi {
-      #address-cells = <1>;
-      #size-cells = <0>;
-      cs-gpios = <&gpio 8 0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        cs-gpios = <&gpio 8 0>;
 
-      codec@0 {
-          compatible = "cirrus,cs42888";
-          reg = <0>;
-          spi-max-frequency = <6000000>;
-          clocks = <&codec_mclk 0>;
-          clock-names = "mclk";
-          VA-supply = <&reg_audio>;
-          VD-supply = <&reg_audio>;
-          VLS-supply = <&reg_audio>;
-          VLC-supply = <&reg_audio>;
-          reset-gpios = <&gpio 1>;
-      };
+        codec@0 {
+            compatible = "cirrus,cs42888";
+            reg = <0>;
+            spi-max-frequency = <6000000>;
+            clocks = <&codec_mclk 0>;
+            clock-names = "mclk";
+            VA-supply = <&reg_audio>;
+            VD-supply = <&reg_audio>;
+            VLS-supply = <&reg_audio>;
+            VLC-supply = <&reg_audio>;
+            reset-gpios = <&gpio 1>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
index 19137abdba3e..852f27e9dffe 100644
--- a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
+++ b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
@@ -195,44 +195,44 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-      codec: da7219@1a {
-          compatible = "dlg,da7219";
-          reg = <0x1a>;
+        codec: audio-codec@1a {
+            compatible = "dlg,da7219";
+            reg = <0x1a>;
 
-          interrupt-parent = <&gpio6>;
-          interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-parent = <&gpio6>;
+            interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 
-          VDD-supply = <&vdd_reg>;
-          VDDMIC-supply = <&vddmic_reg>;
-          VDDIO-supply = <&vddio_reg>;
+            VDD-supply = <&vdd_reg>;
+            VDDMIC-supply = <&vddmic_reg>;
+            VDDIO-supply = <&vddio_reg>;
 
-          #clock-cells = <1>;
-          clock-output-names = "da7219-dai-wclk", "da7219-dai-bclk";
+            #clock-cells = <1>;
+            clock-output-names = "da7219-dai-wclk", "da7219-dai-bclk";
 
-          clocks = <&clks 201>;
-          clock-names = "mclk";
+            clocks = <&clks 201>;
+            clock-names = "mclk";
 
-          dlg,micbias-lvl = <2600>;
-          dlg,mic-amp-in-sel = "diff";
+            dlg,micbias-lvl = <2600>;
+            dlg,mic-amp-in-sel = "diff";
 
-          da7219_aad {
-              dlg,btn-cfg = <50>;
-              dlg,mic-det-thr = <500>;
-              dlg,jack-ins-deb = <20>;
-              dlg,jack-ins-det-pty = "low";
-              dlg,jack-det-rate = "32_64";
-              dlg,jack-rem-deb = <1>;
+            da7219_aad {
+                dlg,btn-cfg = <50>;
+                dlg,mic-det-thr = <500>;
+                dlg,jack-ins-deb = <20>;
+                dlg,jack-ins-det-pty = "low";
+                dlg,jack-det-rate = "32_64";
+                dlg,jack-rem-deb = <1>;
 
-              dlg,a-d-btn-thr = <0xa>;
-              dlg,d-b-btn-thr = <0x16>;
-              dlg,b-c-btn-thr = <0x21>;
-              dlg,c-mic-btn-thr = <0x3E>;
+                dlg,a-d-btn-thr = <0xa>;
+                dlg,d-b-btn-thr = <0x16>;
+                dlg,b-c-btn-thr = <0x21>;
+                dlg,c-mic-btn-thr = <0x3E>;
 
-              dlg,btn-avg = <4>;
-              dlg,adc-1bit-rpt = <1>;
-          };
-      };
+                dlg,btn-avg = <4>;
+                dlg,adc-1bit-rpt = <1>;
+            };
+        };
     };
diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
index 608defc93c1e..cd69bad107c7 100644
--- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
@@ -186,5 +186,5 @@ examples:
             asrc_endpoint: endpoint {
                 remote-endpoint = <&fe00_ep>;
             };
-       };
+        };
     };
diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index ba65b3f3d066..eb0b9d8d907f 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -260,13 +260,13 @@ examples:
                 playback-only;
 
                 sai1_endpoint0: endpoint {
-                   dai-tdm-slot-num = <8>;
-                   dai-tdm-slot-width = <32>;
-                   dai-tdm-slot-width-map = <32 8 32>;
-                   dai-format = "dsp_a";
-                   bitclock-master;
-                   frame-master;
-                   remote-endpoint = <&mcodec01_ep>;
+                    dai-tdm-slot-num = <8>;
+                    dai-tdm-slot-width = <32>;
+                    dai-tdm-slot-width-map = <32 8 32>;
+                    dai-format = "dsp_a";
+                    bitclock-master;
+                    frame-master;
+                    remote-endpoint = <&mcodec01_ep>;
                 };
             };
 
diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index 950e3eab2942..27636466ba63 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -105,10 +105,10 @@ examples:
             format = "i2s";
             fsl,mclk-equal-bclk;
             cpu {
-                 sound-dai = <&sai1>;
+                sound-dai = <&sai1>;
             };
             codec {
-                 sound-dai = <&ak4458_1>, <&ak4458_2>;
+                sound-dai = <&ak4458_1>, <&ak4458_2>;
             };
         };
         fe-dai-link {
diff --git a/Documentation/devicetree/bindings/sound/invensense,ics43432.yaml b/Documentation/devicetree/bindings/sound/invensense,ics43432.yaml
index 7bd984817aa9..054f80390b8d 100644
--- a/Documentation/devicetree/bindings/sound/invensense,ics43432.yaml
+++ b/Documentation/devicetree/bindings/sound/invensense,ics43432.yaml
@@ -42,10 +42,10 @@ examples:
         compatible = "invensense,ics43432";
 
         port {
-          endpoint {
-            remote-endpoint = <&i2s1_endpoint>;
-            dai-format = "i2s";
-          };
+            endpoint {
+                remote-endpoint = <&i2s1_endpoint>;
+                dai-format = "i2s";
+            };
         };
 
     };
diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
index dc7f4afbb777..69ea611d4250 100644
--- a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
@@ -79,7 +79,7 @@ examples:
             sound-dai = <&i2s>;
         };
         codec {
-             sound-dai = <&es8323>;
+            sound-dai = <&es8323>;
         };
     };
 
@@ -104,6 +104,6 @@ examples:
         };
 
         codec {
-             sound-dai = <&es8388>;
+            sound-dai = <&es8388>;
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
index d8993b5d457a..4c66160e9e1b 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -84,15 +84,15 @@ examples:
                  <&topckgen CLK_TOP_I2S2_M_SEL>,
                  <&topckgen CLK_TOP_I2S3_M_SEL>,
                  <&topckgen CLK_TOP_I2S3_B_SEL>;
-         clock-names = "infra_sys_audio_clk",
-                       "top_pdn_audio",
-                       "top_pdn_aud_intbus",
-                       "bck0",
-                       "bck1",
-                       "i2s0_m",
-                       "i2s1_m",
-                       "i2s2_m",
-                       "i2s3_m",
-                       "i2s3_b";
-          memory-region = <&afe_dma_mem>;
+        clock-names = "infra_sys_audio_clk",
+                      "top_pdn_audio",
+                      "top_pdn_aud_intbus",
+                      "bck0",
+                      "bck1",
+                      "i2s0_m",
+                      "i2s1_m",
+                      "i2s2_m",
+                      "i2s3_m",
+                      "i2s3_b";
+        memory-region = <&afe_dma_mem>;
     };
diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8183-audio.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8183-audio.yaml
index 031b0fa7b4dc..261247ca2c87 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8183-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8183-audio.yaml
@@ -182,47 +182,47 @@ examples:
                  <&topckgen CLK_TOP_APLL12_DIV4>,
                  <&topckgen CLK_TOP_APLL12_DIVB>,
                  <&clk26m>;
-      clock-names = "aud_afe_clk",
-                    "aud_dac_clk",
-                    "aud_dac_predis_clk",
-                    "aud_adc_clk",
-                    "aud_adc_adda6_clk",
-                    "aud_apll22m_clk",
-                    "aud_apll24m_clk",
-                    "aud_apll1_tuner_clk",
-                    "aud_apll2_tuner_clk",
-                    "aud_i2s1_bclk_sw",
-                    "aud_i2s2_bclk_sw",
-                    "aud_i2s3_bclk_sw",
-                    "aud_i2s4_bclk_sw",
-                    "aud_tdm_clk",
-                    "aud_tml_clk",
-                    "aud_infra_clk",
-                    "mtkaif_26m_clk",
-                    "top_mux_audio",
-                    "top_mux_aud_intbus",
-                    "top_syspll_d2_d4",
-                    "top_mux_aud_1",
-                    "top_apll1_ck",
-                    "top_mux_aud_2",
-                    "top_apll2_ck",
-                    "top_mux_aud_eng1",
-                    "top_apll1_d8",
-                    "top_mux_aud_eng2",
-                    "top_apll2_d8",
-                    "top_i2s0_m_sel",
-                    "top_i2s1_m_sel",
-                    "top_i2s2_m_sel",
-                    "top_i2s3_m_sel",
-                    "top_i2s4_m_sel",
-                    "top_i2s5_m_sel",
-                    "top_apll12_div0",
-                    "top_apll12_div1",
-                    "top_apll12_div2",
-                    "top_apll12_div3",
-                    "top_apll12_div4",
-                    "top_apll12_divb",
-                    "top_clk26m_clk";
+        clock-names = "aud_afe_clk",
+                      "aud_dac_clk",
+                      "aud_dac_predis_clk",
+                      "aud_adc_clk",
+                      "aud_adc_adda6_clk",
+                      "aud_apll22m_clk",
+                      "aud_apll24m_clk",
+                      "aud_apll1_tuner_clk",
+                      "aud_apll2_tuner_clk",
+                      "aud_i2s1_bclk_sw",
+                      "aud_i2s2_bclk_sw",
+                      "aud_i2s3_bclk_sw",
+                      "aud_i2s4_bclk_sw",
+                      "aud_tdm_clk",
+                      "aud_tml_clk",
+                      "aud_infra_clk",
+                      "mtkaif_26m_clk",
+                      "top_mux_audio",
+                      "top_mux_aud_intbus",
+                      "top_syspll_d2_d4",
+                      "top_mux_aud_1",
+                      "top_apll1_ck",
+                      "top_mux_aud_2",
+                      "top_apll2_ck",
+                      "top_mux_aud_eng1",
+                      "top_apll1_d8",
+                      "top_mux_aud_eng2",
+                      "top_apll2_d8",
+                      "top_i2s0_m_sel",
+                      "top_i2s1_m_sel",
+                      "top_i2s2_m_sel",
+                      "top_i2s3_m_sel",
+                      "top_i2s4_m_sel",
+                      "top_i2s5_m_sel",
+                      "top_apll12_div0",
+                      "top_apll12_div1",
+                      "top_apll12_div2",
+                      "top_apll12_div3",
+                      "top_apll12_div4",
+                      "top_apll12_divb",
+                      "top_clk26m_clk";
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
index 037f21443ad1..d5b358838e2a 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
@@ -167,30 +167,30 @@ examples:
                 "HDMI1", "TX";
 
         hs-playback-dai-link {
-                link-name = "I2S0";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&da7219>;
-                };
+            link-name = "I2S0";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&da7219>;
+            };
         };
 
         hs-capture-dai-link {
-                link-name = "I2S1";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&da7219>;
-                };
+            link-name = "I2S1";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&da7219>;
+            };
         };
 
         spk-dp-playback-dai-link {
-                link-name = "I2S3";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&anx_bridge_dp>, <&max98357a>;
-                };
+            link-name = "I2S3";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&anx_bridge_dp>, <&max98357a>;
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index ed93f18ef985..7f553575c73d 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -171,30 +171,30 @@ examples:
                 "HDMI1", "TX";
 
         hs-playback-dai-link {
-                link-name = "I2S0";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&rt5682s 0>;
-                };
+            link-name = "I2S0";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&rt5682s 0>;
+            };
         };
 
         hs-capture-dai-link {
-                link-name = "I2S1";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&rt5682s 0>;
-                };
+            link-name = "I2S1";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&rt5682s 0>;
+            };
         };
 
         spk-hdmi-playback-dai-link {
-                link-name = "I2S3";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&it6505dptx>, <&rt1019p>;
-                };
+            link-name = "I2S3";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&it6505dptx>, <&rt1019p>;
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index c4e68f31aaab..841aab0178e3 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -165,38 +165,38 @@ examples:
                 "Speakers", "Speaker";
 
         spk-playback-dai-link {
-                link-name = "I2S3";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&rt1015p>;
-                };
+            link-name = "I2S3";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&rt1015p>;
+            };
         };
 
         hs-playback-dai-link {
-                link-name = "I2S8";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&rt5682 0>;
-                };
+            link-name = "I2S8";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&rt5682 0>;
+            };
         };
 
         hs-capture-dai-link {
-                link-name = "I2S9";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&rt5682 0>;
-                };
+            link-name = "I2S9";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&rt5682 0>;
+            };
         };
 
         displayport-dai-link {
-                link-name = "TDM";
-                dai-format = "dsp_a";
-                codec {
-                        sound-dai = <&anx_bridge_dp>;
-                };
+            link-name = "TDM";
+            dai-format = "dsp_a";
+            codec {
+                sound-dai = <&anx_bridge_dp>;
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
index 356e1feee962..c6bd286780c9 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
@@ -156,46 +156,46 @@ examples:
                 "Ext Spk", "Speaker";
 
         mm-dai-link {
-                link-name = "ETDM1_IN_BE";
-                mediatek,clk-provider = "cpu";
+            link-name = "ETDM1_IN_BE";
+            mediatek,clk-provider = "cpu";
         };
 
         hs-playback-dai-link {
-                link-name = "ETDM1_OUT_BE";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&headset_codec>;
-                };
+            link-name = "ETDM1_OUT_BE";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&headset_codec>;
+            };
         };
 
         hs-capture-dai-link {
-                link-name = "ETDM2_IN_BE";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&headset_codec>;
-                };
+            link-name = "ETDM2_IN_BE";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&headset_codec>;
+            };
         };
 
         spk-playback-dai-link {
-                link-name = "ETDM2_OUT_BE";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&spk_amplifier>;
-                };
+            link-name = "ETDM2_OUT_BE";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&spk_amplifier>;
+            };
         };
 
         hdmi-dai-link {
-                link-name = "ETDM3_OUT_BE";
-                codec {
-                        sound-dai = <&hdmi_tx>;
-                };
+            link-name = "ETDM3_OUT_BE";
+            codec {
+                sound-dai = <&hdmi_tx>;
+            };
         };
 
         displayport-dai-link {
-                link-name = "DPTX_BE";
-                codec {
-                        sound-dai = <&dp_tx>;
-                };
+            link-name = "DPTX_BE";
+            codec {
+                sound-dai = <&dp_tx>;
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 4878c424ef03..78587139f155 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -75,11 +75,11 @@ examples:
         #size-cells = <0>;
 
         dai@10 {
-           reg = <PRIMARY_MI2S_RX>;
-           clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
-                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-                    <&q6prmcc LPASS_CLK_ID_MCLK_1
-                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
-           clock-names = "bclk", "mclk";
+            reg = <PRIMARY_MI2S_RX>;
+            clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
+                               LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                     <&q6prmcc LPASS_CLK_ID_MCLK_1
+                               LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+            clock-names = "bclk", "mclk";
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index e8a2acb92646..d3516fb1b130 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -432,14 +432,14 @@ examples:
                       "ssi.1", "ssi.0";
 
         rcar_sound,dvc {
-               dvc0: dvc-0 {
-                    dmas = <&audma0 0xbc>;
-                    dma-names = "tx";
-               };
-               dvc1: dvc-1 {
-                    dmas = <&audma0 0xbe>;
-                    dma-names = "tx";
-               };
+            dvc0: dvc-0 {
+                dmas = <&audma0 0xbc>;
+                dma-names = "tx";
+            };
+            dvc1: dvc-1 {
+                dmas = <&audma0 0xbe>;
+                dma-names = "tx";
+            };
         };
 
         rcar_sound,mix {
diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index 1394f78281fc..d696fb33d9b8 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -95,20 +95,20 @@ examples:
     ssi0: ssi@10049c00 {
         compatible = "renesas,r9a07g044-ssi",
                      "renesas,rz-ssi";
-            reg = <0x10049c00 0x400>;
-            interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 327 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 328 IRQ_TYPE_EDGE_RISING>;
-            interrupt-names = "int_req", "dma_rx", "dma_tx";
-            clocks = <&cpg CPG_MOD R9A07G044_SSI0_PCLK2>,
-                     <&cpg CPG_MOD R9A07G044_SSI0_PCLK_SFR>,
-                     <&audio_clk1>,
-                     <&audio_clk2>;
-            clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
-            power-domains = <&cpg>;
-            resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
-            dmas = <&dmac 0x2655>,
-                   <&dmac 0x2656>;
-            dma-names = "tx", "rx";
-            #sound-dai-cells = <0>;
+        reg = <0x10049c00 0x400>;
+        interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 328 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "int_req", "dma_rx", "dma_tx";
+        clocks = <&cpg CPG_MOD R9A07G044_SSI0_PCLK2>,
+                 <&cpg CPG_MOD R9A07G044_SSI0_PCLK_SFR>,
+                 <&audio_clk1>,
+                 <&audio_clk2>;
+        clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+        power-domains = <&cpg>;
+        resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
+        dmas = <&dmac 0x2655>,
+               <&dmac 0x2656>;
+        dma-names = "tx", "rx";
+        #sound-dai-cells = <0>;
     };
diff --git a/Documentation/devicetree/bindings/sound/ti,tas5805m.yaml b/Documentation/devicetree/bindings/sound/ti,tas5805m.yaml
index c2c2835a9e1d..f2ab274b02cd 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas5805m.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas5805m.yaml
@@ -45,13 +45,13 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         tas5805m: tas5805m@2c {
-                reg = <0x2c>;
-                compatible = "ti,tas5805m";
+            reg = <0x2c>;
+            compatible = "ti,tas5805m";
 
-                pvdd-supply = <&audiopwr>;
-                pdn-gpios = <&tlmm 160 0>;
+            pvdd-supply = <&audiopwr>;
+            pdn-gpios = <&tlmm 160 0>;
 
-                ti,dsp-config-name = "mono_pbtl_48khz";
+            ti,dsp-config-name = "mono_pbtl_48khz";
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320dac3100.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320dac3100.yaml
index 10299064cbc6..3bdaab1e5084 100644
--- a/Documentation/devicetree/bindings/sound/ti,tlv320dac3100.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tlv320dac3100.yaml
@@ -121,6 +121,6 @@ examples:
             AVDD-supply = <&regulator>;
             IOVDD-supply = <&regulator>;
             DVDD-supply = <&regulator>;
-       };
+        };
     };
 
diff --git a/Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml b/Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
index a42bf9bde694..5634b601ce65 100644
--- a/Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
@@ -50,6 +50,6 @@ examples:
             reg = <0x60>;
             Vdd-supply = <&vmmc2>;
             power-gpio = <&gpio4 2 GPIO_ACTIVE_HIGH>;
-       };
+        };
     };
 
-- 
2.53.0

