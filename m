Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482800;
	b=pNMHkKo91Zx4hH/vR7AYVNxb/x4MyH7ZnBB265rVAGfQw/TgYp6Ce7dVERaGsTfJFGFb
	 1r5r1RMuosOx41T4eL6VhiJXfsjjJoGAhGtJ2Zi1zcpI3cqR/r/ab6EORmFVNXNSBmyjG
	 tpqePdSAGjY365FoGEJSDZz5etlXtba3ut0vFpQ+adGc1dT71kKHliz9akmIqU3ftl7/U
	 5fljz/RI/KkoKjrvYi4Fwu5jl6/6X4eaF9EW1f6Y4Ub5lYiBpLJWvQ/INIC2VN8yN518U
	 PW11JQcVWTeDNH0a/L7KOlBmBRvixzPawO75D3ucrwo9L3whn1Ym/Elz8lfUMjhXlLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mc+ENi/MTeqPiXtu65VXrE1ZIUhkEL9j3kp6fXkHeiw=;
	b=eC4Dr7ebi3wkmTCdqNmpev5A/XB/IkB6aeWPOpJxtPc3JW6PKllj794favWqWr6JT2rS
	 PeIpTFnbD7sF2+oKdCbfBUrofbcpAJAc662o5ZRAynYWq5cKUU2BUoF0JS7APJRbr32aO
	 X682Pd3XEZoDBUL6Jj+JVYRyax5ui+Zf12zRdDoqa6k+2y+JsKODPl3gZR/05Rsp1juCm
	 aXqulEHj0xE6XwPQhzCLo3moGG3YijtI9LLlyvyStRavRS6jK2BsSN9PrXI1TDHLzE/NV
	 ojDSD7XVHyBMqXWbAg0U/81SpgWy8KBFNXYfBsUnlO/WOrfZ6MZ+a9NhZ6t9yJUaKnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b339ZTnc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MAh9HRz9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07C760A3830
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E07C760A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b339ZTnc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MAh9HRz9
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7iuXo126100
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mc+ENi/MTeqPiXtu65VXrE1ZIUhkEL9j3kp6fXkHeiw=; b=b339ZTncpo+HQRv9
	J53v0AU0ZcIZC1XgpduaVcCKcdlcZZG04lZ7NGz1hK6WqyQ6aQP+v5RbokU089cl
	seqb+9zLVStKQJnqWIV+JI6z2aP2LGwoYgOgFUj92Jq1/mYuzx0CnBz/3z0EcIky
	hQePIYFvzgEv/bs4uGk+lamJWrsnvKI9BuyJPfCT0lclm0nkq2y9lEEvD9OKftQc
	wra243Op9X3HQkcdT5z+LMMoURVX+cBEx6DxZsyupFu6trCRVSdXMU+vc09RfoZI
	NXwHKsp3eb1rop6GRNhj7I0MwIty0T6tauJ1R9jTlOzPjeQc3KDphKXpmp1Okw/k
	jXpHBQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a08shw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso2278962eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482798; x=1795087598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mc+ENi/MTeqPiXtu65VXrE1ZIUhkEL9j3kp6fXkHeiw=;
        b=MAh9HRz9w/jUSxipfHHiesrQNU7Td1ZyLwXgJIMgATtbAuNjGSntVqo3LBhvzdrpa3
         HAWbApNqHTUfNn41P/jD2I+NKPTYcu5Qq3G27+wPUIwOc/yGBBg9PXb9b8AcuIpHzJxR
         QaM9per3JxILZvTbRIJ5uYiMAWgE6P9r+SNXDdHNFo3l/tD4L5LAuWA3s9ntBU1Is0H/
         JztCDsp5mx6l0Fr60HSFSuZeaNNnFkVCZUVTs4cRVT9DxnQei62u8UkqaxYhBdVTw+Qa
         jUVzm1feKD6Qnhmz1lCD2cma1xjMOymxNqvwQe9cy4PlIihxaKWE6BpeTyaFDFBdEpni
         HYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482798; x=1795087598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mc+ENi/MTeqPiXtu65VXrE1ZIUhkEL9j3kp6fXkHeiw=;
        b=fnfkTomFOl//dlbgA78ITeLsivDA/GpvPfHBhYMnlszLAkCbOTruIpHDCCV1aABdv6
         dibmFV+Sr81Nb92T5sf3mnfT3U0n2tW8+pHrnIPnvBUWLylZqWP7z+wLmjQYE6ofNbuK
         3gt68XRBcBGqjpBZ2NONkiG+mBP3AngNyyliDC/y3aNNrQfIofeL/6hwIaDFHSBE+Ehg
         qWBdodKFe35aX0F2YYDO1FQOwGWeLMCGLChCCwZsrfHy3ZcUIFbeXsemVF24ogUaIzcA
         SwGJt9cXa9dMp5bBK+UK1RU67NTnDCFg3JM464KgPPyMDtThC2RnvBRavQk0OCkrth7c
         4Cow==
