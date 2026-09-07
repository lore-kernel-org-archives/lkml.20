Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B8746DFE7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779843; cv=none; b=NP2rfDWw8UthmBScApvBdNOnN8jigsBASCCDCmvUOCPzX5Af3QC/59eWT0nAcf/HodxHrRyU/LRdIOaXn2j0COzyWCJe1VQ9Yremwx/EqCNWEEzYbxq28C3xJlNX7MReJX2Ieqc0KJFDgTvo62ca07Ru0zLnMhoVstUE8VIi/sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779843; c=relaxed/simple;
	bh=hqlT9anTRmD3gqufcOooFJjBVMwFzMEzazIesH8QlhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQbzn+NRrwP8U0yLlm4mjUgi4Vsx4SvqLErSW8mZRGIoYaHn9KxYTm1t5zhT0Noff0y0zCj90RNFieMLVOW9sFB4bmHyII3mzo4I0ahZiFsECPXn30t9t6nIU3BXs5yizjs86fsLw65xHC0Heqwasgm0upjl8BK8j1xHQ2Z7wmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzwKXE1r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvtNgbs5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzwKXE1r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvtNgbs5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnUcG3777909
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 11:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V/gIsitsveU
	0a1AR6GJ+0ZzNVuCwkMUNDvqqmLHk98k=; b=BzwKXE1rj6fatD+luaFzb1NGkJC
	rUjn1tioQPU4HRl8eyhJhqXWXcsAFvfq+1VG3hbGpaABhG+NaGqvStlNhkgOdstm
	OvMUTIQJSZM0p1Dk29+xBEITPnsN5ebGi4oyT/cWJWDiYJMU6/7djULGMbfijDar
	ALdH2muZyC9JvdoBClIH6vqOs0KAR6o65YWuq/xPlBU3GvLFQF0uoel3cLSxA6XR
	t2nXGGVm+sMEKnHBZj0DAK5pt00eioc0Xuh406B2aFvyzHqdrIXhvVz/hHFiF/Bp
	eurgZu+sH/MQeTpaVUnlvpazenRNchNj/RyhHL85uGaZzWDoKiNCWK2lhoA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfygt7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:17:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7866c4ed349so3031249137.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779838; x=1789384638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/gIsitsveU0a1AR6GJ+0ZzNVuCwkMUNDvqqmLHk98k=;
        b=gvtNgbs5BkNefs3rMRKX/V3QWvy8T0CAGYrGG+5Mj+z3rLHnWzLA1f5wz4gsMmekWB
         DUpcnZQKVazSm2ADuCxDLllyP4SNxFw0ZH9H7DVkwVr/V10dZEYjDD2s7MLf+wqvCkbm
         2QWVN63qJnnke1WgIHoGkG/C9oQZLQU/gQ0ErW8Jnwsa8teB+i+6mNqpKtSq0j329K8V
         aqU4qki8tQN0UEqGBB/IngHdwQg4GxGK3Xb3zRxUV1ZLnzFObo8B7dKvSnhn4i8gLMAJ
         eQzwD5cUS+xBcgqcl2IzIbk0GjktESdmE/WZr4S0xDJwpqZhEm5SpdGFDIRRHXFmJ2Ma
         Yi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779838; x=1789384638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/gIsitsveU0a1AR6GJ+0ZzNVuCwkMUNDvqqmLHk98k=;
        b=qlvgNiYMt/Lh9w3o6o0ivuSfcE7ZimaHJ9qQf89oSq+W06GNr89fkf0++JhltBOYG+
         dRNztEhSCgzHUnda3MhTnP9vz8ki7SAlGwMEr33turC2IQV1cCAosA9vDzMMvDeMYseO
         T7ehnqMoeicHY3Rn7EaIXGCXr6bh2HoFWzZyv/0ZL+sJugvz7fXjDcflXqo3QAWLDA1Y
         g9AWV1DD/dZrfFxG8Igx0Vb4taVaoEljbzv4nrM3e5yCMNgLSv74kqAoagjLS/0R3NWN
         3IT18F8NpnsBiPuZJoa9LB65eCiXXLFM/WNQq3FNCJy0v/Eyo6+rsXEvoKhiLDfrexy9
         gwGA==
