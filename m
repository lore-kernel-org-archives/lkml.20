Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A22D328B7B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354064; cv=none; b=LTIo59NeWx6+Z/WiYWnZyyBud4wRyH8r5LrvA7qbeBzRFzWOu2deG/+96ow2+1rhBiG7/oQINxd6Ev6SK9+BDWhdxsL/YJSe0S6Er8RXpvWZA8WPfmsWipav6tbTGLBueekDCj6mNw/KzH+PbCqI95b8gInlAcD17kFvoz8rwzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354064; c=relaxed/simple;
	bh=3QuQQakF3Zi22G3iYl7aYfWmFHhSS6FeB684lImThr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pWnNbC+V7SYAD/TIjydAOa2Xfh5PX6teK8+F1DH9yYQZdYqz+4zbPXdlVFho8q35B9+uVE0PJDR+EX4bC38HYJbWbIyjDLLEYJbmKAfw6H62Eq+2sJjtYzKmgDHDRJIfUiyHccqAs4T5bnx7QFa51dLTJyqt9e6PJ/rmZlp7skI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ilELR7Qo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVRu/BKV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ilELR7Qo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVRu/BKV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2eL192742532
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Brs4thZkb+ADUJ9KGOCW0Dja/RM97Wj6zvjTE185qk=; b=ilELR7QoBtWmhACI
	z+k4LYQ7h+N3oD/TRwLnOTDOhTtrnwm9qlhRqnjO02jr4dNZZWWn2T1fkJFcXx5A
	7itXooZXVpoaKUJHpyiwtZ4PctluAfISd7i1XU+zCN31le5fiqeEh6qb06fwta8n
	3Pp9eIuw1eXdB6k4nEFdZHWqazn01/yjPjViJGx5u6LLzarJWPEC3B7c/QNwDv89
	C0/amaa6Cyc2H8tX8QklzcyJ/1X2p3nruQqhDTA6+t2ZIYMlqH8JNv8OkzOujLyM
	kEdOWGxHzrPexbwcUGeukszsAI2vPVPADpklL00ENLcCr+90Kvxe9zUbsdY3qmyZ
	6n4tdg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018mm6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:47:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39af306c795so729218a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789354062; x=1789958862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Brs4thZkb+ADUJ9KGOCW0Dja/RM97Wj6zvjTE185qk=;
        b=EVRu/BKVZQrCdhCFI90Bmhr5BdzouuMwPExSgexS7uctG0D8SI8BlcceZoDyDVd8Kf
         /7Q16vZOwt4I+b2u02bKOMzxFs9ycXP/MqDAgR8AClvOg3udBsDutm87sTeu6ZC4d6Ru
         lMzm1+0o8IZm22863dbiKevwPhVmHRTyoUjwkckA4CnCkN7VSoHu+c8Qo3ZzrJGc5wrh
         WLxT6f7NuM9XzsW7vuoC5rX8C+1CJzYDsQrQbcfaVnKPZRkomobP99k/c4Zl4D6TnYqK
         irkwTEzvMmgFc5kBEtGO/lVJGY8iTbkD+MakqGDRxNVq+9THXVj53JyV8pDhiqDwVLFo
         6vVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354062; x=1789958862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Brs4thZkb+ADUJ9KGOCW0Dja/RM97Wj6zvjTE185qk=;
        b=HUr2DCZY4+y+//JWmVZjguOE12+433cKu7zScT95060uuh5sGC7q//aFPPyBSpusqi
         pcXSKBNdKo0LCEWQS6jS00j0fTNhv6aA0vv0Ofi1TmPdUzp+NBUiOC1T2IgRoUsG5WFL
         C1xqOLTxpUaRumYy/aXVUX1lAnY6RBdlnhy4sWTLjMgJAwdj4byXWWpRpD1b5JtuqHwd
         Lj4AP8BoERV06JZhPhF+5B1q0D3gipiAdUgZ6GQfnMTPrmMS5HL+/VVzvKUSLFw0EIbr
         SWH1iWTliKc7zqjrmeD2jBtPWF0d6UMFgE1eAZh+3AC2h9h4gOjbmteBEokIaLLOuMEw
         Z+ng==
