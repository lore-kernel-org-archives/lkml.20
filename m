Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489BC38A700
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122540; cv=none; b=sswnV9b2RtJYQeIjYPmAf4g9l4QXfOZcERupvbd2LSQcicJTRL4A2nfGwn0DR30g3G6gzxxJ2+So6OavToqxRartkNZmKTQRKRCS7BGcg/qeuPfmUcZ9kMPEQV7lW9Z2r3NXni8nalRG366p6BJuWw/srJxCXQMFK3p30J5+Ejw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122540; c=relaxed/simple;
	bh=prgnis7GOywHrLI4Gw6b1Du/gpVpGDzh7dABj60kp3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OS7B7qEwQh6Pu5ihpRv1IHViH1pBK+2tdtiP47jFDRaLV+fg2n62QAh9LaJ4p01vQBM2A1c33ZCO8r+mhWnX0YXg6CidWg1PE/h7mr/pUPXRjjLbaU0RUAbqNCNchKqWou2jduYB3QickXe2x8GMPqsT/GfB8D20diSsR3yfbBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bu/udOve; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTU5f8x1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bu/udOve";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bTU5f8x1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kqCZ3464050
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CWrBGHNoo/3t6uxKrkLr0l
	f5ykSkpDUDGnod8tywwMs=; b=Bu/udOve1Qh/up7WUf4EPd/D/b6mXokd/U3AY4
	vCkCG3jcCZDhY/ZggX3op1dT+e3zMOUkqTzJrawuinDoC//6EySOC5B/L8WuHUk0
	nZJDwHX5eix2mixtxGjynAhyCJholaZ4FHtvjNDBSsOQEmHkF6Wi9bbLg39QR5/V
	6UnVbNB8upZfpNZP1yZ2qA5A5A17U6374Q2iqzhZWSAWhZfxXYN/dSL2wb1pfrMF
	jrfuhM9QA8w1XBtjVioHoIrnVdDytV9uCFVgr/vp97J4hnwTULxxetJacVLB/0FC
	59Zq16dfkaVhk0KOCL/56w4uwWHB/ielA8/t6pa9Q2R/Ow3g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdr967p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:28:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968dfff779so1197171a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122537; x=1789727337; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CWrBGHNoo/3t6uxKrkLr0lf5ykSkpDUDGnod8tywwMs=;
        b=bTU5f8x1cZf9zs3ghUswAterJnlhav42SWIKYBT/M42MjCzXwh5X6m+GK8ps/iUWUD
         syNaJGKg8mo1Djwi/hGL/lSfl2BXeNiK+7HFo2mUFenQWUNftsL7rGvZdu8uFrbO0niz
         0hFoj0G+qMIoMrDwOfSpM87lHW4+wkU0Ms4VosU0Px7ZcfPvg+aM3cvfviVboGeGXwCh
         iKNASC8qH9dQCizH+ql8lO8eyZa2MM072xp+LeNWpDnRXuD2q7yUDlemp97pGGEKa8Wi
         HXdes8E+UFSJy3aI2OgHf/GabRt9GlX1bMvD911rCwmllasR/PUQrPlJUrLxAXYtKJgM
         4Cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122537; x=1789727337;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CWrBGHNoo/3t6uxKrkLr0lf5ykSkpDUDGnod8tywwMs=;
        b=Pav1Z/2vMpc2O0ig2Na8cKTMDiHfrer2U+2WiWYPSqTKuDqcH61LW1qWeBJrkEU7HG
         5VbfqIx0u/4ZkRRg9QaXHEYBvnKaHzPkiy27lCpWpUywR4xcMcptSGf+kch9wBfaycSL
         sK2czAps5BWcWLf5z93SvnOv/2KrRBvgO9tN1thrqyJxMrr60VirgNirF/AZ661AcLQy
         +IuMeHKf1k/8TBi242ai5pMlRHgbb/3rgnCK3qPDTEddrsY7OwOPXzNWuTzptslfO7x9
         zwmJAojkeXJfqaEJde7GXlLLQWevbvD83jQ1B1pw3l+WoQFmZmfeQqYMf8NpHgHilxrc
         XN7w==
