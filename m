Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898255;
	b=jCqJEVn2kPozUiKLlkXzKAT84hnW96jRtQx20XDkqbGWrfTfvmGRcsX0vqrQOC936pXy
	 iEcSq4Aly0M9auqOcNr/Fa/eJ0/9YldL9oZfMCMvictOXUyqtBjg/YYeMLplWeyneKwVT
	 uIj2wQG/9l4OEXBAws82cqjQ4fAfO05DKRrJ/gLGqv5t84aB24AYR/qRNZ1kxbV/06hik
	 KC+PumOz4S71xe3p5VH5yGSZEH60vB++xm3sP4uOwENQSnrTxcCAuuy+P1pGS7qvT5tGi
	 0VfZdybFDGhBCmyJ1M/nHm3aIHq/uG/WOSa9NxDSdadZQ7r4Ei8VIMo+zabwVDyxKGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898255;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vFokErhM9Q2nJQ0re6oLwwnWeG49znjKbOg1X8oBNrw=;
	b=W4OGApXYiKW28CE1NiXjyGkheALnBhr8RP+TwvZIX4XuANzqD/N5d2X3EcWRodsMFMYe
	 xrzeOtYLyOHeR7m+dAZ5cFWPWcaW4feBJJhpLrgqV2+P9d1n5sgnVqeOFWqKseg8B+1l9
	 9Xfbvj5qOfbA9ytPXTQcsY3PMCWA8CRG56dPfu2m0xGYsGe1CWSAsZi4HM1E+Tf3q3t69
	 5BkhzXRtq4yFUP9+K+eHCgg7PRdf7CzFJVB5BgRf5dmwVOpiQxBKSPuNt9VGAQCcZsWE9
	 4qS9lgpmYql5D27i7EVUr7D5PSiFG/c7e0cDH5iHV0uwgDH/WoRRBbHG2425Xb7CAJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hrC9ZTPc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DxoRpq24;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEE060A3837
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDEE060A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hrC9ZTPc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DxoRpq24
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P17m523667160
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vFokErhM9Q2nJQ0re6oLwwnWeG49znjKbOg1X8oBNrw=; b=hrC9ZTPcSZxqR+y/
	4egwq1okUI0CHBzrb847IFersUjlMVzc1DISsIkVwC7W+5XRNnTRAbtGBAstQWph
	AWgFgMvdIC6FkU4gQnGJTFU3I/64bId9CfwFcuiq+rkPxEnmILavMhsUL9hlntwV
	+wqg8MNYwGCM7FX0qBLGnlhNKSWc0JZXgRN+STp8Sp/RJ5Ss1o1LvOl0RpgnWVlI
	5a2yWTbRDVjeb8ejK/KzkRqZW+gsyNlhG7vhJqsoBLX3Z7T5CV5qllobI7ejJMP4
	X4roh+FYMJ/RzJ1l3RztXKjFSPQhRveVHztGwFEtVPpV6KTlntSGOiqL4gRWGEUk
	Iim45w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xjcca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso4118560eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898253; x=1793503053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFokErhM9Q2nJQ0re6oLwwnWeG49znjKbOg1X8oBNrw=;
        b=DxoRpq24VmtVI/8yBMiKHgMHq1dIg3+ueWcByz15O/fkp7QQhL/0vODNAXG2KV4Bm8
         78OfE8ktO+mVKaeSajJG5gBd6Tv1i8RS3JdPvEFYcXEScrGqUoOsqFsR8dxycafc7Oyu
         Aduz5od8v4v5+xiCMy2cKb9Uq6Le2YYwHIzr6iwmD9kIJqkcrBH4kbCVsasdyk4fEySC
         EGJHaQIBMKBeGs7+iC1dkwV8fqY5Af6CLnllOhCrGgAKghzDdJ3RNWCmfnBEUdvnsPah
         35e4F7pwMIdoDBItN8r0CfS2nv+XRfnLbjyviyAo3qu/2NE+1YMRCKYXID+ABoGk44YK
         gFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898253; x=1793503053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFokErhM9Q2nJQ0re6oLwwnWeG49znjKbOg1X8oBNrw=;
        b=ht/KMYS/sNpAFxnbY6C5wKnO8TIhy4JLtH7Djl5I0n9X9+ogRkqnAXiPtz6o/uCsGp
         SELSw90faX40MpkbMAOnxzpaJRM6pig7g9b7LuNAnB9goEdiate+e0U86A1QYkTKYN/b
         z7Po9U8mxi+D1rHeU89bOVToc3dfaa9pp183hcw2rHd6HBvbspJBhyT4q6yFcXHN80ba
         GLP+bXbngrE8X12PuOumIGzdEwl5nMfQz0Y/tB6YKG/MGw2vEdSSN9TH3HqtJZNvQtJ5
         Xl5GkV9jjfpcaiwxJ80/VxWyBNMibyK3lhRws2MCLrCB3GLY6aDit3+1O6hoGOhXSVU9
         Mfkw==
