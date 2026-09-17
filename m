Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE5843CE7B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635828; cv=none; b=JDPvr57gEBLBCQS6z9FhDQNAfsWOVCC/BFKp8Gmpzmkf9pScDKnv0N4OTy90HPqxa3tuXCZlLeVQnF9RYCpC3m62OtfA6iicqSRWNvzkZtU9pONzmqlxBiXE/UO6OSMKRDUx07Mwb3SsG4t3LI+vnm/TWa8YjULbGpFp2TxVU8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635828; c=relaxed/simple;
	bh=IcDAGCApwlzW9VP3KTcIuDnHW3JGo0WtRYlUEepAblE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXc6pu2aG5BOoz4JmpCwFocbounpWWU6w7uoGfVZR85p8oZY7uTmKp1f6UOjdgyOlk5Y92njv8G5niOUYTmGx06jUlCXWSMHvY4GLIPZvk9QZ226Big8vZDAynrYVtzs38/a6cSWKRwDQWzD24QbYk5tQSe6hjZPqzuYkU+VTrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fob9RdVp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eOWuQHMc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fob9RdVp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eOWuQHMc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60Nv53702423
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ng/cbe08FmLIDygEMEc9kZI6ygAXI1hwXKHZjj6nkvI=; b=fob9RdVpfQcY6wce
	5dm7MTWdliW8SueKTrocPUg4DLuxl5ATitzYIMzuISbzYbqhR5fGc+OuW1NsdSAM
	lNdR4isLUdGzpOVBNSYvwN99DscKuSNQTXJQvTRGelVzUwdwKJnXVpgeINKRoqHw
	L9BT4wy/2wCFsv0AtQt85eGW41JAkCOrCQlcL8/n3+guGIdzwS2rbDWlIlbQV5c3
	mI+wgSZ5OPRB8l2L7UV8VlLfkdkvDra4yW/jATgkNO1+9YsU/kMlUzy+MiihhvXu
	GTHqKFJHZ2Lg9GJz/90Wy4u05vKt/S8toHXPemvbMmdQZbuY7GJfeRzYOWcxk+v8
	wabT2A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc9b7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:03:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53103416ef6so1471461cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789635825; x=1790240625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ng/cbe08FmLIDygEMEc9kZI6ygAXI1hwXKHZjj6nkvI=;
        b=eOWuQHMcPGAaS6u0jvyvkgdX1vFCZZR9SE2dffPMNLqgBt4m+qbLrqScPTYpmhDV+s
         HoNBedspGAoXsB0EgU/R1+eO8SPsi6dey/gz/0Ddqb4ZcQFqQpdsb+BVCGDt0SA/HFkk
         4u3vD21gHcXGt+SSbCduRrNMngKEmkGe91P+b+5v1hfMo4cODXXNDCW0QomNViY+EKRL
         Qa3xejk5NvwOOQGXY55GcXGfo7tsPJValn++YR5zWHuBONqqbmARGR3Ca9e3NwIQG+dY
         Z6F0K0OT70sQPWoQTCzhwu+ci8GFpYW7/cTKZB+nyky5vB7ZrYzV3jPax0/i02Q+wSUS
         rfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789635825; x=1790240625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ng/cbe08FmLIDygEMEc9kZI6ygAXI1hwXKHZjj6nkvI=;
        b=rPT0HUGRzg1o4KTJgREs8WrOk8Co1OBfxt2x8mhmP0Di91uk4awO8bVNG62Fkmi0UH
         vTePYz9OGO/H1QPai4tTHRpC8hXSYcNB2JMT+LN1b9gOnT17Iw/FhOFwJSXW1bEY1F6n
         27MqhJ3oNJjhbvMbLO2uplynQFguKAHwmABxrNS+EO0ac856jykHTLT1PVkhcONVHnqc
         NQunvy3KJEor1KMGogm84S0C3zSVnqmiU/LQTKE6cAXCxJIJmBSouWhUN4wSmz752g3F
         A6aqZtoIxq9mZxhDBJ1xOWbvfUoKHN3yv1h826Cmjgi3NakNxXiuHESwJIuWCP7kw6Rp
         Op9g==
X-Forwarded-Encrypted: i=1; AKwUvBxSpS7FLzk7RApOCWchyGQPOmU6B+S5Zpcj3PSnCWRI10h6RSDYBxSyOND5zLW1pgnwzeuSoUGaQNSyHtc=@vger.kernel.org
X-Gm-Message-State: AFuF++k8KRfXS6IdamXobr5wGSWUHKpNWDIodcv558OsBCfeDvi0LQlc
	dnFMsoJjVcdTh1pRWGQpyWRm9sz30z2fYOxlDftk2lVvym6rHAW1SZbmODyW7llHgaLIxphRkq1
	BY0s8lqfdi9ZqF2eLftIooihiR5WWKdXMrgea+Waj6yFVjiKseqJrgOcgqWV+F5M+pSk=
