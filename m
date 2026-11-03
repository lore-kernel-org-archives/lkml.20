Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719797;
	b=mv3Wy6NAgnNkwxKdAnpr8zCggL3jUyEbuNwZc0Jqdy1MzaNyPSvU/ioHnOv/stcZOqyV
	 VvjENTTPIsNguzkexOg0xvCYzlxwICPNXEYexgWLmm6SuVEzGgeeUcKten5vSLT+UTDKu
	 eF9emy5bLO2y2qmYd+/i6MVaF3lVmpr878fGSgSj6o63Gyd8edZXI2c1n3rRopNUhuTW4
	 fZgYlnAAWReBn3VB1TigpqbqMI3BxUFk/Ltzh746yWD/lVu/kiY4bb+FphfBV8yGLSdGS
	 D0GFs3JVe7ZCj+xZ/rj+ujVuVnCnRQJjhYLhpSz4fuavNF/CQJ9c2Z+zw6Rdf/Qf4xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RzAwmn1KqONWs6eIlRenG+fOoEFpFouVi0Vep/WmIJw=;
	b=aQtwZfb7WpG3yB7Md8ibqjTUCuO8jENu9yNOtEqdJk6sFLcDoXNixNNlIF/G/PDbgQy2
	 Z8k6BwKZr8elIXrpQqWVkIwpss0gMlcRY9XHQK/FxrO/6hFiafDFEGJbqiu4Kfd34q1RD
	 H9QGiyKsJ4wrmSgfweoZhgEPXf6XYhs7XwM7YOcseTaYgOWqLLYT0Ms7v2ppnPnfF7gMe
	 XeIV2+0ouxm7HHumfPUgTRMNogVVwiIFb1/FU9IiQIUOyDY3M54M+RvcsGNGBgIUF/yhH
	 z+n59mOvLvsjR3f9Zj461tX1hkNgcdEWzDXJyLJOrIBODdSrLAk0NvpRQ/FAAzDYLfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OiaEb7tp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SZcZZQVf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5327606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5327606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OiaEb7tp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SZcZZQVf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9mlS4049177
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 15:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RzAwmn1KqONWs6eIlRenG+
	fOoEFpFouVi0Vep/WmIJw=; b=OiaEb7tpyJlOXnQBKO5HXYHqU2QXQBLRj5DN2s
	J9m43VarO96/fhzBkqOF99pH/jp7CWtEd/7gB5g1obL/Bic81XJYCHaohzZ9l0xA
	L+lHtvzwMr0+EZwyBMpRGgDIamcU52pS6xKLVo3lnjqY/CW7vfFF70dfPu663YXp
	nY084CVXXX7M9tr1eG+Gk3Tld4uOjtgbHBopSwWz5AZc5phqE6SM5BQbwlZG3sXK
	wSM+nWcVUYuiimzvXkGUneVvCBHfi8DB1N11earN6dSoaSAKuDC8svxOHbUS+GIA
	Ic/5z2TXwadvdM0rxALUyXhXU2bc3F9NRqopaWEGqbBOcIRQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy3jku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:29:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so2224185eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793719795; x=1794324595; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RzAwmn1KqONWs6eIlRenG+fOoEFpFouVi0Vep/WmIJw=;
        b=SZcZZQVf1F3wcM84lqUno+8GmJB1IwwE0GUaV9fx8dTjxP4oC0u89xFF5m+RRyRQ8r
         Zv7ZY6N7HYwHcbXC9U94WsvgaJyJfPzRw27NisHqZyo33dJTpP8gVV+ddCaCq9tRsHF7
         ZbAXttlozttfc3IsbsLwYNTcAPbFhypeKVDM6Cmav7OaAFT0EzRx7d1YFYXy+yDBpOwm
         Dl3iJHtGClkwjPlxpNQX38sHkLALovubhy5038cm9dEwJj0WVdmCvjZi2M2DZL9ydqUx
         TRYvRS20EPgg8/2k4f9FCZtbbJ+eAfcpXbKxrElIM9PSEgje+BHUyU+ujxCe/lYeWqN8
         fT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719795; x=1794324595;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RzAwmn1KqONWs6eIlRenG+fOoEFpFouVi0Vep/WmIJw=;
        b=H8UT1Lm3ONat8ydFVGjqz0hyUsKL/BWJyDixTtzc4S7Pu9s8Rb9fVkckeD8GC1ksEz
         3L9lNjLQVCXRksjmk5456GhV77sl+mEWt0VbxqA6am81xleFLMTQB6JzXtU3pMBBRXBa
         2eTI+cPZywhQVViBcxxfuHWGHvb5TiKnW7gH/AGkQ4bmfJj8GnSFo5NIVuw1HYPSYqTh
         X9hcbG2pqODtgpfBkYm/K7Js2G+FArdK6BWGX5n8XhjM4WMsBK2LVVxjfEWyXB+bmaoC
         ugwVPDSpd9swDmr4XGJ1dg67a5Yqu5Y7KQ7CiVd0CHxV2+D7BiYlckkL9fDEJp6/a/lr
         9dwQ==
