Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794015955;
	b=FlttSjXNqDXU1QZYzDb0v9PhIxhh/RpqB2GRLmKGmaEnm91iUFVE1us10cWtsCW8n6C2
	 fXysff2PY20VFH0b58Y39A11fK87zdT3UdyLKWxMmOfLpknfBDc+Pknn2sOGXdGDuzPwJ
	 VeLWlSliglKNRiQwB+f3OMgMVCkRWpL349T+1tqiB0EezH7cbuEVHJgPMezm1lhjp8hOc
	 Xp5ziOfKxR5fqnMeiWOYzSpw2mVeufGtHfT6jn28f9gGBjsUoOdspTeX54M2HtngytcoR
	 8txAtNkx1c9zoHvVpm/417cfqDyRgYe+Irwkwvhthwuo2fnODZdvHQloAojMABpU3IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794015955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ssnlpfixjJLNbaeprfbwwWlB/EVWQShSh5ZsICInKHE=;
	b=g3Af/Q3XFdKEokFrnc0XqW2DPgTXXDVdAhMv1lqCVE2ybEXwoTVIsDyX8tACTkxLCzYS
	 KxfOwhhDMdu2ap7LRV3v53u0qDO5oobJpP82+2qLSszdbmtzC1DCphDgQLSfnbBs/zzVT
	 HsvXkbTSyEKCn8SmToD7KIK4aHTTWZzbJJYmtAnKJ9df0IvLSBXG1jrme9aa1Q/urjqcX
	 NNQrw8KAft0rL8b6jbnp3c7pQHhcULuu04tF/loh+gwJgj6jCtte5VKrW1yzTG4c43wxH
	 1ScrHYGj2NIbQoHfjU8pCfUvUXxY+bY/ialHrcNl130BFq8hmuLn+IKErnPRQy+i1Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hQXH7lx9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R09ssgZ+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C549F6082BE6
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C549F6082BE6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hQXH7lx9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R09ssgZ+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MoA8x149186
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 01:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssnlpfixjJLNbaeprfbwwWlB/EVWQShSh5ZsICInKHE=; b=hQXH7lx99Cl40XTu
	3B2A/cNm1PpLD57d3EDRg6FSNyzydwIGcESMcI82Cwj1Prrqfmk/3qs+kJ1JHDi9
	rCXFpMPooJXxM1Qic/jl24TTj73I+VwukPIHFNTONDXRmup5JOatPvBjTxuQ7q93
	w7134hFgRX9wn36ZdED4FyFddxFSjpp/JkcqWdEaqtacKrhhYlyj8kj54EMWpMPG
	m48b0X/9v0Pkr2neDFu4ZnjoSMsagW1+aFPYmGEDPtHuORvGeW6q3n7mm+4El4zN
	go9nXJWl8/dJvy4S8ht7hJZ5IpqXnMofMOwVcLnlXwyHL8Qbad8toPMC6YivxxWs
	xLao3A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyk1345-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:45:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f1e7d9d4dso2491961eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794015953; x=1794620753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssnlpfixjJLNbaeprfbwwWlB/EVWQShSh5ZsICInKHE=;
        b=R09ssgZ+xvUtztF0SCsDmdAhbyuBPaVz+tjohSx5j3FauHHF3I3yuN53xEA3pzAnq1
         8RLiGU5kr8tpWlgjFVptCs4X0Et+n+G+rjQ9m2Xl+FB2a2LvOwbqfcN1cCq+RvSTriaB
         spQgBDAda2riJyrM5VR3vcXLBl9Nx1cG+Pykkzcdl3au+d8rW+1qJ9bOc37G+rjnTRZh
         WfcNAUA4eAECMIcPzta6Co198TrH9wKx2aPD0jAF5S9t99lrQ0Ltz/maELD2GYDOyqki
         jIwf9Ym8F1OceEzh2pvt3k5unwGD4XfE2eRIIv7YfCt4yLy+qbRLUWZyTR1rMYI9+1Fc
         hFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794015953; x=1794620753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssnlpfixjJLNbaeprfbwwWlB/EVWQShSh5ZsICInKHE=;
        b=0AloGhzT7RTJHNnw7UeZGHkS8rZQ0NfpqZ1kFL4ivtsQ5kj8cNTXHEQnYx7Wet7xaC
         wVHx6YV4Ame5+/l7GEaZcyMwZKXm36i6Iq2PlPFOCwt4JcKKJAxxQJhI5hN7/AUCmcbR
         oYC4pFKYDJeTeg+Pdwel6IXECWHajOxo6Q115OXLikNKeQKN/fR/jwAjTlA/RGFrLA/C
         X/rtBwh8u/wNN5uEpUX7wBSDf3noRyuWtOTd4TZmYv0Dq74vmLPeYf2AxDvAsjiBl32S
         3Kk7G/48Nwhm0g/ABwBcM27p77V7Yp+XgsPcbF53BFyT79ya6V1tKKg852ziHcWARaEl
         I4UQ==
