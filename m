Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6596386C36
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419959; cv=none; b=WKSfjGmzDbulP0YWG5oZ4yVCu/LRCDqjkg6Ggj6E5LG3n1SGs0ReTxhD4oZPsovrWfzAGGrTuZrWBn09xQJbhmUjFBfxTaLM7I9DkEFizSt2BP8Lh+V2IBc/bJoTG9lyalQy/LGUiPEBbHNV8kAwc/YU260yQAE4PHJJnGLpHps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419959; c=relaxed/simple;
	bh=ScgocSYMJZUtb7PWKiEExIwCxdphhRQmmpNH+RfPfM8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HVY/V7kEt7zrIDUC7lyS9IDk2uHK8gsODMphg8ZKb3PGhUMxXdRgiwz1XExKpn3YueS9QSxa1OhH/0p7Cd9FxJZ/8+5OTzp/Pn0LQpBP9l/njjroMc8QIKI4tDr7K4LaQ8/DAnA5XAq8lOLsIpTmBrnmitwauQbA/nszsAvNsRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j+w9iYcl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkvaDSTj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j+w9iYcl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkvaDSTj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lK1V721301
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 07:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xeAWlnFDPjChrwvi7D0ePs
	+8sox9HbQqHEX6wfQpKhY=; b=j+w9iYcl1SHasOkk8ecdAyPfv1KY3JIQHD1FSy
	dOZrb6YCsUZvfOsQSMgGFjNJDWVeztrY6torV2jVYXr7vL8bvDgWAnM1V5LAspdL
	0itjPoeSP7VMawf/SHelXAHRj7WipRNl4l1C4yLh+nbkIMQt1Ik4ozMcJd4cPTfC
	35UJFOUi/RyJjbj4lG0YmluqLxWm31fxu7Jh7GJq/hoypuSQ0v8rLwurcAFv7Bry
	DRRatMtsdYOz2OJtGBhMmUF7EiCbzbAJymUT7Nt215sIrYEwoWLVdknrVivUK1HV
	SkPA7Ai5/w8NIsRtvwBVlnONQqfjZRSR4o8n16wv5wlAjSsA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnkt6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:19:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6fed0652bso25197265ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788419955; x=1789024755; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xeAWlnFDPjChrwvi7D0ePs+8sox9HbQqHEX6wfQpKhY=;
        b=XkvaDSTjngFZruS9J2H6UO2a4cXkRxVGPNmeUlLn0lL3G+aGpsIbLwtvmwflm7n3xH
         bLlub3C4pcBrTWIxRSRJQ7FfV36DTINYqi43eS8o9hzkdlJfYlsGDuNKH6PkGLoojlu/
         Dpa2CvHgiHacCu20BJU7c4hrDZGipJKsUQMHDhaSrYZu/M4d+b9ODn2E0/rSnj4tcStT
         wZXyNON17T0V6yDk7+UBGtmbfBGfV3MZc30opvCpWbOXIK2F2PGyGmWc9fZAi79WUmLD
         Q4zC4lUXymMgf3h6z1a1GWkCoC+eHlNqozLJeaf/Jm/Tiwi4jlbgiQMNDIfuEITPP8I3
         tsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419955; x=1789024755;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xeAWlnFDPjChrwvi7D0ePs+8sox9HbQqHEX6wfQpKhY=;
        b=Up0O6O4Yhj0wvZjnm3NouT434n7A7Z2/jxSsze2mHGOFRpeEnmCsQTzM/pRe0EHD8U
         uQTVB9DxjKXaHMksld/a2koYWPsh7kwsJMz49ubIOUyqvl0lPS2bxtDPiwkhlpxMNzom
         bJmaVY5XdouOOVmAd6OSmf66QngxyMkNzc3t3IDOcHedM+SnZynTM0mvIrFM6qR9tHvQ
         f83mXJ8SEWieEqQ2jsYshbZq6NF0S9C4zn7GFjsr+BV3F2FzXAcFKKvBQxVgi63KJ9s0
         FpSmjzhOEt4HjXY+v7rt6pv/tfTfjZr36pP7cZ7Pbh8m4UnzIXVLa/eXj7pqzAXGWCou
         zwsg==
X-Forwarded-Encrypted: i=1; AKwUvBxsB7XWGWJrkuiSAmVhdMsNUoTv06c0NEqv/0uwiNJ3rcGTnqcBbe0AfmjXglkC6rJDeE9d4Tc+FLmbMD4=@vger.kernel.org
X-Gm-Message-State: AFuF++muYsLcWLWy48hjFY5FGAivlrij5WU7Aq/riaSWdagf+F4xhbUB
	p1Hds+jrNuvuXriQD9rEnuYAGk30xD3jgfRCCqyZvkb+1UaELKpjtdJG+GvqFL5MzYpxMJw6gMw
	fJwIJeAKJwS2bKzEOaBWF8lk1xElcK3nyTHoS0didZC2cVx2kWiQLaxJcmlviLkXDIYs=
