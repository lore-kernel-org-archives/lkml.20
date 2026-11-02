Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657080;
	b=GQpH5DNbO/ExCNR4mPeGGyqjy1iOwQDg6JpkXKqCCt9/eDNvQ5qZ+P1T1Z01IibDEYms
	 nG53A9qYtSr9/oedO1EhR7tcSZssY7Hpcb73ZHlbw+el43bD3ULvrnFlSt82lGnsSrYkP
	 zLQ9cgfjOSz9YCpqc1l4jr8OEdjeHQlhRZUUcJqHACmZPKflJlTvcEvF3S3FgzX4CIP4k
	 eozRjw/l/CH7I4ghNCm6ma+lTXmw7QfF2pH2yMOwtiDd7meKkP4wkijeBMlsE/l/0XHeV
	 UHxCVd73I6DlYUKR5UTl4fvG1f3lHFV7j0DjPvmHdxwIF7cF/8YoZkDt1oqPsaSlQHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KTqlhnQMr2NCQesTIo4IGBobCa+G+VXCAaqS3tav790=;
	b=jU/bYyPx4msKIh3qDQNR1LdDzSdo7XPBmrYySnaMGSMQzm4WPeUeGUEgAi2oRDLWFDY9
	 EzrRdWNwg1hAhU0Xedbos8DmDakd9/JsNUQNMScjT+T/vODexB56XLfThHKmXazTS/b0F
	 U5rfT2qCONtICEqbwDGoF1TR7eMKZD7HDuRb8KCYeb3jh0LhwkUgPQBRwe5T3/TyLmPdO
	 xAdJgcfzNsaTmm1ouolY4X125dAhPWQARRbwU1VyQXpeZ3WM6hJ9lFcXbv9kUJAmB9Rek
	 YXox6ox/yss5b0JVCvK7aaP9WQF18m6vxFnPGOYIQAO2ft0j+DeAh5NKwW8hnRrd4EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Dxqyh/3l";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MS/Dt2UK";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA24606D82E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA24606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dxqyh/3l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MS/Dt2UK
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K5xhS1696388
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 22:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KTqlhnQMr2N
	CQesTIo4IGBobCa+G+VXCAaqS3tav790=; b=Dxqyh/3l7LZuJED5FqhN1rlwzRI
	LV8tS+19UiXQK4HGEkDEvQskHuQgeXqFWk3O9Rr02nAYWMRLgcnVz9e5n59cCEj0
	A+Tv+9u8eZoz4ak/0GOb9G2MeyfLv5ZRv5y48817eRd5fZpG6G4DzAwxr3csVVqE
	+lDB1PaoTI8LUWdQLDSmPO8spJVKiDxeAvuykFv2B9DhTKWTyNFA406J/R1Bdcza
	eftG/WJSIE2xRJ+8eqYXIU8h1oCePK12OadW36kIG6MW+yeWXv9kJ64+G3K6N844
	NRVXvZ+P/gZvYwnZJIqv78Zi9XBbt5ouXMqslPITMeVEk4K13hxGoz33dqg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1uy0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:04:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so2070363a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657078; x=1794261878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTqlhnQMr2NCQesTIo4IGBobCa+G+VXCAaqS3tav790=;
        b=MS/Dt2UK4p+ujIIOoTIAwzrVAclYwh4ZYVQUr1QEx4HhUs1yz1o+CAoqH6uzf26gps
         tuFF2WJ9M7r5Cnc1yRFAEH/gN3K2yUF3+AbLhKDbCgUYv7oBTI3sbF8lOTGNKukO65Yi
         JfHjckb9cRIaYXwhu/yyM5vbx/rmE3Nfdl8EUiUJxtCPyylr+iYabp4dK5umdkdSsqW3
         hh7QKCmzmlaHEu2PqhAbOjpTo9dshlvL1+8VxrvXomh080s/xy3MOPld6nZdVn1zcXno
         YGkWa50L5qw0FfLvlWkqTgru5ajqU1it9VzjB9ActgWEq/cNvtEODeciZzcYxgT3cvY/
         ZIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657078; x=1794261878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTqlhnQMr2NCQesTIo4IGBobCa+G+VXCAaqS3tav790=;
        b=2ju3C9cwpjDYPHbugmPtXnmxho+N9Nu7L7+g7ugBQk+XT//R0+UqzA7P3I7qdXmHxa
         rHBRiQTHAL3SwdL1tp5ZSQxDcWPVWg+5iWZ2IfgAqUC1oBYLx1J3P6F2Bdgt1E70fmu4
         JFaQVdvmBR5KwZXOhlE6jgJx2+NCDAXrDNImcjUJiUvaemJaYWvO3bjrUntgUF54nCCL
         hoGxFGW1rpgTxb/+iZD8WYwlKV1EeuitUGKjjWygwqRZsHidgpuwAUQkkaDwd3TIgBin
         MW/lKYv3x1XaDFNrEGhpKKzmrWK24AxUFGPQGd2B6QHPfMuQNSZ/NpvVU4OnPyfTEsV4
         vDoA==
