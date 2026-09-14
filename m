Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904C1496D4E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398134; cv=none; b=RHSdEQ96Pq4rMLEOX9gEpwGYyk33Fo7n6iLHwm0pH9PqzGZs4QM7YOfMmIEIMDFP5FbmgihjHWtWW9Nqj9/34VJKhwGngGNfIowFfGVKH836T0iXQ8AqXDNHK5DSkWCdb3QvNKkeklx0xkZzNkbqzuI8UuFPm18w/ika+OId3yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398134; c=relaxed/simple;
	bh=7l1jH4YEwwaB9bVTubCiHOrHrjM7s2t+ualLZn24p7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRhrlNvlwxtU+SO9ELnvwtO2IP/ctvCtMXGT0QJd5aouWo8fKdUMKRlezPXYGcE3v5Fa/FiTqHMNwJ/dgZ61tE2PZX3S2aTxEoBH3ntj3nAdUs/8mtdIu4sPCMZjKIme9wDNuWJXYjdp94MKdDG6z9l/s+y0nC3mQeSRIi+LdWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNNrgj2x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D2y+KV1i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNNrgj2x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D2y+KV1i"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0QGQ674431
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HKDK43ay9zY
	tKdxpkhmpR5tzBLdv8wVtA8UrvJmZbMs=; b=PNNrgj2xk1EVdX4xt1Bn2RFQdPV
	ZNGqJ/gLtlYrw2aAyZoshur384XYsKMYZI4sopxxebhppb2J6ILJDyG0CRKzGbg1
	NbBxFWFs9ivdli9ZMrqm2WTuX0qayLTIQYBZhN/kCRC7clqpogcQ1L7JsAmNeg8U
	5+syTQqoiQhhwHfuRCyOs20S2AUGq0Z9hCXJEO2ZP9kRoOA+sYNgWhpOR4iLayUS
	bz0q3Y81tGiWtfVVVmi9fCIUIrHFWBL/fQQo3xvbjoax4p+k5BgK/c/sK2uZuqpI
	xGCSP+wwwriu2zzTsTVIeESb+foFYkHAZ2JTm75BVfH03C3sHalj060/wow==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs9a83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:02:11 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1b8b593a4so3392545eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398126; x=1790002926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKDK43ay9zYtKdxpkhmpR5tzBLdv8wVtA8UrvJmZbMs=;
        b=D2y+KV1iWlyoG6wZvn2fRggY51zyUCOgLNS1jbp9XbqCsP9f60xam0A9HannU9OkxD
         n58lcDa2iAEGysL6dSNwcP3KOHCrqXzn8J4BlG42noSZpBUmmIw30uTmr8W16V/JQahp
         RqKWGWcBibPkFkG8bJYTFinov1Ge4VxLNW4/FQVcH6VR/AS/g4QFk+scGQLW6P88o+aH
         e5XFZH1csT6hcgWW0PAXWQ5hP/uwXRgvs9I81nIu7sue47V4d6bAWZZ2U7PkFwG1hkia
         gG/WQz3mtO669ziMpJBWGVZcZXzQL7KrPKFx7FAaHmDU57iU3UaMhGnuV4SpZBx77ncd
         qtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398126; x=1790002926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HKDK43ay9zYtKdxpkhmpR5tzBLdv8wVtA8UrvJmZbMs=;
        b=n0OllmyPWbGfivZLew+v7m549rgpepFu3aFjPszmvh7EcLGzb56GuDpnY58WP7QLeV
         0yN4F8WrLF3ALjSm4Z8cEl9hF1L0wpGtB2xAjxdJ3MFVVPgF84U+Q2YnAa4eRirF2ebs
         /UfxdrwAh8sHECVEFiOXcCVErFkurl7mZ026vOVSgKYQ9rYbSInCZPTU3HXEX6H/QCCx
         sJY0a/j+1nqkK3sFf7zhxbGJfAJlJjq7Ry2ViqXB0rCf+vW4atAI2rGVdx4uc1wikOjq
         nGBgMzHCJHvWMePaVX8DxcHkuOZ0DBvveMcmChUPMngx1UHzc+fcogM3zB/rD1PNiqSb
         q37g==
X-Forwarded-Encrypted: i=1; AKwUvByjfzvbNVN3FpVIevp5F2HhvFwgDKiFEDG6E92S3+LesCSLroZmtLUR6Kbza2dt1b/n+7OZguWRV06tadY=@vger.kernel.org
X-Gm-Message-State: AFuF++k8gDIXAE8gCkGapW/eBbbMuOoO+2aR7fHRdq82nViWjw5LcuVo
	ElGddz5/AvDhzz/uKXJ/S5vaA1jxxMfsDr9s4Y+m9A8dKH6XfYXK46HgtiT2bp9ubGSkXXyrP/5
	cTiOEPDsbsnsuSFhIOveatTegS4iWX5h5fF50MgGT9z+90/j8CwBJPUjz/F7rwJShYvM=