X-Forwarded-Encrypted: i=1; AKwUvByIm/kv+4P5W5eG0m2Q9JkGRgLwqp3vCNGdYKDW/lWkEBNMHXVmYihH/WJvasSM9PjkyopUPqavLJ6rwSM=@vger.kernel.org
X-Gm-Message-State: AFuF++kVgxi5YRzZn15iqQuVrfqI+XyYs0HoEAoTjRLkqRCBkvmM8u7O
	8zXHOvlvYzbVA+tF2g9UgVePCWVgTzHbW2FOzzWJR5/RPB/KMgrid+rrVOOfHnJlIMFImficol8
	M4uzvocl9zGmwUBk9QsbiJTA/25CaQfZhL+RGFwBOxsmwH+UMmLBUHa/qgVA8N3au6cM=
X-Gm-Gg: AYBFou0Xwa/LfD93fcg+Zjw5cgQXAPpbIkCeIjlLoVIl90rLVNak+jfnu096eEPK19B
	+k+JlpJj7fE8uoJg1/6AEUvV0PQn6PiSs4axjy6SW88IUNFdSFy6/omJ3CeET27lwMlZLDZOxJs
	KliwacOc/mICCKevmTkMXDylt/oc759XdUmTMr11xeebcMwBCaWn0UTi65Q7icyO5SnOPFraknR
	HzrkenE9+aKh5Oe3JdYw9ErqUP0tzKOZry1L56HfM6GgZs60RNFTZzNNppdIxPBQMCxj9fqTrCb
	kLTao8FuTBreCMiCDhAGdfsncavMwFqhNln9xFN4528S9f2V7B+CkT+83/+rYk44LUudj6U8XGs
	XWDUng7DvvvT2XOiB/CZTT/0Gz0ohFASq9pMosC0BIoLRSdqvlE0k3dh+IQ==
X-Received: by 2002:a17:90b:2d82:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39d77d22aa2mr11502018a91.32.1789122536944;
        Fri, 11 Sep 2026 03:28:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2d82:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39d77d22aa2mr11501979a91.32.1789122536304;
        Fri, 11 Sep 2026 03:28:56 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a3casm5471657eec.12.2026.09.11.03.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:28:55 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 03:28:52 -0700
Subject: [PATCH] coresight: handle runtime PM resume failures
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOPXo2oC/x2NSQqAMAwAvyI5G2iLC/oV8VA11YBWSa0I4t8tH
 mcOMw8EEqYAbfaA0MWBd59A5xmMi/UzIU+JwShTqUZrHAocd6HA83KiRH/yRnhs6CyvMXmslTO
 lakxtaYCUOYQc3/+i69/3A3QR8ftyAAAA
X-Change-ID: 20260911-b4-coresight-runtime-pm-failures-70f250927aeb
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789122535; l=10711;
 i=yuanfang@qti.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=prgnis7GOywHrLI4Gw6b1Du/gpVpGDzh7dABj60kp3I=;
 b=RZqAyHsdCRu7ZdV2WOrNsOBgZ6rC7W7PfdWNwS7MTzK4pgOoaM7tphS/7+46nw4R49XT7gZM9
 fOrKAVb0EK3AF4Lj55xh5CueGXfOOdz4vem3GtD8JBcDfmMZiaKr5DO
X-Developer-Key: i=yuanfang@qti.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: tQYiYshh8CiNpt7aV9uJjPP6pUfzDtwF
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa3d7ea cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=AmsXAa7n7-pT3CpYTX8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: tQYiYshh8CiNpt7aV9uJjPP6pUfzDtwF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX26PJ0X4U5lV2
 Jav+sewnCupqO7haQNX3kyjXsdKZ05QQNh97jE8M6cgwf0A/6YWe6UV8U1M/KKrrjckGSzzjUGM
 eLvXr5mP8/cH10qFUzvU+WQOrJ6/cSQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX0mCUpi99jb4x
 Lt4uvC3gwwljx4jB1bUft0KyPSwGs0r11BHmnaeOYou0x2YVq+CCkiUVSJPaRXVUzkZnu8urtSs
 sZ+r16D7oYrVX9v7MOtppWtLT6aKaxZAPyYz4U+UIJ1vsXaYA0Qe5xfOg0LeooQpDuGomgCUzJ/
 72dysM3Dg1oljkF1HVgNDOQK4AZ9ELkEcNeOVyZWl31+gVd4GGrhdXjj9HEums1vWkC6fXSegne
 hv15Ar+8I1j+XdpRK1oBkcd+7AIE9td0q/hFT/Edj6yYF5Gzibv02HlDEOWPFekgz/Bdzb9fOh6
 maVopjGsMgc6gJQcKfB/MoYky6Nq5O3YRq1MFmzXDYe/3ixEhM398HqXBCzO5I/7aXKCSkZWbNJ
 9+Puy16ETvPToFcz2J1igQxqH/RhbF6t9gI5JjmuXG+Qq/W4uZZOn+50+BHxN4NM/ee6d6OvOk/
 C7DZ4vnuT3iAwI9TL6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110146

