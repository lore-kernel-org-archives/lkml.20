Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942175;
	b=bH3Xqpaiqj1afYwYLrbMez8hkU3K8V8ANbQMQcJKNEBaWBSeZaLRU8/1p85F4haoRpFd
	 pR/cvxckxFl0wGyhXiWn7oW4LKh7yB82U2GrMyWknWRRyJldnEbUAj8sdZVGl1zjSbhyp
	 j7fPjaSFS5JputRXvbFfM309wAkafe+6gQbm1HK0c6xIbjioFYta6+h6re2sgDpNNtltR
	 SmE6Apr665xa7cf639KJ+6XSR60moApnN45ibk0vKc1OufOB/xinLLFUKPLaM1Jgnz3Ad
	 Na7FcN08HzMD4b44jrKVwhN4UcsLJgFvdaMGDHygkVgQJvqYIOri1O1VVaaYdIgK5og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/o0vVV/A4YxXprKeLcO1BEUKd42fcBI+y2LEaNy5bUs=;
	b=0qJPDCKix8tAHBnLGJ4dFGtyGLNAZw1nhfCRf3fo+xEz+aJ1VDqD93e+l/gYlLGyUzdL
	 dakEYxUXwB+7UrSBDEj9i7sDtgjBkyswT96hmQvZhe3QKNrsKMr3UusUtUOWL3rR3FCPj
	 xChjbEmv4XYqLVkdcAOpBLoM716e4cCqeUynL237bDY0NqwlIiY54pXQIE5/bz+uZbqzq
	 aNabHeuVHsu+oBA02Y+ARPgS9RTmANFBfT4TH1O4yuR0mKVznprpJFbulRqK1Wj6Wb9ZA
	 gKUBDC5YYeHsl/mGv0HuQhidVpSbma4wqcFyVDRUxpPSkAy0unjCoCzBOLVfelS8jEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RiPmrBYn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T866JMLL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7C6606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D7C6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RiPmrBYn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T866JMLL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A640ptn3418991
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 05:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/o0vVV/A4YxXprKeLcO1BEUKd42fcBI+y2L
	EaNy5bUs=; b=RiPmrBYnkdrJPqYgiKgTAjRKzmo/xgy85Ym4JLPVNeoMS7yiuVq
	Ei10hHobTXFPvDZPcRuE9ksbP5wDNLEXjjp4XE2PcLCPGKbQTkStfwkkOqjH/87v
	GUDUU2+Dngpv+8E6qYOIquG8+NRGri/mfvLACz1NSR43F2syOsDGyGC0mJe424WW
	yvE4dOq+4rnHNHQhKAZIX4FQKbFRf6APK8/fYfP6vf/6Z82Us16DlN82s0lS7s4m
	QbGKLCWSof9QJQ9rcOJ/3EHq6Ne34MMz8xZjB65m8ewshNRJeQKMn9M6JtThKqK6
	Gfq/DD69p+WHnMZjsWbw8N9EIARYYNAVRYA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb11he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:16:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so514656a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793942172; x=1794546972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/o0vVV/A4YxXprKeLcO1BEUKd42fcBI+y2LEaNy5bUs=;
        b=T866JMLL3OfFf6kJVNkZfwDuJQHnO28fmntHAnbkdJcRkMg5a3anYVwJ+VxTnUPypq
         7stXtfybK+VHKkS3ysJYqX/NHfXjIi8/ze6eg/ywGb12zsuHaUvgcpZq+vrA6+dz67R7
         2N0VciqgI+XdRYxTXm4BVWuqzoQiEFOD4KTAywtUXL1Mqt/Qhj9lmj0GX3ErgQrvjY/P
         7j4mNCa9wjxsaafXNxZ17kOT7hNh68olRapxkMPaqu1UWt26tCaL5UtRqnxB2ZjTovoa
         37mMVJ3PMR4PlE5HoFvYaQ+fvyqbJGNGy7NNrhrWKpOrWxMonEGgOGZbpkrzhOzTmWBs
         5tkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942172; x=1794546972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/o0vVV/A4YxXprKeLcO1BEUKd42fcBI+y2LEaNy5bUs=;
        b=dHFxGerSvY9Np5iAWYEK6PneV0OhqMaJhlTv+tcjIwnvHGfflCuSw90TyupY5mpVaP
         PdU1uxyyiR5GUx0tN6VKL681gs6BpXU4G7Q9618VxRfEYWKkNl3nSbacQec9hPOYbIxt
         xdMN0WT6S8mXdtJWTsaaNg0jW29j1s44vdr9inSPFUtTC39SMd1zsG/aF2AMZYgf7jkX
         cYTlKVMBBzlk8fJXrhb70gg1Uz2oYskO65T4R8M4Yr0y5oDI2fiheT5W9biiITfKN17f
         mvHoUraf8MHH1Nu9BF8RBZ91KHy6hd6ccTQluGoZy2EaC8doiG4OOPNMH6pcg4E5CZyK
         FNlA==
