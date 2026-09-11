Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BE4233134
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107746; cv=none; b=ZdlNsyrrp97F/ahanPcYciq04AxLH32wI94aVcRoUA5hDW5VtGoIhFngNoNbPxs/cZHZGEiGdNcaDsZEuvJd5a3Us5PeMK6lm/SP17oyflhpGqE59YQVIXawPV+SMfP+L/0z7J8gv7JkjqkejnOmWcM/f+MqkTUaX1I+RJ4zEVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107746; c=relaxed/simple;
	bh=UoS5f2EBhTJcgyOtezRR0LMksrdBR09WIq1yMgN96kw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TJr7z68rcfd4fhrTcaEmG7KecNSK15pDOuL21e1ousJBGut1zB8//Jdspey8T3ei31egskPJRHYrUB1CBXy7FAP9joVIZ1LtAbTsO039ppMuHxLBWr3M3B2Sjr6Q7B497rsA0EX4HjxfByH24Zi1LBZQqRJ9MVg6vkufcVy1yL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/O2d/Y2 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/O2d/Y2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vSqH3665102
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=amy1Wyx/W47
	khn1kptgW1d87ONaJebqc8PBAbdLfWj8=; b=Q/O2d/Y2D3PsDLJdK1S6/oAb8Ub
	wmKvkAUrsG5iyoxQQ4mxNYq2SwEaRT2KEBwZp3/4QTsGgUeOD2yH10uIHwqXXpKU
	DYYhqi7I++I9S1oH0Q1phayXekBPtctUGyeq6Oy90/X8s5H52oQyKLU60twSOpNp
	wtS2CGS4nLauq1Rv4VyTdQymR2AtsS3MITpP0fY69Qzbjv8vZvUqEUS35cG3SUwN
	xjwyeuvo+MLo7D58sbBk61PygCRPXMQoyRB4Q76z6hDD/s6x6YQFoYNNVcS9mHbc
	l+yskj2x8WhiEdCaPCWwLsJ+cfX1ehbb54DNwfuiPqf2RH3SOrMB05mYPYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q1221p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939d6c515deso90497585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789107742; x=1789712542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=amy1Wyx/W47khn1kptgW1d87ONaJebqc8PBAbdLfWj8=;
        b=n2heeMjv8D5aOJ4VdeAeYus/i5lKONdf+XaKxiWFvnmF3vDswVGVRAWUqWjXpTxKhw
         4VYEGrNXQ5QrkbHBuB9l4aQODGjt8KcW4YJ7RkEpiT+BugL0ZRqVj1x2On96f7ojilDR
         kHlk7uRcP7gEYrmVzkFZxwm7OSqGkeZzeIyWGl8uB87MRXcIJSpiBM1OnlQxGLoQejbR
         Qn7yv+LJ+mNnBEwl6b9BMvMHPBEtblqid1lOas8HqMUslC2IcQDwJLhW4H6/OUcRV48J
         NPEArKLW9pvMOhB7hm25MWE/MfJK+DWhDSI3H9Kb320zruOBqDh8CQCsIKzWdMMT+25P
         NDYg==
X-Forwarded-Encrypted: i=1; AKwUvBx80ofJoTD8A97MgNouga/gyJc3VG+HxPH4uQmr9dRVj9P2d+KngHpKZvSH0MjuHYZ5zYp4onGbu/h/s54=@vger.kernel.org
X-Gm-Message-State: AFuF++mmqlyMjcgspOTp5uzlQzmynXxvecqDWQVSIP/K8bvQzL9XwycH
	HHGLP4o/sx/FxHNYYn7a2bQ1oHQoMYczJSgvfYE2uupIkIfMRHT+uqlPKW51FweMBFEgz1YpjEY
	u1SU1lbY2Dx60i/JKhi1EwLiMoXDZWq0gZQhfoxQCuBY22IiwPtuiccNyS98ylCN9N+s=
X-Gm-Gg: AYBFou0pnTl617S2tcBUtaOdp2BPsLTj6ERiSizSaaVDc3/cFxH2cxOH6dV4/417HZG
	AMM6YitMvkJDAZtlmgNrVvT+wiPyToyTxeQt5jldxbdJ6kIsvRceUlt5CSCMWUXsnj80ure42yO
	ELA9G00sBiME289MsxPDyko1/B0yT88L8afUJXiXKr061Lk7pfUEL1Epn9+eNXkS7LGptxCI4Hv
	DPPU/LSdcG7U0O9LBTtHofN7jGQafTwywbfHFl3+meLdlu/dmGZGjPCYD4Hk9/YVFqGxB6S5S/i
	+IMp+NWYE/0srQKpuhL6RMAdLSDX9seZ4TZeT9rus2LQl0bzZ8BO+zDKAYk=
