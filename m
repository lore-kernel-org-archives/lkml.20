Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2983B0590
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311085; cv=none; b=PITHBGmNaNw5cJS05x9P4+IieeoBej7EWRTVqaF8qfpgHu7ZQD/INXWSHVyDRQX8AkV3TD4Dkv8dyv4NsRHE9gV98NiF1CY6Z0PqpTdLtrIj852xS/0nz+rMNIlvlbCTXYBFlsdPqtE//KyN/XuUIV7Atyqsj5zhWX52YqXSWLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311085; c=relaxed/simple;
	bh=Rm+eFKsHzqQH480oOqSih7J/Ux6X2xfrtti/R3C8/Yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jTCjc69O9PfgU01BSXy0iSMGbtQZuBb2KsZyJdBXlWINchJEOub6guBm//flLe7nnqjbkPK9NSciLzaJdaadpkGm7wMJerhklSTvozbF5I1jToZ2TPIsIubdHBg582cot/aw1gdjKfY7zVSj6LUReFBCpfdJhkI8IBZABPvLqyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBinP6cQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuwDCQnw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBinP6cQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuwDCQnw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yivg039781
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L+QdfKIcld+95910MTqUEY
	7FvSFas88X0wQustiaYac=; b=NBinP6cQWRJOSArbd2wxsXGLdpdu1MnB/mqNIi
	hlkcf0rb7gX1uqb52IwcL6fUFDTZcGy2QNHCfTnQc2kBp0OD94j1aV1YN9R6o+/C
	S6gN61wfcSyyHFixE3CbSD47xUnCBThbtNM8LzGH9PVnCPwVLp4Jchv0Cf5JA4rx
	3gDgyr9Yhuu1ft/QhQR/8ZTrKahj535FQzyFkQQAHLeOjVwTss32wMrO84hmQFOg
	c9KvjGvtWbJe11eol2hoqIgW1rWcc6cmSHJ6ry7smEjMz/A/kWnrk10OMjfqFfMq
	pSJlnSyvhLyfnaR/IZMuE+bGATQ4gdVhooPSN7pz/P8DTUmQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw46537f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:37:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso760664eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790311077; x=1790915877; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L+QdfKIcld+95910MTqUEY7FvSFas88X0wQustiaYac=;
        b=fuwDCQnwv0OmDAAdUJht0hjaWqeyf0lXhF8MKV9fCRDId6IuUMqgj9zIijjFKTVrKM
         amR8XPesiYRMEKiVQdq7Pgr5DlV1LvYI7DMXpeDqrYverbgoYxYNea9jJueW14EVf/j6
         7mrXtlplI3g+iL32TibCieZzrJu0DJCrN5dCsyRlu5ZF7qn8aSWlut6sUtP76u9Y96wL
         Gx9Ql0NTiI1/tGGWedRSr7+9xEVKGqEv5f12r69KtdxAjktLY58F50MCAj/BVgnCIIQQ
         5H5N/Ciu9vopgWrd9Hk/LXTeVdLBB4CACN7zVZAZIx/PZ3r1GSqxcTN3kMGZPotXOe+B
         G6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311077; x=1790915877;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L+QdfKIcld+95910MTqUEY7FvSFas88X0wQustiaYac=;
        b=srVjGYmzXGkndzmJwCzcK+zC9oieG3xphc5szJ1hYO+WMPc30FoTNcKrNpb6wwPxC2
         lS2bc1HLwwKnNMtNuIZSSF/I8ZDtchfPew50ulCJ+VZrR4GiryEwo0yV0D/symZ9sPF+
         jjlq75RfELvzzWNQsVNBZaokKaIUIWASRhoT0hDZyrwG2tGCuEwk+gWpNJovEwP+JPp4
         8xZgmLul+iNuhVvc2Vi6Cc08g4afnQiSCcpFNYduq/EXw/Zva1TvsKkSReQ3fMwc/SiZ
         Bi6FNM21xnz5JMYGQf5qA+hCrfcP2xKK9fmx9/TFAGP5BLvkS4QRGdLvAaZiZlXPcxYT
         KAYg==
X-Forwarded-Encrypted: i=1; AKwUvBy2Vl6TyqcPWkVPYCdsGnNkOcIlaUBsPXnLI+mdy/l37Q0tynep/3R0Vmf/QfNqo7ydnqA06NTU23IGVG8=@vger.kernel.org
X-Gm-Message-State: AFuF++mhWFUGJAmrxzNICenKyojq4nLvpk+wv1T+eAxL7PcClYBcWcU0
	pBj19PRn1gnnNyCj88Cp637tU8SSjUvtmr6WzXzg7csuEGWS+vES4SjaW48KN6O0tJGJnj3ecO6
	Ur1V771n4sqNDDeK9K+0v+G63F7FkLxWBvpqKBETlASauoLIgwJRSsRz1Ux5jpI0tXgo=
