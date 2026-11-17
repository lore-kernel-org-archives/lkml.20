Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908398;
	b=S5MOWKDemqYrtKYDclSiDMgOS8g4bn5jXvj6iyCI6UQDQcrkEwUJzv8FnHp4s2dlOYie
	 UA39hVwBxCCHh43NXD2MDg3ai238QlbHgM+cfgPaqzWOYrjC6a1WZBgrsf+kVUWW+8o5r
	 7aZ6vJaiDedPkPFlRuoSk0b13XfADkGblKt9J7u5nyer1bGXDgM/Gj+DjGLjL+oh2WLCe
	 y7kubHNm673f4VM3axhPEXWA2eHc8FC5GCXbm3cizOzrKXqfKAfeo1TIJQggslmNT4RkL
	 OfwZo/Ox5LLTUPB6I5HDQAGKk1mGToFzK+4sBoxtGfNNZMPHTibCYzxloeYp9gUwAdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L/i7IYiuIaVVWbjkdWvvY+6fiNJJwG9zMVxNqhNCzTY=;
	b=bd+J2YJnSSdOOfvwAqXvLfcmCWFZdY39ykjyAFLdHNpFMbEXV3wOHkFu78w/x6Ck3Jyt
	 BAw1YyweIH/Rq+d98xSVgzznRUOXAoM9RmCwG6/ZgII6sSXfE34niNsmjASKKoa5EPR8T
	 PGLlMh0K27ob9PVsMc1MavaLpWI84pHbdl043Px7/pZwhv6TTlwSV4tuU8eGG3L42A0Ff
	 p6izfkK5NJBCuqFLmeElOsxgQun5z4muA9kBwmraFUCFUtZCkKE/aLjJBNPY4JzGADO5n
	 kMA+PJPzHe00XhU6JqBXYVyFOrGMWpc1qpksVw5kCtdGyY78vKkVH3H2e0M94GiGFog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K5EX1VGn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jfgMpGZk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEE9606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CEE9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K5EX1VGn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jfgMpGZk
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8nLcG844338
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L/i7IYiuIaVVWbjkdWvvY+6fiNJJwG9zMVxNqhNCzTY=; b=K5EX1VGnwQ0lHazX
	Qn/VB1nIWA0KwSp42sUqG0nCachWGe7zVf6S6RujqTdQ60QB6tU7WFT3Kq6Rh7jb
	Xt2zUSkwApWzF5N6slRgZUlGIalfmVJNXPh9/yIr0Ns6Sjz9U9s2Rvt7KzTfgHJU
	XFu5wAnAiPGUDW7s7elNoC3oqmQjhyKQoKtXoxGb5pQfJKvvrZ84p5xXeBh+WaR0
	jAxPJddCH8d9YFIEJyoyn9Pyv42SO7lmDb31HJRklDoVasfcHHpFsS/CaPEhqSiP
	cGQ9dM9+qarHoXyS4NWKIe8EKR5RIU/VYCmUGf6cQEoEYBQOHZaLsO/+5S7PVq59
	DUSy3w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h1uv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:39:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb8c46e240so2530794a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794908396; x=1795513196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/i7IYiuIaVVWbjkdWvvY+6fiNJJwG9zMVxNqhNCzTY=;
        b=jfgMpGZkLdFKJeovVW9ldelVBoaCw+2PEWzewgId4OejIpjDGhCGzEIdYSU07RaGcL
         /7LL2lI8mwJ6f5MpgA/uJIKpxIx4dF0F+aoxOLoqJMxmXhmaR/ye5x7uqTtU/hB2dd61
         Ksy3EkMgx1+6oEGb8ybr3qiStxJuQA171MG+sNhPfUBvFKwA9UkfoNt+sJxf5lHY8wnr
         qDT88r6XEklvl0P9NZGXHaFpGP8R5Q05gDCbWA3O5VA8YXDIehqH8Er0bIyiyJ2h7UKA
         b+g9kTBuM1sa8DY6oeXeCtI38nDohHJphltAANNExPmYrmTvW4LGiTOVifIK8YWa5uI8
         XUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908396; x=1795513196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/i7IYiuIaVVWbjkdWvvY+6fiNJJwG9zMVxNqhNCzTY=;
        b=H8bt1N3W8CSbQD8ZgIbgFgfaMAl3+sWhs9L67e0q+imhqep24qIo4FLoUcAzoe4/42
         GjQ3bN0JEtdnTOQ/x/mpOjYQNyRaAAbMClhdTe1nr37R0oCouoKPEfbNVD8I2IGr9m+w
         I5J3RmbNrEjdHTxdgXxn2i/Jh+qs58hHv9Xj0rG8Bp6/WmM2gnLdqGVDkDIJNTL8XOug
         CCKYasWTQ2UfOP2bIARFJ7JK1rGySKri4lPn+4FI1LNHvGuqLzYYmpBtKCkRvpNwloyG
         d7fA4wG3Zla7eMeG4KS1JOcWDpmCmtC6ZeR9wzjLZO9/cmd+EgkvOlu8sMwvJcUBUCAZ
         ELJA==
