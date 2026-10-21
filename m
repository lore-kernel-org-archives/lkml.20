Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792555876;
	b=E3eB5fxTlDMA2+HM2f/FhYIPhOq6aQ2Rrg3rJp6Igb888sxqU/Fe5Va2bLOGSZwPv3qk
	 6+oqv+/pbF15rFX/0hY/T4mjVjLGHceJ07QVyYmz+k53mAXgg2kG0+qADAAWcb6YtoySW
	 Xcus57qwephnIjIsy18v6TEWWrIJhYcpAxi5wZ7xchlZqyD9a+TA+74PJxVD+Q4LcptrR
	 j+F6OmDd1tsIT9HA8+Ee9136h7lFnnva+/wd7Vv84QvnJA6VQfijJUOxYt1PX9d8jhzLa
	 tzjdOIB/ZaXiHdRhPQZ9gb5ZnjmmprcxAcAU1a6VvaDcwZ/UZzXmztYeLZ3KrooEgjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5zA0Rbfy8As1tn/Vj7thw7Vz3e4ADheFVIdzKIvos/I=;
	b=igKMb9EGNJ/gxmD73oMIukZwMHOQhWxuS0c+cWA3ZZmX/5WXFaWpQFXsj/boxs93bLLT
	 jk71pKBTXP46dqQ8B2Vi6GyP1lCdI+YhmaEN7INaUTMAHO7w8dd693y5bsMOTJxI0EwL8
	 6k8IEyt8ed1lY/0MvOrEiaxCxqG/FLHbvTpwMnr8oud9KEuCTqKJHeZT8SQkhgtWFlmZI
	 ebCXWaAetbVm90BEKG0WgIGfHuIXsjb9v1ad2NwBXvszWEZOWvEJpdiRWowLEoKNdMRCj
	 gVra17S/I3qER3VPNc3avm+x9ZYwcz8pIqgIGZtBrDxLhmYUeA52wemHWv/vXXx8wzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E81QFQEG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I8lBYY++;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A52606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A52606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E81QFQEG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I8lBYY++
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FU7X1957047
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5zA0Rbfy8As
	1tn/Vj7thw7Vz3e4ADheFVIdzKIvos/I=; b=E81QFQEGf3F3YRiQIo+9COzUgEC
	NLj7QRd5rGi2pQ86kyUv1mWrL2/uPx0VQgJ07o1BTBTeYZt7RdCfCcv+1NtdXw24
	2ht8ndf6Tsbvvbu7aQ7dFJXz04GCcYB/zMKJuiksSFaFKONdOxReLgScYVVlwNAk
	asXCiFzBuzyhcKA+d9wW7lxzYQwhe2pRUd0e7ckZnhZG71h26FEvQHWlMtbU1ebC
	mIrhxFcsEjO+mpAEw2eIe9KciqkqRvxdZ2ovCKFapq4D8Xk3U/nmr3vcSYPkCYTS
	HUmFF9durhAdZbWoLvqNVy+jDMkXAyb39XlXhQ+wmnvV1plYsTLb5WzCCvw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hvbcn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:11:15 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-151ba226e1bso537953c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792555875; x=1793160675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5zA0Rbfy8As1tn/Vj7thw7Vz3e4ADheFVIdzKIvos/I=;
        b=I8lBYY++bYkJOKnvbb2snbjNxBwQmYB5Ys3ycLZkPW3AfmciEGcIdRSKuNr84oUzxX
         wjfqcDSE8td3fFoY62CBdXr+4fLiTXiBbk6FmedE7tefJXLwPhssmU3a/OoH9aFlGA+P
         bhChAv1yDHr/eSRcD+axu/HeknLQjPFseRwOWgB6fG5g8NxkXVrD80/9gRdTjZiVJV/y
         Sv4s6+7ALRgppT9M6WARAFZKelWGkN0+ZkGHehCy7+aJv36xd5gndUY/Mveo9O5/2G6c
         fqEgvszL76EkgqoM2fA4s6bV2xS2+XQiLzmY0RSC6RaS9ZFNkTr0cdW4IpSVz/3lCktl
         bVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555875; x=1793160675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5zA0Rbfy8As1tn/Vj7thw7Vz3e4ADheFVIdzKIvos/I=;
        b=vqL8aj+uioc+F7bgEH06Ga9vxRa699E13E0dIvjdRKIJZOqcxtJPEsRvaVvWjVCAsZ
         Y0iJcEMWor/mYr4Ez8SpIh4oRIL6/yKg5QNoYko5CHoDqHLEYIkLWlHlKVQaguhyQ3Hd
         RI3E7rkP0JRCkSz9rGA/kR5wsrDBWAoEk9zyHkK4/oBVhb7uzlFP2ZuxCHRYGyoaBcIk
         2nN/0M4aaqQLjICKKy+sRqpkm7gReKK2Y39w0euOlYHkZqo90+xgNNiqHmrin8XqiiUR
         UYb9qbGHTPfEgHPkilrFrl0/z4y33PbQc69vtO+KOd3o/uXYKBIPkJFN+zWuX/tuVYY4
         q42w==
