Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402337;
	b=gUzvfjkaTjJ0S+lJmBdBSfoOaaP4cEZLnIiph7LNSshDm+8PMmE5o7hUMngAQ9GvW90e
	 fHYRc/yTpmvTjm6nVSFSJCNtLG+7pddR6BbTciTI2//E/CBEDaBVjk2VRRaxOL22ErIO/
	 lHhCz4vdQtnpjMSiwPeav7lY2/spBTyi/a2HvWzTZ3qO94vlijqk6SZVkIGvoAoOfkOJU
	 +m8Wr9+LbK1BcTWBRX93FjHDF5vcAMcuuy7uF6mwZFtvKQ4nHLCfo46lJ9LeJv5RUzckn
	 SFN2t7vS3k4Z07iqMsV8KptOZIxs/tspVBJizv0iCsRlNJl6hgrmgHmFX3gTp1LlxTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hDLeoRycWT9SktFPdwCLoZ37ME2W+Lxacb6xfAmuc+I=;
	b=zUPhsOI6eKaooRq4jVdB9ws6TPLtGY7XtXCAMmAH/aGiSVPqjOP4vmOpS7KQpvbXuW/+
	 B7/q2YRkiqLYwxGWW3l9OlAaa0SPWlzsMRXx3DhQTa/4/hv4D7uk+/Ud4MHrIi+uxwOuI
	 ExBpNcv0CrDSrJanGfTK+MjYMTs0wZ4QBSM1+1X0F1weCgalZkK/bRvyHjBZsFVYyogOS
	 7MUq+FbBJg//K95q6YfERH+3yYu7WCUh/Cy6v2UvUbeUoOCDwjlhyWHFuRJuVz1iAc0Sl
	 8amqpLnHn/83S5/hZKIdEYXOO3IziSbulRFE+TRDhkFa+j+iu34iTD5Qpp+YaXlvDgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mge3O4Cw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="FkcWPml/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A043606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A043606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mge3O4Cw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FkcWPml/
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZMo4708112
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDLeoRycWT9SktFPdwCLoZ37ME2W+Lxacb6xfAmuc+I=; b=Mge3O4CwSJkvft/M
	0oULLG3uxOE3oRd9OmqHOc6ZLnVhTNWkBctwmxVN1uEjgcR5GeY6h7EVMbRahlm6
	E5aCb0iW840dXFUSH0TmnYRAgtuf2iVUovfsdy/Fw50fOqWy0YIyUqRmmgzh+YEM
	DA5UvugwCKzvfMQxRKoLf283EVC4NQrKqeS5yl9hsOd5ThOYbzxF/nXyZ8FtADfm
	hTzHFV0Ufopkxf22HKBdlHrJ8UleYb1fqWe5TXSzTST6xWIhsfnChWJZVKbCJGJ6
	pam1beh7NBu6e1pJ9NS4IRbt99jfIokbhAu63j5Pi6otuSyowaOxoPsJhQIVsjFB
	zfLeWw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b33m9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:05:35 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-999bc06bfd0so2217510241.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402335; x=1795007135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDLeoRycWT9SktFPdwCLoZ37ME2W+Lxacb6xfAmuc+I=;
        b=FkcWPml/MyXGx4siWcLpo8fEfQWFuW6V8WU3xuJWi6ZENtK7PsZbZC/OOSztI9mI+0
         0khbTwz2lOsmv/E+bW3AD4DMYGiUbqX5gZcjjalPdSuIWNH5XHKLbuTj3XPe+/Gu7lwW
         CHYO/UCkUUGJiXl0G2NxYWzqZTVw+1BHJV59eKTwkDHfP7v8r39Z5TDUsGuIgY/Wh5i6
         ATU+WfSW68VPLDcGCXEQvxJbzCQPrX3bR05Ry06sF9x4uRzslZ5w/ldf/M2BLcWE0BNc
         GI9Q77Cegk2ivrt1SBek+Whr+qOSz++i3ANc1/DCc1hpsl+oQVkVvgOj6eKzwbGFDvPm
         YX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402335; x=1795007135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDLeoRycWT9SktFPdwCLoZ37ME2W+Lxacb6xfAmuc+I=;
        b=1p+dVHGSB4VaPwpbmHKEchLbM8+ib9tH2/7ZYGiOhbsAir4aR5Npo837taCIpobR09
         X7xPQthLTBfVQNl2p1HyI8ULBS2XmQ54Gz15uevN1BwYHoeqBXojd+pVKAFwb/1fjjj7
         pEAhJPNtYZ4/7tkk1kmPRcfQQwIpw6lasdKHXer+LKr45TRB7elVdPqFptdhBAJmgpNO
         CBA1Wj1kEOwrBYRSm8feS/RtTcWO3YgKh2BU3y5DR3N9337d1qNnLV9+60glGQPJsdAg
         bBl/mIOaETklXXz8UwfaspT8KhvEkfb+X6VQ7keHTag/4Yf6ttJVCbF6TLZdZUFqUlS5
         wL6g==