X-Forwarded-Encrypted: i=1; AKwUvBzRpgkUkt8DZF0NMIiTOdY74lCULHuvVM2dULnhP2/s+TQcq/CQinTJML4uanZrqoK8PqwIJN3EOyjBEtI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRAtCkcSEh5NHaUfM29FQyFyOytCdLJWXF5Jw/7X2pY1D6efZi
	1AYFjCKzhCKQX2+/1TbFB/QpcI3ri14iMmIYeATOS7OPquH5gvguqyzyktxZJ5PhXCCD77U7+tJ
	QmQtpi0CmVb7MlGC9c9482CLGmRWzofWwP937PIJSCofaH5faGykDu/uabvSsAzlPds8=
X-Gm-Gg: AYBFou0aV8wkjYHpFP1DMgGJMLRvv+PLAcaKcg4rkoxfIGM4te7J4fl6TVUI2GYyflD
	4lY3HLehzO4F7mCeBambxijDvr5C8F7rMQURBIA6IpOUBeA8/1Z7kZmqm7f0fTpNrIUGk3tYCr/
	v8sG9/iUmczhlahq9mqaw0CgN8NcLjZJccDaT2hVkq1e1RJXfj8IMXM8KjIrdgPKV0dMEYK9u+c
	EZCARLp1A9AMNjpuTxVIlwuBh2Fq2zDeDUSfpJo92X+oalJnaIb/a5HJombyi+3UpycFCq0jt/c
	tMNdfYsOSE6nbGXpAkkJ4sEgVCGpH6cuO6bgHeb8c5r+DfzVSAXHh+XGwBk14yqMSSsh/u7YCDV
	GIu1SQoU80WMrZh/F8u2MeFILX1vwcsX4hI7GLM3n3EvFZqFHkjtBfQx5BG559aEnVurTmNq7JV
	XCKJu+GD0XYg==
X-Received: by 2002:a05:693c:2804:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-369e8362dcbmr5169605eec.2.1792898252787;
        Sat, 24 Oct 2026 20:17:32 -0700 (PDT)
X-Received: by 2002:a05:693c:2804:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-369e8362dcbmr5169583eec.2.1792898252247;
        Sat, 24 Oct 2026 20:17:32 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:31 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:26 -0700
Subject: [PATCH v22 07/14] media: qcom: camss: csiphy: Add support for
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
Message-Id: <20261024-kaanapali-camss-v22-7-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
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
X-Proofpoint-GUID: u26wDSZ9Y8J1EMUnJpUIxb_G-FGABGk3
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6add74cd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JczS9Y7s0yypmJa40voA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX96N5yzn4ohm+
 HAMw7UhYdjVu1iQEJ3/scMuLDcy4krTCDPgoC+yJUfaxaNf+qd2wT10RPmj3lwTxhDAXTVvIbRQ
 iIPcO/0USceXm6MKsEsV9V7CSZ/Fd10=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXx0N4ukl6QrWb
 FLkcpW4QJ30oVaUnp+ZyZRZ56A2vjSJkFyWvzJYdbyRF01Sm97BJEiSocxpS0jCLFP17wYueG6b
 huMi7YnFh2oxniuxXF2at58+rbvNffHbYcGXgkdrc135zHIj3ydnVxJjBF96ld89FwY015SSRZ3
 ogrts0mTOUnDNP47KgSJ2FqrvrKN1tBmTi5EFWE7KYfiThDgp4WE6tFlzjBY4nIDzoiEewPNAc5
 CZqIjcB6VmTxno0IAtD3K/YFsocqHj+cfGZ5pAZ27m9VEeO4KnIs5v7Mhg3zIjmDOMERhy4Dsto
 3y50cmnDYcUsYRmavM6kXPuZjdSoXmHN4hS33VxP6jriw8eyxCdVrQkP2ghq+3/FiF8qiEqjJmT
 tI5nDFn1OYvn2hYVfi/9GaJduDIM38dMgBaLLoAMQpeE2MI0P7NXemG2GWKD+Zk7f606P4lSyKh
 /5t2dvCuxBjbpHS8asA==
X-Proofpoint-ORIG-GUID: u26wDSZ9Y8J1EMUnJpUIxb_G-FGABGk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

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
index 98ec23c39fda..0358ee384012 100644
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
@@ -5606,8 +5651,10 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1

