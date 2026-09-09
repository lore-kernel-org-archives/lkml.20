Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5EE55199D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956689; cv=none; b=DO7+DNgZobmnH9p30zO601v2Nfmrh4ZzgplUu9rj2e/HNMQ2jMUkHo0pQCxNS8UWqPypwc88PgCsFXsNRm28oftdmRJDd9E1cIwuQnJugDtdyh8kwQ0f8mivSUvjGYPkBsKSPPEm8tzid9xnHkNw7G1Z7WIwiQiK4MkpyR4e+lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956689; c=relaxed/simple;
	bh=Z62C1KjgkUfHo1yhmxjksV4K46Bz6P+GsVAjd37UQdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IBZGxoNkOSyGhl8KIdsE8uiSurGGK5Kv7GC925vwW0X9Z5jDE7lQFh4+aTV6aAuuu8g63ROTpte0ci6R1aZ6nvYgE9Ju/pHkfmtkwZ7/Vc3iiGe6MEzdoeEa38eJHI0Mh72Wtd+Z5X6t9nBNzrELMKu4NP8rjRzDYVOKEqIGU5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpdOwa3w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aISYGpW7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpdOwa3w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aISYGpW7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2Ng1810036
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=; b=ZpdOwa3wtIUwRt33
	7q0yH7Ul7JGRRwbwa56x2S86qGVBUepBJZ9KJlaEAqsy1miC8Nlz2xkwlLMxXxYL
	l8ylpzVTz2C1R4I4XbIjV3XvX2rQ2wBayu4qdoYkEMT/gdFTPdvRZLNlxulSTIxS
	gsfFbc5ulJa4BvNcskVemnyuy+SV0vi2kJvVDEmZDiKtUCobGF8H7CIRGg01f3mK
	/9KT28P7ulAy3BTbN3hsh8PK0VRVlA5+y43vdB/OuTsX3SOFzAZ11OhKWZbpWPgK
	TYMH9swT9G83I+b/mM86TY8E+aSDjFsF6jP1lEPcOpZj9fbOA7SXM7HCvuFEInqM
	BCdDDQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj0m07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:24:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso7977943a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788956685; x=1789561485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
        b=aISYGpW7ZCt/bydaylrEA92MAlHyv5Npx9Wm3deQTiVInVEbWT38jnDZnZcgBSI8+E
         bYg09jdW6KmxtIhn52M9Ivz8WK8rjBDdoaRavfwJZCkgKViuwslKlG1+3SeiVEbWe3Rx
         OuGHvwQbrOrDIqGH4wuADpMVGCQL7RRUKX3VNwy0iOYL4IdJUWKCtz/MXE91QmqPJILJ
         vqdzEvE87mycBReBlBWh4gEjE10c8pWxJPftotybvsnbzLCs4K7sACQyeXKCZfNxC9y/
         l9T7qWHhYOjdZ2VvDuneqwQC3+zXOHT/SMJmWrHGqc43yomB2AsH/++h1E40K6o29Xn+
         bMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956685; x=1789561485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
        b=Lx4CVPf0GK942XskT1znIj79uoiLcI2q2oG9dvMnp+6c+ByqmIcsu9nvG2+Zb5exOj
         +QDc8xvC+GmvZTNVuykk6dVJeDif3r0KAKRJUFm45RZdT3Nyi++JBvIX/k8zQOpSRCKz
         adY+VmOGbEFeVVXpLKtb1VPphSHNsaWVvsnfX9n3vGGBJjER2PxmqSJXPnV39P5EUsWZ
         hPHPc9MF5mWDW07nt7UtsSp98v/xA5Z5jg8MLRB5L4UV9ScZQbWaECAs33C7S+31bTMY
         4I5bhDu9Pi3WjgYgHCimIaYM8cbsevuEtSA8lSMFNEsqxcY6p/qNDurZcjU8xeundvR2
         Yiqw==
