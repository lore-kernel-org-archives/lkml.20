Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021862;
	b=smpDUCLKF0NmH71F6bB9SSue+90u1r8d66of/65A2l5MV1UUL1zONbTUKBGHRRyzF1TC
	 HTBIJ4kvysZDWTuDlBPcVN18Ojr2maoGidF6ZVPambP3BrtFuPk87WTkoYdAo9I7KrGxt
	 9wksQb300cexapwJ7IpNvgG3ru2Gx2UBoVwgjAVkuZxfqVJ0uGTyMoS38l8VnzJdNkbpQ
	 qyj2s+DJwj0hWCco626bzFEelUyPAX6UuR0mFOhlD+MdkEvoufMqCRhb3HnGeJNiHp7n1
	 I+FQT10Yl7V5kcnjL6SgD7bsXyKgRy4ooHjPqDk5xvT5xn/3/q1YouP1yaJGAdDQNuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RuRFymShgsilHwdTJCHghvu8/w7kYi6eDSMaIMLmBKI=;
	b=lFnTINyjCeza2MfJxTX0MyYiyvMEYph1mmlL9NeTvv5yG4aiPcnmRnUDP8Y2eVklaejR
	 R2j4XPDd9tDtQkPt5dAdWFbOrIRfKG53IZ6/Q3DGP9dVIan0GGj2l+bXPF+DUQWW7paWu
	 dP4M2aXMQuZ7LuvCSWoxzBtPlxRGlSWrfc/BbF9wqAf8JZUVnmvS+/z+9Athy7jGTyyOL
	 RsqGfsbGzkc2biyCdhg4vSnMixLSL3saxXe7Kk6fDOEfrf0vjLHxTQFK6PswuWh3dehzx
	 mdqJKQ5dNcVzz3cYNVX7v3OHhdaCHFH35Eymdv4U8a3qMY3eJYoO/EdmKKBjdjb6RJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cBb+Js1J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uq5BcEw2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF5D6072CCD
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF5D6072CCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cBb+Js1J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uq5BcEw2
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtKof2541824
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RuRFymShgsi
	lHwdTJCHghvu8/w7kYi6eDSMaIMLmBKI=; b=cBb+Js1Jgge4rwa4NlyBBYDN+I8
	3hfWHZe3O2TgATdMd/pJfZLA1UmEPDgdjAz3slyXXnK0jMu9SM9lNpnN1xDC1oOm
	rUoCKjBykCiOF5T2RnX16yQWjQ4jk4TG/mZtpozeHt+o7zqxUyY6t6Ig0MbUCqKM
	4qmmc9c88rCWcjSGYdbn4VgkTjpzxLmyNpUS+8W8g5JnbHWs/KdGehkR+MgYEWdB
	WI9tdK32Uw9VQq1hl2w2+zTDv4n8WNQy153L46qO47bVpHARDzscPFrWn2c5NIzQ
	I+idRdcPp5A5Fkx1gp5ief3FV40bNoGCNB0YIaOLL+xP5LejWq0T/jIgT5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdanrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5364605e74bso47979101cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021861; x=1793626661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RuRFymShgsilHwdTJCHghvu8/w7kYi6eDSMaIMLmBKI=;
        b=Uq5BcEw2rdrYvjKRHHdBvR7cj7rPh9PM1HQgSGGX2Qk9anwQ2mmabb4W1QrbkFwwaV
         No3e5+dI5ysq0L2ylk9/BXFypaK3D9R7p8sO49wuGV2RMfuC9W1tRJTf7kBn5UUavug8
         6aWNKnggoP5y8Vih4tG+803u90mV8Gghg/LwdX8XTgIiihx19pquB0kwQb+liIi1nUCN
         c/hlt8IJKsom7dNb/F1UgrET+p4tUh58KwJzZ+izVeFDUvM4ZufSigB3tamlJfdZhG6c
         tbSOpuAHCYAfvzjJpvCLYUf/8/26+8vxGMHuCZ2RbGpbZ7AB3AfFMOaYcKa3Uuet7MyC
         gYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021861; x=1793626661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RuRFymShgsilHwdTJCHghvu8/w7kYi6eDSMaIMLmBKI=;
        b=P/meN9fAdeAGVOY3tOPlS12PveCqhh1/Cdzqrb5CvXyLjBhU3oA/Vh5LNpS94FROjb
         dKqtJua5HRP6I8xpdN9QPyckDnENjmuT0hYXBOodpacG61AeCT2+bTVkwIroEc9z9TDR
         ZamZGdtnN6YyrVq6JdtPcSCIyuized29NNY1vLE5NncKcvIhAbR3XtMhlgGH5C5pDhTK
         9k06hjinCM1iN98swl0XuYk9u1lZnHApHp5leZJD05nPNeKx3jkbW1deRzYDv3JZfXdY
         RKgRWjPnXUW8t5AY2/IY8MUfR9AeASnN9vMpIUfSyoJhoQh8fHRPcuozTTSzq99u7wax
         IbjQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4GMzfhro1aYTDwyRorPCLthr88exocCREgmSSUTqtvo6Aq4EQ4HG/cXAh10ixzkaXjJqGlajzd6klcGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjipKrJLbh3pP3SiFCbXPEw90IieD53sOSUOfgYn7gQBgrZhgH
	b2nhdsY3VxjaGVbEBzDl0xg8zBe0hN6EASIN1Za8F7XHPr06X+eKchvoEBxA22sBIxiFRJCm7/4
	Jw6hoTpcTR2j3cB2XSSZTdt85xyWSty7aRlWW6L9VeLvmcsLZNAKrrga5v6DEbHeLbJ5hm2DHIY
	aBlg==
