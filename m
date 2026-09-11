Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4152034F27B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136464; cv=none; b=L0AnQ2G7XQZgULg0v0usdJOXaFkun3nO1rgyf3OkguN844L0JPXVozlfyWyaCXnWtQ2Q5D1S0B6+QjroDjoqEs9v9ius37m+WXkkj/RpoybPytOkk12RQXnsZbOOV+h4Bn5Dg4KNdpTYfdAoJASIzWypBt75AziL9YIJiBwGewU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136464; c=relaxed/simple;
	bh=QNrkjFX3yERMTROIB7HsnedLismbWzqTQ2RbTUepThQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ye93ZhHtfycYSH5Ut9A4Ch2QjAnulChPIlaJ2QbiWkA+FboG2/2yVg3vdVlqWCXQBJIwgCFvxOOoPgKpW2v66pKgYG6mwDFUCRXQ3SJw49DxRfr3ns1Qg7m5fcWO8ivjcsIfE5jWg3aM2l9jxiXjnEqjuachCGGKq0lykOLklNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UspwQPOb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHlMhcW9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UspwQPOb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHlMhcW9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiXQj3505465
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eRTfc/v+vMHZ9YHcG+aZ4XlSJgsNN7LQIHM
	+Gie7bJw=; b=UspwQPObDz9N2Ad15O8bphBKSbn8AAZPHLIDAieR/aE8BBQG78m
	lRMV3ulaJ55z3AWF6B/7ExpJYT1Lx8xnj16ZYCokpeSFFj6BQMfYxsJE693jXwPt
	BACD31eUUE7aSOEDMSDlJbBaZdElQbRhKCGgczwGEZnmcCbA14DvoFF/cqtxwWv1
	nV8TAonn5aBUOQv7mdw1qY2RsQ5Ncs8X6BAsqjiYcWNlNiX9gMk6BBFc6ZA+23Cr
	woT9vhATn0fYRKQCnOkhAMf7+/NIPLKB9414elgldDFjbNAfR03kAiQSttP6Ni0w
	8VUWlj/tctacyPiHKAXzXoNvn7Bq3mOLgUA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfhvk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:21:01 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-836caf085e0so11364917b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136461; x=1789741261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRTfc/v+vMHZ9YHcG+aZ4XlSJgsNN7LQIHM+Gie7bJw=;
        b=YHlMhcW9uj7HhRFeL83n7SUKKbcWzG5b6f8hrioXC8CMnh0BzS6yo61oXuElPToVKb
         jXMkCU6RzvYvCqj6R/rsXIOvCJGvEJJTlMNORi/DmyXF3CBFBfakAuob0uMaJh7PhDtO
         mQG2PABRlXqxj131oQ4Yhc4JWES+U8CvBngsXlJqcqEpg1AfCFhYTOM3LZUbNHTa089f
         RAvFr3ABVBod0C3LicZO3m01vrwNCgFS2zCZOEM2FfnYOjjczP28k01bXaT+hhyaAYvi
         E5QzHnsPJeBACZZylsjq5cUQfCZLvgTBUhSm0/1Eh974MgkjR7d+G0SpFAy/5g1Dy2YX
         okdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136461; x=1789741261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRTfc/v+vMHZ9YHcG+aZ4XlSJgsNN7LQIHM+Gie7bJw=;
        b=J1seS0Cv69U8ssi75W3M1LXAq+6S1aUJiimQ4jJvgjLnqWsCGQpoEbL6GhJs3p8AY5
         0jAx+wLcWFASuaVRIW/Q0+XoZ3+lAwkteoJKjwkqLGddjcClHD8Y3bvLGGXYeoDnspeZ
         UWTt5kvTxzTSfSUtMuA6RQ2eN9uXt7JY7xjKzpi7UUCbQ+ZnBPsUrKpahlmpqRojJcU7
         aFV+bvWCratfAl/dBkNeg5fILSwyKu0awomN7QhIjMzR1HLRVvUskruS1qZPn2ioUacg
         YClC5BsqgHB1qvzRk/PewJXBmXkJAVn/3S/uuNFOPt9W4LoM8cIt0VCpEG6gDvsjQNcZ
         JSNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzptFs5QY6Sycu4wbpjKGJ0csfjD32jlH6QQFOcFcYKklXw00fMM6wSYvdiKuftWVh2JZQNdoH2SxpzBQg=@vger.kernel.org
X-Gm-Message-State: AFuF++kHqKd7KsijyPBhnQK1mmnM1hDIwRfKSlA/OFyrRBP57c6Mo88Z
	U3MVdpfnL9S98LiNnWNfyVIbfguRsmbYkz3dVZr5iWURRxiBt4rST0wOIXCwbswrVaIvtIkN1tg
	+lGPUB8uv7Cu6fFi7VN6jIX89j6E8HUgwnTvtipBVwSEOj1pVefUdKojpINBLYCbniic=
X-Gm-Gg: AYBFou2A3cG48cLunYrI82hHG/joglPjIyFbS65xnUJorwHF3H9q+Dr/WLJb2iTaAjs
	z/aGQgygZwnnF5EBxgr0xXyerOA874FqDTZHbHUk4c8poNXZg4i20H0/gtSZwiR56raiXWc59Oa
	28d9nD/KSPQuts2FOO9xztK0F0CrDE5e7CE5rF5blOwL0nZJGpnwTslF80y4Y53l7zOP0aQPZzK
	YerlWlvIC1PpodcTaLj6uk8b467M3kae2PDezwoHTv6O2SdUO9G1AmWAawOxo2FeuciJhVhGWKa
	8P1v4kbsIPzfRcN9B93lgmoSML4woKemIDkliArCPtW/ri2g/FtvuN3i2xmTi8Bqvy6ucIseqnM
	yJIKtES19HG4/FNC4aNNfk1/bSBrqnQeINJiYrqonu5PGPrTegerN2eKVWtHQ
