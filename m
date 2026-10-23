Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775894;
	b=YlV6TnqHGpkb0vBxELNiUzwie1km7EzdansHxC7+2WV69WPTujaSHML2lecmCzcs3dhe
	 7SR0D5sVy0xfuHMkM2/OG+CVF7QW741S896ufMHSsyvI9/qPYm6wxD8tfp7jVUYB++4Rd
	 U+LnkpWwDCiY0vwL4KYEAMoQyNfF5/GSfzhHsqVLvJNzkpSw2rNkrCEl/58kshIGen9m+
	 0tA2RsA9vn6GJI/ZSzyMOQmTxIJLk4HuisSSI5TJh7YKrPXoTC7oBa54M9/g82/GoC8y4
	 OygYR8BgR4TGQLHmIwp5pc931CRrRHTRJhdjsMFNyGyPpDtVIMe7TtiBtskK80Oyz5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775894;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wofpT4CczCNyH2fvQLF0TWdYqSGLaecFE0NtEVzTZiQ=;
	b=seaMRFSRO7S8DlaxDLMn2zi5eACDj5cUZan7dzgAYYItHFJAD1A3uhRM31r7C+/Vkoee
	 FJKkN55D6FVkzFkkDZkyBX4iPVlsZIPrsgMeSKGUlZJOsa6Yfy+T240wOak2BqAZOH3MJ
	 J/HryHKKJQw26mBGZnEzic38VaW1tkSZNdGfeoS87kjzfujCr4h+J7VWUkET6QrUEXa58
	 iujazrRpcKndfMBwYMKlguUy8NkyzcouSebqYgwNolHLJiAcPVr7blJMEQA3KrLCbY5kX
	 VPVpeynLrg6tY3hT7CNkmpZpEaOdmr1G+Lx6AbxJjT6kS1Ic+JGHWjvWwGB8viFjJ+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUgGo8QM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Y1/9ijR6";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6172E606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6172E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUgGo8QM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1/9ijR6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG3r2U3812359
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wofpT4CczCN
	yH2fvQLF0TWdYqSGLaecFE0NtEVzTZiQ=; b=CUgGo8QMFzjpa59f3gbK9cyCO2n
	SE1B1Tf5ELAfOfvfXS+hUQse5taUYzbmGQDevsQWeS8prtGHxMfSAaoml76vOUMT
	lpBzOZ5//PQoHURAAhUgJ2ZiJyKgZnZpne6LP8XwfHY0T5O8vnl//YNXaUyvyjNB
	m3+306eNEpdHwYFpw5HFDKZoT2voO4CmhST1XZsR3u3UdCKWWxTBSMNG8bNxTHkG
	KaTp+ZBKT1VvPm/aNqtsRlKyekK0ZE6SZAXY/rpA2ItQGA0Vbm9gsVnqUg8Vw8ha
	2ZYsiVp03i4s7psXEWicxZ5iejVunNGRyzdsf34+J2DfpcSA6kJQMMdZwJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas8896k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caa0ce0cdso141295785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775892; x=1793380692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wofpT4CczCNyH2fvQLF0TWdYqSGLaecFE0NtEVzTZiQ=;
        b=Y1/9ijR6dMYQSaRr/EKqqE0jqudH3XvVWnO0ruQ1NCdmBUqSpU9hpm1zCdAS/IRcmg
         r5+b7KMcG2yvOcegzBlOmWofQsg0G81AUOiK6M5AH/vEbpFrQmWjit++4PiC5e/uGEIQ
         I+8HETv7bsC8KSdhb8URPIQp1UYKLbFe8Y9lvEzonPWoK/NJRvKddd7Kfb+JxPtLZqns
         YHwR3cTWoygvyGmmzhtDMUWML5gpgC1Z8+bJ6iogUqjUB/zcgUM8AO9TdAnOGt49hx7w
         nHpy82KRpE+V/HSouHiTjABG8uY4n7zvAh5ic6JwkVu4TBW+3NRGsyIYCZmOHk135baL
         r5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775892; x=1793380692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wofpT4CczCNyH2fvQLF0TWdYqSGLaecFE0NtEVzTZiQ=;
        b=YA+B6HSg1o3smnLh2OehOPvz9+Q018RKxdr0U8S+aSMq4rdGBGrpXSiJWA4TRY2yhX
         mijb7PTkrpHwUpG0RwmadV9PBvYlKIn/TFB8DXJaisjuv3KYyYQ6wKBZBawZuGPY6rB2
         B4FBtqMTF15iHw4EPrPvplfIoJ5NCxXcU8OnmtGbxAA2q9RHYAZ4ZyIozVe9bH+KXJ0B
         lcz7xFyPMqOKw5EaAfTYL04b777mPrEeRYtcb6Ax0Weihgq8PagHjvrfDtB+JBjuwT+n
         ZgLII/P+0t6ZHLnFDlcTQ6fuXfGLrTewFYfCig9yf3UGTeTAD03Dsn9DplpVDtR2lgEq
         BNAA==
