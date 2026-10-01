Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A714B2882DE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832264; cv=none; b=oPpoV4OURYXASDnP2h+m0bT4jBqXxxVY4nrEcxUxIiowQdoK9DQtnJYupMcljwJ3Guwq1BNOIZP3oXRnhuFp6vMbGK3b1ykXtl+Z2XFW9kyAW3Rr73KG5VDxa8+sXLCB0aib7Cg25vpZ2AqGbHtK+MRrhqOdtNVF1c9wD0MenrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832264; c=relaxed/simple;
	bh=euMqrjs3Ok1RQstrE3go1uxqpq1aFvLm8cFQF/ngnzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JdJzL1zlfI7wuO4LkCOF6ufPHNNqJ9PWiwg2iq4XK7rjPKuImJKQdBCrdHRPHwAfAUlF4mrqHa8cDzKspirqPBEGiv2XecKjYRIJnGLvln0KD2/x1Sm8D3r0EwPX7ad6C8VGu42CnrYh1RC2NGO7MFX35mQactHafw1ple7qqUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mAgcg8bt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ODXTofwF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mAgcg8bt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ODXTofwF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913ho3u544896
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 05:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AsfNws2Wxi6
	oDbK2RrL2JLATMl8Lm+Wmiu7rIwOVrBI=; b=mAgcg8btd9GAMeC33eHJTLWPvT7
	8ScBZdWEZqje0FxgWLuvKL5XYJkrWL4TUNgMxU7mcP9FjsD8WL6CgOAFFQE7Ihio
	rb5h/QJ0eivFmYph935XH3qYd5UlwCVabC1K9m19ANzqYZilXkIkYW3j65rut5hC
	ioedY3qiX/TqWNd+BK2aanlLZ1h347KCpFfwP+7Q6E4Gmp0iPPJM+rI5zuHwc1DH
	0/3yxuD2hxv6LOfoDZO09jKHrJgL+4s7YS/hJpdFxQe1RZyVP4Ek7dty66HzsLN0
	YqSJoTmA/dyoM0esjK42YGg7e7KMQkNr9KSEJ/LzXjIREMetlEkVWp5bCxQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wctcgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:24:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d9336581a2so90657475ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832261; x=1791437061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsfNws2Wxi6oDbK2RrL2JLATMl8Lm+Wmiu7rIwOVrBI=;
        b=ODXTofwFcf0m1teZuXs4nIlRP5rVDX39HuJOvh8GFPjC8hJcjSp3CFZ/+KHwRV7nlV
         w/6wjDubPDcNg2LLQWfqULd7Tt6kzru3lv/J5TyYv1qikjzI9PUEzfb9ahEtQnFpq4g8
         9vquaHRZ6/YawvIDWUR2tsZUkeCufGKsWORxNGmkEXw9Njlx8IvP3u8Cj7t6ZgFeYy6f
         OrCiKGTNo+kibXz5GzuZ86lbZHPTzfyWe464poBFQtA/AWl7F6XnYrXB5Vlw9PgpBR2K
         qGAfGpd1ROAzUCqS+wkYRN8la+LJEUg3gmmxR1Rqf4wf+vv4hjGhxS4Lyymw4Xs5roi7
         tgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832261; x=1791437061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AsfNws2Wxi6oDbK2RrL2JLATMl8Lm+Wmiu7rIwOVrBI=;
        b=DIFK4YMrmIAlqLruNLDUGFzGNsm/nlEaBe9uz6VGRwuOO4hPYmurOhooyW0JlD/aEz
         +iscdZOIy0oGpcqGrYhsYSTkVJAi2Ey+XIr/rPFU1c4fRkTkHXA2JDaClY7o/ZpH27YA
         +DDujy3RHMCAi80JgfMccvgev5H/Ks9UJow+WQ5rqfl1JxcBpMUUxDstjfj0T/zs6aZP
         8i4ZXimzcsUziVmueULCaHCwxTHcy3/7a3nTiFHGGcSQcb1atBgdyxpqmg6Ns3AKYAOY
         4aWOCBIkYVdc50Sz5lZemfYBEhTNdSoloE8llZz3+hppO3H5AOCvA4/zrCJMtnX0SSbm
         /kdg==
