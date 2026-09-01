Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B6A47D459
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261297; cv=none; b=N4FW4MP5LHIE5ki4iUMVOcp1X8d5GzYIzfsJqpNLAB9VoSaGQS37M31ErPhGw2O5nmaL0XQOUQjUIR3TXvM8np2Pz9Y0VZJt5hyVhJvAeZp1yNFQ7t44Nlcxy5uiyVl7wkTeCANDfsJ1jLTthXm2GnqH4XgH4lFyHWANmq8seRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261297; c=relaxed/simple;
	bh=cmsQL026OgpBUgZ8V6kG+h6Mf4nSL62zg23ayWquaVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ApH4IaIgdVsiTlVP9g6FL1rAqOzt1djkzPGjzP3tWVcht9b0YHICLnB2Y7gm3q3nHdjaGvWVTq5z6YpeKPVoXy3iLB/hRJUPl4wskCH8RnQt5+MdqQLanjV7Zl1sfKto9XI3SwEYgmg7Tmf5zSJuCryaOpIfE/crVOgk8qVunrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJGFh9OZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Saw8GU/o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJGFh9OZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Saw8GU/o"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJimX2752207
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 11:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=98Fq6YcblYc
	VHC9ni/bi/J3Yzy18g8RC1k8HtrB14fU=; b=SJGFh9OZhiz/0QoH0c2f2HKwU/x
	lYS5HrqEabxZvjso7GasuwwFTpiebMYavQJE517p9JrUdzPNJ+XN/XVB+yQWQcEO
	X2Un23StV5uJl4RrSgaQQ6y1UEJRT9DvuyVl0nPeOR/G/ElkcErfbO8VmWTz5klH
	e2COr5AxnR0UmnlrV7suUIxKUNxwxPMCy0Qx3x8m/Qx636haYbBc9B32IHV/hA+z
	uGsBHFxyQxgfva3vIieR7rpKRSQFb1ZKRldGmfCXyW0lzt5VmWD+FfDu/J9QyeTM
	Nh8IPAMAjtRxNgtoIJ2zezfiGeTPRQJKaoqcB3DFJpWN9Js9JI0MV48pK7w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchbmg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:14:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9394ad7f64aso195052685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261294; x=1788866094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98Fq6YcblYcVHC9ni/bi/J3Yzy18g8RC1k8HtrB14fU=;
        b=Saw8GU/oeN44HcteL/s1qAzU+f05fxUGiJxZ1eiLx9qXdrIBsdd3DucYJSdpmNSDQJ
         RUjPFtQxkopBPtHOo2utettjcXur+mqe2tdDj3gpjqXblzZGqY2sb4wT8Bb0cI5fMzur
         +2c2lCq3+kTV96MUOQLB+aRIx1878jfs/UXrTQ1Kz6H/f23x/BijLWpcP4Hguxzph9Dt
         qEpE+FYyTduoCiILs4TPDsFThmPRHUD/Tbk+cvivTzSR13zCef1ztQOOkGmL32/Qvufr
         XsWScSfZ4lmEwqB8zeRjkXQk7amMw//2Bs52DRoFJIlY7nUBLxvdJPLaxIhRdrike2G6
         LrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261294; x=1788866094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=98Fq6YcblYcVHC9ni/bi/J3Yzy18g8RC1k8HtrB14fU=;
        b=ojyIBRKqworUYNPw0EtFId1Sr2dn44iSANTFvPXS8+Dm1AsJA/Im1T2VhmVS3oF0lM
         2/aa/9Fq7/f1CEnw7f8ppuQtMQiAaVZ14UooKWYyjgVCAORxxwtYbfWeYcEAZFSnYF9V
         8c3KLqy8nt4JkTICAcwleSb9i2E8/Ueu5UsrBNGOxPLlffsIF06Dm/18orTpsGAIrlzQ
         UhJpQgIbEycgSbx94Mcp7QdXbaMtLAXoeDz8Xe9IjtK30kZwQDQMRDl+9OVz92Q23mfu
         LrGWBcJ+vQz+MlMTkvL+9luZ1FICQMgPiJTBZNLFJNpQtbm0CbZcmV6LoMiCLgcqpsaJ
         aVQg==
X-Forwarded-Encrypted: i=1; AHgh+RooYGY61UmUp+a5cfoQCxYLVQRc2wK2Apruf+oQpH/lqEbDTIhZMYCKnjGAMMDaHhIi2ib/MFNclqGOrhI=@vger.kernel.org
X-Gm-Message-State: AFuF++mOkqwW4aeqkp5hv/M4myGsks6msrbFovr8AmAzM59s5xi/jk7c
	Q13nOn1C6ogslIrPoNN6RCVO38B5BBsvpxWXJE1ijVegaXxLn9Z3A7XIIg2K9sWSGirjpUQg73k
	Hwo8f6HNCpFVKVxKlwPEvb9rjIuY+In7S1svYRAWNI/ch3y2IdJ1PCFhmUvsbSCPiKcA=
