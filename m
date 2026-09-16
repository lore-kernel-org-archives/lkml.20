Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36591AAE28
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525058; cv=none; b=EoAsUi9Q/KZpwdh1G7Iv8DiCcuzYQu0bCKsCJ9akepw/8bSUUO9cffikdH89wHCjIf2zqQJrEwojLY0ObhdT25CxjIpZCWtkA74j6VvfmDuh5pZxtjK1VQqcEFcVOLFuht3XuD6+KV33mhi9Nljnos6yR2OXJ0yEIguDgScM7Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525058; c=relaxed/simple;
	bh=RlAxVC8A+OuVqSEUCvozNdeGN7waEZRXQUZ5g6gY+ZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cq5uzck2ElIHnHv+3OrROPa/Uvp55CsmpaQ4bISA0xujN2GUDvS2XVqKKM63nL6cCsd6w9D/nudPI+/6epFMaCuN0O/BFnZZu+96eubAtD8NcKDu8hLbsbJEFu9uymBbdIQzCtigGmZlyszewL9/13eWhsVtFngiOvZeMGb9bxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YQXoyyOw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JoX/JEiR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQXoyyOw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JoX/JEiR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLZ75f980243
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7BxIOIvrEsFkWDDtmBxump5+jjy1y7D1tIDEMW7Njw=; b=YQXoyyOwyiiEO9P1
	aq2AWXkcpudWTaNRw7DGgCjsr3CSTVw/jInU1ZPqD0T06rB/W+YzUT/GNdm5iAsi
	SQ8MvORtL3DJzUf2bRsILePqITdrMZtAB5ZSjSlj2SHtv4jVq+dbhx6HHBEACqzk
	1FwbJ6BYoZUYGIUJ/qHrh5WXo1dP2iTtENqXyx019NilWoa/BUWws7rlFGxjowhj
	gqH//7R5N2Kx7mko2C3kotVhc/aoLeC02S/PtuxwSBScvS7NPvIByaO1A3io8En4
	iX8E1eBjmj6XjGsK3YnN/Ee3tAPOAlQzKm6zxdW7QXrFsL/Hj9IVgpssYLb7y3at
	zBXCgg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3xtvcmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:17:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc0eee75dso1843881a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789525052; x=1790129852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7BxIOIvrEsFkWDDtmBxump5+jjy1y7D1tIDEMW7Njw=;
        b=JoX/JEiR6iJuei2fyWSziPCvBBBD15W+kxYG1ID7PCGRI+4SKffPbDt9gJTi3B0dto
         rVrZOFxAheAuuR3nwBaUF5OKAEqhWo95SJv0dIk6l63EE+e0LLJmZ3rubncV/3g6NIri
         Gy2qrEna+3r7u2Aq8KgLaPl2ZRYWmTvcmnlpq0KYFWNQeFxfe+bd+W8mgKrgfNPWzleb
         2RpCcRdPrlHxmwzFh1ZCVDQRwR0une3YOfoM7icbAv4Pv0W/ZLXErDyWcu2wLVvzJ1a4
         oJtkWOc/D6GYwo4GiitQUpUQs/XVbEmdvmY4Seh+cLGrdda4CoYXdUoOfshTuCWP+uKX
         4GWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789525052; x=1790129852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7BxIOIvrEsFkWDDtmBxump5+jjy1y7D1tIDEMW7Njw=;
        b=Xav2v+VtEvqhuojTET9v3xjcphwsYNKlVOrQcJka+vFHcN9ZQtNxX1SANtQIJFnJKU
         DaztW70lnM9Y5H7CNEJuZiN+QXEfQMcXJxH6d8FITWDKgWPmCiaXTBj6tlFlsGq+T6/F
         QUEkktHwBso8nCxAKOtKDUQTuBDZ5O+wJkqxCb4MtVHSBT+4vXI1S6TE+XWFKe55/Dcj
         2FtvItv/Zt6+qMz1T2aJIbJsFK18bT86T3GHaFcAmY9T8bqz7/p8xMWDBpeS/WsbWmkh
         jC17FMIY11wnLCmYjoEAdFypcO0KAPAtCO85WQZBPoy6xcaqdxEQHyIatsaiU6Z3k11p
         9Pqw==
X-Forwarded-Encrypted: i=1; AKwUvBylIX5CcOOKwsm+lwC0wwPfS24cDcs1tXWCeTNMkBvVUpb8BQzssDhFMHSlAyjQCMv65V8vhQKDQMVDcVc=@vger.kernel.org
X-Gm-Message-State: AFuF++k1Ps7ES3thjao3YRGNJeC5uhARHkNSiKwd2h7fnEiCllzpGVXi
	YiuGsJhiICV5KaYsPgwkVu+NE3UMa7dHyinjQLiqv5lKX8uDivD5o3Do3gw0U70hg55+PwIPMit
	mfVGjH5T3bwla0eZiQLO8oxxb/PX8Qh06DfzTJe8UAeFk3z2jwOZCwoF2oz8v4eb13dW1X+Bmpn
	w=