X-Forwarded-Encrypted: i=1; AL+hErFwWXK//WBiaAzHjoDsGRfxxgXnlG7ldax3eVmHUx3VPYZUTvq4d5ExanmxeWfw6+xB5P/dIa/TA//XS3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VmHyNNgJYCrnAdOHhcVYcpl5QMNxVXVENxiB3OrPS/qNhGLbi
	YVG5YYTuYZcw133RNyBWP6K4dvyigMDwKYnnHZ1h1CUxRxg6PBwD9rMD7sgstDbvFq52P1/48Ei
	VLv2fd79kzZ8b8iXhDu0fWaJ42wvpwK/WVcuUX7iHgJYtKs6wCeS6GpOHZxcw4mOiFic=
X-Gm-Gg: AYBFou1QFd/8BNSC2kj7qAYFdzc0mEYGdagD/dtP6wBSr8bztyqDyhKOXi3ApNmkLt1
	wSbKegvalqyWJaGDR6DWt+Q/ZCTTt9NNhSx+l8rwYDzq0m/MTCh68bX01H7/cjWQp13gCX+Hvl2
	9LhvKQ7OKl+9km5jgYpcuepjcKwjFMBOCgmONlbQSK4eAyUI8rYstdwknBdr1xrtf4pNFJjkf7G
	YS0ZWqWKOO2VRYQc0+2PW1ltiT78hscEiLyHjcIGPlyAhIWaPQ0pud2f7U0MDVXa1XChNE402k1
	Nm/+9Opz5RFbL3nIdhbfGcmZYRiEDBv8FQcHlSzCN74qZoivKp0OLeoH0r8F+plP4DiIvXibKkd
	EY8k4BKI6WHKSl8O3Kf2SGvPbqysQ3OLRSB09UMHKSdXcI0jpp19ZhdOyHA==
X-Received: by 2002:a05:6a21:200a:b0:3eb:aedf:a93f with SMTP id adf61e73a8af0-3f7a81bc2cfmr10369239637.47.1794908396114;
        Tue, 17 Nov 2026 01:39:56 -0800 (PST)
X-Received: by 2002:a05:6a21:200a:b0:3eb:aedf:a93f with SMTP id adf61e73a8af0-3f7a81bc2cfmr10369219637.47.1794908395509;
        Tue, 17 Nov 2026 01:39:55 -0800 (PST)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc160bfabsm5299078a12.4.2026.11.17.01.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:39:55 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 15:09:45 +0530
Subject: [PATCH v4 1/3] misc: fastrpc: remove dead context drain in
 fastrpc_user_free()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-interrupted-invoke-v4-v4-1-2320a8a7eda2@oss.qualcomm.com>
