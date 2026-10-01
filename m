Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358233D3CEA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790834293; cv=none; b=Pxz1qjfwVfXh89FSRXZgOjZXfuUf0yPriWMiZHqCVvA1w7EeqrMdMo2DVN2ub5FWoq9pdNydENswO08okepSGRraGcLbZj0ywvo6txOim9jFIWTOtbAbkoJk0+Gl+iCU7yX42UGp+8+p1QKAROW44GA9oCKZGB2XtaYvYb+auRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790834293; c=relaxed/simple;
	bh=ZAJVE6u/5pgj3dtXzmvqJlRKQyd99Gav5Yn2V6EgEFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mq8Zs0gcf3W+ZcwZT0wGV3ahq+/sXQ1vSNhKr748WGIUYe60rVE+FkNAyQzaRpNFuEesAur9X3C8R8KXB28+hIPs+oSW3km+x39kIguagQu8/AwMcVGZmLLw+RspqytHOdsXcJlHt8BY2Y7KTm5cELUfdRKOWyMcSW/AtTYjuJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3H5cXhk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQmSK2PO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3H5cXhk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQmSK2PO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gDnR640179
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 05:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2G5h+JEtmfDdvrnSRsTVE/
	VpkCm/vRkciXkfJD70eVU=; b=D3H5cXhk2VwevIDLxAHrxcAGAWdX5HcGVCqfDQ
	U+ZBFJZX4vdW5Sc/ZQSMCrrM5vf0ye7GDLIFNRqMrKFZ+TTjMhpZ/0kr09enn6nz
	mlMh8qZ4mYo8lx2UCWUPVhbeh20hrtOtnWXndbr1E1Hihb5glMnULtcaUL4UVifh
	fgWPeMOdYWrvRRUDLBDYmEQSFBI66yQkVT4cBH6PejgiyfS5YvShzegpK25Z/SmD
	OSEbdo+0FR0Ihd4o6UN+NOwL6bjhVoZnSSaP24RXDPssVQ++9NHmMvWFUdKXdgMo
	mSN1DfB+slNpx1YXLJ2o2hR+VOtenpAWymEUlJXsQ7vd45dA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvt6h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:58:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2e064b7a6so14503335ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790834290; x=1791439090; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2G5h+JEtmfDdvrnSRsTVE/VpkCm/vRkciXkfJD70eVU=;
        b=VQmSK2POlo2c5TSDiu8IM+4ZvuIN9X93qzyxvl7mnniR6EO+/aV4JCzOMwhSXlzD5L
         cHgpOkiugD9TOywcAXdAzy8bCSd+J6j9A55zhqsLbrMxJwvM7GBeZRgOUwVhbCWYNIsH
         6DDVwSTQ6pP8sm7Jel0P5rP+GuiaEpt+PXopgwsKLngjq6BJ9eyRUUCS3ahhwaIRptfp
         04v/L91ha76L3yPuODDVMnZgAjQCXIQoK43zxHwNfW91vdsnYyL9TrlwbIo+rDrp3aA4
         Dc3V6exRWsRgXX/C8JavH8ruzXJ1pQbZrqw6bE+3u3nlXdoaCanIsaR1bfSz0gWdroTa
         5WXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790834290; x=1791439090;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2G5h+JEtmfDdvrnSRsTVE/VpkCm/vRkciXkfJD70eVU=;
        b=YDOPOho7HyLPk/9XN+ffrQ2ZBdtTJ6mVy4LwzzOKVybn3ONPym6HwxF4nomJWO0EIj
         nyrynWYgtG6qpuv7FAU7awwSW/nkEk8GzAzQVvLJAJnibdO4cY9PN6R3Nd3Nh3TznyOo
         tc4jDC0qHOKKEEwcKGvqDWYtIMaT4hOz08OBQoXmsHHhvGZ3RegmbbGzHENReB1771MR
         6uW/odJ3wzAyX0pa+W/rVTVEH69z/FWWEixOenkFUfL3it6QXAaLhIYFAlu5X7G/DrPG
         nv5Ogq9YgpShUmEpeWggOW3fEgO7dI++aaCKXboO11hMV4RAvNFOHK34Vk8+IjHGGHy/
         CFQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzENDmcPCpDZYbx1NN56oehYBEvoEtWwmMJWXC4F4MFW1dF1foruEqO351ij5/hItD7VMIcH9Q6KnhrZyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWnPWEyT2Qs3TVE6andNibBTBlve9YzlK61Vcbivn6Gvdel6j+
	YtT2VC1tQ4vG2Or3nyTAy+5lUwkR+3P7HsuV9wqX9+Xl6kvjUmCcNYhoh+qqQH7PWUzSS8kO+9t
	pHSCXfcUj5JOGWpMHKkEe+9jcHYsPSJK3d80fxIOZ9phe/341lC35fJdXyDVShwTIyndknM2zSu
	o=
