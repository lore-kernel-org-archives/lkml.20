Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E190C47CC80
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261293; cv=none; b=R0EjHoemqHGpNyURuw4CFDli3VZSlGJPFETZ8uOvo7AavIbMODFGWJBVgqZIAKv6xX19mmG463RVqsghAdgiEuPHcjZ97nQTxBQdC9fROqSKZ7/aviKjOSvQPf5+eU9JR4PRHqyrWw5xWb07xT3aLdMqZ7WMTd8CeZFZgUkvYjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261293; c=relaxed/simple;
	bh=e3wE+BNi8M3SeW7jiB0cUvZsdn4K20sSqmTCnupwXu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t6VVkBxr9RtCEL1N3J8TM9/+g3GEKgylDbBZPtGht/mtznexIhVKk3qaWqYO8auk43wYhvsFP8RljimI29ruD5V/zXwtgtZIaRc5OT265mpoXWUli7xPMV7TcZqCEsUhH+so/48Epv6YsOoLK9bECR5bu3c+Aus9M4SqtGBVZ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvUjuT5j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GO5mooND; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvUjuT5j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GO5mooND"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJiku2242331
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 11:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7MrluA5bkbeiGOCaNAU/2soekLgfCwotYkX
	EEyAJ+Z4=; b=WvUjuT5j9O9In+1uCfnTxeQXglqvDe2asBOYuOSCjov7R7k2fyH
	EjiDrCgdbBmgMu7ZhI50tOl3EPNlxyGKbz0pHbVAjBPfbSCV+83BBk4BDDzw4fGp
	ql4XRmadbi3Wo7W/nPe5ywg1aq6ZImMTfMxiW2VTjFY3Cqf345jDhCvOLpEEk49l
	yOLE/WWeu0W88kaxpNt0GzCbaqa9rZB744DzKzZa7MpE50PoywUAkbdgaRzejVVG
	P9TmIrjr241ldmzE/rzf3TInHL3uCBFj2GZOnWjILyMb4RAPFD2Oh5v8xpah6hue
	NuVJAFAdJRn5WhFDglQYozsRNXqBRd1OQEw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm08py-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:14:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93915f50a5cso193140885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261289; x=1788866089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7MrluA5bkbeiGOCaNAU/2soekLgfCwotYkXEEyAJ+Z4=;
        b=GO5mooNDRE7IObt64qKYYEhM4EqBdmqY4rCexYBXij3D6xkkZJMn5kFhfNNEJENe+d
         kRpofsCqgxsBl56IJRPAnvt9+1/Z4FZgmiTMkfuAXkXN7GV25sQT0wd6QGQcc/wUdvBn
         /gVoWo3Ih3Ck5uM+IB2TTRFfEQLBaQ8Yjk/XHv012OZ3V7MNCNUZoyTKHV0WSZVl+gEP
         p/qUlHr+Pzq8WE+9eUrytk66R1sXMncy5uRUBLfRoUJs4s9jQYvk3F7X5I4VS6zDt9SF
         MdSvEdgu2t/+0ErqiDUoYqXJePsigx9TDhULr4lZZgo3aZ8xXSMJrXPQ8ijLtjbVO4rf
         kyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261289; x=1788866089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MrluA5bkbeiGOCaNAU/2soekLgfCwotYkXEEyAJ+Z4=;
        b=OdK2DudjJ2RFHu+mTUZl8sfcYKhm3cks7w4x2SYtwiewwqmgs8KT6PvbGVtM8wG/UY
         9eTS7AvUwrLWjtiqTDXTaAz7dYoGTb5KG0zHSeBsLHOFH5nVTm4XfsXfNklQm5gTdotX
         lcVCEs6fGlfaVTxHYenEcbvh1MxZRHy/qhU6qTwRbPc8K2aomzeh1setNhOEpEu6lDRm
         DfnHR6qFWdtL06eJVfZxuKWi+wM4sfiIijMliuJddE5LhFDoAMXrC9t2B4wnRmqp1OVt
         i3s8Y+6umGfvwpH9wxUwWWNah3GoxMAn5avft/DGuwYNOZY/S6pKyI3FlNVyfjVICdZ8
         QhuQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEh2sdPNofEXqVt18yUvih1W4ojO7qmH6xvKBRZn+KmnNJoBu+dqS5Hf1eZUhCZZAtBEwCZaWeBt4UN4w=@vger.kernel.org
X-Gm-Message-State: AFuF++my849ecXMEpFzbBBnEeV2a/JPpn5CxUphY/9sW8TW3tWzdqioA
	uvnWmjYO4P7WjpDsx3vsJq1zfoNsCWVMxz3rcTPxSY7hBx6ihdGymxBzXOYeqHzswQ+qTHRUQ0z
	2rNeB5u5umfdDXf9idgTEbUmbHsCsRxVz5sFVX7028Qk1zXAnyvx3zZUQalTLhiVEhvs=