X-Forwarded-Encrypted: i=1; AL+hErGFIc7+UN+lqNEF1j/fpsS2Rt2XD9SJDjtM0gust8Ot5f63rB6pLKIZ1ZLznTHApwSW46KhJ0KI1AedXwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9r2T/HtZCe3C31SAuB9J4uUgsiySoLmFjoPwZThK2UahVxQeC
	jDQtm5duRegcz5rWa41elSHso7fg/9z2dHO0XTBFgLSANPz+eXDgWvUru53Ue1e7l02bzpMEoz9
	yYVZaJmhjkrZgh/pZcXmExtWB/8Dthe5LIkTdg/a1xaBR4ivaD9XZwCjL0Ldw59fVA94=
X-Gm-Gg: AYBFou2ibgTpO2sXGYKEwyJ4MYlfJ2h4JKSlHvFtupNWwkr2mo/eRa/5+734DSrw0Sy
	3rq2RZ7M4kRgBqAaUX08ggJJ1xg1fP44gFmROdTnjwWxYGesKmBBPqW8Yn0vXHATcka6ARMgoqF
	0kxbcYB7UbFtQQa7wZNyGYtCoB3XYCF2PmswmUXV+TyZJhx74acOQ2ZF/8vFvzQhk2hBAvC2HsQ
	bDYfMte0I5I8we7f3y4F/hd7cmXlDffETHvbogjA/hT4oatcpKMvv3ObYs7g6aCLRhEd/gSsShi
	0103+YszJcjoppe+HrSdUFlXfuFzdAYvj2N17VYz2MK3OV9noO/l59eKfgSZtA+u5gg7Z1YNm28
	lEVRjdLmIrvHf3H12sMntIWskMHhOwvTLBuxgWXI5HI5JVAMVi+cQ9LOklwCg4Jt6gNF39T6tMN
	8UDnqZmeDWG4bSAuynzEpLqqoP
X-Received: by 2002:a05:7301:2424:b0:36a:1489:fdf6 with SMTP id 5a478bee46e88-376851ce3b7mr5987898eec.11.1794482797668;
        Thu, 12 Nov 2026 03:26:37 -0800 (PST)
X-Received: by 2002:a05:7301:2424:b0:36a:1489:fdf6 with SMTP id 5a478bee46e88-376851ce3b7mr5987859eec.11.1794482796989;
        Thu, 12 Nov 2026 03:26:36 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:36 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:07 -0800