X-Gm-Gg: AYBFou3xEBZxUBpz3pYBT7Q5WBD68WZClx9v+sIyqbXtF8QqBeOGys1qsK7+5x+WpZT
	KTAShg6kuIXH1TZ2hEkh/QdMND3N6j3C3/NSbnHH2MvewCKc3weJkvvEkGhPuTVM91ZNZ7y2n5H
	75c/Lywi9uIMDR9d4BHnzTViKbFapphDTG6LCX0fNy49aNtm5AVsTHOC1gSjXdgBzCmzrPZ26gM
	xCVFjvaneRXZIipCfGHAxJlevYCogftWXBeEkAN0vkBbxo9SgpBwDhXPas1/O8zPsk021oBvHfZ
	KXN9+rGHJvI6QHZK8aMzY4+1REVR1eAOYGuW/5CqxPybVSyQ2gDdak0WCopv/g8gDYIlOjlLEjo
	1zDDC6sN3AAE8xFDtNm9eZ2He
X-Received: by 2002:a05:620a:46a4:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-940ef8c944cmr1071686785a.34.1793021860732;
        Mon, 26 Oct 2026 06:37:40 -0700 (PDT)
X-Received: by 2002:a05:620a:46a4:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-940ef8c944cmr1071681385a.34.1793021860265;
        Mon, 26 Oct 2026 06:37:40 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm15376512f8f.3.2026.10.26.06.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:39 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
Date: Mon, 26 Oct 2026 15:37:25 +0200
Message-Id: <20261026133726.3249235-6-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DhM17os5-byC9jPPCbfd2Pre2IRvafCw
X-Proofpoint-GUID: DhM17os5-byC9jPPCbfd2Pre2IRvafCw
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf57a5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QxXRlGHHTI4QcL78iLwA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX9aW4UIX/Kero
 tOA5iD+jzpIxwYISBAcIynKiNmHu04/R2I9d0vFjcNPUwPxFbukX1Yz7LqfmF2tmKIZXCGtqfMC
 l8HIofRubuFbayaIy+umaWtobCmjtmM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfXyIWV9/Ly62qT
 Tz9FdtpphhE8+C52LfUtW3vBhXwaU6PRsSsroKQgpfC0zIxj0HuT/g0k322p+cNEmT9lNlfUTes
 IdAkuN19uOLuHSwGN5z/Ae96aVrK9JQD7DobkDU6MT2mRCgBONvl6LyjIlSCGIh2BUQIQdfRcao
 PUkNFU+7T8/S6XPVeA/3JQVBd/3z5kBxHzM6GrANKafJLJoOIr7RlHORQmrer1EdvYbKQgrm4l6
 b8NgrBtIq6od4MCI0lyGBVHwFY6EDrTHelH0MK3YYAcapS8smjEQVGz1b7cPXrucVLRaDu8mJDo
 fUPDmTxL60rRafrmH8uoNYpnrSS9oPExTbYv0YIVx0msk6mkjoY0Wbr8xo4FuKE5vXB5w6+MQRe
 WY07xnrV7ou8wMj9oABVsb6ef8Fu89CTsmqoV9UDSPvVDxW1mXwLueUxSYGNaEBlSrsiZ4DjTwg
 OuxJUjD+0V3NNS7Gisg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260054

The SM8250 VFE AREG clock lists four rates, 100, 200, 300 and 400 MHz,
in both the VFE and the CSID resources. The VFE only enables it, as
vfe_match_clock_names() does not match the AREG clock name, so its rate
is set by the CSID, which always selects the lowest one.

Match the VFE AREG clock in vfe_match_clock_names(), list a single
400 MHz rate for it and drop its levels from the CSID resources. The
AREG clocks of VFE0 and VFE1 are separate clocks on the fast AHB
source, so a fixed rate keeps one VFE from lowering it under the other.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 +++
 drivers/media/platform/qcom/camss/camss.c     | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 30504e614e4b..d38491a845d8 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -907,12 +907,15 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 {
 	char vfe_name[7]; /* vfeXXX\0 */
 	char vfe_lite_name[12]; /* vfe_liteXXX\0 */
+	char vfe_areg_name[12]; /* vfeXXX_areg\0 */
 
 	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
 	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);
+	snprintf(vfe_areg_name, sizeof(vfe_areg_name), "vfe%d_areg", vfe->id);
 
 	return (!strcmp(clock->name, vfe_name) ||
 		!strcmp(clock->name, vfe_lite_name) ||
+		!strcmp(clock->name, vfe_areg_name) ||
 		!strcmp(clock->name, "vfe_lite") ||
 		!strcmp(clock->name, "camnoc_axi") ||
 		!strcmp(clock->name, "camnoc_rt_axi"));
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 80eab898611d..911ceb7202ab 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2053,7 +2053,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
@@ -2070,7 +2070,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
@@ -2128,7 +2128,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 19200000 },
 				{ 0 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
 				{ 0 },
 				{ 0 } },
@@ -2154,7 +2154,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 19200000 },
 				{ 0 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
 				{ 0 },
 				{ 0 } },
-- 
2.34.1

