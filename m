Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792555869;
	b=QIwdLIJg3uyDz5Z5w0tyQifkBS2qGtAEgf6ly/SHdQhoHmTyyqSaExC/piabM4xrrArH
	 by0IXht1Z34jV3JsGdUClaMJdLxhuejT0QLK1Wf+oJ6gn7lSh3diesg/b6AAXGAIpmmkL
	 2hph78qCeU3sf+LNaFeVQGrIc1F0Gyx7xXRtz/pGs4DINk9x+jwKw7avwv7UW0fhjlB0L
	 VahOuZDTqIQEcrrewQXZTR/jNQkNCF615oVwryKr99arE510LlO4eN8WD+zN5jk61VUCm
	 B+Go3Ck5ZZeoLGjg/UtksjTu16LK/M8jrxL/HXszEiMwHUZ5GvJiBJprEV3WvaiJ2UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zhuJnKWcj8cUHo/PEz1Va/bf1tnOQvpmNsWA1F5i0cs=;
	b=T9268s1yDLvhzC5PCRWDuZcJLPUwmvWXcmbv3EDmUsYYCLvGhOgmbjC8wr4szp088uQp
	 q5dL2QJdRzM8uYHNbA+RHXpdMkEyXjkXiRq84E8fLcEHKSP+xExNOH25WilvmnN+ynUbT
	 bAaWo+A3Q1ra63PJCuWrz02DTl/JJSOi1a4+h/ZB/6yIkAg4ipDaHzvOsil06hj+5JoyM
	 m3nhkYqhzcEeIlYMKhV3/GMLjVxcHjPBAyAjm/qY0sNqnCRO8sH1ra7cqNNkqhU1lQZlz
	 JEWFD1K9c8iyzTCrtvbN7AjPig6iIhH1yRkbYhKkvweuz18fWcrJ7Pak+O2zyZIz8pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gk90BPHI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5ESlgtM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75175606A335
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75175606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gk90BPHI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5ESlgtM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2EtMh299870
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zhuJnKWcj8c
	UHo/PEz1Va/bf1tnOQvpmNsWA1F5i0cs=; b=gk90BPHIPojeGzVUtpXoQJ8fPSK
	uW171tR3eTqIBZrHbpUVJvjnKbpOQbRkKzancOWX7RE/QrR7Cyc1HVbY7LqK588D
	ZyqYfW8bNIm/wKruUfmMEGDxD8gEjS7I7iba/VQ3Xqrhxej4IYnCW/7p1t1ir+z/
	LR/sbwI0m0bsnTcR0l3+GFb6TINbVPvqNfZC5iKirvrXlIDlJxDIBJ3SaL7qSs/E
	pSvUEtCOtrLsy8a3ZIidPEOSeftQxzUxeiWhXUMOpDjvhWrkXuWDjOdKKcingH3l
	CLh5PY2Sgr/CGsUzWGVUB4/6jcRXI0cPz8XSk2UVrmliOFTgGQBk+GWAnDw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4svn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:11:07 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-155a75f91e1so873702c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792555867; x=1793160667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhuJnKWcj8cUHo/PEz1Va/bf1tnOQvpmNsWA1F5i0cs=;
        b=W5ESlgtMrONpjJMsVy19YU7cjhfCbXxUh9awRGePlAnKTZMTvnLuznS1MUtuL1rxm1
         wo8616lBFpekGJYQ1pfjpWl+M1s7kL1YvSl+i35EeymTgO4o63tPx7CAiMFm+kI+T9eJ
         AStYbI9IzTNWzrnW6ywV+YQ2yxXQDtqaRmn9C7tKurTAaU0Wrqggtj5OE6cxVfuJn3bn
         Wfkkj7YCpdEDVT0hw4x3Lbd9W9DZjX6HDRapqcxpsjVE0sakwekKwAxlVtgqyV0Mp2ju
         tVMcbt/gT6GLCV/V7RMc/NAFoD/I8KLWPWkVcZGKPB8+95XvVao+1YA5g3ZCDH/rTNDb
         kkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555867; x=1793160667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhuJnKWcj8cUHo/PEz1Va/bf1tnOQvpmNsWA1F5i0cs=;
        b=DBvRY7BA9gdlWWPzl9AnyhPW7LYXWcwHTSd1WPt6d60o9FacIprWsozkOLEZDBL4UU
         3qlVGr2tKb0F2s7JLMLPtwaImCcSLmsoKzfVVP+/ynbQW6IS30hHeqW6ay0T5niKVZDb
         9o8dKS3M9UrAG3T8Azp6YeUkotEFor5mlxU9dUbhslWArR0qhEUtS7GmcotcmZh3RXo1
         63WEagjA8JGa/fFYAszwJ7Xh3nRli7nAQrvO+MjRpO4bh5GDvIB3315XwZ0NcwOeAiQz
         JCo3CRSsmJvaPXpMPl9g01FBuFUZLmKZHjeEDw/tP9Heu8ZR7BzN4rXjITEzUCbgNxPQ
         2aXA==
X-Forwarded-Encrypted: i=1; AKwUvBwpyE+rRnOmka8piwrz1+I1NnCyk6r4rpTm6p9zVDoB1ILKPIbvWpUBtdQNvcN6fyICFcwMCCQuUUg5SKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSO4BYmKRwW53pYAnsLh37UwficfG4Dj5TiJ/u7MlCDdSwOgeB
	nhzKH4986wdYkxBonyauHAIeTcmJVICPmC9Npk+QaFqHPEl2t7576kMM5FZx/tb3446gDfxqBRi
	KppLwsxZv3lT5KTiBIKXQdsxK87/R5OiQEPjUk1dt85LSZCoSbrkQo/+VqCONeoDdM7s=
