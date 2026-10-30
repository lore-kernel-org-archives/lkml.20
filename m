Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370893;
	b=VKhJd50GeWgZ/FX31NByxucRxyk7pMYj8yibBzKpnRxe9L/vUcdpaUFRijUIREabnIuq
	 oZMMsd+61S0NYL6z2oushDjCYOrcyp4yIrw57i1N3tDxb2RNOHLi9V6hSNsp4LyeNHki+
	 14fD+ELJtcRwR2LKyBblQLpurXFp2u4fUTGINHkO52ghglkt2CHZ/qvPKGfgfEL1NB2Kv
	 ECJn9gU4N7O16YYFc4DS4ZPmxpFwicTgFvfTmq9WxP5kMiZsV9FmZnV00CfG22+Nbi3n+
	 shNgz45eDEpk2tdsBL03gK3n+GwNEzFRDa0W07R9+ENM00emFoLOJXmnnw9cjcOhS/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=N0tykJ0Xn95O/IYd+de/yZqoluyvubMbpjeJRA/Pdc8=;
	b=MMBUMwUdqNKCA7MHz0a1quLMgWs9d0USEZbIMyRQJP8ERjWfhuWfAeAU7hMOz7zYqQ8s
	 BYLOjdTqVGZjrdhd518DTt5Uqn/haJExz7Vwj0RKIwgIWbManmrtZSYncEgK//kv/3qew
	 ccts8mlyhA/mgbaUHFUmLS9KzJEmP77tWngV0bIQddsHXnKN2gWCaZUdYgSzXcJV7/iMm
	 EWYtHtFBc6PIIRJzmmGBx/XkT0FTBvbE2Ut+keIyA29PDZ2n4YzpP7f0DJXTe7OFW0tRe
	 Qghu6yhgtCdH2W2QrHQR5jAA+WNf02dsmtGRHmFx6Iz4tbGOG8CHsG3cikOP6JT9eXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NaTs5chv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=caj8SCNe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A266606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A266606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NaTs5chv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=caj8SCNe
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UES6Jt3208994
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=N0tykJ0Xn95O/IYd+de/yZqoluyvubMbpje
	JRA/Pdc8=; b=NaTs5chvzAvt+kJZVh+Sl/1U+1t74frI7T9WNo1OUR16iBwmtCc
	ZJEz1IzIs1c0AUsLYX2c/+1Fz0BCnhhqLFh5jsgMEZN6DygXLQxGScCVCNkEQBG6
	JhMPG/N0BBjiaTAHrPFBJZqsrk17sNRPVdls4iDSzm5CfIBYTsIX3PMTd+MdVaEb
	yd6upnByo2YOBnsEHgD3qR4Q5o1dYmgxhh5F9CaLTbihwTCSeRtVg1FewQzwrwhG
	yKY0xJyb9oXBhoD063E16rVNJaso/7HZKJ4WUmQNFNMlb8lfk2Dx26mk+NHSq69s
	8Mdtz8gR+jOfCYg2GEIzwrTUD0MPdhxMX0g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkgu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:34:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c0f07b4e97so606219137.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793370891; x=1793975691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N0tykJ0Xn95O/IYd+de/yZqoluyvubMbpjeJRA/Pdc8=;
        b=caj8SCNepN9HFxEmlqbf0EW81l4TJTywCH7orScZ4eDKwoxzOFVF1Brwc8a9GkZQaX
         h/ERUeDEQlMG2gpgU7PZnt+XkUCBRHPNbXR3HPSYYd9xCSlencHByJ7x4pVqKWkWoWkc
         7E7bSL19RdggeJt6N1pF4znwQV9LDwwy8VWVicKWp/Rq2Ru6Kp12TW1lttaeMAKF0svX
         QhzMxu7blq1v8+tBKtLv2k/aPURTGhS2r0sF9gYVCAcmDcT6NHzhAaslX3pGyAflyupv
         3hVWioDILS55QieqAJJGiliGylMrVINnezlXjgUmS+exKqER6P4DL8dMLe7hcsUgRtMw
         jtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370891; x=1793975691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0tykJ0Xn95O/IYd+de/yZqoluyvubMbpjeJRA/Pdc8=;
        b=I6LrVA9nOveEVITJJ2js3JnE6QFytjgdeWgMASyzA2K3xpVOFRVBJO0X2gYx/4r1mx
         cn+imk1xKAq/Vw2fZOU5llBqh4Ef3IqKLA42vTHSLQhhH7C/MgJMwZZ5WBO1P8um1eP0
         Yujq9VsaqKApgrwTMWPDYceFNsBQyFFKcjqQpqkJQLVZljwGp9mgtcFJVjeNsMYQd1C+
         EWnXOJG6rCI8kRyAGTL9UyBMm7IdBtRvF/y7KYzq6BWzh3ZA98TK8TkZ5gLdF9wzdo9c
         jBU1j4gJggmIaR8IYUnsPlPP0fG5lVVWUmqhwbrMFF8rglTkNs6bfHfQ4E1ZM7dlicjH
         Chpg==
