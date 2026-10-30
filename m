Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341518;
	b=cFMHh6z8HAbBciD73gg4HRUcqGYuW6JTmV6hxYWiy8uKfloFTJVHEhvb9+sjMQlGWdT1
	 LcSRQW/MKNBBW7oFmbzLYQTkVNTkKp/xdRzlELP3Ns7IVmZQb+4hsQ6LgMV4PJAletZxG
	 SWUiPDSO6xTOdcOHFd+0x7wrFPV7/NT+A7qMT23wKDmQ96lFGHOQYhXzTnEBuqiQ5Z+/v
	 RUnGjR14c8nkXqscmpz5R7rieEVV24isrEKuFxLVktAvHtRBTFri1nT+wrSW1wHptfN+a
	 /H4BumVu8mxL0E67Z208JU7tVwmyvVI2e9wCdQeQKUgpv1r/KB9OhIlzk1D1huts93g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341518;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VAkmBFj52Y9xtSVpZvMUsO7qDuuRN4Pc+cof/1IaOb0=;
	b=uo8af7G3UaGFMqZ0k7GA8Lbtzj7JljclrzUTYt+I8EdSgY4F85rB/PhaMskf77ZhGJmX
	 WFoA80+MBsstm6Lw51gGTssGRtSZW4b4f05MwjSNVMevMmYpMIGxMH1EebcEs1/stZKPB
	 f/ga9SQNqAbhF/MkKJ/q2hktU5xbQVAn7PeUG6E6q/x3KHV+rSQ9gFYdaoViENy9NmDhr
	 y2bCBLLlUE6Kktptbyll31LfxktBXloCyk0EPrljJ0roUGUcbUuf3gwJQFlRKuYk5jTfZ
	 gvT+bG9CbNUWWo4wWonpDsz1vATFkCyBgmFx/qj9Mhws/zrR+2thEVxXoYyjeci7JFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=peQqOITF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KooWfM08;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54755606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54755606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=peQqOITF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KooWfM08
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FFfb2871338
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VAkmBFj52Y9xtSVpZvMUsO7qDuuRN4Pc+co
	f/1IaOb0=; b=peQqOITFTayWRkOgPtnOet0tJYgUDdl39HTFf3YNBGMEujppnVA
	1hDHjo8C0C9/eX1QKs7NTEUZNNSXARp/4n7Zami0aqIgSVqJUeRlHYNHDPfvaXtT
	V1pSN1FjGo60lrbKzuPsqz8D/xUUMcYoTk38wjTDmrMIoz03rRUmSO2zYmilKV0D
	xel8uvn6B99hfQViOlK5CaDuQiqer12dc9c/8cNAqTTTk5t7ggxZo1aes32X7IB8
	aTckBCaHhyWNNC4jpzR/2reqt5nBMOvy+ma7zJmGg0pKLZBLv9BbAtNDc0cQR8Ah
	EUyhcl/6KI3xqcO5+G1/9XBk5npM6NI78sg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhjdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:25:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so445454c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341516; x=1793946316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAkmBFj52Y9xtSVpZvMUsO7qDuuRN4Pc+cof/1IaOb0=;
        b=KooWfM08kmhZxxCjbEV5DN7AI+zAsGDo3jMHIDyLSYd7N88TQMbuFMzXs1vDM/FVcH
         s7At08xcrhWsms/whkAA9rY9omm4rtNaZ1rBTaxsJyRBEAi3IPFjE5PcsJRKXj/t0D8v
         IdRaJzG/Y2VvvWyTSjceZRfAubhLYazw8aityaOcxgN0mYHPWt6ZhkBCcBLfst+wOWLo
         Yfv6E8yv7WFYkzJPV95zCO/dnkEZKNF4z91xE2SxzuJnf+3C723IrbD5FhELmPbKrb8q
         ZG6+gIFOmwqfujawWVLZKa/BZNc+6TOoPrBd1+0OAKvUHRZgOmjAIlTMlonycZ1t9Me7
         vjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341516; x=1793946316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAkmBFj52Y9xtSVpZvMUsO7qDuuRN4Pc+cof/1IaOb0=;
        b=RdqnrI4GPisiZKFIkvZFhhc+ucC0FBitwP7EMpMNhZyUE4/ZhUAvr9M7Ll8PhnOSGc
         nQ841N9udhRiAjIz/EMsoMTdW/EfG/hJ3fLq9xZXp0LMqJbDkEqV7TraYO4LcOX/7t6V
         thiYzUFJHfFY348Q5b6+XvTstJT3qPf9LG5tuR8u44cqKhHa13sXVHuX24fYPcRlSDU3
         eg46N76DtgXkgFPOHB+mqZm7L9TQdy5WKFuxU4uX6AyPRBvmxETegtAb2TrN34Gvow11
         B/P29YRZUOYCWw7UGnNCB4pCHncWAd5GNvN5ALT2qsMugBzdvm1Q+eioymxBAyHEXThh
         +52Q==
X-Forwarded-Encrypted: i=1; AKwUvBytww1FLQPwhjLSQDE3pZ9U1poOid7LcKmhTy4DRthUYGgMh7vqG62ILtMbPIhsn+yqiThdMKBBMb+s7Iw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIr6DnczbMCn36OQj/qq/VWP5zVSyjLifcKFS//4u13VbZITMtA
	ARbZ4d8N2bwLKjiN3r6DmgHL9R1Rq+PMVAI2roEH92NTtw02NsccOeHDCVRSJDfE0aLhGt8A6CU
	Nm0fBNabzuedC8G9Ym0E0OA9b0cdGfr4hICodAG4Jw6tQBrIRkOeGrUlArGvrI13Q2lo=
