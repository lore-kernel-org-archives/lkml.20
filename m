Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573809;
	b=pVszRfqcWAYUKs7idS3Vvnn3omAWmbbANmcntgn8TxKZNWpo5xFvn1IbDHvebXv9dri1
	 cLqqrfLdoenX85Zkj82WsN/myohoTK6BP8jQJYPQMerM+8GT5N0P24HbuyjqaQaC7XukU
	 QadzOynOsJqkaJ8K8cm2z0/qEtUNaHJ8A67eccaANOlqfpp7yOEIR72Y1qieRXOLUXntn
	 uVN96xSPgNgLxnYhH6HlWLyWIVOSbb0nEqP7x8O2lzeYHCNyCG6armLbzR7GxU5P8Nvb+
	 JXoK2sqLYePHDIrd1OA8Hhyn4GunxTfTO3sLHHqu5jCTithCpEedMmrHMPFdhWf1UdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5NgSXnEEmgfgUTlanAo/6OQIO26bhBCj1wawXnORXqw=;
	b=zGGFrEQCS/5pCsq1EOtUKQbQI3b7GWsUvDXZK+UBo9SnuuxFGySWBf8JrcCVl1xsUMjI
	 mJ1Nkip+xgLq46BrxAK+EXoQQMzZrY9lZv2D2SpFOL671vN4O88RysbCt1bc+6DUW/VAN
	 gRaOxL/OJbhSsZgLOyiAl4IpJliPMujNjtM3v+NvU8rC+sGfumttRKfO5Iv3d1h2jaeed
	 iyEJzH7pcHWIR1THUygvNl2J8jKIkhub6YjbSYGqT14L9ubtf22yJQKUyW/nfyDMH9mEz
	 3lZfXs7pKcpHSFEDwRh8cL4qY4hHzum3MPh0Jm3lbmlz0X7RZCZmHsVeZGmylDwP1PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AZA0kGTc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="SWuhm4U/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005BB60A3834
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 005BB60A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AZA0kGTc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SWuhm4U/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5ixQX3018512
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5NgSXnEEmgfgUTlanAo/6OQIO26bhBCj1wawXnORXqw=; b=AZA0kGTcLAf+I8xh
	4qDURjN4lQIRJ08mfAH9igKwlyztL0wrOPrwpBO+IGGHv2IzP5Ix4/X5nMu17CCj
	KZuSuPYgSMIlv2BdoRDVjJGji1k1DAqxx9xXepgKBODSPOlPF4yx6yWYXRmN/SOZ
	W1vCs4MZI7fG5wDHLXAfiqiLcHP5463RvL/OPcQ6G8AEbM0gC5rcP+fwl3C0TYtc
	IMvtIUfIzH7ksm1beFrbQVRoFzyFT4TGoK+lzOFVpfHxwQKhtTOmtxpIMA50opki
	gyItfhgBnecM7DwzEcrgTtIZ7m5vegfQut6jIlivQAFRxvxyGL379VkhdYAUDQVJ
	QrB7NQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3k8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:08 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b26d8d2498so630742b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573807; x=1793178607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NgSXnEEmgfgUTlanAo/6OQIO26bhBCj1wawXnORXqw=;
        b=SWuhm4U/lp89QE8iZpz+qV20uuGwPD0NuNjz6f17VovKfkHtc0HZ0v7fbiOo9Devys
         doZM2nohLW/O2am+WRxAqpBlvmFcgstxLp//93HVNFORTpppTJsTaUnqI95oeKHpIwwa
         gtOrijEt9U9S2PedFQs3WPd1OY8lus/cvhFAqVE7zSx545MftSxLuf10XTg6FpS2YfGf
         QpGdSfQYXqY4aFbE7CshdcquVFfSGpX0mybC4CeAMSSSfQ+brARmPHSSeiK4h4t8Bn/n
         vhITxpy9iRQuR/cXwZ7DjgeUDm7lmQ+BlvqXJnT+9oGA5YBXH1nuxcPZchFCOppf33+o
         11mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573807; x=1793178607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NgSXnEEmgfgUTlanAo/6OQIO26bhBCj1wawXnORXqw=;
        b=PfZAewfNjCgKmO1PtmXZMbPzEyS5IPIfg1MWB6hvFA8UoxKpAG1UrFiwuDEfXU39pm
         r0PWgNPpQ/DtOwDwl3yEO3VlxslLnF/qxJ2+TNccULNrDrQ3O4qrQxODgH+yCpdrBYDh
         IAv6E2Wi41bLAwWOQPtG9y76lF0ggSsKmr3SkB4jrrH9HT1mqLOJSlR1mNTTspxIhsRH
         mM/f/CzsnVO8S0zL2Rv3m4GstO3owPdfV9E29r880qll9j4naeeOpKtj6VYnxuD9W4UB
         19WVfgx7G09rBQzRgGgjyQch/jNZLN+zQX7bvJDfbI8SEqMIzJbKN+tqQR4JsCqQe+c7
         O1fA==
