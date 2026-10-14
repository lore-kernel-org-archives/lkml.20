Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AECF414422
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791952739; cv=none; b=YnQHp7USGycwVzmS4U6c7+DAkQBlsjMd0y1Xt5CScDNjCbfibuZz9TYrxjHg20rYlNZNAeFAxYzyoDwPEvRm5UIinvU28F+Bm1onkNYGEqOBJGOwXM/c6bVXNklH/uZREzwwQVL1ukYa/sMjCgtVFhcyTDAZ8rNlQQw613dW/I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791952739; c=relaxed/simple;
	bh=0e3qRwa0eUGU6w/ynL5P+jJBBY2ZfPskYSfmy+rlycY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FuYQTdADePFE17N6+U1eR2A/pL7b8POefYf0lw/JlwBibIv3H9+1gfxsbtOc8pg3hbVMR+yT3gbb4WqyVwBrzhO+091LxRar75YaAyWNBRgmFdgdkuRKfoYFcBBnsHMA8dqsy4k9qM0eCpx5k/MIJY5ASa/Z/2pFadbTZGPY/JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uq9QPDTz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQ6TKSju; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uq9QPDTz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQ6TKSju"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E2Cxer1125206
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=; b=Uq9QPDTz9JEbOUey
	hoRiGzmZ+W/fMiP/ZHzW6rYMwSlmA5iUMWBVvXejbWLphsL1zvTUTg1F2SsBrMYG
	PLgvWIXIUDPXz/MQwnDU2qnOIH+Ge3y25vDJd7Ho+8rr7WFQ8tTczZcD/TrGU73/
	e6qnzfubx6qLIADxJFEnEr6qasm3v4gtivPUcRTGkrBk1CStsQ0VdVDKVCN2NHGo
	4ghg05C9/XtEId9kHSA0Uz4rG5yixIdHsYFh3UYfexGHTJ+rkWx9YRTts4gBX5Wx
	IJ51U6TawmfqDL+h7X6LvoI9GpGZOuxVF+sy05Tndt0LpTqBnulu0x1mokx2ZdaJ
	OwImOw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sg827mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:38:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91961d4b31bso80323706d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791952736; x=1792557536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=;
        b=fQ6TKSjujxAKBIVCtlaHifctYhq/Cg4RpsqWqBEsEOm5cY4NJ3s7PD+Mmy4rWDTThN
         8oiQijpcuauaQ/AqJ3aYpENlhySKHjpTtaLI6QMTJUjJX/fDzppP+p6/Hv79S/6QWTyV
         VMzJvCRiHRwueKn9QdOOUjvCFQ6FK+s8T2iuPGTYtBqzaiPKUJhA+OXXpK+491uU07QI
         Pb92YuA21ufL2xLYa5Hno3Xu1w1KXkTJaUIUk28ukd3jAki/IJ3QyniifN4WcI5F8vmw
         KLUW88OSs1h7Mf1bE6myjpGe6BkRUbpSPGfkNQ7kJ4qXCgbbzVEEOwu+xd4lrligWb7O
         hG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791952736; x=1792557536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=;
        b=im3rkcF05H43rqAbzzkurSK7tTZ2BFppyMx1zsp94S4sw/Nrnk6L5EOt5TjIijxbcx
         UugFm9NdMIMhkRz1Q3xXgElHnwFNk4+PPHNDcm8kUEgKIowNMqVHXIfonfR13JYfsNnj
         p98ArYNq/s4jFAGJbjPbDqFMvFbdFPKq2KrJxwm1SJxNgvk85CLCCOBDXOQ50/zJCehG
         Dwuu3JpHY3TJKkcJzDYUuLcydRyxRiqbjLqOdRfqpyaG3/aMfPdE7yaRzvFzvwB5eA1K
         LPCoQ4zEq5IZ1dIHvmnitT6/1JXGoBlgmtAc69HLlmGHkxJFVT3vCpLPqbtevbZjqliF
         Zpew==
X-Forwarded-Encrypted: i=1; AKwUvBx21Q5O5FOAOgrZeG0S8xR+N/XJB0BJadQL8JGVrthPpiEpJtOVDJ72JTJZdi902qmEE8h4eHglTAjfVxY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJQLud5U7XnP8Qhhs/mtDkZFL1kWwqmRh7IIwSWDiroY4qBT+B
	RDD7yC/bThqy+AwL5BQZY0BqU42iPt/SQZouBrdJ+3NwFFNXmUEMgnwVpppuKSrnkWwPsZnrw0f
	LvXdZ9GBXlRlQYhhYOEAyb2MR9JgcPckj5LQofakZgGeopF2HldkK409FOD9OEQDLvPs=
