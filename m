Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762444B5123
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493591; cv=none; b=WOU8o2TzFALuPLihm4svfxazE0ZiSrB1kn/+APibtD+WFnMVqWeOOxHvlgHArzoKLFMg0DtO59CjZgYJQjCdxc/hJEPVTbLemaRaEWbtmQnSm6WA/OIflR/pCLOHqIcld9iIulAeWhrouNQ1qMGBYcPp1EnFNOjmk0SkWPdogZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493591; c=relaxed/simple;
	bh=6XPX+qIPMVCkTk4wE39/6SN04F3sUwQBUey9+D80NgE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OoPvFP2bQDF9UmTbAFI5slnbaDY0Q9JftZTO5eSRvHx2sDOAaaj9xL3F1sTduZ3eIpUQDzzTVKr4vgoZKP37Z5kT6A8vy0jYY9IRteKZ30SfamQmsX3Kh5FDlRH0RdPcAwncUL6GP+95ijkY6sDIshQwkr/KRHCSkqhPviMctxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mz/cSx33; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2r3lgSs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mz/cSx33";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2r3lgSs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFANu5813339
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JcXOtDItZ2KP0yTfGCEEsb
	PPFeDcbTN97h6/R+twec4=; b=mz/cSx33W4fpoDagIdxKwskvzOGfW8FnqmgGP8
	fTNLvP8YxzCDS/1tqPwgVaCCHZaRPbebTSd9vJpA25l4cfjVb+xwrYSmgTy7KT6V
	6x5o7FdBZQ+l3XlZnhuAV3bDQFeSB9lTYukL/6Kl8MHTEaDXxAh2jMw9XkRP0Plf
	zHdTCeueVxye9aidcxcx1FUlyiUnCOW58pdpsRvWcOpPrcJP8ofc9AQ1Zy2FQTsQ
	vAPKumXcbcYJg51FKHf4fqlJRqpOj2Pde7GvqwjW3q+3P+AQpNhLsOogZhhOY+HY
	iTZs0ylXQPp3qkUTiVBXRc2JtmOqVgHGUVFZTAcg7kxuMrnQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq6kc1h02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:33:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd7d0751efso10513215ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789493588; x=1790098388; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JcXOtDItZ2KP0yTfGCEEsbPPFeDcbTN97h6/R+twec4=;
        b=W2r3lgSsbibVx9NYbSZe+ryV0FW3f33s9hNi/KYNzzkD1I5LIaxfvDDVRUgv7O+wSv
         QhcgRQsMybHVANROuD8gR7GT0UHPB3pjUTHqKbUSFZeLfW0w35/vaX/u9si7/9DSrE84
         snrAFjg+CRVl3jaFxQsmbaHkyNlE8XOEJnLYO2WCkOkMQ/F3m913FnQxptSfKQ3QhGW/
         w4H9/CRj2euBLkvI+N/R90LjLV3zYEVKjB37JYBMOMSkYwCbREIUyBjVmVO7Il6J5i+V
         0X4OpW3DWNzLrwUUrM43Dn3luN9yexbHYNHv/OVVU03Ux0wHjlRCC96cGAbhknlqoKaV
         DStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789493588; x=1790098388;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JcXOtDItZ2KP0yTfGCEEsbPPFeDcbTN97h6/R+twec4=;
        b=Pv7+m4Vpzh2cQj3Pgl4O3UOGFtmzcDMOpz89Q3PslHZ3dywFNZNTMOcE8F0j5JWTyj
         7e9v2/v+H1GLiNy1/97sFI70HBOhjlddK1Wp2lH9Dauy110PLI3R0d13bhxaVxXlVxXF
         4pg93N7dIR2GChTd2MGBvMA45sGw6G8B3LeGAT/OqyDF/9yYXwhCPaktyd1E1CjxCtC/
         FgzfsY1RZKV4l9ilknjcBMbN6ZPfdQPfeYSPwwaFfGE8PejPkQgST/JH6N3beS0GWOgu
         ou1UUntNupmHW+/bS6n6wG/XiJt0MKDAlXP7lgnP3BNgaT4vGS2UBQ3YflOCikvGFBD1
         KI2Q==
X-Forwarded-Encrypted: i=1; AKwUvBy7ZRlUcOeSC9pbikuDNwB9qi1D3vMPxB05CYnnM20zGOjGHGrPY6Com96K0XdKDq6qj0aj90CjCVGIx0A=@vger.kernel.org
X-Gm-Message-State: AFuF++mjFPa6BA/QDF2bLBpTtsfKNDyg0zM3oGOoDyXGWykwM5KR+n8+
	KRGt44rBcFlL558HdlBQxrE01xSOab8pQmkD/H/cGzPjXgn+1If9ySTRXs7CyGh3ey2WaDf+DGl
	al0tyROG+SDlJjUdCQVPw1eP20rrtu1tlJbUJHN6E7X5dgpLb07Y7MIM9fQnIpKy9McI=
X-Gm-Gg: AYBFou3RFv2gLAdT1F6zeL3Rq2qycUcwWZAGBvUolAJp8ZhHRpilEes73XSfsJniDsr
	ZVnCv3SFM2HEBVfrzKPDqaDSHsTfDW6O/6cmXIVLRDfIfPPWEu2FompcNHhNhklHQ71cAyWwLKy
	5PARvxEj9JVLkNHa3FAmmUuQTs2z8V1OpdLGeFxnn7+7wFBOB1uzDu/z3FWrPhRIeN95X8cNpIL
	wJg95Vno/4cZ89HEV01ZTQBECf/SulF7VpPU/o24cUYMTOJRJMTloeuA+LDFjak32KDG9/nT/6B
	1q3ylhuEy0EJWfKGqqFaxU5F1K24XzCVT9pGUr6OpB11H+cocBq4PQF5GSKXlCI45ufE2lufCOm
	/8ZcNRmWpvYamnI5065vUzM6YL8/+R3YVEMLcAjK/8tWTyClQr9pAWnc=