X-Gm-Gg: AYBFou3d56zvQ1apO5yryDSs2sNAgPNfsMqmqZZB1m6SOKQfTjE67A7WQeoyjRM/HLY
	/Yredg3QmH9M1pn5QnOEFLhtnyjFQ4TJxun7FF+OBAOLkiuxZNmBDXnsx7o5fcQmqs6P+SCnvSB
	oGcRETBLU3xxyN70lzK+CQO+zBNW19tWaQ8KqWHWkubOMA6KdEZipTqJXv3JXi9LDPhOEpcynAD
	3BWJZES7qcLq++C2vpW/7IEF0Xjb6zuE6GqtGXru3Wv7ugL3K2Q/cbXZUkiXA+wKI89OaoYgU4O
	tRlatGCvlVgtDU5meTZiOVU2KKy546FNiqWqRCwIw4uG9kNL8CdqeeMe8k5d+04vLWj73MWwRio
	3BpB+eBzY9oV+IWLFzeGU9J+QbZWG
X-Received: by 2002:a17:903:1a2d:b0:2e3:c84:a663 with SMTP id d9443c01a7336-2e30c84a7edmr6469055ad.32.1790834289706;
        Wed, 30 Sep 2026 22:58:09 -0700 (PDT)
X-Received: by 2002:a17:903:1a2d:b0:2e3:c84:a663 with SMTP id d9443c01a7336-2e30c84a7edmr6468935ad.32.1790834289252;
        Wed, 30 Sep 2026 22:58:09 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e317ca6e30sm305045ad.47.2026.09.30.22.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:58:08 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 11:28:02 +0530
Subject: [PATCH v3] arm64: dts: qcom: shikra: Add WCN clock to wcn3988-pmu
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bt-wcn-clk-enable-v3-1-19291563b927@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGn2vWoC/33NTQ6CMBAF4KuQrh1SWkDqynsYF20ZpMqPtlA1h
 LtbcOOCuJnkJW++NxGH1qAjh2giFr1xpu9C4LuI6Fp2FwRThkwYZTkVLAM1wFN3oJsbYCdVgyB
 KpHnBeSplQsLf3WJlXqt5On+zG9UV9bBAS6M2bujtex31ydL75/sEKHCqEItCpyWmx965+DHKR
 vdtG4dDlhnPfiGxBTFIYC8FFZRVvKyyDWie5w9fkkC9FAEAAA==
X-Change-ID: 20260925-bt-wcn-clk-enable-9de068334aa1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790834284; l=3305;
 i=yepuri.siddu@oss.qualcomm.com; s=20260603; h=from:subject:message-id;
 bh=ZAJVE6u/5pgj3dtXzmvqJlRKQyd99Gav5Yn2V6EgEFM=;
 b=7G5No7sqk1ZWSrsbDWFz/fMtj5Oxl7rv3FuJuwOEQYQD9zHIE7cVfmf/pUDT6tjnEIBKbacs0
 DWxeovWUOgnD++wFTtbAyBs83DH1i9RY+TxUDurgFyYx4/wveK4u3RA
X-Developer-Key: i=yepuri.siddu@oss.qualcomm.com; a=ed25519;
 pk=ldEQwkUmctxwDtIVURg3xvXfzZavX8decqpk/pVLQZg=
