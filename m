Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298835;
	b=C5sTuPVo7nKAnezwM0LURNy0jDRr+EUqFezohrcGTDmVld9jqejbvdbe5L9RG8fRT/XG
	 iaOeNLMLuh1bFEi+p4XLRtq/+nSZnouJer8MZ0EAUSEMDpEndSpNu2ffIZ4yqDg5S143h
	 0AV3hpick5icvI/JPDiyPNa+7pddajEt0E2r6DN4xx8cPrtr3A+mzW+/vF2jKYrrfq75p
	 IJ0cHdpy/qx16kBmntFWF+me4HJvrTP78o3sGiYTkf0xwHUz9C/DWafqlDja8RCXULpGc
	 8T3cG+SxrnCuOPS4bykdYQVltwiWSqU7axAFpCo8WxV4yWOE8JZtVfkFulszkWoL64Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lDtTbVbyYNnlkmw4q3bNVv9nL5pJLpez//J97uSfoTI=;
	b=TR/3VBgM3o+15zT6x2IwOJgpwdVm/7sy5/9cSZ2a2c+UDZ6o04bLr3Z3/pVplvaNLaqZ
	 XI/9lRVQdZ3FFXYVNhtIeP+9g12h3pzLk4dSbHl86C3OmpHPaFXdBnSPwEB9p3SRI+2Z+
	 2bP1J1w8tKtazeXdAjjZ8yrNBVMYOHmx1ghiXeYS5XjFL8L0d/ZGziw4qEg1xEVTjTS3n
	 41WAjeC6w4/B/DY8MK0KcFdmsK/fvqXsrqnFNr6g/tvV6A/eoqcwrgCvJUHLtzC4wCvub
	 exNyDQTWkwT3GOHE1bsHX1PHhpyBDnsGaU4+T+g1GlYEHCQnk5tL3u+9H4lxevCI80A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gesxsjQu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T7jeFvKN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DB5606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1DB5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gesxsjQu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T7jeFvKN
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69THDfTl182067
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lDtTbVbyYNnlkmw4q3bNVv
	9nL5pJLpez//J97uSfoTI=; b=gesxsjQuwzLbvq6Cs8vMUlB1GXsxgtJh1kBhI4
	cwSVEpfdZFPNH2w+Mgieq9GWq+KvnRhEpD94nzFmaehIPyLDInvCFGG7mRBIu9jd
	jWPw1eEqWWC9ri4OvWQuZnVHu7vflAhYH+dy7LPLn7SJRjjrxcFzPCtDj7bwuPpW
	/L6JpQPDabTMdvrBCVjyM7EeaJckEnP0TNPipekt98JHUF7beHQdlqryCOLijUQx
	DoJgNaRAGvzZW26u93P6L30iZ7HrVjyO8IosiUfgi0adTjl53dM0+oKAPDQT63nF
	gRITb4z2/I1dzFYTohNiRwAR9JOV3oemNZbQ1lNXcNTywiBA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmac0rf3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:33:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a1e2485fdso4975589eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298833; x=1793903633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lDtTbVbyYNnlkmw4q3bNVv9nL5pJLpez//J97uSfoTI=;
        b=T7jeFvKNqQaMblyH7RXktRHbANi5C4ZexaBo4c/1cFGwzb9DfA5W7igf1jM2UJx6q8
         T6TjxtKeW9uewAymnAeQNJkhX+2yX8eRWzn3wVGx2QwlXzeUhKBSeRWJHUGBsARh2Yzh
         XyRpP3JUkCC/5ek4nGetpTVKKwjLj1dhrH2ZgIdsDc2+2iS1mU/g0xBnu63zQjMhhujz
         A2qFHN2eh8XvgzbMNK0/kppDWQDFn6Ykk1aSvRgDZa49wDYCmdpsj/E5uYhkGDgRGmkK
         nmmAHrVU4qyy/2/0iVMGtPnPTWmsRNbkDrQa5MvIE9EjbQBx2yDjcBWeeruvJjps+UgI
         rauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298833; x=1793903633;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lDtTbVbyYNnlkmw4q3bNVv9nL5pJLpez//J97uSfoTI=;
        b=CS9WQ8debG0tDONrCcivCshXZyt9+dJ9o2r7X9EHBUNyGAi3W/JoHg4Xnf+ZfYOQRw
         OGlP00IPNfMDOWwZaCfx0Mf/bsIkHrDRWESKHn/yYbcIjvAx52COrOS+LlztI1ougTkd
         Wt7W/ftMjfGazMbOD1NNdL2LS55KRN2V15smcLg6DYDTFa+gWgdZG2Xdy+AEW83blbr6
         Sf9uNRWArynH03mynO2q0cY/NJ3d8vWfziQMG3OgL2x17ygYG7WGFvpCxcJSn+5LqHjG
         +VkugHOoJ8Z0Aedp9FxJcq5gSV006H+A2+Q+6JEigfuz1uJDP7qjBLIfMwlOVD7y8tUJ
         ADVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxljA9tsxK+euLqPrSbE3tnkKi7zTt5IBw+BAm32vuTJ1CfCWacx9f4wMMe17IXKxfF99QViu/8mykc6Yc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4C1Ytib/+/35GOZkTd4UZKc5YeqbgHSryugzlMyHEhNxwtPOl
	nmBcyhnDnvM5JqFBhuRnHx9ut4eh+JN/GxUv96kCLYjOvxVYZhFd2Qyln+Y291Swu3BT9f6uPwV
	ttFu9UW3QFpV3yngHCm7OjsRUBDJwNTbE+J5afeBoGtXHjRdBm1PLnQmuHZ5rbGmAH+KY3BsrtV
	o=
