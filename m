Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE1843CEF3
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912763; cv=none; b=LaLWPwQqWXJ0+7bU7gYzVc94MB1IGPWKGWlKH6lkuG2A1GXyQszGlPRmeim7EbuueKvh6RQS8qbyyiB8A91ctgNo4Y9hYYRIbRRVEhgxdy0k3FbHKoHEc8RJVLgLQgWFV23VaLUu1Cu2XL1dESir4t39Zhk74MKBACimuof7DCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912763; c=relaxed/simple;
	bh=8ufTlczbQype1yUPrXZx3FbvE3v5McTpVj18fSvYKig=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tVUtCVkHjgO73efw5xD7kwkNlvGFJnwtwM+M4ycW8FHXiRD1nK7rRaV7qyyAI9q2IwnohSvxsd9o6qx0dpZVDtGOXtgvMzNihuBUqx4v/0k5sS7lliIeZJBxw/JxsXc0cQjEAZji4dxdqgcRZpKri5A2/D2L0y9kEk65WXNFxxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDko0p6p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iprz5AnL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDko0p6p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iprz5AnL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBoMo02762242
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZD2l9pEwB6DB+I/AJudAh2
	5zH9LnaG58yd8EK0sMN0E=; b=nDko0p6pimunjE0TlO9DRXvWLAT2M+Lm8bd2gK
	OhYmCYvahx5Bdn39aN778EduckJ5+gAuFDO/CmMyPUexb0+0L/QSkNm89F5rxGda
	9s//nMOcn1kIpOf/I84LIK78puo3CPbtldfrHLit8Yj80LvrOxhhSUXCrbHbCmE4
	iZys/NV8sqkxV792tkauUcLbNXjnSovgXb845t3MwKsZrKTVFHdPFyNHwTUoXuff
	65gbv4bJM1O7HztpWTkwURer91tpbgETStMY1twujOJNqC+CAE6CmNGEu5yJO5T2
	SbYeqBilnPu/4aaJnc4vtdqSgKCjlTP/c3PltwXxOURWU6Dw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshd637bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:59:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91242b356cbso30564936d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789912758; x=1790517558; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZD2l9pEwB6DB+I/AJudAh25zH9LnaG58yd8EK0sMN0E=;
        b=Iprz5AnLu85T/ikMpp09RQEJK7nCEnceDp54QSZM8esAkrx5JPi0Zy1/54NYivSvBb
         DaFu6OPjBw6xYzQaGVDbsUxYHgyHG7aF3NYWZv9YvcG9nmOwWee8sYNotQiEqL8BWQh/
         Z7BD7RKs99l0Ro1/M0HaNyEHGrm/F7cydW4UwvyFIOvuy3MRTgHMfVuxXtYTjuHmYb7h
         j/SoQm7phcB32hhp6AdIVXFEQfgTMtkpDY3gQ3stkriqqakI4GxhKKzBdZZEzl7tLscO
         v7m5OvfsHO8vKz6rJ2SvyTzal72w8GQWr4SaSt8f7eYhJ1oMfcOu6gheiZuL7e24cop2
         Dzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789912758; x=1790517558;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZD2l9pEwB6DB+I/AJudAh25zH9LnaG58yd8EK0sMN0E=;
        b=QlE0dY2mavWgmsHzn68wHxPWiz2wkqRayr9GnKQiwSnuI08yUveomd4JTLX8vHxK7r
         tXHsMnSjSfaQHiSC/qFKQ+emBp3K7fNfGQs+DXIaRQYcnif5iTGhulzUITOVJLwzFIE6
         8cVp4r1OKxjYY2sOn7X5KgrgrLa9MicROi2IVIG3yQlkZLUWQC0xQI6CMncz4blxuL/m
         jNqvpLMT1CW77FJmEW5N1vET+ciGvDST5mCjraSTjxaeLL0gsFYH4MQXelVAimoqba0/
         w0D94IPBXM/i4AGcX1b1Wqgzc/1Q0ojQLEreXhAjKhy6qDLXm4X+8vege/ZAc1plItK/
         v+fA==
