Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428385;
	b=DSzQnrbz6qifyptvz7S8TA/inKyOyDH4+Zf41hvW25jc/ZXeuYBCwUK8KIPT0zL+jZtx
	 D3HrLOUR6NOS+3x+3nBmUIEAZeE0c81Lu/cBh7Qvv5kyr8ugWJ4qdsx89JhVO7w9SNuMJ
	 6KYVq7cczGnITNqo9f2wOS9c3QsoKk77QVjuQ1iZc94jgYLmlOVCSitFB/vPkP1EtSu44
	 f2RLHI6iX/FrgM+KpHw4j9NkeelQ4ImYcF/yn7nbjSTiX3ApqiDAZHdVW4oGsM8C0AfCS
	 M5ZUcWIxh+v0dA1ugRsgDjiu0TdtFKIpQOkm+D+vhdtTtfQKKGxmF3LVkb8xCmjBftw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dpE2Z7eaR0y+FTQIRzAnRUvkDAYm9gECZfte2MsEvBk=;
	b=Fp6g8KpDv1dg/FarOW+oL7R2obi6qKv8QdVexD4bSPY4U8ZcC3ZDZ+8SOE8FbG/rAF8o
	 fIcEkXv9z86AmY9ADGqy5gslaDrqGtXhkx6613CVgUIa6nbjQIrDbSuLhgudHqJJu6N3r
	 Y5RzXBzXi1RV0NtAIaVIAg6PzSzypeEoWe/+zuziadiUElJKabdNPoYW2ncIvuNtGbWr5
	 rVmkzmJKFV7CSNQNt86WI64ht3ALkjPXzl5HyW2YzlWF/cfXhP9ZesJJDKvAjVrnPPkMY
	 uKUWMUus7Dt5JduUpFXDu69eK8y8qtc6HWCRvfmUaHMJ4b7DLq2U0xNKLPVShbwqEHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i53dx13E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RzI2IOij;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F373960A260C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F373960A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i53dx13E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RzI2IOij
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFOsI62268916
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dpE2Z7eaR0y+FTQIRzAnRU
	vkDAYm9gECZfte2MsEvBk=; b=i53dx13E9XWS4DbtPxBhI0/P4i6ao3NAtxCiPU
	87LCVG4kMZokgU/cs3t/m9O+cmr7lGxNgi9P7VDR1squJh2Ry68Wy4sGKHyUSp1D
	In5butjQfjLj5AMPfj4VUOz3VKqvqZcqzw/dFdC2ef7IResVGrwlneIebpnq0/nY
	NZ1QjP1WEbYuvbo1TdNCfDjkaaVMEDFrJ8taJyjhZtkLI0ODld0vzZoxVSd6Koza
	ZgVJ/Lh5iGI+P6rqrE0+GIxpOrPOOS6YhZj+iKIgSb+OvyPmMd945eGmBlsy//ux
	O4XgasLrbUhcczqO/iGFZo8+kPkAot6VuQplr10OA1zMpitA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rj7tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:46:24 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so9792133c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792428383; x=1793033183; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dpE2Z7eaR0y+FTQIRzAnRUvkDAYm9gECZfte2MsEvBk=;
        b=RzI2IOij3fbcsFIiQLNoZiFcs4A/KKtnyT3hVLHWOWNt7da7Yc1L+YoG0HaQyIJV4r
         Qc5wlpx97Jt8HOkeySbG5PKeY06AdcEpAdd1KIXwuTZy4smJuoAmy+0MJLvY4a+KnePu
         iGWJKw/J/JJPfv+HpEBWzbTOEl2BrS3Br+hC8rESIQh1fZOH4jvWLh8Wrnn3V6axKH0A
         HsTGor+FdS3MSS5SiHbyOULbCSdmzDJ4AfXE+ZtIxL1cwrqkIIOS45qVO8l4e0BFmDxf
         bgMITp80a1wUw6mLpNMeGqBBAFbknK7o2PyMuUTCXVlRMhoyqLkE6jtly6yEX+EtCB6W
         PkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428383; x=1793033183;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dpE2Z7eaR0y+FTQIRzAnRUvkDAYm9gECZfte2MsEvBk=;
        b=j8s4pg1jf0UzWZK3a/nSgV3hpSxJSglpC+x31rIrUQN+ziFIHAp57dn4kBknbCsixL
         ZvLqFoMLGVkb/XmGEDMS2RLS4gjDX/9FhfV65S4fIj2G7pYyaw/wTTvC88T1I3x4H5gB
         xJ4II6d5Ej2zZTgf2/e4poa/gPEhRKBA9oOIDLpRdjmNbn16/TTkP3pE+4+3JENDiGBf
         pYyK/yXwRrhGcn3VR11R94knqIBDIwF6UquRPKD6S0Jdh5Sx8QrSqA3xUbzFqWDLgOZd
         x8ltCnLPN4p34fgFJfSkL/Si+18uUeodN0QxvLlgnQI6nQG2DJj/PywamYF3ChTmemVB
         LY1A==
X-Forwarded-Encrypted: i=1; AKwUvBx8ivk0RBXxOR61TsT2YD1Bsc/O+TpsxY9wkRBkWA1M6QO6U7u1hs6WP3O2/mOs13VIYS5N1DS5N2oDAc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5G0TfgWls208WHjfcNFs5yXOtpGBf7c+ymIh3wilCx7+zwwpS
	7cVm7eAo+kiNMtjm7/JBwkmvjf4TtfYOro/KsMn5Xd16yElOaMtvbepCnqtujVGk3u/EsIV/H8L
	6VuWaY+kZVJN1cNkZ50JMa4bj0UHuT4Dq5GMLUj5lqiW1mGyClaCtDL62ZuMa56rwq1Y=
