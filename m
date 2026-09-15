Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E104B47DFAF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467021; cv=none; b=NpV4QRen6FQFTOau8Yf0I8H2Eu8EMiaxyTLKcDXdejWolw/4CynmE2SZAO2RVn2+6UjGMQagIL98AVDnvO9HKtcDtEv0Srlxn/dZPI7PybnRyR3+lx7qD5uMTCgAJyuEKWwkKEefF93ckP5Lg2u7o/VWlUgVYfpcfGXk3m4deXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467021; c=relaxed/simple;
	bh=++1vDawQ37rKX8PMAVjbJ49fyjiqQioaaUsKsuUebv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lGO8f1Z1lt5WyyUW8VJYJl0Gq0269pujYQY4OnUTutzt/SWYC3VF6420CAFtrr5R9hJOu7vlhrFdfTXRTxYZHdPpH2b/TQV9TBImAkqfs6lhJ6EHuX7hK0E44qI3YzIUECRDDC/51ZYC9QyUDAO+LJ5CQBcPhL+RuX4pppOVkX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ey/6/I1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRDtriH3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ey/6/I1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TRDtriH3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h33H3415742
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5GiwkvjajNGX92lSUpJTym7q9yh7Ym/IU4uxosaT5X8=; b=ey/6/I1KJRr5nRH3
	ofcBcPjAExJKN0w/KvHeUddOUXf9Fo8AX2kxuk3pdKsSW6dmPbX5NfvnaMuUuynh
	HUca1gmIVGrCO15PLYwnmtAB+92qYjyyApja3Rju/+d61xwocYiubwAo7fJEHqVk
	Yyd1RQWDqhFvS8Kzh8aH6HXrVGjIFbx8GxQAD+h/9YeHueSCwMkfcUSGCvtNuDU7
	zewbei+3Mrc4dAKX/48/RAp2yXHi3Z1gL1DEfKUDPWNDYyR/lyVEbhTUWpqEFiO8
	8Wi+S/YI+Qj0Bh97f6SmIms/K8e0LOHPXZjbwG660IDyHWkKJmEGMu+Fo0UGZjky
	w1r6ig==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc05tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:10:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso9512878a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789467017; x=1790071817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5GiwkvjajNGX92lSUpJTym7q9yh7Ym/IU4uxosaT5X8=;
        b=TRDtriH3UFk6dog9ukZr3mDGcZ/jDYxRn5ZJsIbBFC42jcfowktUg+qX2i8fLpQtr1
         1H/+IikkTw38SOcZvmiP20fnseh7AZa4LlHsah448as5RQ1vhOCFD6I6HkCPGwNp9myO
         OXdsQtp/28vfuBLRQvkqy1DEi0njs/WfHGD6OMkiFwzneNGUlxVFgfbiO5zsIAvpV743
         m1j+p1+QvsH6BdHyO5LTOIN8PyNUDccjjaNApEMS6NlDsxNo0S1mR1CVx5SXpGzHi7bz
         gWZQ3Jjypdm2eLRUKn26XMm1h/3A1iL3eMbwfK3VWwsdQJaxQ+hCmawxKQv8Y+p3V2rY
         Rwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467017; x=1790071817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5GiwkvjajNGX92lSUpJTym7q9yh7Ym/IU4uxosaT5X8=;
        b=0crobeQXhaHhTZ4Bjuqqj/9laglZHPqdBcCJDxVTYtHeE3cSYuqr+fMYga6jxYotlf
         1Ze9Fg9MEQDxTRKDyBo/ycL8FO+s5W57sdOK83tvOIwXcif5E7v2BsVgy1jADezXFIQW
         HOyA2yR9/j++x5mMuiOJdYlfb4p+8vkTyBp7bq+IoKeU/qUxNEmVT/rtU+aTL4omvozE
         yYqHDg6FmRuSaJtxFRFOe3ZijX4BS/AU1hYTHBmkI8ut2HSkyw0BplqPHweji4Rme7xC
         4lh9u7CQaW1aLWSGLpmqBz2nSg/WO7/6G1n5ZFko9OD3qhj0QPSJfHV7dp+veZyWexX8
         7Qvw==
