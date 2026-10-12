Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825942253EB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811969; cv=none; b=a1TE3aDns6+i1OX99y0VEw7dd2MgAV+sklJbHoPt5EULikYnMKzsS0CD0qp7S0NSEeVGEZ32D3bHW0B3ExyUR0A3BU0htbip6iCVoBJ+7jvXyw8VEgwjjJkcAo9ScMERYJvUcKDqbbs0hR5uw7b/V0MumK90QAa6wFGSQxbiiJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811969; c=relaxed/simple;
	bh=Osl1oS3Zz5Z+SHgAJUCq8ikwf9PcZhHV9y0cVRgixBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aKY1w+N764bEdCt/bYRZXk6ITg3lmrjQpNtAbIwIxadQMww1eFoMryrpqJs7la3hJY9iAIY9gslNWnLsmBGMyv12KpM7O1zL0riQaAB5rLbhOLJ4JZF1ZIPnsaZK/zu3TrYHieJ/XC7StNrDWggkE3HMingje2e+6NK8qr1HPGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QI5QQAET; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkarC5vI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QI5QQAET";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkarC5vI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08U83292295
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGDJDRLWbmhL036D5uBETPd4vljDxOvm5TNYzKP1bqs=; b=QI5QQAET4yMkS9gt
	c4A8N8spreeYatTVGYi1ytTGS+EYe5PU+LDqU17kGLBLp4ib9YheJKvm2rqM/ayf
	0m+ifYkvjnBqS2CFnpiaBoIu7ucg8EF2zFGakvO2H8Cdp8hnygl8WNW2O+kXLKsy
	q9Jgj9h9BBbWHXUmB57JoWiXIQisFhFJlZujcxKHKb0a15Lim7PU8ILFcvpptm3d
	QWpG3E7Xxhb2NZQ/pOoiioeRRAO/CAwutKCgzIfFM1DqC9REl7cYDX/vop75cfDH
	z/n0+RMBm/6knkGzUEASoHS+mW5e/LnzFlghZ1ETPQp7dqPyPR57npMefMbi8QX3
	YdWbkA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3hhjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:32:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3580c07911eso5213379eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791811967; x=1792416767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGDJDRLWbmhL036D5uBETPd4vljDxOvm5TNYzKP1bqs=;
        b=YkarC5vIa3FlZQMkAdinIOA6IXJJzXubs1JKKaDXHyxC2szKFaK0oNbMr7LwN1jbR6
         yBa87B0Z43lIRh/uLvA/6KQgPkfI4+/Uudw6ReOrUKFtOzzh7eQXyCi+PUr1mDN4WRg+
         Ow/Sm1qZqIFc2ZevBRpkNYzBaxDhGCIm5YzZeDd+q86kFq1F1uPxrAGWFYF05zVgH7u9
         hAxqmN0SM59pi2/8bTU/U1YJsmTb8ilLf8M2gPpO56ZOSjrI0nc7ityZMa0GvNvhCKRW
         CR6T+cYAHKwVY1zu55KOrpMKnoMqbtd63WMhOjugz77IKabVXQYtU3DXsBxh1Y3YgaUN
         qEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811967; x=1792416767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGDJDRLWbmhL036D5uBETPd4vljDxOvm5TNYzKP1bqs=;
        b=rjMb53VSXel1eXI/egzzzthRxFfruptzquUfsS745xZ+adYADSfmOe5nK1b4Zgg8CG
         tiHH2fy+pJ9KFjfdro+UzexXhNa4tC0/yPSOfWkkKBUh+O/vm5ONIIdo9QcAbPqHl55y
         m1LagsaEdUk5vW5Gqw81YyohUJA+ksnlQQQSTcm8Zu0gjEsQDxR6RHZvMqmMYJe4Cdt8
         +Jl2CcpYBdV5hmZKeuUs1g3SaY2F+Xn/vV5ojD5i+ZMHFtN3TQ/L/o/tA/RC21qfnwPS
         wqJ+IC95EDVy8LuSUcZ52jIouDLpW8buh8IoavfL9OIfHCXvpupMB1buxcXxY8RtqtJ5
         maKw==
X-Forwarded-Encrypted: i=1; AKwUvByd/HvvAm34jjSmfVzkNsm6U+qrDy8DABR6oLbOX7FajAP32U6XsBDhPEx5PRebQXqEH5gqt0WTDj6kSfo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoyLScKvdFBQrK4tlGHAf/2q+Eh4k1EFMalN7eC5deiwRlhoPC
	ufm7czdoznJoyETXdhtyavJe13ArXGqSn/a1FJyJC7ZTYwi830JI01T7y6bVFr6/S4kGZkwxFQF
	qXFOxmlkUQk7j2HEwVjthyIIRoAaU1Uux9bFZ2tarjF71j9UIIIi1rzD/ne/00Jbn2fc=
