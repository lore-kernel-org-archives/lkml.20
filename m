Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418304;
	b=ALtlt3zN9990N74LIG8z8d+FEuC4ELDImsSkdm7YTBtTDiSJxzSIJv8n3aGwV1msL2oH
	 xqwLZgMax1CSMOFsRJFyv9UHow+swsQxUTsKGWtr9fnkF5trq9/Jd8NM0iz3QQKIXM40k
	 85ENz71dnBuW6movMJActB8g5yGfF23oYQBB7Sq77yBaeNSxwR9+eV77wn5bla4CQiZMx
	 6ORU+cKNY1kZObToq+TC8r12yc5xpkaY2iRCDaXekl50wpV0EpyMiJCe/5zbcbpI6+DI0
	 vOrXnHSyF2jRXB8+bGXmg61+nANvwzEMb+5eoBAnV9PcU+E4+xfhAaXFZ+J6D73SgkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418304;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jNqtTOpN/CMznlWqUHTAHAik8BOVvz/W5FrGr0oZoVU=;
	b=oX7SSbZHm64GrlAA2ddaEW4wxwlcwviCQDid8QEI2PCxW5nupr9O76niTqvCPNbiJNPl
	 KeJu8Z7lWqeKV1lby/SieY1/gPnFQI/3a8p39TUX31oMe3O4qKHZzHsQ7Zh1mBkk5Xwfw
	 2/hDVglHhs43hw270fvx4G/VVEJUmVPNY/HAU2Ts3qwlT6VeCIMwgnBb/TXSaBMvWLcqS
	 tyn9zy7OcorfPhEh9hezKfFuuFdT3/DafmlZpBUDOtC4OZj4xZQLoGTnmADgqdvDIkv4K
	 xdu475RCIauzy7kQ/4DSRVgJITCXvwcPaVMYjD9sZ07zVgchKXRHsAK17+KLLsJpY5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="C+sKB/gQ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YrbUhIWo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D012606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D012606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C+sKB/gQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YrbUhIWo
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF04JG1665577
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jNqtTOpN/CMznlWqUHTAHA
	ik8BOVvz/W5FrGr0oZoVU=; b=C+sKB/gQLv4StcDpsCWIBr4fMP0qQLPcNDkjcK
	g9H1E3Wd8zsaCq+vlsceJp0gbs6DVlHjMJ47bucBVY9APPwGVJE/DL9cQGYSSPzZ
	FxTy3QDUV/VD45bp1OhBFZiUWiDyzJzVZgxZSoajT08YYXHoo+JD8A7KwRwrOltE
	wbKaX0OlMVwtGhh8G9IVS9wGybEj6SlYH1mY7IYmRagn3XeaL2YuxsOSeo0EwzQd
	WV+DO/itrrWqoT4sNM9LJXK4fvWIzu5pK83mhuisrzcww5UvI8P/CpjOX8N0pEVQ
	j7HCrzYTPTa75gXjpxclzUtHbDKUrB3ExsFK/0vKWA3qMyQw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pteqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:31:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so4822060a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794418302; x=1795023102; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jNqtTOpN/CMznlWqUHTAHAik8BOVvz/W5FrGr0oZoVU=;
        b=YrbUhIWoTy6UJfQj7uuVEUXDnKYJzFZc7M2jbVS/5krhwOAU6ji8rChTp7oQcs3ImO
         RUY+rYubJ4O0wqi/Pch2zlA5lA9Vff/LZJNMdU7jNGT6AhFBBZiIvzaqp/MNwFEiDZYG
         wrLCqc95Ekcdu0cDs0s8mUN6xfeVzK97UrKi3ooX7/l/WdjDyhN5OVKpKzmP1UPjCqzP
         w8lNJjfd5BASpIDIvAbydMpTWRPfS9i3zhhLzWB15YUI3Jx1LGRhT92QwDIXzoai68Ia
         HKSqql6O1M0Qb8XD3C45xNwVgKiPEcTASfvTtIIoJj6QKvvAj75OZFW3HWYm2KrTrAj2
         1Svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418302; x=1795023102;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jNqtTOpN/CMznlWqUHTAHAik8BOVvz/W5FrGr0oZoVU=;
        b=H3EesOuLxGkLJ+EL0GO8RIvBV9SPPZPVxQnxpBMDr6q1UJHU5a7M0/ChGpTU3YnJIU
         3V764XiTvB3lJUUPmD3fC5NbIsK5x90dyQjHCN5Yopdwx1JWDKfyoqGrHrkxolY4s+rU
         8/rTiFc8sYNSXItD8iNTS47wL88m8+FJuvD99+kiVVR1sQT047+tRlyPzlNp20f/cpFZ
         MDDFmwlRX78ADbbWQ5g3HoDRMgqnCIjuNT4z5dsv1mnwEmRJB0gGcHTn/+mHhGKDuPaB
         bq3y57f9HS+YxsGzWi4h6v3AHvdlVdAytHWI1QiPRkhXk5Ft1FNyT2ch/X/mbKmT2p6d
         apew==
