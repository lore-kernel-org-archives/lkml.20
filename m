Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FF14FDE59
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188418; cv=none; b=V77voDFEubi8G5JVr9jmh7wZxZUFh2n+H4rUcq+hJtTjwnTF8UOIip9iePPF/2zMHHIpRR+QnDgxP/3ZJzeiereAK4zgcnPLk+YAuC8uautE7fdF9i3AzRzNF7KeH4q9kN6qCI/adYZ3LLA6zwX4X8IFPdAmyzVRwpYBBaC59Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188418; c=relaxed/simple;
	bh=KiBkyFbM+oUoQC7uZGJjadYNV50bpOhuhbA2S53q2Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eutfIUnMXEI747KoallLuiXhk9oE9RKaOgtSAghdXxHW++jCExIpoNUPvK+RDmQCiOGsF86ElYCDq8E/bIqWEaz1MJCQhLLeh3K1Y1ynkPGa2S60wI8HsuVvGO8dD6YaAilvUDe2Z31UzXxV5eAntd2nIBugYhHVIf9o9Zl4CvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FYpHZc3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zyw2hKMD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYpHZc3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zyw2hKMD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETbec4049766
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PUy1Ahq33tP
	rFwLZFHXp5jDvTROASK+cDxI2gHSvBWE=; b=FYpHZc3cCM72E3+XZmksRbmc9/Y
	Y/JbWcmIM7mJIbW6570Doq8DLaazi1zvFxgFtg52INa45kGJflDERYZmA/p1MfxP
	CDpzMDl37f81WkDNjjDwGYeDRAZSkLO4gJdeyX2x2kQoWh0ZzPV+EWYJSxwOSBOC
	DcQIHq+65cc4FvV7VvcRaEgYh2vup0xTYIb9XyGcaVc2e2VbO0Y5ErqRXfNiSHy0
	x7rjQpUFSA0RKfl1TTyBQpWHQXUF89blhiVX8xShmGaHW3+Mwh0fX0DnxaJahpYC
	3FYfOA+Kepzfzdh2Yw5S+2SiRen68mHov2Nar4KK8dquUhqJTlbBt8HMtSQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jghg0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936e393061dso398189685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188415; x=1788793215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUy1Ahq33tPrFwLZFHXp5jDvTROASK+cDxI2gHSvBWE=;
        b=Zyw2hKMDH0ulqLr2OxpCxZysI4gKMbnxctuqeALzj45Vk2T9CD4znbRyKdCfxGJt4J
         xA/bz/5M0jhYs9UdCaTr7RRssMRY4wiU0YEPWx28iVMD9K7UTk30DULCICiQkpnarLl2
         SOhGed5CxlcV0wXtMYw6lxxQHqiEmVf8VfwpjZQqVOE6RZPeNmr8z4rgfLShn59GBKHL
         ECJ+JbJvZMWKqiSGv/0yfNoBBEmvaeRh67lPi2o2Aiq/vdWpTYc1u4tOeVhRdkaCjYus
         ziF1YEPq/7hxweoX0O2Sc09eAaW1Btn0Pv1dVPqFQqifl/zyxxeSHh0o8tN4xX+6KOq9
         7Bpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188415; x=1788793215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PUy1Ahq33tPrFwLZFHXp5jDvTROASK+cDxI2gHSvBWE=;
        b=Lt4hYTKHkE9spbjkpHqDCBKycuFbARxTSncMilNy0UjIgDr6jdVgOhpTuj6LGo0tTi
         vALg6i9VOQDyTj/rayb0pr8asoZ2vtaqrTFD+sdmiCF+zrcgyrAQ07RJGukvhUkrUXrn
         6RLDJPe3bys213/40HlJ2LRe8pU3qp4N7eaQMR/pGPldUQcDSCzuS23EHLqnMihrzXIv
         hYs8XrD+a514YUs+EmrE5eKDDQcYP4vWZkylADWib/t9ZXxuDiL5rBaokQEX+Jhb7Qmw
         G3RoJdPNu3BuRFMov7YOA1sXRAjKSa++iaE+b+oeO+RMEogjE7PZpfA93LEaL44NTH7J
         COog==
X-Gm-Message-State: AFuF++lH6K3APwOvIsqPi/bfb98UqA6HQxX4DHfWf0qc8RBbVuJKVa+9
	CEe6Ciu599Qd9KDvYJABJzx93y8N/07+Rq8odBVYidaLHDk8TkiFLbR8gG7Ez6KTt9f9ojeMt+I
	KqXaoWHjZvejIumbh38CAF9/Rpjclv8EG/snlyV3Xmo9iezH9KxuU/SLzjDbQl+nswCg=
