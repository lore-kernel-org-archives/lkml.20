Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793534930;
	b=u7GQ1uolQK0MnK9tUzflEixlVv546B4qy5vvTEv0/z1lqcdLGdGb/meoV1WhHC6Btqza
	 U6g9tnSKw6IkeCy+oPiqnSQjM0q0z7Gq9EZLmIliu7I26YpFJzS370wSp1nik65BSscHn
	 v5JA40a8rJAs0PoUWMGUJUwDCAevTM6snGOgN+sP+7R2iSdNRbt0mN5IRjE9rW9Yvkvtf
	 +2Ondo2deaiQbmEtrbtvx8cqW9UEbeNS7wsjDBquMnMmgyrO8D+E50UMgC+xfGd5ugY3r
	 3jyUQeY/WgLslZNbpAe9dnv9GGQD38IK98QmoDrZGXvQKHoUPp7NFQLB2tx9fmHa3xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793534930;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Lw41xzfI4PjmAlmckTUz53uc2rnxdXGe81m6r+MzrRg=;
	b=pbaR/WhGdZV9iginV2rMbPR+bLB18ApzDvoqAsc+Y6pE5gVFh+B9QE0VYzK4Zhw+C+Yz
	 qvzpN+FP1m6NaYJ1fezEa6te2wnOgwNDKZOD9TLJfMc6seZoCDSXBdxMzFPdgRjOLJt3a
	 tkMsMDX4D9nWuiKsiz/oXSB7g9/ZOYAjPa8iZmZlHnLW1uzlUb+KPAb0LrpeRto8WMUtD
	 jcY2caiJt6j0NfPvhfDAKb36HcV2UoI5NmsITKaIQWWAJhh3CDl3AT+xgja6vIv3jikOJ
	 NvHcnsLgd4NGkugjcu8qunEpo6KFVSOcr77IIH2TM1J7dzaIsjlKaV9O20qUVfoiPpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FF6tw2Px;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZK+ERCd+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEB3606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 12:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFEB3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FF6tw2Px;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZK+ERCd+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1BHG1s1716959
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 12:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Lw41xzfI4PjmAlmckTUz53uc2rnxdXGe81m
	6r+MzrRg=; b=FF6tw2PxbCzAy/U0XJ++z6j5HalRo9AFUq/lm/vHRwZfZer+8RP
	P/CiO+AUel1221YUtc7jsDtEOnosyvwcCNgNwSj0FLC9aMMB/Ypnqe/vQCZ2tZWj
	0KTIrXZx4MnbbACTLXcM5YIkSYPt1VuMi9W5KAHQH2gOkYFRQQQO5SxbdCXWtgQF
	nHS86jXPjlggcuJ2Ipn0YXmGKAJEHmmLGLOwy5Zu8uTQYiJC+y9ka+1bgD4IJOQQ
	z1ebVM+WzpVz+AGUxpzWIt5X7LfP3He8Ivc4dWi+WgZYEVg34tXwKR2c5wdHHhtG
	ZrUu15r2UeyCJT27qI3gYIx2/kbudPEMyGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rudbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:08:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f2fafeaso258934185a.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 04:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793534928; x=1794139728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lw41xzfI4PjmAlmckTUz53uc2rnxdXGe81m6r+MzrRg=;
        b=ZK+ERCd+eOs9Wv01i48ksR163pNoENUhte6b0QKV0+4iPKCgOx3NsM/R+X0TejrQJu
         fB0E6w0pzIfFp2r9+mPOg90lXz42iOKr/jAnIQCPqQ4IVyho/CCfS8osniwbl2QIMrY/
         fD8SlWnaGYw/DvpgLMjo2Bs+33/Qg3abu2/LRTgxYwUqBh2AkWy3H4c9MKXdv8Z5I17H
         GmH7UNKBiwBU+RPhaiFnpcYqQe/kAh1RxP3TylJFq0HYhpBNaM8oTLTRwTavG2FeezD5
         KsjdTH8N4xIIE2yFfPVvpE2nZ5QRlX/B27oaN82Y2jyeOfy5+3fP7r7g6UyK7b+9CvVW
         XDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793534928; x=1794139728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lw41xzfI4PjmAlmckTUz53uc2rnxdXGe81m6r+MzrRg=;
        b=vRnfC3fYKlhW14M8uR0dK/i2Y2wikqyCltABHQLvbRzEagHs6qZ/YOsTcdRxz5mBoK
         jAcroCIdsyPIPYulua02fgTriXYO0siFv8BPMOlhlz3yqMejqBFUKjslhkf76Uk/WUrK
         ITY5j+ktxAmUpyakYY+AFCHy8tknPxg5p6Jx+gPE4K/HeLUhPdXCYXsKER8lG7XJf4Mo
         l8KQCoE1iFShRGJ3lpBII6bFf8Cei2r43HX7OpYHuReTBZOdTUVRysAEvCSjRILvFMxg
         RTBihWHookkWCy4kWxYxlRRn1nVMT289y30t7j7xbG3js4goMcg5rg3sDB5YNtOAJe6Z
         +eXw==
