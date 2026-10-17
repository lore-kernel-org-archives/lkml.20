Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDCE394797
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792209149; cv=none; b=t1evV/twbC7cnZhJs3bgiHD3r8zC+z3azY1KDHjgJj+rocYOv53p8wgQRfPO7iFiPVxLlQOsvh8HXiOlHbmp6ki7Ats9A7FdnWW3iwH1DGOPGtEwH4R/nixl0vmm8UN2mJk0G+E1FF4LkSEAxU94W4lW2Bcqrho9E8bALOqfQqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792209149; c=relaxed/simple;
	bh=zRm2u4LEYc0gtNFHizlm4NMKGlWn+oPcvAHoerFBkWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dQasj0ZSycR7hye9IjT+WWl2YOUCXQVqV+OdM8w5XyH65XKp5TuM7yTnNWn3Lr0ucNiMl7KesbSX3b1nWvnNWIb1ZvPQtmM/PgLyPD4wat+gUjMBUSyzelsSGWyMIATAWc4jg1SEnK8Kd/39SPrnJZ9ec00LCxrnJ4AEljAILU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRse4Mls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iS4qyRKA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRse4Mls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iS4qyRKA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30chH3242672
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VLDH4uYDOB5
	s4rSB29wrt2IQL64k9o38d4UrD+kGPGQ=; b=TRse4MlsgtHfh3tdYuNlJttb2PO
	eAO8rgj+9+84/UPRIQ5jOo+U7IAVkeo/d7/ZPs/Uic1ZGG4fJXxSJTyzzoAyiSPT
	O3PBx1AKQ1oLz0Cc20PnNNii7prwDQhi75pVRrlSK3qn9rKk6BW60L1ETtPi7LdU
	cRo7f8CMVKRFnKXsLlV5/zUcKz/QTZpCqa/p+UcfsH7LEur8ue1hw0v16NAzVAzA
	S0r3T1BohEoQ7j9QFt0YdFxYLy2RwD3oFEupsUDwbUgNOlCRbMNFL1fzVSbSIoMD
	h6NLnW3rR6dZG0EaLVLbvB3SIx6v5o7UJ0dQ2Hn0wZyT0jbiAzkMjvSp04w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v30nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:52:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso931480eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792209146; x=1792813946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLDH4uYDOB5s4rSB29wrt2IQL64k9o38d4UrD+kGPGQ=;
        b=iS4qyRKAiFg0KbsE7rePVui5qbfWrR++GpmsPUI6ipNuhxkr3gl1glJ4FpwDrZ+9eY
         gH0ie49J/yCHLhWtiIJoMuf1YwYiTpOKj4GqnUzkuj8w69GiRkpYbcPEzTLqEBNypCcD
         PUUrLhKCiKhd3hvqw/kOtgMJ8MOcMEa0iUMEBVTN17S0fswP1odSC2Jmxzy3m+hzFtjZ
         w/vSQiKTj0yB75XyO3i3AgpMRkvDtwRHBoUu5TbJzasE8FJbRH6hY6JmPP2NFzgqggxo
         jaP8sugqmnGVB9aHKVNpr9+tSu2tf90BbcmLkOPAE8l4wF8rl1r7/b2NC3AWHxv9iACb
         tYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792209146; x=1792813946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VLDH4uYDOB5s4rSB29wrt2IQL64k9o38d4UrD+kGPGQ=;
        b=J+EZruH1M9zrvRqLJxv1qcJIYAqcE7Kf9tYTqcah8WQCV8jKHz6XkaVVkDLcqtEJCz
         xGWBh+VDwec5gW/sx19UiENRpoK5TsZrFphzAJRzDPyl2KkNez7tT+DcsY1b7zt0btBP
         PwIYnJXV+FRQbFqlQx7TNbdc+eEbgKn2JhhRT/njkHP5OHaZB63bMTVMZIpn278viQLI
         G0oMJWufp8a5bCXSAQg35TnhNitv3jrAlW5t5X1tAq9hyIqoCt24g0Pdlvft6SprqV2d
         hvv9ieWY7VpxkO84gwCnJMU8iPnsQUyX8Uoi9LjyKlrwRW/htVpYjyGA5zr6salWsqri
         RjSA==
X-Forwarded-Encrypted: i=1; AKwUvBwIyrbxWdQpSOV0Qo2iXq7tnMw+XimTJ15+sN+0Hbrg4xSfqZS2f/r1iOLlmQ6ycU72e18WdUrVe7w6wCw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIexM+gAj/PT1a8iIrZpbhWPBsS/oK7jHd6kKyHwr8gZPy4wKZ7
	NtItNFDUjj93Ni1zDGPWfk1EIGKummcMTYkHJIqKtza7MK0bxgzfJRW2PAsgCxodnWtp2iG12Dz
	6Ds52/B2SxAL5n9qGe4G9wx+s+3ixTsl0+xfb9qn7yPT0uO0IUEKCd9MdBsgRtjN/0L8=
X-Gm-Gg: AYBFou3OdnYyjdBd43SUoneaWBfckF+TNrxz9g4muM3rinzNj5CgV/6recSd9+wTk+r
	jeAuI5XFypo5Ujx6rez4DTE8XJfRWztw3J8MQHQTTpFlHN7GRuvdr+T2wKJjT/w2DGJWcCrzi9M
	EqmU2sYCyH9s9XJUxtWGFjn0ktMlPkaBcvCzvnv26yplQWjpZjTIMHYmUGGoOJSZM/VwEsnWChG
	pvIkOGrZcrtSNLjLFnv2L/knYtWPMJKOAc5m8SvlmyS8CYrVgIXENegWqSIx/LPILKHRpefKJXT
	s8UKOXmd35OzmXfzpqCq6JZQ8wocQd4+6a9ya9WYozocvht2JoNmoG9Qdt/5c3mD1MgMoU4qNqB
	nQvlqJb+ZtwE14eShxSvFL32AvyGp2joxddKn0VVbi2zr5rVpldGu5A==
