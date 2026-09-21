Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B365493D48
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988333; cv=none; b=HVvGw/ygYieUaK9rfnfl3VbyvstHnbzREoHufeE5170bsxz/He+gIJFZtBr8J36BUsUfBHDIhalc3B+7WfVl9i+PLFZKiq7uY18b/FKYRsNrkObyVEP+0/vMAhIoFc1Jm3lXHDkmoSf4iTOX7oxeMSNkM0qry5kbMxXTbf3xcfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988333; c=relaxed/simple;
	bh=oduM9aL1FT+aHgtEmP/1duAVEbqV4jHfob2776LVoOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onJwwh6vWoU5zg8UEcTieA35swmtCc5gCEh29EQ2sRES+RqDEZDwMz6LQJ7lc4O3T5uqFckocC9sPypeAB4kEz9A/jSKTq8P1vI6J29eYoS/NnNKi37gHy99HmhgCUfWFmGRUrmDnLQgdmItgvgt7OGRPP7Vhinfvxx+UMhBPCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvo8CIOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Olq0bcwc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvo8CIOF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Olq0bcwc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeDOt934672
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sufJF2pE9YrrcacW4N4xJyjFcVvEPNjPOovTV0qVArY=; b=lvo8CIOFxKXC4Rjl
	jZhNNnFesSSiZgEhPVWYpuDOaFQ7+jRinW/LydhPRtqCgHuZvkSGf+7ni6fc0a0n
	tp7Uxoomx/iQLtqZHuyKxtXN1dwzHYnDlW2W+WArIvmQixLc36IXPVnc09XptV9t
	nnnbtSrVyzj4FsiQ366myNwkkdwSZeq2a+3E8rvvsJ53ndOz8ZsZYc1UIGF/82SC
	raI/qMgXbIR04V6OlqiW//bXvKNN7S8D2GaV2rgV8xjGi9PWXjRr8TxfSk4s8Mni
	0qIibTs/ZjgPStuoMv3dkK3o4B5iAMix4HdYhgYVTEbAnVq6v60Pj2YNOnWrOamZ
	DyQW1g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8ba8pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:58:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3dad7ab3so3958550a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789988329; x=1790593129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sufJF2pE9YrrcacW4N4xJyjFcVvEPNjPOovTV0qVArY=;
        b=Olq0bcwcjgyaM7sdofVesNbFGecA6dRZzD3ITdPHXwvlAE5JKW6dh0lcKbV8ayb26k
         x4JgtVJMD7j2l7dHF1lPzSN4Hyjm2G7+ZlT5CYXs5SrNINbadinQzbEH+6GvCknaYnKH
         KmIpLRL9o6gT6v57UArbCKv5K7shiJyDbHqlus1D8l8rj1155Jh+SUQhz8K9VQ3ZE6+m
         kyYdzQoa+xczjQRdp/6H+mKsFskXlBOkW9VmQ1q3hpZJDv+eaJ8ifd2z4Y/IDj1fjQF9
         6kihXMi3HD5lOOnr3h466ziJN9F0yijor+5RlHFcZV17qItehB7zta9K9ZKVBoyTJT34
         lLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988329; x=1790593129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sufJF2pE9YrrcacW4N4xJyjFcVvEPNjPOovTV0qVArY=;
        b=HAUCoixWr+FQ2pHNiOWlkvDF26Co2hbylXSibGIdCX7FUmI87W00B2ZsOlwtiMZ2Bo
         nstf+vVihSU5/MQH4v9084X3APrnf7HNBLuVw+TcnG2Zo4OVmnU7DDP3l2jS2R+pa0D6
         s1PBZ3qAysiSWIkqxQo0p+Ev3tiDiei3WADpQ5yU/RwZRS1Rb5xSLCHKGhEouZih69bn
         Ra7T85377yaHKRPkBYo63n0uf4i4Nz0XEUpFGPfqUnTZmidfgVTPuP79vJxSBfpyeH+w
         y8WiJ8EKiCx1kWO+Ir97528uZw01vICeTV+vSPkvVZVa9xVGYV60S4YWNwFlBYGExdpk
         Iv2A==
X-Forwarded-Encrypted: i=1; AKwUvBwKNTwGnW3IQTmmvL0fkLmLnUrVAx2DRanCOdsl61TCLmFVIhcXxVnB3F0iXoyn0884BolIG8VifyR8qcA=@vger.kernel.org
X-Gm-Message-State: AFuF++nuS1mIuGSpwKuwJe8Mo13Si2+OX83mKfV2AcJhEH1sh52zWPG7
	WzwiECgBldQ1voAjfoKvkafLAPmmef+M+gTFMo0gRgCayyF+09KtpMZCdNONd+rjave47LxunhM
	GGvw9hPV5YZetC+SL0zRB/pJpnpUDj1hg3I2mhaTDB1bctf0nFrmQaZDK+v0P/Vb8TfM=
