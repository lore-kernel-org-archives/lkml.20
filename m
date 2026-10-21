Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792555878;
	b=VyCyV3ptLOlvEGC9mMD1Kwil6FzOrjVLt6ZVxgjTnr1gUQV/7ADoqDXMFNI5oKUzaxgR
	 N29PqNoS4TuDWtx5E6TP0/RK1OiX2NIgQZKWsoCIrj+OSPluoAXAom9fvj1wVqBGS8VGh
	 YZ9/29lxXY/qg4L5mwXtY1ed20Ww1gejAJhTetQjS2FZhOP2uo6EzGzk2mGsvVrZwkUL/
	 UZPBfWg2fTaxqa5uRhKkJU664Z5X3+0vCny9xArnykJ1mjX097fuPiR5zLLV9qt/xtDkx
	 38MP651aDAr3GW8bHbWjXgd3lw0DfuNc6pl48czW0Tbf7PYrmylJHrMmKU7MyJQNWMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zEW8Hl8s+Y1giZRO3PaVOKx3H/aD5JuoFm4LfqgU3JM=;
	b=S3MkCKKgHny2l6bZlV+2XNcha1Qv0WLCqypQ6JKvf1yKV7Y2RLqbmvXksMXg0yTQhwWw
	 z+kcQsmWHsOUsGUciztFQhCzTWKSbB3ocwoGwwhEHDFvQnsdFRJL/8J/GnRHU5HKFGutn
	 zjyHJBruPvf/SfY6Qn6dneLlRTU5UoOElJvDsIaiZXA8Z5CeqqHZE7mtQ5Fo6kY8inElB
	 HIKy4Ycxt+1YYkIBXgROY8JmiRalK1HyhEX8uSlvsr23+lwuuDz1azUNftHNmOD2gse/w
	 31Md8iVwILB5VwenGWrS44MNrh7Y73saC/ti4I1fUpam7RRyBIM+d+hUKUvoX68MHBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CtSBq4Me;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h3J1ZXKt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3832606A334
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3832606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CtSBq4Me;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h3J1ZXKt
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FUgf1957080
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zEW8Hl8s+Y1
	giZRO3PaVOKx3H/aD5JuoFm4LfqgU3JM=; b=CtSBq4Medn9+GjTSEqjuyt6Mtww
	aGpV7VC5msNvFk22L1TH8CKz58hIEaXkQWVO/S8FcUSuhlvNihJkhlrHwfUdAd8H
	kOlr+TCO5eBE0to9k++Czk2mHjw1RxoqRKlgw3ycVRrwpuhtKVRJqM2VWxpkvlVU
	JXhSjBC2OeIpaPiUb1TnFdwEt/ZRlSS54EWyYgxEpQYtXrykHRUvVHsKXjEgb7Wt
	8Nydno7kSjxVo8OacT+bn8NqjcW3jpPsrlH11OMwCaxtraj9yMJ5Q2tGzIE1go/a
	qVDxBWGV88pgg2BZ8t4NlqCk1ifDjasatTT+O4A4RWZeQi9W/y6xXT4k+qg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hvbcn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:11:16 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-151ba226e1bso537967c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792555876; x=1793160676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEW8Hl8s+Y1giZRO3PaVOKx3H/aD5JuoFm4LfqgU3JM=;
        b=h3J1ZXKtCQL4BK7dE02NXiYdPK4jTcoqH4aEQv+OhV9kG9tlEtewvk6XxZd70dYpom
         wn7ug/uzsHHkbyFCiQuSiQSUDcj/A7g8E6Y+O8aZK/B+GaLUMsYQ7oMCB9bOoIq3BY9T
         GYwSfNKO66+qWRrK1rozJtkD3eWbS2SBZ3q+C9x3IvCaOadIULgY6OFC52s4ApFLin0i
         BeiVi6Fu0LuOKpnDx7i9BJjOBw5YaUeB3vMdZdEoPnE8fFSdQW+H1X0swmwwQus8Cw66
         GezKiMlzvTf1LyjcBU2APmWxPshNQ7x+B3lU8Z39+tWQckNci+IORNxEWJoT5I73ueCW
         qWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555876; x=1793160676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEW8Hl8s+Y1giZRO3PaVOKx3H/aD5JuoFm4LfqgU3JM=;
        b=v4NaXejb6/fGyEbS7+yoVB1eg7ocuGR5W01lSVokj923HWQltvoMR/zdoVCAx8iaxy
         RA8l+/DlREL1AQNuVFaV0bLWSJlpsAS8ThIyTOrkiUd4ojajrpRiZi5+TxcONvuPRTfQ
         +i1nHxAasVVcmthxHlIJE6JZ9KSS5BGWU1YINJ8dqvOpEb1F0vaYp1qAhuoyeTBDK9uY
         +TRd0UMH/+S5jLDSuAvr9yktSADUIW+0YdVBIZD+fkHQZ1bjYGJCdEgU4m+Ga5m18Hje
         wSIhH0YHbjoH70E2XKjkFLiYNaW+HgatqGbOgNvwrvz4rVaPvCT8I7fVou5Dq41qVWDB
         mDKA==
