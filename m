Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3092C325C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031878; cv=none; b=bLimYs/QTGPNgkXiBTTcuecq6i4fbBzDMy1uM3tIBd5xTLV5LcxOCIWWchE8Rp4kMPZnCP6hJwDP3vsUUSmdMz6Ra6/mW6ugS6xn8s9vPhZ1G8cKEVpI+tzW3NHtG23BDnJUNe8CW8y7hgL9k74hiQNG8Tq0Til72U1kaGW19Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031878; c=relaxed/simple;
	bh=HF5x4rJslkS5ldbX3PSmiGKP+XEfOEund3ixdEvBtYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ipFAQwGXEkVK2lnMiqNlUhN4HGuw+jPfDXnbC+9SGFzLZwL/p0KLCmsP+M1tYRSHWMxGts9muX9+sYLK59E1bT4EfPBJPElfZou2j6c0W24AJ4GOidXwhQdxYxKtonbXwO7+4Q4yIoCyZRNEBjMkdh1E2qCOF+vDkDhF2RiQBEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HR1c0gDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GnlI8BDf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HR1c0gDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GnlI8BDf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1A2qd3468940
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=a+lIi8L5u6cYgFfD+/wiX79z9tYf081N8YU
	cub8/ZAI=; b=HR1c0gDE0KPepD9EONzg1bPHpv48jiQlihUIUqe8XqJ4k7SZ+ym
	dj/vlyeZjqjGj8QqFUI2W3w9zY5pKqOTv6k2rYlBaa8JKtmOtRFC5WPUfVCVY4kO
	UEcCCAezJocl8tlqtvH0624x7xTTzigzLSzj2z2tVmxRhuc+IBycJ95kGSRoJelq
	DPJiQWI8ZV+mJA2VeV5DGQQDsXCl7W9jI3hNc3L5suTQqVYKs7vaQPpwd9KozK1h
	M4LwaS6LwfPkGUOKc3jq/XD0nuZRlS44PDltJwZ/s6NBjOFX8xp/QS76Uc4mON9W
	fxXNsou5J7G8RbfrXCXBN3iIxajhGQcvYbA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd79y91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:37:56 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-152d1363a29so17353941c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792031876; x=1792636676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+lIi8L5u6cYgFfD+/wiX79z9tYf081N8YUcub8/ZAI=;
        b=GnlI8BDfutMn+OH82oKDUwPanfQMqeIAkTWxrR40+uL1ADzise9MZi14dXNdwsVwLM
         F6nLJsywvQCQBjc9caRE08ld9kg/1KTNMZt6Lc0Qq8y44ybH5StzcinPwcDhjip1H/fS
         M/pr2yzEMZlEJ/6H8MQ3Kh473wKUpswnxJ++aP8l4ZvbqBjLpg2p1bqmV730UhQjjzIH
         NYFkSI7I+34f/k/x5YaHdFbzqn/MJ3zFGdtJ5WupvHcgw8/U9JJ/0Cgs3lYNHmzFZfDd
         SdcArGYXgxJEbDY2NgsdsjtP2NhQBQ0GKgsFj1TtyG9yjn9eV+lJNd3iwad1RnzOpTrb
         k3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031876; x=1792636676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+lIi8L5u6cYgFfD+/wiX79z9tYf081N8YUcub8/ZAI=;
        b=DAAyj4ey5gSOYleuyq1BYGNnw55oBhXuIm5ZHtcErPzwlgJVPzskSCPgoPxqMCVLiS
         uXZRyJdiYEdt46ad0X2r4k/+5T1glJ1277OV0QHqBchrSF5ZezgHkxJoWDmKBq5jx5KI
         k4vq4SjpDhU7DC9iy1K9Pxx1cbidn5LIg1DbrBeiJJL7nUqur5Xz57u9EYhKtZJTabB9
         b4Yhbe6jiphKmmfFGUa0XVP7RuBDVNdpFoRm+RmhTRNLC0sU83nV3rgEJywT4kZxQhNX
         vKwcic0O9H2ZN2YSsxY4YS+P/lUVj8/K0gfPrbv1fjNsy17E4yohgtyDV7vPSltN0jBf
         49JA==
X-Forwarded-Encrypted: i=1; AKwUvBz4FmiJPXjt/2w27kPaG7HJEtPd0cpsThvFGRgjntO5bvini97ttzE2qoLh8X3OEar3QX1v1/32jYYUH+8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDf0GEimmyaU/62QJCDERvj1eufJGBoz/NFX3xbuXHYI9GftWD
	zQMFZ+EDArKWL+IUHQExFRgL738jIAbupraPVZtlQ1Xivd7VrqUlbeHP48CeGEnj18ceyvD75JE
	V69ooHwHpmtD0cq1cflKhz54y+FYfFpWcqXAzm9jeed8AXI5tfUXrz/QQdoYcTTWSO4M=
X-Gm-Gg: AYBFou3sXGPi1qx4+1OtOuDz4j//OsFa1tw5CTzclN3cTDmSejysinC3LuTnllJjDC/
	Dbo0LN7gVLtH0aG8OmGoSyURu121f4kp0KmnPUP/gfWZ28+1QJ/uuBQUUQkzLwS3+OUUOoTTAgK
	JajslbDrBMTw3oASXgDyK4ptM8SYcJ7SsHhEf6DouKK0DP6OFgqdTmm5JnTjYdgjjjGUnfn43Gj
	mkf7mSeofIcKTv6hDPH/hiJEzjjJaGCj9AWfFa/7MuPoKA7hY4Kuw7gU43yZg38e4ydXd2t5cA8
	0fwfc+8iZgPgzwNGD2zNd1M369uSYYrf8mj3pAsx0FOjk5t2mS8KAsxYTjECKNA6aP1GPWPknzF
	gNBCJg7A/h54MIAkfKsQjQpEvGp/gUv+zMrWbNtYy1ZKooG+D8Prw54jh+fo=
