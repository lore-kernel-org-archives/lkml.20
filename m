Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8F847CC82
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363805; cv=none; b=O/KN9zigzG7jqRIqYKqzZZdlHTTrnXvM7PLk9HTRjtesJ7ZoBTgTfqW/td22cNLipfdHOqq0NZMF3hKTPSEWL6wzRpIUEbfi0jYxOC4lHLsa3KXYrrzUb1BvsiMsUpqK1Y86t8DD5nduYMxik8r66xhpRC62hgH1SMaAt5Pk0M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363805; c=relaxed/simple;
	bh=xSm1XOWKCKrz3j/Dyp4yrLcv5U8u3BkwMV3VPvhZIO8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GvA7Wyz7EDA3Z3/+cYdIGhcx9alga9iotjrxbf/LLFWWPdKDL3H1BhZrKCDK2QCsilzHWeHWHwLK6h8aHnHDv7ga+GzxGj3B7dAYM8P4dLm5nhjQVd6vxxzx211Tp4Nsnp1tfsD8Z7jn8mzEot+kwqKPTU97kp87u106Z71f6dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e8kdQVCL reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e8kdQVCL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jnQJ3334832
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H0u+XJ4S8rF
	9LK41TGex3N5zSjHEVqYjiTq6R80aC/c=; b=e8kdQVCLMJLQHPGiHjIf58INPCb
	3mbF385Gt+8qOgnKaQc59owl3Hmt1BQH7rXmYKupxWrfFBNBdCsBR9IAbr2tecIB
	T/xrFBpJ+ZGVRCwFfXmOFdrvchcj3fe8KlLw5NZ/yuPFlusX3zzQaHFS8TC9xXgL
	My8paTZrFvJEfIdNVAO5mHVxmSjjTwzedIdOwFpPoP0vpD4tVcq4OJgrRCWQyIXT
	i0+QjadPbuezbIpF76Lai48fhgV0mt8TNtcYLwa1uyOD1BiW1bH7YpBKJEI51x+O
	6i6/QIP8WeCbIBlBaR1cXtxQaAbLKqWcdQq4AWWBj5C1b6Yw51GzPPXQZeg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623b07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:02:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc359d9easo614083485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363765; x=1791968565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0u+XJ4S8rF9LK41TGex3N5zSjHEVqYjiTq6R80aC/c=;
        b=Gf7wzvL29JyYBf6a5/+2goq1y78RZK3gPMua3Blh+Z5vfVcJIYlzB+jlKZ3zu2BiWM
         RdQHd9DBcNI4TRA2qwxBGTwg8xLSfIgGaHRAhjzCTrTKOGj3U6mdVRcnb/WZWpQPxev0
         v/SbZ+yJmYbRl0V2ii4+gTJZ4xG1A3NTVfhgPJ4b2LF6B7IFzcpuOwv5f0nNQ6I2wChZ
         FW/2gVlZE7YtSwoXIBaffg8JsaTpsW/pGIB+sLsYM/O8GkoWRmKYmSkYLK/q02yrEzgp
         MJzKV2BeDCi06syGrUpuxj2c5/gT0vJgID5uDuRkWcDz/OucI+V3HZRMGCWW6+LfQzrQ
         llBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAjTSR/z3lEcCYYYkcMuEtlAOxQhfqr73i2ASNgCug/lByBY9HO7olVZfRrKwuofk+wJd6yqd8n6STkoQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nJPqQqtaixwqkI5Ly02rTyx8B/2cjXbzllu/NnWGnCb3D9NnLz
	OUT8/dRA6zdLJnlxI854EmDQpO2pHuMzRQORWGQOVwb56Ip11vAUm5m6Hw5zFziVzOuweQfqEz8
	jlRfkWuEjsweqs0ysYaz9ubGpkT6pnn3yeEcx4Xmv2l4x81j48rQFVxNE4S2cYdSuJSA=
X-Gm-Gg: AYBFou06ydwN0mOWh5hmj+QRQ4HM2GH3PbJTjpf0fI8yWUPmUYEr61NLh+Ofzqzg8Zm
	81aId6j0V4uS9HR+oxvdcilKfV5LxF7cRNXFExT59QcjSpN3QyDJ/09sLgR0a9Lfg/3PsA4iHRz
	OuU1BjOzdqEjNFsxPmoD9c5F1rSAglmajmjQJfDmQKuX+GdvX3d3vcPGvfqIgVdtSyGZAXFh87o
	rHFGYz9K9V3sxcPgrBepAGJjaqyvVAKnw30wiiim5N5RZm7ijSUX7mKjSq78LL6ENiMRsoKdg5g
	/z/FzvcPT3cofxUzLmPdxZtQh9UEi80SNx3YcsuxH03irfdQjxOahx7CIqc=
X-Received: by 2002:a05:620a:17a9:b0:93e:5cf8:e5a4 with SMTP id af79cd13be357-93e9b7c257fmr296806585a.58.1791363764657;
        Wed, 07 Oct 2026 02:02:44 -0700 (PDT)
