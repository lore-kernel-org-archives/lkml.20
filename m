Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB3455D873
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790118395; cv=none; b=FN+2w4u32tKRUcz/4FwZsLre0j0key7DE3WKvEnp4QQShUHJwLRGyMRBHOaabh/G2yiOZNKU8urcKZxX3/1m1Jsy7F7PC5RN5xJV+WZMBBZ4G6alx3xwMjKWqdXIwqoXog7W9KyQuTgkjWuUGqourC7UX9bhA0WTF4UJ06EZaLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790118395; c=relaxed/simple;
	bh=xHwgCpYLu0si4Pfes3zqvjcu+Ip84iYvwtsZMW4bY3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lvmMnvXj7ZJHq6ApJkV0tNVRr0THOH76+maWjHKJE20M69/o0G0yvWOoyZHzlM5wilSKrtW0v0hMmbzlwOVshDS9Wo2tRzavav8PXDiJ+3rByMxiszcl9ASNrC6gUzQqt+tqrMozD7RdhRqGlS3k1VD/1KCsYgtOzqZ1GMxNvok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/z//zjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ea7c2PNW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/z//zjE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ea7c2PNW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI70Li1873483
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vjll4+6S3K7UaA5Jfvs9SMPlp+iGGexPGe5YOA6lo2M=; b=P/z//zjENHGpZJfu
	4HWAIomuYvEbYpl9VuWVfsy3PIpAPZ+Q28VfAbPjeTkljfHIC1I0vogDQWxANei2
	u70KF8/3sOvr6DkcxyWRZf4E+dtUCf/JK1JKUE35jMh7GwHX7T2JZJNufr7rHiEp
	GIdypWwj0YyLmOBz26y3/G2eOVJ2Cz+/DJeoC6Ej6BCPqqsV5aZJ++4j4f5iBSix
	ohwCoYX5r/4bFljov1A1JiMbY0A2K0QSq2MKBinSpsnAO9RwxfdHBbNXD/VJkUjt
	gG88OoWg68yB1lFoyUjdsiNGcjj6HQQKLAEP78na/JbVIdTSpNLUlhxO6GhJfqrV
	bO1Z4g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4uh67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:06:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so412116eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790118391; x=1790723191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjll4+6S3K7UaA5Jfvs9SMPlp+iGGexPGe5YOA6lo2M=;
        b=ea7c2PNWEscWFMLfcwBQlHuv6h+HLRvp1ZnDanzyAZYq3C8HfXE2gYCEnTa5K7yzFW
         fXRufmgwMipW87UOeiHH8Xt8aU5rzT9x7uNEdoOgFS2g++R6/UdAhQxfX68ORTCSer+7
         OrcKR5RJSJanteZwuGN8LpxnKbPNZqzQZRv+V6dVYkzbOFBFQZY91yTvOq5MJFrujvT6
         k4FcG6zGz8sSwXsDwrEfPjKucI9Mf224vS0hkFWbZiK5ENLmvyIr0Bv4bXXfUBCpRCyY
         KVKr8QC5P33PI8oGpfJIfBYl0jHz58ijpZb/5kKDFrjYvFq06CSeo4lMFM9MbBF/c2Hp
         Fyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790118391; x=1790723191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vjll4+6S3K7UaA5Jfvs9SMPlp+iGGexPGe5YOA6lo2M=;
        b=2vcSdQURrzOFlZJOGVqZBbv4qEh8oQPIyLcp4Bwh0sMpqmnboJp0T52MJ+TEWpjbqU
         kFjtWHnTNKODP9SAocAoharLRcFM5vknAzzy1S45S9BU8tjwNGQ3k344MLneBH+dzm6V
         +u+91FZdKZvSwQX5uboUwjzN+wUem4joUycxvD37rr9xg3KV4T9XeEJ8DVttgzHfa14E
         Yz7ghNtXAcuqkAbnMEcAGWH8UDv6n2X6YNzD8h2kuY9qP/ufcIKbdGHv34igUAYa5YPj
         NJxToTZPhYqIGI/YJmCcCbsym0bGGRE5wxZxLT56JoK9vx3suskZf+q3nJNAyyNj9ZTX
         1nSA==
X-Forwarded-Encrypted: i=1; AKwUvByvI2bqRqsrJvW39rZOTk4TgNy8B032vFodmbzkONnb7Q2XTQSx8E6+AH6gRLINcs2/kac7zMVR8G7l++I=@vger.kernel.org
X-Gm-Message-State: AFuF++npEGQgFRHw7kvslRF4l6UeAZmVVYJyPMLYSI9wx/wqxtQ0w+TV
	JmkS8EuX7Uo1VSwrk18nQcKENi7lDn+o5HRuzRZw/PjEnH1Kcnqm+0zbFF0zuM/Nct3ffPaxjY8
	N0nKZ0+OokDlfhNQtsrQtyg+jGKwFHTfRBYqtmJyT1VosOw5yytV2QR1DxRKcUGb3fyU=
