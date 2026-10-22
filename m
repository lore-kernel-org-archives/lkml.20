Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665814;
	b=jfGiMr0EDXX8tAnuR/5msXNwivXXmE+dNciB6LKfkQHA7T1/BSGuG5MH0ZK1agf4xiRL
	 ya9j2XV/ZZfk6Ro5ksL32FJjbDAQmsonHU1KEK03HUhxbORCiXGmh0/j36/344MDZpM+p
	 dGMDmibxafpqzXUc620iyV5sCWY1nMSVt59u2KFz2IScqjBdVI5WaJ4awjWyi3gyPSpDm
	 +W83HIf1LO4XpGaOGhE/hPmdPHElHGRSXPF5ceMNxONuAnxc/6BCfTdTu4M9sIbgMlSyB
	 Ui4xxjRxgciSy3JTExotlqFhPh1mF3Tsby//Gaz62mE8T0XT3Rz+KVaHdl+TOjfwHCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ov8/SovJGBxYq4ezwQthf2+dF/XG7/tdwQVejwizs6g=;
	b=Ze98m5UMWCF3XWskLKHzUPUF11BYxBZQ1WPBtRVSXKkOJujQVvmO/qLjCzhcZdvPgIXq
	 iyZ3Dcy+vqG/0Zo2deVZcDplOKk4EkD+d+0iOxWwR8/aw11uDq7hYQje0xE2nXybLSkKl
	 u1+hmnSyqrGQ+kUnIZEtytk4Zg/cz6bv3av6OpbaFDHcbWhyeL9sjtBmQvtwDSd9FIAJy
	 dRlrLkx79jS0gEbbx310f3dKym6BTgNeidK5M464GkFnsxxnNQCnn8SACcMPQhEGvcqlg
	 UYOUMQVY90YqhGbtWKc6lcOW0viAXgbt/3HRNWbMQ5UQ6K8JXs/6jhyJP0ruboVhEDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T+fQu8Sh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RiLUo4zP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB818606A325
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB818606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T+fQu8Sh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RiLUo4zP
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0E7v3116058
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ov8/SovJGBx
	Yq4ezwQthf2+dF/XG7/tdwQVejwizs6g=; b=T+fQu8ShwHVqoR+D3z8X0345Xv+
	XtlYNMbOPHN5cZmSKSWPwTEDIb+il7x8/uCLzNJA8vI6/hK1/LlbwOFSAfbAWws1
	4QznWixoglmFrIktOwNXUteYKSoMnO0KoadMI00y6vW/ISEfFpVyez5UwqcvqZUA
	37/NtlaDO5amUN40mw8I/4o8xR5yHvI2JYLIaroNCvD8fqfoRno+5EasYcHsr5iX
	fI09mdIvC9dJ1+GX/Eb9Bw9aYMAfP/wNoVtyvhcm7gsl2hbtN2/rayjYn9qlKp1U
	nqsVC7opNIDpSUkvdw7k4tvKBK+qbosHbCb6KxefUGo9G2ppMLiqvd+482A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bt5mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:43:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea63087d79so7708985ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665812; x=1793270612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ov8/SovJGBxYq4ezwQthf2+dF/XG7/tdwQVejwizs6g=;
        b=RiLUo4zP4pCqR2o0Be8wER+aftTvRuaqeYxDcQ56r/UOlGeyHRbzuTYtMuz70362mJ
         Zyq50pgh735WojgkrbTQqeHPe0+K4n2GsZFnxDMbP43MPO4IWPDuwPG65BvNAUKYf8Yc
         bqwNJEnvS9LcHP9VPjm21d6p6bq+6IJaC2Wr+1DnOyvUPMoF9tfFZe2vhBgUXzyRAIXu
         QdrXf2fg6v/NbsK8Wr+LTiiwSJSzDdpOB7ic4PlJtTiaLVGgMVn19IyZxKOmbqdvm83U
         +8urv7VMEVCcJ6eCU3diXefQAyyhgHMW6cE7lGWC/ogc7T4jO+UnjSbL8SNwSTSdj3c0
         NV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665812; x=1793270612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ov8/SovJGBxYq4ezwQthf2+dF/XG7/tdwQVejwizs6g=;
        b=aNOmHIkIPAZa/B4NdN9ROdafU+ml7cei+z+SSvu6aB1BhqTHSzku3w+b3DQNpPwwYi
         bRyOVPiEbVnxUG2O3I4sSk56+ruZ93KYLc6IC9yX/9hGHA89Fw+Q8ipOlVpBvY1O+zQP
         92xvu8ZarQxTNCUPYZvXHmGtAeGdy6QLUEvl7tIG9p7611iiRC8ul7NitVvk8FwAdjLk
         e6LfDron4ZFKMeZJCfZKB5Pa7mVHhoz18H4wmDd4gbexYqYey9EbIYpsU0uSKJCqbksK
         /z5WTofN7gpzoiJKGubUsZFe6l7uLiL4AoXPm6ko2swKDz6mD29drKltXArNhYJjteV/
         A8+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzNwyfT/y/Hmd+lWiNQKQbYDb6/q9CSVQxHewS2OjD0+mzRzW8gxSm7va8Mm4oU6rhexoQYQ1o2yr6XWOI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRvyT8iicwQxdsvKHwt+/rPRCrOhd8Kh7HbcxCjShoo4HdX6PY
	MoiHJDB2Sl7atvheWnAZYmGptHclEUapGu9IldKngPYo5PFQ2RLQGRP+X4rNbJQveUepFHN5JuW
	cqW60OTw4TqbIsIkwneYFEBLnSX8T1fBeJTFf7JTOd4ICRFmwASWHvQfhTPuHDHJTMfw=
