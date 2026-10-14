Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EC7361651
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791952713; cv=none; b=avPV/O5vo+Yvi86w2VistEtp2rSmIwCh3Rq+XqJGAJUNqBxMzZI5csJm1fAQFNb2ZiRAq0ZEyzkFaXhpyCiVfTjCOQ/0CPnk2JFcH/KAVFAexReFo3KHaD7EshVv9x6TdkjQi7E7joAQPpcQDtrNtpnz4HXIC7ZfxCGyafnIJQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791952713; c=relaxed/simple;
	bh=72aggRx/HIDl9GZSD801svHQoj+lJnCOeW96djJTqv4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TAQ5UVtn05QXGvm67YNP6CKsKtF2w0rK1YN7hVEidGjVXOf5P4uFn010eBLpxlT5LraZ9E5qZM/5D0xqUrDLTj3qIen+ahDJu0dQ/Klldpq7ew4E3Nw68LtKjJrXcrplFgIvRKNAINmmDjKWZ+B94/zLSFBZN8M49hYWNLefr+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxkhrebQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fApudlKi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxkhrebQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fApudlKi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E3vcPd2222258
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zHsseOeWAElKEmE5r+P3cx
	LFa3K3+ikDKsntHOfjkm4=; b=hxkhrebQOy+hMKOK/I97zz8ceoDxPs3h8y4Mw2
	1XRw5RMvHQtn2jZ/cAKFi11jfegXNLYDXQ35u/S/n57J2Z63QaEk7ts0JCkgu3HJ
	GYK/odRTS2bn87wme9k26vG5ik8irCvorZzO8C2+1NNmsBkjECEunv49GXVqT8U8
	OWc324JBBppaMtegUNarCpO3j/JVI5Q0cgABa4Oaz54kv7RmQSnReZXtXK6UCofJ
	kyRfPlHm9UBdkhjEtr0BDOwIOLc3Yc/WFm1Yu7pGQO8onw2wIwW29aIXheyHAF8f
	kSwykt0f5ab/lxLEbUQZhZaqBrPBow75xqWTr3rXm2jNG+GA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txs9r8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:38:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5358515b4easo70019711cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791952709; x=1792557509; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zHsseOeWAElKEmE5r+P3cxLFa3K3+ikDKsntHOfjkm4=;
        b=fApudlKibvz9kJqfKQVBEKfB5HvXSy7NC4+0+aYqWrBZACyLD7IdNzIyRAOOHu0xAf
         ICXVqSd1g45mWM3ew0wFgNYUz751MHauDpb706mTU95/bAWwDiz8geuLTARf09ndX3EP
         3QCqnpLAWJVCOzpYhbWG/IYaEYDkwOi8KiOqBN0Pi+pbUIxawo6G11eNH4HV6eKTnqdN
         hGE85AyjXoNr/jFQWhF7ZsLgPAAAjM8DPJxgJIOQTvYpQzik6Y+FsLDlUrMw6JBCcbV4
         TQjtU9DhWqWbi3jljxUi2bvsWFZCQC9Lz81TVfOKdJvZ2pBePJEiLJ37O8WUbFuvsLHZ
         pl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791952709; x=1792557509;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zHsseOeWAElKEmE5r+P3cxLFa3K3+ikDKsntHOfjkm4=;
        b=WeBAPUkP9+tt3n1UbllAIfnUD81FsZ+1okt2qwANuDh1rKINyUPwhOKMfuri2sGRdM
         FaaPTmveDYyqqxZz3/HluOv53BzgAspgqCZeLSU1QKppHlwTIgZmdvchiNILpDcN1AFP
         2G7uIaRRVU2hudxAJB3/jEhXG6bNrL8ayGk176KYH4XntmmN6t/YD60ZKbISTawWZjia
         XCL44dflgpvFawjgcg1DH7L9Ca8OlBV7ejtmsgwr4msIn1/AerTzwvheGDoENeoAlMbP
         6pXvjsOry3Eq30OdoQ1i2izLwPryQl8PrR1SorjzdtRi9pyonIf565DcQsc0T8sNSHiv
         o6Xw==
