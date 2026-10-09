Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5758F4CCDCB;
	Fri,  9 Oct 2026 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544669; cv=none; b=gHKnU1/ZwocH2PkQEDf9l9igVnrB5LQZaWK9nYlZtzdm2QZ3r+JHxWZN/LKD/iteSSJfxkXJR6PeKvn5mFeqk+a3c8GktKrNjCieMpJIhsaNiL5Xz+T6Anri2lQ65v7CtL33pG61NaqD0hH1iQkQoC8tjCjKH/xePp9j/maLUfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544669; c=relaxed/simple;
	bh=9RfGSbnAAgPx8iq+UO1stOFZcqYXUxRD51qJhy948uA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O6Isei5gixKdd862nzYd8DhjoO2ph5+TuwXEIyg6QdMgf0GJdtC7Gaebag2INtITvch2Cz26J4HKB087UbxwR7NMvnS3YZ/C3+WxmCK5D70socaukViyB3ADfQxIX1p+I1PIJ1C2v7Gk/pr89VC7YkgSPxAP/2wNq1qXz6ZEYzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndvANtU4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndvANtU4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KBvg2256985;
	Fri, 9 Oct 2026 11:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=572iF0N5kSc
	W0SG16WWDLYoK0Ti4qFqER7fuHzcYZ3Y=; b=ndvANtU4rm/PjVS/KfmHhPzRMvW
	Vg3XDfIZohYw38wisrsik30W2Ja03dICc3+mpDgA+ihkk8HN71/Xl1qYkMWjSmND
	QxbIetkCsCAEWw6YpInXFjSNUfSQ8JMVQJWdXamgt9Y2SeHIOILBCp0comYEcrGY
	KYJPFa+xedC+jM6Lba0fWlJbmp0nlrmPkT0jXjY2xix/zU0R+8rFQK6DPInyNPz0
	utUJwRN0ROicXfYa9z8/8yvK2YS+lGzrps9XNL4+c4aMSM+mje8tAdIOkiP5W697
	4EcdXiGgFC/O5KIdGrfoQ4ntbjNonrzKzr5XgPOJPyJDzR5fc5cTRdMxq+A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nuft2ma-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 11:17:26 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 699BHNCn1842465;
	Fri, 9 Oct 2026 11:17:23 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 699BHNR31842443
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 11:17:23 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 2C0E4641; Fri,  9 Oct 2026 16:47:22 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v2 2/2] ASoC: qcom: sc8280xp: add Maili sound card configuration
Date: Fri,  9 Oct 2026 16:47:19 +0530
Message-Id: <20261009111719.2609060-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009111719.2609060-1-prasad.kumpatla@oss.qualcomm.com>
References: <20261009111719.2609060-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac8cd46 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=2q0SpPMmqTH-E8r16rgA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0NCBTYWx0ZWRfX50s+hi4tLvVs
 gAMndDWIhVyLnBLrP3Iu0OdTvLBUc7o4UaSKtgpXuctBzsXptS9GVVP4p7IVTpBMfoM9pvohJkr
 6B0dNq4QhJlk4Bz5FaALplljRomzYf4=
X-Proofpoint-GUID: UOXnD0HR-fJi6niAWzWqoQ97s005DGlD
X-Proofpoint-ORIG-GUID: UOXnD0HR-fJi6niAWzWqoQ97s005DGlD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0NCBTYWx0ZWRfX6qfSULbRkgEQ
 Qmd+5VmqFnyFAo2Ws/LX6++1w18VFO4ud6jjs3CM96SA0BS6dcocYm7wPeqeV2R4L+Kbem2+L3x
 K7CkUPIq4VrdxW0P8VXHcj/b0DenEiggDxct5IaZzOOFvUI4nZK4SUCez+kdelWD35LEhnDIZfn
 jGOvuHs3340Edo6i2F9WlxaOpopYi6tEAB6FcrzPLd/+XKUMCBsltC3U8kOxuV7Fvmd5I2FDWBt
 IQyUbtpZTeGrO+JQEheEg0pw9c0d39oRqYZAvjjycSIpoNGN/cFjYkMIiPoZ4r+MgGRWxckCTn0
 IlI+LE4FvW8UY88bnbeXLP9D5hYwx8YgLQbCspTWkbglHS17sh89AuDvGMQqE0Tr3ioF8EiOtMx
 I2+XexMSOrnTZ9iskTpSwIYpaAYiS9u8auuLTSq5WtaZdDkZxGWP4UKuA3oF0Ti4D5lBNklmz73
 bFgIO7nyKMjJw3czI/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090044

Maili ships its own firmware, so its topology file has to live in a
separate maili/ firmware directory. The topology load path is derived
from the sound card driver_name, so reusing the Hawi data would look
up the topology under hawi/ instead.

Add a dedicated maili_priv_data with driver_name "maili" for the
qcom,maili-sndcard compatible so the topology is loaded from the maili/
directory. It keeps the same DAPM widgets and enables codec sysclk,
MI2S BCLK and WCD jack detection for the Maili audio pipeline.

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index b5d367486d56..b97cafeb8e78 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -552,6 +552,15 @@ static const struct qcom_snd_soc_common kaanapali_priv_data = {
 	.wcd_jack = true,
 };
 
+static const struct qcom_snd_soc_common maili_priv_data = {
+	.driver_name = "maili",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.codec_sysclk_set = true,
+	.mi2s_bclk_enable = true,
+	.wcd_jack = true,
+};
+
 static const struct qcom_snd_soc_common qcs9100_priv_data = {
 	.driver_name = "sa8775p",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -676,7 +685,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,eliza-sndcard", .data = &eliza_priv_data },
 	{ .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
 	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
-	{ .compatible = "qcom,maili-sndcard", .data = &hawi_priv_data },
+	{ .compatible = "qcom,maili-sndcard", .data = &maili_priv_data },
 	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
 	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
 	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },
-- 
2.34.1