X-Forwarded-Encrypted: i=1; AKwUvBzo8uaUSpy/KDEdsXzVXIbbvt64MYI/xP71mswJowpvxZwmkkgL6tdQBbz4TJGQi6WXveMkupnD8vREUHc=@vger.kernel.org
X-Gm-Message-State: AFuF++mQb8GGxjaR8bDQ6vinnertBFORTgf5IeQ8F0K8UrlBKN4hj6yN
	OZEkto794Fs3Pq3bH+jrrsyyWyfo4J83lpKzNOHQ2mJv+r6v8pilIc/xnnFu7Xq2MMm8SWpbf6s
	xkUhjNxuGcYx0K8T3IIcibqy96h/awVg3QJ0XhPKlFJXwe2QAgw0K8RhBaFGSefq/1hs=
X-Gm-Gg: AYBFou0UMmQUY+bSalBWURDFmHFIHtjmtJ+1aJrPQBPI0NEmeCRaCTqBbLTSSNuPGuW
	jAtPcRghUiDIat2i1gH10Hldt5qfXLatwFMTRv3XU7Mx8rP91cBQT6oOhmsxzbRGG9S2TU29uyt
	CaoPbhKpNNUJLvpvgQ5BNr9xhB0+RZxeVgQDahDiGW+FnO6F6WuuifcB9RZujr3/aVoyMKvcnDL
	3lnGiZsBDtQ+utgUVoa1Eqo/8HlQ1wt2Jkcvv6XkDa7l+1B5BTOdzYmjv2ESZll655CB0v42N9Q
	e0pURHGywoLxmhrI1JZTeWpN64brwBaP14RWb2HOcgTDJnOny7mPw+6I6DTb5fw03uBK4GBhpN+
	K/fOaL4IsCB5W7V97pEpJ19DyD8mK+MjlfGUx36YcktggYFWBvFq+wvkPr6OGNYCJhGk5YaWWI7
	UYYv5jy/FFwLXg
X-Received: by 2002:a05:622a:181d:b0:530:d95b:ea47 with SMTP id d75a77b69052e-532b720383cmr59301821cf.25.1789912758103;
        Sun, 20 Sep 2026 06:59:18 -0700 (PDT)
X-Received: by 2002:a05:622a:181d:b0:530:d95b:ea47 with SMTP id d75a77b69052e-532b720383cmr59301481cf.25.1789912757612;
        Sun, 20 Sep 2026 06:59:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a607678223sm13620541fa.39.2026.09.20.06.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:59:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/3] phy: qcom-qusb2: sort out register layouts
Date: Sun, 20 Sep 2026 16:59:12 +0300
Message-Id: <20260920-fix-qusb2-v3-0-c273e75c9fb7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALDmr2oC/23NTQ6CMBAF4KuQri1pB1vUlfcwLvqH1AiVFhoN4
 e62uGHBZpKX9/LNjILx1gR0KWbkTbTBuj6F6lAg1Yr+YbDVKSMgwElNADf2g4cpSMAVJ0RwJhs
 lDEr7tzepXK3b/Z/DJJ9GjRnIi9aG0fnv+izSvNtzI8UES6YaxjhQBserC6EcJvFSruvKdFDmI
 2wBvgUgASd9VrquJNWy3gGWZfkB3zT/JvwAAAA=
