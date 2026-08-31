Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960973C8C71
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152654; cv=none; b=MeRYnU+kNiNplwZaPrneNWtkgPr4+GmWS3uCPPMMAmItZxOoAkil+WK/2b/ILGDNJHPoorxXQ8/KDmafl+DVo9wI6dP6ZxkRxvXFT7VYjLZFBBxMjAS28VmYO8WgTFuCsl6cLa33ISMfa5sHHFD4A50rIg9h8w0ocxxIEh/aPMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152654; c=relaxed/simple;
	bh=uj9ZUydfehOQKuz+gsUAVme2z8VoDIogLFBKWMwrTMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEvgOd+U7BfCKRzLrLXdPqbLKntBEkzVO1GLkScXSd96q6jXYeQdcYgDD8RFp5sNfbY3vQRL2rs19DqmMzQBHXBYJ5z+xG6VDHusYlq2vNPuezTsrgYKZpld8zFNMrj+2ocZKj0eqNXqyBlFSIU1G5tr8zjWGAUmQxBKJIq8i4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIfMfd5T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GUVeBUWF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIfMfd5T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GUVeBUWF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52bot2764511
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddfJOz5sSb0oO3jKcFpnIY8t7Xqi8+ah7tn0Hg5wYEA=; b=VIfMfd5TIKzaWFLG
	XCdRGDG88hLGEwTLWyikHn8eMvYkIqSMRg2N1CUBvhjRjFxYtgKoA12QngL5iujA
	sMHdPLFjOTI5lT1aKHiuUVkIkEMvDrZWn+fcZnHT5DnL13xRp7t9IcrmQfyNZdp8
	8XKQEgiEbFkx02zfuLq4wdYZSF4b8ypi8LX62D1hlB0AmKBelzGgyJpj3LPaze3J
	hBCc821DeIH6o7IijOoprUFO5iU/+Q5PuGAHgwWPfzZCa55gUONuUlbwr4na4G0/
	CVr67YR51H1lZ9f98H43P4dn14PyhsI4KxOKfQ4MlqXUucBWTuklQ/4bwug85E+4
	bRGTnw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgymncb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:04:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-384d033f7f5so514241a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788152650; x=1788757450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddfJOz5sSb0oO3jKcFpnIY8t7Xqi8+ah7tn0Hg5wYEA=;
        b=GUVeBUWFqCUuFLUxP+b1uSYxAXaYWjaR7FqZAMIJcFITCkX2uNIZjrJ5BoYLf8PTD1
         901sTgUsSQPvAJqs5k9COeXswzfRdObZcn2GcT0hsIFZa4+DYYE7dDcSb0kUvVeQ+tkq
         6pccZsyyz5IJN6YDNCgslKQizEQwJIgbXo24paW0ldTV+ny7yB3/SEc/U+8D7XS+z4a7
         FLf6l00tpt1FXSyGteX3YGxXygZrwsQevWdentRBTM9cVMutfhzTzDP2SmYLhfmJegvd
         DREZehUw+gUU6kWIu4gR79riyVhjyuKbEajTp/m16xf3a1plYzIgCkrgvtl9NNOPf1eR
         rykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788152650; x=1788757450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddfJOz5sSb0oO3jKcFpnIY8t7Xqi8+ah7tn0Hg5wYEA=;
        b=fW7rwuz+ozvRFOAplM7IUZXGQ76JvogymlAIabSzBe6ELertS+3w90lpzoPt5as5ov
         VlHbieeZdcIkYvWzwYWJoGVrtqKEs6Ty/VeWXi9Hw2/iC08dGH9P9K97touQ/QQM1Yyq
         mjuSaYpGZNjxU0b5A6xkkffU4Zri0WKmByu4Po3sKS/WwNy7YiK0nSNMY2sqVwN7OYfY
         /fMpzWIp/Usp7RRhXz9PGMQFb4L+w7YF/j6aOvAUug62u2UGbPIuWnwHXJD9z81pZNb2
         EuuI3mSuDKcc4iXGg7A6BU4/4y1T1r4u1cUB68GnrsvCctFuuepKnmEo6+g+tbXrtzO0
         wU5w==
X-Forwarded-Encrypted: i=1; AKwUvBw0k5/1el5fONxJ4mxMiw6gmNFO3Mpk72f+kgNcAXl6eReQtmQ6XdMaV3WHIg87UyFe7GHAWT4BPyGP5co=@vger.kernel.org
X-Gm-Message-State: AFuF++lB+4jKtCBriv9wjViCBAYF1xEJZrwScGlZsVt04kxhBVv92sK0
	KmAzCxF+8XOnRJSZ3FJBsy8l+w24fbG+nOLe/FcwHwvQzZRnV2J3ArPrmjvFv3Ze72ICYFarCGG
	wE+4wTi0U5MGSW5I+5J27tIepZAPBi63b8BA8MzPqKP66RxDj6E5oRUd1KbF9mFzApZA=