X-Gm-Gg: AR+sD11Di6TfrUvXWSXJnrwsX7KqYDtdxBHDKaafcMPBJT54NWTJdT45brG8cS7I1YX
	c6HAAUpn0Z9rbHR9OeOAGXV8j0sd3Kilth8nxo3eleAEFp8+nJwJxYoNwslMaX97+Km+tjlRrvQ
	XWMB8PD2x+JYdU/1xv6A1j8GZj1zq+h2MUKaJ+larh0v6GuJS4g0OKnOaK9fYzfgZJMP79FQWGA
	HkDB4mOQlwo8baIINl12aW5vzlRmMNWTNvu57+V/oMsngxzgJyRd0QfwDxNhSmLkEC4yODZkR3K
	EmVNr3DSu2Ignl6zmuL7pCbLAZ4U+kaK2W0M3jSWRUPBz936+hfs86qu8LqNDlEHsF0q8MQ2GIf
	XwOi10CRp38blW3cg0et0WM+2t2ytjcoLlhKdMBI/JZ00RKVjfPEZ7KJZzQ==
X-Received: by 2002:a05:620a:bc5:b0:939:28b6:86dc with SMTP id af79cd13be357-9394bcff0f4mr452462085a.17.1788261289149;
        Tue, 01 Sep 2026 04:14:49 -0700 (PDT)
X-Received: by 2002:a05:620a:bc5:b0:939:28b6:86dc with SMTP id af79cd13be357-9394bcff0f4mr452456685a.17.1788261288648;
        Tue, 01 Sep 2026 04:14:48 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25878ba94csm380686366b.47.2026.09.01.04.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:14:47 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Subject: [PATCH v2 0/5] pmdomain/cpuidle-psci: Fix behaviours for CPU PM domains
Date: Tue,  1 Sep 2026 13:14:03 +0200
Message-ID: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bZ_tGVc0hfo5W3xj5xKjpvLZoZl_9FD8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX9r1TfYma4mf1
 GZpt9aY/iDGWy0PzYRCUp373RRleTZPTdJR8tEdXCmWIGGMBsCWrVDcS+DmrHwTzyhlnSpTg6BR
 TKZlbecTSNFykoANcVmFmfl0dyZTkX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfXyfYBE1WIuOA1
 x8UoZ8tCaCvIPCchm+ltrZP1x1ZqlEtv1atDFt/K+BXeowUVQCX5MfOCJtU5NRaW4oDUlAedIkU
 Uu4lCSLWLQZv8hYU54EVXGtFU00evlTqCKY9EufzcNBkBfSFIRI9ed9Ms20WhgVe/nMyRBXQCjL
 pktfwGmUx5uCqaG2Xkt/CjP9jgAWtyiJWuqvZoLzlOwr2SNlDmJdyL4HAH41fRu329Q8jcrMFNA
 R3+oXBoLcYUeo5bImPufmtUq4ob1HvzA3uO1UxuS2I+GpeByXxl5ka/ei+quLaNf3jV0yyW4qwu
 CPtQdebqYLAaRaURUrm5y1BAHNCtK9pwsaSQFxGVpBuDUPv9FgOKSiG0Fg/3vHXAMCwm2J4ZLdn
 botviN+KJqS/Hv5y5ZnpZl+MVkzlFHgiXM+sq6K7Aitqrbp3eyvifW9JKUdJohzETmY5AJCzpSC
 oywwu76Nr0ihvZEcCFg==
X-Proofpoint-GUID: bZ_tGVc0hfo5W3xj5xKjpvLZoZl_9FD8
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96b3a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yh3ps83G6N8KMOvRL6AA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010099

From: Ulf Hansson <ulfh@kernel.org>

This series fixes a couple of different, but highly related problems, when
dealing with CPU PM domains. More details are available in the commit messages
for each patch.

Note that, this series is a follow up to fix problems that have been pointed
out in a series [1] from Yuanfang Zhang (Qcom), to add support for new
components for the arm coresight subsystem.

Changes in v2:
	- Dropped the RFC.
	- See updates in the changelog for each patch.

Kind regards
Uffe

[1]
[PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc support
https://lore.kernel.org/all/20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com/#r


Ulf Hansson (5):
  pmdomain: core: Rename genpd_status_on()
  pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power
    on
  pmdomain: core: Add a genpd config to support unknown initial status
  cpuidle: psci: Initialize the PM domains in powered off state for OSI
  cpuidle: psci: Move initialization a bit earlier in the boot sequence

 drivers/cpuidle/cpuidle-psci-domain.c |   5 +-
 drivers/cpuidle/cpuidle-psci.c        |   2 +-
 drivers/pmdomain/core.c               | 111 +++++++++++++++++++++-----
 include/linux/pm_domain.h             |   9 +++
 4 files changed, 106 insertions(+), 21 deletions(-)

-- 
2.43.0

