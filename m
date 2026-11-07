Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794015949;
	b=jlQf+SsXa/2oDjPRQ1S8h/ctSF0VDbSUP7jXxSWNY7xtd77kiUMMSj1HPgPwwjZzHlI0
	 +LWGGWOgpaXoDffZZqPeycDALJNig9S7yA2VLzmh9pjLQwwAtlHGtgov0TJ/4VbDiX9gh
	 ueA4wfE/CGojwqOecyK65DEj6XzFkMfUoet+acA5FTBVEaS+CVb6/3W1kJorqQiQ9GWec
	 G/EuDD7nZo71n1lhUHp18PPvi7bk8ASc1Qspbwsit+9Kj0GZ/QlZakzxeCSLlZJKHs9Na
	 q1dtshu3mOxWKu461ayZNFHCejuF6FPpqaO4E7D3n1ikIUA50jg/y+y4uo/jUEG6XeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794015949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OfILyUi2gelVBNi9ApytLRHGkKs7JaiPDaFRGyT0JXI=;
	b=1h19LC+812ZPJjAQnYo3TZeum8dXwysR32rYhb1+JniA8W26VJGieQ02s/RAYQ7joLtf
	 RWWOjODHBSg9FsgNBTr3N7Fu6XhlTu5/CSEf7ZFxb4whv2lUm0apOO4RJ5OxzBC6BzAHz
	 FEwyrDEznUQRQVj8VnwfLxbfwxV1hr1dlfZvsL2YunQOzRdgKMMfMKCJLYVK/KYnJowuC
	 3DRORUIarTDvnIL4EY9SHwejn+ouS8kGwkH5A7Mi+D7FqPlFTAAAg6m5KvbEXDaylvUN3
	 VpjQ2rEJR9+hMzzEPWw2BadpeSXk9oM7sZaL3jdjxa3islJwcJP/fmvibahbSmNJbTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NQD+0YLu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D2MY17ql;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDFE606EE98
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BDFE606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NQD+0YLu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D2MY17ql
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MoALR3696199
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 01:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OfILyUi2gelVBNi9ApytLRHGkKs7JaiPDaFRGyT0JXI=; b=NQD+0YLu0X2a5EDI
	f5v78EqmvuG7+7xvzJ4eW008tCK6ylnWOxykOzZZQ2Jdg0lDPUV1Gcteq2lPPHDV
	/sMGuC83QZpqydiKt2XoHH5FkJAYTxa9ae24aaB6MFaNYSqHnvp8AJebN7LMwV9J
	s+Bqu/Sis9zRsosBEpOIzXtY3HaHO+WUSgqlmxlK2qMYqj1UMnnE6Dm+f8dpX7fv
	FBtDuSfUAQLQI0hThh5Ek1uSG4PRJbG8MMU0DNK2YUaGz1JU4dREH/j3slSB8OzA
	S//kcKhpdugPuYaFQlrDjRtgja4jQZ3shjDNGwHsZAVFWPO54pVmOmcz1BdVMSci
	i4KQYw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyqs218-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:45:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so2608168eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794015948; x=1794620748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfILyUi2gelVBNi9ApytLRHGkKs7JaiPDaFRGyT0JXI=;
        b=D2MY17qlh8fgfAEMJFlqwJDfZQRwCX/jZIqH0VPcCNENeeJK61nlUI7EyMnVcXANO5
         pXW1rg1nX42nOfkRiXXiSr45YHktbOSN4Ny9wLzuZXEuzzGe1s3oJyfp6Iofa2/2KrtV
         anCyKZUnqCrHaFVslCgZefkM5h2SfwwmE6L9lGoUiv+6Rv8hrjkjCGChInt7Sig3RIYp
         l28nyv08dzuavCGQE3cPohzKXU6ojLnaRo3HH7u4cTUysiEZIRNNjX9Bg8U2FDVPEO3q
         PoffO1kjKBhLxXGV1wgnjYo37RsQ9GImjbVCG9boJxslaCvC8ra1+2ByYyYqkNBo4yvH
         sqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794015948; x=1794620748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OfILyUi2gelVBNi9ApytLRHGkKs7JaiPDaFRGyT0JXI=;
        b=Um+CoXeiUsbJNu3TMS6ePMCRWF8ghnfPtnPp2dI0F49gtHri7wtJV1q29lR/NHB9E4
         AUW2q7h5XTGZYXJ/JddJtb5ZWDNZcRUG+zADOznUxF2/O+ajWi8/5qoHo92xbq/HY2IH
         Vzbts39IDDfn2g3M3d+XRfw3ND2Mh8/C4QEM1gIEPkNltKNqvDwvTjMiaiFcZt+0DC0k
         pe0Do03lsM9ervzvHUPuK/29yCOI82zIx5p8nGEMn0eRsaMNf4Jq/8D4fHfFMSE26J8E
         efxkM5aDCgGRd0i68iL3BWbV2ZV+Kln2f5FaRXmMdLBatCLFU7oHUs/NIWfXprIzabQ3
         d7qA==
