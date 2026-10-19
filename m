Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD8F4A385C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401496; cv=none; b=BWUxJvsUDyMEGiqRPeTWOcIycAVa8hEdnK3gHJkE7ZDoO9+Cl5I99353e4r/OQTOH1wZbiKzmcAsr1s3dMN1494MQ12aI84WAhYz8Pc3yJppchKFKm8oWk2GSaAk0UEwFDxC3vJUgsUyJWv3VB+j1nmicdBpMFLhFiZfcah5m+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401496; c=relaxed/simple;
	bh=SRCh87j8WV4ncKAd3kt7UhX6o3odVhDR/GaASpgOZBs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r4MBMenmra5SwIMtQ2Rz3F221LqIhs2RPco8BIgDhlZHxGAx8NQIgx9ibsJhh8bny6yEG3LGozhXwAxYrYIZYIZNfbBepvbc/SZgZG39aKyD/c8Os0WXfwglJki3N9z0QqRnDFR7pVrx8UpAD2V3rXwSZgF8owDYqAtKdO2JGiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ppf7mxxD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JhtcCZXK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ppf7mxxD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JhtcCZXK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Oqpr3305496
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7udigO7AEbnYsRJJZYNQ2N
	UNZhkQk+qkatcnC+st0rI=; b=Ppf7mxxDFvSZJTI2cRgnYJmrTIjtcJKU967Y4o
	Yrvrhyg0BYs2SAwNvJh21yJxRbUmm/LDQUxK61JU8WBVlZXyKyWuFRC1qUT0Xcko
	JsLjS0Sz8+t8vbfjBG/UqdI//HsuaDvGEcEF7+QTjhN9xdZDVMkPg68E9j9anRym
	+W/QYJ1PJkV1nMd1lH5MuTrz1DISq3R4DqLpZNf5Z45aA6xJZMuKfROF+5+maM8i
	sE2zyeEizzRRe00+HESRLWzLVmOx0InqdSIRcR5xApGMeQwAgXNi8u1iBsHwoort
	pvqEQSl/UQk+ITYzETkkxEtdLZwFok1XHtPDIEMGLhwzgn2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf47gbpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:18:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so429683985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401493; x=1793006293; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7udigO7AEbnYsRJJZYNQ2NUNZhkQk+qkatcnC+st0rI=;
        b=JhtcCZXKTOVhn21DwbuFeZHzkeLs0hfMDcl88G58M4JgC38JnNy6XbFdzjpMGFMy8Z
         A7TM5fYpQdRshMTe4SbOtE+zpbkjM0B32/Mw0pP3t4vobz1/NN42aXImGp7yHhPPTOEZ
         nUtSjq9HYvD2hJnhQkhSf4K1lbz8Xi/AG4Nfq0q1921vqxfcciuNY8Jank+44RiVJRFn
         2htXBYFPJePzWnA25iC1/8s2ahv+NtpahFhXJ7WDBUHgIpxCnpqlJlDIaWyIgrUqSXbF
         i6kQyJywnxD42XwV70ZhlNkIE0fcWcKVfVWvXPJUzstUFBYWF7jksmCLmfCgvYqHG77l
         xd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401493; x=1793006293;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7udigO7AEbnYsRJJZYNQ2NUNZhkQk+qkatcnC+st0rI=;
        b=q61LYZFcGjqa51tv0JvfcYAn6eTypUEOSyhJSp08h5EGq/AM7HBH6Fvq9wtBBeAtBp
         b4Yup82rvLVSV79lE7iIo8zrQfoNhSnK7zhYaOPR2zbri0iQUIDHE2vgZbszLkzi70bs
         Vk20vgke6lJhEdvBy3N48IkZG11DE3dGIXi1pQJMQM6Qof4bf9Xo6Kfbw6JATMwacctT
         32BEryJLCGLZcvrbyCMpiXGNZ+/w75RtgknbjiMWrrjq52cbEjiadqZKbt3NWOg2xP/v
         GERdzPrP/LJWugphsr6r9sHupgj9jK0JJXkn4BPBZfyDVG0S4+4ugeM3WZ9R/MGpnd5e
         JkEQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4PSv2y/lwtlsZ0NAV6D+cVnPnQRim6hEcHt6RDv4I6N2L4ViBi+iYB6lvGQ8d9kTXRvBcrYO2Myf5W2Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfkItcYOk2BWwCj3fl/j/AViArDbcbCFMJP94z5s+AclBK4oB3
	r/hyMs77bylc5XlAFOYOUZCUM7SVcQSznAl6HyCtdZ3kk6r6bW88qS6sjr2sNtjnEBYCQ8aj7Vt
	RIgZDe6Ac4CpNnJDP8gMmNpIMlTFkk1Y5Zp2SFl1CdmGTvYkskm7s+Ofem7N38tEv2YQ=