References: <20261117-interrupted-invoke-v4-v4-0-2320a8a7eda2@oss.qualcomm.com>
In-Reply-To: <20261117-interrupted-invoke-v4-v4-0-2320a8a7eda2@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        quic_bkumar@quicinc.com, quic_chennak@quicinc.com
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: tAYitixnrBPnp5QZWVoAnAUzLD5LlxXp
X-Proofpoint-ORIG-GUID: tAYitixnrBPnp5QZWVoAnAUzLD5LlxXp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfXxFO3L9sJrxsx
 Vi1OLC7f7t6T3bZ0OwIsQNMsoXlFE3K+gjjYh0poRzzeL8Dmo/Uh4AgW5klf/45gjSh6XdYbnFD
 RpyJrkovAIS0/komRJ7JIUdNloEbcmUlqgMNgbYjhvUv7xoAsWfLyemPBG7ZNiELz80h2IjMoy4
 HJp5HRh+62Poal/jebrFZwvGjlDktPIcM6Fe/yhCykkkaLPw655D4pYdMPbED7RN9107lhjq6JI
 w+FAMHQKPT4rxWSkNaX5+nOdTL1FGlYYtEMHssfvTud+YGSWefaNBlThlKM3T+i5Zg/XBkkg4cC
 eynp8G7bRauGDg7tzy8aEYcj5u8F90cdnrqx6DhX7aKgrEnmMvZfyF2jCoYvtBb2yNid1Ow80uD
 A/Jw5pe48pfMzUnNnLbc3zlIbIDg+TRiHAC8g/nGG4qv90fxWn2Zq6DM7nnTZzERMRYRE8pGPKD
 tB4J/kZIPlSYbGcACSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfXxle1eBm00/lB
 Zr/00Fm9LXVsEIeRbA8N1MyE0JclVjsC5v9K1lshY9XCA7o3rfpN7G9I2WtV5/mCkeUBma2KX5a
 0OM6Z3+ISmua9VFHA1DHDtBrwK97Ypc=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc20ed cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=J-4xhamgBsHxLUkLQesA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170038

fastrpc_context_alloc() takes a reference on fl via fastrpc_user_get()
for the lifetime of every context, and fastrpc_context_free() always
unlinks the context from fl->pending before releasing that reference
with fastrpc_user_put(). This means fl->refcount cannot reach zero -
and fastrpc_user_free() cannot run - while any context is still linked
on fl->pending: whichever context's release happens to be the one that
drops the last reference has, by construction, already removed itself
from the list a few lines earlier in the very same call.

The list_for_each_entry_safe() loop over fl->pending in
fastrpc_user_free() can therefore never find anything to iterate. It
has been unreachable since fl's own lifetime was switched from
file-close-synchronous teardown to kref-counted teardown; it was never
updated to reflect that the list it walks is now guaranteed empty by
the time this callback can run. Remove it.

Fixes: e85eb5feca8e2 ("misc: fastrpc: fix use-after-free of fastrpc_user in workqueue context")
Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 9e760f68bc..bb0c304196 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -568,17 +568,11 @@ static void fastrpc_context_put(struct fastrpc_invoke_ctx *ctx);
 static void fastrpc_user_free(struct kref *ref)
 {
 	struct fastrpc_user *fl = container_of(ref, struct fastrpc_user, refcount);
-	struct fastrpc_invoke_ctx *ctx, *n;
 	struct fastrpc_map *map, *m;
 	struct fastrpc_buf *buf, *b;
 
 	fastrpc_buf_free(fl->init_mem);
 
-	list_for_each_entry_safe(ctx, n, &fl->pending, node) {
-		list_del(&ctx->node);
-		fastrpc_context_put(ctx);
-	}
-
 	list_for_each_entry_safe(map, m, &fl->maps, node)
 		fastrpc_map_put(map);
 

-- 
2.34.1

