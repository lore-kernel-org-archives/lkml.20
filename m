Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8BD47207D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363788; cv=none; b=ZML830qB8OVlbWadaoaSCFI7e24RtbWO4G4k9jefQBIk8DFhnjwplg6xilXc0/ZsynvUwAGooStRL8fGBv5a0gkg7Gjck2SsMzETuD1pMaFOiGnfaJvtRZiKXuuwz2TW2XrNCl7GImxrKMFY5SsFYsAynviT++dWfwgDzgPC2po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363788; c=relaxed/simple;
	bh=XT4YegbYR6kcaRNNEmWcEpM2Kk1lnDzNJZz57R4PUyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B8ozYgp+phjWKApQlm5Z/tasBfTBjrsZGzfAm/hj9rJr0cryv6rPFiaxeNzpypsKmJCF8SwAdz0m/jMXL8A2RA+3G2eeQWdavtA/CA0rLu4qR5n5Qh0ty6Xo+2BcFl3/+Ye5KSjtc2kLznkfok7Ndotvsa9wzgZAPubcxZKdz8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lc5CJ9H5 reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lc5CJ9H5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jYaO2481376
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NAb5DKDYonG
	Bp5OHaxSMILNKAmcUnRzguf+XLDvY9XY=; b=lc5CJ9H5+9ymylabq6LIOCDHGxw
	86VTHG16hQ0fNqzDucLp13vi7fov29A+ejG6tZIdwelJoym/EU4C/MCb/BZWzVp5
	ujRGWLCS80/0nfr8VH0yY0kMF1KjpYkfzWca0y9EfYfT8tWPL4VwDLyOejFh7byG
	ptZRpqsy5hlOlBy1GyUm0fSRBK7Zkdn93XW8fy+k9OD3qZo3GZ0vKUKGPTkB2ll5
	ttLaEFQwK+9jrE2cbzSp1V0iYgUQuF83/r7mmxSLg6LMAYerj/YRNw0UDEktXerH
	GwrvEI1G46Lf782pu7cRF0wIurs4x47XPn/Y1hLIZQ0UZ70f00ioAvaOGJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u1cgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:02:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caa0ce0cdso464762785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363756; x=1791968556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NAb5DKDYonGBp5OHaxSMILNKAmcUnRzguf+XLDvY9XY=;
        b=q15ypZz9yOhHpN9QnQyEp7dfbxrO2XsRIr4rofGwPFpAYdPaxeqHFaBbV0SoJsdLPf
         OHzQXBEfqkk8vGNxUFgeL5iyYRDTEMP3PvpQSwu5BbSjvKV6UhTNG27osiO2rAcb2Bvu
         Poa2oFIE1O8A+N3N2bsb5RtYeyK5noSKJUyQqJFgFKGtjZ9o4pvJ6j7+jURstPMHe2gv
         GdgHrgOJ6/5bwfHAJgeOAZ1Y3KCatMduBGjjm9TpMFkEJVBQuWbnlukVfUhym8w/xdwu
         SQpLZD7TURe5GDMISXRkntCz3Um01rq3DFPRwMHDbs8yl3tdE7LLdFEw+EKWYZMUb6Y0
         qXDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjqZxwV8jU3gmNNhomhXJ1PfAZB/1R0muoXEX1k4jtdS677sezD11fOT84aG2S3MqAcRs8PMRXuyA0E90=@vger.kernel.org
X-Gm-Message-State: AFuF++kMRkatc1P4oErq3a8FhSmVwqkQvz+d46ciYRUclrCZqqZnVo2m
	f3GTBxKySt0S/m/pFHNxYzg+cV0ZyXYYRI7O2KpTHJYQYJMW39R2Y2CmAy79JjUwm8IxS8fHbb2
	jNWVS7SePS9h2VOyUVMMZJFe18QMtyS5WZLC++UzeqQrIx7Dg7akWEAuf/X0kUMORG3U=
X-Gm-Gg: AYBFou02cYpwUnmNf77fAO+8i5hylKzsz1i5CmlzGzhOFJkp1e3bsCj+roV/4kmJNv8
	1cRbdqlAOVBojLQiGMDEk+Yyd2pFL7HIv2KSdfo05nhiVrrxranXFj5VwVz4dECVjZWc4LADad8
	x/4fPDMilkztIbGJzI9k4kvc/A0QCZTc7mtZOIu1gRaGRcFvc5/qyH8rpfAZAsOjo0NpZZFTwYj
	f6vqBxMdana0xQBUr4H9moqLuOYPLbpB4r7cPMn7P+9sXcSwR6FNK2VjuMBMe+gggBPQHxTkj37
	UdOwaCKkQH4i0zvMsVlfHuW12Ab9j1naB41BwyFKbm3HFENXsCj7m+cvYa0=
X-Received: by 2002:a05:620a:6019:b0:93e:973a:e5a7 with SMTP id af79cd13be357-93e9b7e958dmr292768285a.54.1791363755554;
        Wed, 07 Oct 2026 02:02:35 -0700 (PDT)
