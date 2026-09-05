Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B3B31716D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569351; cv=none; b=t9FwmVg8ygEkgN9WvSR0izVrpsTcgQxr3S/NBiZrfiNGTSFdCnnGDNtF+pHy0IdC8MSvlMCCMncOqovCuR+WImWqpyZDstVseIOvkfGiV7TS1KHrcLswg+Du46RH1hkFK/MU/duORaRY9z6FEK5u93HaYJyufvdq6KUkDVOcw+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569351; c=relaxed/simple;
	bh=Q/hcehAe1T3B2LPGiG5zYS730GO0II5dK3ygD4/Fn28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PoDe+OWbyJqHol+hEAdXI4GG6BVZe3237TUyljb7Ow/lPI5Fe5HqhMJg/k8Ugmi1n4O00nPfwg78jReZcLOr05L/LsGq8DXbwfmUSt70bBygr9eeHZNCXugPS8Jlw6Q7oOYnXqpG603JuGJInMmXN80vDRAElrWWY3wYZ9iA8nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogHIVktQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ed9tgJ/F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogHIVktQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ed9tgJ/F"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684KbSKC3418982
	for <linux-kernel@vger.kernel.org>; Sat, 5 Sep 2026 00:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9v/56p6HJOZu6muIuJLlRunOTV4icdJBQiBGkkZcGg=; b=ogHIVktQ6kUZ08X6
	oK0sS0xRkqtZO3zaG+u7/hEmA9NV1Av9GxHfRxJxRqcwvfHC5KPoJGdXkNb05BGz
	RkY0K6cRACbZ9zHE5bGL5B8rD7/kXGh1BHGw1ULR2ZhqTemyuNmZovTuX/sP0Ma/
	exQwe4v02+YduJ7vryRNs3TJlkdZ9WGhK7z2Xk4BnkubUq2QV/X7exZK151zJyVG
	mj/YM0MgLwURkwM2IQS/BxbtMHS1X32rJwFefRjncy6uv3M7CR52h2yBXawYCbtk
	exEK/K/73KEH/iG4CSERKhjJH31YjfMO/xSwIvw+B8wtwCtovxL1S0oNgAmbVPpR
	j04/wg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00ytcq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 00:49:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso3148798a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788569348; x=1789174148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l9v/56p6HJOZu6muIuJLlRunOTV4icdJBQiBGkkZcGg=;
        b=ed9tgJ/FEN8sGZI781GAV3inCGmDHwfSM3alvUA03VFGwyXg0CMsUn2ozKLANfIVum
         k/JM83JHPEuXgN/62ANGh/jMUkyx+Y9Ah8ukziQ/iQu2QgBJCcevLh8FzKRy91iW2wi2
         xsQ0sY5VOaLJXggxiaNCsj9pDeYp01yOx03EAVP3d8Hv+k7mDTEYD+QjMbLrMo14843m
         UI0hpwkA6ugYGFJp6q4vv1hA0AcZ7H5Xjeslk/4648aV5Oyn2D0L2mcSD6jNQA3ykTv3
         UEkZ96noDjO4m+NEWu9ynzjAy1hXaCpq4F0sHhM6ye/ZcE1t+l+NU0bxSPEuPonI/ctC
         a1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788569348; x=1789174148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9v/56p6HJOZu6muIuJLlRunOTV4icdJBQiBGkkZcGg=;
        b=C1s56+fI1fNEn0Q4Ul0XsnSs4NOIBR4W47FumIaFp59J/viM0ajcHuDGPkyAqCXH8Q
         QIegRbDOx7hSDN4WQs3hrcLLe7oDhW/Ze0S7OJUChdf5L201LTE5vPmiEFSgNb4891xk
         IE13/mDMT2qw+gAtYFobiwb1ep4scESTSCd6vhp03ELTaXS8dRnaBzTdNMLw+7pJt3RP
         SyFyv9nX0Sa30JOrBpnECnbryix5ZOpZZ1LTBfDVQ+lauqShT1aztGD0jPWh39EPTPhn
         6PAAajUPuDVzlc1NZ/mx2nHvLcaIddWZTDfkthWppfKxeoBn2EhEnTE+kWl+3epbuXgH
         UKXw==
X-Forwarded-Encrypted: i=1; AKwUvBxBynirrZsbXkfEItw6Q5Y4HLKscRYnq76yTCTYq6vhaZrjTU9dxejhK8yYICxhVRRCPuBLiPCt4FwYDbU=@vger.kernel.org
X-Gm-Message-State: AFuF++mXdbksN/NyI/ri4e3E+M0JSle3djwzqJURjnA2zDh7cx8WUITC
	YuqVIMNVywcGDBqPOKRbPnoAnNjUVY8qQ89BORlDS9mHbBr/2jLB8oFf85nkXonavSqgPjkoN0W
	vEsswHsEjgqAJcn3mpiekL5ZteZyJI97J7PeCCK60O6rwXpHtH7RfUGvqlrmz6PuHDEk=
X-Gm-Gg: AYBFou0YIOdiES8PDFtJo/z7yecxsKcw+/7ZgtAb7jESbvNSyy8BYV50REYvXPLNvpd
	nJq7CiycksiWcym+LAqRAAkxgqOwrpCOM4nIxgiKkdi0qGfLATqfpGCmJy7j2AlQdEWVcsE2nks
	7IIxb9ZSl2V9X86YP2lZTKYe9CLmYBldqdDiN6SlGc99OACvZLTSkmruk+wmWdUNOzNtT/4sGIU
	cDNGlwxYxbwVpVVas917/f6qArnc/f+MTgudLvl0CGScdcT7/Cn6gt7iSnRz9sl/Kiz68H1q7K3
	VSPMhyJSJMjhvD9aD7y6KbcjWXVkmlXkV3Eu6r05gikxmtEwMJs4L4lSAYhelU9MKFL47/tHFyi
	ONR0LB7WXoD5Ge9/bsofxQJhSuFGpceX23TU=
