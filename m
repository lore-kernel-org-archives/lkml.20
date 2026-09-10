Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3714A342510
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003061; cv=none; b=NJ751/UwPdS6nzA6nbD1l/wCh91u0raDy2IXPoQhQxEcj+jCGz9Sk+HwjlU1XhfVM+O8XffEPtBFF7sJvZYnuEH8C2nqk+mdSbHZgUxYchzveA/W3ul+hkiNMYSMrV1oa0mfYy88rlnlbMIt6R1uiDbR4nvqqiBkTNBz/8WKZ4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003061; c=relaxed/simple;
	bh=Jv1R1iFahp7XDd9HEcepxNUUEt6E+sEodfeyW29HPO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mwyL/rrzoFNZoiSjegbnNAIQqCsXiX7JCPW7/3RGuXLHlN0PPIH0C4itDeW8PgfIJqmPahol0Qg8B3x4nR2wvFN8KpwEkppsA3P6/bgY0PsgbJtyKhgMrJZngV0PN19J+AsAsISdoPujRGu8DB7ev/BeXlQiYdnnDqzVBsku1Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8S/FRMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQbHsYxN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8S/FRMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQbHsYxN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689M9TgD4075996
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5YIpf9m5hfwTorgx3C2qm6
	+4AOfhEwaO7Idy9G6o4As=; b=A8S/FRMRheN1QYxHxR6rMUh+6QVrQ+IyfVNia7
	q7ebTRgtaafVQiMioMr9I+YWnHCv/gliA9iamShEsvjlUpgMRVJUjAqo8wtwHy3Q
	QzDEmyVlPlNC8g95vR54cXlJlF7sBm52mJft66vRmskw80q0azucwJH/kNTu99P5
	aYdtYLwsGoUWgBwsBZTGQR+Li2bUTdP7ezyUQx9I8XJkNqKPouUJfGpnVXqFXKs8
	+xzTl9nK7A0WPg9hwJHxET1o3BltIWWHzls6JjwC3q4Ar8t+YSSy+47Yi5Gsqdjs
	g2Bgl3ZVB6e9o3gqAg/hzOiP0igzDhy+E97qQ3AEYhI+XlPQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydhedv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:17:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-399311947f6so11248902a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789003043; x=1789607843; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5YIpf9m5hfwTorgx3C2qm6+4AOfhEwaO7Idy9G6o4As=;
        b=KQbHsYxN39au6gezaoWCbYZWrWjka50aphGXh+sqXodeBQ9JFbmL+5S5Tv9gMVHxp5
         CfDtMs1M0ybIous1pSNFkt6rMk7uVDyHqBcbcfLiUTf+8u4y2xckoss7Sj5NATFtlcwE
         Ozr7Xe3x9YM8cjCo3h+LG/698uP9vzsessaECSC8q6RZg07tzkcvWWYoU/+99xzuTYuU
         pBLWARFjtAidmDlUAUJrgExiiCc6uw98lhqOu+8dzEAhLGXeUmjIcX2/o5XzYAr43hTi
         oTn61/TSumvCUqIBxAb5oBh35Jn9AzlILnL3TL3rpKOjsl7yYCVRkw+X6Txjo5s1lkak
         OKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003043; x=1789607843;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5YIpf9m5hfwTorgx3C2qm6+4AOfhEwaO7Idy9G6o4As=;
        b=XDmPZKg7gyW0DaZ8ZrH2zM/T0VmtZAOrh1tkFvGjCp8eTflvN/obL3PkwCitG1LeSP
         ZrpKvYlRmCn9bcZv89JzkMtz3kO23LtODY8HTUDDRPpecKMik0Yni1eJ65amAX4HvUWk
         AwrxOneyDO10g/eTCmkju2/8akwBBw7PYkDuvGwca4BgJiR0u3wzODzPDnMhxKQ9S0hu
         Fo+2GOFr7bZOgVFeFmI+8yHGKx1W38nQYz/OisVaudrAKBCJM+PUl2ykHUjGKn073E6j
         HKqTw/fiSFhIICvWEiJHHqkguh6ShZgn94s9yeHj/yV9mCRwHr+3noxpwnqHXSvhJfBO
         v0tg==
