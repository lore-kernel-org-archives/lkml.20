Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391265;
	b=5TBNcP7Au+x6TPraFv+BrCFeHwzEdshTG+tx2QyY4YSYCZQ3HsF1QuWkElPjWUF+/Q8E
	 +QwaphBas4vqERRCYD0k5/F+7CWnykeDwSC1HbIb4GSrRyu+MhBdWYGyNkHOH032zAfkR
	 B1zGgbMVr+7PgwS3GAGhtO3PRWzYvSaBe1IpzJo9PtgyEnfX0yzu6+Z//ECi1EqY2uy36
	 uy6iQFO0nx5VVz5oMa51Ocrxy59J2zpG10mmk5PLN1h27R0ObbICos+a8VlGJCTV6J9lu
	 HskJPuR9BoEpufeU7DQE+Z2NvzhyQvJlf/ABrK6Ypi/G1d3vnGAeD/dXuDN4V11bamQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=v6371ZwO/zAJsKINRttU2qdrq8Z8ZGN1i9eIzeAJUqc=;
	b=CrYyorXsn/TBPEkZfdJmqxD12vroALyGmSb+UcCNUX0z83XqkULvkezaJAXYUlr3CJcn
	 8lJRP7ffhzXNb6cv9k6397rnL8LVnD7BT/4jqg1FaUUgGDY2b+HTvoj3tR867DmzXFhNs
	 bPhr/0oD+iHFoy8a85KhAf2WyvRD4CV4W2rb1TLVavgrWw4gGiLFCqRaX4q9nu4CAGiI+
	 WwyPx82DsJrWdn5ifsrtFECdcOa5W6unVO6oQPbi1j0L3bNfQZuTthk/AKKwfrocOOVDL
	 grCIOVQgHHQMXTgf3ldbi7IfW77tvg092Z+fge94htPirPTG/HM3pJ8rT4wMmieaoZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EgdJAR7y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwFPhT6v;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D50560A3806
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D50560A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EgdJAR7y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwFPhT6v
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KEtY863494
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v6371ZwO/zAJsKINRttU2q
	drq8Z8ZGN1i9eIzeAJUqc=; b=EgdJAR7ymcJOO8bQxiHAAkLF5VE/0Uj+614Co5
	Ksv9ip7RStWBdziGphGa0SHGA/CdbszlhpNyMe8SnHFtNBA/wyQMsGuyMajfmkUL
	QOmje9t0zCebqIMXbT0fTUM2DszOoz9kd5Gw0W5E792O3JY80QOnfoxKQzem198T
	I+BeyxL13lqmyFRWPUjnhPE3Sl81V17QSKDckzbQmX432I0Iewx6i2UkWpE/Tlir
	Sx+SZn42oS1zDf4gbMSS/YlhcKLjkfbWypJ51DCvIgap4gGRn3uPC+xrijU7eros
	rR0W4/PBFFVItC5F80NiEpPlUp1McmUGvs04wuk7jVxSe4eA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawhmeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:00:59 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab260600easo4250092b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794391258; x=1794996058; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v6371ZwO/zAJsKINRttU2qdrq8Z8ZGN1i9eIzeAJUqc=;
        b=cwFPhT6vOfOE7I98cCiZw2WppVMNhRXpw2wvesNxhA3uJP9n8NirgTiarB8Dm8psCZ
         X8v7fpLJkhPJzy/sOctdSHQT1ZZsJ/HO3q6gW/e16r2BWhvL8mIMwtXT8dQpA9gkvv3H
         P5trDSCdUUau/msTwsOiwTW0YrgERW9saZKyN+/V9qEIlQiPbVYznVRDE/kXunVb2+BV
         DSl10jmOBra5AaUk2mAJOh988rx/AgWKx4xbtdImSlrR72fjyGx/MBsZt1nziyd1VImr
         /8ZWysZAAq4K1mzkeW9Qdo2J4Bswce8Do9oLOIU4i1oY44nGADH/27zljolXi0ILvYI5
         c3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391258; x=1794996058;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v6371ZwO/zAJsKINRttU2qdrq8Z8ZGN1i9eIzeAJUqc=;
        b=ImWJR0YjkNdP6jyF834qAEektMCi6tmVaW2oQJJkbJAwXZeg+xlhdq2HCWx7U2k0bH
         7Fl0RCoMl3a87Q9IXuPAhqU9mMZJL5fndp5Y5RawdCX7Ljgh9V1S1NHycaZg6CTWMTAh
         ZHue1VkCL9VINllVTyP9xWiSCJ+8qxnTudkxfPgqueluZAqbkcfm8iDZ6GX/O7cKsfxD
         BiWXf2Lxfis5OylfOqWnK3S7o6zK7E3QJupCoa/6nOokNz8DiFXxNyWNYo0VvBXusEnA
         YPSoH/LZvMQZevPL/4I55t0EApzMeqgk5IgBKHI1Hq4tthuA3+/haQoYaBCY4h4FwzAQ
         0m/Q==
