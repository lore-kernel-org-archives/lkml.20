Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC933EBF0F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656086; cv=none; b=hLBksf/WAWc6aZi0qajNQOBuE3fA+Nlr56OeCQMJOGhAyk2LIpsqYmYrCrTlhxA0NiNYWII0/fnEkvQDTv0Mk/BTd5gsfqpW70RUaKFm7qGosWML0eFZRgfH8i0UXDjCbguYZCmSFZ18pfD1wbnU35I5rocHolW2nyt3q8INmeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656086; c=relaxed/simple;
	bh=RFTciPI+nxW5BGq7bvVuLZ5n+fGy2vZwA3KysuQPE2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aXhe9D3kFUxJrp8wkPEO194a2oLvw2dvBhHxEsnayrxZOhjOll5FGQw0EiMTcLn58wOB7btiVl+LLt8hvCqG4MC1HOlUTkMNubqAAwGEHz5t3CGSjw3EUm6BkxFwxZv74SdjLZSsdPoiddnE2QOrve3vE3yyAGyWlUOAS7QnVmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXhUrV9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbT9kaNg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXhUrV9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbT9kaNg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47KVs3241635
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5i86ADppHi1rPUDdBO+P0YYM37FqBEqSi4JIna7g85E=; b=JXhUrV9WX+8SdlkW
	l/kztBKEDeXYOML2v+4d6jY+22/2fIWsytujgg3vnEj4hIJP0Xn1JJW8eU/hygi+
	zDWPM05/b+T56RbCsxceQ74BrSnkfKwn6vrBKR/iKe9KBnjvPvRf1ZsoiL8Ohe9J
	S4B/C57+F1k6KBjMfyJgXnQAQu8yAY+7VHs4P7zJLQ+ROVM2paSc81y6cZC0j9Eu
	3xBDzAUfPtoi6ocBlpapfAqw4z0os4Pm00zQSisLw4uJgDTkHgaCGiboTVptLMmA
	YrvQB0RKeMid3rTi3m0jgQNunauEM6DwdpW9dILS1L5xMdk17dX0DUMlE15zG4w1
	CjO1Fw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144s1kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a3f673221so1069247185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656083; x=1791260883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5i86ADppHi1rPUDdBO+P0YYM37FqBEqSi4JIna7g85E=;
        b=jbT9kaNgyaWHcixmc9Ko1yjxKT/HvDVBEzz7128Rp+mMAUkdIQrDwRlKfhuaLKYZGw
         RZ11+Wa0AxAj8DNxum/PnCNpF653KAyN0CEFdIS26xgn71oaI+uJ2DrGtIaK4e0dstBB
         gFATXP/w95nZ67UyzWTUiw/OJUhKqvTzCKOcx49Jru8v+ORWf+tleqOvTl5a2yzL41qx
         9/mFy5qbY/L6/WFkkqKOA7yPC+0n9MwdLgLFl7Ij8DajfpxCnv30JWJtcirZmPrRqdd+
         3QVnL14bzxhLAv/MLTvWKtU1nKHR9qzZoYhk4UFyDU42FPf0h4D8rTd1FQvAyIY0EuD/
         to9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656083; x=1791260883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5i86ADppHi1rPUDdBO+P0YYM37FqBEqSi4JIna7g85E=;
        b=VEtGyLGs9Uih8x0IvJZpWAopAXJ+M8Y9mx9nKJ8bSEXMrNYBd5E9oMCfLnZQVgJXCf
         bzpyHFCXicN59iqNsqmklKOs8ZXkbX8RUAjFodhrPrqrWMM4K+NFqcUNY4Tv9z/CP8nm
         5R58byEMs0TWpXVGTfz7O1LAjXqK0lZwzBdqX48/lrQpDLUyil/AiMh+x2HW4ECcFlE5
         Kkz+LRVxRu9YjNphjRcodOQN2K2GaBM3asL0VUbsL2hinG1lkywr1VUheksXlBW1pBlH
         IVfunqKgdNPGenZUtnOu1rt5Hjg2m24QcC41VKX57/IlORDrXOfui7ra/HrTyTL9GDa3
         4oUg==
X-Forwarded-Encrypted: i=1; AKwUvBxJMe19s4DP40b/Px081T3z+20OQFqCQGmEVMzYvBMapt4lPMrKKEG44h5dJE0EJMj2vTDexO8C1Be70Qw=@vger.kernel.org
X-Gm-Message-State: AFuF++lp8uvb+zmfjkgPtOtJUHpERHtL/n+IKG4DTYm+4BGS7DaBpozp
	nj9c9EORIB1bT2kXiYwG+jcC3cLBchTS8SIf+wRpAIItV8deLHSkaADNF6gmQebcAEdfP2tK9fo
	x/a9/dq09b22Qcpzf5Erb3tIxipYYcFn2MBxoo9pjjH4fltPr6b8NIUf6dSb0DUkT2Ag=
