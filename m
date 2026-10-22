Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646772;
	b=WxTiXmSTgw99flA+/l3s3dQlSmPFyLCsZusYFz+aO95VALe/52lZ/XoJqLcT3kCndwW+
	 Be9jipBXdCug9lNd1Wr4Wxg2k4d5huI762zYyYu09WsHoN2gU1h4Ho21lElLEXqfXmAeC
	 HCBKV+HYAhUV5WKlacWiWZfSNkVTRikM0hz1NKVFRZvqBCqmj+kSG/Dn50Tu8CILo/142
	 ppQVPwbI42kWsAmZw9ZjcB9kwjooWACqoaXwTSU0EViI6yhaSUtX6vzah0AABAG47ubc+
	 +49C06iw6TZrynDCdTwxoyvpZe1apPbX2f1l8E6hB/Nv1oXGBAqJkqyCkmzdLG/pc0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8WUSu9jHfJjQNLjh87SGdnRz9GLn8vfDbjf0BBTOZC0=;
	b=T2Brr4gfGNqDFBE3KUxr1Ssdya8c4UrAwKIx3iNYlnIlE7toNfk0EjB+N+CAqn3fuaBA
	 4SLEFOfNZ2d5PTGmjA+15HWyfxCwn8Q6iriwFGZhl7EaDpsPSRrF5rysxDkDZtuq59C/K
	 n1VJakaSPcDgWgOmt1rzJUnGrChqXUVbbB47FiylaStLHj3LrYkXdAyX4QNSdlu/pPNSV
	 ydYU0inZcM1oP9S1KHnLK1kR4Pnern4NLZ8WQQa5j5wQoGgc5dfyNSRDLrbpogKiXt37I
	 yS/wt8LMLpIZzXzIiBgxc23+OgjivyJit30crp50Ic+MRwiZBgWlLVJAkFI3wJAJ7CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ho21eM/R";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=avMdBOEs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC626606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC626606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ho21eM/R;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=avMdBOEs
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M3ipcS3687246
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8WUSu9jHfJjQNLjh87SGdnRz9GLn8vfDbjf
	0BBTOZC0=; b=ho21eM/RF2GQxw+wgPPP00pTKtereiQl87EvIMKClyx/O07tkeq
	cimXScVP6TSWCdB0ltAj1PKhopgvaSW9SIC5QZD09HkRWWajkqORMNhyUwIZnxg6
	6IthuMFftpmYQLIfQFCCNPVzNVan6b1/z1gHjbGpY6VnbdmkAVpRXsFTxNPKK0Xo
	qfVFmQwPZXN5YLEslWXu1O0dlssoSSeEVvxfeItkWRdpHvz3UJR9GpL/euyB5SWp
	9e8kfW9aKWuJCEiSuD3oYAfQb88H+iJNVVwWtgrrO8oMeQOy9Fq1CzHDBPiFZ8xI
	KeRuInUewnpC45d0moTmJg8YCRGaL0TP/Dw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93agttv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:26:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso783750a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792646770; x=1793251570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8WUSu9jHfJjQNLjh87SGdnRz9GLn8vfDbjf0BBTOZC0=;
        b=avMdBOEsOa+nnmFV5tg5xcsinOw6tByi8PJqMNI0GMvLPKhRMNyisdfh5xYjBwhTsa
         dG1dA5MWME0eeAH/WdPL6D6lO4Abxnas/kQXrH/TyHDy3SV8Xw5wLIpGW4SJPcHt4ffQ
         1S4+L7OSK455S+fVjn+vP7Fn3DBTxmZncecBTJ5RYwAKwkN5q8Spnk61GDjcAVBZ7DQ/
         L5S0enOGvMT5fVV+hlhEEYQU9NLwnhfT1m47gAPlQeGIIRaQPoYpnlpUMPfY+3kK/SLf
         Wdz/r7ZhKvSKNa0R0IIi/E73NuhtNYtjoMLeKTJM2nE8ncq4EBlyoGBM1kO73+3NGlm0
         yadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646770; x=1793251570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8WUSu9jHfJjQNLjh87SGdnRz9GLn8vfDbjf0BBTOZC0=;
        b=LIys68xjdhUHdGmmvDmyyLVlBYlj3qSQD+yyv6EOo7LUbdUKTluUW1rhtezsgO7tB8
         lc0M5xFeGFuEybDuOUIBu6hoi8Z5jvwmJSUn7YzMXDX5ZIdI4urKSAAvcqPlPAYHisjb
         hQd5lrt1lgfH+nlN+G975pgJrVpKjss4ydmWk52UqeCfAoKeJvU2YXCh0rqh8R2+U4fc
         +xWZsmyhLgPe9B0TtANCdqoDdD/UhAETNfldxZG+XW6IlHE+a5vwWgBxghWb+/6WHFf/
         KXOW8bqGZv0U3FLeP8mysme9wISlQ4x1rI4ZzIQmKci3R0CnvHl89oAL9jHUIuM68nT7
         fRZg==
X-Forwarded-Encrypted: i=1; AKwUvBzelmw5BMLKJBPHqR00XBgXbGcNmFq9ZVH33/AQllXlwtfFRRbSu2s83oSDKaTXyRsSB+a8k6deqr439bQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0XVwacg0D59CpVuLmKiXznh6s09ZtM4wrMf0QTk0ppJwcwIE2
	vPLiKMyRAfeyxVBbwbbq7lefr1wy2AaQKFvxQrPPySeutl8rh8UQxLp8J40aYFQ5zBMFnDpCAMA
	vo3uqFRZytqtEDzhYCW5OdPl+TOGcY7wcxQYPm0EpZSBV0xQAFF7Z1owePasvhahqQZ8=