X-Forwarded-Encrypted: i=1; AL+hErEKZXEPH7LTNxjlbP/Bwo2Sf1XPBu+sI0kIYD+UfeY3509iZlLpAhT4yP6x8LC3TEnP2Xb7veyglbm3yuA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EEYvn46aaNJ1DSktD/G9PMj5Ha4PXbv/NtFFyEXv+wbGUPlkF
	g4KihFhVSg19rvBTDTiPqCEi6h3eBTiaEoP4UyYhMkvXm8jD8Ka+ig85p/06pxYnzq2V30e1Lhz
	zAt+LMkBmYED8xhtP/inFBRoXBiv9nuBqCZI1lWdCBqnsjxNbffF1ExPt5EKgOHIZYROjA9d/+9
	Skf2Zz
X-Gm-Gg: AYBFou0lQHI7EQPAapOWqe2IHMnc/X+34lNctEPt2ShYkU1GKaZTe5p610scmXknh7g
	/Np1Pgm/4/4PGX0VSxqlQmM87PUmFf6MtwPsTBeqi9oXuuWB2bIAf2PP0+fqtycr6ksU9n/g4rH
	7kJJX3FBpJSd2iq1TNCcKy7GH2fugS7FvCwwxz2xV1a32VKeFaSjQPEifMSA4fdahiZVrLYPaHL
	rkOYM+8zQUNj7s1wFDZxbhsjhZLS2aHyCQSH5h2sayjWt1fqf1xWXEziKPU0NqRgxX6w01gdP10
	06LjCTp3zE9iTQIHVE9W763UiD5epEt1G+NJgVbJc1c657vzzbKX7opW7kcBOmCSO0rQm231sVM
	EKaDbGYejFcyUJ4MBzakXb7NOoyBIKP81JOBZPzhj5UiBcl0B82XkKtOGF1UcXRe68M5GaOGbLc
	zE0o809cw2Hlt9+Xos
X-Received: by 2002:a05:6808:c126:b0:546:306d:45eb with SMTP id 5614622812f47-5688134bac2mr2879943b6e.35.1794391258180;
        Wed, 11 Nov 2026 02:00:58 -0800 (PST)
X-Received: by 2002:a05:6808:c126:b0:546:306d:45eb with SMTP id 5614622812f47-5688134bac2mr2879910b6e.35.1794391257731;
        Wed, 11 Nov 2026 02:00:57 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504c276sm4686111b6e.4.2026.11.11.02.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:00:56 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH v2 0/3] clk: qcom: Add NSS clock controller support for
 IPQ5210 SoC
Date: Wed, 11 Nov 2026 02:00:54 -0800
Message-Id: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANY89GoC/22NQQ6CMBBFr0K6tqStrSGuvIchhE6LjFEKHSAaw
 t0tGHduJnnJm/8WRj6iJ3bOFhb9jIShS6AOGYO27m6eo0vMlFAnKYXmA4Rnhf1glBRVRwTAG6+
 tgsJpJwuWHvvoG3zto9fyyzTZu4dxW9qMFmkM8b1XZ7l5v4D5F5glF9zpBqyBo7JGXgJRPkz1I
 7nPPB1Wruv6ASoesijNAAAA