X-Gm-Gg: AYBFou30hT277oryYgE44TFXNDT1rP2tL3fLbK3z/8w3hKxOhbdnHj+XuizJPV9mFnp
	/CgznAb+vdWPpo/z2oKTqoBbKnod4eEUJa4YqaVVvtURIsSIJ7v3wK1rOOdkFQ55rlIejmreSql
	P06iOf2/ntFwYtplYC/FgLq0GODek4+lL6KQV8PI2PDZYdc0FvpycwW1RMp6RYmrubUNdZEUj0K
	TgoUnSFfUAK7SZEuLRJLHjYwrO/5X7Ll+626eiPcJbLkHxt1/WQ0EgYvojzxx2nOWuzVckzxxxE
	QXdFvLrk0cCvSOotBBkqj7jo6fqMkESw3O6h/x03HFAX0xOyN+qUxz27D9l4zqXykQmB3f5FDtF
	MZQkTyOZGPOQbua00ZPKqSDbYx5KMNcDBnwl4jVPc4ppi8zycmkRshWTbWQHNHReEcdnZLpVOOB
	5cdWEi8Zn38JMSGAh3UZdEJkACHyBp8VQJ2Ks=
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr13258569c88.26.1792428383500;
        Mon, 19 Oct 2026 09:46:23 -0700 (PDT)
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr13258525c88.26.1792428382772;
        Mon, 19 Oct 2026 09:46:22 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b16f57sm30379415c88.2.2026.10.19.09.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:46:22 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add support for reporting boot status on Qualcomm
 IPQ9574 and IPQ5332
Date: Mon, 19 Oct 2026 22:16:15 +0530
Message-Id: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFdJ1moC/22NQQ6CMBBFr2K6tmTapiV15T2MMaUOUiNUO0A0h
 LtbcOOCzUx+8v97EyNMAYkddhNLOAYKsctB7XfMN667IQ/XnJkEacBKy0OL7SUh9S71+TuKHRf
 a68rq2jrtWF4+E9bhvVJP51+mobqj7xfU0mgC9TF9Vu0olt5qEABi0zAKDry0tRbGggEBx0hUv
 Ab38LFti3zYIhrlP0puo2RGGVGC8kYZiWoDNc/zF8DAyCQaAQAA
X-Change-ID: 20260929-imem_restart_reason-15c5b95f9a5a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: ela5YuMpJxDWI-BzjoAlHbDG5ESZw045
X-Proofpoint-GUID: ela5YuMpJxDWI-BzjoAlHbDG5ESZw045
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad64960 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WCa_HgLwREyZps7IH1sA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX9NTby5RkB8rz
 vngWCUWGhk+9Zs51ZZrqfvZT5os2zZqgGX61TZLhbnzLEPZ1YUZxW8vKgY1niT2iZBqDcAhYPQ3
 kEvKM9g40Nat3Qwxcf1NPpdOjqGaILg3rODFnOTxVZppKKasVtNonPsx2zVFBQKf5Sb9sUhiIMV
 BJiKczN0IZyB6jL6wOYVivfptLQzPn//NSOV5VbTwwRfHZifCkWzbrOfOEkDYwtQU1is/F1Sssl
 MxmmAoJF0yaeWc7f1+XR/jrbtLMmsXkNeU9qw15sLLgGb0QLB6WQqF8zGj55ny2nDLnnu0PJny5
 mi5DQmxZR4cWhQas+3qSJB9SUHF4lCI+iIQ6X/yLj/XrMJXWagaqdmNFUMtlBKfZQwb9EfVV6sb
 5ZVa2yTNml9LSfercAa1BxygSZfVDHvigzN54pa+IKFcfSbySvML22Mhtmo8gkCxXmrYYS2ftbH
 wAL0Vjedb8hp0XIk88w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX/sM0mj7g93Ft
 3qfllDz7Y2Cs5vCPN+HwSqCrU4P4dygolufXErU842j5lOdsn7au3xlVvcNLz9IQA4wlGt5JaH9
 QquJxxJ5ReBOC6sXCt0orOBfFlvVNes=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190066

Similar to IPQ5424, add the IMEM node and the restart-reason child node
on IPQ9574 and IPQ5332 to enable reporting of watchdog boot status.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Picked the A-b tag
- Squashed 2/5, 3/5 and 4/5, 5/5 into one to match with the schema
  definition
- Link to v2: https://patch.msgid.link/20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com

Changes in v2:
- Placed the compatibles in alphabetical order
- Fixed the unit-address in the restartreason-sram node in 4/5 and 5/5
- Link to v1: https://patch.msgid.link/20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Kathiravan Thirumoorthy (3):
      dt-bindings: sram: Document IMEM found in Qualcomm's IPQ9574 and IPQ5332
      arm64: dts: qcom: ipq9574: add support to get watchdog bootstatus from IMEM
      arm64: dts: qcom: ipq5332: add support to get watchdog bootstatus from IMEM

 Documentation/devicetree/bindings/sram/sram.yaml |  2 ++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi            | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 16 ++++++++++++++++
 3 files changed, 34 insertions(+)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20260929-imem_restart_reason-15c5b95f9a5a

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