X-Gm-Gg: AYBFou2rCCCnLI5Di06WW1beWIElk1MJ/t9D3YLRCtgJTJVl8wWStqqCjbGBVjNmfZL
	J1Um+v9bsdB4EqvVnjinzypOS0vKdhIxMIhTVugAIoNQmFyctZrl9tbHDHDO84qDodGoIE1Gr2r
	LmpAw1IiWKIj3NjaXlUIcJBvoaSpCwDC8cIJWeyfVS93NBaesACp/C34VBr4q4Q/cAtC8EQLsn3
	TuOFli88q5Hf16h9KeT93IEFzVbOXFWigAsrmx3dmQ1PlrA2XGLkgmjmBfEfDJ5Dx2W+y+keZ2H
	HD0j+5MY14aMUDld1ukWszydT6GYdTMSw6N0jpvjSkzBgmoh58eo/yZlU0wwKFkJcD+DcNi2xIl
	+Si0wmYtb7UXGJlGIekCOzbQj8HE=
X-Received: by 2002:a05:7300:80c6:b0:351:78a5:d0b5 with SMTP id 5a478bee46e88-3537deccadfmr18827489eec.3.1791811966923;
        Mon, 12 Oct 2026 06:32:46 -0700 (PDT)
X-Received: by 2002:a05:7300:80c6:b0:351:78a5:d0b5 with SMTP id 5a478bee46e88-3537deccadfmr18827397eec.3.1791811966021;
        Mon, 12 Oct 2026 06:32:46 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:32:45 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:11 +0530
Subject: [PATCH v2 01/13] dt-bindings: phy: qcom,edp-phy: Add DP PHY
 compatible for Nord
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-1-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=1293;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=GiBsZdkB5tHmSr9H8+rZ9GhQGrutXqFsjreZo5qOWtM=;
 b=2jqbWGPiUAdhEyigTemYqx2Mb/1LyGB9Ffl9QJSWT2YL0+kTzRvkvtCImVXPlEp9PW2I+kVrB
 oZPceZ9ki6aCBZT19uqSdq/JvEF5pIa9NU58HRL2f10qbkuIf/jVGpm
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX45PIhcasHJ66
 9Im+DQZo4zQ5jvJ7grjTId4+b0L9UzuGZu9Het/y95IDbO17RssJqxW3yUQuzaUCK3+NynESMvH
 5rcZa6JClNiRrf/IVCX/K7zE6nFUvTaL9yXVFE2JNGbUU180aSGeVEm0IKTkNbcrzlQcay7CzBH
 cvwOGOCWmji/DtBFHk096QNHRkwfGXINisE+makeRoL3yn/SNpQ+ypGXZqKkTcseSYj6VupwB5m
 5Z1PSkM5WvUCS99z5XvU4YgHtqS0irtNwnhUgteff3YxIjFYsh/g7sAmBRgJm4rfWLMPuAFhDT2
 qxcRQghV3DSlm6+aeDKIyGCArqIKumXLBRN19dmiurEbR1Q3HXpZ7kTwh7LKFxGrzPE7duq88TA
 OgPsT6H51Ub1PRktO/HJuG2VQ8HKOx3Mdzk7bg6CiVMtnYOs747XWnwt4HPvqGsHI22u1wuiw0Y
 NH1naHG9hFA7pnUHPIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX5iNnB8LDm9Yr
 AJkBlJGx1DtxIbgaZD0XB7WbVeIBMCEBbNHH1UyBYkwnhZGaCIUz0LR4PZYMajRW1ChLEsgu1cx
 QEb3cphjJ8DJf38Dgtui2sFX3iJpp+I=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acce17f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=kfPMoZk3nD7OVdbVor8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 0EDbTeeQBT7qwByAWtAWoQM93l2-QNW1
X-Proofpoint-GUID: 0EDbTeeQBT7qwByAWtAWoQM93l2-QNW1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Nord relocates several PHY/QSERDES registers relative to existing
SoCs, so it cannot reuse an existing compatible. Add qcom,nord-dp-phy
to the compatible list. Nord also needs a dedicated ref clock besides
aux and cfg_ahb, so add it to the allOf condition that requires
three clocks (aux, cfg_ahb, ref).

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 0bf8bf4f66ac..0ff07ddcb76f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp-phy
+          - qcom,nord-dp-phy
           - qcom,sa8775p-edp-phy
           - qcom,sc7280-edp-phy
           - qcom,sc8180x-edp-phy
@@ -74,6 +75,7 @@ allOf:
         compatible:
           enum:
             - qcom,glymur-dp-phy
+            - qcom,nord-dp-phy
             - qcom,sa8775p-edp-phy
             - qcom,x1e80100-dp-phy
     then:

-- 
2.34.1

