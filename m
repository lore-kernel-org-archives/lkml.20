Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25944137AB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109353; cv=none; b=FTrBI3C8oUhGy5BdSxA93b5pA9qWgOyZS20tlGvSWv4t8BLARv0zFHzCTs71Qsn1J1Kft0+3yYBMfMSJoY5pFfHTR9MpZL0bxT/pCzRhwe8zosIwxGp1dSb1aQ7EZmstvESMVOWF3g0B93Bh8+585p1jok8okhyqM5mEnUSNL+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109353; c=relaxed/simple;
	bh=vXbtYJ/0QnNJmWuNtoAZa8iC/TA2rpk9NVH6xFuPuFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=meHGjzrgIBgnA2SzIRtMLssmbwZFD0ceLh+aqKYzEbyYhfUvYn00qy2CXIAmV/JqE7teya8tDVsNB58qwQ4ixq97jt0Sw5EtFIN+LwO/xPMvrfQvH9c0MaaOubPuSotLVeQNrfBhfBq9DSghRwLZgj0w2aNnHQXwb1VaLZdID/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EF3JnNwT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ijSlt7W3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EF3JnNwT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ijSlt7W3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kDPr3550792
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXTM5F6UPAo8bhocaTwSxKvXBWJws+V339zaDC2FtUQ=; b=EF3JnNwTzH0Y6u3b
	P73NnNENr7AdKpehwFafjlB/Bf8qhn8ikYy2uH5t+1xHj7c/UazDRg7mr6qYVkSo
	THUJgs3F8JnDs5WlTmPCLa6e3FhesSCPjbTT7tNDJn3zFUqcSsiDr/9fEp0uk87q
	R/xjYQKkFJM+NzBMueUOgW9a/IG+vfxCwFwP2DUkvWBbKrtlhIfnwc1y/pY5NnJC
	k71R/pzuF+ozIoczx3bbLcqr9FmhP0fLtAvjGgPlbFfGM7GUGD7S/YldF8cJdvxQ
	FoVppH0+aQ7J5DndsA1ChF13hy374nH6L/XyecJ1zWy4jTBNoeVECQASkt5V7J+C
	vn4kdg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg0g6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:49:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso1081740a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109346; x=1789714146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gXTM5F6UPAo8bhocaTwSxKvXBWJws+V339zaDC2FtUQ=;
        b=ijSlt7W3P6yfOgQp5v6NaYDcCJoN6wGYCpD6EJYfXoRl4OSOlpFVnXJGXjk5OgC/hc
         X6MNtnsPzNagYBvjVUh/Wsp/fXF3cv5GVpfpPQEF2xJEd3Pf0AiveXRPlbNPgI0a1GdX
         l54BTlOPWvXFaENHbkwWeTOhN7FvDoCM6iiOyXsvp+eZDFZV1/oTKYTNit89S9YcOZcW
         /1nLUCfgod8dqGW+Ro/6LfSwV2wdk1tYAK2eGYiQUo00QeU6GUlzCxDmvLlNH/t/XvUh
         nBLjgH48JetD/HGP0yfIG0DECQr1YaA/OHroDEgLTSs9WvEWvYHMIp8kQ3795LZlnJCh
         QjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109346; x=1789714146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXTM5F6UPAo8bhocaTwSxKvXBWJws+V339zaDC2FtUQ=;
        b=fL6cMJwLkVA4RrQrxUVm7riEVyZcX4aMdmPQPivOoRIpj8FM8wvzsMgxGoLaj6O0sr
         voAofOd7n5hbOFrOGEdiRMaXlf7lJm4uLcQILAtUZ4+Ll0QANvxEQBu2B0djog5Mqn+H
         xjfxZWv77C6o2OQSzAq4CwYZq4afXbhCJBQEcaE4y1vp4wmBv6lntGSrM4D+BKci2RYU
         +Alky6U11G5nIKF7m0pVdca97G2nCUh4F9laea+WF8WyPeMKKESQCGXy9oXntayIOPDl
         oDFaUcs+nbPhLJMwR/cWrblRjG9HGDarZx+r4uB3Qvgm6NTbmMXt8PM3pfZI+XiOqq+D
         wdBg==
