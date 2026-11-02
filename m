Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649487;
	b=g6NENbpPXzZSmAV30crW2ldQDbpaM7IIhklygwsFnMeNQAbWyHwMPYYvb0dOQikpmmLB
	 aT5A+GI5f/vQk59uwbqlU3ALo30KIUVGLtY2w+eit+EJx90aGhJVwFGgYZBvgSHQSRTL7
	 k2ji9au0LuFDYtwI8Oz6832v74l2NYtV0Os00hhXllPtKgNKWgy+TETVejMZBCmaR1Lct
	 Yh0lLZtQqIZT/C833DR78b7IBP8DkirvlHG4qGWSKT5crBcAKsWKW5zllpPVr/8Cz7DAB
	 ChwPR/fFZZtEJJTJJJgpQJbvwoEXUg3vG74/PRFV4HDRqQgG0CwjiuoDsOjkCfcfdjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Gs8th4SEozRoaQAfmCE6xTxW3o2poAMT5v1gu4UQZJE=;
	b=RyiDDgMfmzaaS1eeNLltlGSzvW+4j1o/Vp58JwJe0dS1AhCsw640SWXVlEiczF7XwzuE
	 ippUZnZ9Bk/9J5WrY2rDAqVXVLwaboMwm8TNtkTK/dm1oMDsKYVJ9+yE3ffiBbDW7Yu05
	 utjlCkzbqZLLkSBBKM/QvPvxkBeh0XzisBUY23ecqEglLFskckGSbHj1uKZUda7Lx/yXM
	 RdN8EU55pzQ4y1fpnk9Qj+pEYGhK0kl21HRAuvM6bLVHnw6K1gO//QLIaJ1nKM3u6HgnB
	 F4g8bf4ggRPx0GHVTGB6Z94Mev3XPN7pZDVyZIowlJR+uKkLH+LtPlSFhyCyfdPmDHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lK1UUgMM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S+bgoDWt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55F7606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D55F7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lK1UUgMM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S+bgoDWt
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2HPFId1383144
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 19:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gs8th4SEozRoaQAfmCE6xTxW3o2poAMT5v1gu4UQZJE=; b=lK1UUgMMQ4M+nSdm
	jUtNwcV5tUBSKR6VI2R4h7mhNBNlagdmdy+T5VFiGgfsxWwW9WmoEAi06aev/fp7
	DwlALsquMaMk+4vq0QEGuo4DovwMQcJ1vOTfzJDPuaeDoQJvZSe5yMiGDnygDQFm
	5wgXz77DMcZ+2/QP1iNQskQVWiSdE0xa8iktbl/N59BeMM4mETI/ieHpHjHzzTPT
	zGaR32W4qFzp11ouwiyk6C8xUCa+68anUg7SnvqT/wqjqiHlxcxmMHG4U5PVR5h0
	oDkbpKnLfSxwsCrEy88R0PEqhaGRQLOCokS7Bpvm2XjOlV6L0fXx0East22/lbKR
	sbYoLQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvtpa3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:58:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so4691531eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793649485; x=1794254285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Gs8th4SEozRoaQAfmCE6xTxW3o2poAMT5v1gu4UQZJE=;
        b=S+bgoDWtqdZduWFKiJh9PmQHV0MQVG6us4LM69nImM0I+snLk+16FdBCZF1tqPVY5i
         FDsAtUcBd+PARiu7JBS21L7ap2pS70bHDMHlwxL55D45AObWO+gro/1J8JOVznxzhjm7
         qv/X/5S88NEemwITAIhECF9qhtrvb2THLor2Ue32YmbsVuBkYKzQHomrpqeoW8ZhujqN
         Q7ahp0LjHMqBXuw2bxqEhKNAeb/Dkck2gvgpnWZyPnBvuSdskp6ukp0H+RTCtiuUmM9l
         O4d4DIa1tc/FGmMNSVsVyJ845cPXiRJJ9m2a/78pC7EdkduhBMoTWEWFswSrQOpiVvKC
         Gimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649485; x=1794254285;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gs8th4SEozRoaQAfmCE6xTxW3o2poAMT5v1gu4UQZJE=;
        b=Amoiu87pXDMxilzsOGUVFF7MYEqtVweEF09t/grqi2TcQSTI8OnjrUNsAmfiNcZ9Dn
         eTv+N7YU5uOzFzC+BSQV6lmHJLxIFo8KxdKC928PHQPevKNTG2G35pniCB1CUTEB1p99
         A5jVF1jiUGverQhUByiT6bAXhq7HhgBoAQ3UiYnaWeWE10u5BqmaAsr4uWIpwEQDjuB4
         Uer0ycUqIW8A8LHUxlW3IQLvZzPKJ6hvUC+LHyB4ZbOnQOGURPHOxrIj+N2nUp/Y7XCX
         NkLMzi2m935/LUBlRAZGOMZGD3eY4GwPY/Z80AL/+N+wM5m+fDSDUkxQOcEjccEvSeqj
         KcRQ==
