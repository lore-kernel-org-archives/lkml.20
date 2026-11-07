Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794015945;
	b=Lm1e2xKCJDjjUlmBtXCVEnaCNx233TOkb/rdGfCX8r2zA72e02cbnEGxtnew9vSATqGw
	 VshYJE1eoeLXZ6VtYeBNNGqmcxVzjJc0Ecj03NyRhfBH/7J9LUmjl9uMJ8NM9vn6DEFpN
	 ipvsn2Jx7j2w+DIdFryYd8MGVxV9u21SRsS3rSgzJRNNjDKRxFWw8okKFEpA2VYwzkIj2
	 jxc0EL/Zi90ubAwtrLNHsWhNEGlWQ4QDh+4I9oFalWQ1Gnar6fEuy6nzm7HCY7xhp2lQS
	 0DcAaa0ushq/TMR95kV4eOIR7fSIG3aqVxRvQv3SId3a+ZCWhk7rMuGhCsh+1fovAPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794015945;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
	b=YhQZsJkvQb5HaNyC+JAKNIPeP3v2TFTh+LkFlWutOSTHssN6V0BqujZwmU71q3zmr54f
	 DLtWPXiCpGmNXWi2MIxRX+cBta1QHzvhFTTQ1qeHtjh2+2/hK90lUu81DngjSB+DtKEoH
	 WqUfeiwfqdek6+6attHwyrLy0YFj65Uw4IVb+8Pn+RBZnj3ZK3JC6MgS8zs+k/BlD2446
	 WCsnosdgWBVgRHto1wO2It1b4NeQYSzAO0sQadqetG+Nd64Om9AR9LgSbwmCdImhbASJo
	 MP5ogmJ9ENNZSjjQndiljaOmZfCcrKLV1+LIXF2Wjz7T/cZz7RukiNxQhnCCWzejDoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gW0PHRyk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FArbB7Dd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5832B606EE98
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5832B606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gW0PHRyk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FArbB7Dd
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MoK5H1064855
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 01:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=; b=gW0PHRykNFc1GvF1
	S6oBgQZRiZtJ2sVkCStuUhJDwuBD2ZWjRyWIZEFPvNO/jMgt+PeqRiVqM8+otFDs
	k9wVUGTNSJe1iXUzb34pSOJFlgdBdo+eYGy7Q6067/y4D0baObT3qiTAvNUjYFLm
	VNTdiucv3MgbchmG1y03xJmfzwWJTNkSmM34Yqz8dNL/ghcNs53aAfH5jkEEg8Vg
	JfF1jwnJXnJoaVkuVr6mdxHDT8dfaIy3hcRn6L2Xfgpsej7egXDW4D1eQD9+6Xkh
	Cz0FoRC2i07E/r7abA1Ugb5JbZmrpDXvcCJSYC1Di7JmK9jJlPcVjyduhxMY8Ttt
	XqQMcg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyv11xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:45:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3700be873ebso276153eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794015943; x=1794620743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
        b=FArbB7DdSvR6LFBUR8oQXy7Zvbxgzod+0PH7pfm+Au64dmO+tRsr6+e3lO/42cZ5kC
         VSVcP7W7gDrdf+SqhBNenPDL0aoN+ZZPZJqx/DYnkMLcbNATWOe0QrVbvT7xlvtwuO/Z
         oIROVi+J7ZnNlJ7QvGemOEBlrIfcj/EhGlEVzPsWEbRv0EQdzVmJEFXVwmAtKGsVRCMG
         qeCyzIZ46ioolLF3WGz/FDjmoCfiX6LbYafu60R3lHGpyT93mLsvggMgSjYCn31n8bUd
         TIE+IM7jJ+/RKStUWA/1a5bgMgRDHiHmdVZwf6w6S7VyLyTFz1v02Mh6GIapXy1Qqi7J
         yoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794015943; x=1794620743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
        b=h4a+Zacckz0VZJUaV5WwHrV/4lLxZXLHRogKxtoVn/RTNQu1sVOWgT6uUVGQKOvffr
         XkCjRP3RFmEFVvCr7lR+QAmaXspKi4lAV1W9MbgZqfYFCylGlzEZIjerNjiLAPpw8m8w
         YxiLDkTWGmgytzWPCBzyfrywPv1+atmwbfcNhDzwOHgmw/bC+uWCg3OYdWfnROSykBvX
         A295alE7cGNxRlinqkoWlkBbfZplUd/7LwiRuM+Xryw8C6fZrzVlBdxnQOY9lu8QS8vg
         +Vd57vk1R6Mj7u+lWE+wg8ouS8f216jouzSkuv015ALTCHWeXILfPuyDfzhGOaJY2Mt1
         FbhQ==
