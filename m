Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA04345ED3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120919; cv=none; b=Ppb7WvXc2c7D/eBadLmHR+LNCpnJNDk457oZA/fIr/nxv9dBBj3W/Gu8+A6847XdMr8i0fF1xWwmThK8hy46hSgKkPPNDVhBkOECCOpU7pqjc/siyKqqQSAlXMMqQPshr6juYQEUp7hwoimi6EoHg7eHiIBHRaAh97H+80h4Pu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120919; c=relaxed/simple;
	bh=fJNebOA6kOSU4sl/H0TFH6fkosa4uuU2btdjCjK3BIw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rR1rc6rAZuDEydGlIJQB8XLIkII0OPH4bXi7MEioTyzjvkxzEuYlrucxWQkbLnbqKliMVhQ2oVkhBHFZ/0rhWZaoglyMY1RMugDotnV5ngMip+BWLQUZq1GrSbYuxnkekFq9H9C4KfDtHxSNA+FJH0LoDStDjefYBpSCsCel3Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqwJvzVj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NgcJw4jo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqwJvzVj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NgcJw4jo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FND6ne558197
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=egCdW1LXWuBj/OhNtABuXA
	0BSDpsR1633mpKJv0DbUE=; b=IqwJvzVjMXe9Ds0rE/8j/PAj0+ZIvehFztaZDA
	HOMD1hOwChVdr9waHxi6yXNW16sXN7/jWVsDXbBgLNxpYxrytm1cbFsgEJNReoxA
	FvQqWf9ah+j1oy5VBlkCzlYjlz/CCJbKxuTjU8LXNZyjlkRgTJa1Ln6m/M+0CIz3
	ChjPTNpvO24g9CLKOXE2jOLU3ihYn951Plvetl8t/c0s6HSQjNRnV2PS2Sg0J/d7
	HKuvOfv4Djo2lafoPyCaQJnA0Y58n0qfwvlhB9mModcrXgNeNYVgZ63N6HaKGnaQ
	6ewWGO3zGGKJNIgoM0d+dvAMtvz+B7xmlzmBMv/MaEzuYnnw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a88p2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:21:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3592749a017so549452eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120910; x=1792725710; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=egCdW1LXWuBj/OhNtABuXA0BSDpsR1633mpKJv0DbUE=;
        b=NgcJw4joLS20zrKpIBGbvDndlhqXtsDj51gPQyEuEvP2cc/eiQ7lQ7Ej2ErjQZm1/C
         32fjo1+pAIuUWZFphj8XDJCM+PhEhlsDDXd7UwmpEdURx1VGx6nqeF3JdxzJnOCwLlvI
         XarnQSMq/MAvkEyHaJSFd+oPGFp2ZYWUy1qTn1eKB5Osty3FSznu390XIjyJ5M3skDVk
         U+4juiC7qw8sxDg05fqvkWQL3T7gOY4eOceFKbW/QLInKKb3LqbE+FZ/klM/YXrX9HbR
         0yBXPBJtZ2bfAhZrjcuw7HTvFlLabfquhpmsgTrjzhVcwWAM+asmL2X4B5/2EzjunGD2
         sYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120910; x=1792725710;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=egCdW1LXWuBj/OhNtABuXA0BSDpsR1633mpKJv0DbUE=;
        b=GiH/PeeRFgMfoYgPvTJa5tjVUkKePyCorg5V99C15CEqdAcV9VeNpQFOE5UJ20SQsj
         UYkdbBYPd5lQP1A6/1W7Umc1KjQhLbWYVCf59seq//DazSQm6jSBxbJO00BqwmGJorS8
         3HoEkTLIH2znsXQOfp2fkaWg+OQhx+JJ2wvkGQrrrB9O9USi1cWgyZrf8EMISWo6JdZM
         imhR+oteK/C2NncgQziIge0/mqIuOnMykZDRTsMqqh+xgouxQ557Lm//JVpzKufwUHfw
         2yz51hLt58o5nRlXFdljiWaOD3esiMWHerOfWYQbg7LOMuFItUoDOcPjuLfpweGgKSMe
         uchQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7qyv/O7brwQNLAyG6P2tjsg9Ah9uP7EGadDR1cve2hB0dguOG9vFO3bc/bdnSwHt/HQDDXLCRdMkbbOo=@vger.kernel.org
