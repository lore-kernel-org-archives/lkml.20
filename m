Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB92D32AAD6
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123661; cv=none; b=YebRRC7nXWqFcLhTjT5gAPDPcVTTEbykhaHOz/bccH2bnTOMugzFMnjb50Lx5LaAPp1cZzwyYJxnxD4DIEq2ouQw6yuObviVcURdS1hmXt5bhWsNqJObprhcXL7CJC6FqlI+DrebnYY2gwBh7XbXITFBaKOL0fVu3RbEdOe0JQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123661; c=relaxed/simple;
	bh=48Z8pADhloahzqwHkrwsTajEqIpsHa3c3IQHLONLmVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JHmHCxkdvRaoJbPXSmDLugmSMuaHVj5+BpgZil4cyt9Mzku/MCAPnFhEWxRDfQASE+TyWDRUeOTiXyM/tC2OurebEauZDvkwpIVHrAJG3kGeDf4OPb1fFuoMptme/VDOYsq/nxRNxD0Y6YhEd87jElsZTyvMwYhgMPaq2FnLfkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so21310835e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123658; x=1788728458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SUPoHHPw0mF/bch7D9vN3W20nq3H4FIOb7kgeyb72g=;
        b=XPUdhlfeP1Zd+2ti9ZpsGnVGhzNESm/yZyDB7SL/eSeLZ7L97INzoeiFm5vcljx6dh
         egLugJd3/Zzz74ccdUR7E6BneOXN8iu+gwLGzSLIqeL14I3YMd2fmay4t5J40Adysf0q
         lP3fkmmUNxlIA/itYtX/7U8rsZcn+Sxla+2ad/jlvBQKTHBQYDtQJVi6xq4NZXgjR3cc
         g5Wg7Gys2f/qVNFkDGNsckwYl+tqL7ke1nUd9CTt+oMjd7Syms4i0paOF8/Jatg80cyH
         sPk1aW5agpLQNxz4pjYM7/N2UmeOFjqkVS8AGUmf8NSFPeToPEAEG667Xe2xtVViyw0J
         CUBg==
X-Forwarded-Encrypted: i=1; AHgh+RqnJvShDFtk2s3vIL2X7HzeTPIpvim0ii4eYlzr6WXO0TJSh2mtECPz7ftuetSV/FYjUspWG4lZ1ClzDpo=@vger.kernel.org
X-Gm-Message-State: AFuF++kjj0YDrcALVKu0pn6U7nICNDXTW0/K/vd2SkWQK5oKOCqL6108
	FVcKDVQPcDoQ4ei2zWnMuemvuIsiFz3Vdo5wWbHE2y9MQIeSBm8DwQI+ezOWbn7s51c=
X-Gm-Gg: AR+sD136DPIw92is5E4S6PWV/LS65U9M+nOVFQlz9Iz/GFZvc1UpJCiWuCQ/4sDWvhR
	EXEm+QeeCCClqiOQTQ1dArsY7+zFMn+n8ry147K+aAhMPcETVAMhIsPjlOU8HhAIPbi89Fgbn3Y
	wuU8OXEb5lMYLp3dW7yFc9u11ZVBBmY2Daz+9RW6lEUzVUtCaqCZIoZydsKgZB1KnXr6dSMt7kf
	LuRRy+Xi1OHWzIkhXg6DY89Vy5N0UFK+LThEh7LbwQic2KM2jqMCcB0Gdt0o3RaGlzk0RIUWG+G
	YrYyssWZ/liHuN7ZKQRWFUUllN279ZYMjfzr/PW3/oNYUW26lE2Puh/YWK3lNSB4leeprVP/zKS
	DR4q8m81mZ7slzjWJMZCd0ab1/y5cm6oS+YZ8yOz6kwdhs3XXoMeGGStjLOq55ipIp1NAmEhi5l
	zLBsB11uiGhjPn6+8WawcI2or+b9yaHIZEQhhmc8vMhBER13LjN8TRlO7s5r6vyOzlSWOAMjdBm
	1sisXltDInhVgJ69TonwQ==
X-Received: by 2002:a05:600c:5487:b0:495:7888:281c with SMTP id 5b1f17b1804b1-49b91bd1463mr258542345e9.0.1788123657772;
        Sun, 30 Aug 2026 14:00:57 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c80asm270763245e9.9.2026.08.30.14.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 14:00:57 -0700 (PDT)
Message-ID: <a1770149-e633-4a58-af06-849da27fa7cb@grimberg.me>
Date: Mon, 31 Aug 2026 00:00:56 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nvmet-tcp: report a bounded MDTS instead of "no limit"
To: Alfonso Kuen <gerencia@idkmanager.com>, hch@lst.de, kch@nvidia.com
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260828222356.1264-1-gerencia@idkmanager.com>
 <20260829013900.10392-1-gerencia@idkmanager.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20260829013900.10392-1-gerencia@idkmanager.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/08/2026 4:39, Alfonso Kuen wrote:
