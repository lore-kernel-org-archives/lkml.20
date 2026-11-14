Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621667;
	b=l6k5eHUyk8lXlccroeDl4Tr5EykSTePv/adFvIT50SR1B9vqWtxdDdHxIJwl8IO1z57R
	 yNQDl5Uu+rE2j7D4wMXVDDOAE2QD9ggbrG9ObU3gi4cpXsyH2+cDtJWNoDSfcokAIRBzN
	 AAPsZjOmQxo2YsT2kmyGziscDZdHEQlDYS8bVfNpuFeF3IHIPbC2cy2NLJcxYemVKKRri
	 XT3+qHDaJKO42iJHC763it4RjL0oaD3HE04fMF1DPRQYb9SRzT/8yqqEmqhGwsGuCX3jE
	 R0OVX9Hgzlnuk7FgT1seNVjQ1jBs4z1tIoDGOXy8DaYeOd6YlvlH5wVFRM9GEvimLaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621667;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
	b=csg4OBGzosurGJvRrlzzQ1ZCdKDMwBdCCfPB2SFb6mON5RH7ygwzdUm6hwiHRVX9945n
	 +qnaFIh4caTmxmPPe0RORkgan3OFk4+PXooMd4I+HwdXRFs9MT5B34xMzDd44Kvlk6tS+
	 UVNY+4Zzmg6QfffnfBh0tz5aVs0w/iO0ivgtZ0D06j1M0msDDKrX+kTBXlA02nzFxfVkA
	 9B4yZoXcBXw1vF1MqjvcqeiUhYWOMjPLCmFzE1GRr+qswbQQ3vW4zmUtq5JDXM5kntm6b
	 HrfVMaouUIdkR1TvdoSE0lWypBJ7Q7fQbL/5vmX3I2CGcJ3PDZJCuB72Jw4HKE6ol1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzXSZHmP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VVJa9l79;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36A060A3821
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36A060A3821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzXSZHmP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VVJa9l79
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE20Fll3350222
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=; b=PzXSZHmPbBPCB7HA
	hn/8sbYBAHxFIXL9DXDrrD54cbAkryq1Xgu/vJI4egw1ZbTwAcO8vuFcwGwoN0C+
	udDBEgvBbxsB9HVseaCKsV/MuFU4+HzQ5lrH2gLyY1CK0c4FeyjvLq2kdl7ToYK6
	Dlyq30+Bu8sBtaI/MIldw4ouJdrKmXrHAZnXI3Mn9bfrN4SWlAtMTCEY6B+C8zsi
	XiUD9y1FZx6EBq3S7lrAP+U3qfbERNld1fdnWvvNqzC2Uwh6Segwkg5pvab8PvT0
	pBaT131EtbaOtad0EGgHyWYeDpj3IH8h5XtLIhp0G8PESoz/03nIfE0DHYR0r8d/
	1ISApg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bpb2wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:01:05 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b45597c7so3795198c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794621664; x=1795226464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
        b=VVJa9l79VTTmOzGI4cTChHkwJxCRPBig1Ikq5zJAbsIIFql7ekbDPL+f3cGeK/5/LR
         maeKZ4JVHK0RPFtvJaekYGCyyxBCUE2wlr/3Cp7tC+FgA98zgtENhXsHTn7MLZxqQ99M
         S0BchRiUgDpHBspCXyLVQRCQ8pe8x6BWT8d3gQoX+Ib0k5p8X8e7AU8D3LbHIMH+0z3l
         xwetRePUlbrqiLQIH8QB1MZQZV5pR/kjVinbD8cxInOVEcHVSPQ5exJ1GdcnNTOE+94f
         Oqo0N++FHozwUKm5hh2bEakJac6943AzSUigaV6UM49a6758ck4J2TolGvbsdfmAJPrS
         92JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621664; x=1795226464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
        b=Iu2hX+iRFvvRwzp9KyOSM4R9vWakho/Whj9auBmemP75gJiGRsYBYXE2GmPLV8o6rU
         uZ6HMDVr3x1J0WMykJIjbU4CWf/Fe9JmDozEYwxxu7jGoLy4NRS8y5aZsN9TYLwbrPIP
         5TXBce9u4Yku+xjmcBX7s1QvPnNjghBU7D0R8UVYE348wngrJMV5YsR7KbIPq45piz0q
         3eSjhbIukb4QtKQBOPDO8mVRIfl5GbTNjJObBSMINAWR6ajVvpv+PQ7TfGxANXkukJuP
         zxHYNFjz4AyNC92OVLvncRLm7WlN7nyhoZDhu1O0UVIwDsffg2hr8jw5R5qrkbn8Gb27
         aGMA==
