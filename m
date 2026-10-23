Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775898;
	b=oBmQn0BcQ2j+12Yf6CaG6WSyaKYj/PndKcVBQ6p8NxzQEMXcPmk+pjEVYZmS4X5zkicT
	 zHzWD12+wv+vPH4GTqnpwSvf0HKEuPFUH8jhh4LExr74MmDE6lZD78qapEuLRW9nMm0q4
	 K8E/Rns13xPCTxM6GveKI6c+T4Hx5dsz9X8EP8eTEmqd8hjS7sJ+L6b/wIl4r3p+yb4zG
	 ENugwk1QmR4JmcsQWFfGF9joabo0cGqu51bbbdN5oNb8gcrVSPCu0CLflo/LyiToNOSeg
	 yn0z2T7Ra1wfGTAiCN25zGneDSGAfFmcKp6OuPGQBgDT1FCTzN59kQBfCgkHcd138rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775898;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DZfg246TfQNYtunz0I9gt0EsxySLDi22L36IzvOxp2U=;
	b=Wqko1M9CZSXBbaorngOGs4G1ggrTWnqNOCRRa0g/an6o2iS6gBS7RvhPYeZ8VPKVlIDA
	 NRHsJssA2OSgV5Lp85GZxWevpFa03axOeTLsYrqno+MP6EPgTSR6F/hzTM2NF2lFBVvRf
	 njtX64i/ibl8LqJDOAcR6zpgn92a6Xk0QiMEi4ZVr1AgZ2+nvl9wPw3gdZntlqgBMJv2c
	 +WSZHTkgaPYGip9jBLU4aTaW532mEH8iEDDdJ5wXuKyidG3RqC9WC050Mvs6nyLM71jAZ
	 IU3kqEf+pbPgUDH6AfLJn9ylPJ9J8C+VzdsVOA/vJ1XUDcr1lYMGrC0W+k6Bn7qM/cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9XFIlA2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GT6jvuoU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4AC606A979
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D4AC606A979
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9XFIlA2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GT6jvuoU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6Ckc2462547
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DZfg246TfQN
	Ytunz0I9gt0EsxySLDi22L36IzvOxp2U=; b=c9XFIlA28Y73lvz+5dq2//1lUGL
	VKgarBj45iMCPHAYBwkiMulg82OsyJ+MY7u20+5VgBmWCLyVn9tb0yWrNYLAkfiW
	4jMCWR41NOS87rNOvQj0atc8nyzqcaDNwz3zKbW7L0iPyBG/xkWNTXnd81hIK87l
	62gzZQhuVlCRXz+HMGm6bQB/HX6mf3KGHQVrRbBHzY3O4zIoS0THO2ijS+AvvQlq
	FGZ+8P15fL3T0Y8YEgz/uQY1B24zCJLQ7k0kv9UBbXQylJEcen3OezjNB4vHeRVO
	QvDyEaxTPqxF8BSbUhBdA0qOyFBcZgRb5euXhA1BYJrCPH3TggDpGCcTx5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvskb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so210046585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775897; x=1793380697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZfg246TfQNYtunz0I9gt0EsxySLDi22L36IzvOxp2U=;
        b=GT6jvuoU9QS3+S74DLDt6SKuUfyyWPUc3Pkov4dOw8QuSXxfY/sDXMliyC1YI4X3tp
         TO+8e8tcuK+UMNsxbC/mvFmhioFu9MrJwm3hXSZzkT+GGLW5f+3E7eDHnRWU3n2NDCvr
         DXuV4A9YHWPgcwVoklcUIzQdOIPDvamOS4IHKuiqN/S0QNUlsGuMEIGB5KDgNILVmPY9
         JJNqaDbUuHGFEZ7MZHnOq9xtASCOSCsAtrBhgBYRtTZ7xSeg9t+n+wpVyqCelJkA1/DV
         mOEr/E85rknnG5yOAo0uen0d3Z6shpxKB9yZI80FHW62ljL0vxtUpnYkKiD2+a0dCNQU
         IgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775897; x=1793380697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZfg246TfQNYtunz0I9gt0EsxySLDi22L36IzvOxp2U=;
        b=2O6RuAike1CWdchfA4miI3wd6idWXOikdMYgxTxZb1atU/xcPtSmyprGF/+9+Io8v0
         aDdE7BsEWanZZH8BrXo4sK7Q6v9s9oB/Ix+l+zfPJ4tmvZ4BwkBgtMgwgWmB6sQtMQ+V
         73UrqNzScQi2DYK7M29GvsChbjlKIoJ5G5zCffwtrRpCelWg/b3RmbcV+II7MJ/OCh6g
         rehfVjkJ4tD4I2UGjus/MYwENTgJyKq73YwmQMmKFRhikB9NKWrEbX93PEHfCQWr4ebm
         ANpbHx8pGCL2O6VzobuIZOBo4PkJ0eRbSqbHTOLUWC7889dghENEzrVkKsJBJ0k3eytX
         2RXQ==
X-Forwarded-Encrypted: i=1; AKwUvByoJnmlif4n8az+v1D/BArEfmFmXzG7lxZYSEnaOnlVAgUqkhdKyuhHueFs6CPEB7MTKm+r7eRINiBw00k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4W1yiH35YytT3sRZdvrSqvkepxQrWnjPlKwfmZUjchW2IVFe5
	DRJ/gDKSGedGELMFeXSME21GzM3VMRXPOohXwERHJ6SH765K65Z2hm0aYq0/QeGdJp9zuWlhFF+
	W+z6pZFtN0ct0bzPFuijrylH264vwnm8F06tjJHgoIm7MejLGs3W3+XGO8Z5uGgu5jB4=
