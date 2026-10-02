Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B415F42E8F4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931126; cv=none; b=i6b+RkYURZkaht8CmJQDelj70uu8dy2sLCIBdeAF7Da5owVShnM9makI2icR8v5yfe7JsicjpzojLHjG0i+ys2leVohp3xV21xeyQ5r3z6fnfZ1kJJ4aesbDzcl0g+lTtEe4Fle5+VK1Qqphhc6oREaxBjtw2rrld7P1GWoCk5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931126; c=relaxed/simple;
	bh=hVwQCzCUVfRxvw/2Itw67jSlR8bgByNRggeDv/nTJpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gOzsCZiagV4a1gRA+km0aRActxgvUktr42GrLYzG3Upxb4VNTv/Ku4gTP3TAuwjq47NtkUUSXDItGPCeCyofeKOfosh9qfV1HKpiptx8VXOcY43r9LnYKtc6+mVa4PPuyLnexfxhhATdOcyeAJPKw5SB/v2oF3MJiU3Ush05bys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cD4qiwJw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gp48u/0V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cD4qiwJw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gp48u/0V"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jsCj036978
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 08:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Qiva3P9QlNLK7cQUkmFLZI
	12yKqi2cNC+lMiXVGWdk0=; b=cD4qiwJwlZVo3MXt1OVqj7uRs0DEIKxrXx1zfR
	ecmHxGIQ1wJXX9SkHlVFMa/W7wkdv0hLKfzZH/OhslUgwcGus1p7nY2r9No+9gsB
	hlKvVhsO8YZ/UNEM0/PjAWtx9bIa4+7fZ2GGkeXy5bx3OYhjXhsP5I4iaQZvJr7Y
	O08b5xLbekZU0WFULm4lzZ6tbJq8Kjmgr07Q58+cbXsB1EpDscjSyNAVDMKTUb8e
	wK8g+zUd19vcdyNSLZltQKVYpBKHGvuqK64HZmbhZrEik9bZuHkE42JoehTl/k35
	z2vjquRbJNfBgzr1YR0s3HHq07ysFawSLDwNqRcUdyfnB89g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1tbgb9u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:52:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so384156785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790931122; x=1791535922; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qiva3P9QlNLK7cQUkmFLZI12yKqi2cNC+lMiXVGWdk0=;
        b=gp48u/0V7ySZpxcjeMDN+yT6Xv90xWTUwAS9EoAsyc0xEZcrutyYvCsq6ZIsbTkro1
         QBllsON6CSCr5Nj22Ycc2H9cMZBpA4YqZX7vTVLFwihEvAhPyE/yGBO87DMlOadFNyYV
         TDS97gkk9scKrXKGR0xswPAuriQZu+YRJD45nhpxG1uLBds0wFZmUwJvbuyPtZ8Uxgrg
         bmGIgaaYt4bPgOiw7TIaieJqjdiZff6ckwVrXEvqOPAFvNNhF5C/wSFA1+Crzhlkl3r6
         /tmChhe/MxqTDRzi65TDikp30uq/TQhdbSKY6I3hXH4jml5WKJ5yCFCHtNg9yMnR4q8q
         A8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790931122; x=1791535922;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qiva3P9QlNLK7cQUkmFLZI12yKqi2cNC+lMiXVGWdk0=;
        b=y/EZhrVs2Sb2EB3R0ZIycS3aRL87yyEhm26W6gwUmHp8N5fM6MhmAhwsbiVsQefXCJ
         +hB7SGol+ymdEBVEMY8IvWnjnfQvYkbT2+cVM1fsESIHUlt5qRph7inh1FM/Y9txv8ks
         /FP84z7DgbmUXCom+njLwYI9F+wDtoz3f45VkFQ5FfgYDzsPR2LfsuIDpBKSMYAGj/oc
         aiNVl5vdyc16U+4aufGgzbz5XJtXg/GfZYNbC/DztyH4Ku1oPmzzpEvxLvpx807xhbzN
         IfBQkKvUmM4c3abkhFDXjSAV5zhv2NJd6e/D5EWx4lvl5nLgC6Dc4b99B2R9tmtQes5s
         9LIA==