X-Forwarded-Encrypted: i=1; AL+hErF7Cnqo7gxjYPGtgpd/QIK6IXlstNZK3RKQiSH9AikZXSRjDVHD6gwvHQCac/s13kvUWoVWtxPY8ZuQCp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9+iKeGzRK9d7TfHVF1+16+/pzgqHNF3PG2NWbQ/APa0FGFOmx
	sCW2KXpMmV9m0gwFbYmFTs0/RCL09YFdjEygy/b6FKbXCzfAR0tjd0D+zF8mYzY5Zl2L4FPuKbY
	3SWdY5qQZyKd0DVxvM2e4pzb+qWTP/y/Rbj+7r+aF4U1ShAheMKg62BDM9AavzQKlWzvfm+g/wz
	Y=
X-Gm-Gg: AYBFou1ZoSBielghLxsfOoS1Hz2mAJudc5bTf9v6Jfa7eM9NIJVzXBp4H6k8mX1A+X/
	xyYGZkMjWw+ViMXF6m+7dygusybqRVGFnNa5eo6es7sFIsaF8anFwhKrjuY/zIGpvPHF2VLqDVW
	ar7X73ChYO1zjOF1FhnItO+aW5xaInwFjSOPwzPs55OtcS0Mg2zdFX7L+RHepIVssURizVy0h02
	5iQ/m+ynQT+hhyEr+zUgGgi+XLXi7qWPLRLLyrdYRF+2sI28ceQoPdNYolpgNHny3IztyJP4va4
	NuPbntaRCBNcYBa4IVYyNTObHPbbjbdsz4S56QP1HNzRJkV6VLwAY6h4DG5Qx6ZlAREacGfz1r7
	o9pMNvyfl6yYdiNiJhfPo4TgOi5a3khBIyaA9DfFo02PGQX+1kuEn0sD3z47SBB7z1FtUx9EORg
	zwfp2vCHbZZUH0FVt/jCxL/IeYBsLXo15PHEJIFjO/MSyczbFyJyhprk7ezpWCSQ==
X-Received: by 2002:a05:6122:6b8d:20b0:5ea:dc36:245b with SMTP id 71dfb90a1353d-5ee1c474bc8mr607059e0c.18.1794402334778;
        Wed, 11 Nov 2026 05:05:34 -0800 (PST)
X-Received: by 2002:a05:6122:6b8d:20b0:5ea:dc36:245b with SMTP id 71dfb90a1353d-5ee1c474bc8mr607007e0c.18.1794402334231;
        Wed, 11 Nov 2026 05:05:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15d368e81sm391858e87.21.2026.11.11.05.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:05:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 15:05:14 +0200