X-Forwarded-Encrypted: i=1; AKwUvBwiTWHe43QEang24Z/Sm0f6a1o9aCDZJsFwJfHoq+Xgd60G/ZVIPFspHh25jHwAhh1v7xHdLdIq7gK6ajk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2qzYv6na7aTZlESHUcp8Ft+ltS08PFBrbQeR6nvUl7n/Zc1pA
	0qeR6FD+jUsFDNT81+y15LUF5QWRawpxpNWFu7OYz53V/d7ws7zbtJQ1t/OxDn4O6i3wYCojeON
	3cBlPE63hLKb2OeFOXNOKGJGqc/ewxzxOm42XsSO3JFDQWp6KWQLDIhvbirrOq0+3Ol8=
X-Gm-Gg: AYBFou0F6FR8/DFk+A5hP7PV3elgrax48rgA2aXFRYMgIZ0oiHUt2IVu+sAMIZf449+
	ys4DOr8n9S/y/UT6xoaxZC3iraWsIRxRU1VMMxHwoTWVqf9KesGoQ54MnbaOnr62eKVkdjLs4TS
	P5Ef5q9ey/YdobX73kEUNDi3cGtOqFynuu9j7Lx1nmT+D11E0yo6gDiW1USsNymU5e/pYkA0eyQ
	x++E0+0LI3P7jb2YmPR947xU1mpxmlE2U42No9uPVBNQgIc3vtogKNLCYfm1m4YcBPgX6ar6aRV
	aAXh3Z0T8rfukgoQQF8kzL3RuosAbBLIjJF5uAnvGoRaNVzjH1jtZVyUMvfMh1bmqySFgIgej3N
	WaAXvJ4hP8X9m9cl0RjbcXhheLtwsAx+vvSpTDrAQP5IBY2vhyBR4crF3DuNV6g==
X-Received: by 2002:a05:622a:2512:b0:535:70b4:3f7e with SMTP id d75a77b69052e-5359fe43389mr211290341cf.68.1791952709013;
        Tue, 13 Oct 2026 21:38:29 -0700 (PDT)
X-Received: by 2002:a05:622a:2512:b0:535:70b4:3f7e with SMTP id d75a77b69052e-5359fe43389mr211289881cf.68.1791952708446;
        Tue, 13 Oct 2026 21:38:28 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b755c35sm116809651cf.15.2026.10.13.21.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 21:38:27 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v3 0/3] drm/msm/dpu: Add INT2 GDSC power domain support for
 Kaanapali
Date: Wed, 14 Oct 2026 12:38:15 +0800
Message-Id: <20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADcHz2oC/23Oz27CMAwG8Fepcl6Q47RJ4bT3mKYpfxyItNIRl
 2oI9d0J5QAHLpY+y/r5uwqmkonFrrmKQnPmPB5r0B+NCAd33JPMsWaBgAYsghx4+NlHDiiD36I
 GQOswinr/Vyjl/9X6+n7kQqdzJafHUnjHJMM4DHnaNSqlRMkDhAAeolMJHWFLOmqtTdtpIGc61
 Ym7dcg8jeWy1pzVir1pNCsJsjW97Y2JJnj4HJk3p7P7vT/d1LFiMz6BrepeAaxAXVnU1ve6xzf
 Asiw3AQQZsDYBAAA=
