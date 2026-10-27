Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112073;
	b=UXVWIVi0tIka7JVbz8xRDuSUTH9dvqurxiE4HIS82ObFDy/4ogOkqEaT8iATywPOuThe
	 lTouslP9Pj4nnlkKB2hgvkv/iOl5QELsyWrODqrADYkBenNoTpDUS8XwcDFBXEdrMCB9g
	 xnIiN1uaNfS0gVpPg46wsU2bJyJw9uos/+SWqwJ7Iqg3FnVK2o23Ne2QeARiqORzpXBEG
	 B4NobBeaX0Gh3YLuLX2AGsQcKPsMwa73QkZ3dgUlJAb135KQKY0uQw7M8osazye4OI0Q+
	 BUbNTM7DLX7/9DOrbyqE+/vJp69i4cNqndlCChv1e+ny25f60Hshucf5eWh/v3vLeEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112073;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I8iY6dctpy08oCwmGsuuZQ8b6LI+xgkWJSZSATy+Ezs=;
	b=IBDIQ8seUip7/C0Z4yf8TzZeTLPHZ/IyRVXxpVt0y+nurwuw6kfrM/TgTDcsZNYmJBUJ
	 oYJqv+Vvf4tS6RcBgjGUfYBKxr69A0+2mBBqktzoEpCRoy4MIvHpYqNCo4Ibuc6g1uxwz
	 YVJlzfkygtFBeflxkAdMqQUYwM7eU2Q3xYLiL0zt1XPghTfgF2mjiOrjJ8Rn39SSZ40UB
	 GkBfxBIVKuYOb3gWVjElRNOuLgcKTgRIFR8qKYtHSdM/UCrG3z4lQEraBA6ROhaQu6gqR
	 nKt4CrnxEn3hFxM1Eb9YmH+FNqOLTy6vcDuFtxjXA5A8FpQgLqPrT28f107jYQisGEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ThJoftzE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2er7ncE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDC060A3820
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FDC060A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ThJoftzE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2er7ncE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDobtp1850966
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I8iY6dctpy0
	8oCwmGsuuZQ8b6LI+xgkWJSZSATy+Ezs=; b=ThJoftzEkcbyirUtFNGV32zIAbQ
	lixWP8AHIYlO2goZbSse+NHuTbKpNkt/qTd24ftjNRZwjm/kTphgz87jLpx7tbgk
	WWtXIQRbnR6R87tsrQkx1FXhJwr+/haUOQ8x7micAgZMkHqyvEwG2ad0mr5xSSkn
	H/nKxTyXyLn0HqjGF+cJFW50z+S/di+IDeJDkAtq2ks4CT2fXBUslPaSZ3JRp81q
	p0Y/rgYmdGkm5IeajiaHFo18rBpnxCbHqtIT9d1hRbKf6YEOpsfnxOW3ZuOqXyCO
	mjMtYYQtPJH159FwCchJBewrPEu36+MCzEmUuoeEPYBZ0TqatdUT2i4gMUw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmc4uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b7e7d5f56so107419816d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793112070; x=1793716870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8iY6dctpy08oCwmGsuuZQ8b6LI+xgkWJSZSATy+Ezs=;
        b=U2er7ncENVKsyuigarQ6AXOCSyH59HLOZujA52EuvYE5NKHGzYnmrjhIG9DC7jfgiU
         FeYxwv9D0FXR/2C4enCWHLZFDRtQhfi81dhgpfNOluhDjHtC/o5J/SmPBswZBi6TFMRs
         1sOGdk9YrQwsDKVGpXNXYyHVCglTMnXr4oDBVH8FI3fModNzAqonwYfcaY6/WKjf3rAL
         JKIwvqOg0/cigVE71w98oRU1CxTHyLtX3g1Gsxwec1HLmdig+FmG4gwMVtodQliwzwab
         wnHg4UmSl1wZRFa2W4NJbdu7khexoG2t9vjm/cSceYjklmI1ioHT9yB/LMkBzlWkqEYu
         Aacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112070; x=1793716870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8iY6dctpy08oCwmGsuuZQ8b6LI+xgkWJSZSATy+Ezs=;
        b=JS00COZBBBQ6bl+IgNYXoY6xuFO0ftJKqA2kZcvU4km6CrOZJMmEYjd16uS8FQCrfN
         m4tnVnPj8T5v7zwWpR8gjpezJnQZR8D0CssI8Z2Rn8eCvDGealA66GSnl/ZkM7A5FSIm
         V+ImU+MJVgknxAwqJLdUeMsa4BF04IYcvMELJi9U2Xs6h2/GXAwsCq/BuA2PCvU79cx1
         aNnChPyxzLSlbbl8IyT7ddEzlpRKFqof+wLMn1kGDBunRO+qxpnq0LNwvZoyEAysdcYk
         x/o9xqieB4NSZWuGfHh5p2xVf/svFJSRj1OfatC/P6lqLVIkl0Og7iB2NRegM/etMLNl
         RC+w==