X-Forwarded-Encrypted: i=1; AKwUvBx57tAdBEBatCRqBGpJiGanV+cZrUW99Gxxxx3+ChRCH3KwgfreIwec5Fpe0UJYu76eMwic2HtakIqBR7w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaHa4Sw6rxxAWcgAWhyjicjGdwobIRZ9q1VSu7a63+EE5YA9CI
	xJemX6w7ta5sqkLMoswvvizLak84Y6kbtwv/gkJLHY9fSBg6dk89Ph/byFe6hF+S11CUUhCj0+I
	vpcicMnx253qUxELPLgiU8NFZk5O9PZbUb1JSlOf/4IZmhR49gGYDZ87WL8K8ok0P3zs=
X-Gm-Gg: AYBFou05isaDMTzd9zAmIwIhUx4ljp+I7yF0ghUHd0qdXu5AZ8jji67SMcJRxerG1+e
	yEYnAI2ZWGjKUry50Dn8ORqmD+/OE9gfH7DeBX6sADYdhbvX/arb9SV/pq6kSZLZ6dEAfIOz3YN
	oQBjLZ1YIu63zLTX1mRMktZJTSCXMvS8L6/VBo7znFe61YSEU5PgXWGoCqXPj6dmknBoKykawzD
	lVSpWd5vWnODcjTLfzUmrRrikXZ0B1C95m5ZA656e3CrMDk2hUncsCEnhNoP4hr9rrdtgQ0K2Jy
	ohoxG2f5+MkEN3LAs4MUIhukWrGuJhyj6hjaSz6K/X5o54u0dgSnjVcZR3IxNBHEo3P83zZCEg3
	W5QoMfwrIyWWX
X-Received: by 2002:a05:620a:bd3:b0:93f:34c9:9252 with SMTP id af79cd13be357-93f6f9a2bbfmr527732685a.55.1792775892265;
        Fri, 23 Oct 2026 10:18:12 -0700 (PDT)
X-Received: by 2002:a05:620a:bd3:b0:93f:34c9:9252 with SMTP id af79cd13be357-93f6f9a2bbfmr527726685a.55.1792775891704;
        Fri, 23 Oct 2026 10:18:11 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:10 -0700 (PDT)
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
Subject: [RFC PATCH 14/23] ASoC: qcom: audioreach: send static cfg blobs to speaker protection modules
Date: Fri, 23 Oct 2026 18:14:24 +0100
Message-ID: <20261023171433.820092-15-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX6VDKEyeRP8hf
 bYD/ukOIUdkAcCYJG3H3kfQN2P1sp+RqyPYVDemrz/N0ReuNm3J7Y1xeOstmeEWq/c7RjWl8WOg
 oX2iGFkhKs1BwLiXlqkl9dG3dF46aLU=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adb96d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=OAJap1ZGhMVArrtS6vMA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX31D2ZXJUeRv6
 Kjg7vE5Of0qDplThGsGG7Goe9nJ3mK5utJdzxs6SxlMMPfaSStmPO4b4peWvlNlIuCxUAfeI74A
 Dgap+5PPWXEcPJFrp/WMCujfNU2Lld3AZUQ/efdMIUA91TbUCqm/Sp1gphSTzBf6rhVdg42YJrC
 TqbeAmhDiBkuGUPJotAsIugyehHT4EUcyF5S21gFFY6t60ViewFxFWqLIMpPS/ZekZCnbQ26Pdl
 ibWCi6A5J/ONQ5Gx1TxFp4MEWbq+5dkRxre0IScBJJIiEHFBGxWEmiCh+P2cFsqjsXv42X0P/vU
 VUu8i3JPgpw+zb+FwyVFTu9UdRowFer2OulUPJnEzSEyPFIEbj4a/wD4y+JR2kuE9sk+d/jrWo5
 m1hRiYZW/UMLuhwXDHQyp1SJ7cegpquxKjG67yqFMjb0uvqF8GolIlILuPcj7+cIHTYcbTaDc6n
 GZSzSbKnaRyB5ZV+tCg==
X-Proofpoint-GUID: WyLKdMWiMmB_spTCMNiYVNN2JEGa0QCC
X-Proofpoint-ORIG-GUID: WyLKdMWiMmB_spTCMNiYVNN2JEGa0QCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The speaker protection modules need tuning parameters from the topology
cfg blob, which is never sent to the DSP.

Send it once the module is configured, in small SET_CFG commands split
on parameter boundaries, with each payload padded to 8 bytes as the DSP
expects. Every record is checked against the end of the blob, and a
malformed blob is rejected. A blob not laid out as parameter records is
sent whole.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 139 ++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 8706471e2a43..089cc9dd76fc 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1898,6 +1898,141 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	return rc;
 }
 
