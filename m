Received: from mta1.migadu.com (out-108.mta1.migadu.com [95.215.58.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428C93947B5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816037; cv=none; b=GD2TJBgrf+MvDr6hOexRhYCdnj39OP4/FHpkiaTxNxC/WHfdePCeMWHO03A5CUimujgTEB3MUowY0VCWpbXVZoHkxCD0qSLI6L9WfbFQUM/zaIGD4mx0gqzZytEC2SjTkczpEgqoqMsKpntYG4IlB9iTS3/hp7CaheUvuKbRRlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816037; c=relaxed/simple;
	bh=YQJDeQ6/mKDBvukG5aoMANHfDYazHYAMwfzJ7ZbLcLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hBupkKbq0o1bfxpm1+hS0H8KViD9FYynoyz8a18tz3lwt1SVeVSSYj8clBgM3C6NdvbuNP+Zhp07BpDvoXowdsMBU7DIrsqLSwZDH7aHO+/eosSQaae1HpEqeUEsPc+nT5BXHEa+HXVstBAEV+E5VUdZhOHfahISdjbqiRLOby0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=F0y7m+N8; arc=none smtp.client-ip=95.215.58.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="F0y7m+N8"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YQJDeQ6/mKDBvukG5aoMANHfDYazHYAMwfzJ7ZbLcLs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788816029; v=1; x=1789420829;
 b=F0y7m+N8ajV65riNmYrxw035/AQpeRDJGoYtfH28Ea3XA/xPwxOx4qAUrRkBmnKC55BMjJAB
 5EqbLkQfziCBFTPxTOPShrDdDfh/wz5JXWmXiXksIMFwAPpUr8+jg8S9pL8l30ZxwzKvitKO0uh
 kgEDtOiAzrmY2f89Q8Dvgqnk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8f82e7bcff9f2353;
	Mon, 07 Sep 2026 21:20:29 +0000
X-Mizu-Trace-ID: 8f82e7bcff9f2353
X-Migadu-Flow: FLOW_OUT
Message-ID: <27376486-9cab-4d42-8ed7-36e13231dd91@linux.dev>
Date: Mon, 7 Sep 2026 14:20:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RDMA/rxe: Use validated num_sge in local buffer
To: Nicolas Morey <nmorey@suse.com>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Tristan Madani <tristmd@gmail.com>,
 "open list:SOFT-ROCE DRIVER (rxe)" <linux-rdma@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "yanjun.zhu@linux.dev" <yanjun.zhu@linux.dev>
References: <20260907161550.716670-1-nmorey@suse.com>
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <20260907161550.716670-1-nmorey@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2026/9/7 9:15, Nicolas Morey 写道:
> For both SRQ and non-SRQ receive paths, the WQE is copied into a local
> buffer to provide a kernel-owned, validated copy. While calculating the
> memcpy size from the validated num_sge prevents overflow during the
> copy, memcpy() itself still copies num_sge from shared memory.
> 
> A concurrent userspace modification before or during memcpy() leaves
> an unvalidated num_sge in the local buffer, leading to potential
> out-of-bounds reads in rxe_resp_check_length() and copy_data().
> 

Hi Nicolas,

Thanks for the patch. The logic makes total sense to prevent the TOCTOU 
race condition after memcpy.

Just out of curiosity, do you happen to have a reproducer or a POC 
script that demonstrates this race in practice?

It would be great to know if this can be reliably reproduced or 
integrated into testing setups (like rdma-core tests, or 
tools/testing/selftests/rdma) to catch similar double-read issues in the 
future.

Thanks a lot for your effort.

Zhu Yanjun

> Explicitly assign the validated num_sge to the local buffer after the
> copy to prevent this race.
> 
> Fixes: 22b8fbded65b ("RDMA/rxe: Fix TOCTOU heap overflow in get_srq_wqe")
> Fixes: d6ab440240a0 ("RDMA/rxe: Copy WQE to local buffer in non-SRQ receive path")
> Signed-off-by: Nicolas Morey <nmorey@suse.com>
> ---
>   drivers/infiniband/sw/rxe/rxe_resp.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/infiniband/sw/rxe/rxe_resp.c b/drivers/infiniband/sw/rxe/rxe_resp.c
> index 02b16e2b49b8..cd51042857d6 100644
> --- a/drivers/infiniband/sw/rxe/rxe_resp.c
> +++ b/drivers/infiniband/sw/rxe/rxe_resp.c
> @@ -288,6 +288,7 @@ static enum resp_states get_srq_wqe(struct rxe_qp *qp)
>   	}
>   	size = sizeof(*wqe) + num_sge * sizeof(struct rxe_sge);
>   	memcpy(&qp->resp.srq_wqe, wqe, size);
> +	qp->resp.srq_wqe.wqe.dma.num_sge = num_sge;
>   
>   	qp->resp.wqe = &qp->resp.srq_wqe.wqe;
>   	queue_advance_consumer(q, QUEUE_TYPE_FROM_CLIENT);
> @@ -328,6 +329,7 @@ static enum resp_states rxe_get_recv_wqe(struct rxe_qp *qp)
>   	}
>   	size = sizeof(*wqe) + num_sge * sizeof(struct rxe_sge);
>   	memcpy(&qp->resp.srq_wqe, wqe, size);
> +	qp->resp.srq_wqe.wqe.dma.num_sge = num_sge;
>   
>   	qp->resp.wqe = &qp->resp.srq_wqe.wqe;
>   	return RESPST_CHK_LENGTH;