X-Forwarded-Encrypted: i=1; AKwUvBxzcSLYB4zuBp5VHFY2QKa4zGUSFeU28SZE0RlFXzMQbYoD3umJIp4yMGungB9a5OjzJt9TU5VRBVuZRd4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZqVKT0nPNK7JewfUmulkf5zAaOrTB2kgaPRaWEukITQuD5NKP
	oawpLTemjDC5XQJgD/zDU45gGaBIV3qZwgrtimJq5/yhXEIXGoX4IrNoce80JioC08mDVeloiv8
	ePhMrbjeAoz1jyOr+YjYm11o8G9Q0o/Jytqeqz4aE3ogokURCnsMurFJjaPdGZdulzO0=
X-Gm-Gg: AYBFou2CNawpeRMh13VLoCUQbD76leL7xFbDSs0oGp71tB+HhuEXXD8MVXd5lE+A5C4
	D/Mzemu736/o3BCcW1m7OlBk7HDj5/rWrBfeb+LFK866gnGP2NJYOEewE3VSx/yed00RKEskeHO
	NO5uafaO3yntek1+zgkOo6uRFX0qPqShQNps+wTSCgzUhjHf+nFo2Ntvi5n7YwtJFNd2YENZY8Q
	+Zm8UVVpSFsW+qzKxPzURdlKee3BlWxIDxjuoZMvjllt7XJLS1V9QkQfnX0pU8TMDh4PXYRLQsX
	IimXo5hEngheymI7Q101WTgnzJlEuWSkZEoufD3eBDqTRR997xhAxcYEJ4dP5DXD12mIXUXdF48
	Fb2Ky5RSeRTWE0A8+OzxHUAgkgyK9OcWiGexBzJc71Y5T+nfv1gHY5RhbvAo=
X-Received: by 2002:a05:7022:2507:b0:151:ece6:b16b with SMTP id a92af1059eb24-190a4c1fa2emr1644372c88.7.1792555872250;
        Tue, 20 Oct 2026 21:11:12 -0700 (PDT)