X-Forwarded-Encrypted: i=1; AL+hErGT0XDONHc2vvnnn1EjyUFj/KshX3mamcOhwUJ/AL+5tTiyWR5vL21K2FeHcQEJvpCQtz39c5VOlMacVnc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qDDD/QJlfeDW2EM5dy9g50DrwN4zkZzqnkrLxmrNwulr3njIn
	c26+QaEbwH/mCsLup2iDG7l8GLonoXisKyARiS2dpIVEU+qOK2lMW/3ABD8YekKiZTUXkPBkwO6
	OVhh4+/ccD1oEJHmPd5Ks9xy1ToYmL8uZ4nYXD3DAjFGwunwdKpXXhq8k3hf/70SPoAWuTfPojL
	0=
X-Gm-Gg: AYBFou1gVHG2qCysRShGBYwoY+3yGWoGBtKT1N0EljJuSgq6gYzkNbfQcf1n1ctsBEA
	+YxgxQlgW8IoqUTvfwGAiiP3bARefqaIweBH/OzjAPEN2hh6ZUw2goMOfUD1JE8QaK9rXH0KL2u
	ogN0Rd72TZjZPtQMTso9k9LrvASjt4BSKKDYuQEwzXrXH0kDHkQ/ITn1jbF+H/u9Kulj4pZAEUY
	rMACr5uqLi8NLphszMlyK0/8hXFuz4gCw6daACwMtNE16RTEIZTlucIexBAvFNplVB8qP7bHSg6
	/JWk4YEKsUaWzOfyvuOl+Cx64X+SuKhohdyqHZ3a/JHvPrX8+rA23732zaMu8h+lqbCCzJUriKA
	RE6fueglFn0aqgd0Tk//Bac2yuefzbPNgtvi0lI0Azs6mZtsrEr652ALTJsk9ZnjM+CwmlxKHRK
	6hUYOmFP4q9aHMlr+d485A+VxhGKZhBLlaqmthfDYy5w==
X-Received: by 2002:a17:90b:5810:b0:3b0:968f:fdef with SMTP id 98e67ed59e1d1-3b182f2b221mr3410378a91.49.1794418302253;
        Wed, 11 Nov 2026 09:31:42 -0800 (PST)
X-Received: by 2002:a17:90b:5810:b0:3b0:968f:fdef with SMTP id 98e67ed59e1d1-3b182f2b221mr3410352a91.49.1794418301662;
        Wed, 11 Nov 2026 09:31:41 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c42c11sm237305a91.2.2026.11.11.09.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:31:41 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/2] Add charger detection support for Shikra
Date: Wed, 11 Nov 2026 23:01:25 +0530
Message-Id: <20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAG2m9GoC/yWMQQqDUAxEryJZN6ChfLBXkS6+36ipoG2iUhDvb
 tSBWTyYeRsYq7DBK9tAeRWTaXQoHhmkPo4dozTOQDmFwoPWy6ARf4vVhD7RjhUbnr0hPqks25A
 I/P5VbuV/qav3zbbUH07z6YN9PwDxQflyfAAAAA==