X-Received: by 2002:a05:690c:c684:b0:81f:4247:de16 with SMTP id 00721157ae682-884b3297d7dmr13372697b3.24.1789136460948;
        Fri, 11 Sep 2026 07:21:00 -0700 (PDT)
X-Received: by 2002:a05:690c:c684:b0:81f:4247:de16 with SMTP id 00721157ae682-884b3297d7dmr13372497b3.24.1789136460444;
        Fri, 11 Sep 2026 07:21:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884895001fasm10483237b3.45.2026.09.11.07.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:21:00 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: nord: Add USB support
Date: Fri, 11 Sep 2026 22:20:35 +0800
Message-ID: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfXwBbqhwKtCTcw
 Ed/HAHu36HcNgQWF5UNj26bswa/bJO9Nonuc44CWA4Wax+XUHUU7DWNuMUM44Ye//c7p1pNc6PM
 1EjXHnB6epatU35y58slHe2tQQyOn2sjAGEBAFZsIayndeb+AyOfLkiRCJz9B6QNe4V+7xSWki2
 7l0b7k3rJSKP1zxWJ7dqO7O19g7V14AW5AGRg00lGAwzfucfWqrae0zgugHasgb+nwpeona3CAM
 EARvwy7hpiH89SJ+0CAYRDhnbFAgtksXP7ZyRMgCaX3kyFK0Ur0r07f7u2mfWvMUpWStRA5QOHs
 955bdtymbkPh54tmzK8sD9T5Ejcl5m2xAHgLjHMV9dcX52sbWhtAZGKRszPWmWlIYDOuZ3wyEZV
 uGc/QWOy90A5y6RxTVlzepgk0rflbbmF7K1tpyjANj2xTE070YsJ+tpsXoNouTnlPij5UPvptN5
 LIh37WOwGNO+E6j3jfw==
X-Proofpoint-GUID: g5ZgYUhay2xZn3f9D83YPCigKXD5dNhQ
X-Proofpoint-ORIG-GUID: g5ZgYUhay2xZn3f9D83YPCigKXD5dNhQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfXwQOGG1mKmJM6
 B4q+AU4C2xPPnVuDTFO5G+yg1zjXUSyWLoh2nrTIwGjuHOsIa5NwYTEyikRzCNIUHJV1sniBcG9
 b1Ii05mVjgBDm5X03lg73pgeaGnZdfU=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa40e4d cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=623Z79SG-Rjo2hKprIoA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110200

This series enables USB on the Qualcomm Nord platform which has three
USB controllers:

  usb_0 (0xa600000)  eUSB2 + USB3/DP combo PHY
  usb_1 (0xa400000)  eUSB2 + USB3/DP combo PHY
  usb_2 (0xa200000)  eUSB2 only, high-speed

The first patch is a fix for the i2c9/i2c10 pin functions, which is a
prerequisite because the eUSB2 repeaters and the Type-C controller all
sit on i2c9.

Patch 2 adds the three DWC3 controller nodes to nord.dtsi.  They are
kept as far as possible free of anything variant specific, so the
clocks, resets, power domains, interconnects and PHY references are
added separately in patch 3 for the "embedded" variant, alongside the
five PHY nodes (three eUSB2, two QMP combo).  Adding the QMP PHYs also
lets the two pipe clock placeholders in negcc be filled in.

Patches 4 and 5 wire the ports up per board.

Nord RRD:

  usb_0  OTG, USB-C, FUSB15201 Type-C/PD controller
  usb_1  host, Genesys GL3590 HS/SS onboard hub pair
  usb_2  left disabled, not routed on this board

Nord Ride Embedded:

  usb_0  OTG, USB-C port 0 of a dual-port FUSB15201
  usb_1  OTG, USB-C port 1 of the same FUSB15201
  usb_2  host, USB Type-A, VBUS from a PMIC GPIO controlled
         fixed regulator

Both boards use NXP PTN3222 eUSB2 repeaters, one per enabled port.

Dependencies:
- PMIC DTS: https://lore.kernel.org/all/20260904081619.593602-1-shengchao.guo@oss.qualcomm.com/
- QUSB2 PHY reset: https://lore.kernel.org/all/20260901035322.654-1-shengchao.guo@oss.qualcomm.com/
- USB PHY: https://lore.kernel.org/all/20260901095055.42229-1-shengchao.guo@oss.qualcomm.com/
- DWC3: https://lore.kernel.org/all/20260901103300.60803-1-shengchao.guo@oss.qualcomm.com/
- FUSB15201: https://lore.kernel.org/all/20260911073414.16711-1-shengchao.guo@oss.qualcomm.com/

Bartosz Golaszewski (2):
  arm64: dts: qcom: nord: Add the USB controller nodes
  arm64: dts: qcom: nord-embedded: Add USB resources and PHYs

Shawn Guo (3):
  arm64: dts: qcom: nord-embedded: Fix i2c9/i2c10 pin functions
  arm64: dts: qcom: nord-rrd: Enable USB ports
  arm64: dts: qcom: nord-ride-embedded: Enable USB ports

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 315 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 211 ++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 169 ++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            |  83 +++++
 4 files changed, 772 insertions(+), 6 deletions(-)

-- 
2.43.0