Subject: [PATCH 1/3] drm/msm/a3xx: report CP protected mode faults
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
Message-Id: <20261111-a3xx-fix-me-v1-1-d81f50f1ba1e@oss.qualcomm.com>
References: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
In-Reply-To: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Y+Iv8q+tsWXTJKMzXRLMGryRf3mAZDY044kGmA5Nag=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq9GgUTPifT2R98oLnAuweKYncAzC263DJMOnx9
 QaisRxcyIaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavRoFAAKCRCLPIo+Aiko
 1WaLB/sEAJNtbNDwO4OauPCLF+uCRNRvoFmLZFRL7gSi57adZOlEkNx+JKqvx9S+op/InytelPD
 zjekmDD8voqBhuE5S1cl4OeGWPSXUOg5y2anGXeAd59Ti32LUWq4kbvSkIqtsxL9cFewnlAPMGx
 2JLzspBz2ZcIvMORoAKhyv4YiflsYOzq9vNS00bySGQqufZHJrKWBrQi7AvChRHsekN8lZBNejn
 IgDu8/mL/lWbPs6anNZ4aY1X5Ozvaf4Okg9HsIzpKooSLbg1+wzpyykMY+RvAeP1StAZJ1f7eRO
 XqmO0SQ303J+I5Wx2lIJgaHw+4lBz6/B/YLTkLuP+R6hWRfV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af4681f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=0SDkzDXPlMfVP_Iu0jUA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX+jrLREPlPV8d
 qsZU85fvi4sNzvDNWfXBgFmxqJ7/jZ8dhEcxtfMrvaaLBkojEr8uU6nodKFcv4XoHtZs6nfI+LB
 Iv8NkxMmTijrG9MlDiMFUgyENLOtHVD6mv+XVS3AWaO7YWNqi/x6mgwmhqcc7sdDs75hr7mLgi6
 7lceONPHyGtC95beldL6mZRwl9AHnrRxXuXC+sdilOtZ1Cti2H5fRcjSjcPM65tQopzOlunmBjH
 Dxs1JYKlQfEPlq3Q2GhjhiqYr3q22lLIdO0BhjJG1ynVSXK3anjOJHRyNmOJlf+acL5AjBBdIcD
 aB6HdJhoiqN1sQFAc58OkbY3Gzuk/06OGkaK/xvArf0YYz8ovk49WncQsALM2tJp9bzbpLQh8Zl
 vGLaiTLQdv7q9hgO//UL1yyPD2th95f8HGqP2/OOB9PwhbjZttCSQy46e4Ou0AE5VhEC8wdTPD1
 866pkb7HpbkD0RTV+Jg==
X-Proofpoint-GUID: cSaP45OPwqDrnUUpNIFL6TUHuoYmDIxf
X-Proofpoint-ORIG-GUID: cSaP45OPwqDrnUUpNIFL6TUHuoYmDIxf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX6BPigbtPc6uA
 j1qdvSzcyKrNTwFkmspjYhMNjwS9MxyziTim6nhRxDbVmQsZf9WWai+uqhX6/zdeYDMjRTT1yJW
 NpFsxObU/4i4brq7KOnEd3prmn5MSUE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

a3xx_irq() acks every interrupt without looking at it, so a write to a
protected register shows up only as a hangcheck timeout with no hint of
which register was hit. Print the faulting address the way a4xx and a5xx
already do.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 160d302e16a3..7e03b7305493 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -419,7 +419,14 @@ static irqreturn_t a3xx_irq(struct msm_gpu *gpu)
 	status = gpu_read(gpu, REG_A3XX_RBBM_INT_0_STATUS);
 	DBG("%s: %08x", gpu->name, status);
 
-	// TODO
+	if (status & A3XX_INT0_CP_REG_PROTECT_FAULT) {
+		u32 val = gpu_read(gpu, REG_A3XX_CP_PROTECT_STATUS);
+
+		dev_err_ratelimited(gpu->dev->dev,
+			"CP | protected mode error | %s | addr=0x%8.8X | status=0x%8.8X\n",
+			val & (1 << 24) ? "WRITE" : "READ",
+			(val & 0xFFFFF) >> 2, val);
+	}
 
 	gpu_write(gpu, REG_A3XX_RBBM_INT_CLEAR_CMD, status);
 

-- 
2.47.3