X-Received: by 2002:a17:902:e544:b0:2d8:d4cf:fe49 with SMTP id d9443c01a7336-2dd7654538dmr59400285ad.15.1789493587933;
        Tue, 15 Sep 2026 10:33:07 -0700 (PDT)
X-Received: by 2002:a17:902:e544:b0:2d8:d4cf:fe49 with SMTP id d9443c01a7336-2dd7654538dmr59399835ad.15.1789493587492;
        Tue, 15 Sep 2026 10:33:07 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfd8c84sm71567305ad.62.2026.09.15.10.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:33:05 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH v3 0/2] clk: qcom: add camera clock controller support for
 Hawi SoC
Date: Tue, 15 Sep 2026 10:33:00 -0700
Message-Id: <20260915-camcc-hawi-v3-0-5b57f45477f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEyBqWoC/23OSw7CIBCA4as0rKXhUQp15T2MC6BTS2KLgqKm6
 d2ldaEmbib5J5kvM6EIwUFE22JCAZKLzo85+KZAttfjEbBrcyNGWE0EUdjqwVrc67vDlQGlJHA
 DRqB8cA7QuceK7Q+5exevPjxXO9Fl+2Yk499MophgSYSshbLCVnLnYywvN32yfhjKPNCiJfYRm
 t9HEstCpxpmNG0pVfBHmOf5BeOD6IHtAAAA
X-Change-ID: 20260508-camcc-hawi-4be887e3beb5
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789493584; l=1643;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=6XPX+qIPMVCkTk4wE39/6SN04F3sUwQBUey9+D80NgE=;
 b=64cP3HCwO5vLFhw3q7l7Qs2dEVSF/HN05MtsfKa1Nr12nCfqYmQgsaIYNWS8TpBsOFhDJxGKN
 shcvj3auSuUBic9uiqPMVUh/EHc8y+8P+WKgPEsoF3YUQRIkliti1ZF
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI1NSBTYWx0ZWRfXyPSEgli60kui
 Q/pu/s+WMohRfomEzkc0RbdMmfTCGXWgwEN7fl9hbpochMgbkFY0T3cUyqjUqjhbddQaO4pd6Cj
 91PP6S+zazaR+6+JOq2TeTYFq37ROww=
X-Proofpoint-GUID: DByHNqt_cnwYWgT94A93IVbsEIdhxP-g
X-Authority-Analysis: v=2.4 cv=ZINCCn7b c=1 sm=1 tr=0 ts=6aa98154 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0ofaL8MKJGBdPcn-MXwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: DByHNqt_cnwYWgT94A93IVbsEIdhxP-g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI1NSBTYWx0ZWRfX4eXVP9C5GDVa
 SJ5SNSu/MzNHyn5G1Qg5TNE5MT56PfrJ3T81AQHB4yW98HUBaFQ1Pno6hrC4ukSZkZHmkKV+I3F
 hQ1mNHEKTFfNIfy/k5nFTetQBj2HpQkAfRNTtt4aFJw+G9u7J79zpaek3RvT7BGwP6NSJYXRnht
 dPGOruSNSxbLfFj54Imwrp5uhD/DfTUHihzdtEhaIQlhctGgNldIXozEP9ict+Y1jKSG4bGkUr1
 abo3NDxE3mAnjcVCpODszD1C0O9z0fkKQlz9RblV2yAUUzmoY6XQIccJLEvysDOTUYL5HjS/ITO
 n4jxTmAJN2vUipUwmoAb2YmNV8o1UnrgSIcWeGbxZZpV3A9kIeXK4nYD5xtsSVubcBV6LkSTuwE
 Ba7KZQQQdqJ3aknElL44h2UKrmEywbi5Pv/9m5DChMnY8KNVvW4u0NClX6h9f35YV89UIUX2ul+
 VImKSdFjMjiYEn0kRyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150255

Add support for the camera clock controllers on the upcoming
Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Changes in v3:
- dt-bindings: Add interconnects property (Taniya Das) 
- clk: camcc-hawi: Add needs_icc/icc_path_index to titan_top GDSCs (Taniya Das)
- Link to v2: https://lore.kernel.org/r/20260908-camcc-hawi-v2-0-f892ba1d118e@oss.qualcomm.com

Changes in v2:
- dt-bindings: Improved commit message to explain how Hawi's CAMCC
  block differs from Kaanapali (per maintainer feedback)
- dt-bindings: Removed #power-domain-cells requirement from the
  binding; will be sent as a separate patch (per maintainer feedback)
- dt-bindings: Rebased on top of linux-next tip; added qcom,nord-camcc
  to the compatible enum alongside the Hawi entries
- Link to v1: https://lore.kernel.org/r/20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com

---
Vivek Aknurwar (2):
      dt-bindings: clock: qcom: Add Hawi CAMCC compatible strings
      clk: qcom: Add support for the camera clock controller (CAMCC) on Hawi

 .../bindings/clock/qcom,sm8450-camcc.yaml          |   43 +-
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-hawi.c                      | 2993 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,hawi-camcc.h        |  165 ++
 5 files changed, 3203 insertions(+), 10 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260508-camcc-hawi-4be887e3beb5

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

