Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF0B4BF951
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646785; cv=none; b=fgEmWERkabCqJHlfFsZrpIdjd2ycJKWadV5uqUqhqFNBdFYUYNHKla7MOOKFKmUv8HhNn2TkEz/FzW0Bm5cPD5gIkz4G6cPDn75+qdMPwJxecb9OFjwO7/lfVXX/+szLq+oxw18NMpVcNLLmQEDfl1omf4PvUoXaaKdtYipY9Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646785; c=relaxed/simple;
	bh=dRIORkLtErUy8tQv0r5xQE2yHwcn16W9lhrS1ITHzeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ekZAeduToHoj2U9wNWLLeZVuIxMaBIBpmx/sKgpO8E8wxo9OHveEOGlHNGVV5g1Y84HnkhOjj+BXwbAa4JZBEZDcoft3huYa9sqILQiTZz33RWLA8q/URfyHt88aEiG9jsCWOAmZh0kpwM99iV0FkNgFkMIFknrsQJ/cgHc2eDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7Uwg5eF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FzKI5Em3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7Uwg5eF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FzKI5Em3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZYjW2410434
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=; b=U7Uwg5eFG/pmFsnM
	xjn7dPDCxwjwcnMVZJ9pEha6boZUgOzeEhD0h0Jw+xbO+nHih2NI6K+0bwLOoREq
	AoIzbhQHSD+uRSNkJga4b3wv71i5fHxey2c2sr1/nF4Wh0KSFK1omFIkTI3FurZn
	oUsA2iw08xh80L1FV8YVvQ2azYF88oexBO6K9l/yZjBb90O0+7uLGGm5PJlswt5C
	LXxD5ghUGbpYy7NvyK5KAXltBWQVND9V7GdPiWfH6O/aohR69wQKIjkXsYLtMcYq
	iBkUKHrH5QXfU9M2+29tgnp2r5mAQsaVkAy+ozJr8NOxqI3sWsI72Vle4eTrOl6l
	iqCjdg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6gnqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:06:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e25a5f6e8so1502296a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646775; x=1790251575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=;
        b=FzKI5Em3ACbwlrSdfVBaBTqlCqdkwiOMpUVgiB45BUavS6wq1BaO8+jLg3tUsP7XjR
         Kxy3htgA8A7jGXsoYO8hl3+SkaKbLUC3Ok/no0JeyklQB6fCH3Too2zbx40Kudb+9F7P
         IzE1ZUQwpBvw7c4ER6+/RkoGSCMjM4MCwU93Kyw7vVk0SsqaWrJdOoaxXvbzsDBLE9C0
         Bj43miPut5uu51hbGofNg95102P68ItoOTw+l/6sgejYwaxN+7NWzlwo6X7E8OsLVgQ4
         H4WUqn2VgUmN8X3D6QyWXNaNc8Ye+0TMOD3CNQgbTG7+HgRxvKSz22bjTYHPMLIyQUEc
         NM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646775; x=1790251575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=;
        b=e3nBLQedD38vSm6WDUDW+W7TDWiiXBw1vKlbwxMHB9iOwFkQi2lGISz+YOzGfonaEl
         SGRFryqKf4+OHC5Y5QB9a/iG6E3r5ewsYUkUPXvl5Dvj1K+YGvjYq6htYBzV/i835G7p
         yElRJGvL4O8o/9hmQMdrMAk3NNia6Uwre7fh/S+DfS2rMTS0rXWHOwfjegnqTdZhaOI9
         doCMyZHsn1YAjrF8ugpGsiDSMyCP0lo6bL2oOXqCuzi693+MqvZm1VK6CiTnUMV8/K5s
         5EjmufiBfacTiBuRI9CHW+SilKULiBIRkk9Cd3/b0zvZVmS5QK90zVf1HqEkB0vgfZQC
         57Yw==
X-Forwarded-Encrypted: i=1; AKwUvBw3kNyXjv1K9FE+HIr8ejWTEsBrFUb9Ma/68H16sEQMqliuFERl92Y2RupAmDulSsBXma1iUsY6P9k9Lqs=@vger.kernel.org
X-Gm-Message-State: AFuF++mOJ28yeqyUxsgWBL79tmMt9vkgM5n+G4n1Lr0A+cQiEEevIOmb
	Nh4MMN+JhuMKYIs2YZCCSfGHz87Knszr37HZ2agvHAMBOWL4QV7+Fz5EDyDRzwwz4TY7+d/TLaZ
	eVGMGCo/aB5tE5d3IP/9IQOpYwrWF9baRFwzXntV0b4pokxcjMuH9FkQOm0LYgQBZKL8=
