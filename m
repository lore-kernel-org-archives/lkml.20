Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472417;
	b=dGtloakRaHN34Qep+azMZSY+yo1kB1WzKMXoDsMzowTpfbufG65ugrboA/FJS8KGc3kO
	 NN693mvI2ZVANFlYvzzne8pOoCfKSpB/AQc79Eh9CFW9Vs/TKNdYQ5Dz58RjEi6a6KgwV
	 RXUKUXnJrF4JNCJNEKnE4ClvDF9gaPYly14cm4X6dvWqv3bULSfRhGetcDZkc1Hmi4XMP
	 5NM/wTPsPAwQoxXlbEepkMjI5RtWUfMGM5nZjRsxMXBKiUN6MKyo8yjU5v4ZqULWF303N
	 8k5OOOWfi+yDibTI8iu8S5dv/BWRcxr3NQP2MTHEdrJmMYlYxqIqf3mDsmet/WLd/IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472417;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
	b=xRkxsujB5WIEysqB2rWXirSwscL2AxB54GxXb5S9ofIZw+dg18DG85KdgHN+wnaqtcrU
	 FAm4WU5hKbwMCIJWDHiADyvAI17JmXENI7A0AajpnaSioa7GZ0CeCUFehys1j1zGtlgvH
	 1cSpeCisXGEbS1DIUylbYaTrXD+91kxU0AfwE/gJnkykxKwlahxkUi2aVErqCH+7zA91q
	 /Z5uJl2v43KJdlTDMryZuodjXVOGDIaNDMaQXYymO/5OOV+/v/oUlZ0Mhtn/3moGS2H4T
	 tZ+UY1mctpEB6QInfJlIZBZNTuTGem4QLWS4bKhYayw/4xBNXiXSmA7pm5te+Oc3GCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWriODnm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JI+7ZvcM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4D0606A8A6
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B4D0606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWriODnm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JI+7ZvcM
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZQ8G4092474
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=SWriODnmPpc/SBBi
	0q6R/aCwq/KQ2bAtKHOgUHD4F81ZtbBCe/1K8PSBm6gtQoOebum03cNuH0DXtNX4
	f5/ATLZ+MmMCYJZgtUn2FWwQ3enjBvucPWgQq4c/eqjNoec0QHrclkcx98GrmCIb
	jtpDFLfKC8CmkalpgileOhawn9axF+crHcwcRwOOSJTfuMHeeG2gMS4ooj/KnErM
	TtSxsxgIAQY0q8J2dFQBDdYMZCjjgMLdIjhScdAoU9FxUeZzaRnPt9qlXEnMH/PU
	7eVa7a5EaFthpT14BwLQoQoWU4A5B9WICjbl4S4HG65n7Kp3OVOthMNZTSujrh78
	10LFnw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8hy7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed276af91dso65314605ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472415; x=1795077215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=JI+7ZvcMbrotnbi9fsaRXZ7EF0p5HDVgam4Z62NnS3U1fLg1UFs6R/XnhVZ+Ws/s0P
         fvDTGTjVIaDdSZTiVT7o5FmmAUv6MNHaj6KWLIjFHo7RbiqAS+bzVTpTjp+B0xqIzt/k
         epoi8kmSVQLKbmuYRFvB/j6xf1pYbXmyTqRzvyqLIvSK3xWea4ooq+qI0mMP5hVKf5H5
         4+x5l6p7FuzU8E2z1CJMP12CpaeZ/7meHEVvSxyoxYzqBtturPtvoG3jMHpcIVY50IJ0
         B1a2D/fJtKBQCPl0weYDYXwvloox5HFzfws7tTSlmpyIgoJDQFsILiyZkElRSzvAKAlA
         7TEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472415; x=1795077215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=pN1N013/t+uioSoKcz0Re0d/URxbbgsResQVvE3NxQ7WGJUhA498Dr4LuCfkdIxKAq
         NRnuHhyFX3F8qOu0t+mauNtXnPwoWJFZ9ZhkAYoWVquC5tvxgAuOFf34L84PfhxNDmVL
         8I6YYnlm1OtSX/K3tftgz/vNnyYvS/6b3dSQ4UoiPWVR8hN4rwvNd7SN2e8UgY2/8JZs
         XwkWlUJk0n5tY4mndUtsGMmYpPw3eEfppEGq2TxvWO9R7g3K/mwGzcnTKG9Z+pSlClKl
         iFSonLu9h2TQnL0TC5w+wTuXUXP7EsL3N4zHy797+7TBDCU9IUYRVbi+5MFjOgkzrFZI
         NKEQ==
X-Forwarded-Encrypted: i=1; AL+hErE2QKJudgTEcvHSVaSmYNEWbWQgUoSIKT2BgVAcXEJSeeIWnFFo9gGCYPPyKCAnXVv6qvrHWZoxTkjr8SM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QnIE2KVgP39Dj+gflibHEvITRqvS5Zy/pvn9AhJWnXvZvd26Z
	v6TDhpwkEs0bRCgWY1gBKU57Eq5nchYmxdU3UjtJnkxQI79fCIke6rfD4cFYPuJcLlsEtJ8htjB
	HTIlr9Fe67UnkIP0P2+PFxzVoCjXiB6EiL8xGEgsm1HHYatOuz6ZDUQSuM8pPftjnx7s=