X-Forwarded-Encrypted: i=1; AKwUvBz8rKFCW+qFWtikmYhMQI6PIN9/bk3M1DbUDVzfDx+YIJCRijVmvUcSFHQiAq3ju/dPa9wvLDZtjNgJW0w=@vger.kernel.org
X-Gm-Message-State: AFuF++lcLTiHaXuCrBCzp77DgS1XjD3PqT5xHoCvAosy21P7/zLFVoAw
	uNYl/deHZjU31pgiDDFucgvcV0LFurkzf4DOC5nf2sNm/86wOy37wswQO9SsLyFaSJhReqRtPU+
	mxXc7Gdxx7boxpR47Zbg9IE2Hhy1UurEAnJiwM3oHUl876KK4xDKWOnNoU0k8rLGq8uo=
X-Gm-Gg: AYBFou0S4tSsj2z1zTotNY6BkieTiURgtUR18uWs/ko6cxb9IIeYBpmvZWSozxrbTfb
	NtMO+9ROrwSTyUAMBEw0hId/rAGV66YOBuHNevV0DfYrgq3jReTFm/RjIHlgCl5MJQaBrdRP5XZ
	0PVHTQhTDmKBBbrnjqFHcDLqPWt9mZsS/8ax58w2OlmYy7EO4F2BGAODaLcNXDi1R6okeuRi9xX
	1xWAzxANibXlk7xEo73wir6lctKe/5wsV2fuIbB7DeZuCva5Joo/MeVc0CtfMqG+thp9qxdvGKF
	Rf50JKu4oHMI6n6FBiunCNodjBofyIUbI51OCjPcYa4pV4x7BFq2iunefFJhV8LIftFrNQ5FOPX
	fhcTCr91EBoe524H9CsiK5hYxlJ+8Jh5zzd+6yFKZXn1HD2AniOA1BY3jroSmGBiZvw==
X-Received: by 2002:a17:90a:750:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39b92bbac84mr13637104a91.22.1789003043025;
        Wed, 09 Sep 2026 18:17:23 -0700 (PDT)
X-Received: by 2002:a17:90a:750:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39b92bbac84mr13637047a91.22.1789003042364;
        Wed, 09 Sep 2026 18:17:22 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e8ad192sm874878a91.14.2026.09.09.18.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:17:21 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 09:17:05 +0800
Subject: [PATCH v2] coresight: Fix clock refcount imbalance on platform
 probe failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fix-clk-issue-v2-1-fda3dd324c0b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABEFomoC/3WMwQ6CMBBEf4Xs2SVtsSCe/A/DAetWNgLVrhAN4
 d+t3L1M8iYzbwGhyCRwzBaINLNwGBOYXQaua8cbIV8Tg1GmVLWq0PMbXX9HFpkIraZ94WxRGKs
 gfR6R0mDznZvEHcsrxM+mn/Wv/WeaNWokTwftW3Mp6+oURPLn1PYuDEOeApp1Xb+2gHensQAAA
 A==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789003037; l=9906;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Jv1R1iFahp7XDd9HEcepxNUUEt6E+sEodfeyW29HPO4=;
 b=aVSaf/GOMmddOEIltGhyIIibwVJF80OZSO6eIMaS+rxK74aRRP6VFoNRSHYeuXRHKg4KZ0Dxx
 K0M4j943jSQBdHGax209rTSO+UsNDDzXHg+oOtDVT4JhQi+rVLredTb
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxMiBTYWx0ZWRfXz4S7HZqnHaMB
 Le+sG1XbPaNNOQPns+zS09D6d00Cniuy6r+cqv4ipToXscpnr/oKyIMPjOG6ag6T8yYM+ZrwybN
 8sP/yd9XZOviyZS4iayFrlzFRoY2/xc=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa20526 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=_kMt-Xqyp7RSBKumsnwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 8JDigon4weidoxZ3WvRBb-U31zs_iZ_C
