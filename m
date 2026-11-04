Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801025;
	b=h8jViLizw/I2iFupWYPWS/Lqc3aS+x7trxTwBOih8nT9+JBYsCo4Sfm0xtVNtq+fQvYh
	 1jvGJ6KnvPn3ZouDLyhUNFgXjbLyG9Bw8uM8zmbTHcoiuSbIsvQTKoTofchQdN84qHSt2
	 xsmsBAYw6JruScGPCs0sGdsKT0qNpdyAUV1fIyrXRBo6z2fkbWQDR1Xunxmy9MyzhfGIE
	 Xy6ASHW3r7LqAW+5KTsAamwCNFTWJejKgAhC8w6R7bcUD2kZRavcZIzcv5UjqksQxmgTO
	 o3I3IfU94gV0CmF2k1zaYQ4KZ2v0KcPTppOVKYSOgwsDLvljVAwCIzmnQESSK45z0zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801025;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zjTT2oSPpv6GIMn50uchi/8d3fk9ClR81FB3L7DPO8M=;
	b=bL93dLDKkwF0derjL0rG3x0vyrERog6jCa9wm3/f9+WsjFss9odmcheQl2IRnsYiW+eE
	 2n5kkD8dLj3wERib5aoy/kAccumFjiqIPaqpvwHzNeIFJs0Zts5EC1GrYWw9CISUypFFu
	 uegBcaC7JxYTn68zeXUImt6ygOUdyC+Bglox8uSp0/zwEt6N8B+E/Z5d4T4JqEpUEW6Cr
	 sopMq9E/eqIserjy3zjNSpRgrDUYFN6XXVOaZdwl8gfdRHnjx6kik7oOc8ZGCLGRxT54M
	 VLAQ/91gXtK0RLXELvHcknV5E0/QjI6VYQLbFCD46pXovaFesPxg+BtQ8snff+QXNFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jR/uLvhZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0pl0+jB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3290606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3290606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jR/uLvhZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0pl0+jB
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZwSk1667616
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 14:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zjTT2oSPpv6GIMn50uchi/
	8d3fk9ClR81FB3L7DPO8M=; b=jR/uLvhZcgZvaBLAQXAqTXCiQddR6Vd6uoVkAG
	xoSsqexEFOFeREnbJMPfMz+Xc1NFaMTVZg407tTXyp59EsDMRR15JQIYE+y0cIqj
	6HYckZuXrYnsfxtQnjZghlnt5qjD1RKmbSU2eEKSlC9OhlFG1ztgeaP17ikaUOKl
	li7TBHm9GFtTrfR4zI6wIavwVYrHp4Nch3qX8mEvJ2xgeqrsI3SS2jRHavCfXvr+
	k+daqgBmjfW6EwZhZwEoE58ewrDT1xPtFrqITVKCNwM0UG37lYG8T1qvbCClMJ+T
	X1iH6QQmroyhq6hSdWZgrFJj1HySzHDxzmGstY5eWXUJwUvA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nm4a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:03:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso1567075c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801023; x=1794405823; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zjTT2oSPpv6GIMn50uchi/8d3fk9ClR81FB3L7DPO8M=;
        b=b0pl0+jBG55IEBnkEiYBDXYTxpc6dDKJ2w6YtwIXH09Od6JUvAG8M28miTXypkpKo2
         OszG4M1yJviFW3GJv7k0IUBULzmN4oU8fl8qvWrTpjjY4etC09FO3POaZFlDMdcR6ZAG
         4pBGqgPyqpcHi6HN4oS1e/uAeMFKnw3cqNrV1yjt8oCEgyI0FhRxUWjm3tsLU6tXqOLo
         RzV7JhTZHTN6rd5i4ahTXnUs7DKWXBXTOsowtrKwA/OC6d4SKRez4qGIIfOZuC6sTm0o
         cMwqXt7b/nSnvMkk0Cc20laK/iFARbjDCIuqF2Vsv2tSC9MHI4VX6B2jshtZa4N4JdPq
         vM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801023; x=1794405823;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zjTT2oSPpv6GIMn50uchi/8d3fk9ClR81FB3L7DPO8M=;
        b=O4e7OuTvdmp1GVZWrOq45XyYxzxcMINMTC04VDcLmy2evIbMTTz+cqgMBORvhgaNSj
         8sobx3WTHvfMyowew10LLehfsdbAbaKX/l7fUOviHs5/kLemu5sBIXM+b71y2iRwnVE2
         SBEee6w1FOBeCpiBm+J87cjUkKBWoMOB98yU47jD1QXO4GRPrUf+UpWD0KmlP7vkTtZo
         W1lekKdiB+ubW+vZ4A+t7H/txbG3NmP5Qu6jNM6CVTe11LVNzrkbPzFhmo2VPB6ysx20
         m3gPwlw3dav7Ot6zr56C0UeNs41G4sSjBTQlDKNYGuCh+KLDKsKXtb9bVT5LC8IVz7HK
         F/ag==
