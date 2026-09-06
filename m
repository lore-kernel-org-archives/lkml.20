Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5816381EA8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 02:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788662351; cv=none; b=h/pzuKwxoV9yMCmNhNbLnoSTBMwHh8BGz0cV64Cwj4GOfzjo/x8sbEwx2BOrB1cJtiS7FXnJE3xGVmNPYCjK/MMMPqw6IwJJ7Jn8ze3jPxlixJYwLDD0i7/+GcQiKmR2qSlbZV3HKl5QiqS+VWpm2vgdOWz0pAcv2ptt10sgQcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788662351; c=relaxed/simple;
	bh=SVGTLKUb30Lm/RYwYH+hHVl6Tj5Iof58VpK34Deo4Bk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=o/N8fkUNF1Ux/xOsjZ9fLH6ffoSianqC/G2zOwNGqpsp0Z120opHJI0WfRYXUuQoPDcxJPnoQ/ZtNkFpG3krDQ9yEJ77eup7kRqtV4Rl0VcDubvg52OTGHejSwjR6ZfJ6IaqqyzI8Kf31VHPg1e2hVZb4JBqZp42TEOmTjjrVik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K7S6ifwe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OSZ/JvBs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K7S6ifwe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OSZ/JvBs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685NxtvB3653256
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 02:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=83/rkrL8x/Eru50N669+UN
	QbQcvXfJGu2hrdeI27dEo=; b=K7S6ifwegAFOafmYG3TtaGlYFoO7z1UyQfKu0y
	BZsGejngg3H7+j0liNL18sJsjT8oY53DSrRHyQ8WSH/VmRnFsmo/sn7sTgGjRQt3
	8UordHU/tmACle93Wy22ZOCTFoO4AELU4ZjTOhyHnD8qTVv11OOvHuL/1urjiM/P
	osZidvsXEXI1ohc4PT2EXR1U7Xux4qhm4YZg+ypxvyEmhAFD+Ii0bbtfQdqq9HH0
	3Dy72Lkwlge5qMf5KafiaVZh9FX0Lp1eSUxGd8y7nL7xU/JJ2qCL+BR6WDEge4In
	vJA0D0i2hqcTZyOU//05rJWinVNNxCCDktWvRzebYL80wgaQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhjp8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 02:39:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c1cc5206so3050477a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 19:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788662347; x=1789267147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=83/rkrL8x/Eru50N669+UNQbQcvXfJGu2hrdeI27dEo=;
        b=OSZ/JvBs5D0Um1epSpQHU9ML3QpUxhy5faisZgdBVhTute4uud1o4uFgD1KQBbkI9m
         62qjbeLEXUFuO0fFMIS1oSmpegJOmaxlv6v27ih5Ek72K+l3MkcmOBSzHhAytmFpGGQO
         OvcCh9J//oMX9JKNH+cblYpGObPAenhyVcwa6BSulQSbPwDz+4enST4oelootRz7tXOu
         K28xDb/frVg9XDUqHc2N+vvqI4UdVwVQBKmRLdQFCDY3HIfJnxj8uBAdGJFpGUkZA4jm
         gmYVQdsQO5khPZyziYnF2wSQzcCf9HjxI5qozMD6dSrmzCenyY89yH6od7uShRjQakO0
         KqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788662347; x=1789267147;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=83/rkrL8x/Eru50N669+UNQbQcvXfJGu2hrdeI27dEo=;
        b=BQCpuaE8cGCHcNhqQnljt/Yv96N4bXuhYsgIM/G67KANJGkVmtC8PwZqPMcI8XpD8z
         Oso5NHer29CbsUcOd8SCupNh53YyP1puA4kQt+FbJwI9vkVrS733GItH1Y2++382rvUV
         tM6Hhj/NVgOU1+6j0IMb5d9gLgm9uX1n4I9hhKp6TD0+68hZNEr8cPbkCQOAwJlrGXLZ
         wjBFz/HFj/kVe4mkMqQuE9JjuNakL7HPlTY5SyUD2Gu2ienMMBEuKresSsZWfbChPUpr
         giqZ3E+xweyem4xKkubIJJKv2h1qp91hU7ChoEJZlcu3Z9QIKcPjBDWpQob+MCRcpTKf
         nboQ==
X-Gm-Message-State: AFuF++kGR8GPIvzpxJDgB47/VK1mOm6PMc/iTFykIcwe3l62UK0v7uw5
	5nhb2hOG0xiIYWSf0HEwpNxbcyO93AWtz1+NXwfjrXGAID6mnKEZg4fn9uOqb10Y7/KAmBMSJ+v
	0eayhjaiK4nBpquh3j/qFE/T9bbbgtvKf6zJhQhE85Rl370CmyMIOGrjIsaBRQka+7ZrK7ZBC+2
	4=