X-Gm-Message-State: AFq9FYII9vIEph5sPxnZnju+dyoeAs5uW5ZVNB3wbk1iL+5JeALGw22w
	nIE7GG+7S+a+sk+Jr+yzbQZRklWbnMpMz9sy7KejjZ7JaZxKlbnxbOPZzgs+72RseEhzPqBT872
	UXUEQPmGwncwFF/qiykw3KiGZTnTnYviuv+zVWGrbbZq0mATcVuuKr1n+idTyO4sp8D0=
X-Gm-Gg: AYBFou06EJ3nB5MF6FckeNT0US/oSlOH+7QJoR22K8kWP/BEDjp7GGZU1ACHJyb6UUX
	bPJnH8BRv43sgkpeEdsTjXhHslLjkoTsrehYwMww7RhEOSdqIgOaZbw2ykmd54aPVYJEsgGa+DH
	ElMJdu6CzP7bpXx2jVgnyFeNVP7xPTBS3Oa2ADbI2RoVFCAtzDkI9NddoqewAHbmm47z+aQ43tt
	dr4BXO4pNlO64vGJNf2xb7fI2mTIiROaYUS5Ck5uCAy2o9340S+qCK4QM1CgMsK7KOhJqQmA6d/
	vZ9s49NvcTM3uYDV9Wzwh5s1uteL9t7wrG7N3MvUNi/9NNzloR+EZXp3vxurMvd0jlQLK5ftz5E
	JuEBM4VrSfllFebWD9usZuggmTcPYOVjoDkDT7C1HDRDS9Gr0BlZJrqtDp7aCgzS/+abuRdmxJ8
	SvRmgO07AQ1K+er4EvxVc7PQ==
X-Received: by 2002:a05:693c:88d1:20b0:353:ba38:789d with SMTP id 5a478bee46e88-36027340d18mr2367626eec.0.1792120909924;
        Thu, 15 Oct 2026 20:21:49 -0700 (PDT)
X-Received: by 2002:a05:693c:88d1:20b0:353:ba38:789d with SMTP id 5a478bee46e88-36027340d18mr2367593eec.0.1792120909218;
        Thu, 15 Oct 2026 20:21:49 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:21:48 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next v2 00/17] wifi: ath12k: Add support for QCN6432
Date: Fri, 16 Oct 2026 08:51:37 +0530
Message-Id: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEGY0WoC/yWMQQrCMBQFr1Le2g9tMFa8irho6kv7BWNIUimU3
 t2oy2GY2ZCZlBmXZkPiW7O+QgVzaDDOQ5goeq8M05pT13ZWnjGKSxqmJUpv/dH2jv5MohYx0ev
 6u10xlFkC14Lb3+TFPTiW7wz7/gEUCFUHeQAAAA==
X-Change-ID: 20261015-mpp-bringup-75f457bef8ee
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXyf6JojU2Ed5z
 tZ30rTqnnzZd9TvNmpJ0sfK5+fwiYZwRb5X9n62RIEGmwWi2yO+3TkkjyQSRqnssBOBLKpA5gdA
 bkUuWlYeXWZ0g3lOL/lA12JYPYe7XCM=
X-Proofpoint-ORIG-GUID: b2i-P1ZTyNQk9VGp1DlOkQkhWxGjSbif
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad1984e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j9mdO8TpxRXb4I9anNkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX1XxZlMcg7Vfq
 sWGwAC3wyd4Wo6jzcLefxCE1+e8A7sJ3VdRf1/4KRS55b7i1Xr1/Toq33UTBuXByyz4Hvjniucy
 Q7y1QkfbD7zaKZ9EKbM5vyzTSBKPZR7MsKJegeksNQ5XeiFvpTi1esCOVu6N4b5RVq+GDO4TDiD
 n+xQG37EJ7gfSQilC2OLeMauZ7ID9AyftA9ueL9+CH3lqWXlTtt6RQC98SFesUZ2Uvxf1d8GaFg
 pL/omJeQTd6BHaKXlXUdd2+BH3WM5HgtioChCURBK6rjfcr6P4w9tQ0e2g4IDCVBgHOC5C6+GWV
 tPsleCRULAY1MTDVFB3+SrxBOrNnIjF9yvtCJdGlf6pCU4dg0oudgVB5AV4QN5ZRHmolN77XZ/R
 nECysPEX+G1tnOHH+DHwTZcue+wGoow2VOx+4Wkz5etCaZBkD6NiVHnld29qgCdTtOeXFvae76O
 SPI7M8i4nR9nYmtXP1Q==
X-Proofpoint-GUID: b2i-P1ZTyNQk9VGp1DlOkQkhWxGjSbif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

QCN6432 is a PCIe-based device attached to the WCSS Q6 processor. It is
registered as a platform device (AHB), and remoteproc APIs are used to
boot and shut down the device, similar to other AHB-based devices such
as IPQ5332.

