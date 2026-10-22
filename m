Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665817;
	b=kFLuJNiM9yzEXt5SkYZ3ilPtRQGILDhO6XIPXCBmjbtY668d/YfBf0AYTty19Dx+0A1W
	 OfCe5LfFawd8eZhUr1MP1irJWa7cCM7SprcXSuIWVBgpqqCvBlkTgOyWjK8qSkxKRBj3s
	 9Raorqwo3xUSLptqo5nbq8TGvJH53LMnOJWTcTgfFqOz1snIsnMMKsNCSpQk6fS5DjfDS
	 UOI7rQQGrQ1pxi9527Xluysd/m/8uLaxRvs/Ojrhu/zeO+FUBJT7MwIM3DiBuvxwpp44m
	 qECcMMClag9jlBBgCCXcOJr84+dTgHFeH6/+8XxRI9fuq984E8KUWTN7ex1umapjw7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665817;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PwdaQerBGB8VsbcjFamZ8BEBVtAJ0iXtzS5m4MtJtyY=;
	b=zPjg6/fxLbQ9mPxuSp44NhukEnPdSENFzBH5IsVIlX1V/F9HPaCFUD2Y/k79QX1NtkvH
	 BilkhS0yuff06SZM5YsZEI+aMCxZei4roE/L0Im1gOnoskjqi9f4nw2J9UjZ4G2by1W7F
	 oJvIVM0FFhA3zqKe3IplScvHwYdcCslqq1KnBKuYF2h6nDPgF9YVoGdQ8Hq/lPvSIHf++
	 kp+laFLcnyoHfRGpMZ//ZJFX7/mYMUOsJtD3a4cZPsT65LikiAETRdW1Up85MIKSM82k7
	 Ys20bNJoxSBLpKU6yrwMzILPEezHcB8D5dpmMMMoqruJLFxqjuUGU8LceolbnPJzxtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cGtFmEJQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YxV/MmdO";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0629606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0629606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cGtFmEJQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxV/MmdO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA06L03115556
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PwdaQerBGB8
	VsbcjFamZ8BEBVtAJ0iXtzS5m4MtJtyY=; b=cGtFmEJQProFGNk6CkQzARX3mrr
	b8549rtK993orTnRw4Qec6eB7DSScyUBbKfAf318H3wovZwqWTqFk15lcZG5WBsI
	829pXhLAqI/zRjSuhl0bvNov8nwF6nUJbeQdDX4gn7Sfw6gEDByE1wPz6pxBKu8W
	ze5BjrpqFP+qfapTILGnIn1IQrq+6cNDVQeMFeG/K6f/Fc0zyx/LSl4RkGJcUG06
	5x4moI9HM59h/uHgiShbp8gyxy2XAFV6s91xeMNBvRChYasdBjqvl+IQlnly64ve
	2zCErlBXy/yeGblzWObSYeufKrV3lw7JCN3C7l6C6iiaUfnROBEe7BJKvrQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bt5mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:43:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9995cea88so17209785ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665815; x=1793270615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PwdaQerBGB8VsbcjFamZ8BEBVtAJ0iXtzS5m4MtJtyY=;
        b=YxV/MmdOpwB4AcjM76Q251+7P06RTa9eFtrpz6ruBelweeQxM5SJ7N2TenXi33RwgI
         tBZ74dnuHHNEVefKuGe892gE/F/djHeeD0bXwySsfic1SohfdYAOjkDLvFtgOuDzFqF3
         sUMI4XxNNW7Sq7ZOKRrBEAI0L3Wtbr2ly5f4T0yYxyuYGAF8VReLrxRXhYTBIqGFMLQd
         /yjMp74Tki+WD9zjbP4uaOy7okGUL+6eX2382iBIdFzxjSyVxHJeliQA7/5XwCiwhTSi
         Z4yl6ydWy831v3hJwUTYl/6nTXCOZoTURidgtTjIaa08hV3STMpRXAdDIiXkQTrlpgXd
         v23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665815; x=1793270615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PwdaQerBGB8VsbcjFamZ8BEBVtAJ0iXtzS5m4MtJtyY=;
        b=LxADsrtOS0KZP6cBbVi8Zd6btzwORgxfTObcSDrh7fMBywl6XvQsBDufuERDuwlant
         /Yc11E5eGrllEFXRTQnMq2WtBxLgB8as3BAXMhkd+Sorc/AoN2WsB3MNkVc/tFcWcRKM
         LwlLh6K27Tk30S0sPbisREpD9eOFjqE98n5qr7HFui9FsZx5xOFxYJo5L6KK8mqTPQbD
         bu5Zmg9YU6AGh6xKmd2GQWjnyRPKBKYilmCDNXALNPoWuGOqLtrPnQDjdTWjAgq5aOyp
         A+XkmBxl+gmwwCjjtx0IGlVgbYK3Y0jOxyGuueCEYigv9ErPOl44lCia4/6KvycNLNvi
         OgIQ==