X-Proofpoint-ORIG-GUID: UtxRhyjUdLGXuG7_0eBABlVmvszBR_bR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMyBTYWx0ZWRfX4HUsAHvTeqt3
 9h2yLrz4Kb5S8XzjP/osl/ncvjyNna3n9uWkIbxWr6xi4EK8ULrMYGmwl9Rbv+VzQB6nQt+pvRb
 RiOTTOuufWtxu5wVilo+O3v/1M0MqvQwjl/02J4PvNmJPpZaCH0WjysBY33dNKaaMmaK4fSclYS
 bdNA/63IW9yuID84rHruqfu93e27hREGrhpgkN8GEJjEJ5wsJPJtWXZvxv61xeZzXWb3LmNcnRA
 Sc4emI6Pfr9vvqewv14UdHXETcnZYXEIp0FUsgm/l03ENkeCNeku01qlpt0ji0grCHMSjH8nf6V
 eQXz/GAJH1+lkYhdYo0C61dEedGFcmSC1IwiwIKONZ8YPONr0tGhFc+BDhT6OcnEelRs1HUpE8F
 +GEvd0ScVj8kcJA8WKzowgpu7nkTXD8Z3wxD0jAceh8lbpb3TzqZSVBH+XUzE+qbt/hpW+vnHsR
 xOQWiXvbArIelvLPXAA==
X-Proofpoint-GUID: UtxRhyjUdLGXuG7_0eBABlVmvszBR_bR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMyBTYWx0ZWRfX2M9kN3LV+aB6
 zeUNsllhuyFJfPcm9yjF4cGMnynuUG/eaUnjYJ1Fu7qerhKlqPbpXzU62x55mnEvW42rOFur3cV
 c+f5qmEsBLpJc8w8bRPvYdUb3UDGYKA=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abdf672 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=nFpRB3HA4ShsSgQ7ypgA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010023

clk_smd_rpm_handoff() votes both active and sleep RPM resource states
for every clock, keeping them non-zero until a consumer takes over. On
Shikra, the BT WCN clock was surviving on these proxy votes. With proxy
vote removal on QCM2290, the sleep vote is no longer held, which means
the WCN clock must be explicitly declared in DTS so the wcn3988-pmu
driver can manage it during power sequencing.

Place the clock in the wcn3988-pmu node since the PMU driver owns the
WCN power sequencing. CQM SOM uses RPM_SMD_RF_CLK2 while IQS SOM uses
RPM_SMD_RF_CLK1, reflecting the WCN clock assignments on each board
variant.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
every clock, keeping them non-zero until a consumer takes over. On Shikra,
the BT WCN clock was surviving on these proxy votes. With proxy vote
removal on QCM2290 [1], the sleep vote is no longer held, which means the
WCN clock must be explicitly declared in DTS so the wcn3988-pmu driver
can manage it during power sequencing.

The clock is added to the wcn3988-pmu node in Shikra DTS. CQM SOM uses
RPM_SMD_RF_CLK2 while IQS SOM uses RPM_SMD_RF_CLK1, reflecting the WCN
clock assignments on each board variant.

Validations:
- BT enable/disable verified on Shikra CQM, CQS and IQS EVK boards.
- Confirmed WCN clock voted on BT enable and released on BT disable.

[1] https://lore.kernel.org/all/20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com/
---
Changes in v3:
- Merge technical details from cover letter into commit message per Bjorn's review.
- Link to v2: https://patch.msgid.link/20260929-bt-wcn-clk-enable-v2-1-7a90902f3df5@oss.qualcomm.com

Changes in v2:
- Move clock property to wcn3988-pmu node instead of bluetooth node.
- Drop hci_qca driver changes; clock is managed by the PMU driver.
- Link to v1: https://patch.msgid.link/20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..48af2bb87cf3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -45,6 +45,8 @@ wcn3988-pmu {
 		vddrf-supply = <&pm4125_l10>;
 		vddch0-supply = <&pm4125_l22>;
 
+		clocks = <&rpmcc RPM_SMD_RF_CLK2>;
+
 		regulators {
 			vreg_pmu_io: ldo0 {
 				regulator-name = "vreg_pmu_io";
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 4ff97945274d..90aceaa6e1e3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -52,6 +52,8 @@ wcn3988-pmu {
 		vddrf-supply = <&pm8150_l8>;
 		vddch0-supply = <&vreg_wcn_3p3>;
 
+		clocks = <&rpmcc RPM_SMD_RF_CLK1>;
+
 		regulators {
 			vreg_pmu_io: ldo0 {
 				regulator-name = "vreg_pmu_io";

---
base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
change-id: 20260925-bt-wcn-clk-enable-9de068334aa1

Best regards,
--  
Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>