> nvmet-tcp does not implement .get_mdts, so nvmet_ctrl_mdts() falls back
> to the port value (0 by default) and identify-controller advertises "no
> maximum data transfer size". The initiator believes it:
> nvme_init_ctrl_finish() sets max_hw_sectors to UINT_MAX.
>
> What the initiator then issues is decided by the block layer. The
> generic cap is 4 MiB (BLK_DEF_MAX_SECTORS_CAP), but a namespace that
> advertises a large NOWS raises it: blk_validate_limits() takes
> max_sectors from io_opt once io_opt exceeds that cap. On the array we
> measured, NOWS is 65535, so io_opt is 32 MiB and the initiator emitted
> 32 MiB commands -- from a controller that advertised no MDTS at all.
>
> The target cannot serve those, in one of two ways depending on the
> kernel.
>
> Since 4a3f00262a04 ("nvmet-tcp: bound SGL data length before allocating
> command buffers"), nvmet_tcp_map_data() rejects any len above
> NVMET_TCP_MAXH2CDATA (4 MiB) with NVME_SC_SGL_INVALID_DATA | DNR, so the
> command fails hard and deterministically. That is the right response to
> an oversized command, but the initiator had no way to avoid sending it:
> nothing advertised the limit it was exceeding.
>
> Before that commit the command reached sgl_alloc(), which for 32 MiB
> needs 8192 scatterlist entries -- 256 KiB, an order-6 kmalloc. Under
> fragmentation that fails, and it surfaces as NVME_SC_INTERNAL, a generic
> status, so NVMe multipath does not fail the command over to another
> path. A 1 MiB command needs 256 entries, 8 KiB, served from the
> kmalloc-8k slab, which does not fail. That failure mode is intermittent
> and load-dependent rather than deterministic; on a vendor kernel
> predating the bound it cost us roughly 98 GiB of a 2 TiB image copy,
> with the copy tool exiting 0.
>
> nvmet-rdma has advertised a bounded MDTS since "nvmet-rdma: Implement
> get_mdts controller op" (Max Gurtovoy, Mar 2020), which left the other
> transports untouched.

Nit - instead of this patch reference - you should simply say:

>   Do the same for TCP, using the same 1 MiB value,
> so initiators size their commands to something the target accepts
> instead of discovering the limit by failing.
>
> Signed-off-by: Alfonso Kuen <gerencia@idkmanager.com>
> ---
> Changes in v2:
>   - Rewrite the rationale. v1 described the sgl_alloc() order-6 failure as
>     current behaviour; since 4a3f00262a04 that path is unreachable and an
>     oversized command is rejected earlier with SGL_INVALID_DATA | DNR. Both
>     failure modes are now described, and which kernels see which.
>   - v1 attributed the 32 MiB command size to a "generic 32 MiB ceiling" in
>     the block layer. The generic cap is 4 MiB; the 32 MiB came from the
>     target's own NOWS raising io_opt. Corrected -- and it sharpens the point,
>     since the same controller advertises an optimal I/O size it cannot serve.
>   - v1 called the 1 MiB SGL an order-0 allocation; it is 8 KiB.
>   - No functional change: the diff is byte-identical to v1.
>   drivers/nvme/target/tcp.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
> index e4f603b2a..414ba896e 100644
> --- a/drivers/nvme/target/tcp.c
> +++ b/drivers/nvme/target/tcp.c
> @@ -23,6 +23,9 @@
>   #include "nvmet.h"
>   
>   #define NVMET_TCP_DEF_INLINE_DATA_SIZE	(4 * PAGE_SIZE)
> +
> +/* Assume mpsmin == device_page_size == 4KB */
> +#define NVMET_TCP_MAX_MDTS		8
>   #define NVMET_TCP_MAXH2CDATA		0x400000 /* 16M arbitrary limit */
>   #define NVMET_TCP_BACKLOG 128
>   
> @@ -2243,6 +2246,11 @@ static ssize_t nvmet_tcp_host_port_addr(struct nvmet_ctrl *ctrl,
>   			(struct sockaddr *)&queue->sockaddr_peer);
>   }
>   
> +static u8 nvmet_tcp_get_mdts(const struct nvmet_ctrl *ctrl)
> +{
> +	return NVMET_TCP_MAX_MDTS;
> +}
> +
>   static const struct nvmet_fabrics_ops nvmet_tcp_ops = {
>   	.owner			= THIS_MODULE,
>   	.type			= NVMF_TRTYPE_TCP,
> @@ -2254,6 +2262,7 @@ static const struct nvmet_fabrics_ops nvmet_tcp_ops = {
>   	.install_queue		= nvmet_tcp_install_queue,
>   	.disc_traddr		= nvmet_tcp_disc_port_addr,
>   	.host_traddr		= nvmet_tcp_host_port_addr,
> +	.get_mdts		= nvmet_tcp_get_mdts,
>   };
>   
>   static int __init nvmet_tcp_init(void)