X-Gm-Gg: AR+sD13Dp/rHWlvUZzX/uy2lo8R5DhFkTxr9FX4MznJdeVKKvsmJxRZxq+wnXSl1xHy
	u2Gj/kdtDMhE7RkL3SN9Sj1TJNoyswQNMpmXoCnzlYPf3h9R4j5RPDvqmy36LNRHV/lvZnr0yEJ
	x+2552/eZy84KUHlZU0omGnhUXj+q10Ki/AJy/UExbCRpJfa1Vq4GS647EXy3ptwGh8p1ob4cQt
	B6bWP01l8R0Dtrgp2Ij1GseaSwP5AR6sRB7eJdR97uuthNGLJfNl/1K66C4hx6PwPHXCWm0xoxI
	a2dbg0fAmF3UgrZ+aJJuc8vixvix0AABq47FW5WH59UySo+RWtGx7TuZaJeGZt3TDzcVH71Twqs
	cfGjxrJxCqR0pQgyfsJmeXG1jQlp7fPwLm2XS9C+Ro8dy8x5/paKbP2s5kw==
X-Received: by 2002:a05:620a:a183:20b0:938:8ddb:5e9b with SMTP id af79cd13be357-93947f81d7fmr781221985a.8.1788261293792;
        Tue, 01 Sep 2026 04:14:53 -0700 (PDT)
X-Received: by 2002:a05:620a:a183:20b0:938:8ddb:5e9b with SMTP id af79cd13be357-93947f81d7fmr781217485a.8.1788261293273;
        Tue, 01 Sep 2026 04:14:53 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25878ba94csm380686366b.47.2026.09.01.04.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:14:52 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power on
Date: Tue,  1 Sep 2026 13:14:05 +0200
Message-ID: <20260901111441.122436-3-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YuZmMG3pZAaxplwlpFZ5eYg7amq1nZOt
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a96b3ae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=u8BtVuMVLpZXKRMe:21 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VqZmVlX21PZHT1he1CgA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: YuZmMG3pZAaxplwlpFZ5eYg7amq1nZOt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX+IMxiN0J8hzC
 23L6RXvZftd+6+f47gorGwdM1RBollUUJu7hNQM8+45mBX925EidFJm05/+cNZeSQM4i6igEzKc
 FX4HFRDevv2hDdee/kF33OEnRbe8iNw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfXz3YlGrBmLyye
 V1aZ35KVY/nF4IkfWpdBMobqJeAV4fK8MSTrGXRzhHHMYO0YrEbsTDCs4Yt7VKlB+OAxlmUqjdK
 faGwff/KUkcw+fipy1gMenAPr5734KudHp4kexyP9DBXGZUU9wfzjRosEGUG/+tGNVJrttqRylq
 9gZyBGzzht0qkewHu5j418lTTe0Jr9ggo1q0QjZZyRTbyk/vX5OLSzhXOMddL3zmbAru1LdlpEX
 8mwjldhaCKhcoDaNRhHDkchxm/ZGI2r+4icoTpwZ1aHg1Xk1GhmHUNq2GzymOB/Yew+LBrEa2bn
 clMs2UJmnx+88yFeQAT9Qei+E+HjBEZ/E0FAKIKU8KVHuCTwzHxFeoeFhsoyat7Ls0naJyJXRBH
 k0bcRjkw/LDrgvZVpWOb4uFyx1zbWJqdXLrfKy8rVWwv0U0NbQaXzQ7X1YcfZwtrxgR4WYL+F2I
 XUFCgRSI5/IF5LJ0ZTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010099

A driver for a non-CPU device that is attached to a CPU PM domain (the
genpd has the GENPD_FLAG_CPU_DOMAIN configuration set), is currently not
able to power on the PM domain. More precisely, to power on a CPU PM domain
one of its corresponding CPUs needs to be woken up if they are idle.

The current support for a non-CPU device is that its driver can only
prevent an already powered on CPU PM domain from being powered off. This
leads to problems for a driver while probing its device or when it needs to
call pm_runtime_get_sync() to turn on the power for it. From the driver
point of view it looks like it all works fine, but when accessing the
device it may end up with various errors as the device may not be fully
powered on.

To fix the behavior for these types of devices, let's adjust the behaviour
in genpd_power_on() to wake up an idle CPU that belongs to it, in cases
when it's needed.

Link: https://lore.kernel.org/all/CAPx+jO-sCierYj8jnoKQHckJG16dOBxnNrsZVYO=38R2cLV8nw@mail.gmail.com/
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v2:
	- Rename a function according to Abel's suggestion.

---
 drivers/pmdomain/core.c | 80 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 6ac1ce18fda3..97273ed2f825 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -10,6 +10,7 @@
 #include <linux/idr.h>
 #include <linux/kernel.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