X-Forwarded-Encrypted: i=1; AL+hErHCUOfj/FBXLYS8ps4TiDXDIcUpVZAZIMg8jye0OXNPWTpOJyEa0/XV9+2hc0n9HoQQWdQYu+6PsHsqbiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YZ8HWJhrXX+G6Y+DAirdOkgkCCIwEXOKGDNwrcx2iBweC1/lG
	s9aJys3AsBIKKL89uErwZ2YXC3M2fIEQaStb0wobOuwsXse75nannZPXvfMClTn4k+GDcj4cZgT
	co/u/kVgLuAm/G1X0bVaS0/qy31CZSW8t7xS/kZRn5GIjHQClQE2KiAOFq0E9zwwre9A=
X-Gm-Gg: AYBFou0AGOPgH2WXmxQOdHvFRI8Q1Ayf3tJqZM+Fp60OFfXumreLsqRGeVjr0VDSh07
	45Umzd4val18/SOQ4ImsgaZhjosIRH/7m2GQ++IbVOXY8KBkFXK8ZvxIqhVvLCSDUzEJdY6azoX
	rkhl+TOdetycrT4f1EnVl3W/WSnjPiAzB6eX8l//5ICApPp9z7bubZOyp+w3+AhZfKpMrrYvg8R
	AlSvHO1zh1fLLTz0MZ2ZyZbecM9Ib2BPaMFSpXk8mIsARs3XQQL2CfozS2PLV/ufFlKTiY5l+C+
	lpnKshFSN3xWRPe/hAEKDsjsDq2VC9skfiO9Iv60Pmryq71wOGO8ExEGFYaVX6qZKuCQFomemOJ
	uEsckY2I1dY2UpB9jjCEQhsbpsH26w/9U6VRKiDqAzQ3BrKlVJM6DElQXCevHzzVqVc3vwRn0y7
	ZAwUB+l8c=
X-Received: by 2002:a05:7301:78c3:b0:36a:1f8:a56e with SMTP id 5a478bee46e88-36f760239e1mr5425934eec.23.1794015947718;
        Fri, 06 Nov 2026 17:45:47 -0800 (PST)
X-Received: by 2002:a05:7301:78c3:b0:36a:1f8:a56e with SMTP id 5a478bee46e88-36f760239e1mr5425890eec.23.1794015947123;
        Fri, 06 Nov 2026 17:45:47 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm22861123eec.3.2026.11.06.17.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:45:46 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 07:15:20 +0530
Subject: [PATCH v8 2/4] PCI: dwc: Force L2 link entry on shutdown/reboot
 without D3cold check
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
Message-Id: <20261107-shutdown-v8-2-bf607c6429b0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794015933; l=8264;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YeAFc5lAkknI31xI9jDs4HF8TjuPPgMhlkrpRDpy/qU=;
 b=wDtadsY0hewz+L+6QqurEl7xDE93XllFEUjLEhZAayO8fTdSGSZEMhNKN1/zy+vQc52cYiCJF
 7ZhV29T7OWnAlwZyCS+1s7v8rYEEAe+8Uh8Tx9pbw9sgWQLzWxwOulh
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: pNePtUBDD7TUyLufn96u6M-7AXh-fadm
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6aee82cc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-MHXjDPJGaOMKVajueQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwNiBTYWx0ZWRfXyslS99Ss0sGd
 1yxp9qVZ5VlBlYuvVFIjmd2QwjRskX1MOK1LcrIy5SK1DgVNVMC0qlXuSPNhnDHXi6SRwbUcxD/
 ROonfVsaNLZ2CUfb3kMr4jXbm8C050I=