X-Forwarded-Encrypted: i=1; AL+hErEYBYtV5bqroa+JNHv98syxpdoTS1xmhrXxu7G/dAg3IrcZ0tgtcK/sLOXhL5nd9z61Ri5yZxtSYx9zM84=@vger.kernel.org
X-Gm-Message-State: APuU4Z82hQXLQ2/mW6k/zF/lF2ZmWicfLMZKR9jxnPA0lPBjKMlePdJX
	56VxuHG0xl7nehDw4ygdB9Bt6DybglT82ru6WGVcE/f/7HjJPNnUZDtEaKSKnCcMvXsNUCZeCiY
	5axijSPRTTJU5JFbBYA4gHmKcTAPk0ciWVFdw7UNGADNhl5/mzmY0w8Oq2gdWxhNvmtY=
X-Gm-Gg: AYBFou0jEQmqQT+EcNf7e4MAORCKiwzsiSL/5Yb5m3ElQwcCm+Vauesi3r4a3Tr5BKZ
	vPZmU+ZwuHeCb/su334031rW4arriPEE6194CuZFjk7uGvIOLQdpZ+19EVFGjIyaQOuq1QIojKu
	Ms6s0I+ao4jdXqEhgC6wqTsp6pK/hcCwi1GMxPnd+4Xpl1//wfnjj4GKPmzox+r9WmmybfR53SO
	ZGluKDE1KjaiOYUo8KRdZqyly7wwQC1jl8tIX6nbako0CBfzknCCnEI2ATJeb6S/r2w7qtoz5nF
	YhoiXqqs03ig9t5CpwEGPh6HhnyjdUHz3QerwVBvYtxXJ6PurfD+NeznCbmn8oS3RFk+W8GFyVU
	xWaU0XE9tROmdoWR3RbUpLaj+bF93N8pS4bxfqh9ssbYA37OqdwQDcezXiBrVPzcTrtq9bu4ZsF
	2h
X-Received: by 2002:a17:90b:1643:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3b0db714ef4mr1491721a91.62.1793942172120;
        Thu, 05 Nov 2026 21:16:12 -0800 (PST)
X-Received: by 2002:a17:90b:1643:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3b0db714ef4mr1491699a91.62.1793942171657;
        Thu, 05 Nov 2026 21:16:11 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d5d744sm1591075ad.43.2026.11.05.21.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:16:11 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable <stable@kernel.org>,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH RESEND v3] usb: dwc3: qcom: check for hcd in dwc3_qcom_read_usb2_speed
Date: Fri,  6 Nov 2026 10:46:05 +0530
Message-Id: <20261106051605.1398445-1-prashanth.k@oss.qualcomm.com>
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
X-Proofpoint-GUID: 0396BA6KyaANI3rgaLvAcrooE5RirfPB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMCBTYWx0ZWRfX0WvtQeVXnHWY
 ak0OeLxpY9iEdeUJ7fjDmpkJG5hUQiwF4xwXLwhF9xqCbQ5I4ikgSaJdU+O367kUFc2Y6qKyzM4
 4ayIlpBGIV/R8AyqKbKqE1ODTYIKkMw=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aed629d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=87Qc2ugH92rl6A7fmoUA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 0396BA6KyaANI3rgaLvAcrooE5RirfPB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMCBTYWx0ZWRfX1Z922j4vfDFO
 5dvthGvQRtLbUNWXC5uMeIlG1xrsb0uypa0o/FB8Fjhxo6meqE7y/CPmBzvbGcwL25xsfNwVrxs
 HUNcbdU3voc2/2Kqa8ZJ1NjKAvWidW5cyqSK/cj0i6ntkN1yY7aAlnDdDoFnXMjSpwBK4EG0oB1
 qnf8cLw8LRpqtQB7Jvb69yl4JnKdYsUCdL2lc+XQmJrwA9mIw+vhdp6e54DKWikcDYCJdSx/U2V
 PJoq8CtOQ/Ec383TjjIAp6SF/2pw27nYkxJx/T8aVnekXu5J972ZIjCq6iFfAvo1pYQBCb8UarH
 Sl5riui1TNdU3MQwynJx2bTtSk1kri+lwZbZ1oXnYJ+XVG5ShU3oefvp1DkjGV7e4Ga77QrIFPq
 1GwU1IYhqnLLMgEoOxqsZFFXyHyBMLR2w3CjDbHZFCwtE+1DG8W1YfamwrgKJDOK7+KR0MpFPe9
 a5PmgvIPr6rVwCsU/Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060020

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
Cc: stable <stable@kernel.org>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
Resending with Cc stable tag and review tags.

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