X-Forwarded-Encrypted: i=1; AL+hErFjW6cNQ+YW/+5W5CjUM+8Lgfk9XNmuhaq75x+HIK9YPxkk3BnDp6swC95SG/4/ADUphQM0dpnffqGJoaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z82piV8wzXC1BySqb1K7wqOSR/tO4SywNTe5dZ/83eFF4P+Q+f7
	2k3r6q3aToLIE8fYvHKihwoIAobd2FKCUaFrlAyBq7WcVTM5U9DnOdXBtZjSI689umSt4O2jdxF
	aTPVfTw5ib9hlFLg5SMIUubMxHvv5DPwKi3QF6vcMtxzZ0eIhiTw6INT545Ip/XqqJ1E=
X-Gm-Gg: AYBFou0VzggwWywrXl40qiMN6L9flRnfnbDrZmSwZkf4GbFHVr/aUaZHS8UjpHbArrO
	BTX8e5GkWK8t3OE03V4ihFOvkQAMVS5lwKU9/tHR1spA64eDb6CRh3z2Mue8FZjIxhvMc5JOamp
	U3NKrRxHjTViSpsboIP1CNd25C6NwrVyxZzr/jrB+Udmg2iyZ2m3SUJYSI0strOox2bqrUld3N7
	t49LFfNk+gMWsks9pSJxuR+3SovURp5M5FtnEBo9eu78KTY5wpn20YV2paPq4bufRKib2kyIRvk
	csuPNBSA+GSoMdshoGmcughKtV13cGOUes9bzJ1teJRISonx0ZoFk446INDNH1YGszZFi9sLhdK
	8r9TeTzlbDLGzwJsXP0Er0wo3sHyUh340IRd2imVp8A/Iy0ZYgcusQS6rjMIzZMfQV5+2wPlW0m
	QqPGMeU+ag
X-Received: by 2002:a05:7022:3c84:b0:181:73fc:e53 with SMTP id a92af1059eb24-1b50311d31bmr3900134c88.29.1794621663972;
        Fri, 13 Nov 2026 18:01:03 -0800 (PST)
X-Received: by 2002:a05:7022:3c84:b0:181:73fc:e53 with SMTP id a92af1059eb24-1b50311d31bmr3900106c88.29.1794621663240;
        Fri, 13 Nov 2026 18:01:03 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm9952742c88.7.2026.11.13.18.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:01:02 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 07:30:51 +0530
