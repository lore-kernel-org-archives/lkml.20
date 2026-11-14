Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621664;
	b=WlZGvb67X3NrrJ2wNC6YA9XRgEYIHREKBGWhbqZkwd9ZjeTXskq6/1TYq5OaGIsh0AV9
	 gPT6+USZfDaLEch2+YqSapr/3DW5m11nZlfpgJpFZvTDuHhwSbfs26DDTbpsuVroa0eQS
	 ZyhCDnK8RY825reJhRkAXICzOKkfFmCQbn0U5GnSxPzR+z12Nc/N3MhCchl+c/9Eg71X1
	 ZUm3OD+4KkFW8hXxBe5QC+gKZcauz3i7cU+GEDCERPlGs1dxtQutzw5LjnmK2LiOm0Lox
	 tjSLJLKOTtTkCrSoAmQVQV12vtEC6F8VD2c2yUk4LTz548hRo/zEYhquSJ/MqQi2REg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w7TGz13hmATNS26qR25ht8QXbJCOX338Tixp/mKTVp8=;
	b=bWu21AHt4d84w2DST92CbEmy4u4f3zQfy2m/tGaj+u/dK0DrXlDNdF3uDSULuEHMBWaO
	 2zWCqABSBPrBV0yQf9dtaGzQYNeBPoS2xmFbUisNOSe1wHUoQvo6bPXj0zT4j7pJ92nxX
	 e0rpx7W3i8Jrb9nKLTvK99wrRAwPoAeA7hRaVdL7jZj9szuRBHe0Wp2o4kGXW7CI/ypMp
	 0NjxaQ/6CXyTMfBrQphGTSMfjxZGOSKKfemmSarogpgHC+Z5uX1NFFSJRP2/Q+QKZmirS
	 LIprRWxQ4oombrAXzPi4BluWmsttDnrJy/iNesPVnXoqtxcBt8ad1YdTJg04OfB6m1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PuYMMSrJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=icyTh1re;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18F5606A889
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F18F5606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PuYMMSrJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=icyTh1re
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE20E59729103
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w7TGz13hmATNS26qR25ht8
	QXbJCOX338Tixp/mKTVp8=; b=PuYMMSrJtDA20dZj/OqRb2qzMNrjscffChgr8U
	rF/PhND+whNzS6hePQxGRXI5ZBLRnVZoOJ4kDUH1z3i4EuIX/rccZfGdjVrIUNPS
	o4jEwsUXDICmXUHE2kFSlEGhmdHRvONlSTbHhZCcB6/6mhtCHW36D0r8n5cgpB2s
	C1Cg9E8y6KJjGaexgo0MtNIdeNGCr5OBv25H/Kz/V0J0V2ybXO+WocMJyPd4bK/l
	G6rpFqj+a8rqW3CJN+FA1Ii1gYiLQqqHGz03zPzSsiPXKurjeUoEV3c6pTmd9tKb
	NXcj6J3xpisV7uwV/JcyzOvBZ1mv59p9WKXhmu8yFKMwSPnQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxd0nr7pg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:01:02 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1af203073e0so1475072c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794621662; x=1795226462; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w7TGz13hmATNS26qR25ht8QXbJCOX338Tixp/mKTVp8=;
        b=icyTh1reDRxOByNpFuwODzCfOL9zMqNeWAVxFfu31QfzGLUUM5a8+KVGmfB9yKjrPp
         mfs/Okc9i7jm9joCodW/ZG0ST4NLiaJzez7yjH19IZXIvxvMkR6OgxwdgIpii7x0MDcw
         +BHXIj8qjp19MBngkEazLZ/P6LC/RU7LZ2ZSY4MMKImRdrLQqt/kiOPym8t0HiZ2Gliv
         ZEEuxtfD3uhyxPkzX+RJJnekS9YH2bXcVWU+HAHHkb7XxeST+A2F3PWuTZQkn8q5I8L3
         D396Lm2TrJAeV7mIse67aiabR2ff6JK8OxMs8KhsTVWJ8qgnUgxrEgRttvofADZJJaJ+
         2rEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621662; x=1795226462;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w7TGz13hmATNS26qR25ht8QXbJCOX338Tixp/mKTVp8=;
        b=dVwJozIe0fn4zUSGim8pu/6Udr8Uttb6ZIJZWGgPD/uE2yEfuH/LwjJve54HN/LBIQ
         AKd3zWXr1l1w7fSN6WcHUN+2Hs1rGtNmJM0+1GdbCuwyIOZvmnHPMuFxjLpoF79N2GjV
         AGx8Pw7a3Vsqdii7qEs6VLJ2gm6QozYXESdAtLVBYTo3/wlSSw7bMxBIzvJqAcGd+xTW
         C1cOjzksH1TjtzBtaKb2vFI1A4Jci2ggZOShcMj4/XSf6Z+vFJQg0XX3g2u+Pnm6zl0a
         pq3d5PNy39vhX8A1j8H2m548pc0XZRg+3fQ5HMDf0ttlTklgaAYNQRR1oQMMucurIi2D
         zKtg==
