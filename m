Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADAC146D5A
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912767; cv=none; b=s6jKC/nip3p9eLBeniI44EhI8CbB+qB4gyrt/2vXj5FghlBtsKRhm+22Y+/aOWU2kLAZOv5JHaYl/8Or/eAS1ea8moisH39X55yUseiHwwXcLyLQNRifM0L0NXBx/AOrVFUxLD2mGbJiMWXgttqjD2uND0BJoII/Cu9RDCamp/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912767; c=relaxed/simple;
	bh=OvXsXZhyh0/V75JFh9+1ibNWyaPWqSxRuFIu0OMPcCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pU3GAfHqb5TnCZ0Pkz8/LUJkz5ovAhpx5UNv41RP5Wf+iwiLV08Iyyy91To200FP3DSbWj7KoMD7jklCvyRGEkZ1qdOUqz5oVM3GYqKAVwBDNB7RlF+OLWdGsTjhIqSkXGbKi5g83RJy7Z+AI5CWngtQhg+5JYLmbBgj2PQ+2QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QGV94iwo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtV3qmjC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QGV94iwo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GtV3qmjC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBnj103444336
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FT9+9SmHl3R1pvP+/NDecvgfBs1FIr4vjxEaFWXcIJE=; b=QGV94iwo+m0cN4bL
	q/uqxjesHP7fpkwH2mGB5hdU2oDYA47rl1mGDx5MT9wfDbOjNBbbWOwTOC8BCRIC
	Jq1EurStiCGYFwEn/DSlWmA4SlOEvz4CSWhx5kG11MSJESyOgJ/0ctYmlo76rZAq
	KMJhdM/XBruw/Qh3K7MBfqlBsBXpkgBPL9/A3KazuffsEj+B5xcokT2NbD5GmQZ3
	enHAowOZ/CCeC3rfoYm3kzHfiRjxRnq1lt3ciAnekEhkl7+DnazQ+LvASWRHwt8E
	Xs65cHL9imKY+7XvFTBT/nr0jSePuMwSw4wjsT14prN1Ue5XqsSe7C2kxP/itiyH
	o5KUww==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsg3f3e9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:59:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53094ff7090so73634041cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789912763; x=1790517563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FT9+9SmHl3R1pvP+/NDecvgfBs1FIr4vjxEaFWXcIJE=;
        b=GtV3qmjCfJrz+CRjimzOqAeAgXxaG4CC2cfaMJLb/YEmfnvE5CH3q/WS2b36a698ZU
         MByWmgCCv1Phn+l6oLKtyyYGFCfS+AKFt8uvcvTLCjcZihBbNVLRfskfZQ3IAzQW0MYL
         tvjx4vHyqHIj2m5UxIPbT+2BLwMVJIKrQfUirHeU6ZoLMwKwFyfHZ7DY7Dt49XIimvcX
         SYLItqFX/00z57NNxi4dF/dCwW4RkiNd7knLJ7kZZqbZBriRKDAdoeVUFk0VjnRja53M
         YtzMalMf/niSu+aArTOVrGGb7tVOMcEOPvX2iQK3Ea9r/1IvkbJA5jXbz8Z3Hqs2tDwA
         1a2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789912763; x=1790517563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FT9+9SmHl3R1pvP+/NDecvgfBs1FIr4vjxEaFWXcIJE=;
        b=xtnO2DcmExJ/JS97MDeT4faFqEDwvny8mzf4qkWs3y8XuZlNKGA1LxMUmomx3R3pSF
         sUPGeliCXWJc8e8y6z4CW4n5CIXvuKWTHu6ED7Zl840+tqqywJTCRKCSjCCPRjt7EmnP
         QV4d6j5bTV6q3om8vHWzjBmJDjiFLaGpG/Z9Sk7iMQooyraRKAzhJqZTTIhwS5blUpRq
         ObyBets6Cm1l8yRSDfx40dSGM+66w9REoCI9CTwC4ZUcnFOCqPbcGTyT1Rszlg+2yBkq
         j0aet7j1dqXzr+gBXqBQcfxJNHlso7fLW7ZLU94CG1c/AzdWWsROzHuFLd2hmfL8+J4S
         tuiw==