X-Change-ID: 20261104-qcom_ipq5210_nsscc-fe4b2c8d4d18
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Luo Jie <jie.luo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794391255; l=1980;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=ssQwJ0NVkXEo1RNZ7AhR+p1xjTksM72Hbr1MyGjEOHo=;
 b=ELfTtgQHmQKAVD+I8fcjmKdoSmQ63d3HgGAPghBonQAWNbJzX2cwn6xE89AK6bbrIHcF97a/R
 n1K7+DMC6nEAdr74VE+WswAMjq8sxzA0eAfb0UaHCo88wp1qmqZt3ig
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX9VkT7K69kHLb
 5BpIQ6lGo/fCZWELywzvSIcazc13LhnHz+nP8W3Mqz+f5mfUNE8cstvmXWAzIde4uY8fSCoVMx0
 QbT4le+QvRzLa3PgJqtHIu+HMQ5KFrU=
X-Proofpoint-ORIG-GUID: lAaGnYZ7HX8qpsJU5NE6CDFk_h8fAsep
X-Proofpoint-GUID: lAaGnYZ7HX8qpsJU5NE6CDFk_h8fAsep
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX+fWNkCPzCGgw
 uEXM7p9kQ+LRET88Qfmaj2NYZcJfDADZRpZrl4+3MLyQMjDzLq3loZ2LEPL7gSOWwHKARGhRcYk
 Fo8WiYUEZF4eq0bD2bp9fhqSI+PS9DFaqqw58eub6S5lxMKjWbko8f8VBDbjxoA5/BoVDuCCfjF
 2Pfqzo6lzRqJYmo8mU8cCtHCrtCUY9vNXe7s74sC9/a22mO9mSMx0D4tFFlXb8v/CE7wnXqBgFW
 SrMx/Qtgp7GwpcjqKVGpWd27J2apVA7OUr9G9bzIdSmQ5ogXE8KIyo3SAyta6j8IScOmUjNnhly
 d6yVJRRZTm0ajUULuPTP5ZAVYHPSanlLZQIJBvZ26/UITphlKttbSTl6zIwA/sK5XwYffJ6SABY
 00YEtwnYI992D54xMtBZg1wyl/7dh6RCoHqhpxByaD6Ahad8ikruRlYzoxexAGkL1GpokDe7hbi
 c/SxCTkzo7txh/Xh+Fw==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af43cdb cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=cYQ6PdjOCuHZ1sjPTfwA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110039

The NSS (Network Subsystem) clock controller on the IPQ5210 SoC provides
clocks and resets to the networking related hardware blocks such as the
Packet Process Engine (PPE), the six ports, XGMAC PTP reference clocks,
PON, EIP crypto engine, and the SoC-integrated EPHY (2.5G Ethernet PHY).
Its parent clocks are sourced from the GCC and CMN PLL blocks.

The NSS NoC clocks are also enabled to use the icc-clk framework, enabling
the creation of interconnect paths for the network subsystem's connections
with these NoCs.

The patch series is organised as follows:

1/3  dt-bindings + clock/reset/interconnect ID headers for IPQ5210 NSSCC
2/3  NSS clock controller driver for IPQ5210
3/3  DTS: add NSS clock controller node in ipq5210.dtsi

Changes in v2:
- Use RUNTIME_PM_OPS() and pm_ptr() for dev_pm_ops.
- Rebase on next-20261110; drop the CMN PLL DTS patches, which are now
  merged.
- Link to v1: https://patch.msgid.link/20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com

---
Luo Jie (3):
      dt-bindings: clock: qcom: Add NSS clock controller for IPQ5210 SoC
      clk: qcom: Add NSS clock controller driver for IPQ5210 SoC
      arm64: dts: qcom: ipq5210: Add NSS clock controller node

 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |   47 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |   40 +
 drivers/clk/qcom/Kconfig                           |   12 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/nsscc-ipq5210.c                   | 2202 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5210-nsscc.h     |  106 +
 include/dt-bindings/interconnect/qcom,ipq5210.h    |   18 +
 include/dt-bindings/reset/qcom,ipq5210-nsscc.h     |   60 +
 8 files changed, 2483 insertions(+), 3 deletions(-)
---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261104-qcom_ipq5210_nsscc-fe4b2c8d4d18

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

