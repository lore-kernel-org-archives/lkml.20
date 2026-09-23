Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EBB3B42EC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178195; cv=none; b=WhBBdJ9lR3CCllF82KbMlkmbiTO+2mz0Ktzp9ZEKu2EmgBeWCn5ijI9dnnyYZwTeYrHF2+/BTqkRMs9rt170/sAr4nb4hRm1gTAHlr+bc6bxp66TVoNhYUMVBLYquXfHLfTsOg2rtFBPirmH7Et248oxrxCCbWsSkJPECPfQbF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178195; c=relaxed/simple;
	bh=ngrEMwBHoqSrBzOVr3vVVpoFr7ca+FoSsZWu/3nVPSo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Type; b=io6uOa/mrAxA6h0wxTku0/YxYpG5+FzM7oQTW1kkiXK5e6xS3OfyHxh+1OG9FhXDKqZ7fYnw3it20rttkpeQ2EHicZola9qgzroVAYjpPmk4NaJN0fXw1EbEzJdqbqqSDBsr0Ptq/a2MeRwxoGa8AlfxlDldblGOjQIdoOpIKxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BebfA1LI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O6w+i2BW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BebfA1LI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O6w+i2BW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDLxWh3842838
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:from
	:message-id:mime-version:subject:to; s=qcppdkim1; bh=px3kokqR7Yq
	JFvxeVNtGq39hKU5pCWQ04iMYG9ZzgDQ=; b=BebfA1LIHP/rtgOG3RB+tLSGuis
	noOs8tcOFAX6jQ+xpupTmws9yn0tlTsHp50qHqh3n89aU5M6zdU8vs/kCYz7jWLT
	N39uQuD1xaDgs2+klbU3j6tpDwy1B5wfvheBhbVAWQLXwSArrSfmKRjYDPzOhRoi
	Y/ilTgs2/zYBM1MPRQFwKhMaU/mTBHTQWes8Tpq55/bb64wWEmcHxCVVi9mgCI5p
	NZmafk5r7oYwhWqnce6gGQmqK+QSJLif6QhjfzekuTBypfrdR2E8eCq2pssjAPtg
	HiqdyDkBAeRY3YRdNLSrS5o9ss49rLX/FSPeaQOD5zk8wHcBXy2+XuOVHLA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbgmy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:43:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7a8e3cc28e6so862999137.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790178193; x=1790782993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:content-type:mime-version
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=px3kokqR7YqJFvxeVNtGq39hKU5pCWQ04iMYG9ZzgDQ=;
        b=O6w+i2BWXI5ePnP+RKIVEQ/ZVJSGhY093ztYkeuXUFY68Gc2Z6+ju9rmPqzMxLJ+c1
         zc/IhmL/zUYRXSvWAoUIsBRaut3LbVulKKnqckG7Lco1SZBvK4YA6tHdCqgghViZpUgs
         xQQZzUh+WtU1FgowyD26VQbhYkzoOSSDDrMqNFVuEcr4FDe9VaX63aiZ71onhxQu/ZQ4
         pj2Q9D5tMB/lYnCVl64QNNC5EQgw6gCwK1uHg05XcKQCIPYJA318vp2y/XFavJWwpxKl
         6ravu2JbGfv38dvR6cvgELjHsJs31j5oyOwgxQHbym7Km4FDbKp6wZl8GjGcTlThGjZn
         vC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178193; x=1790782993;
        h=content-transfer-encoding:content-type:content-type:mime-version
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=px3kokqR7YqJFvxeVNtGq39hKU5pCWQ04iMYG9ZzgDQ=;
        b=DH21g5I8OEshhwS9joPwgIbJKeFMU4WdmhEoLyZx3E7VYR9+NGVYccd15NYmdJaDVy
         it3r3IT/1sq+6MBL89mk7MR7aIuZvwU9jkWNrwW5wRAS9rAFNOj/BhXqY6zm3w67W1kP
         UZ4nqHBXxQUQuJuL6Yosohay/CrD84BevIh1OZpp/DlQG3MhYYxAhmR3QB70LqdbKH9O
         AP0uyrb72eExRT5Ar/hgkZN5016G2tV2DE1kiWauVfQRL33DDpM2GYKVEVDp9vjcHOhf
         Thei8cc9V0DdxWFvQKFxARzhkXaEXNRIaPoVNObZ/7wU0NDaZ0qn78NyNdhBOTgNAtLY
         7heA==
X-Gm-Message-State: AFuF++l7Wn9LhiP93vEuMi14hnh17zcBp7NuUOLlRuRZw+TnVTZpwKRW
	v9rWqFPo1rKquPxBBT803wWvgK2UZtgbinnkftbch1Gm/0Cnz0eBxX6tbTOU0p8JjoIhMcrAybi
	gDpe6n8XLtMgUG/0gIy4CXc/tt9LGTo/+TNS9NU2L9PT/MuAQRGLqZbXBuR+v/wXEBkMvF7ZyX+
	U=
