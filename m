Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5691351E457
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858831; cv=none; b=XYRPStM/rdmxiVQlev3huuCf2C+6OhIyuZjc4WkDtcrzCACs+igT7WQbA3m6J0SDiHYJCe4A4zUu6e9S4Gmc4Xx7JLNwN/7riTSb4Nh+sAOqbLUy21cSrL/e3I8dvaPsCYni8+xcIlw2BYcw4wmlJKZRHF+y2bkBcGK3bK79w54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858831; c=relaxed/simple;
	bh=vEW5X3BMNQd6CVPLSBXIQcvsWCKlwMhvKlE01YrLd44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ThUGvmOwEejArPleWoFfqCN362Kcf8WgI6/ezjzSj9scUdG+TQ1NgUg0nPEEpLQngTN+6RhtzqGXghjNzfq1i1x4tqkNR+tMV7PUBBAIOh5YbXOV3zV29zQdeWVJ434lPJ4qbdNwRgiSWMoCpiDo/Jwef39CJSnlIl+/8sUnHsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuAAiUbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0pQBg+O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuAAiUbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0pQBg+O"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xgQ42337560
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 12:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1hZLolMrK1rasQFlOxCiPvak4VGukOTeSVsAJW+sn0c=; b=TuAAiUbuKt3u+IHs
	d77oI3PpH+/9BcdtEMaAPx6UAEOvyme2A7RGLTBXJftjoA6VBpRGSD9E/GQfZr78
	+q9uw0AGZ9KR0rMwP7V0CRuLDyMhGJVR8N7+ybLvqz9T/Z7Pjt5Xx0IBVl7IaQYW
	0ZVH/ZOm82JCG+7yXlb0mCkPkL6nCH9LocPY1oYKazMm0uTeXf9tT3994edUis/T
	ToEX3sq/AwE2FAhI79lA7YK+np+scb89gu9TzZmRu/TR8+rP+RYUOIfUgBLacYEO
	fR3LUuWCP/oJvS5pdnRtO55p3TngPI07ro5EOOYL3zwEGAxRhmZMckQWTlWahVpZ
	WL36Ow==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n24x5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:47:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so6501932a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858827; x=1791463627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hZLolMrK1rasQFlOxCiPvak4VGukOTeSVsAJW+sn0c=;
        b=j0pQBg+O5ERsv7qOhD8mc2/IjOu1qjvJil3ivDYhWHb4sQ3VKb+Y3gPivdNrr1a7Es
         VJK9XJSnQmrWiBv7For/l0cfh6WRHQcOfVSk3UzNtSYTOsWvbEgMjetk3Q3oyZxSOv1F
         3gmHExiH+bxclAaBq4Wru4RdXX8Hfm/3H6PQySExYiBXVArIomXe0NQDoMRpUbUyUoSW
         YmN6hZfjt6S45idMpjlEht6Xu4K1T9mlDj3CnHwrDBklx/yqYLgPISlPecuM5fy+KcSJ
         d9xcNoO3XLXaZiitTzdUdmTjRbaj+jCSuyFp9dW47a2bEWbRBB8AwuWVuoAbfSXu40S+
         Jtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858827; x=1791463627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hZLolMrK1rasQFlOxCiPvak4VGukOTeSVsAJW+sn0c=;
        b=IC9gg3h2mFFEWb3TD373ZV/YD4qGRyxEzAYdoFNI6MxC69pS4wOxDAOFTCcGphLOUD
         5O6KIWA1msMpkwwguJunRnZk1NPjR/svW/e1B9PuP6KINkv25qjovDlmcKsdAJMWSJ7R
         Hvlxm19oQFe9snXp0Yt+7cHtgygeSBxP9hDQ6JWn90D2pLPY6iL9BNjY5OCtFw82hxqs
         C46FQ7Fuametnro/Av1mw48svM4wMysmbcp3Z5RNJ0mjrD7pqS7ZNGv1pSFhy6PcpxuA
         bqZLTy5fjQd88x4xzZc6/prS2JRehHniDtmFmaATCf7B2PU0jcOwlK+t4akN/D6b09c8
         AgGQ==
X-Gm-Message-State: AFq9FYJnN9QTHJl8lcyPsstrTVPaEy704G2kHPcDaJlSEVCZPbOvMVap
	PhftsjtqdGb4o+fD+UAscK70SYU79FZNUyxDWFFUldW/r3oNK2gOymhq7QfP/jIIW/IBlUN2QBX
	R4hjIWvOfyBkfazpfG8LPMUHmIZ7+BgMVkZylncEixb9fzfOY/7zjNcGVMqPzO2Et3SQ=