X-Forwarded-Encrypted: i=1; AKwUvBwUSjvnVsuxI2GnskIb3gvHKmPPEj1o2hbe+DREugMumb/V3JzhZgLZ5Qo2iYFk8bPhTmO7kPWKeN6b+8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRM/+xW5u/EfJVwPkKGKlMK2pqpx4XCwLZvD/K7FYmmH96wQIj
	JfCFq0+BiFdviB31VYZE8o7kK1c+yJC6fR/iChHRB2S0/VOpU72B2esbP3YIUzy/2RqGa43WQ+t
	OPw8shvbX5e9qtjKQOalec0TP//+4OyzAlll4uoaG7Kn2RJxAWF9H0+eME7Gk70VdGuA=
X-Gm-Gg: AYBFou1A5VwNOKpMG73l1QEQK3nkJH9AyS0mhLkl6BGNnU/ib3KugthO1Bz9c+jBJBM
	yLDWsOJ6yUCnSqtvf9Z1s0fIi4RQHsGNgyiqbZ8EcB+NExvKkOq6Dl/208SxIVOqKM6+urN5SEh
	hmn67CbTjf3U68uWE2waijshemLYakndQ1Y+avN9tHLLklTgfdRYuaA+vHRI4M/Gb3s+7SUSetK
	EUyN7esKN2u+SgPkaEPM7EgylGO0yX0syBCfuca51iTzkC88EW8TAHr5RaDz1+2AM+9/Fm0Tj5U
	3PQqTrFG/UXq9ySwtf6xrtPxBPLq6piKqMTVpBxk7X/6oTJQEQj4fk0dfo92HLph7hn2GWI+IgW
	og0qwxc6JLJeGwbS4X0nzoPe1W8KP0Up5OWIiHp4vxgE+5CQh6HNTceiduxc=
X-Received: by 2002:a05:7022:691:b0:149:d501:b990 with SMTP id a92af1059eb24-190a599a59fmr1822891c88.25.1792555875985;
        Tue, 20 Oct 2026 21:11:15 -0700 (PDT)
X-Received: by 2002:a05:7022:691:b0:149:d501:b990 with SMTP id a92af1059eb24-190a599a59fmr1822831c88.25.1792555875196;
        Tue, 20 Oct 2026 21:11:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2915427c88.22.2026.10.20.21.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:11:14 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, stable@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 3/3] ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology
Date: Wed, 21 Oct 2026 12:10:44 +0800
Message-ID: <20261021041044.2080369-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021041044.2080369-1-shengchao.guo@oss.qualcomm.com>
References: <20261021041044.2080369-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfXwKf9jIX3pIvo
 jOhueau8ccnhEvzrxyf7VXOK5QfkrBHdoAovmi5eJq6f4QCxk+F+2rB0Wlmsx+wqK6Cuaym0+sd
 OrvcuohJOqnslsk0i1K2KDhFeb1GtZGOU2EEfRxp4Thh5KXdTgNu7jbfb/McfjzKaTOAyZIvTN/
 YL5gxBfWSywyVIwUOc+njD3j5gZhu0T8AI3tjNgYhF0xkh/0kcsRyVIW+4mjYyLGQaGKoHtZrBV
 idoGTPYe2LZcisOPU+FYPz7fg+Vd0Y9d/q3HuKaZK4jjOrOyQUFs2F/EHaHWWORzQ40bEkif2rg
 Q5zUVp/L4xd/sBG4O5hrYEbuzHVvvcU3vLipYtC/7DumX7QNkDx8Wi41SiRSVl6+2I0B9ryP1qS
 FL8u8jGCxn8Sof9rUZAtpkLGSFjBdkBXxam4rYBWEovf0j0kTSezPny3um+rWut9qvjkrK5zQrk
 A4illGardTNan+Xvnlg==