X-Forwarded-Encrypted: i=1; AKwUvBy0F/5OJKZWVeNoh72uP79mOamDm7esjk7Bv6xTXG6/5ue6lyfeS9bJ726QaLbyWrn9B03M8Kw8lDQALyc=@vger.kernel.org
X-Gm-Message-State: AFuF++nxB2/VissxzkjjtT4yiXZlccc8NC0uP5B1VUUT2gi9SYcXZ5kI
	/leiHd/raVEdePAHZqpr88g4B2XJ0b9GY2Jixuw0nouq2Hi6YlCUreHh7BC8GIP+uCo/Zc2H6e7
	/gV6LPk2oXRZL4nm9dvyHPeJjIi/n/Su3GPgXtPFWyT21TDbmoNlp2i73gmoIpknq0OU1DOmCQl
	g=
X-Gm-Gg: AYBFou2z6PUIkSCzBnqSJ1vxFZ3D/G8BTwIDXG9wX9eqXwXWF0v7SHqF+J7CyuJe8EG
	AUE6/nioyW29+EGXQy4SACtHl4KPPntpx6LnVpH9amEzpvFTMDTmsl+kH+WwvOXbuYC1sVladBc
	0MuY4vVWhWEaxg40+CJ2TylylfH1PZF5YVWHDCCGqOTm5Je4tCLafn++Te34ggmV0EsDgIBFLwt
	kj8LVaGZRBvstwrk7n/hWiTcKkPHm/Qmpyfk2gJ1MsWofPZzqeDVtB5epQFCHljLRl96gIDkyG6
	68BJgIwECm6Qq4fpXsvBtjqSAiqLg8ELXseJ+ICrRQ383Ykhna+Qt4yXnS4RcaRmYQ6svCZLcjS
	/8h5420Tc7KblmkoPEkTtp0QhhcLYOzzAF78=
X-Received: by 2002:a17:90b:4d06:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39b2614df74mr49703312a91.1.1788956685178;
        Wed, 09 Sep 2026 05:24:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4d06:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39b2614df74mr49703230a91.1.1788956684510;
        Wed, 09 Sep 2026 05:24:44 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm69372775c88.4.2026.09.09.05.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:24:44 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 17:54:28 +0530
Subject: [PATCH v6 1/3] PCI: host-common: Fix early bus-walk exit in
 d3cold_possible()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-shutdown-v6-1-62b7bd123236@oss.qualcomm.com>
References: <20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com>
In-Reply-To: <20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788956676; l=2329;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Z62C1KjgkUfHo1yhmxjksV4K46Bz6P+GsVAjd37UQdg=;
 b=eS4Hpewq1kyOsiclxmzTvPNWmLPAaY7CBZESA3p6xElkvy1rVxfY/hHn/OnF5A77GyofIPreo
 YTIMwPOG+JWCZUsd3X6/bLV/81hAg9Fssb5RylxRkwm4bzZOq0eNIMG
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfXxppVyKO/yEFJ
 lxQP+mZvZ4TwXY8TT0bU77Lc1npVUNrBEjXqUnxKilFNoINZ8Kf+88NvjsTVDUQUxUAICTXU0zp
 N9slIShpc91LaA217zalKLi/E2PCEgg=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa1500e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RIIKlrP-v3AzcS8hWasA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: _vpSXQL89kcX4u7EypUq0hy7_o1h22Nu
X-Proofpoint-GUID: _vpSXQL89kcX4u7EypUq0hy7_o1h22Nu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfX93ylx8FPiLR6
 as/Mq9KRFEQ7czAyOlfL398gOAvp2nt1TOEP2i7Uz+TPbPSjJrMBN2WtLRQl62MX29aW9Dj737x
 JnbZIf3iCVLC0kRuAQO8VZcQWv2SXMIDz1vkwMTk8/MD5lrVEuxspvOxwk1RaDSCrhgLUXxckhh
 tWRrF107LQoHuhED5gH9NrUZnry0NZxFk98581AjeJesStfs2X6naIlRIWn7XyhaQDOYAcvRpJ0
 oHTvFe0Er8rZGPUfDRDjV7288zyb9i2+LKd1j7HE5rSczEEL4ghz+FQPp1GzMIS0kcux41zM30Q
 ivMy/UONGB/g+p3mtDx23WPUAX0ueGywidKPByC5L03Ox2yjEpjhs+oF5NEieAj2eybex495IPn
 RfOE/kHNop4vYgcMSSu3MpVB8GorOuUhVH80rwiEaqIjMHOnwf5mGoPEL+G6EY/KgvIAqaGVgLn
 S2Et2qMfZOxUNdxfZLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090138

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

