Received: from mta0.migadu.com (out-152.mta0.migadu.com [91.218.175.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1433A451F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267901; cv=none; b=ojLqjcowiaIYWdZn+S0yaxcgQFBMnEubB5p8YFjFbndP71sbyZNrK9OP3xu9dYcbM7SwIDlZQ4RfXHmh3loYOOWytOMZEpJKTM51CmJEEeEIAv3EjlbYdmJ8NQEbtzR8FbihY3Xf9q7QcaFI5qDi7junHf5Nm2VVm03CpE3V/YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267901; c=relaxed/simple;
	bh=A4mU+ZrAkvQl8NVxFJ/4s/Y7PH4gaV/BiB2sBBPkW9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FaAfPm4lTMv62i0d4HgCX2oCOcVjnxX9N95jiwjG+TOnMnHv22Mx2EcGSRTvpzoWMBSh5pw0mLuc9R2o71dqvGAmVJXM5jzr6HUi54fYt9rVaJ5Abnl+sX3lLaTfiUddAuY2QhEzKy+EZGbGXsbJ8yEOEQ+Lb47jvRtVJq9uceo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kV92Xnt+; arc=none smtp.client-ip=91.218.175.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kV92Xnt+"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=A4mU+ZrAkvQl8NVxFJ/4s/Y7PH4gaV/BiB2sBBPkW9g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788267897; v=1; x=1788872697;
 b=kV92Xnt+1JjzfiZbFjkmubjA9yYakpOheKQlnp5p0Tn1HmQnaXuxupNeSe9msj6C0sG9GNEj
 BwMW6xaBUFZJPeoYFadbeMv0Slo1x/My7Oxxv0FdXSIuNANHjBPEYIiNqky255PfLywpMcFwBLC
 toyOy9r3e/kmIldemY1sNBVo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 46f1897b22d68139;
	Tue, 01 Sep 2026 13:04:47 +0000
X-Mizu-Trace-ID: 46f1897b22d68139
X-Migadu-Flow: FLOW_OUT
Message-ID: <4a664246-eaf9-47ad-98a0-10a0fccce572@linux.dev>
Date: Tue, 1 Sep 2026 21:04:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] octeon_ep: remove redundant memset in
 octep_setup_pfvf_mbox()
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Veerasenareddy Burru <vburru@marvell.com>, Sathesh Edara
 <sedara@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20260901110913.977745-1-ekffu200098@gmail.com>
From: luoxuanqiang <xuanqiang.luo@linux.dev>
In-Reply-To: <20260901110913.977745-1-ekffu200098@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/9/1 19:09, Sang-Heon Jeon 写道:
> vzalloc() returns zeroed memory, so the memset after the allocation is
> redundant.
>
> No functional change.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: Xuanqiang Luo<luoxuanqiang@kylinos.cn> Thanks,
Xuanqiang

> ---
>   drivers/net/ethernet/marvell/octeon_ep/octep_pfvf_mbox.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/marvell/octeon_ep/octep_pfvf_mbox.c b/drivers/net/ethernet/marvell/octeon_ep/octep_pfvf_mbox.c
> index 0867fab61b19..e4175d5bdb3b 100644
> --- a/drivers/net/ethernet/marvell/octeon_ep/octep_pfvf_mbox.c
> +++ b/drivers/net/ethernet/marvell/octeon_ep/octep_pfvf_mbox.c
> @@ -274,7 +274,6 @@ int octep_setup_pfvf_mbox(struct octep_device *oct)
>   		if (!oct->mbox[ring])
>   			goto free_mbox;
>   
> -		memset(oct->mbox[ring], 0, sizeof(struct octep_mbox));
>   		memset(&oct->vf_info[i], 0, sizeof(struct octep_pfvf_info));
>   		mutex_init(&oct->mbox[ring]->lock);
>   		INIT_WORK(&oct->mbox[ring]->wk.work, octep_pfvf_mbox_work);