X-Forwarded-Encrypted: i=1; AKwUvBym+8nN7pX5DxelEhPlp4hMgOFN/bcTz0zG1rq4U2zYNZLvRqEMnI/HfhLjDjypVbkDdJ+L/MahEX3pbKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z85ElIiSqXtmuCXLjES5LvNJfSktcK7K0C3KhAhwpP97nBgzUH3
	l1hWI6c7V1YZfGPiY9jz2dMwJN29x5Y38LXAvwIXVe+jPZLLRFmRPjnhwhdbt/GRpXtaoKMeUfU
	tCohEZK3sQZ5ehvzTLzNsr4ChZL3KX4PFjdi8d6tM7suu0zcA8Et1GSs4uGJiWPSyPY4=
X-Gm-Gg: AYBFou01L4Dp54TaP432tYpe6cTjT+yyGZrcyLDON16EQfNu1Kg0Ncg8nlUND8kjATN
	ZsRpIGVRv/rNn1IwYNAzo9J/xAPLgMtPmr+5xb8UJxM0aw/U0hsznqwItWsUi2VPWc7Bs8EfzbV
	pDPEFmpg1DuhUtzl+irI9Tf6q0wN+rOt4WVJ8oiC3djC1w6dADZgo1AnqvMoP8Ph0ibR2j7bSCp
	U80nRqUNIxtNQgI9UF3Ou2yTF5IPHQ74pFC9gj7dg2M3vsTnaJYc47AsAWKXP1ahpSEGgdyTaLI
	XLsyRr++bvYN0oyCQ7jV5L1tHRST0xoktpdgQWNCaYhw/5XPSQxEYwKBkVKji+oPbClKVgerg43
	5tBlF+rl4VFa3O4tTIi8J31NjX6i6tWSHcWVsvzkM45OsFPRTIsS7AyHTC8HWFaYg7z1lsRslkx
	uxdkDfugmS
X-Received: by 2002:a05:693c:409c:b0:36a:30b:5dce with SMTP id 5a478bee46e88-36a423a3232mr23680634eec.19.1793719795230;
        Tue, 03 Nov 2026 07:29:55 -0800 (PST)
X-Received: by 2002:a05:693c:409c:b0:36a:30b:5dce with SMTP id 5a478bee46e88-36a423a3232mr23680576eec.19.1793719794488;
        Tue, 03 Nov 2026 07:29:54 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm59888302eec.1.2026.11.03.07.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:29:54 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v6 0/2] of_iommu: add support for "iommu-ranges"
Date: Tue, 03 Nov 2026 20:59:31 +0530
Message-Id: <20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANv96WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNj3cSUlPjM/Nzc0vgikHSxrqmJZXKacVqSgYWZuRJQW0FRalpmBdj
 I6NjaWgCSac2bYgAAAA==
