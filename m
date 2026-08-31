Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0AB34AB00
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788154795; cv=none; b=FyYqQhY48fuVNG6NRBb1GLPVvSXSajTI8VvdEnc7+6RCsckYIcmztFCzefDX3X5fRUNTtC0z43HMwe89pixQSpQEQI8hfd8jgqg2dVLpxx9/1hK4K+jgXJkn6JueYR575RLCoafCRFh2oYWBLdg/PUCvbpuN3Wln74W//4906eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788154795; c=relaxed/simple;
	bh=DRVh1NGOtFPiFXurNbSZtTIhZuqLm87v4cS3YYOBw8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKXfYu13jWAKEROol7s68tQ8Eyl46Tfa2Rsnp/p9PnDj1227BQ0luFGgMtydZ/w5idPJySO9QCPEBkUzRt42SUTY6viX2yC5DxCIr+jartw6pySaAnfihC+PcvvUknVF9omi6hEyuKOAvOel/4AzyTUddu3oAI9Owqe7TCI1p3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dQha14jU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqfDgJB+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dQha14jU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QqfDgJB+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52WDm2017589
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w0o65gYeaHHV5pzyZfQ8OGpgi6ss+qnOuDKpJLbzhos=; b=dQha14jUUtGvaZwD
	aaGiyEZ4EAQsj2D5z7KztcqTQOH8ymWv+GJdkGwM0s2ySkHaeYrAnq72McG9VATo
	6XBRGxjtWWrVaVVeTi1sEHEpRflSFm3bj6/GP4KfGKnF9PN+49ImYilCpwexvoAw
	5hMYIfBvN+M4rhLlBNG/zDqLRjSwN0IAzgRfPgEr0gNU00htG2xyEhX128hXIo1h
	u4H+hhPZCTgoNHTYmbCoe1TpwU+Ey6Ts5RRMe2zBlfbuKmdDmPIerFp6boBtbs7H
	Tp3NdxN432Ji2fxRWzTHqlax1L+riU5IBJEWI4qtjxDTdRqs5xx42qXjl8PFcmkT
	xQSpew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6mnsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:39:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d3a12589so377583a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788154792; x=1788759592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0o65gYeaHHV5pzyZfQ8OGpgi6ss+qnOuDKpJLbzhos=;
        b=QqfDgJB+hguSuBlcnaIbrMuGjqgdG/4vp7Q3M6wavhme+DVWWVrIe6ewl7PzN33qk0
         /6D/Drui6TXlB9dWzBmYsFn9RYgIYsClAYBnLxPLZJ6NVr0K891rd/Pu6E0C2K6EVeD0
         Q79mstpvdYS5AFyipd36KtxTaAIl/wqOfK5OwY+NlG6HQOvSQCpNtcnvSNIZiZF19y3y
         O+JWJcO1ZjCdhCTw+igLqGeGCyFIQb12sirP9KG7QeIXymSuzLZtAdBW8XjMep8mMINA
         8R4OdiMtXwpFDwss4/EKUwKS5JQc3DdgUuewjSjNppWMhzK/Qjal9076WJVEpD4zSqf+
         0PEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788154792; x=1788759592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0o65gYeaHHV5pzyZfQ8OGpgi6ss+qnOuDKpJLbzhos=;
        b=ZQkGemn802w+kf/m+T2zeKpz664YFV3pfXaAMPCbi0F/DYisAGqRqu07Ggj0ha97TN
         FyjkGkjalebpCjgthlXAFzWj00mxid8XhTj11r/JMTTo0rknDiMIfBah+NmHjnDJOjeC
         vj2BAhscly6NY6vrGH/d6QuFGiwowbr4I8R9jCNngiO0sKgtRJRmybmmi39z5N75C9/O
         ZQpdjMebBr+eeXyFOAp0qidvztllcw8hQ7DloWGffeo7aWACUJ1zPos20rO5L/8/j1X3
         bNW6pfTJPvTs8QIWmlbKv+40Rop/rv0jjDTzbZeUCtR4UxvEXc/RPAr5rQ7ZWptCOzwp
         +hbw==
X-Forwarded-Encrypted: i=1; AKwUvBxnE82LFESA03Q7WEwX3GsqoctK7fO/+9MZJVcuJw53xHJvZm3SPDgjxnHie+WBxiHCk/0AUdgBnQ9OTUs=@vger.kernel.org
X-Gm-Message-State: AFuF++lnSQGvWLGzpXKfeB1EI4AbP1jHphjEtrWF3QlSmKUEcoE+sedr
	LKiVU+AaFhxB2rZDtddPapFKmLUue4ogyBdPZWuHuEFZxgAQE/6hGAOPsPNbgxOa6LG4HYtAc2Z
	ZAeXll1+ihhBo2w8hL6AGkAuLPi1ZBCg4h1bV6+55AjJZoyGEiArU4uMlT0IF6ZNxCgQ=