X-Forwarded-Encrypted: i=1; AKwUvBwvH5fJLbdEUGwiEIDUq3sxSPEQJQxu+hBjh+dLJQgfjnVULFA7FBPXRxKrP4cLXoPZt6JDpmie3+oKzUg=@vger.kernel.org
X-Gm-Message-State: AFuF++kjH9XRR4iUbW9w9xy+XCKUp7yfm1FchKYiYpodt26DjvImeyka
	1CE1WccEog7OCyk4BPvfOo/254gVJYeKHk1NwDWdkRVdr3qBI/3nr27hQ6hCn3bViKm1p0fVAN1
	ACoKojTqdnl2BqQ9yJF9bduObV8s/D9/OoUS2iGtWe3nNE13N+/jqSkKrEJmfxKMgZe0=
X-Gm-Gg: AYBFou3C7dpzQQ63qnnssIKA9QKGKG/giwDxbzbFKierB386q2tQY8vx6ZXt2CN5J/g
	lgAb73du59xmPMXa+wPBB0fl+LdFy8rIH8y3ODsbzLYBxsg7tC5TG+0gZw9j90/cBvgvYoXgiUJ
	1xoGYBjfHHlzn8BPqliVFXKnX59Pm1r4ANdBrD1nroZ665sWlZpgn8Kf5mbYeTtorEeRaMCV+LS
	oG/ILJPiDA+j7WzrrWfDu7u/Z8+EBiLIIig6THpThFGAMHCzH+e0wMgsPlorMd9Vnnx0PP3MvFZ
	E1S61btGaOsubUUUHW41eWnrPSkQmtR6VLtv0HU6spGw2xoWiV7ZU+UpUuwS6MXpgiSVvcKQwlC
	GR5rIeH2/jiTeLcPf0Nj0lZ0DgstB9InunQs=
X-Received: by 2002:a17:90b:53d0:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39d9bc1b0demr3969060a91.1.1789109346154;
        Thu, 10 Sep 2026 23:49:06 -0700 (PDT)
X-Received: by 2002:a17:90b:53d0:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39d9bc1b0demr3969006a91.1.1789109345658;
        Thu, 10 Sep 2026 23:49:05 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b759d0sm4360102c88.7.2026.09.10.23.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:49:05 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:18:52 +0530
Subject: [PATCH 1/8] arm64: dts: qcom: kodiak: Add t-power-on-us property
 for PCIe root ports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-1-a482d185f1f9@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-a482d185f1f9@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-a482d185f1f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109338; l=972;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=vXbtYJ/0QnNJmWuNtoAZa8iC/TA2rpk9NVH6xFuPuFk=;
 b=yCw0gpVS4SrQ9Op2Ws23aLBLJOSt5KBS1rwHvY5tkNTnaNsnPoYHIQS059psGONsUCowOGwZt
 VkPcJugi1H+A91JI7a1WJ2Iy8lWeGrFNH0nqqAmK9Ih95/gsong1Aqe
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 0lJ2xFOqmhj9g6pTqcfd6E-GuyqsqS5L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX13E8TCscl0d3
 gM2wzcGhZRynqCHO1Q51w2x2fzWdSUomk8tsQGKHHSANKKDiQdw0OxLEP7vgR1JFKSsOgqQgtOj
 YKgRw4ltIJ0f+dFBy1XO9URJ3yXs3NQ=
X-Proofpoint-GUID: 0lJ2xFOqmhj9g6pTqcfd6E-GuyqsqS5L
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3a463 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX3J/ngTiJx80E
 kOJO6geThpBhY/6I1qaUSPEII6gpPAezgovuVtZeQNtq2+TifiWYpvTHd5FKS/gPuybQLnNtEgJ
 HUafcQe0pb39F2nsksxnmZW3yoBLjWKdlccM1Cn9uUjFcjzo8txCV1t5Yq4l+4CjxBoE1mmtG/R
 XMJNBJlBBvq7bN5R6DeQ+sCt8g7mwzW7kTNge1N714zZEYYErET+lfeH1WW7uI86QWYcyQ8h3nf
 kCYSb9zG+2X/6ysQl/pXut2289FWNaHpvNrGiw2KxKime+tqDM0OyGLOGG2VkEssVDdhCLFHZro
 XmStZGOXkT3ekg65YjfjsHWV7u2XQPRYx/A+82Lvnb3dGyEYvYZgDEGAy4fM1eGOnWaAe2KLXAS
 zXyMFJXURUnZDIN25ECI8pvxSBeJ8QsY19KawCUZd0aYfTWuZwdUQFwXLyPiVsLNI+mcclGo+9V
 Z6cajze5qRp6eQLkKgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root ports so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c8..54acc7d9bdea 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2306,6 +2306,8 @@ pcie0_port: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -2439,6 +2441,8 @@ pcie1_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1

