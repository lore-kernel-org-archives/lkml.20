Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489524;
	b=EVkTyKVgm4y7qiZra0wpFKLA5TfEQCsg0q8eX3ddmGvZaq9nNDJmDFTqHzm1ccx7YWJc
	 QjayJaf457T37mKGH3xw3CuDqQwnIfRhPigQvatSgmrQXSNWHt/bC2ropZHLt4W4P3y/X
	 acAqqInDkQeNroAY7VNlu0eygAn+8ZO/KBlUWkzn8Lqj7qZ/zo49kQiPRR0a2lpskYG7e
	 GlR7wTXpGCui8xYHoRFTw4FW4jwTjHcPwbcqEhjJJYteUMUVDnllbPRTNfWXLn+Md8dbo
	 /r8v3PqTyR5X2IQoCBP6wxkC4F7EHbz4iC1+y2T4BKFy+iVs/HBnS8vbzviHA/wD9uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xDEmza0Qe9pJQ58rhzT7ekkhyxXls7BABB13DbC82WM=;
	b=0uaEgPXp45IKyI965E2lFMVJ4R8GFKxk9ts1/p3mrd7COf3WPHkHKp4Oj9DjdltDOFl2
	 VMZHxPsjDgkgWpIa9xGhWh4sINnRhrFhLJsAgsDFBcQRfZBz2hOGrFfwzXjz9KKzkC2Gr
	 MAuenTk+riRs2zMqN6dfrk2BHOvIv7tXfI0KOv7yNdDKb5vA2pDmjrAPBoFwdhcv6sbqf
	 cXiQygDEG2MdACMYfSPJg+BNoWuQFucRxg7eN1nMBr+MJZVh32cdi6b8nr7kaWxwHbQjC
	 MaNzGqbd2tY8SXYFFoAE0NufbpYtA2xCi7wRcxbu3NLvn0kgSDpqGN5LyGAGLH7r+RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LffXCecn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SWBDeRP8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53756606A890
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53756606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LffXCecn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SWBDeRP8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAmmXS2555567
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xDEmza0Qe9pJQ58rhzT7ekkhyxXls7BABB13DbC82WM=; b=LffXCecnLuJWqkaX
	PCbiL/5J8Ih6Nxs/UP+CM7vECT9iwbAmKiFfeFPO12z5LGnjJajgdzsk2gtFebYp
	U0rdm6tLuNp5+jMuWyvM4wQYTMiy0pdN827kml8cRdOeY2M4HaymFJvYnogx9amI
	yUDzL5DHjUFd5Qvm/b3LyIQuNrfdBAOar8dQP0FfMRRyNlRDZRQfE2t/ysee8Pu7
	qnnT0TVJhKIItAMCA2/9Hgp5/GYXCUpUs3VXq5EdDQcd6OlUjzbkC1sGOafp6B5w
	Q1bB0vvI7qeP/N9vOvQYfC41VaHS8VgET40kuTx3DRmgDPAcxD+minMxKeXVMO6s
	n3aO7g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j0ftm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:18:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so5712032eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794489522; x=1795094322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDEmza0Qe9pJQ58rhzT7ekkhyxXls7BABB13DbC82WM=;
        b=SWBDeRP8HGmaYKgTOP7Tl/ctYB7/Df/nWGfpcbuwDaChWRnZyRSRVXT2MUj9YFCSxd
         T9cdZcoVwVvGTWAIioje60FrWIJfcG0pob3TPf1Lcba4p/PSFnMiutLPe1Ui7ZgYo70v
         RbK9/MhofnTpQuA/ia0sd+FFvzR825xL58i38TcxDXnzNT3pvI9/pB9Gw0w0EGPwoWVW
         Eif7y0BaPcIqCe3jNnTVIA2jyiKKhmjy3HKhjdFHtc0mnWfhcxom1A13q41uAFIjGGaF
         wV/IrOMsMfrpYdu/IMEaPI7WBWSmF3uqcAL2We5wOFHnU9CpX3ybUVPTnwESH3/Xzu1s
         22zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489522; x=1795094322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xDEmza0Qe9pJQ58rhzT7ekkhyxXls7BABB13DbC82WM=;
        b=jofDSjz13pciaZkv55yvhjB3cFQJ94JoA41Yn14ASJp7PcAg254DXiCtyo8831VzON
         BgR24zif03xO4qBnYosFrhVKatHru4FHJ/C8LDQdZarQ0dzc0lU1XcIgvj44NDLEXXVy
         Afs7wY+muCTf/BZJFD3OxF8RBGvLe43xHMgeFXqrH98EaXeEwqR8Ir81D6/94w4jq1N1
         8cW81b15fSSB/ZbUHjk4RIuOFEGGB1jMHog867nkyWCZpNmat/XpRiQyrQNnNpM/yQbz
         GM/P3GMqLa/IC9hYHnatd4FWj2xR/EXnjJFi6IgGYdcCdCig3VidGl+ezTABJVAy5ZeF
         dmeQ==