X-Gm-Gg: AYBFou117iynY6z9flMqmvcE3VwUb4tVs+HlAkivGdoF5a22BKgl4nEgAI36zbHkGf8
	SkRTk/OokmKeOM+QTCZKLM8wL9GMmV/f/UlYoXd26R3kgOufjlisI6Y/i52STp486Yx+9AwhvNd
	mtPqx/bHBAgThFC9yOKPkMQtHso5WwPxMgHMDtbzTlIGLOZ2StOOAgSqFK80+eJu6nUP6GkaY35
	YJLQ1aOgMgs/w0QcrzOmPayxXPQ54bhkpoJXYvk4z4g9K6a51xAdtp4sQFNQb9mqOit/yF0rCCR
	rBO/R2rlj3G3Ot1uqFFt7nyMT8XYQAgpdZGFQDiuPhqGdQzOJymI8xHjLTQ6IaZ196CnC+BTSe8
	JkaQK1fAOHlJHfDWg6Vc1FMCPbI9ZOzMFAw==
X-Received: by 2002:a17:90b:1dcd:b0:3a0:42a9:9c82 with SMTP id 98e67ed59e1d1-3a04d4b9ec4mr2387402a91.43.1789988329051;
        Mon, 21 Sep 2026 03:58:49 -0700 (PDT)
X-Received: by 2002:a17:90b:1dcd:b0:3a0:42a9:9c82 with SMTP id 98e67ed59e1d1-3a04d4b9ec4mr2387370a91.43.1789988328566;
        Mon, 21 Sep 2026 03:58:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm23544128eec.30.2026.09.21.03.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:58:48 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:28:14 +0530
Subject: [PATCH 3/6] phy: qcom: qmp-pcie: Add endpoint PHY configuration
 for QCS8300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-monaco_ep-v1-3-63c5282fb0db@oss.qualcomm.com>
References: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
In-Reply-To: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789988304; l=7227;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=oduM9aL1FT+aHgtEmP/1duAVEbqV4jHfob2776LVoOQ=;
 b=zkd0ILMA3W3e+HS/deym5WQ31iRun0M4IL1mFHzn16/7UwsG4IbBcbmR+6G3Ggouxoh6c5F/U
 QQ9bdwuVit+B51ovRRdr+uLiJt+0donrx5lOVCaGcQuBssDWnw3O29P
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1NyBTYWx0ZWRfX3rKWogm7rP05
 AEaHK1/1UcZJoCGR8JquHbDYzZEdarxTmtMeS8SD4uO94eLsC/fswtE5g0OrEc6th7F3xNqPX1J
 ZPEqHS2ppYPx3ExB5yMMTCCiw59+5tLe4L52YaEwNCbwoTjUF+14LHOgUlaPkVAoRmr9XMdlsWg
 yP7cyX/DaiP/jQRAQEBTTZSQw4RdTKNPwFi42PPzEHlj766oZRJadOcJqrCJQlxY0TzvcXtNRmJ
 xJyU6ppqHa0LpT1GsGx+z3wyFiFbDgQPR0rQ9ZZKm5EV5gUUQ3JwOwpI/nZr5ZvCR9rUjspH98d
 lTWmfbGJ1jAWJ5ugS8grbjjw8RnTuFT0PTRgBR7DuKYgrctWRan2zU/GspBiZ8OFIby/l5lsbDH
 tdMbNb5IVNkGst16wod8nTJZreerT/NutB05mNKaokE0qIa6zGVZgTnlrVb8xEQtCCHWJGFypGf
 mthr3SVJPCuHazzyoXQ==
X-Proofpoint-GUID: _l3hczITA1b0D-1IX07nYJmdhhmi2oTz
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab10dea cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eLJRkEBLYn0i9-GjmtoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: _l3hczITA1b0D-1IX07nYJmdhhmi2oTz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1NyBTYWx0ZWRfX1WNbFBOgO1zi
 Wu7qEOMOp02dV+WJ9abRq9hFslHj/lOh/vGDtGRWv5yLaCzGp9RQ2Dr2LaQcEfeIHMexterbMJv
 86zgtatSV4wzjWv6NooyAtpgNFGSWyU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210157

