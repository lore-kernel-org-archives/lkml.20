Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B284B1B22
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444439; cv=none; b=hf7PnbUSnecotVHsNtLbq6VP8mEhrChmYllbZgg9e93YDYGKlxw/x1RPRPf2C10tIfhAmwTwiqrc1Mk543aJPOTpfL7i2wzGEvyQbOSXRc3H6BhmIVKHQnhTXMQI8p9kxnTlOK/Y3aEyRyCoLeNcz4pD0BKHBpSQ5I5EiMD7No0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444439; c=relaxed/simple;
	bh=Ipn103QnOJj+g5+2vV3eK6EdSjIrlX1AnfeKc7VfOI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u+vZkyCYnoDS4ziN1Oi1Znprc4koeNOj3u4XNkgUHuALUL+HxXg1YaqNKR0hGf2zHF/n8wVfZKCk416lKjhNlE3geQgZBmgQIA0y0kXzid5vDnb6CDP98RnLTqUyhd+B8Ww9neSnJWMo3hBYGyqUo0a6j/TbkR/v/e9pnCmoIfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQYYPLPC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hu8YYAkC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQYYPLPC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hu8YYAkC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAcAs822639
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 14:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=m/l87Qv7rBaF1nYJ87j6T7Dv0oGuyZFmxug
	NhyaL1vU=; b=jQYYPLPCtEIvflCxXp3Y2UK0JrlChvgzgSj+KMd/S5KF8CtV3yE
	hFQnkMA8mcMWGMlj/9VV3YM0W3iLOZx/6h5hdak+J9oT0Bdv6YtdJKGyOLD7n6++
	mnmHN0L6xafHN2b2/twlWJNBQpIkWwpfvcExEWl9CTJplH6NX1LZGW2MlebuGctw
	XDh2W3Im2WrYxaGovQgBqlJ2jX5tmG54O+AVbomrp8HUIw5uh+PS0TIhy3mcDwPS
	khWoP1WtV0jMjmKdTyewNXghBOXgVFqLH96x11qyGewrfWzYtT4e7NRZ6fWacC2l
	xShwepaDA5SxiswByKoNQV0Qdj3ECUkPA7A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p710mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:07:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f80c76e6so40658515ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788444427; x=1789049227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/l87Qv7rBaF1nYJ87j6T7Dv0oGuyZFmxugNhyaL1vU=;
        b=Hu8YYAkC0043fOC8PHNT38GhSJJDCqt4vwmLf185caBz0R2u1rnv9KUIxpP4O0cSAA
         cizbeO6+uqhigBSjqqyWL10UT6NVG/e+EI3gv9sV5o6N/O7r/OShJxpoomll7wAdPedO
         E654F9mQCZFF/tJbV8kq46qMNIbGOXVM1/gZNtLAlLolrBbq4cVzyS3+cqjICk/NQaZb
         ihMWlklK/9UUTfNXoG161sC/swAtT39UNJYNDouXVx9HwfEwTQs41csi7A2/wtG92ki5
         SxznWO70ul2ezsXhZ+rGeqXv08Z+oZYcF2//9kuWiBt2Gph/QYKkbPdfwwEkDVl9jgZQ
         elWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788444427; x=1789049227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/l87Qv7rBaF1nYJ87j6T7Dv0oGuyZFmxugNhyaL1vU=;
        b=pDb1viKYQz6WOHlHIy+O32LUV3eMXwp8UcZvGiiCp1xSF2Ykwapjwsc7hAYw9uOmGV
         9nZfjA6udyeTSAVFYVJtv9Cac0zh5j91veUfe2j3OU/Lmynv7QxtrDhGr62Xs1HwqOGj
         BKmZNWN5FkVNRro3i3HzjczMr/rw9HfPXPnQ4jNM/TW5QRPN71QnhJJmS4N80/Zg0Ovd
         qSayd3ZffuVZCgLJqgGOzvRe70J2irRnpaRuuy83oGOwDsevO188NkUNYYnuhgiXIqeb
         RkcNSXQtMlzD/2VsaEtI7KamtGmuybXl0a9Xh5/PXx/5PtMgQNBVK32W0tNYYSXiRp/L
         B2TA==
X-Forwarded-Encrypted: i=1; AKwUvBxojLhtk7SyhJiwT/BPCZ2gac8DDTqE+sD2E+lWSFznrAq1JfzTRnI0+ilC6hrbPAAoI3wIqDSLLUOO3qo=@vger.kernel.org
X-Gm-Message-State: AFuF++llwb6Y0fNKs5rC7/GbJDs+152IQmBYwQDW5VgatBqO1eFm2/+q
	bBjj/onmrwYKcCDkoQWpIRyvNl6V3yi/A6UsaRcD+ACB/bDdRvb8meZFgdWS9iNkxxkRVmu/MtZ
	6mPAVuvMUYEEVmaXmr3dq4MpPHAn3tozt1zJ4GemsZEG2LI5V+1mKq08V8C3GMdsbyGU=