X-Forwarded-Encrypted: i=1; AKwUvBwxAWovvHe1x96tRC1yXDfEkZk8neCikMb9e7CRpvXheQXkPhYU9Z79vqh0PJrORlRZ0Pf9Yy4fUKWR5S8=@vger.kernel.org
X-Gm-Message-State: AFuF++kapp3ZGw+M3naNTkRJY/BXa9eyTwcWm+X6tFM2uNLoa5MMiLsh
	P41TLWqDHkTqZC092QMJpWGbRxk6q/1mTFJtf5ZitSprGupIrVRqtdDuT7mcLOYWPMZuSutkazK
	vRQOSuWqoeN59n9USrvWem1Pq6nv5ptx6jNXDYexkX+fAH0Go+kAb6/s8dER+91OpiTc=
X-Gm-Gg: AYBFou3DHMcxZe6kyvmVP6J17cpHwwvf1oM1/CQ8D2y+I0XBVPEHyGYz29DRPmSBSuI
	pLFrAfHNZjA6ZaEfdueOh2WWKM/lHerBsKZLCOR4bHMUAXOLPioNFSM7eQg08Z4jkhN9aZEGgmU
	flgE787HD6PFXUPApTPvPsDJcytz26EU6mIA2QTYy3EuZk9uE7YTxYeYAjRjPqBEM1ZhbEC7Yjw
	t3QQBRfYJLfKmnJU6nouDmwAu8gZaeoHHhlbkSI8ysl9O0hnwEOa8w/OVaNctmc7OiqZOoj21+4
	qZgxrXNp7fZG4jNxiSBgK1oeHEtFguYyTmnD40Q2Ro+SOvO/bHmmxld7UnsBfdWXBlLHDbLFODd
	x6HXSDr9SRDcLnsYRbh5F4Gq3ma0K
X-Received: by 2002:a05:620a:7111:b0:93c:8544:6ad8 with SMTP id af79cd13be357-93cf16de661mr349882285a.28.1790931121612;
        Fri, 02 Oct 2026 01:52:01 -0700 (PDT)
X-Received: by 2002:a05:620a:7111:b0:93c:8544:6ad8 with SMTP id af79cd13be357-93cf16de661mr349879185a.28.1790931121041;
        Fri, 02 Oct 2026 01:52:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104f89sm4680561f8f.30.2026.10.02.01.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:52:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 10:51:47 +0200
Subject: [PATCH v25] dmaengine: qcom: bam_dma: free interrupt before the
 clock in error path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-bam-dma-free-irq-v25-1-f39e01d19910@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKJwv2oC/x2MSwqAMAwFryJZG6jBFvEq4qKtqWbhLwURxLtbX
 L4Z5j2QWYUz9NUDypdk2bcyyNYVxMVvM6NMBQAZco0xhMGvOK0ek3JxemL0sQ3kutg6CyU7lJP
 c/+cwvu8HmgSmTWMAAAA=
X-Change-ID: 20261002-bam-dma-free-irq-cac4b268c465
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org, stable@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3131;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hVwQCzCUVfRxvw/2Itw67jSlR8bgByNRggeDv/nTJpY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqv3Cq6QO+/JOipZx1bSxR4XL6wfPPDB/FEzUOX
 Ows75CaTySJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar9wqgAKCRAFnS7L/zaE
 w3FSD/9OpFXDiBntLFPnYz+Re01JWPxn1X6epggjdDWMFMp3HI8ayErb8YyTV0okRqKOXrzLQ6j
 nns8OfiUXTp5HMZx0WLuGwqb2p3UYZzPWihxfiCf0vCsDMZiHNeBG/BZx+pbUTYrcs7zGcyI1Ai
 /2N4b/QXHyGX7jdyntYPDenE5IXtejMAIMsQpNxSSid9KKvM1G4WVxqKbktCKFDgmc1lDUg7gix
 iPXhrmffy+EhWyE92qsH1G31yFrbxCqAixSNs3T72f6MrjUdwqm+V/Su9z53lwoYCGvfdsjcDqJ
 2+Lrzfjq78Cn8R1aweGGR5n4slcsoXYOs60lhKJOMk2FEn+dl94/+tbVs5fPVc/Gydkl7njAR0I
 wGb1Vd3ZIY5HyvYlNus2T5pwcMHMGb6okbrpDbMzjIERsPqpgR0Q/58SH3oG5HMvO0uOKUFnBgS
 ZbmyO4YwfmKm436r9OMKgN7cFGgOWDhan4omoFNzY23MojMUUoAWpX1EeuRdR/6dozc71hM/INf
 w76EwUn9yLNfdKCEhiKiULathriQ39VZhvHxvT0cmuPnqDSlwDpi622m8jyn3fMmDpHF+PevaBN
 XI2Sk4ZT2OEPn7m1CyqNkOwWcXjiudtfbU8/CbFZELUnlb4GdJwSGTEkL5e8Te9J8SMF662mlKQ
 CGOTRrXhk8dqyqw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNSBTYWx0ZWRfX4ywg03LlNo3y
 o8qMU+hFtlYW61r5q2GNoOcy/0TIt/MpRf1EbiswtVXNZQ/7xzhF88xToqps8ArVWUhkedNFk0D
 OyLzVNS9sdYyTbSzeaaLY0zhfMHpEj8=