X-Forwarded-Encrypted: i=1; AKwUvBx/sGMPZGZvK+rn3pInAF6bX4zXBntrBJ6pEzp9aEQedewciqbqOhJFbehDIaUWw+CjDJmVvxnrRKlpRbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vqWkKsYrIDFPA4v+JPXKbMGa180iJukxA5AMU5ZcztB2bhRgU
	k7pUc/HgSeS2UbuRcZ1wLJFKBPpGEu+ishJtBoKgsQNw0UJsZAUMLodMDgDF+lXI7t93zk/2sVV
	cSARqjFvxZQsxhGgfD7J9BlNTZEfxAL1WT1p9pCh8RMmyt7Wtt3uJbOwykMhPy/JqcJ0=
X-Gm-Gg: AYBFou1fiqrCjbmS8AMoFolJS2EZpr0FMpbFT5wywLEyJMqXL0HklXZhpXa/FNq94Jt
	ryYwKWFiEpnaa2BMAKWgRMZttKbnTcflhlMds9Ib7gwFxcYqA1DJUFNHaikaX8mRORNf488+Ly6
	J3Gnm3z/qQho3uWz0Uq0JVNtXV+PAm5q8lbnp8PmaCIs4aqvF7BYdrEuKuM7/jeplrOiExXnCgM
	SnCJwlSKWTUSoF2HfxyNTTHZTT7g2IY1F/ZDvpsNGYvL1C5MCX9OeOHLUtEQ3EojryAGJ3ycV8K
	bcS33515CRQDMaC3W7HM2xDs+fS7tJr24xw3VAWzhIQB+i4SSBsPGxziKds9tYpaZxAX+RAzNKT
	x2NIVErH+DaKYPbzg3PXYqIO3PKPT/0D1qp2RlNQOnOLbbom+edOw0KmjKmZRn9GR
X-Received: by 2002:a05:7022:4392:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1ac5de53bc8mr39770036c88.29.1793801023128;
        Wed, 04 Nov 2026 06:03:43 -0800 (PST)
X-Received: by 2002:a05:7022:4392:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1ac5de53bc8mr39769937c88.29.1793801022222;
        Wed, 04 Nov 2026 06:03:42 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm10195570c88.15.2026.11.04.06.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:03:41 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
Date: Wed, 04 Nov 2026 19:33:29 +0530
Message-Id: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADE762oC/3XMTQ6CMBCG4auQri2ZtrQUV97DuCh1kEZ+tFWiI
 dzdwsJIgptJ3km+ZyQBvcNA9slIPA4uuL6Lke0SYmvTXZC6c2zCgSsomKahdldvKDacotGFKoS
 WVlgSBzePlXst2PEUu3bh0fv3Yg9s/m4yA6OMQl6WkPPSGMEOfQjp/Wka27dtGg+ZtYH/CAJWA
 qdAK9CclyiNQfwjiK/AAORKEFFQTFe5yIQqpN0Qpmn6AJeBlGcvAQAA