X-Gm-Gg: AYBFou1E44djk2HV+sPBj/oMz1f5VSNfhb4fdapf37+StVN+96hNZdspYBwNMysXi9+
	QJSUswwr52jjLBPBLlehOLR1KDn/8BXVYsHpfswTi+PCJBkYig6QtRKgjY5PocWvtWJ07lHXyHx
	4Iq3+xCnptH4PQiuiqHEF9SzIYYTSa3n63AaJTu6FCzYUWuRLE0Fr5uqhIy1XLOLlQH93mCdAjY
	i5vfCo081JJKzYKvBYibGsoWV8DMR2UaZgzgMiDjKI/jZm77bR4C6xtsNWIl/laBZJ/VE423I1z
	M87cj+YK7afs2Xuif2OaNp6SslfKph6V/141MIU7Jhzzw4pYVEhsFAPd5lnS6nngdjhUhBy0bwJ
	0HjeQIFpNWXVExPsShDhhpw/4T+t3ngwvs6cVntlXFk4UlAw=
X-Received: by 2002:a67:f818:0:b0:7a1:f2b5:646c with SMTP id ada2fe7eead31-7aaa0f22399mr4953207137.41.1790178192685;
        Wed, 23 Sep 2026 08:43:12 -0700 (PDT)
X-Received: by 2002:a67:f818:0:b0:7a1:f2b5:646c with SMTP id ada2fe7eead31-7aaa0f22399mr4953196137.41.1790178192233;
        Wed, 23 Sep 2026 08:43:12 -0700 (PDT)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886848646dsm7043804f8f.10.2026.09.23.08.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:43:11 -0700 (PDT)
From: Brian Cain <brian.cain@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org
Cc: pierrick.bouvier@oss.qualcomm.com, paulmck@kernel.org,
        sid.manning@oss.qualcomm.com, peterz@infradead.org,
        linux-hexagon@vger.kernel.org,
        Brian Cain <brian.cain@oss.qualcomm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2] smp: align struct __call_single_node to 8 bytes
Date: Wed, 23 Sep 2026 08:43:07 -0700
Message-Id: <20260923154307.3625611-1-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MiBTYWx0ZWRfX1xh3jIRoR5bf
 c0f9D/OOqwQobkbFrlqAQscEU6hNp2FqP36rfZclXl014osgU/r7axLTvQvPEsi70LLDt4W9x5H
 mihS8xluPNWoFG8+3TB0NwvxHAyjc60=
X-Proofpoint-GUID: rYb33qhKYludRwo8OnlenB5sYxCDeN16
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab3f391 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IZicBOMgkkpEp8HIunUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MiBTYWx0ZWRfX8GV0coT4jeF7
 jdgW+wU230r66Vjiq9FI+ZuJbNL+5etJG8EVlOWa+nHjzomUGDLRs0RuEmcs+QAL6ssK9aOYKL1
 vUtXyT19xalGdGSGwO1dvB/EMpwEqWfnx4y2TIDsKhFzzM0ZljBXwX6UFN/rnaFgBdSssIPWPNd
 xXwArOE0v32I8ZDQXgC0xtEQqkZxNewef/mTJOGHV4fiOT/ri5Wv0omWcziwF7nAGVgepBTaezw
 gCj7oCAaTb3ok8Qks6BKjeiaQPUiwaVk8GAY8QwP7uDKRvrcW/PTKrR2qLo3ru1huJ+CV73GN1K
 1Ho8m2Ds6c/5rIslumCwA61ejEpjfzn9H/O8tTd/xJUwIfXoO1OoNmBQBkEyY84hu/bla6LHUYY
 wmDGPOq4ZOyP2XYcWVT+GwdHU7gmp201zXMZ802d10ufU+RnvlgeO7m2cw5eU/+sJr8jt5ktvgz
 CeREiwbSL8CmI3EjLZQ==
X-Proofpoint-ORIG-GUID: rYb33qhKYludRwo8OnlenB5sYxCDeN16
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230062

Consumers walking call_single_queue cast each node to call_single_data_t
and, given that type's declared over-alignment, the compiler may load
llist.next and u_flags as one naturally aligned double word.  Fields using
this type, such as task_struct::wake_entry only guarantee pointer alignment,
which faults on strict-alignment 32-bit architectures like hexagon.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Paul E. McKenney <paulmck@kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-hexagon@vger.kernel.org
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
---
 include/linux/smp_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/smp_types.h b/include/linux/smp_types.h
index 2e8461af8df6..5773e1fb2660 100644
--- a/include/linux/smp_types.h
+++ b/include/linux/smp_types.h
@@ -64,6 +64,6 @@ struct __call_single_node {
 #ifdef CONFIG_64BIT
 	u16 src, dst;
 #endif
-};
+} __aligned(8);
 
 #endif /* __LINUX_SMP_TYPES_H */
-- 
2.34.1

