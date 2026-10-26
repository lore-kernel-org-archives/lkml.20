Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014187;
	b=K3dFPQuEsHJ25kHlVV9q3ro14bAxgvz87lWVsGjOB03aGEG2RPlfb9CTIOJ0j76ZPTBW
	 TLyLCfo3LQ7QusAHDsaOR5ItK8jOt1hcCDoHMZstra+VomW+dJirsUDuhVetWHSsEchRe
	 as4QDiixgiXWhtZxXP1GgQHsRKNbAr+q2WyzeVr9k20hlsYsHBrH3KkRul/WaSpJCA+mu
	 DdTGYzj3Ix7l8VHZ8RO9CI4PLVyG2yQQsLC9eykbBIutcq0Rl9nBwsJ/e3hQYpr1hcDDL
	 lps0P1yTy4JJIkc7J7VnVanAaw60kE8zYLw05L1LgHlBv5Xzlee9P8OsxttKWiFc7Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EgS7rlrHOii3FAy2HYTyjWwgaqj9VRF1aAlcU4nCDOo=;
	b=OKS1l6r9scNxy643IAgT595Zn84eON6KioYyFA2er1pOjE0ZMq4exAvDZtAtMTcrNWop
	 lT9gPhNX+fyjypvVShMPrRj9TQzXO2vC77IUXXQPzE/vshP5DjGkSKB2ZkZoGrQdaQLwO
	 h0KO+GqdqTl0Jv+ivtP3ErujiWZ6rK5Gk08+wTwrwtiH3+0jpN71opASERyrCYfIgufWW
	 TVz/eIHN0ia+VJOe2tBRSVNNIzA0EPX/g6r8IocZJQV+w8p+/Ggyrk7KuVyLGH2LXAzwd
	 efK4UlLFSWi5Sy81GV7TY9qbFHmTa7iaa9RDmsnhYBW1nWTXIqf8oa9oMotTvEtm2Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=blqXwfgS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OL8R2nuA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C48A606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C48A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=blqXwfgS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OL8R2nuA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtDec3633582
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EgS7rlrHOii3FAy2HYTyjW
	wgaqj9VRF1aAlcU4nCDOo=; b=blqXwfgSmGPnFecDf5eHP87wbJvjRAdQpGtJ1a
	thP2nefizXcBBGF+Ai3Pr9+omWsITyfH7UY/Zm/thYcfjODphgBUuRTN/0jtPRV+
	rs0dvOkXqlj3qkUYIYMZhdD+1257xDNKpcl1WSEuRz33zqmvOlbUulfdt03fXnNX
	Vwd/VDUOu7hWiQUUwqjNyDBadqN85oHRuBHP6xzLTF2CYmWyyDSE/VBeNiQO9t11
	RlcJRwQR2tCwsikGfbeZNCWoMDWigQl5NCW0FHCvZk1OuBh+epRkOHxOnzUxGysV
	yLNDSJhm0MNsawJ0reMK0iy6l84MEasDivVcq2K6SGrCvY8g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf09sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:29:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so2866492a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014184; x=1793618984; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EgS7rlrHOii3FAy2HYTyjWwgaqj9VRF1aAlcU4nCDOo=;
        b=OL8R2nuA6WGlRM+lng7TdnKvHwNY6GPt/5UGr6b1KxGU2UPrCkhpp5GInH77I6RSiL
         32dX7sDCCLQWCdOjZuE40tFGSZ16YOqsxkWaSo3+Clf809j7KMRGoOiKmP+PLqqRzWYp
         lS8CUVYaYiha37A27yl3yOZ3PAJdN36VliXX1HlKAUmqLflq3irQ/Lagx1i9/3XQiVJZ
         iSRGyawcB3febcnv0AeOP8vb/+OLwL0+fBLREqZZaPrcN434U3KY7VlMC6zqmEUP6HMO
         IudssRwDQ1qx14zRINRvPwGbCIggDDLi3Rf4WVSSWa7d6h8te6IWvJhHZv7p7Mr4L4ZO
         WDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014184; x=1793618984;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EgS7rlrHOii3FAy2HYTyjWwgaqj9VRF1aAlcU4nCDOo=;
        b=edZtEkKJi/bfKaoqyu/JWgo4hfpbEcWjr61VqtSZfEXZwIygwSC9JfsXcjjSWXc0Hl
         S8peGJxxhSh9N8xPtBV3mBVEP8XwQtVJx36BJollgcANKSH7sF+AykFLc5FnV06JEIRP
         dpzgNVqjrOnP3kL5CCE7Vp4IczwJKmH1xqlSCEqXQxv/IyYVA2fIyZ20ja/UMZgY0U2s
         oMfgKzNXTsNApC2moMvaY/9vjN/ipx9yqXdMYvSa67B9v+G76jTMuMEsAKc+XibCywkG
         mFuUvlOsG85n39MQH4eWR/FXkSkNpqBAhH7SxwpqNKXJc1k5w94IX7BOK8R5bbP/onbT
         aezA==