X-Forwarded-Encrypted: i=1; AL+hErF4x87MmwUfrVzmuB35juFFhQ1pjnkZmGhihH/36u/MPpaSu/THKzQ/4JKN+qMN+56lpjfPF+MNrequLVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zP1jN36OvfcUPFSR/pOlfDKBDopsnzyEKyzqcHyRc3OlL7NXt
	MXAh0xcZEQxRxK/PjXh0pdoGRFMw+yuUffZ1D+XJNJyBx1sgemxfvqic/F/JT86nLjBubwYq65w
	Mw2Wn19WmfLlkufATL0UYRxtBJpbIlFXwVPeoPUtpHvurLMY59kIvvHchgXbqn0JgzFc=
X-Gm-Gg: AYBFou00boWjoOPkK7+d5//gdRaUmsg+rW9U6sIAf5hg26tZvyrag3/6eY8yeyCgsHh
	98xMziMTpU86bIgDCqq1B5RikQvrxzanH0bCDSIdmu5oIwA721B2cryI6Y1Khojn88xCIsSyQ73
	T8bwXARZ59uoFq4neKbG/43x/KMVWcVb7itkYPPntrDUaojixJ4+5kB1Egitj9XsvlI/KhQ7Pim
	CfkWgRBCQ9RRO+08gZ+gCNyI+32Nd4TzkA55tVByj+pHCdkBNsh+azPc+836P2impNCbkUdIYhJ
	EWOWEXri3vAQevzCl9GhvBTEyPAbWk5s9G8NlM8mgYZ2tWqq4wbQHvAu8ZyQ8JzNkRWoWvs9ghc
	u/2dfZdLRNKsKCeCnCkMUbk1SRnGn8jv0+vSV0bP/F2zXH/6vg7aw0cz2HrMAhlcYWJNhaxwzxs
	HNBpZMcWna
X-Received: by 2002:a05:701b:4642:b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b5030eb063mr3538979c88.12.1794621659800;
        Fri, 13 Nov 2026 18:00:59 -0800 (PST)
X-Received: by 2002:a05:701b:4642:b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b5030eb063mr3538941c88.12.1794621659118;
        Fri, 13 Nov 2026 18:00:59 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm9952742c88.7.2026.11.13.18.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:00:58 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v9 0/4] PCI: qcom: Implement shutdown() to avoid SMMU/NoC
 errors on reboot
