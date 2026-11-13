Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558056;
	b=CjQkURUz9IzlnP/8bdgD+zaHzWrCEXgKNyLykIgdR4zV+Z+bf5P5vS9FnUD+k6S8JfxS
	 gHIuxh6OI+AyQpmQ1nnSrX39hc4xSQeJPlLNbHq3JNQfN+MHVM5vVPrKTvS9eaIQV1Zph
	 pYqfVAWnbnGvboHCWIqwIY2EpC9ZrDtI1LADPI3xnQxExLREFX0oO7kRMmSI4lDR/QiU5
	 XzeXIgK+t9nNbdIxTiQoexBnQtBkvgG3KzjCLd05VwbeNmkY6C53y4IKRDgmfBDnXXZCf
	 HD1w6rnu3/ETYe6xNaP61+f+xDnDsym1eC8pD6VmcR7TB5gAI2MtCSFVxhdJdRQP+rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558056;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=x2oIniFBFHs41SoX55kdkqe+uFZMMBm5vVOY9n9k6q4=;
	b=HNkDood4LUSpGnQr4FB7S4p4rqAh9Vx2M6mdCHdW4dwje0yZfPgisBMc1vZG09YuIyGk
	 Ec6iv5fLktdqTwd78HrS0WHx1ZeO5FnKlORVIim/fhsLk8zYY8xUnaeSfPqR+RGkLTsQq
	 JXOJAYtC/sB84pyUZTpObXFOyDlC4laAv9rJQ2NLuosAnTMPzkpowPBGMBu5LYlU/I2Ea
	 UUitH4yOygVOrkz0URTDWBC5dqseapolMeDBfthwWzSh/XPoIgGbi5amWGRyCIyPZZQ2c
	 vWNv+y6dXIgDk3Xm9ZMYDSdf+cNJ0y2sZ2A+o1fZalfpQRCUnCLMnolZNke6NUMrHiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=om3O7H6C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNPD0HqQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93235606A888
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93235606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=om3O7H6C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNPD0HqQ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57CMw3283518
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x2oIniFBFHs41SoX55kdkqe+uFZMMBm5vVOY9n9k6q4=; b=om3O7H6CZuWD76ja
	A1swlwYI/zZhyG7HrqRsDulRYka3cmtQ2ZXVagg2lj83ncBzwXWs+gqV/znqXzg7
	SLJC7r3KKtiksbeGwf+oOxwyxKdBdaHuoFo/5zch+D+bn+Gqo5t/JJuYDP3VuS9X
	QLfpPEiENVFnxhpQ0Q506rJ4qXGMSqLzsYGDX9cO3N2/hsgXHnolt/Zuoy6nJ5o5
	OgLy0lIp58eu4kVm5os76uHwr5WOt8miJ0c1LZaoQV9pgE7W3FNZJmRAstDFFXvz
	NAKpusq0ZK+l+SsD72BI1vaKzteMOR3zWgUA+vuvMhTdwY6TcruGnsTtZDPYon1l
	RDm9+Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37gnrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:20:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so735579eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794558054; x=1795162854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x2oIniFBFHs41SoX55kdkqe+uFZMMBm5vVOY9n9k6q4=;
        b=QNPD0HqQCIEJwiYpHGX1J/6IsA7vGHuxQnLiFo0C4zG9WdU5582ar9cI/rNkDmBoYH
         TILM/OtVXbsuc9GbXp4L+HQWEe+iJtwtuJ3FOxEiB3dcfj2FPMSVRdmWquxcCZ/cQJlU
         lKj4qcXoJ67lxH9rKvpp7ly+hjudYlkxZ0OpC1zvvWiw+XUqYQT7Oy0wY9EB7dB/QAPO
         HfUug1uLS8/BMGV9XhhwwjBtGSTwSeGXhoI1bU2kz0a5hCuzpoGz5x4tEmXWzbdh4z+O
         MG2y4zPtxc7TelCYBvqgyNR3IebFiq3pj4GTaoo9Fldve1FgBu/u+ixmuZ0SzPBdq6pQ
         yVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558054; x=1795162854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x2oIniFBFHs41SoX55kdkqe+uFZMMBm5vVOY9n9k6q4=;
        b=ZapO/pNgvP1G68GvwYBCUMsSVW18yugSifS2p13gAQsrPvxrWkXYaj5gm9mMdQGQ/u
         vEq7XDBZ3xnDuLYl/mqZ+vHvHu/97JQx6l1d7Vlr8ZnsHSgvP1ktAWTXqnwiLqQO//9w
         dWSb8zg1oJGsyCr5K4t8+GmmTgXiYm8VHiHQM/7Ym3MIuxV7ZcW73Chq2uM/oTTuKY7w
         sj/mS7kEjlUrOGIoaOd8PxF2djjiDzsx9aNGiLtUVH9OC8B7GAEjyXTPJXLc5C+tRWDq
         tH96H4yO7a99On0+vY820rINV5IKH4L6Sq9R+7toFoyAz82OGU2D3ziGU0z4AJGvWRTa
         crjA==
