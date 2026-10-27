Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112077;
	b=hs8A6lIdXtVjmUQ/adLj0IlhgZHaHL/Z9SskbWJtJrY6SSv0pFehQ5scW2dOEEBiYmAT
	 J0bBM6aT5q19JmagFPcSs9zE277h920r5Rv1LgEIJ18PdSVHPV3zYXGO4VQOJ+KBFt1u1
	 65eQrL+50vGNf6DDbRLKB97xtJDYKUqYw8b0SXcaFTckk/ddySAqTVpMvNjz1xbt1hLpm
	 Z7LUxt05A0PUJikbx5a4Ev7hzGpXTO0R/fIK8SeeBWLHoT7TlGIVB7TkrXu/Aumup0VD8
	 giyRSKsTBaT2w+K+a3d4tZSSCNb1IYy7S6sPosXsfIy3S218OjqzDZOLOmgLYcciV0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cQEUa1B2hNGvlDMG4Ti6ghl4fU3dN8tetYb72gg/lgw=;
	b=BBn3jtilr6742JU1qjcb00R4canLqhvQ6p7ksbeoPX5hw/0XWJpmgcONfdOxRMaqCwd/
	 5x7/VTID59c/ICsWBxz5ToKT8iQUO5gfDR60FGWA2PVjLnE29pn+oDwBgopQRK5IzN7DL
	 GWJ0yg3vBQtmqCN67qrxSKzMwEHoTd4Dtk96B0RFSwJzVSyd+gvyQereNMvklQGmIQE7g
	 /AjZu4J9MM9dpUluEInI4uqFpjA2quC5skMtus2ZIfeQr+LIyu5ije8BY4CleLt/syRm1
	 zV9TZ5UyDKf456V7b4pu+0fvtSqhi+GvjVxVOGxr+1reckZSpWKogB1JRKuD3E/dynw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f+l4XVio;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHknH7ir;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01DF60A5BE9
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A01DF60A5BE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f+l4XVio;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHknH7ir
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDo7PO1486569
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cQEUa1B2hNG
	vlDMG4Ti6ghl4fU3dN8tetYb72gg/lgw=; b=f+l4XVio3PCmEjCl+DFGlWBzULF
	cIQgUXcU8OwW5ljw1ns6SB6qVrGd1P9XWdsRfCewl2h0/Q0G8hRhIoTy3MOQAZtJ
	0f4DcDF7lX2AXMUTqEx7yPXixe7FL2XdCblF5lwdm2EfUxz/NZCSKP0Qhiw5j1lZ
	mfjHrU2djFcVQG1aqqN2cSw9yHUx8M/4NGsrxVC2qCDgu+eMQ4YrupmA01ogfS0g
	8M+BSkZdojYyGaxLHoBSLEMLPWsDUYGSq8po93ruY6ymD6qR3tfWf5wzP2Ap7gHZ
	zDHAf2b/lx9+s4WdykobfyjdnOjJTpW/3bxKtKs5o91kmLSghIHxDLd74Aw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2ta2k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so839628185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793112075; x=1793716875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQEUa1B2hNGvlDMG4Ti6ghl4fU3dN8tetYb72gg/lgw=;
        b=UHknH7irnuU7LBkGXazSmxLbXXQMy8IGB1A5C/Mt4O9SQSJs2e56VmtPZ1IRqMGnmq
         Iwmf8uYop1OSZumxvPO39g6X7s2cdKS4QUQJaE94dz+6bsRR4zzEQXRNj19fEEHVDj+k
         l0Z3e9GQ1TjCfnOLRGq/RkXJafIOlcJle9RlpJNwETvHuKTENn1FfqI8RiXfSZZEdhtm
         OhN4VOvoo/eALA6YeKJbE6sICPaDdj86TtYbErxDmQhOWvN1u/lWaIU3t2E1xtLAHSzd
         fxgVcxmXleNMnz6KlgwCrO5T27VeOcY3/q0BxPBW7sh1L/GK7PmYQVNveVa+CDBTi0S3
         PHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112075; x=1793716875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cQEUa1B2hNGvlDMG4Ti6ghl4fU3dN8tetYb72gg/lgw=;
        b=nCwsDL1fB3Zy0tJUl1tSp2eTWzxsO8GgumGWYqQyJVpO0kcKvD3EfXpFc3olxvpQFH
         PmQPgICXaKgNQCLCMcXLjkpWx5C32Q/dI+hSSesDfNALCS/6KY4FQpFdYR28IHcQW5lR
         n69IjW4EkysFrik88L/mniA0TyuJJ0kqX0c1/DFiU08e5F0exulDsdwJx6ULbU7UHCBG
         y080Y/I/CVYR1PFWcTXnSKcgoSV+ZER5X1RUFnpJ+8Gy4Pvj4c6DvGRO3JJ1CVPvGz7Y
         loe75qZd6cfkjbSBT+eP7+e6yF+WGJNHct7Kr+OD4fGVTLdhdviAxhYD/gCBrFQQhjgK
         1Nrg==
