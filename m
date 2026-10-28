Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200883;
	b=gRuch6cA7mZOaeypKL26HKTSDH8EI2dIKX+Xmg1g0WqJSU2TvOcHuHU5tju9FPMW80oB
	 CfFDqxzuDa0P3WjMYqHUHEd5NKqlj8AGbq2yi7sq3wU6ZLjxy5EW3haJK3JOA9S8MpbJn
	 wt+3spCYMid7UlxmyyS28yfk7BnmHeJozZIQdwwYWmimNa/AXSBgNsB1pO6RxVyCDm465
	 nzrEHqpHYnD7IQ+RnfhP0HPUDQ3tQyMghSjPyXdJ03sWn70CwSqtov9afTJuJJQIK0a1M
	 obbR+8C9uWE6HAd6DG9T4CFxJzHbJInVlnn25vatU+/WrKCV8hDLyt6LpZS6Fq+zEaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HAoVo5RcQ/NoFGjRJUTPgIdHUenOlnc1PdK0zXPqYhg=;
	b=vAyz1pibnaAAIcm+BRtNGA6ZH6ir411oTA2OV9bnxu7vZvD8us0b7syxEp05P44IJlvl
	 H517SuJ6DN8PKewZMq2iC2yHYGtJfV9oBlNn/cWWAFgjXpdy8GXVWKcN4ldPUZJCTYXOu
	 WzRTbcPpnn8JfD3U+UinPbG0l6PaSZ7Goqrn8IDUrN5CGddHMYlwU07zcOeVwiwBzhxtg
	 FYNHd4jtK1F1HAhPUjZUPR0o7jNvevnnPFNV8FK02r0ZMUV0I85P3xWqB+xo2PV0jqExX
	 /MBRHORWUgAoduvrzy1ZcGeC9TYPn9ZeknYG/zDij92h9/ikVu8egnTptiyVuI6ojvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZzseuKE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQ6aHHgv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99A860A260A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E99A860A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZzseuKE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQ6aHHgv
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFBO492071528
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAoVo5RcQ/NoFGjRJUTPgIdHUenOlnc1PdK0zXPqYhg=; b=nZzseuKEmdajGeTK
	g56F9YULRkwTioXg3c2PI00JMwS/wiMdnkstMV9EQ15zDq7euDY8hncpZOEKNCbH
	EgM0th+McGsiTQbjUeuY4NZmBE9wbM4Djv85Zy9YwxtFvyNxrG7y9r58Ln98jBov
	x+nqTH26SMk8uTUaE157DWTUGFFUyJQg0mgr2b3/IewYwJyGZ80t8S+gp9jW4KA8
	q2RQYqpPglc71/MryyfYUK9oSkxX2zTpkcdluGXKrz4TYxZaLzQWLbRhxYKSeAyl
	4eSaAQumcfORrfLIikFwmLgK0vjpe4KoDBLoypLY54kguOR5IpmgUWCa8dwObk4Q
	C+2m6w==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jv9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:21 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-679a3664e1fso1808223d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200881; x=1793805681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAoVo5RcQ/NoFGjRJUTPgIdHUenOlnc1PdK0zXPqYhg=;
        b=FQ6aHHgvEsXFs7aiwgUBzf0I1LI7KSINilslqWW+NGFmP5lly6y80giHMkGwntT83G
         5LG8cT78CArOALLo9bHandtNKzQFK0CH9mLRhDuecR+/E4fCBWiDanw5OQkH9D8NRKPz
         hr13Yef1nyit/jWoLc9HIOOb7s22FikIYhd50Qlv89NBxp+/QQRLHUJ/GeRJPTeOQXsL
         uCH0Q+rEX7saikB73Sp5QdMeP3KV1rOuUF9XPbts7Br+szcAzKmLdl/NmcFJrOWuCODF
         v5tMoLnbioQzoNAJUeZeu7VX91iJJ5hMASUD/Q/nhfaN1x5bFLrUgJhw28NXTCRvmudW
         o8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200881; x=1793805681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAoVo5RcQ/NoFGjRJUTPgIdHUenOlnc1PdK0zXPqYhg=;
        b=EB4XNj4q4BT4Xpwsd0jAAk/yCKMFA/JM3H5kDO6kRULrEkcdHKVi9VlewMKQE/0A3T
         f/e6EXf1I3Hs4FepbxaCMLM4gloXJ4yRpboM/j9rynIu6sQVCcXEc1BtE2lbtaxAvh4C
         mkUZ9B31vepD/G93OV7B7I3DvHmXhltJEqtGS8gfPCYeweHOrg3WjFAEG5wc8tIMEOCb
         nymkVtRuK6QBuo8G1UUYxDYJuIhh+2RqEKBQRe+EPW1qs238Mw0DmorfwEHLgEuT+7pr
         Zo79z/N/7RQZjFhMCY/v/GaAkz3Th0nlSZ4nDIQwIt6X9y/8pJqTaal3sjc+iG/da2MJ
         fs4Q==