When a CoreSight component's parent power domain, such as a CPU cluster
genpd, fails to power on, runtime resume returns a negative error. Several
call sites ignored that error and continued to access registers on an
unpowered device, risking an external abort.

Replace the remaining pm_runtime_get_sync() calls with
pm_runtime_resume_and_get(), which restores the runtime PM usage count
when resume fails. Abort before accessing hardware and propagate the
error to the caller.

In coresight_get_ref(), unwind the module and device references. In
debug_enable_func(), roll back the CPUs that resumed successfully before
the failure. Finally, release the mode acquired by stm_enable() if its
runtime resume fails.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
This patch converts the remaining CoreSight pm_runtime_get_sync() users
to pm_runtime_resume_and_get(), propagates resume failures before
hardware access, and completes the related module, device, CPU and mode
unwind paths.
---
 drivers/hwtracing/coresight/coresight-core.c        | 13 ++++++++++---
 drivers/hwtracing/coresight/coresight-cpu-debug.c   | 10 +++++-----
 drivers/hwtracing/coresight/coresight-cti-sysfs.c   | 10 ++++++++--
 drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 10 ++++++++--
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c |  5 ++++-
 drivers/hwtracing/coresight/coresight-funnel.c      |  5 ++++-
 drivers/hwtracing/coresight/coresight-stm.c         |  7 ++++++-
 drivers/hwtracing/coresight/coresight-sysfs.c       | 11 +++++++++--
 8 files changed, 54 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 928488a216d4eafa3cdb5f882ae5f44ddaff0448..ff93a017dbe22b01236ac2e5021da9b82890e72c 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -822,14 +822,16 @@ struct coresight_device *coresight_get_sink_by_id(u32 id)
  *
  * @csdev: The coresight device to get a reference on.
  *