X-Received: by 2002:a05:701a:c951:b0:156:3684:96db with SMTP id a92af1059eb24-18515e402d1mr2584973c88.45.1792209145801;
        Fri, 16 Oct 2026 20:52:25 -0700 (PDT)
X-Received: by 2002:a05:701a:c951:b0:156:3684:96db with SMTP id a92af1059eb24-18515e402d1mr2584907c88.45.1792209145028;
        Fri, 16 Oct 2026 20:52:25 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75ac0fsm9723006c88.15.2026.10.16.20.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:52:24 -0700 (PDT)
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
Subject: [PATCH 1/2] media: qcom: camss: csiphy: record PHY type from device-tree bus-type
Date: Fri, 16 Oct 2026 20:52:20 -0700
Message-Id: <20261017035221.3816464-2-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qqruSkl2SXLwPqQ2PZq1DIvyM2B8j5rV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNSBTYWx0ZWRfX+Fu2zpODPbD3
 W9E2pE18zM0VQwiGnIdQE85bRNgmjNP5lBhWtLhuBBdvS1ufjNvHvHC3r78tH2Fg7eb1KG6/3BB
 8uVJSA9oFkKkiXCrXQSbY1K8Z2TRjPg=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad2f0fa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=CkjXbxflZYdHZoY9ubYA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNSBTYWx0ZWRfX1F+j3Fa1tpo1
 urxH20Ch3xDr8AOqjZnPHaDkTfwI/Ueb8KU5kihNM5wWezF59eIH3CsDgZ3u17SFgxsUGAAk/mr
 hXB2/H7bZ8EluBrJc9BZ97H4eeLfXUmzk6oWJxdqZtVNXKRXQKgsipWh536ncjTSkRcUGyFQTza
 5w2ADzZMP5qaZ8Leuek9NhGnNr8qN4uB10Hxf1Ru33OgZRD5iV0yWk6uhbnszDjg4URkAcm63ME
 SC3SqRXY+REk+WI/9Q9HnCzB/2xDsjoTaI9sIXgo+BTRhE/XuGqm6Rsb9/Mln22rbMTno9AcmHd
 BITXF5+4KCZHR0dpOH7BAIeIkIx+lWFfnsPdX0Rd2zXWcWFTlU/zhps56EXdQnrvF5BF/9I2ixY
 1DBEnE5NNrSzCGTSLXQw1uVls610wFSszfbunZR5ZKBcAuFtMOdXXjE+IL04ihbPXlxukn4TF6E
 eU2CDd48/et6eAIwJqw==
X-Proofpoint-ORIG-GUID: qqruSkl2SXLwPqQ2PZq1DIvyM2B8j5rV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170015

The CSIPHY lane configuration only tracked D-PHY, and
camss_parse_endpoint_node() rejected any endpoint whose bus-type was
not V4L2_MBUS_CSI2_DPHY. To support C-PHY sensors, record the PHY type
(D-PHY or C-PHY) parsed from the device-tree endpoint bus-type into
struct csiphy_lanes_cfg, and accept C-PHY endpoints.

This is consumed by subsequent patches that adjust the link-frequency
calculation and PHY configuration for C-PHY operation. No functional
change for D-PHY: phy_cfg is set to V4L2_MBUS_CSI2_DPHY and existing
behaviour is retained.

Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.h | 2 ++
 drivers/media/platform/qcom/camss/camss.c        | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 8c3319f2ca1c..fff504d2d489 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -35,11 +35,13 @@ struct csiphy_lane {
  * @num_data: number of data lanes
  * @data:     data lanes configuration
  * @clk:      clock lane configuration (only for D-PHY)
+ * @phy_cfg:  PHY type in use (D-PHY or C-PHY)
  */
 struct csiphy_lanes_cfg {
 	int num_data;
 	struct csiphy_lane *data;
 	struct csiphy_lane clk;
+	enum v4l2_mbus_type phy_cfg;
 };
 
 struct csiphy_csi2_cfg {
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 07f7bed9591d..c888e78256b3 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4756,10 +4756,12 @@ static int camss_parse_endpoint_node(struct device *dev,
 		return ret;
 
 	/*
-	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
-	 * D-PHY is supported in the driver.
+	 * Most SoCs support both D-PHY and C-PHY standards. Record the PHY type
+	 * in use so that later stages (link-frequency calculation and PHY
+	 * configuration) can account for the encoding differences between them.
 	 */
-	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
+	    vep.bus_type != V4L2_MBUS_CSI2_CPHY) {
 		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
 		return -EINVAL;
 	}
@@ -4767,6 +4769,7 @@ static int camss_parse_endpoint_node(struct device *dev,
 	csd->interface.csiphy_id = vep.base.port;
 
 	mipi_csi2 = &vep.bus.mipi_csi2;
+	lncfg->phy_cfg = vep.bus_type;
 	lncfg->clk.pos = mipi_csi2->clock_lane;
 	lncfg->clk.pol = mipi_csi2->lane_polarities[0];
 	lncfg->num_data = mipi_csi2->num_data_lanes;
-- 
2.34.1

