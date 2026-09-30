Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9C33F4858
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750415; cv=none; b=SPrA9MMAlFuPcEZWNj8IQumLXs5BLGp1io2OEMvmaoc1rEIWm06eb6KpEzzvsfOHRs20yVBIYs8hz3zJk7o/gXBz73YN3aSdgqpjyLvLK/5W8ICBFAA00EhdtWIC07kiiqi2pA5YzDJYGeL9Hp2x+u8+3Dv4SKY1iWd8ynHywiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750415; c=relaxed/simple;
	bh=jMjxyEeDs5Y6CJbbbYobZN/g6YT/qU/vWkkiXcZdUYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bIEF6AT5CIlziBKrhlU/68rqxnEmzG8qhJ27nmgrJGn2Q0KfSZrmbrG4cfZjqQER319+4GdaNvklwR6ufVbLVEJx/mMkKYO0DEUkztamyhzVkh0HORzE5TQwjCxC4kEsXHTxym8d/A0C5lZph/v64p2V4if1LUwU5a+qgbVynn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTXtMncV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmrQ79pd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTXtMncV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmrQ79pd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U1AcjE1264294
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s+fRCN/HDGv
	HbTVltets/a+FtP+655QYnFd7sM9T9IE=; b=cTXtMncVx8F9bZEKQ/5WPNqofvn
	H8hvw+EMPs1XuYSMyK2b1qKcaeTLGmsEBlIsDbNG7l69KFdiEf9g+p9g2ITntvP2
	1Y8Ny3t0aitLBUNCYe4ySVOaOqBDHVa7xDX4bVpJWMy78sgRwwZDHep82RBNqVDt
	y9B4xYvvAFjHip/4FT+EI4HssNnxBNm2g9ioVTs2K/tdeshhuLWmCudnC/fXvUfr
	Rca8PiE412FQA221ZWRsIm4lgo+2QejOES524WTJUW/9872Ws8/702XFj21F4iqx
	W7nIOrPBDCiSSobgfByaCo9Lt+s3bHIsMuJLWf+vMpzzPyXI9MU1p6g6c1A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rheh912-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:40:12 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so2565050c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790750412; x=1791355212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+fRCN/HDGvHbTVltets/a+FtP+655QYnFd7sM9T9IE=;
        b=gmrQ79pdFb7EiCZn+MyOpNRYJArV04TSCZzrcRDAieSp+9Ych1UkjQuf9/hQofmiFg
         hGy4MXah27Ix8Mg0ROkPp2eh90f5Nnm4TGRKIP3LBfHWJY7HuZy/ICF03FVi4ParpGA5
         4Wsh6enmVzereBS2ocQQ0Qwm1otiK/F3xdvowvJ7YwogYViC0Z756ugdmYJ7PyB0Xu1u
         nid75vlWtNR7ozAfql6a7Sh1DkR/Djia/q5duj/Oxz6jXyKQzcLAPr5fYx/iRQqIoMh2
         01+vAlRgMzHKT/w3pbya+f1dv8f9isNvyY5yAj9dZtujlLekXy2s5DqGO5t6phA+uJ2d
         vupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750412; x=1791355212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s+fRCN/HDGvHbTVltets/a+FtP+655QYnFd7sM9T9IE=;
        b=Tvk0OjnhmmCaFFPnM4V5AloO9kKwgTpLieh4rwKfIfSwAAYQ9G/AJL/KHTwPhojITU
         3QH6ywmxUz5s+oteOveIiV5J52+aCR6Dp+xOO4UV3dTisztBfDengdngnwAqK1x3a8vU
         u7z5yOCTsoXTFQP+p5PK1QG7sSh//hClrkevojARU5WUCG/cSgd0J3wj/YtQ54QglYTY
         YCEFlvTV2NnDvL9l+nE674LoOrzjfqVGDNPHNtxrreyUeUt1LaN2FBG8G2Efr1GantTV
         eYQqZhHh8w3Eh1NVhwb7S8dY6Df7J6mRPolSeePiNiaJd1iD+vKhDdl9anBFh3OVsikp
         82lA==
X-Gm-Message-State: AFuF++lLFevZyVv7faCGhVYQvTk0N+d0PrDJIXhofo6tCKzYMiUC2Q55
	VQazPoQgNw82olnzvgc+nWfTJZpOt1IDlMueE3lXMTOKIzKRPDoYQRmF0nc5udjvSeueNLDlsq8
	hUdsybiHXisIrWxn7vB9Xf/bxhKjnlL/SJ5ViiMZ7KbyIhgml33eeGWpYSELwA9UPAHY5MWRtkA
	A=