X-Forwarded-Encrypted: i=1; AL+hErG7pnh5fooO+mIgQUAVGum6XSELwma28fCUb4TUQ5Gm+LY/VnJ3WHq0gLD6HucpMJxTcRiJzdTb4CTq7O8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GH2bXtlh+JrwqAkOGOakX8uHNRLAOmESASTl84kiHE1xS2l2s
	4ZndJPHlDvOvpS3v6phwtFd1/hcCOFAh6+H6Q/ZXs57KtQH+zQQHhLUMDgmk7QzkaTK60vwCjZN
	iSbj3PcJ/l5HxDPz1P8vQ3AVmNWQ9iRqaMtPmoQb/eZbbrjYx5Qvci6NNEosLpHSyR/Q=
X-Gm-Gg: AYBFou1B9KKgpEQpac4IzZU33/X+hPUbgwbX42fzVTuq4SRjpIHGGh9gjw0HIkEWBqj
	ZQRG3saa+BMmxRjK6Bn/EXEQP8DT40a+vyBrNepgpMI77bmtxe+Xlu9isIjD9v0KZBskGeiy7we
	dF60dNOyOBfXEnPXJMnmbQGGUhJIpjhloTriFTnLBehl688vFpAN6pcU7rBd5AN88k/lnbWvZCC
	44eMKL1wfgdZV3KOFeVeDGWll4Lqx8jZhjKOlv2/hp7fWJpvpUlmLqFpG33MT5AQLMjijWlB/wZ
	KsdxIBmKEzNREZ+AzjYtzWiZXDNgL5PapDHOEnlIh3hUc4Hsj9UwwNZvOBkLh9mc/9PuVd0alny
	sfDCtmQvGDhV4Wsg4AYcqRjtDueR3iOA0XVEBAy524YDWJ3QcJgY+lV7K1F0otQHEJbM33pkln1
	iAQk23i6k=
X-Received: by 2002:a05:693c:8843:b0:36f:6d81:3fa6 with SMTP id 5a478bee46e88-36f75443270mr5970856eec.6.1794015953242;
        Fri, 06 Nov 2026 17:45:53 -0800 (PST)
X-Received: by 2002:a05:693c:8843:b0:36f:6d81:3fa6 with SMTP id 5a478bee46e88-36f75443270mr5970814eec.6.1794015952507;
        Fri, 06 Nov 2026 17:45:52 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm22861123eec.3.2026.11.06.17.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:45:51 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 07:15:21 +0530
Subject: [PATCH v8 3/4] PCI: dwc: Add dw_pcie_mask_msi() to mask chained
 MSI without freeing domain
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
Message-Id: <20261107-shutdown-v8-3-bf607c6429b0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794015933; l=3587;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=x0tyRGoiEXcFCBOwFALm9OeIvi8b9+PkFQQ2PP+mqWA=;
 b=iar59TBkdIYhgqQenI9gPUg1OthKYTFvz1STaSPVLQm87CmpEj8VTj/6pAbF/fYd1ru5pLt0N
 0j+5l3WtL/iBSrxZXwumJbTiZK3IEKKTgFww7zac5PiMk5/MHxYtEzY
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: O6tTdFvDpQUJnmBE4pi_1ylDkTyvLJkO
X-Proofpoint-ORIG-GUID: O6tTdFvDpQUJnmBE4pi_1ylDkTyvLJkO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwNiBTYWx0ZWRfX8F8rOBQFHN2x
 sLxG4ivLeB2sTK2xkGgUqn9HeRP7H+DG+ns/0NncHrxmn1vY6FEKerGpoyM74FRdAtn7jLz3REL
 d9SZJ8eVGFaPgAbfXV+OB/7uHUbMPMo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwNiBTYWx0ZWRfXxh/UXIJ1jZde
 vpQWxn9TTqnK3+usAxnJy9igHSs6ORlsGe/DmpQyo7Y4NICXyRjhX41cP2o3VfdqJn5UIURBL4a
 /2/kU7ZWfFSEmrc/wgC73nsG5zlrvlKGZmRdZC0VUdEEQpP7Cgm95kdEGxApQjWD8J0EXOuFLcf
 tGlQ3B6ClbYmhxTlBRuBNx5cMPjHVh5ndXWATd0KvI7bJPpke994+OnwRFwfk30BxzQ5QxEdHdZ
 8PmNYIMv9H5F86llkV12al/N3eOs2SgtXBTLkEDFlbmK7cl4DJUjEUNCr+1AwxKJu/FZUPrUfh0
 jRRO6gLCQCWAZ/goUgjXGwExLZLI5pq+XqZeCwkmz3/7wwvxqv6mVvXzWtAbyf3kLkn/K/5QUDZ
 VxwIG3PYwkkGCX7QN2pp1r4nkDg+gtxqOjlCt9JAFqLouciB9Sr5J8Dxlf3B2i8llIW+c9MLHwq
 cTdN3W6MmhkR/WpWZbA==