However, PCI APIs are used for device setup and register access. Since
QCN6432 requires both AHB and PCI APIs for its operation, a hybrid
AHB/PCI approach is implemented.

Overview:
  - Patch [1/17] adds DT binding documentation for QCN6432.
  - Patch [2/17] refactors PCI operations and MSI config structure to
    support different MSI configurations.
  - Patches [3,4,5/17] add hardware parameters, ring mask, and registers
    for QCN6432.
  - Patch [6/17] moves multi MSI vector flag to ath12k_dev_flags.
  - Patches [7,8/17] add hybrid_bus_type and HIF operations support for
    QCN6432.
  - Patch [9/17] adds support for unified data-region memory allocation.
  - Patch [10/17] moves MSI config to pcic for better abstraction.
  - Patches [11,12/17] enable MSI interrupt support for CE and DP rings
    specific to QCN6432.
  - Patch [13/17] uses CMEM write for PPT on hybrid bus devices.
  - Patch [14/17] stores and uses per CE DP MSI data for QCN6432.
  - Patch [15/17] derives QMI service instance ID per protection domain.
  - Patch [16/17] add userpd ID mapping per device.
  - Patch [17/17] adds support for QCN6432 in the driver.

Changes in v2:
- patch 1/17: Update the compatible string from qcom,qcn6432-wifi to qcom,qcn6432 and remove the | character.
- patch 11/17 and patch 12/17: Fix resource leaks on probe error paths.
- patch 16/17: Move the NULL check before the loop.
- Link to v1: https://lore.kernel.org/linux-wireless/20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com/

---
Aaradhana Sahu (10):
      dt-bindings: net: wireless: Add QCN6432 device tree binding documentation
      wifi: ath12k: Refactor PCI operations and MSI config structure
      wifi: ath12k: move multi MSI vector flag to ath12k_dev_flags
      wifi: ath12k: Add hybrid_bus_type in ath12k_hw_params
      wifi: ath12k: add support for unified data-region memory allocation
      wifi: ath12k: move MSI config to pci.c
      wifi: ath12k: Add platform MSI support for CE
      wifi: ath12k: use CMEM write for PPT on hybrid bus devices
      wifi: ath12k: Resolve userPD ID per device
      wifi: ath12k: Add QCN6432 AHB support

Sowmiya Sree Elavalagan (7):
      wifi: ath12k: Add hardware parameter for QCN6432
      wifi: ath12k: Add hardware ring mask for QCN6432
      wifi: ath12k: add hardware registers for QCN6432
      wifi: ath12k: Add hif operation support for QCN6432
      wifi: ath12k: Enable MSI interrupt support for DP interrupt
      wifi: ath12k: store and use MSI data per CE and DP interrupt group for QCN6432
      wifi: ath12k: Derive QMI service instance ID per protection domain
 
 .../bindings/net/wireless/qcom,qcn6432-wifi.yaml   | 149 +++++++
 drivers/net/wireless/ath/ath12k/Makefile           |   2 +-
 drivers/net/wireless/ath/ath12k/ahb.c              |  54 ++-
 drivers/net/wireless/ath/ath12k/ahb.h              |  10 +-
 drivers/net/wireless/ath/ath12k/ce.c               |   7 +-
 drivers/net/wireless/ath/ath12k/ce.h               |   6 +
 drivers/net/wireless/ath/ath12k/core.c             |  10 +-
 drivers/net/wireless/ath/ath12k/core.h             |  24 ++
 drivers/net/wireless/ath/ath12k/dp.c               |  39 +-
 drivers/net/wireless/ath/ath12k/dp.h               |   2 +-
 drivers/net/wireless/ath/ath12k/hif.h              |  30 ++
 drivers/net/wireless/ath/ath12k/hw.h               |   8 +-
 drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
 drivers/net/wireless/ath/ath12k/pci.c              | 111 +++---
 drivers/net/wireless/ath/ath12k/pci.h              |  21 +-
 drivers/net/wireless/ath/ath12k/pcic.c             | 435 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/pcic.h             |  24 ++
 drivers/net/wireless/ath/ath12k/qmi.c              |  83 +++-
 drivers/net/wireless/ath/ath12k/qmi.h              |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  45 ++-
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |   7 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  85 ++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 142 +++++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  22 +-
 25 files changed, 1213 insertions(+), 109 deletions(-)
---
base-commit: 2d57db8fbf72b1872e7411e917166bd12ed5bc98
change-id: 20261015-mpp-bringup-75f457bef8ee

