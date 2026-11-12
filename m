Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472356;
	b=sWBCSBprkVXrBGMfE+Vf4ZKM2eW45pBKUp51RAdCX90Bib1nsK89hDUrdV0Enlmr1vVg
	 j1EL3ma3lgZ6C26cfGCcVLgDo/W9HqGJ1VElrhgfGqtBomBpgaRw4iw+2cNULh2jieHFZ
	 HIM7RniM2Wjw6EJKv1mrT5TgXMxnyI4qMnirydRdXeNtqjQfCk9Ql8671BpKIGCC8iexE
	 Xp1uwiPSRtlQJFng4qPLclFJSk9Y270mj7Wo/qVh+ioTFntxWiO022w40vjS5eLfm9rDQ
	 p5J6yhjXhekSQkWISsElbbSDR+1I4bpbC7lQrjyxtRvQhINULXusWCy7Y2QmQvmfgtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472356;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UiR+1LrLd8+Bxqx704rBZskKEEk9KPW8QLnXrAJlvFk=;
	b=JodhxIkk4H7UjxFUop8msRwPhWJwIJPsU9U8GMacESyuMhpc74iFlfG2b+5N2lK73LZq
	 cUWkmbhPayDabCbWvtTUAm1L+bQkVEwYjYo8nlXkL/pTphMbu/tnYniFktU0DPTUOEXYn
	 8EjyrjbyHtLsQZjL8XZElxMy+WEszOa7s40vilKQsnvUyX1kb1lSQgOFeZnQCaWfvsZZB
	 ijC1I6hxcwaFd7+5nf1lzC290BsDDfmDjzT15FiQlXeIrpSYEoILLbn8mdHNvs4TJuoJm
	 3p8DqAxpwm9AHG9uIDg/xE4lfKfDmHJ4rmGROo9aiP7FVHNX/QrdowuVhzhs4ZYSoXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OabI04mE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="aWBRhu/L";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2526360A2612
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2526360A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OabI04mE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aWBRhu/L
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC4mNtZ3893759
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UiR+1LrLd8+Bxqx704rBZskKEEk9KPW8QLnXrAJlvFk=; b=OabI04mEWfG7dY0H
	ZEKCMYeNnANNn27sNMj+lTgV6lRpxQzVyPbjJI81lh1HSkJvTWU2a8YPRdBD61Yy
	RWj6GJwau9Yo9iISTYbCkSLZThEnaw21DCU1Gwux+ov4MM8Y0h1zXaqrQVyOEXi6
	kVpVzlzUaWdSGyianwBdLtY1TKqXSL9Cn0G7s6LJUIJQAszaTyBT4QasIXCeQHJX
	4Z7xHq2npUjzBKvh6+VfZEILADqz3QiYO0Ux3sk2OnDi4pmgE1h7tVwisdLWXoP4
	j+m1ODPrAeTzHuSXc2XxPn1y2JIvh1IoydHS3KS+RbUzyro01SY62LSU07EBaMTj
	ooD/Kg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re0r3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so3807766a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472355; x=1795077155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UiR+1LrLd8+Bxqx704rBZskKEEk9KPW8QLnXrAJlvFk=;
        b=aWBRhu/L6UQ3jltvh4ZYdrNvWxYeuSNGuKktEvWd7nkIy3aJ8KwhSeNYRvUNc5dtTm
         7oUXjHUrWQJJtotJ0+ONvfWgk85gO+LQQmYEO4jnhvwG/v+WPfbFM+7XTRzEhD54NljS
         aNuQNmwGT1IPRT0tZ/Em7qcSwzyjkEqPPCUrq6Vdiln93rhlB80EpsE6FEY6qAnWaNtk
         KempBcE2WxbuVP1XXsvBcQeemx7t9U1vcHwNOU5UC48UaYZqO0U/WzatOOFw8kx9iIFy
         2xbe7NOmPZR187MWYc2d+b515ZLVnWOJ37ilUQ0GT987+VDZjq4XTkfQ5FFDEG+sjMo6
         xp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472355; x=1795077155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UiR+1LrLd8+Bxqx704rBZskKEEk9KPW8QLnXrAJlvFk=;
        b=Ij9tHgt88rmTZ6xU3v/nM439c1EEQ3dPxTFwB0CjWXVQ+K+NJNUatnhO46vgzznNWd
         GaCaMaACnT4W5Nww1I+tg8AwVoNA/zKTkgoGL66P2jBwNcuJIvlDmdXsUJy2FUY/pHJ7
         7LzjI0qNtrDwdBCiLyJ7fFPnwZAJ4UV9AAKFQY/jKjTtpYua6lR388fWVv6qY+E47LUh
         kaIfm6dzNrZObHdIt11cgukLhDoixomNbWvrk0at2+CjouDcVq5CfY+L9ZvHZwvra9AI
         nkFawq9XHvwEv/8OBp/zLYp+reTLA+ULEfxSIxZvgbzOVTInT11Cqz6nypqyKHY1z/tB
         o99g==
