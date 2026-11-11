Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416614;
	b=IUYgm1ZktCjQ2p9S4MNbjvjkYPZvdQxDZ2XKJUSbflYotURpivehpU9miCq+gxb5Z48b
	 f/jfq2VkHmiCmegp9SjNzOEAqqvpJA8jFy/uMKxLY8yIxik1Abcao/6lpSFWFR7sQE259
	 EJI2QalkR1OeRAqnbe0rAE1KKlBGK5Bx5o5lHGszUJwNE1Ru6RM9aj8izoaX1D5923Db0
	 w8A03dZcpApaj01gimAJ04JoGzUAIPD4UMwu9W47L2IwvZh/3e8le8I5Q/nb/QxDJgAss
	 +rkWepBs0Ol+QYjgi2ch0jmCuZ8fmVJ6bUEnXS0RXLapth5yn3QjzfDxicDKufIA7ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fmPwHM5qAyvsKFmirwPXsLdgwoIXSKA0vkqEbsSBbRU=;
	b=hW7FLr2KxkllBZc2+Wjnefz+DxEjl1FXtTwILS2JHK7QbB9hDKS4R7uTR2kXK+mZKBbi
	 RRu4dDNFB9b1pym501ZQfXNCw9cUpFcdLpAY9J+O57r56014U1vw1s6Mexmw9UAjHRq+u
	 cwBJMrOzxUHcTZ76Tt5yDyU/ZCzpLpKHIuguGjqE6abjUrad0p4OUxSV9H3UoGST8gb7m
	 sPeWOk9QINijUWTMV7ZANc9p+OxSQlG1Jcx0GarFKSIYUVpyvr242ZC17KBCKUa7LuzMo
	 sF1V+G+cSr0i3fmPGYAXrI7R+vmjDfv66S+M+RZvk3gwEFLCCmLQ3JJaYO99ancyroA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d5EIwWlJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cw+kL7oD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38057606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38057606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d5EIwWlJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cw+kL7oD
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0PdL1565807
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fmPwHM5qAyvsKFmirwPXsL
	dgwoIXSKA0vkqEbsSBbRU=; b=d5EIwWlJ02F9EWnGBK7njB6AabStV/w9yaZ/4j
	e9H/KNzBiPdodk/QGTMo2poLKRQGQ4ze1fOvLiMmUBhGxTlXrK9sNYamUU8whqkQ
	64wKjZyGcNK84sBt9oOw/Q55Idv+VJIBIYF149pR9FLXGOtQY4ToD4rNgvFL+SMy
	x596yCqE4q0kxLr5DHW9SQlkelhWOjzeop/+n1+TPV/wuoJ1qgglA88P6/dj/HRq
	gB9S49UQkPVMAuGkHKsrjP5FD8+LBqlRY+CLV2O/rzI1KETnatQlJKSvhPrLRjdt
	ClbfJhBLjRq9sSVge4gxrL0v/SM6jDQHKKtoi00vrD5M98hg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m11tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:03:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so5588866a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416611; x=1795021411; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fmPwHM5qAyvsKFmirwPXsLdgwoIXSKA0vkqEbsSBbRU=;
        b=Cw+kL7oDFUxrVMGM+PkMdCf1ZkH5VZMoON0yxPutqtpUBMHYDdX5rMysWjUfCM+HQC
         h+plNgjO+VGM5ayClzLkh1nLXVI8VY445qt9B9Q9Mra/Q60npVov5XUp/1Dx89jH89B6
         kJoIobpCWD7llzsQ6LkZ3PyNJcMn9svkPI9qugDA0TCbOUPwee9ST4CokgpL0iWSztSz
         m4ar5R3Ia3PDfIIBBK4ZfBu2r/r/RujNbaqhqgoW5tQD7vcVIvq8GimJs6xxSPzg0h7I
         kjUsW4iZmyrh2HVgZpYTpqB1gSSkWI8ewAem8AMHkiXGXuqK+s644BaGxzXqLnQTsPoD
         Nh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416611; x=1795021411;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fmPwHM5qAyvsKFmirwPXsLdgwoIXSKA0vkqEbsSBbRU=;
        b=Uk7qLi4TRtRDyI+eyONXJQmvtxT4ngNS0fSS9IyaLDkLv5pgmcRN5VWtwNBifKAywC
         IqcAq5zgH7KlzIUupa7+SlG1cQVIdHC3bAX+1W9oLM+XqKtwV+BXSODPJSavBjhkHz0H
         2ZHyZPTa+cJBwz93mF4bIf/HxUQD+IcjLeH7sxvYjzIPQC8F/D5Uci129k+dgMUP+ozD
         sCB7qWzZ5m+hoxlpmsI/Sj5R9VVq7+l0eyEfKkAL+nzqiQ+MMogf7BDhWVlwAqnLz/+1
         QYSrNBTuCuclPWLudFjysMYD7kAp40dO8SjV2e5XcbjPJLBuv3cJr31Xa4hwxolIkHgt
         HBug==