X-Forwarded-Encrypted: i=1; AL+hErGyEraPzHmcRkojFg+qiyRx9CQuAvvw696tTj+pul3vyU9Y5G0Pgv3CORpBIVwSNYGhXhRXK0ohU1hui/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aDWt2rgX1cH+URky56cuC3PbQGx60/P81ASNme+8i9hFlR7P7
	vom3z7r1cvfmwtNWofNERpweR6/IyvYDSuSPc14RoVklK17UxSAHjuxNa3jl/CmO5qZJobnSoft
	zYNpS6lEpii8ghvnMQ5XG0C5HxVF3pRPuec7cZ8Fcp6RF9CNHz/KlaK0aPcxzmnTAa24=
X-Gm-Gg: AYBFou0a0nm42isbpdOfHDdvq/eBFFmbC5fqlU/SslWy5mC6ilA7OLlbmXYZ9MJ8k7C
	vp3/dQsESR5pObjNUXxUUnblH/2Hlcr37NqaufXB7cla6/e5zs8Il2tXqTVQtbcgDDJWNDW8NcW
	PDE2tBhFgOaB38HWIFF3mozH0ZYEnA3EdStE31s+Wap3IhqPqsR1Pj5O5wSbAGUlfwBmm1OEEuO
	R2fG6buLgbnDuuco5bF7hzgIjpbeQEjOVByURGQcIQ6AL1KJLOORnpr1uWm4diONw9+bLWLwcSs
	gEkcTj18Of7pjMZzxFXhzw1RTQF6Q6HQP4y3LSG8a9Sz3kTQlvFZQao9irFF9VCux6BPb/cDATx
	nJy5s2J/7LGb+isjauXypbdY0q1/LwBLJ+UYnR+rzKx9dcRxC2HR++iI3u19aIFCuobX2j1IWHy
	HpJVYo
X-Received: by 2002:a05:693c:8859:b0:36f:5746:3369 with SMTP id 5a478bee46e88-37966e3af4emr1580021eec.24.1794558053495;
        Fri, 13 Nov 2026 00:20:53 -0800 (PST)
X-Received: by 2002:a05:693c:8859:b0:36f:5746:3369 with SMTP id 5a478bee46e88-37966e3af4emr1579993eec.24.1794558052802;
        Fri, 13 Nov 2026 00:20:52 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm4971713eec.10.2026.11.13.00.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:20:52 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:50:23 +0530
Subject: [PATCH v2 2/2] media: qcom: camss: Add Glymur-specific resources
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
Message-Id: <20261113-glymur_camss-v2-2-b1b76509c744@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
In-Reply-To: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794558038; l=2976;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=P53e3wtoVGWNZb9wEQutiE3SpB3zP6e/prbEVFlavbI=;
 b=KxDMjhA941/qdhUe40dCajtwLdGOAM1yru18nl5S2BYbjxfYT3is4IaHM9t3drP2bWE+hEa8R
 FkvtSfEGn2QD+9443tTHDqMw9Ik5AIAT0R9TW2SeN/efVHUEXIppLHS
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX05/uCAwmYmaO
 oc4vTEaiIMITe0lkWMbXd1z00+pYo+PmnhmDgf/0wcnsaCYF4ohw59mBlXo/PicqcrKxmP/SEOQ
 xOyBVMmXoCFhYhmjm2jBLoSsQqAnfek=
X-Proofpoint-ORIG-GUID: vFKSaKdyKiUBj1FrCrM2KrcHfPFPOykW
X-Proofpoint-GUID: vFKSaKdyKiUBj1FrCrM2KrcHfPFPOykW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX9wsGSzge5bIo
 dd0IG9TUmIlPzXXTsmq2yhPd4jxfN2XC/WSU5uzvo0NUyd/4rPasVkZeM2brINoeWP5BATMBRFk
 NEoLDVbVHdJt2yfLBZkG7snS7gECK8ctJwnNaHtDnZJyLBdDP6XW8UDlsVJ3qiSPH1SVlcSphcc
 +9V8uk49Y4JpMuGO5eNf2IV0CfxKbCo+Asan3SQ+aJdcssvJo/K5eU5+REPsSQlvOlP9nA5EsH6
 8nH5o1sxFPQCU6rN8ePnn4QIquL7DFFY44iNNXLMi4Hgzp3dNzs1fuvxJB3/iKrrUaSzRAVKlBG
 dukaAUtqzKmee0C38/+OejiVfkWeBzqf0L8g3Lt/1sYPV32H+gmNpNx6YRs8Uq5ef4cVTKGdyn6
 X6nC24wWga0I9AcxDUekRfKYsTxFVx3lN9THGjH9KSTLC3USoOg9DQNBT8bToIGS4cxIS/RYns9
 k9NKsKJpclgbcYRDQRQ==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6c866 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=eFSy-WoeKmqNeFKM-ZoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130033

Glymur has three CSI2 PHYs, while X1E80100 has four. Reusing the X1E80100
CSIPHY resources also exposes CSIPHY2, which is not present on Glymur.

Add Glymur-specific CSIPHY resources for the three available PHYs while
continuing to reuse the common X1E80100 CAMSS resources.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 42 ++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..f3cab9ecef04273e09b81ee0cd4e31ca45d1c915 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_glymur[] = {
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
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -5572,6 +5596,22 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources glymur_resources = {
+	.version = CAMSS_X1E80100,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_glymur,
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_x1e80100,
+	.vfe_res = vfe_res_x1e80100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1e80100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_glymur),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5806,6 +5846,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,glymur-camss", .data = &glymur_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
@@ -5824,7 +5865,6 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
-	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1