X-Received: by 2002:a05:6a21:3382:b0:3d0:a555:c823 with SMTP id adf61e73a8af0-3da39feab06mr15571114637.14.1788569348193;
        Fri, 04 Sep 2026 17:49:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:3382:b0:3d0:a555:c823 with SMTP id adf61e73a8af0-3da39feab06mr15571067637.14.1788569347807;
        Fri, 04 Sep 2026 17:49:07 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm10843907c88.15.2026.09.04.17.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:49:07 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 06:18:49 +0530
Subject: [PATCH v5 2/3] PCI: dwc: Force L2 link entry on shutdown/reboot
 without D3cold check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-shutdown-v5-2-f0c6bafa1d4f@oss.qualcomm.com>
References: <20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com>
In-Reply-To: <20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788569335; l=2715;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Q/hcehAe1T3B2LPGiG5zYS730GO0II5dK3ygD4/Fn28=;
 b=xw6hvdlwQIOeHMGQ0aR+jQB4XQy5tEtnGc9orZJBPpaqf8ZjKwi7G0ddFs2bD5ZbE+gjzB/pt
 4Jco2f/VBt4BJAPXAnc56ZTa+SvToe9texAys8jT4C3p92WJ/lP6BzX
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAwNCBTYWx0ZWRfX4HvaiDwLOwbk
 Kgbn+BMc9sUqCbkGUvU4gsHzyA8kps3njU+7wG0DlfsJ3cMBq2TXNAeiseOwigulgBeOr1rft34
 f6xfuTp95rumac1UcKTxXvn+OeANqno=
X-Authority-Analysis: v=2.4 cv=TP11jVla c=1 sm=1 tr=0 ts=6a9b6704 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yeOUdISH2rptVKx3L3YA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: BQWkXdfWuB2fo91crvS9BJsNY23v0R3N
X-Proofpoint-GUID: BQWkXdfWuB2fo91crvS9BJsNY23v0R3N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAwNCBTYWx0ZWRfX6IgjMavIjT7c
 LgMxx84U46qyVgjZn0yqpV7h+wjDWXf8GsUmKDZ3+eyGzlBtlNXUZn0NtJMBdhBpbns88BdNiKC
 2vYoryw0OHOkkc2EF/d/fUwSEfBSLExU3DM4diaKEBJWy8aQpN08J7PCLImg4H8TRVtYcElphJI
 htuAcdVWShTAs1RqJnEz5nzqVOl1glDEK9Rm5MEA2gRGFCOms7uzU0I0NZzXkZ5Ag/088stEnwP
 XwRlZjrjMEbD19HcfUSrX1ousy27Tz8fgy/jCUiOnuvNrlfHi/NMhAciRJFJSCzBaLFf9XQsOfr
 3T60miuViarVnooF2Km03rjPh1p4KfibFBtOeAkm4AMPZY6lVI0zxwi4SKKzCMMfgpUxinr6zgs
 /YkOOYak5gCe6aL4eBVMA6dG+7IwTbZCB2QhzsDwgSgyiLa8gQjUcM05Um8jvG4apFn64Ngi6f7
 kdoLttslhfd1sII4MVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050004

dw_pcie_suspend_noirq() normally calls pci_host_common_d3cold_possible()
to check whether every downstream endpoint can be put into D3cold before
bothering to move the link to L2. If no endpoint supports it, the
function returns early and leaves the link up.

Querying D3cold support during shutdown is actively harmful, not just
slow: pci_host_common_d3cold_possible() requires every active endpoint
to already be in PCI_D3hot, and returns false otherwise. If any endpoint
is still in D0 -- which is common, since endpoint drivers aren't
guaranteed to have suspended by the time the host's shutdown path runs
the check fails and dw_pcie_suspend_noirq() returns early without ever
moving the link to L2, leaving it up right up to the point where the
system cuts power/clocks to the controller.

Add a "force_d3cold" flag to struct dw_pcie_rp that callers set
explicitly to force this behavior, rather than having
dw_pcie_suspend_noirq() infer the shutdown/reboot case itself from
system_state. Still call pci_host_common_d3cold_possible()
unconditionally, since it's also how "pme_capable" gets set, but ignore
its return value when force_d3cold is set and force L2 entry regardless.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 5 +++--
 drivers/pci/controller/dwc/pcie-designware.h      | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index f5a38e6fd8d7..a8a3861c2956 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1224,14 +1224,15 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 
 int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 {
-	bool pme_capable = false;
+	bool d3cold, pme_capable = false;
 	int ret = 0;
 	u32 val;
 
 	if (!dw_pcie_link_up(pci))
 		goto stop_link;
 
-	if (!pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable))
+	d3cold = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
+	if (!d3cold && !pci->pp.force_d3cold)
 		return 0;
 
 	if (pci->pp.ops->pme_turn_off) {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index a53ac27cd244..8becf4e62703 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -471,6 +471,7 @@ struct dw_pcie_rp {
 	bool			native_ecam;
 	bool                    skip_l23_ready;
 	bool			skip_pwrctrl_off;
+	bool			force_d3cold;
 };
 
 struct dw_pcie_ep_ops {

-- 
2.34.1