X-Forwarded-Encrypted: i=1; AKwUvBx4J5Q8DGZ8ZOoZZ1CNROQUoujt9kSSrx3wjuK3K+eB4rfoOPUPlNeftne3NB3/+DIN/KJe93agR+dcNdY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzOYOKzMpLW2gCTkNxy0a0FndmtlgBrroxrKNw5PYvIwCFxOar
	+vaAIanzSNe79dN2X+hbuYbNwbeXIrwr0O63XiAKNTZtWezZ9FAaexQp5V45huT9lwo3OB0Ydcj
	6jX/+rwsdwXzcWC46Q35ZiR4kBxOhrSCknubzi7CcoOp1Cf388Sz+hMIlupVibhe2Xw0=
X-Gm-Gg: AYBFou0ds/nV056blB+yJS8JS9aG3TUvNfTzfI5i30z1AWGbMm61zrmSYkhDNS/ocJu
	LKOmOwCbpWxn1Y99X0FiGaq7kkA46NYAn6hqTZk5qlpSX3+84+iSlc/xyB2jd60q/kiyo8rSVgi
	HCshm3yk/aZ5+Zd9nR4X5eWJkwWdNc9BwiweokNVgO57CaxWvA/DAOxukHxExprRvMM1O3ivWY9
	2sdykBW/LYOqKd4ly978AVGnQ8Gj049f9ba20XbuYhRqh6Q0mT9T9czruITRRCCDw3xrEL2k0cf
	11S7VvSDwalvfK318rv5RHV3fX8DFyTt5ivMjnBQ5HKhF1WHotfUobR92qfu6c6o+WxqiCIZWWd
	BFQ/jMmyOlHoFQVyNMqTmzEZGMKMWl7Ki5bv4wcfLgSziEUu4vrIttdvJm+3xsaTczdr21TfqI5
	LO3IdUncy0GBRj+LTis7okCS4RY7luxl/O2ohkhnPf/Y37Ih37KXjLP0tH6MWn
X-Received: by 2002:a05:690e:438c:b0:677:d31f:5a6b with SMTP id 956f58d0204a3-67a7bc157f5mr1294941d50.16.1793200881011;
        Wed, 28 Oct 2026 08:21:21 -0700 (PDT)
X-Received: by 2002:a05:690e:438c:b0:677:d31f:5a6b with SMTP id 956f58d0204a3-67a7bc157f5mr1294931d50.16.1793200880381;
        Wed, 28 Oct 2026 08:21:20 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:19 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:42 -0700
Subject: [PATCH v23 08/15] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-kaanapali-camss-v23-8-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX0LwJ0NisvitO
 snEisBmj8CTFZTmiPSyFF68j6b5aNYvN3h7SBKU/Vd702M26kSPZvlsr4UElwoUOK3DjNKPaDXV
 DNQ7GJdXIhHFtQ8KMBYBh8gVBWUCdfY=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae212f1 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JczS9Y7s0yypmJa40voA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qeuWbAsAjzSaTnISmNgGMO2wQRgra2S4
X-Proofpoint-ORIG-GUID: qeuWbAsAjzSaTnISmNgGMO2wQRgra2S4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX6kdJWnBr2V/q
 IcWD56G/XbSR9lhR9ufq9/ug9nHOJpuW9N/Qf2luA2+79UvOK+5A4eLUhb7D7GO8kSXlI/0HNpa
 wQg2vR3COrT5ZDsOmJLEWjHS2vuFs3aw4HU59k0uzb8IljzkaqynYljcM+YrWOfre0M7pWXB8Lk
 ukMZGV4oLqNXqcQb19LAl6Yqk4Nzc7CFSpkPjHucxv6gQFAdN+INMQEjOXY6TSkbNMDoXcsWuW8
 YQ6AR1gutlDYHY7onIeXMTcSqGM3QTNOWBK7CV0etir+Z6eSQMsdDBoBdFGYxZKe+PNoDe0C13b
 p4ohhIpaqBO5hCFhpgSN3RaP1fwo8eFdeyT61BEum9YGNCqiwlMRJUlBmM/JFvDYekVO0inasBL
 p2bMCuOwitemm8a3f96rmKxIjIoR8jy8JTz8AiiF9F9JdAA5jxTbIZYqqpByEWkk7MsiRfd5UOl
 NV6iDNGDM2cKHzQazxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks and supplies but selects
the v2.4.0 common status offset, adds Kaanapali power domain and register
the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index a64242c66cf0..b0b63dd3d958 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,51 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.csiphy = {
+			.id = 1,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY2 */
+	{
+		.csiphy = {
+			.id = 2,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY3 */
+	{
+		.csiphy = {
+			.id = 3,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY5 */
+	{
+		.csiphy = {
+			.id = 5,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5607,8 +5652,10 @@ static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
 	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1