X-Proofpoint-GUID: pNePtUBDD7TUyLufn96u6M-7AXh-fadm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwNiBTYWx0ZWRfX0he190O1hvCY
 D6cVPL2sQkBDFUXlqmXBdhG0OHwqiB0SNyKwtpJRcdYr5yBsmj6ZaPGWBN7IZzP0mDDZHmn3KU9
 gf9lOU8tbZuHVqenPn5DsV8BYCYcA5uGRMIjd7bsKFfhxVVFKcaQ65AdLRaBr0n5DsKPa2NOFND
 dUPYFlijZUsVmB0dlfcltAOy5nM7xzVwf/5QVK31Komqy/IPAcWUtWzsQ2iS8jrW/eP3VQhRyCp
 hHWJdUh1aupPS8tW+d7rcouY3rxffDGH/8/I+q0B2RsUQBo9N7TxzKliwXetS+6A8ETzCWTp42E
 cXibbxOotKKwcVN7/zg+jKavp9U6wRdJ9DkYA5m1VSCmJpmaXid51TOnm+iVds7Gp66iJEFZ/+J
 M+RtzhHkomYrcQixj/TAP+PKn8LNsSnsgawmms7+xpqVFtIdV07lpL+phjfXktUhzQ1qYURy7d2
 pwcr+Ef4rtYGr5BJKYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070006

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

Add a force parameter to dw_pcie_suspend_noirq() that callers set
explicitly to force this behavior, still call
pci_host_common_d3cold_possible() unconditionally, since it's also how
pme_capable gets set, but ignore its return value and force L2 entry
regardless when force is set.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pci-imx6.c             | 2 +-
 drivers/pci/controller/dwc/pci-layerscape.c       | 2 +-
 drivers/pci/controller/dwc/pcie-designware-host.c | 9 ++++-----
 drivers/pci/controller/dwc/pcie-designware.h      | 4 ++--
 drivers/pci/controller/dwc/pcie-eswin.c           | 2 +-
 drivers/pci/controller/dwc/pcie-nxp-s32g.c        | 2 +-
 drivers/pci/controller/dwc/pcie-qcom.c            | 2 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 2 +-
 drivers/pci/controller/dwc/pcie-stm32.c           | 2 +-
 drivers/pci/controller/dwc/pcie-ultrarisc.c       | 2 +-
 10 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 83fbd998551d..1f2b942e8423 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1788,7 +1788,7 @@ static int imx_pcie_suspend_noirq(struct device *dev)
 		imx_pcie_assert_perst(imx_pcie, true);
 		imx_pcie->drvdata->enable_ref_clk(imx_pcie, false);
 	} else {
-		return dw_pcie_suspend_noirq(imx_pcie->pci);
+		return dw_pcie_suspend_noirq(imx_pcie->pci, false);
 	}
 
 	return 0;
diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 7c9fb3bef682..8481fe5a0bf0 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -370,7 +370,7 @@ static int ls_pcie_suspend_noirq(struct device *dev)
 	if (!pcie->drvdata->pm_support)
 		return 0;
 
-	return dw_pcie_suspend_noirq(pcie->pci);
+	return dw_pcie_suspend_noirq(pcie->pci, false);
 }
 
 static int ls_pcie_resume_noirq(struct device *dev)
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ab343ed53ba5..0837bb9e67e0 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1229,23 +1229,22 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 	return 0;
 }
 