X-Received: by 2002:a05:7022:2507:b0:151:ece6:b16b with SMTP id a92af1059eb24-190a4c1fa2emr1644271c88.7.1792555871045;
        Tue, 20 Oct 2026 21:11:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2915427c88.22.2026.10.20.21.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:11:09 -0700 (PDT)
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
Subject: [PATCH v2 2/3] ASoC: qcom: q6apm: Clear the right handle on pos buffer unmap
Date: Wed, 21 Oct 2026 12:10:43 +0800
Message-ID: <20261021041044.2080369-3-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfXwRT05gFBQHei
 wGIy+61VmSHVSAYgAxkCa5dcoa0J05wq709iqBKudyooZj+pTfy0SCfUS8+z47914VEt31UD2X3
 a96knCnAcEdlFX9wQWhILwQ8MZjKa9DmHiieKOZnpMgyyqa3eZuJio2lpkbjMimaXEPGDG/zR3T
 NHRfiwNKrQoUtvroRRzb9YBRkvpe+uuADZDW1+v7z5tG8tJvELedyxcBeLshCiVFKB4OVhooAud
 ug528O7tZDKYzsuGkk2pF/kLfYhn+SZQBGn4xlAvNHqm0X108AAwOzeG0lgUK4FI+69DaLURcG5
 FFNIeaQ3/rH3mMDD+gXMp75eEsSU7CMMzXzq/m/RisVRG+LXFN1MzBQpEw6n4/6aUlPQCZ8fB1u
 DuqimI7MSkC9CqSL8694QETMpgMxOAI1uBMtrpxE1p0JusRpBlsxXvx+Ltu29BL4gLTELyow3nq
 Q6ANmnuFzPQc4qNXDgw==
X-Proofpoint-ORIG-GUID: 35fLw3s4Jm15GHcZ-XAZrcG62UAWDsYp
X-Proofpoint-GUID: 35fLw3s4Jm15GHcZ-XAZrcG62UAWDsYp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfXwK/6irrYN7OQ
 +k0zgag2RznkJu7bSWOq1I3QEtjyqZUOj/8hJUCGCd412YkQBK+PWB/MvPCl76lDHE4bHWSgBdb
 g8oOEDSQ7M8EmYuUwOt4z4yb+a5nOM0=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad83b63 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RRt428QXv51Blb0ChN0A:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210016

Push/pull graphs map two shared-memory regions per graph, the circular
buffer and the position buffer, and keep a separate DSP handle for
each. The map path tags its token with APM_MMAP_TOKEN_MAP_TYPE_POS_BUF
so the response lands in the right handle, but the unmap path sends a
bare graph ID and the response handler always clears mem_map_handle.

Unmapping the position buffer therefore wipes the circular buffer's
handle and leaves pos_buf_mem_map_handle set. A subsequent unmap of the
circular buffer is skipped, leaking that DSP mapping, and a remap of
the position buffer is skipped because the stale handle looks valid.

Tag the unmap token the same way as the map token and decode it in the
response handler to clear the matching handle.

Fixes: 7c1ac23b178a ("ASoC: qcom: audioreach: Add support for shared memory push/pull modules")
Cc: stable@vger.kernel.org
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index fa7f5dfca418..0e5219a6513f 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -329,8 +329,9 @@ static int __q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int gr
 	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct audioreach_graph_info *info;
 	uint32_t mem_map_handle;
+	uint32_t pos_mask = is_pos_buf ? APM_MMAP_TOKEN_MAP_TYPE_POS_BUF : 0;
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(sizeof(*cmd),
-						APM_CMD_SHARED_MEM_UNMAP_REGIONS, graph_id);
+					APM_CMD_SHARED_MEM_UNMAP_REGIONS, (graph_id | pos_mask));
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -966,9 +967,16 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n", result->status,
 					result->opcode);
 
-			info = idr_find(&apm->graph_info_idr, hdr->token);
-			if (info && !result->status)
-				info->mem_map_handle = 0;
+			graph_id = hdr->token & APM_MMAP_TOKEN_GID_MASK;
+			is_pos_buf = hdr->token & APM_MMAP_TOKEN_MAP_TYPE_POS_BUF;
+
+			info = idr_find(&apm->graph_info_idr, graph_id);
+			if (info && !result->status) {
+				if (is_pos_buf)
+					info->pos_buf_mem_map_handle = 0;
+				else
+					info->mem_map_handle = 0;
+			}
 
 			wake_up(&apm->wait);
 			break;
-- 
2.43.0

