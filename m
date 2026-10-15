Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823884ED1AB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055748; cv=none; b=hFB0CGkFzLv8B1qEnj6bWjQw68ys/3+Y1RuMwahzx3sV2Yagl2/vCRmo78SGEoK//3Ye4U9BJFz3Yj4Proj+2LgoTEhmNbksu0ZQi289bbBlqU8MMIjJrJd/uSD3wau369nyiMuqotPeBzHbucMn35r0Lv5RPuqKdasbgQyu/zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055748; c=relaxed/simple;
	bh=GpdtqPuhIHgUo+XsjT0LPFpiwfUdMzHGUCn5RPhFeME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B6LJQs3D1AimE1tzkAUycXgq4OhXtaII4okrg0OM+H2Txqw7NYr2b45IFsCWIfWpN0Vu402Lk174azvMRjyCVLISYjDcTGmcOHd+gj6JL5BfAPEx83j9g8GTbFaTXq1uk6zsTmO+lTgHLXNeEcMGqysJwnzhRwcf6KlRDxhfDvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrxZav4m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FqLOqK1h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrxZav4m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FqLOqK1h"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7uWpb1707234
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGMnYlGXQieTtFbTjiko9Pi+37ioxPIws0R6S3kuKys=; b=OrxZav4mWEwsbSN9
	rGHR1DdvgyAxQwLgkCOyuBYejz1BpeKy46R8Wo6x83XGNX4Ud4TLeBx9G5lYepMZ
	XkddneI1OhLOqCLimpJtcIB8hd/kNXwAKHZ+lCuyHniwCW78D9EuQbQ0To8cA69p
	LfWbBZhS8ps/vMSoQIpLN+NpvH3xOlDYWDRlxvqs0yvDAHJWhF8I33eITGShVmwi
	pqIHt9UmMTXPsqKU1MiWn5eLyVAklvC+L3rD3IFUiR9sQJ+xyT4W2bIOzDSDvw6p
	v3XU0UCNKg9oCgtk3rlWYrxoSwD1uqDkdIRZ/TN/FvfU8JJuElNUDSQLDkiDLCEe
	4yRjOA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54sr12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:15:45 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso1348800c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055745; x=1792660545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGMnYlGXQieTtFbTjiko9Pi+37ioxPIws0R6S3kuKys=;
        b=FqLOqK1hpZ7k1trUs8XY5taiJL7bmAqb446PXS2Y460J/LAHfd+2IU647qoI5ITeJz
         CR7LtHucGLLCm4hsX3m2u63HGs1q9T90phjrb6KnYIoQIC2U2W3uZjn42tCKKyheLUVI
         KV8U1wqfULrkQYroda/hlsQYkwTB0cF3Bjjrfd+huTRHv94+NK0RPGtnD2AahJo09MGj
         FxBOHdmnHT+6h/dMvRcc2cI6RlHvldxceBbWmSFOSDA7CyVn1FVPKrLjZS5Y4GnEpUWZ
         qUInPFzTRRfRt1O80HdGd+uVNehi1aLGzkpcL99HVfoEDlc5lfPsDQ33Wzx5ZNCf6nf6
         M4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055745; x=1792660545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGMnYlGXQieTtFbTjiko9Pi+37ioxPIws0R6S3kuKys=;
        b=W4/e+8gyvTz8wA75BZ0GR0ILQKU1jnGOGKObnv+RGNV3SqIxjU5Byf/urgDRVHlMgl
         8P4GCYFWjsw9MuqMdOixKXZ/WrYMVj3Qd/9Ybwg9dAFg6woc27UxxQiAs8BxtzhCgApi
         v+SMnhoEJS9IU9XvwmLLDHJOSBWEF+7rRxvhnKZzcgbAgciXR+kCOHUhDQfLq3Df1QC0
         LEM70dlrgs/F44HzNmoLSxTTh4cXRLeLhY7Knm2AjTdVudjTBNHnuBWfqsXHp2C6isc+
         uIqm0Ghk/THWYMOcbxBqGZeVcFDFLMwUkHxQESL0fZRmm+xUjKpIXBsBR/qBQUfAO6PE
         hEBQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0gQYT6+XBkCq5q0iP87UZje50xuKYHBmRz76j4uYjlMSQl+6aH7iPnVpRBqBvrzhqPp9Qe9Gu4wKLLUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIykIs/i0HAorV3hMHqsoaNDToLGuVaU1tVqusnjhW0Yt6wOfF/
	kFQWBg2JfhHTox/lpjzZ7ol8bKZpcQEE+LCkoWwUAw6vcmDEem1WxoKy4oqDqa/4m163lAg0iuZ
	r+/mA6j6NxW9a5q1koFQhYA7DYTngIpfO2HiAfPQoCxhD6Sbag250JTlCZpiZ7T1tN9E=