X-Forwarded-Encrypted: i=1; AKwUvBx0PTmBLATQGi/1WoFRA9c+qSKjTltGzOm6a0W+MSN96sCOCTaRIL7TH9pQwbhgFFtpgUgg93oFk1Gv4uU=@vger.kernel.org
X-Gm-Message-State: AFuF++lzsNznfduBj8yxpNaJCQBlRVa+QceOMO0i+Wlwf6XoycJ34hyY
	ZdeT/eauC/cj+w3TejlVLtQuuQpAhDr/3yqqbDN9aVeFpFy6h1J3x1bkL2YH1/q11/rNfrsytzp
	x5TX26gqY32W2fIWHcZmZgvvsAxxgK6luCjhczRgOAWw3mOPoO2oX6mvuJjMRFNM65vE=
X-Gm-Gg: AYBFou096xjN8WgH6RiTRNykUJeEHnJx044xmG6gdz3qxSyqONjwLd0RpeCDpeq2yPi
	XqDzmZ7j9Hm9lqMY7N62KKITK/TeYKk+j86BKwAFoRxZFQ+0kLFvvngb3NNPWeF2XXF/ZzeNpUA
	fa5MVCq30zQ5H5h7/IPuljUxkie0ToiVRVxgIut362/Yj1mFCJAbKK1+ANa9uFQzqZPe8DigVR0
	IGBFQmQdq3c6qOnvNTPmcXwNa8s7FC+k+sCzUUs/ncZ3hc+w+xDmHLZW7P5IJ1xX3WhL0KG6lMf
	UEwBsCqccfcTwONplORjGksINnEWq5shKgISNhRfsIckQlZp6KP8p/b8IQlpwBv3g9HTPxiSG9E
	/e4hk/F90DgXRTFWVsWMz3vQKdeTMoPd0Tw6yIbRVV1lHcrypSM48FnmAK7q9wiTQ7skttM3ANr
	DzN9k1L+TOXnRZ
X-Received: by 2002:a05:622a:1e19:b0:530:e2cd:3826 with SMTP id d75a77b69052e-532b73a6116mr58891521cf.62.1789912763686;
        Sun, 20 Sep 2026 06:59:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1e19:b0:530:e2cd:3826 with SMTP id d75a77b69052e-532b73a6116mr58891231cf.62.1789912763288;
        Sun, 20 Sep 2026 06:59:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a607678223sm13620541fa.39.2026.09.20.06.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:59:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 16:59:14 +0300
Subject: [PATCH v3 2/3] phy: qcom-qusb2: correst PHY description for
 IPQ6018
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-fix-qusb2-v3-2-c273e75c9fb7@oss.qualcomm.com>
References: <20260920-fix-qusb2-v3-0-c273e75c9fb7@oss.qualcomm.com>
In-Reply-To: <20260920-fix-qusb2-v3-0-c273e75c9fb7@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1930;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OvXsXZhyh0/V75JFh9+1ibNWyaPWqSxRuFIu0OMPcCA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr+aySroGXCWsSjrOInlYIIc6Gv1IlHZGBWy4a
 qBy/cnYjWmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/msgAKCRCLPIo+Aiko
 1a19B/9Io+G3tt274CadXBHOXyHdfeVCXgmou32sL+P4eQ593Z9ggaA4RiL4qYli5SORXPibv7j
 LF5TEJuU2LdSZCcgkK7cw7jqZy9ZSd94Sn6EGB52bMhRctfQYvpjsTWCHJO3LOX0tuqseXxOHuK
 8PtxbT8e9Dvtr0XsHnS+kKcRIvEz686KkNNw0iip9w4dAgE+22vad3IRMRiWWceorE0gSyBUxBH
 zLqQkuAoDosXXsVZNyZYMczXS6s3W4217zTs2OilMkadQLGnCZDNaLpjnV911enKpHE4t7dQjBz
 Gqt1UyHrQ1MVhH2CbhwPBpUgUBJ//Ih61UtHun6Dz6f6s8w9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIwNCBTYWx0ZWRfX+sLOfYCnZI7J
 L/0rRlnEAziY7W/DM6QLcBE0+a7nWbler04oHuqx91whf70MyyzQ3WLv3OX0nrUb5mj4g3WusU2
 lk2kSNkRgGRDStLa27b1URpIoNsJp9o=