X-Forwarded-Encrypted: i=1; AKwUvBzz6oVhgLZVqiWnlj1uRZyUoBYyDr8oFQdri5pgxxQTiCRrXYJmNI/P7GWeCrQMVzkL1Mci8HQfL9HgaAk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIz8p0qVCtLTvTFW7NX7Rky1MkU1pdCVfdaHWNXOV6+cZWCXKtD
	8YsHO3T9q6/nIa57UGvdKlA67B40XyO8GnCgsivhigXFP1hTlXeQYWCVwJ4d/0d89HI2BaVNDgl
	UPIEmzc64LaJGlk0btO+EJ4TeE7E1qVeKiFI6uPnicMi2CclWMOLhk6V8VH+x8CKUmMo=
X-Gm-Gg: AYBFou1m1dNxjRpIaHrP2TbLmjKcsAh1//7i9gB/jBLHm5V4FoqKnetGOIfcjVd8iqZ
	j8Ot6HZO1IxFGXvteWnsaeHEn8Js/TPfYh0yrbFtvad9gak6oBoHWTb+6AZE6441zc24xwM7I5O
	5ab0KMpXNPE9M4g/dw/R4Pj3qAHQ1hhH+VKPFnJ33NdTqLU+YxFcp9I5OZ/tFhql6/OT95DDJmB
	oQ1AiScakMiVX1baIxaN5nEVxwkICk2ZgJRR9V+blIbyOeBBVQ2FT5Ib798S8SO2LQucVyV9dQK
	KtkcaEO3Vz4dVshqG2mdESPX3VEAGV38f1jmKlBqX0wgs83kTjhtgpIuss2LVY4YKKzDfBCr1On
	u1bN5u/UOs0zvNekGe5pIBkcZizO+OPC2BH5RAwpuUPNHrbW40bxlPFHt/Q==
X-Received: by 2002:a05:620a:4621:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-940ef8bbf77mr1602545285a.23.1793112070354;
        Tue, 27 Oct 2026 07:41:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4621:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-940ef8bbf77mr1602541485a.23.1793112069919;
        Tue, 27 Oct 2026 07:41:09 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66bd3asm468527766b.56.2026.10.27.07.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:41:07 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v10 3/6] mmc: core: Add option to keep an eMMC powered on at system suspend