- * Return true in successful case and power up the device.
- * Return false when failed to get reference of module.
+ * Return true on success and power up the device.
+ * Return false if a reference cannot be obtained or the device cannot be
+ * powered up.
  */
 static bool coresight_get_ref(struct coresight_device *csdev)
 {
 	struct device *dev = &csdev->dev;
 	struct device *parent = csdev->dev.parent;
 	struct device_driver *drv;
+	int ret;
 
 	/* Make sure csdev can't go away */
 	get_device(dev);
@@ -843,9 +845,14 @@ static bool coresight_get_ref(struct coresight_device *csdev)
 		goto err_module;
 
 	/* Make sure the device is powered on */
-	pm_runtime_get_sync(parent);
+	ret = pm_runtime_resume_and_get(parent);
+	if (ret < 0)
+		goto err_pm;
+
 	return true;
 
+err_pm:
+	module_put(drv->owner);
 err_module:
 	put_device(parent);
 	put_device(dev);
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 3a806c1d50eafb4249ab516ef846e437831b9681..39602d610e5b22ec4f165dbb126a7c06aea08eb0 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -429,19 +429,19 @@ static int debug_enable_func(void)
 		if (!drvdata)
 			continue;
 
-		ret = pm_runtime_get_sync(drvdata->dev);
+		ret = pm_runtime_resume_and_get(drvdata->dev);
 		if (ret < 0)
 			goto err;
-		else
-			cpumask_set_cpu(cpu, &mask);
+
+		cpumask_set_cpu(cpu, &mask);
 	}
 
 	return 0;
 
 err:
 	/*
-	 * If pm_runtime_get_sync() has failed, need rollback on
-	 * all the other CPUs that have been enabled before that.
+	 * If runtime resume has failed, roll back all the other CPUs
+	 * that have been enabled before that.
 	 */
 	for_each_cpu(cpu, &mask) {
 		drvdata = per_cpu(debug_drvdata, cpu);
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 3fe2c916d228808233ef19e9213a0cc0ce3cf297..6886b8713368058b9cf33ab7fafb5f87e23c1ec9 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -167,8 +167,11 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
 	u32 val = 0;
+	int ret;
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
 		val = cti_read_single_reg(drvdata, cti_attr->off);
@@ -185,11 +188,14 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
 	unsigned long val = 0;
+	int ret;
 
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
 		cti_write_single_reg(drvdata, cti_attr->off, val);
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index b3c67e96a82a4995515457d1ac0a5b183b162f0f..b34e282ec4a5f37f7de1d2ff118042b47368acd7 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -47,8 +47,11 @@ static ssize_t etmsr_show(struct device *dev,
 {
 	unsigned long flags, val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int ret;
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 	spin_lock_irqsave(&drvdata->spinlock, flags);
 	CS_UNLOCK(drvdata->csa.base);
 
@@ -933,13 +936,16 @@ static ssize_t seq_curr_state_show(struct device *dev,
 	unsigned long val, flags;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etm_config *config = &drvdata->config;
+	int ret;
 
 	if (!coresight_get_mode(drvdata->csdev)) {
 		val = config->seq_curr_state;
 		goto out;
 	}
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 	spin_lock_irqsave(&drvdata->spinlock, flags);
 
 	CS_UNLOCK(drvdata->csa.base);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index cc6cdd3ae29d502a2e67f07400de957b6dc71af6..55e05c20b302d4bf55c4df30c9ee6d6a1b5f1031 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -2457,10 +2457,13 @@ static ssize_t coresight_etm4x_reg_show(struct device *dev,
 {
 	u32 val, offset;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int ret;
 
 	offset = coresight_etm4x_attr_to_offset(d_attr);
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 	val = etmv4_cross_read(drvdata, offset);
 	pm_runtime_put_sync(dev->parent);
 
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0abc11f0690c5272ebd55df9e98544e3b401cfe6..5824a1e4d046a3caf5b32ed1d8526b8bd7e9ca76 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -190,9 +190,12 @@ static ssize_t funnel_ctrl_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	u32 val;
+	int ret;
 	struct funnel_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 
 	val = get_funnel_ctrl_hw(drvdata);
 
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 4e860519a73f6fff640090cf58298b89a31e6359..b9f15990ed994ea827c8e237d764e74d8d231ddd 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -196,6 +196,7 @@ static int stm_enable(struct coresight_device *csdev, struct perf_event *event,
 		      __maybe_unused struct coresight_path *path)
 {
 	struct stm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	int ret;
 
 	if (mode != CS_MODE_SYSFS)
 		return -EINVAL;
@@ -205,7 +206,11 @@ static int stm_enable(struct coresight_device *csdev, struct perf_event *event,
 		return -EBUSY;
 	}
 
-	pm_runtime_get_sync(csdev->dev.parent);
+	ret = pm_runtime_resume_and_get(csdev->dev.parent);
+	if (ret < 0) {
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
+		return ret;
+	}
 
 	spin_lock(&drvdata->spinlock);
 	stm_enable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 4b010f8bc4c08da31b3d295be6c37b6d941629d2..5849dfbd9d0bd3ad10734919f78bc39cc968539c 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -17,8 +17,12 @@ ssize_t coresight_simple_show_pair(struct device *_dev,
 	struct coresight_device *csdev = container_of(_dev, struct coresight_device, dev);
 	struct cs_pair_attribute *cs_attr = container_of(attr, struct cs_pair_attribute, attr);
 	u64 val;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(_dev->parent);
+	if (ret < 0)
+		return ret;
 
-	pm_runtime_get_sync(_dev->parent);
 	val = csdev_access_relaxed_read_pair(&csdev->access, cs_attr->lo_off, cs_attr->hi_off);
 	pm_runtime_put_sync(_dev->parent);
 	return sysfs_emit(buf, "0x%llx\n", val);
@@ -31,8 +35,11 @@ ssize_t coresight_simple_show32(struct device *_dev,
 	struct coresight_device *csdev = container_of(_dev, struct coresight_device, dev);
 	struct cs_off_attribute *cs_attr = container_of(attr, struct cs_off_attribute, attr);
 	u64 val;
+	int ret;
 
-	pm_runtime_get_sync(_dev->parent);
+	ret = pm_runtime_resume_and_get(_dev->parent);
+	if (ret < 0)
+		return ret;
 	val = csdev_access_relaxed_read32(&csdev->access, cs_attr->off);
 	pm_runtime_put_sync(_dev->parent);
 	return sysfs_emit(buf, "0x%llx\n", val);

---
base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
change-id: 20260911-b4-coresight-runtime-pm-failures-70f250927aeb

Best regards,
-- 
Yuanfang Zhang <yuanfang@qti.qualcomm.com>

