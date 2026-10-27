Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104520;
	b=t6E7iWyDO8RIK75lJxS4BF6VekQgThKYHZM96SXqRfG0oOE96A6YcPfyRaVWZqby2vkH
	 UA1K0p4JFKnEOcmGr/22btBsE5ix/0In5TpTpootmDX+FUi4OWFTTzoAV+lqlNCF4vKCd
	 IYzhtRPrsDFTREL1e03EvdCXizqkLfuiGP9tfXVuzkw3OymhHPX4iWruxn2gfqB93PGPq
	 PkZ1SR92RrSpmf8t0u1xbuzd3QI+FlkizUrp1yAcF2Bl4lLpl0r+LiOOp17irdnqKBwSl
	 X7IWpVRhnu0Ab3H3AN7L/Firvfa9dvhBiyUSwZrnZtsYXaVdUAOG4tIFFn03AZZwGcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104520;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cI2uaVMhurkI4mNBR2Hp+MEU5aSgXbFuVTtoDyHy7Ac=;
	b=GK/Nhx5G7+62PteEumyclGOEkpPn7UmLgoyJbeT9e95v9L9G4QicKyfRIrEnMsu5X0N7
	 UW/b7QlEf9Wn6vYxqdHp5eim/o8mBZfV0WZCnOVljPTQmWVo6bzIfFEmi6yTVXt7LMlwW
	 Bz9kkNC5e+dw+8soSVcG2C5X/j2I1C6NtrWU5Z4ehj0R42e5UnTH7chcZbL8Mp5kyijiv
	 NBMHagZmnnSesdwrVW37+GejX0fX5SQhsBjxS0ksaNSvqEg4zxIE9HC2YN/ut/qRpvc2M
	 FpO41pcZEcwHlDIMYYxArnebtNgCSzt8SQAuMNfeNs9zTGk/+WrJuekJWU4/XKzefeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BWsbTrqn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C+FTBRlX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2533606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2533606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BWsbTrqn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C+FTBRlX
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdssK1973260
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cI2uaVMhurkI4mNBR2Hp+M
	EU5aSgXbFuVTtoDyHy7Ac=; b=BWsbTrqnNnL2Dj6mLRWAkPMLo1XcWhJdKVWffZ
	pFKPLTHf6QvTmPK5sVGxhMxilovwBsZLkJ4kcf3d1IF02h+tvnRoqN2tBG8sHcH7
	xNFKDhywEoXF5cfgvhkJ1O6y726vngWByGIEhHUubVlN+FFB/RrPi/mv+wPqjjXL
	A6IwubC+U0BlGeKjF6KW5AagshtAXUbiiSzwQm3JrH55Vt2ppHWYALoNFPc+m/a1
	+tqYJ1F742LvbKGcSZm+qzWi4k8fPqSG/2qAYHItEbVPdCzINg2gPKaOrfTPlDuR
	OQ1T+GR6upbnCdevLcFgVMvZh4AbznxOLgM7CPwjc9j/OxFg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1gj3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:35:18 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8afde3fe132so65252557b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104518; x=1793709318; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cI2uaVMhurkI4mNBR2Hp+MEU5aSgXbFuVTtoDyHy7Ac=;
        b=C+FTBRlXdRT8AKCEziIx1mv9BZehzUyPza3nE4REGLJi/FnwNgKlh2yj2uEhwTekh2
         AwCbqI1qhnS1b2HY4PygS7KZGPXwhg5yIek5KmN2/Nk/e+onTaSHM2yC0QDMEy+A3ttv
         O4UmWTKq2Cz6lr50ORHNZNanhc5cYkfL1YUolqNfPwEoeAJ1HsSbRn9klmgIeMkncMzU
         5tHu759ainK/nClwPZSadWfH41+6T5/Ho3eg7oBtupi6zK1aVldx1zIyOJxwrEOXZVDm
         zCDYCaKgD2pOUaXAWJdJgmFbiIDSEapWESJ28lkU1XOODG8U4IwS//idVoPNfoJgSd0P
         L8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104518; x=1793709318;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cI2uaVMhurkI4mNBR2Hp+MEU5aSgXbFuVTtoDyHy7Ac=;
        b=Zd4N0rXJDhdNETxANF2nJusjmkH1QsO807swL55GI+UABpGXCejwQGcR0siR8fY/X/
         nESZPx7LgftaCwesEBW2kKsjdZGGMxGF0jno0j3jK7YyVi2gZHZ8lOEqRgmyEFnXNS8l
         hIShLTM+sHoI1DA6C8HneH8V9fXKxtnCNMp/GjM2+n+utaXtFCeWqhvlcW02vWdcNtlj
         mzXp3NXGOHQu4kTnvbtzEjvqbMH5KIaEqIHG7z8p/xZcoJ0QJDDGLPWaY7ZwZsNxJiid
         rpX35FJiXzLAsdnrryh2rmfl0p+Q2FmEXoiS5e1AOsCpdRzwzl1PZ2OUAawOh8cgtSgZ
         Txxg==
