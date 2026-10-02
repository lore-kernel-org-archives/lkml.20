Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B98643DEBC
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938037; cv=none; b=fZIDnG0CvIb+O8xHo6Ka09M9TZ/7WqHA+C1LZCE5Bfn4I9HIkSh7pCSf6t6VhdNv7IxhEd6dn1Q6FaS83rHa4Os466narxgsLIyPk+CMuhOEeJICJd/U24tIYFA7BWYlveN8/s00/v7mGknJn8KAKiEsxRvg3aWmtMMO7JviGms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938037; c=relaxed/simple;
	bh=fJuyOlM65Puw9W+i4xPVFMT6DCKmSXyYGLqjNJ8Ifc0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VpDs6CGUDTyd1e9qLeYuHlk/zKDAVh/kgQb12xkMSQkUrWuT9WrZ269hUBvcn+h0D4dOuXSR8MlRaiN2FmkH79jauECKYWjfv1G2rA3z5vkPT+Msuob4vJa6XUA5AS1jFm5JR0MbS+F5FXnrmdrSVULoOdH3+n0qP/CXazXcU38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mN993v6K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YCzIc+Vo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mN993v6K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YCzIc+Vo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nZ0F1190354
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 10:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kPlUe31+cjaI3wZHq0lO0F
	0PLbebowSPB4XnFjSdqx0=; b=mN993v6K+n1vpR7JEBc+HxKGDiV328tzGECCw3
	9AUEPQnaAlnF2XICB8BEKW2bfbhioimHsYYk9rur0cjjwzJdp67PuRKv26sAhl1m
	jq1yBQy/NreFdN6woDPoLkNnmep0x3wnlNWpUkfE2CbXG9ZjwYSh30V2ImibiHLr
	5Sfzljdf6xoS5PCKgApJATB/lrDINYV8fO94cVwO7sAyeozU+F7vXTMHx/JUu/Mu
	ZzzYvwe9zyQlZ3N4PWftLZa4q0hR2v5ig+lKZ/LFElNgIalkPRwTF/utihGQz1/N
	1ALPAK9MGR6VsCXn4QK4UCRnxyysIH+0S1CzKXrxkTyOXZ9w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tjpvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:47:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so11604470eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790938034; x=1791542834; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kPlUe31+cjaI3wZHq0lO0F0PLbebowSPB4XnFjSdqx0=;
        b=YCzIc+VoJbwzVBajWJ0v3IHH7MvQ51ECAJjWorfJWPhutW/TTTYSgti0u+U44qtR94
         2oye9jS5X/v30PboqVtwvipIFr+x+13Hb9UTUQEdn+w36fdJtfjidYstXSa5yGcqTg8c
         L1zol/NRmBbjxsiL+w3mcpg6IQka+gCSnn3Wb/afk0US8/1SFnjzKuY7JPR8HOOltkOd
         UEAkzsSXX9iAe2jAifaFRQJanWfEEPjUdo97X6KBiviSEfZ1DZzHTBM2KQ0Jyy7wLQ7y
         KUUo7NQB37tuzpJXp3SYcWPso1kS/Frlb5IyXMDTsvF9Nedv5oxjImIEXrTKaAGWUYmw
         LRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790938034; x=1791542834;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kPlUe31+cjaI3wZHq0lO0F0PLbebowSPB4XnFjSdqx0=;
        b=XwwRzYqAofV0bBh6zlEKIkr90OW90KL2vWWzImMZS/5A4FoptixDM0dFuZu7FRl/rV
         JZrbV6mcKFGWIjrTRTyquroj1tu1waCmEFlVBEHqBw9sPrNfTF0gJ15KLPi8VaidDGd+
         nRt8Hl5dJNCUh12Tw8wSfAvmzoz0BGkTJhRhg4wl4LaOzu1XbDWoRuIUf6KL4QMdV+mt
         Z0tjKPWj7y+p4xb4yAW/2WC7pkqpgJl6d5vc1Nw61sUsDUtoNr1sgV+vb0H2fBAL+ddr
         Ym6GfKqB10I2krKPSGfKdyrQyk9vrSb0/Rr8xVqN50eiVsNtk021v1cnpnFihZ2RghAX
         wZXw==