X-Received: by 2002:a05:620a:17a9:b0:93e:5cf8:e5a4 with SMTP id af79cd13be357-93e9b7c257fmr296797685a.58.1791363764088;
        Wed, 07 Oct 2026 02:02:44 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:43 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 34/45] media: qcom: camss: sa8775p: add pixel path resources
Date: Wed,  7 Oct 2026 12:00:30 +0300
Message-Id: <20261007090041.3732717-35-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7t916Fwehhw9GXPUEphN5N6ILSvKGdY-
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac60ab5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=Y4P9ch1KcTPFiUn8tYgA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX00b+Ycj/llHg
 cZaCXcbaan7SO3GtGvunS6EpLC3eoZkmLPilLFpuAju2U/iInAil6xAQEwt/EUspQgHNwaHBmWR
 yEbZQpvjckBzFWA9wwM8+c6aNYZvcyY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX7Q2TIJs8Axbx
 /aUgc2ARnYc2UlMxJkf2dhCXeLTh9s6aD/adExCijlImvOHb+pdS4b5WltkzszEu0B6h88xukGo
 hl8gdRAwG3b7ddRQEFwiTiWrSjrsvh6WIZjzNEYYuDaoaOWdwpY0M8OMYCvg1JWyhgu3A1YFLuS
 77/prCTGAtr6za/R6LNKr2cjQ9be9J5bPTHOFjTZkomVOQmrOWHwi1B6w/zTXNyumP9emJsxMSD
 Qan1CZf0SqFN5oa5hvjyD5+JOvvp6toR+/aumKPr0UpU8g/VkkznT747E0xW0KY6Jc6T2G3F/ja
 2qUvRdaXRWfrczjqdQakF4/ZgZneG05n0noJ990fTsZKTSrzHUOJlsiJ8+dg0A7/U1OW67Ieb2x
 Cv7WmIKnnjBwB5G8xMp5UJg1ILONX2qwBq+srythy7VaEih8MeOgdnXAjnOKFEKtjNqoQwELPDK
 95NeyuxOhjmroXimPkA==