X-Gm-Message-State: AFq9FYJ4s4dKfzZJtAD2NsUSyLJgH/zbPTU6sBRamDrN4IrUQ6ZqizIj
	XSAeo6Bjr2chMx/+Say/msRiu14prVmPR1kQo6ARECkatkB0LRwtdQTMNkKD/9igoILGhNv1ahF
	HiDqVBHlBnVP/ExhLppnPua8H1qHBP4GidOU717ijOGdp/KaI0NXPcAJGICM5OhxBKPHBD6mibz
	E=
X-Gm-Gg: AYBFou082v4BrX0AaSr11vR4t8NoQjEXG5P8RTUAV4l5H0CntQZ3pMsLm490LSTWtGN
	kUXtAytKxcQyi4UdCjRYONs0WTit5y5k5LJQTwILdTfMaZerJo8pEtnlnm4fDQ9KxD/jinkS8+G
	Qi6Ger4jXYbn3G5OsW+Z19HtyHY26UOh8p7pEPHW2WpXLyDTx0+LmeyXgxgvD1KM5Il/JUepPLi
	1To+Q/vClsI6FQbxtCOxbShsu1n/8pVTUUolzrj6QAg3STSzLbY/o36hCUQngT7T8fOH84J/GYu
	stcn5NjWBsSkbAAWHG3SVkMCCZaBtBvCCwWeG7OqNuVpTdtMAX1db1mNSaivbnpX5DuDZXARUr3
	B+h7TIl34PHCKqfephQ==
X-Received: by 2002:a05:690c:4028:b0:8b0:df4b:6467 with SMTP id 00721157ae682-8b166ccce85mr62530517b3.59.1793104517725;
        Tue, 27 Oct 2026 05:35:17 -0700 (PDT)
X-Received: by 2002:a05:690c:4028:b0:8b0:df4b:6467 with SMTP id 00721157ae682-8b166ccce85mr62530327b3.59.1793104517172;
        Tue, 27 Oct 2026 05:35:17 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e57d131sm10413507b3.20.2026.10.27.05.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:35:16 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v5 0/4] regulator: qcom-rpmh: Add support for off-on-delay
 and debounce-delay
Date: Tue, 27 Oct 2026 18:04:17 +0530
Message-Id: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEma4GoC/3WOwW6DMBBEfyXyOYu8DqGmp/xH1MPaLGQTwI0dU
 KOIf68JUm89PmnmzbxU4iic1OfupSLPkiSMGY77nfIXGjsGaTIro02la9QQuZt6eoQIoW0hjNB
 wT08w3lbe2fbAzqpc/o7cys9bfP7aOE3uyv6x2tbERVK2PN/LM665bQTNB9baIBZYHtAAgrsmk
 ptEGk/dQNIXPgxqlc7lXw21xv++zSVoMEfrqK7QNGRPIaXiPlGfRcNmW5blFzW9wdcMAQAA
X-Change-ID: 20260910-regulator-off-on-delay-2c86cb8f3eb8
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793104512; l=4245;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=h7kdOlEsy/XZYAxDWhvajoAD/K0QHoKJMKNJHcJPMYc=;
 b=4Iby379v726wLt8scpiaVQk/orjI4gLaXcrAOGew7ubHYzbYtk7bpHTz8zEWxde87uW18dr+h
 092x8gbxIr8CIzCcrKjbN0nxY5lp2uC5gTODd12s941tvgxNbzb8kmZ
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae09a86 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=aDg8Iw3iuXszikcmRqoA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: i5L0-tY4yGL4imFOFakWhygHYhB43sz4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfXyTWZ9KKRZvMZ
 U1KtshHNX1IeGyyOdn/g7nFu+UXOnGiyZkjWemxU8O74zpRCZjeikLnVHmuDyFKKyVM1/u6Yo/Z
 TTudn0vGh4Fy3adpTh9/VWoy4qM188g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX8s60sytOjHHV
 ndFkzInkZhQ9YOwiSyOTYNmKPSdl1raq36Ie9JwPyBseSdoaLqCOLViaIBqU+D83liH9U9ZZsKI
 0OnMRpQeI903v2GxZfTEbeviCbShHlKHlFzCT1j5TXTUAahNg7hBwSv6sPWUdjqDz6rtH/O57Ak
 3sFKexcpwTCrxHnoHNXx5dHhX2KHxV4/T2yV4ijPO1YBRuSSq1ye/FNi57VrEfV1FcTc3jLeoNy
 rFyxnVA5zthy9u/Id0aUeciF6lq7qP9mUiR4JxBgsXy3rm7P26KOto5jNFrj71zu5r5OzAPouTy
 lpT0EwmxTLy89rtSL7Xvoi30zXdfJiEvFHw6Nacj/W1dtlfaFOJXlfEXM6yed7362Yh4cTqDKAe
 asjDW3yNFuDM7gGJYSwQ/hcWJnpgUTxXcy+b3iR+yBJrtfIFuYQyD+t2m0q6PITHrXGelf0z7qp
 0UiQfFAv26JrRQfgjdQ==
