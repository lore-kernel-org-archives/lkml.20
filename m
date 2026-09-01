Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DBB47ECEB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261302; cv=none; b=svUqRUTYh9AoQXWiTMbX3e1OVRRr9mJC/7TTnGVm7HbOQ+5FsxiLW6qU0WT/hsOzt2RXDbF49INrCYeg39/nVs4jCFcSxyic/MG+AK8sIYD9DxkJj/IRi9hJ2Gm+hs3K9EQqhgAbYAetu9YSXJGT92bXAs3rF5BmBZkAC1zihr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261302; c=relaxed/simple;
	bh=XMnpwKZrNARuXZb6puLfbaYUBZOhDXc1LgZgzOf5kdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRj49vRmR18IKAlGKHm6b6i8brv3kIlG4QxCQ2OMPXc7xAP4rjbXfzR4tXRdoROCdOe6dZcd1LIBV968ltYb9nEG6ACxOW7etheWW/aMJ8h1Ncuxt7WvDcyocqm4zpt74r5gA/KQcKLiKyEpOmfmieqh88m1wkQTVZb+tlLJLGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQWeNZEo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxDnqXvN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQWeNZEo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxDnqXvN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJekP2494574
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 11:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rKQIdRf0x1m
	9XiJr/mtJMCpV7S0ghyR6HfmB0sQ4tyA=; b=hQWeNZEoayrCfa//QNEezARTFOn
	vwX/dlRWTSftRMLJMPQufjxr6nIccwl4dxUf6m87K2+3TCETs5sNFVi1EA2A1scL
	5sla7q3BGFtPwI0e8U0KEojXE31LrXxBK2jvjCy++ZNA4ikqdXgEtcPNJ4sd2QYx
	RSLfYxmGHV8jZmxAXgl/KZS3jJ0v15+xew1Qs/fXWtPIWPwHWdaheiILiii0Lhci
	pMonreXTnYqbaf+rP7zZrZW+ob/aFImkU/dbc5FImBghV7NzIEYSwkQvDGklEK6W
	oattx9BDsdEaOZ2sfEQgubJo/eax4p8vD8aUN3+9OAqXV200dEnjodJKrOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh1rh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:14:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93771aa0379so1245571985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261299; x=1788866099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKQIdRf0x1m9XiJr/mtJMCpV7S0ghyR6HfmB0sQ4tyA=;
        b=fxDnqXvNC8LXiepeZfwnaUnynIUscmWugFR6lZrKNSdpUzE0/OuOQkMtwov2n5LVKU
         LhKAZ9jM9My/E4uM4pK4L8QUhTNsuR220W2iFcWf3OYtIPJkl3sahR2xxI5ytFGCatni
         2nYc3l42gMcMSu06mIUfvv17XL3lvZR8uLsqUSGaDz09i1z9Iql4CEzYKXdOKPHpLUDX
         UU1VYvjA/bKBwARDZndfqipsr3BU9sXaZ6Zqk9G6nqndrJBgy/93Jr7nAkYNCWvySY5J
         8jOJdwqoHWxvoVmeLV1iI+xNpoXsSZAo3domyZLYIzrSLdP/2F8TqTMODQVAOGbKM1DP
         Y8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261299; x=1788866099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rKQIdRf0x1m9XiJr/mtJMCpV7S0ghyR6HfmB0sQ4tyA=;
        b=KvZRAMZtNnDG0ok5FuJpPyMadSYctCV74h1XuyJkuP6zsJJrypK1Y+971x54Z7k1tW
         KEIPfAJqxmrfXbHZ8x/x4VLFbWKWoz55Vg+sRtSNGtFqFghhC6sGHHcZJEkTZVEIpCeq
         XvDRIEL6s6qnfJHUdNZt8Row5COniC6Pe3GeDAVnfrXvvxsUsqxG5za8OP/4MWVbyPpt
         iOvvUOb32JxkcF/7MOggGKH0TDiw5uHQVl1LFxVcAzflRud01ItkMLC/A4awV0OdaNJo
         wg18JptofRFaT8rFIwjEeig5JGtvplzo+TFbvRCcgW0FbE+iin+6J5k1JwU38VcOO7XM
         wVHw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/vmP6WbkGHKpyTSVhl4MrVXnQwjD5+kCvOJ2O/U1vSYoueCkdCFZRzw/jonyPDAFZuHpw0dhgPEsCACs=@vger.kernel.org
X-Gm-Message-State: AFuF++neqvjzgPXZTD6I03sRD8xnCVXMOB3H683KA0UtQCHL5eES6SqN
	jvgLRnkBj+yI4wgFwqlqV3BlOfgJ5CAPpMUPNeKkrOIaQ3DYquE8R++RHAjlm4mh1Lcf2vuYVqf
	Z0uVGReyVBHPE0pVWsBpqQ3pUynOdOAmk1c+wCroO9/gTvANwfDYU5RkCVNPeRlqNfF8=
