Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451264D5984
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061606; cv=none; b=h9/Jgrt7/sP/r0o0XjznOfM9Cxl6BJ5R0L40aZDUq33YOCTwlaodnx9oeDvwnfwH51PBVs3SseFDxtOJ4fnpY7IhYc5mrWlqU/wsb6Syyd8A/+UUsic0/HGFj9bycrqI/8jywNh80L7SB7nzWo2TTbBP7QssC3BUzb4eKA8xc6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061606; c=relaxed/simple;
	bh=UIeF/uFE/u6rU0favTCVtO6maO6d9vtYbeitGGcwU7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2N23zfwzn6+Hm0IvTidn3zQmCCAEqWiciMshMDS9wxqaxiJ/xAEC6ijKJ+43WFpdpsOs67ikgEubTLYx82aZqOQFFSFduoOk63IVoryrt1o1ml1PfWzITwmfHGMjsrRxJaxNDUdv91MdluhP7t+a4qUG1ny1vm5RXbtjkCZtG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rgmv0+bS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsIGr7+s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rgmv0+bS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsIGr7+s"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jSHr2662649
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngvKecSq/oAhQCBlhYYeePQN6SeoGA1j9720R8Z3F3A=; b=Rgmv0+bSgUP/CxCG
	hEsYbUb38u9dIXuwC9lRveX69BMA2+y7fY47+wrw61b0RsQkaCqpUWWkgvtPGl5h
	8H0DCX/fSAyWiVg4WI2DDM4u/JNk0lEZoiGezrkGKdr5G5OI0IV4Xht5jXFLw3PJ
	7ChjMvq+gM0mtfUJXci41wtQ+KtURMGB6EGI4hHk+du0nSYcEM3Ph1y4gtknPDyJ
	xNA5ivkAnXPpEqn/CrA+QEn3aPCItBeIu6T19LkFRc1hhPiiQHv99K2thRj/19TB
	WeMf8RXyNWhF80dNE+6PT9mZfFQyPqAtPopRbNXnsM3IFS/pU9A+zZqZhCneMFzO
	VS3dgw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda1n18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:53:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d02df2bf09so42711785ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061590; x=1792666390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngvKecSq/oAhQCBlhYYeePQN6SeoGA1j9720R8Z3F3A=;
        b=QsIGr7+sWGKTagOumsOB65U8ypOEDT+I0xhMfmuYGckIPuLbwCBY1zQewuBvZAAygH
         /kuwboZ3iY38ELE8jVbyNTV1uL717Ec7BCGebwNu/txjC7Ay9JL4xPMtaPxfzT7HP1oT
         2Pxu/gLpS7JuiJNNSrE4W2d82AbBRm5s0Oo5HzqBrhYEfdNwPLWE89EwSkXe6i55+F4/
         xvxDYdYFcNndcE+8XqEZCS+Snxu1G8caYXRmwI+w4blTdW+lOaEjbJ8CwjEiqRHjQqFv
         dtDkatLkEk7pVNvCfNV/t4xuwPYuMNOiXtB51nLpLIwlVY1tyzv9RG4urDd7fIQ1z+Ma
         9FBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061590; x=1792666390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngvKecSq/oAhQCBlhYYeePQN6SeoGA1j9720R8Z3F3A=;
        b=exnhsj1CWcsjRHZQKLoXaqhtwGs0sV7kiGYogyqQO0xfv7YMD7YgMR4gUnMeXG305J
         Kb0nPC0FhZmcC0N0pmbh83lgOT1wWv0MkjAUK2QoGPsGwg3229NcdkyY5U5qO209EKap
         fKDdP+pQS4y2czpoJyBzwP1At0cjtUMDGfE9lyPQkngQO7p/qy2ozK59bDfKxb9zAtBi
         yIlklE2IRvgwmnjcBEh69MtIoLxPpjFT3X7rTy4JR9ro3CuLcz+/7gcSFso2a5pOMMEc
         +3Pv0gXUeFsBTsqlnaAzfjQ7ssl392Q6/kJZU1zKZ0fOUoMRUvJXUHWA88SpX//lIQyb
         ColQ==
X-Forwarded-Encrypted: i=1; AKwUvBwU0pJVA8L2FjhbZYpDLv9tiTjBlfsCt5n0K3qTN9gTAe7dRl0wxR99zaxxPgqEDNp7eT61eCPqQjIn8eM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb+e7tt3QAOnWU9sfYVXEKetoC8pHQ66lWKOg0ueJaKmRrWtfq
	4xPhh3CaucDUgHqBAmIkzZkNMU90gc6yNsScCLp6udSLgwhHrhyYUq4ac1rnu33/beVe+ryzW6E
	hANtLlGFS0KF49DWjNk7ZZPvk9GJy/31inqcVl6wcgg+6aCaWX25MazGhBBm5XHXgsko=
