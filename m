Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7EF4DD3D5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159946; cv=none; b=Vbo/2PyKoBtyFB9xfDmfXpUY6cK3baIf3NVlNNyQ/qkJiTVGZ43QA1eA7KGpvsla9AlJ7NbMrNN26SqD3JuqzQYIRYfdSeL8QR1Y86Rhqg1c12mGe/qEyFw9eD7PFNoUTr7P04sSbJXrnXzjFjA6WZhvt+or4zBG8HPNbo+Xqgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159946; c=relaxed/simple;
	bh=rgkPiQLDuHZhgT4/G3OtHq/Z5hWpRHeWeCpWLYt4AxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hhNx84yXwJ8kis202K4Y4ZKxCOkJfCdbu/4nKTAiBkMiRijybDdzKuBU1rdVvzSaWgwLAQL08yWCfYAvjMn/WSBHYTlCCXIx1fn9IVTW7owt8Rl2pWh26Sy/H44N99pM9atTFQEfT3az73QLSkH5YaC8ttmCE8qQGZ1Ec5o0A4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QEWhKm/W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLCZNsav; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QEWhKm/W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLCZNsav"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5i7D1910948
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gg6081YpwKP
	psw+SvH8/3fphksCH2ss8wRm7fjhCQ3c=; b=QEWhKm/W4rSTaCcyhn9nHZdoMpM
	o8jg0ISKYn+3wjWf/GwfkZczX7PGudFZzxhsgyYf6oXRHUu3i4DtzjQEuwFdaxzp
	UpuFP0xXOgmS0726PnL0u+zmF03FMEH339f2bJkU57iqQ0waC4plzemTwvFPZzQ9
	wSo1Z14UPRBGnrN3l45gWksGPK+d6KcVfAzGP5v3kC8QVqOPbSdIPGdImy2ELDOn
	bn93b35qQRFjqZY7YKzeCul4pIpCGZvzJZyQcVzS8ilI0WYXUsNRSZNW3EBGhDFp
	MRN6GcNAqF2dclVyzrkInkc01rOnUIvMSbyqwU7dCXKjEzrWDX23Nrfvjcg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf8pdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:12:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c902e0da2so1268456eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792159940; x=1792764740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gg6081YpwKPpsw+SvH8/3fphksCH2ss8wRm7fjhCQ3c=;
        b=HLCZNsavGiaXdpvaINF28EIs3HAi/jkXutLWGlYcJpZXObWpavSj3B6F86R4TtqeV/
         akiOGK2eVubD7Ezp+KM0n5oHA+kDiSkVY/tIFkzuh+btMYPxNo86Opi68UYRAlW/mZmG
         bGXC/DQjD7JZw8loqGUvxw/Zc+EI4li+ABXPA5OV3RNE1BPUIEtx+FJ8IeF6Q/mk9XP7
         STXK7lPrNAX/yQB4w+E/teBBpl03QSlHLAq39WEQRrhbsBrMmDrpqHBSTNdcS+0N/HMS
         ur+LdxW2MOjkcBBVUOTXa2zBB978NQdHBFdP8C/Wugx821a7284YWkQuKMyGv0cP67Vy
         2pRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159940; x=1792764740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gg6081YpwKPpsw+SvH8/3fphksCH2ss8wRm7fjhCQ3c=;
        b=hFJuMzbxR5fApV8xq6ST15wAZuyF7SFp4ZQoQsPIGeEZrT+TKk1u7MAQ1/qBjwIKRp
         RaBKtukpp/apW2Y6dghFbMC0NtZhRaKARmtwoN+8jZ32dbFx1kLEmiZE5lXJOKQ1i7NA
         rpjlyXwP9IDpi8/6C6zqCKTwgUhLf3jWVtRkm0J0GO/LWRqAP3LqnFfBWWMwP5PgIxkX
         PqFgiUYm7I4ZrnUYzi3AikcEHhHVu1FAK+adpeIWXYXnso6c74yPfLqtuXIcOAizYb4j
         ZXF1M+lLJr0PopMARIlH/BW5QF2h8zEdiBw2ObnoH0RC6GnzgWcno6ZeYST+apQOlXc1
         KGlw==
