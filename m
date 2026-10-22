Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792644478;
	b=4wTvrDtCwXmy4gkvhzLht+brzWMysNjkwZg/25/jGg1UxHA1k9ldbuTB2NwMg+4zgNAv
	 rF4W++pLF/rU9M0Pr0VKEL6GAZ8vkdgOz/oLjR7nQ2HysY0i8ZlGZL4CbIHT8/Dbx2yRw
	 RkAxbuZPH01EZu/wYtYApYJpJLSO15/JeDY08/RE3tSaVhrGFFWgOj/coLvnpiSyOicsA
	 6tNuarhvx1qUcrPjHQU47TLMaDY751tzSxUycOyaq80ZLXaFjp7hMBCGJk1fpLQbuMkF1
	 M/DlqHTdZrT1Be04WjfCjPK2akxkfZLdpRn/QBSXANhPhuCZHV1KTIDmecwsFUKv12w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792644478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nEUthsA2IFqMDFX786vIXrF7ZWojnc1c/eGLHmaf5pw=;
	b=jW4gyDHximUel4zgNIopF8RTj62NOmIpPraRGaFSLUgN/N0QU2Zb3tfzU5VtpRTf6teQ
	 5VYogX70fWW5IfCkrx3o9hfyNbEYA3AKmXcVtzl1t2JuevVDQ5/jaHUoeSfVc3O6DMlS7
	 ZX6Y8v0e4Cx/02WfYnivyt1XfoHTBjxtwgh4gICegpr2Gqo4jyfB+cxTBcrGvX8T5k/S0
	 0asqnX4X/uFiIaFQdeONtVnWoPAqpcghvYHU0lltgbMMR1jrlwzwS8/Hy8zrOchX7Wgkv
	 UCNuZbNdp1lQ2g2trOzqf+FonPYbyuKYr9DjgnBN7zQFIw2bXa3dqo6ff/DA7jtyKrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lm8+EQmd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bPPNHN2a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7AC606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D7AC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lm8+EQmd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bPPNHN2a
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M3jAFf2293450
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nEUthsA2IFqMDFX786vIXrF7ZWojnc1c/eG
	LHmaf5pw=; b=lm8+EQmdvI3kntP7bZkb5J1LAcouhzGUmEcSKbykvPu8j55ljNg
	8IeFQuvOxPQKavZcIaTJ1PJm027zVwoJjdWh4aaGRSBDqlHxAb9nRQ0/V8om9tX2
	Mt9/3V6NyAKGP5MdxnRdm8lmPuSEFjvO05Mz3qt3HJfaI2I7tS9R8n7NeZg1T+Ri
	hEkY14DeF6B/mBPtzNuc5Xad1xhFeVvmsU941dBj7V/GdvxzwqAB5JhIV8xecAer
	6ffS2iNpfr/RYb1q/VN+53b4yAX02oylD+36P27e3rUO1ZAT0M8EpWtPP7awzEQ/
	ey1ZEe+HjtaOgUjOxSzBoOBVKkocEc4WdoQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93brpjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:47:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso2291740eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792644475; x=1793249275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nEUthsA2IFqMDFX786vIXrF7ZWojnc1c/eGLHmaf5pw=;
        b=bPPNHN2a9W7zucR4bw96lB7GYoOEMn3SfK1drLqOMWD9D6gAeZemj2ukvuW3fxxwAO
         001qWdJXnunnh1uMTeUmQ3yRqwnVIg8oW6NdbP3T1LK1lOjVrJdzF9Qi0pCWSBRK/j9F
         gwIKNBQfMQS3dHplpfyh4k+llrTJZsgavzHnwQCCChNPemuMDAGS6Bg+NtYT5XbKT8YT
         XthzguJa2KmcGHqf0j+MkSACFAs3mzfE9XKC3E5u6+xoAdIGZWMhRgCk+3ep1WONDu9t
         p45focoxmyg6AWHCFJ7D4EzxKdN1PpE6QxVCmDTriLGCYlXsmWZQBkq7mNqdce/AOWwH
         35mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792644475; x=1793249275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEUthsA2IFqMDFX786vIXrF7ZWojnc1c/eGLHmaf5pw=;
        b=bK+5ix8CU0akhqUaUq0SsIDgXnEWfKdg3lL9G4rgcyBjkOVAOQli/b1jPXqt3HgKM/
         C5ku37Udc2/fcx+Lg+FEzVldCaFZzS9IFTbjsiC6Mb7wayMQUla7wgVNUNvHn+WweF5y
         rdaQuJDXVd+CMQdopRmRMfndzkKjCQyGyqdukZqqme21ju98eqH6tGj8iVdF+FJRnUpo
         P9PeCtQJCpgYJVa33WPoHckh3yoifWxK6EQpp3xzC7I5lUqXfhrD2ByjgPS5h+h9lLQs
         f9foWqnf+UNA3pwR5mx9ZbfdkBuhKWpahyRYjATJO+N/OhEIsCs4cq7j/SwZp2oPqA0W
         7GOg==