X-Proofpoint-ORIG-GUID: 7t916Fwehhw9GXPUEphN5N6ILSvKGdY-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe the CSIPHY, CSID, IFE, and IFE Lite resources used by the
SA8775P pixel path. Add a separate compatible so the new path can be
enabled without changing the legacy resources.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 424 ++++++++++++++++++++++
 1 file changed, 424 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7a3e5e6f81e1..a0b51c12c0bf 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4382,6 +4382,412 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_sa8775p_pix[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
+		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.streams_enable = true,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
+		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.streams_enable = true,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
+		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.streams_enable = true,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
+		.clock = { "csiphy_rx", "csiphy3", "csiphy3_timer" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.streams_enable = true,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+};
+
+static const struct camss_ife_stream csid_ife_streams_sa8775p_pix[] = {
+	{ .id = 0, .pipe = CAMSS_IFE_HW_PIPE_RDI0 },
+	{ .id = 1, .pipe = CAMSS_IFE_HW_PIPE_RDI1 },
+	{ .id = 2, .pipe = CAMSS_IFE_HW_PIPE_RDI2 },
+	{ .id = 3, .pipe = CAMSS_IFE_HW_PIPE_PP },
+};
+
+static const struct camss_ife_stream csid_ife_lite_streams_sa8775p_pix[] = {
+	{ .id = 0, .pipe = CAMSS_IFE_HW_PIPE_RDI0 },
+	{ .id = 1, .pipe = CAMSS_IFE_HW_PIPE_RDI1 },
+	{ .id = 2, .pipe = CAMSS_IFE_HW_PIPE_RDI2 },
+	{ .id = 3, .pipe = CAMSS_IFE_HW_PIPE_RDI3 },
+};
+
+static const struct camss_subdev_resources csid_res_sa8775p_pix[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000 }, { 400000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000 }, { 400000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000 }, { 400000000 } },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000 }, { 400000000 } },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID_LITE2 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000 }, { 400000000 } },
+		.reg = { "csid_lite2" },
+		.interrupt = { "csid_lite2" },
+		.csid = {
+			.is_lite = true,
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID_LITE3 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000 }, { 400000000 } },
+		.reg = { "csid_lite3" },
+		.interrupt = { "csid_lite3" },
+		.csid = {
+			.is_lite = true,
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID_LITE4 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000 }, { 400000000 } },
+		.reg = { "csid_lite4" },
+		.interrupt = { "csid_lite4" },
+		.csid = {
+			.is_lite = true,
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+};
+
+static const struct camss_subdev_resources ife_res_sa8775p_pix[] = {
+	/* IFE0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe0", "vfe0", "vfe0_fast_ahb",
+			   "cpas_ahb", "gcc_axi_hf", "cpas_fast_ahb_clk",
+			   "camnoc_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 480000000 },
+			{ 300000000, 400000000 },
+			{ 300000000, 400000000 },
+			{ 0 },
+			{ 300000000, 400000000 },
+			{ 400000000 },
+		},
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE,
+			.pads = &ife_pads_v41x,
+			.top_ops = &ife_top_v41x_ops,
+			.buswr_ops = &ife_buswr_31x_ops,
+			.mod_ops = &ife_mod_v41x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_streams_sa8775p_pix),
+			.sink_streams = csid_ife_streams_sa8775p_pix,
+		},
+	},
+	/* IFE1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe1", "vfe1", "vfe1_fast_ahb",
+			   "cpas_ahb", "gcc_axi_hf", "cpas_fast_ahb_clk",
+			   "camnoc_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 480000000 },
+			{ 300000000, 400000000 },
+			{ 300000000, 400000000 },
+			{ 0 },
+			{ 300000000, 400000000 },
+			{ 400000000 },
+		},
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE,
+			.pads = &ife_pads_v41x,
+			.top_ops = &ife_top_v41x_ops,
+			.buswr_ops = &ife_buswr_31x_ops,
+			.mod_ops = &ife_mod_v41x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_streams_sa8775p_pix),
+			.sink_streams = csid_ife_streams_sa8775p_pix,
+		},
+	},
+	/* IFE_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",
+			   "gcc_axi_hf", "camnoc_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 0 },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE_LITE,
+			.pads = &ife_lite_pads_v30x,
+			.top_ops = &ife_lite_top_30x_ops,
+			.buswr_ops = &ife_buswr_31x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_lite_streams_sa8775p_pix),
+			.sink_streams = csid_ife_lite_streams_sa8775p_pix,
+		},
+	},
+	/* IFE_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",
+			   "gcc_axi_hf", "camnoc_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 0 },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE_LITE,
+			.pads = &ife_lite_pads_v30x,
+			.top_ops = &ife_lite_top_30x_ops,
+			.buswr_ops = &ife_buswr_31x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_lite_streams_sa8775p_pix),
+			.sink_streams = csid_ife_lite_streams_sa8775p_pix,
+		},
+	},
+	/* IFE_LITE2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",
+			   "gcc_axi_hf", "camnoc_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 0 },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "vfe_lite2" },
+		.interrupt = { "vfe_lite2" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE_LITE,
+			.pads = &ife_lite_pads_v30x,
+			.top_ops = &ife_lite_top_30x_ops,
+			.buswr_ops = &ife_buswr_31x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_lite_streams_sa8775p_pix),
+			.sink_streams = csid_ife_lite_streams_sa8775p_pix,
+		},
+	},
+	/* IFE_LITE3 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",
+			   "gcc_axi_hf", "camnoc_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 0 },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "vfe_lite3" },
+		.interrupt = { "vfe_lite3" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE_LITE,
+			.pads = &ife_lite_pads_v30x,
+			.top_ops = &ife_lite_top_30x_ops,
+			.buswr_ops = &ife_buswr_31x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_lite_streams_sa8775p_pix),
+			.sink_streams = csid_ife_lite_streams_sa8775p_pix,
+		},
+	},
+	/* IFE_LITE4 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",
+			   "gcc_axi_hf", "camnoc_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 0 },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "vfe_lite4" },
+		.interrupt = { "vfe_lite4" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE_LITE,
+			.pads = &ife_lite_pads_v30x,
+			.top_ops = &ife_lite_top_30x_ops,
+			.buswr_ops = &ife_buswr_31x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_lite_streams_sa8775p_pix),
+			.sink_streams = csid_ife_lite_streams_sa8775p_pix,
+		},
+	},
+};
+
 static const struct resources_icc icc_res_qcs8300[] = {
 	{
 		.name = "ahb",
@@ -6275,6 +6681,23 @@ static const struct camss_resources sa8775p_resources = {
 	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
 };
 
+static const struct camss_resources sa8775p_pix_resources = {
+	.version = CAMSS_8775P,
+	.csiphy_res = csiphy_res_sa8775p_pix,
+	.tpg_res = tpg_res_8775p,
+	.csid_res = csid_res_sa8775p_pix,
+	.csid_wrapper_res = &csid_wrapper_res_sm8550,
+	.ife_res = ife_res_sa8775p_pix,
+	.icc_res = icc_res_sa8775p,
+	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_sa8775p_pix),
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
+	.csid_num = ARRAY_SIZE(csid_res_sa8775p_pix),
+	.ife_num = 2,
+	.ife_lite_num = 5,
+	.link_entities = camss_ife_link_entities
+};
+
 static const struct camss_resources sdm660_resources = {
 	.version = CAMSS_660,
 	.csiphy_res = csiphy_res_660,
@@ -6449,6 +6872,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
 	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
+	{ .compatible = "qcom,sa8775p-camss-pix", .data = &sa8775p_pix_resources },
 	{ .compatible = "qcom,sm8250pix-camss", .data = &sm8250pix_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
-- 
2.34.1