X-Gm-Gg: AR+sD11Rh5ZE8e5JiKeY4pPgSd11enPuyFPNyDX0sts7l6O9aVd1emJcFrXasMqgksb
	sqNMrEc0/X/3UZ/xZhpd73QLRXoUkcYkFllS4BD+fYoy0MjAL6Siqy9MUlct+8wxXWcLIjkXivr
	DItf/zwTMbdEIbx3hhCne1O8+iS8IB9xAhGH1GCF87QdbijUrxfF1RkicbcQWuPbR9vCjFQFmIW
	4LTvwTD5ETZDvPQnreLNBxwYJa2GbRYSHxBS4PMOJUUBaxQ11SyEWdF6h4lhrvXa7o8ctmjoHfn
	ll/WZuE+GjBNJbNqpNEKUV335sTFAhq7p/dzRlLj4MVyEaHrGi0Wee15NsY1BeC+VvGhObx83WQ
	WLpVJ218S+Nt3nixeUlvS3DUmHlHAgqVI6l0=
X-Received: by 2002:a05:620a:3188:b0:939:4a44:5f99 with SMTP id af79cd13be357-9394a446245mr25535485a.10.1788188414848;
        Mon, 31 Aug 2026 08:00:14 -0700 (PDT)
X-Received: by 2002:a05:620a:3188:b0:939:4a44:5f99 with SMTP id af79cd13be357-9394a446245mr25521285a.10.1788188414092;
        Mon, 31 Aug 2026 08:00:14 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd775dae8sm136267455e9.9.2026.08.31.08.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:13 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 17/17] selftests/vfio: Allow building on RISC-V
Date: Mon, 31 Aug 2026 16:59:43 +0200
Message-ID: <20260831145943.313726-18-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _VNzxVJK0WwYwmSB7zDycCQPuz0sVxWQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX2Fs9+pLhMMC7
 OqdwG6JGTdEUpl1QzneeOHdQC1HwyzzoktvG97CJe00kX8kp5+axbcy5XWmIxHsbfbrG5qLqW5e
 BCxiUTF4gX8j6VuoW5kmdcm4bHeEd44=
X-Proofpoint-ORIG-GUID: _VNzxVJK0WwYwmSB7zDycCQPuz0sVxWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX/sqYMhUzA5NM
 xeAi9+iDcWu61QeQoTXNBjTItDvlxDqOxVTFRLWP0OcDCqo6sv/ymo4XErjw2tgUSaqfJsHO3oH
 RJ+L7h2PuJvcXWIGugJfE1Vu0Ib9C2waCfNLSOK0RggsnD5hXGDSh/uj3j9GI6fF8Mb49eMIM3P
 16pmxLDrZo1oo053kFQ3GM0jwZIaXJh7PV2hPVQ4HD9syFowffvr/Kyct/3Al1JAsD4bEzwzN2Z
 sK39wB5xEJqyARp6DgJZwNSh631k024SJSIhG++syzZw9eSKlsEU9xrprLBuONPAp2zRGBCsXob
 cG8pzo2qiHvzrV/n7Dgp+E+olQmBzFMbhNx3UyhcZexpaSbEV+l/Sf8Wy9QYjLp6BHr4MZdq3xG
 w97DvbP12Yg+OAtXjTasdXKaK0YENqzs9kh2nCaaw2Fj2f8wsD93AQbcKOTCzjCamTRTv5VeV3V
 489Bmak5xR37r0cWK9A==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a9596ff cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=hTGq5wxE4AYYcur-NToA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129

The generic VFIO selftests, including iommufd coverage, require no
RISC-V-specific source changes. Top-level kselftest builds normalize
riscv64 to riscv, while direct builds may use riscv64. Include both
names in the architecture filter.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 tools/testing/selftests/vfio/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 2c32c48db509..2c7d8ea81b61 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -1,6 +1,6 @@
 ARCH ?= $(shell uname -m)
 
-ifeq (,$(filter $(ARCH),aarch64 arm64 x86 x86_64))
+ifeq (,$(filter $(ARCH),aarch64 arm64 x86 x86_64 riscv riscv64))
 # Do nothing on unsupported architectures
 include ../lib.mk
 else
-- 
2.43.0