X-Gm-Gg: AYBFou0bxjQBVwjlg6ea8ZvNWY/eXV4WXYHm+k7TVj76kURRyfTrNYjRPwuEh/6HXwu
	hF5+PP7kmInlsewu/m8+4EmYtz3kncwbXdeO07Eqgi8Net6kuDWAMoPkH2FAC/WCzZLwiTkFR5M
	sT5Z8l9npbyBIWm1HG3iNlOrxiRK/41HsJvu++8VTbF+Nl8JyhZAWMFvsPXxe6wRd8JHHhTFAER
	jFx5nd4aloM1g6ZuNK6YYJizS5xQpVgqjMTxGvQi80v4CfgBCf6l1187i/cLLqffP9OjID0c6BX
	XGeECzgHD3Jfz1lyFumi8BnK1Xzda7gQIDTS4iY/6ud9wE4Y1nDy81fWrur6Sfh+xsEJCmw5SwX
	nA2XipfWZdiplKSX2srXWhmH5P2bDiw==
X-Received: by 2002:a17:90b:4e88:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39e1e30ba45mr15795516a91.11.1789646774867;
        Thu, 17 Sep 2026 05:06:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4e88:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39e1e30ba45mr15795404a91.11.1789646774273;
        Thu, 17 Sep 2026 05:06:14 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35d9869csm5007612a91.4.2026.09.17.05.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:06:13 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:35:43 +0530
Subject: [PATCH v3 3/3] media: qcom: camss: Add Glymur compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-glymur_camss-v3-3-1d0e2d47ad2e@oss.qualcomm.com>
References: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
In-Reply-To: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646750; l=1214;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dRIORkLtErUy8tQv0r5xQE2yHwcn16W9lhrS1ITHzeE=;
 b=nxyrFl9h4+kkxs5v1Hz/1ajWuTIr1Gc8gWV7jz5BGt7loaxka1cQ5RhKwkSGqRpfQ/S++FVgB
 BxTRaBQ3SFkAdZaZdLczev5MWeJ67nyhFZkOh7hCbvax5qVUeDTvpig
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: wYKWxQOd1H7U2NPNX2su0SDR7TC2Yt35
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX0ERNySTaQMI/
 Z+jXOyQXjM+SteBZVXEk5zTBPxj+a8RDy2venmlf6iWxgPGREnibL239800vUqv8ZT3L5906eiP
 LemOVC+XIhsRX8vCIqr9Q4+3smoGweyAN6K2WIYRxbldupq4SbB19bW17fRJDBPEH6SbJiMef+0
 LgsUStdCpKTQHd1K9yEBLV/hK9LN6Yo0dmyoM3wzqS6k3mFaSxsHucI0mNktV2yW/VOWl9H8H0h
 XWqxGYHL1YFB9FrRjbfHcecAeeI/wppPYGlSYwYxsGronuCkFnwq+I2gD8NioDf2B1A+JHshGo8
 BSeqB1Ec8AbSzupBImB0UyIdJoaMPX4JCH5N4aK83wIRVk3qXWjLdZMeMXFit6WAlf5UVKquDVK
 H3EIwJXDFPzvGvGN7c7wTSDGTgttVA7vv0sK3t1yRgbyhy4LOn0kFoPnSsCs8N19QbYCkwwUcjF
 Ag4gi9KC0FuxmXhK6UQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX11P7BnFGXGLl
 FgfLcH3A4jQAp/o5tGeFQFVS8a9pMky9qBEsXI8sNw9ZWI/H5L1zv9G5KiR9DE5Gg1VeF5DmcvZ
 ynXsiUjBkbkU0ZqlhK24TcoOY+qE7jY=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabd7b7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xYyVevvQUQiUFKtwU9sA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: wYKWxQOd1H7U2NPNX2su0SDR7TC2Yt35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170169

Glymur's camera subsystem hardware is a functional subset of X1E80100.
TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
three CSIPHY instances versus X1E80100's four.

qcom,x1e80100-camss is not used as a fallback compatible since it is
already claimed by its own binding schema, causing a duplicate
compatible warning in the DT schema checker.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..3585c63c45848793696fbdc3004ddc867a5f115c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5758,6 +5758,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1

