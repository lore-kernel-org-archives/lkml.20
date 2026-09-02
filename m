Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3D33CB2DB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377638; cv=none; b=gfY3yirGU96NEZnYn7TJNkPO6a6l0csKlv4wq6Eh+BxlORt7RFOAIpqDtdPBGTb5Pk7UuSkCzMxeLQeI1AD/KiMvN6RGaEvRe6AWlxb11M6JK3XRE5vH3GCyHzziHXzbA6P2ALeZh0aSf5RjXI/pgpb16oYOjbww4r+waTTLcvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377638; c=relaxed/simple;
	bh=Crm82oV7JVqGnZOIfCO8NwuU81rufC4hrXnm6cKBWew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bKjfu4dmf0ivScYjAkCaTU9VoZTp3VmgSyKPyA7qgAyfXIbJxXUkQKlBm6hUhzLXhyKiBxgXJPigvbB2tx7SlebmjctCSZAtID0OyUcBIoOhJcMHknquHDzLryF8RF4YtG+vlxvWt2nvyTMtJQuByo60zVJFJVMkTsJUmrYR2ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OX4JQ/1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UN7KhTkF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OX4JQ/1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UN7KhTkF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr0t92270755
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9YC6YErE41l
	8W35ksQZbtiaD52ARA7MPQK738ggjJaM=; b=OX4JQ/1cNTWEywLeOT9AktduM0d
	Pcj7mQhhCAiB1R60vhTbqpbcZP3xNDeRyBzV8y+VDoIiabCtck7KBOmtq9gb0rmj
	jzPRkPY+IDp2XTnOcQ/9EbSxLcMNg6a53uqOaIm6pVe9/Bu4M604WtzEiO6Mwfnl
	jNlO+QQtoib6crXTgjSzwQMj6YJsZuD89OdoaPnRjeYmuYg4Ga0edOT8d68XQS4J
	1k3fXYW9S6PpiNtiYGmwo8CxPQTOKDrqNd2iX0NKCDrkS/oyzrdOtEGk18k2UvYe
	FQwwJGXpHzwKM+sDFGJT3eYmL1dVU5vYU2hoLV7CnXqSnyzs2uRXFunoICQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2cace3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:33:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d94f086fedso1984785ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377623; x=1788982423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9YC6YErE41l8W35ksQZbtiaD52ARA7MPQK738ggjJaM=;
        b=UN7KhTkFO8gxx7X4z7Sk9yuczWdnWKogoM/3YnYfs/SiQwclzFqOhGA6RjojHYwzrR
         V6Ml3z/uCJU0j0Y2p26tyd8tetKBP+tB7z0uncDutzrKJoaPnfFM/IWmhAaG/oJ52tEQ
         s+qLBlvN5vB+1xyEcGGFQbqQglw9rsYw+4FpJNCxCcb+w6IQgdXmdx2o/JdJrk6hbDYF
         SsXbjaKJMjeftcJh1KrNFWelCPvd0eLPZUCC+nqY0QFsqzHTXVbDsKM8+Gte8ZI86WNJ
         bjDxOp9BAOEIeTBLjQ1LejOqoHAUFCVy1XSh1BUgXQl8fZ085huI8mdwl+HwaLL91ylW
         CbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377623; x=1788982423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9YC6YErE41l8W35ksQZbtiaD52ARA7MPQK738ggjJaM=;
        b=Bkh/z8dx7WJ+fmTsyVH+q/BnX989Xlm3345DIRlI3pNMGLWx0JR988592UjGWvvvNp
         rDxDh9UsnX9/SJQVeuz56aSy74vTuAQz1dNTER5YCYw+IK+vwC1DZ7kAYc0I2LwCWA1A
         woKS2Mi6afhZFGnEjqF9VaubZ2CCscZ0O0nZlSw6fEJ9aWR6usZfR9/un9v0A1AOuAXO
         Wxi7MuCH3Za6arI0fCZo6CzPGT1STTIX5oIdaB7HPN7RmBbUm2HGRsNVJgQvb5cvlhWg
         lEJVWtJQiO2uMij+hCrGs5K5PlobtNsxcKpSV4gqXiUN04FNmRqeSRp7VL5k1aqvAm8a
         7YwA==
X-Forwarded-Encrypted: i=1; AKwUvBxBau+Xblo9LPVJzFuijH3CJ+0gdI2wTxoS0Ew8ouscWFziBT/FxtSAZ0lsIWZszbOEg3Abi0jGzI8U3O0=@vger.kernel.org
X-Gm-Message-State: AFuF++n2sXbxwKDyxbyGIa4yI/+f1bQ47E8o4/XVjpmBA5rcOqLC7lN6
	5k4KtcUBpwfhBMlEjIdK6+nZnsteYXrxRZ/ZpKc7c+W7QXfEeigDW5K32tmh3WqlMJiqkD5L2zs
	CoM7MVxGzhyr+lqYaFZl54ys8151sMCM2f6Oe6Neumws6kxBYMQKLmuVTBjGDyoPv77jwddiW/X
	c=
