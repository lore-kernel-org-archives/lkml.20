Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27A74F55A5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956684; cv=none; b=IsVnbr3EGYpygoDvOiuCApdFKq8Nk+MvSC58nPppoZB66HlTVOavhrmZH0c6uBsfxmTLblK6a+OZGIebTD7E7+b5BeRwO59uJ/YVLRTqkEPv9svwuAMFLmsqlP63qDUIccReErr6Xfd+XqY/nK/yKggyJyGiXaHfeKb6fIheaUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956684; c=relaxed/simple;
	bh=/u1XkTJCjKbfZdjDRj0YCdgdFv7J1F2OFSdLP99FVps=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DXr3LlYdphi5HSCKXjMqIvvEr4mtMMpV5tV2ciCTNs/HszRHvgGm6q4IYuC2lBJ6gNoPtO2SCwOvhkwTjIC3+c2t7kH0MT6cGp2j1c8WMhxldLMsDqb6z7k2Xur9Bg2htD7nITOYrOjB4ZPM5Xffc1MswIkFYec9lFgd1ELd8gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iw2zyQs7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZjmvReSh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iw2zyQs7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZjmvReSh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUCWJ1843087
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zH0TFwxxsX3Ny134E7Q4LS
	sAdItr94aBABcoXoluY5A=; b=Iw2zyQs7XIjQD6YO+07DageWa3EAJ6JumP1w3T
	7QgUs+6k9OHbH46MXglJeDDeGEDZ56DD1PZ7dwfa71oZilPNBBDZpr1WBkdFRNxM
	b1IZdpzUwsyCuSCg8HCdjrkbigBdmwb9b7NNCInyQEbcTHYgXD0NMsGw/Iri1i06
	UtO6SA6k390WROfkx8JkNbOx1epiWLpVbp5JRvueYiQTcnqPLuDnmqwp0mbS25u5
	j++1MhFr7pyAd5T9n5dpt78ZJ9BSR/x1ZVx/29K4WSEpG0UdQhWo9T4/RvVh2qp+
	/YFSlt592isp3n8tm7FgYZCxhYCp6TSqoK4ybKzjfc8t6/Fg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxqja6y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:24:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b8088202so5219290a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788956681; x=1789561481; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zH0TFwxxsX3Ny134E7Q4LSsAdItr94aBABcoXoluY5A=;
        b=ZjmvReShr2DDurKEttlhfy06cFSPYgA8R0dRLhDmcZTrLx+w8bHpNlsS7SEvS99xOy
         XqlfwB317KNPN8TSaRfVoXKgVs27rmEym6Mzl5dA6u2Hp9Sl47c0TxQ1qV84fOlkqRP9
         i6mZjwkbaBfHyLKp0oIKVllsUTFkcjaXI9gyxG39Wcs9g+srqAg1a8LEJjFEYUhT0P5Z
         4bvAVu7H01ArW7tIFQ5DJ6lvWa5d8ld1EGFGz0RWKPoZ7mp/N+QL8O0dq6BNKn+6Lacw
         6ckUTtfPsEeaB5hEBd/0U9FFZ1+QgvUJrH5vbtnZbbqQ3YJj3vCYzqB2tFJqk4liwd3v
         kraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956681; x=1789561481;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zH0TFwxxsX3Ny134E7Q4LSsAdItr94aBABcoXoluY5A=;
        b=XzF31aNFq6aDjMmM4XdvOjyIGryzftu/GpcaV7PSaPBk5O188V3CpwfAjW3CXK1LVD
         mUXGeaBqa++TZPg5EP41bxghiERJ9coYv797M02koznX1CONqjdNN9zYX4aAqluNuyPG
         ua7RVsnQrS0DQ4JOsUBrYyYgJEPo7j+p8/xxCDlPjxBIqirug8sGM4SCSkeSEg/P4uza
         klPky5G7DbqBAA06zKMDDyobx8FARjSVytK7N9676ttJIjf394o0xRbN+gZC/VheoIeS
         K7Q3wfKKUujjaM4eL+2UX24j1zuQi85RHA2mlp5gMf6mL4w/OfoNgVBvM7YfMVcVOhdL
         vBjw==