X-Forwarded-Encrypted: i=1; AKwUvBz524AmhiC1qi9nmCLQ7XPWif5W/mn8RIr1wlzcTgxlsSWJohyc4czryFbvGDzT+R2Im0djLTIZljEUaHc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJL2/bcscXaYJKeiyqH3wuMGGuWSzkAP8Cw4HB/JhrhisO8dhnL
	Jbmx3V+CHGTJVdXgSWHd0zK6c6RZg7xkV3HpGNweIOj5UBC2jRM5XF7kn/WeQjgl/nUntzwF3el
	9j8uQ1oKeHzZ3pBuZ4zdGUmmnPDtkfWYGb3psQ2LqW1QzyuAuQCC0JoRw3ejT+IQnREg=
X-Gm-Gg: AYBFou0Sf31Aim3meniGEtHSeG/U1AlAKD2kPD8yOpa2O/gCHI9fAyJtKlNAM++oVgh
	rQI86BLEl35nDoFStrJvJrG6UrDSAT6k/ng5AvkrWpmChxXtSMeC6kcMM2EGgzARdN94yWPUZ1V
	gl48nS+UbyxE+0eVrdNIzcS78idKmbsCZjZuuM8rY7CidJ/72oajoEEyXA0eKfbb2Yh0j+X8QYo
	iyyJeoPJvuywF706e0XLrxMnUOp+XF9sUhZVAAzUedcnRvwnD3WTdYNT2/wuUU8gv1v4ovIS6DE
	CViDXRv6810g0Pwl3dGjaiegmVzD+8zo+CghlueNqmd2qkfriMheR5RcuUF4eeOvriXxisPwmcP
	X95ICbjdQFm8EaJizJGiUwmSxGAhKI21BCjbD+o/8CARIRXiY/g==
X-Received: by 2002:a05:6808:1822:b0:4d5:295c:a82c with SMTP id 5614622812f47-5536436a25fmr803756b6e.57.1792573807481;
        Wed, 21 Oct 2026 02:10:07 -0700 (PDT)
X-Received: by 2002:a05:6808:1822:b0:4d5:295c:a82c with SMTP id 5614622812f47-5536436a25fmr803747b6e.57.1792573807082;
        Wed, 21 Oct 2026 02:10:07 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:10:06 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 02:09:36 -0700
Subject: [PATCH ath-next v2 8/8] wifi: ath10k: trigger recovery on PCIe
 MMIO wake-up failures
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
Message-Id: <20261021-10k-sdio-crash-v2-8-5df80bf16e86@oss.qualcomm.com>
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=3505;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=aqXbHJb+y8P/i5hcNxNZ05zuFzzRiubjGC5cyQScfYw=;
 b=l0Truq/CdJjBKD+I1n9QpDVhmTitSnzL5xp6Iue8hbgm/N6MO92AAOvYxxTmXICaCd7XDGB9I
 6tP197zOE6tA9BEerYOzBo64UcSehOeRbJ9H5uzljajwCprHSYzzdW5
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX8nbe8TUvz69T
 /jNOU7OiDM4P9uSqNyV5/ZdEw7iKcfTX6o8GrV5Cvg57ybPvQwwjjOyRYefwxWStsO6pMXnNSHP
 3nMSQkop5nYTX7ZBxa+RpTzjQWSmTOlNV4K3Gpis6+nHZKouuoSIgOAtME9PJVvVWxC42DvvuzO
 l8Gb+CEvNkebPWiOQT5KaRYzdFQGb5CPCxaf74YyD5dGLnKW5KPsDmyW+tN2OcZXuvJWwhVt+VP
 dVHuS5YsOztJoYGJTAbTUcIrEDdbkmXYif37MabgfeBxeBgP4IkFP/gywZIef50Zk8krh+v4UiE
 t2yTDjMb5/eDeMDzcUGTmcNKxnX4zWtQVVJVYVTQ7yF7mVxiyJk8Mh65JpSz0moKxpl26vrHcr4
 mlhXeEr4DqYHYu83Sk5RH4PU57D5F9TzYWSrws26Um3VAJWtTGaM16TYOcQ0YrJII7wKMpQE5l+
 wJQZNHtk4JWodqZ1T6A==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad88170 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=r31ynADB2PxU4kuVuc4A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: v34SOh6_baobHsO3lcEuTDXdEejS4NlD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX8hec6hU7o5c0
 3a3pMMEioX1/D/n05LN7JIbJKEaU79V6fzFBUUILSNzNiEJ2UlvXPPVECfCbqqagVBI1gqplEHa
 mVAIidEnzhExbB6z1xulzf6FWG2YL6c=
