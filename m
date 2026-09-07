Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4536307AE3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761025; cv=none; b=Zy4tfLJbhlWjb/GE0ZEN3rKUn/VKDEBd4n/geBOba/cwqeV+gF0CkF2FmpS6cpmJU6kqm8lnlrZ7gqBgukWd6nesSxk51CyDrmaYcoqvuo1zm34e2vShxgYlcj67xke86E33AeAWF+tNanmT1Fk6QJ6TkW5Mzn/+oK7bY1T3+n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761025; c=relaxed/simple;
	bh=qJqU34m8Z4NoF6i/4qh5n6yxeIUMc8E/efYlRGRjlII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MLbuA5bS+y9AG11yoVuK+phG7IOx3rjNN6SncHfp2YfVQ7IRIWwZrIF+YxwM+5JgMxNpIqvf7XjpKpEAQuE9Upy7ml7nw8PJhl/pR7antK32rlnjH1qaOYAFtpEb1BCiD6msZ1C1UYiBddnwaQ0zeqyNF57CFshvIbcBAsetNWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URri57Y1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdPd3J+K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="URri57Y1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdPd3J+K"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873kpQW2219064
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 06:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C8wmw8b3Bm/wun5cSxqODN
	HcPjpz3JjNO33Mag0HZBE=; b=URri57Y1JmGNjsB1h3r/99n3cw1gW4FWqWFBUc
	E3Y0rgHwZwO54fmYstEb1RPOuai6eiuAr1sE73wE5IgbKcn0ege0LTbWcycc2Vdr
	xzBhou5XgaiM6jiwHmXuaMGz3zvQB2IL7MQzWicc6lY9AZT2aJ0818xKvoLWB62i
	gFrh56ykPs8m15VBEqq92GWeaRZkh4owMpiXawvKose6/jv0vePhooavIPabukso
	lAMOHAxzlvxd2SsQ1dkvLLQJoL8L0s2PtaaloetDclxmRFgCt66hIdtcOWkYHZD9
	PZyuObY2w7vUOtdF57lf8pGosVafkT7mFhP2sOInL9K+EjHA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggcca52gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:03:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-395543dc382so4265293a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788761022; x=1789365822; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C8wmw8b3Bm/wun5cSxqODNHcPjpz3JjNO33Mag0HZBE=;
        b=LdPd3J+KHGp4Ye/kTDwgbrOJ2RFE3KOF3ByBYRswGqE3nPCTpx1sHLnlE8v+52/h6m
         hwqF74k1gn/Rw6rhyASeRs536v/HjfDhtbLdf+xtZV8Ipyv8Au0KxiMl4ZVZdI0UuEwS
         qKUtQhrxkhTE41Vv7sQvQF3zbMYRUXD6qruCnqwBWsJuoNGHOGK8PP5sIvY+dwKv5QKd
         HramwPUvr5CUvSHb6PMLe8jX8aMZXOFpDlKCpS59bRrkmqix+l1VhRn7UnF7xZqZk+Y5
         7Wd+eLFVagGftAg68GyFf7tw+fjjjF4Q6NriRs/sNl2JcRWc8hxEtSZdF3U0F1wXH14B
         tR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761022; x=1789365822;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C8wmw8b3Bm/wun5cSxqODNHcPjpz3JjNO33Mag0HZBE=;
        b=gR+dHdWLFCU7NOET3H9SqCLgTFALazH+OLrY+7q4t5Cqs5mDq8W4ShFxbMpZz+4Gmc
         wMr4udYLccnPZYNYpbKn4lyX/996sinxGgOFButzUq1COLMJHpNxTBa1w1i7qeR1oZwT
         xY19/ZGIHcEmMTudYrv37Aun7zGAC3V8C6UTCT9BBkCc5Q9O7nwDNQLCq/Q5pr2WRXT2
         ZgzdkHLMjeZoYc3IPGXH+nbfks6f/DFhfJTsZsJ85oKuReI8Twy+hkNwAnFuxni+U05Z
         PRfUqesc9/3lx0KAQ2yNJ0Y4us69mzXIXXJ958gOzEcxUYhdGcGnVsnhonPLastH0XC4
         P2bg==