Subject: [PATCH ath-next v3 08/10] wifi: ath10k: trigger recovery on
 corrupted HTC bundle lookahead
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
Message-Id: <20261112-10k-sdio-crash-v3-8-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=2516;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=fsIi1wDRKBpErglutX/2tf+wxeQ+MsUAjY482x6TBZ0=;
 b=L8F4BBjI5oGSYV64y89lnThhjuR+8x7M4gCTctaO2sWkD5L7B2FTLoU08HZQgcC0tC73IzxnB
 VrWBzCIxwajCy2omj11StHaogtB29+lSMYn2RChW2CzJ1JlwaV/ZFxI
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-GUID: ovg9poPJgI4XLwEuaX6J39-cvKbhhMt-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX6XEZfJkQ60nL
 M7uK08A8JQXXD+o8BaXLzHLVjGKIwASqeFiT7WJYJlOk/L8xKYi/ufksCWR3Z77gX9cf3ixPZjj
 X5mIz+a1SibpLoeAZja7x0IRwJu8FZViqiGByzfea2FcYa/LUA7kFDYcL4an69ggqNID/ACBfdb
 LB9LprSOq33Hop9Ul3ZPu+IjCYBQoKcXlZCyKVUSsiNzzJiiPAOM/KjKuulK7QnoP92M5mPiqwO
 /SQGQPXm+nwopZhYXQh25Fvw5LN8wOV4QUQ8+c7u+WHF7A+UGGSRsaUwoAZzo0UDiUwI0ThqhPN
 Vrd32eMZkvBuThfb9F2gEPwhgSyXL3kOgvYFN7l9/TWcnBkmnjkt+nkNPeUV+cjh0Rw2A8y8xXc
 p17YROA0BYJrblMGpbaTr+98hMYfuWp0mcx7Ywa3Nk2ZVJp+t0OYnt9YuCf+KQRqsefpzwJH0Xn
 5ShvRNSW29JqMmkxDAA==
X-Proofpoint-ORIG-GUID: ovg9poPJgI4XLwEuaX6J39-cvKbhhMt-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX1Hyc3EEK1Xsl
 w9T9UGV07fK61lMw4g2Y1cvr94deY/sce2z2IvXhzLclOPJagk4Ucqebo74X0E+dvW1eIdzipz2
 6bS2pfmZF7QCrMmkRFlcvelveVcyeOo=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5a26e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1mh0D3slpp6jLL18LmcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045

When firmware crashes, the SDIO interrupt handler may read a
corrupted RX lookahead whose header reports more messages than
ar->htc.max_msgs_per_htc_bundle. The driver then prints errors such
as:

  HTC bundle length 2322 exceeds maximum 32
  failed to allocate a bundle: -12
  failed to get pending recv messages: -12
  failed to process pending SDIO interrupts: -12

The handler returns -ENOMEM without consuming the mailbox lookahead
or checking the firmware-crash CPU interrupt. The SDIO interrupt
therefore remains asserted and ath10k_sdio_irq_handler() repeatedly
processes the same invalid lookahead.

Stress-test logs show that this interrupt storm can continue for
15 to 20 seconds before the firmware watchdog allows the crash
interrupt to be observed and recovery to start. RX remains stalled
and user traffic times out during this interval.

ath10k_sdio_mbox_rx_alloc() already triggers recovery when the
lookahead payload length exceeds ATH10K_HTC_MBOX_MAX_PAYLOAD_LENGTH.
A bundle count above max_msgs_per_htc_bundle is the same class of
corrupted lookahead.

Mask the target interrupts immediately when the invalid bundle count
is detected, then start recovery so the HIF is reinitialized instead
of waiting for the firmware watchdog.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 748ba6749339..fdf19ce4b55b 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -497,6 +497,8 @@ static int ath10k_sdio_mbox_rx_process_packets(struct ath10k *ar,
 	return ret;
 }
 
+static int ath10k_sdio_disable_intrs(struct ath10k *ar);
+
 static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
 					 struct ath10k_sdio_rx_data *rx_pkts,
 					 struct ath10k_htc_hdr *htc_hdr,
@@ -513,6 +515,11 @@ static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
 			    "HTC bundle length %u exceeds maximum %u\n",
 			    le16_to_cpu(htc_hdr->len),
 			    max_msgs);
+		ath10k_core_start_recovery(ar);
+		/* Recovery is a no-op if already pending, so also mask the
+		 * target interrupts to stop the IRQ storm.
+		 */
+		ath10k_sdio_disable_intrs(ar);
 		return -ENOMEM;
 	}
 

-- 
2.34.1