X-Forwarded-Encrypted: i=1; AL+hErGhXwnfoCL2kZNqZ5ThddEKHwhYZP6d+3hk1nX+KTagS8VpKef17/MhCPhYhi9aD762ioye4osnSoFM0Ag=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j2u5kTHfzdWUDVpW+bLLT01C+xycFBjtIC2XP8dBz84wO2W6f
	gdO7MHtgHpfNW6VzKgnUm8UctAmIE5wQpKob1J2M1eevWNDmoDohRmIn2MrDsxm7jEO8z1r1LY3
	sxsri5vmEKrK+Ry9TyxKvCLVNEBdBDzEfpuSnG8M7Ih0uKPgsmotTz852dkR26lTf4RY=
X-Gm-Gg: AYBFou2TtTVunfYCPKFleYcOel1E9DW6hT84ik856BiDDQuiMNoPoucM343Wa8y5EMp
	/u0Pqjg9aWsa0ciWlhHHa9sNkM7UHpPSw6CCNCwwSlnFEPqv3PAN95HP4YuZb6KEbWpAf7dku9/
	vnfWvCQxsWYp/OpGFkmdj/vpliAet69ocKg6va8GAO4NaG6Vd6LmQPvnBnOi/JJ8VZgUldirQJJ
	sw/QOEsSl2f0pU8LLvVD5GlxtiDS9NqaEnIB62XwQqxlDZr/RZKaCYBsrB8NCdY/adHLcWpRgUy
	uoJGrN3Q46qPCQdwgxFqDAmdWvuMPMPS6Z9GbhlOC2B0MoT2GZ0uvkeskXcs/iAx+eJ+15nIFip
	E7OLBoyxEWwCrDFDlWPXC5GeYxZ2F5P9OnWQMCcI2KzeYSCcria4OGquzlrySRBtlVKw=
X-Received: by 2002:a17:90b:1e51:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b182edad1fmr3092747a91.30.1794416610869;
        Wed, 11 Nov 2026 09:03:30 -0800 (PST)
X-Received: by 2002:a17:90b:1e51:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b182edad1fmr3092705a91.30.1794416610286;
        Wed, 11 Nov 2026 09:03:30 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:03:29 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v4 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Wed, 11 Nov 2026 22:32:49 +0530
Message-Id: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALmf9GoC/3XNTQrCMBAF4KtI1kaSmf7FlfcQkTaZasSamrRFk
 d7dVFFc1M3Agzffe7BA3lJg68WDeRpssO4SQ7JcMH0sLwfi1sTMQEAmlEx52xRCir0FvQ992zr
 fcRQZJCAxB40sPraeant7odvdO4e+OpHuJmlqHG3onL+/Vgc59T4DxdzAILnghhBNXtSlUWbjQ
 lhd+/KsXdOs4mHTzgBfSQqZzEoQpQpVaqDCOsuKPxL+SChmJYySUikZSTovc5iRxnF8AnwIeW5
 hAQAA
X-Change-ID: 20260915-pm8010_i2c_support-3062421372c3
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=3890;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=3xeaN8oATWMNF4a6QsBJagxJK8NVJRJuUQm9rWHV+Tk=;
 b=xoobmoWvPQuCBG9rsJpXAjHHfTUMY4r53+rJGNOIFxBbEJVY4eSyXK4W2T51BwYWd17w7h9cn
 l4wRfpbzAjbDEarNoff4U4to9YyObpEQ63eeNbrqopLkrusNWhgj89g
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: b1qjZqM3ZMxTnB_JRpvf1WF1w7eaqXkt
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af49fe3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=LEnkABef-FZfy3Pz5UsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: b1qjZqM3ZMxTnB_JRpvf1WF1w7eaqXkt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX6x7am0ITkPoF
 mAgU85upjMn55lvqbJkPt5qfuVMJ+H5i+5uAcDhqBaC1Lu9DVIk4+GqumJAGW3Vp19YKlBYLDrz
 NUEjwt30NBS/5L5HvZVYRUbN4Cn+QFHWElpHrmfTUX2+P2J7iwPKeZEMvDNGZWI8tuAEkrFlQyb
 OMPTnBmBsiIvhYDkIXFZM/t7+PCdcT0UFBOLSRH+r0jtqLos9hhTLYw7QV1GSfHhtthpU0qVTnf
 QFvTgLRiNLQjsRXGC5zfslZmXKee8ZQE1sbfbJlpfF9J/YhbY7paEG6twU+CuxypwGQL2N3wR7S
 dlupljovdBs0hILYEhYp46nuSD0jBAW0zhAfSr/lE05qpBgyYFxspHyUbqeOs850GuzZyPlyTVj
 5E9GYYIcH4fInPETpDF9Fjd6Wf6ozp48BsRAw7wCh0KLCDXNUit7h+d5qo5FzsQgobCRLo2zPx1
 ZwW8hqXXmSDhEKlshpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfXySFsW23T7Uy0
 MyRiCULCK3folFYK3K3x7ETolrF/wfQSDs3phh+PuY9OKXmsqGi27UWu1KdyM26NLS+YqQMGB3W
 LD7UsMFlhC70zTgeCwYt7acEq9YHZ2s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