X-Gm-Gg: AYBFou3oXZayeSIEFG3eBphY0bVWBXqv+vCVsNVPYarPAw2Y27eweMMC+tsmERx5xdW
	xkgVYLkUU2apiBmD6CzyVs1zFw0btcX+JT5Ts1XSTjRDKYlL/4qnu6OKRBEj9P279tcMqo7m8S2
	Up4tGkWPhUEY5JchEWcY+GgHdwOjI8MVCQW/thyAIO9oqRJFHhuym/0taM3FiuNXQHWmzHdeF7U
	u0FL36CXjL8c5gKnna3+ZiMksgWd2r8bLNrOLzsFmqlUQf8HmksGnExktF9tlPEiPWG+cHzi8hU
	hri0rcTtpkLkvw2sp34e10+oZsyX4nCogT64bDiUgjsAewH+4+GYW9UMDNe2jQe1GdqtIZ/0jCc
	ALGcOt2FjbHeVbasl3Gx4nnND92LcEMZTYuS9z/XnEadl+6U=
X-Received: by 2002:a17:90b:4a44:b0:398:bada:832b with SMTP id 98e67ed59e1d1-39e1e5ddce1mr1166774a91.6.1789525052308;
        Tue, 15 Sep 2026 19:17:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4a44:b0:398:bada:832b with SMTP id 98e67ed59e1d1-39e1e5ddce1mr1166741a91.6.1789525051926;
        Tue, 15 Sep 2026 19:17:31 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad9ed5sm3200332eec.22.2026.09.15.19.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:17:31 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:17:17 -0700
Subject: [PATCH v3 1/2] Bluetooth: btnxpuart: Simplify nxp_recv_acl_pkt()
 by hci_acl_handle()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-misc_fix-v3-1-31fab8976ac1@oss.qualcomm.com>
References: <20260915-misc_fix-v3-0-31fab8976ac1@oss.qualcomm.com>
In-Reply-To: <20260915-misc_fix-v3-0-31fab8976ac1@oss.qualcomm.com>
To: Amitkumar Karwar <amitkumar.karwar@nxp.com>,
        Neeraj Kale <neeraj.sanjaykale@nxp.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: JoLPquCnOO_8f0VpnTZwlcoC8ZWavmTg
X-Proofpoint-GUID: JoLPquCnOO_8f0VpnTZwlcoC8ZWavmTg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAyOSBTYWx0ZWRfX36erCLvkfH2w
 ITF0J01tCpuqttd8RfrdigdWx5KJLMptkr96yeLGsUNrCLj4kC5jU9bMyhyyjOVBNYjiuZFePTk
 8uS+Fyt9LClykeSyArnhIxgwFL36y0A=
X-Authority-Analysis: v=2.4 cv=As97T+9P c=1 sm=1 tr=0 ts=6aa9fc3d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=sSfpovmWVSTnkz7oZwoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAyOSBTYWx0ZWRfX2ns4J/MvDZTN
 F4bRJPYX1NFvh5pCVtpGVXjtW3VmsaxqAyTr8hmrwyO7VW9RlIJHm50ygx9Jkzs/Q8bA4YqBNvV
 AZUYCxRV7tnKaWqhDevB65tVE7xY6VH988Nm0rtE3hTmAkZzsJFbOmDQX4sO5aLtSc61JwyhfeS
 kYQ2+F0AuLg1OBXH1Q2ZifkCDXQkIcBCprFsk+2/CShw5a/A4D2U9ssRwtANnX3S4AnRbTO822W
 EXp0rRF9SjzJEXt0Dfdh8GJg+ByH6K+Iv6p3QxTgfdprUFyeMB5QA3YywtPdd4fhUk6Hh/JCgtr
 QEggQyxVAO6c9Rv6+0Tg0Rs0CQTv5HTSSCxlYiTLtxjIu+I4m633vRx7PwJ86wJrJYcHJJRcC1Y
 DQ/8tUbOMP8R1bzNcoZvqOolvcM5Y0DKkNhIF3aTHneGxdJp2H994OdHXcso7yliom/GbfyM3IJ
 7+u1gSw+CqJHPLHEwwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160029

Simplify nxp_recv_acl_pkt() by using hci_acl_handle() instead of:

__u16 handle = __le16_to_cpu(hci_acl_hdr(skb)->handle);
... (handle & 0x0FFF) ...

Reviewed-by: Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btnxpuart.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
index 25e7b41b349f..b975a00eb6f8 100644
--- a/drivers/bluetooth/btnxpuart.c
+++ b/drivers/bluetooth/btnxpuart.c
@@ -1400,20 +1400,18 @@ static int nxp_process_fw_dump(struct hci_dev *hdev, struct sk_buff *skb)
 
 free_skb:
 	kfree_skb(skb);
 	return 0;
 }
 
 static int nxp_recv_acl_pkt(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u16 handle = __le16_to_cpu(hci_acl_hdr(skb)->handle);
-
 	/* FW dump chunks are ACL packets with conn handle 0xfff */
-	if ((handle & 0x0FFF) == 0xFFF)
+	if (hci_acl_handle(skb) == 0xFFF)
 		return nxp_process_fw_dump(hdev, skb);
 	else
 		return hci_recv_frame(hdev, skb);
 }
 
 static int nxp_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr)
 {
 	union nxp_set_bd_addr_payload pcmd;

-- 
2.34.1

