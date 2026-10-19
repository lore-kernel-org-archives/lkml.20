Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2724546278
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419182; cv=none; b=eByUDjvaty7mItsRUsu/P9qMwE0LaPXDc25SQkip44/mp9KtGndeuIJRoN7blKPkw8EkEjjKnYXqVCS0+4a+kkqCF6DzR3XTevhWMigtoEQoMLXYMaThs/uUGM8OULsUqO66LCuIofGaO5CWz2FtBArF/QCbTPCRwXFRJ8Dhs58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419182; c=relaxed/simple;
	bh=4evihIn0bxYc63GN9wtAllcv7hZd50BO23q7/zc5e48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+cNoBlrgv4xI5c9f19fsb84BxrVrCG1DPiO3kC+Zx8ulRHtI20dTfJxaKWCIUqdsoovAlw8FktLFEz2T1guPJV0aWMuE7/sVQmNc597YUb/41qo/Ggp2xjBgulxWw2pj/aojW/d2srIZGvgQkOHYB1g2yefVeK0utbdr1/7kUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VU83J1dg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ur5lCiOc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VU83J1dg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ur5lCiOc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0Dvm2971123
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Py9TTClt1j/q/B9ZyzNORZhfawN+TfEcfI3tLiHzs2w=; b=VU83J1dgHrtZ5lK7
	NUT+WvVVFlySonV6oqM2NCK61qBB7XJGgFaLfwjpp8eo+Wvne4Lh1yroXBMTotVg
	QL8OPH/BM5o4+jf4qPpEv8ZUdlj13ZmS3Zk3GMKYUG+kUA1uS7+ksyo//aACxi3+
	ctsa5CQJTk+SuIOFNdORTX/rSTIFieAL+CkEtp6fIMnztjgXlK11uWLgxYR3qgF5
	efItTDI5yrYbh8+9i8adyk4h7lfA4H8AugRI39ymz1xDGSZJXE9v2RfhyWvY8RDk
	5nj0ZO9NzfROT/rEP6dR1kXbpT8umGvnwzudOyxzyJSdDN18h0rpn7cjVU52YLma
	BshKjg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x9k2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca9b53afaso754697985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792419179; x=1793023979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Py9TTClt1j/q/B9ZyzNORZhfawN+TfEcfI3tLiHzs2w=;
        b=Ur5lCiOc3ATy9dPGIrY5boTXr13h1+rFsPUP1A9+T6BuMDxKgGtXywp/zKSmsCmEuW
         Bw9S9ZJaB+3L4kWUNd7pT7xqUVqmxd0gZqcvlP8GiowSUemd/GNCDnKN1u4rFvYX/cpi
         aOFdRxbYiErKxuQGexC7g+0e6xWXpYSf3niT2rcx8wsNZaFEv5KArA4kUC5tZwOZ40eP
         Xw22SAAFg1fOx8mt+2wlYWej3ZkeZwUxy3mI4F68w4xNRxph8ccM94MmXN4h0hHDfBpK
         aK/pSy5Tdse1XPWolln7DIxeNqwcf5DRA6Ha7MHop03Cdppk0+RUwORPzDistyX6DWln
         DGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419179; x=1793023979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Py9TTClt1j/q/B9ZyzNORZhfawN+TfEcfI3tLiHzs2w=;
        b=YQtk60fjDUfyK6hq8HSZh+TqZMr9xHWs3YrUiktkl6UaoCGMWDbgIWKKtN2/7mQZb7
         bDewLUxklw4ZKAE8gz1x8jlZ/cphz25cG9bMpJopw6aclGDAsq+enOW5iNXyPy0TeM+E
         WLGp9ZVNSRqJZH60d5lZhhLZpIjWOMsIi8yUrhoueNbGgGRX8ssJ7Pi8/puFYdKwWPj9
         8O24R9BuYdfBLr/ZNo3fC5daFtRysm694IwKqyjReng8djgprTyGWIDi1RUssB5x4zgP
         MHnIBuQ058/ufKRfyd8+bYjrwGK9MLV6ixpaoTBwY9QHgeQQDDy68EKHEd/2U9uBMxnF
         2Hrw==
X-Forwarded-Encrypted: i=1; AKwUvBzdiScZPCaNuNlah3j3vkMvm3s1TXVyAJtC5n3SAWmdKiIxJgW2lYNLZXcBbYNdv4U6QOIj89jjuOeRnYc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEJanR8NJK7sEf1AjwAmkUL7yAEzXL2m0t0Tl4Kviw10Hq093e
	wLL60cxJt+1/Ou4NCiRafvBM0RwM8e4wQD9U7QaY4K3ClT9z7uRy1W85dWnYp3CnTbgPJGZzZls
	0JxBYXhoVi6wGkG/7+1ufn8ZrjSFP0ORh0sWZWYWJpFq3e+JYi00CSusg4JAfewlkNYY=