X-Gm-Gg: AYBFou2iw+O2X6guYSFZPyNOTKGUyQIgZlbR/jWECW9KFw2qWntQa8DTbLHE6nt+2zX
	BvEOfqpLWSExV+VZ6jmnZfDYpwZUFffLRTArIC9Piy/3VsSVHLfX2PLYtD4IrSd/Hxd98HL79um
	sQxODKwheWXGP9Rle2DgI8/Y0Fkdm/Rtgdts9dbQKmf1TEyf3ByTF59Jg2ibEVpyGXODyY+sQk8
	d+d85oPCre9KC+aIT5ip/N2K8aVEJLc0iIcJGM1MNKD1lWI+wdM8uGllE6JBQ2UPuCZoX/5dz+m
	GfPb+15L1FxS8+aa9W0TtkvarefulldPhbNSEd395NUSxBW1bVrng/QV0XgXVz3BV54FLGW3h+T
	zv4/Om6y9af2/It4dMfGvT35tjd9SSloF5/qWdYgQ0nGHz//Www==
X-Received: by 2002:a05:7022:1582:b0:144:dfc1:9aa with SMTP id a92af1059eb24-144f91372a3mr1164193c88.10.1790118391051;
        Tue, 22 Sep 2026 16:06:31 -0700 (PDT)
X-Received: by 2002:a05:7022:1582:b0:144:dfc1:9aa with SMTP id a92af1059eb24-144f91372a3mr1164160c88.10.1790118390509;
        Tue, 22 Sep 2026 16:06:30 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm1737515c88.7.2026.09.22.16.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:06:29 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:06:20 -0700
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SM8950 SoC ID
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-maili-socinfo-v1-2-a82bd7d4ca77@oss.qualcomm.com>
References: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
In-Reply-To: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790118387; l=676;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=xHwgCpYLu0si4Pfes3zqvjcu+Ip84iYvwtsZMW4bY3I=;
 b=D4uXkpGQkgOT5eWB5mIWevK+4RcKk7vmgeixxpTyUIo0QQZhveu2Gubmq2+OnOvyV3TVdQWNi
 /7jHPaX6wegA3/7i1qxcnwZrTOI0Jcj4RJcmYk3fXud2h2sHKHY7JcQ
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX/J0wfVeVm2DV
 +BxkOnDDJ9NbDKzn+elnDL68Gk7FodQkf6m77zSbIGpkSBPeBl8DouWk/xZ52Qd4m6oH5fDVNUQ
 zJricPTpZrdGC55INEuI0eOVY1FczvFy8XPJAS6DyH+vjYeeRPyyjZShNmajwAEOnH0pd3qoLG3
 +jn9qce653cCf2uOng9S/tDzW7kk9cY0BSxLO+V9wI8jolGXCmiVZntedbdSSbAhDlpOuHo+agg
 q+r++EAcbEXomTucj8zAwCLXsVjxSBuIjgv3XhKMqXLHHn1R2F7rVLwSLhmpiHFkUuQeeR02O/4
 yliL2ieERx82hzwtSOIWqRLyyGiP0AQYhvVlG3Xhv2YGckgQNUWrf99R3YiV3sQXJ2do5DIU2Fs
 +KB+ES9Z6lNswtcV6mZK2Gd4XNM6ly8XTH3t1uNOoTP+LGFV6bhG31+rOHgViheYy9ocxNVP7vE
 RI86mwrfUf0T/CvxGXw==
X-Proofpoint-GUID: jTKg5UM6E1AlOWLghKHWzNTyxZOoLKP6
X-Proofpoint-ORIG-GUID: jTKg5UM6E1AlOWLghKHWzNTyxZOoLKP6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX8PTLKRlXYHba
 zmUiHp8VejgXLuCC27kuHK24VhWYqMn7qYRHvR7bsnUjyY44Rl3q8oR/TJPhS9Hklo9CGqXxOM7
 mgqGVtJGKrqr3eAwT2Ca9/TuBctGeO0=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab309f9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fbO9nyDmYvn0aybkFicA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220304

Add SoC ID for Qualcomm SM8950 which represents the Maili platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 63ee5cd561a2..2b4282863e72 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -544,6 +544,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SA8797P) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
+	{ qcom_board_id(SM8950) },
 	{ qcom_board_id(CQ2390M) },
 	{ qcom_board_id(CQ2390S) },
 	{ qcom_board_id(IQ2390S) },

-- 
2.34.1