X-Gm-Gg: AYBFou0z2c7AFw/FbjWsU7CHxMZiCaipzRQ9mObHQytGAo4cnpXBjYozaHjYUb1TL2Z
	xDrD0twGu1uJqXv97HQ4pneVMwWzXmK+tDLQRdxcV2rYxvdeZkNz/WXFodwy0CR3HtZW32yNjBe
	ajb/zWhZv2hNyBo428qb137Ba1WGyWw7vkqA9SWuIZbMLi1XbqfX5e+RwpXwdTVUmFbATvcdVHu
	2jm0hmM4ZrVAcPGX7hSoVfMjlf/YaNwBO+8sr9cCRqGKpqZ02+ypX7b57fXz/+sj9oP6aquBWRq
	LGWq+RYZugDL+R6YiWXDptvE+TPIpVadwGNI7FKtOsxSbMs8mc62IBI3MSlnDFvu8GTpR0qIQCU
	Ywmm9WL7WPbW4izpXF4F9KpbUTB5xaMXCe+yNyAoO9IvKy62gie/4Yonz2jka322Ynqg9hPd5zL
	CGsVODZw+6Wo8x
X-Received: by 2002:a05:620a:3720:b0:93b:d7a0:d9db with SMTP id af79cd13be357-93f29d8a748mr1172447285a.53.1792401493224;
        Mon, 19 Oct 2026 02:18:13 -0700 (PDT)
X-Received: by 2002:a05:620a:3720:b0:93b:d7a0:d9db with SMTP id af79cd13be357-93f29d8a748mr1172444085a.53.1792401492639;
        Mon, 19 Oct 2026 02:18:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab2e4e05c2sm15893441fa.25.2026.10.19.02.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:18:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/5] arm64: dts: qcom: support SDM845 HDK
Date: Mon, 19 Oct 2026 12:18:02 +0300
Message-Id: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEvg1WoC/3XOzYrCQAzA8VeROTsySTOp42nfQ/Zg58MOWut23
 LKL9N03uiAK9hL4B/IjV1XikGNRm8VVDXHMJfcnCbtcKN/uTvuoc5BWaJANIOoSujVZ3YaDdsR
 sK+MJuVZycB5iyj93bPsp3eZy6Yffuz3CbfvPINTPzAja6DVzAsc2xVR/9KWsvr53R9933UqGu
 mkjPgQwQC8CisDBNNQQJvlmRqieBfsiVCKAh9r5YAJwmhFoXiARGlth4xIZdP6NME3THwHmTDZ
 xAQAA
X-Change-ID: 20260122-sdm845-hdk-9466530c4267
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3576;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SRCh87j8WV4ncKAd3kt7UhX6o3odVhDR/GaASpgOZBs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1eBMS6rUocTpCO7ESGVS6uBDCJ5SKC2Ptu30L
 X4q1/D/CDWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatXgTAAKCRCLPIo+Aiko
 1XBYCACZpLG5jLTo5w8jXq7RTlh6a3NKrrx7/4pGKD3oVQtYzlOGBdOWqpvM1KIDm+dMY/bhjjf
 A+wu5ycd0iPSRbi6RJS6vSMiT5iTtmFaZskJ2tE+YkzdNA6e2vxPiXMW9sFdommNh54etO2f7Db
 QvMaHs3aAHgZ/hoSZlMy+t8Db6LqNLev1pLaiSVTLIBC+D1ikMPD234L6BmhAZAEUpzHh8ibRCB
 oTIfKC/g7zvqPmX+T90HE5AxyNpMN56wRHx6qHEslMQRuRseHrVq7IzAZjRQt7qklZ4ZbFT6NPU
 u2MY1JJbAWjVQ+T97CZqpBZ2E/+CI73RxWfq8YY0vzopdUKs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: CA9K2LgbJth-EwKWRiJUWR6_k7oWv-it
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX34AaePsfro6Q
 BB6F8OlrrOqYL+kkaerc9puaer4QxU7nzNed4pcta40BFPxEnmmsRGZmaScCpMPcanei07z9nl+
 AJrRIScJrenzCidAfllyh+9pEfvh55/RnkdwS4hERtIhND0TvvKjjtU6ZnGKGPoUAoqM/RZc957
 9b9SZGa8UGzpB/kAODZtDEZTZ2cf5Q+36W4aU3D8egn8nwcl6BLLMenjktyR2gG6IhDQLSzfdx7
 tB66I1oKJemP1XuD/JsOORxlU0P7rl8VkxTBKy+lT3jld/xKOambaewv0L8LbRqiywaoi9OPWWW
 rCQo7426+KRWtVB7qaq1fXFC0Ig/xffa30sVZ57rsUX7k3OnhTb+FonGe92K38y/7FPqMalC7Sv
 gxeIK/QIuyG7Nos0BzGMPDGVXsR3a4xyE0aGwg+3es7zgGcqGbDWPb58NPm2YSdVUnOneknB7cE
 KRx+JHq0tb2NazXu+6A==
