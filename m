Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876E93F3272
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750410; cv=none; b=KhBrlqNLunYVJPcyvE3RxZv4PPMQ4LsBi2Y1hgam5Jy5ENhBKUpea8PYc410m0UeKiojLv4/EuuLl1ljKBbIgMBV/N/YG+8VoxWTPQZV5Y0ZG5YsjHah0rgqlYouLRC0/WdAdRpi1SYqQnjsjixfP2Ak2vWDWow7M+4J96B5ThM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750410; c=relaxed/simple;
	bh=FKb6BaGaOw+y5XBKoZBVYiEHstm1iw3inajCMM+zbvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhB84eUQ5/MtZKnZUyhXEVUWIt665R9T7/IVKRyHNOO2SH5mjb8O1Sik4sGiIboE/wW15uQFOvBGODTNO4tnnZuZi02OVWKwlWFDj4up46MtUvavZomIpZj4LkoVhYuf+uCb9JlNzb2EG99mS9wZHmrWbbA1vI5zk+BgKr8ZQhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JB6bR8Sx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J94tN9fS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JB6bR8Sx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J94tN9fS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U3VZDq1887256
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A81eQh/mNmH
	iDTVrzFWMP6oC61Wb5fR8bGkTk+ZPckI=; b=JB6bR8SxkavlYwB2R2oAFmSYfik
	qKiA3JBjyRFOAPxaSr5FAZwumsoNDZ1EvxiRgA+4MI1J3Kx+qcfwsgvuB3f4H7KU
	08cfYrOQlhiOXoiy+ydVHJZFv/78wYZAf/8UHvC6ERJXGTkExFi16p5V8ePitYqL
	glLVF3QnbZboWXc+TWf+vgs3xwqCytSL8jzaGmCYOHYfwJ3sCx23qV9Q+/yJr8uf
	dmWxEhQIBG/s/SPzgqx+ezFDxSvnIIHy/cGb1bd3WPkpErDxd81pq1HDv0oBWVZD
	ZCDmM0/3AT0B29KbG3EB5XNZvXGSt5rrJiEM6dQaMOfvJHXNy6osd4zq1KQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn0p85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:40:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d18eee3dfso324192eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790750407; x=1791355207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A81eQh/mNmHiDTVrzFWMP6oC61Wb5fR8bGkTk+ZPckI=;
        b=J94tN9fSJB+Anu5G6QIDE9Wpn41Nabh8F+M2l/BVUTEXEXZCMzkDBHsp/MgQiS+2cz
         entLSQlLk2ZgKtLAEEPisuK14/oSeXHKPSsAlFSllBJpXAq/oj7KnanSo5TlO0iLQ/VN
         WgjaXYBP0XTE6hM1mylva01LH2eW0vdsfKglqAkjD5xQ6PcFxTaTu/QgtFnYaKgrxho4
         09PldGtMhXUgxsCZe0SKNsxXfO6gtWsobGcRNxY5HvMw0nJX+1xrNoUXGmrVdPVvDVOV
         btVZlkoK/tnBWE5Y9ASmwriSYFLI60iWjSxsBjlEkAm7R7XlTLgNblmwFvLU/np1DIMa
         0+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750407; x=1791355207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A81eQh/mNmHiDTVrzFWMP6oC61Wb5fR8bGkTk+ZPckI=;
        b=G56y5LuFFA5R0iDrCAOnDuY0bpHMhLkwkBwCbtRww8rVxC4aeUuikqu9+kW17rh+Jd
         UmESY3f06xR83V3VINVZyGTea4XxCydymQZM5+InwcgNA/nMcuY3NZ4UeDFa6MqMYbFg
         pF/jxRJReuqUNh4ZKB/lUkc/iu3pMh16Ln4+m2x+Rfy2m+2mdBPrI6ex+3ZDHw8TFiWz
         sz3/v4WdWexMQ2JvlR/EVvRIkDnr4QT6wdbg0ia0EHR8W4zRgLUXVP78ynyATvFgBxGJ
         jJMfvx+jlUaLr39oPx3k4oskmyQADVCE6ojmYfcrDKfCDY5qwFEmiPvXUFuDI6kaAbCw
         5QWg==
X-Gm-Message-State: AFuF++nzSLfNClMpAfnipUYBj2MwLA4kmRsYOulORE4GPtDuY4B807oS
	/xOjhPUNWvj/xBBG8eC6GRxP3sH+TcMcH+zzbbdW0K6vECnBkF3VPHVpWE0NAOnpZITvCHXQWvL
	ymLMSVj2zDuiqabV2/6OPZA/FZfwb2kZOLX2vWQlPTo3YPrScdhhxonR2PsJxRUb6+mox1mFapx
	g=