X-Forwarded-Encrypted: i=1; AKwUvBxUQFiU1YuVXM5Y9bcQxxPy1blMvgjjt/xIruAfOU0THwsAOJISxYbP6x3MywbUfVJSpLi2EcXn/HH8O5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZx0Kjf82+zpuFcAV8T30q57j099pcMVawVphKeVSLN2huAfZd
	QYgNbhz1EEIBKCxmAn4fxUGHq7540h5pRI84/IOIqJbxjNrtTaDrx5h2IKY9/I9zHMU3GTv7Umc
	Ef8J/KMCccvG2UqDXesWMNdFrWVAoz2Czb02K2m2op+egkK8jDHL2ets6dUIGJUbx9jk=
X-Gm-Gg: AYBFou3OcZkbb916ZaCRUGgE3fOuZEZW2RvHo64vfXbGzZk0Db5xo6afjxZrLLAcTyQ
	H6Bj6wpX5LhgTEpyotgR6DkihTuy8mJD5YQrRnIXYnRgK1r42lo8BNGr6ID4mNRM9LzI3Tsa9FI
	C/RiR04YkZDAlNFfMol7/3j5PPcFf+P1fTF80NRTzLhXF6dR1848cW+aF5eim/jPyjzkyj8M5so
	7T7+qKRYsuwVTwkLPahnUdGoJ6lwqHX2aGLuqneywZlZkXCLg2r14XiYAaZ8w61yvCKqmCbNphO
	4CI55pYJEw+QQnLbgmMt/4Jz/c8oMKTSbM9Z0FPYoexryS22rcWGXCYZB7ctSjRM9/JdT564t8A
	oR6R+344Lc47nia4qNunLIjs=
X-Received: by 2002:a17:90b:6c8:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3adeb3aa756mr3576419a91.1.1793014184337;
        Mon, 26 Oct 2026 04:29:44 -0700 (PDT)
X-Received: by 2002:a17:90b:6c8:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3adeb3aa756mr3576406a91.1.1793014183889;
        Mon, 26 Oct 2026 04:29:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:29:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 00/12] clk: qcom: Add PDM GP_MN fractional clock divider
 driver and DT support
Date: Mon, 26 Oct 2026 16:59:26 +0530
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJY532oC/x3MQQqAIBBA0avErBNKQ7CrRIiNUw2ViUIE0d2Tl
 m/x/wOZElOGvnog0cWZz1Ag6wpwdWEhwb4YZCN127RKTJ2I/rC4b3aJ9gjeXlIYo5TRM2p0CCW
 NiWa+/+0wvu8HpzBdEGYAAAA=
X-Change-ID: 20261013-b4-pdm_clk_gp_mnd_v2-993396fc6cac
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX8IXra55hweHB
 HtRhPzp2RdMM2o7qPEi7MAmN5KboJR5LmIq2Fj7OKhntqoEAoczhlVjsB29zlWeoG2XcAWND9AU
 QQFFt1yBvLQb3H+SfBlqrKR3jJmkvp8=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf39a9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6Szwu85aThXN4zbkuBwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: lcrix2SU1yMNsQBO3ekrzyNw9pNKKSnX
X-Proofpoint-ORIG-GUID: lcrix2SU1yMNsQBO3ekrzyNw9pNKKSnX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX48ccu6C9yw9N
 Ei8/HqiS9/JqUosfJJ0eH2w1GH1lBh8cD/9Gl4qC45lfdYKfWyTUZymM6jy29jn7884tvpq/KA7
 3lXxca5oDrA5vGvvHk4nvIeH71mwtMtWTwWJtELxfKBYZXoiZ9MQu0EjjLnv2tE8rYlEdaC0zxE
 SK3c8ipU7rJpTNEVvSkxf39skMk2MGXa8kuiObUFdQshohcuQ+daw4OANe0VsY9/afJ1FJacEv7
 JMe1Fy+tKBd90eymrOfn5/WcSfrmhm9fUqRGhQ41xhD5XWBzsp27669dnjOf14dUlvrl3gszEEy
 p5CzJNLKrMSmiSJLJNagKJSDFk1k85z4JOyMxnPuVB8Q/PC0dojgIT+QC5b+GWRvOsp1+mZ7BWd
 HZ/2Digx79ZPja7kSNQEoMp1XGBGDehEMMPOQ6JYYzH7kaBqK9FPtKjV9a+239FeMU+KJne0z9L
 /utyQ+2CozK05aGs2zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260045

