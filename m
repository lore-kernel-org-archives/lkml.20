Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481961;
	b=Jsfk3aZb3aSFnAdko8Kphg1NAuMNZQmgtsy5OmZfIwPPhNycJP38R+Kx9C4ji+Rz3ReT
	 +3f3s9620zednm5fMvCgI2AUgm4noKY0eKtvSCLPKRDVSIjvzzcq6ME2VJvBtWZeQL/SE
	 BDqGaCJnBD0Rm0yQ5XtI+/9KP5R9ELWlVR3ObioDNFDoRfkWj1RawfP05rYPEyAkszaD1
	 nwe22Ktee1nzl7WGAxnNrKcN1TNLjB2lAUfGl4dMKcO4dS9LH1kb2CXU1DVWXmfhcx0/K
	 k3MQWwVV4i4lEAUziThLNnvOX3bfs+OaxC0fHJqMdGN6Kp5hyduQqLKMQVK0XV/2L3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481961;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1aGPUh+pH+A6f+5NezhpjcrkpA6qe52i06POTDfLDA8=;
	b=lVapp5YloUrvPHjo0JgQ5B+gPWV7fsnuR15uA8TSmX7UFXceDCfesr6fORC1zUXIVKT/
	 P5oBwSFbpKrOYm6+OyMpz7wMOgo1KJCGyHsGvaTiDTDXHh6JctKPoZF0VAleRS5zRecnV
	 Kza1UfsYs0lXI/o87xlrcYB8echSt1VahiLwwtsHJcbrcr1pHVz9gusKn64iJN+jTCcHv
	 egx60oJ/naekOaNKR2ySc6gOLGMnbuaFcYbB/GM+7R8v1sd/EmLngJxMo+fkhotnO9aer
	 yNp5UUDgB6azI4Opt5Ui1dLgeKWAXO4gpSiE9Wamau+CIvNiIUNLufKY+sc5U7HS7yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gKMzz6P7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsHUWMN2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DA560A2627
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01DA560A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gKMzz6P7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsHUWMN2
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tIHh186498
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1aGPUh+pH+A
	6f+5NezhpjcrkpA6qe52i06POTDfLDA8=; b=gKMzz6P7IWIG5jqMUbxkvExJGml
	rHJM3N2sdPQVifjUvOa7uGFo3mYydNWiNYMvCFXn5hujoTCH8qcLESQcsf2V5v9H
	6kNKyfGZYik6FW8tZ7AnvI8P4+qEO1lQQ5fV7/CuBvn2oc/lB3mkqpqT7ETsN9Ka
	9SkIvIKD99QZkkIiyOf/u/VfQXkJrk3vmHtbjgzKNfuUPzJyaObAemfPiMookj/3
	hMX+tvCbi0OhCLU51PE0MPRd5g1pxCOaSzO6p3ey+kdvbYQmRszJPiSY1xRvhpvB
	QCW3QRl4q3zzGDhhlXX9sHrU/Bab0KT0OtpiNoJcKN17kMilQ3xYEgwE4Gw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nse7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so1078210485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481959; x=1793086759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1aGPUh+pH+A6f+5NezhpjcrkpA6qe52i06POTDfLDA8=;
        b=HsHUWMN2jCJxq9CJLVeDrWzYn94f5SlC/H6zHqghtGiUGa+cqx85sTicQSJNfYj8Sj
         mTPVqB3W0GaYz7qSiPv1D0MnpOVg78ULGYvTS//9TB9qC4XL0LXMNyNR71ii1t2EvR05
         VWdUQYxwi56oBCQMKI0ixdyZhoBj2Ix3bdKApK0Eo5x/RfALIb5twKTZI7M7zCkZ+4sD
         59iBkaMwMkXEOIfMAzHdgiP5BDsKkM+f8nh4VhZcC42l5yOWDCYCy4M6Tw2NRwe/R9pd
         aVUv+gYyq+MklozfRJJKIYrgyLndSqTvj8PmAnDDacRJAcS3yP/D68bTclXRCDuBU58B
         4d+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481959; x=1793086759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1aGPUh+pH+A6f+5NezhpjcrkpA6qe52i06POTDfLDA8=;
        b=2CZzWBS+g5fVIuyfoiVOrGbNQ+Nv3GpwvzVzvWu/U9JxVRJXjSMg1pF7GehLdh6Nth
         /KwFyrk6DxoHT8s8FhB4nM8GYkn8w7Yib/bdcglk22XMwS5rsHEsoyR+pqBCwCdo4od2
         TjivhY+rEmn3c2BIjfk29OmROeJFIwui3oDvAPIJ1hCUbcFRzMsmbag5OItlK7tjEojp
         vKCnjxNjqPn4OlGf4SoVc5NCnQWDNkuzGGMlliXd3ACY33Lw1XNGbGvO8TFPPGqffxVj
         fghzLrdGYXkeVderpT/KugQuPcHj0801wejhUevHY4rQ3odpMXPp1SvlLSK4p6Q51Dtk
         aphA==
X-Forwarded-Encrypted: i=1; AKwUvBxg3g3znMhG30YRuzv7lHm9QuWzgHxI3dYRVwTM09N9pbQAGMHi08Wognm5Tl8sF5rMNiKzySn0DIdM1E0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpJ/GfBIwoUeoU5zK2UFkuaeMYyRTm9hExODIFyFHngMgPwCg5
	to/MD8Smt2ZEHDPiURRP+Lm8cTxJOa6HOw5/ONEft9Pi9eGn34Z8rhtpIrzWPxD5mcenYTUNBFm
	JQ/EYp50HRdszYFtV4EzmI505gDBa8GLPk1ouzqnyDen3TgTYLPDmWBbNpAvAJp1xOXI=
