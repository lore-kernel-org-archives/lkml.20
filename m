Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D122751477C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681915; cv=none; b=pOCO0By8vXBwsp++e6daAARz4nEkRYMHTsGBmppAnQlPaweq/Db0VzzkTPurZBDlJxGW7RjeSN92G+rKe/PYCdKYJyejsbA1WTff58zAvpYzBy7XnO75aL8IjxpP0rNiQOueF/2ETyoHtQ26+h2H7UgD7kSft3ZuFkAoeKPgOt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681915; c=relaxed/simple;
	bh=7JDEwZlYg8XjCuVnYsnKF2kSPqk9OomdJ+3Kd/nIeBs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=smo5oy+tJYuPgDalXjPkN56rdSdQ+UFMJBCYsWmO9zcmilehukVrHdxF3q0pQMOeb28wKJB6gA9WTdMi4ZbJnNCNBni93Fjb+GJ2Cuao7DHEaXoA1PkQ7VJRlGT28ZiJGmuIOJZp1ETZEYG/bIJ2Q/EA1IbMEGkd0UvodusRmb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAWsyXEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Inb5nIQS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAWsyXEb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Inb5nIQS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAjQos1196221
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5nbPD22Jbh6I0nCcqKz0VI
	PeO0cIL1IMQ0/m7y2jQ90=; b=hAWsyXEb7RIpElqN22JRYzn5Nod22BZ5uprMAD
	SPXUarnmTjFdY7qHs1aaTPic7Eysv9CsE+WnfG9h29Yi07wDFt7X0aEoPi7nfK18
	kjXSuuqcjbF/gTjFOINbWd9N6PWtgAuYFmX5D0B1SPCvNA9RqkAfMg18Oi7DLrJ1
	AE6GRM8IdpImSFbYWYwEZ6i92WuGBFUKhgtyxw2ZbZ43pJLqKpe1N7pkca/VXzt5
	JHuLo1SExDnPZieqD++XPwh0e2b2hjDd523Lnrej8Y4dnaSoD5y8gVyCwt8Rj5rr
	13/BClru+cJLFhn7E7ztRvkzdrY/5kb/2/wTVs9c3x0+8tVg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03ksh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:38:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-342a0e1d8c4so2719104eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790681912; x=1791286712; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5nbPD22Jbh6I0nCcqKz0VIPeO0cIL1IMQ0/m7y2jQ90=;
        b=Inb5nIQSzRAd8EPRHAUq0WPPRbeY9XUxZfpOzEYV4a2yUW1fkMGHPqaXB3st/m5t2x
         N1DtKIaUnwrFa/T+9B8nyF93XYaN3i0So5efjlpQSocg2FPeN6TDJApHdULhCAYAofmB
         wzBCpfVy+t2BEPYFzWXiFtl7op0r1oQuZRTbeJ54+IMJ1BmIkQEK/FyfUrX1CYAlKS/f
         bNcwYl8vH/kQ7L0lSDWe6o8tqbeTwFqCW4IihOjy2maNniEKEY/HzT51gbKyVRp7ysA4
         lZRbSDiMw3CI867+3/gw4JizhvUfM0XU8uqeENhZhcSYSWijWYdpbBmQ/UH8HPgnb6Cn
         8KmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790681912; x=1791286712;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5nbPD22Jbh6I0nCcqKz0VIPeO0cIL1IMQ0/m7y2jQ90=;
        b=MhTruwp6IzWgd6iR+CqkXhQDrGpYcwfwanOT5rCe0vCLTjFN6hREfNu9KXVXD+bF9P
         /KlKscmJe8QtyLI9uOEO8pJE1OqcPBFpEST4Nhs10V4jap41w7GG0/a1S+PSyF9Dcc03
         VI4ngz7j5bM+js6uPfwZwRpZbDYaph7erfDcki7RW/2PXklZujwyNEmKREel8FzQE2z0
         ghbx6MEtKOORLPf7S1FQytRdqoyzFSqZFm+e/tQvfnaBXy4eOSCp3q9Fvgn4OHazOKPu
         Hm3MOUDcPNuVpjrpFDUQjnZQT97FaeCjJo1Jlv3x/sirqJtVAuFI76jYImUdEMiz5XfB
         /Jdw==
X-Gm-Message-State: AFq9FYLROFqDdP3O1dndgtS6t+SX5xmg/pl53f/DYIP3/eqDFYDl7JIn
	OQcuIy7cxhdvZ2TAeRLeZdJM/GozpZXe7vmtZowIQByM4/f9CfbtpHfxkouDTdS7RsvUMn0rpsB
	KmLDGQZSrvgDRWNCOL6zPSvW7AcTl3Owqq+QTngRmzoRELHaOChyfV/2PRMNJI8GTwWgmIuCHbP
	M=
