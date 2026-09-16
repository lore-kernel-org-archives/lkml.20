Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0674EE846
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558197; cv=none; b=OECoAz5cil8HbymgHXaJMR71TRD4V/Uq7xIdTQL1eDVxboixH8tkONPUBRf80SVTcysaOpn8kMH8y9Bf/Oeevwz8cinezpo09dkVu8uM83r4QBFRvW5bmdJH67ksWgOvYlFdawOGeCtGbpqKdSLNjcZz2GQQsxEc1lUBSIvDzJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558197; c=relaxed/simple;
	bh=u07xYUjbfEz64933HTdCJ5OvL8I7Dc3c0BGL8LdNwEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=D7AtQLtjkLb3mk3eSbdh4FdzS/6j5iDMdkU4a8KbCBN3mtEdMR0yOSilOxZGoMD6rqD6xy7RnyqHd/X+5T2WdsAy0HE/LAmZjovoVyUvczyMXcqyz+Wh4NAMBflSuIekIyQLjsaopLcFLEya18jtncNC2GsPNfUrTCmcTgg1Aa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QLkgbmE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UMgd18Wf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLkgbmE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UMgd18Wf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92p3X3377321
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HKkSfrJKmbm+Vi+iWHWqdb
	NB1zQHXRNLQEPOhAgkdvo=; b=QLkgbmE0jC46AHaG5bAe+JZQncpJaWdfjuUBXE
	mjMaELs+RIrHRoiG4mL/ie1ar+qBPsOoLDQGU+Ohu/ZMunqJ5ESuPBleuZjO5N4h
	mkEjw+yVE2DRPwshhS7WgN19CK8aS4esMSvIVAzSbwZQaNin0zAl11k/4/6lKxTR
	LFQTvWRAB1X9C3/gJttML/S0hY0Yhy9huATW8Fa+0gZIS1CM8W7dolpqJV/AWalN
	1HtB7vjL/mjzn6dip1dxMujYB1NJpDZxEmJbN8DtJMGE/DojB0SgDPOUswStmK6t
	G6cbU8CUrjzT9Vq2TIlXID87wsMrbd/0Ny5iK0v3JehpYplg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefpavch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:29:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a08ff8451so668265985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789558185; x=1790162985; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HKkSfrJKmbm+Vi+iWHWqdbNB1zQHXRNLQEPOhAgkdvo=;
        b=UMgd18Wf7AxX498uNuVDlxBSfdmIiZN+ZsUNgr48IjQDIRBACTm20jFqZcsXdtKAny
         b4nb7PnxrLO1AO6Or/bWk29Kw68pVOMhBuMd0trDMJVFJzJRuXGduRAgIPQIBPl+6KYV
         +LceNPro5JfqR9aBv1z8LLnElDsEAHY6q/GgYO9aR7ghfkY5ElbHiPcQ1VI0y+iNh2e9
         /fzkBwYNL5V3jX4VnfLUxQVQ6G+Cx9OzgKwmmAc7D5FWkS/NJl+pcR90t60G5ds4xFyc
         O1/8DwLY5CcV9kFjlAI1Q2tmP0HCInG1q32FzG/bfYR0j8Pu6S80O3o4QjHueXESJvyS
         2SwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789558185; x=1790162985;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HKkSfrJKmbm+Vi+iWHWqdbNB1zQHXRNLQEPOhAgkdvo=;
        b=i4aUbORoii50ltx7dXP5lTfrlMQwRG8QM7kz/cu4CHQ8rx5gEe7A54wA0SAVwzTOJ0
         kcC2X8Shq9r7kK7mFJLF380ODpUmeIyJrXj98bF/WetEehzH0cDxaRxYb064DRISp1J9
         ojuGR/iHWd7fhWXtJ0SZUpVG2Kc6dJ93TWWVDVV1awcHTB99SDFy943y4hqIz63eBw/S
         6KHLHkDdNBp1ffCVHyBJrK+KhG0LtHwB49cF8N79ymBECYfhF76j0qzjZ/ot939RaHfU
         +hzdMRfrFoInQ14vWZ5rouo0fcqlx3pv+pPKo7b4oryBrXQilf1aCgNKnG9FSzzliTwU
         BD7A==
