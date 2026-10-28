Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214031;
	b=pJcSzuflFp3+S85300Y8KonZEF0oLVbrJWaGSVgOvKfUC0YOem44j6OThmdGDDslnAAg
	 BSF8voFtgecwzJ/Q0nSAkZMk3YXvh4s08SV1Rx9EjbQO5oL2Er1qyVoV2Tx5xupZjM9s2
	 1cMdSllmkKdxRJ8qm/vd4IHgxArKtfO3DqNCB4oTpurplMbOzUXWXNBpNqvH2wsJ+3ATX
	 gCtwWqx17VyEFsRuWXBgNdmGauwvxU2ReCcwPXlUPhZU7gRrK19HRSBsU27XOLNqNRki8
	 xWszum1tkFppsLU0fDAhH7KN13ohqnCuXo6C3VJk8tP2SDasPXJdcRh7VdeFryoDOgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ihzh9krNeTK98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=;
	b=Ndrku1QG6TMQFYsunw6HCz2AzY6/3NQynqGJkXi+bf/wCDtO+ngwK7SiU6vPjaercsZT
	 cwEUJsMpIh48uMWTn2WSZzXPCbY6tXp0SzXJZVaHxm4HrkK6Af4p2mzcqIlsJH9FnAxoS
	 jWZ4tlBbrc20X5HUDSG0VffbNfnof1Zxzi2LqPahlijSSDEO/rrGwMpARmWS6UpKEeXKh
	 aIcxEiJ7lUEd2GWANPIySKAaVC1hp1KLXD0DooBVaDGYZ/su68a3BFepsb1O85K4lkRLo
	 oDZe88+PhdW8EpjQevDl1mF6wqaF8KAJaYRj2nYtg+k1JE7vUoELR+GzuL1z7ulQhBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J87loaFo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixuuXWe+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32253606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32253606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J87loaFo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixuuXWe+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPiBD400630
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ihzh9krNeTK
	98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=; b=J87loaFooyki6t56M+osl7xd0Nh
	0J7oCPNoLJIdleMrM+mZXByx8GlkLvKz+EQgaQQBroSNN+vh9+9UmMnu4a5zKYHP
	anIYVH7AoqxYaV3Pu4EmPPwrGZVUwIGEjhs0a+eFCQaKEK5Xw+BQjPfSGWgabLX6
	SHKmoho/ynimbeplHzz6B4V4gWHj8Uv9pKQS5dxRwKcSyrKrZUDWKfIZvcbg1VLr
	Au8bjJUg6WWydu90Y2TGfaFnWE9uI0XmiWc6p4W3NxIhrym1lqp4im2O7W8RgleU
	7/W3wB7Qa7PPjfipEaKVbJkLoMwwXRMwgfCWNG0aF8NGU7H+6FlpsAlrJUQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtnhhny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:00:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so4393042eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793214013; x=1793818813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihzh9krNeTK98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=;
        b=ixuuXWe+a/v36SY1H6f+VsmVNlIuo16jnlxGJ6QkBHYYvFAPsYqW5hQ5iVaaLch13L
         6wVRd8kR6HUcN0Slcpw9XQt221knO2eFnGLoHU/t1vWxhMCzdwOqQ2zuIt2jX4Y2Y25c
         TieQ6us5zZMcinDjkS8FBF9CgFAsnOEBZYf1Bc+Vlx2fz83v1RJ7eIlFnWuhqmLCOV7j
         4DV3LdDLpbUsKjX8UY84xoQpJ5ydWa4acRY7oL03mgvW2cyhGXqfC5SGjk+pal6yz7Hx
         tnICGMs2AYsyjZuCAPoqRhkrw6+4TQs5KDMXhkBEnF4RQhLt3LpjMrD2wSOZRP0P8q8x
         0DEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214013; x=1793818813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ihzh9krNeTK98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=;
        b=AdLooJS2w11bEcbZaK/DplsLjQccuxf7aYE7BUMs+pmmZBw1yggaUBIMjyfb8wpvj3
         i/wAQVKevubzxuMpYoioDYYNsjs6Jw1vhTDgcwlRms2LacwrB8GYUpJ/ClMEyrvKKbhv
         sMvndgN9MaBLXNEchicSwp404NMkkKWQv7y7cUEU6xL1ObcyG5xPT5+OHnlPfnb5Bizf
         Xl8OwtfatRYopQnwisCMi94x6e/JQnU2gKOGQnnTKkny266r0bcDxRspfJi+4x3lVIom
         PP3o9XvmAxDWp5eJbId8xSKNhzr4wwylK9L16FloCQLlPvmTDiawevq680oRfbjePpvp
         8wsw==