X-Proofpoint-GUID: i5L0-tY4yGL4imFOFakWhygHYhB43sz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270050

This series adds support for two related delay properties for the Qualcomm
RPMh regulator driver: `regulator-off-on-delay-us` (enforces a minimum
physical off-time before re-enable) and `qcom,regulator-off-debounce-delay-us`
(defers sending a disable request to RPMh so quick disable/enable bounces
never reach the hardware).

Motivation:
On the Lenovo Yoga Slim 7x (Snapdragon X Elite), the camera regulators
(LDO1, LDO3, LDO7) have large bulk capacitors and rely on passive discharge.
When these regulators are disabled, the voltage decays very slowly. If
re-enabled too quickly, the sensor experiences a brownout and fails to
initialize. This can be prevented by specifying a minimum off-time.

Separately, some consumers rapidly toggle a regulator off and on again,
for example, a driver that disables its supply on -EPROBE_DEFER and
re-enables it on the next probe attempt. Sending the disable vote to RPMh
immediately in this case causes needless power cycling, so
qcom,regulator-off-debounce-delay-us lets this be deferred and canceled
if a quick re-enable follows.

This series was prepared with the help of an AI coding assistant (Claude
Code) under my direction. I reviewed, built and tested the changes.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v5:
- Implemented "regulator-off-on-delay-us" in regulator core as Mark suggested
- Updated vreg->enabled in enable/disable callbacks to report
  correct state to regulator framework.
- Made following changes to address Sashiko comments:
  - Set debounce_delay to 0 in teardown action to prevent queueing disable
    work events afterward (which could lead to use-after-free) and added a
    lock to ensure serialization between teardown and disable callback.
  - Called disable callback in teardown function in case of pending
    queued disable work events, to keep regulator HW state synced with SW state.
  - Set vreg->rdev in disable callback to avoid NULL pointer dereference
    if consumer tries to disable regulator before this assignment is done in probe.
- Removed Assisted-by tags.
- Link to v4: https://patch.msgid.link/20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com

Changes in v4:
- Taking over upstreaming this series from Saikiran.
- Made the binding change for `regulator-off-on-delay-us` in
  Documentation/devicetree/bindings/regulator/regulator.yaml instead of
  Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml,
  as this property seems better suited to be a generic one.
- Added new `qcom,regulator-off-debounce-delay-us` property and driver
  support for deferring the RPMh disable request to implement Mark's
  suggestion.
- Rebased to Linux 7.3-rc5.
- Link to v3: https://patch.msgid.link/20260127190211.14312-1-bjsaikiran@gmail.com

Changes in v3:
- Added Patch 1/2: Update DT bindings to allow `regulator-off-on-delay-us`
  for `qcom,rpmh-regulator` (Requested by Mark Brown).
- Updated Patch 2/2: Refined commit message to explicitly mention the
  passive discharge and bulk capacitor mechanism on the Yoga Slim 7x
  (Requested by Mark Brown).

Changes in v2:
- Moved the motivation/context from the cover letter into the commit
  message of the driver patch.

---
Jishnu Prakash (4):
      regulator: dt-bindings: Add 'regulator-off-on-delay-us' property
      regulator: core: Parse regulator-off-on-delay-us generically
      regulator: dt-bindings: qcom,rpmh-regulator: Add debounce delay property
      regulator: qcom-rpmh: Add debounce delay before disabling regulator

 .../bindings/regulator/qcom,rpmh-regulator.yaml    |  18 +++
 .../devicetree/bindings/regulator/regulator.yaml   |   5 +
 drivers/regulator/core.c                           |  18 ++-
 drivers/regulator/of_regulator.c                   |   4 +
 drivers/regulator/qcom-rpmh-regulator.c            | 166 ++++++++++++++++++++-
 include/linux/regulator/machine.h                  |   4 +
 6 files changed, 204 insertions(+), 11 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260910-regulator-off-on-delay-2c86cb8f3eb8

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