X-Gm-Gg: AYBFou0lSNI//T8sNu5lE05Gri77Bon3nBCMvtrbKYXA41ARglC+EvGYRLyIemLR9Qs
	FadMMi0IzarMPdf9/KHGqVzT/6u5xdch7f3jOhnfMlC+mt36yjbvas5jy9j1MCegNlzTOHSb/xY
	K25jDmJQh4Ath7J6iHlIGT+Ra5Effbn7SKF0g14MmJsJIFRj79uTPFRQvAJXJYfUMJE3n++s8V9
	zrp0NkcFvNfmfNUqgkulaoICUMoqlkIoPU88SbeS6ul0Xv1FYDTDWvOj8ZlDmMDMUD6b+yMiuCV
	mMiKq2m8MG6jc1gMt2T75qrHy8hGO0dd7yr0rMAOCUjVQY7UFbrEb9Mhb8SbU3wWG3TC9Cm3h1s
	kpiUr9NS3r+Fev/1P7R9yfCzKHaZsxynxeBhwdYOndK+v+cjVJgKlNmHLWx3pb67WE9F5Gmbcdt
	wU/ACzrlZvg5NLzPr5In8TqzfpT/Qr3k/dI5HVPm66D6ALMkHNCWwm7Laui9Xx3WUF0KOZ/uyc+
	A==
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4554114a91.43.1794472414834;
        Thu, 12 Nov 2026 00:33:34 -0800 (PST)
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4554086a91.43.1794472414096;
        Thu, 12 Nov 2026 00:33:34 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:33 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:27 +0530
Subject: [PATCH ath-next 13/15] wifi: ath12k: add Wi-Fi 8 hw ops for
 QCN9575
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-13-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX0Sd/fS+PNVUR
 mO4yeFgnGKKFPa0qS1wyUq3iPCBBmejekbNVXVR1BZjwg/i3OaEZ2zJF661kcxv1X4gwf6IqV2n
 yC3AtzX5ooT91eaiq5zdayw/hf32MgE=
X-Proofpoint-GUID: ryU62PaN5cvuMhAXPRFx1wpAyTPX0NaL
X-Proofpoint-ORIG-GUID: ryU62PaN5cvuMhAXPRFx1wpAyTPX0NaL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX5t+GJv0fvVMX
 NrkBiyUrwbpHXr5EKCx8BA8qIc6UjxMCh4gNs0a+aPs1MNlTB0Yq2T21Ca4+H23uHD3V6+GMd5j
 BX6Z9G88IF4oOjBh/8Kz5SIiNTIYzZ0VHN463NSV/75ijIBTYM5DjnJv09GH6UGmAW9hdH1/bcL
 PQiIw7AMPJkgmnZeNpVHc4lY+YcmTt6Fz5tKiDxEFZYnq+7Z46jLr2HGuOSfXpeXV41iebMTz4G
 6GKovyWhQtjXM3fa6oPvvpAoHfrhsDSHLFZQWsza8XKxuo14gxCZE7UGEvnBk9xDfPxdAVhzbj7
 IGgWl6R263RXZEeblDqZZM3Ge60WpfBOzOMkeb2isYziHB1N6WuQp9nfgmqlsDIspyOgWrhZry9
 kIlhEtFF+gq9dVKb7p4quFtajA63d2bhR6rZtTUt3aW6igKIuE9KPngwDsguvwvcTeqOBeyQNAO
 3mWGgD6dqLB4a/c1oAA==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af579df cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

Implement hw_ops for QCN9575.

Add QCN9575 hw_ops (qcn9575_ops) in wifi8/hw.c implementing pdev/mac ID
mapping, srng ID lookup, and TX ring selector callbacks. Update the
QCN9575 hw params entry to use qcn9575_ops.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 38 +++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 74873fc5f3f3..92c897de16f4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -18,6 +18,42 @@
 #include "mhi.h"
 #include "wmi.h"
 
+static u8 ath12k_wifi8_hw_qcn9575_mac_from_pdev_id(int pdev_idx)
+{
+	return pdev_idx;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	return mac_id;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	/*
+	 * TODO: QCN9575 supports 2 radios (max_radios = 2). This currently
+	 * maps both radios to srng 0; per-radio srng mapping will be wired
+	 * in by an upcoming DP patch.
+	 */
+	return 0;
+}
+
+static u8 ath12k_wifi8_hw_get_ring_selector_qcn9575(struct sk_buff *skb)
+{
+	return smp_processor_id();
+}
+
+static const struct ath12k_hw_ops qcn9575_ops = {
+	.get_hw_mac_from_pdev_id = ath12k_wifi8_hw_qcn9575_mac_from_pdev_id,
+	.mac_id_to_pdev_id = ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575,
+	.mac_id_to_srng_id = ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575,
+	.get_ring_selector = ath12k_wifi8_hw_get_ring_selector_qcn9575,
+};
+
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
 		.name = "qcn9575 hw2.0",
@@ -37,7 +73,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.qmi_max_chunk_size = SZ_2M,
 		.internal_sleep_clock = false,
 
-		.hw_ops = NULL,
+		.hw_ops = &qcn9575_ops,
 		.ring_mask = NULL,
 
 		.host_ce_config = ath12k_wifi8_host_ce_config_qcn9575,

-- 
2.34.1

