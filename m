Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADC03D6487
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792210662; cv=none; b=hMgNlSpQHERuu7gT1XBQARJ5gzJTCRh7f9LpEVopN7de3z03V2jdeiR7sFINy7EZClygY0YLG6KUTnR9/v8HJ3S1LYb98xVu05AJ25XA6bhi4UKpppDNBEDPXOGekqhUnugFdcwxR+Wr7l9aJuiE3WYeGWeS0oqhTdoRXkIZDv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792210662; c=relaxed/simple;
	bh=Zz8H7LWd8X7zK4/404T4PQqLh7JqrFJUhH4vjYg7WPM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oncwfdc+kQAFmZrRVTAQ9zs+aZhEUrIjolviclJHNoEOA6JQP6gmnmwcKQRFwyDDmOBK2aiM+cy2XaXXqLTVRmtkAA6nInhUYdXXro1HhOMM7oCuArb+jTaU0DVSJHJWEy399HnJHnqrCMYUiVQO6kBuJN1kYuSB89DXuU+hEeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjQbIuQm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTQXbqHL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjQbIuQm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTQXbqHL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H3PqB24134441
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oSmiR6WIktoEKYIAAbkgPtODO5dJ/wTfMi5
	Vc88bYSc=; b=HjQbIuQmwXQHOpymfxOtwCVbLj+EHY7y++oS6fnAF5hQBZyfkZe
	v8gAWRcl6EXtDLxWbiEL0wv4wX9IR58OPqLVVpMG/GX8BQyL8JdaGar7LyEdM7eS
	A+PkS8wqlBneFKxARiJdThObsm/05yRlNS6U+Ps+kKGxXM6eabg3MrGSpCZIVFBn
	qNvXOn72oAjMDFPd4EHKEl1mc/pSs1av5rUUHVmqXe1WvKcLtP14r20IetCa4or6
	MVBit35MhYvOCfaKTxzS4JXe6PWyP7y90pRQUJ79JsqTXlhc8lGpQ+lqhWgCenB+
	esxXCCIaT6BTaUBnhzPoTfn1HHVnyI4eu/w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc13ur34p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:17:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a04491c56so622689eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792210656; x=1792815456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oSmiR6WIktoEKYIAAbkgPtODO5dJ/wTfMi5Vc88bYSc=;
        b=hTQXbqHL2K9yyeSD9IPSgUxWmKYhV4eHRYafdiCOlKr5v5l7IDLdQ6g/tHbNS2NHrp
         ExQ1Z9bTbS/GLMM9qebYoMhCaUwek3FaqfioHnIcof3UgVLwZFYjTfaOOUEEFw69tb4v
         yC4yDCJd8Bqf8IHNXUm5DAzF307sT/vSm3W5VYyc8NwkOmYJQ/3Tfj07dTia4C+OOYjm
         euYg3WbwfzooQggaHmERCkzoukWDbyJFk7lLv0i06nSRTYNKCBBvjBATbz2qFJ5i+7iM
         9m7aP8L9pD6qXkyG60X/5Hj1lK7m1nmNRbn1zuOkkDjYNxlb0SrWsFm2iMc8KCHKU4xN
         uWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792210656; x=1792815456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSmiR6WIktoEKYIAAbkgPtODO5dJ/wTfMi5Vc88bYSc=;
        b=C1oHcxLdgJqHn+2Yldk31alhWOHzcmYjPF6Jauf5v54xg7Nsa4zVflgoEQLJOl3JCM
         2s0RamNJ64xJZNInJQnaJ4l/84p5FgrKTiCMImmCQTvDN3u7nGMjYyebjHR6j4FGT67v
         JJElObbHtwHkbGCEGJqShSsoJMmEm/wnyvNdCMARLn/hCMzz+OvtdRa0t9hRE5JJlptA
         /eO5rOiwuD/jjsAsa6A3e219c3DDayVrEf12C7jM9h0r/elPfKEuKVx/gCdZrarExn27
         rJIwyqQwoXkdcBw1TjD4P3b+zJtmEP0orJkq7M6KDcCfgyaineyM9zqI2yMz1gUIc3Wb
         JG7Q==
X-Forwarded-Encrypted: i=1; AKwUvBy453wVVVPbnb7fZp1D5DvFKONwf+kY76QCBSXREYUP6+73nq0lCZkHvWINtVMirgwsSc9VTYbQs32DbcY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+E1cqkf2JD273hIdu1g6uR6FZXwe7MAMAN83MVowngdOOgBmZ
	uPqUZZLJWHNu1al8LN9KSXPMzFg190UKI0SmaDL+v8VeClYDRR69U280DNaTGB+w4/Yd5mWwl0g
	V02hNKUDXd7iShMQzL7tcOlSCmPVQ5dgnsT86Mbrnsui3yOdfX8LfAT9oobqiHIcjsow=
X-Gm-Gg: AYBFou0wH6XPIefSnMBnD7rw+J1IdsqBHwCAAAcC22LPdT0kU2mN/Zjd9lG9dmYilWd
	ATJdJHI74IFasCGk4UEZYKmps7mrvGiyJac36sfDQCUiXxKfGCMXU/yaqtsw5fAt+dtvh83qh+9
	1B/5I4V5RhLMIQ0v+HPLVXIUQSF+a7AMk2PRBIx5NZ9tfSCINy2NkaxGbwpzM+57KuPO2R2FJVn
	Xcn2BvdZ9wJG1CnKmXjHypUOs9Qi4oFpsrQc52UoAOXZ5flDghwYc6+YhasJ1aTPCqOFp0d7uJ0
	rv/FUn3d+d1Y4RuKOqtNelsMgKhM6wm/l6XY9g16oxK2fH0L3TUUhD21UVQzx+mObZhRt3h9y9v
	U/nHQ9COET6d+JKpwHVwkNYxxXFkf4PEz9JuPvpFdpBerClnVwFALrw==