Date: Sat, 14 Nov 2026 07:30:50 +0530
Message-Id: <20261114-shutdown-v9-0-5430c9f242ed@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANLA92oC/3XQzU7EIBQF4FeZsLYTuMAFXPkexgW/DsZptbRVM
 +m7S8fEYTHdkJzkfOcmXEiJY46FPB4uZIxLLnnoazAPB+JPtn+NXQ41E6CAVAN05TRPYfjquxQ
 14yakBE6RWv8YY8rf16nnl79cZvcW/bT5rXHKZRrGn+utBbbendkFOtpJoBZ1Yk5Y+TSUcvyc7
 bsfzudjfci2vvDWi8bz6jXzTDinLLNpx4vWY+NF9dHJFE0QUti44+XNGyobL6tP1KOzybIg9u5
 j603jsXqsf+oCAw4cd7z694xC61X1PAVlFVo0hu14ffOMqsbr6l1CqjwKMI7e8eu6/gIJ/4hvO
 QIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794621655; l=4535;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Cu5rLdDWJqafbz3+M6KVDjIsNv0OakL2e42N/mtr/lo=;
 b=k1j9Nc6d4s8kj5tRPQ8BtpVSXBOSpp0XcIYuCWX+0/UfRXfCVCfO/AymCOr/NZQPIeN9Dcwp0
 8UI4NTefO9mAsrdwQkS5Z9jEMhYVqv6KRPf1wU6gh2xe1fmZsWRFp5b
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNyBTYWx0ZWRfX2/vOyOdHVM2Y
 mhv6ZleVOEtnmSFe7QpzZbUDKaYtZzomwN5Ep3320cx/uh+Ao2DSEzLaI0gA95XFnY2zncMr/FB
 p+oiyC/WIiV9W+DtAr86ToDdg0Qts4Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNyBTYWx0ZWRfXzfEO0gHlRALJ
 BzUYPVMX5Je9AQKCyu+kHP/MP4+bABDETs64fQIOdxert7xnD6dAiH6Cvs/0aHpKvwY1EI0UfBW
 M3crZIRxVobEK6zM+w55tP3jkV6RSpj/3F8ohJjh3SsnVt4ztx5llj+KiU6ewWISwsv++6IGnrc
 incEwnt/DRo5Byc1EYtJjfJOMPx/3M0oBTZJstgLSye3tVZNZbEBzGVQrlXTiU10LA6EcTszD1A
 JeO17/xuDux71zICH9V7FrknLXYa6GNW27jJoAAjyDC4imtmIM793sYCjFKPDuNX+RRdPd98oAt
 JciJbSCNy0XR20Yx0+WkXcikbWk7ZJpjzbSyIOCzI7bjP8psKYekNGJWvmpnFNR6EQ1Q/4muAMj
 alFArJHaVv3rP9G4k3aCoPuIaZ7T3gt35E9cqjGcRRLfbpaYAXWewgJAX8JaL/KjEz0IHj6hinH
 iobVfwnJi7a4vpYInoA==
X-Authority-Analysis: v=2.4 cv=Zo54uN7G c=1 sm=1 tr=0 ts=6af7c0de cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bBQ1TlrZeL130n7Dx0UA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: wdrG6mdrFt_lzis26p4GGEoOEG5YeTQO
X-Proofpoint-GUID: wdrG6mdrFt_lzis26p4GGEoOEG5YeTQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140007

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
Changes in v9:
- Use uniform structure in shutdown covering firmware managed one also (Konrad).
- Link to v8: https://patch.msgid.link/20261107-shutdown-v8-0-bf607c6429b0@oss.qualcomm.com

Changes in v8:
- initialize 'pcie' to NULL to fix uninitialized
  use in firmware-managed mode (reported by kernel test robot & Sashiko).
- Added new patch "PCI: dwc: Add dw_pcie_mask_msi()" providing the helper
  used above.
- use new dw_pcie_mask_msi() instead of dw_pcie_free_msi() so the
  MSI IRQ domain and downstream MSI mappings are not torn down while
  PCI devices are still present (Sashiko).
- skip dw_pcie_suspend_noirq() when the controller is already suspended (Sashiko).
- Link to v7: https://patch.msgid.link/20261029-shutdown-v7-0-3fd7a76a6991@oss.qualcomm.com

Changes in v7:
- rebased on pci.
- Link to v6: https://patch.msgid.link/20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com

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
Krishna Chaitanya Chundru (3):
      PCI: host-common: Fix early bus-walk exit in d3cold_possible()
      PCI: dwc: Force L2 link entry on shutdown/reboot without D3cold check
      PCI: dwc: Add dw_pcie_mask_msi() to mask chained MSI without freeing domain

Manivannan Sadhasivam (1):
      PCI: qcom: Implement shutdown() callback

 drivers/pci/controller/dwc/pci-imx6.c             |  2 +-
 drivers/pci/controller/dwc/pci-layerscape.c       |  2 +-
 drivers/pci/controller/dwc/pcie-designware-host.c | 31 ++++++++++++++++++----
 drivers/pci/controller/dwc/pcie-designware.h      |  8 ++++--
 drivers/pci/controller/dwc/pcie-eswin.c           |  2 +-
 drivers/pci/controller/dwc/pcie-nxp-s32g.c        |  2 +-
 drivers/pci/controller/dwc/pcie-qcom.c            | 32 ++++++++++++++++++++++-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 +-
 drivers/pci/controller/dwc/pcie-stm32.c           |  2 +-
 drivers/pci/controller/dwc/pcie-ultrarisc.c       |  2 +-
 drivers/pci/controller/pci-host-common.c          | 13 +++------
 11 files changed, 74 insertions(+), 24 deletions(-)
---
base-commit: 6633c535abc356ff868e72025ecd65aa0106630d
change-id: 20260822-shutdown-fe8139dff2b7

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