X-Forwarded-Encrypted: i=1; AKwUvBw9vWQMvCV+TbFJ/WDL9kTsCjJ3NMRU/1TXJjcsaTw0rrY3Y38gZB72RfLs1gHHLC7LxpzCTmfP+Umizcs=@vger.kernel.org
X-Gm-Message-State: AFuF++kZyeU3mkliHt8yYLMpy8OeF2ncYB6DqSC4zPH5eFJXVI/x+BN5
	CMg50DDzfJG8bMAN90OGAbXgtsI+bk1Jv3gTeKbw8vLkbSWS2rxEttTnbKPkapwYBSJnS0XZAWe
	9KJlOHdNqB7t/ObNRwhU+CP3snV9y4otqlFLPTi6o+8nUEwMvfx57d4Z8GrobtZauSec=
X-Gm-Gg: AYBFou24Y6X9qxFcGVKBmfcTyXaUXjYjarsYbok7npBVsEg7+AfCwM2UVxxKv40FjnM
	fBy8aw6nYSfjf9oepbkiQwhBXL3PBhrtIsJbRlnuBbIEmTWTAe+OKUDzchKaqz0+VQXHiyr0QMR
	2ufU8RwHzRDHODzog3lQZXvjriXB/GVMaIhmab3wulKrUHPvyB0NLBql5jltl3vG/G6ZlrYjr21
	gDjB1WNHulxCR4L1J9I8Cl9YJTB7bb86Fi4AI2bgwFnZcjn1wzrunKLabPStEPv05av8zSdmTiB
	X27jRRU1ybismUdayuWZx2OWlBeC6XxWTVlNGEOlsYJW/VqTTJDogm2gT1p9aizHV7ekpngDnQa
	vsEe5mMv1wVmrY3fJQAh55zC54DSG
X-Received: by 2002:a05:701a:c909:b0:148:4d6c:2016 with SMTP id a92af1059eb24-14f5ba072bcmr2406244c88.24.1790938034222;
        Fri, 02 Oct 2026 03:47:14 -0700 (PDT)
X-Received: by 2002:a05:701a:c909:b0:148:4d6c:2016 with SMTP id a92af1059eb24-14f5ba072bcmr2405968c88.24.1790938028780;
        Fri, 02 Oct 2026 03:47:08 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm10645191c88.4.2026.10.02.03.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:47:07 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH 0/6] thermal: Add hardware-binned trip point support
Date: Fri, 02 Oct 2026 16:16:55 +0530
Message-Id: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ+Lv2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0Nz3ZKM1KLcxJz4pMw83bRU86TU5JQ0g1RDcyWgjoKi1LTMCrBp0bG
 1tQCc4ayGXQAAAA==
X-Change-ID: 20260917-thermal_bin-fe7becdf0e17
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790938020; l=4331;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=fJuyOlM65Puw9W+i4xPVFMT6DCKmSXyYGLqjNJ8Ifc0=;
 b=J34gI2MrrIl9/GCmK30WCnc+dn9+ND6gC3X+ADXlOwJbYVx0dSHdhb94leGBHcHLq/iNgN5rY
 o20Hkl1q3UfCEaIthfY01TxicXLvGg3XERkadj2UR5gsMdz3pFekppa
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: AtTadoMPLCQvL5vGynJ-sIQCFgkfzsQu
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abf8bb3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=OGjWj8McAAAA:8 a=EUspDBNiAAAA:8 a=cnS6JDR7V26kcJ3wsKUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=UYjydHh6ynBBc6_pBLvz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfX4kxkX3J0LV+e
 oOxk2p8dSgZvyywVNHLuoc8tcygcaJO3a5/OJK2i+foKp4oeBjDG95m87qEjvJdgiUaNbYeVmnU
 IlxPjuoXkXDGFPN4o0+bq9v05ZNMrb7MrQTNgspw7yvFDIM+fRvtx3Wv4oB+tyc66zLOZyd//J+
 wZDE5Zjg+8b2B/8YAsE7TEu3w5lYzqHCQYmrQdt0mcwAx7zTnPThcI2153vYwoU0rvG+vWPdhqY
 Pp0fwoQ6XMUKk/dhROIS1KDvGIcFq90j1RK/A9Rt5SJuoCPB1d6tXScNdA1DuLvTzcKoEbOfV55
 xirwOdCS943d6Jh6hn+VIELY3QTw0tgrOn6cly894pLqpsRdoDlOBbA3wXyACBO5AamT4I+Bjcg
 2shVcnqpgTeE0WwVFMi9yxGzmeEPVnVzSmMRnndgNqu4cERJwV4+4Zkg36rXpinIirdvju+PA0K
 6vTCvTPsDAbxptXfErQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfX9Lk1+KPbb+S1
 bkJatRopsFtgM+lhFznGSXqw0GqYUqhtxXAeTWNdMCsxcVM4GC+qrMcilQxmgi/D5i9ylZejytw
 taQn282Oa+iE3cdbeF3slrtN0Eo9xwo=