X-Forwarded-Encrypted: i=1; AKwUvBygmflQWlk7SNFL31rVCDY2bbKMryNjujIh8/y3qqZBwej1HHa/fAH9n7lKBruQa2rXLUcgW+mQZLMZAdk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfTKGF3Vl76IwWE07+6vFhxaEQHNW7U0zjAvHwQC2umfstpIfD
	9Gjg4jJH24MS33l0MA4G1nM81k0OEQdjAP+XG0wokEVT6TkrvwxQT8MC0GCxxwYUATgC/a5mCcy
	gBkB/u2Ot4wcEnPmSsS9nKD9dqRQ5jR8UXNkw/DlUXpvt29MevIyg37N7/Ev6N56ZP08=
X-Gm-Gg: AYBFou0wA3PSHjZkXBmALjGFUbTlYLLvtAcxCrdVA1ASKk/Rer3ULhVdaY2WeNCtbDd
	VSktkWYbPxYziQsEE2VY/trwvIWj6NZrbGDoci/pnbb7VBT6xqQDhzVwrOY/HLaIBDZ2K6yHDKv
	tsPDUHxNfPooRDMcp14wsxsy9cCBtFiQrYrmPHQoCUU62UUvRL7XYaaI+FPO52fkcE24VBdKga7
	dLwQKnM/Yf+60QM+lQsWl3N/szfdfNlAqS65w8wQJ++zaKPfYwJsUAOf1aZ8HSIEzj0fsXOz2Ou
	W44rwpYoJuIJphuFI6D4D17U3zPBeGskskoyARLcR9PjN68Qhd1YY0WV6655MObTZIGdWi7WB2L
	NCZKYB/zQK15Py6BIeJajjDp8xGNP
X-Received: by 2002:a17:903:8cd:b0:2e9:851a:7188 with SMTP id d9443c01a7336-2ea43d8873bmr41711725ad.23.1792665814915;
        Thu, 22 Oct 2026 03:43:34 -0700 (PDT)
X-Received: by 2002:a17:903:8cd:b0:2e9:851a:7188 with SMTP id d9443c01a7336-2ea43d8873bmr41711635ad.23.1792665814505;
        Thu, 22 Oct 2026 03:43:34 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43b53dsm22327565ad.39.2026.10.22.03.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:43:33 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v1 2/2] phy: qcom: qmp-usb: Add PM suspend/resume callbacks
Date: Thu, 22 Oct 2026 16:13:21 +0530
Message-Id: <20261022104321.306679-3-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
References: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX9B4c+OcrMEeG
 t8jGZCE5KK+3DynK14k9CEejXF4h0yYye5ZMrqvtDo7sVdIF6R1PMR8Ipj9+9ZkSGfYqoQNaPZD
 LtVgSPcShNUgVFPr8YrlyynZKu3y1gM=
X-Proofpoint-GUID: 8kDw12cwoAb_jMVSnleOXlUmws8hrB14
X-Proofpoint-ORIG-GUID: 8kDw12cwoAb_jMVSnleOXlUmws8hrB14
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX2etvxzTXc6pm
 XpbcBacoayEETQ5H83Qdoj8QkGj7Q8hISKqAaox3dHFDoQa/6aPjWNTB2FSF2fI4qFDZhSu0Iqs
 dApRl2lqgqFFrFAh95bAvMozdfovHw923j95aoUROXB3oDBFpo7F/6iq/Hg50351BkQE2/HvUs7
 pPGemrbpTUuerZVfc687ix1XKE+uYpUzwHUEyF7wwuI0YRywBxRusb5FshaUXF79SAFjWPZ8gX/
 0Q1UAQBY47hgbV2CKNvr3eHsy4lQK7etz7fQMMKgr1+iVO/IfjNGAmhglcKUU0LN3Eu2S1tIZED
 FTw0mVMD4CMa2iIx/76Oovbw3VkM6B2hMbjRluY3GjVCrnN+jUWk1I4iOqU2PbvqjEEU/AFzbox
 eNdcVugtWuQ21KlxTPPxh1+2xAWeWg==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9e8d7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=AU_F4iWOBUEdUAq3O7UA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220042

Currently when we perform system suspend, the phy clocks aren't
turned off, this leads to power leakage. Prevent this by adding
PM suspend/resume callbacks for the qmp-usb phy which toggles
clocks on/off correspondingly.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index b0790bcf0bc8..d2863633007d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -2150,9 +2150,26 @@ static int __maybe_unused qmp_usb_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused qmp_usb_pm_suspend(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return qmp_usb_runtime_suspend(dev);
+}
+
+static int __maybe_unused qmp_usb_pm_resume(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return qmp_usb_runtime_resume(dev);
+}
+
 static const struct dev_pm_ops qmp_usb_pm_ops = {
 	SET_RUNTIME_PM_OPS(qmp_usb_runtime_suspend,
 			   qmp_usb_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(qmp_usb_pm_suspend, qmp_usb_pm_resume)
 };
 
 static int qmp_usb_reset_init(struct qmp_usb *qmp,
-- 
2.34.1