X-Gm-Gg: AYBFou3z1zfNTKv7tsjDFOtgYaJw1+o9uU6AFs/Z7gZdsmtMe2Cmwy9+RobTVH0SYl+
	UnIQzTPOamywLOaPGV8tXyzpGzGdMVvD5tCIg7wYmfLZiClh79h/ArEPlIxij6CjfRN3U3JYKrb
	lMGm7zd+9sXQErjM647wFiNDobfl+yJ+nl5EJNDAVheAyXQ5YZvGqqtWotSZL9cG3/DLwVktdvd
	aw+fP58+/oIv+wkN30APxV3+FGZuumY2j6DR4wHtqhrigCc2tzYyjbrZ/ovffwpN4yhAGNzBkIw
	OwKXVnr6WbELs/H56JWZSFs5G91Os5ROdQoM9baDSbJ1gvBWCJtZhqWRU7RjtstwetghiHsleaa
	GBvOxVcAP3GjYvRWKS614lR+H5FvEb+gbr58q/lMkXItUB1W1BzNZNSDalkImZk01OdLQeLCUIM
	wdC5h5eR9ECi4=
X-Received: by 2002:a05:7022:110:b0:1a6:4679:6cf4 with SMTP id a92af1059eb24-1ac5c64c790mr2794334c88.36.1793341516190;
        Thu, 29 Oct 2026 23:25:16 -0700 (PDT)
X-Received: by 2002:a05:7022:110:b0:1a6:4679:6cf4 with SMTP id a92af1059eb24-1ac5c64c790mr2794294c88.36.1793341515616;
        Thu, 29 Oct 2026 23:25:15 -0700 (PDT)
Received: from hu-uaggarwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458fa3sm4655443c88.4.2026.10.29.23.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:25:15 -0700 (PDT)
From: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
Subject: [RFC PATCH] usb: dwc3: wait for USB2 PHY clock recovery during role switch
Date: Fri, 30 Oct 2026 11:55:09 +0530
Message-Id: <20261030062509.3475322-1-uttkarsh.aggarwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfXxt9CMImzrTvJ
 KiTDisQRdfrG9nEgr45XAAqAKNEQcSxEGe1tKMCYnev0vmvpAdEmq3SQ6Lw9XVPrIT6rkltvVth
 ziiH51QjS4s4YbIDvvRDEv+qzWtzGZ8tdmBfUcDrUK+cHocywZxi5o1vCTp3I4GjSZiQWMh1W0P
 TW1qVw0y/Zoh/xDtJWwkKN9ngoPtRxrSNSCzwz944n3wz5ukhxAPvqX59b1aMmmt28NcK9tZiv5
 G+25GGVxMiNpnOX7wToumN2zKol6XqSYTaSYO6MbXNgPOoDaKODNN1J9pPyLO1QBY6XeN2Hfwi9
 Qd+bPfnAmIfH5HsL9NzinOAvkhCC8eOVap+mCe6UrlgD7ixcu0HfCnjwW4zMdrOtL+I7hGLY3CY
 qQUQTlcU8IhOfCmZzzd+p4QGIY9vdqBOApi0+j8g4Vrt9Uq57AWCxj8rwEDbIwuDMQ1hPTvkTNa
 X0g7y9YybULcZtpr1Bw==
X-Proofpoint-ORIG-GUID: EMUEOCXUO8ZWYCpMxNYBeMx5OT_8Sre4
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae4384d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=-jmU5M79SyYRcw0d2-IA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX86fP4655rvnw
 +81RMPwFaHbHPk0f3u/Lnol2v8j1SWg1I4ZrD3mc0IMssH+msHLNpSXo5L7sRuRGt9ihv1oS/qv
 UUi1VRs9CX77XZoYUNYmZromcgsPXiM=
X-Proofpoint-GUID: EMUEOCXUO8ZWYCpMxNYBeMx5OT_8Sre4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300025

During a device-to-host role switch, the USB2 PHY may still be
suspended from the previous gadget session. After clearing SUSPHY,
the PHY requires up to 1.5 ms before the UTMI clock is stable.
This was observed during a device-to-host role switch with
a USB earphone attached. Traces showed that SUSPHY remained asserted
until __dwc3_set_mode() cleared it, after which host initialization
immediately started accessing the xHCI PORTSC registers.
The USB2 PHY specification requires up to 1.5 ms for clock recovery
after exiting suspend. Accessing the controller before the UTMI clock has
stabilized can therefore occur during this recovery interval.
Wait for the PHY clock recovery when SUSPHY was set before switching
to host mode. Avoid the delay when the PHY was already active.
This change is limited to the role-switch path. Runtime suspend
requires separate handling

Signed-off-by: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..885bb9301866 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -233,6 +233,20 @@ static void __dwc3_set_mode(struct work_struct *work)
 		dwc3_writel(dwc, DWC3_GCTL, reg);
 	}
 
+	/*
+	 * If the USB2 PHY was left suspended (e.g. by
+	 * dwc3_gadget_run_stop()/dwc3_gadget_exit() during a device->host
+	 * switch), its UTMI clock needs time to become valid again before
+	 * dwc3_set_prtcap() flips GCTL.PRTCAP and the new role starts
+	 * driving further register accesses on it (e.g. host root hub
+	 * PORTSC writes in dwc3_host_init()).
+	 */
+	reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(0));
+	if (reg & DWC3_GUSB2PHYCFG_SUSPHY) {
+		dwc3_enable_susphy(dwc, false);
+		usleep_range(1500, 2000);
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 
 	dwc3_set_prtcap(dwc, desired_dr_role, false);
-- 
2.34.1

