Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9CE38238C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763843; cv=none; b=X0LpIh0imIfqwbBMFxXljH4ePlxf2LPnt8bGv3IQTyfh1v15GUQW8H2+xGVZBbC9UT+eD3cV2aJZvFemwb0CtTxsxAdpkDeIKEm70Xlbypu0v0SDt440T2+U9H9Iq5J3lLHpgRmIUvcoIGVK3YXYSHQxAkGtPOTNzHhedC3sVWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763843; c=relaxed/simple;
	bh=/tVXMe1X40jBRWP2+3mc6TsHLn4raV1bdUbMpmk1/+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d8XJrOLKLQgzHXlp3VxCyrveC0uMRztcG7ZHlZUabNGpQUSKbXdzV8u+bqMPi8wuMt1owcrW4Fzdi1tvb3On0hdA4xXj9tU8jxPS/2JWxXb+/ay9nBicIdZheXzLnNZhc8Aoo9/m1H6v+wpzxjit5iQLhud11datnMW6d1269L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6RdE/hW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aedQ5GyW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6RdE/hW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aedQ5GyW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGvc9B992174
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NrqpIZV2QBG7L0QYtbs8RatDKP6IxZ/Xed/zIM03jdA=; b=B6RdE/hWm9VQq8Wh
	ntaZ+Hlx3py/ZpDkiE6W2YcEyOrA4IKhtfTPTJU9NAlBpHjGb+j2Dsj6RoKR0ItF
	wc3wR/7ED3dBZE/GiCKgX18XrvAfrcQ2uJVLIHG6Nugk8nbc12B2bXfoQGbhJ5dQ
	60UHz5idSiROq1hEEMgAbYN+C3NJCQzMvX8YfjuULLpftVm5MtxmAEYLStYWNQL9
	lz50OmUKmU1mKtXxnrS/g2H9UWIRguGnGRky4jUKO1WNXt2k3iGiVN1P8K1zCBm6
	0jWWXaRJL2y6wQGLedtRFhb7I32fSd7IcOzAud0mrD/ZBmfx1xBieatavmy/RHWF
	sLlpug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9gaw6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:03:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc73f47bdcso14685825ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787763817; x=1788368617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrqpIZV2QBG7L0QYtbs8RatDKP6IxZ/Xed/zIM03jdA=;
        b=aedQ5GyWbK0gVbDW/zuWOWFKZlDMYdydmKRNmXOGleZhfE7HH6IeDuAwiSFTExIDlc
         DuboNUn7j+W/rskal+a765uR0jfYmGZyspnPmcimR7Hr+i01lm2REZA6aFyTOBhXdkyT
         6GOOPxjpOm3Zz5bJEVl7k7yah4qgXHFfy+G4efEdJAHKwWBgUs5qNmd7n9LZLfWBWiGf
         Rq3r5a+UKY9Sg6zLy1Ev7vUH8eWLQxAl/cVAeZ4ttr/QtG1EQwrsdFWyZcQnphG5W+8X
         2iMAXEWjKCq66wYtui8L7aOCy9nVI1s0wryWSIHRMUGPHE8m4i67amEQUpTi0v+XCYQQ
         MHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763817; x=1788368617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrqpIZV2QBG7L0QYtbs8RatDKP6IxZ/Xed/zIM03jdA=;
        b=JeBm0Vm6h9+IXCPZXaRP0R2M8V1//K4c8sV7L3fZXaa2MifKHv+4VypDexBJjj7o+0
         FBl8FuKFSCoWBe7iN2LAU31RHxSv2+RYYDIWyA1+Ym2lLPsL9yRykXao7sAGdSGv1mC/
         d2yHUybEfnSAqYr543NLL1ND1LA/kQ5t3hCV8FzXzKdvS3y352cwjb2KnGZz0wnDBd6B
         ODtiBoIttxbxa/LKISamFScbOzUU63rRMcCC4EVKw/gBTUsPLT8Y1hc94tDQati/W5gc
         zWkvO9Dqs7Bo82uEJukrXEgLUgCqpLxn/2Ki0EoJl//I96Rv8n9t2BDn9RTzxqTzq5fT
         cL8g==
X-Forwarded-Encrypted: i=1; AHgh+RrbNIohSQcejlT6kWho4cLOsCONdDqMF/W+OU0chdLSQDCyLlvQkailhLkSMNlYUGsAqmtP+JFU8UIEA3s=@vger.kernel.org
X-Gm-Message-State: AFuF++m4Twycr4wm2vxnU+3xpEDFYlpPnrujQ6/S7chAmkKxwKJp5ob+
	FPoCye2KTIXj14eaxXEVLCjNgtWhCSTgpfM/x5oU2/ecQuc4IkP44xDMw91p4L1wP0Reslep6jW
	/mySPM9322mZMWn5s2whimyKthkKONSlPJ6Ao5Hjp7L5BVYY5G7LA8HIFAQbTKxcVRoM=