X-Forwarded-Encrypted: i=1; AL+hErEjOVn7eywzEt00j5iz0pNFXlR2UtMg+itj1n+XBSNoiSU1lUatQd1NpelTOiSXWwYvy5pDU+//DyArMuU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WOEhOuFtv7qRt/2PkmbfWkiHOSb8U3mtnDD03tS8tAwo5Wqpb
	uJWA5+PLZZhvCp6aX66G8TnNO7ke8uoFkOo0i2jpJRZ11sHptnYtDiNH3m5CVuxHvme+4yhqx8D
	9yeNFrnVoRHl6ycZL0EbffkE51MICPRZANrTjtut8kvcNKlZhwFwTpFzff/3NAxb0l/A=
X-Gm-Gg: AYBFou2Veq5WmMFdGlxuvGmQ0feF+wP7+hWxU4QNNyRLAvBW1lWXNnmdrwc8Hx3Z61S
	/5BSHYlhsq3VuERY+TKgSuUwTKaYrCf2Bli8jAr3jSmN5+XHfQs7nBlJ9hx/BwHSPlbnZfPdLzv
	xcLBkX39b2KkuB46Oj8sTXn8OQTq23fMF74EpIjoIDNxlKXnQO4BROfyleoK66NcEBo7GbYZaw8
	fY8kHQ+v+3Kg2AJcqaMJLzwJga2pGv16D42D0PUc/O3JpWaydJWiBJbV4CUwwgm2YCeIH+HL6C9
	pcKkEOlXWiH2e/U0Es0rT1DNXnZCV9yZz7Tt9/xRTsMfbkGhXgniiiHmkTSGE7m2WAosJ0CUBf5
	iZJcauDd5KYydthdy6pKC28lJaJ7iF+Ccq6fPfK83Tetkw+S7Aj99WtL4dEdT+Hu/uRWG9yBFH7
	IHwHk+KoTAqW/7s2EsLrmPL/EN3maGZ1KpnER+y/xiKxht6sfsfRABG3sRnkcMxlMzdknHbU59S
	Q==
X-Received: by 2002:a17:90b:3a0e:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b182e107dcmr4309495a91.7.1794472354457;
        Thu, 12 Nov 2026 00:32:34 -0800 (PST)
X-Received: by 2002:a17:90b:3a0e:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b182e107dcmr4309478a91.7.1794472353968;
        Thu, 12 Nov 2026 00:32:33 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:33 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:16 +0530