X-Gm-Gg: AYBFou0ruGHbZ/tAGenJI8ybZQIDQKKwkvH32Jgo9AR9GfSa65IOoEVaUiqNmMbjsKB
	jvSbrfwsfnIARol3AUj3ygHIbHkfYqsXZfJmTg+2Z/wJtOIJ93ndh+rtsl/LfCBCAaK6ZqCWAxh
	htdH+MSJADuLtxpneUNvn+eA1M6gbv5s7bRzN/7UZ87GwNUI2bdduYFPagIKTNnZlYpNEuFl5PF
	pwqAT3jYDMtfUOOGYM7OG/BAtRid1UDAbmftr7gh2mrceDE7aFHEqfvQgETfrgcYGr3uKFcByKZ
	altFDzmBjsRzE6DSfe5EGAROb8bUo4saOZoF8EMYdAnuSlEL1Ag8xR/uK6yJpn8XWhTqCcPtWB3
	EhMCcMOg5cemK0L1ftMonB2YZNvaTUY7twiKh5gWFARXvFaIMrq4QLLbKMjvI
X-Received: by 2002:a17:90a:e7c9:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39aedf5da48mr18097206a91.5.1788444426265;
        Thu, 03 Sep 2026 07:07:06 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c9:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39aedf5da48mr18097054a91.5.1788444425562;
        Thu, 03 Sep 2026 07:07:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1431994fdd7sm6809098c88.10.2026.09.03.07.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:07:05 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v14 0/6] Add initial device trees for Nord platform
Date: Thu,  3 Sep 2026 22:06:11 +0800
Message-ID: <20260903140617.441111-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dBdB-x0H7izjbi74Gv3Fc0PbFQIHk7G_
X-Proofpoint-ORIG-GUID: dBdB-x0H7izjbi74Gv3Fc0PbFQIHk7G_
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a997f0b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zn26RzM0P8J-Jt8AhNEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyMyBTYWx0ZWRfXwEnOz4vusyyf
 JUerWrPVCwQ/fWMOAyxG7Q9SYPZZ9s3kDV9jsavjogswNPz8zrAJLbviU3DF0Sa3wFka3LuxKCa
 vg1j7BrmSfj+RSKsjnwPD43tnOmGPKU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyMyBTYWx0ZWRfXxOx3n7iZosr0
 qYCUaNT1PnEnLtY3v2qAF2iVS4ilIn+PDIofBH0O6n8xEXqcYF+Ge77xS1khgqIkN6R1kzjNitk
 Xgr7lwlgP9Vu8vAfqik/nD2tGysr4N3pUW/bsRFUmiYmqvBAT5FYDRR8zd22vAPz7xsHTFACunj
 KTFEYGpFq0HTJ9QXEHPzmjijG5cRkTtTTYJDZBS/75mB62MAqntX8NAzlxCLvochNiSRGOiDH46
 a2SR+UGYfhLXzHVOk9xvFzVnQEu6xoov8scCEwAt8jL3GUrft2ji5A18ewI98bnqB+FcWBRP86k
 Rno/eYfrN51tNkthokUZwya+lqKMLFLjK8g4tsjqmzv7s4B5ffGdWm5Dg9iJ+boeUG6PDYuY2hZ
 yW/dUzjbnSKoGk12cS6t82sox2aJp9K3PzInXMrXea6s4UGDnHsiR0C98TgBYT/R8QfCyHHnOBi
 VYvdL71CBOQJcK48SQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030123

This series adds initial device tree support for Qualcomm's Nord SoC
and the reference design boards, SA8797P RIDE for Automotive and IQ10 RRD
for Robotics.

Nord includes two variants, GearVM and Embedded. The GearVM variant has
platform resources (clocks, regulators, powerdomains, etc.) controlled
by SCMI server running on a VM. And the Embedded variant has the resources
directly controlled by the operating system.

SA8797P RIDE board is built on GearVM variant, while IQ10 RRD is built
on Embedded variant.

Tested on next-20260831.

Changes for v14:
- Drop SMPS regulators from from nord-rrd.dts, as the resources are
  already managed as RPMh power domains (Thanks Konrad!)
- Link to v13: https://lore.kernel.org/all/20260828034958.3165-1-shengchao.guo@oss.qualcomm.com/

Changes for v13:
- Update commit log of patch 2/6 to reflect SCMI channels for I2C/SPI/UART
- Include qcom,rpmhpd.h instead of qcom-rpmpd.h in nord-embedded.dtsi
- Link to v12: https://lore.kernel.org/all/20260826041200.528588-1-shengchao.guo@oss.qualcomm.com/

Changes for v12:
- Update interconnect-names to be one-line-per-string style in
  nord-embedded.dtsi
- Fix SCMI channel for I2C and SPI in nord-gearvm.dtsi
- Correct cpu_perf node in nord.dtsi to be a power-domain provider
- Link to v11: https://lore.kernel.org/all/20260816125413.1635150-1-shengchao.guo@oss.qualcomm.com/

Changes for v11:
- Use hyphen in rpmhpd OPP node names (opp2/opp3 - copy & paste from
  lemans.dtsi)
- Link to v10: https://lore.kernel.org/all/20260810114313.776563-1-shengchao.guo@oss.qualcomm.com/