X-Change-ID: 20260918-shikra-el2-ea8969385c3c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793801016; l=2786;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=L882II8VBUM+EAwyKEsaOTPVGKLyZlUm17EREpF3Wxs=;
 b=Ua1vv2E0eJ2mz52U/dBlpPOF70UDWuhhQ2vbVLFm/WTlaKZSuJYv4hSRnpB2pEreSNBGnUnqo
 Bwln8nBZ7FSCoZRXZVcOCqkoIwFEUmXXSsckICMuAZRhPe/3pNcZEG9
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXyM5XKqunmCQx
 U1gGs7WGwbiuw/fCb4MsLPLVxVCD9n5/Goj5Atq6IP6WZP8w7+Fl0q4pz5S4SshUJr008+7nbek
 WZ1gG5ZbLTwYOQgVfsalst+YJ9UobKP2aEqIbzOvynjLwUeuk4HJZCHzwCNHL3BLH/sIVgX1ycr
 jjlHpd/sO0WIKteVBzoP208nxBgUP3GcW1uT4pua+Qlk9tQ8kNLb20YdjA6PS17jA8tNnrtDc5d
 kLjZ9nCKaSa1Mqm5ytCbnH2dSYkhg5nQBY7T5fyLf7bpTxrFCJq11rq8OSjJ8/o4eAj1WsMnRs4
 v9mc5EvUuzpnPp8vEOzG7s6Cglcjql9hz9cGg+4daLckxkKSXBtb/+zqYnRlhWDUdf6cqI7yBWe
 eU545DOYXMXMnDGp9sL06bSI58srbd1OJX5wqax1mtNrPYBkKqv6lMpL+ZykQLEeHteHeKqkScS
 FLsTTDcbtKK+hSQP+OQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX6nphZAmCpR8D
 lVjfdXPPP2v+3woKt6oLlBPqlWTZQsn7VcUTkEO2p3g5hm9PgN98Je4mlFjiF4QqA8q/GyA2BKp
 X7NSRdGiK0oHYpuJmcps9uCwwQFk9qs=
X-Proofpoint-GUID: w91908MfrM_Br8tXCedF5dXeiRDxiVLF
X-Proofpoint-ORIG-GUID: w91908MfrM_Br8tXCedF5dXeiRDxiVLF
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeb3b40 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c34ISMXoqBeJqo_8tdQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

All existing Shikra EVK board variants boot Linux under a hypervisor,
which means Linux typically runs at EL1. For EL2 boot without the
hypervisor, remote processor firmware IOMMU streams must be described in
the DeviceTree consumed by Linux.

Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
produce -el2.dtb artifacts for the Shikra EVK variants alongside the
regular dtbs.

This series also relaxes the Qualcomm PAS remoteproc `iommus` item limit,
needed for Shikra EL2 remoteproc SMMU mappings.

Komal Bajaj (2):
  dt-bindings: remoteproc: qcom,shikra-pas: Allow 3 IOMMUs for LPAICP
  arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ++-
 arch/arm64/boot/dts/qcom/Makefile                  | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 23 +++++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v4:
- Add a patch to move the iommus constraint from qcom,pas-common.yaml to SoC-specific PAS bindings (Mukesh)
- Add iommus constraints for all Shikra PAS compatibles instead of only relaxing the limit for LPAICP
- Add WiFi firmware iommus to Shikra EL2 overlay
- Link to v3: https://lore.kernel.org/r/20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com

Changes in v3:
- Drop qcom,pas-common reference and add per-compatible iommus limits for Shikra (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com

Changes in v2:
- Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
- Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com

---
Komal Bajaj (3):
      dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
      dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
      arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ---
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  6 +++++
 .../bindings/remoteproc/qcom,shikra-pas.yaml       |  5 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       | 12 +++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 12 +++++++++
 arch/arm64/boot/dts/qcom/Makefile                  | 11 ++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 29 ++++++++++++++++++++++
 7 files changed, 75 insertions(+), 3 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