X-Authority-Analysis: v=2.4 cv=I5Tw19gg c=1 sm=1 tr=0 ts=6aee82d1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=H8WLNgnoBSHn1WVVwwcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070006

dw_pcie_free_msi() detaches the chained MSI handler(s) and then removes
the MSI IRQ domain via irq_domain_remove(). That is correct for the
dw_pcie_host_deinit() teardown path, where PCI devices have already been
removed and no MSI mappings remain.

It is not safe to call from the shutdown()/reboot path. device_shutdown()
does not remove PCI devices or tear down their per-device child MSI
domains, so endpoint drivers that do not free their MSI vectors in a
shutdown callback leave live MSI descriptors parented to the domain.
Removing the domain there orphans those descriptors and leaves dangling
references to freed memory: during a subsequent kexec CPU teardown, IRQ
migration walks irq_data->parent_data and can dereference the freed
msi_irq_domain.

Add dw_pcie_mask_msi(), which only disables the controller's chained MSI
parent interrupt line(s) to stop further MSI delivery, leaving the IRQ
domain and the downstream MSI mappings intact. This gives the shutdown
path a way to silence MSIs before clocks/power are cut without the
teardown side effects of dw_pcie_free_msi().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 22 ++++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h      |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 0837bb9e67e0..7f0126c5336b 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -240,6 +240,28 @@ void dw_pcie_free_msi(struct dw_pcie_rp *pp)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_free_msi);
 
+/**
+ * dw_pcie_mask_msi - Mask the chained MSI parent interrupt(s)
+ * @pp: DWC PCIe RP private data
+ *
+ * Disable the controller's chained MSI interrupt line(s) to stop further
+ * MSI delivery, while leaving the MSI IRQ domain and the MSI mappings held
+ * by downstream devices intact. Unlike dw_pcie_free_msi(), this does not
+ * remove the IRQ domain, so it is safe to call from the shutdown()/reboot
+ * path where PCI devices are not removed and their MSI descriptors must not
+ * be orphaned.
+ */
+void dw_pcie_mask_msi(struct dw_pcie_rp *pp)
+{
+	u32 ctrl;
+
+	for (ctrl = 0; ctrl < MAX_MSI_CTRLS; ctrl++) {
+		if (pp->msi_irq[ctrl] > 0)
+			disable_irq(pp->msi_irq[ctrl]);
+	}
+}
+EXPORT_SYMBOL_GPL(dw_pcie_mask_msi);
+
 void dw_pcie_msi_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 90e6e25fde73..16b180275aca 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -866,6 +866,7 @@ void dw_handle_msi_irq(struct dw_pcie_rp *pp);
 void dw_pcie_msi_init(struct dw_pcie_rp *pp);
 int dw_pcie_msi_host_init(struct dw_pcie_rp *pp);
 void dw_pcie_free_msi(struct dw_pcie_rp *pp);
+void dw_pcie_mask_msi(struct dw_pcie_rp *pp);
 int dw_pcie_setup_rc(struct dw_pcie_rp *pp);
 int dw_pcie_host_init(struct dw_pcie_rp *pp);
 void dw_pcie_host_deinit(struct dw_pcie_rp *pp);
@@ -896,6 +897,9 @@ static inline int dw_pcie_msi_host_init(struct dw_pcie_rp *pp)
 static inline void dw_pcie_free_msi(struct dw_pcie_rp *pp)
 { }
 
+static inline void dw_pcie_mask_msi(struct dw_pcie_rp *pp)
+{ }
+
 static inline int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
 {
 	return 0;

-- 
2.34.1

