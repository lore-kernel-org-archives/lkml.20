Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559461;
	b=Ao4V30nk9hM6VOoRxx3vdl6BJeNBcETsD2qf9+wdFw0VHQ/ZksVj1iwm2B9nstvABdWm
	 OfxyH/Uudy3qHScTdSocXTZ7HeT6+PSKyc93xLymonz0WDUkfm+uchsPTSA79pUBYIGbn
	 Xgen8iBHgC3srFDMbF3CQDv1/OQR3lLrZXL/AYTzKqsAzDGhuJgcqPzE8Ls0Y+Xu4SHUr
	 fD/Ric14P2ZVmGDDBPp2fbIaCmpRDQTKR4S/vljjaLNp9ReUdMmsnhPmjCJzJFZhR35Va
	 UbnOZXC1D5DxrL6hpWp+OhT63y7GgqJCUEu+PWWzTWyWgMRWF3hDWGFyoOxdEh3DbBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559461;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Cy3AvJDhrlzoEp/i44V1yM1DzmGzaROP4/Q3KSzyLzc=;
	b=glBwLBpWcWRAqcHhQUwLtd8vPzhfpZ8uLzfMYHlIaIc9T5ohuFqstUECh6A8mO7wKXXD
	 N73XngA4toQSYylOw0RyCNQ4EmqV4HOZHIwyfPGKRoTau9HYqAcGI+8Be1p3bGueOZdQL
	 CyJrheb2LV7PUJ7PLvzOc3Rf8RvZLRkDk6+S9aGvQEDVbvOChHfrsV1VvrsRu9uPOKuZ2
	 OEfA0AibuO44dCpLEar5MMlwi0HLp2Q8XgvFCDK4Yj53fx72VL0RhFNGXFdHiNIbP6Xfg
	 BkoYC2QiD8IbiFoyYo96mHu87LUExrkJGXw08vdkUMz5LLfxaISB9Mr7ZJMynnDk1cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N/289O58";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PoBphwVR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60016606A88C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60016606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N/289O58;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PoBphwVR
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V67p3652843
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Cy3AvJDhrlzoEp/i44V1yM
	1DzmGzaROP4/Q3KSzyLzc=; b=N/289O58v22oRQmUmNi1VIskBnYuHEhIw5O0KP
	3FCAu4aNG0PMJW8GEHauHuvpMoOIwhq0mlso/soEBv2JfC6rkhcuN5yBxL8SOHnJ
	63nGx/spMt7YLd+wrXMI8yESSbnVwXTjDFLKW3WmgdQVVqcf9DGlrWVNLFhTN99/
	triV72jLM1bhzt+3xCnNcbml5QE5kgISORnXobhjTBk36QQ4xl7wk28ukC2JA1FA
	WuOCYrsbrYc2jFB1RJqpI25zskkdrL7TYBoIGlbfifCNhTWNDqA/GntmsM7D4f/9
	B4NdFixpyforbVkIXnTZHIp0V4anyBO6IzdmFavypLOlGdMg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwa8cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:44:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3724667bc16so421240eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559458; x=1795164258; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cy3AvJDhrlzoEp/i44V1yM1DzmGzaROP4/Q3KSzyLzc=;
        b=PoBphwVR8SjzJmBQ5BMpjKxYqNWTFFJxIPqxbWc9U1wbRifOvAqApAGsEUhygBOC2u
         81XX/tKdCmwj6b90ddQC1PZS4CoJCwdiRpYFdx3jOgk2MY7k/YgM8l8RupFcTKbGaEnd
         WH+d4Atn4amhs5yrVp/aap/C2JPo86f8sVWQW0b/+M+PW8z4oV2iTZi2HpeR+4sKOE/E
         KZkJh/q9z1VvZEJUSuOmzKmEkgW9EE/Eojq7kHPDDoKsSo/yK9kKYk8j/ZsynnleKhTO
         DDVkDzG4MhsWNmfxHhDWTeYTjPmOBUkUjCZvZF57zma8IwRWWV+YOoZJJ+kxXrhyLg+A
         66qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559458; x=1795164258;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cy3AvJDhrlzoEp/i44V1yM1DzmGzaROP4/Q3KSzyLzc=;
        b=Y8BriyvRy1cYBzYEGZMPzJSuffkdjRKgxL6nL8gn4JaEBj7LTs/1dLJR3GKt6mZjSm
         WKkvOOQdqx+IXyui/N0WIovapdJDcza4yziITIUFhrmBpprckC1IRhUY+OqtuhdIFi/t
         ATZBd7BuGQGw4jXo9wEBDObiYnDeI0nrbIr9R0Ov77whmphdkiCo6pSr2Te8maYewAMl
         oHwnASmscKKbmfDqonnyrMH0mWigKvMeIrBWrSZ+/f1YLX7iRGLC9RX/NBJGN7cYJyww
         AbiTD45BPFaW0ldzNkwIyN9zZCurGb/S/UI1BKWSefPtA0Isho2dZi4Onx9m/2ZiLCQj
         N1zw==