X-Forwarded-Encrypted: i=1; AKwUvBxeSqAJSqkW7eLllONdUhoEqaFXqTQNs/fsDkTNvYPLUC5iES1b2LuS8kZmLH+M+C22nvpJycuuMp2fnFA=@vger.kernel.org
X-Gm-Message-State: AFq9FYISLe8r4kqan3yn0EHaGtp29NLD/yIqNjqMMbTzaENw081q6PdS
	FGn7BDNwLR5X09P6TE8pyjti2t3wczYKT1ot7vQSn89z1nYm3ALE5ECOiX3Q34BdHi4K/Qk0Hsi
	CRbWSzjZDIm3XTdhevdA6MchoxFb+OVbbDz4qyQduyMQ3juVLWuuOhJbyxPFk0w28mpg=
X-Gm-Gg: AYBFou1YvQjk4ePSX3Vk3iZnTvSh6TmxGUDNHTIW5vw+sE4fLMznNz3Ltr+VZaLRtCP
	YHnj4ziW14doykzDUPyNXqt0Kvwep8ipkOOREySZW1/n5KqmhVfI0iX3Czm/StkZHE1Yy4RLLLa
	b+uVKDiXh+SZmLrWAnTRajAkoNF0IYRzpitvyWanlLN+jWrbj1Gjmw8NiDyb54EffUud/P8GXha
	P+dC2yNL2X1QQS2VT5IdE8zBkiPYeGf9+4vNmpuVJZVWDtrkd3nlOq+Infy1DhWYM6bUB0qjzw6
	BRBU1ibbvuEhzkD/Tnlng41CATCDQ7IQgWRj4FueJky96UdkpeqsV5bQIoJMlgAvu8J/CSHdQLO
	p5thEu6Y1QFP2ubW67HoywbRfxgq1Lp6ZSMvLdD5vx09Fg9zc3lnwMeQ92OFCiHl+W4A1MrE8k9
	Xq+V65ZgkdOW+MHL5MUBPZF8HU
X-Received: by 2002:a17:903:234a:b0:2dd:c132:dc01 with SMTP id d9443c01a7336-2e2e49fe5c6mr25551655ad.46.1790832260431;
        Wed, 30 Sep 2026 22:24:20 -0700 (PDT)
X-Received: by 2002:a17:903:234a:b0:2dd:c132:dc01 with SMTP id d9443c01a7336-2e2e49fe5c6mr25551455ad.46.1790832259877;
        Wed, 30 Sep 2026 22:24:19 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:24:19 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 07/14] gtrace: Add function to copy into perf AUX buffer
Date: Thu,  1 Oct 2026 10:52:18 +0530
Message-ID: <20261001052243.3042627-8-mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX1Kp+Bt/VUZyp
 D4eCuLFK/7LNdM5wxVriGtQmQ6FlMRHIB3/9Q5mJCWWbvFxPRzVFYKzP7ai7fTDTLhFBnGkwzON
 hhg3pyWIsntCIIxif3wiP3TelkqZJiy/Wx7bcdfc5U/IrsQ5XHQt+Vz1rb2uQlcjDdTf1MaQtpr
 Jm/ec4FDEhhfN3CRN6IDeH6d9qfApcVyS2KzeUqBV0Ht32TiI7WU/xgqbIU1uT8nuvh8zEYmBKC
 s0hlwCnnvouZQXOFOkA9NPPngk32ccoQaJLgMfjReaT5tUYq/Jp82wr8AvOAwbZUA+oBNw6o3JL
 3xLoU8lYGc8nxYcyd+OsobEDIlSpzpKIGs2Jh2wyV7UgckW9lIzF28j6yZWR0EdRAkbpjTEAcOH
 yGSydVAXk9sAteJLPPA9lfC4mom17MNowCTLRF9zVj2a5XxNY8yd/2LdWXtEca60rOoSE35vFuB
 ZaGAKI1vuKkAGJsdz7A==
