Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B821832E141
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530297; cv=none; b=TVWhqhWGGy3/FhsNsLE5zXKwSP65DzoRShyBIYRdk6FPCYS2BVqGUnsn/3cT2TyYhFCREx0rc1GEWIk2iFxTdD9ltJH51g26JsTL3lEX1SpcUO7la0bR51S4WLh1+0BbNIicWzwPPzuC0OcKjKjceit4/RvW1aGrRoKY1aj45xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530297; c=relaxed/simple;
	bh=2nUyjIaHLKFi5X3ejPlMLU+6LJZM3sK1x15oKrJa7RM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I5iHHE5cyJ6Ln2+wuHMBg1wSXwNKjcCzulx5XfOXzMurLiLztIuARQvhmvH2J5aNeG0YyMAQke+/3JYHR2huwHu5SDhdj3DZ/jcmDjXw+hO7KEovjftERD1FwShLI3+utg2rq+9xIrNO6uXXM4OlBJ5h0f6C+/kSaVrT24onNrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QHgQf0Ae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8xIw6tm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QHgQf0Ae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8xIw6tm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993Hpur251228
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 07:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g5O+9O9HeSDjYjJYDTxCrw
	PB6czEpC7YrfyKs/iuA5g=; b=QHgQf0AelHdYzU7H9SOxtM6Bjs3eRLamhTJ6Wr
	ibaRhnjyEJDW9kTn1HrnDMrQHo1ibXiKJ/7SNCK5oiv2qm72pw3k1QzYnWWBEw2M
	Va3e/AMQPYhCG0KnUdbLxZAB8FoqH+6gPzgNgohFaRkegXAK09bXDBlyK0HAsqkl
	iOLEN6V3EmO7vIbexx/vkcvQJgdFVkwLsOU/axwHlJgGhvQg6nsVmQaDvesEPPAr
	RX0IupsYdxE7NDMw/vM+j3Bqos/8j82tI1Tn597k1PxTRIM+IJeRZzIhJvUCjNq1
	nipK8Wke34ME3VsE83JyqB9ysbkP5ObTewjJUugVtLZh0QGQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqthjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:18:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so1999351a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791530294; x=1792135094; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g5O+9O9HeSDjYjJYDTxCrwPB6czEpC7YrfyKs/iuA5g=;
        b=G8xIw6tmwFB3f5azqhmi5wNZfdEepl+2OAmSpjfsGGhHLITK1iy68KD8ZLCM7POXm5
         qqYh2PY3yIcAUFQTM7n8qJn6HpWNo8XkB/kdcuz/wC+bMEiFDo5ZbiOy79q9mSL15IJf
         y8Pb5n8X0I17cI5jSEi5FuPhg1LkNaqBz+TjMFz636+1rpWxff2T/UbCw+OxAOgg/NNG
         qYCaHnQziMlyoC3N2PuF/zIK5OTJYvtAtaBwrR1T0rTKgcuUnRL2MfSIWetfnr/CDMhI
         0Zc0gTsaf3LO6yyX2nEj3YNhtisxpYtCPdTAPnudDXK/B9JzYSmEYLhnyqu9kLjQJHS6
         MByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530294; x=1792135094;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g5O+9O9HeSDjYjJYDTxCrwPB6czEpC7YrfyKs/iuA5g=;
        b=nvFd+S08yGhCRe97wfe+Gq1KQKcPMrgWAtD7s1qmnjEIZtKD7tQuTMZYVhnt/DNE25
         svWIV4xXyc7L3oQyBjfeGXXi1b0a+SMZPv7lSfIe/xJZA/S6Zbb9LmWxTotUqrdf+oug
         qn/CRpqmTMBkMswB72HCGZuoX90HeGXCIS1rdDvhvfWEZIvFPxzP6EYgVIzn5YAf4b2f
         ene9Yusaq3d+uD5AwRxOd0MIjUm/jX0WKuzk7EoM3Fdhg+NTChwYfIn4aL0JGIWM5005
         873fHagnNvTZ2xsdMwMWIHUZqO813JcZuCbNEDm5DTyp7ybFpw/DHc8TYTYpk0aBsOAm
         0Cpg==
X-Forwarded-Encrypted: i=1; AKwUvBwThL52e1WlzZH6ZeaAn/psqFlfBLrgD1SJjKyJfOFgG/StAgcw112zCPcWjtaaOESJUfygNIgvtabLzR0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ2/DxPl6iGjvN+oLQu3DFPYollMSlpgknsmGOWvjt1KpeTJXU
	G8Q2CWMj92vsVy9L/lLew8rGT+BR4lUiMX8zzuPfzN0KvT6dZnHH47MLTAiLFUtuVLv2LMaBTTs
	Mbw4KidqIV9Cig/KmpAHJ23/sTko3pGpq7j7fOUkU1cOusgEgRjjltfkx1ijiDdiTxDs=
X-Gm-Gg: AYBFou1NA7kMyL9TLQt/N2lurveBtW/dfWnICKDoXragUIJDsf7CZMugA7HS0ItzSkb
	aBzz7INrvMYpdv0w66DMMOrhnxFafKLqb9+iUutAYlEkg0FT4ujNs05195Zw49nm9OC8NmtbfwB
	wcykJjqCjq0x5VQo8QnT/9fnnx9cb8eqAKv3C+htpahzS6AomRvy/HdfmGW4ZDjfSAR/Cp3zduK
	ejVnngO+/Ri6e6+lDbkSI8f/lKTrEiqESI2qXPl6bqk1ULpbzeQ5QMV7QtCpF2EGifMNp059/eR
	t2lOc+Ay4ITZTtny083ZcKtRfaiwglGmM+JDIyfK2Emfod3lJ20KMe4umteRr5FbLwXEUfC8/iO
	Mhm4SJScSB6JYRLvX2rd/ZtIieP43w4bDxiwU/Iln5AIbxUtt/LC9xI9iJNLfw8cmzeCTzguf5P
	KxLzdkyX8Zs2+E