X-Forwarded-Encrypted: i=1; AL+hErEwecuGEIhseNvek/qYIaZAOjWqDM0O+1ktDsM+pA8wc752UbA6Q9smynTQUkjwV4hOTm7nRFNgtWwA3eU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f9FsUSUssZdXv8JoFLM22Um42VpKMzXwZylQI9XMxjW/hkrBB
	4BI3T5h5cOl1hDTwV4MDaOFMjQmtqidMpivxUgxQRd89fwF8KFG6lrXhxdjvGVBxlOsUi+sP1Qb
	HIF+FFRJJ9SFFviXFvoiFligLIJ/Z3rzfTKjMcFPlfovakbvFboSt+hFMAwSIioc5+vo=
X-Gm-Gg: AYBFou3wtvB7RiHBdrfTFjya5GuOBm7GUYHMqfGEY7OT9lzN4NB12KV/YNdTKuVn7Sg
	5cO/G6ol98tOo5nDNTmDq/HI+RlvJXNHclOx5vR9Z6RW/GHmJ65z1kpgyNBEEjBGFN7p2KyFmil
	EDt1qWh28A8o1gtpmpz2qAEKi5lBH+eIGbhrpU5VxBifTvL4buUWuU+wMsQ3g8nL1EpPHQNVxJd
	1RrrNHoxQvC/q0g3dXZJzy9Dg51lwIpOGPugQYym2n/RKdq/51JxphgKxYgF2ku56OQqu9OsuJZ
	cj68WsAof/kEBpfWPtN/cfNtpdaTG5SVf8AK2t0UGB+ZgHXWlGuUuHRBHHTYhxnPRwaBH28r0T7
	mJVLos9oyox96JLdvs/25X1c8Ov1ynPFhSXnsbyngbsd0KdCmEXqWWoVpXNVs7iRXW9TAFqcpgg
	Ax8S9IyNM=
X-Received: by 2002:a05:693c:88d0:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-370f71bacabmr947892eec.15.1794015942882;
        Fri, 06 Nov 2026 17:45:42 -0800 (PST)
X-Received: by 2002:a05:693c:88d0:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-370f71bacabmr947855eec.15.1794015942316;
        Fri, 06 Nov 2026 17:45:42 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm22861123eec.3.2026.11.06.17.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:45:41 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 07:15:19 +0530
Subject: [PATCH v8 1/4] PCI: host-common: Fix early bus-walk exit in
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
Message-Id: <20261107-shutdown-v8-1-bf607c6429b0@oss.qualcomm.com>
References: <20261107-shutdown-v8-0-bf607c6429b0@oss.qualcomm.com>
In-Reply-To: <20261107-shutdown-v8-0-bf607c6429b0@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794015933; l=2329;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Z62C1KjgkUfHo1yhmxjksV4K46Bz6P+GsVAjd37UQdg=;
 b=wYcaAkfQWy2rWkm7ilCCTWzQFh1Rmc1QaTAfbEZEw3bciOtcbL14NfGk/6vh5x9ZF6DDyfJXw
 IXBLCa+0QtKAXwKrtJoYcXO8SmE0SdmbaapVi7ZYdE0O9nGpbii//Xx
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: r5ka_QpynXpKJ7NgxQy1lqIlkx32WKg0
X-Authority-Analysis: v=2.4 cv=IdYSymqa c=1 sm=1 tr=0 ts=6aee82c7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RIIKlrP-v3AzcS8hWasA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwNiBTYWx0ZWRfX7mdSgX4kqtoL
 4BFUPoFQ3MRamP92u2yugHNB16hgT+2jRtrTsij4u14yuWKkcUqkT8gJ8nXpCa6JSwPWIjnXJzx
 jCUVxBbxSB5prlZNaT8roQ17JTTz3ec=
X-Proofpoint-GUID: r5ka_QpynXpKJ7NgxQy1lqIlkx32WKg0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwNiBTYWx0ZWRfXwtRPQX8bnO5G
 iiseY9jh0ketUYuSVVj80suQeH+JdFh5xGEktEZ77NM2mrx7Y7Ig6BCwJmVzFyV8mVffI+nmcBu
 /b3fuRBhFONB4RXa9uFi11OvYxSmgMX8c85S+pumG+0yANL1HMcxQdof68ECPT5B/QnFdn4cGDE
 pjlXqvO6xMMtKmLiz5C/FRWCLTX54QGsQZn1mG9Fx6eEz+H2IegQuX4LSpcqVV5huFkgvjLNVdh
 JdOahu18xWx7e/Q3WHKlYgZFEuNiVzTe/Bq3bRntZR6JClzZTpkTVYxJuBJYBiE5It0BGziHUiP
 9N3pYRvpwMoxXwR28SUmWrZnyLkcFVyY+TarB2tap5guFr4+NYv2N5j6Qw1iQ+zBG+QW8bejWUy
 yZRUcmsN0nCDuPavK4BnUUulwiTr05JTK1j2PzS1Ct3MJhwkyjtCZ5wSpncRvmIaTAL+bPriuZz
 /0V1USDxX3TVGkx0snQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070006

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