Subject: [PATCH ath-next 02/15] wifi: ath12k: refactor PCI window selection
 to per-device layout
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-2-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: SLXG-z5fG9mJ2WA2TLXE9TdrjGFnpCOv
X-Proofpoint-GUID: SLXG-z5fG9mJ2WA2TLXE9TdrjGFnpCOv
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af579a3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=q29P064VQn8vs10FsBsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX3aalzFNNPGtq
 DjSrTFsxIC3zTdSy+qdtZ9lHfN8W140xUKrGd4XcRyK0FLeI0YojREsFT4dhW3K7VVSpx+7E5XM
 NlQxi7p9/V7R/QkWleRPmrxNYc+Kyxk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXxQ3qPgbvv3GK
 R5Ryf8NGthioVwm9PMMM+TMWC83UoVga3FRTKJ5/yI7vvp5pXLGAhGQvYYiCGkuDnz3kKTvvXiT
 bDQl2/i4LRGZiDnFm+U1XB0XGoWQOwI3C2BHaKDqBxj9xbd1/JFB4pZXLLg6Bktubg3nOw/+a6h
 fIX1m/QX5dh3yorpEsjvPTQqBqp8GWW7DVTl2JO+gb0h1k6skcmky9vTXFt1JkSrV5UukQ64yle
 HNQxjWvBXCw39Z07Py52gchJaDjfWxpxjl9FE3GztH0Y9msnqBDOBC4mPWjXHyxnVKCmE6lonUQ
 9h3fZYz2FC4Le8U5iI6dZVn+RT1rVM4hjIr1MljSTdCfkEFQPNbAtPsM5h24dyDru3pWKy/eLv2
 YqVqtoCrPKIk67F0fDtE/6G1y/d+DmVY+t232K5RGneeyrOxTLf1Q3pWJ/4MownwthfFYx10OKo
 EHyQ+fIvmQO1Xldsvqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033

ath12k currently assumes a fixed PCI/AHB window layout with value bits
[24:19], CE shift 6, and UMAC shift 12. Those values match Wi-Fi 7, but
QCN9575 uses a different window field and shift layout. With fixed
values, ath12k programs an incorrect window and breaks register access.

Move window layout parameters into struct ath12k_pci_reg_base and
struct ath12k_ahb_reg_base, and use them in ath12k_pci_select_window(),
ath12k_pci_select_static_window(), ath12k_pcic_config_static_window(),
and ath12k_pcic_select_static_window(). Set the Wi-Fi 7 values in
ath12k_wifi7_reg_base and ath12k_wifi7_ahb_reg_base so each device
family provides its own window mapping for both the PCI and AHB bus
paths. Move the window register address into struct ath12k_ahb as
window_reg_addr, mirroring the existing per-device window_reg_addr in
struct ath12k_pci. Replace the open-coded u32_get_bits() calls that
assumed the fixed WINDOW_VALUE_MASK constant with field_get() and
field_prep() using the per-device masks. Remove the now-unused
WINDOW_VALUE_MASK and WINDOW_STATIC_MASK constants from the common
pci.h and move the Wi-Fi 7 window constants into wifi7/pci.h.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.h       |  6 ++++++
 drivers/net/wireless/ath/ath12k/pci.c       | 15 +++++++++------
 drivers/net/wireless/ath/ath12k/pci.h       |  8 ++++----
 drivers/net/wireless/ath/ath12k/pcic.c      | 22 ++++++++++++++--------
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c |  6 ++++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c |  4 ++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.h |  8 ++++++++
 7 files changed, 51 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index 373dc3b92728..712fddb03f6a 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -14,6 +14,10 @@
 struct ath12k_ahb_reg_base {
 	u32 umac_base;
 	u32 ce_reg_base;
+	u32 window_value_mask;
+	u32 window_static_mask;
+	u32 ce_window_mask;
+	u32 umac_window_mask;
 };
 
 #define ATH12K_AHB_RECOVERY_TIMEOUT (3 * HZ)