X-Change-ID: 20260702-fix-qusb2-3600a65bfcae
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1815;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8ufTlczbQype1yUPrXZx3FbvE3v5McTpVj18fSvYKig=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr+aymqdqS6JidCXr9caQBTFeIyIiRpO0D3SDi
 36D6DP6IKuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/msgAKCRCLPIo+Aiko
 1XxtCACyKgvb+ppDsi/WTFJtiq+BFCATjG+5l+DK3b5oF6PgGGRAHX/kJ3UN5GzRHpCxucOYSe4
 T6xW6wjjLv7H6zk9jLRTor8yWtOC3IIc3IECRZxMsqQBVy8DOvZbse5qV//hXqri/+wTz7V0d5O
 hZRjwBPjKRjqg0t+sMC046YJ4BBy7/VwvoKBnhoKX9poy8sAC5ofYozF8EdCvolml/rO91oredw
 +2nJfheOHqnyPGdIcSwNHouVaiC4KYdY7U5HLMWh5xVNYyJKrYJVkiZs7oagRgMWQIoid3fl7dA
 rTimDcmJL2FeADbzQMtkbd0JVWd4KWI9QJ675NYrN/AUvwWG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIwNCBTYWx0ZWRfX1MkQKz6Nuc+I
 4ETf1LjvLm67HPbmyo1EEkmc7kNyd3Cxo2iUKiu3hsBOAnlfu4eMKMVkaNAzpaWO1HYrQVhQk4K
 jueRYuuCDwldlKBJ7jeYDrvFBYYMVTHD+AnyYB4zDbANJ/BnjxQqddgyD8+gbOW6RuNE1t3ELKn
 AVAtwH1uPl5KMwlWrpBCvRbbPVQkhjfZ5Brktc5ej1y3HAEIOoeh4f/ASlQFBLiP0OQmXMpGsfH
 RfyLQquYgyyD3Ruc6x5TMOX+/PUb9WqmfqsQxzYtlGHF/my9anBgDcvLKIVLyveap/7YlPQTD2y
 ZKtWNACVfBsFpN8UVFdeX8krQp3+7Y+oUf3s08au6v7ojmb6HqWEuOPFMRlbKta2tbS3CZPQsXQ
 Cd5NbBO0mpVDik96L+bV9hEpkuFn5GTA9wIyODFxlCbBtLQjwXMYURPflpN0eyqqD9jZjbYRnNS
 r1nA6nSFyn/AiCETdeg==
X-Authority-Analysis: v=2.4 cv=RMQmjIi+ c=1 sm=1 tr=0 ts=6aafe6b7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=LpQP-O61AAAA:8 a=JfrnYn6hAAAA:8 a=vLZ8uGs2IYTldnpWfJ0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: pZ9ke9ZoIh0M1I2z5AvzeGjoeNY-Nx4F
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIwNCBTYWx0ZWRfXzzj+j1xNt0qD
 ZWxj04dX42FZt2tHM2lCQ5nrAWlAAjPWDgLKGCHas0MpYrr9d07QwfvMJIQW9voMwmhb6W4aECL
 Bd0VA1EDQqzp4G78CQBwH7xzvyTtbYo=
X-Proofpoint-GUID: pZ9ke9ZoIh0M1I2z5AvzeGjoeNY-Nx4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200204

IPQ6018 and MSM8996 use the same register layout, however for historical
reasons ipq6018_regs_layout ended up correctly definig TEST1 register at
0x98 (because platforms using that layout didn't use autoresume), while
msm8996_regs_layout used TEST_CTRL offset (0xb8) for the TEST1 layout
entry. Fix handling of the autoresume register and definitions of those
regs layouts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next (Vinod)
- Link to v2: https://patch.msgid.link/20260706-fix-qusb2-v2-0-8d9cd73b1db7@oss.qualcomm.com

Changes in v2:
- Reworked the series to enable autoresume on Talos
- Moved autoresume description to the regs layout, it is a property of
  the regs rather than a platform.
- Link to v1: https://patch.msgid.link/20260702-fix-qusb2-v1-0-b5cf55621524@oss.qualcomm.com

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Kathiravan T <quic_kathirav@quicinc.com>
To: Baruch Siach <baruch@tkos.co.il>
To: Manu Gautam <mgautam@codeaurora.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Dmitry Baryshkov (3):
      phy: qcom-qusb2: enable autoresume on Talos platforms
      phy: qcom-qusb2: correst PHY description for IPQ6018
      phy: qcom-qusb2: describe autoresume bit

 drivers/phy/qualcomm/phy-qcom-qusb2.c | 55 ++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 30 deletions(-)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260702-fix-qusb2-3600a65bfcae

Best regards,
--  
With best wishes
Dmitry

