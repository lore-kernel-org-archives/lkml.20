Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D201684B0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791952982; cv=none; b=Ea+XTfT5yjCPQ3hWO4NM3QFr9FGqhTWHopluOLWKG78B/eBORUh+OShR3cV8RgLOv2PbPOqY27bfAO6m6/J8y0QBqp0JR/WPL2WmwNj1lF2ub3I/zkehUWe21nxNgFdBGp7dChvAeXX43ZszwXMnfPDa6zb4saRq3Uz/P/sedjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791952982; c=relaxed/simple;
	bh=0bAuze9MEnEDD51YN5CdjOk1cbTBU+MbTZLtgTU04zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AxpgSJ6VjPneiWDfw8YwkuMPsPoO29w8Mxrj8E5aMi3wcDFhxWXymDBfg3ePKL5XJFu4wP7P3CCzG5B/jueGJWKsVorIkqqmeoswn1xtqMzt01JZCqY5OtenYJ1JH2J+IaU06c1eFeu+1OsyKhh2FLzFJEyXRTua5xQT6aq50RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iMtg+E71; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqWR0Fgh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iMtg+E71";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QqWR0Fgh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DNCjVX2088027
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9K3cbdb7dFzpqCr6C1BNZjsMaePAgKuPmBno8+Ephi4=; b=iMtg+E714UVPUI52
	b1D/C3M/dbkGmWbv/g2rz5tue+k4RIOEG4lnLOIo/RzQlcHI6z3w3PVxThYerX5C
	MGpyNWnocd4jHJ8vpou2RA0U2CwRNIaOOdf9CAZKWqZ8N1rjEQbqvnoj7yTds8Qv
	aPDC+efYvYZc69IbEvvExDPnAT6dOq8JZvrhPNLcdhXqR0WPM3MnqAJtbOnQUblS
	Wp2BDuF/jjIYCpAaVK3PnuWI4wUhrREGP54l+eNHQUwtVTGocT/dxLvsZ7MZbt04
	ym/JnljrtuLHyQ/gRV4l+Km7tdrU49p7/SZagv7baw1VAcdPjlelTZI0188hvJFT
	RcmCzA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49h08r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:43:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35a04491c56so657478eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791952979; x=1792557779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9K3cbdb7dFzpqCr6C1BNZjsMaePAgKuPmBno8+Ephi4=;
        b=QqWR0Fgh0LH+W3RCfrZwCFjFCaKsGZxR8ZlzLxAEO8qDiANKTvjP0XNUDV+d+OYYdH
         ZzAgDYrlfCHQ5UT1g5bR+BA7l7bw8Jlto/RO3BKYkngNENGvmFiHg+4YsLOe/2sktiDI
         a17RSMFhurQCQBraBmQgtFq1MPH1ByYA31ilV50tRciaRVkNFOC/wxIglbVOrCYLxieG
         Zx9Y4kPAVCdx1mvvqDhiSPFFM2MleEyQfwHqOz0gjw4eyqyDsOQM8QuHcHQuaGyj635U
         ili4HTy9cCggTgl2KmQtwIxl4r6ioojdRl3EQ4HBjNW6+icBAKwCDad51x9uvcA++CXO
         +UDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791952979; x=1792557779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9K3cbdb7dFzpqCr6C1BNZjsMaePAgKuPmBno8+Ephi4=;
        b=WL5krlKYtN4y4nEkOvFtUYIKJhlMol7LyFoAFyUtYowPVptIVSomf8Hc8Z9gVldhED
         5AxQew7RxLWsK0LPpPX59Kd9sDvrH3XxT3CcPan0E9UG+kJDH2AIRUXhP1/eTxt3DtGt
         Hqjb8fdTw4EktmRTLd6mfqQGMBI7oQeuMhIL1+Ld8h1rTt/gL/e7Y+hN+MeEKqBVXwGJ
         N3+Bj/f3bTpoaH4IWZj0mAbp1e9kRfWGFHaPX49necF27/6q+r6TjWahN+Nj3XiwD5KZ
         iBvKwTo5SPIiVbEw9Y/U3mJ8qvWEhi4TtaiS9ZR7e7iGA8pmtnA9t3t7XNjlUiUKTC2+
         4fdA==