X-Change-ID: 20261111-shikra-qusb2-charger-det-de6a4299f6c2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794418296; l=2673;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=0Pl912EABXQTovWccfrUyAncQ2UeU1pCEyYIkN2QOIM=;
 b=/eQJF7WEIaB+unxgd8L4ZnvTZuKJKo5IbHBBa3+Xv49WO63JqM4VcEJzZerYPPmEdS16ARk/s
 jX+GD1AcxJ9AK3BZk9Cobq5hbJUvERa5WcKq/IskILneqwGd1H4cbv8
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfX/3ltxItAAz+H
 BU3OOTH7NEPWGQovNQ9AKy57FBSdOYEe9ydNLMoBJRcgT+ynMlkIVbMAVFDLwd2KUCvfOkGXlyH
 af7ZdXz2hinfESrmcy6uOhf3YXAxMCE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfX86YqBDsbZ3kH
 x6wybvFlDJVRgQ9DqVb+Nv+tz4PvaPYkAs26hWhD7JFMGMx1iiH1kURcVvox8VR5PkXVeSAGbOY
 HyGPT64lH0JSUdHZD7zrODXRCepjGxuCNYmVf58FYflMXLCGUqmGey2VI0PcgeFvamPAzYGcwKj
 kReFLUI3VaIc3Ii1W0K3zfsQDILxo8DlYQ+FvU3AInzaWDoX+8lgtgrXb4NM5JAWOLQlZSHj5RF
 TA3L+p4zSZwhNJJXaQJc7E4zZzaHpnnAOuOQSXBjHvGPFQS7+gYvFFjYAGggbRwxY8J2iyhwBOE
 E6nIZ4xvYdQfNUtEjnjH1hTPNjb5pkZ7V4iX/AiuXytmnsELE7JiqFOBKa6QCaMupxDNHjDJTeS
 NrbgwuWRWnBWxfOnt0Soj02ZXjIB8mfmZCQV1h+jcR57RXX0AVKF/feTnEUOmyq3daoClGSfF8Q
 qlUTq64h+dhXmUMdUYA==
X-Proofpoint-GUID: lEblY9KWNjAe38D3IeOZ-2EI9JbYT9oD
X-Proofpoint-ORIG-GUID: lEblY9KWNjAe38D3IeOZ-2EI9JbYT9oD
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af4a67f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4n8TeYVi5Tk8eXVT2wYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110069

QUSB2 Phy HW is capable of doing BC.1.2 charger detection. On most of the
platforms, the charger detection is done by PMIC. But on Shikra CQM/CQS
platforms, the PM4125 doesn't have ability to do charger detection and
that responsibility is delegated to QUSB2 Phy which acts on the DP/DM
lines in its control to get the job done.

During process of charger detection, if the controller is supposed to
enter device mode, the charger is detected as SDP/CDP/DCP. The controller
must enter device mode only if the detected charger is SDP/CDP. In case of
DCP, the phy can be turned off after detection. If the controller must
enter host mode, charger detection can be skipped and hence the phy must
know the role before the controller so that appropriate decision can be
taken whether the controller must enter device/host mode or not.

Intention of adding remote endpoints and usb-role-switch property binding
support is as follows:

a) The DP/DM lines do go through the phy to the controller i.e., the phy
exists between connector and controller. Hence adding remote endpoints
depicting the same.

b) Although the usb2 phy is not the entity doing role switching, it still
does need to decide which mode the controller must move into and hence
adding usb-role-switch property to allow role notifications from charger
to go to controller via phy.

Also the driver changes do the following:

a) Refactor phy enable/disable calls to control regulators and clocks.

b) Let the usb-role information coming from PM4125 to pass through the phy
so that when a vbus active signal is detected, the phy can check if its
SDP/CDP/DCP and pass on the role to controller only when the charger is
SDP/CDP. In case of host mode, the role is forwarded without any charger
detection.

c) Since the controller probe relies on phy probe to be completed first,
during phy probe, it won't be possible to get role-switch handle of the
controller. Hence check for controller role switch whenever a role info
is obtained from the connector node.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (2):
      dt-bindings: phy: qcom,qusb2: Add support for remote endpoints
      phy: qcom: qusb2: Add charger detection support

 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    |  23 +
 drivers/phy/qualcomm/phy-qcom-qusb2.c              | 606 +++++++++++++++++++--
 2 files changed, 597 insertions(+), 32 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261111-shikra-qusb2-charger-det-de6a4299f6c2

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

