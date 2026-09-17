Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92FE3BBFAD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789618748; cv=none; b=RTvxuXCFwervENhuci2gVnp8FUhki3NPMRRf0lxBea6PsWkCupzO4mEEGcvwFEgUzt3ophjW2139skIGSkImRKSyuIb8lHp8sWZHNFIA6YF/O4XZAujEQ4gyoZKzdwcCROdARVj42PmPtIldEuiz9EvkXv+pvWJZG+KLHgWZP5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789618748; c=relaxed/simple;
	bh=sPE5iWGZOzxuJRKQa/w8SewgUCge77XIyoGWDlEQpZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WtXOzAGSlbuvmUO6lgfMIRoLIIAcSqCnGWvAg++ifkF5c84ThYfKd0u6vDz0xnwupy6/FK5Tsv4/Z29Rjc5o0W/bPmwZqlBFg3ImjaafwvObsURDhlChWGVTJzqp+ZOyJDy7VmvaN3OkVSOZohAWsQzKD4Bod5ybILWe00bE4G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPxUQgLG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwMsXZnh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPxUQgLG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hwMsXZnh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H0VtwA210642
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pQf1+LijB5MWwwzw/tYTLp5iH2cCHNiP21qtT1O8IoA=; b=dPxUQgLGTRERLicr
	EqOoacMmcTqL2poK5S8MC/VvzqbduegQipgLsyvwgeyc1uj1EkI044t/2561Awih
	EdnKn50g2wJQDvGjljKgiNsK/IsRc1Z91E9NWn5yLHfEriGB9HZEf3LK/an9cvgQ
	MKtdD3kqNHFCo3wMegUBcquCR2omq6R9IKDQWCsEnT7HWTPcgLt0YhCrM7bssXPp
	7SHmLTr3M/7p5qnGOpqRGNc3SZuVAnfzqgG23VZAzEvKa6M+Jk9WjKKpbq0lPtNy
	tMrLFFMTYjIXuZQFc4z+YNh5NsLNB0aWAfumf33BJrT6kPmzIrkB9qLc9FKvbsDP
	FGlUsw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxw8th26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:19:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso789808a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789618744; x=1790223544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQf1+LijB5MWwwzw/tYTLp5iH2cCHNiP21qtT1O8IoA=;
        b=hwMsXZnheLhj8ZyDD4aWclyn4i5PxMy2gaCQh+fFdDgsqbhBAd6wEnpBfNlyuSVEcu
         x0gdyw4UGw7yV3L2Lyc/iR350CP9oZav2hOOa7Ev05Ah2Wsuhu9wi66fN4L3cv++9R59
         YUtedUYFkfG7iDVBvMskcqhEIP3nvybNHUBC5eGNxWKUMzB8cvjjHGySX+OQ/PepgXtH
         qt2Fo/nad/doyO13Imnq91EYKJWDr90XjECZwsmdaKMleAyId6uTSf02hV17RiY0gKqi
         OyytQs0q4vB1BhwjPKDNdu7crx8QLJxmFTIQnaM0eUDkef4NFvfEIZWn8AT6LGNkj/lP
         OgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789618744; x=1790223544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQf1+LijB5MWwwzw/tYTLp5iH2cCHNiP21qtT1O8IoA=;
        b=SvFod0N5v97Vn1jvJrujmYO/OkmcIp3nTONle/qqqyAM/zQwNVh/xzLkswxvt4lWQh
         yJstsmdPzsVOmhv0kMh4lHnIROatKRUuqcd9Gw61AWchH7ZOncaUzkR9xbc4g6UolTyf
         W37Xob/34lyY+wVraDhDCBmqAd4ed+IJ0qGSAtcDQL92IdIpx3axEikuk1F7jn1Ge6sp
         oAgMs9LxZNA7fKvoV5Kq9zvjg8/ipoNPkVWF+S7wraKw4uY/4yVjg3XZZQWXn0lGPidk
         CvZtfawtaR4tqNBECYDd+s6BwxUMOguMiwBN0/8bJ20VAY9SAJNIzc97za6VzsyLV+e8
         yJKw==
X-Forwarded-Encrypted: i=1; AKwUvBxfkrAmCnIoyEGUz8Pr77MC8QkivdUlcNex71DodhK7bYtSJ5APtxeXYDt5XPmueQLkxvDM/D2yXWRjZbc=@vger.kernel.org
X-Gm-Message-State: AFuF++nqxlVXdXzNL5c3fMAc1E4dKU8da2uUh/PAMgFj+EgxxFLe9Me2
	m4LJQ4/lyC+riRvHwKXn9q9mr+zDMwcdSeRSuPf7wjtrXbWblpbHVGtgDfaY9I2hEuMuXFmRGlk
	bBd+zO4S1RxS9EsgQIrumIsWQAV+S1H6CvvS/ifBRZLmomGgXyiIM0gRPeroGBJmfXX4=