X-Gm-Gg: AYBFou1UOrnDXW+X2lWPVHppNtoRP3bD/I5AzPCQUgk5xQWD+BUWyv0D+kZZf3v54rJ
	EKxQ9RBlGX0hyS2hgjym1DRwyXtrDB91NoTJDPe5ZZDUELQxkaSMD2vxbh+wLwNYXa+/GhAFh/s
	90HGNarYti1Nn+pk3hoE31nlgkP8ymsZL4hrCLaytaRHPn0LddP1lNek1TZXiH8QiByvf4URoxQ
	SZeqRf0iyGomOnP/qk6Wm9RNjLHNs1TEBK3HuJksr/c0DpMqu7f7mULD2l2XbN/KNA7v+TQhXLr
	M00ypuDqNawXJLrfV9jraYNxK7YVge0g/f5L9P/QYzBWTDpYY/UFvojOi09K2kazWItFYTylUft
	pTBGNTqY2m885C6+Flz5ZAh8F660hQ1yGQHqKeHm2IlpuXpiA8JTldu7+3SUVhQ==
X-Received: by 2002:ac8:5c8b:0:b0:535:cd9e:c12f with SMTP id d75a77b69052e-535cda02393mr140894671cf.32.1791952736462;
        Tue, 13 Oct 2026 21:38:56 -0700 (PDT)
X-Received: by 2002:ac8:5c8b:0:b0:535:cd9e:c12f with SMTP id d75a77b69052e-535cda02393mr140894301cf.32.1791952735942;
        Tue, 13 Oct 2026 21:38:55 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b755c35sm116809651cf.15.2026.10.13.21.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 21:38:55 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:38:18 +0800
Subject: [PATCH v3 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-msm_gdsc2-v3-3-f1ed69014416@oss.qualcomm.com>
References: <20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com>
In-Reply-To: <20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791952700; l=1229;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=0e3qRwa0eUGU6w/ynL5P+jJBBY2ZfPskYSfmy+rlycY=;
 b=nLHkNGIq+1409C7efOjQ0ye24/TubeCctCYnlKQVPsYz4IWDslnDyJpqHsNg0CNmnDPIMIe/B
 fwh6QCUJ3sDCMgX2JuSgar0OF7ybsgzRqxuAEjSZtu6uNll7w8rGO2h
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: 5cJYTwS3hLTcPMzEAzsPGmEL1E_aF_kH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxOCBTYWx0ZWRfX+KoULn24G0B4
 9K+gWJJ6ILoE2bXQueTfmNGCQwe6dq0vJ19Jpp1fJAzuRIBApEsFcgHSTOFz+HnXR9T0J0G9V10
 9Kwf8i8UZOHQzeJchhEnYwa+bjXHk6k=
X-Proofpoint-ORIG-GUID: 5cJYTwS3hLTcPMzEAzsPGmEL1E_aF_kH
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6acf0761 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GwFvbCpr4qPuEswRa30A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxOCBTYWx0ZWRfX+iLwF3ETyeAd
 djJhLzh3/wM3zlMcX6Jn1yrfpLCZZ+mqb8F6WTvbIGJHJL5A6+ochz3j13Djw6pUCMKzOBN/BQ6
 1rBCcCiGz6ScOFbuvcJRMGFxhXu84EbelLY5TCkVsD+KM0eeiwwK/NQz0Tc6tbEZfqkLJV0a/yq
 sc2l+MZNbsEdKfbh/CfOPavOLfqLmeU0rGI+nB9Czwh5YuYef7c80Hz06nigsJOW94kPOTu5bUl
 zwEj8nMal+RpSfwPxS+BGCwhCXb6K+YQkRZ5BkTnhP+M3BE52dsgFiDZOBZTLaO+e4sgOS61Yaa
 CsmwQ/+vcmG6v5fGMGmXECf0A2FKkqnX7JS/5s/flQibT4OluQsOw/sRU5AMFj+2Ek4goP2RXoZ
 CKfQnC7QMWYSOHFI79Ra7U3Tmm6SVjbODMDOTEQ7oYwcLPQI6TbQt9Xi2qG4HJJI5Npp3K45jSB
 CHiJr749qQ36iTZYr1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140018

The INT2 GDSC on Kaanapali (SM8850) powers the VIG2, VIG3 and DMA5
source pipes. Without enabling it, these pipes remain inaccessible.

The DPU is supplied by both CORE and INT2, so describe both GDSCs as
its power domains rather than attaching the DPU directly to their
parent MMCX domain.

Keep CORE attached to the parent MDSS device because it also supplies
shared MDSS hardware outside the DPU.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..98d367b9dac7 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3674,7 +3674,9 @@ mdss_mdp: display-controller@9801000 {
 
 				operating-points-v2 = <&mdp_opp_table>;
 
-				power-domains = <&rpmhpd RPMHPD_MMCX>;
+				power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>,
+						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
+				power-domain-names = "core", "int2";
 
 				ports {
 					#address-cells = <1>;

-- 
2.43.0