X-Received: by 2002:a05:620a:6019:b0:93e:973a:e5a7 with SMTP id af79cd13be357-93e9b7e958dmr292760185a.54.1791363754877;
        Wed, 07 Oct 2026 02:02:34 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:32 -0700 (PDT)
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
Subject: [PATCH RESEND 31/45] media: qcom: camss: sa8775p: add IFE completion groups
Date: Wed,  7 Oct 2026 12:00:27 +0300
Message-Id: <20261007090041.3732717-32-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX0GR+GIXKzHHA
 28h1ITMC4//yc6oO792ygrp8ITj2l1EjhERmXd9aUseGRpaaJgO9vkKGPY5flZJWhCOp3JEynxX
 gbc4HwYQKa0snZoJxDlKBKtYuY7r+ic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX3qSwk2tZs7JV
 QFSvOGwLVm3a5JwKZrY6pcq9g6S640EsO6b9Kzsz1Glj9RCFxZfqcjesbIYXcOwh9FkowA98d0V
 /tGbqY+2sNl3sSQ/K+9p51WuL39nH54jhi9tq3ZkD7cUFHhp3Lvp+1ywoHWEdOmTCz/IBsjKNho
 GkTyihxQoOug/fHAaN3sEy23lUhLzMtBto1JxgB1luEeVoAfpLt77xLbM22UOtI44jnfKb2I87y
 JpjSWhGdEfVxrC92HQBt4SAHimjVdThIJbLYBP08O2biv5VtRDM//2cxUXaRzWY8jo9JE5P6ETu
 UUuqKTI0SAUu92zeqUtkrB8HVG+nNnCA/2vPamj8ReJ9fJBF/nbz6JlgCnAwdlsFg8vkGp+b1HI
 e9syBWARy64Uajlm4krufzzpe9kWRGsANvM4T/xdzOCtnpN4HPeky3w8VoRBFJTs24DnnR+pS68
 9ic+anQtckoaSVvDbiQ==
X-Proofpoint-ORIG-GUID: aUxepuWyQNQayCPPiLK9DIpzErk_5QTp
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac60aac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=ws5bt0K1pQquYSmRKVIA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: aUxepuWyQNQayCPPiLK9DIpzErk_5QTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe the SA8775P completion groups and statistics output.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-pads.c      | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-pads.c b/drivers/media/platform/qcom/camss/camss-ife-pads.c
index b1e6204ceb21..38e87a1b3826 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-pads.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-pads.c
@@ -484,6 +484,8 @@ static const struct ife_pad_desc ife_pad_desc_v41x[] = {
 		.hw_pipe = CAMSS_IFE_HW_PIPE_PP,
 		.packing_fmt = 0x1,
 		.mode_config = BUSWR_CLIENT_CFG_MODE_LINE_BASED,
+		.rup_group_mask = BIT(0),
+		.comp_group_mask = BIT(0),
 		.num_wms = 2,
 		.wm = { 0, 1 },
 	},
@@ -501,6 +503,8 @@ static const struct ife_pad_desc ife_pad_desc_v41x[] = {
 		.hw_pipe = CAMSS_IFE_HW_PIPE_PP,
 		.packing_fmt = 0x1,
 		.mode_config = BUSWR_CLIENT_CFG_MODE_LINE_BASED,
+		.rup_group_mask = BIT(0),
+		.comp_group_mask = BIT(3),
 		.num_wms = 2,
 		.wm = { 3, 4 },
 	},
@@ -518,6 +522,8 @@ static const struct ife_pad_desc ife_pad_desc_v41x[] = {
 		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI0,
 		.packing_fmt = 0x0,
 		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.rup_group_mask = BIT(1),
+		.comp_group_mask = BIT(11),
 		.num_wms = 1,
 		.wm = { 16 },
 	},
@@ -535,6 +541,8 @@ static const struct ife_pad_desc ife_pad_desc_v41x[] = {
 		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI1,
 		.packing_fmt = 0x0,
 		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.rup_group_mask = BIT(2),
+		.comp_group_mask = BIT(12),
 		.num_wms = 1,
 		.wm = { 17 },
 	},
@@ -552,9 +560,32 @@ static const struct ife_pad_desc ife_pad_desc_v41x[] = {
 		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI2,
 		.packing_fmt = 0x0,
 		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.rup_group_mask = BIT(3),
+		.comp_group_mask = BIT(13),
 		.num_wms = 1,
 		.wm = { 18 },
 	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_stats_fmts_v20x),
+			.formats = ife_stats_fmts_v20x,
+		},
+		.limits = &ife_meta_limits_v20x,
+		.video_name = "stats",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
+		.meta_dataformat = V4L2_META_FMT_QC_IFE_STAT_3A,
+		.meta_buffersize = PAGE_ALIGN(sizeof(struct camss_ife_stats)),
+		.output = CAMSS_IFE_OUTPUT_STATS,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_PP,
+		.packing_fmt = 0xa,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.rup_group_mask = BIT(0),
+		.comp_group_mask = BIT(5),
+		.num_wms = 1,
+		.wm = { 12 },
+	},
 	{
 		.pad_flags = MEDIA_PAD_FL_SINK,
 		.sup_fmts = {
-- 
2.34.1