X-Proofpoint-ORIG-GUID: K_H24k07JLuH5bYHA9-N9rhwp09zC1vZ
X-Proofpoint-GUID: K_H24k07JLuH5bYHA9-N9rhwp09zC1vZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIwNCBTYWx0ZWRfX5jPh6vctwa/p
 MZYSL9ADh+a8lpYp561SK5gNlf1QUIFSGP7qy2RGTFMZhswyNmBtr+m5Ni7D78vEYORyJ9UcYVT
 /jsV99E9GV+QNLAPX9a1AkB4AKM0ZMv32AGbwupoJ+FF9ZEw+KDFBsj+8oBFmRNA2s2lk0HHrmG
 /kw8TwUUp2dvciIGttucyrhMBrMAzCyY5u/ZDt7xDR4/oqPsETYxczROHjmqY6T6neTaw0IqRly
 geKiqvCRg7q/cMuz9FJxpygXSsNwgvPmK/ivM2OCE06wCrg+chKGjClB+EK7pKxsKxnDse/K3Bu
 q0TBU10oyeFm0hYD725Cg2Lb/Vbu/z0IukjqOtudhVzHptGkxbrqtmBg9ZKz+ws9avAw56Tv3as
 HTkhHUgwMXU9XngIwn9t3VzqGJwwTZk5sMLzS8oKQl9ciCqxKVydNp9doL00ZKX+SOxf95kd7HC
 3IWfF6x5tBCe3fw0QzA==
X-Authority-Analysis: v=2.4 cv=N6S8hG9B c=1 sm=1 tr=0 ts=6aafe6bc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=rLpG3bFX5iBGt7CpEVUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200204

Qualcomm IPQ6018 doesn't need to reach power collapse or retention of
the USB voltage rails, so autoresume is not used on that platform.
Instead of programming a fake register bit (BIT(0) of TEST1, while the
QUSB2 platforms on that platform should use BIT(3) of TEST_CTRL),
explicitly disable autoresume programming on these devices via the flag
in the platform data.

Fixes: 2cfbe6765b7a ("phy: qcom-qusb2: add QUSB2 support for IPQ6018")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index fc516b7cf5fa..a1de05a83128 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -294,6 +294,7 @@ struct qusb2_phy_cfg {
 	unsigned int mask_core_ready;
 	unsigned int disable_ctrl;
 	unsigned int autoresume_en;
+	bool autoresume_disable;
 
 	/* true if PHY has PLL_TEST register to select clk_scheme */
 	bool has_pll_test;
@@ -341,6 +342,7 @@ static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
 	.disable_ctrl   = POWER_DOWN,
 	.mask_core_ready = PLL_LOCKED,
 	/* autoresume not used */
+	.autoresume_disable = true,
 	.autoresume_en   = BIT(0),
 };
 
@@ -687,7 +689,7 @@ static int __maybe_unused qusb2_phy_runtime_suspend(struct device *dev)
 	}
 
 	/* enable phy auto-resume only if device is connected on bus */
-	if (qphy->mode != PHY_MODE_INVALID) {
+	if (qphy->mode != PHY_MODE_INVALID && !cfg->autoresume_disable) {
 		qusb2_setbits(qphy->base, cfg->regs[QUSB2PHY_PORT_TEST1],
 			      cfg->autoresume_en);
 		/* Autoresume bit has to be toggled in order to enable it */

-- 
2.47.3

