Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6593340B6D4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832271; cv=none; b=UI5IcrschQ3qm4Uexl1z7flaigeMq4O6rURpEvMRCsc+jBKN2b/y1EbqdPkQQrFYBowGrK9XEzjyDlv7USHaZYqxShHgx/XNeJLapxgmlO5E9qTUrlg78Ev7PbeC0J0nmu0IbW1zQM7poS7xbr5RUUkr3du2NuWjsMiwGZh/s1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832271; c=relaxed/simple;
	bh=49xFSVZEPbXgZTcuGJ9R8PyRDarMnGzCnfFE/tYT9SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fH/eEDBKwHuoKMmVug+cM4UV8J8M+DC6bW+IX1qUHh9EMkXms4TIRY8Ri1YiFkWH+FV/FywJHy6+HPsnF2dt6kM1T09Cb8Lq4K/OsTkzUA0jYbDmifnQzCAhZZQQMs4Gmr6J3gLcRI65++CXJsKTWpK6c4Wmxr2ttTF2LloqM/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuGXSLwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxdddbL9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuGXSLwf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxdddbL9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gFkc542093
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 05:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HZjVRtF8Ja3
	Eebp0/BccuPRRLSdbeb1VPoYbtbjst2g=; b=MuGXSLwfMJan8tpwaJeqJ7exgtH
	17939RC9gawl2BdnmnSXxzNkD7BZ79HMf6btYMKtNMm7QS4EkSG8xkwQwETWT9/b
	ppmKu9gXgRcfohdUFGSmuG6KmsBFQCog1wVTm1uEq6ghQGPP3n2AfTUttCbRmD2Q
	NyWVOBfp806/QxGOyMOyE+oQ9qrCierf6JW/QPCKQgMkhUzQgg8WV51NAUreCNRa
	r1kkyMLD3sdbBkVhGICyUDF0qXP/ZNlYi8dgiOpGo0xlfmzVQgYsiy4qQbMUDqGw
	0KqgrKYJwtdGRvMI84Zom/u8EvD1R/U833v/XKpQlXIit415H5ueS9YjDRQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wctchw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:24:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df5a65671eso6101945ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832268; x=1791437068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZjVRtF8Ja3Eebp0/BccuPRRLSdbeb1VPoYbtbjst2g=;
        b=hxdddbL9gdtWvaeQnwbKpfpETMHlJw8K9IYxFqOEE3rPyHWJVaw2LRgYqdzvRuLjAQ
         mA+nFtDTqjpUjIJiyCQXVJc2zppELL5Kz2lLGl6Q5qMVvrmTNsBwXbX/MuEeoSj78OGE
         hx9EpSGK0GxuPlvHVIt+HpuhlSyqm8JRKAsIVGgG/4/Qy/gW9q1h6iF2cAskDksgcHQv
         CZWqzCEFBTdmGuZmZDlb968zPukimGNnkcXjFsWq+zQFmrnpf2QFh9x6Dn77U+oXqRYn
         LUqIzfWpGz+1IcArXbZMaLKB+8l4mnhhFXiMgS1Ys3QNjPI6vVbftg268SH/hNCIoCAs
         4LCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832268; x=1791437068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZjVRtF8Ja3Eebp0/BccuPRRLSdbeb1VPoYbtbjst2g=;
        b=l3pZw48gn8XB8ZhGsOJ0S620V09SUWXhVxGrIjL+j/9uxKOVPmSGVnXGts2VVxdafW
         IqIayQ2UEnjXVTDw215YvNFeWDFIpqFUqLOo8AEyGARr18EzJWhZcR22w27z8fEuM3Uo
         Tn793kagK0uQO6m8+/7c5xnO0xI533Iufr1YG9VJIsbguQ0V/N0FW/iUdb10O7PZEOh1
         8yk8elHMfbSn8/9GboP+WAfhBP4MviTyoNWXH0chFs2W1HFWVzlzxC8u3wT6ylAc1Mql
         JqamuoJ7cxJn/S6/RvbTxWhCGKSS9ofoxk61sySne7W4lzIDQ8V9h9PU+O703ubaEV7H
         zJWg==
X-Forwarded-Encrypted: i=1; AKwUvBzmbSAzCdfZuXAnP067q1IhBXnDhkXkZlmn1nGoc6q60zmaXOKkjE59+/4/LsC1GmGLlIA0p4ovpqY4U0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSa6MvQII4ySqWNHf0qPcmL9CNYr2jack/c5RtyDRuqR+7ouH7
	sM27Q6BzNL7zUfI4wNgRHwUxT3jQ/szs9HN418OZHVn1TnGrmECmgb7BHpV5XGpaLdsvc+dJoui
	qp4lYf3IUstPa+RNqRYuJEsaXkQ0eQ9EGFybZAcgo5Qr0XSZ7oUS1EkjNuAEM8UYDihw=
