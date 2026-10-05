Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7404948164E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204858; cv=none; b=Ekf3eUgHjW3/8klGNOrT/DPhsHWiVnBAf/VNJQJw7aGCRMPWo1qKJWfSm2CApedGv/457OhmxT8YvEZQ0/sPX8Im2nKFaudjRWGYGykgqcdC+ZjaukBCuTUf8DbimB+DljFUufBjVIC0IBx0bvutiGULPKB//mqTZougsQzHK/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204858; c=relaxed/simple;
	bh=ggi3edH2klsPzsxW2XWRtaHeVgrW9jclFLxw4x7UpQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVtXtLtZ8ysUkp9D4c1HxE7D0Gai7xFHjlwdnDxB1axcKxOSxtgejSnVrZEZaq2Uc9EgY1q3uDYM8KEPVBmPo8Nr63MQNXEXEQFywmGvDx7c3ZQks0i2eMoHVkicXLvk7UbpG4z7DnS5pffLwwrrejMjRMWxoRwemy+Oqcg9PWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DhkYmXq4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZkOVuhg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DhkYmXq4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZkOVuhg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFMkc2849244
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 12:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vVrgrn112DyIlu6tiZbiEtrGUAFwMDOUCgX
	pzhVzQV8=; b=DhkYmXq41i5fLaBJS/tNsSBH39EZTaHw1TK4m1wNF0SONUsIqPL
	F0+aZoOfVooxfz7mj8DNwu7Lv3VAaHcOg4A4Ne0+7O4F4W34F6QZ+/Ddkw5uZvmo
	ypwwpIvmbxAyrtVhUeaQWSZ11neqmsJexhxVLJdmdl6BgjOIF7ks5Z65RPFzHdze
	SLvPuZylWB66cjv4XvcvtEseqJTH2mDBCduVPlsyaX44OFMQy6a2+I5EbnL/XFe7
	idVlrTEC7ikqsnLumLbYqWqzVAJyAuPJB8ixJBgjU8aut66H6eSkyvgNdClpONnc
	IOXPQ2ye2lKCy1qLiA6jOZYkYyOIgdHc3tw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49u40fyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 12:54:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc7a6e4e1so469363485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791204855; x=1791809655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vVrgrn112DyIlu6tiZbiEtrGUAFwMDOUCgXpzhVzQV8=;
        b=BZkOVuhgs71K5Yefc3miWuh1t8YVHqKVYVl7P2oyZiCZWyXr4GssKlYMXouYYZzh66
         AVnzTj41cUUKF8niaISoENaYGfBwfBoYdvu/NwDWbIAvxngW8pm6jUoEutQOUb9EHdN3
         xjmFuFQ98pKHCOAVbS/ezKe0mQw+45zyUCEjYyBNjF1bZtld1o3hG1ijIP1ARqieObKw
         SMvGgqBixlhR0uOdnPue+8I0/t5JDQQ2Adw42fA6T07MeWTK8i33HrW+Povip/g5cccO
         hiY7dlVQ5QrB3ZS5zpJt1fLarir4VYaRc97YAhfCY5V0m8tjOIrZZMtlcpeJa8zb5kqS
         gsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791204855; x=1791809655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVrgrn112DyIlu6tiZbiEtrGUAFwMDOUCgXpzhVzQV8=;
        b=GPw17BKuvLGuGV8CbE7No9oboYyQSmc0alU2mIEOyb8LF4BvjnW98xqtclzcA1reEE
         ZheTGHwjN9bXCoB3ruSlMjqOCkJvyyukPr5OPgx7IxLtyvP+IXYnrnJeitOXCZe6sZRJ
         XLLOiN8VuYgf2OZAOLWVXMbQdMSRjB98l8InTZfpSxlhqzBCyqxXHdZlKrFabkdhNHU4
         jkzoIvEEhnoJoRHTXOOJ5Kh7zsc2S7SHZhEvZVdfMOH/KuEVJk9OFg2qy49Yd/A0F42p
         DqYYknCMMvm+9Zv5lJTnyRMeVIh1k7Vuf72YPPc7rJ7qe0Cho84EHePCOXauekSaPu9m
         uHow==
X-Forwarded-Encrypted: i=1; AKwUvBzq8BCHIPdUjpoYIiJ2GnqnHZJXQTUnd972BUFdbD4B8R+h4CPkyreA3NJnrsI4lrSZoZdWyoixo5PPmU0=@vger.kernel.org
X-Gm-Message-State: AFuF++lPSy7LCGGao0XgS5HAGkUS8aItz0fTM/KlQwP3/sawu37NSEMH
	3I6mZOm0S9pPFKECNiAIRpx+1aNHUNuTAKKr+WfJrHxCSj2/2ZOQixZCepbwbHnDeLIn/3fReXP
	lAu/IcArWIUHXLvxUPoy52OBMmCh1Ne028vag+7P96E6hfxN9OweQIdcGgLqO7veZ2k8=