The Peripheral Web PDM block on several Qualcomm SoCs contains a GP_MN
fractional divider that generates a clock output from the PDM XO4 clock.
The output can be routed to a dedicated GPIO pin for use as an external
reference clock.

This series adds the binding, a runtime PM-aware GP_MN divider driver,
and the GCC, pinctrl, and DT support needed on QCS615, QCS8300, SA8775P,
and SC7280. GP_MN controller nodes are disabled by default so boards must
explicitly opt in before the output pin is muxed.

Changes in v2:
- Add SoC-specific compatible strings with a qcom,sc7280-gp-mnd
  fallback, map the 0x1000-byte register region, and document the PDM
  source rates. [#Konrad Dybcio]
- Use runtime PM and pm_clk for AHB register-access clock management,
  rely on the pinctrl core's default-state selection, and generate the
  output-clock name. [#Dmitry Baryshkov]
- Enforce valid GP_MN duty-cycle constraints and report high-phase duty
  cycles through the common clock framework.
- Add and register configurable PDM XO4 divider clocks and their public
  IDs for all supported SoCs, allowing the source rate to be configured.
- Split the pinctrl changes by SoC, retain Reviewed-by tags, and combine
  each SoC's pin state and controller node into one DTS patch.
  [#Konrad Dybcio]
- Correct the SC7280 output to gpio60 and disable every GP_MN controller
  node by default. Add QCS615 support as well. [#Luca Weiss]
- Link[v1]: https://lore.kernel.org/lkml/20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com/

The series is organized as follows:

  1. DT binding for the PDM GP_MN divider
  2. GCC PDM XO4 divider clock IDs
  3. PDM GP_MN divider driver
  4. GCC PDM XO4 divider clocks
  5-8. GP_MN pin mux support for QCS8300, SA8775P, SC7280, and QCS615
  9-12. GP_MN DT support for QCS8300, SA8775P, SC7280, and QCS615

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (12):
      dt-bindings: clock: qcom: Add bindings for PDM GP_MN clock divider
      dt-bindings: clock: qcom: Add PDM XO4 divider clock IDs
      clk: qcom: Add a driver for PDM GP_MN fractional clock divider
      clk: qcom: gcc: Add configurable PDM XO4 div clocks across targets
      pinctrl: qcom: qcs8300: Add gp_mn mux function
      pinctrl: qcom: sa8775p: Add gp_mn mux function
      pinctrl: qcom: sc7280: Add gp_mn mux function
      pinctrl: qcom: qcs615: Add gp_mn mux function
      arm64: dts: qcom: qcs8300: Add GP M/N clock controller
      arm64: dts: qcom: sa8775p: Add GP M/N clock controller
      arm64: dts: qcom: sc7280: Add GP M/N clock controller
      arm64: dts: qcom: qcs615: Add GP M/N clock controller

 .../devicetree/bindings/clock/qcom,clk-gp-mnd.yaml |  98 ++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                |  21 ++
 drivers/clk/qcom/Kconfig                           |  15 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-gp-mnd.c                      | 333 +++++++++++++++++++++
 drivers/clk/qcom/gcc-qcs615.c                      |  20 ++
 drivers/clk/qcom/gcc-qcs8300.c                     |  20 ++
 drivers/clk/qcom/gcc-sa8775p.c                     |  20 ++
 drivers/clk/qcom/gcc-sc7280.c                      |  20 ++
 drivers/pinctrl/qcom/pinctrl-qcs615.c              |   8 +-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c             |   9 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c             |   8 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c              |   8 +-
 include/dt-bindings/clock/qcom,gcc-sc7280.h        |   1 +
 include/dt-bindings/clock/qcom,qcs615-gcc.h        |   2 +
 include/dt-bindings/clock/qcom,qcs8300-gcc.h       |   1 +
 include/dt-bindings/clock/qcom,sa8775p-gcc.h       |   1 +
 20 files changed, 645 insertions(+), 4 deletions(-)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261013-b4-pdm_clk_gp_mnd_v2-993396fc6cac

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