X-Forwarded-Encrypted: i=1; AKwUvBzqkKGQTUICBMnTI3QetQq4pVKYvAmuBNr+Nv8EywLvzHX6ur8TuHvBnUCFkLyCvYnq/c/ZpZzDgWPQKcI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3DZZJW35DVO7Quujp0EKBw8ry30EMjD9gYS2tSncj7fjd7rr3
	Nn1KeFBTb6tWurMzzRkG/jEYotxrEFwDh8A7+A+tr7tIN5hDkaDwgHFJV07gj+ijfzgLtZQHXaQ
	bd3/4OAAbUDEwNi/gMTfyvpgyAeNRQ+itT0uPoDarxFe0M/GlSmTj4n6j2vPGnMDYJjU=
X-Gm-Gg: AYBFou3mBVfUNjHcdr4TwWIC3wqltDJTuWk5dwUVyMDKyLllcyVERj+Skp35UdlpxYA
	fOv0kbLee0TB06Qd4Pc6eHZIUnOplwAykLeGSe25xI3g0NsQXYXoHFuBqVPUnZrfeasKi43Z3Og
	2zUeCOyfc9vvFNswFNnlnhp79eobSnYUobVQt+MNYtfD5XBn/q4wpUMXN8T2UwJiHpecvL++JXh
	8xs7DwAI7D4MaMNcLn9Ie0NjdhB8+eT0uKt320dIREmv2OGSHSUUZQDmBA5BOmQ2mrvNvQxj7Pb
	qG10PHaJJmK7F7azvFj9z9VrLsdrGuWt24WRoV59/QaP/vWB9Oejma8JFJWSfvPlIM44XtMD/7Y
	yVCVgi9L/bFjeYA8AJagnGUmkIpjkEq9Ujbupy6INwvYVOrZhdFyyk9Vc+uWWgz9FceCn4q9PMX
	dgbIzaJw==
X-Received: by 2002:a05:7301:29a5:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-36a203efd45mr4646592eec.20.1793214012813;
        Wed, 28 Oct 2026 12:00:12 -0700 (PDT)
X-Received: by 2002:a05:7301:29a5:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-36a203efd45mr4646546eec.20.1793214012227;
        Wed, 28 Oct 2026 12:00:12 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.12.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:00:11 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] usb: dwc3: qcom: Enable VBUS override at probe for default peripheral role
Date: Thu, 29 Oct 2026 00:29:37 +0530
Message-Id: <3c1778a36380bb6d9123c3791f15cc3656b80145.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-GUID: 1ZZfdJcUCXHBl2lWDvgE9LhUFxZO4pLC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX/CkPj8G09gXl
 HGr1yj3nZ1LRUVSTpGbhLk03H/LwRVps6h7a3s4OknuEGdwPXnj4tOROzyDI9x0/Ldrt7bVK5FI
 e59DjdvxYLPEvhjwcwYsRDRxBrZrqGM96hyGHRSq6S7q4L28igHwuGBoR4o/l6mcORuzIGm1eq6
 oONaQDLLjljUorJSB88Agzwvk/TXOZ0bOndOVqGMHNWncXq97ikp4z5S43OGIcM6VZYJvVC3E1F
 nbRysE49rDTH0SK7JAY7+Yiro4AU3bVB5GYU8u5F9Nyw5MIE15RI2TY6H6nSTZ1pb3FuCnM9c8x
 2pSRGbls4VCBHMFJio9VrVGn5HuB3jBQv7mWuns3e7TPbudu4CZIKGHTEUIkpM+5Ys4V10NM7pO
 nrSZH7KsNzcrBb4YO0AjHt23WmDpVWMVMTXGdTQHTFEtMKOIMAIPCdtikNIiAQBLrxojg8MU5MD
 EAcxQpIODUYv6Q2pVGg==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae2463d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KL4VWcfqKbbHtFUGL8sA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 1ZZfdJcUCXHBl2lWDvgE9LhUFxZO4pLC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX+9QLumS9hh2P
 CRpRl22xPDyHFtmVeuiAsiGENRDWpjk5KOWoSgqJcnC3GHaYgyM6OgxoG3XTPcczKmjBnoHmfNt
 7wt8bJ6IllSC231CQTyInE5+3OC/1Xc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280075

When the controller is in OTG mode with usb-role-switch and
role-switch-default-mode set to peripheral, the role notifier never sees
a transition at probe, so the QSCRATCH VBUS override is not programmed
and the device never gets a session-valid indication.

Enable the VBUS override at probe whenever the initial role is
USB_ROLE_DEVICE.

Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
suspend/resume iterations completed with no failures.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 0896a323bdda..92f1223f7b21 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -953,10 +953,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		dwc3_qcom_vbus_override_enable(qcom, true);
 	} else {
 		if ((device_property_read_bool(dev, "usb-role-switch")) &&
-		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
+		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST)) {
 			qcom->current_role = USB_ROLE_HOST;
-		else
+		} else {
 			qcom->current_role = USB_ROLE_DEVICE;
+			dwc3_qcom_vbus_override_enable(qcom, true);
+		}
 	}
 
 	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
-- 
2.34.1