@@ -111,6 +115,8 @@ struct ath12k_ahb {
 	bool supports_multipd;
 	u32 static_window_reg;
 	const struct ath12k_ahb_reg_base *reg_base;
+
+	u32 window_reg_addr;
 };
 
 struct ath12k_ahb_driver {
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 4bb14a95aec9..6617440954b1 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -125,14 +125,15 @@ static const char *irq_name[ATH12K_IRQ_NUM_MAX] = {
 static void ath12k_pci_select_window(struct ath12k_pci *ab_pci, u32 offset)
 {
 	struct ath12k_base *ab = ab_pci->ab;
-
-	u32 window = u32_get_bits(offset, WINDOW_VALUE_MASK);
 	u32 static_window;
+	u32 window;
 
 	lockdep_assert_held(&ab_pci->window_lock);
 
+	window = field_get(ab_pci->reg_base->window_value_mask, offset);
+
 	/* Preserve the static window configuration and reset only dynamic window */
-	static_window = ab_pci->register_window & WINDOW_STATIC_MASK;
+	static_window = ab_pci->register_window & ab_pci->reg_base->window_static_mask;
 	window |= static_window;
 
 	if (window != ab_pci->register_window) {
@@ -145,13 +146,15 @@ static void ath12k_pci_select_window(struct ath12k_pci *ab_pci, u32 offset)
 
 static void ath12k_pci_select_static_window(struct ath12k_pci *ab_pci)
 {
+	const struct ath12k_pci_reg_base *reg_base = ab_pci->reg_base;
 	u32 umac_window;
 	u32 ce_window;
 	u32 window;
 
-	umac_window = u32_get_bits(ab_pci->reg_base->umac_base, WINDOW_VALUE_MASK);
-	ce_window = u32_get_bits(ab_pci->reg_base->ce_reg_base, WINDOW_VALUE_MASK);
-	window = (umac_window << 12) | (ce_window << 6);
+	umac_window = field_get(reg_base->window_value_mask, reg_base->umac_base);
+	ce_window = field_get(reg_base->window_value_mask, reg_base->ce_reg_base);
+	window = field_prep(reg_base->umac_window_mask, umac_window) |
+		 field_prep(reg_base->ce_window_mask, ce_window);
 
 	spin_lock_bh(&ab_pci->window_lock);
 	ab_pci->register_window = window;
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 55cc875f9ce0..62b72558c0e2 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -77,12 +77,8 @@
 #define QRTR_PCI_BUS_NUMBER_MASK	GENMASK(3, 0)
 
 #define WINDOW_ENABLE_BIT		0x40000000
-#define WINDOW_REG_ADDRESS		0x310c
-#define WINDOW_REG_ADDRESS_QCC2072	0x3278
-#define WINDOW_VALUE_MASK		GENMASK(24, 19)
 #define WINDOW_START			0x80000
 #define WINDOW_RANGE_MASK		GENMASK(18, 0)
-#define WINDOW_STATIC_MASK		GENMASK(31, 6)
 
 struct ath12k_msi_user {
 	const char *name;
@@ -118,6 +114,10 @@ struct ath12k_pci_device_family_ops {
 struct ath12k_pci_reg_base {
 	u32 umac_base;
 	u32 ce_reg_base;
+	u32 window_value_mask;
+	u32 window_static_mask;
+	u32 ce_window_mask;
+	u32 umac_window_mask;
 };
 
 struct ath12k_pci {
diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
index b6d306fd3b99..cd04b9531d91 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.c
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -15,13 +15,19 @@
 void ath12k_pcic_config_static_window(struct ath12k_base *ab)
 {
 	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
-	u32 umac_window = u32_get_bits(ab_ahb->reg_base->umac_base, WINDOW_VALUE_MASK);
-	u32 ce_window = u32_get_bits(ab_ahb->reg_base->ce_reg_base, WINDOW_VALUE_MASK);
+	const struct ath12k_ahb_reg_base *reg_base;
+	u32 umac_window;
+	u32 ce_window;
 	u32 window;
 
-	window = (umac_window << 12) | (ce_window << 6);
-	writel_relaxed(WINDOW_ENABLE_BIT | window, ab->mem + WINDOW_REG_ADDRESS);
-	ab_ahb->static_window_reg = readl_relaxed(ab->mem + WINDOW_REG_ADDRESS);
+	reg_base = ab_ahb->reg_base;
+	umac_window = field_get(reg_base->window_value_mask, reg_base->umac_base);
+	ce_window = field_get(reg_base->window_value_mask, reg_base->ce_reg_base);
+	window = field_prep(reg_base->umac_window_mask, umac_window) |
+		 field_prep(reg_base->ce_window_mask, ce_window);
+
+	writel_relaxed(WINDOW_ENABLE_BIT | window, ab->mem + ab_ahb->window_reg_addr);
+	ab_ahb->static_window_reg = readl_relaxed(ab->mem + ab_ahb->window_reg_addr);
 }
 
 static int ath12k_pcic_select_static_window(struct ath12k_base *ab, u32 addr)
@@ -32,7 +38,7 @@ static int ath12k_pcic_select_static_window(struct ath12k_base *ab, u32 addr)
 	const int max_retries = 10;
 	int i;
 
-	window_bits = u32_get_bits(addr, WINDOW_VALUE_MASK);
+	window_bits = field_get(ab_ahb->reg_base->window_value_mask, addr);
 
 	/* Update window bits [5:0], preserving other bits */
 	new_window = u32_replace_bits(ab_ahb->static_window_reg, window_bits, 0x3f);
@@ -41,11 +47,11 @@ static int ath12k_pcic_select_static_window(struct ath12k_base *ab, u32 addr)
 		return 0;
 
 	reg_value = WINDOW_ENABLE_BIT | new_window;
-	writel_relaxed(reg_value, ab->mem + WINDOW_REG_ADDRESS);
+	writel_relaxed(reg_value, ab->mem + ab_ahb->window_reg_addr);
 
 	/* Wait for the write to take effect */
 	for (i = 0; i < max_retries; i++) {
-		if (readl_relaxed(ab->mem + WINDOW_REG_ADDRESS) == reg_value) {
+		if (readl_relaxed(ab->mem + ab_ahb->window_reg_addr) == reg_value) {
 			ab_ahb->static_window_reg = reg_value;
 			return 0;
 		}
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index ae5380eb6f8f..8552f403864e 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -15,6 +15,7 @@
 #include "dp.h"
 #include "core.h"
 #include "hal.h"
+#include "pci.h"
 
 static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
 	{ .io_start = 0x0c000000, .upd_id = ATH12K_AHB_USERPD_ID_0 },
@@ -91,6 +92,7 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EOPNOTSUPP;
 
+	ab_ahb->window_reg_addr = WINDOW_REG_ADDRESS;
 	ab->target_mem_mode = ATH12K_QMI_MEMORY_MODE_DEFAULT;
 	ab->hw_rev = desc->hw_rev;
 	ab->hif.ops = desc->ops;
@@ -112,6 +114,10 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 static const struct ath12k_ahb_reg_base ath12k_wifi7_ahb_reg_base = {
 	.umac_base = HAL_SEQ_WCSS_UMAC_OFFSET,
 	.ce_reg_base = HAL_CE_WFSS_CE_REG_BASE,
+	.window_value_mask = WINDOW_VALUE_MASK,
+	.window_static_mask = WINDOW_STATIC_MASK,
+	.ce_window_mask = CE_WINDOW_MASK,
+	.umac_window_mask = UMAC_WINDOW_MASK,
 };
 
 static struct ath12k_ahb_driver ath12k_wifi7_ahb_driver = {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.c b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
index 783c5d020f07..6dc674e045be 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
@@ -167,6 +167,10 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 static const struct ath12k_pci_reg_base ath12k_wifi7_reg_base = {
 	.umac_base = HAL_SEQ_WCSS_UMAC_OFFSET,
 	.ce_reg_base = HAL_CE_WFSS_CE_REG_BASE,
+	.window_value_mask = WINDOW_VALUE_MASK,
+	.window_static_mask = WINDOW_STATIC_MASK,
+	.ce_window_mask = CE_WINDOW_MASK,
+	.umac_window_mask = UMAC_WINDOW_MASK,
 };
 
 static struct ath12k_pci_driver ath12k_wifi7_pci_driver = {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.h b/drivers/net/wireless/ath/ath12k/wifi7/pci.h
index 662a8bab0ce7..1017975b4c9f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.h
@@ -6,6 +6,14 @@
 #ifndef ATH12K_PCI_WIFI7_H
 #define ATH12K_PCI_WIFI7_H
 
+#define WINDOW_REG_ADDRESS		0x310c
+#define WINDOW_REG_ADDRESS_QCC2072	0x3278
+
+#define WINDOW_VALUE_MASK		GENMASK(24, 19)
+#define WINDOW_STATIC_MASK		GENMASK(31, 6)
+#define CE_WINDOW_MASK			GENMASK(11, 6)
+#define UMAC_WINDOW_MASK		GENMASK(17, 12)
+
 int ath12k_wifi7_pci_init(void);
 void ath12k_wifi7_pci_exit(void);
 

-- 
2.34.1