X-Gm-Gg: AYBFou0cOmUnLMPmEdYLZsdA/vUivoaQrhvyfS1exBWcCSLOIzzoG8gsfiTpQpFvVzd
	0UFGZQSsYFq8pmXgMBXlp/8EtRt1gESXTDqrMjCMMeTsR8u6YT+dtyMaauJL45Q4LTY0HEG3J7B
	Lux6pAg2njnaQJwTWRvl/jh1mhyQ/ouLvZg7uZm3/cselxn0uabha2FuTjQki+84WgbvXCgnnkx
	KDf+4a6HqUZoBBzsVnBs9UFf6uicirSKHehSQaPyUIQjbQkZBSiGaIffAdSACHVeoLhrHdvUKyb
	IfKMHBw4ZtOCZUhRCcQ56YSUQaVVP2nZkViaKkMwyjCPVsnv9tWG0aagFhCZuNZwlzRW4js6MYP
	7VTtDs0aiwci1RAqYjstPWIeYTRVARRWiVeUkU4VfqSl7
X-Received: by 2002:a05:620a:4013:b0:93e:7ac8:fec6 with SMTP id af79cd13be357-93e7ac915famr259559185a.39.1791204855528;
        Mon, 05 Oct 2026 05:54:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4013:b0:93e:7ac8:fec6 with SMTP id af79cd13be357-93e7ac915famr259552885a.39.1791204854938;
        Mon, 05 Oct 2026 05:54:14 -0700 (PDT)
Received: from trex (5.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62270728sm3508733f8f.12.2026.10.05.05.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:54:14 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, andersson@kernel.org,
        mathieu.poirier@linaro.org, konrad.dybcio@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: qcom: pas: pass no resource table when the firmware has none
Date: Mon,  5 Oct 2026 14:54:00 +0200
Message-ID: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hkdxeETj6llKVagiLEd7_6r196am5xZj
X-Proofpoint-GUID: hkdxeETj6llKVagiLEd7_6r196am5xZj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MCBTYWx0ZWRfX0i3Do8550Ghm
 p/oHDK8ug7zNZoqwKFoXGS1pYvBlzXShNjvcmv2NfutYAb5EOOqy2nPZrQIvsL0t1nyqBAZWwhK
 KMT01bL4sANvda9YE8YYGfz38kpJgpQ=
X-Authority-Analysis: v=2.4 cv=LuEHWXdc c=1 sm=1 tr=0 ts=6ac39df8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nno+U714v6U58lXnMUU6PQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=GaOYwgbrjy_8eysdYG4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MCBTYWx0ZWRfXx7jqiSVP8TA4
 Uh3MvPrqbsK+8WBkajbpOu0Pj6A+JF7dTrZlb7axOLMt3qtOHEIZyIryA13Rsb5T3fnoIKH4RHQ
 PcuXw+GPNFY8LHhSenNrKj0AllFXgJiZYl6FzPi6KXMZWhm6PWdB3wLmwbqEv1gbRV7DigquFuy
 vzFW41dTYO2VOP+l9lqezqel1N/Q+IUD7kDGlmI2v1Mlv7AdizywB+D65IAgL1pwlmMlXD/Jlrx
 iqopf8wrpCftCDZ2Pv/uXFQKNtU1zEsBEzQUx4CoDh34C716mKxOO4JBYPRUymwcZKZ7ZW97GQ+
 EBgGMkEY7Fe/1wl9R+aLgTR0CO68IGZkZDR6ENtuvUOzQDFreIhylEzrGDz5GkztBD74uYwBrqM
 eW1L6SXRjFYHTPTuX/RhVSEVTSjdhe9aLZ524m1PhoWo8RdhiUBSjl++HaMoDoZyfH3SiAiXsNG
 0J1CZy77JoacghNJ0KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050050

The firmware resource table is passed to the PAS backend even when the
firmware carries none. This only works on the first boot, while the
cached pointer and its size are both zero.

Stopping the remote processor, or failing to start it, frees the cached
table and clears the pointer but leaves the size set. The next start
then pairs a NULL table with a non-zero size.

The SCM backend substitutes an empty table and hides the problem. The
TEE backend copies from the NULL pointer:

  remoteproc remoteproc2: powering up cdsp
  pc : __pi_memcpy_generic+0x110/0x22c
  lr : qcom_pas_tee_get_rsc_table+0xf4/0x25c
  Call trace:
   __pi_memcpy_generic+0x110/0x22c (P)
   qcom_pas_get_rsc_table+0x38/0x60
   qcom_pas_parse_firmware+0xa0/0x100
   rproc_boot+0x2d4/0x380
   state_store+0x40/0x100

Fixes: a4584bff63c8 ("remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..e871e03ba794 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -463,7 +463,7 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
 	struct resource_table *table = NULL;
 	size_t output_rt_size;
 	void *output_rt;
-	size_t table_sz;
+	size_t table_sz = 0;
 	int ret;
 
 	ret = qcom_register_dump_segments(rproc, fw);
@@ -476,11 +476,12 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
 		return 0;
 
 	ret = rproc_elf_load_rsc_table(rproc, fw);
-	if (ret)
+	if (ret) {
 		dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
-
-	table = rproc->table_ptr;
-	table_sz = rproc->table_sz;
+	} else {
+		table = rproc->table_ptr;
+		table_sz = rproc->table_sz;
+	}
 
 	/*
 	 * The resources consumed by Qualcomm remote processors fall into two categories:
-- 
2.54.0