Date: Tue, 27 Oct 2026 15:40:41 +0100
Message-ID: <20261027144051.249211-4-ulf.hansson@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfXyHs4zzIO3xDo
 Yo4p0sl/aBP7ykA43BSBMsOBvKWSAWznCfzddwgGY0/4+ZVFZOu8sI0w/Imq18D0P7O9gOkq9yP
 Ivg2ukvWcn6CM+dvFLkyh5fVUFMtQt0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfX9Qwg5I4NoxHX
 dPZozFRYiJtQCvGom+wp7hnJi4VBBpg/VuAA5beD4YK0QwOQANIhgrbwmnstg4Fh0/JGfsoCB8T
 reBZI1lfmZF7RfKgnxjSUkV49c+6U6yYUWbErKoVc8gu22jpOTgOK7s3bnDIGAlNWdV1rNg8uR/
 RZ5Ry6I/8nOTwMluJFg58mfjvP7UAphkxOM7ebpMeEKZy0nBmGgLKkaYQpgcrUQVgJEjtqW0pTt
 TrEAKppyPFB38xpAbTY75DFAQeW8kgPpnhDrtC9KMrJ5YHhjIdkQSxd00MJF9MLZS/N3MpsS6V4
 bpSgmd00/hAtx1h3EP/85dM2gTNIPGKJvvnV4tM4Pjo0GipOoaC7RC0DJcWAvkVj4dW1cAEVk9v
 5ty1Umux4jCV7E8qT64brMHEaFULJOd5aCUzgflQRcpWCuqlPt5ubquglZ+dOpnpZtEC2LiBx/G
 qjzwWfwfgXV7e7sve1A==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae0b807 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=wQhRatfwtUYrVbUM:21 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=X-xDrAPhK5RcuPCaiSQA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: jZbINpz3DUm0Icc86YNZ4IjQ2QUykWLs
X-Proofpoint-GUID: jZbINpz3DUm0Icc86YNZ4IjQ2QUykWLs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270058

The DT property keep-power-in-suspend, allows us to specify whether the
platform is capable of keeping the power to the card during system suspend.
Up until now, this has been restricted to be used for SDIO cards only, but
let's add the initial support to allow this for eMMC too.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---
 drivers/mmc/core/mmc.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index a02b04938e1a..c936272bcd81 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -38,6 +38,7 @@ enum mmc_poweroff_type {
 	MMC_POWEROFF_SHUTDOWN,
 	MMC_POWEROFF_UNDERVOLTAGE,
 	MMC_POWEROFF_UNBIND,
+	MMC_NO_POWEROFF_SUSPEND,
 };
 
 static const unsigned int tran_exp[] = {
@@ -2157,6 +2158,15 @@ static int _mmc_suspend(struct mmc_host *host, enum mmc_poweroff_type pm_type)
 			goto out;
 	}
 
+	if (pm_type == MMC_NO_POWEROFF_SUSPEND) {
+		if (host->retune_period) {
+			mmc_retune_timer_stop(host);
+			mmc_retune_needed(host);
+		}
+		mmc_card_set_suspended(host->card);
+		goto out;
+	}
+
 	if (mmc_card_can_poweroff_notify(host->card) &&
 	    mmc_host_can_poweroff_notify(host, pm_type))
 		err = mmc_poweroff_notify(host->card, notify_type);
@@ -2193,9 +2203,15 @@ static void mmc_remove(struct mmc_host *host)
  */
 static int mmc_suspend(struct mmc_host *host)
 {
+	enum mmc_poweroff_type pm_type = MMC_POWEROFF_SUSPEND;
 	int err;
 
-	err = _mmc_suspend(host, MMC_POWEROFF_SUSPEND);
+	if (mmc_card_keep_power(host)) {
+		pm_runtime_resume(&host->card->dev);
+		pm_type = MMC_NO_POWEROFF_SUSPEND;
+	}
+
+	err = _mmc_suspend(host, pm_type);
 	if (!err) {
 		pm_runtime_disable(&host->card->dev);
 		pm_runtime_set_suspended(&host->card->dev);
@@ -2260,7 +2276,13 @@ static int mmc_shutdown(struct mmc_host *host)
  */
 static int mmc_resume(struct mmc_host *host)
 {
+	if (mmc_card_keep_power(host)) {
+		pm_runtime_set_active(&host->card->dev);
+		mmc_card_clr_suspended(host->card);
+	}
+
 	pm_runtime_enable(&host->card->dev);
+	host->pm_flags &= ~MMC_PM_KEEP_POWER;
 	return 0;
 }
 
-- 
2.43.0