X-Gm-Gg: AYBFou1FI6+NNZrnDrJlzuontnrIFhnbJK28ZzQ3jlISPKi0SF+BPEV9tOsuAQBAplM
	6VjBcP74oE46jN4YmqRUVwWtQieyRlbS/gYAWnQ/FcNzPqee7y7bYbQHsS85PV2/iI7rdm2VxaZ
	vjZERDKwfBM6VIMU05zkiii/2Dkp/4RL7ZjIm1ZUPO7ZtGUpWqt1CeqWzA8mJJuUXRhjvk9pUoW
	NDshHtLWCY8gf4wxkHrowEGoVytGQzo0Od4RRkvLbcHUsOM9g6K9ICKHoy0rhxksBuY/vOy/wVE
	V1wjt0HgcoF9+c/OQLvihf9Ttpyhqi2RsVCGqSYiArorNKC47x7NNCGFJAPOVRtxxi4SAxbQLcG
	CMNZUUQWplBZ5HIXLqPs0282qcm8Eh7eJuA==
X-Received: by 2002:a17:90b:56c6:b0:39e:2e79:7ce7 with SMTP id 98e67ed59e1d1-39e2e797eb7mr6875755a91.6.1789618743222;
        Wed, 16 Sep 2026 21:19:03 -0700 (PDT)
X-Received: by 2002:a17:90b:56c6:b0:39e:2e79:7ce7 with SMTP id 98e67ed59e1d1-39e2e797eb7mr6875650a91.6.1789618742454;
        Wed, 16 Sep 2026 21:19:02 -0700 (PDT)
Received: from [10.219.57.213] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c01728a7esm9220237eec.6.2026.09.16.21.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 21:19:00 -0700 (PDT)
Message-ID: <e1e51039-8eef-4b4e-8e32-bfcecb79b6e1@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 09:48:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: fix context leak and hang on
 signal-interrupted invoke
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260701-master-v2-1-566bf8b7bd16@oss.qualcomm.com>
Content-Language: en-US
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
In-Reply-To: <20260701-master-v2-1-566bf8b7bd16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4VXEZ8ksMcZ-ibX06mrNa6fBBArsAjvw
X-Authority-Analysis: v=2.4 cv=bY3+w+PB c=1 sm=1 tr=0 ts=6aab6a38 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1OCyHOmHIK7S9LxfehAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1MyBTYWx0ZWRfXx0DzHc/44z2Z
 tOQN5BGfs7xX9CoH6+BsCpP6uossFycTyxhPe2EXvXExNdOBMIqa552ZsGHf1MrH1sPMbdOPjAE
 UAsQsWWHgKRz7+jdPIpI+n9sWEjL9EQ=
X-Proofpoint-ORIG-GUID: 4VXEZ8ksMcZ-ibX06mrNa6fBBArsAjvw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1MyBTYWx0ZWRfXzv3TzP4cEMGB
 SFAgZm3bE2VRl7w+uC+VIjtu3yquPjqfGIbG2a/Gq1SRxRgC4eoe0/wXvdn11ojmpNNhXRC9n3m
 bb9PabyEh40+GlW3NHUpPwx7nm5SNtmuBIyOI819fCbh/MUtpr50rAyVlaLh3fTtdPLodpc1/XW
 VQRqoWcHY19qxSPlIKrODQtwwbPNPCoOyLV7TXF99959akiKN9oIF+wV2oEJlbAFijeuXMeIBJ3
 /ICGwy5ooG1tsGkMdZ6DzoB8cDrr0XARxvrajzkWtaZqWK0NQ4xbsjvk+Cil3VXddup8up2Xf+e
 Lq4+E7LQhP2yTC+5VXOcQDlYyYIy6I7XuFVy+g/nG7pNoHLM4oE8n2CoVRWeMFQNnYLTLpSktnQ
 AoGPqp6GnWt+gB1VB+4D0IHH6XiV7Pm5TXXsMSH9XwRHCtR9VNl8DUSXquNuOFJ5vILi3DgVVp0
 Fbca16rMoDhCtd5j9jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170053