X-Forwarded-Encrypted: i=1; AKwUvBwzrLYexOMbpKfpXf+3nOhfmsng1qN7VVK25BaJ5iR1t8qK9tfSfBRxr/sflXGkRQeB3tpi+aHj6243CIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXmwpZXiLlCo3KNCxFfrHTSO+1QHM6Ojs6C8Fvuwattw3tYUa3
	fvOcozoAQ806XgzpUuoJJpXm/+8hzH18Pi3neAx/Ae0QVKv2S2ItfNGcKb7x7jvw4QaTK3a/ffg
	CpkVXnTreepeNJhUW2nhiYKdjWkzHXOssVEfr0poCSJmSEaOIfdQ87jZPQPTH22RzCrFIoRDPGs
	o=
X-Gm-Gg: AYBFou0USvibrn4aN7PxkXrIPk9uDb5Z7N9E2jC6FGT4LRx/QBZ9txlgqBPCsKxO9bw
	dDzy3C0xB+WzSsmo/nmXirISEKb6JMc1gaKW6lG/slVOlkIYTy8F+G3US2xpmMLTVtdZYhY8fZP
	kxV6PzwFGKjM8DovO5z4V37WRmfmKvX42OeB7y6JPWReXqAciu9TmOO6Qkeo6evovDlst+IWPmG
	8SVGvHeCULkrdLN0iEsnJAiknCCB4kaC1VTkzTWLnjnl1E+nLn5hJCs0EDDTNjrpsPIYTuelQxR
	hZRWPmEQf+mSn0Uol1UFMSQEOsmIVwmyt8qLnfCWVJdN4crddww+KdUbxeQFWUftlUytMVq7ABk
	8qjZmOMX6am/J3bla2rX7ovzJaDYZv0JIufJal5b2dMXxTOVzui4ODD7U9/HfUw==
X-Received: by 2002:a05:620a:2788:b0:940:d8f2:b459 with SMTP id af79cd13be357-944217755a9mr1232089385a.79.1793534927811;
        Sun, 01 Nov 2026 04:08:47 -0800 (PST)
X-Received: by 2002:a05:620a:2788:b0:940:d8f2:b459 with SMTP id af79cd13be357-944217755a9mr1232087185a.79.1793534927385;
        Sun, 01 Nov 2026 04:08:47 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm91318455e9.0.2026.11.01.04.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 04:08:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Liu Shuo <b35362@freescale.com>, Scott Wood <scottwood@freescale.com>,
        Kumar Gala <galak@kernel.crashing.org>,
        Dipen Dudhat <Dipen.Dudhat@freescale.com>,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Reid Downing <skibletz@gmail.com>, Sashiko <sashiko-bot@kernel.org>,
        stable@vger.kernel.org