@@ -19,11 +20,14 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/sched.h>
+#include <linux/smp.h>
 #include <linux/suspend.h>
 #include <linux/export.h>
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 
+#include <trace/events/ipi.h>
+
 /* Provides a unique ID for each genpd device */
 static DEFINE_IDA(genpd_ida);
 
@@ -32,7 +36,9 @@ static const struct bus_type genpd_provider_bus_type = {
 	.name		= "genpd_provider",
 };
 
-#define GENPD_RETRY_MAX_MS	250		/* Approximate */
+#define GENPD_RETRY_MAX_MS		250		/* Approximate */
+#define GENPD_CPU_ON_POLL_PERIOD_US	100		/* 100us */
+#define GENPD_CPU_ON_TIMEOUT_US		5000000		/* 5s */
 
 #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)		\
 ({								\
@@ -1027,15 +1033,75 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	}
 }
 
+static bool genpd_status_on(struct generic_pm_domain *genpd)
+{
+	bool is_on;
+
+	genpd_lock(genpd);
+	is_on = genpd_status_on_unlocked(genpd);
+	genpd_unlock(genpd);
+
+	return is_on;
+}
+
+static int genpd_wakeup_cpu(struct generic_pm_domain *genpd)
+{
+	unsigned int cpu;
+	bool is_on;
+	int ret;
+
+	/* Find the first online CPU in the genpd's cpumask. */
+	cpu = cpumask_first_and(genpd->cpus, cpu_online_mask);
+	if (cpu >= nr_cpu_ids)
+		return -EAGAIN;
+
+	genpd_unlock(genpd);
+
+	/* Send a IPI to wakeup the selected CPU. */
+	smp_send_reschedule(cpu);
+
+	/* Poll to wait for it to complete the power on sequence. */
+	ret = readx_poll_timeout(genpd_status_on, genpd, is_on, is_on,
+				 GENPD_CPU_ON_POLL_PERIOD_US,
+				 GENPD_CPU_ON_TIMEOUT_US);
+
+	genpd_lock(genpd);
+
+	/* Re-check the status as we have released the lock in between. */
+	if (ret || !genpd_status_on_unlocked(genpd))
+		return -EAGAIN;
+
+	return 0;
+}
+
+static bool genpd_need_alive_cpu(struct generic_pm_domain *genpd,
+				 struct device *dev)
+{
+	if (!genpd_is_cpu_domain(genpd))
+		return false;
+
+	/* This is not for CPU devices as those are managed differently. */
+	if (to_gpd_data(dev->power.subsys_data->domain_data)->cpu >= 0)
+		return false;
+
+	/*
+	 * If the current CPU doesn't belong to the genpd's cpumask, we need to
+	 * wake up one of those idle CPUs to power on the CPU domain correctly.
+	 */
+	return !cpumask_test_cpu(smp_processor_id(), genpd->cpus);
+}
+
 /**
  * genpd_power_on - Restore power to a given PM domain and its parents.
  * @genpd: PM domain to power up.
+ * @dev: The device that needs the PM domain to power on.
  * @depth: nesting count for lockdep.
  *
  * Restore power to @genpd and all of its parents so that it is possible to
  * resume a device belonging to it.
  */
-static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
+static int genpd_power_on(struct generic_pm_domain *genpd, struct device *dev,
+			  unsigned int depth)
 {
 	struct gpd_link *link;
 	int ret = 0;
@@ -1043,6 +1109,10 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
 	if (genpd_status_on_unlocked(genpd))
 		return 0;
 
+	/* Special case for a device attached to a CPU domain. */
+	if (genpd_need_alive_cpu(genpd, dev))
+		return genpd_wakeup_cpu(genpd);
+
 	/* Reflect over the entered idle-states residency for debugfs. */
 	genpd_reflect_residency(genpd);
 
@@ -1057,7 +1127,7 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
 		genpd_sd_counter_inc(parent);
 
 		genpd_lock_nested(parent, depth + 1);
-		ret = genpd_power_on(parent, depth + 1);
+		ret = genpd_power_on(parent, dev, depth + 1);
 		genpd_unlock(parent);
 
 		if (ret) {
@@ -1307,7 +1377,7 @@ static int genpd_runtime_resume(struct device *dev)
 
 	genpd_lock(genpd);
 	genpd_restore_performance_state(dev, gpd_data->rpm_pstate);
-	ret = genpd_power_on(genpd, 0);
+	ret = genpd_power_on(genpd, dev, 0);
 	genpd_unlock(genpd);
 
 	if (ret)
@@ -3411,7 +3481,7 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
 
 	if (power_on) {
 		genpd_lock(pd);
-		ret = genpd_power_on(pd, 0);
+		ret = genpd_power_on(pd, dev, 0);
 		genpd_unlock(pd);
 	}
 
-- 
2.43.0