X-Gm-Gg: AYBFou03RKYEtXDtLIJZSQKT1f2BA8Xeg3zDJRNB/so1iTnGWX4ICY+gXTNWsFNJHAv
	yldcUWc20sX/9VTceqeMlzH3KXwaAh6Z/Bt/LjmC1QB/oDZCiAZ6Q95aS19lpgBvqj5UjlO6NA4
	VO8wedjhP4Omnq433JL97CCPjznm5w0v+rJyY97fUL5FXSMLVmszBsEOgurU1W2vevRbx3mBI/K
	hyby3Mp9KAoY5TZIGofCRE362s3FoV3wLR9ec+vIdVs9r6/1qj7c+Sdh+YZHuaYKpL+wCqYSlll
	WGyiddCmZjFtYnqaZdmPGMuG1w3uorjnFpaTlE30c1Ao5gWsQObAmpqWv+YPiZISPJSRkkYdnij
	iwEYUYYaHfWN77VNUhHBUKm1K2ULlBIxlhHCL7YR+bHPyjzInhEnloH73WzSfnu/5v5qsIczQ91
	4+yDqlLwB4gRImT6o=
X-Received: by 2002:a05:7301:5804:b0:33b:e3c8:a757 with SMTP id 5a478bee46e88-342705b865cmr19524591eec.1.1790681912129;
        Tue, 29 Sep 2026 04:38:32 -0700 (PDT)
X-Received: by 2002:a05:7301:5804:b0:33b:e3c8:a757 with SMTP id 5a478bee46e88-342705b865cmr19524547eec.1.1790681911529;
        Tue, 29 Sep 2026 04:38:31 -0700 (PDT)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145d0fc9fsm37145604eec.25.2026.09.29.04.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:38:31 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH v3 0/2] sched/cpufreq: fix schedutil's boost frequency
 handling
Date: Tue, 29 Sep 2026 17:08:05 +0530
Message-Id: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2ju2oC/42OQQ6DIBBFr2JYF4NoFbvqPRoXiKPSKFRGTI3x7
 kW9QDeTvOTlv9kIgtOA5BFtxMGiUVsTIL1FRPXSdEB1E5hwxnMmWEZR9dD4WQ+0thZn2jqYPBi
 10qA3gzYdFZDXLU9FITNJwtDHQau/Z+RVXYy+foOaj+XD6DXO1q3nFws/vCtYMvFPcOGUUX5PE
 y6LJM3L8mkR48nLQdlxjMMh1b7vP21FiVftAAAA
To: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Zhan <zhanjie9@hisilicon.com>,
        Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790681906; l=4900;
 i=ananthu.cv@oss.qualcomm.com; s=20260903; h=from:subject:message-id;
 bh=7JDEwZlYg8XjCuVnYsnKF2kSPqk9OomdJ+3Kd/nIeBs=;
 b=t1huhPnVrum/f6kWecQp5ubUmg+2ETdQrzjbk1l74PU461Nh7oOH1ZX/W4MXjJVbQX7WcX+KF
 2y1r9w7PiS4CO6QlogUUc3sdXfohdqdQkSY89t/uL89eDeO+xYMk1f2
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=gutNfLSMVTRkB+MxVviMFq9I07C5qPe9xHY2J5XCMpo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfX5CdmyM9IDxsr
 o9pvhNgH8gxTm9bgc4DAFeQTAQgppT6JPMP6VBXWKqz94qNFP/8VCCD1eQJhcvXnuJV9I0GBfZU
 sSPPzhcLYhXBra/HUf6rOjWkJxwuP9c=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abba339 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ag1SF4gXAAAA:8
 a=BTeA3XvPAAAA:8 a=7CQSdrXTAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8
 a=qyfCnS17RIpad1FwrgoA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=cvBusfyB2V15izCimMoJ:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=tafbbOV3vt1XuEhzTjGK:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfX1cZiwSGTnS75
 ifxY58gVSkwoOYpq2mfOU9CglvqNW1EUSaoZdsQwcdR1dGKADvbC5gXU5pZYvLRHLPqGdoMeNxq
 PknSxjB+yuvfxeGxElO7m5i1tVLGM00Aw1hH3kOoOF/jC/z0uI3Uqyd18YDe8hqA8seAkJVOt+o
 VLIxiJlUPGDUwsNZEbDn0Z3G/A2FPwBd9gIwW/pp1fyUhXz/c0FtkByrkqUgVJZn5c5/ymdo/d/
 UylHUlx7KJlSUXysMbaW1UChBP1P/AD6MnCyLzd1J3qOPtiJkwskj6uVoHTVikyJdSdG/9GTEBq
 asWZz4JzrgJ3nqG2iOnhJAXvycCGiPb5GnvWJ8MPsVCde1EcFEv1EvYh5VCTm9ZD9OQRO8rHFdm
 kHevx/7Jprz3KPhrcr2jz1YKuhxF0BzO/KiDBTZqGw7ezfnyDlvDGcffkZ0fNrZLR/vtKmE+cO1
 IcCSEuF/0aFSAnVBoag==