X-Forwarded-Encrypted: i=1; AKwUvBxj+8eewpmO1Xkc9cBF52M/XTGI8GoUhHH7DsYvjRVdBos/YWg2u/F3v1UbtXNdTwylo/6GN/R2yqoKkBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCUExIYPq+CO7qFh/Bep3n4r3O3I1nHdpfVT5RRGgpPCtBZCQc
	kHdw0ZR/MBLN4kmSz2RYfvPh/s0YFMdySFakQOpX8iCB2PGtkbUYPuwidlCAyXdrihMedOOQSQ9
	mHE+A+1kNcOzYAuA81vAMYk43uW9/226Vlx7QDTyVDBYAwNKugS6AqozYLsUqQm+9HSI=
X-Gm-Gg: AYBFou0bQGJoI1CAcCv6zm56if6HXf43L8ckTNvd5zRjWM9mt0K3bINSncFZHYbUEku
	BQO7dGqPZlRSpm+J8ytWCFgb/3xCqVeQKjtlWYlChsZkKktbgqKG1Sg27cFbyHRNkVUQh5CVuxc
	uwkpzZJRRQfOrzeU3Tc90grGrstMCs3C5t7+irpBcL05OAnE7xC57w6Kp0PeP/l585Jt/G0/Gin
	GqxWQcIkiNIA+zq05J+0qZPxmw42x/EtHVUVUrmCqJc0rEXv9z6DOoVnCiajX1ksFOz5hgzHbYN
	oUo1J0aq1TQypbGj/aOB8eo9QLI3FAAby/+mkabPWAviGlye35hsj1p1yV3mRLt+a2z9mXDIrEc
	cZK4ylshrfhAZFdnwQ23UL3W+T3xJn3ynlvPXi2RszJ8ucaJKoJHrxLw/baLl4g==
X-Received: by 2002:a67:e102:0:b0:7cc:2086:34e0 with SMTP id ada2fe7eead31-7d0728b1cffmr954849137.4.1793370891437;
        Fri, 30 Oct 2026 07:34:51 -0700 (PDT)
X-Received: by 2002:a67:e102:0:b0:7cc:2086:34e0 with SMTP id ada2fe7eead31-7d0728b1cffmr954838137.4.1793370890933;
        Fri, 30 Oct 2026 07:34:50 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3f9sm3854808f8f.4.2026.10.30.07.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:34:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Kumar Gala <galak@kernel.crashing.org>,
        Prabhakar Kushwaha <prabhakar@freescale.com>,
        Li Yang <leoyang.li@nxp.com>, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] memory: fsl_ifc: Do not free unrequested NAND interrupt
Date: Fri, 30 Oct 2026 15:34:47 +0100
Message-ID: <20261030143446.248161-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1707; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=VnXLFImMvRxMQ7SlXqoJrQa7w/qQwQrunbmX6eEKeEY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5KsGImAXjbgwuvzTx1GuRZ01zK7r2nV4EdnXQ
 Ie9IhQ4AaGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauSrBgAKCRDBN2bmhouD
 169SD/9y+YrRj/Gdme7ClYogUDgjwba50riEQmLiRNNzFu6MS0UyX5OKo3UVdYowJaCVgOLIvD9
 xzxQdqvlEf4B1NgnluGZJwLWG4q5cQQZmUIDoBbbcZfmnfs572ipIFFvJYXF/ItNHu8teJu+BCC
 o0W1dpvT5O5a1ak7HzI2YxyEJo2bMvY1fBLpGCkCfLgwsTASnFGbSPs0R0GGP0qV3ysgOfuaiEn
 4GWpv26XcCGZDY4cJFv1yRWiNnZIodNw2byQTLTL58LZ4vndkgMtPdggY+UlQ+SJXsbQUoPi0d2
 BXfiZZ4ZgWfb0UFUSRW+IAlJBa6aDnVzHRW1Jnwwwmoc8zrH5QJTjFakSgF/Nap/Ypbf2cYwbnr
 CbFv52mZKJyc3kf8MmK11dHigHArDrLL0Hs2x7bYpe+KWqRzjs/N3+falcy7lq3ozftcPlQk0fx
 AeTJseOdYnoyushifGRIiVIaqe5qIhTBfsXO1Wto9enTVpNDejvohTpsLfnBst0dP3yKaYeP1mJ
 MDGYyYUU4d76gjcf/txNpu9PRauNwyaZ1Z12shh+J5goe5abaJFiQj6LGMNsrOb/kN46unqBHzJ
 vszxNRbpU6KEsz0G518taLbfUuECxZwsmFL0bQ0Lroi3O6KJZJF22dvrSV+VF+pvom3PMaa8DfQ eYiQ5lE4blhlVmg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae4ab0c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGS3YSsxsSw2m-bVTj4A:9
 a=ODZdjJIeia2B_SHc_B0f:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: Wre57mA00gpSnQ58tNs_un4Wnm0HcXrc