X-Forwarded-Encrypted: i=1; AKwUvBzWGaINEhrP8SHh2u7C5htGry5Gb20/GXFPcEfbkPUnjVhcEB5/QxlstpaZ5gsWUPfMw/e2qSKgPt5YsVA=@vger.kernel.org
X-Gm-Message-State: AFuF++lAqO+Qz+ihR4yXBmEUhD7o808tbLM0FEGszdlJx/L0sPKe1mM8
	InB9V87MTzcnZsiFaiEgEgJTj064Ipl4akwn97HLYMtkK8B5zZomVBge4duLaYP+0+b6yGQdGyh
	mMQqCZhhtOn35FW0k8EPtcT7s7wG/xJ0Q1HmK6VV8BL0wdU4S7p0k2hygz/6cC00Ffv0=
X-Gm-Gg: AYBFou3Z0Mf9LIsuitecIfxJ1znJ2CTnA5nd4a6pOJRgL1+E9xC+2XntqRtQ6tgMoU9
	Q4sGD6H36wQK+GRDBffHbfOVa7EFTh0OjtraJ7liwkk8J0cMOfUIJBPT2gIAd23DR2E3CwlfZ5r
	THYLkD1mDHxSRdjrZBdX8GlTmMdTgkxJtwDjj1Z/6sSxaB8VaKIkSCgCRt68whFnkM9Ob5/Y8BM
	q6PgyLAbHqvLfySWcz/jbKiqW+VGIVcD/uGrbVq4aUgI4Rnt/9EkQ+AaZI+OVqR5/1F5yV36kQB
	vfs0V2CWhnuRfjXYMU9gl0Orug7YPqD779YaQEB9PQX6/8VqF4LOfdqyPpJbG4IM4RT2lCTDAW0
	Dgtja/ONFWG0ljxrUyPepFrhF8ryYGIV5tsf1ajUBXyeyIAwm7yOH/wacINuktz8=
X-Received: by 2002:a17:90b:4d85:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-39b2617abf0mr32355062a91.7.1788761022119;
        Sun, 06 Sep 2026 23:03:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4d85:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-39b2617abf0mr32355000a91.7.1788761021530;
        Sun, 06 Sep 2026 23:03:41 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm18750743a91.9.2026.09.06.23.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:03:40 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 14:03:27 +0800
Subject: [PATCH] coresight: Fix clock refcount imbalance on platform probe
 failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-fix-clk-issue-v1-1-efe81fa2b697@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK9TnmoC/x2M2wpAQBBAf0XzbGovlvgVedAaTLS0E6nNv9s8n
 jrnJBCKTAJdkSDSzcJHyKDLAvw6hoWQp8xglKlVqxqc+UG/b8giF6HTVFnvrDVOQW7OSFn4f/3
 wvh+opaHHXwAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yeoreum Yun <yeoreum.yun@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788761017; l=9099;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=qJqU34m8Z4NoF6i/4qh5n6yxeIUMc8E/efYlRGRjlII=;
 b=nsqeBI4mqI4x+pTl8w6VRmGIzthWLP9IGiRZoW6Ssch4DmVCU66VGR8tpMCrWuYVCnsFt13EP
 GIybSToGghHCDVQKUe7sM7TiShKKcQS5Az/IWIRMcc0WUmq5YnML++9
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: ZviX2zHw8ev2nIUUSZ7JlUWMhSJAT29e
X-Authority-Analysis: v=2.4 cv=EJo2FVZC c=1 sm=1 tr=0 ts=6a9e53bf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3lXbaw0bqDP-cecxZ04A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ZviX2zHw8ev2nIUUSZ7JlUWMhSJAT29e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2MyBTYWx0ZWRfX0BMYV+AtiWJX
 X0FdEPoouF3tW5WNWiHuWNOEV+b4VEZRFBF69EJ5ZKLDREjcE4a4T0YXo4BUkBIE3wAlnjl7KQM
 vD99fStrwcNxa8b6FOA3Z863nbOUBixJ8c/sqMFQ8wFd9IUWISUzXlCP7TQCUmiVtKudDoCgGSa
 RlVGd83YWAL+tMqTddYiog4xcKnA2d1D2mP+UrspqmsIywrinXlGt7qxbFrUBd2dS43eevc+gp8
 FfXTVohR2B5G6bwjH99srUnaShj4/W+wVBRIfo2QAAPRHRG+en08e7HFxzNjTu4uII0Btxz5+Qy
 6E+DScQKOhP4DSGg6iDOmIe1p+2VMV7ebd/A/2/UiaQ4RyvFbmssCIz9ynySOq18DnCrCyyni3b
 eY3X4rB9znj7E7L6EcFTerxh1DqTpuqCHoWkhpPUQEnv8skmi4sZ6xVmex/Gds7V53d88JeHcX6
 3mRVJqZ6hVTkWkEYp5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2MyBTYWx0ZWRfXxhZurI2GI1o1
 o+T+ZH8LreQDRP+BJ+XcymokX+3myMYHPukbWgpZxvlnHOsbqpWyTLD3U7TwRqMTphjrRGk5gAJ
 PjU78BdVSmRvC+hogrHUx7DuLjeUbJM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070063