X-Forwarded-Encrypted: i=1; AKwUvBwoXswf0/MubM/h5BiI2kgwK0thQmTKgenWKLzBje/1FILqtbB9wki1qMGHd+NDvr84XdMwpwXsjtXg4nQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHqogN2R9t4fcdb82H14ip/4EXC2PH4yLTD2+LYV+DQaQwNHhi
	3k8wY4q1un4KGk71gCrQhoxgDQbiiVRHBbov1Y8zHWOwBECuxjxC+TlspPupvQD1mEQHP3MhlcK
	1gVCQT9DXOrOz3nLqx40pKFdVCZ5uL+m9yZ87sUXHWXMZkQ7n+tABieTxwrvCrFatYIdHo7+O8j
	4=
X-Gm-Gg: AYBFou1Jzz0tRpHK59JZKT7gvBUhZSepz0wCGvfVb0vI9afmKAa7NLADsMD1tRvoWjt
	o6SKx4SoWYbwePNy16yh24vl6JEKEUeIOlKCtk2NN8nnSsTwGDJMIWRCtMmRivbKOAcz9wQ86sw
	bv0U/cxl120Zus5WZ2QHaV4JV3g/btc/NGU9w+QvbiHeGl7g2Q4QlGeNptn2kRxKvWPVFfqHzz2
	SFyWwZ8dISxD/wtQW/jqoUw1ZJFd8ZQCPXe40wfuHhhlmu+XeMMKzybnUi/j1UuiJnmyf6VIM8U
	tngKimb6HAP+i52yWlh6qoaaJqiNvxc0XMdoAtbz3ccEvRGUWqiiA2tjwOcH22ng3TSrdxyiCId
	nk3vOojvvAN5Fh95TVCOySXpvZdGG10OSdIVa6ncKqvfpMG0Y/CQ+8z35zw==
X-Received: by 2002:a05:620a:2313:20b0:944:192:85f0 with SMTP id af79cd13be357-944019288bamr96611985a.24.1793112074742;
        Tue, 27 Oct 2026 07:41:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2313:20b0:944:192:85f0 with SMTP id af79cd13be357-944019288bamr96607885a.24.1793112074135;
        Tue, 27 Oct 2026 07:41:14 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66bd3asm468527766b.56.2026.10.27.07.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:41:13 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v10 5/6] mmc: core: Move reset functions for eMMC
Date: Tue, 27 Oct 2026 15:40:43 +0100
Message-ID: <20261027144051.249211-6-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae0b80b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=XtTdTuYduaSdZlMxMiEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KgMAPKIV4hNPuqQzrYFPTNfig88t4E9M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfX4QsktnjfipPC
 Mss75x08DqA3eHFgZQzVaAm4KUWhgrBfnIGkvE37BKndQeHkPUiubnEcd95/+sC1/YyBXj++nq6
 FdXGMiEL5wH4ML74zpnvAXZ0sEeXYuM=