X-Gm-Gg: AYBFou2JMXTnSgmeki5EMWR68J8FmoDQU5gx/rpdPnIchwZTL6VU5ySu5fkp4jybcxQ
	Ba/pelju2IaGmP+vALa6QojQMauNwiX6F+SbhNxmkjeEXF5ttz5wwsllvtKRg0ygqyGtNvn73yJ
	gW+rwc8oNgrNyfdwXKU0x3MxeLYqPCIqW5OQhaz2Zi+cK2CBsb0diU8rRzxeHtCLJMsPIe11KCM
	EkHGAJVOhND8rDVchnYyt555uuU6ZvzYSELoq9TgeJgxqMYukYeR0bZn27rGw+4YxTWmsOpfo10
	Dqr9rh6HLdyyQ8+/eJl7gF7//ZfapoTfK4NO7NDMY5S8EefH+LgBe6atjV8wpNIQyWaOOF+7sM2
	ebRcmMF9omc4tnOGFqMX1zKArYH9jNQs7oNMYFM9azAGu53pM4UaOY7fBCYf3kibNFyhFXmZJhG
	MF/Qpp8Ux97rQG
X-Received: by 2002:a05:620a:40d2:b0:93c:720c:94e0 with SMTP id af79cd13be357-93f29d36396mr1213845785a.30.1792419179206;
        Mon, 19 Oct 2026 07:12:59 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:93c:720c:94e0 with SMTP id af79cd13be357-93f29d36396mr1213839785a.30.1792419178603;
        Mon, 19 Oct 2026 07:12:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42ade9sm2015922e87.14.2026.10.19.07.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:12:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:12:40 +0300
Subject: [PATCH 2/8] soc: qcom: smd-rpm: Handle zero-length errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-icc-v1-2-c2da3934b6c8@oss.qualcomm.com>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FlXx0Df31B57IuZnrZTPHJb3Vqd4TKJsFeozt5W+WzM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iVfEts7JDn9h1Zeppli16gelEutWsW1DQk0v
 j3ZDi9UG+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYlXwAKCRCLPIo+Aiko
 1RppCACQqFAKdIN4mv7EkhRGPMsQzpnv8AESfhKraF7PSwebpe9pFTPEMXFr3rSc7EibVfDq/6h
 njJ1SJbVgwIXbWCI2aCBv+3/GiBLgwm7kdV5ZDuUQ7/ktbaX3NvpnOLj7yYrXgzOwRLW0LlU3Cl
 1zGsJ40L8qc8iUUdC8UfE+LRfNvyS9pOyXJ/jMIE7pMl0J666Ulu8pr81/yoAyyKwBgfYZJjpdq
 /U2T9epu98qDN3mb2wT0g2Kn31eDKYxjEU1rqvTUEp4exQWl4qlMaeHwgCzvKCl2isKBcCXRVOQ
 RjEy5PNFMeOQhLjjf71gISMRwAizsOgUw46OF6aG6PjtUwzr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: b9fEUQGFmZJRcvBAV9HOMg0tGfaYZg7E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX+4T8QunID8QQ
 pABmH4TxMyYw7q9DE8DYjMXqbKZsZYtuIwocAUYGEepUdcZOQz6mhfbxGkTm4P2g+5Pj4YPQW/L
 tq4QEaS9EKhCDUbaYQNJggmN0FIAsj4=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad6256c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=CuedHqBScD5EtFMGVU8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: b9fEUQGFmZJRcvBAV9HOMg0tGfaYZg7E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX9U19j0ua6JKK
 IawhnjrE6CbCiilVCk0ZOce3JRxg8VF+qopQSQLFt2Prl2XZLdXQ+mgcny7HBVRSVPNYk1J/Rs0
 h3iVvF4H60IjoUe78j0M+k4zAgyEQKbjoaO4cNtzQzu1uOMQhI2MQg77hTlaEO8MLhTi1vrllhk
 usCN8cZ8RVFZY/33WbCPklm64X+yBd3kr7Vmh6VrzX8ptok/eXU+Zh1LeIflVw58we8z3xbtzbX
 /vZWmlR1QOoM8WiCAQN9HI8KCUE+Y9HjyBIGZjR2qiDAE/bwPYl2kTkwa52gYRMWuBYnIpgg3Z+
 g/hdeEcOS6Zt++SQbRyRa2YtPCZrtHCQdVUoR72fyTwgCkSykcA9zyLMa+l0Jx/gBYz02lSAc4F
 tvOw0nRi8lcuMkPm9uJjRkfWqX1UsFQdp8Y3nyA6LXDQxXt5U5xwT/XuYO/QBYiCKGbOqdlpUos
 sptkCDk4DKD8kj3o90Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190056

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Prevent a potential underflow as the code below uses 'ALIGN(n, 4) - 1'
as an index into an array. For n=0, that ends up as '-1U'.

Fixes: 936f14cf4e67 ("soc: qcom: Driver for the Qualcomm RPM over SMD")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
[db: report the empty error as -EINVAL instead of a success]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/smd-rpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index f2b3e02abdf1..3677c645edfa 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -173,6 +173,12 @@ static int qcom_smd_rpm_callback(struct rpmsg_device *rpdev,
 		case RPM_MSG_TYPE_MSG_ID:
 			break;
 		case RPM_MSG_TYPE_ERR:
+			if (!msg_length) {
+				dev_err(&rpdev->dev, "Got unknown RPM error\n");
+				status = -EINVAL;
+				break;
+			}
+
 			len = min_t(u32, ALIGN(msg_length, 4), sizeof(msgbuf));
 			memcpy_fromio(msgbuf, msg->message, len);
 			msgbuf[len - 1] = 0;

-- 
2.47.3