X-Gm-Gg: AYBFou129ryGa7kQAKfLN1WBmRzCoHxQM73zm0OhHwXiNAoC9AkNrBHez8A0FoEDmEQ
	0QHAeJcGan3NmHlSLYkIb8r42hyG2dAO6ddZR3d1pnbcsQRb7doIeWYB6I4CYkWDAYMh+tB4oWu
	vUHKPbTu1wRs3XwLkLL21QFsYhVn875L2+a3UrOWVNu3BPhjsHy646k5bxhMUV/H+RwtWgKTZvA
	B/HKDS1f1rTAO11HdJw8n7AnhoPEq7R+Mg/ZxswxIU31Mn/T/8XDsJsNZOgg84d9eySmzRl7RUq
	VVgwnhVnd50KRdx7g+j6u0MKqL8w/kzYg9AqE2nPqcdLOaQ0mc4yuhjnNGAFUMpfESiwSQLOhiZ
	A/AyBzqhZTqM7uigJvqXfKFeC6iwolJ98hvGQH9ehcBv7W3hRW6CulgMW4O97MH4=
X-Received: by 2002:a05:620a:6602:b0:939:f89:3688 with SMTP id af79cd13be357-93c47498f78mr2243577085a.42.1790656082795;
        Mon, 28 Sep 2026 21:28:02 -0700 (PDT)
X-Received: by 2002:a05:620a:6602:b0:939:f89:3688 with SMTP id af79cd13be357-93c47498f78mr2243573985a.42.1790656082256;
        Mon, 28 Sep 2026 21:28:02 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:02 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:44 +0800
Subject: [PATCH v7 20/35] drm/msm/dpu: pass msm_display_info to
 dpu_encoder_get_intf()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-20-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=1951;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=RFTciPI+nxW5BGq7bvVuLZ5n+fGy2vZwA3KysuQPE2w=;
 b=0ZpsaYMN1m/MNaf81oF/EXLAIvZEeuCkX6yO19dzRJ8r4d82ydlMdvRiZ7Z0HfczW4rySQgOa
 VP/5H8V6lcKAHnU16naqGY8Ktu7/z1Egq49zy7x5RPqbrXYfMy+athg
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX0MhJyQbM8oxV
 c1XjEBoFui5daN5WlDhHnrHDzqMwA4aLhKm/Nt96ULfN5cYUv7dec0s6yNAxVAS6ncTS+NY2oZl
 5XyP97Xpl8feBV9SIcFN1vVjqYmyvQt6eUoBPUp82gtEFMxf5KV1yT+B5ELZfX6hNXAXVVLadB6
 AntdtmumZKAibdV4wtJQFHhFsrNpmXyoEvLe4i+57nhL5sWCg9N/o/k6gLOj//qyOFxm4P714bZ
 Xz38cKPnmbq5pnnuC3azCmFpnVHJFGvBn6OHC9VCxZQ2qiTaAh6OW12WgFS27ppnTxR/qcWyrOn
 6mTzXQFBXaPiRqp5A5pQxP4QF4ij00tIJClr07eTjHEyRUOHGilWZfEQkMJ6oh7EfJrLNaaxPG+
 0c6m0w1k0mvj9IoRsKGM4+Ej0AmnTajJ/Gp2Qb0eAwllshxVgAw05HD9RU3EL2c/GEBW6KRPmmw
 +eEDZhmTRQdwZLYC85w==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb3e53 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TTd-C8IxYANZTSfMnlIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DZyCBKIi7A5lYSm3nYjYr35TkcANXreC
X-Proofpoint-GUID: DZyCBKIi7A5lYSm3nYjYr35TkcANXreC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX7cUPutL+cje8
 JELxcYyk818wv/PGdFhP3hL+eyj4ePbMbVgAUffdokSirI/zJ3EzRmL5LzxzVtgaPTFJYackXJR
 aPDlV8bG26FCnKCpoyML4RE0qmqN8o8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

Derive the controller ID from disp_info->h_tile_instance[index] instead
of passing it separately to dpu_encoder_get_intf().

This removes a redundant argument and keeps all interface selection
parameters in msm_display_info.

No functional change.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1f20695f81e3..91cbb0ca521b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1437,15 +1437,16 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 
 static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 		struct dpu_rm *dpu_rm,
-		enum dpu_intf_type type, u32 controller_id)
+		struct msm_display_info *disp_info, int index)
 {
 	int i = 0;
+	u32 controller_id = disp_info->h_tile_instance[index];
 
-	if (type == INTF_WB)
+	if (disp_info->intf_type == INTF_WB)
 		return NULL;
 
 	for (i = 0; i < catalog->intf_count; i++) {
-		if (catalog->intf[i].type == type
+		if (catalog->intf[i].type == disp_info->intf_type
 		    && catalog->intf[i].controller_id == controller_id) {
 			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
 		}
@@ -2674,8 +2675,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				i, controller_id, phys_params.split_role);
 
 		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
-							   disp_info->intf_type,
-							   controller_id);
+							   disp_info, i);
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);

-- 
2.43.0