X-Gm-Gg: AYBFou0qplojj91LuajT2laYtUowujISBuYNX3BCxIBNjeJ3qkCL4n2L9IQMuv5C+0c
	7UHx8G41mOb91etdx4/r5FJQmi0VYvZ5GBJsiDs0wHguLDHNbSsmS+vOfc5i//4tL+mt6bIGPUb
	QHtrYZrP2QBqglGAP1MZ8fKlCYQ+s11sBffN8UOpAIqyOouI8cOFQb7kmA9IW3EN6QN5okJf+YR
	1Ft+R8NYht4g/qO8C8p5rsIMAS32r1YOvbRxJgPp/ITKuwQ6+gtROmjjQrA0C+DUeHh1duNa2Fx
	GxibrH3ZSJADZKUxCrqCV8gr6M7MfnQwYHdJ6nesR6I7j8VNyTXWb/R7k2GeQzBQvRtYK6k4tlO
	5EU68NJRH4K2rY31nT4VQ5WYGUnBsdNVr
X-Received: by 2002:a05:6214:e84:b0:90c:e7f4:8bfe with SMTP id 6a1803df08f44-9123d7482f6mr86577976d6.2.1789635824730;
        Thu, 17 Sep 2026 02:03:44 -0700 (PDT)
X-Received: by 2002:a05:6214:e84:b0:90c:e7f4:8bfe with SMTP id 6a1803df08f44-9123d7482f6mr86577596d6.2.1789635824317;
        Thu, 17 Sep 2026 02:03:44 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:891:4ceb:5214:a4e4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d240669sm2983343a12.13.2026.09.17.02.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:03:43 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:03:26 +0200
Subject: [PATCH 2/3] pinctrl: qcom: maili: Fix intr_target_width
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-topic-tlmm_intr_width_fixes-v1-2-3bc1d056aa6b@oss.qualcomm.com>
References: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
In-Reply-To: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jingyi Wang <quic_jingyw@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789635815; l=890;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=IcDAGCApwlzW9VP3KTcIuDnHW3JGo0WtRYlUEepAblE=;
 b=vynmX4M4G6kWuEpybMLIXWJ7ku7jZ8I4WeQeuY2hS7NBdNK69WLe6aiaX/pxg8oeEwVB2Goyu
 zpzWBzGaQiwBhnLCOqCuWJsLH6Q74bD1qyYub0eUciW/UdbEfMsKEBB
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyMiBTYWx0ZWRfXxv7bzIycsjFe
 BCfWW9x38p4PU98yo7kdAplggz3nxI9eclm0VquNKx+/eFINUMBK0SiggSy/WZ62W4GWjeLG9U1
 wQ0+ksgk0q6RGXxLnXLuo4lpqjC+9gljuPvxnq8GwV3m256/cM9E1nVCYD9oi1wKLEbuOgSE3Ge
 PEca27MKfFLI8kXkH27xciwq5h8LYB/+0JScQEc2BQxZhD4on813Ia2JQYdJ1Yy04dmtmMsGTqI
 aPzoVS1BD3lYfA8rdNpJNi184bUwxNr8DrSjqrffaMn6y0nKBV/TiID+Tf6O/oO81fLW9TT7g6r
 uXArAx6tBcIyarnktOcuMETWrPrLhMCzEnOlEfBtD8JdfBe5Ux+f6zGque0BIwr05acF6/9+xHz
 /vJAKMtKuKBilN5GqtgVDxOB+e3vnpw9/mO8s5I+9RFihl32nFCb7ZJZnRC2cfruuJSd9wbLyzA
 O8eXXxkOiIbXdC7u4nw==
X-Proofpoint-GUID: OjQK_yyM_2B9WqXakywnOmFfn6ZkLFuC
X-Proofpoint-ORIG-GUID: OjQK_yyM_2B9WqXakywnOmFfn6ZkLFuC
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabacf1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=7UxzQlbkgN4DJRjwbjkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyMiBTYWx0ZWRfX0k+E7ZTcR493
 CGPgVQyMh0NboQFgI+jDfm4wVxSammM9YGYZZy9Dgf0Qhr9rve64Oq27v/VVXFsWTwQGihpEezR
 0J7rEyHq8o1u6HkeqtpxcTGmCsfbq+c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170122

The default width of the interrupt target field doesn't match the actual
register layout. Fix it.

Fixes: 251b53103a2e ("pinctrl: qcom: Add the tlmm driver for Maili platform")
Assisted-by: LLM
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-maili.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-maili.c b/drivers/pinctrl/qcom/pinctrl-maili.c
index ffa084cfad6487ab6789000687ddbcc43b71bed5..b9ff0f4479410656cc73567ed494a1cfe25bb56b 100644
--- a/drivers/pinctrl/qcom/pinctrl-maili.c
+++ b/drivers/pinctrl/qcom/pinctrl-maili.c
@@ -47,6 +47,7 @@
 		.intr_wakeup_present_bit = 6,		\
 		.intr_wakeup_enable_bit = 7,		\
 		.intr_target_bit = 8,			\
+		.intr_target_width = 4,			\
 		.intr_target_kpss_val = 3,		\
 		.intr_raw_status_bit = 4,		\
 		.intr_polarity_bit = 1,			\

-- 
2.55.0

