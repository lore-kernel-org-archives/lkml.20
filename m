Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DD148B383
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398127; cv=none; b=gpPCTt2OjoBg76VYsP9CkEFzQ5U42841U4ImAvpQkKRvTrjgvSKRlHwtMukqxaAaNZrLz+dGpmzg2z+AA/JhB5mH41RJyPQ1MEK99Tvpo9aIsrsAH4pO7Tl0PW+rglXmI0WvzrGjq7XaQPoNIsSdZtepCevkDnin7HnJWtGjizU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398127; c=relaxed/simple;
	bh=+iQ7jX4TKc0AkmLQompyS5lkkZ+1NA8VoW0YvwF4tNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=piS6UKjM+wiKByGuMzT8EMcKAd98gkBT8v5LPUREv9JaQ+nrBu2xNnpJJ5J1PgivdJxBOKnyw7gs+YE8WJE9kjUfLjdiV9/hunIKkXtDc2JN4feWU+1hERnYZdOu0ZwjJ1FClM7tybxQTfC8RGHxZ0Z53CV3dpo+g+Hu5HAvi4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dQog9WZl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORvuZaPo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dQog9WZl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORvuZaPo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0kTV512759
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R64vMYngif0
	QtgmjSIX7fHGd4GXjWW4gNyDbeqBJOZ4=; b=dQog9WZlzb0RmAq9fQAraBH78/g
	RimytGPnHD+yZHilPqLX6vMDTymV5ztHPrBuQb5PHISlkbBPTdZeSuDiTGwq7Dme
	lvuv9GN+lE69IHCYi/cmfLmy5REzEM5YrIs7WuxsxThM075iMTofkM6t4rN133nT
	8N8O2pX+VW4x2V1MuL0mbcL/sb0C8HIpcBAmuXDYyLgzf+GfFdJYL8+lAL7DTSft
	uGz9V+TywjxK7XwxeEr1q1eC8mHlYd/8tC1Yb/UYbKP1NzOssDj+xxUq2Td0l1Sq
	SbZ6tpdIgGBx9chlyH0XjloeEVbTOjFXHOztRAxnqOCJcHEwdGRGAlFuCqw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtgkyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:02:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-980c3b71002so2564335241.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398122; x=1790002922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R64vMYngif0QtgmjSIX7fHGd4GXjWW4gNyDbeqBJOZ4=;
        b=ORvuZaPorPUEatLbmIAS6neVOt/xJ70rqQ7EMDKjhVw5sZ0RoMH1qwugvXGgreGGXr
         2AVRpn6Yf67JAfM3vwha1aE0FxIjMquNiL4WXdIQetFFaV44mN6EauyiprMfpeQZhNvS
         qVobKhhlG+6HatpLmzONLdCK9hQeib4hWCWZvFBDjoascmu+HaZmec3LfdRQTIiM/+5G
         ssi84a7P5TD8aJuLz+2KqdfJlB4bk7XKMwdTT0/1iVZ8zfdOlNfafhoTE1hd4VCvN7IF
         AYqnzGmzSDzKo6ImlGp8hIXIIdlfJjSBYnkNmm1QEgahHbTFYjvrcb9dnc4eNz8wlmiw
         M33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398122; x=1790002922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R64vMYngif0QtgmjSIX7fHGd4GXjWW4gNyDbeqBJOZ4=;
        b=hnIUPR4L5MzluGbovg8huKWtJuq75kuzTHBM8RJ5wVz3vSR4hFfkk+UnMGO+pzQOvR
         xZfaZZ4m6GEUQrJZ3dQstK0zzevCcOZzIlhOKTpAKw0CFu1KsSseW/m0DHWnQ0R/aPRm
         8bQFiHQfMqmsLna1tn4hHwBsw424SruqRcHgP/brB/dzKS+lFC0R8jMsaKPh4w34V9Ye
         GbzzZdWokT+ZmASyPygPvKxvReSzyn2inJSVWKjTXOktjnupAEwN42PcIjILHorhHwIo
         xN8m0bE06DaMRUvRj8sJLTw0k+UAcrBoIOdsOU078o3mTAV9mYQYLck9HjspM7r1JKSa
         Z0eA==
X-Forwarded-Encrypted: i=1; AKwUvByXi0YGt4E+uC11Y/YzwtYBwIkThh8prXEUNBhG+jknw9oJRYsVecg1Q7BRqXN5oflsYsKxiRuqohl2UHU=@vger.kernel.org
X-Gm-Message-State: AFuF++lokF0NkhkRmaXf/MXDxvckAz41Mloa7qz1pneTlQuzF6T0NjGB
	HF15Hq6ESE0FQ4KFx68rSOfoYL1PHwkR+1VrpOjLKkcmLnwGw0pBghFZshwcRTo0UPuE2pC6bWf
	rjleAkVgP9wxHzG3xftDaJOzRKgeXbFaUlSR4M1T68aEeuNdirHvGkJjpe/9wIn3d06M=