Subject: [PATCH] memory: fsl_ifc: Clear fsl_ifc_ctrl_dev on probe failure and removal
Date: Sun,  1 Nov 2026 13:08:39 +0100
Message-ID: <20261101120838.36227-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6095; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=C8zhZVnOqh3IOQ+umCnZRkjbv2nT453sTdKtTSgZBsA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5yvGRmCZLzBrWccQj4obomp1T2bWWZRzXZuoE
 C/doDBqcOiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaucrxgAKCRDBN2bmhouD
 1yDTD/9IctnsaHPK2Y/F6hOB1CsvwiHe+nDZWMgV52MOaZz9aOwmMvRvL4FBu2ai5UBmfGJXdRw
 KQbQ1jS2CTCNIHv+GoU6jo8U/e1HfwnLpH02sDKpyluoLg/HHJ0aeQSfyva3mpIK1H8z49pIv9T
 0MccobNUydGaObNOpCYAbCQNgDENeAYS+JdQbb83TONT2Jor5I4iYpZJKH7CVBhmzu/lEo80+oE
 RQirE7NkS0l+OK08AgilLUOUR1A7XB2ykDTMY3GnqRoIrQvT2IxRGMGiomIlVR41qAJFbwBGipQ
 AMmdY3uiAbFeAH5TZzzog+8veuIGzTwpEV+bTPfAHlomgUMCe+ZcsqN8z0w1jcEYshdb87nmRAs
 MhMbM63FxKx03QtPCuEAt93pWI+f/enJs+k0c8T6rbFITLqwBL5p11jp6eig4nutxg2/YiTkz+e
 G5AWSKOvti3PsQBi+7fhnSCesdfXQ1HYo9i+jCkpQtWnRyBp1sWJqTwX+467GlQWOiULOGmiCSI
 M3RN1HvLRWXNBEv1BSqKx99fUYGc8EauC3sV0Iyt1uyPc/ok8YlXv5pn9rdJtsk6PvibymvbbRs
 pCyrJqWC9N2r9+vDNsa4eWY7ZO4VBVvzgT9zknxRHUuD/xqqrtUDWOqYyRgTJ9RxLANNB/3XfCN Gb0aOfPaMP0vmMQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LUaEDg5SYGwpx4-nHzS8PJ6s8sadFy6e
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae72bd0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=UxsxSofaEGUHor0GY1AA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA0OCBTYWx0ZWRfX58Uahv1tnUmC
 NBgbRWUC/1M/UpaiE/UVTO5CaPlm/XZfgRwmLIOwEGPVQ/CIZOmrCcjmkE4z46odhUsSrglRae9
 E7FcbYwyoGfmxbYqgk+xZuNuBLMVELw=
X-Proofpoint-GUID: LUaEDg5SYGwpx4-nHzS8PJ6s8sadFy6e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA0OCBTYWx0ZWRfX8ystdHXndX97
 yrEEi46wTWgmZ2B69HRVbWBM3X3cUXF2Rl8oeeKd2y+Bi9QOxw6AM9hg4JwhKkMX+hRniYY3ZIf
 4SP4Lg9SdvadD+vtsVK47TZMZnOELaj3YM98pLs/RXfJdZhBOSNf3YGloQBIr1/rWqYicFu452J
 STseV/zygTjHOVCjk3j/YQCHWakOWgTR55sXngS9ZUhmKhq57+gIvqPfz2RS4cFnZIQS4aHXzfF
 gPNhPVe/0aYeDWlZ587JsYz86LNsPoWRYGE/k7kvltfMjfo0UnTrT+lcdYE6tacMcQ0/5QGA651
 /BvbCNybQT8pc4zEVv250TMA7vPcmfetAkZ36A5Z9Z72z3k07o0oXWj8TnqCn5NwdKlaVrLV+wS
 8Tv3zdDgeyJjR67cG668xx36wRxPgRiyUImW7s7WGWqSupPaZY3SiURUuV6605W7BYF0fb6BBrU
 a/nfkcGa/4Bc599Bf8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010048

Global fsl_ifc_ctrl_dev is allocated with devm_kzalloc(), so it is freed
when probe fails or when the device is unbound, but the exported global
pointer is never reset.  Subsequent calls to fsl_ifc_find() or probing
of fsl_ifc_nand would then pass the NULL check and dereference freed
memory.  Issue is mostly theoretical, because there are no users/calls
to fsl_ifc_find().