X-Gm-Gg: AYBFou2BATtKTt/ddXwP7wYrzWDshqYcIK62mY9k48/0BEDnqVb3cbRJ2/4cWByQnRF
	KNjb9BCnZEoNyYxq7odH48JN/vjLlXjXVPQ7Fj06WuQrzWwdC1L8KwzGv4exuVLLNeN3+Eo5m3d
	zCV9hmRfoU6z3NToybHFDZVKkvBcYh0DCfHO91gqZpXBVkdVawDtjT4HFjlWNwUjN6Mu24wDjT4
	DxZSr82NROCp0RpCKK0uTPmApL/oB/tPnQBRsGfErPFQOmj2wRI7ySqAmG+h2N0ta3LG0rw5P4K
	wMlfMG3YZzWmYchQaAn1MJpLTQyskiN7tvdZUVBEEAGXXova66tnTIqQd8U6GWeDCHnCVF/vSut
	WFSECUAulNW2UKNITAfU=
X-Received: by 2002:a17:90b:2242:b0:39e:6c69:f47c with SMTP id 98e67ed59e1d1-3a6c32be7e6mr15193a91.59.1790858826673;
        Thu, 01 Oct 2026 05:47:06 -0700 (PDT)
X-Received: by 2002:a17:90b:2242:b0:39e:6c69:f47c with SMTP id 98e67ed59e1d1-3a6c32be7e6mr15155a91.59.1790858826071;
        Thu, 01 Oct 2026 05:47:06 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f479dc9fsm4567467a91.15.2026.10.01.05.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:47:05 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 18:16:31 +0530
Subject: [PATCH v4 4/4] regulator: qcom-rpmh: Add debounce delay before
 disabling regulator
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-regulator-off-on-delay-v4-4-258ba9612da8@oss.qualcomm.com>
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
In-Reply-To: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790858803; l=8989;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=vEW5X3BMNQd6CVPLSBXIQcvsWCKlwMhvKlE01YrLd44=;
 b=Hv2grYHf3BiinXcXcapjQlK7UwCyTd2L7cOZb6XH3v08Mkqe1rHLadb6BV/0f1geoVuvZbr3y
 4o9K/lAmtETBwu7cwF5LSqxrOb/S4fQXXybcUbM0XIt9r9DmuQMLYK4
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abe564c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=F88YRIzIpnG6i3HkszYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfXwZl/EBBWzUgr
 8cM6dSewgUGmeU2REhJ51jfUsXxUEEEHMaSbP9jA4h14sjJTeE3oPm9BzL3OA05Q4cKHWBydbkn
 u6dlmxXY7Rdq0WF0X0Ie6hgTB8IFX5Q=
X-Proofpoint-GUID: RwWPDVztn3YGwm7AEs2xOUxlG9_Fx6Uh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX09MQ5muWgdV2
 6if/5ODYR77qQJeowuCr8udSKyBsIchxwii7+h3hR+2tc2q6anDfCi/6wppdQf2dNsLOCEYOei6
 942j5dOIc4lrEbEWeQky4UFUpVvUS7rQrW/sMOFSutYA/19JtjouuwfWF93xXtYGHbt9bwplEP4
 BDx0TQy6qX3GkiIwYQGOccJi5Te29OcoctzM2pThDYpcu+B0sI/qJmQjVqZ2oCgh55kaKLlP7VB
 q0QTzFuJ//sCdPVfZYWkofM1Wf8aVku+YgZl5MDbFM3p/fe1bwZXSBsZNXdnFZmqQL5Xrs76n2J
 zJJ9841yigYJcExH/4lLD6I7VkEDlzJ8Fm0t1vi8cCKW1m6adFOyZ8vhxlM1qpLtzSJRVu7of5y
 SASYo3Fnr5WJODCVdGX6EjC3MMEJDTqMeoLMGJCQgTaljLoyd3XvLkSnw+neiw5E09nmB/WtaDb
 xsALUWxbUW0AKeWO3Wg==
X-Proofpoint-ORIG-GUID: RwWPDVztn3YGwm7AEs2xOUxlG9_Fx6Uh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050