X-Forwarded-Encrypted: i=1; AKwUvBxn23n7L0s19HJOVGtQtN+09TNp26KshZvHZTK9vJUmP/CLAoax5EyLR0WFs5FAPAflta1Gh9oaO2/6nPk=@vger.kernel.org
X-Gm-Message-State: AFuF++kScPzj+cSrSAZaBnmAUjhvons3Uk8kQAXhd7sb3XoNgwS50lcC
	sJ4txVdUl2pyDCWKFxO/igrXj0AB5RFP7NWGftjrTBdHT4UAo8BmgHZGQ2+SE5iqBUqQcJlZQQy
	x+5vI/F/p/ZrtPMbxNCR1mlfjspv5aDRE5b+nHYoDb2QT/vdt7ipkCfvXQN1ATRDizyQ=
X-Gm-Gg: AYBFou3MbjgesNbsxePkPazakcJeVwbe7VGj/sBr3FSMrzDXvmtF6Yjd+cEKEB/Gs97
	1pGmhoHL0CKnekB2Q7Vl9d8fYACmmd6wmsE200ndNlazh3X/RJ1LA0d4Dhm7OcMnCiUddqt+yZQ
	CDyxPXkSCEANcMctdEdmcFtB/t4vw0Mgt5ygEgMCgnQJJWocJmSQ6GkMviZBfVVsn1Dk6X4a0BL
	VyGkVdhffCjEBzXULAPCAEaLVNtR8j7ghSmbvA05rHzm2UxNuwQGuF31kBJYzWtshuRBYVeW/yS
	NLT72wSpoEsHdYoEfSlEEQwD8u2WTU5HQlg8v0o9vBdrckg3tec9RRynn9OZbY0o6unUypSo/19
	jMuUxjjWNxz4/RS96/r3L00I69PNT/Lp3qKp+52ySasnKqW4=
X-Received: by 2002:a17:90b:2885:b0:39d:e75d:97ee with SMTP id 98e67ed59e1d1-39dec20812bmr943300a91.5.1789354061726;
        Sun, 13 Sep 2026 19:47:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2885:b0:39d:e75d:97ee with SMTP id 98e67ed59e1d1-39dec20812bmr943262a91.5.1789354061241;
        Sun, 13 Sep 2026 19:47:41 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed295esm25945014eec.15.2026.09.13.19.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:47:40 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 19:46:45 -0700
Subject: [PATCH v6 3/4] Bluetooth: btusb: Build the driver from multiple
 source files
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-btusb_qcc2072-v6-3-137898715844@oss.qualcomm.com>
References: <20260913-btusb_qcc2072-v6-0-137898715844@oss.qualcomm.com>
In-Reply-To: <20260913-btusb_qcc2072-v6-0-137898715844@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Pauli Virtanen <pav@iki.fi>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa7604e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4J4qWk0Wo-fRNhQ-KTgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfX0pVfhE4vQqEa
 5rqkpFmC/hnMS408VZF0ezQrEidG1FoMOMfFgtqr8yAN2IT0C3DcdMrzm36fctJGn7SNXf8kiHk
 YLtGxYTxddmzyyhKIeKgwYkL9ciy30I=
X-Proofpoint-GUID: vhHTNRtwn8UNLpIyqOpkdnbtXLt_ER7X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfX8C+SScVIae3W
 x5cC2/5Gn4BEGmrSgCPKMah+zSVGd4nzPKunOCrul092vyAiQWI6ATUJ5vE1o+H1T7c69U/odAc
 rkBwCryq58ZkZ5yQKvTIDsbhxMPW956MDDIHopo50spKI4KY2774KbRAQ5/z1/cXFyCukt/I2iZ
 PG0i3OrNHDntTLcLoPDAjTKXl1BnFT58wCRlQWu/9TQE1UL+1wHjwOGJPaNEF6Qtn+zQrtjqWyk
 R2HDki25JwAM7KeT8tlY5eJI07MG02xO6MjrPCg7FDvRmqGJ9fP60YV3jwxuVWRvrkdTeGRnASd
 g65IufMV2vf8hS5MNcqK/sogjXEJjfo6LjGkhcyBFqL92HHp2JQOw0VLcXIBQOlPFXFUTjCsHe6
 W0I1uI+r3WoCxTmGaVnab7q9TrOh6nr8AIvpSfnmQv0cx9f8LXJzTzrWKVVsffjy9sXnMcYm6gH
 IJTr4mQLnm5IvTrvDhQ==
X-Proofpoint-ORIG-GUID: vhHTNRtwn8UNLpIyqOpkdnbtXLt_ER7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140035

Allow the driver to include vendor USB-transport-specific source files by:
- renaming btusb.c to btusb_main.c
- making btusb.o a composite object

Used by Qualcomm QCC2072 support.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
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