X-Gm-Gg: AYBFou0ZwkvqG/fOYfe8rKJPpZax4mvnRtBYfKuh6lNotifzzucD87crQPQQf6/izk+
	JSXwz5//DCCJrjOwK62Y6hgfRgsld2FCHiwhao05u0sfUzbjFxaPuWYaIcIknyvPRHpWv/utsRa
	gST8rj63LnoKWlLcYKopFzgJNLnCI5Q9bo5UeaE/1FlL3qZF8T5dV/G4SVyjnTwHMJmkBO5Vvv2
	heYSDIdrllOTT+fEeo6VJWiuhkkCB+8UgUFD0/E4V4ETCjEK68XkcD0uKDNpdsyq5GZzx8lon/P
	brUYqmhSmDjGNWebLeR28778Zae08uJocswAtD41i2zmxGRoEniFdlstLARK52ZOKEEdplntRim
	6MW13TOzhxb8jKVqvCfB+qQ/+Apqc8hosupshtBs/AN8eS/aUdn3onN/BQvvyCGiH/hRDSH01fo
	eVvx4+IibOGiYzcdvGGJsNnt5qcMbLtoU3zj+8oVfiGA==
X-Received: by 2002:a05:7300:fe41:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36a42401960mr216467eec.7.1793298833329;
        Thu, 29 Oct 2026 11:33:53 -0700 (PDT)
X-Received: by 2002:a05:7300:fe41:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36a42401960mr216443eec.7.1793298832801;
        Thu, 29 Oct 2026 11:33:52 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:33:52 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/6] Mark USB controllers as dma-coherent
Date: Fri, 30 Oct 2026 00:03:37 +0530
Message-Id: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKR42oC/yXMQQqDMBBG4avIrDuQRCimVyldmPirIzSWjJaCe
 HdjXX6L9zZSZIHSo9oo4ysqcyqwt4ri2KYBLF0xOePu1jjPqwbu3i3HeURGWhjeGNvbpvahppJ
 9Mnr5/ZfP12Vdw4S4nB/a9wPB/jvidAAAAA==
X-Change-ID: 20261029-usb-dma-coherent-e9001f1839b3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=1176;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=4DZan+29ikubxEO+r+J5U3jgJ6tcstLjYAL6m7E1rmA=;
 b=RzRo8HMqpQsOenSDrTd9s7UV1CoiKsb9qVwKw2ezQD6MYoZa18+BNaI/wj73upVE2xDcEecqd
 EZh5u3bE3InBs3x9cGXUd3BlmJfOEimnBhwo1Ulr3XdXIdRO+GE6blN
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: unOOfM2ObbgcPbgOmTvdS5J6V47cEq9Y
X-Proofpoint-GUID: unOOfM2ObbgcPbgOmTvdS5J6V47cEq9Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX7uM7AxteNc+y
 t9NLXd/5cwBA1iKPqSYU/rP20idOj76CEJNd7AMA038IHT7KyZhx8UZ+Qk7DgYlMPe8dixsGaz5
 1EgEUEa6ZGXqKd2EiL3DBmXtbG74IPs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfXw4y2yS8D30iG
 WoSCwMyHGzJYEdQCpdtLRZCBb4ZtEaagkN6XmQkBnruZi83VmBYsnrGyYMYmKtG0g45LV7Ae+vm
 DIOAYBxySNILJ4C2qah6H2n5ZAs1EA/n/KayHvofpBV01K30vIMBvnSJBvZmEwghHG0KYzqcqJq
 p1HYqn/2JYTGGcBNstvldoDeSPgmeRBvXFVoNKfeX9teUrUvX6hpgAj0WAvtdEGELowpUdRJieY
 bJ1RGMsS+RpzM1XsY1xIx4q9P0geXn1pfytdFDanTudAvgcihlrdhe4KZWOG3Z/Uy7RV9nq3Vyj
 LG2etw7GmVvW64OaCjUx0h3Eh/+rZwmDXazGWDeyCmZ9jkvegITTq2GHXDAykov+poQWpHsF3xo
 v/qUPtmuiicw8dsOvP3kLPSQsYwn60W5YXLeZhOmUm/b/E9MAl9hSjVTTLZr3rT8YmjJJ1QKJ22
 fiOH2/H+zLWRUOSz7nw==
X-Authority-Analysis: v=2.4 cv=I6/w19gg c=1 sm=1 tr=0 ts=6ae39192 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cCNIK-7_6ZKse1mBRbMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

The USB controllers on some platforms are DMA coherent but that property
is not marked in DT. Fix it up.

This series has only been compile tested.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (6):
      arm64: dts: qcom: sdx75: Mark USB controller as DMA coherent
      arm64: dts: qcom: lemans: Mark USB controllers as DMA coherent
      arm64: dts: qcom: sm8450: Mark USB controller as DMA coherent
      arm64: dts: qcom: qdu1000: Mark USB controller as DMA coherent
      arm64: dts: qcom: kodiak: Mark USB controllers as DMA coherent
      arm64: dts: qcom: sm8350: Mark USB controllers as DMA coherent

 arch/arm64/boot/dts/qcom/kodiak.dtsi  | 2 ++
 arch/arm64/boot/dts/qcom/lemans.dtsi  | 5 +++++
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi   | 1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi  | 2 ++
 arch/arm64/boot/dts/qcom/sm8450.dtsi  | 1 +
 6 files changed, 12 insertions(+)
---
base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
change-id: 20261029-usb-dma-coherent-e9001f1839b3

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