X-Proofpoint-ORIG-GUID: AtTadoMPLCQvL5vGynJ-sIQCFgkfzsQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020042

Some SoCs are available in multiple thermal/package bins. The silicon is
otherwise the same, but the package/bin determines which junction
temperature limits are valid for a given part. This information is
programmed in manufacturing fuses and needs to be reflected in the trip
points used by the kernel.

At the moment this is difficult to describe cleanly. Board-specific trip
overrides can handle individual cases, but they do not describe the real
hardware property: the limit is selected by SoC fuse state, not by board
identity. Duplicating thermal zones or adding vendor-specific trip
properties would also make the binding harder to share across platforms.

This series adds generic hardware-binned trip point support to the
thermal OF parser, following the same general model as the OPP
framework's opp-supported-hw property. A thermal sensor driver provides
the decoded hardware bin when registering a thermal zone, and the OF
parser uses that information to select the applicable trip data.

Two generic trip-point properties are added:

  - thermal-hw-bin:
      one or more hardware-bin mask groups for which the trip is valid

  - temperature-bin:
      per-bin trip temperatures, selected by the matching
      thermal-hw-bin group

This topic was discussed at the Linux Plumbers Conference Power and
Thermal Management microconference as "Thermal binning support". The
discussion covered how to represent SoCs whose valid junction temperature
limits depend on package/bin characteristics. The approach taken here is
to keep the DT description generic and let the platform thermal driver
provide the hardware-specific fuse decoding.

LPC discussion:
  https://lpc.events/event/19/contributions/2245/

Slides:
  https://lpc.events/event/19/contributions/2245/attachments/1885/4034/LPC2025-Thermal-Microconf-Amit-Tj-Thermal-binning.pdf

Qualcomm TSENS is added as the first user of the generic support. On
SC7280/QCM6490-class platforms, TSENS reads the jtag-id and feat-id
QFPROM cells and maps them to the thermal hardware bin. On
X1E80100-class platforms, TSENS reads the i-temp QFPROM bit. The decoded
bin is passed to the thermal OF registration path before trip points are
parsed.

The DTS patches use the new properties for the affected Kodiak and Hamoa
thermal zones. For the standard bin the passive trip remains at 95C; for
the elevated bin it is selected as 105C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
Amit Kucheria (6):
      dt-bindings: thermal: thermal-zones: add hardware-binning trip properties
      thermal: add hardware-binning trip-point filtering support
      dt-bindings: thermal: qcom-tsens: document qcm6490 tsens
      thermal: qcom: tsens: add hardware-bin trip-point filtering
      arm64: dts: qcom: kodiak: use thermal hw-bin trips
      arm64: dts: qcom: hamoa: add thermal hw-bin support

 .../devicetree/bindings/thermal/qcom-tsens.yaml    |   8 +
 .../devicetree/bindings/thermal/thermal-zones.yaml |  53 ++++-
 .../driver-api/thermal/hardware-binning.rst        | 151 ++++++++++++
 Documentation/driver-api/thermal/index.rst         |   1 +
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  66 ------
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  41 +++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  56 +++--
 drivers/thermal/Kconfig                            |  10 +
 drivers/thermal/Makefile                           |   1 +
 drivers/thermal/qcom/Kconfig                       |   1 +
 drivers/thermal/qcom/tsens-v2.c                    |  16 ++
 drivers/thermal/qcom/tsens.c                       | 189 ++++++++++++++-
 drivers/thermal/qcom/tsens.h                       |  29 +++
 drivers/thermal/thermal_bin.c                      | 135 +++++++++++
 drivers/thermal/thermal_core.h                     |   5 +
 drivers/thermal/thermal_of.c                       | 253 +++++++++++++++++++--
 include/linux/thermal.h                            |  77 +++++++
 18 files changed, 980 insertions(+), 114 deletions(-)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-thermal_bin-fe7becdf0e17

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