X-Forwarded-Encrypted: i=1; AKwUvByBrXLowVDy/wgSAn6qwcaB+6hWm7iaWeGjrFvUcmyfSQl46AoDd9OVBa7f1+rvvnQaK/y5wLmkzJda7NY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK64gMGYfBJq6bIl6PzMKK2COuPohte9SjoZUMvPp9VW9l0qQ1U
	gXjkUA6JMyAJ7GWZuAK4UKjWpu+7kUCT2yih/CVEFP2ElFnfFyDN+yppaebseKY0perRtmsw/3r
	wbknTbIIR6P+z3ZwiUEP4VHvtbrbsjVrE8zDumqj+R44f1sv5SpvmmHVSlCAQakZXMUs=
X-Gm-Gg: AYBFou0O0gsJ1L2aMVMIScIA+EKjz2Jxl8d4TZkHSCZhAAPQBu/l8cmWi7cRyekmTs4
	nKMLc06kXrjvMb6l6YOJ/W5x350CSFsRbg9KyGdESRs2cn9eN4H52MV2g8pEmC6tNA4nAQ39peJ
	qCBqONwP+4+3VyQVcSo5Qck1JTBeJPtZc3EjmMg1Z1T49WEgVdokVF44Bwp+56sho4pNFcsy8XD
	LdCpp9cX+RzLv0TxgVQJYdEz7RCvBPLVAF5B5VEddwP9CgMx2QWMVDj9FUBybNOBPoU/TSx4Wdj
	nt2lfD5N0eAod42NwhbtINzwwuCECrhJgMcoFbgVpuptxt/v8J7GI6b0JXmx+9Nx5u8rzYkMxBH
	vexWwuNEcbnzdI94Hw4oAHOZfqkn39ekmpDkhGs/yEfFiAR9PMNbYFEZ0tHM=
X-Received: by 2002:a05:7022:913:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-18511232282mr132415c88.16.1792159939842;
        Fri, 16 Oct 2026 07:12:19 -0700 (PDT)
X-Received: by 2002:a05:7022:913:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-18511232282mr132314c88.16.1792159938892;
        Fri, 16 Oct 2026 07:12:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm6997682c88.1.2026.10.16.07.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:12:18 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology
Date: Fri, 16 Oct 2026 22:11:53 +0800
Message-ID: <20261016141153.1346219-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
References: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6mQCwXQ5EgnwFuSsmbDmzIF0g8mS0WXK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX8qxDxH3cukgl
 /wUBsKTaEavurwW+LxAIutxoW1+GADyPw/j6AyaiLU4ssLQ1GCDVgo3WQp17cieTomKAOa43Cpc
 WaumdmPjw0hq9JF7GYbL/oD4JUffJmI=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad230c4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pRitcdQJkKt4eD0iFYsA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 6mQCwXQ5EgnwFuSsmbDmzIF0g8mS0WXK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX2OmbaGApyC4/
 e6ZUk/JzazS60xOYBCnxtOTYepVKYRmzZO340z0iF/MKBVkn9ja61WbYa4Ezw27S1BRDoqoaWgM
 oTqXwSC8sX5upRUtb4QBAWABPLlGwWx2Pq/2rStBQScMlbEVTt3lM1wcJZ9Q4r4hRQtuhbmnERg
 TEDtnZdcNnOpgRPPIyoshpHZQDtPNSgQ7loOP//Ii1lw6czS/1IQJPnu+CQuKzdXnkoSOXBD6cy
 49212QaUwkOO/NNLQ1x7T+Yv75gAcx6hDzdTYU2SMrUUhKvVsUp/xmRntcDBzg/tpb217roiGqh
 1lDi8rddpAYuXLFRZyoFzkK3RLmXfQA4XaKjBDygtpmKnhw0cLqGi45rtNhYuDE7SBSBVq8CkRq
 1450/b752p44qNjMGRlCT8oM2CpCT9HHQDmGO5zby/KEV18s1qFY0k8kZb32BjbLbWzzem2aK/S
 v29Hkh07xhGdOlFwHaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160056

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
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 72ccaea1feb3..bfbcf259002e 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -321,11 +321,10 @@ int q6apm_alloc_fragments(struct q6apm_graph *graph, unsigned int dir, phys_addr
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
@@ -357,13 +356,15 @@ static int __q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int gr
 
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
 
@@ -850,6 +851,21 @@ static int q6apm_audio_probe(struct snd_soc_component *component)
 
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

