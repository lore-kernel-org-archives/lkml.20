Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9658A3CA4AB
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326547; cv=none; b=a2Ycwbq7Aer7w2SgWGleMbyrcW8L0/PCDuYuFIzheSZakZ2W9JTuCazhh1c8eocHQGEWu0GvwDU2qpdLpfQ3GwCGyWefwrtM7r9vjdSqzDpek4QqKxYF7gkgqZWWORpc/+21K+euXTOxXQkTJg3rW9SFYEJz6lWNicJ+uXcDP8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326547; c=relaxed/simple;
	bh=QxLWhFgeUQLusf+StqHwrn5nVK8eAENGfOvehaREHa8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FftXA3r3b+f6wx/1ITRX1h6jhhCjf/7J+MHNXu0GMiP2V9B/ZQl2RdA1YpL2qHW7Lt/d09P9+br7gbNH3yFQPn+M/aVTjho0KrZAeDwdC1DFWS05E09wRhYo9jtbF5bvB2Ml0fRcElPSb6xKdvvZw2l/pIYVsZmX179EsnMJQ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=guCpAyWe reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="guCpAyWe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeR8n3050178
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F2EQswXZEUy
	FaiUxDqBndfVdwYFpc99v5q33IpvjJPk=; b=guCpAyWecCwCH2FQIkzbUw8JRPj
	nk2Sd5cHI1aHOp+kLOEZeW+VJ1z6GhPlOJSnTAxxG3O+LY0GQnfjnCa//SZm1l7v
	/A2zX3WV6r7zTfV6xxoEmDY2Q+WcH3jewvm9Gz0kG06WN8iGXr3wzaEMHP7jgplR
	dCSbO3/7GQpaAEuao7ctWc9n1A5rWuAxtlmrM7woLBLjIQcGh+rOupxKa3b0QqjG
	bUsl8drjU4kSJarS4Yk1qBop1p4Mn4Mm4raWTagnoOlYYyxg8qYP1uPJHkDEnxoE
	Q1E7RJWyI+glc508LNgMK3j1kdZCYv2x9O/FGORPILcOp0zDn/iS4WiQgMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc531br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dd3c3badbso650940785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326489; x=1791931289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F2EQswXZEUyFaiUxDqBndfVdwYFpc99v5q33IpvjJPk=;
        b=seidyYCR3Kax87ZJHSVPIGoRxilgz5MEbX4uHMua91yl6WRaEzyyrE0uIHxM+Oo09Q
         9Z5DCjNp1EcSxympzWokalmgY4IEnGfpV3pbrGpZWPewlo/QTF813Ejjk21kUCdQSIjr
         9a/dS9dEz41BBrDb+icrAtZIbf+rBx8aAvvYsdKMWhFjtMqPV2M4m0O2Dfo4oWoKUvnw
         P6n2WxdiZi9DRbV2cYkZD7CBfMYH1oJ0KwCZ1MAt/2i6Cy/rQyhyQxjvwUdn7J0MOtjV
         hWsI3ty96z1jOOaYr2g7Cgr8o+AeH5C0tRZJ/It9SZdI8kHSDW/NOYBszOq8K6eUi/Ip
         b/yA==
X-Forwarded-Encrypted: i=1; AKwUvBw3LhqbhXKf12mFBuOYhMC34LTtmaebgD3KXVaGmD1CpLuzpmk47ILUaO9Y5mRlc5lRcSn/yG4Vw9sVIHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lhJ9ZDX9I74KklaoQ9RSFyU+wIuq2S8NxQsZwPdT6eVoZ1hn3Q
	29ZxgihQbRs+4vUG8n3FqTl3tWBGPgIfuK8CNPYOgt+NJ6OhTfX0bTI7g3cdrICbJGiHvn0/VRr
	4gfuFiXzm7Ub7NMJz4mYNU5pnMUhbn4dgyClONEy5wx6IZ17eKJ+UXtQ2JkeVXseaJAc=
X-Gm-Gg: AYBFou0yG4LjSuLy53ughvvkPAUiII9UTGIiVdFDr9DwDoc4V1XrLkpa+jN3lRJl2nG
	rLldxcALXpIH/HyfQ1p70dkSVuNdQ0bjoe8cR7k0HnY/zp/5Zao98gwJjaS/quiA40C9DdJ3KmW
	z8qoZe25HTx0vlU+9fJ3qkNqOTrz1KbtqH/Yy/C3qw/xTb9cS3ZShvm/RGP3tEfQmtSPGO9elMV
	xLtwyHhZf71XvgdGZzOWYpu+q5UTotFsT5igtmfS4syBOoTHEO5b6xB9WEJQud/0KBYq+29Zuf7
	B1KAdqyryPrQJ+qDK4gjgzNDUvrtxkM+aYpVEfLxgF3cs4/vDtDnCeWfuE0=
X-Received: by 2002:a05:620a:1b99:b0:93c:c2c2:40eb with SMTP id af79cd13be357-93e9b874754mr72790485a.66.1791326488570;
        Tue, 06 Oct 2026 15:41:28 -0700 (PDT)
X-Received: by 2002:a05:620a:1b99:b0:93c:c2c2:40eb with SMTP id af79cd13be357-93e9b874754mr72785885a.66.1791326488123;
        Tue, 06 Oct 2026 15:41:28 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:27 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 32/45] media: qcom: camss: sa8775p: add IFE completion groups
Date: Wed,  7 Oct 2026 01:39:40 +0300
Message-Id: <20261006223953.3382273-33-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X5THu2Te c=1 sm=1 tr=0 ts=6ac57919 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=ObJCtLpMSD8GDJ5Gr7cA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXxhtvdwQ+QFiS
 v9FMbJCT1iZ5+fUV4sM+WicvwO9UQ13/jEGCUA5c35/c6NBHFkXGikfDqzQVdMSaV1B/ViZOWuF
 6Z4VshIBcJRE6B61BfuvOZTnzGqSgPY=
X-Proofpoint-GUID: bUrh1Ny2mIIlcStYLW7EhUbBtcr4ssxx
X-Proofpoint-ORIG-GUID: bUrh1Ny2mIIlcStYLW7EhUbBtcr4ssxx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX16g8UGjsYSCL
 +FHYY913LNfSZvxUgi2Rb89r/AZDUqhXomo30wKNwMqPO2gAiRFE6omLl3mVsar4ZC29v5vinZo
 AtHYF2HJeStEXHOMNRpDBRRdPXAPCJ9FfC36R5EwhPDIm/ozYQ5YJfb4/nuaWCG0lx5y+/BSHvh
 w3zxV/bjaaovMlPp42gvRMZcaGNtKb+F3YLPHQ6hmIywUcj1uLXpz3YMIjXJ0GSRxC0I6eWOfyZ
 t8nNikJDMO0cD8LDVDLvNqi5f2rm7awWPLpxRUGNKRvjRAz3yWRFqp+RcmyROnovpbFce+ELdpQ
 y0C7vZa9SRHn14iqkuGMonOm2DEXLwSDUuVe65YVcE9Vs7l34YYUsTXMNZB6U9i/Q08UEnvbFSX
 d/0kPOYgznQkmVoss2CXq62J0W/VFDLusEcWutPudP3TrQnTBfemgagcG7nzMR1s+g9rxfCWmC2
 1SUqUGYKldKIGJhXcYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe the SA8775P completion groups and statistics output.

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