X-Forwarded-Encrypted: i=1; AKwUvByBfci+v6Y8fMgJwzsV8aBaBy4gSgSgoJ+K32yxEJGcg+EYyrcUehd6fNsyY7tyY0ELG5FQoP3h5lLQP+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kDLdZn8XSISv8z0nSu8ytmEuRstlWX8n4bDtNpu4ULGBzy68NH
	oB28U6s4C7Zsq0JbCTw72y8ijWlNNmn8Uo4AAKAHKUWdD2g736Pt7lpj2nXW641hzBsvaB5kLT3
	M0LD9VrV511hVC9kKjSgykTqbbmbzokwtrLG7nFWCJvjRimGUSHRy0n7qyaYIQ4RslHloX3Eyr2
	E=
X-Gm-Gg: AYBFou1yL0VB/93ig7h0UZdI1LyHilYGjBgDf+f8DvK7t7VwrE2FbBBs0ccLZGSSQio
	fXdVibGzj9yVR3janjiO3KzembbRwjCM9YaGb6+mcb4u5VCzEvOQkUihhQ6UvyFeMBcp3dYDxKi
	o2+BC3085Uj487ZmpoNYhuVJYRmhLmQFjzwUU/xjH6FTsnR/5yqGW0YkRjoZKOlXyJrryxn64CN
	vdNC020WTucy4OPGSMqtygooHZAg4rPbOLzTz2CzcuYx7NweCm3pkONfbeupVqvcigu9kj5nfDL
	gWbKHtBR74Xo63YvS4KtO+SlPVmgNafRswWc3mekLuuQCfeFdp9hb3EqqGBhpHN7yLRXLEBb1HY
	z1QuHokI=
X-Received: by 2002:a05:620a:f10:b0:93a:18f7:5aa9 with SMTP id af79cd13be357-93bb76e6779mr321771785a.4.1789558184533;
        Wed, 16 Sep 2026 04:29:44 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:93a:18f7:5aa9 with SMTP id af79cd13be357-93bb76e6779mr321765685a.4.1789558184025;
        Wed, 16 Sep 2026 04:29:44 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dba8f4sm68218765e9.13.2026.09.16.04.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 04:29:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:29:30 +0300
Subject: [PATCH] clk: qcom: gcc-ipq5424: Fix TME reset register offsets
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-gcc-ipq5424-fix-tme-bcrs-offsets-v1-1-0fa10674908a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJl9qmoC/yXNQQ6CMBCF4auQWTtJ20BFr2JcyDDFUaHQqcaEc
 HerLr/k5f0rKCdhhWO1QuKXqMSpwO4qoOtlGhilLwZnnDcH65Eed1wojjgQocxLU7sag7wxj4w
 dJcUYgnJW5L5xbevN3lkL5W9OXHa/1un8tz67G1P+BmDbPjVv4NONAAAA
X-Change-ID: 20260916-clk-qcom-gcc-ipq5424-fix-tme-bcrs-offsets-ed5288607211
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2120;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=u07xYUjbfEz64933HTdCJ5OvL8I7Dc3c0BGL8LdNwEQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqn2lwE0mGRqoXEzDB5+iLrIMvjxboiQb1sRsA
 chfljAEV7GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqp9pQAKCRAbX0TJAJUV
 Vt/oEAC/WQy6c52Zevv1eDfxjkTUqRi0gH3FAoZSaCmnMCmNjBDZX941tfll/n0TVz/BLfq72sv
 Yh/qPUyn1y22iKBXhX1ay3UxTP7Rhq1hgZnlI5pp+EE63ApDk2hZzjurY1pn1fv+LQb/vYq0UMJ
 RjWwPROG8HsM1x/pEXY9AI6l/lfF5VRMY2E9/LUK4XCBD1zkpu/LaPKxj8wgCJjVn7p+vR9vS/4
 rJretpeDq9So3ZMU/yo3TxbIYq1rvsp2DW6W3EPO0EXQ24Yg8G+YAuHNGzLYn5MBJ4nD/rgyrap
 neNlLS/w08krtEAxNCWr8P2fxdMqLI3VkSEeqFWHI3ZBwf/gHr1fFmEYRqiPJUc5qSzd5GMhfWn
 A2wWpJQ3wZy0pZXyE+b1C/rXq/S+A5HRpEV/pMJp6WNJdfXn0hoN3LHCRioclvv1QeVrv1Jh7SJ
 PW+AnFrJD5XuO+Mbsq/FqiOlRKo9vBSiSVSNcXLstxloUdaeit/aaLn6bv9v9gJcud+6pU49342
 nMtzHYHQ1KmkZTL057FNENeq2dCN84f5WDC4GmNEDmH9d0EBUXEQm9qMXmIIqS2gkA8EFEmg6AJ
 pI8YpdJdisYgf9cnP+XxDoEg4ShYa1ZmWcx8toTXNTvRvjGvrumeveJJToc7HrtxRmI1C3uqkGy
 u9z6tp2X8GA0r9Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE1MiBTYWx0ZWRfX4oQnATMbaNLH
 T74YuFi8jbnRl9J/jlh1jSRlmriZ81Ixt88aW1MoFGkANJeH5U3xAWxX1NxFueaGV3pyPTU0h4M
 G/bB14IGTgVwXXstDlbp1d2+fyrCdfc=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa7da9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Xhecoh7arBsju60niasA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: yAN_s99h_EdGJHl_z0AnK5FF00phuwH2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE1MiBTYWx0ZWRfXzs2ZwqoHKUhY
 EPpqvAU4qo35o13ErkoAHyfHziwISc2lLnGks8f5T99vVKVyLstHbXAvoYsNswHBqlDaq0K/zfb
 WOxNOs3d+Da84tn2kULfjvKxTSXZ74g15n0ws3NH2QUu9jEuz8HlFIl1e0eu4HhwLyQTTqi3KuW
 xJ3Jkndb94WvbwksQNxjwIWSdPcg0WFbOwCbixjlTa9ykSUihn2V/DRQnH4Wz4Ds2rO83ieWF2h
 OewUtHGKoVazxK335FRMK26hLn+US44qOQIjGNAcTvQjEvtV82axmnk9vRPUC8oWSRbz2s4PTGQ
 HHpM0DH9qRug+i3aAvZgo6L5XqRNi42+rVn2MawTiuEGmlenGhXGYYLj4i2SdboBYAAyEBI48yY
 DL02UPGFm1Ma50p+smNhUTtYwdl8U6zFvrkuXumS1Qnz2TmIEWlAJCwEM4Hx9EelzfR9xMjp2sN
 SJ8nyszWISa2X/qNzFA==