Some consumers rapidly toggle a regulator off and back on again, for
example a driver that disables its supply on -EPROBE_DEFER and
re-enables it on the next probe attempt. Sending the disable request
to RPMh immediately in this case causes needless power cycling of the
rail, and in some cases the driver instead avoids calling
regulator_disable() altogether to sidestep this, at the cost of
leaving the regulator enabled and triggering the core's
"unbalanced disables" and late-cleanup warnings.

Add support for a new 'qcom,regulator-off-debounce-delay-us' property.
When set, a disable vote is not sent to RPMh immediately; instead a
cancelable delayed work item is queued to send it after the configured
delay. If an enable vote arrives before the delay expires, the pending
work is canceled and the rail is left untouched, avoiding the
unnecessary disable/enable bounce. If no enable vote arrives, the
disable request is sent once the delay elapses.

This complements the existing 'regulator-off-on-delay-us' handling:
that property enforces a minimum time the rail must stay physically
off before it can be safely re-enabled (a hardware discharge/POR
constraint), whereas this new delay defers sending the disable request
in the first place, absorbing quick bounces before they ever reach the
hardware. The two have no dependency on each other and can be used
together.

The deferred disable work item can run after the regulator has been
registered, so cache the regulator_dev pointer in struct rpmh_vreg and
thread it explicitly through _rpmh_regulator_set_enable_state() rather
than relying on the regulator_dev argument that was previously only
available at the regulator core's enable()/disable() call sites.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 114 ++++++++++++++++++++++++++++++--
 1 file changed, 108 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 4773034b5d42..4568abf52dd3 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -5,8 +5,10 @@
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
 #include <linux/bits.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -15,6 +17,7 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
+#include <linux/workqueue.h>
 
 #include <soc/qcom/cmd-db.h>
 #include <soc/qcom/rpmh.h>