X-Change-ID: 20260720-msm_gdsc2-cb9230027a2d
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791952700; l=2167;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=72aggRx/HIDl9GZSD801svHQoj+lJnCOeW96djJTqv4=;
 b=hBTTjNxxhpIoKhphaH22oTQuYklHQFYwl9Xaz45Ey165pOfxzWpsrD58EmQJmZqT9GKtgukJi
 D9H2ILC0jXbBzggzX12Bh2rb+ttre3dt+XUJw4qfc2L73QlTlG/MA1g
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxOCBTYWx0ZWRfXymNE9M1t9BiS
 bW7002PMZDP85LZRDiGoeYe73w8QsJgT0LFLZTHvjblAsssBhi7Lj0mNSFxzQG/V2iGV/WG+RoT
 PKItFRkYxpIbsSPRihtA7hzrAscYY6VHSmnIrRNohvUp1TIpYe+Zpn8Q0K13vtJ9n08wlW+yNR6
 OMl3EfkIzEfDdOovkfrCQ3lIWs2II58WFVDt8fyaJX3h8N/dSAOxAzOsmC7PqJEbQCUYuN30AFd
 DQJQYn2kS0gCgX8v05Rh445N1Wc5xExgh7y7eivNmhFK8KQNR9NCgcpzl7UsgDQshRx8CuqQ7NG
 rkzZg5381sAcKEpXHNjCDDACMV3FSTUw/CTu/W9iehLWinWgGznDypjJtnBjZ77qbEx6aZhp3ro
 YT5kkXwpW2krAZJVATzkAiQWacqtT4sC8pJVwE46WKl4THhpLmadJ9rc61VQ7xFB0+lTQ2O9eC5
 HcFHCx9HczyFF5jZa6A==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf0746 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cXFZYRxNi65dCB_EMakA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxOCBTYWx0ZWRfX+O7y+p9mzyDY
 QJISGyGUjLgnf17E0Xs3D6KS78xUEdj8w1TV2ODogsrIAe9xIfKeEf1TImezMcn/TfmX/0gEcXb
 EbIEv/r6SeRycaqlAdpAiMkYkkXx9xU=
X-Proofpoint-ORIG-GUID: 8diIOe9yF95oThSuzVYLRr9ZMdAMmpwU
X-Proofpoint-GUID: 8diIOe9yF95oThSuzVYLRr9ZMdAMmpwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140018

Kaanapali (SM8850) has an additional INT2 GDSC that powers a
subset of DPU source pipes (VIG2/VIG3/DMA5). Without enabling
it, those pipes remain inaccessible.

This series describes CORE and INT2 as the DPU power domains,
updates the DT bindings accordingly, and explicitly attaches both
domains in the DPU driver. DPU performance-state votes on CORE
are propagated through the genpd hierarchy to MMCX.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v3:
- Replaced MMCX with CORE as the DPU power domain, keeping INT2 as the second domain
  (Dmitry)
- Used generic "core" and "int2" power-domain names (Dmitry)
- Propagated DPU OPP votes from CORE to its parent MMCX domain
- Updated the Kaanapali MDSS example and fixed issues reported by dt_binding_check
- Link to v2: https://lore.kernel.org/r/20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com

Changes in v2:
- Moved INT2 GDSC from MDSS to DPU, as it only powers DPU-local source pipes (Dmitry)
- Dropped Glymur — only Kaanapali actually needs INT2 GDSC
- Used if/then in DT binding to restrict second power domain to Kaanapali compatible only (Dmitry, Krzysztof)
- Dropped PD_FLAG_NO_DEV_LINK, let device link auto-attach handle INT2 as runtime-PM supplier (Dmitry)
- Link to v1: https://lore.kernel.org/r/20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com

---
Yongxing Mou (3):
      dt-bindings: display: msm: Add INT2 GDSC to Kaanapali DPU
      drm/msm/dpu: Attach CORE and INT2 power domains on Kaanapali
      arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU

 .../bindings/display/msm/dpu-common.yaml           | 19 +++++++++++--
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  4 ++-
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 21 ++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  4 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 32 ++++++++++++++++++++++
 5 files changed, 76 insertions(+), 4 deletions(-)
---
base-commit: 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
change-id: 20260720-msm_gdsc2-cb9230027a2d

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