X-Forwarded-Encrypted: i=1; AKwUvBwJmVwbJRJwxGzFhi3hcL1dxfo9Ab5BKBD9usrPB9KjN3t8YVhICh7g0MFRXJ9/uiavR/1sXkfAzMtECUY=@vger.kernel.org
X-Gm-Message-State: AFuF++n7b3yeQkJP6US7+ugXWhL5HZ5r0uw/q6HE7EsRJuacjoIqmTOg
	SiiWoyqj7P2dqvHH0sWKRgT6vTkZtH6R2A/goNf9h/HHfaB3hbSLBGONVWuCHMKhJYV5mqvqNvK
	qOWNHolag7TqnqUwUvi0tJR8gU1MhKnKTy7wwTUVM46AUZDxi1npHbs+8aPu+ilmDUJM=
X-Gm-Gg: AYBFou0Q7o2sy+4Ln8p7BFYhI/BtWwWNtK2hdvE/7wqk6FqMrcTpXOkb+/sGp8Pv7vy
	zjVf+V3q6Llat5qylatBS9+RVG02cLq4iXJeZx5pWh2Q1OJ/99Zu9pJWXtCquW2nPG0Xgr/rd8c
	/uXygUFRe/lYTAe6Ou+n5hE1i0MYEeDNLIBy4Qt8qEdK5BIqm8a9Vc3hJkzqNBIS75RfzRSz7/W
	XD9IqbEOxquJrL6WSYnH1rGHxXxP5a5sH/+a3riyZCR7k6RcCxrP/cZvm7GSlAq0KwwIjcFX5G5
	EWuvT4P811hZbzg0oI2+2tHZwScdOgPUUp5aPzaFpFTAHZ5T2uniDiGlCxjoGmXlr9R+bv51GWx
	xgM9OL6iuZ1oIIKu8PGJTaSLRNj8uHl18d3kh5nhVFMNi52NvJ73DhbmCTA==
X-Received: by 2002:a05:6102:509f:b0:785:e444:15e4 with SMTP id ada2fe7eead31-78a4a87d391mr9129619137.6.1788779837786;
        Mon, 07 Sep 2026 04:17:17 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:785:e444:15e4 with SMTP id ada2fe7eead31-78a4a87d391mr9129592137.6.1788779837379;
        Mon, 07 Sep 2026 04:17:17 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cfaa2sm456120066b.59.2026.09.07.04.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:17:16 -0700 (PDT)
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
Subject: [PATCH v3 3/5] pmdomain: core: Add a genpd config to support unknown initial status
Date: Mon,  7 Sep 2026 13:16:53 +0200
Message-ID: <20260907111659.263324-4-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: l0SZchdEHNkBmyTSjREyqTbyCbXCymRJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX7DlsRTH8hA7a
 sRAXxppJouFAjPP82Gu+61QDgtHqRHal5rYvgKwY9sPMPZKYBoDPTxtuvLsE5jDrHbiLL4alCJq
 pKJcDZftG72Gw1cHLZ2QTp8cqNTviJmWpgEIRkC8I06tASrD3let8Ws2cPhfPEZH9yTtzM4on3C
 8h7l6rzDSYIBQSV/HNbKm1T0k8q26b3iLC7g7iAL1PH5/Iwbj1/8S6yaAMArzVXqKNBDUcoJHz+
 k6jnmC8jJHS5ZLs918Hl9/rJcVrrKtzxN8hq6PsDELp63xpc+Qx1lzWldT/pzL4SJftc0t9UEbh
 pmO8n09lnlcarGotYrNdebEWojio7rJjwp7ieTuQPZtKLkF+d8SoVJfOUjt9Aep1iU14yDiExQt
 FzEIMIMA/O9QT9czH/Ymo/6IDSQ2CoFrRsjRs5JR7kRnZn5JzucT3Sv+abqrvAFbPWymAUlNC6D
 iNeJ+aezFOnXVKQ8NGg==