X-Proofpoint-ORIG-GUID: ZCuoCsAeET1t6uxfMMWZegXiBwlTzf-I
X-Proofpoint-GUID: ZCuoCsAeET1t6uxfMMWZegXiBwlTzf-I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfX1B/uen+AqE4e
 3Ow03xAxNhuhbnpgZDfcjZ1TgF7aRfHUg6dyvzE71JlnKLh7tJVj7uXo27DOcD9MCjDzBAB2I6y
 iLQvsK62JCCG0d3RSfsTghTOedlAmfA=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad83b64 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pRitcdQJkKt4eD0iFYsA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210016

Since buffers are mapped once in pcm_new() and unmapped in pcm_free(),
the unmap relies on the graph info still being registered. During card
teardown, however, soc_cleanup_card_resources() removes the components
before it frees the PCM runtimes. q6apm-audio's remove callback unloads
the topology, which frees every audioreach_graph_info, so by the time
q6apm_dai_pcm_free() runs the idr lookup fails and the unmap silently
returns -ENODEV. The DSP keeps the old mapping.

When the card is bound again, for example after unbinding and binding
any codec on it, pcm_new() maps the same buffer once more, the DSP
rejects it and the front-end PCM is not created:

  qcom-apm gprsvc:service:2:1: Error (1) Processing 0x0100100c cmd
  qcom-apm gprsvc:service:2:1: DSP returned error[100100c] 1
  q6apm-dai ...: Audio Start: Buffer Allocation failed rc = -22
  snd-sc8280xp sound: ASoC: can't create pcm MultiMedia1 Playback :-22

Release the circular and position buffer mappings of all graphs in
q6apm_audio_remove() while the graph info still exists. The unmap
helper now takes the q6apm instance directly, since it is called from
the APM component rather than from a q6apm-dai child device.

Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
Cc: stable@vger.kernel.org
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 0e5219a6513f..bed3b64e8310 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -322,11 +322,10 @@ int q6apm_alloc_fragments(struct q6apm_graph *graph, unsigned int dir, phys_addr
 }
 EXPORT_SYMBOL_GPL(q6apm_alloc_fragments);
 
-static int __q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int graph_id,
+static int __q6apm_unmap_memory_fixed_region(struct q6apm *apm, unsigned int graph_id,
 					     bool is_pos_buf)
 {
 	struct apm_cmd_shared_mem_unmap_regions *cmd;
-	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct audioreach_graph_info *info;
 	uint32_t mem_map_handle;
 	uint32_t pos_mask = is_pos_buf ? APM_MMAP_TOKEN_MAP_TYPE_POS_BUF : 0;
@@ -358,13 +357,15 @@ static int __q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int gr
 
 int q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int graph_id)
 {
-	return __q6apm_unmap_memory_fixed_region(dev, graph_id, false);
+	return __q6apm_unmap_memory_fixed_region(dev_get_drvdata(dev->parent),
+						 graph_id, false);
 }
 EXPORT_SYMBOL_GPL(q6apm_unmap_memory_fixed_region);
 
 int q6apm_unmap_pos_buffer(struct device *dev, unsigned int graph_id)
 {
-	return __q6apm_unmap_memory_fixed_region(dev, graph_id, true);
+	return __q6apm_unmap_memory_fixed_region(dev_get_drvdata(dev->parent),
+						 graph_id, true);
 }
 EXPORT_SYMBOL_GPL(q6apm_unmap_pos_buffer);
 
@@ -851,6 +852,21 @@ static int q6apm_audio_probe(struct snd_soc_component *component)
 
 static void q6apm_audio_remove(struct snd_soc_component *component)
 {
+	struct q6apm *apm = dev_get_drvdata(component->dev);
+	struct audioreach_graph_info *info;
+	int id;
+
+	/*
+	 * The card core removes components before freeing the PCMs, so
+	 * q6apm-dai's pcm_free() runs after the topology (and graph_info)
+	 * is gone and can no longer unmap. Release the DSP mappings here,
+	 * otherwise the next pcm_new() fails to map the same buffer again.
+	 */
+	idr_for_each_entry(&apm->graph_info_idr, info, id) {
+		__q6apm_unmap_memory_fixed_region(apm, id, false);
+		__q6apm_unmap_memory_fixed_region(apm, id, true);
+	}
+
 	/* remove topology */
 	snd_soc_tplg_component_remove(component);
 }
-- 
2.43.0