Changes for v10:
- Fix reg size for ICE to match hardware specification (Thanks Kuldeep!)
- Link to v9: https://lore.kernel.org/all/20260806081554.448531-1-shengchao.guo@oss.qualcomm.com/

Changes for v9:
- Re-add UFS support for gearvm variant as the binding dependency is
  resolved on linux-next
- Add #cooling-cells for cpus to make cpu cooling devices available for
  userspace to control
- Include CTS/RTS into UART17 pinctrl state to ease the Bluetooth
  enabling
- Link to v8: https://lore.kernel.org/all/20260729010022.875799-1-shengchao.guo@oss.qualcomm.com/

Changes for v8:
- Drop UFS support from gearvm variant to clear binding dependency
- Link to v7: https://lore.kernel.org/all/20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com/

Changes for v7:
- Do not paste the comment of bootloader updating IRQ number for each of
  the 64 SCMI instances
- Correct crypto status to be "okay" in nord-embedded.dtsi
- Drop scmi15 from nord-ride.dts as there is no consumers
- Drop unneeded LDO/SMPS regulators comment from nord-rrd.dts
- Drop regulator ufs_vdd_hba and ufs_vccq2 which do not exist on RRD
- Drop always-on/boot-on flag for vreg_l3e_1p8 and vreg_l2i_1p2 in
  nord-rrd.dts
- Drop untested I2C device and add tested EPSON RX8900 RTC for
  nord-rrd
- Restrict nord-rrd UFS PHY regulators as HPM only to avoid potential
  intermittent failures
- Link to v6: https://lore.kernel.org/all/20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com/

Changes for v6:
- Move ufs_mem_hc reg/reg-names from nord-embedded.dtsi into nord.dtsi
- Enable crypto by default only for nord-embedded variant 
- Add a comment above each SCMI 'interrupts' property to clarify that
  the IRQ number is expected to be updated by the bootloader
- Improve commit log of Embedded variant patch to be "directly controlled
  by the operating system"
- Merge two board binding patches into one
- Rename sa8797p-ride.dts to nord-ride.dts, iq10-rrd.dts to nord-rrd.dts
- Expand RRD acronym in DTS patch commit log
- Fix copyright in RRD DTS file
- Add firmware path for qupv3 nodes
- Link to v5: https://lore.kernel.org/all/20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com/

Changes for v5:
- Rename nord-sa8797p.dtsi to nord-gearvm.dtsi
- Merge scmi-common.dtsi to nord-gearvm.dtsi
- Drop "qcom,sa8797p" compatible
- Add Nord Embedded variant and IQ10 RRD board support
- Link to v4: https://lore.kernel.org/all/20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Rebase on next-20260706
- 1/4: Drop useless comments from arm,gic-v3 reg property
- 1/4: One triple per line for qcom,pdc-ranges
- 2/4: Improve commit log as suggested by Konrad
- 4/4: Drop 0 polling-delay as that's the default value
- 4/4: Name PMIC thermal zones with prefix "pmic" rather than "pm"
- 4/4: Drop 135 C trip point from PMIC thermal zones as hardware will shutdown
  at 125 C
- 4/4: Have trip0 at 105 C as passive and trip1 at 115 C as critical for UFS
  and SDRAM thermal zones
- Link to v3: https://lore.kernel.org/all/20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Rebase on next-20260525 and drop patches/dependencies that hit linux-next
- Improve commit log of "Document SA8797P Ride board" to explain the need
  of SA8797P model compatible
- Fix the real issues reported by sashiko-bot
  - Fix unit address of pdp0_a2p node
  - Add missing compatible for i2c15 and spi15
  - Drop GIC_CPU_MASK_SIMPLE(8) from arch_timer interrupts property
  - Update commit log of "Add device tree for Nord SA8797P SoC" to match
    code change
  - Sort sa8797p-ride thermal trips in ascending order of temperature
  - Fix sa8797p-ride thermal zones with identical trip0 and trip1
- Link to v2: https://lore.kernel.org/all/20260519063505.883379-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rebase on next-20260518 and drop dependencies that hit linux-next
- Include SoC ID changes into the series
- Include ICE binding change into the series as the prerequisite change
  from Harshal [1] was merged to qcom soc tree instead of crypto
- Improve commit log of SA8797P Ride binding change
- Use label in nord-sa8797p.dtsi for referencing nodes defined in
  the base nord.dtsi
- Link to v1: https://lore.kernel.org/all/20260427023455.236410-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com

Deepti Jaggi (2):
  arm64: dts: qcom: Add device tree for Nord GearVM variant
  arm64: dts: qcom: Add device tree for Nord Ride board

Shawn Guo (4):
  arm64: dts: qcom: Add device tree for Nord SoC series
  arm64: dts: qcom: Add device tree for Nord Embedded variant
  dt-bindings: arm: qcom: Document Nord reference boards
  arm64: dts: qcom: Add device tree for Nord RRD board

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 1820 +++++++
 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi     | 2848 ++++++++++
 arch/arm64/boot/dts/qcom/nord-ride.dts        |  254 +
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  424 ++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4605 +++++++++++++++++
 7 files changed, 9959 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord-rrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi

-- 
2.43.0

