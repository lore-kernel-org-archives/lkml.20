Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773825;
	b=wtqyKlyOimj7KRDAMvb2sXXXExQx6Z9/ME+etbGPIGJTGhA/7Ws5jQZUqeM9uV22Imdo
	 VS6LGJZ6eODxC620vJqE5gj5/KiJR5p4UE70Wg1YtP+S8RlqfekE4zqC1wnbNAddri1Zr
	 D5cu/yngjkNC8Sp9RI1yUBJT6b6w6pp53s+3FlXcDYPV8kB4fejo6chd5P6zB7BAcb6H1
	 jzb39THWQbRAUsK0rQX/kKQUUHYBNX89wOkUwAt7vPdzQ6xzJUqnZ7/29DDyF30skzDY1
	 1pIRsXV90/cipxpygtc/QbEXxfu8uLrY1mm0I2h+PP9gtAGhsrivRImUga+tt1TTO0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=O8cdky/dUq4o/+8BqqMciuYE3yifM3kH+XYEckRYZPA=;
	b=RyYYjzMWVH5TD7BowT0D155+J9eOmjcHFrGy2Z/zxHJVYeAYHbisULZaTD+eECIRGCGs
	 pfQZNJt/kBY3JpLh8O542boXOIIEwkbNgN4QpAhZtLBj0MvgWFZja44dqoxhuyckGiARy
	 61p52Tn5iZxBRJvpPxbr0eJTgzfvAhmvNTMawxxFnLs5uDnXxpxhvZgEBiqjNp3pOUrJ4
	 Z2MF/utxC8yd7yJj9PJQW0+99pENZaDoVX0BaRy0tI2AiFA3uezu/NPgIIK4TCbI0nZ5s
	 llQOYhgvrmUKUk8kn6NLmhKNk3B+6pEYh1LHhfyE2v1EWdEelXGwUBLDO8Sn1vkURBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fs1GCgGD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQ8bQCOa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC5F606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AC5F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fs1GCgGD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQ8bQCOa
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40R0mY1191071
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 06:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O8cdky/dUq4o/+8BqqMciu
	YE3yifM3kH+XYEckRYZPA=; b=Fs1GCgGD/ycySmrQoZfYVeRePW0fDDhNA03IyB
	KamdjQ9o9qlyBQ5ad2VEOngi+296N5jBIsthiYH+Sw/mgvM4/O06B7OzDkkL+CHi
	aGRsgmrR2Q/YVABudGor5KY6wLe6p15Eogv9v7F/gI4DQnBIgu00cNoMJshxXwm0
	3RItuhLoNnrnKGU/juSL4903NpGt3PpBmU7VJCHQoZ6UUeiPwVGvLllIefqRztsW
	OZ6eJbzl0X6M1l5e+HwSveTrq2fb5kdEyo4AClRzmCA4/kreCioVls6HRLNkm0eF
	ObzUOacu/Qh8LcKFPNApDUDP7W1VeQDSz8bwaQQqjp40lkOQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pjnj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:30:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so71125a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793773824; x=1794378624; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O8cdky/dUq4o/+8BqqMciuYE3yifM3kH+XYEckRYZPA=;
        b=IQ8bQCOad75JFw1EBrkB4SiTACw5Y23fI/mu0Jc3niOdXEDpDWcyb3cRHjW70woAai
         iZKzoLkUVplvrlKOsZYcAxqUlOgWx4WY5LuS/L/2uJwTBdLA1l1yLViTYfeMtaCoE1n3
         skFfOet3go+SnFS0dXpQEM84IQgcOPJI5eslYw3JlTyRA6/DOR5hp+qOUEB37xFc7lQK
         AMvdEabuvOt0Bh02xNdtxFdfxQVfZX2YFfDyoYu/ZwkV32/ugPm+zYCTpNeWTJ1lo08G
         0dfkzUdGmlqSAnaY3PkYKioSbNfxzKoAZ683lYVeFIB6aZBwjMiPkqzIpz5EXHICkoLV
         3gbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773824; x=1794378624;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O8cdky/dUq4o/+8BqqMciuYE3yifM3kH+XYEckRYZPA=;
        b=sOdUO9rsbGl/yfnPc2j6wy8tw84OwEItBWtedQp+PkcAfS2lsZBiZwbZT/woteAUqN
         I2WA6CF5vuRdKRUte3BPcN483WttupFRS/9zvn5RPA4CRzX7H4sMzqzpGAGV5fo+Xz1I
         KTPcxk9yNCVdNzxKV3nywPfOO5TKoLWlOjUv7tBaN9yzclb851dT4pu1Yl5i8SyPwx4M
         JGFvXvZ6Y/y8uT3BKRMn8R/NjbcKn/rVb7CagQS+xtnFuM9yu5/ol4g4mYRk83nut4Xt
         KqMGweItdZalmNx2D7jCcx/0X1q2wlVT5RCgCSNpAaF1BMT44yMIXr2NX6PfxemeONMe
         QYjw==
X-Forwarded-Encrypted: i=1; AKwUvBziOB5PkPDnh+0rlXl368aTfArB0OkPxwVmWS1ud5HaHR363P+bfhEiboQ56IF15CJUCpwg5HhRK0Veclw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WC7DAN0vMVhhe0vPpyvl+0teu46brkT1fytme3CCPrNWU9LGR
	wlOpDqJ8c5D/dKcm7NPU1cXX8yvyymi3VVcPq1i/CmxGOYYweSl+UH5Vwc8iuF9yBompXCirH1T
	LNdGk9aL2UHArc9DNHOY/2CSDYFggOxK5lhowjx531Nv8+d9/xx9ch1fsOLCA+cNccDA=