X-Forwarded-Encrypted: i=1; AKwUvBw3mMyHji/4VBnqvts69PACrPFJJAd1MADMwjlpM2R6NckxyfU4fbXPsd4tnoSm683WxPGLt2qmiaHpBFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKztkamPXatrcmeG0R4KyFOukXaNbM3fSPi1LM1qM0q6oXIUvQ0
	JV6qQ2eAcLax9//5rokj7ymQMkBMVsQzn04T5WHxMSTXDyGxBrD5kk/N0xPcODzROzLLPxnPkC2
	Vqfuyg7IaxPqXAfwJZL4YHHYG99GQ2eWrS4vKxpsWjpXlb6EAbupSxCa/GpMOcftxKu8=
X-Gm-Gg: AYBFou0Vbt6k95Wea8CFXlsX8mHxwu8QM67SXVUyXBWU/ilWxssinJ4Ex2RxvUXTABR
	pFGNw6Kw0IlPo5/+raSuzHV42qahPylatvJlZEXdTs1Ki4hOhOSwUBXZjn7Y1bUblH8ltR5LZ0j
	sSOSWw9rQ4CswYkGZj9GGDLn+pTfzvHWv105D4ng7rY5URMDcfOfcha8Grf2rRO5gjeEjIO0/Uc
	63fk3vXvbVau1HYt3Hj5mHa6dOwCrZyOFS+tMlZ5c12A5h3SgeXCgBQyfdy1DPdOcJ6J/1UU1DJ
	Z/WWKYlTIQA9psFv1EBXV4y9d8ZzHbFkbM3MCHOgui4DRWZpPZgCrFqMiSkd0TirdNZfFO7yZPH
	sHw914L8yHIHtb+Z8+j2dZq3ECjeb
X-Received: by 2002:a05:7300:c87:b0:33e:61ab:8309 with SMTP id 5a478bee46e88-3537b291a93mr28294698eec.23.1791952979163;
        Tue, 13 Oct 2026 21:42:59 -0700 (PDT)
X-Received: by 2002:a05:7300:c87:b0:33e:61ab:8309 with SMTP id 5a478bee46e88-3537b291a93mr28294648eec.23.1791952978467;
        Tue, 13 Oct 2026 21:42:58 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35c89429484sm11541995eec.23.2026.10.13.21.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 21:42:58 -0700 (PDT)
Message-ID: <6e4d0fc2-3fe6-4dff-bdc1-b6051f3becef@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 10:12:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: Add cache maintenance for non-coherent
 platforms
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20260916185850.3686010-1-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260916185850.3686010-1-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf0854 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=J77KH-JWTt9_r89aEeUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxOCBTYWx0ZWRfX3rA4MxXSXHpV
 Ua/rFqR5k+mXgT2fDoSPEMFLC4arUD7wLvFWN/3unhlcThUfGE1MYl65dFr8wHE5TjXKs4hGLhe
 rXy+VksmITiJz2eA/2OaOwMWlB2DPDpCRGGwSWWVUrNINPLwTTH7zFTVll9QYVZ8CERv9dAm0+j
 cnMhd9K/GGLi+CGSzeK5hnwqYYfZ+1zoZlhA56IETK6XMhZi5NfNQ7jIslMmTl6g7aajUb1rB7p
 WPlB9bVxQvldYfSAuXBWkNJG7MXuK8IXVPmRtmNeBSIxhGWmCgo9Z8qjKQqnpUzVm46tP2dP5sN
 Zl9kjDGRZIA38nmmInN6AZqMM1QmcS/HzstYnxz9lWnUJbTE51686dTwXJgTKS7Ap26V5rHv6Ag
 ur2BrCfXCv0ZBZP2OWpkcLMPgAP+YYvxp0YlpY/n5yBDTedWI8M08YsRKXuXKuEt4PcAzSpEwkO
 W6e0LmJWwl3jayOMGDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxOCBTYWx0ZWRfX0sBnL72DvaKI
 umbkZE8nN8p2GnYPsknXIZCuIJEV8EQK7+X8r5aJBandHuxlY3wK9hndJAUgVPwLpuSspJ3DQ7+
 C1j1efjYZu8dbMR2o2m50hSJNCmh9z4=
X-Proofpoint-GUID: IYF2w3ZNKwbU4teivPlt2jgO592Vb9IX
X-Proofpoint-ORIG-GUID: IYF2w3ZNKwbU4teivPlt2jgO592Vb9IX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140018