X-Proofpoint-GUID: bMHTWiyzrU2tV-IC40QD6lriMQR33zAm
X-Proofpoint-ORIG-GUID: bMHTWiyzrU2tV-IC40QD6lriMQR33zAm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290046

Schedutil's ability to reach boost frequencies depends on two values
being correct: policy max, which caps the resolved target frequency,
and the per-CPU capacity frequency reference, which anchors the
utilization-to-frequency mapping.

This series fixes a few gaps in how these values are maintained across
boost transitions:

The per-CPU capacity frequency reference is set once at policy
creation and never updated when boost is enabled afterwards, leaving
schedutil unable to target boost frequencies even at full utilization.
Introduce a helper cpufreq_frequency_table_max tp retrieve the highest
value listed in the frequency table and use the higher of it and cpuinfo
max_freq to seed capacity freq ref, letting it know the highest available
frequency from policy creation.

The generic boost callback only raises cpuinfo max, never lowers it.
Once boost is enabled, disabling it leaves cpuinfo max pinned at the
boost ceiling, keeping policy max stuck there too. Track the max
available non-boost frequency and use this in conjunction with the the
highest frequency retrieved from the table with cpufreq_frequency_table_max
to control boost frequencies when boost  frequenies are available, allowing
the frequency to drop back to non boost values on boost disable. In
the absence of boost frequencies, the handling will fall back to using
cpuinfo->max_freq, preserving the current behaviour.

Oleg Keri tested the v2 on Lenovo Yoga Slim 7x Gen 11 and provided Tested-by,
but it is not picked up because of the implementation changes in v3.

Logs below for clear context:
Intermediate values from the time_in_state output and logs from bench
runs are truncated for brevity.

Before fix
----------
\# cd /sys/devices/system/cpu/cpufreq/
\# ls
boost  policy0  policy12  policy6
\# cat boost 
0
\# cat policy6/scaling_max_freq 
4454400
\# echo 1 > boost
\# cat policy6/scaling_max_freq 
4723200
\# echo 0 > boost
\# cat policy6/scaling_max_freq
4723200

\# echo 1 > boost
\# cat policy6/stats/time_in_state 
355200 36958
4454400 650
4588800 0
4723200 0
\# 

After fix
---------
\# cd /sys/devices/system/cpu/cpufreq/
\# ls
boost  policy0  policy12  policy6
\# cat boost 
0
\# cat policy6/scaling_max_freq 
4454400
\# echo 1 > boost 
\# cat policy6/scaling_max_freq 
4723200
\# echo 0 > policy6/boost 
\# cat policy6/scaling_max_freq 
4454400

\# cat policy6/boost 
0
\# cat policy6/stats/time_in_state 
355200 40147
4454400 79
4588800 0
4723200 0
\# echo 1 > policy6/boost 
\# cat policy6/stats/time_in_state 
355200 44834
4454400 93
4588800 25
4723200 569

To: Vincent Guittot <vincent.guittot@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rafael J. Wysocki <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
To: Jie Zhan <zhanjie9@hisilicon.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org
Cc: driver-core@lists.linux.dev
Cc: linux-pm@vger.kernel.org
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: Oleg Keri <okerixx@gmail.com>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>

Changes in v3:
  - dropped max_table_freq field and added cpuinfo_frequency_table_max function to retrieve max
    available freq instead
  - changed the condition in policy_st_boost for not relying in cpuinfo max_freq to be whether
    boost frequencies are available, instead of whether a freq table is present.
  - changed fixes tag for second patch to Fixes: db80ad776cd2 ("cpufreq: Remove driver default
    policy->min/max init") - thanks to Zhongqiu Han for the checks and suggestions
  - Link to v2: https://lore.kernel.org/r/20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com

Changes in v2:
  - introduced max_table_freq/max_base_freq fields in cpufreq policy struct to use for seeding
    capacity freq ref and handle frequency switching during boost cycling.
  - does not try to update get_next_freq or drop the one way guard in cpufreq_frequency_table_cpuinfo
    anymore
  - Link to v1: https://lore.kernel.org/all/20260806044230.909961-1-sibi.sankar@oss.qualcomm.com/

---
Ananthu C V (2):
      arch_topology: seed capacity_freq_ref with highest available frequency
      cpufreq: fix policy max not returning to non-boost freq on boost disable

 drivers/base/arch_topology.c |  3 ++-
 drivers/cpufreq/cpufreq.c    | 16 +++++++++++++++-
 drivers/cpufreq/freq_table.c |  9 ++++++++-
 include/linux/cpufreq.h      | 16 ++++++++++++++++
 4 files changed, 41 insertions(+), 3 deletions(-)
---
base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
change-id: 20260804-schedutil-boost-frequency-handling-8e6bf2387a4a

Best regards,
-- 
Ananthu C V <ananthu.cv@oss.qualcomm.com>

