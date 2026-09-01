Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DF547D45C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261295; cv=none; b=kXkDSW8Yq5PiXTZdwF1uaXPErdh7dVtCavksWEyi+2VDxigQu4geIOpE5BalRvuIT71mVl+DFvP6zas431M8PT8/zFMfGGZuYbcAmqlojdVwcwHCLfQPoIWiHZQNEdVnVSEjnY7DpvQ93NcPTZpoDR2APmQFoVzA+GZXjsg5UI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261295; c=relaxed/simple;
	bh=+TFWrdtWp4yq9TSRBo1jbNDXLlE0Vb3QAFNEGSmbVOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdqgML3pFOi2Qnff6QBeVm8M/r5jLES/s6O/vktOlCpNbKVh/8oisMvBtgJ/cEY2/wK52SmDWfXeBmVhom23jbu8gm89kq4AlkP8YZKuJSLgf7uD4YPUmQzXcBqyfmTJFmRGfpukq44Tud6l15hLPLgn7K8lrfmIBS/9XEqrvj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZtjxUl+T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kbz7NjhB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZtjxUl+T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kbz7NjhB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJexK2141678
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 11:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Wgxn1wZhT0N
	rhGkRx1mSbVXgq+sQ60RV9XXpk9+v1FM=; b=ZtjxUl+TZMYLq8Cqrgv7Pc3hAlg
	T5L5/NhQiGa5Alp+8xCacMPuHvkSxsRHBbEr2CRdHT8RAdsGXkgtoiq7yu0F6Wme
	Y00DUGZ3sVLDQf+mG4/Jo1nP6wAGtEQZ8iZkhHjq3KT1P4+/YNBCceyjkkc0ebhU
	1wbboXW5GZzgdOPBlyUk1mr35dWXakRuFrUbD04D/ImDRHyPjaqVUt9H949c6RxV
	nh3SempganQ9T7QgtwnPzEvk1AUxemB8k4hdppVPFLWj6Jb10YcChtSrXok1M2lB
	FZuPRG5zqTA4bcCxSdJs6LUHSdYvJApwNLHdlPs22LYUp5qOVL6AqcVucxw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fsy19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:14:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so730966785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261292; x=1788866092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wgxn1wZhT0NrhGkRx1mSbVXgq+sQ60RV9XXpk9+v1FM=;
        b=Kbz7NjhBr4XCBrITt3RLRvtUO4Q91KrwiBERzcZ/rf8REB5NNu9FtFPN7qaDKVeBvP
         5eNWhYVmoI5UnCp+ENlMW69AurUxJh53wXB3qP83mxOcVujzmDGBvbUhwObYZTBHZEF+
         UkCSkn9w+BwjgWeTEm0K/DNsamy4C3c15HqsFbz07aFM5lA2M8eYA97O+AWTluPGvWqY
         tPHZuRoMTeSPbdcLdxvJkfTZ6DmqxG8GH1bJ4zawop/OUywNF43nCvcbaIPMRmH8AXjj
         WDXUAYbc9HmpjwlkY12vjXh0U/PArlj7YyrAQkyPcA6Gz3Qq9yDmm8O4GHOJAS6h5hSV
         0frg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261292; x=1788866092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wgxn1wZhT0NrhGkRx1mSbVXgq+sQ60RV9XXpk9+v1FM=;
        b=fFPWEogyMF+DvAUuwB3wZeNxRkAn79c3j//suXbKgssPyLwXzQCglWbwg96pB244UH
         UAuzAysFVS3AaTU7IGue+otaQHT8hjmiMYqv3kHnM8MJUr9R7Rk87kjn+ED3luw7y5es
         kwlzi+Q4lMTUIQXP7QelXobwEr6IQjq0hYbugnFCQi2Ie3xMi4KONnfNwajK4Moiz6Cx
         U2fwNO1J5LxrnS7eR8P6WdeAzY9wFM3aHM59eaID5s4ht7YdVU3QJGKnbciIVA46O+fg
         5ssLBlqMCpK2qxdekMlkCjJZabY14xskEzGgqRrLZ/D6B9j8kaHjtk+S2ThS7zYDbb/z
         nvEg==