-int dw_pcie_suspend_noirq(struct dw_pcie *pci)
+int dw_pcie_suspend_noirq(struct dw_pcie *pci, bool force)
 {
-	bool d3cold, pme_capable = false;
+	bool d3cold_possible, pme_capable = false;
 	int ret = 0;
 	u32 val;
 
 	if (!dw_pcie_link_up(pci))
 		goto stop_link;
 
-	d3cold = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
-
 	/*
 	 * Enter L2 if D3cold is possible, or if the platform loses RC power
 	 * during suspend (in which case L2 entry is required to notify
 	 * endpoints before power loss, regardless of D3cold support).
 	 */
-	if (!d3cold && !pci->pp.suspend_poweroff)
+	d3cold_possible = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
+	if (!d3cold_possible && !force && !pci->pp.suspend_poweroff)
 		return 0;
 
 	if (pci->pp.ops->pme_turn_off) {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 1b298639165d..90e6e25fde73 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -860,7 +860,7 @@ static inline enum dw_pcie_ltssm dw_pcie_get_ltssm(struct dw_pcie *pci)
 const char *dw_pcie_ltssm_status_string(enum dw_pcie_ltssm ltssm);
 
 #ifdef CONFIG_PCIE_DW_HOST
-int dw_pcie_suspend_noirq(struct dw_pcie *pci);
+int dw_pcie_suspend_noirq(struct dw_pcie *pci, bool force);
 int dw_pcie_resume_noirq(struct dw_pcie *pci);
 void dw_handle_msi_irq(struct dw_pcie_rp *pp);
 void dw_pcie_msi_init(struct dw_pcie_rp *pp);
@@ -873,7 +873,7 @@ int dw_pcie_allocate_msi_domains(struct dw_pcie_rp *pp);
 void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 				       int where);
 #else
-static inline int dw_pcie_suspend_noirq(struct dw_pcie *pci)
+static inline int dw_pcie_suspend_noirq(struct dw_pcie *pci, bool force)
 {
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-eswin.c b/drivers/pci/controller/dwc/pcie-eswin.c
index 1bb44696057e..21d077172724 100644
--- a/drivers/pci/controller/dwc/pcie-eswin.c
+++ b/drivers/pci/controller/dwc/pcie-eswin.c
@@ -367,7 +367,7 @@ static int eswin_pcie_suspend_noirq(struct device *dev)
 {
 	struct eswin_pcie *pcie = dev_get_drvdata(dev);
 
-	return dw_pcie_suspend_noirq(&pcie->pci);
+	return dw_pcie_suspend_noirq(&pcie->pci, false);
 }
 
 static int eswin_pcie_resume_noirq(struct device *dev)
diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
index 386e44dd0477..cb9cc9327d85 100644
--- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
+++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
@@ -365,7 +365,7 @@ static int s32g_pcie_suspend_noirq(struct device *dev)
 	struct s32g_pcie *s32g_pp = dev_get_drvdata(dev);
 	struct dw_pcie *pci = &s32g_pp->pci;
 
-	return dw_pcie_suspend_noirq(pci);
+	return dw_pcie_suspend_noirq(pci, false);
 }
 
 static int s32g_pcie_resume_noirq(struct device *dev)
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index c62abfc7a446..d39753f0e724 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2479,7 +2479,7 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
 	if (!pcie)
 		return 0;
 
-	ret = dw_pcie_suspend_noirq(pcie->pci);
+	ret = dw_pcie_suspend_noirq(pcie->pci, false);
 	if (ret)
 		return ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index ba8e6b297674..e3807da316c8 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -1071,7 +1071,7 @@ static int rcar_gen4_pcie_suspend_noirq(struct device *dev)
 	if (rcar->drvdata->mode != DW_PCIE_RC_TYPE)
 		return 0;
 
-	return dw_pcie_suspend_noirq(&rcar->dw);
+	return dw_pcie_suspend_noirq(&rcar->dw, false);
 }
 
 static int rcar_gen4_pcie_resume_noirq(struct device *dev)
diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
index 349618ea5b9c..7b3a8c1b04a4 100644
--- a/drivers/pci/controller/dwc/pcie-stm32.c
+++ b/drivers/pci/controller/dwc/pcie-stm32.c
@@ -78,7 +78,7 @@ static int stm32_pcie_suspend_noirq(struct device *dev)
 	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
 	int ret;
 
-	ret = dw_pcie_suspend_noirq(&stm32_pcie->pci);
+	ret = dw_pcie_suspend_noirq(&stm32_pcie->pci, false);
 	if (ret)
 		return ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-ultrarisc.c b/drivers/pci/controller/dwc/pcie-ultrarisc.c
index a0d328c0c09b..3d7af1ff327e 100644
--- a/drivers/pci/controller/dwc/pcie-ultrarisc.c
+++ b/drivers/pci/controller/dwc/pcie-ultrarisc.c
@@ -187,7 +187,7 @@ static int ultrarisc_pcie_suspend_noirq(struct device *dev)
 	if (pci->suspended)
 		return 0;
 
-	ret = dw_pcie_suspend_noirq(pci);
+	ret = dw_pcie_suspend_noirq(pci, false);
 	if (ret)
 		return ret;
 

-- 
2.34.1