X-Received: by 2002:a05:7022:290:b0:151:2e62:fe5b with SMTP id a92af1059eb24-16a5dbfd567mr27218525c88.22.1792031875494;
        Wed, 14 Oct 2026 19:37:55 -0700 (PDT)
X-Received: by 2002:a05:7022:290:b0:151:2e62:fe5b with SMTP id a92af1059eb24-16a5dbfd567mr27218492c88.22.1792031874927;
        Wed, 14 Oct 2026 19:37:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm51217017c88.15.2026.10.14.19.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:37:54 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/7] arm64: dts: qcom: Introduce SA8255P as Lemans family SoC
Date: Thu, 15 Oct 2026 10:37:04 +0800
Message-ID: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad03c84 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KDW8FNEomtbSJeOC770A:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: 6DN0ZRHd1F_j_O-rr4EHqpeCVOWxkTxL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX0d+E6ay6Qqbg
 UoRUoZg+HUjriKKv4ZFn3q30EibXbGWBrKIIKZmDcUbgTdjT8FWuiROukfXUWjoOWdRVySqv0wA
 UKqz/quvEvjlUirT0oElCf7ABx5PV1tft0IEwQvG+uaElOqrzPdrqOq6utMYmSH65LIX97kFxCE
 PqDziHlNVEFf8kRMrh4rZ6sOExozPB/xbt1cKQMgMirSsMJplpNlDFkLZG1onyfYjYzpdMS/r6Q
 Z0hCP8vb4lAxA9eg+UjfWHbQUwudIANd+emwI1aQTR914PACC/eK5jCe9zeRDUYl04rbAWr5oF4
 hj7sidCAsfFVkZ4oaHwDdW10qlHy8dmVP2AlUKgxeXQznPX6iXBiaKXI7FDjlmktWBlvVw3ynF3
 WxNnaSlS7+8dh6MQWEzZpzx8SvDtl2gXhDSCmk/kIhsCtnvd5KQmXpEZV5kOqS07nn+O3YjNqec
 muY+VYX89tx/nv4BUbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX1TQ9KC7H6RsZ
 QZXD/UW55HShX1wvEUUploWupncvPL3nwla3yTBQwjSHNF9uKv9z/kVpwjlxnk+Umk9Q5qDNH4/
 frJyCL4JJ3Uy6gCHcVWtmPgOuEZJ1Yo=
X-Proofpoint-ORIG-GUID: 6DN0ZRHd1F_j_O-rr4EHqpeCVOWxkTxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150010

While the patchset [1] supports SA8255P as a standalone SoC, this series
offers an alternative by introducing SA8255P as a Lemans family SoC.

Lemans family has two variants: Embedded variant (IQ9/SA8775P) where
platform resources like clocks, regulators, interconnects etc. are
managed by HLOS, and GearVM variant (SA8255P) where they are managed by
a VM acting as SCMI server.  All Lemans family SoCs actually share the
same hardware configurations like memory maps, interrupts, DMAs, etc.

This patchset moves those platform resources out of lemans.dtsi and gets
them accommodated in lemans-embedded.dtsi, so that lemans.dtsi can cover
GearVM variant as well, i.e. lemans-gearvm.dtsi includes lemans.dtsi and
overrides/adds properties as needed.

Changes for v2:
- Rebase on next-20261009
- Drop patch "arm64: dts: qcom: lemans: Move PCIe devices into soc node"
  which has been applied
- Drop patch "arm64: dts: qcom: Rename lemans-auto.dtsi to
  lemans-sa8775p.dtsi", as lemans-auto.dtsi has been removed along with
  sa8775p-ride boards
- Follow Nord naming to rename lemans-iq9.dtsi to lemans-embedded.dtsi,
  lemans-sa8255p.dtsi to lemans-gearvm.dtsi and sa8255p-ride.dts to
  lemans-sa8255p-ride.dts
- Move linux,pci-domain of PCIe RC/EP into lemans-embedded.dtsi, so that
  lemans-gearvm.dtsi no longer needs /delete-property/
- New patch "arm64: dts: qcom: lemans: Add label for firmware and
  reserved-memory", so that lemans-gearvm.dtsi can override them by
  label instead of duplicating the node hierarchy
- Add SCMI power/perf domains for QUP I2C and SPI controllers in
  lemans-gearvm.dtsi
- Link to v1: https://lore.kernel.org/all/20260409091100.474358-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com/

Nikunj Kela (2):
  dt-bindings: arm: qcom: add SA8255p Ride board
  arm64: dts: qcom: lemans: Enable lemans-sa8255p-ride board support

Shawn Guo (5):
  arm64: dts: qcom: Introduce lemans-embedded.dtsi as a placeholder
  arm64: dts: qcom: lemans: Move pinctrl states into
    lemans-embedded.dtsi
  arm64: dts: qcom: lemans: Move platform resources into
    lemans-embedded.dtsi
  arm64: dts: qcom: lemans: Add label for firmware and reserved-memory
  arm64: dts: qcom: Add device tree for Lemans GearVM variant

 .../devicetree/bindings/arm/qcom.yaml         |    5 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 3685 +++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       |    2 +-
 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi   | 3232 +++++++++++++++
 .../boot/dts/qcom/lemans-sa8255p-ride.dts     |  222 +
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 3369 +--------------
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts  |    2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts     |    2 +-
 9 files changed, 7154 insertions(+), 3366 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts

-- 
2.43.0

