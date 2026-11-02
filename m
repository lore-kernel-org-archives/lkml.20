Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616149;
	b=c5t94Sotql2J84gYoZY/bjcaQ8+i3TvXyXa0+xiCLHgEMWae3jUXvCbbz8LggGudb3VO
	 Y4KA5/U3kAqGY2atsjTBFwQlRdZhzcpAH0qOfWuxhbqQuw0VKD5zMCUK4by+D0L43vkKf
	 KytivbGtgbDbZGcG7cGj7fC5TxEz1BOQq4b9SE1BfvdlZH8dtNcGMkSPi90ZONPnaBZxx
	 CrKrmI6a3RjI2fgsWJ1lYl5N4RdhtpKidf3NlwKxgYFLN3gFe9cgySxPMCxwpqmqrJKTW
	 gUCT5oyiExR/fBncidXnGuvqpvMHPprXsSiHQf/Q8mrpd43qGMQP3XYDb4nNN9jSRcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616149;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Um07vBM3gsqnJtvymP7VQb4GOHOjEPUnXIoHN/ARP/c=;
	b=waI/mOXt2/rTpnq+3wzDPgIHP3pioZ1dYG5Oo/z5alReQ97RmMlkJo3bC4hlpd+T6GeU
	 rWDRRqWUF3HONtPrd2saDrEMwfKcHMo/iOo1Pe26Ds0i9lQzQAuoiYiXfkmtojdDm+q4v
	 k301YVeh+Gq1H+eeFdPoZUmUP4z6dSxJEJqGJzcO8oDFmhzoezWqGd4MyCe3TCWd4yOnn
	 QG9QYpmojfMaL/Kkrdj7chkkD76ICoCAdVIughBvzT36ZR5A68Ihhe8+cA/fQrrOghW6y
	 phKBNdCci3MD3Lq3zXrNwtwuJEHDynvARmPiE9zWg1AvhaMmg8gCqf/ERG/YhEOBMPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jGc2JBXc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFGNo4B+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAAA60A380D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BAAA60A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jGc2JBXc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFGNo4B+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A6D22466622
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Um07vBM3gsqnJtvymP7VQb4GOHOjEPUnXIoHN/ARP/c=; b=jGc2JBXcHRzAaY2j
	M2zTSW1A8OQVIx7MOuSKUVYMzqUJfLubyC6g8QYIJ/sh3rfWfu8OU/MDQe0kIBrm
	2racFMZj/gcYDUov75XYNb9VLNfyYg/J7ESr3Lwk4eVQanGlnDCfhMrUalFP0ago
	sfGaKtvOmBHyE4NuYld4uzPkh6vHfL9sVIg+ns7HQbnV9DvjVgu2eTrzyB3UnpKf
	Qi0mnyiatnym4t2/yuxzMUHQjU3P3KyngNiOqxlMwKgFVsk8L4XzAKqaTmOvR2QR
	X0x5mOhKmPYxeRjN7ZbjhqNdWY18S0Zej3A4L6+xaVdYnCFRkhQ8a33vvkv/NARZ
	DY2Q7A==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhck3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:42:28 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-48296f34f1dso2519032fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616148; x=1794220948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Um07vBM3gsqnJtvymP7VQb4GOHOjEPUnXIoHN/ARP/c=;
        b=KFGNo4B+DP4btSo7/2YReGJhFsHk073linvZ/GqiY41NhZpJCDt71j7KEiBhd8BTWW
         xK0E88ndYiCW1zN3t30sp5Os+qBPve771yJrvKVHyaRZG+0bb6sfe/xTGqei9pFrCsR6
         MAOy4qXZjyS/NZIX217vKNB/+vIHjINn5BAhoPXo6eu+GstpPGvZusZP1rm/RlAbH76F
         3nZ0EAVYBxO5TZFRaBx4d9Ffizac2lhlhrDY0djZnFgRkQaUUuSYKY9Ha/+oY9CaOvhs
         CTViqXZpRDR+ah0J/2jpCFUhL8QOUONz84oNu/NZqbAsRDlyV2jHlD+hF8A72y1MeOgf
         Pijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616148; x=1794220948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Um07vBM3gsqnJtvymP7VQb4GOHOjEPUnXIoHN/ARP/c=;
        b=R7tE53aFRcuTZyVjpDHpOr6Z31SzDWmwVdphwFUhejghgGt0A3X2JCNe+dUzYWfnbQ
         +CFkl9XvABCXPBE/itlI1+S6M8H3Ze62+xN/Z9dn2wrcZaDyGC3RhWC6UR/Xd4bIJtDG
         s9nFcxJw+iQ4MpibZBufHbZ69GcXsJ7+xgHYI10epO404MZPmH12VQnjwyyMOUS5NVac
         Ud9NG1sGa3BYT6dCyHz4jXTjI1k7TszNDrC01Q/apdu9j4H3bWqYVU7JYufZ0uz7cV01
         9fFgiN4WKU9gglymkBnckFQPvLm2BDbtHBU7i+v5xsj+CH2A1xOzxgoYYW1z5NJXJtzs
         ngxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwU4zcZ5QIhtOPexI7mhWb51N1uxhcpntUPVh4NS5UhS7EBrFilUIXa8k6xXgzfkq4DF209ck5Q9PTt0tM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWm/Cx9AafzkABRqgUMvkEkdDKlilskrnszpsK9AALB244+6+T
	yV1FIdZj+OkTANXW654oTuGM+YHcMvPYsHowt6IJjHYTLppBn88NpyinqAwH4UYFi+fHkjmlIdo
	dPEGdDB4RcUO2iEpsKDcmWhtdTeDPi0vF85fycn1NGov/UxkiwtOB+vtQwlqE4rZ2528=