X-Gm-Gg: AYBFou2sqEELSNZmLSMZXEb/6xr8Gno4auZJkx22HeZsYeXZCTZWafjUSgO6LnhdhVQ
	sBzQJC9Ky+/LVofiJy6AMQx51eJQfwHh7bUS8PM5Utx0CSj8cHeHFhS5yZt4ngTe8lhl3iqH1GP
	zHwNRv/EA92JCQr8LZv1tybkZ+rrKrKCBoXzpqyrHCCknYFtU3VjMYv4Hhr6ixsJCoajBIEm+K8
	MVmt9z46QShzCA+da5TG4jJHTTNvOnIQXnOilb6Hkb0x99aLCtuK+1sW91jc1UD8iEVq7tUKswj
	dnU9Gk031LyJOStRtclADfkPz+wvCaEYJ1o/iemZyQf4HUL3Q6jLS9qgqBEss7V3rH1bnuUeZtL
	wrqRO63bzycBBmYf9GessYaJcJ+A1qBpW7aC+Jr8id9RHSdk=
X-Received: by 2002:a17:90b:3c82:b0:398:a2e4:c784 with SMTP id 98e67ed59e1d1-398ba95da1bmr11552411a91.1.1788154792090;
        Sun, 30 Aug 2026 22:39:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3c82:b0:398:a2e4:c784 with SMTP id 98e67ed59e1d1-398ba95da1bmr11552370a91.1.1788154791574;
        Sun, 30 Aug 2026 22:39:51 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d3fdf6sm25566085c88.6.2026.08.30.22.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:39:51 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 22:39:30 -0700
Subject: [PATCH BlueZ v2 2/3] doc/hci-protocol: Add BT_RECV_VENDOR_PKT
 socket option for HCI_CHANNEL_USER
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-vendor_hci-v2-2-9903760957ab@oss.qualcomm.com>
References: <20260830-vendor_hci-v2-0-9903760957ab@oss.qualcomm.com>
In-Reply-To: <20260830-vendor_hci-v2-0-9903760957ab@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: DiOToZXT8Yjb0qwBO3AgV3Pdbwb0ZBEb
X-Proofpoint-GUID: DiOToZXT8Yjb0qwBO3AgV3Pdbwb0ZBEb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0NiBTYWx0ZWRfX/dK6oUMo1D81
 tGcL27tVTxRE5YoW2U3DawmrbcoTnfeqWJjYUz7vmiu8YyyiuBYDfu48ovsDAWFpAONa7ohFGFg
 izqPxhM0fCjuwiWwUe0oMsya8ahQLDFSn2aa6eTqgUiOr3vs8xYgN8wL9zZZ3NjbjHGEjEPlpfB
 d+KIolHLNls15jK6IancAzaGmf2zhr/Ir43W0EtK6lGaWHmbVE+DAkt/LYNTBLUkxmBNE9MbPsE
 AjnlklZtBSdUOsaVtcC5uVZxXu+an31vqYNfJypSLRPFEUaITqXeCYUWslaUJmeUY0QDQVWMObB
 edynopLP540y/I3p9ZWtFSPIAjMQdEwnVD1e8bI6O4TmJhD/2c5VP9/Tz/R5sd+3IfGgEJEEX0v
 /KQXhDLVkyLdIzcdi23yU/fRLc7sVrHdJ7+7LfI6xtLhFfw0R+MdZA0eHe/9tnzfghkX9FRQCWk
 GQ8/M1dSOc0ykZmv/5w==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a9513a9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=wa7QpaTpAAAA:8 a=Ydnp389x0cl5jbVLM_IA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=ehqneT2-Ts4HTEaPPMaO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0NiBTYWx0ZWRfX2GsKnovCs1fR
 /819QV5dxFfkbJxNGnE9roUBmhbf6H0+Y/nhRD0+oEGxbrVJKXcHYkv0hLmhgY8My7ofoyWL2f4
 sM7MeomsU9sGAGZsUHqjTmNSSBuma4U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310046

BT_RECV_VENDOR_PKT controls receiving vendor HCI packets over
HCI_CHANNEL_USER.

Disabled by default to avoid regressions for existing applications.

---
Changes since previous version:
- Rename BT_RCV_VENDOR_PKT to BT_RECV_VENDOR_PKT
- Change @enable type from int to uint32_t
- Improve the commit title and message
---
 doc/hci-protocol.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/doc/hci-protocol.rst b/doc/hci-protocol.rst
index db10b35df736..3cb5ce09bb2d 100644
--- a/doc/hci-protocol.rst
+++ b/doc/hci-protocol.rst
@@ -131,16 +131,34 @@ Example:
 
     uint16_t mtu;
     socklen_t len;
     int err;
 
     len = sizeof(mtu);
     err = getsockopt(sock, SOL_BLUETOOTH, BT_RCVMTU, &mtu, &len);
 
+BT_RECV_VENDOR_PKT (since Linux 7.3)
+------------------------------------
+
+Control receiving vendor HCI packets, requires hci_channel to be set to
+HCI_CHANNEL_USER.
+
+Default is disabled.
+
+Example:
+
+.. code-block::
+
+    uint32_t enable = 1;
+    int err;
+
+    err = setsockopt(fd, SOL_BLUETOOTH, BT_RECV_VENDOR_PKT, &enable,
+                      sizeof(enable));
+
 RESOURCES
 =========
 
 http://www.bluez.org
 
 REPORTING BUGS
 ==============
 

-- 
2.34.1