X-Gm-Gg: AYBFou0dhw69Ydfj2SCBqGU+glFucchMZzljlAPsp83jYFhi7jVVNgqsF7x6G+UBki8
	tHhfOMjMPJsk6cTpVJfo9MYHnRR+q45qhizIV1pB9/eR7YHxNcVhlmpkWHKL7I2FiinuTgKjIbG
	o9/ALK3CN4I3YxRdT/EdDLE1nXxJuTzwi80Q//SBHuH7RThb4GmtCOHfSGvzzCFSuAK0M0dK3Rw
	DQRDFYex/2jL7gGuXsWPoWDGV9DVtkPIDzWHn2DyJQeEHGhklBHJdk+2Bqz8D0hyXyNzfLOo+g3
	MNdTATHB83bRoSSpxUD/PBNRDGa3+2nMieaMK/t+CHsVvlwoDQ4LexRHtlaS8AbNlTxrW1kMC2a
	CKarRiQGcZPCholCzA5tPe2LKntj0JiOax4BEjcodfxrWwfw3Sxs1vaeDXPE=
X-Received: by 2002:a05:701b:4584:b0:16f:1e21:7006 with SMTP id a92af1059eb24-18db7b92510mr4050325c88.1.1792555866926;
        Tue, 20 Oct 2026 21:11:06 -0700 (PDT)
X-Received: by 2002:a05:701b:4584:b0:16f:1e21:7006 with SMTP id a92af1059eb24-18db7b92510mr4050292c88.1.1792555866283;
        Tue, 20 Oct 2026 21:11:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2915427c88.22.2026.10.20.21.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:11:05 -0700 (PDT)
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
Subject: [PATCH v2 1/3] ASoC: qcom: q6apm: Fix unmap regions response handling
Date: Wed, 21 Oct 2026 12:10:42 +0800
Message-ID: <20261021041044.2080369-2-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: wXgbGHzW9oz2XPX00PvcAjpP_-QNylhJ
X-Proofpoint-GUID: wXgbGHzW9oz2XPX00PvcAjpP_-QNylhJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfXyOaEfWSTJkrc
 uoCWBIje6wAg654CqBj/NDLP7sl1PNBwNzw40TRikkKie/Mk/jlG3DpvKGdQxk+E7mrz8D4szLV
 utpoIrAoMHMH+HZT/hlft+gB2N6uUVg=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad83b5b cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RRt428QXv51Blb0ChN0A:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfX6JOaDj0wQwki
 loREw1ht+lxcvTxpZxcgF4HrKW1VS1All2t8n89GZoBxtCCM8WdsV/8ldaa71K/lp+f1icABI1J
 vetu5ogJip5ctat+cb+s4q4Pb5gxsolxAJX3qsXP280LwdeXsl0aABvPu9ecqo2o2MkjtkIUQqE
 b17EUJELQQ1rNOS1QKVJOSZH2BKUolc/bdeFMCCgUeXVTggPS61iT03rcFO++jj4RiSoeSfwjuc
 KmRiVY3jwpWDqtUuvAZlkuKblAoxlGHreoeB7sKGZgrx+rJXQ7+i87NtFCsvbtvp74TmftfnM5I
 tqnUpcj+x1/4VBu9xGuc3zGH+wTxwgSSjf5PABP+telxh2HljLhyCZxMNSJmwWrtmTWIkdrTK0B
 mmujYQ6aMe1WGkJl2tCT3CC/KsFRipWX5Ef6yYMLrXfFd6A871qbaPnzHmtu08ZCxcX9JsfPkLl
 1dN7Hjjxl48IZXejh3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210016

The DSP acknowledges APM_CMD_SHARED_MEM_UNMAP_REGIONS with a
GPR_BASIC_RSP_RESULT packet whose payload carries the acknowledged
opcode and the status. apm_callback() stores hdr->opcode, i.e.
GPR_BASIC_RSP_RESULT itself, as the result opcode, so
audioreach_send_cmd_sync(), which waits for 0x0100100d, never sees a
match and gives up after five seconds even though the DSP has already
processed the command:

  qcom-apm gprsvc:service:2:1: CMD timeout for [100100d] opcode

Each mapped graph costs a five second stall on unmap, and the forced
status of 0 also hides real DSP failures from the caller.

Record the opcode and status from the response payload, like the other
basic-result commands do, and only drop the cached mapping handle when
the DSP reports success.

Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
Cc: stable@vger.kernel.org
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index b6b1ef6833b3..fa7f5dfca418 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -960,17 +960,16 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 			wake_up(&apm->wait);
 			break;
 		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
-			apm->result.opcode = hdr->opcode;
-			apm->result.status = 0;
-			rsp = data->payload;
-
-			info = idr_find(&apm->graph_info_idr, hdr->token);
-			if (info)
-				info->mem_map_handle = 0;
-			else
+			apm->result.opcode = result->opcode;
+			apm->result.status = result->status;
+			if (result->status)
 				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n", result->status,
 					result->opcode);
 
+			info = idr_find(&apm->graph_info_idr, hdr->token);
+			if (info && !result->status)
+				info->mem_map_handle = 0;
+
 			wake_up(&apm->wait);
 			break;
 		default:
-- 
2.43.0