Rework the logic, so the global fsl_ifc_ctrl_dev is assigned only after
device state is properly initialized in probe(), except requesting
interrupts.  This makes sure that early call to fsl_ifc_find() will not
use the device driver while it is not fully initialized.

Clear the global pointer on exit and error paths, to fix the possible
use-after-free.

Reported-by: Reid Downing <skibletz@gmail.com>
Closes: https://lore.kernel.org/all/20261025170833.1316443-1-skibletz@gmail.com/
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-72f58ab4-9f9d-4b00-949c-00929918a3b3
Fixes: 8e0d09b1232d ("memory: fsl_ifc: fix leak of private memory on probe failure")
Fixes: a20cbdeffce2 ("powerpc/fsl: Add support for Integrated Flash Controller")
Cc: stable@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/memory/fsl_ifc.c | 73 +++++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
index 6dcc317d95d4..ab188f151c94 100644
--- a/drivers/memory/fsl_ifc.c
+++ b/drivers/memory/fsl_ifc.c
@@ -92,6 +92,7 @@ static void fsl_ifc_ctrl_remove(struct platform_device *dev)
 	if (ctrl->nand_irq)
 		free_irq(ctrl->nand_irq, ctrl);
 	free_irq(ctrl->irq, ctrl);
+	fsl_ifc_ctrl_dev = NULL;
 
 	irq_dispose_mapping(ctrl->nand_irq);
 	irq_dispose_mapping(ctrl->irq);
@@ -205,82 +206,82 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
 	int ret = 0;
 	int version, banks;
 	void __iomem *addr;
+	struct fsl_ifc_ctrl *ctrl;
 
 	dev_info(&dev->dev, "Freescale Integrated Flash Controller\n");
 