X-Proofpoint-GUID: bp9F_p7NvPkekzfiPNeI950AfsqkgPNZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXyVJNNGY0vXSu
 syoAiuSCdaWYAkHZ1RCyYOsZhVdIiIMbjcDwpVjBRG1nOVFY81bBgj7ogCjFrm9AFUPg+guh2p4
 /X6hqXNj1Yz93lNpWEd3EHwHRNzpK+4=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abdee85 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=TflMzYLVq8MTiglY7lUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: bp9F_p7NvPkekzfiPNeI950AfsqkgPNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010021

From: Anup Patel <anup.patel@oss.qualcomm.com>

The RISC-V trace ramsink will need a mechanism to copy trace data
into the perf AUX buffer. Add gtrace_path_copyto_auxbuf() function
and corresponding trace driver callback copyto_auxbuf() for this
purpose.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 41 ++++++++++++++++++++++++++
 include/linux/gtrace.h                 | 24 +++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index d7f1df90aa31..acbeb3df2135 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -715,6 +715,47 @@ int gtrace_path_stop(struct gtrace_path *path)
 }
 EXPORT_SYMBOL_GPL(gtrace_path_stop);
 
+int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
+			      struct gtrace_perf_auxbuf *buf,
+			      size_t *bytes_copied, u64 *format)
+{
+	struct gtrace_comp_priv *sink = to_gtrace_comp_priv(gtrace_path_sink(path));
+	const struct gtrace_driver *gtdrv;
+	struct gtrace_component *comp;
+	struct gtrace_path_node *node;
+	int ret = -EOPNOTSUPP;
+	unsigned long flags;
+
+	/*
+	 * Copy only after every path using the sink has stopped; otherwise the
+	 * hardware may overwrite data being copied, or the same data may be copied
+	 * to aux buffer twice. The last path to stop does the copy. Holding the
+	 * sink's lock also stops another path from starting the sink before copy
+	 * completes.
+	 */
+	raw_spin_lock_irqsave(&sink->lock, flags);
+	if (sink->start_count) {
+		*bytes_copied = 0;
+		ret = 0;
+		goto out;
+	}
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+		if (!gtdrv || !gtdrv->copyto_auxbuf)
+			continue;
+
+		*bytes_copied = gtdrv->copyto_auxbuf(comp, buf, format);
+		ret = 0;
+		break;
+	}
+out:
+	raw_spin_unlock_irqrestore(&sink->lock, flags);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_copyto_auxbuf);
+
 struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode)
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index a4b99c87d250..ed0e751faa91 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -266,9 +266,30 @@ void gtrace_destroy_path(struct gtrace_path *path);
 int gtrace_path_start(struct gtrace_path *path);
 int gtrace_path_stop(struct gtrace_path *path);
 
+/**
+ * struct gtrace_perf_auxbuf - Representation of the perf AUX buffer.
+ * @length:   Size of the AUX buffer.
+ * @nr_pages: Number of pages of the AUX buffer.
+ * @base:     Start address of AUX buffer.
+ * @pos:      Position in the AUX buffer to commit traced data.
+ */
+struct gtrace_perf_auxbuf {
+	size_t length;
+	int nr_pages;
+	void *base;
+	long pos;
+};
+
+int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
+			      struct gtrace_perf_auxbuf *buf,
+			      size_t *bytes_copied, u64 *format);
+
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
+ * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The driver
+ *                 reports the PMU specific trace format of the copied data
+ *                 via @format (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK).
  * @start:         Callback to start tracing.
  * @stop:          Callback to stop tracing.
  * @probe:         Driver probe() function.
@@ -279,6 +300,9 @@ int gtrace_path_stop(struct gtrace_path *path);
  */
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
+	size_t			(*copyto_auxbuf)(struct gtrace_component *comp,
+						 struct gtrace_perf_auxbuf *buf,
+						 u64 *format);
 	int			(*start)(struct gtrace_component *comp);
 	int			(*stop)(struct gtrace_component *comp);
 	int			(*probe)(struct gtrace_component *comp);
-- 
2.43.0