Monaco supports PCIe Endpoint mode on both PCIe controllers. Reuse
the existing SA8775P Endpoint PHY programming for the 16 GT/s x2 PHY and
add a new 16 GT/s x4 Endpoint PHY configuration with the required RX
tuning parameters.

This allows both Monaco PCIe controllers to operate reliably in
Endpoint mode.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 105 +++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index da83358c97ea..cf169d7cbd92 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1231,6 +1231,58 @@ static const struct qmp_phy_init_tbl qcs8300_qmp_gen4x2_pcie_rx_alt_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH2, 0x1f),
 };
 
+static const struct qmp_phy_init_tbl qcs8300_qmp_gen4x4_pcie_rx_alt_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_AUX_DATA_THRESH_BIN_RATE_0_1, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_AUX_DATA_THRESH_BIN_RATE_2_3, 0x37),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_DFE_3, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_DFE_DAC_ENABLE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_GM_CAL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_PHPRE_CTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x7c),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_IDAC_SAOFFSET, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH1_RATE210, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH1_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH2_RATE210, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH2_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH3_RATE210, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH3_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH4_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH5_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH6_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_Q_PI_INTRINSIC_BIAS_RATE32, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B0, 0x9b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B1, 0xb0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B2, 0xd2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B3, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B4, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B5, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B6, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B0, 0x9b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B1, 0xb6),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B2, 0xd2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B3, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B4, 0x43),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B5, 0xdd),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B6, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B0, 0xf3),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B1, 0xf6),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B2, 0xee),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B3, 0xd2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B4, 0x83),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B5, 0xf9),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B6, 0x3d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH2, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_FO_GAIN_RATE2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_FO_GAIN_RATE3, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_SO_GAIN_RATE3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_PI_CONTROLS, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_CNTRL1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x08),
+};
+
 static const struct qmp_phy_init_tbl sdm845_qmp_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
@@ -4583,6 +4635,56 @@ static const struct qmp_phy_cfg qcs8300_qmp_gen4x2_pciephy_cfg = {
 		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl),
 	},
 
+	.tbls_ep = &(const struct qmp_phy_cfg_tbls) {
+		.serdes		= sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl,
+		.serdes_num	= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl),
+		.pcs_misc	= sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl),
+		.pcs		= sa8775p_qmp_gen4x2_pcie_ep_pcs_alt_tbl,
+		.pcs_num	= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_ep_pcs_alt_tbl),
+	},
+
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= pciephy_v5_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS_4_20,
+};
+
+static const struct qmp_phy_cfg qcs8300_qmp_gen4x4_pciephy_cfg = {
+	.lanes = 4,
+	.offsets		= &qmp_pcie_offsets_v5_30,
+
+	.tbls = {
+		.serdes		= sa8775p_qmp_gen4x4_pcie_serdes_alt_tbl,
+		.serdes_num		= ARRAY_SIZE(sa8775p_qmp_gen4x4_pcie_serdes_alt_tbl),
+		.tx		= sa8775p_qmp_gen4_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_tx_tbl),
+		.rx		= qcs8300_qmp_gen4x4_pcie_rx_alt_tbl,
+		.rx_num		= ARRAY_SIZE(qcs8300_qmp_gen4x4_pcie_rx_alt_tbl),
+		.pcs		= sa8775p_qmp_gen4_pcie_pcs_alt_tbl,
+		.pcs_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_alt_tbl),
+		.pcs_misc	= sa8775p_qmp_gen4_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_misc_tbl),
+	},
+
+	.tbls_rc = &(const struct qmp_phy_cfg_tbls) {
+		.serdes		= sa8775p_qmp_gen4x4_pcie_rc_serdes_alt_tbl,
+		.serdes_num	= ARRAY_SIZE(sa8775p_qmp_gen4x4_pcie_rc_serdes_alt_tbl),
+		.pcs_misc	= sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl),
+	},
+
+	.tbls_ep = &(const struct qmp_phy_cfg_tbls) {
+		.serdes		= sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl,
+		.serdes_num	= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl),
+		.pcs_misc	= sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl),
+	},
+
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -6411,6 +6513,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,qcs8300-qmp-gen4x2-pcie-phy",
 		.data = &qcs8300_qmp_gen4x2_pciephy_cfg,
+	}, {
+		.compatible = "qcom,qcs8300-qmp-gen4x4-pcie-phy",
+		.data = &qcs8300_qmp_gen4x4_pciephy_cfg,
 	}, {
 		.compatible = "qcom,sa8775p-qmp-gen4x2-pcie-phy",
 		.data = &sa8775p_qmp_gen4x2_pciephy_cfg,

-- 
2.34.1