X-Gm-Gg: AYBFou2YWR9uFqp98wy91j5XVGagssCkF5AdkrTDYMxZjrWbhQNI6OeXMNYs0dkehbf
	FsJIQwvMUU7XUn1OkzpDDJ9MFmCpNhrG9ESlfn918yNfFMfq+cG+eb3Uq8KQx+8jSAPGHQkE//U
	v6Ko1lrPaEJmlKz37ul8rMikV+a5fw84Rxg87bytmrgYhcI8BL4BojxfKaLLgqk1M30kymFy7yJ
	lBiutgIito341Mbh0HywB8cMryAdQqJFz71OFkGubLchqXe+LgnAVPGuKb/x1suO7DpE58jbkWF
	t7jovMd5n7noFEqdnXPeenzUgmj8UXg+UlvBP0cjmO8F22waKvuT6sOSrwRsI47bkWb/yNZEv1i
	rn3BUHB7bwT3H
X-Received: by 2002:a05:620a:1b86:b0:93e:bcbf:4ad with SMTP id af79cd13be357-93f29d0a5a2mr1584877485a.33.1792481959275;
        Tue, 20 Oct 2026 00:39:19 -0700 (PDT)
X-Received: by 2002:a05:620a:1b86:b0:93e:bcbf:4ad with SMTP id af79cd13be357-93f29d0a5a2mr1584855485a.33.1792481954007;
        Tue, 20 Oct 2026 00:39:14 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm4566271f8f.36.2026.10.20.00.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:39:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/6] ASoC: SDCA: add sdca_asoc_dai_is_pdm() helper
Date: Tue, 20 Oct 2026 08:38:54 +0100
Message-ID: <20261020073856.1177749-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: qEelC_TnMe50Y8bifKjrONN618xW7F_b
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad71aa8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=UfHDTIoufQuGQUpisKIA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: qEelC_TnMe50Y8bifKjrONN618xW7F_b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX2+utBZ1t6lLq
 SEKHOTGAVPWN+Uz00ncy2nROnUYkvL708erza8DyKoIYKMbQzPXV1ynQM2XYC6xDLnKQdptVAoz
 1JegDk3GDbuMlSjquCjEdzqljTiBLRsmOdVHyT06sPgw6mKRwRdXuQnHEBZb89sTxHJIENz31Vp
 GqbbuMVSdjbXDh8hFKp3i3Svl2t6addxW0NJMJjrYxBqV9GDXwnBOHVqm617bejFkZ9ul/ccPA+
 LYgu1Wy/1ylZ29d0VNwR8+Hwg84uGbTsO4Ow3xxjUP+wBHOe1E4SXSu3xxbVQSa2PgLYoWeTCGo
 8QpgOvnUjWTOm0vYc4KCFgBsGgLD4cRGrlAmE03eeYeGbcTjFrlDZLbe90/ZJRiX1ADSwF8c/NU
 975Lc0FpHofs7YSNeEcadZOHkEZxcMdwfVvLTjlFurPohvABsnqn/Ejm2sEEaAtVx7kOZRMQSeh
 RlwMT/38KzqeRngCS7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX/sr+38YtdSOd
 TZXwF+FHLkoFXwY4eJMpKhE3k27SkJM1J1EPQimXK15JDLJkErkWMicU2pxkKifepgivv7uy3hN
 Sq0Fq4NKUFnKkBuzOhMmY5KsLDAapb0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

Resolve the SDCA terminal type for a DAI and return true for the
spec-defined PDM terminals (SDCA_TERM_TYPE_RAW_PDM_MIC and
SDCA_TERM_TYPE_PDM_RENDER_STREAM).

Used by sdca_class_function to tag PDM streams; expose it so other
SDCA codec drivers can share the check.

Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_asoc.h  |  2 ++
 sound/soc/sdca/sdca_asoc.c | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 599a72f33515..99c39b5944e3 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -112,4 +112,6 @@ int sdca_asoc_pde_poll_actual_ps(struct regmap *regmap,
 				 int from_ps, int to_ps,
 				 const struct sdca_pde_delay *pde_delays,
 				 int num_delays);
+bool sdca_asoc_dai_is_pdm(struct sdca_function_data *function,
+			  struct snd_soc_dai *dai);
 #endif // __SDCA_ASOC_H__
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index ccc579f878ff..559a0fdfd98e 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1781,3 +1781,26 @@ int sdca_asoc_hw_params(struct device *dev, struct regmap *regmap,
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_asoc_hw_params, "SND_SOC_SDCA");
+
+/**
+ * sdca_asoc_dai_is_pdm - True if the DAI is routed to a PDM data-port terminal
+ * @function: Pointer to the Function information.
+ * @dai: Pointer to the ASoC DAI.
+ *
+ * Return: true for SDCA_TERM_TYPE_RAW_PDM_MIC and
+ * SDCA_TERM_TYPE_PDM_RENDER_STREAM, false otherwise.
+ */
+bool sdca_asoc_dai_is_pdm(struct sdca_function_data *function,
+			  struct snd_soc_dai *dai)
+{
+	struct sdca_entity *entity = &function->entities[dai->id];
+
+	switch (entity->iot.type) {
+	case SDCA_TERM_TYPE_RAW_PDM_MIC:
+	case SDCA_TERM_TYPE_PDM_RENDER_STREAM:
+		return true;
+	default:
+		return false;
+	}
+}
+EXPORT_SYMBOL_NS(sdca_asoc_dai_is_pdm, "SND_SOC_SDCA");
-- 
2.53.0