X-Gm-Gg: AYBFou196lc9+j7SmT7JtQ/GopaAxjUZAbvNEOJLORNQDITqJL/3lNwXvqyi7EwXLkh
	KBNoypA3MwSmNrq3hOaD/Cy40rOlVYkwgmhtxSz3vR2LZCojBLonrBPe7iK9cMw+y9l2uApTM5q
	t4LQVsynvfWIoYaBjWi5c+d8A8jOiqsFpYjd8qkQkzYmrxbCj1eQZQlNwWEi9zYMFV+/zQ1hv2O
	6b1ZW7jRfcduPoeQOjgSAvKyZt2hZOovHoBJh1X4inmXvzX5L8+pCdCpcnCQa6AqIJp6Hb/uRnM
	LIP6P0l1gdN5VPP5We+I6eAcV+0fZbJpHEylXVG6qZK4IfGVv/HQM4NHvVenvE5AweTGDPNa7SX
	AK6XVRoD0rwmTgn8NCg4Tmt7ff3O4
X-Received: by 2002:a17:90a:f013:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3ada6c56e62mr550543a91.5.1792646770363;
        Wed, 21 Oct 2026 22:26:10 -0700 (PDT)
X-Received: by 2002:a17:90a:f013:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3ada6c56e62mr550540a91.5.1792646769887;
        Wed, 21 Oct 2026 22:26:09 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48ed74bsm2375149a91.3.2026.10.21.22.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 22:26:09 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v3] usb: dwc3: qcom: check for hcd in dwc3_qcom_read_usb2_speed
Date: Thu, 22 Oct 2026 10:56:02 +0530
Message-Id: <20261022052602.2335652-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAyMSBTYWx0ZWRfX945ij0n7am72
 DOF9pIdm45GZ1nf7adrl5pfZtzp2+exDWstn4LyuvW43LrPfz69BlD+U/HHMKgpK3phLlmZNDLQ
 u4Cwj9hzInN2wg/rUYaHkUeihHg7in6WiszzERZz+a4ZxBbfcixo2e2hzPQ+8K7TGxXqrP5iDLr
 AlnGlkk09JNnuFyEnnX+bx8GGzLds+oRf63DMATTKXO3Wx4h26IunsgRhWX5OFUBwgwTDxG4RjJ
 ytg+iMjjpgClnHK8496cXgpIaT8Uwp7VUhzcLRAabJ6qS1OMMoB3HQKjEkxAW8g0cWLm6pTon8A
 /XTESe7/miLO2mJi61PHKzmuBALP3SX+WHXv/vSzLJ037fVb667tmS7qDXne96iPxMEYty4CoR8
 8JuSfv09UpcPhdXlEXGuUxc5Xxx6RPyBkd6TBtUZKq/WcFVeB71/c7+tDo8lgIfmqO4buQs9dF0
 G5P45SYz69cq15uyrWQ==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad99e73 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=87Qc2ugH92rl6A7fmoUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: aPIoZ4e65vHGz-lulC3X6VvyqsNdQtLW
X-Proofpoint-GUID: aPIoZ4e65vHGz-lulC3X6VvyqsNdQtLW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAyMSBTYWx0ZWRfXytxTHL5V5wXf
 jupclQy+ajXuDe3nOQ2rITNCIF1WsThYC4gP7CR+tNiuRYqwtMZy4dvxWQsCgs5mIgXP/PqDsUx
 wM8+8B70VBWQa86MWoXrPltW0rMBLvY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220021

Currently dwc->xhci is not cleared if xhci_plat_probe() fails. During
system suspend, dwc3_qcom_read_usb2_speed() checks dwc->xhci and assumes
xhci is initialised. Since the probe failed, hcd will be null, and the
subsequent access results in a NULL pointer dereference

Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000058

Call trace:
  dwc3_qcom_pm_suspend
  dpm_run_callback
  device_suspend
  dpm_suspend
  dpm_suspend_start
  suspend_devices_and_enter
  pm_suspend

Explicitly check the hcd pointer in dwc3_qcom_read_usb2_speed
before accessing it.

Fixes: 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during suspend")
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
Changes in v3: 
 - Initialised udev to null, as suggested by sashiko bot.
 - Link to v2: https://lore.kernel.org/all/20261022044748.2303528-1-prashanth.k@oss.qualcomm.com/ 

Changes in v2:
 - Added null pointer check in dwc3-qcom.c instead of marking xhci as null in host.c
 - Link to v1: https://lore.kernel.org/all/20261014105711.1708244-1-prashanth.k@oss.qualcomm.com

 drivers/usb/dwc3/dwc3-qcom.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..e4bf0d5fc9f1 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -231,7 +231,7 @@ static bool dwc3_qcom_is_host(struct dwc3_qcom *qcom)
 
 static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, int port_index)
 {
-	struct usb_device *udev;
+	struct usb_device *udev = NULL;
 	struct usb_hcd __maybe_unused *hcd;
 	struct dwc3 *dwc = &qcom->dwc;
 
@@ -241,9 +241,8 @@ static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, i
 	hcd = platform_get_drvdata(dwc->xhci);
 
 #ifdef CONFIG_USB
-	udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
-#else
-	udev = NULL;
+	if (hcd)
+		udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
 #endif
 	if (!udev)
 		return USB_SPEED_UNKNOWN;
-- 
2.34.1

