Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C604F145B3F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985797; cv=none; b=oS4PqBnbY943Ng9XsD93hm6I23/f9y/C9TX54TpYFuMgzAm2cKcawQ3dqYxGkyo0lqh0A8Ml3FY4GYzh3n+cRIBFQWufr6RE6tt2E63LD3S42cg6yyp/2VkjBuJfj9QBkXixwjOIsierSONQzJfds61Tiq1kohf/fNWVhSB5zs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985797; c=relaxed/simple;
	bh=x2U68697ySuHlAjEIAMBnxsSwSjU9Y4ak2l+lWJyMrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EmNsQLPDpaMg5BDMWVAS5pHKvvAxfUjR6BoVhVg/lZuJi7/gkjGUb2QRg0gAeWcS/mMXbbalH86AoNEEmJ//Yb66zF3r6merOrKDcTLcNWRG78PSbh6i0PqPQkv/cZ7LNBjlIQ8lPiExz8aHQ0Rl6UwnrAc+2H8nYKxtdJJya7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4rCdvbc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YG+ga9GM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4rCdvbc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YG+ga9GM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeZL62502371
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44NLFpPE8ZdO6HqDLmJN/0Wy5T0B4W+VTtDVgGOjxNo=; b=R4rCdvbc4C7Yb5Iv
	b2bwv1nfYfvAqtDvQexaGnq1EZXe5S+laS6w0OxBYLM4fsdVklgFebKq/0z6oaCi
	xX3V0i/ImOCnFNZPXaVegu1EVa3Vj43S/aj0sZEF1QoqtqdBfl29HpfzzAF9WmbJ
	fVkaMvdwupR+n/eGBd/z6xP7Ub74cBfwu2SRyc6Oc0HMj7To2Roj+794nb4BHAzc
	Dc2eG/21f7JzBVi2cs42rkxOOlEWxZMBfHqerInfboGIYs6piv+8yJjD7zSVPqE2
	EUHHWuJ9kG2miye6rhJO4Aotk0aKtQdH306l8hOHDcJ0QhtDuLfSF31kBlAdBm6Y
	j8RiYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ft8sq4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:03:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so21350785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790985789; x=1791590589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=44NLFpPE8ZdO6HqDLmJN/0Wy5T0B4W+VTtDVgGOjxNo=;
        b=YG+ga9GMl17fnAsMqSS82czYNbVG8r95bY3cRDjWu9HZHLZ5VBLA0Qj8GEvO+nuun+
         ymeYRvlbVktdnzuJ5ZBq0ZlxTOfegQ3Xe8cLSgqRqUpy9kMVnHu2pB7DfPJGpUyWT6hT
         VaDEQOa5/jqvA9vjs0Yd8KwF3iK9GnwIbQy5OW4AuHj4PVVlsJveziGqTX5eeSU0rEz7
         SMYUSA+NI8dxe8scWKDCJG52lKBMcsUhnAGeQSVdC97TFC/tK5mztoE7emnsSKXphCg2
         SA5wuwI7bMAz35q+JgwRAWFhdoJBEROrbfByF/zSsh4TFDmrFGYOseaNrq9MeMa0Dutb
         tVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790985789; x=1791590589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44NLFpPE8ZdO6HqDLmJN/0Wy5T0B4W+VTtDVgGOjxNo=;
        b=q+SxjTQ38Sbw1kciS/s425kjSghZAPG7wqI6clmPjp5G3XeG5DHkki5ZB913xV4XwI
         vAtdMyDTQ7N8O3wqwhNCXIBogkarldMTp9qmIab28zQq2JkcMgxwkOjkrd3cKhqaJrD2
         9dsU92QpnT4blX6Rbw4XJqEhYAlcUuhPp59MI7NWWO6nGwbdl4BnfluCh7Q00FHU0TIL
         5USrthKZ8kOYBZ9P99xCXiTH2XunqNb3LpSeZydP+EtLfYWbgFDCky00mf2L3GlBLynY
         TiDD9HXJssfIUwjrn0V/vNWgSYMeS73UU3FKIeobgOcQNSKYxSRVpO1NVgbqnUqQRW2n
         Vu+w==
X-Forwarded-Encrypted: i=1; AKwUvBxyYXB9FMpsxXSCZX73GzyFSeZveaaijXOHw1YlK4HC5UrY2RdThpdwDjEcJhi8LGQZ4+X6fOv1Z24xjJA=@vger.kernel.org
X-Gm-Message-State: AFuF++lR6RRdB1OBkrnJyKNZZk9eOAZttMJs7y1ydXVK4T9sa+/C7UUt
	YrbUuscz+3fMm7ARpuTqfvOYfRop7qwQUTOmxRpByKNVIlHgwChW+lzmSd4iQvQdFk5VfG+VcWO
	7eNmnYlGrsaEme3XnZdVyCXnXlhhflkuqJODtAIGYm0xFIfdf+HJELXA/0Hfsr8+v7hM=
X-Gm-Gg: AYBFou3m8Dt6n3FpfaYzV/0puS8ytmGFwalYo/m22LrRsD0+OyMLv49nMvjYVFik6Dn
	OcwNWmR2kIvmzLaNaosSDUUbLNrwL5lLIk1w18cngIvE0spSXrNFFzftOGVZ3TaVYv/zKkvXofN
	7tsQBTgjavT/sOPML7eB0031jJHJ2WQaBdKk+tmI6cYBccMkcfLhsQdykX36/ss3g6NldXrawvu
	Gw1ZgmIHsYTca+AZg5cIjGax6kpO8FdhYMZC22v8edm4oIsXUUMh2U00FHc6PI1Jjv/dAsDeSfy
	7w3M8shj7cwS7RdANklr+ctYMusqM8Kx2Fe4+e4lklgLsZNUZh+T51SSMMXo9eXtol4yooxYKbU
	0g9Pfyzg9CxhcegHp+wL2/hc62G4CUoa6orVCsUo0S6+omY8KvfciPw55c4nle9/QZgKEffIvHc
	O/HWbXxuKoBiSj