X-Gm-Gg: AYBFou0s4kyxuRwTV0fLjnQtaRSJslgOnF7YPHyHl8hjInWRezwWEP+1onpS/ebZkbR
	S7yPXWTwlZM+hEmGi9JVVUqXX7utYIFwyl/IqsUyzhGoYS86QTRcHjbtYw52jEIuzfmsAXZUvfv
	EXv+kkTINXr6Yi0fxiEdquQzHJZ04FolbGRwHnXnVWaSuWIKm5iR8IzpzY5CcmrlqR0EJlf4Ct8
	qAZSg3LIO9nrmHLC+wmJSBUA1PtjhRmYOyk+poiw/c7rEx9okl2zFRqivG22IHNO03TsQ3NvpLK
	RygIbfaWvaDwwTo0zbrdkcAfW3VlIlCbAWwDmKOJYU/2FVeHuxba3IQrXeS6H1MdJyxedOO53Qe
	hilN5FXIawT0AR+nxBZR1tQ5GrjksAJpBqDmZeRizd5LGxhprqBoPkHbXE5t+JYc4ird5NHUhD0
	l+E43vOuW5pJopZqYGhE8fbBYj
X-Received: by 2002:a17:903:2407:b0:2df:9489:83f7 with SMTP id d9443c01a7336-2e3004226bbmr9535475ad.40.1790832268070;
        Wed, 30 Sep 2026 22:24:28 -0700 (PDT)
X-Received: by 2002:a17:903:2407:b0:2df:9489:83f7 with SMTP id d9443c01a7336-2e3004226bbmr9535315ad.40.1790832267519;
        Wed, 30 Sep 2026 22:24:27 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:24:27 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 08/14] perf: Add gtrace AUX buffer trace format type
Date: Thu,  1 Oct 2026 10:52:19 +0530
Message-ID: <20261001052243.3042627-9-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX5Qdk2cK/l9QA
 m6PuYzPML0mQkuOZhUpdF9mYgRpw7+x5uD1ArvTA4I1loVr7H+RvOVG1LkFfRR/epwpqh9JIa2p
 l4nyQbiw3kLWCMh12I200yGy/NEMfVP30mConRPPk34OlRLttt1wuMaiOD9r2niJ0K9miczf9MI
 J1xh2SKcU7/XtCwlO4uIyXxmeucbh5zHSl8pPquME4ELNwyfybBJ2MQpIEG6O+ghC1QaZzO8E4G
 NuBXPQVscdEATDqI4/by0qgxI7fQbEOlUuwKPFPJMlcN2eRVj1jKCWDLZK7KlbRrCLX/2lLcaEg
 xeXkST6tYRZ47DkSol3rRV/Z2CDM4ca/gPgEog4tPklCb67T5zxJuLJp37Am9JxwcelCx7Bw36F
 Wl+m4IuXxObqUb+tD79+ot7sANbI17PEW8dDGBz4/bz2fWJi4RbZxuCHuamIJSSMpDKatTrKda7
 ZBmc4nnl01LUEfvl6IA==
X-Proofpoint-GUID: RLQWc3cqlhpKjmqr_qVAJozYTtg9lbpT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX3OChYLy+5NZy
 GYl8W2m+JnwVBDlP2PkbyKFmClkvKlGZPeH+z98/mYazwGyzRO5repB1hqdbuBjSNgx65DQIpMc
 W5p4btQQZE/HrUiAeIOofPOlXx10LWg=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abdee8d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=EjOQMhZftjg6WCmXgxIA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: RLQWc3cqlhpKjmqr_qVAJozYTtg9lbpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010021

The gtrace PMU can host trace components of different architectures and
trace protocols, so the recorded AUX data needs to carry its format as
well. Define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE for the RISC-V E-trace
format which the perf tool can use to decode the payload.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 include/uapi/linux/perf_event.h       | 5 +++++
 tools/include/uapi/linux/perf_event.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index fd10aa8d697f..2ac00a409a04 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1311,6 +1311,11 @@ enum perf_callchain_context {
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_CORESIGHT 0x0000 /* Default for backward compatibility */
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW	 0x0100 /* Raw format of the source */
 
+/* gtrace PMU AUX buffer formats */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
+#define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace format */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE	 0x0200 /* RISC-V N-Trace format */
+
 #define PERF_FLAG_FD_NO_GROUP			(1UL << 0)
 #define PERF_FLAG_FD_OUTPUT			(1UL << 1)
 #define PERF_FLAG_PID_CGROUP			(1UL << 2) /* pid=cgroup ID, per-CPU mode only */
diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index fd10aa8d697f..2ac00a409a04 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -1311,6 +1311,11 @@ enum perf_callchain_context {
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_CORESIGHT 0x0000 /* Default for backward compatibility */
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW	 0x0100 /* Raw format of the source */
 
+/* gtrace PMU AUX buffer formats */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
+#define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace format */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE	 0x0200 /* RISC-V N-Trace format */
+
 #define PERF_FLAG_FD_NO_GROUP			(1UL << 0)
 #define PERF_FLAG_FD_OUTPUT			(1UL << 1)
 #define PERF_FLAG_PID_CGROUP			(1UL << 2) /* pid=cgroup ID, per-CPU mode only */
-- 
2.43.0