X-Proofpoint-ORIG-GUID: 8JDigon4weidoxZ3WvRBb-U31zs_iZ_C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxMiBTYWx0ZWRfX2YT0wly125up
 iIfGbS3UBRlsfRm9CwvYat3LecK8MtCtI+DYVF+ZJIJPEo+/PW5kvG8MAAFBb4ab7PAJMsz+Uhc
 ywWO8oOxzNykVc1ekyQYoumf1JSFR8/7frUUlcGTeEdbygtjyXB5zkm2dLfZR4sAtJO/P5OWdrg
 TJKIgzqxu2orVV8twhfyvV+mdvYX1ICynCWqUQfViegYUIFI6vh94gO++6VOccAHFiwqqUPqwZB
 mTI4nYlXmelEn7ELXl9Ln5Zt9t3X0gmsa2WkXyAlnz5oMOeJGCnGzerdZu9sUzZaWcuvUAUizaX
 pRnDkioEkoaT7t/zxZNcry3FXe1KSBsJt9yY9hudLwjVRmbcgXXokGsvDs1EeBbYNmhME7KhhV1
 MvEK28EvUERMLIedMezlY7ZgkOhXS/5YuxfRS5mAsez5Rc0RotM3/pSfJwKMVXpUKrjPfrJeBwK
 qJhwTPev21LBIIx2BqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100012

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

On the failure path, disable runtime PM before releasing the usage
reference: call pm_runtime_disable() first so no further
runtime_suspend() can be scheduled, then pm_runtime_set_suspended() to
explicitly record the suspended state, and finally
pm_runtime_put_noidle() to drop the reference without invoking
runtime_suspend(), leaving the devm cleanup as the sole disabler of
the clocks.

Affects catu, ctcu, etm4x, funnel, replicator, stm, tmc, tpiu and tnoc,
all of which share this probe skeleton.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Fixes: 1abc1b212eff ("coresight: Appropriately disable programming clocks")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- update the workflow regarding to Leo's suggestion.
- Link to v1: https://lore.kernel.org/r/20260907-fix-clk-issue-v1-1-efe81fa2b697@oss.qualcomm.com
---
 drivers/hwtracing/coresight/coresight-catu.c       | 10 +++++++---
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 10 +++++++---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 +++++++----
 drivers/hwtracing/coresight/coresight-funnel.c     | 10 +++++++---
 drivers/hwtracing/coresight/coresight-replicator.c | 10 +++++++---
 drivers/hwtracing/coresight/coresight-stm.c        | 10 +++++++---
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 10 +++++++---
 drivers/hwtracing/coresight/coresight-tnoc.c       | 10 +++++++---
 drivers/hwtracing/coresight/coresight-tpiu.c       | 10 +++++++---
 9 files changed, 63 insertions(+), 28 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ad8dafea7d2f..4e2687e61c9a 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -632,11 +632,15 @@ static int catu_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __catu_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void catu_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..5827b6d5844f 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -251,11 +251,15 @@ static int ctcu_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = ctcu_probe(pdev);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void ctcu_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2247ad55d444..48050f86ead5 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2330,12 +2330,15 @@ static int etm4_probe_platform_dev(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = etm4_probe(&pdev->dev);
+	if (ret) {
+		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
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
index 0abc11f0690c..264964a340ec 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -319,11 +319,15 @@ static int funnel_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = funnel_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void funnel_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 2f382de357ee..93274ab0cfaa 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -298,11 +298,15 @@ static int replicator_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = replicator_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void replicator_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 4e860519a73f..88726274ebeb 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -1011,11 +1011,15 @@ static int stm_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __stm_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void stm_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..c4fe2dde5bf8 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -974,11 +974,15 @@ static int tmc_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __tmc_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void tmc_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..4479d93f352b 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -288,11 +288,15 @@ static int itnoc_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = _tnoc_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void itnoc_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 7b029d2eb389..3166ed6bc224 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -271,11 +271,15 @@ static int tpiu_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __tpiu_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
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