X-Forwarded-Encrypted: i=1; AKwUvBznFEAx6lPqcBKTYQ20m2QcTBGDCF5nVf2kWSzEWU8mXoN+RaE6GAEz34D24N628RPvVx4OzQj4ggTHRZo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpbFUm7M17AvdFKrNkV4e6ttttps43aOMcDtzVGwHauvNLpCVU
	V0o+waKre7jtKI+kBQnikm+TmhCXLwuiEbtNLl/hobvdXrPIsfDKrroAItqRBf0OBt6CqaAVIYf
	QM1dLvTx7SGg4PvZajNj+wywkCUa9AzGXJk+mfaCtjfTuAnI9yGm9cTCAFTm3h1LTW0s=
X-Gm-Gg: AYBFou081fVCk10wo2BqTotrQlJFhP5OJTgIiNkaXnWaSF84D7OopRHX8cEb9TAoXA8
	IG2jpUDe09/EevpHTKXXYZjHltAhvzZ9SlrEb3NTLMZgkLaLzsvu9dqkxplkj3fTKmGICCHy2w9
	yebJqO4naux7uYe2Sx8eCnFDeSa67GOsJDKL9KsUznBRnlzka2+y6QMmryQ8jXjZpFSrhvvQbQN
	wtsKD6x5kKZNyoSmooyFkSVUsQLtzxQ0ZKjsQwvLTbN+rXpGeueSxLbjUZEOfKo2Q+ffYLg2v7C
	964+WrBZtz3QN5bnvXGTc+hkri9eRt9KcbHNGBsvwI62kyhY3V/4OtOQNJBcKW5pKEv1GxrjPeP
	ObCfiI3OU+b+BsqwEIz+GihPkWTxbzugYf/hNXHkA41XrLth5aAtcX1o8wR83CghREq52+/OBQL
	PA2XTdq+txHsl33aKrDgQmFwIf0g==
X-Received: by 2002:a05:7300:7a83:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-36a42362460mr15804684eec.10.1793649485219;
        Mon, 02 Nov 2026 11:58:05 -0800 (PST)
X-Received: by 2002:a05:7300:7a83:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-36a42362460mr15804647eec.10.1793649484607;
        Mon, 02 Nov 2026 11:58:04 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm46910086eec.25.2026.11.02.11.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:58:04 -0800 (PST)
Date: Mon, 2 Nov 2026 11:57:58 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "santino.wang" <santino.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
        <arnab.layek@mediatek.com>
Subject: Re: [RFC PATCH 03/11] soc: mediatek: dram-ecc: add tracepoints
Message-ID: <20261102115758.00005a16@oss.qualcomm.com>
In-Reply-To: <20261102092334.138759-4-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102092334.138759-4-santino.wang@mediatek.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8eb4d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=sXLBpHRKkfUpVznMtjYA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: n-YPxvhkc0xa_IPasnJ07HTAQ22XBpxh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3OSBTYWx0ZWRfX5T0QB+sMhNcn
 abiE03GqOMowzmjEUfIDiyGkmalgdK69FsqdrA89BvlbfyVe6h85rkd+r/Amojlv5YH2mqX0I0T
 FLjj5L17GbHqUabFDFLatDgt0ZdKRAg=
X-Proofpoint-ORIG-GUID: n-YPxvhkc0xa_IPasnJ07HTAQ22XBpxh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3OSBTYWx0ZWRfX9ZKpvks0XafN
 JHGaoCaKXKWi8u6REm7VsVD6FO9Mk4iFdPxcXm725LkdKRnmkTjGOCK2koiSPZGYNpF8oZVFhU3
 uza7S5jWIoOmaJbDYSdYFneu6vbr6VAtAdfVCcQuOEYAt1mGISThnOSsFMm3LN+dIQ3mNlarCx2
 PMb/JasKaq5bgprRcLAmBJc5lab9EsFBz5k3gtkwKA/CzMvcpLGctMbCQd3s4Yai8ZzOqrInFFE
 vVjTpDHj42ehLcmp5PrbJrov+7TQWQFueXLoGghWQTPZ7ym1YdRASHTIu5eigxtwrzDTL4bL+oR
 GUYqH7049bBSPqVBXSzSsKw09oH9bzSZBYSWgAOeX+UvrjatRVE1YAriNVkwctupEpLmNaCPs34
 buDCATh9tmMP95oXKkbrL9oM71Amh/w+x+KHzSmlbnjviVSmPNj1Ixapl+1m7/tqUrucjkstZz7
 HtF731XDWMhIKyN86mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020079