X-Gm-Gg: AYBFou1dtTTUQGgeC3TxOn/uAelDtnnndNeZ60cyAYPqjzziTmKG0fUcWnydly8cN1T
	+up7AbgXfTK5TCqAPsH2ylQSAw4Fm1bcavIZON8b9ubd1NdWN1Ke0W9Ik3KIiSjW2c7k0q24Btx
	2MLEbKBsv+hPcBzPVxWZ5x+7uCtlMnNRFJNj8ER4aVOPKfT9Jvny0YnjZ1/1sjDaGOOmANWkDUK
	jzDOUikr5bOryGV8DkLYXL5YqZK4R44s6rSmxpdgkBR6ImBinsm7B4niH3i6Yt0t0e/FhOjG2ZD
	gH/5EZnR558DlhkdxvXCMGrRVf+OkzPtMICu5pnwqq58/7qalkOMZu/Xf71TZppW3pSkftcYR4R
	4VHw6LV+wIRrz
X-Received: by 2002:a05:620a:4542:b0:93f:1dbf:6cf9 with SMTP id af79cd13be357-93f6f795ea5mr513762185a.33.1792775896775;
        Fri, 23 Oct 2026 10:18:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93f:1dbf:6cf9 with SMTP id af79cd13be357-93f6f795ea5mr513755185a.33.1792775896248;
        Fri, 23 Oct 2026 10:18:16 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 16/23] ASoC: qcom: audioreach: pin SPEAKER_PROTECTION_VI media format
Date: Fri, 23 Oct 2026 18:14:26 +0100
Message-ID: <20261023171433.820092-17-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb96d9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2Irll14qWxTS2nb0BqIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 6gf7Fqf15_rHeivUgbUrlCsmtzgCdk_4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX9HT7L1Vr7z2N
 JuEtIJWwyMd/INiXhTeQXZe5Gr1pHyPGCuJlCeFReQL51NzFGzFkfrsBSDwrdme1RUAuNrMCvcF
 S+ozapirLqytMFGX8BLnaMaMRjvUP1pUI4kdq/lhyU18gZtgxpvT4SK7NDYK0qGLwuCy/ZsMpdn
 NX1WL0gN1jxlnK40bXxXb0R2Fdwbqte4Ggloh6aImWdJ9U7X/edv5MKpnLpvcw+o8UJyENxNxwu
 YFaAz10O9YrGKH6HAneGsCYGbY10F438lormcfgNZc1ZHvjAuinmHNOl5ctPyySA8sOUenJvROx
 Zyf1xslRkQOCXHKjB8ljDYS5AmmDJ9c4nrx/taEtD+h8i5jQbMyK5U362IMZB2E5IaA2IY2LJhO
 HV/vFeAIANPgg9aP/UWQBr4Z2oeJ/Ps9229Y5lD1fHTxumGPm99eyPYKUyARoINNnB5vzi3PgQx
 LoG0c97TF96gMurfzAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX/0tw82michFt
 KKXAnA+DtiF24lz1QAh4OVkVflwwJMKz1Z3S6opLqBDz93uvwuEHIn43NtgHhMCcaWVdSohwbKN
 +HOi0xkcQhTtA/vEfMXVwCxsCmjf0CQ=
X-Proofpoint-ORIG-GUID: 6gf7Fqf15_rHeivUgbUrlCsmtzgCdk_4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

With multi_direction_codecs the speaker protection VI subgraph is
opened with the playback stream's parameters, but the VI module and its
codec DMA source always run at 8 kHz and 32 bits.

Use those for the VI module and the codec DMA source in its subgraph,
and keep the channel count, which follows the number of speakers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 089cc9dd76fc..d027c763eb25 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -2033,12 +2033,41 @@ static int audioreach_speaker_protection_vi_static_cfg(struct q6apm_graph *graph
 	return audioreach_speaker_protection_send_static_cfg(graph, module, "VI");
 }
 
+static bool audioreach_sg_contains_sp_vi(const struct audioreach_sub_graph *sg)
+{
+	const struct audioreach_container *c;
+	const struct audioreach_module *m;
+
+	if (!sg)
+		return false;
+
+	list_for_each_entry(c, &sg->container_list, node)
+		list_for_each_entry(m, &c->modules_list, node)
+			if (m->module_id == MODULE_ID_SPEAKER_PROTECTION_VI)
+				return true;
+
+	return false;
+}
+
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
 				const struct audioreach_module_config *cfg)
 {
+	struct audioreach_module_config sp_vi_cfg;
 	int rc;
 
+	/* The VI module and its codec DMA source always run at 8 kHz, S32_LE */
+	if (module->module_id == MODULE_ID_SPEAKER_PROTECTION_VI ||
+	    (module->module_id == MODULE_ID_CODEC_DMA_SOURCE &&
+	     audioreach_sg_contains_sp_vi(module->container ?
+					  module->container->sub_graph : NULL))) {
+		sp_vi_cfg = *cfg;
+		sp_vi_cfg.sample_rate = 8000;
+		sp_vi_cfg.bit_width = 32;
+		sp_vi_cfg.bits_per_sample = 32;
+		cfg = &sp_vi_cfg;
+	}
+
 	switch (module->module_id) {
 	case MODULE_ID_DATA_LOGGING:
 		rc = audioreach_module_enable(graph, module, true);
-- 
2.47.3