X-Proofpoint-GUID: l0SZchdEHNkBmyTSjREyqTbyCbXCymRJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX7Thfy0ysw94I
 KjG1fV7OW2+AYMlKwdsLXG5zUQrcwuIlYOJUrun2IjRRPcZyvnBJA+ONWwB1ES2zNqnmmUU40L/
 4/Q5EsfTEgzXVXeFq4eKDONR3YoIqcY=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e9d3e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EPyTabgPSFAr6pNicGcA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070124

It's not always possible for a genpd provider to know the initial status
for its corresponding PM domain(s). To register the PM domain in a safe
state, the genpd provider driver may therefore have to initialize the
genpd's status to be powered off, as a way to prevent the PM domain from
being used when it actually could be powered off.

In these cases we may end up to power on a PM domain through the genpd
subsystem, while from the HW point of view it may already be powered on.
Under these circumstances, it may also be required to keep the PM domain
powered on until all the consumer devices have been probed. In other words,
until the ->sync_state() callback for the genpd provider in question have
been called.

To support this behaviour for a genpd provider, let's introduce a new genpd
configuration, GENPD_FLAG_POWER_UNKNOWN.

Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v3:
	- None.
Changes in v2:
	- Rename the config to GENPD_FLAG_POWER_UNKNOWN.
---
 drivers/pmdomain/core.c   | 6 +++++-
 include/linux/pm_domain.h | 9 +++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index b62d4e544bc5..5b31ed47d3f1 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -189,6 +189,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
 #define genpd_is_dev_name_fw(genpd)	(genpd->flags & GENPD_FLAG_DEV_NAME_FW)
 #define genpd_is_no_sync_state(genpd)	(genpd->flags & GENPD_FLAG_NO_SYNC_STATE)
 #define genpd_is_no_stay_on(genpd)	(genpd->flags & GENPD_FLAG_NO_STAY_ON)
+#define genpd_is_power_unknown(genpd)	(genpd->flags & GENPD_FLAG_POWER_UNKNOWN)
 
 static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
 		const struct generic_pm_domain *genpd)
@@ -2445,7 +2446,10 @@ static void genpd_lock_init(struct generic_pm_domain *genpd)
 #ifdef CONFIG_PM_GENERIC_DOMAINS_OF
 static void genpd_set_stay_on(struct generic_pm_domain *genpd, bool is_off)
 {
-	genpd->stay_on = !genpd_is_no_stay_on(genpd) && !is_off;
+	if (genpd_is_power_unknown(genpd))
+		genpd->stay_on = is_off;
+	else
+		genpd->stay_on = !genpd_is_no_stay_on(genpd) && !is_off;
 }
 #else
 static void genpd_set_stay_on(struct generic_pm_domain *genpd, bool is_off)
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index f925614aebdb..14e0e346c610 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -121,6 +121,14 @@ struct dev_pm_domain_list {
  *				powered-off until the ->sync_state() callback is
  *				invoked. This flag informs genpd to allow a
  *				power-off without waiting for ->sync_state().
+ *
+ * GENPD_FLAG_POWER_UNKNOWN:	Use this flag to inform	genpd that its initial
+ *				status for the PM domain is set to powered off,
+ *				which may not correctly reflect the state of the
+ *				HW, as it's unknown. If the PM domain becomes
+ *				powered on during boot, genpd will prevent it
+ *				from being powered off until the ->sync_state
+ *				callback is invoked for it.
  */
 #define GENPD_FLAG_PM_CLK	 (1U << 0)
 #define GENPD_FLAG_IRQ_SAFE	 (1U << 1)
@@ -133,6 +141,7 @@ struct dev_pm_domain_list {
 #define GENPD_FLAG_DEV_NAME_FW	 (1U << 8)
 #define GENPD_FLAG_NO_SYNC_STATE (1U << 9)
 #define GENPD_FLAG_NO_STAY_ON	 (1U << 10)
+#define GENPD_FLAG_POWER_UNKNOWN (1U << 11)
 
 enum gpd_status {
 	GENPD_STATE_ON = 0,	/* PM domain is on */
-- 
2.43.0