X-Forwarded-Encrypted: i=1; AKwUvBzDr0kUO+gZXYOD13U7kLdccoo6R6mqeMIU9iDBcEXkTiQA1AIgVubzGNCHDJp9n0Pk1sPX88ESIkqBisE=@vger.kernel.org
X-Gm-Message-State: AFuF++lNnSeYhrG3CeMOquekPwHWEssV6n/vWt4R0kapZdTEOhUNjkMK
	QA28sdXpkVXLOkL5D68vNKzp9AN2w1pswUAcU16FtqqxrDhryHx3NW5PBoFwK5fqSUsKz8h+524
	3/ckx2oKasHJ+q/TBrnbxDcLR9jHUWM45+W6QD7v+Qh+eDUu0s3RSj3rrpGERDfs4o9aENByGzN
	s=
X-Gm-Gg: AYBFou09/qD9h1N/xWPzRrQ4ipUFo1WtQJJfRT1zfVCNODFo1SosDwW7UpAzq/zqg0Q
	TJJpKSJ18g8aCuCo0D8IponjHPnurG4g8PkaFHPX2XCaIM+/T582XEfPO2Rxm9Edk59Mmv8LxJX
	EWHh6Z+QrfVS6A+BNCvwEnZfxIe5KjImgH324vcqNBNs+AG5rt6VYFrNd6cxsEmWjiUuoYDg1Ec
	3WyMD84Zzt/RtBiTBz6OV7aCwZgVh2hbiUAVQAQnnh5u1F5b4F2d8T1tTRKr/kotiUM2xHDi4Ae
	XGERLJsrQlrM+s/YCh/0SLjEcq8kVNcOko6c2w0qljCVZwXnMZ4poaos/XbUrRfROEuaEFbOu5q
	ppsE4idiffD10/DVCt/baXGqkc9lEYKpBLAI=
X-Received: by 2002:a17:90b:3e4d:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39d709e74ffmr862082a91.4.1788956681030;
        Wed, 09 Sep 2026 05:24:41 -0700 (PDT)
X-Received: by 2002:a17:90b:3e4d:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39d709e74ffmr861969a91.4.1788956680359;
        Wed, 09 Sep 2026 05:24:40 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm69372775c88.4.2026.09.09.05.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:24:40 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v6 0/3] PCI: qcom: Implement shutdown() to avoid SMMU/NoC
 errors on reboot
Date: Wed, 09 Sep 2026 17:54:27 +0530
Message-Id: <20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPtPoWoC/3XNQW7DIBAF0KtErEMEGIjdVe9RdTHATE2VmNbYb
 qPIdw9OF2WRbEb60n9/rizjGDGzl92VjbjEHNNQgt3vmO9h+EAeQ8lMCWVFqxTP/TyF9DNwwlY
 2XSBS7shK/WtEir/3qbf3v5xn94l+2vzW6GOe0ni5/1rU1nswuyguuFECbEvSaTCvKefD9wwnn
 87nQzlsW1+a2uvKN8W30kvt3BEk0BOva28rr4tHZwi7oI0GfOLNv++EqbwpnoS3Dghk0I/+r+t
 6A44yKhh5AQAA
X-Change-ID: 20260822-shutdown-fe8139dff2b7
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788956676; l=3457;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=/u1XkTJCjKbfZdjDRj0YCdgdFv7J1F2OFSdLP99FVps=;
 b=c6NZ+P2/EU2eAG9CvLVvtnFeEiKcXkKRBppCa9Z8SMbnIOT2ipEvjupWrcivaZQmA7YGd40FP
 aXDB3xDshWgCQ0QQ6XJJKpf0x1wmyQK20opCSkhyq9lIS5ZTfvzPIAf
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 71eZ3veO1qrfQhkDQ1IU1PBGSScQqBme
X-Proofpoint-GUID: 71eZ3veO1qrfQhkDQ1IU1PBGSScQqBme
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfX5D1rHBKZflwM
 JCsokufVwDj2tg+h/PMpuHV++EuXAUAYfd6wOOJebo+pNLpBNS4izjSHNxhEHUzArgOZgOk3hX6
 l/HMWUSbmFEzFFw7s3RxuWZoMxsYFkVTt5+cljoPiEMAzetAJa+rkyebvrWzwEu/R9h9v32Ud1N
 3H+C4yhAUfVAkEy2iLOG13LyK4XqxDLq+tfg3DgaOF5iF7DkrfjfKoTmXhn1QbojxKZn+CNPnVQ
 GIHqcvH9FEJ0SyyLFZWd7nSkRn/0lfEIlBw2Adks2zeKFn8DtCjlSeGYlWp/P0C17p1IQxGLJKa
 4HPmsnnujVK33gMPt/6x2FHwS3yxmxPNygmQPJpNdzYG6ARJj2WTOkYSHd4uwSqNkuAVI9ceql4
 K/sGdFBg0IJKVb1SeOzhmfRl4i0+g4rECHUYfXYMneGbr/sNgomCyMZjgLzqiUokJWkIHmWF/zE
 htNugkuyNvGRYNLMa2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfXze5p+t+Y9M/O
 jj5ltLylc84ImSVRKxWgUwA2YemMnn6ClGPo3HGKY+7duVTwI2s5sweG1YjKDjrhP9f491J128Y
 dNSuDkdX5RPlms9t1TzyHIGVeSwo6sE=