@@ -160,6 +163,27 @@ struct rpmh_vreg_hw_data {
  * @voltage_selector:		Selector used for get_voltage_sel() and
  *				set_voltage_sel() callbacks
  * @mode:			RPMh VRM regulator current framework mode
+ * @rdev:			Regulator device pointer registered for this
+ *				regulator
+ * @delayed_off_work:		Delayed worker used to defer sending a disable
+ *				request to RPMh, so that a quick subsequent
+ *				enable vote can cancel it instead of causing a
+ *				disable/enable bounce on the rail
+ * @debounce_delay:		Time in microseconds to wait for an enable vote
+ *				after a disable vote, before actually sending
+ *				the disable request to RPMh
+ * @off_on_delay:		Minimum time in microseconds to wait after the
+ *				disable request for this regulator has actually
+ *				been sent to RPMh, before allowing it to be
+ *				enabled again.  This is tracked locally instead
+ *				of via rdesc.off_on_delay whenever
+ *				debounce_delay is configured so that it can be
+ *				measured from the real disable time instead of
+ *				from the time the debounced disable request was
+ *				merely queued.
+ * @last_off:			Time at which the disable request for this
+ *				regulator was last actually sent to RPMh.  Only
+ *				used when debounce_delay is configured.
  */
 struct rpmh_vreg {
 	struct device			*dev;
@@ -172,6 +196,11 @@ struct rpmh_vreg {
 	bool				bypassed;
 	int				voltage_selector;
 	unsigned int			mode;
+	struct regulator_dev		*rdev;
+	struct delayed_work		delayed_off_work;
+	unsigned int			debounce_delay;
+	unsigned int			off_on_delay;
+	ktime_t				last_off;
 };
 
 /**
@@ -293,10 +322,9 @@ static int rpmh_regulator_is_enabled(struct regulator_dev *rdev)
 	return vreg->enabled;
 }
 
-static int rpmh_regulator_set_enable_state(struct regulator_dev *rdev,
-					bool enable)
+static int _rpmh_regulator_set_enable_state(struct rpmh_vreg *vreg,
+					    struct regulator_dev *rdev, bool enable)
 {
-	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
 	struct tcs_cmd cmd = {
 		.addr = vreg->addr + RPMH_REGULATOR_REG_ENABLE,
 		.data = enable,
@@ -306,7 +334,8 @@ static int rpmh_regulator_set_enable_state(struct regulator_dev *rdev,
 	if (vreg->enabled == -EINVAL &&
 	    vreg->voltage_selector != -ENOTRECOVERABLE) {
 		ret = _rpmh_regulator_vrm_set_voltage_sel(rdev,
-						vreg->voltage_selector, true);
+							  vreg->voltage_selector,
+							  true);
 		if (ret < 0)
 			return ret;
 	}
@@ -318,13 +347,54 @@ static int rpmh_regulator_set_enable_state(struct regulator_dev *rdev,
 	return ret;
 }
 
+static int rpmh_regulator_set_enable_state(struct regulator_dev *rdev,
+					   bool enable)
+{
+	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+
+	return _rpmh_regulator_set_enable_state(vreg, rdev, enable);
+}
+
+static void rpmh_delayed_off_work(struct work_struct *work)
+{
+	struct rpmh_vreg *vreg = container_of(work,
+					struct rpmh_vreg, delayed_off_work.work);
+
+	if (!_rpmh_regulator_set_enable_state(vreg, vreg->rdev, false))
+		vreg->last_off = ktime_get_boottime();
+}
+
 static int rpmh_regulator_enable(struct regulator_dev *rdev)
 {
+	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	s64 remaining;
+
+	if (vreg->debounce_delay) {
+		if (cancel_delayed_work_sync(&vreg->delayed_off_work))
+			return 0;
+
+		if (vreg->off_on_delay) {
+			remaining = ktime_us_delta(ktime_add_us(vreg->last_off,
+								vreg->off_on_delay),
+								ktime_get_boottime());
+			if (remaining > 0)
+				fsleep(remaining);
+		}
+	}
+
 	return rpmh_regulator_set_enable_state(rdev, true);
 }
 
 static int rpmh_regulator_disable(struct regulator_dev *rdev)
 {
+	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+
+	if (vreg->debounce_delay) {
+		queue_delayed_work(system_percpu_wq, &vreg->delayed_off_work,
+				   usecs_to_jiffies(vreg->debounce_delay));
+		return 0;
+	}
+
 	return rpmh_regulator_set_enable_state(rdev, false);
 }
 
@@ -481,6 +551,13 @@ static const struct regulator_ops rpmh_regulator_xob_ops = {
 	.is_enabled		= rpmh_regulator_is_enabled,
 };
 
+static void rpmh_regulator_cancel_delayed_off_work(void *data)
+{
+	struct rpmh_vreg *vreg = data;
+
+	cancel_delayed_work_sync(&vreg->delayed_off_work);
+}
+
 /**
  * rpmh_regulator_init_vreg() - initialize all attributes of an rpmh-regulator
  * @vreg:		Pointer to the individual rpmh-regulator resource
@@ -504,6 +581,7 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 	const struct rpmh_vreg_init_data *rpmh_data;
 	struct regulator_init_data *init_data;
 	struct regulator_dev *rdev;
+	u32 off_on_delay = 0;
 	int ret;
 
 	vreg->dev = dev;
@@ -552,8 +630,24 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 	vreg->always_wait_for_ack = of_property_read_bool(node,
 						"qcom,always-wait-for-ack");
 
-	of_property_read_u32(node, "regulator-off-on-delay-us",
-			     &vreg->rdesc.off_on_delay);
+	of_property_read_u32(node, "regulator-off-on-delay-us", &off_on_delay);
+
+	of_property_read_u32(node, "qcom,regulator-off-debounce-delay-us",
+			     &vreg->debounce_delay);
+
+	if (vreg->debounce_delay) {
+		/*
+		 * The disable request to RPMh is deferred until the debounce
+		 * delay elapses, so off_on_delay must be measured from that
+		 * point rather than from when disable() returns.  Enforce it
+		 * locally instead of delegating to the regulator core.
+		 */
+		vreg->off_on_delay = off_on_delay;
+
+		INIT_DELAYED_WORK(&vreg->delayed_off_work, rpmh_delayed_off_work);
+	} else {
+		vreg->rdesc.off_on_delay = off_on_delay;
+	}
 
 	vreg->rdesc.owner	= THIS_MODULE;
 	vreg->rdesc.type	= REGULATOR_VOLTAGE;
@@ -583,6 +677,14 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 			node, ret);
 		return ret;
 	}
+	vreg->rdev = rdev;
+
+	if (vreg->debounce_delay) {
+		ret = devm_add_action_or_reset(dev, rpmh_regulator_cancel_delayed_off_work,
+					       vreg);
+		if (ret)
+			return ret;
+	}
 
 	dev_dbg(dev, "%pOFn regulator registered for RPMh resource %s @ 0x%05X\n",
 		node, rpmh_resource_name, vreg->addr);

-- 
2.43.0