X-Proofpoint-GUID: CA9K2LgbJth-EwKWRiJUWR6_k7oWv-it
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfXzEgf+tVQHNUH
 dv53u7FzO5Lt0w4JrveOErzi/3mcN2d+Z091NRBlqLrPabCRbr4VrqrG8VZU6iw/csY6s5vEIDA
 oYOmEh6hauSm0LO3XiWC20AyrvKoj9c=
X-Authority-Analysis: v=2.4 cv=cLt1IVeN c=1 sm=1 tr=0 ts=6ad5e056 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=WDvwZioAV1Qa1_QZ0V8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190036

Lantronix HDK845 aka Qualcomm SDM845-HDK is a hardware development kit
for the Qualcomm SDM845 / SDA845 platform. It uses the modem-less
version of the chip (SDA845) and provides a rich set of the peripherals
and connectors. The DSI panel is an optional addon, so it is being split
to a separate overlay. To (hopefully) ease merging, the overlay is split
to a separate patch as it depends on the panel. The base DT doesn't have
external dependencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Fixed panel disable function to prevent NULL pointer dereferences
  (Sashiko)
- Reformatted the HDK DTSI,reordering properties (Konrad)
- Fixed commit message for the display card, removing mentions of SM8150
  HDK.
- Link to v4: https://patch.msgid.link/20261015-sdm845-hdk-v4-0-b532b9f4029c@oss.qualcomm.com

Changes in v4:
- Dropped backlight from the panel (Sashiko)
- Corrected GPIO used for the Home key (Sashiko)
- Corrected USB PHY supply mapping (Sashiko)
- Dropped backlight pointer in the panel driver (Sashiko)
- made driver more robust for a single-host DSI (Sashiko)
- Added comment regarding USB OTG
- Link to v3: https://patch.msgid.link/20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com

Changes in v3:
- Dropped mipi_dsi_device_info from panel_desc (Sashiko)
- Added comment to SYS_BOB (Sashiko)
- Corrected commit message for the display card, dropping mention of
  mode select line (Sashiko)
- Link to v2: https://patch.msgid.link/20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com

Changes in v2:
- Dropped MDSS reset patch (Konrad)
- Added panel driver and the display card overlay.
- Link to v1: https://lore.kernel.org/r/20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Dmitry Baryshkov (5):
      dt-bindings: display: panel: add Truly NT36850 WQHD panel
      drm/panel: add Novatek NT36850 panel driver
      dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
      arm64: dts: qcom: add device tree for SDM845-HDK
      arm64: dts: qcom: sdm845-hdk: add display card overlay

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../display/panel/truly,wqhd60-nt36850.yaml        |  98 +++
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 .../boot/dts/qcom/sdm845-hdk-display-card.dtso     | 109 +++
 arch/arm64/boot/dts/qcom/sdm845-hdk.dts            | 826 +++++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36850.c      | 350 +++++++++
 8 files changed, 1400 insertions(+)
---
base-commit: a7d52d51b31a58da686320f5e4edac74e2dad682
change-id: 20260122-sdm845-hdk-9466530c4267

Best regards,
--  
With best wishes
Dmitry