X-Gm-Gg: AYBFou0qp+yThebkxDFknWtrb4xyjb09/32hI5pkaeTP9vcslQMYLrd8a6yX7mmyszZ
	l1Nsa5yClTl9ByY6N0cPBUgpsUSVCSbGrk1fFEzCGiezhVCRnuMPdz0wcDataiPDGN7Yl+KVmVW
	4g4d4IC+ipwto+COZySRxzwmFFCyaElfTlq+lEI5q2wquvQBcyuIzhiWUAWZHaKT5pFzh9QcSJn
	X2VMU0no6ssdrBxAkhtyOkehfPB4dsBzr1dwwNoMbx1LGnWVBvl3aMWrqDmdW+KvT6mhZg7zwUt
	3Vfa9ADjBy1hTYIQ7nmProo1ogmFc1TiPmiDE5EwbOaNZLoFw8m2bBCTT9zM+27A8pwXDulrJGU
	w7Vuojs54QhNP6mwonONaNF1QeyppB1a8L1lbGEU/ts5wvsI45FlmWiE4fr40xb5/t44AJYUdP6
	rygTA3Ha2xRUFEnUPdj9UuVaGN
X-Received: by 2002:a05:7022:eb51:10b0:143:271a:3df2 with SMTP id a92af1059eb24-14d33f3dbf2mr303338c88.44.1790750411675;
        Tue, 29 Sep 2026 23:40:11 -0700 (PDT)
X-Received: by 2002:a05:7022:eb51:10b0:143:271a:3df2 with SMTP id a92af1059eb24-14d33f3dbf2mr303315c88.44.1790750411139;
        Tue, 29 Sep 2026 23:40:11 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d08fb50f1sm2711531c88.13.2026.09.29.23.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:40:10 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-perf-users@vger.kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, jtaubepe@redhat.com, palmer@dabbelt.com,
        pjw@kernel.org, qingfang.deng@linux.dev, shuah@kernel.org,
        thecharlesjenkins@gmail.com, cp0613@linux.alibaba.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v7 8/8] MAINTAINERS: Add entry for RISC-V Debugging
Date: Wed, 30 Sep 2026 12:09:19 +0530
Message-ID: <20260930063919.608911-9-himanshu.chauhan@oss.qualcomm.com>
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
X-Proofpoint-GUID: UYfoVN_2594CnWS9wJbstmIRNnnYf1-K
X-Proofpoint-ORIG-GUID: UYfoVN_2594CnWS9wJbstmIRNnnYf1-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfXzkLjisejk+vF
 drU3TP41EllOTQlNnzbklSsF7aZgIrsDvN/SA3wuZHove9m0S6H6+8E2Q8IE3RToEZMH0DTg/4q
 yyzpiMMX9jHCZ1KzF9dTNZam2wAr78PLpDvOndGtC/KCtBU0iUCRCpq88RNRhJD6vdmZHo+8nOt
 Fc0dk/aCJXbQMqT5NBw/Vjrw9JYox6zLigLvAZtaOOUbFsEHyI14Q4WaYY3E8TNgY5VioCJD2oh
 eQG9g653VLLFbeLgMg4LwuU7vNTXeTLNl8v4sdqHVwvffJ7UkxSf1DEVvHj0hrrVFF5kg8M1b4b
 eBPGlsvAHmo8pwOWxr7KpmEaVVQ1ALRwwZb0bWZwYjU9+4wvRDQ7G3EHqxCdiOmajpNpbt6WKiq
 zeQcEs7QixBzCqVwdvlAyVULctc9XzuuhxdGOWGqF4Mpoeecl9gv/cGOk1f3+7TSewFuFF3SrdW
 O99QuAiUgSjCfjEfjRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfXwrOfLanYmZbR
 KeN229G7udko3Q1AbP7RKyo4kOu26n0YRN2sob5J7MZvRVXXX1bNZ/DJ4UqwFgXJGS8pa8LDL9k
 rmqHN3kJV/58xSxpch70uSWWBkFJLVo=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abcaecc cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=8h6Es3YqzoBqtYBhd2sA:9
 a=Fk4IpSoW4aLDllm1B1p-:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300026

Added myself as maintainer for the RISC-V inline debugging
with sdtrig extension

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 72294ddfa5b7..01631359f0ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23586,6 +23586,17 @@ F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
 F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
 F:	include/linux/mailbox/riscv-rpmi-message.h
 
+RISC-V DEBUGGING
+M:	Himanshu Chauhan <himanshu@thechauhan.dev>
+L:	linux-riscv@lists.infradead.org
+F:	arch/riscv/include/asm/hw_breakpoint.h
+F:	arch/riscv/include/asm/insn.h
+F:	arch/riscv/include/asm/perf_event.h
+F:	arch/riscv/kernel/hw_breakpoint.c
+F:	arch/riscv/kernel/perf_*
+F:	arch/riscv/lib/insn.c
+F:	drivers/perf/
+
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@kernel.org>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0