X-Received: by 2002:a05:620a:7088:b0:93b:d88b:ee01 with SMTP id af79cd13be357-93cb5c4dd5fmr1632718685a.34.1790985788799;
        Fri, 02 Oct 2026 17:03:08 -0700 (PDT)
X-Received: by 2002:a05:620a:7088:b0:93b:d88b:ee01 with SMTP id af79cd13be357-93cb5c4dd5fmr1632714385a.34.1790985788333;
        Fri, 02 Oct 2026 17:03:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f7b4esm14234531fa.14.2026.10.02.17.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:03:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:03:02 +0300
Subject: [PATCH 4/5] drm/msm/dpu: enable 3D merge when there are more
 mixers than interfaces
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-dpu-quad-pipe-fixed-v1-4-6a6a00917b71@oss.qualcomm.com>
References: <20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com>
In-Reply-To: <20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jun Nie <jun.nie@linaro.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=x2U68697ySuHlAjEIAMBnxsSwSjU9Y4ak2l+lWJyMrA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEY0VnOP7gP6vJRj9JrS41FbONPrVB8m4RBsN
 YmBs9IPgTKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBGNAAKCRCLPIo+Aiko
 1azrB/9+sqJG86unJ4o4I/jwihLrJHUZTelcwVaI2Kn76A6cvnyROTz8lp7SwIhP6Fd0hNsqFWQ
 x3z1lu4veKJRYwEXVin2mVq/LNZuqrTGELwb9X6Vd7ZAW8CpZ6BZwJIRdvH3WVX9odSehTzTrzh
 PqJGQWDiyVvSVULJf3H2YvALOGAr8w4MLdfofKUszR9RPQXGc6qMsK9Tbq2D2RLPcmaxcd/QItp
 rExEOstnNoMxaGtYnBMdMLOTe6/IHZtH70SPKk6ho1c1gafK66dCRE0mPdMowMAbQaTb3yetSR0
 z5bwX6BUHN10INw91MfBQ33QHTEakEMT4bglFtCekYn2OcGT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: W0s1-MbB4A6jOFq1PW-by3q-WjcFz6va
X-Proofpoint-GUID: W0s1-MbB4A6jOFq1PW-by3q-WjcFz6va
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6ac0463d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=-SFlj5aAlSBlHhkUAg8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfX4FaXu5aBI/tv
 HF34HjGyskNpu1yssF9ThbQJ6cNH+okQyjvCtj4FjbM9seDq0NDNM9d09AgU6kCIHimK7U/J1s7
 W0v+zy8srqin+e1C/hfETPiN83pNJNo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfX603OML53kdB2
 YOMFuz+yiICNmI57yNwv0X2U5674vbn66qvRUEhIpwKqmDcfYQdYtRtBRsvr56+3cS/KQNKtYsl
 p5gulpcj2QZ4q1thP2iDMvF54i8YMv+UDXhqeMdwOaUWQfInIU4BWjZsSGZm4jE7KK+gYzB4kDq
 DkY+gDurmL0jjlljTn0h1uM2s89G/FBXHPGZeZh1kttAoTMyDGOsoGpnW6GLiWrKds9BABBVkXJ
 WwNwWZ341+PvyNtwJLrbdINwBGen/j0aS76QzHkSUaLNRImy5Ohg6ZouxkVfdaJ4/Tf3ePEHxUp
 W1MstWU6ojVrNx37snvtJdyTQjmKSD+oj0+h/kJfmHPQ6vCGLnxnmsOgZ4CIl4dG3AxqKpzmd2b
 wYc3WFEKRNhixMW+9X6ukmmmMenLjkZ0+i95OoZQRIdkBYISXs8n19HNz5UYE7EhxNSv0ZTnt4z
 LnWouQ8KUH+ZvH1byLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020095

dpu_encoder_helper_get_3d_blend_mode() enables the 3D merge only for a
solo physical encoder driven by two mixers. This covers all the current
topologies, but not four mixers driving two interfaces without DSC:
each interface is then fed by a pair of mixers, which has to be merged
too, while the physical encoders have the master and slave roles. The
3D mux would stay disabled and each interface would output the data of
a single mixer.

Enable the 3D merge whenever there are more mixers than interfaces,
unless the DSC merge is used. Nothing changes for the existing
topologies.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 61b22d949454..d24e39597f2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -294,15 +294,16 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 		struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_crtc_state *dpu_cstate;
+	unsigned int num_intf;
 
 	if (!phys_enc || phys_enc->enable_state == DPU_ENC_DISABLING)
 		return BLEND_3D_NONE;
 
 	dpu_cstate = to_dpu_crtc_state(phys_enc->parent->crtc->state);
+	num_intf = phys_enc->split_role == ENC_ROLE_SOLO ? 1 : 2;
 
 	/* Use merge_3d unless DSC MERGE topology is used */
-	if (phys_enc->split_role == ENC_ROLE_SOLO &&
-	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
+	if (dpu_cstate->num_mixers > num_intf &&
 	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
 		return BLEND_3D_H_ROW_INT;
 

-- 
2.47.3