X-Proofpoint-GUID: v34SOh6_baobHsO3lcEuTDXdEejS4NlD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210036

Commit 77258d409ce4 ("ath10k: enable pci soc powersaving")
introduced MMIO wake-up handling through ath10k_pci_wake().

Current code only logs MMIO wake-up failures and returns.
This becomes a problem when a PCIe link-down leaves MMIO
wake-up failures as the earliest indication that the device
has stopped responding, because the existing recovery
mechanism is not triggered until higher-layer timeout paths
expire, for example:
  failed to wake target for read32 at 0x00036044: -110
  failed to wake target for write32 of 0xfffff81f at 0x00034834: -110

Improve this by triggering recovery immediately on MMIO
wake-up failures and by aborting MMIO-driven waits once the
device enters ATH10K_STATE_WEDGED, because no further forward
progress is possible after either condition.

This shortens known-failed recovery attempts and helps avoid
suspend watchdog timeouts on systems where recovery time is
tightly constrained.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: 77258d409ce4 ("ath10k: enable pci soc powersaving")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 335bc7c488e4..0c671630cfc9 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -478,6 +478,10 @@ static int ath10k_pci_wake_wait(struct ath10k *ar)
 			return 0;
 		}
 
+		/* The device cannot wake once it is wedged. */
+		if (ar->state == ATH10K_STATE_WEDGED)
+			return -ESHUTDOWN;
+
 		udelay(curr_delay);
 		tot_delay += curr_delay;
 
@@ -642,6 +646,16 @@ static void ath10k_bus_pci_write32(struct ath10k *ar, u32 offset, u32 value)
 	if (ret) {
 		ath10k_warn(ar, "failed to wake target for write32 of 0x%08x at 0x%08x: %d\n",
 			    value, offset, ret);
+		/*
+		 * wake_wait timed out; the device is unresponsive at the
+		 * MMIO level. write32 returns void so the write is
+		 * silently dropped -- kick recovery here instead of
+		 * letting an upper WMI wait notice it seconds later.
+		 * Guards confine this to runtime; cmpxchg dedups.
+		 */
+		if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags) &&
+		    ar->state == ATH10K_STATE_ON)
+			ath10k_core_start_recovery(ar);
 		return;
 	}
 
@@ -665,6 +679,9 @@ static u32 ath10k_bus_pci_read32(struct ath10k *ar, u32 offset)
 	if (ret) {
 		ath10k_warn(ar, "failed to wake target for read32 at 0x%08x: %d\n",
 			    offset, ret);
+		if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags) &&
+		    ar->state == ATH10K_STATE_ON)
+			ath10k_core_start_recovery(ar);
 		return 0xffffffff;
 	}
 
@@ -2248,6 +2265,12 @@ static int ath10k_pci_bmi_wait(struct ath10k *ar,
 			goto out;
 		}
 
+		/* Stop waiting once the device is wedged. */
+		if (ar->state == ATH10K_STATE_WEDGED) {
+			ret = -ESHUTDOWN;
+			goto out;
+		}
+
 		schedule();
 	}
 
@@ -3308,6 +3331,10 @@ int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 		if (val & FW_IND_INITIALIZED)
 			break;
 
+		/* Stop waiting once the device is wedged. */
+		if (ar->state == ATH10K_STATE_WEDGED)
+			break;
+
 		if (ar_pci->oper_irq_mode == ATH10K_PCI_IRQ_INTX)
 			/* Fix potential race by repeating CORE_BASE writes */
 			ath10k_pci_enable_intx_irq(ar);

-- 
2.34.1