X-Gm-Gg: AYBFou1qTgysORm3BOM9SV5sAZ25lGMSdEP6BEXNqS/Ig3vdTdOy4LcY5RYwzU84XEB
	kuyc+YhgiQd+9LAlQNJBFvVNrNrEtshOPOPSwaagFtjgko2V6n6mpLNemx1/Jh15dQAPX6qmBrv
	6QY1OPXJNoQ5SHaH5SM4mYPsYMNGhn/00toeFCamviXOpgPsvuVimsi/IeZrEZjODI29GcinNCD
	0EIgXuiOmg3B2g1iDA240SmcHT2o+4d5OTCNa3L/ZCjV2E972aABpChACC/Alk3OT6U3hiW7R3j
	mSeVwAq2p2vj3Eo5XkZ0EjChOyVNIv9d5/V3Bobn+XFqxOOqhAkCwyd9f9XgTt8rAq0UVrts00P
	PkZMJIFRCPev6oxJz9E7zqkdeLBtMo+3i
X-Received: by 2002:a17:90b:3f84:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39aedf1922dmr15796762a91.6.1788419954887;
        Thu, 03 Sep 2026 00:19:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3f84:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39aedf1922dmr15796641a91.6.1788419953876;
        Thu, 03 Sep 2026 00:19:13 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14319983842sm3992468c88.15.2026.09.03.00.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:19:13 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Subject: [PATCH v5 0/2] arm64: dts: qcom: shikra: enable ST33 TPM support
Date: Thu, 03 Sep 2026 12:48:52 +0530
Message-Id: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFwfmWoC/1WMwQ6CMBBEf4Xs2SW1loKe/A/DoSlFNlqKXWw0h
 H+3knjwMsmbybwF2EVyDKdigegSMYUxQ7UrwA5mvDqkLjNIIbVoZIU80C0a7ObJY62Owhrb501
 DfkzR9fTabJc280A8h/je5El9259H/3mSQoGNqrWUh32jOncOzOXjae42eF/mgHZd1w8PSZG3r
 QAAAA==
X-Change-ID: 20260825-shikra-dtpm-7490cacf0266
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788419950; l=1355;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=ScgocSYMJZUtb7PWKiEExIwCxdphhRQmmpNH+RfPfM8=;
 b=vDlxITKLapkLDOC2sAxZivvhsWGwPP0NgQdp3T25QEnSc/LAVe7tmHV2VxdKWQfx3HXniL0qV
 Kq/XrwCP2NKAqyTtfmFTQxDA10iQZOZHQFySgY3fRvPF2k5VU0cvwF1
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-GUID: GsnoAeuiSVWW3zyki07hRbVMnQx-kc_s
X-Proofpoint-ORIG-GUID: GsnoAeuiSVWW3zyki07hRbVMnQx-kc_s
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a991f74 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LFEp--mz5Qji-3JE28oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfXyuXLyxv1QLFU
 qOUA8OB97ui8LUqJv/VxFQIYQgoby00WDYwhEWr9XQ0HchMOuQxXAFZzx7m91XibvQXdPI+d0HW
 Ms5BlSKsJfCjMoOrGCtJ6utY9YTPJ6OH4K0QTEo/E1DnUr9l/9srEnIcjhzztEGg1AuRh0j2BzH
 AHkyP4plGHgSQ00tiMgCVfSf8cdXExVLf5jg/lWswidtZWru8bVjTmoZVt4LCL5FzTUlXdMkWL8
 rL5Osqyj3e6UMz7cLcm2P+7qTqOpYpERybigp5MNPNp6oVdUc+Q6opAQwJxs/eUKrWhB7HUFfx6
 K4YXtRCw3Z7aaVxiMY7JOVPHayGXNfUczKEkfxMfJG/N7bK+Ft4rJn9GKGN2mJweUeaEyqYpgee
 MqHIaW5hkc2Xm51CFpEnCT2AhktpAaaseNkqSWq9GHotWOIb9rjqHsuny6M9/DPfBlKYUL9OfXW
 ggLaGUDSysv9GtpTYhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfXyLO5ggx89Uv3
 hUWh32nOJRJmP9xFhmsY1kkWABMrETLvCi+a2wkw3lYvPpFLxK4DWSgGSlH/GbMo34cJiu6ekrX
 LvH6B46EE22bfQghecEcstZq2wkSWu4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030063

The Shikra EVK platforms support an ST33 TPM connected over SPI5.

This series first removes GPIOs 14-17 from the reserved ranges so 
that SPI5 can be used by Linux, and then enables the ST33 TPM in
the common Shikra EVK device tree.

Changes in v5:
- Add Reviewed-by tag from Konrad Dybcio for v4-patch 1.
- Keep node references in alphabetical order.

Link to v4: https://lore.kernel.org/r/20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com

Changes in v4:
  - Send the interdependent GPIO and TPM changes together.
  - Add the SPI5 and TPM nodes to shikra-evk.dtsi.
  - Remove GPIOs 14-17 from the reserved ranges.

Link to v3: https://lore.kernel.org/all/20260820-shikra_dtpm-v3-1-93cdd4f3e8dc@oss.qualcomm.com/

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
Khalid Faisal Ansari (2):
      arm64: dts: qcom: shikra: unreserve GPIOs 14-17
      arm64: dts: qcom: shikra: enable ST33 TPM

 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |  1 -
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi     | 10 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi |  1 -
 3 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: 65eb47183e176d8c1220cb945edac71dbedceac1
change-id: 20260825-shikra-dtpm-7490cacf0266

Best regards,
-- 
Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