Subject: [PATCH v9 1/4] PCI: host-common: Fix early bus-walk exit in
 d3cold_possible()
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
Message-Id: <20261114-shutdown-v9-1-5430c9f242ed@oss.qualcomm.com>
References: <20261114-shutdown-v9-0-5430c9f242ed@oss.qualcomm.com>
In-Reply-To: <20261114-shutdown-v9-0-5430c9f242ed@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794621655; l=2329;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Z62C1KjgkUfHo1yhmxjksV4K46Bz6P+GsVAjd37UQdg=;
 b=unbeud0Jbm/M4cKx5Xkse0KpMHXkBpv78tZUuAroN1MF04Ki6ksBln4irO3yheoIrEm77V0GM
 UuyDjQUAHpIBNmLj3pMFdBOLA7rsDjHXD0qg8M/i2zn3u0EVNpxyYtW
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af7c0e1 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RIIKlrP-v3AzcS8hWasA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: gh-2cf65vt1-cFkKRk7GXtTVac-cb-vu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNyBTYWx0ZWRfX76LaWCJZrWDw
 0+MWtC9tiFt+l0mFx73cBerIpDxXwf+qZhjt1ehpV26TvIJ/VdcZ1i0o9oiYZOkj6jiFvCco3zE
 DRaJZMOeNiQeqFogrLMYNr82je9HkNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNyBTYWx0ZWRfXwoOyG4rMFrKH
 ZKfFzNxvngJQtso8whcoz4MUd4/EHQ6cpzHj8uWoillYrFHCX5iGkgIzBQanX31rWNM0lOMsiqX
 UTaGiPj+EZISdLx1g70FCfkcDowhJEOv1s2Gd04NUXxoMZMm8ygu1UtAn48php4LH2/lyM3Jkw+
 BFKxddme2dGLo5qzSrmffUOrSl9YGMbQswRgqUUsFtzDs/RNAGuz/weo55722MHUXv9HCReLiSq
 S2ANtjpMqmD+73h4epu7LKOKIX4p8ihC0IiNqMktVgKzLHX7O5foTIDnG997cfkVgSsv8WiINgD
 SfCOajehL0J8pm9YWFYLMYFgINxppKfkjGf7KGPtPHnhmX7HTmQT739qqcszcXYlz2bGgRS3Hdb
 tj0QftL43pRsqOlFX2Zv9zcQGaUxDVq4PZ6JqXGGyldMylLxXSiqdyMzPV74vhnNNJRk6Mn4tAk
 /YRk2hXu5wCO+Tigh+A==
X-Proofpoint-ORIG-GUID: gh-2cf65vt1-cFkKRk7GXtTVac-cb-vu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140007

__pci_host_common_d3cold_possible() returns -EOPNOTSUPP for the first
downstream device it finds outside PCI_D3hot, and pci_walk_bus() aborts
the walk as soon as its callback returns nonzero. Any device enumerated
after the disqualifying one -- including a wakeup-enabled, PME-from-D3cold
capable endpoint -- is then never visited, so pme_capable can come back
false even though such a device exists on the bus.

Since pci_host_common_d3cold_possible() already returns false whenever
any device disqualifies D3cold, aborting the walk buys nothing for the
plain suspend path: the overall bool result is unaffected. But it
silently drops pme_capable detection for any device ordered after the
disqualifying one.

This matters for the upcoming shutdown path in particular: unlike plain
suspend, shutdown forces the link into L2/D3cold regardless of whether
pci_host_common_d3cold_possible() itself allows it (see the following
"force_d3cold" changes), so at shutdown time it's common for an
endpoint to still be in D0 and disqualify D3cold while a later,
PME-capable device is never visited. dw_pcie_suspend_noirq() still
uses "pme_capable" to set pci->pp.skip_pwrctrl_off, so an inaccurate
result here can cause Vaux/wakeup support to be dropped for a device
that actually supports PME from D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/pci-host-common.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index a23907a875e5..c2c852c64aa8 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -275,21 +275,16 @@ static int __pci_host_common_d3cold_possible(struct pci_dev *pdev,
 		return 0;
 
 	if (pdev->current_state != PCI_D3hot)
-		goto exit;
+		*flags &= ~PCI_HOST_D3COLD_ALLOWED;
 
 	if (device_may_wakeup(&pdev->dev)) {
-		if (!pci_pme_capable(pdev, PCI_D3cold))
-			goto exit;
-		else
+		if (pci_pme_capable(pdev, PCI_D3cold))
 			*flags |= PCI_HOST_PME_D3COLD_CAPABLE;
+		else
+			*flags &= ~PCI_HOST_D3COLD_ALLOWED;
 	}
 
 	return 0;
-
-exit:
-	*flags &= ~PCI_HOST_D3COLD_ALLOWED;
-
-	return -EOPNOTSUPP;
 }
 
 /**

-- 
2.34.1