X-Gm-Gg: AYBFou1dGkYAyip9MXdyTajJ/TNUE/HxqI0taUpYxV9BYiySF0YvJ57x3/Itq11KFnO
	RR8I9Vo5yy3nObLW3M4z/0PRxEhKVi9MS2HX8RRfajtGsV0+eqVAyPDGdaC9KNvyOID7phrvRwd
	7te6bb3q21E3BC7CdoEB8K3eAWR8NZ4aWQEZ+8UUC4QV7KM1M1Nae1FwH2ra94pWHAPiWw0aAVR
	JfwoqlEowBek8gcr+LKPVIOUjjIk3X1v1Tw/IZKCOIJd48mVBzuSnyxPIIrE2b2Ea6O9h31Ntqm
	mdr89+cc0bemhQVe2XL403WWQLtKE8/4dpLmqQwa0gBMfqZSi3FU5j3cccSC7sST6n5inKYqn/Q
	lCZfuhWvLqn7N3i75S4O87cmOU1bS
X-Received: by 2002:a17:902:d4c5:b0:2e8:31ef:d24 with SMTP id d9443c01a7336-2ea43e0abe1mr36051435ad.38.1792665811671;
        Thu, 22 Oct 2026 03:43:31 -0700 (PDT)
X-Received: by 2002:a17:902:d4c5:b0:2e8:31ef:d24 with SMTP id d9443c01a7336-2ea43e0abe1mr36051325ad.38.1792665811201;
        Thu, 22 Oct 2026 03:43:31 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43b53dsm22327565ad.39.2026.10.22.03.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:43:30 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v1 1/2] phy: qcom: qmp-combo: Add PM suspend/resume callbacks
Date: Thu, 22 Oct 2026 16:13:20 +0530
Message-Id: <20261022104321.306679-2-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
References: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfXzAhgCthS1ywL
 UlLZ5ZP6SZiEnMTB0yaNz3HsWXRpypnIhYOXtloNtH9WnA9Kpc2kmI8Zsusf4AcMOp8YssKTfda
 UppTJHgEhkLDLA0sO/OHxWIekLtywOc=
X-Proofpoint-GUID: kBn6XvpyGZEMc9OcDYLo09IArIOBteQU
X-Proofpoint-ORIG-GUID: kBn6XvpyGZEMc9OcDYLo09IArIOBteQU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX8c3TYGzWVigK
 8VBqWTTqzqP0fKvGSwhsohX+FIYcZebCwYH+8CFMzYYRO9cCLMB3OZtn4cqfD+POIIWBpk7tx/Q
 TSCQj6mHRxjPL6Bc3XHEf7YaxmZ9U48GZZR5/SfWRdTI5vXKoN/rPeSQxRloa+ki/M8ikbWgE2D
 K8+HA5Nb3xeqCNDe8871Ul3aom9C4LO1DfokSY5qILz4PBv7hqvEZUWAvJQf0ST3ZxA2YUGcyje
 vVB2g2253Jb4XMyj7xQQzkFC8iJJ9GAKSNCW+bA+02WhdbJHplmmks+QSqrAx56jK3AhFfPF4j+
 uVk43uyWz+dey54M91uSsQbjdWGTZjkydJETxK9Od3CzlQRpFyNs+VaE2LRK2Q3NuWOhCTxGqm4
 VXptsLQvr8d5YLFjONIwaRIAfEwJTA==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9e8d4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=mvgpHXA9jrGi6IPTKH8A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220042

Currently when we perform system suspend, the phy clocks aren't
turned off leading to power leakage. Prevent this by adding PM
suspend/resume callbacks for the qmp-combo-phy which toggles
clocks on/off correspondingly.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index c39ced168d03..f624195c9b84 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4463,9 +4463,26 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused qmp_combo_pm_suspend(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return qmp_combo_runtime_suspend(dev);
+}
+
+static int __maybe_unused qmp_combo_pm_resume(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return qmp_combo_runtime_resume(dev);
+}
+
 static const struct dev_pm_ops qmp_combo_pm_ops = {
 	SET_RUNTIME_PM_OPS(qmp_combo_runtime_suspend,
 			   qmp_combo_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(qmp_combo_pm_suspend, qmp_combo_pm_resume)
 };
 
 static int qmp_combo_reset_init(struct qmp_combo *qmp)
-- 
2.34.1