X-Forwarded-Encrypted: i=1; AL+hErG7b7WKMGZpGiN/o/gPuclRzspUECIRn77ZRYoYqhmdPscDckPL2vZ6AHr1ZaazYc0IagX3dhZ8wdeBBEE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BqU0xyyYVjbUGJUQFVupB1XQRubrDX5/fOKIVoaxQbT4zRuUc
	G3tmrYkTIHqCau4CbNqv5tNTy2OZVBee0mf4HWV8Vl666GpKCYVSzQa3sLwCjZaSj4XQqD6PkVD
	dZq4Rtf0qx14OTD7Hkte1QK25bgpf9QZIJqGZ4oR2nFwqbXdAYpLZuc9DLwSm73ICB3I=
X-Gm-Gg: AYBFou3622qd9h2sFp3sFN7KxLc+wrcEuwcV46resJ2QpEURIOytHl5DMSV6dIlLIr2
	kKDC7HDJcr8xKn7uo6Fpz2jbKVifzXysW9LaAi6UflEWsi3X7XQG2F9oP/o+VBba2GXMwGTUOYt
	L321XjZHcIGY0FSQ/BHH5h7KBunyhUf/3ucCaPxKqHo+qtGw1aGliX61cDj2DeF/YoAAb6Uto6F
	YfWBYGL1jJ/5Bcr44rXI/iwbLuoiKECrEuadt5yAitJBXMLzOvr7CXUfNVY8FEv+6+FdP4CUcSS
	sJPiP/6C+jlpXSJEFwOPqNfeDGNbMQx+5Mq9+I+SRm/8WxyPO9EGBmYQ2ZKyGrrAofgZzNgazJ/
	nl1c+w+/xw2vaSqr0HVGHVkaq21oVwEyvQ2SKatunhOPz9PCPvDxxgNsicEeLLzRDhLUK9ECm4B
	DUZVw=
X-Received: by 2002:a05:693c:60d2:b0:362:2e2f:c261 with SMTP id 5a478bee46e88-377e1cebaffmr4662499eec.27.1794559458082;
        Fri, 13 Nov 2026 00:44:18 -0800 (PST)
X-Received: by 2002:a05:693c:60d2:b0:362:2e2f:c261 with SMTP id 5a478bee46e88-377e1cebaffmr4662461eec.27.1794559457406;
        Fri, 13 Nov 2026 00:44:17 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm9662357eec.20.2026.11.13.00.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:44:16 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH v3 0/6] thermal: Add hardware-binned trip point support