X-Gm-Gg: AYBFou2AC+jnBSBhjpOYZMPedmLVJotuF9e90E6DJ62Zzv6BT4M7Tb+Xyav2Q22xcab
	r4w8+RsrWsK4BUG95L1fd/vftU0R58H2cDHonr24+bN1gbm6/vGHy1MoptO4Z18zbVeR2yDWOvV
	ZTNOe7evamD9K7A4CLfTuizO5fd5UWfTXKsE8LfMF1PJD/AZXdHO8wVGhoVkrQePAuAUet4veDW
	LNC7/28svxD23jphWE8G/v2p4N7yiE+yY3OZr5iAZVEZqTz5jMPmO0HqQVOmGZcWAoWcE0OGdP+
	ogU9V4GBYZs3xaAVkuk+15cWZxPvTnJRmin0a/2fsS2Bk9OPtH6+T1vU55+6Upb0q2DzIxCxP3o
	ms0fmvpVwv1ZNsVbLz056SWllc0rbosWFHggF/M6GjMfnU1gU0qmr2Ap/e9p3l36lp4MLFVSbOZ
	Vq1o+oH25rO0j5U41bsFRTcXjN
X-Received: by 2002:a05:701b:2515:b0:148:306c:971 with SMTP id a92af1059eb24-14d323344b3mr394990c88.22.1790750406465;
        Tue, 29 Sep 2026 23:40:06 -0700 (PDT)
X-Received: by 2002:a05:701b:2515:b0:148:306c:971 with SMTP id a92af1059eb24-14d323344b3mr394953c88.22.1790750405907;
        Tue, 29 Sep 2026 23:40:05 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d08fb50f1sm2711531c88.13.2026.09.29.23.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:40:05 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-perf-users@vger.kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, jtaubepe@redhat.com, palmer@dabbelt.com,
        pjw@kernel.org, qingfang.deng@linux.dev, shuah@kernel.org,
        thecharlesjenkins@gmail.com, cp0613@linux.alibaba.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v7 7/8] perf tests: add noinline to __test_function
Date: Wed, 30 Sep 2026 12:09:18 +0530
Message-ID: <20260930063919.608911-8-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abcaec7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=nkb_lb6KKDW8e-7fnV8A:9 a=O8hF6Hzn-FEA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: qsG91SZLRaviStKKGyuwsGMPJgP8SMfJ
X-Proofpoint-GUID: qsG91SZLRaviStKKGyuwsGMPJgP8SMfJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX3JKk7FpJyKT+
 zoe3QNgL2++5QxVIRU0YVTbJrMdE3J6vdAlEW+LOtLtWqs9v2jcr+I7vLiWhIVt7OvzmzIJw3MX
 2/tjim2Mu4JG5p6oG219GU1OP7OtUz8TOf5n+LbmHqG1y7tSK7CDDYQ7JufZ7fC33D3VCTMiJe0
 Wa9WZ2qZUNLXf3Thgu+RRbe89X+aHCHUZApuOAKc11onHMENu5ysdq6qEBMrOcDIfn9ETlTv8O+
 et6BSOnZYKSts90EO5rFiZChubsD5SK65Vq3X6SyTl0C517kKB7OjGVB4HnFmx26x+dCPWZ27V2
 +1Hvqqd1bpVrdtRg8b+Dc8tgPqMP0iqprNcMVQAwP1OEaGZNfZDYcSwP7ZodHWstKT6KbwScuWI
 6jEpp1AKLUYWuFyrrbtwywH51zkjFnb8wy3x9+eLgA46UXBrmI/NT9b38clh5jnqjyJ04MDLPXk
 VQvJCyqoCoNQMqhqYcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX+3xoqL4pyOKq
 ElIV+s5G1mefym+deyDchqCV6kRr5tAWIN2kx2dwMmABNfo7q+sXshFPK/5cz8U+UgkSXnhhNsk
 M/et7/3GakG/37rhSi/jJcz/ZshCny4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300026

In the breakpoint signal handler test, a breakpoint is set on
__test_function. Compiler may optimize and inline __test_function.
This causes failure in the test.

Add noinline to __test_function so that it is not inlined.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 tools/perf/tests/bp_signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/bp_signal.c b/tools/perf/tests/bp_signal.c
index f580ba7486b1..cc4a27224884 100644
--- a/tools/perf/tests/bp_signal.c
+++ b/tools/perf/tests/bp_signal.c
@@ -54,7 +54,7 @@ asm (
 	"ret\n"
 	".popsection\n");
 #else
-static void __test_function(volatile long *ptr)
+static noinline void __test_function(volatile long *ptr)
 {
 	*ptr = 0x1234;
 }
-- 
2.43.0