X-Gm-Gg: AYBFou1GGLZLuMkTle3OO+PAX7IsJ+lc8Xwm6B567pMENoSSuCSDwM8Mr1HXJMADf7X
	EbCdQ8MNNndm7/gysILbr0iJ4IIz8MVQpFao4fFtYC8qfwDfdocR35kTvI8/Nj2psn383bQukkd
	mdnd/oEzTE71WahYi7QpVMjrqnsmP+SX3PAUwJ6zOrtbxFc114DmYckamNQj2QdlmD856SJzPdx
	WbVQfm8VjdhAqqtL4yYC1CbSe1BUh8n54rEpW6aFjk4CuWYNRfOOQpthsmFAY3H8FZnhNnJCBUk
	wb4PtfByVMcs62S0s+M+TTkvARv5LwoMzYC9AFS3ZfyDgmXwHu+qW3skaRxdmiF+QlV2FlF9K90
	lPWAgc8bRFzlL3j7LlbR8QdVdtQ==
X-Received: by 2002:a05:7023:a4d:20b0:14e:906f:9c8e with SMTP id a92af1059eb24-16a5ed3df0emr24935880c88.20.1792055744532;
        Thu, 15 Oct 2026 02:15:44 -0700 (PDT)
X-Received: by 2002:a05:7023:a4d:20b0:14e:906f:9c8e with SMTP id a92af1059eb24-16a5ed3df0emr24935824c88.20.1792055743537;
        Thu, 15 Oct 2026 02:15:43 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm19671658c88.6.2026.10.15.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:15:43 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:45:29 +0530
Subject: [PATCH v5 2/2] arm64: defconfig: Enable LT9611C bridge driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-shikra-work-v5-2-5e075222b60a@oss.qualcomm.com>
References: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
In-Reply-To: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792055731; l=859;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=GpdtqPuhIHgUo+XsjT0LPFpiwfUdMzHGUCn5RPhFeME=;
 b=14xHplB1bkeMuVzWZkw3U6O39JcudkxNuOezD3gXZhUH1cfQgYhKUCf7g70C1Jor5vnZMd4ua
 O2SZU3p1zdsBOeW3eHv5zhfhZP5ZAKHgiyGMYbWCdu4LKV2ex6pHORO
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad099c1 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TdSgRHaedGDaTSzhpQ4A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX1UOQo+uPQQJH
 ARYq1hMUbiSAirYlHNvEKn63zP0PRGQxfs+2FRPEKElMfvBrvco8ls5hzJ+UOiBWsIhgwAsbUg/
 gBEWgB8hgxke999cfY81eBYBsScVrt//KpQjeamaBQaCFuPSgWLphSsf/gTMaEd+qIxxUY9Ka31
 x4DVX4Kgd16mafzQReuN03w2b09P84x4MmWws4B2FsGSBWrZtCrw+kBuMtSUc3dPhhTYAbIsx8j
 mlX74fT5c5Ml4XU8QC0xJz3dnIE3P+g2Td0RwwxmkiSjxPAsUnt6jfVbwuXfcSbNu6HZop7LSWJ
 OLZMfIjn4IcRuoIRq72UTLOFyyszE++/i/h7G5GNv1FhXYuXPq9dTpIxJyrCNnfLKbH+7jti+I5
 GYVAvr/o+E//IIQNoumEDpJPEsIVN2ghD5LLAwccvvK8imqC6WfG9zIprQIAhm1UYi7RSDvA1aN
 tHOUN2Yncla/xeY8XWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXweyYDhxjs/Or
 kZIkfrp6Kv5pedFviAIkMCNyRReOb2rfe68ka8QRIc/7UEIJ70zh3WlJGtuX91kHIyvTMROGS4S
 BWi29oFi5VJ6/HWbDyUBCayXMPORx1U=
X-Proofpoint-GUID: N1hZSrs5NUPo-anupXloZGDSMNdQqSoM
X-Proofpoint-ORIG-GUID: N1hZSrs5NUPo-anupXloZGDSMNdQqSoM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

Enable the Lontium LT9611C(EX/UXD) DSI-to-HDMI bridge driver as a
module. The LT9611C family supports single or dual MIPI DSI input and
outputs HDMI, and is used on multiple ARM64 platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 65fcbbfc1601..d18f72e55330 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -977,6 +977,7 @@ CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
+CONFIG_DRM_LONTIUM_LT9611C=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_ITE_IT66121=m

-- 
2.34.1