On 17-09-2026 00:28, Abhinav Parihar wrote:
> Some platforms using fastrpc do not support DMA coherency on
> HLOS. On such systems, explicit cache maintenance is
> required to ensure data consistency for RPC argument buffers.
> 
> Add cache maintenance for argument buffers when operating on
> non-coherent platforms:
> - Flush input buffers before invoking RPC to ensure CPU writes are
>   visible to the DSP
> - Invalidate output buffers after RPC completion to ensure DSP
>   writes are visible to the CPU
> 
> Introduce helper functions fastrpc_flush_args() and
> fastrpc_inv_args() to perform the required dma-buf cache
> operations. These are invoked only when the device is not marked
> as DMA coherent.
> 
> The coherency capability is determined using the "dma-coherent"
> device tree property and stored per session context.
> 
> This ensures correct data synchronization on platforms lacking
> DMA coherency, while avoiding unnecessary overhead on coherent
> systems.
> 
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
> ---
> 
>  Patch [v1]: https://lore.kernel.org/all/20260604194811.2437567-1-abhinav.parihar@oss.qualcomm.com/
> 
>  Changes in v2:
>   - Fix buffer overlap handling to ensure cache maintenance is performed
>     when input and output buffers overlap and the overlap calculation
>     suppresses the buffer's mstart/mend range.
>   - Add a do_cmo flag to track buffers that require cache maintenance
>     even when their overlap range is clipped.
>   - Invalidate output buffers before sending the RPC request, preventing
>     stale CPU cache lines from being written back while the DSP updates
>     the buffers.
>   - Use DMA_FROM_DEVICE consistently for both begin_cpu_access() and
>     end_cpu_access() when invalidating output buffers.
> 
>  drivers/misc/fastrpc.c | 77 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d4fac2caca86..83d04b9d2ea0 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -217,6 +217,7 @@ struct fastrpc_buf_overlap {
>  	u64 mstart;
>  	u64 mend;
>  	u64 offset;
> +	bool do_cmo;
>  };
>  
>  struct fastrpc_buf {
> @@ -292,6 +293,7 @@ struct fastrpc_session_ctx {
>  	int sid;
>  	bool used;
>  	bool valid;
> +	bool coherent;
>  };
>  
>  struct fastrpc_soc_data {
> @@ -655,7 +657,9 @@ static int olaps_cmp(const void *a, const void *b)
>  static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
>  {
>  	u64 max_end = 0;
> +	int max_raix = -1;
>  	int i;
> +	int inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
>  
>  	for (i = 0; i < ctx->nbufs; ++i) {
>  		ctx->olaps[i].start = ctx->args[i].ptr;
> @@ -675,6 +679,9 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
>  			if (ctx->olaps[i].end > max_end) {
>  				max_end = ctx->olaps[i].end;
should you update max_raix here also?>  			} else {
> +				if ((max_raix < inbufs && ctx->olaps[i].raix + 1 > inbufs) ||
> +					(ctx->olaps[i].raix < inbufs && max_raix + 1 > inbufs))
if ((max_raix < inbufs) != (ctx->olaps[i].raix < inbufs))
> +					ctx->olaps[i].do_cmo = true;
>  				ctx->olaps[i].mend = 0;
>  				ctx->olaps[i].mstart = 0;
>  			}
> @@ -684,6 +691,7 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
>  			ctx->olaps[i].mstart = ctx->olaps[i].start;
>  			ctx->olaps[i].offset = 0;
>  			max_end = ctx->olaps[i].end;
> +			max_raix = ctx->olaps[i].raix;
>  		}
>  	}
>  }
> @@ -703,6 +711,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  
>  	INIT_LIST_HEAD(&ctx->node);
>  	ctx->fl = user;
> +	ctx->sc = sc;
>  	ctx->nscalars = REMOTE_SCALARS_LENGTH(sc);
>  	ctx->nbufs = REMOTE_SCALARS_INBUFS(sc) +
>  		     REMOTE_SCALARS_OUTBUFS(sc);
> @@ -728,7 +737,6 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  	/* Take a reference to user, released in fastrpc_context_free() */
>  	fastrpc_user_get(user);
>  
> -	ctx->sc = sc;
>  	ctx->retval = -1;
>  	ctx->pid = current->pid;
>  	ctx->client_id = user->client_id;
> @@ -1067,6 +1075,64 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
>  	return 0;
>  }
>  
> +static void fastrpc_flush_args(struct fastrpc_invoke_ctx *ctx)
> +{
> +	union fastrpc_remote_arg *rpra = ctx->rpra;
> +	int i, inbufs, outbufs;
> +
> +	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
> +	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
> +
> +	for (i = 0; i < inbufs + outbufs; ++i) {
ctx->nbufs instead of inbufs + outbufs
> +		int raix = ctx->olaps[i].raix;
> +		struct fastrpc_map *map = ctx->maps[raix];
> +
> +		if (raix + 1 > inbufs)
> +			continue;
> +		if (!map || !map->buf)
> +			continue;
> +
> +		if (rpra[raix].buf.len && (ctx->olaps[i].mstart || ctx->olaps[i].do_cmo)) {
> +			dma_buf_begin_cpu_access(map->buf, DMA_TO_DEVICE);
> +			dma_buf_end_cpu_access(map->buf, DMA_TO_DEVICE);
> +		}
> +	}
> +}
> +
> +static void fastrpc_inv_args(struct fastrpc_invoke_ctx *ctx)
> +{
> +	union fastrpc_remote_arg *rpra = ctx->rpra;
> +	int i, inbufs, outbufs;
> +
> +	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
> +	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
> +
> +	for (i = 0; i < inbufs + outbufs; ++i) {
ctx->nbufs> +		int raix = ctx->olaps[i].raix;
> +		struct fastrpc_map *map = ctx->maps[raix];
> +
> +		if (raix + 1 <= inbufs)
> +			continue;
> +		if (!rpra[raix].buf.len)
> +			continue;
> +		if (!map || !map->buf)
> +			continue;
> +
> +		/*
> +		 * Skip invalidation if the argument overlaps with the
> +		 * RPC control header page.
> +		 */
> +		if (((uintptr_t)rpra & PAGE_MASK) ==
> +			((uintptr_t)rpra[raix].buf.pv & PAGE_MASK))
is this possible? for fd buffers, buf.pv is going to be a userspace VA
and rpta addr is going to be a kernel VA, those cannot be equal.> +		
continue;
> +
> +		if (ctx->olaps[i].mstart || ctx->olaps[i].do_cmo) {
> +			dma_buf_begin_cpu_access(map->buf, DMA_FROM_DEVICE);
> +			dma_buf_end_cpu_access(map->buf, DMA_FROM_DEVICE);
> +		}
> +	}
> +}
> +
>  static struct fastrpc_invoke_buf *fastrpc_invoke_buf_start(union fastrpc_remote_arg *pra, int len)
>  {
>  	return (struct fastrpc_invoke_buf *)(&pra[len]);
> @@ -1191,6 +1257,9 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  		}
>  	}
>  
> +	if (!ctx->fl->sctx->coherent)
> +		fastrpc_flush_args(ctx);
> +
>  	for (i = ctx->nbufs; i < ctx->nscalars; ++i) {
>  		list[i].num = ctx->args[i].length ? 1 : 0;
>  		list[i].pgidx = i;
> @@ -1376,6 +1445,8 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  	if (err)
>  		goto bail;
>  
> +	if (!fl->sctx->coherent)
> +		fastrpc_inv_args(ctx);
>  	/* make sure that all CPU memory writes are seen by DSP */
>  	dma_wmb();
>  	/* Send invoke buffer to remote dsp */
> @@ -1396,6 +1467,9 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  
>  	/* make sure that all memory writes by DSP are seen by CPU */
>  	dma_rmb();
> +	if (!fl->sctx->coherent)
> +		fastrpc_inv_args(ctx);
> +
>  	/* populate all the output buffers with results */
>  	err = fastrpc_put_args(ctx, kernel);
>  	if (err)
> @@ -2393,6 +2467,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	sess->used = false;
>  	sess->valid = true;
>  	sess->dev = dev;
> +	sess->coherent = of_property_read_bool(dev->of_node, "dma-coherent");
see if you can use of_dma_is_coherent() instead.>  	dev_set_drvdata(dev,
sess);
>  	sess->sid = sid;
>  