X-Received: by 2002:a05:7300:e9c6:10b0:351:606f:2832 with SMTP id 5a478bee46e88-361a16689d6mr2385571eec.3.1792210656417;
        Fri, 16 Oct 2026 21:17:36 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c6:10b0:351:606f:2832 with SMTP id 5a478bee46e88-361a16689d6mr2385521eec.3.1792210655817;
        Fri, 16 Oct 2026 21:17:35 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm10867636eec.18.2026.10.16.21.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:17:34 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH 0/3] phy: core, qcom-mipi-csi2: add generic MIPI C-PHY support
Date: Fri, 16 Oct 2026 21:17:30 -0700
Message-Id: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Doo-KCODTGYpSExCa5G_EalJcvtQH6K_
X-Proofpoint-ORIG-GUID: Doo-KCODTGYpSExCa5G_EalJcvtQH6K_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX+5w6VKDA8Y4D
 9VOSlYEB8VTeK3Lla0T4HAqpNEla1S6cjIf2RcVRiZfhV9Kiy21fjjGDlAjGJFfdwxfbdMAxxYZ
 dWxUmoNtf1QR9KIwekMObsXB0uoU7VI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX0vGh8zV61iPO
 HnE7CdZUGnmLwcBAF3EjG//l2JZVFEojqnQcfv9pd0PYXDfGb3wyv9aE65Z/yNYnT5tjNYyM03Y
 946UcX5dRvqJ9qrJU/yVdm0+g6B46aiXB+NKfBK11cLELiWipQcOyjy3Ng3EJYF9fXhrbS5PPpy
 b0kFoiWn4t/yEmLikeyuvZObX5MQdpMrrmqJSowMGppgBMbMHPUkuHPNhxl9dI1/7OOn0fP4YpB
 OcmGUWUwJJD9aTI3bz4hHeZmNz/QskyLvJQaBI9S48ivttGoAR6yQk4s+NYS75w9gqBn4kKhcDK
 tONo84I43O3SdnGXCx6oMpaD5eR564qi4fxhA1KWwWLIMhpTfNGfvft4UlXRqSbq6A4IiikWUGa
 d3Tp+Kdf1zRY9bVgGPsgKVou6LplaCp+jWsBKyZ/+p1y9PBPl18h0sNy8Fv7WRO1fshwmQbLcHO
 ZRzU9VdGfQSt3IUu9Aw==
X-Authority-Analysis: v=2.4 cv=SKzXx+vH c=1 sm=1 tr=0 ts=6ad2f6e1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UyFj12KqJ2bFa5q0Gy0A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170016

This series adds C-PHY (3-phase) support to the generic PHY framework
and to the Qualcomm MIPI CSI2 PHY driver, mirroring the existing MIPI
D-PHY generic configuration API.

Patch 1 adds the core API: PHY_MODE_MIPI_CPHY, struct
phy_configure_opts_mipi_cphy, and the
phy_mipi_cphy_get_default_config()/_for_hsclk()/config_validate()
helpers, following the MIPI Alliance C-PHY v1.0 timing spec. It has
no functional effect on its own, since no provider selects
GENERIC_PHY_MIPI_CPHY yet.

Patch 2 wires C-PHY mode into the qcom-mipi-csi2 driver for SA8775P:
the PHY mode is now derived from the devicetree endpoint's bus-type
property at probe time (D-PHY by default, C-PHY if
MEDIA_BUS_TYPE_CSI2_CPHY), phy_qcom_mipi_csi2_set_mode() validates a
consumer's phy_set_mode() call against that DT-derived mode, and the
configure/power_on/power_off/lanes_enable/lanes_disable paths dispatch
to the new C-PHY 3-phase hw ops accordingly.

Patch 3 extends the same C-PHY mode selection to SC7280, porting the
legacy in-tree driver's SM8250/SC7280 C-PHY lane-register sequence.

No dt-bindings changes are needed for either SoC: the existing
qcom,sa8775p-csi2-phy / qcom,sc7280-csi2-phy schemas already document
both D-PHY and C-PHY bus-type values.

Depends-on: https://lore.kernel.org/all/20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com/

Jigarkumar Zala (3):
  phy: core: add generic MIPI C-PHY configuration API
  phy: qcom-mipi-csi2: Add sa8775p C-PHY support
  phy: qcom-mipi-csi2: Add sc7280 C-PHY support
  
Anusha Arun Nandi (3):
  phy: core: add generic MIPI C-PHY configuration API
  phy: qcom-mipi-csi2: Add sa8775p C-PHY support
  phy: qcom-mipi-csi2: Add sc7280 C-PHY support

 drivers/phy/Kconfig                           |   9 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-core-mipi-cphy.c              | 129 ++++
 drivers/phy/qualcomm/Kconfig                  |   1 +
 drivers/phy/qualcomm/Makefile                 |   3 +-
 .../qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c    | 561 ++++++++++++++++++
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    |   8 +-
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 133 ++++-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |  31 +
 include/linux/phy/phy-mipi-cphy.h             | 177 ++++++
 include/linux/phy/phy.h                       |   5 +
 11 files changed, 1029 insertions(+), 29 deletions(-)
 create mode 100644 drivers/phy/phy-core-mipi-cphy.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
 create mode 100644 include/linux/phy/phy-mipi-cphy.h

Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>

-- 
2.34.1