Date: Fri, 13 Nov 2026 14:13:43 +0530
Message-Id: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMDN9moC/23M0QqDIBTG8VcJr2eoUdau9h5jDNPjOlDZtMlG9
 O6zrhbs5sD/wPdbSACPEMg5W4iHiAHdmKI4ZUR3anwARZOaCCYq1nBJ5w78oPp7iyO1IFvQxjL
 gkqTF5MHie9eut9Qdhtn5z45Hvn13hzMmDk7klNFSiaYFCTXo8uJCyJ8v1Ws3DHk6ZOOi+CEKf
 iREIoysrGGyUNDUf4h1Xb/WdNvM8AAAAA==
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
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794559450; l=5075;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=v+B7zag628LCa5QlWMrOOUPqcaxGK5K9/TVhWhfCj2s=;
 b=fPA7n9pK9SH7LHcZWJtAY5nxkjvpnLEikRoSDiB5Q+VoSksczQ4d8KWxk9VjsRJehSKbBJ1k0
 SujInmItuBiAbdnApZgOu2ZpepKcAdxzLMCNpG/mgxGJ+qoIZq3iZ4x
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6cde3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=OGjWj8McAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Hd7cryhKw5KO45NzTFkA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=UYjydHh6ynBBc6_pBLvz:22
X-Proofpoint-ORIG-GUID: lOXGbPfGAyqxGGjYX_FbrM3JbIPsaPZR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX8r8WQFWA3Mq5
 QRTPvxujcDR8B8r9tNtszyhAy+xcTMsHWe5n54qMfQ3AX0yNOJ9CqopY/zicswmUWtgrmOzkJzi
 mDgilXOTPbabuw6HbPz4qdFBv1zFZ5ENdnz12rQEKSXg9cn4FrFgqhymt2L7S7GlRHtA2VzZl3v
 L03dRxTh6ibxOVgn7T8XvoJdHftpwE/LKVVNQO1YfEdlX8FVOS+MYPhhxnTH0mKE9r717DRlg24
 Qgofxv/355xt/lm4nTkym/QldelQeoQZqdukUDZqlXnR6tXaAaQ8UlWgWk1KxwRoh9+RjSbCMgO
 mVjRQvp2RBmX1kSAcnuy6lfbXB4bcDgMVozHHcON6gfYzflhr9woGygBFcxA5I+iisD0aIw5ThQ
 ABik4ShTlA7mnAFC1+ovtR6AjyW6mvL0x8EX68ghsnQfanu79c1dIfU3b3QgBPqh7oMNZCxLdLQ
 gE6A9cfjzBp9PJm/Sbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfXz9rRq+8j7c/J
 y5LEusUOZecFZfmtYb6qovshu9eRNluqeOJ0P9xrOvh2Shan9fAATiyb2dySoRPzexH3uJPgFK2
 9z96QOh42cu9y9OjnGpFLBnhNXAxOx4=
X-Proofpoint-GUID: lOXGbPfGAyqxGGjYX_FbrM3JbIPsaPZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034

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
Changes in v3:
- Add minItems/maxItems constraints for thermal-hw-bin. (Krzysztof)
- Return -EINVAL for invalid trip types so -ENODEV remains reserved for
  skipped hw-bin trips. (Sashiko)
- Add Reviewed-by from Krzysztof for the qcom-tsens binding patch.
- Link to v2: https://lore.kernel.org/r/20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com

Changes in v2:
- Format temperature-bin as separate DT cells. (Konrad)
- Add min/max constraints for temperature-bin entries. (Sashiko)
- Drop the post-registration hardware-bin API. (Sashiko)
- Remove CONFIG_THERMAL_BIN and make hardware-bin trip parsing part of
  the thermal OF registration path. (Sashiko)
- Keep hardware-bin selection registration-time only through
  devm_thermal_of_zone_register_with_bin(), because OF trips are parsed
  synchronously during zone registration. (Sashiko)
- Propagate -EPROBE_DEFER when TSENS cannot read the hardware-bin nvmem
  cells yet. (Sashiko)
- Link to v1: https://lore.kernel.org/r/20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com

---
Amit Kucheria (6):
      dt-bindings: thermal: thermal-zones: add hardware-binning trip properties
      thermal: add hardware-binning trip-point filtering support
      dt-bindings: thermal: qcom-tsens: document qcm6490 tsens
      thermal: qcom: tsens: add hardware-bin trip-point filtering
      arm64: dts: qcom: kodiak: use thermal hw-bin trips
      arm64: dts: qcom: hamoa: add thermal hw-bin support

 .../devicetree/bindings/thermal/qcom-tsens.yaml    |   8 +
 .../devicetree/bindings/thermal/thermal-zones.yaml |  60 ++++-
 .../driver-api/thermal/hardware-binning.rst        | 112 +++++++++
 Documentation/driver-api/thermal/index.rst         |   1 +
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  66 ------
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  42 +++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  58 +++--
 drivers/thermal/qcom/tsens-v2.c                    |  16 ++
 drivers/thermal/qcom/tsens.c                       | 190 +++++++++++++++-
 drivers/thermal/qcom/tsens.h                       |  29 +++
 drivers/thermal/thermal_of.c                       | 253 +++++++++++++++++++--
 include/linux/thermal.h                            |  32 +++
 13 files changed, 754 insertions(+), 114 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260917-thermal_bin-fe7becdf0e17

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