X-Forwarded-Encrypted: i=1; AKwUvByJ4rORUmnNk3fPgYO6IpSaaVitKb7FYqULOIs5EQIRx94xJwQ4ZrQfOe5SmF4b4/hRLyQ8chiOX4Ss7jY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfOST2iyBjYv2H8ZIMRU0l2UTPSiSBx7bXgnr+Kt7mizwBbInD
	M5O3nfEEe9KLHMg+N1x91RrRB7KxMgLvyUR7GM9lvBqOzwhfNNn5+PyoOGWMA7Kd4Dlvi442Lcr
	/8OcXh0t6jqNAX0d6tqm9AtS6r0A3jj/HSfEodbUmX8HM5FWm9bH9MfX2ScWJfcx68Jo=
X-Gm-Gg: AYBFou3nT8yMZsXtLVtgfRvFl6YcJMrioVMzpsHb0K5HDtnp6aiCd9P+SMqzCEG9eIv
	m0OYc4X6R5T7CDrUclwYTT88nEromwggk/XqvCLhwmAR3Lo9pbTI4zKDY0UQajbEheH2PIOOJw+
	m+AljrOgPKL6QOC2o+fx/kLv1UkDgqT9k5YJCxRlS+hidyKHv67gdVvx43MTeZDSdsvHkj6izHA
	J70Cwxg8z+jPSk9JcVfiKBsTPVA7k+g8zwOCWeiY2WYTrTuIAYBLxyQEkJPJgi21gaCSDq+xNjd
	7RJnhJy2NR+2GpwlRBxt2vdqnBM1oCzoqiQCuxks/AS4QQ4WXG+8bV/5BjWlyhySi2biuT21kaW
	wdb9kbjUTmZQWKoTz44xl09G1WUVtWYCUZE3d9qthpb3YEtSdp1FM+TzDvMhP8tXcBIdHw4liVy
	QB3nswO+aDJKLCh9mz2pv+Pg==
X-Received: by 2002:a05:6a20:e212:b0:3dd:85a8:4c57 with SMTP id adf61e73a8af0-3e928d43f88mr9437914637.30.1793657078550;
        Mon, 02 Nov 2026 14:04:38 -0800 (PST)
X-Received: by 2002:a05:6a20:e212:b0:3dd:85a8:4c57 with SMTP id adf61e73a8af0-3e928d43f88mr9437894637.30.1793657078108;
        Mon, 02 Nov 2026 14:04:38 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb36488892sm380786a12.19.2026.11.02.14.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:36 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 09/15] drm/msm/adreno: add temporary __maybe_unused
Date: Mon,  2 Nov 2026 14:02:53 -0800
Message-ID: <20261102220405.30730-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
References: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: LdcTYNLKEVBpjnkRfG-3f1Qaj9DBUuOp
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae908f7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX37TMCJyty+YO
 A9xENI6Gx44TO4iBxxltLTKq/tBqFlbhnP3f+nm4h8yP/2nQDFsOQibq1szwhtzj/MR3+gxfSgE
 HITtoV2k9+rV91PWE3iE+MqZPtZGgJazB/ln8642d6bhLeqSHrZp3dcDp/lWbnhrsWgj2HZAW1w
 HOWXN5VNM6VwjZ2E3cWO4IATYP9lMA+bEtOLdjtQ5cPHP9Q81wGUlNIfjiamh9diysE8j7FyTb1
 OPjuv+iTeUWEeAzBybH40cWtEr+m3JYhx5kR3yz3HfkYYRxvoyA7DjWpEb5J+Tu9hcKdJB2CZZ6
 5NWe/eT1PIB3EK9PFiXHBMz8FjfQ2Mr1WpPDa4B/keDJzid3zpk5h7PHMbxFZnItvmb9wFOUYz1
 iL+BUP2g3hQGeHt2JoogPhQMwy0azAJlGm6sPGWueqtAtbXBruY6qxBr5TbKXUXANILyyjEDupk
 VUaG+e6eAQf+yZX+/Ow==
X-Proofpoint-GUID: LdcTYNLKEVBpjnkRfG-3f1Qaj9DBUuOp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX3FLwecRqBTAt
 dppbgeTboVtLVm9xcA0ZcG6FLihbbZWhzsI71Nxp7N/4e4NO7ED2bLSzWuUZJ5adhsFYFQbfLUJ
 yAPNoDVHw6vsFC2G8ltqxwQIxjSwneE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

To keep this series bisectable.  This will be removed once there maybe-
unused protect tables are gone.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6d6e4c7cf919..c43efb85fde7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -168,7 +168,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name = {		\
+static const struct adreno_protect name __maybe_unused = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