X-Proofpoint-GUID: Wre57mA00gpSnQ58tNs_un4Wnm0HcXrc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1OCBTYWx0ZWRfXzomS5Q5FZYV6
 VzZ3Iq2nFwk9qs7H8V+4cJmefr8aUZgYhV2FVgQ1ZiaCcTRztKvrCadtxmamgHIL3vJnD1vNMz6
 UDNYhJPdFIedXgRCBIgUdxuf0wOfpQVY+Qckq/UngTqdf+UX9cojohwI63DpNrsYhixVvJf9TVu
 H0yYcxU6BsI7RbdifBV0kXNPJhQ96cV++AZLSHuxdWCeRiblNFkF+ly4wcjl79Ho3qglrgRJHa/
 XYC6V6+1HPhI+YIVIhJ7Y79AiP4ji6jlL3no8Bzof1emx7bw+TKA1YEBr9lqJPojhA0JhTGH2l9
 Be2eSGNEwYNEK4Qq7VKdwS0uxw8RoV1r+ABQCm0U1Q37JxwFhLjLJfcxap5z0ffCpqKK7fmluHe
 koBVpgTHwJEGArbBoJZ/2+yHmnjnKqeLnd2hokrmrHi/VLrOpJTAINf9DEVvPpXTRHbdQZdN8mR
 Y/QxQ1qsXewRcdG/ZYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1OCBTYWx0ZWRfXwdd6GL8LGPoL
 MvwF5yJYGHT3we6R7zH/tSiyb2vpjPgvN2UC8iW76Wy2sOS9Dbk2FpDxvhE249ciT+P5upD6J+X
 FmeqxtCrJeybvoSyg7i4Xd94nCCjlIo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300058

The IFC controller may have no NAND interrupt and driver requests it
only if it was provided.  However driver unconditionally frees such
interrupt, even if it was not requested, leading to free_irq() of a
valid, unrequested here 0 interrupt (valid on legacy platforms like some
PowerPC platforms).

Fixes: 721c0705906e ("powerpc/mpc85xx: Update interrupt handling for IFC controller")
Fixes: 3e25f800afb8 ("memory: fsl_ifc: populate child devices without relying on simple-bus")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-1bbccb12-0e0d-40df-bddb-e6251bc0409b
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Not tested on hardware
---
 drivers/memory/fsl_ifc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
index e89e0c6cc4bc..6dcc317d95d4 100644
--- a/drivers/memory/fsl_ifc.c
+++ b/drivers/memory/fsl_ifc.c
@@ -89,7 +89,8 @@ static void fsl_ifc_ctrl_remove(struct platform_device *dev)
 	struct fsl_ifc_ctrl *ctrl = dev_get_drvdata(&dev->dev);
 
 	of_platform_depopulate(&dev->dev);
-	free_irq(ctrl->nand_irq, ctrl);
+	if (ctrl->nand_irq)
+		free_irq(ctrl->nand_irq, ctrl);
 	free_irq(ctrl->irq, ctrl);
 
 	irq_dispose_mapping(ctrl->nand_irq);
@@ -292,7 +293,8 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
 	return 0;
 
 err_free_nandirq:
-	free_irq(fsl_ifc_ctrl_dev->nand_irq, fsl_ifc_ctrl_dev);
+	if (fsl_ifc_ctrl_dev->nand_irq)
+		free_irq(fsl_ifc_ctrl_dev->nand_irq, fsl_ifc_ctrl_dev);
 err_free_irq:
 	free_irq(fsl_ifc_ctrl_dev->irq, fsl_ifc_ctrl_dev);
 err_unmap_nandirq:
-- 
2.53.0