X-Gm-Gg: AR+sD10LJVmYOQuUUFaoqQ+yz0C+I3piMUveHXY8qfgONXidxthQ2jfEPdm2i38WTVr
	gYgIQfspRhCV5O2o1/j2CccUqvkYziPZWUBDB4wDzwKyhrupxnixpzxJbcqBQECXVNwK1NTxIbH
	FMuaxZ3fVkER+fwEqleLDz1K09DFvMuTVlRr5L/48IVT0FXrd1MFCxmoqii+ZsdfNVI0CZ06Bgk
	m8qdkQnhp+kUZlBnkdVH0SQMUyLp9J78QWP0dnG+/ue9PVlfhemIb8Oe87RF42o7isPfwLWKO2Y
	unioNPCvESYrPAIjvrmKd3VnlR2lwqqImNyzrRKPF7HKt2nvaxk+xg5AW34HSq6dez6n8+G1qAR
	3AKUpZy1Jd04l8T07Z2tB6kktyBmDTIC5GgQsjJlwSDYpi1gePfy3uSGN/A==
X-Received: by 2002:a05:620a:4086:b0:936:d360:2eb7 with SMTP id af79cd13be357-939480e7077mr922190785a.20.1788261298600;
        Tue, 01 Sep 2026 04:14:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4086:b0:936:d360:2eb7 with SMTP id af79cd13be357-939480e7077mr922183985a.20.1788261298122;
        Tue, 01 Sep 2026 04:14:58 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25878ba94csm380686366b.47.2026.09.01.04.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:14:57 -0700 (PDT)
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
Subject: [PATCH v2 4/5] cpuidle: psci: Initialize the PM domains in powered off state for OSI
Date: Tue,  1 Sep 2026 13:14:07 +0200
Message-ID: <20260901111441.122436-5-ulf.hansson@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfXyNhwRzvKhJn5
 1Dlewalh6JCmXS5z/TtfODpnVUF5SYPnlZ+ZjDqYb5RQQJWmEMBPAhM1sHMjsvVoeX+1QSc+eHo
 E4zF7wR+bxxBw1rvWUw/dhOBf3P93hA=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96b3b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GddhhVl5-a8N4MGu71oA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: zBzcdfCZvJOoxYSXfUj2lUMKziCTXWhF
X-Proofpoint-ORIG-GUID: zBzcdfCZvJOoxYSXfUj2lUMKziCTXWhF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfXz65pYI4TG3uf
 5S92EBYAaHKB78S/pmpp3ZsmFCk75hecXLmM+S6ylSAQ/Im+LgjmfhmyXb5DfpIij5vKU2FgX4U
 gqOUU491dN2wDSjDwNZPrgLg2XXiYOWHdP5pvdd46iWoQvqhDNS4gFOB5+WSr9m5nh9+PIuTBX7
 Yy1ci/BkBDvfChuW6osJUXtZubo96VQIY7WOs2OqHkajgP/+MEk7ZI2H72qF90qzps+7GWVYQ4/
 33mACId2P/Q+ACiICu0BlcoFibEvxqFwEw+lBJOpGl2iDZN+F6JMovmwyosdKhvc6YTKsqE5oc9
 GgcY46giYYUx6ezzVwtEzmYe7rC2RBWp60QLNpdaEXxBna5wHPvFcG4UQ9vQVodqF3IefoDNXnL
 z+1cERdp9apai3Ok1l+/iAC976porVfx+Xocg/Epe/Fs050bWmifGi3x45yQu0khmXjxevtwbAi
 PMHyn3eLLzTKPK2z8Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010099

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
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v2:
	- Fix a bug in the call to pm_genpd_init().

---
 drivers/cpuidle/cpuidle-psci-domain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3..4d8c63d329c2 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -68,7 +68,8 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	 */
 	if (use_osi) {
 		pd->power_off = psci_pd_power_off;
-		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
+		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP | GENPD_FLAG_POWER_UNKNOWN;
+		pd->state_idx = pd->state_count ? pd->state_count - 1 : 0;
 		if (IS_ENABLED(CONFIG_PREEMPT_RT))
 			pd->flags |= GENPD_FLAG_RPM_ALWAYS_ON;
 	} else {
@@ -78,7 +79,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	/* Use governor for CPU PM domains if it has some states to manage. */
 	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
 
-	ret = pm_genpd_init(pd, pd_gov, false);
+	ret = pm_genpd_init(pd, pd_gov, use_osi);
 	if (ret)
 		goto free_pd_prov;
 
-- 
2.43.0