X-Gm-Gg: AYBFou2KMMFq2bO5AYUghVKxAiRWeZusKGaDnDcadHOqz0RqBqU3zy7KhibnIOuKJcC
	wFXiKCf0vQMbOTKup/D54nhZwMog+1jcXnGdXGV6e2cAK7HHhIt66ViCbb8fAxYLVlsk7s6lMM4
	swFrxXZ0JOzv4Ks9hwWCdWit8f0lmj1w+5AubDc2ElCvXf8NiOwAdfruIgBgzlIo9oqqxQXU90m
	vcgA53fr0jH/jg2AwfVm5WTX/I1c25MIWZdQRpx3DlFa9yRQ62YWP+sYDEJsPXyOfLcGvYPupG8
	716N8dQUXodw1xylr5ufs7TUWH+VZOKS2kbHS32VOm5eNEjo3RAmG2EpbrfSWh0AhFnY2fXl5N+
	SXRCpLc+EhlutltwB/XqKPZemeJA=
X-Received: by 2002:a17:902:d4ce:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2daec60cb14mr93566825ad.5.1788377622614;
        Wed, 02 Sep 2026 12:33:42 -0700 (PDT)
X-Received: by 2002:a17:902:d4ce:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2daec60cb14mr93566355ad.5.1788377622059;
        Wed, 02 Sep 2026 12:33:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/5] remoteproc: omap: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:16 +0530
Message-ID: <20260902193318.1996827-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX6pYZSAL91yIf
 Ipdj71zvff630J0KyUVUgn0cYeOBheMPDbxGdhkwBy5LAFjysQlWtZDJNVRKyxIX7Rw9qksxAED
 Ho21UJiNjEF8gynWL7rbVvpBWGv/Q+I=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a987a17 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=NeIE-sOIGFWZl2hhsKQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 0a5cJit13ElFFvUl1FuqFvusFhqEfBmw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfXzj4MFCPX9/6o
 KCpaZmDVfBTPLLH/dpbuYqXYEDw6ERKVNvwoSh9iv3PJXKohDLwbhw1OLCZc73hXyN5yd6SsTx7
 0SEgKXGPSvebaIEKKUhqFW7qpYOmH0FTrOqTBcrDVCxAJpAeVZJ+D+NL9oGqGMfzQY5g0x+vpJU
 9lRnhvMALPmgzr3WfxWvkZtwwbW8YcgFviUFmWVPOTvySCg75/FWtPTHI8carTHHDA3BIOQoHR7
 LaX+oTB+G9tZZ7v7s1A7lm0UwHds5qvNUmoznzGRRzZYRyKfcxsx2wDOg2GeTnfGHITyPRPxeSf
 aVR0bCrj/W5PHWoQLyosWWODwAcYKH5drI+QTDm6E+ypu7is3sO/USbFpPeczZadjATxq7Fkv6P
 v07bkos+tpib1aWI3ClRvEfxgOPMLWzlf79RSMAGIkHtGqWmPXLgixvlScwOFGvbLb4RlmsYE+T
 isguWzq+o52Poc4qNFQ==
X-Proofpoint-ORIG-GUID: 0a5cJit13ElFFvUl1FuqFvusFhqEfBmw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173

Replace the hand-rolled omap_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/omap_remoteproc.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 6ed0f28edac9..74262f873d40 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1276,13 +1276,6 @@ static int omap_rproc_of_get_timers(struct platform_device *pdev,
 	return 0;
 }
 
-static void omap_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static int omap_rproc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1359,15 +1352,11 @@ static int omap_rproc_probe(struct platform_device *pdev)
 	if (IS_ERR(oproc->fck))
 		return PTR_ERR(oproc->fck);
 
-	ret = of_reserved_mem_device_init(&pdev->dev);
-	if (ret) {
+	if (devm_of_reserved_mem_device_init(&pdev->dev)) {
 		dev_warn(&pdev->dev, "device does not have specific CMA pool.\n");
 		dev_warn(&pdev->dev, "Typically this should be provided,\n");
 		dev_warn(&pdev->dev, "only omit if you know what you are doing.\n");
 	}
-	ret = devm_add_action_or_reset(&pdev->dev, omap_rproc_mem_release, &pdev->dev);
-	if (ret)
-		return ret;
 
 	platform_set_drvdata(pdev, rproc);
 
-- 
2.55.0