X-Forwarded-Encrypted: i=1; AL+hErGCazIBR4gz10VOs4ruiR3wH3OsL7JZUUn1D0+cselPcUxLsdw9n6c9nKGuC7tllky3azc8znGUMdwnkns=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MDJ1z7cdpWbXsaHkIgxq+tq5CA5n8009X+F/ZS02LQVmkK1Gd
	h1v6Yf1iIK1ZFG8zR6TCu+Q6Bxvj9fxrW8p8eC+Gc88DrorQHvvZuVt9mWYQ/USYBidxBnla7KI
	g1XKATMZakRN9rNaQ/yUFjKtntqzJJJIlYQR/rCbrhTl2F/OLS8bzYZwlaicCafafL1M=
X-Gm-Gg: AYBFou3CUtByu/1UdFIZ3Y950F98J+hV7lXFQQwL2V6a00/mQ8nhTnVuRcWcUUSEKGc
	/qtkgTIaOVMKLh9lLC6EmN1sVl2+sIa2NsjQPPBM7V8lJ1VlcaYplxy9BCeORuj2o9463xy+tKA
	NIVHMSBxqjI9aomdDX1eeGd+cpKb6AzBhIAzYwTMK5k44c6aZF0dQ3zOkUF1a/2lLNrIsgWUcWk
	I0GaKvAz1rajMoFsbg+EB/NyHyb0t+AJL0zjv+LPq4sSxi7b4TE25wDu/7oFLVe5g2FaYPSeWQH
	3U/5Xm2/Qp6gmxWK1Yge9gFaKwD/+9tXFhqoWlOlQOmHxWzbGC8au5FWH9kkECICg+Km3saMEew
	GhAYPyxbv4KlZnVZf5RD0sstRncvKtkjL4izvnPF8YdkQG3Wn5I87G4/jLLvdo0zCj3uGfQl8lF
	6pJnDMRVs=
X-Received: by 2002:a05:7301:2311:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-376832816ebmr5975406eec.5.1794489522069;
        Thu, 12 Nov 2026 05:18:42 -0800 (PST)
X-Received: by 2002:a05:7301:2311:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-376832816ebmr5975385eec.5.1794489521438;
        Thu, 12 Nov 2026 05:18:41 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm43798356eec.22.2026.11.12.05.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:18:41 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 18:48:17 +0530
Subject: [PATCH v2 1/2] mmc: sdhci-msm: Enable ICE before enabling crypto
 support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-qcom_ice_pm_enable-v2-1-177e454d6f22@oss.qualcomm.com>
References: <20261112-qcom_ice_pm_enable-v2-0-177e454d6f22@oss.qualcomm.com>
In-Reply-To: <20261112-qcom_ice_pm_enable-v2-0-177e454d6f22@oss.qualcomm.com>
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Eric Biggers <ebiggers@google.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MiBTYWx0ZWRfX1fd6kB9tJ8Zl
 BMbJED4WSs41vs8QZ8UJV4VdtaOxKYDzVTIqKCS8q/dhQnZ4JBEALToLOJuZSoKnEu9CwlAjevF
 xk2UhIFEUdpDnQwrEWeRu/biD5Gs9xM=