X-Gm-Gg: AYBFou2umzQyHPe2sQ6xdgb1gBwyynNtQzRB9XB5tGwtTUIIRANfF2PnIlATvLeZYGS
	gdhgD/aKXOrnJKDr0+wksK+uYEzpgRaF/4cdx8TOqA4oFWpkSt5LMnWBhrNpi+IFTO3SnfhyL6P
	1QpABGjtEG1lTwT7Vc5owbCtXmeSNcqRxzbivWI0zp1mlXRLgDFd58RppwURBOExEWK/lOKmzOt
	7//+KwdR3a1Tx1UKUCMUVS6q+1OwS+qeyUCHtVSaWSbIit6KnZu4EpRChFRqinStTfgi4CZO8gV
	e2E7A//77bXmweDWGDDHGAotNJ/nNh0WWGthe4YStKu1F01WXWhEaOYIE3L9I5LQ210H8Ano3dF
	trIcNmUYs5Iv9Go0Y4piUu9x7dKrdkZdtDMq3OrAVdJpNXUvo7cG9/4dUMQ==
X-Received: by 2002:a05:6102:149c:b0:790:cba0:960 with SMTP id ada2fe7eead31-79b5acb355emr1722520137.10.1789398121336;
        Mon, 14 Sep 2026 08:02:01 -0700 (PDT)
X-Received: by 2002:a05:6102:149c:b0:790:cba0:960 with SMTP id ada2fe7eead31-79b5acb355emr1721166137.10.1789398116168;
        Mon, 14 Sep 2026 08:01:56 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608480esm468632666b.36.2026.09.14.08.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:01:55 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Dhruva Gole <goledhruva@gmail.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] pmdomain: core: Rename genpd_status_on()
Date: Mon, 14 Sep 2026 17:01:37 +0200
Message-ID: <20260914150146.187622-2-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
References: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa80c6a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=zIFADOUqQBSm_Ft5s84A:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX/atJ5LgVYKhr
 57BBA5xhOZlHtcaN7/ChcEstM11i1kMM3LR6ahqykQRfHeJOFruGPT8eds9kFqOXKBflAm7VFGm
 6bnnM64sBTBM7/KEVtnwAowH1vc22qaVl+m4Hn69FtAJB8F9rQPrn02L3r4sONCRWD49wmxlvOj
 OnRRQGA26c8r6aKHx7VBq1sXftA3bO6jDR2CE+6sjWLmJUNllSt8KYMr7ClCmxzxBxt+6Za9Ox+
 zTuFXiO7ov4lQGFgRDnMCHEbXPYKSK9QBu+oUDF5Ti782veHAUKiX6hWFqiFYkaYaiJbgrHOHE1
 k0riCJkJk3sFNZPzRhsMn+teeQKfty5Pa4or/lYE8KR18Jv7mRpDx4rvUP24qTzME/IuR9G+n6j
 PIv9HjKihSBYP0fjFps4UJfjEBfdcEBM9P1BizaaN3bo6xmNiVes1tSkXEpDdYm2MEsW9RXpiDW
 12t5DHxxn5H1LoFLcQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX5pXfVmFrvWs9
 tsggUJjNBU/8kF5HLqrT/qYPBmQoEy0ZVCzOmEodrt0CTb+cVp9Dh7kR92nr9mMuokkrSVNyIxf
 aB1TDrBEWTp5FdzGY8Ku84HG9Bwsnws=
X-Proofpoint-ORIG-GUID: wLM2x8mbz2V2yCIUXQ7cAvjYplo5A4xI
X-Proofpoint-GUID: wLM2x8mbz2V2yCIUXQ7cAvjYplo5A4xI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140215

Rename the genpd_status_on() to genpd_status_on_unlocked() to make the name
available for a lock taking wrapper introduced by a subsequent change.

Suggested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Reviewed-by: Dhruva Gole <goledhruva@gmail.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v4:
	- None.

Changes in v3:
	- Updated a comment in the code and the commit message.

Changes in v2:
	- New patch.

---
 drivers/pmdomain/core.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 052ec478dfcc..6abe8b198949 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -173,7 +173,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
 #define genpd_lock_interruptible(p)	p->lock_ops->lock_interruptible(p)
 #define genpd_unlock(p)			p->lock_ops->unlock(p)
 