X-Gm-Gg: AYBFou1YIwgL+F8Pld8+Z2ImN4YbVjiN3C7pfRVSosnI5Jil5VzYpI9zuWJreDDLLtQ
	t0K5+KYTdea8lZmul5ea05nuMdVvbdcgpeJL+G12/XynBkU1JU8nB4zAXf2pDBHNyjPJBZGk4Qg
	IGPOJIB6Pdt3ukAywU7zzhKGKkaX5DKW2NS8wjv36Iuo6LJ3Mt9fjyQruRMGbk6bM5XAE2ehXWN
	EqgB+oYNsyptBTYbWJL00iA6bIBZCkdhEOEOxDlP6puTDdeH6rYIHh4hYowVyOr9C/k1HNFpbsC
	CUK3n3d/2Yw074kj5ArehwPzRGNX9zr+VNfX8eQ0I5wdey1gYsZVRFJyVMsnIQv6nLkJFXnMH70
	uDlsR6ElazOozGvcKK+ruBICsVHw2i44WrADjWM5/Mc+CmVBD2miVflxCKH87GvLK3EvykNRCuX
	6vREZ21S7rhKhL0gIKovqMmFy/5lGj/RovGUt1VBY6RTcxhSwkeqxowaZnGjr5rUVlvDFY98x7K
	A==
X-Received: by 2002:a17:90a:da86:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3ae897eb0c2mr12837031a91.23.1793773823710;
        Tue, 03 Nov 2026 22:30:23 -0800 (PST)
X-Received: by 2002:a17:90a:da86:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3ae897eb0c2mr12837005a91.23.1793773823150;
        Tue, 03 Nov 2026 22:30:23 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09445f7b3sm2420646a91.5.2026.11.03.22.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:30:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: refactor m3/aux_uc firmware
 memory handling
Date: Wed, 04 Nov 2026 12:00:06 +0530
Message-Id: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAO7Q6moC/3WNTQ6CMBCFr2JmbQlDQYkr72EIKe1UaqTVthAM4
 e4WXLt5yZf3t0AgbyjA5bCAp8kE42yC4ngA2Qt7J2ZUYijy4oSYczbwVljVinFuR+kUsZrzc1f
 XiFUlIdVenrSZ98kbiNgzS3OE5ueEsXuQjNvilu1NiM5/9vcJ98b/owlZzghLjVwrLUq8uhCy9
 yie0g1DlgSadV2/CiWCctMAAAA=
X-Change-ID: 20261103-m3_and_aux_ucode-8337b881155c
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyNSBTYWx0ZWRfX0OWXHUyaXwEV
 SrHD9LdwlH2JaehQ+R9bCuM/Kbmcz/ng91hVLSyr9I2eDKE4N8fZkzpXIO7HvD8eOd7QA6SP/oj
 XqAe4lZCqmijkzXRgGQnPmr4IZTEHA4vlOTztCPd02WPWJ609ljsYbIrZ5pyh+eR732eayayxf7
 8xMj8NZ8oZZo6xHt/kPABw/s+sfKIwLX1bD+uop5t75kdQV2E0rqqG3AiHDuTxrpqjYKygY20kW
 sgbPLF+O25eMtvJJOey3o1ZcrHNmmllNb/7wi+r7NmsjBpgvU5ac13vKo4ORYQX8wmRTUn9n+4S
 7ReXopSyX9ywudApsl9fZBxSs/RZOp/D1VOw0brGAxQznEjI4NWqLa+PFEmCueLCM29G0ylG2gS
 /G+zO2dDkURa9v8J5B7iGuxkbcdNydPQng4JmdTTY4r3t1Rt9z0+eR3oyKENXj9/gZf64Dqzhwy
 mgB22+Hq6blGCvyA5DA==
X-Proofpoint-GUID: GUPVKmVCC2eEMLLye8QT-Hk3Y_sPUKJ5
X-Proofpoint-ORIG-GUID: GUPVKmVCC2eEMLLye8QT-Hk3Y_sPUKJ5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyNSBTYWx0ZWRfX7Hg7mARxJj8I
 BRf0HlNpupyODD56djTBOK1pLP28sZkfqTk2Poz4Qqkw8Zw9jY6EvDiEJ9NoJnQqCK9dD0gPNi3
 MYPEIAI/YMCYZyAWk1gOCC6UPzNBRN4=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aead100 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=xzHXWKMcZAd5FHHA1I4A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040025

ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
logic for freeing a DMA-coherent firmware memory region and loading
firmware into it. Factor the shared logic into common helpers.

Patch 1 is a preparatory, no-functional-change rename of
struct m3_mem_region to struct ath12k_fw_mem_region, since the type
is also used for the aux_uc region and the old name no longer
reflects its purpose.

Patch 2 refactors the shared free/load logic into
ath12k_qmi_free_mem_region() and ath12k_qmi_fw_mem_load(), and
rewires the m3 and aux_uc wrappers to use them.

---
Changes in v2:
- Addressed the review comments.
 
---
Madhavan Ganesan (2):
      wifi: ath12k: rename m3_mem_region to ath12k_fw_mem_region
      wifi: ath12k: refactor m3 and aux_uc firmware memory handling
 
 drivers/net/wireless/ath/ath12k/qmi.c | 168 ++++++++++++----------------------
 drivers/net/wireless/ath/ath12k/qmi.h |   6 +-
 2 files changed, 60 insertions(+), 114 deletions(-)
---
base-commit: a2da7677eb9a12e7860814b70a1f6f5b0e347d7d
change-id: 20261103-m3_and_aux_ucode-8337b881155c

