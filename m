Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317631;
	b=Qirm9l7iDA0y0zJ/wlgRsm7u9wDKVSwSubj96e9WaXEHHTHLSqwAPV8tQq8I+zSpOs3f
	 BFUqhR7OBuhP8Yf2UxL5c+xZoN3ZP652qqwGzNAOzBm+rZM4yPR4hZwWk5SJna+JYIxrM
	 9K+CLlhuD4lXbXHMGBtrAm8ycz5Nv9ZffsQvVtNHYLhJzzn3QeXFdR+FzRDA/X3ULlCYk
	 tRN+SwSbsh8J7MwvY4HZlhDxhYgX94yYijck0NVeO81+67av4kTsdyu18E0XNZ5Z7BlTv
	 Mg+wQ/m0nOYgoux2DT4SQYfXLGpScyoxVl6NNa53D5YPRMbxPGWBoExMesRiXmqCSOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317631;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=469C7cxwQ8pRb1askRJV+4cr7ISUSoEqexSz4jUQ/l4=;
	b=kbVqWNKMz4Ac3HeAJbKzyWdB/VePbs9fKZE1dbV2IthKioVVlfuy6NthmexCn1JUqHd0
	 on/MtV35ETzZPE4mE+Y4iaRU74ModqjaolA6KdIqb10ljpWTv+qsVcUGWHxGtMtl8SKJv
	 7ELWVJpv25OCXWlW8WD48ewwQoE5S/A1yrYBHUrsZHY9k8DHi1RYq+VzEKyYEP9ox5cle
	 pb+2LT0kpoqZGa/n6ehfNSjU2I0hAMZlWTrnWAeRwxkNK1uttHA5KD0nZd5ef9eFpG3BJ
	 nJdcyammrW43GABY+7lf1JF8OrLsxOGJeUXGmgWXan78u0fL5WR2/YMPFHi1Em/jO0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=SbPs9s1z;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94935606A7DA;
	Tue, 10 Nov 2026 13:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94935606A7DA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=SbPs9s1z
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=469C7cxwQ8pRb1askRJV+4cr7ISUSoEqexSz4jUQ/l4=;
	b=SbPs9s1zT9LKQrhQRLSyVO8ow6ONaX4jHFvE2dv2wFraSEG/vjhq4VivxIp2K6Pb0idx/eil4
	cv+Zck5YLsYYMWWjdO9JkPYJnuG/+6WF8UN08zTmbr3piifah7LJVmBAwQtPxIxcAaB6kUfNOWy
	7KqGtKbI6osxqptm19A/F/c=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jP6zs2xf8zLlTt;
	Tue, 10 Nov 2026 21:33:29 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1DBC940565;
	Tue, 10 Nov 2026 21:33:44 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 21:33:32 +0800
Message-ID: <a5468087-7965-4650-87bc-71811cd4ab14@huawei.com>
Date: Tue, 10 Nov 2026 21:33:32 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] fs/resctrl: Report a temporary RMID shortage per
 CLOSID
To: Jinjie Ruan <ruanjinjie01@gmail.com>, <babu.moger@amd.com>,
	<ben.horgan@arm.com>, <bp@alien8.de>, <corbet@lwn.net>,
	<dave.hansen@linux.intel.com>, <Dave.Martin@arm.com>, <fenghuay@nvidia.com>,
	<gshan@redhat.com>, <hpa@zytor.com>, <james.morse@arm.com>,
	<jic23@kernel.org>, <mingo@redhat.com>, <rdunlap@infradead.org>,
	<reinette.chatre@intel.com>, <skhan@linuxfoundation.org>,
	<tan.shaopeng@fujitsu.com>, <tglx@kernel.org>, <tony.luck@intel.com>,
	<zengheng4@huawei.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
 <20261110132054.3702-2-ruanjinjie01@gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261110132054.3702-2-ruanjinjie01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Please ignore, will resend.

在 2026/11/10 21:20, Jinjie Ruan 写道:
> From: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> An RMID that is freed is held in limbo until its cache occupancy drops
> below the threshold, after which it returns to the free list. A request
> that fails because of limbo is thus temporary and worth retrying, which
> resctrl reports to userspace as -EBUSY. A request that fails because
> every RMID is in use is permanent and reported as -ENOSPC.
> 
> Where an RMID is only meaningful together with a CLOSID, a request can
> only be satisfied by an RMID belonging to the requested CLOSID, so the
> distinction has to be drawn per CLOSID. Instead it is drawn system wide.
> -ENOSPC is reported when the free list holds no RMID for the requested
> CLOSID, even when that CLOSID has RMIDs in limbo. -EBUSY is reported
> when the free list is empty and another CLOSID has an RMID in limbo,
> even when the requested CLOSID has none. Userspace is thus told to give
> up on a shortage that may clear on its own, and to retry one that cannot
> clear until it removes a group itself.
> 
> Architectures where the RMID is independent of the CLOSID always match
> the first entry on the free list, so neither case arises there and only
> MPAM systems are affected.
> 
> Draw the distinction from the number of RMIDs the requested CLOSID has
> in limbo where the RMID depends on the CLOSID, and from the system wide
> count otherwise. Drop the separate test for an empty free list, which
> the search handles on its own.
> 
> Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Babu Moger <babu.moger@amd.com>
> Cc: <stable@vger.kernel.org> # 7.1.x
> ---
>  fs/resctrl/monitor.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 04e4ea612b7c..b8f4e1ff4083 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -207,9 +207,6 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
>  	struct rmid_entry *itr;
>  	u32 itr_idx, cmp_idx;
>  
> -	if (list_empty(&rmid_free_lru))
> -		return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
> -
>  	list_for_each_entry(itr, &rmid_free_lru, list) {
>  		/*
>  		 * Get the index of this free RMID, and the index it would need
> @@ -225,7 +222,17 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
>  			return itr;
>  	}
>  
> -	return ERR_PTR(-ENOSPC);
> +	/*
> +	 * No free RMID matched. If this CLOSID has RMIDs in limbo, return
> +	 * -EBUSY so userspace can retry. Otherwise, the CLOSID is genuinely
> +	 * out of RMIDs. When RMIDs are not per-CLOSID, any RMID in limbo
> +	 * delays the allocation.
> +	 */
> +	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
> +		return closid_num_dirty_rmid[closid] ? ERR_PTR(-EBUSY) :
> +						       ERR_PTR(-ENOSPC);
> +
> +	return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
>  }
>  
>  /**

-- 
Best regards,
Jinjie