> diff --git a/drivers/soc/mediatek/dram-ecc/core/trace.c b/drivers/soc/mediatek/dram-ecc/core/trace.c
> new file mode 100644
> index 000000000000..9a8b20e48069
> --- /dev/null
> +++ b/drivers/soc/mediatek/dram-ecc/core/trace.c
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 MediaTek Inc.
> + */
> +#define CREATE_TRACE_POINTS
> +#include "trace.h"
> diff --git a/drivers/soc/mediatek/dram-ecc/core/trace.h b/drivers/soc/mediatek/dram-ecc/core/trace.h
> new file mode 100644
> index 000000000000..d603fc38f0a7
> --- /dev/null
> +++ b/drivers/soc/mediatek/dram-ecc/core/trace.h
> @@ -0,0 +1,119 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2026 MediaTek Inc.
> + */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM mtk_dram_ecc
> +
> +#if !defined(_TRACE_MTK_DRAM_ECC_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_MTK_DRAM_ECC_H
> +
> +#include <linux/tracepoint.h>
> +
> +/* driver lifecycle - state: 0=init, 1=exit */
> +
> +TRACE_EVENT(mtk_dram_ecc_lifecycle,
> +	TP_PROTO(int state),
> +	TP_ARGS(state),
> +	TP_STRUCT__entry(
> +		__field(int, state)
> +	),
> +	TP_fast_assign(
> +		__entry->state = state;
> +	),
> +	TP_printk("%s", __entry->state ? "driver removed" : "driver initialized")
> +);
> +
> +/*
> + * ECC events - spa/channel/subchannel/rank/bank/row/column decoded from the
> + * ECCERR_INFO0/1 entry that determined severity (see ghes_notifier.c),
> + * mirroring ATF dram_ecc/mt8992/fiq.c's decode. No agent/master ID: ATF's
> + * GHES vendor section doesn't compute them (see mtk_dram_ecc_event.h).
> + */
> +
> +TRACE_EVENT(mtk_dram_ecc_ce,

Why push these through a custom tracepoint?  This look very similar to what
is in the Memory Error Section 2 CPER.

> +	TP_PROTO(u64 spa, u8 channel, u8 subch, u16 rank, u16 bank, u32 row,
> +		 u16 column),
> +	TP_ARGS(spa, channel, subch, rank, bank, row, column),
> +	TP_STRUCT__entry(
> +		__field(u64, spa)
> +		__field(u8, channel)
> +		__field(u8, subch)
> +		__field(u16, rank)
> +		__field(u16, bank)
> +		__field(u32, row)
> +		__field(u16, column)
> +	),
> +	TP_fast_assign(
> +		__entry->spa     = spa;
> +		__entry->channel = channel;
> +		__entry->subch   = subch;
> +		__entry->rank    = rank;
> +		__entry->bank    = bank;
> +		__entry->row     = row;
> +		__entry->column  = column;
> +	),
> +	TP_printk("spa=0x%016llx ch=%u subch=%u rank=%u bank=%u row=%u column=%u",
> +		  __entry->spa, __entry->channel, __entry->subch,
> +		  __entry->rank, __entry->bank, __entry->row,
> +		  __entry->column)
> +);
> +
> +TRACE_EVENT(mtk_dram_ecc_uce,
> +	TP_PROTO(u64 spa, u8 channel, u8 subch, u16 rank, u16 bank, u32 row,
> +		 u16 column),
> +	TP_ARGS(spa, channel, subch, rank, bank, row, column),
> +	TP_STRUCT__entry(
> +		__field(u64, spa)
> +		__field(u8, channel)
> +		__field(u8, subch)
> +		__field(u16, rank)
> +		__field(u16, bank)
> +		__field(u32, row)
> +		__field(u16, column)
> +	),
> +	TP_fast_assign(
> +		__entry->spa     = spa;
> +		__entry->channel = channel;
> +		__entry->subch   = subch;
> +		__entry->rank    = rank;
> +		__entry->bank    = bank;
> +		__entry->row     = row;
> +		__entry->column  = column;
> +	),
> +	TP_printk("spa=0x%016llx ch=%u subch=%u rank=%u bank=%u row=%u column=%u",
> +		  __entry->spa, __entry->channel, __entry->subch,
> +		  __entry->rank, __entry->bank, __entry->row,
> +		  __entry->column)
> +);