X-Change-ID: 20261103-add_iommu_ranges-549cf3fb0867
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793719787; l=1715;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=52kUfvJEjuAQ68NM7IfYjdmCWi0NnQFqIUoegHkYmd0=;
 b=DsGcdPC6bbyZcgbXI+x+d2nTQHP/P17/5VsA0eTxp/IopXFAyFXAhN7bSJu6be09Ke2TJ33KG
 Y8u+E7u3GIUD4nBNAz680SfcfPFwpr+6GDGk0YC9/7/b9OlbVEMWgCm
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: X_bQc_G5hg5yZtws-ivCI9NoUa-Knt73
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MSBTYWx0ZWRfXwumcjbh52g5e
 c5eMHcbz4MXw7RFhC/KOfjvJ3VsG/F758uAKxcnDFa52ZsxGYC+/O6b7Dusq6Jb7W0fsXYD34pQ
 OymJw7GDjILKhHbGt9gLorjdH2/O6aFxuWVzcC3sTxZnzHF42J9+r+U/5vpF8i6tlF+mA7vCvdv
 q7nEPJTlsW52jFUAN7sww0SvwrhKE2OdPv1QKolwZwIV4mKt2ZVF99AN3kh26XM5gI+E2yYewR0
 i1sbXypUf02WjnECcB+M9+sXqWBYNQ9bJTJOgEmyUlCayMy86RcChgL9JpwvPyTO8pFFiiHjDG6
 dl/zM6iwpBEdGqMSVm1KxYPTfL9XNmKgvOoV1ojV8fkKR8iIOa2rTu56i9bGsC6QRX5JaDOBWxP
 RnpTh4Jw7dbLY+SgmUKXqoAc0jNdJTs/XHc0FYkM5q80QGPqqomO2ZLPyR5vL2/s+/QKv9e0+w5
 jPo1NeGGTfJmn9CBHKQ==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9fdf4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7TpIluchohn6vR-9VeIA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: X_bQc_G5hg5yZtws-ivCI9NoUa-Knt73
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MSBTYWx0ZWRfX84dLlnrrmVXe
 b9BaAKfxubJ9UjUuumgmzSRNQV6vz9NX7Vcd+L7kbwlvwhV6a3poMoBoZ6v+06INx1khEEBD9oc
 B0/e9VPZND2xabarIkxx/Eiyyy7zsXU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030061

The series adds support for recently introduced property 
"iommu-ranges". It adds the required checks to error out for cases 
which are not following the schema definition.

Iommu-ranges was defined in schema with this PR
https://github.com/devicetree-org/dt-schema/pull/207

The patch series is being posted as revision v6, since the patches 
were initially part of the media series [1]. The patches are moved out 
to get review comments from iommu reviewers, which was otherwise looking 
as a media seris. Happy to move this back to media series if anyone have 
any concerns. 
[1] 
https://lore.kernel.org/linux-media/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com/

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Changes in v6:
- Addressed sashiko comments.
- Addressed comment from Bryan.
- Link to v5: https://lore.kernel.org/all/20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com/

---
Vikash Garodia (2):
      iommu: use resource_size_t for reserved region length
      of: Add support for "iommu-ranges" on a device node

 drivers/iommu/amd/iommu.c    |   2 +-
 drivers/iommu/intel/iommu.c  |   2 +-
 drivers/iommu/iommu.c        |   2 +-
 drivers/iommu/of_iommu.c     | 138 +++++++++++++++++++++++++++++++++++++++----
 drivers/iommu/virtio-iommu.c |   2 +-
 drivers/of/address.c         |   2 +-
 include/linux/iommu.h        |   4 +-
 include/linux/of_address.h   |   2 +-
 8 files changed, 135 insertions(+), 19 deletions(-)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-add_iommu_ranges-549cf3fb0867

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>