-	fsl_ifc_ctrl_dev = devm_kzalloc(&dev->dev, sizeof(*fsl_ifc_ctrl_dev),
-					GFP_KERNEL);
-	if (!fsl_ifc_ctrl_dev)
+	ctrl = devm_kzalloc(&dev->dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
 		return -ENOMEM;
 
-	dev_set_drvdata(&dev->dev, fsl_ifc_ctrl_dev);
+	dev_set_drvdata(&dev->dev, ctrl);
 
 	/* IOMAP the entire IFC region */
-	fsl_ifc_ctrl_dev->gregs = of_iomap(dev->dev.of_node, 0);
-	if (!fsl_ifc_ctrl_dev->gregs) {
+	ctrl->gregs = of_iomap(dev->dev.of_node, 0);
+	if (!ctrl->gregs) {
 		dev_err(&dev->dev, "failed to get memory region\n");
 		return -ENODEV;
 	}
 
 	if (of_property_read_bool(dev->dev.of_node, "little-endian")) {
-		fsl_ifc_ctrl_dev->little_endian = true;
+		ctrl->little_endian = true;
 		dev_dbg(&dev->dev, "IFC REGISTERS are LITTLE endian\n");
 	} else {
-		fsl_ifc_ctrl_dev->little_endian = false;
+		ctrl->little_endian = false;
 		dev_dbg(&dev->dev, "IFC REGISTERS are BIG endian\n");
 	}
 
-	version = ifc_in32(&fsl_ifc_ctrl_dev->gregs->ifc_rev) &
-			FSL_IFC_VERSION_MASK;
+	version = ifc_in32(&ctrl->gregs->ifc_rev) & FSL_IFC_VERSION_MASK;
 
 	banks = (version == FSL_IFC_VERSION_1_0_0) ? 4 : 8;
 	dev_info(&dev->dev, "IFC version %d.%d, %d banks\n",
 		version >> 24, (version >> 16) & 0xf, banks);
 
-	fsl_ifc_ctrl_dev->version = version;
-	fsl_ifc_ctrl_dev->banks = banks;
+	ctrl->version = version;
+	ctrl->banks = banks;
 
-	addr = fsl_ifc_ctrl_dev->gregs;
+	addr = ctrl->gregs;
 	if (version >= FSL_IFC_VERSION_2_0_0)
 		addr += PGOFFSET_64K;
 	else
 		addr += PGOFFSET_4K;
-	fsl_ifc_ctrl_dev->rregs = addr;
+	ctrl->rregs = addr;
 
 	/* get the Controller level irq */
-	fsl_ifc_ctrl_dev->irq = irq_of_parse_and_map(dev->dev.of_node, 0);
-	if (fsl_ifc_ctrl_dev->irq == 0) {
+	ctrl->irq = irq_of_parse_and_map(dev->dev.of_node, 0);
+	if (ctrl->irq == 0) {
 		dev_err(&dev->dev, "failed to get irq resource for IFC\n");
 		ret = -ENODEV;
 		goto err;
 	}
 
 	/* get the nand machine irq */
-	fsl_ifc_ctrl_dev->nand_irq =
-			irq_of_parse_and_map(dev->dev.of_node, 1);
+	ctrl->nand_irq = irq_of_parse_and_map(dev->dev.of_node, 1);
 
-	fsl_ifc_ctrl_dev->dev = &dev->dev;
+	ctrl->dev = &dev->dev;
 
-	ret = fsl_ifc_ctrl_init(fsl_ifc_ctrl_dev);
+	ret = fsl_ifc_ctrl_init(ctrl);
 	if (ret < 0)
 		goto err_unmap_nandirq;
 
-	init_waitqueue_head(&fsl_ifc_ctrl_dev->nand_wait);
+	init_waitqueue_head(&ctrl->nand_wait);
 
-	ret = request_irq(fsl_ifc_ctrl_dev->irq, fsl_ifc_ctrl_irq, IRQF_SHARED,
-			  "fsl-ifc", fsl_ifc_ctrl_dev);
+	fsl_ifc_ctrl_dev = ctrl;
+
+	ret = request_irq(ctrl->irq, fsl_ifc_ctrl_irq, IRQF_SHARED,
+			  "fsl-ifc", ctrl);
 	if (ret != 0) {
 		dev_err(&dev->dev, "failed to install irq (%d)\n",
-			fsl_ifc_ctrl_dev->irq);
-		goto err_unmap_nandirq;
+			ctrl->irq);
+		goto err_clear_global;
 	}
 
-	if (fsl_ifc_ctrl_dev->nand_irq) {
-		ret = request_irq(fsl_ifc_ctrl_dev->nand_irq, fsl_ifc_nand_irq,
-				0, "fsl-ifc-nand", fsl_ifc_ctrl_dev);
+	if (ctrl->nand_irq) {
+		ret = request_irq(ctrl->nand_irq, fsl_ifc_nand_irq,
+				0, "fsl-ifc-nand", ctrl);
 		if (ret != 0) {
 			dev_err(&dev->dev, "failed to install irq (%d)\n",
-				fsl_ifc_ctrl_dev->nand_irq);
+				ctrl->nand_irq);
 			goto err_free_irq;
 		}
 	}
@@ -293,15 +294,17 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
 	return 0;
 
 err_free_nandirq:
-	if (fsl_ifc_ctrl_dev->nand_irq)
-		free_irq(fsl_ifc_ctrl_dev->nand_irq, fsl_ifc_ctrl_dev);
+	if (ctrl->nand_irq)
+		free_irq(ctrl->nand_irq, ctrl);
 err_free_irq:
-	free_irq(fsl_ifc_ctrl_dev->irq, fsl_ifc_ctrl_dev);
+	free_irq(ctrl->irq, ctrl);
+err_clear_global:
+	fsl_ifc_ctrl_dev = NULL;
 err_unmap_nandirq:
-	irq_dispose_mapping(fsl_ifc_ctrl_dev->nand_irq);
-	irq_dispose_mapping(fsl_ifc_ctrl_dev->irq);
+	irq_dispose_mapping(ctrl->nand_irq);
+	irq_dispose_mapping(ctrl->irq);
 err:
-	iounmap(fsl_ifc_ctrl_dev->gregs);
+	iounmap(ctrl->gregs);
 	return ret;
 }
 
-- 
2.53.0