On 7/1/2026 1:41 PM, Anandu Krishnan E wrote:
> fastrpc invokes work by sending an RPC message to the DSP and blocking
> in wait_for_completion_interruptible() until the DSP responds. If a
> signal arrives during this wait, the syscall returns -ERESTARTSYS and
> the invoke context which holds the in-flight DMA buffers and
> completion state is left stranded in fl->pending.
>
> On the next syscall attempt (either auto-restarted by the kernel via
> SA_RESTART or manually retried by user-space after EINTR), a fresh
> context is allocated and the RPC message is re-sent to the DSP. This
> has two consequences:
>
>    - The original context leaks in fl->pending until the file is closed.
>    - The DSP receives a duplicate invocation. If the DSP was mid-way
>      through processing the first request and had issued a reverse RPC
>      call back to the host, the retry sends a new forward request
>      instead of the expected reverse-RPC response. The DSP thread
>      waiting for that response is never woken, causing a hang.
>
> Fix this by saving the interrupted context to a new fl->interrupted
> list on -ERESTARTSYS. When the same thread retries the invoke with a
> matching sc, restore the context and jump directly to the wait,
> skipping context allocation and message re-send.
>
> Three additional bugs are also fixed:
>
> 1. fastrpc_context_save_interrupted() did not drop the extra kref that
>     fastrpc_invoke_send() took, so the worker's put only reached 1 and
>     the context was never freed.  Drop the reference in save_interrupted()
>     so the worker's put reaches 0 and triggers context_free.
>
> 2. The bail path skipped context cleanup on -ETIMEDOUT, leaking the
>     context.  Remove the -ETIMEDOUT exception so timed-out contexts are
>     freed like any other error path.
>
> 3. fastrpc_context_free() did not remove the context from fl->interrupted
>     before freeing it.  A context freed via a racing channel removal left
>     a dangling node in the list.  Add list_del_init() guarded by fl->lock
>     before releasing resources.
>
> Also drain fl->interrupted on process exit, complete any sleeping
> contexts with -EPIPE and schedule put_wq to drop the worker ref when
> the rpmsg channel is removed, and add dev_warn() on TIMEOUT and
> ERESTARTSYS to aid post-mortem debugging.
>
> Remove the obsolete invoke_interrupted_mmaps mechanism from
> fastrpc_channel_ctx; context resources are now kept alive through the
> context refcount rather than by migrating mmaps to a channel-level list.
>
> Fixes: 387f625585d1 ("misc: fastrpc: handle interrupted contexts")
> Cc: stable@kernel.org
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
> ---
> This patch fixes a context leak and DSP hang that occur when a
> fastrpc invoke syscall is interrupted by a signal, along with three
> follow-on bugs found during review.
>
> Changes in v2:
> - Fix kref imbalance: fastrpc_context_save_interrupted() now drops the
>    extra reference taken by fastrpc_invoke_send(), so the worker's put
>    correctly reaches 0 and triggers context_free.
> - Fix -ETIMEDOUT context leak: remove the ETIMEDOUT exception from the
>    bail path so timed-out kernel invocations go through the same
>    list_del_init + context_put cleanup as all other error paths.
> - Fix dangling node: fastrpc_context_free() now calls list_del_init()
>    under fl->lock before releasing resources, preventing a dangling node
>    in fl->interrupted if a racing channel removal fires put_wq.
> - fastrpc_notify_users() now calls schedule_work(&ctx->put_work) for
>    interrupted contexts to drop the worker ref on channel removal.
> - Add dev_warn() on TIMEOUT and ERESTARTSYS for post-mortem debugging.
> - Use list_del_init() instead of list_del() in the bail path.
>
> Link to v1: https://lore.kernel.org/all/20260525124222.3082420-1-anandu.e@oss.qualcomm.com/
> ---
>   drivers/misc/fastrpc.c | 101 +++++++++++++++++++++++++++++++++++++++----------
>   1 file changed, 82 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index f3a49384586d..c0859a501617 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -280,7 +280,6 @@ struct fastrpc_channel_ctx {
>   	struct fastrpc_device *secure_fdevice;
>   	struct fastrpc_device *fdevice;
>   	struct fastrpc_buf *remote_heap;
> -	struct list_head invoke_interrupted_mmaps;
>   	bool secure;
>   	bool unsigned_support;
>   	u64 dma_mask;
> @@ -297,6 +296,7 @@ struct fastrpc_user {
>   	struct list_head user;
>   	struct list_head maps;
>   	struct list_head pending;
> +	struct list_head interrupted;
>   	struct list_head mmaps;
>   
>   	struct fastrpc_channel_ctx *cctx;
> @@ -522,6 +522,11 @@ static void fastrpc_user_free(struct kref *ref)
>   		fastrpc_context_put(ctx);
>   	}
>   
> +	list_for_each_entry_safe(ctx, n, &fl->interrupted, node) {
> +		list_del(&ctx->node);
> +		fastrpc_context_put(ctx);
> +	}
> +
>   	list_for_each_entry_safe(map, m, &fl->maps, node)
>   		fastrpc_map_put(map);
>   
> @@ -557,6 +562,12 @@ static void fastrpc_context_free(struct kref *ref)
>   	cctx = ctx->cctx;
>   	fl = ctx->fl;
>   
> +	/* Remove from fl->interrupted if present; no-op for normal paths. */
> +	spin_lock(&fl->lock);
> +	if (!list_empty(&ctx->node))
> +		list_del_init(&ctx->node);
> +	spin_unlock(&fl->lock);
> +
>   	for (i = 0; i < ctx->nbufs; i++)
>   		fastrpc_map_put(ctx->maps[i]);
>   
> @@ -594,6 +605,42 @@ static void fastrpc_context_put_wq(struct work_struct *work)
>   	fastrpc_context_put(ctx);
>   }
>   
> +static void fastrpc_context_save_interrupted(struct fastrpc_invoke_ctx *ctx)
> +{
> +	spin_lock(&ctx->fl->lock);
> +	list_del(&ctx->node);
> +	list_add_tail(&ctx->node, &ctx->fl->interrupted);
> +	spin_unlock(&ctx->fl->lock);
> +	/*
> +	 * invoke_send bumped the kref to 2; the bail path skips the put
> +	 * for ERESTARTSYS.  Drop it here so the worker's put reaches 0
> +	 * and triggers context_free.
> +	 */
> +	fastrpc_context_put(ctx);
> +}
> +
> +static struct fastrpc_invoke_ctx *fastrpc_context_restore_interrupted(
> +			struct fastrpc_user *fl, u32 sc)
> +{
> +	struct fastrpc_invoke_ctx *ctx = NULL, *ictx, *n;
> +
> +	spin_lock(&fl->lock);
> +	list_for_each_entry_safe(ictx, n, &fl->interrupted, node) {
> +		if (ictx->pid != current->pid)
> +			continue;
> +		if (ictx->sc != sc || ictx->fl != fl) {
> +			spin_unlock(&fl->lock);
> +			return ERR_PTR(-EINVAL);
> +		}
> +		ctx = ictx;
> +		list_del(&ctx->node);
> +		list_add_tail(&ctx->node, &fl->pending);
> +		break;
> +	}
> +	spin_unlock(&fl->lock);
> +	return ctx;
> +}
> +
fastrpc_context_alloc(): kref_init → ref = 1.
fastrpc_invoke_send(): fastrpc_context_get(ctx) before rpmsg_send → ref 
= 2.
1st -ERESTARTSYS: fastrpc_context_save_interrupted() moves ctx to 
fl->interrupted and does fastrpc_context_put(ctx) → ref = 1.
Retry: fastrpc_context_restore_interrupted() finds msg and jumps 
straight to the wait: label — skipping fastrpc_context_alloc() and 
fastrpc_invoke_send() entirely.
2nd -ERESTARTSYS: fastrpc_context_save_interrupted() runs again on the 
same ctx and calls fastrpc_context_put(ctx) again → ref = 1 → 0 → 
fastrpc_context_free() fires.
That frees ctx->buf and ctx->maps (the DMA buffers backing the RPC 
payload) and removes the ctxid from the idr, while the original rpmsg 
message is still outstanding and the DSP may still read/write those buffers
>   #define CMP(aa, bb) ((aa) == (bb) ? 0 : (aa) < (bb) ? -1 : 1)
>   static int olaps_cmp(const void *a, const void *b)
>   {
> @@ -1243,8 +1290,6 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>   				   struct fastrpc_invoke_args *args)
>   {
>   	struct fastrpc_invoke_ctx *ctx = NULL;
> -	struct fastrpc_buf *buf, *b;
> -
>   	int err = 0;
>   
>   	if (!fl->sctx)
> @@ -1258,6 +1303,14 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>   		return -EPERM;
>   	}
>   
> +	if (!kernel) {
> +		ctx = fastrpc_context_restore_interrupted(fl, sc);
> +		if (IS_ERR(ctx))
> +			return PTR_ERR(ctx);
> +		if (ctx)
> +			goto wait;
> +	}
> +
>   	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
>   	if (IS_ERR(ctx))
>   		return PTR_ERR(ctx);
> @@ -1273,11 +1326,20 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>   	if (err)
>   		goto bail;
>   
> +wait:
>   	if (kernel) {
> -		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
> +		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ)) {
>   			err = -ETIMEDOUT;
> +			dev_warn(fl->sctx->dev,
> +				"fastrpc_invoke: TIMEOUT ctxid=0x%llx handle=0x%x nscalars=%d\n",
> +				ctx->ctxid, handle, ctx->nscalars);
> +		}
>   	} else {
>   		err = wait_for_completion_interruptible(&ctx->work);
> +		if (err == -ERESTARTSYS)
> +			dev_warn(fl->sctx->dev,
> +				"fastrpc_invoke: INTERRUPTED ctxid=0x%llx handle=0x%x nscalars=%d\n",
> +				ctx->ctxid, handle, ctx->nscalars);
>   	}
>   
>   	if (err)
> @@ -1296,21 +1358,15 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>   		goto bail;
>   
>   bail:
> -	if (err != -ERESTARTSYS && err != -ETIMEDOUT) {
> -		/* We are done with this compute context */
> +	if (ctx && err == -ERESTARTSYS) {
> +		fastrpc_context_save_interrupted(ctx);
> +	} else if (ctx) {
>   		spin_lock(&fl->lock);
> -		list_del(&ctx->node);
> +		list_del_init(&ctx->node);
>   		spin_unlock(&fl->lock);
>   		fastrpc_context_put(ctx);
>   	}
fastrpc_context_alloc() takes fastrpc_user_get(user) for every context, 
released only in fastrpc_context_free(). fastrpc_device_release() 
removes fl from cctx->users unconditionally before doing anything else, 
then drops just its own single ref via fastrpc_user_put(fl).
If a context is stuck on fl->interrupted at the moment the process exits 
(some abrupt exit or kill), fl's refcount never reaches zero, 
fastrpc_user_free() never runs, and because fl is already unlinked from 
cctx->users, a later SSR-driven fastrpc_notify_users() walk can't find 
it either.
>   
> -	if (err == -ERESTARTSYS) {
> -		list_for_each_entry_safe(buf, b, &fl->mmaps, node) {
> -			list_del(&buf->node);
> -			list_add_tail(&buf->node, &fl->cctx->invoke_interrupted_mmaps);
> -		}
> -	}
> -
>   	if (err)
>   		dev_dbg(fl->sctx->dev, "Error: Invoke Failed %d\n", err);
>   
> @@ -1662,6 +1718,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>   	spin_lock_init(&fl->lock);
>   	mutex_init(&fl->mutex);
>   	INIT_LIST_HEAD(&fl->pending);
> +	INIT_LIST_HEAD(&fl->interrupted);
>   	INIT_LIST_HEAD(&fl->maps);
>   	INIT_LIST_HEAD(&fl->mmaps);
>   	INIT_LIST_HEAD(&fl->user);
> @@ -2460,7 +2517,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>   	rdev->dma_mask = &data->dma_mask;
>   	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
>   	INIT_LIST_HEAD(&data->users);
> -	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
>   	spin_lock_init(&data->lock);
>   	idr_init(&data->ctx_idr);
>   	data->domain_id = domain_id;
> @@ -2493,13 +2549,23 @@ static void fastrpc_notify_users(struct fastrpc_user *user)
>   		ctx->retval = -EPIPE;
>   		complete(&ctx->work);
>   	}
> +	/*
> +	 * Interrupted contexts hold two refs: one for the invoker and one
> +	 * for the async worker from fastrpc_invoke_send.  Complete them so
> +	 * any blocked retry wakes, and schedule put_wq to drop the worker
> +	 * ref -- the invoker ref is released by fastrpc_user_free().
> +	 */
> +	list_for_each_entry(ctx, &user->interrupted, node) {
> +		ctx->retval = -EPIPE;
> +		complete(&ctx->work);
> +		schedule_work(&ctx->put_work);
> +	}
>   	spin_unlock(&user->lock);
>   }
>   
>   static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>   {
>   	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);
> -	struct fastrpc_buf *buf, *b;
>   	struct fastrpc_user *user;
>   	unsigned long flags;
>   
> @@ -2516,9 +2582,6 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>   	if (cctx->secure_fdevice)
>   		misc_deregister(&cctx->secure_fdevice->miscdev);
>   
> -	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
> -		list_del(&buf->node);
> -
>   	if (cctx->remote_heap)
>   		fastrpc_buf_free(cctx->remote_heap);
>   
>
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260701-master-2ba6246f29d1
>
> Best regards,
> --
> Anandu Krishnan E <anandu.e@oss.qualcomm.com>
