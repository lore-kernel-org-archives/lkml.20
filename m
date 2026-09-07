Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C346442393
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770319; cv=none; b=Fy2igL1eEIVTGy0mRdFTOrMp366MK42slvbIIR4LadJ03TbTSTia6JIhL2hUDaq+VWaT8Jo0NzaewKWo/C47lCd8prO51nhtuY1Ar8oSwtokpk6RxGqEPTaMPRdsu54R8BN1TOFv1LmKEw/boP/Jp+ACexbUIauAHTj9gPG2qgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770319; c=relaxed/simple;
	bh=S5Rg1wd2Oc8SEJcKALyOC0R4mCPo46zXktRi4uyJdmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AaHXe8XGOxG60hqKv5kJUqiCseLFbaaErxS0FBjah319XMerlA2F8caDWZe4OZkrT6I8+3gS7ylyaLBLwrCiBV1R/EqCR9QYzh+Z/F7MbVYF0A/+1HCkw0sdb/JJeTZtICA3xhmpau35QHDCY7+HZghfKgn72OsigHJa3umeVdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKQ+fM+f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V0XN7yjD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKQ+fM+f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V0XN7yjD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777L6d3352428
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CKSOhfN5g4f
	/KlUyb51hKqxizTlCn7d1Bpl6LyJMzEY=; b=EKQ+fM+fJBNrNwDgLg3cFjxzFWu
	tc04ie/Gl6YCAVttXrzuQ7TZxFYto3CKJVo/6TDaOfS9uhEWn6pBPflmhe3JjdwT
	l0jsUYGxCDDBoLtNq/QtLHBfzvxMhHM22MocQdU8wL3Fqm5IIsBZBJp9vwECs5Zv
	rf2NjDKADfCZCwchUAADKX0OkQKF8088r/xBV67qqp6eqZuRIyAxVM9ZwuwqgbBv
	a4TTYZdNoixlzk3my1HUdoBEKEGkFWl+RsQ2ETsxKkk0Ywasq7qgbb9c77irPOLN
	hYV7e/D3huvoxJw5u2ONwYmCJGgdos+EyvKHqi/9P05pPUDv5xgE2F5ce9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66gv0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:38:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5fc4c7e9so310272985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770314; x=1789375114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKSOhfN5g4f/KlUyb51hKqxizTlCn7d1Bpl6LyJMzEY=;
        b=V0XN7yjDKuIiMqgYQm4qFHaQKdq+GDR5SbQEcYvmNPGVSdSOfeVa+SQr0IREAd0Ibs
         AP1ppN8iHwAfcG6/MBmxkNr+2AYmLensPIsiWsE1rcsk6XtFBkUeqCyudOJgmd9pJJ1U
         zS9trn9EJo14p+dyeYf667IEIZSJldJWUa4iiTIoaaDGMFLzh1XE4RFUP7ND7YCqROcX
         qWKjcUeCx1LuJo/3JSnD/bF/HNfOfHpkUnHCXrNF2ZKyKjIRQxELAJtykZTE+KPbLP5M
         gjRmjtgruHEUR6NFR5j4080TYRUq041Nc1rDqXkROf11mfKKBztkUBv5BYkfO9L5tZsT
         X0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770314; x=1789375114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKSOhfN5g4f/KlUyb51hKqxizTlCn7d1Bpl6LyJMzEY=;
        b=eZwVqechZpnGmSBKuRMOFzOxCsqrHtKdKQ0jNsUxiBWm7+hXMzlGwFVp5XJ6W/OYbZ
         sgXu3Fb6ItaYLs6WJ6ekVVWzjSRznd6oyq4e8malbXSXN+Sqzt1KPcc1NlsvolD4AIT8
         FVHz38ACng6WDWiw4HmfsZpL/Lu4ar4YfacxNXlxTxNmMX5M9l7oozjqwAwU7D4njzyr
         zJ8nBM/QzecD5VE3YUiEIV/pc/gwvsM36sCfucV0E7ycvsZi2d63P2vM+TwtWmg4qZMz
         JvBE8zbwLzq+gE+djLxll2s73/tfxSslDmF42oJRPx/fxvHUwESAriHUiste9NsZVFYQ
         Dnnw==
X-Forwarded-Encrypted: i=1; AKwUvBz83QLSPNP0FKaKEr1dNKtQdh0T+Dj01rNnQNl18DhBol2xl7GT6VwtUQyiyV7i7vKaiszgLzjfSY/gYwM=@vger.kernel.org
X-Gm-Message-State: AFuF++nprjJjNihY7OMZjGCyFZud8gPLl5Sgr2WpO+clBAjOCY69SrMf
	Yd2q683KDnOGq98xGvQqcdIgLA0DpIU2oZH4v9gJlgPrUXTptoX13HmxXeXzsKBJstZ7bn9uI6m
	d1/gs5FUF48kYkzt5GOMX9mvkBep0Mk0JnHJonCjG69DbsArS3HYfXH5ZJqamveD6kwQ=