PM8010 is the next generation PMIC following PM8008 and has similar
functionality, providing 7 LDOs that power camera sensors and associated
hardware, with some differences from PM8008 LDOs. The series also adds
support for skipping interrupt configurations which is needed to support
SoCs where the PMIC's interrupt pin is grounded, such as Glymur.

Patch 1 adds the new compatible string for PM8010 over I2C

Patch 2 adds PM8010 LDO support

Patch 3 adds mode voting support for PM8010, which is not supported on PM8008

Patch 4 drops GPIO support from the MFD driver, as the GPIOs have fixed
functions and don't need SW configurations

Patch 5 adds PM8010 support in the MFD driver

Patch 6 updates documentation to make interrupt configuration optional

Patch 7 updates the MFD driver to tolerate a missing interrupt

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v4:
- Made following changes to address Konrad's comment to implement mode voting
  through load currents set by consumers:
  - Specified threshold current values for HPM for LDOs supporting mode setting.
  - Implemented .get_optimum_mode callback in PM8010 regulator ops.
  - Assigned PM8010 regulator ops only for LDOs supporting mode setting
    (L1 and L2 of PM8010 right now).
- Removed ops member from struct pm8008_match_data and in probe, checked
  hpm_min_load_uA in place of removed ops to identify LDOs supporting mode
  voting.
- Link to v3: https://patch.msgid.link/20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com

Changes in v3:
- Updated commit message of mode support patch and added regulator ops in match
  data as suggested by Guru.
- Updated pm8010_regulator_get_mode() to read LDO_MODE_CTL1_REG instead of
  LDO_STATUS1_REG as suggested by Sashiko.
- Added NULL check for of_device_get_match_data() as suggested by Sashiko and
  updated TYPE_PM8008 from 0 to 1 to avoid confusion with this function
  returning 0.
- Link to v2: https://patch.msgid.link/20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com

Changes in v2:
- Simplified of_device_is_compatible() call in mode support patch as
  suggested by sashiko.
- Added a change to drop GPIO support in MFD driver as suggested by Konrad.
- Replaced match_data parsing in probe in PM8010 MFD support patch with enum
  identifier and switch() statement as suggested by Lee.
- Moved interrupt configuration from probe into separate function in missing
  interrupt support patch as suggested by Lee.
- Added MFD cells for no-IRQ variants of PM8008/PM8010 and updated probe to
  use them in missing interrupt support patch as suggested by sashiko.
- Collected Rob's Acked-by tags on binding changes and Oleg's Tested-by tags
  on regulator driver changes (not on MFD changes since some significant
  changes are made in them now).
- Link to v1: https://patch.msgid.link/20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com

---
Dhruvin Rajpura (1):
      regulator: pm8008: Add mode voting support for PM8010

Jishnu Prakash (1):
      mfd: qcom-pm8008: Drop GPIO support

Konrad Dybcio (5):
      dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c compatible
      regulator: pm8008: Add PM8010 support
      mfd: qcom-pm8008: Add PM8010 support
      dt-bindings: mfd: pm8008: Make interrupts optional
      mfd: qcom-pm8008: Tolerate missing interrupt

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  10 +-
 drivers/mfd/qcom-pm8008.c                          | 172 ++++++++++++-----
 drivers/regulator/qcom-pm8008-regulator.c          | 203 ++++++++++++++++++---
 3 files changed, 316 insertions(+), 69 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20260915-pm8010_i2c_support-3062421372c3

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