X-Authority-Analysis: v=2.4 cv=QY7zLcbv c=1 sm=1 tr=0 ts=6abf70b2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=sdHaY_b6le-me-Zt7agA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNSBTYWx0ZWRfX+t4SUkbwCJ14
 uHiu6kG4nPhYf/UQDKiAaoZbZCltgVIxS230qAGLA06UtaCWs6tM1ZOq94dqgLQ9len60PteWDR
 F4/XXCJXpGRdQ14AUHqOd67a+8V6SFzXSKrOKFx7JEMxtyFaFhy3rUJEVDVqR93z1/GHKwyDeRT
 LELTpdV75RsYTn2hZKLRYV9lKD+teF0sbLMIKP0GiC8utTw3NEsbMSRijSRlBxN6xu4m/tmeUBC
 7WoN1OLAkiadGFfDCYABPT6KRWx6xAjuyZN4eHccWVZXriyRgvulb9/LqDXsl/S3jTiQ0Rv8byV
 BlXWsdEd246hrrIBNjWZCXEdzY6tGvJ5uTOZJnx9QkRZbMyCw4FcZrM9dmD2+4fY81L035b16Pu
 YTZJo4plxY5jakgQSWXso/qUYL2duTjh6QiziQA2NVxdNnqXpLWFclg97hFMfVPPsIsbyiIz8Tr
 dr5GwmcMr46AH2KiMwg==
X-Proofpoint-ORIG-GUID: cWR5nk-kYb3b7u12dkWWiEoWn6pxeDND
X-Proofpoint-GUID: cWR5nk-kYb3b7u12dkWWiEoWn6pxeDND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020035

The BAM interrupt is requested with a devres helper and so on error it's
freed after probe() returns. We disable the clock before freeing or
masking it so it may still fire and we may end up reading BAM registers
with clock disabled.

Stop using devres for interrupts as we free it in remove() manually
anyway. Add an appropriate label and free the interrupt before disabling
the clock in error path and in remove().

Cc: stable@vger.kernel.org
Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=2
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
This used to be part of the larger BAM DMA pipe locking series and never
got picked up despite months on the list. I'm resending it separately.
---
Changes in v25:
- Don't touch remove(), it's not wrong in its current version
- Link to v24: https://patch.msgid.link/20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com
---
 drivers/dma/qcom/bam_dma.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 05a3b1f9e0c23dc5f861488fae03494867970523..a626746b5c93496e5c5e885b35a856d38c284448 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1332,8 +1332,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 	for (i = 0; i < bdev->num_channels; i++)
 		bam_channel_init(bdev, &bdev->channels[i], i);
 
-	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
-			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
+	ret = request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_HIGH,
+			  "bam_dma", bdev);
 	if (ret)
 		goto err_bam_channel_exit;
 
@@ -1366,7 +1366,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&bdev->common);
 	if (ret) {
 		dev_err(bdev->dev, "failed to register dma async device\n");
-		goto err_bam_channel_exit;
+		goto err_free_irq;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node, bam_dma_xlate,
@@ -1385,6 +1385,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 
 err_unregister_dma:
 	dma_async_device_unregister(&bdev->common);
+err_free_irq:
+	free_irq(bdev->irq, bdev);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
@@ -1410,7 +1412,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
-	devm_free_irq(bdev->dev, bdev->irq, bdev);
+	free_irq(bdev->irq, bdev);
 
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);

---
base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
change-id: 20261002-bam-dma-free-irq-cac4b268c465

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