X-Gm-Gg: AYBFou1xnikIquwxCxheiQI9AJfWlbLCU2luWDGhHKnZxS9ekzZPeMKprefkDKwmCNj
	0HB6QxtxACXYXDEacFHYyEgI9z41xxPlM18JJMwd5hYVfvwNJ4+Y/W2RKreKeKw4BN4XXccmKAO
	5G1Un24KXySQCmLQUV2zIPkj4VaSOaGuEmBqPE6f+zBOV4pma/DXg75ZfvUXZvN2B4p80cXSFvH
	j4Ae7791L4yesFtemwrMtafICGE+mR3nANHwuECMJfHVzaDyktCPA8XpxLZTV1vZ2s6vtlYcBs5
	g/zL8xZzuFiD6ZxHN3DoGfPU3npQJ0Jf7bLUShCymTXHwq7cfhF4WfyLCB+RJHSqZvZj//DPOxi
	Ppndo/cmgxnoV5A==
X-Received: by 2002:a05:620a:56d:b0:937:6772:d8d with SMTP id af79cd13be357-939804030ecmr1377322085a.20.1788770314190;
        Mon, 07 Sep 2026 01:38:34 -0700 (PDT)
X-Received: by 2002:a05:620a:56d:b0:937:6772:d8d with SMTP id af79cd13be357-939804030ecmr1377319885a.20.1788770313688;
        Mon, 07 Sep 2026 01:38:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 05/11] ASoC: SDCA: add populate_function hw_op for DT function data
Date: Mon,  7 Sep 2026 09:37:19 +0100
Message-ID: <20260907083727.733705-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e780b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=biI7FBfO6UU1CUG-efUA:9 a=O8hF6Hzn-FEA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: DIFvwze6LA4O7Y7rk3qAZ7MaEHOSsSBe
X-Proofpoint-ORIG-GUID: DIFvwze6LA4O7Y7rk3qAZ7MaEHOSsSBe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX/MF6pllhspVT
 R2Og/a9KOnn6PDx+Hyn+Gc48QQuukGj/xoff7YEEYlMssni79XJPTsiNWUtd0i9ZMlZCY8YszYH
 WAR0gxkVBdyOxcaae2DsMKaDfDJbsBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX7G65VMeSNtQ2
 fbWr23mdgQTHQycxQNncVFOFXHjJ8mNwHZfroHuajSBcgHrAb03YyKgHPBXcTDuHkTbU1taepdR
 AD4EfSKUlH9dw7H8k8DfsFtBcc5JlWO9ewcU0T9nT9uY1mUiFl3tCufn+xulI+qYJp67SR/dtag
 Xct9iyOg2GaMSrNXht13ESY+Tv1WIe8FRv42GTqeF76RX8o57v/gka/tOm3AaxyNBOkffnFii46
 tSkAXRI9gEBCf9a68NrYbcz9ZoVV/JxIUGx3YFVLO98IUlRW7xgug2qt8Qzxwfv6Ai97AhMfQb2
 r/ZObwnhLPgvEg8avAdOLDQPdxZSHLD53Ai1G8B7R/M2oXOv5kPt2LzSRqo8mgBtl2uWDamqVkM
 WdX6PSeOeS7gLafJL04amD/BJiSEvSuaE6IXIFomQjhB0lFTI4ZLpO088zOdt7HVq1ztRmNN24W
 rcU3BCPGW6LoASCcs3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

sdca_parse_function() walks a firmware node, but on DT there is no
DisCo node -- sdca_lookup_functions() is a no-op and the SDCA
function descriptors come with a NULL fwnode.

Add a populate_function hw_op that the class function driver falls
back to when @function->desc->node is NULL: it fills the caller-owned
sdca_function_data (entities, clusters, init_table, delays) from the
codec's static tables, matching by function type.  Leave
@function->desc alone -- the framework owns the per-instance
descriptor, so devices with more than one function of the same type
keep their per-instance SoundWire address.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_class.h           | 6 ++++++
 sound/soc/sdca/sdca_class_function.c | 9 ++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
index 3342937d09fd..3a1b6d65048f 100644
--- a/include/sound/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -26,9 +26,15 @@ struct sdca_function_data;
  *           before the class regmap is created and before the slave is
  *           ATTACHED; callers needing bus I/O must sdw_slave_wait_for_init()
  *           first.
+ * @populate_function: fill @function (entities, clusters, init_table, ...)
+ *           from static tables in place of sdca_parse_function() on
+ *           DT/non-DisCo platforms.  Must leave @function->desc alone.
+ *           Return 0 on success or a negative errno.  May be NULL.
  */
 struct sdca_class_hw_ops {
 	int (*hw_init)(struct sdw_slave *slave);
+	int (*populate_function)(struct sdw_slave *slave,
+				 struct sdca_function_data *function);
 };
 
 struct sdca_class_drv {
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 10a2b031b572..8bca88865a4d 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -329,7 +329,14 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	drv->core = core;
 	drv->function = &sdev->function;
 
-	ret = sdca_parse_function(dev, drv->function);
+	if (drv->function->desc->node) {
+		ret = sdca_parse_function(dev, drv->function);
+	} else if (core->hw_ops && core->hw_ops->populate_function) {
+		ret = core->hw_ops->populate_function(core->sdw, drv->function);
+	} else {
+		dev_err(dev, "no firmware node and no populate_function hook\n");
+		return -ENOENT;
+	}
 	if (ret)
 		return ret;
 
-- 
2.53.0