X-Proofpoint-GUID: yAN_s99h_EdGJHl_z0AnK5FF00phuwH2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160152

The GCC_TME_BCR and GCC_TME_SEC_BUS_BCR offsets exceed the regmap maximum
of 0x3f024. Regmap therefore rejects accesses to both registers, leaving
the resets ineffective while the reset operations report success.

The offsets appear to contain typographical errors. Use 0x10000 for
GCC_TME_BCR, matching the offset used on IPQ9574 and the surrounding
register layout. Use 0x1a030 for GCC_TME_SEC_BUS_BCR, placing it in the
same register block as GCC_SEC_CTRL_BCR at 0x1a000.

Fixes: 21b5d5a4a311 ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC")
Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
The replacement offsets are inferred from the register layout and the
IPQ9574 driver;

Sricharan, could you please confirm both offsets, particularly 0x1a030
for GCC_TME_SEC_BUS_BCR?
---
 drivers/clk/qcom/gcc-ipq5424.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 3ddd4b3aedea..32243e110b27 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -2949,7 +2949,7 @@ static const struct qcom_reset_map gcc_ipq5424_resets[] = {
 	[GCC_QUPV3_SPI0_BCR] = { 0x04000, 0 },
 	[GCC_QUPV3_SPI1_BCR] = { 0x05000, 0 },
 	[GCC_IMEM_BCR] = { 0x0e000, 0 },
-	[GCC_TME_BCR] = { 0x100000, 0 },
+	[GCC_TME_BCR] = { 0x10000, 0 },
 	[GCC_DDRSS_BCR] = { 0x11000, 0 },
 	[GCC_PRNG_BCR] = { 0x13020, 0 },
 	[GCC_BOOT_ROM_BCR] = { 0x13028, 0 },
@@ -2960,7 +2960,7 @@ static const struct qcom_reset_map gcc_ipq5424_resets[] = {
 	[GCC_UNIPHY2_BCR] = { 0x17064, 0 },
 	[GCC_WCSS_BCR] = { 0x18004, 0 },
 	[GCC_SEC_CTRL_BCR] = { 0x1a000, 0 },
-	[GCC_TME_SEC_BUS_BCR] = { 0xa1030, 0 },
+	[GCC_TME_SEC_BUS_BCR] = { 0x1a030, 0 },
 	[GCC_ADSS_BCR] = { 0x1c000, 0 },
 	[GCC_LPASS_BCR] = { 0x27000, 0 },
 	[GCC_PCIE0_BCR] = { 0x28000, 0 },

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-clk-qcom-gcc-ipq5424-fix-tme-bcrs-offsets-ed5288607211

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