X-Gm-Gg: AYBFou3avrzDq1Y6p8oVBErRKp6eySc3ZqUa4tzoNy334nzXb8jCd9jeXxGozLPnf/I
	6QvodWoIa7gze94fSLoncaBMHSsnVjILc9YfAErpb0LotBiFctVugWS2wgNeUao1Fvu7l1fr/Cs
	jgeJtvAmkHor+AOStW1Ev6CnUKNSIEMCYfF0KHWVAezHM80dgffTg+lBlh5UkWYMz3UZqJnKhpJ
	//TF87IO/cmR4p05m9DNxkg5zSFQ0gSiEgv5IV+oin8wHucKaQzRxBFg0w566zpsT+iw3gpZYNr
	4KYaYTyYmRjAaqSYI54VfFD+uKVJgTII/gx/VqFAcwOTzix/heA8cGeymm0i29IcK4yN3Ll76pO
	J40nH1sZDvozQWHVvNecOk0+2QxjkugCDnxTWG65lN3VE0lY=
X-Received: by 2002:a17:90a:d2c3:b0:398:cee0:67dc with SMTP id 98e67ed59e1d1-398cee06896mr4490174a91.5.1788152650197;
        Sun, 30 Aug 2026 22:04:10 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c3:b0:398:cee0:67dc with SMTP id 98e67ed59e1d1-398cee06896mr4490154a91.5.1788152649794;
        Sun, 30 Aug 2026 22:04:09 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0df264csm43017912c88.14.2026.08.30.22.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:04:08 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 22:03:52 -0700
Subject: [PATCH v2 3/4] Bluetooth: btusb: Build the driver from multiple
 source files
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-btusb_qcc2072-v2-3-5c0e0c9dd98b@oss.qualcomm.com>
References: <20260830-btusb_qcc2072-v2-0-5c0e0c9dd98b@oss.qualcomm.com>
In-Reply-To: <20260830-btusb_qcc2072-v2-0-5c0e0c9dd98b@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0MSBTYWx0ZWRfXy45FHKkTPqM6
 941RlF3vT2R4Dup1gWO5lbDdgwSiWZ29ddDf/yWwZCgjyysmE84y2cCy148IYQZoMeE6fb6SV0Y
 3QK1M4WfI7YOoMOtYMZYUPBMnWZ2lSQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0MSBTYWx0ZWRfX3PxVwUxS1/eq
 sXzWeXFY5nAphGKF0K9lzID3yQOu0jPRAYB9D+u74O8p/Ww/9i8IZcPEt5eAR37eAmT+QcJNj3+
 +965vmDzb5p7PrIDc2wiiaY9ZUducfPJJGW3ORvUmN9jTTZLGLGqqZ1cceXJRqLCanI3Gpureyc
 jAX71xbwMArY3uyxY0mtsEx9+c89QRwsr6MZ4vLX3sYKN9dsDCY5s7M4vNDsaJUlWU4Meq9/UTX
 p06efxJLW4V53vO8hYFcJdul6jBUQO6wofHyRsLDebvisLbMqEG0NKwoe6gnCg2zyr+W1MT70fb
 8777h1GqZSWuue2CNNb1djLA5qX3zxOY+qB+D10alglU/y6vU8f36if1xm5QXKWq5ePZMLFgata
 UQRHy+swqgdZPmlkJ2c1VvQQL72DHUQvW9H2hUeQa0nD76SwIE++Idecvikn2HidU3gvx782oed
 LjoQoa6EK3fTZZh3Qww==
X-Proofpoint-ORIG-GUID: yOr49IquwaCKpLPu8IsEpoWyA2ZK_XUL
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a950b4b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4J4qWk0Wo-fRNhQ-KTgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: yOr49IquwaCKpLPu8IsEpoWyA2ZK_XUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310041

Allow the driver to include vendor USB-transport-specific source files by:
- renaming btusb.c to btusb_main.c
- making btusb.o a composite object

Used by Qualcomm QCC2072 support.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
Previous version:
https://lore.kernel.org/all/20260714-btusb_main-v2-1-fd32cf15c26e@oss.qualcomm.com

Changes since previous version:
- Improve commit message
---
 drivers/bluetooth/Makefile                  | 2 ++
 drivers/bluetooth/{btusb.c => btusb_main.c} | 0
 2 files changed, 2 insertions(+)

diff --git a/drivers/bluetooth/Makefile b/drivers/bluetooth/Makefile
index e6b1c1180d1d..8b436c6de8b7 100644
--- a/drivers/bluetooth/Makefile
+++ b/drivers/bluetooth/Makefile
@@ -46,9 +46,11 @@ hci_uart-$(CONFIG_BT_HCIUART_3WIRE)	+= hci_h5.o
 hci_uart-$(CONFIG_BT_HCIUART_INTEL)	+= hci_intel.o
 hci_uart-$(CONFIG_BT_HCIUART_BCM)	+= hci_bcm.o
 hci_uart-$(CONFIG_BT_HCIUART_QCA)	+= hci_qca.o
 hci_uart-$(CONFIG_BT_HCIUART_AG6XX)	+= hci_ag6xx.o
 hci_uart-$(CONFIG_BT_HCIUART_MRVL)	+= hci_mrvl.o
 hci_uart-$(CONFIG_BT_HCIUART_AML)	+= hci_aml.o
 hci_uart-objs				:= $(hci_uart-y)
 
+btusb-y				:= btusb_main.o
+
 CONTEXT_ANALYSIS := y
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb_main.c
similarity index 100%
rename from drivers/bluetooth/btusb.c
rename to drivers/bluetooth/btusb_main.c

-- 
2.34.1