+/* Keep each SET_CFG small; a larger single parameter is sent on its own */
+#define AR_SP_CFG_MAX_CHUNK_BYTES	512
+
+static int audioreach_speaker_protection_send_chunk(struct q6apm_graph *graph,
+						    const char *tag,
+						    const void *data, int size,
+						    int chunk_idx)
+{
+	int rc;
+
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	memcpy((void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE, data, size);
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+	if (rc)
+		dev_err(graph->dev, "%s cfg blob: chunk %d (%d bytes) failed: %d\n",
+			tag, chunk_idx, size, rc);
+	else
+		dev_dbg(graph->dev, "%s cfg blob: chunk %d (%d bytes) sent\n",
+			tag, chunk_idx, size);
+
+	return rc;
+}
+
+/*
+ * Walk the parameter records of a cfg blob. Each starts with the module's
+ * instance id and a param_size, followed by its payload and optional zero
+ * padding; a parameter smaller than a word may come without a payload word.
+ * Each record is checked against the end of the blob. With @dst, the records
+ * are copied there with their payload padded to 8 bytes, as the DSP expects.
+ * Returns the packed size, or -EINVAL if the blob is malformed.
+ */
+static int audioreach_sp_cfg_walk(const u32 *word, u32 num_words, u32 iid,
+				  u32 first, u32 *next, u8 *dst, u32 max_bytes)
+{
+	u32 pos = first, bytes = 0;
+
+	while (pos < num_words) {
+		u32 param_size, payload_words, avail, rec_bytes;
+
+		if (word[pos] != iid || num_words - pos < 4)
+			return -EINVAL;
+
+		param_size = word[pos + 2];
+		avail = (num_words - pos - 4) * sizeof(u32);
+		if (param_size < sizeof(u32) && avail && word[pos + 4] == iid) {
+			payload_words = 0;
+		} else {
+			if (param_size > avail)
+				return -EINVAL;
+			payload_words = DIV_ROUND_UP(param_size, sizeof(u32));
+		}
+
+		rec_bytes = APM_MODULE_PARAM_DATA_SIZE + ALIGN(param_size, 8);
+		if (bytes && bytes + rec_bytes > max_bytes)
+			break;
+
+		if (dst) {
+			memcpy(dst + bytes, &word[pos], APM_MODULE_PARAM_DATA_SIZE);
+			memset(dst + bytes + APM_MODULE_PARAM_DATA_SIZE, 0,
+			       rec_bytes - APM_MODULE_PARAM_DATA_SIZE);
+			memcpy(dst + bytes + APM_MODULE_PARAM_DATA_SIZE, &word[pos + 4],
+			       min(param_size, payload_words * (u32)sizeof(u32)));
+		}
+		bytes += rec_bytes;
+
+		pos += 4 + payload_words;
+		while (pos < num_words && !word[pos])
+			pos++;
+	}
+
+	if (next)
+		*next = pos;
+	return bytes;
+}
+
+static int audioreach_speaker_protection_send_static_cfg(struct q6apm_graph *graph,
+							 const struct audioreach_module *module,
+							 const char *tag)
+{
+	u32 size, num_words, pos = 0;
+	const u32 *word;
+	int total, rc = 0, chunk = 0;
+
+	if (!module->data || !module->data->size)
+		return 0;
+
+	size = le32_to_cpu(module->data->size);
+	word = (const u32 *)module->data->data;
+	num_words = size / sizeof(u32);
+
+	/* Not laid out as parameter records, so send it as the topology built it */
+	if (size % sizeof(u32) || !num_words || word[0] != module->instance_id)
+		return audioreach_speaker_protection_send_chunk(graph, tag, word, size, 0);
+
+	total = audioreach_sp_cfg_walk(word, num_words, module->instance_id, 0,
+				       NULL, NULL, U32_MAX);
+	if (total < 0) {
+		dev_err(graph->dev, "%s cfg blob is malformed\n", tag);
+		return total;
+	}
+
+	u8 *packed __free(kfree) = kmalloc(total, GFP_KERNEL);
+	if (!packed)
+		return -ENOMEM;
+
+	while (pos < num_words && !rc) {
+		int bytes = audioreach_sp_cfg_walk(word, num_words, module->instance_id,
+						   pos, &pos, packed,
+						   AR_SP_CFG_MAX_CHUNK_BYTES);
+		if (bytes <= 0)
+			return bytes ? bytes : -EINVAL;
+
+		rc = audioreach_speaker_protection_send_chunk(graph, tag, packed, bytes,
+							      chunk++);
+	}
+
+	return rc;
+}
+
+static int audioreach_speaker_protection_static_cfg(struct q6apm_graph *graph,
+						    const struct audioreach_module *module)
+{
+	return audioreach_speaker_protection_send_static_cfg(graph, module, "SP");
+}
+
+static int audioreach_speaker_protection_vi_static_cfg(struct q6apm_graph *graph,
+						       const struct audioreach_module *module)
+{
+	return audioreach_speaker_protection_send_static_cfg(graph, module, "VI");
+}
+
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
 				const struct audioreach_module_config *cfg)
@@ -1951,12 +2086,16 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION:
 		rc = audioreach_speaker_protection(graph, module);
+		if (!rc)
+			rc = audioreach_speaker_protection_static_cfg(graph, module);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
 
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION_VI:
 		rc = audioreach_speaker_protection_vi(graph, module, cfg);
+		if (!rc)
+			rc = audioreach_speaker_protection_vi_static_cfg(graph, module);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
 
-- 
2.47.3