-#define genpd_status_on(genpd)		(genpd->status == GENPD_STATE_ON)
+#define genpd_status_on_unlocked(genpd)	(genpd->status == GENPD_STATE_ON)
 #define genpd_is_irq_safe(genpd)	(genpd->flags & GENPD_FLAG_IRQ_SAFE)
 #define genpd_is_always_on(genpd)	(genpd->flags & GENPD_FLAG_ALWAYS_ON)
 #define genpd_is_active_wakeup(genpd)	(genpd->flags & GENPD_FLAG_ACTIVE_WAKEUP)
@@ -771,8 +771,7 @@ EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
  * @dev: Device to get the current power status
  *
  * This function checks whether the generic power domain associated with the
- * given device is on or not by verifying if genpd_status_on equals
- * GENPD_STATE_ON.
+ * given device is on or not by checking if genpd->status equals GENPD_STATE_ON.
  *
  * Note: this function returns the power status of the genpd at the time of the
  * call. The power status may change after due to activity from other devices
@@ -791,7 +790,7 @@ bool dev_pm_genpd_is_on(struct device *dev)
 		return false;
 
 	genpd_lock(genpd);
-	is_on = genpd_status_on(genpd);
+	is_on = genpd_status_on_unlocked(genpd);
 	genpd_unlock(genpd);
 
 	return is_on;
@@ -963,7 +962,7 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	 * The domain was on at boot and still need to stay on.
 	 * The domain has a subdomain being powered on.
 	 */
-	if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
+	if (!genpd_status_on_unlocked(genpd) || genpd->prepared_count > 0 ||
 	    genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) ||
 	    genpd->stay_on || atomic_read(&genpd->sd_count) > 0)
 		return;
@@ -1040,7 +1039,7 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
 	struct gpd_link *link;
 	int ret = 0;
 
-	if (genpd_status_on(genpd))
+	if (genpd_status_on_unlocked(genpd))
 		return 0;
 
 	/* Reflect over the entered idle-states residency for debugfs. */
@@ -1406,7 +1405,7 @@ static void genpd_sync_power_off(struct generic_pm_domain *genpd, bool use_lock,
 {
 	struct gpd_link *link;
 
-	if (!genpd_status_on(genpd) || genpd_is_always_on(genpd))
+	if (!genpd_status_on_unlocked(genpd) || genpd_is_always_on(genpd))
 		return;
 
 	if (genpd->suspended_count != genpd->device_count
@@ -1472,7 +1471,7 @@ static void genpd_sync_power_on(struct generic_pm_domain *genpd, bool use_lock,
 {
 	struct gpd_link *link;
 
-	if (genpd_status_on(genpd))
+	if (genpd_status_on_unlocked(genpd))
 		return;
 
 	list_for_each_entry(link, &genpd->child_links, child_node) {
@@ -2170,7 +2169,8 @@ static int genpd_add_subdomain(struct generic_pm_domain *genpd,
 	genpd_lock(subdomain);
 	genpd_lock_nested(genpd, SINGLE_DEPTH_NESTING);
 
-	if (!genpd_status_on(genpd) && genpd_status_on(subdomain)) {
+	if (!genpd_status_on_unlocked(genpd) &&
+	    genpd_status_on_unlocked(subdomain)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -2186,7 +2186,7 @@ static int genpd_add_subdomain(struct generic_pm_domain *genpd,
 	list_add_tail(&link->parent_node, &genpd->parent_links);
 	link->child = subdomain;
 	list_add_tail(&link->child_node, &subdomain->child_links);
-	if (genpd_status_on(subdomain))
+	if (genpd_status_on_unlocked(subdomain))
 		genpd_sd_counter_inc(genpd);
 
  out:
@@ -2246,7 +2246,7 @@ int pm_genpd_remove_subdomain(struct generic_pm_domain *genpd,
 		list_del(&link->parent_node);
 		list_del(&link->child_node);
 		kfree(link);
-		if (genpd_status_on(subdomain))
+		if (genpd_status_on_unlocked(subdomain))
 			genpd_sd_counter_dec(genpd);
 
 		ret = 0;
@@ -2441,7 +2441,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 
 	/* Always-on domains must be powered on at initialization. */
 	if ((genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd)) &&
-			!genpd_status_on(genpd)) {
+			!genpd_status_on_unlocked(genpd)) {
 		pr_err("always-on PM domain %s is not on\n", genpd->name);
 		return -EINVAL;
 	}
@@ -3839,7 +3839,7 @@ static int genpd_summary_one(struct seq_file *s,
 
 	if (WARN_ON(genpd->status >= ARRAY_SIZE(status_lookup)))
 		goto exit;
-	if (!genpd_status_on(genpd))
+	if (!genpd_status_on_unlocked(genpd))
 		snprintf(state, sizeof(state), "%s-%u",
 			 status_lookup[genpd->status], genpd->state_idx);
 	else
-- 
2.43.0