X-Forwarded-Encrypted: i=1; AKwUvBxiVHtspphN98bx4QWxM83THA1qmvb126BcUdXNHDqCehgNJqxACOlkpGtdCen2j1I/NdDGB3e0fSqD1RU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDXgfVfiPcoxWj1+rItTu+kwjVWW2au0TfG+sz4O9t2UsR0chc
	mkbnrZgaqxdJ3X/o5asqt5DT4DVmuL4krQQ9zGtnJ1BkzOtCKiBFP1LFSkbMJTs5CObGMJmt29d
	KwugzQp+W9nQJDev5dB7mdba0r6TR6fX2G8GfdbuofNSQb/c5VPkB1vKzUx58KLg3DaU=
X-Gm-Gg: AYBFou1dRocHAfPGtRv9G26vJ/hVSi4fWcraRVCo3nhhz4/ICCwp5xP7f4KNAC+LSnx
	jJmmRstkicnqVG9WZ4StTdVSlbBEVHzstvjpudM/JxDrs5QJaHAOHAXBeSUHO0R4xnQ/LkAXty4
	ke54xncP/Xhi/CQv6HbJ5+vBNv+irDPczjzeMFNB0aiUVFiqB8VYEX/rgSXM7OBkQw1whZXdRmF
	fBTXaZBRnBZHW8ntK0i/kep5inT5aBOdNxmICQEjlGj/yT5fCmqAgkDp7iYr2oSDwLJbOFIT9M5
	funvUkETKxn7a0kmJo3Qgx6KPy7GeOIvfqizls8o6Fl6TQnwmdsfpmdkCuH/Iiv+Y2W7foXXv8N
	OhQWgLhW3NWArDyu8QcfBJbk2nlxF
X-Received: by 2002:a05:693c:88d7:10b0:35b:91da:7cb with SMTP id 5a478bee46e88-3674e04fb43mr5913717eec.35.1792644475284;
        Wed, 21 Oct 2026 21:47:55 -0700 (PDT)
X-Received: by 2002:a05:693c:88d7:10b0:35b:91da:7cb with SMTP id 5a478bee46e88-3674e04fb43mr5913679eec.35.1792644474697;
        Wed, 21 Oct 2026 21:47:54 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741f753f7sm13071866eec.27.2026.10.21.21.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 21:47:54 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v2] usb: dwc3: qcom: check for hcd in dwc3_qcom_read_usb2_speed
Date: Thu, 22 Oct 2026 10:17:48 +0530
Message-Id: <20261022044748.2303528-1-prashanth.k@oss.qualcomm.com>
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
X-Proofpoint-GUID: MTzewJkaTIMkrntM7T_15m1pFV9t55Ae
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxOCBTYWx0ZWRfX/DhbNMHyHRmw
 KluC288CsOl6YkJs8Bz8oFQaXg7bw+WcWyTeUuaomyha8qzO+kitLlzEkORm+rlAgV4y2pSwsEz
 Izh5BYITrLT0ucFG4/mfEpJrIebwXkopR9Ew9EkfZlp6G0Ag8K+DAcNZxLFGKRMWqBUUQ1Fp3D1
 nh8wpTnjz/wz6J3l7QzhINmMPOKna1wtgNdoYSiu4XPHDosS2ATSxmJyw0/edBuz0YHRDBUXI5M
 ykBckx4kJXTFFNa4b+tIKaKkmIJ7cfaGEb7h7dJ4Q78QH+dGuv4oVahNfUjD1Xou+UXLfNsspNV
 5vhcm4bpk/R3B1eHmtcn1Gu1qjZZJxiEJ+wnJtv7p4AG2rIIixW83soYne9bbVhA90k8t+qbozk
 cC0rhFHs0MQfWFz9c596d7b/THPJBajUcsfxFVPrQqOH8tDF6XihLLoQ1oc5QlRoBOZHGsdcTsU
 U3H7uxqgtZEUDTXU0vA==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9957c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=i82cPfGn_hM9wOwWQywA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxOCBTYWx0ZWRfX8yltT+6XwgIn
 BqwOPV+9obQV4EmE1k+mxs01ImZQtJ92M+LADaN+DfBKYF0FnDNUkzCo9830GDlmgm5PDi9xWA5
 1YimTp+Tqv+uOvIujnIT7mSl4h5Hlg8=
X-Proofpoint-ORIG-GUID: MTzewJkaTIMkrntM7T_15m1pFV9t55Ae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220018

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
Changes in v2:
 - Added null pointer check in dwc3-qcom.c instead of marking xhci as null in host.c
 - Link to v1: https://lore.kernel.org/all/20261014105711.1708244-1-prashanth.k@oss.qualcomm.com

 drivers/usb/dwc3/dwc3-qcom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..6ca51d37c35a 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -241,7 +241,8 @@ static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, i
 	hcd = platform_get_drvdata(dwc->xhci);
 
 #ifdef CONFIG_USB
-	udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
+	if (hcd)
+		udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
 #else
 	udev = NULL;
 #endif
-- 
2.34.1