X-Forwarded-Encrypted: i=1; AHgh+RrE+sL0aMKVRgA0AnYvQ79QCMdML1jbOXjGvd5NuXz9jj1Tgj+pBjpZoYYl1XoIXlfdRCflriUsRU8N5+g=@vger.kernel.org
X-Gm-Message-State: AFuF++lfUreYRLsHE4VT/l3UieP7Lz3DzvOZF6GKJ5y54HdLbymInGTh
	2eTWjwP0wcIqS2/fAWeS50rqof5VLSyKker7+eVC7kWsSrJcFGYN4YLcSdcRqD3udByTg2eajAn
	JXQCDk9F9ZUPlt9M0fByRM9YOM7DKApfZVXr5U+JGV/q7ltOqPqopM1XWq7m0kqRXDD4=
X-Gm-Gg: AR+sD12rpr+AYQ2+4f8hvPoxFay4ERehE5p1Eu01k2tJNsWG6Zq8Md06kdIFx+vmEid
	nJhj60MM9ESAjtZ+Ap8eE6eQOsPX80gI2rBJ450AeY9NnfRAKezwejuiMgGZ5eIllFZHi5czqvN
	JdkCp5RgEY26lP1DoCj/zRluxaIsVuW3Gx3pgbj/8PTy6ZiIedgJT/75H40adPvFK9EQlaF1u2C
	Rea7QsE4+6YW0FcVYn8EUHtWqT7reJOkZS1L5Rw73hvQWg227mmABjTAzdcsYXtw5dnmi5vELrO
	nMVuPa0Sb6IGS0EBEkB6OkKVCKVB+W1UZ9DN7XQ8FO+m2DmYYepz729SxdJa4v2ZvtrQgpXJmep
	9NwHkMxhqvLjYhLxeTNoWGp+6HCjf8V4frR7lkJ9rTy/LJ+xYVbf7AM9qHw==
X-Received: by 2002:a05:620a:4391:b0:915:c4de:7ac0 with SMTP id af79cd13be357-939481572fcmr979052285a.31.1788261291447;
        Tue, 01 Sep 2026 04:14:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4391:b0:915:c4de:7ac0 with SMTP id af79cd13be357-939481572fcmr979045885a.31.1788261290897;
        Tue, 01 Sep 2026 04:14:50 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25878ba94csm380686366b.47.2026.09.01.04.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:14:49 -0700 (PDT)
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
Subject: [PATCH v2 1/5] pmdomain: core: Rename genpd_status_on()
Date: Tue,  1 Sep 2026 13:14:04 +0200
Message-ID: <20260901111441.122436-2-ulf.hansson@oss.qualcomm.com>
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
X-Proofpoint-GUID: cyjCDn9hfdB3uHaM7rz16jcOYhFlSRXe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX7asBcoYtF7D7
 fayTDxwVYvAN+W0VzIkV7FaT9NQr2oOU6FXwub1v0XDPwLa+pYSmWb1EdB1is/cYcH/jA/kzS/2
 5YoVSkX1nDaMvdrObCvm807PYvdKCls=
X-Proofpoint-ORIG-GUID: cyjCDn9hfdB3uHaM7rz16jcOYhFlSRXe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX8r6Zr4W1sQ3D
 dMbWCMXPJ1fyIT5XihDKt3LkfNroDG7ejDztkGSocZyHv+kyfSo3qIsOOEKyZW2lQNEdf+lDRTJ
 ldY8iW9mPcjBY2IlqR3iC+PaeDQop+7x1jx7g4uwUwGa3FKzdfsMKC1T2bUO0vBQZLSxwRC5IHS
 FTIZJBwzlPvyV2pwM73Myi61XQ2fRj+rlzB4fnLJp0oxkdlxr+APq8Jvn2+Bx/PyV3Rqmdy6FII
 Ph8xxjq+Y6UivlLUMLMrdEs6LDzmkLrrkHvgfWbFGqnaSzsfBBcskHVruMzHBdjbz01Y/wu5ftx
 hl3nFlFaAPkJOWzOCwFleCk5WorMmxnKSOlcg7Cm0el6P7xTazNrdw0mt3XpZKvRs6zXBd/r92n
 ShVlTy26vjtrHPB+SwCuPesFBWJ991gBL0Mk50J0uFXeWeksp0ha+Y9HYQgBkcJFW/m9hpKx2wq
 tTiZrBt0jY8iCJ7hXGw==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96b3ac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=X7f39YHs1J5G0y9puJsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010099

Let's rename the internal function genpd_status_on() to
genpd_status_on_unlocked() to clarify its use.

Suggested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v2:
	- New patch.