Each CoreSight platform_driver's probe() enables its clocks via
coresight_get_enable_clocks() -> devm_clk_get_optional_enabled(), which
registers a devm cleanup to run clk_disable_unprepare() on driver
detach. The probe wrapper then unconditionally calls pm_runtime_put()
regardless of whether the inner probe succeeded, so on failure this
also fires runtime_suspend() and disables the same clocks a first
time. The driver core then unwinds the failed probe and runs the devm
cleanup, disabling them a second time and underflowing the refcount:

  coresight-etm4x etm0: probe with driver coresight-etm4x failed with error -22
  ------------[ cut here ]------------
  qdss_clk already disabled
  WARNING: CPU: 1 PID: 432 at drivers/clk/clk.c:1188 clk_core_disable+0x1d0/0x218
  ...
  ------------[ cut here ]------------
  Unpreparing enabled qdss_clk
  WARNING: CPU: 0 PID: 432 at drivers/clk/clk.c:1061 clk_core_unprepare+0x248/0x268
  ...

qdss_clk is shared by every CoreSight node, so the extra disable drives
its refcount to 0 while sibling devices still expect it enabled. The
next funnel to probe then touches unclocked hardware and panics:

  SError Interrupt on CPU1, code 0x00000000be000000 -- SError
  Kernel panic - not syncing: Asynchronous SError Interrupt
  ...
   coresight_clear_self_claim_tag+0x7c/0x1e0 [coresight] (P)
   funnel_probe+0x114/0x2e0 [coresight_funnel]
   dynamic_funnel_probe+0x24/0x70 [coresight_funnel]

Use pm_runtime_put_noidle() instead of pm_runtime_put() on the failure
path so it drops the usage count without invoking runtime_suspend(),
leaving the devm cleanup as the sole disabler.

Affects catu, ctcu, etm4x, funnel, replicator, stm, tmc, tpiu and tnoc,
all of which share this probe skeleton.

Fixes: 1abc1b212eff ("coresight: Appropriately disable programming clocks")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       |  9 ++++++---
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |  9 ++++++---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 10 ++++++----
 drivers/hwtracing/coresight/coresight-funnel.c     |  9 ++++++---
 drivers/hwtracing/coresight/coresight-replicator.c |  9 ++++++---
 drivers/hwtracing/coresight/coresight-stm.c        |  9 ++++++---
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  9 ++++++---
 drivers/hwtracing/coresight/coresight-tnoc.c       |  9 ++++++---
 drivers/hwtracing/coresight/coresight-tpiu.c       |  9 ++++++---
 9 files changed, 54 insertions(+), 28 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ad8dafea7d2f..9a59a1f9e7fd 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -632,11 +632,14 @@ static int catu_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __catu_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void catu_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..ab0232537523 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -251,11 +251,14 @@ static int ctcu_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = ctcu_probe(pdev);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void ctcu_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2247ad55d444..ed102f6203be 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2330,12 +2330,14 @@ static int etm4_probe_platform_dev(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = etm4_probe(&pdev->dev);
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
+		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
 	pm_runtime_put(&pdev->dev);
-	if (ret)
-		pm_runtime_disable(&pdev->dev);
-
-	return ret;
+	return 0;
 }
 
 static int etm4_probe_cpu(unsigned int cpu)
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0abc11f0690c..d75f11fda72f 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -319,11 +319,14 @@ static int funnel_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = funnel_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void funnel_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 2f382de357ee..3fe5eb5a7a0c 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -298,11 +298,14 @@ static int replicator_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = replicator_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void replicator_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 4e860519a73f..5de0adf1d33a 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -1011,11 +1011,14 @@ static int stm_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __stm_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void stm_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..2481bae5c9f3 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -974,11 +974,14 @@ static int tmc_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __tmc_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void tmc_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..d06731c45a1a 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -288,11 +288,14 @@ static int itnoc_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = _tnoc_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void itnoc_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 7b029d2eb389..9ae94dc553d7 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -271,11 +271,14 @@ static int tpiu_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __tpiu_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void tpiu_platform_remove(struct platform_device *pdev)

---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260907-fix-clk-issue-51e43c533250

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