X-Gm-Gg: AYBFou0+4UWjTr8eQb/Upg0Avo2anpw95Nfa+DdwvjEg8L/wQ/AcDusgBbe3J8T64Ot
	YCZse7f8iVIXqiqjZ8V+a+yhjlx7wCmDB5aNKpEhq1ToOoEVwYL3MsvynH2vhcQUofR1c2xneQ/
	9FaAsXAGev2m/evwS5Jsj6gk1rUrAiWUNLCPivnOYs3XG36DrjTE5zxTwwFU+v0MDmDSLSuNrkJ
	MDT7RP2lcgNL+uuZ9br2+yh7mKf4UJgQdTfaLvYde4H1JhTnpOp1gKGSu2qDq0DoXfSlWUpkibC
	Mi0BoMt5VVBed0q6Ti/6fUWYcQ0RkscQUD4sBTbvQ34Pk4j4e6jSMzHmekSbxRBMXNX+FCEyx/M
	Xry8IFy42Vhw8T29sZRcLNEo4m6NKWw==
X-Received: by 2002:a17:903:2f91:b0:2e8:b20a:88cf with SMTP id d9443c01a7336-2e8b20a8a88mr105055105ad.11.1792061589849;
        Thu, 15 Oct 2026 03:53:09 -0700 (PDT)
X-Received: by 2002:a17:903:2f91:b0:2e8:b20a:88cf with SMTP id d9443c01a7336-2e8b20a8a88mr105054855ad.11.1792061589334;
        Thu, 15 Oct 2026 03:53:09 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95013dafdsm12770465ad.42.2026.10.15.03.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:53:09 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:22:31 +0530
Subject: [PATCH v2 6/6] arm64: defconfig: Enable OV08X40 camera sensor
 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur_camss_dts-v2-6-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061551; l=715;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=UIeF/uFE/u6rU0favTCVtO6maO6d9vtYbeitGGcwU7k=;
 b=V5WOWOVNAffWw8BYm3GDswhcihws1NuZbLJrM0BKGBJuOSv+3VfR9SSoMTRk5KdBTcd2VFz4+
 uQL21vt9F9sATBUEz70EkYJT0VJO++HTauBJ0ZsugsMSvrxmw07Iu8A
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfXzxDeQfz9pQXT
 UAr1AnDCKqKMdsunYVog8b0eg9kpHH3cO5hoLjLK2m5t7ohWahjkSno/QMvBdeo7svplgiPQJ6c
 mubx4ssR62dfi9jTxNxf24YyjT0YDz8=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0b096 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WSFeanDOTqpEkpu4Xu4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: rESGf0y22l8_y0dIOFA85AQDL7Y1wyEJ
X-Proofpoint-ORIG-GUID: rESGf0y22l8_y0dIOFA85AQDL7Y1wyEJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX8f0qbNow8Dx1
 er5iaPYLyHL3VoZ/a8WSA1keWxNcCa+txQS+sSh1OYN53kB7NwDeG5wfm+ZdJDKp8DHbcWMsH6q
 hDI9TQ9Sf8KFnsszuLzxmOvMgYAftxoy2xcPHOeEZsMKsNH1eFu+3Wet6xf4phRSzSsJAnA/pIU
 rcPYZisjBI1qc3XYPb0U0dgX5nW1u/1yq2K04n66BcwES4SDa/GChg1NqCLFYO0Wz3rsB8hZyvW
 wQsi4AwfgQMpw2iDtgGLpjfpEDwvILZ3phwl7iXOGG8jZTBIeeQyQIgCYAdoFt9KiX0QfTMrzQ6
 Zz4EPcMb+sVDsOA70YIAoHrBWIyTbLLsZ1ah4rSQ2Oj90I5ipBlCV5zPXXokA+TnO7gx78ARzTn
 ArI2X+Ed3I7muV/LTk+/CBPX+g86hzkYjkMPkoJlvaaGIH7U7YslyqUz6BELbVnHfgmt4w6TycH
 lXLPHgKjJfVzTRXrxfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

Enable the OV08X40 driver, which is used as the camera sensor on the
Qualcomm Glymur CRD.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c440c7912f0a24665bdb7010d9e4..7c0926c8ebcb3138ea965f879476000951dac432 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -965,6 +965,7 @@ CONFIG_VIDEO_TI_J721E_CSI2RX=m
 CONFIG_VIDEO_HANTRO=m
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_IMX412=m
+CONFIG_VIDEO_OV08X40=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m

-- 
2.34.1