X-Forwarded-Encrypted: i=1; AKwUvByKZhh3rdY0kVUyjwI0rwECzdqLzhNKEqZNi0g/P0MZkxBhJRhToe7igISiFp+YVMG+qFcazgLVTsVTtWM=@vger.kernel.org
X-Gm-Message-State: AFuF++k52KjPouUDgVX2KGG35BGZaUaF7pTTTkgawlKyngwFxJ3Ghr8l
	A5s8TiTlXy+K7Cd/zPXHCwV0l82PjM6T4exXYzpGzQZZ+AAV8+S458U0ubFUe6nrfijMRG3mJtw
	Opi34XjVYOlx9DYN0D2br/HMNfYPVCalcx4p+3RnNYT76xtNumCAbAc9kFDwZMjBZubQ=
X-Gm-Gg: AYBFou3bNePFCvVhjWqeMxCPz6x987/+FLDy0CrQ6CRBe3Apa1qrUUPlhBNYAZl/T++
	RgyGfbkJURiv1JGPxdP9k1nhtyKny5KM+d2L8zPUaGwha/vgDVQadf/53+4BMonvsAe/IKJezmH
	eXGxF1BhHFWV5oK8FT1c+eDr6RYAmcnBOHisNkj8vQ8h5BoLrR7CxYxcx6OXT0fLVfC8TzL1ErS
	5Ok9PtijWfMORNtG0NnVZuYbofWHrGek/FDrWEGVEL1LUayaW9oSZSRNpbuwNjnXAavEVgMjfuS
	QFhMORTFLerQDXIMCPQ3+zzxRn1awRyndOS5nrCHTlai0AQrLB9euqM7NGQkcqSpdyZpzuPH2P/
	LioqmT+YU9IsBNfXz8lh7Zb3l7YkWzdEsR87m51WVHvTMY4XlrXIVBPdmG4/jXjZx/I0Rwsfsjz
	NskoF97AWV1as=
X-Received: by 2002:a05:6a21:400d:b0:3d3:ae50:97c8 with SMTP id adf61e73a8af0-3dd52a1f617mr1026255637.21.1789467017050;
        Tue, 15 Sep 2026 03:10:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:400d:b0:3d3:ae50:97c8 with SMTP id adf61e73a8af0-3dd52a1f617mr1026185637.21.1789467016629;
        Tue, 15 Sep 2026 03:10:16 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm14244091c88.6.2026.09.15.03.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:10:16 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:09:58 -0700
Subject: [PATCH v16 03/11] media: qcom: camss: Add Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-kaanapali-camss-v16-3-c9f3f6f4180c@oss.qualcomm.com>
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 7VZRIwLqTCKDDU9qYEFvXCGTzFe3a4aJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX5znePjBL+iH7
 4vTvCmCjZsOBtEc5Vs8v/2KOAZDbl3/gz8lq2l2LwQyG38Hv2SvYc+TFxgvd4ADGa2s7NSlZmb1
 j4fWbvMZjhwjWkIePxLO+38B4dJADfs=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa91989 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX3z95/sbrsuhr
 YTuMlUtBuTzvv4sShZhCgWgYQzR1kSb4mR+OWNLWB/WQXMIY5L/lat70r9R2KHvCRyofGrjNWXe
 9hTxvYtNaYhwZLVWfPeGqgg3yNpRo85UxbBMsg4e5MT7uj3rmTVSRxnGvQW1LKZabcRUZcgdcX4
 34GQGaa0YZ6vMU4+MsxjZA+YS2K1LK0TWP9qSsEvdP/JfHIYW7Qe+nuTzhy41wdrDG2SD1wBODo
 gK262h182JmL74/mi12bfeR0e581/GvjtugoHdSgq01ybicETAseXz6rV/tnUVw55+PmWgV5FT0
 6OHx4RiRMR1F2xnAkELOMRs4WPJqi8tkyI0ODV2C08W6o4xc7O6D/ScQ0fkww1UvcHpEDuY039d
 Udy+9i3WDz/zNVgMg3hSjqbEHH3C52ncMN5icJm0M9+B0MwtORM++OvTz/VSjsBJNRGEu7+9U0o
 xz2FJx/H7VR1q39/Z1w==
X-Proofpoint-GUID: 7VZRIwLqTCKDDU9qYEFvXCGTzFe3a4aJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150146

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data, the private data just include some basic information
now, later changes will enumerate with CSIPHY, TPG, CSID and VFE
resources.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 07b3cddca584..2c9f02bca809 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5596,6 +5610,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5829,6 +5850,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index ba3d51d9c0bf..fadba57c5efa 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