X-Gm-Gg: AR+sD11ky0gU+v74JMW2thqjCsx/FDtj/iNlNO9IEHbaugriDVMCe/56LpD5zpkkePD
	elF3n9+G5iK9TY7Qq3OnxBAy5l30bLYsMgs07GihhvVILeSgcA/S/dBOpgf31Ki6a9ewbWgx/ef
	RcfS4IiesC1dq7Qmxbd/o8j5RagXRMl97xmHQFdc3WgdsSj1KC95wtzjFtzq5HYOIqKUW5OabOC
	waqHTv7hzgfXVskAGVn+xYpPURdF/vTPXRzPlF9iym5P+ZK/9981u5dCQMbQRPj5uyizY/EbUbM
	vFc1nnVOYDplwDF0F4QLGaEvfZe+4yA6kv3A4YHdhcF6YVKiHmBS7W5lUUNJxSVc3hgPMTykxEb
	d5RByAPTKHEznQkK/ubDK8uNTacgcy7t+YV4dk1lcS63tQ4rpAWFIWh8t2+e+PSmuHUVbsg==
X-Received: by 2002:a17:903:94c:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d707b61486mr154251815ad.13.1787763816887;
        Wed, 26 Aug 2026 10:03:36 -0700 (PDT)
X-Received: by 2002:a17:903:94c:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d707b61486mr154250195ad.13.1787763816258;
        Wed, 26 Aug 2026 10:03:36 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70498ca3csm9938285ad.31.2026.08.26.10.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:03:35 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 22:32:54 +0530
Subject: [PATCH v6 4/5] phy: qcom: m31-eusb2: Set phy type to EUSB2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-eusb2-interrupt-v6-v6-4-ae2601cfa80c@oss.qualcomm.com>
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787763791; l=943;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=/tVXMe1X40jBRWP2+3mc6TsHLn4raV1bdUbMpmk1/+4=;
 b=8AUWnAkBRSOaoJzjamgva0txDu5cduEp6C4GlNUbwuGYz4bERAge9awi7ni4Px4gFenzCk3KV
 iLYfRKBeDS5ACGWk5G6PmSq1X/KUgugw/DIU+DoTlYfnxf/ZFDPgogk
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: wm1pksf0BSbYUZOyp98LhGYdyvkJDlVY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX4cbbo2lT7+h9
 mG4xLVTI5NzDz4UKctQ6SSv2U9OXkP8V0z8+BgjqfCPDermqPzP68YRz/mZGXb8ZmjA+NZTdA4q
 9wq19+Hd1vuR3oTTqOd09URbe9O2BfvnsjAm+w5wVjREECVzBrJu7DkCzvV7Dx8cBbEUxYDtLGd
 v7qdyWiPdhr2LwfQen/pKILCNatu+2YEcplLf4gPQF62voZOPNbYgjIX1OQcO35LJNO+Rcwjcmj
 OPUZzjptoEZ9w8ZW6r+Dr/vxWm8lm2rrLZ1InQYIOwp/EA8tppJO5pHFpplyWLpc9/zLKWccFYa
 mKmzhqffu6tm6Hh4P8d5bPQqDwiPvp92x5IDBp7fYvly/liagSILV7QZD3eBmajmY3IegtxL0JU
 u9GIYEu097tLJ0jgzNNT/1rqRrhWCqzYqXfAaqPGvTl/TWaGJjCoCTyzBIO6mXVdPq5dh7pFBhZ
 cCU07inODF2D94/8jWQ==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8f1c69 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GXgYrK0FegosRrsl_UwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX9Zhvkvc5nXx/
 v1W9Zk3vacPfOwSvyK11FNzJC7AkunffgbuXwIO5W/sLflt88SvdzowPYRQNabo3G75Px81Fc1p
 2zSaEE5q2nTgYttA6aCYveo5ECbfK6M=
X-Proofpoint-ORIG-GUID: wm1pksf0BSbYUZOyp98LhGYdyvkJDlVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260141

USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
connected to it. Set the phy type to EUSB2 to let the controller know
the phy type when queried during its probe.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 0bec8657149c..7e6b16b6952b 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -277,6 +277,8 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(phy->phy),
 				     "failed to create phy\n");
 
+	phy_set_type(phy->phy, PHY_TYPE_EUSB2);
+
 	ret = devm_regulator_bulk_get_const(dev, M31_EUSB_NUM_VREGS,
 					    m31_eusb_phy_vregs, &phy->vregs);
 	if (ret)

-- 
2.34.1