X-Gm-Gg: AYBFou2PhjUnWp1H6o57Wwiv5vMYVf+S3g9CcYzgWaPfR0hAzT8AeIHspqLHqZK70zh
	e5oE7AZc5VVxcf30wgJ8dWQhm8zys59/OseeDH0e3Vx0zQLlj7KgOZR33qkRhT2ZHJdVhZEruX7
	zMdQ9bj36GJebp5Zm0XiKdUg6QOaRyc48lUZsl3Q92SxT3wvh0OYFQPWQ1TlFIyswnKkmwBZrQG
	k6/0xviifV1z8OLBlZbaaYDmDGhOFR1SkMOX4SuL8JrylEy4iBjatBdbjKCyo+Ux3teCgBVmAbI
	/lhxAIKpJHMEdYAhIUqvG3wUavpbIdOqMjrpkwKj2ScsrVGwd63ljzCiPnXNn3YnTITAatGkQZ1
	yDYtRoQ5vXQuiB9ad5MC6nH1pSR1APDqZ8HQTphF/sSDNkeGmLzY36Q3GMtFIXzBGJ6knsSoDhZ
	fymDIbA/jAwzxES5raC3P+GNQkzbaOStmHUcFXwikYeRLuRhT4TXsqoxlOTmY=
X-Received: by 2002:a05:6808:4e0b:b0:564:3fe1:2f95 with SMTP id 5614622812f47-5643fe14f4amr2068870b6e.56.1793616147949;
        Mon, 02 Nov 2026 02:42:27 -0800 (PST)
X-Received: by 2002:a05:6808:4e0b:b0:564:3fe1:2f95 with SMTP id 5614622812f47-5643fe14f4amr2068846b6e.56.1793616147534;
        Mon, 02 Nov 2026 02:42:27 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:27 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:14 -0800
Subject: [PATCH v24 06/15] media: qcom: camss: Add Kaanapali compatible
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
Message-Id: <20261102-kaanapali-camss-v24-6-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: AYlU_WaWmq2_m_5O1ZIkANUHQjPS57kp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX8jWpS55NahIR
 LFmeOzRGzX8oHOFpLZcesAJmTe0VWTwx4JrdoMCTPyVdBfaOLElUJJ4/JNlFfmdoEojg4TJiOlR
 DDjnSdRgUq90dgBzZXRT+TOrJCdtghxS4pnlFzWWnHU0e1O3cB7+MP+FYKIVq2ziYOyy7+vTWKz
 9hCuBUViotkngOoiTxTG0VAICf5kzN/gi7gVGjBdvnySbfai8+2TuiQNzhJqRNsq2k0bhRxl+5S
 EBWS662VGW9duTwJbtGxx+R0qmNKMG9OF53sreAf7Zce0tGJAaNo6vr2qRYWl1tWMuW8+aZ26Lk
 Ncm4OGNRfzTG34GN9Ciqe/OhpyhaJxPWH0a0o78TKhZJJRLlZE3LISZ8rZ6Tou9pHMkMD5hayE6
 z8fsmSmTsbj+dsgt4xaWWZev7Vg+mb9bXgsGDX74e5gkZpociPbbh+F7IWY63WyEWBVA6eXt4S2
 V3WbyTr4U1PH823ZqBw==
X-Proofpoint-GUID: AYlU_WaWmq2_m_5O1ZIkANUHQjPS57kp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXw6kfX/5C276T
 gNzl+GPW7m6rf7pffmCh4JVj4IgiHlIYX+0XUMy1X6idvvsKyKL6NIIrqfDC6tknPyThe8qa2Jb
 JzAhCAGPukljo9//3MOGkie01wGvkgc=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae86914 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data includes the ICC paths and TPG resources
and sets the CSIPHY count. CSIPHY resources are not listed because the
PHY is probed standalone. CSID and VFE resources are added by later
changes.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 25 +++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be58a39f4a8b..385be682e8b9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,20 @@
 
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
@@ -5589,6 +5603,16 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.tpg_res = tpg_res_8775p,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = 6,
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5823,6 +5847,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 431afeb381aa..97fec24e6804 100644
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