X-Received: by 2002:a17:90b:5826:b0:3a4:c1f0:ab1a with SMTP id 98e67ed59e1d1-3ab36db604dmr1043473a91.29.1791530293689;
        Fri, 09 Oct 2026 00:18:13 -0700 (PDT)
X-Received: by 2002:a17:90b:5826:b0:3a4:c1f0:ab1a with SMTP id 98e67ed59e1d1-3ab36db604dmr1043457a91.29.1791530292996;
        Fri, 09 Oct 2026 00:18:12 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e1d287sm494387a12.13.2026.10.09.00.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:18:12 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH 0/4] Add Glymur OOBMSS support
Date: Fri, 09 Oct 2026 12:47:38 +0530
Message-Id: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABKVyGoC/yXMQQ6CMBBA0auQWTMJFjHUqxAWbR1xiNJmhhoN4
 e5WXb7F/xsoCZPCudpA6MnKcSk41BWEm1smQr4Ug2nMqbGmxRg9ak4pyorT/f3Igs7aY+e61vQ
 +QAmT0JVfv+kw/q3ZzxTW7wn2/QOFFMLndgAAAA==
X-Change-ID: 20260923-oob-support-glymur-a9945a5328bc
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791530288; l=2165;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=2nUyjIaHLKFi5X3ejPlMLU+6LJZM3sK1x15oKrJa7RM=;
 b=aHjQgZG6ppIdYCCje7XLn2GCBgRHpKw8vrRamQbcD6RqFriLDNJq4LB5rkwf1B3PVXzxTviEa
 FYP74SaFAmuD0HQQkmA8YxNtaecscI37Q5Q5KerOxIGIvglJxLYE9HT
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfXyBM7hws7P173
 dG3NhYTOVndhZRUsT04MC1Cz+W2y7X34yL/b84kfoUInXZKxk3ywbdIOPzYaMzVbc/CVyllR5JV
 dROG/NBlf74spnx3n10O203dgLo8e1E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfXyEiJSMqF+u4z
 9xAM+ElDFyyTyI6Wl+Y3r9N91iIoG2UrrML5Ql35scBAGke8HgUcfKnG41UYkS8i/a/L4xku3jy
 INTabMIXdpP3elpBDoUZPFIaSn545mLlManqu/pfjWzFPhN7fIeQWuZ/qAdkMCkTanhxZJdnKeT
 odL5RpXyrMFhYGvGc3E9U4qISVNUO7OTxcVzYLnI5tPJDaOdBO6de9EmkYv3rsHY/pq9MffauRd
 9RbX+Z86I3DjC4XAD6UywqzStgtroju2uxgcWgF/N0PvdNOKT01Pw5h8yp+TZ7Ddj1xjbEIEY9T
 HME9FpOScda3dhk66glSN89dZGDLq6jIA8tMkgDI/4+3Sakd3g7yHzEqAbOanh1CjN6ZWSQmtUE
 3/WTyfYgW/uTxksfnyIaXMPjGsHgPLJmiLSwkbmVoUBDqklpzyV0n4YW9A3qLA2fq87RMo5Wrgv
 8jDKb7OjlwS9Ker7vPw==
X-Proofpoint-GUID: TRhm_M0vX97ccpBku_8tqwBUuXbBKzfW
X-Proofpoint-ORIG-GUID: TRhm_M0vX97ccpBku_8tqwBUuXbBKzfW
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac89536 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Sg9nDdXpY9lkW-gxszAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090028

Out-of-Band Management Subsystem (OOBMSS) is managed by a common remote
processor and consists of two Zephyr subsystems:

+----------------------------------------------------------+
|                         OOBMSS                           |
|                                                          |
|  +------------------------+  +------------------------+  |
|  | OOB-TEE                |  | OOB-Non-Secure         |  |
|  | Primary processor      |  | Auxiliary processor    |  |
|  | Primary image and DTB  |  | Secondary image and DTB|  |
|  +------------------------+  +------------------------+  |
+----------------------------------------------------------+

The primary processor is the Out-of-Band Trusted Execution Environment
(OOB-TEE) processor. The OOB-Non-Secure processor is an auxiliary processor
that depends on the primary processor and cannot function independently.

The PAS remoteproc driver currently supports one primary image and its
optional DTB. OOBMSS additionally requires the secondary image and DTB
to be loaded, authenticated, mapped, shut down, and released through
their own PAS identifiers and carveouts.

The series adds the OOBMSS device-tree binding, generic support for
secondary images, PAS parameters, secure and non-secure coredump
support, Shared Memory Point-to-Point (SMP2P) signaling, Inter-Processor
Communication Controller (IPCC) clients, power resources, firmware
carveouts, and the required Generic Link (GLink) edge.

---
Anvesh Jain P (4):
      dt-bindings: remoteproc: qcom: Add Glymur OOBMSS PAS binding
      remoteproc: qcom: pas: Support secondary images
      remoteproc: qcom: pas: Add Glymur OOBMSS PAS parameters
      remoteproc: qcom: pas: Add Glymur OOBMSS coredump support

 .../bindings/remoteproc/qcom,glymur-oob-pas.yaml   | 156 ++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 345 +++++++++++++++++++--
 2 files changed, 476 insertions(+), 25 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260923-oob-support-glymur-a9945a5328bc

Best regards,
--  
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