X-Received: by 2002:a05:620a:4513:b0:939:c555:efb6 with SMTP id af79cd13be357-939ea085dbdmr334589385a.12.1789107742299;
        Thu, 10 Sep 2026 23:22:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4513:b0:939:c555:efb6 with SMTP id af79cd13be357-939ea085dbdmr334585885a.12.1789107741784;
        Thu, 10 Sep 2026 23:22:21 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea60sm3681969f8f.17.2026.09.10.23.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:22:20 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH 2/8] media: qcom: camss: Add streams API hw_ops to CSID interface
Date: Fri, 11 Sep 2026 09:22:07 +0300
Message-Id: <20260911062213.195007-3-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa39e1e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=nPBgRWIF8C1TIduujCsA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfXyc34op1zz3sE
 aa7NJCtEWjVbVJsl7diJOfcb+gMZoEFo/SNi+0q7graefc73MTYm8WuAItqzAyb5AiK9QxwQFDk
 E10NtBCMiEsSEwIOQyMJ4/bu8hO7b1ms9zsjGgoQT5FruGKYlt+4c62Fqbpi9UHdQj6AMUAhurz
 T25a4ax9nowP1WTPCPKRk4x3JVAVcn+Gm2QfEJ+r4xSizZV860AP2IwjaxpertGnIC00In8vVIx
 QqwKgASkycacFAp6TDd734506B+t8fwRi2eyHvWOGzLZo6MnbY5aNMwNQ1Mpxd4pWJDWKNybsXc
 64OEDWIMnfNVp3X+L/jHwu4ZKA3CPQ1Y4EXUmpg/YLZYTkLbdFakgHUUdUIXVklNZYMmOvpH1YV
 4GTCLIuertb5L2A/py70XHMaNxhWgZNJlA47sWjNeou+14hC3noQFkJWvdlUwbR2xo7qih+GWAk
 JZqaSYWOP/dpNzRAcmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX2toylJ4fVFY6
 fpnuZA2wxgOi6ORYlxR6NGQ+cnTy4fJg48PS/yba36sxBBLi4zyIHnIUb8fGFGK6j0rIVdbzbYQ
 Z+xeSU8gmnDoo7qn11+UlUCDJpg+OM0=
X-Proofpoint-GUID: 9z1QoEyn5NCwocXJWSwsCYhvgFIn8XwN
X-Proofpoint-ORIG-GUID: 9z1QoEyn5NCwocXJWSwsCYhvgFIn8XwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110086

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Add configure_rx/enable_stream/disable_stream to struct csid_hw_ops:
per-stream hardware operations needed to support the V4L2 subdev
streams API, where the CSID Rx front-end is configured once
independently of the per-stream RDI programming.

No functional change: these are new optional hw_ops entries, not yet
implemented by any backend or called by any code path.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid.h    | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac..90ee611b9092 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -74,6 +74,25 @@ struct csid_phy_config {
 
 struct csid_device;
 
+/*
+ * struct csid_hw_ops - CSID hardware version specific operations
+ *
+ * configure_stream() is the legacy (non-streams-API) path and is mutually
+ * exclusive with enable_stream()/disable_stream() - a given CSID instance
+ * uses one family or the other, chosen by streams_enable.
+ *
+ * stream_id, as passed to enable_stream()/disable_stream(), is a hardware
+ * RDI/PIX port index in [0, MSM_CSID_MAX_SRC_STREAMS). It is currently
+ * always equal to pad - MSM_CSID_PAD_FIRST_SRC (multi-pad, 1:1
+ * pad-to-port mapping).
+ *
+ * configure_rx() is called once, on the transition from zero to non-zero
+ * active sink streams, strictly before the first enable_stream() call.
+ * enable_stream()/disable_stream() calls are always made under the
+ * subdev's active-state lock (core-enforced via
+ * v4l2_subdev_enable_streams()/disable_streams()), so hw_ops
+ * implementations don't need their own serialization.
+ */
 struct csid_hw_ops {
 	/*
 	 * configure_stream - Configures and starts CSID input stream
@@ -81,6 +100,30 @@ struct csid_hw_ops {
 	 */
 	void (*configure_stream)(struct csid_device *csid, u8 enable);
 
+	/*
+	 * configure_rx - Configure the CSID Rx front-end
+	 * @csid: CSID device
+	 *
+	 * Called once, when the first stream is enabled.
+	 */
+	void (*configure_rx)(struct csid_device *csid);
+
+	/*
+	 * enable_stream - Enable a single CSID output stream
+	 * @csid: CSID device
+	 * @stream_id: stream id to enable
+	 * @vc: virtual channel to program
+	 * @dt: data type to program
+	 */
+	void (*enable_stream)(struct csid_device *csid, u32 stream_id, u8 vc, u8 dt);
+
+	/*
+	 * disable_stream - Disable a single CSID output stream
+	 * @csid: CSID device
+	 * @stream_id: stream id to disable
+	 */
+	void (*disable_stream)(struct csid_device *csid, u32 stream_id);
+
 	/*
 	 * configure_testgen_pattern - Validates and configures output pattern mode
 	 * of test pattern generator
-- 
2.34.1