X-Gm-Gg: AYBFou3ENB9PoTp7FAlHrkQvwmlzVY8+Y4pJqH8BvtrPQVyOLw/7gcp4qIkyi2F0TNA
	NmtlPP6lK8JLbpA4Ykt2XIRqSvpD4qrm23x7wZmwF4cAEqEyUJOECb844Ll+XS7GeioR0y1vfJV
	UdP6PJKrAAlPs8ofQDPSldlUIyKOSu9ceagCY771NrDzbWpZY6/Hln0j69sATyehWFps4/CWU5C
	A4B1/6JGjDj4GyFTC9Tw+QK3vfQQk7Bly2AokLRfcSnAR+sU6PXV5ThGkl7rqgMNhTyWu3tws5p
	YecwONYcHETkDrwkR7Bs4Sk/fXQXkYlBKxZDIaUW8zRntS/6bSM17zN46WJ+z1+FJmsqO0hT3SL
	UmyzaoUAO7BifGdMBkdu8IbR9YZVRTVHDkQTLy9rySZHTQxU6
X-Received: by 2002:a05:6a20:cfa2:b0:3d1:c0e2:936b with SMTP id adf61e73a8af0-3da39d0cfd9mr26157677637.7.1788662347504;
        Sat, 05 Sep 2026 19:39:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:cfa2:b0:3d1:c0e2:936b with SMTP id adf61e73a8af0-3da39d0cfd9mr26157626637.7.1788662347044;
        Sat, 05 Sep 2026 19:39:07 -0700 (PDT)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm8951234c88.8.2026.09.05.19.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 19:39:06 -0700 (PDT)
From: Brian Cain <brian.cain@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org
Cc: sid.manning@oss.qualcomm.com, peterz@infradead.org,
        pierrick.bouvier@oss.qualcomm.com, linux-hexagon@vger.kernel.org,
        paulmck@kernel.org, Brian Cain <brian.cain@oss.qualcomm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>
Subject: [PATCH] smp: align struct __call_single_node to 8 bytes
Date: Sat,  5 Sep 2026 19:39:05 -0700
Message-Id: <20260906023905.2517725-1-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1iALfwDj--qFLrsxz06U_yx_8Jev-sWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDAyNSBTYWx0ZWRfX38c0zLUwQybF
 1b9ZRPdxKzAqPMU9CnuCv04wFBzM6zUOCXgq/VeAeA+FwEXxST9Vz8YhGYOVNGjGebvcX+RlXOC
 CX40CJzNWGD5u/41VqQDzPfUpRgiukLTLPbXkYfvSoA1tX+O0sYLwlHYT3+2OUqYMiq3QaB3AHR
 +9nOt2Mtd0crTLPwXw/0g8QcPLP40YRcTkC2csqWG7MgMy+BEaCF6odt/u5rpuZRHxJ53MLUwdi
 Q2me8xGQz97lzt+ZN3oxLUE7hiNkREvwku6+Phn2AULHLYcwyJsvy0fYQradN3n3F8JAXmWRGQb
 OydVoT+qbttvLGMdz8flHUlJ/ROEa2n98qp6qEogiry/La0ms9Kv0IQvKSYOqfkqaouVy0Ppc96
 WyYh57gn9p1iCOmI6rzZXZ/tNsC9SaOGLGVO2lcnV8yXJUjgHFX/kNqB+PQrFXVNSMToOPHFg7U
 1dkwXv8Bp5bwxEydR+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDAyNSBTYWx0ZWRfX1+4Dn20RtfAH
 dM1OnW6XpZH4dO9aq3MMc4xdT0h86qw17FJOWH3s/Aek/tDvdy9okVrAQWjtE81NXkGCZVlU1b9
 aHN3yicQekjlxnB179etS4vIQTjTFlA=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9cd24c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K8hMu20Jjl3dzlJuOMsA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 1iALfwDj--qFLrsxz06U_yx_8Jev-sWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060025

Consumers walking call_single_queue cast each node to call_single_data_t
and, given that type's declared over-alignment, the compiler may load
llist.next and u_flags as one naturally aligned double word.  Embedders
such as task_struct::wake_entry only guarantee pointer alignment, which
faults on strict-alignment 32-bit architectures like hexagon.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-hexagon@vger.kernel.org
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

