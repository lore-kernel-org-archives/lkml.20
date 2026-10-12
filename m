Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E32370AD4;
	Mon, 12 Oct 2026 23:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791846352; cv=none; b=sfHwTu2O9iauQCHkNjFqrrOr84nx0aXCgtFbvWIpSEsOELm/Kn5HyO++d7MsvTvw3+57leaVUy9QM68+SBzwoRM7gktXYzX0Y0v/cW4h39DcRFs6kTb0CGI2Ks8z3jJ4cF10c8aH/JfjPU+Y5bF1v06P+ydaf182zbsyBxql0/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791846352; c=relaxed/simple;
	bh=GBugC1CSOV1zB2wo0D5HTznsL1QSo6wDw2S8OCKlIjU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XzI4H3z9g91Ok8z3CkoSRwU+mA2OjH34sGZxrQJ5edpnBnjpfMzOTBAPpapS4V1Cu2mhCb/gwb4UMHwelwhJ/dq3xD2z9Hn6hLxvB17x4rrUe1RiFDQv2PDX9zD4my1+g/zaZaz68dz20QGCols1wUXc/kF9JzO6yxhMfwiAyzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b=pXgbocWX; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b="pXgbocWX"
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJOXNx1059971;
	Mon, 12 Oct 2026 16:05:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=Kbu3TtVKN
	R0qUG7BxyDBmS9wnMjQA9Kev5M6ytm3Y5Q=; b=pXgbocWXYS+Hh9NMgm2Uazrk/
	IZR+0dByDvM/syO+PC7I1zdWf0dopqaykR/N24x+V20H0knJSeEX5z2w+zv9rsgG
	fQPHYhVwWsEcA2BPO2GDdHqgamsoov2imj7PBbMaLft0Rcjs8drRnnOMNELGT335
	QO5ChH2otv+mVgkgQSD6a7IB3F7FFx0vlnrDi34fohrgfkWlLR6OHZDnBbbIJC+r
	YKFg2oI8s3G2DrPg8j+IQZBfmMzW/yQ7+9Wptc3sqIbi+vlKB5BXOAge73UNkWwM
	Z87PsxsN+ZP1OYR6y19y61jo9ubXsbR6vAWMxKpLR97sOegLpU1EpGVG/kvUQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4h7k208dae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 12 Oct 2026 16:05:32 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.49; Mon, 12 Oct
 2026 23:05:31 +0000
From: Amir Ayupov <aaupov@fb.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/4] coresight: Pulse an ETM external output for a PMU event
Date: Mon, 12 Oct 2026 16:05:19 -0700
Message-ID: <20261012230527.750567-1-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA5MSBTYWx0ZWRfXwhiBsXrrNzlN
 BI7tjxjU6Zq+AEc2PheKm+nj2qtOOYcvqJ3Z1YzhfT3kLVOFA3HEGVOFd7CPaVaOUn1C7HOWY55
 Qe9IqxHRDWhhj3qf8ZtLrRP/FeGV6p4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA5MSBTYWx0ZWRfX251nSV4nCkaO
 W/87LGLjCJol+s0QtoHwsw8GUFd5ZvRXzitjKh9mEc5aM498H9lvTS6gA29srrLvNzEYesogHZl
 FO77bmnnno1YOpZ6TRNbDysD2kNj4MctYxgGxVbAtKE8rq35nE1lYH96XrPqCR/nEpytfql5dPi
 0TwB7ekgpjAFGg8Ufxjf5dOAqy07aSIYgJmfwKkh9l7Lnfrgsf3VoifRmfvc/OQOBlLjAoxF9hN
 poV1Dk4D4lv3uWch4colUke7ABnngBHrW4Ck7qWvOpmLJxlWjloqnP4dA+s3c8YvnJ57XlasmIf
 3fJJmQ1MmiPVPvV+E/QSdjfLfNnQMtbouS0bZKUmBOwt1u2c48EBwAWnU0VI6/ZY0GB/9p5OPJQ
 2mMlCwF4MV3e3LPEiATBfxKNdZoGptZCUbsuZzRDoV6X/wr1zQaqigcKG81LXs1fdXH9AEws4uN
 KvYAZprFr6nZGabisjg==
X-Proofpoint-ORIG-GUID: QGBU59FygO0kQJPZwWoN7v4QPWvF4Z0D
X-Authority-Analysis: v=2.4 cv=Z/V5j3RA c=1 sm=1 tr=0 ts=6acd67bc cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=PAz_-FQ8hEVmOPYdF0yf:22 a=VwQbUJbxAAAA:8 a=FOH2dFAWAAAA:8
 a=MLIspxjZGjsQz_remNcA:9
X-Proofpoint-GUID: QGBU59FygO0kQJPZwWoN7v4QPWvF4Z0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01

Add an ETMv4 configuration, pmu_pulse, that drives trace unit external
output 1 on every traced cycle, so a PMU event counting it (TRCEXTOUT1)
can end a fixed-length ETM window, for example with aux-action=pause.
The feature only loads on ETMs whose PMU counts that output.

Changes in v2:
- Split the -EINVAL fix for a configuration that is active but not loaded
  on the device into its own patch, with a Fixes tag and an early return
  (Leo).
- Match capability flags separately from the device class: a feature
  loads on a device that shares one of its classes and has all of its
  capabilities, checked once in cscfg_load_feat_csdev() (Leo).
- Report each external output the PMU counts, TRCEXTOUT0-3, instead of
  only output 1 (Leo).
- Detect the outputs from TRCIDR0.NUMEVENT and PMCEID0_EL0, and drop the
  MIDR list (Leo, James).
- extout_pulse requires CS_CFG_MATCH_CLASS_SRC_ETM4 and
  CS_CFG_MATCH_CAP_PMU_EXTOUT(1). It still uses event and output 1:
  event 0 is the trace unit trigger, which the TRBE driver treats as
  fatal (James).
- Link to v1: https://lore.kernel.org/r/20261001063744.2143819-1-aaupov@fb.com

Tested on Grace/Neoverse V2, pmu_pulse config loaded successfully.


Amir Ayupov (4):
  coresight: syscfg: Fail to enable a configuration not loaded on the
    device
  coresight: syscfg: Match feature capabilities separately from device
    class
  coresight: etm4x: Report the external outputs the PMU counts
  coresight: Add pmu_pulse/extout_pulse

 .../trace/coresight/coresight-config.rst      |  5 ++
 .../trace/coresight/coresight-perf.rst        | 19 ++++
 drivers/hwtracing/coresight/Makefile          |  1 +
 .../coresight/coresight-cfg-pmu-pulse.c       | 55 ++++++++++++
 .../coresight/coresight-cfg-preload.c         |  2 +
 .../coresight/coresight-cfg-preload.h         |  2 +
 .../hwtracing/coresight/coresight-config.h    | 10 +++
 .../hwtracing/coresight/coresight-etm4x-cfg.c |  5 +-
 .../coresight/coresight-etm4x-core.c          | 32 +++++++
 drivers/hwtracing/coresight/coresight-etm4x.h |  3 +
 .../coresight/coresight-syscfg-configfs.c     |  7 ++
 .../hwtracing/coresight/coresight-syscfg.c    | 88 +++++++++++--------
 12 files changed, 193 insertions(+), 36 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c


base-commit: bc01105ed65d15787b2eb93ac26e8624a2139e35
-- 
2.52.0