X-Proofpoint-ORIG-GUID: DAhMFPNlfAZAzbNjFRXomKFelZLHX183
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MiBTYWx0ZWRfX1cAEUcRItarP
 RW1ZtrnMtwM+OXS886slm46eyriYtyBaA5pyQ3CcLtO9h7sAxucFvhgl0+NTgK1csolOBI3dj2y
 XZe6PYBvIXYkG87gwBonTLugDPypulTuuHy+WI8otDmJV9Xmz9AqS2tiwlz5QXHKO+ffHhLodIg
 Iawl0Mtgm3Hg2yqISWq1vDvy/0Msd5w0akJmdkM+gAdFUE0z1mgz1SDrwWroZUYWxESDuVzqJ+k
 GXobZH3C3BIUXAZbRUtCejqdO48OqqjdzNEOwEwY3wuZvn/gf4WznjswTacReQ/ADW6TnPh4iv4
 fp4V/skEjH875ATHnVPXFyzQON5SQA76jtmG3a9NrqgyBH3IPAxuiEkT+7r+jGEziWjk1cKnlBH
 b+ksmjj+HO4CEYE7NDHlt5B4u/tuoe8XQG9WxfLnQ5iRakwyo18GnQBFWseQ8yl3saUCb6oi/og
 4N9scOVzWvwyBIBz6wg==
X-Proofpoint-GUID: DAhMFPNlfAZAzbNjFRXomKFelZLHX183
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5bcb3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jhS48lKipzocA6WHYXAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120052

sdhci-msm currently exposes MMC crypto profile and sets MMC_CAP2_CRYPTO
before enabling ICE. This leaves a window where blk-crypto can issue
keyslot programming calls before sdhci-msm has explicitly enabled ICE.

Enable ICE during the sdhci-msm crypto early init path which ensures ICE
is ready before blk-crypto can issue key programming calls.

Remove ICE enable call from CQE path, since ICE is now enabled
during SDHCI crypto initialization only.

Fixes: c7eed31e235c ("mmc: sdhci-msm: Switch to the new ICE API")
Cc: stable@vger.kernel.org
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 32b1bcba47d6..b3e0356a03ff 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1928,6 +1928,12 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 
 	msm_host->ice = ice;
 
+	err = qcom_ice_enable(msm_host->ice);
+	if (err) {
+		dev_err(dev, "%s: failed to enable ICE: %d\n", __func__, err);
+		return err;
+	}
+
 	/* Initialize the blk_crypto_profile */
 
 	caps.reg_val = cpu_to_le32(cqhci_readl(cq_host, CQHCI_CCAP));
@@ -1963,12 +1969,6 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	return 0;
 }
 
-static void sdhci_msm_ice_enable(struct sdhci_msm_host *msm_host)
-{
-	if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
-		qcom_ice_enable(msm_host->ice);
-}
-
 static int sdhci_msm_ice_resume(struct sdhci_msm_host *msm_host)
 {
 	if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
@@ -2141,10 +2141,6 @@ static inline int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	return 0;
 }
 
-static inline void sdhci_msm_ice_enable(struct sdhci_msm_host *msm_host)
-{
-}
-
 static inline int
 sdhci_msm_ice_resume(struct sdhci_msm_host *msm_host)
 {
@@ -2182,12 +2178,7 @@ static u32 sdhci_msm_cqe_irq(struct sdhci_host *host, u32 intmask)
 
 static void sdhci_msm_cqe_enable(struct mmc_host *mmc)
 {
-	struct sdhci_host *host = mmc_priv(mmc);
-	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
-	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
-
 	sdhci_cqe_enable(mmc);
-	sdhci_msm_ice_enable(msm_host);
 }
 
 static void sdhci_msm_cqe_disable(struct mmc_host *mmc, bool recovery)

-- 
2.34.1