X-Authority-Analysis: v=2.4 cv=f/p4wuyM c=1 sm=1 tr=0 ts=6aa15009 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=0uohWpJSiqPYzphn-GwA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090138

During system shutdown/reboot, power/clocks to the PCIe controller get
removed regardless of link state. If the link is still up when that
happens, it can trigger SMMU or NoC errors.

This series adds a shutdown() callback to the Qualcomm PCIe host driver
that forces the link into L2/D3cold before shutdown proceeds, reusing
the existing suspend_noirq() path.

Patch 1 fixes pci_host_common_d3cold_possible()'s underlying bus walk,
which aborts as soon as it finds a device outside D3hot and can
therefore miss a later PME-capable device -- something that becomes
common once patch 3 starts forcing D3cold entry during shutdown while
endpoints may still be in D0.

Patch 2 adds a force parameter to  dw_pcie_suspend_noirq() so that callers can
set to make dw_pcie_suspend_noirq() force L2 entry during shutdown/
reboot, skipping the D3cold capability check that can otherwise leave
the link up if any endpoint hasn't suspended yet.

Patch 3 adds qcom_pcie_shutdown() and wires it up as .shutdown.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v6:
- remove return 0 in d3cold_possible() (konrad)
- use force as a paramter instead of the element (Mani)
- couple of nits (Konrad)
- call pm_runtime calls for firmware managed one also as we are enabling
  pm_runtime_enable and get for that also.
- Link to v5: https://patch.msgid.link/20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com

Changes in v5:
- use a flag/parameter Instead of poking the system states (Mani)
- Fix pme_wakeup issue by walking through entire bus (Sashiko)
- Fix Irq free issue by using dwc free msi API (Sashiko)
- Link to v4: https://patch.msgid.link/20260826-shutdown-v4-0-eb5fe9d454ae@oss.qualcomm.com

Changes in v4:
- removed goto d3cold, (Konrad & Sashiko for PME error)
- Disabling MSI IRQ's (Sashiko)
- Link to v3: https://patch.msgid.link/20260824-shutdown-v3-0-81c14bb7a1af@oss.qualcomm.com

Changes in v3:
- Added null point check and use pm_runtime_put_sync (Sashiko).
- Link to v2: https://patch.msgid.link/20260822-shutdown-v2-0-520a68f1b4a5@oss.qualcomm.com

Changes in v2:
1) don't remove the endpoint pci dev's only keep link in D3cold.
Link to v1: https://lore.kernel.org/all/20250401-shutdown-v1-1-f699859403ae@oss.qualcomm.com/

---
Krishna Chaitanya Chundru (2):
      PCI: host-common: Fix early bus-walk exit in d3cold_possible()
      PCI: dwc: Force L2 link entry on shutdown/reboot without D3cold check

Manivannan Sadhasivam (1):
      PCI: qcom: Implement shutdown() callback

 drivers/pci/controller/dwc/pci-imx6.c             |  2 +-
 drivers/pci/controller/dwc/pci-layerscape.c       |  2 +-
 drivers/pci/controller/dwc/pcie-designware-host.c |  7 +++--
 drivers/pci/controller/dwc/pcie-designware.h      |  4 +--
 drivers/pci/controller/dwc/pcie-eswin.c           |  2 +-
 drivers/pci/controller/dwc/pcie-nxp-s32g.c        |  2 +-
 drivers/pci/controller/dwc/pcie-qcom.c            | 37 ++++++++++++++++++++++-
 drivers/pci/controller/dwc/pcie-stm32.c           |  2 +-
 drivers/pci/controller/dwc/pcie-ultrarisc.c       |  2 +-
 drivers/pci/controller/pci-host-common.c          | 13 +++-----
 10 files changed, 52 insertions(+), 21 deletions(-)
---
base-commit: 12f8e3e3eef4a662b622cf12f00981f64c276307
change-id: 20260822-shutdown-fe8139dff2b7

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