X-Proofpoint-ORIG-GUID: KgMAPKIV4hNPuqQzrYFPTNfig88t4E9M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfXzUq6MNYL95Bh
 OKCcw3CkWqdkdUQX1phY/mtI3XmZrSTprb0AbPRFcntvT9RJTdz4qGdTBa9UfeCLVvUqkbl9trd
 S58mvIYUy4QbNrRwnMhInYyjhAYVbF4xwbJdgqnT0XePL4943BBJ+KQAHfYzlOUiqGNbQun7/n8
 HX6UebumkCY8gFTfbrxa/CNQ6csNa84099xrIsblaMvvghEUPhgty5iIKPNlz5B2ohAPxVUw6/T
 y23qH5p/MtyhZ+h92BLdMxyVgJ6Bx85xhrKSX3Y/WVB8/Eo+75bXBw831Ut+PWMfl8luX8Ayn/k
 L3WCOPJUe6OXiUd6F3mfxTsap3zeKEVmtP69syh9iokjgSRVi3eDYSLpZy6mIECng91LwB+Hbhd
 dExXAT2+wSO6byNk31yrckKoxrPoxBLDFtZoOjrcnJGqQJLlKbhsdcRjHadNSumjTq6b2IGXUMV
 8djVljxbKtLby/byvkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270058

To prepare for a subsequent change and to simplify review, let's move the
function for resetting the eMMC card a few lines up in the file.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---
 drivers/mmc/core/mmc.c | 66 +++++++++++++++++++++---------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index c936272bcd81..d4bf0f25bd74 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2271,6 +2271,39 @@ static int mmc_shutdown(struct mmc_host *host)
 	return err;
 }
 
+static bool mmc_card_can_reset(struct mmc_card *card)
+{
+	u8 rst_n_function;
+
+	rst_n_function = card->ext_csd.rst_n_function;
+	return ((rst_n_function & EXT_CSD_RST_N_EN_MASK) == EXT_CSD_RST_N_ENABLED);
+}
+
+static int _mmc_hw_reset(struct mmc_host *host)
+{
+	struct mmc_card *card = host->card;
+
+	/*
+	 * In the case of recovery, we can't expect flushing the cache to work
+	 * always, but we have a go and ignore errors.
+	 */
+	_mmc_flush_cache(host);
+
+	if ((host->caps & MMC_CAP_HW_RESET) && host->ops->card_hw_reset &&
+	     mmc_card_can_reset(card)) {
+		/* If the card accept RST_n signal, send it. */
+		mmc_set_clock(host, host->f_init);
+		host->ops->card_hw_reset(host);
+		/* Set initial state and call mmc_set_ios */
+		mmc_set_initial_state(host);
+	} else {
+		/* Do a brute force power cycle */
+		mmc_power_cycle(host, card->ocr);
+		mmc_pwrseq_reset(host);
+	}
+	return mmc_init_card(host, card->ocr, card);
+}
+
 /*
  * Callback for resume.
  */
@@ -2319,39 +2352,6 @@ static int mmc_runtime_resume(struct mmc_host *host)
 	return 0;
 }
 
-static bool mmc_card_can_reset(struct mmc_card *card)
-{
-	u8 rst_n_function;
-
-	rst_n_function = card->ext_csd.rst_n_function;
-	return ((rst_n_function & EXT_CSD_RST_N_EN_MASK) == EXT_CSD_RST_N_ENABLED);
-}
-
-static int _mmc_hw_reset(struct mmc_host *host)
-{
-	struct mmc_card *card = host->card;
-
-	/*
-	 * In the case of recovery, we can't expect flushing the cache to work
-	 * always, but we have a go and ignore errors.
-	 */
-	_mmc_flush_cache(host);
-
-	if ((host->caps & MMC_CAP_HW_RESET) && host->ops->card_hw_reset &&
-	     mmc_card_can_reset(card)) {
-		/* If the card accept RST_n signal, send it. */
-		mmc_set_clock(host, host->f_init);
-		host->ops->card_hw_reset(host);
-		/* Set initial state and call mmc_set_ios */
-		mmc_set_initial_state(host);
-	} else {
-		/* Do a brute force power cycle */
-		mmc_power_cycle(host, card->ocr);
-		mmc_pwrseq_reset(host);
-	}
-	return mmc_init_card(host, card->ocr, card);
-}
-
 /**
  * _mmc_handle_undervoltage - Handle an undervoltage event for MMC/eMMC devices
  * @host: MMC host structure
-- 
2.43.0