X-Gm-Gg: AYBFou1wAr5raj3C/x1wzYorEKVGaLckpPWPu3j+YPUblSyphosLJlFaGZW9AnlclzA
	bcgFyFbL6DL94pnT3Ska22sLyzaiolKrrpr9j6GrkAnLU1gm/ljIhZ8H3S7noU7n1LHkDaPC8RY
	lljDXJhRX7EvkCVZ8ABtXMlxplZ3lBIwCQZuQKLB9NB+WCMDdmXsAtVoRvOCfoAv8f0o2MXZ0Yp
	HYtce4XW9DwV0iD9oTBSThy1yWybXMOcj7IkZbyUEevq5yeUK/SWtC4xzF358aHclFslhPmxNvQ
	YbhjakCvC3YXVlWKLAQklKpyJXn/W8LYruSnTKUGP5iwens1VrZ9MQrC/jg7nDV8pTRbmO1X3kZ
	tooCbcNJk6BDtwQ8Oy5DB2nTLD/rM+UFfow==
X-Received: by 2002:a05:7300:c01a:20b0:333:f481:2252 with SMTP id 5a478bee46e88-34001221c93mr3927596eec.34.1790311077297;
        Thu, 24 Sep 2026 21:37:57 -0700 (PDT)
X-Received: by 2002:a05:7300:c01a:20b0:333:f481:2252 with SMTP id 5a478bee46e88-34001221c93mr3927565eec.34.1790311076453;
        Thu, 24 Sep 2026 21:37:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172d8asm3053938eec.5.2026.09.24.21.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:37:55 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 10:07:43 +0530
Subject: [PATCH] bus: mhi: host: pci_generic: Add DUN channel configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260925-mhi_dun-v1-1-65bc07ec8a59@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJb6tWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNT3dyMzPiU0jzdxKQkUwOTtFRzC9M0JaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAEhoTIdrAAAA
X-Change-ID: 20260925-mhi_dun-abb504fe785f
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790311073; l=1392;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Rm+eFKsHzqQH480oOqSih7J/Ux6X2xfrtti/R3C8/Yw=;
 b=w0zN+WLCdr5Qo5GVQBWAjdbhwyHAEYTRamkNoE6C6h3k4nqgDL2xqFtAJNbDRQAJceAeVqk6J
 i3QPP3hqFc3AxwjUWgLhfQAh2tex0OH8et81LJuOPC+7jHpIdMiOITF
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab5faa6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=MXGvhfJtNsboA4ndukAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: O_V61T88ny2d6q0CXJJpoEDf5LCoyfTq
X-Proofpoint-GUID: O_V61T88ny2d6q0CXJJpoEDf5LCoyfTq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAxOCBTYWx0ZWRfXxDYaHZBFXVzK
 oNGyVxhsWmWXlnhTNXd/Jg6BW4+KP1mVz+HADF0I/SwGGCZaI1UEgcZIHJFdNuCqCeaEd/AymQ7
 eoGYXLd7Q3EVVAa0DUxyUOepoD9QUuHOkuxQbo79y5zIoLlDK3kZM8Hxx1w23jBUOwp6Bo4woje
 IcS4OMcAjhk5ogLpeBLc1I9R0tgi5oFHN4he4l5/W09eGK/TcVnA/XXSDeRm6qI+TcBWxH/Zc8z
 Y06i0RagISVavjjUmA8K9Md/Y9qxdkJPNs4mVeQY+psaYaYBp2OifhYxAzRCk8jss4ODMtOJKIK
 VwaOZajJJ6GdKBx4BQH3ltf5nWbUI2ITSmnkZyurAFkRenfxZ+mAIdoTpp6CO4AUtjCX55Z9EYh
 qJ/IKpnU464nu+8gSJ6R06Qs4dzi2npQmSdjviYG6+1JSMoFj41P9noOTxsjq8mDcWYtGL+Sbxy
 ha3S6ZXdklYLSVJ3WQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAxOCBTYWx0ZWRfX6Tp0KF7gAHBN
 2q7wWDyHsNHv5f7mbRrF9Yuzsy9Mg3lNSbeE52JNyL7QMeUcVgc06uoihmrigeDMySVrK2eDvMW
 dzpQzGtYCLO9cG6CeK3s0XhfClAM/Co=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250018

Add the DUN uplink (ch32) and downlink (ch33) channel definitions to
the Qualcomm modem MHI channel configuration table.
 
These channels are used for transporting AT commands over MHI.
Defining them allows the MHI core to create the corresponding DUN MHI
devices and enables userspace access to the modem AT interface through
the associated client driver.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b636e2c23b4d..cb4e921d9029 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -322,6 +322,8 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
 	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
 	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
 	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
 	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 64, 2),

---
base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
change-id: 20260925-mhi_dun-abb504fe785f

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