X-Gm-Gg: AYBFou2IwYDBHeqSUtsQVQr3s1dF34vzJ2VZxjseo5aAhizE8zUqYrKIIpbm9jDfyu1
	UopfJH7rmVp0SEkJyA8u8xXOOFM6A9ZmC2Zrw/cDMCi9LHjorvUUdf1BjMKnOqfqglBms4z6jcB
	+TCY0dHMDryUN+4vl+kTBnr6ooBcKnLSvfl5QtQ3gktkVunWQi9LrDOIptfMoTEkjVxwL5OW0h0
	fC8MJFnAjE+VMvztWSEH0KgZaIN2J5FiysAywbVthl8J24LYhLc+BcQdH8BfYgCl6dwqMhNC+KF
	dZenW+SoXY5xdBfNPuil6B4DskQAOVAREKSYwR+saprVYQmu8OWAG8pMfC/3U0PGnFLDkGK06FK
	3CKDSiER3MIUWJfNjjohJYgiFIN+GJZ4FFFUSF1I7nKB0S0zCpQurTSZLvw==
X-Received: by 2002:a05:6820:6ad0:b0:6be:dc4:13f0 with SMTP id 006d021491bc7-6c542926f3emr1546471eaf.49.1789398124765;
        Mon, 14 Sep 2026 08:02:04 -0700 (PDT)
X-Received: by 2002:a05:6820:6ad0:b0:6be:dc4:13f0 with SMTP id 006d021491bc7-6c542926f3emr1546403eaf.49.1789398124319;
        Mon, 14 Sep 2026 08:02:04 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608480esm468632666b.36.2026.09.14.08.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:02:03 -0700 (PDT)
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
Subject: [PATCH v4 4/5] cpuidle: psci: Initialize the PM domains in powered off state for OSI
Date: Mon, 14 Sep 2026 17:01:40 +0200
Message-ID: <20260914150146.187622-5-ulf.hansson@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX6ecq+06VKcSC
 8NXpAkb49Cv7qoUjSHZoltzl3+ymsIQqULl4pvVwENAw6mTKz+upp0e+8d9X41vyjDPHe1V81IB
 qR7BzvR9O+vtwg1dutWx4rY+ReMopjA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX0pSL8yqUK7bt
 J00hsmxhKd7WV2T7HR+T2X0vUF0LAVrsHtp0pAli2JJV/aT2EkFvfLKB49IlZb4Avhk0KA4fQH2
 b+OzeMuMdf6gYBhMqTEWiwCgJYcS6Tn3a9K7KmgsMEOExDhNCDhoJPRRBlP0g6NOHY21xmXYpIK
 KAHZjjFrLZav4ssUe0FYVBM+gsfaMhJ6Eh7+iv5o1JTFJSjYtJcZE8dU/bgETBh2zKBrVMTAZUf
 Y0a5bOAg2JswAnMi5MLxG6PutyZWG7x6mYAuhM0zhGCGqy6VUutppu/SbQal3ckIQKwqmq0iefi
 2UI0yGMfM0rKiMDLj4nYc6ly0zgf7N8vyWmy5bQz8eG6542L/a20qJoATNcajcf3tnZuW2nPvKG
 Oxh0XmcFSfkjfIpjLn13mmYEgTNd07KLbUrN7FUpJuau0oDcGmOjylLddV6F/K7dKRiiOs9sn6+
 7LRLTqszCSozpX2P1XA==
X-Proofpoint-GUID: A59-o6bHNC_4V0qODWQC6Df8rAr5ujrq
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa80c73 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GddhhVl5-a8N4MGu71oA:9 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: A59-o6bHNC_4V0qODWQC6Df8rAr5ujrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215

At the point when the PM domain and the topology are registered through the
genpd subsystem, it's not really known whether corresponding CPUs are
online and thus if the PM domain should be initialized as powered on or
not. Instead this information becomes available when the CPU devices gets
attached to their respective PM domain through dt_idle_attach_cpu().

This is a problem when using PSCI OS-initiated mode, as we may end up with
a PM domain that has the genpd's status indicating it to be powered on,
while it in fact may not be the case. In the less severe scenario, this
leads to selecting a shallower domain idle state for the PM domain than
necessary. A more critical problem is when a non-CPU device shares the PM
domain, leading to their corresponding drivers not being able to trust the
status of it.

Let's fix these problems by initializing the state for the genpd's to be
powered off and in the deepest possible domain idle state, when using
OS-initiated mode. The support for ->sync_state() is maintained by setting
the GENPD_FLAG_POWER_UNKNOWN for the genpds in question.

Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v4:
	- Drop GENPD_FLAG_RPM_ALWAYS_ON.
Changes in v3:
	- None.
Changes in v2:
	- Fix a bug in the call to pm_genpd_init().

---
 drivers/cpuidle/cpuidle-psci-domain.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3..5722365b943e 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -68,9 +68,8 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	 */
 	if (use_osi) {
 		pd->power_off = psci_pd_power_off;
-		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
-		if (IS_ENABLED(CONFIG_PREEMPT_RT))
-			pd->flags |= GENPD_FLAG_RPM_ALWAYS_ON;
+		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP | GENPD_FLAG_POWER_UNKNOWN;
+		pd->state_idx = pd->state_count ? pd->state_count - 1 : 0;
 	} else {
 		pd->flags |= GENPD_FLAG_ALWAYS_ON;
 	}
@@ -78,7 +77,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	/* Use governor for CPU PM domains if it has some states to manage. */
 	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
 
-	ret = pm_genpd_init(pd, pd_gov, false);
+	ret = pm_genpd_init(pd, pd_gov, use_osi);
 	if (ret)
 		goto free_pd_prov;
 
-- 
2.43.0