---
 drivers/pmdomain/core.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 842c4169e290..6ac1ce18fda3 100644
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
@@ -771,7 +771,7 @@ EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
  * @dev: Device to get the current power status
  *
  * This function checks whether the generic power domain associated with the
- * given device is on or not by verifying if genpd_status_on equals
+ * given device is on or not by verifying if genpd_status_on_unlocked equals
  * GENPD_STATE_ON.
  *
  * Note: this function returns the power status of the genpd at the time of the
@@ -791,7 +791,7 @@ bool dev_pm_genpd_is_on(struct device *dev)
 		return false;
 
 	genpd_lock(genpd);
-	is_on = genpd_status_on(genpd);
+	is_on = genpd_status_on_unlocked(genpd);
 	genpd_unlock(genpd);
 
 	return is_on;
@@ -963,7 +963,7 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	 * The domain was on at boot and still need to stay on.
 	 * The domain has a subdomain being powered on.
 	 */
-	if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
+	if (!genpd_status_on_unlocked(genpd) || genpd->prepared_count > 0 ||
 	    genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) ||
 	    genpd->stay_on || atomic_read(&genpd->sd_count) > 0)
 		return;
@@ -1040,7 +1040,7 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
 	struct gpd_link *link;
 	int ret = 0;
 
-	if (genpd_status_on(genpd))
+	if (genpd_status_on_unlocked(genpd))
 		return 0;
 
 	/* Reflect over the entered idle-states residency for debugfs. */
@@ -1406,7 +1406,7 @@ static void genpd_sync_power_off(struct generic_pm_domain *genpd, bool use_lock,
 {
 	struct gpd_link *link;
 
-	if (!genpd_status_on(genpd) || genpd_is_always_on(genpd))
+	if (!genpd_status_on_unlocked(genpd) || genpd_is_always_on(genpd))
 		return;
 
 	if (genpd->suspended_count != genpd->device_count
@@ -1472,7 +1472,7 @@ static void genpd_sync_power_on(struct generic_pm_domain *genpd, bool use_lock,
 {
 	struct gpd_link *link;
 
-	if (genpd_status_on(genpd))
+	if (genpd_status_on_unlocked(genpd))
 		return;
 
 	list_for_each_entry(link, &genpd->child_links, child_node) {
@@ -2170,7 +2170,8 @@ static int genpd_add_subdomain(struct generic_pm_domain *genpd,
 	genpd_lock(subdomain);
 	genpd_lock_nested(genpd, SINGLE_DEPTH_NESTING);
 
-	if (!genpd_status_on(genpd) && genpd_status_on(subdomain)) {
+	if (!genpd_status_on_unlocked(genpd) &&
+	    genpd_status_on_unlocked(subdomain)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -2186,7 +2187,7 @@ static int genpd_add_subdomain(struct generic_pm_domain *genpd,
 	list_add_tail(&link->parent_node, &genpd->parent_links);
 	link->child = subdomain;
 	list_add_tail(&link->child_node, &subdomain->child_links);
-	if (genpd_status_on(subdomain))
+	if (genpd_status_on_unlocked(subdomain))
 		genpd_sd_counter_inc(genpd);
 
  out:
@@ -2246,7 +2247,7 @@ int pm_genpd_remove_subdomain(struct generic_pm_domain *genpd,
 		list_del(&link->parent_node);
 		list_del(&link->child_node);
 		kfree(link);
-		if (genpd_status_on(subdomain))
+		if (genpd_status_on_unlocked(subdomain))
 			genpd_sd_counter_dec(genpd);
 
 		ret = 0;
@@ -2441,7 +2442,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 
 	/* Always-on domains must be powered on at initialization. */
 	if ((genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd)) &&
-			!genpd_status_on(genpd)) {
+			!genpd_status_on_unlocked(genpd)) {
 		pr_err("always-on PM domain %s is not on\n", genpd->name);
 		return -EINVAL;
 	}
@@ -3839,7 +3840,7 @@ static int genpd_summary_one(struct seq_file *s,
 
 	if (WARN_ON(genpd->status >= ARRAY_SIZE(status_lookup)))
 		goto exit;
-	if (!genpd_status_on(genpd))
+	if (!genpd_status_on_unlocked(genpd))
 		snprintf(state, sizeof(state), "%s-%u",
 			 status_lookup[genpd->status], genpd->state_idx);
 	else
-- 
2.43.0

