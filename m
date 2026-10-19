Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEAE494805
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398444; cv=none; b=BobU13BLLhpp+I5XlHuLTq/k3d4e2Pn5uIJ+/uhA7OAgwbuE7PsbxUCT4V37+3K2iZE312bYykCCh2jElnGdq2i70iNAQkJglGHZ5cCj2MDv/eFKYOKnsnafAgwz3TI9I/D/+ZvC2Fp24aLYoE0l418y8GK8PLI46wvBLJ1UBsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398444; c=relaxed/simple;
	bh=h8jQv9Ze+HLeF3Wi26cKfAzP/IyLM6OeCbHYoTmwwco=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=jIv6FwV7GhIHDioycdRMpJ4NQ8tP+BRy+UDj/bExqR7vPDA/u2iJvU9NWoBQUljdt7MCC+awpDqBAOOmHovjLBIGjmjzvld82DdfRYhFNzQfsnJvOmaT6lktyXKSQAMXyKIMt2rC9HwmERMVKo5H25bO120LSf6184B4pTilK6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=hWTlvtAp; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="hWTlvtAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792398436; bh=4eMwQty/AKjsc7RBGsmlyUAiQe2vEIFIpT7tSz4CID4=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=hWTlvtApFJ0KtKvH7UKfYzVDSuWFU0u6CHCbE4J9Rqp+8nolkROQH4Qiawx/PcTiz
	 oTM2GJ0U/f0NadhUqsVNSq+9udKhpDp4hMPBIumhAihCTYd7TnnnUU/XjIKDgZwTz3
	 Gy1MmGfzEfcW8ZNvRZfoQFGjmLyBUwc9+T2b3qMU=
Received: from [100.125.153.207] ([139.159.170.67])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 6CD2CC5D; Mon, 19 Oct 2026 16:27:13 +0800
X-QQ-mid: xmsmtpt1792398433t5k5sa9e2
Message-ID: <tencent_79EF572ED3AE270810F36FFFA52866708E09@qq.com>
X-QQ-XMAILINFO: Nx5J06Esz7r722De70OeggrYCkAQ/n60huZrajJDh572GGJmZrYuCvsyO1sSCV
	 8yXbZGhfvxUHmHiRtRuu8vnfvqbdDZjQJxpT01NfWBDB1cGkRehCG1QhKmDXqnrb/hqEsR1ITfdn
	 4vZpxAYWq2CfeBKRRDT5XfXcHlRjA5eAsWdiTQ47gfkNPNCTmpHIiTPXIQ4LwPR9uvv3rN5FKqxC
	 gLfr5RhMlQEMWE1tU8qHQVvt/zzl3TjFM1Iz+hSAhkETHTNsKWaYJuzmivCgLKfSYWb+QeaP6sDq
	 dvhoj3KN6lzm/srVPa4+7Hn9VBJ4D7le/zo81J2/m8d9qqH3s1eSmAzZoMoKs/NSOuA32gXLcaHA
	 IMcLSe4ErklhOxnjnUvdLud1iPy9utQ3ee3HshOM7EqF6jUGoZQcMsyi1HKZDnUx4+RW7RicZoQG
	 ridlOaBuyfmmFpXaDQ6ik7AdE/RsrvQU0fCPyum7+BdzR6jFqoAomX1pAvtmrpviWujUPDrtUYhG
	 vFqRr7kO/lTfb+JACVJ/T3eM3srjuinfFuT3Cx5iClTvDeAW2cejunEi5Fq9F89vhUBzNt94GG9O
	 cVDXsmQ0ntpX4qed8p1IoUmhEuAuX66I8GA2sdwoKtlRCTRlWjg2MP9ryn3JHnFwIcWZArb3biZv
	 91d5E2AcGa+B34Jeam+h9HJv6nRS2eX3wxtPKqFX3qiI1MXkd5ctBZx2E5WaQYvbiH5I6RFCK5EX
	 hP1sGfH2q4WixZ28nHaiFdnbATiGNkEi4W26v1gdmZzHPU+CqhJ08uIioJDcDitD4RGL0BJVDOJ4
	 imCIfYk4cxuuuej4fHyUeSoc+UennXDnqYPDRYKWPiChDaKhBHIRkPRPa9oztuR5yIp4h0T/Iqum
	 Mhz0AexN3Eq50XfvE5mEb+HkdgMq8YqS83LOk+LHH/tHZ/hCJytYezb5C6pzpgdC3pLhJJzdXqiW
	 w9wIhF8e0XhaVYboNEIbCZvxe1/sGBMIe2pa54dKdCwgz0sE068HkyVwhDuG9qV32cLSC6rjEtKp
	 sYpxIsBeFIg4howDaPFD71GH67usRVVfQRWpoWAvLfcvU+NbdLNRJntkT70pdjH7NLb1SIYVgRvm
	 3eGKyVopcPqD2zjmQ50d228cTehg==
X-QQ-XMRINFO: N+gupeqCsbX2dbw+y2ZVvQ50YKO6IOr5VQ==
X-OQ-MSGID: <648a44ad-c8fd-409b-b2c5-e84993d9343a@qq.com>
Date: Mon, 19 Oct 2026 16:27:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/15] fs/resctrl: Return -EBUSY when per-CLOSID RMIDs
 are in limbo
From: Jinjie Ruan <2118537295@qq.com>
To: babu.moger@amd.com, ben.horgan@arm.com, bp@alien8.de,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com, Dave.Martin@arm.com,
 fenghuay@nvidia.com, gshan@redhat.com, hpa@zytor.com, james.morse@arm.com,
 jic23@kernel.org, mingo@redhat.com, reinette.chatre@intel.com,
 ruanjinjie@huawei.com, tan.shaopeng@fujitsu.com, tglx@kernel.org,
 tony.luck@intel.com, zengheng4@huawei.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20261019073453.2142856-1-2118537295@qq.com>
 <tencent_42E06D8D14F5CCC231EB4A4C9AC4C42EA206@qq.com>
Content-Language: en-US
In-Reply-To: <tencent_42E06D8D14F5CCC231EB4A4C9AC4C42EA206@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

This patch is part of the v10 series. For the main thread, see:

https://lore.kernel.org/all/tencent_28FE31D80A7A9AEEC43B22D0AD8894E30C06@qq.com/#t

在 2026/10/19 15:33, Jinjie Ruan 写道:
> From: Jinjie Ruan <ruanjinjie@huawei.com>
>
> resctrl_find_free_rmid() returns ERR_PTR(-ENOSPC) when no matching RMID
> is found in the free list. On systems where RMIDs depend on CLOSIDs
> (CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID), the target CLOSID may have RMIDs
> temporarily in limbo rather than permanently exhausted.
>
> When userspace attempts to create a new monitoring group, a permanent
> -ENOSPC failure prevents retry even though the CLOSID's RMIDs may become
> available once the limbo handler completes.
>
> Check closid_num_dirty_rmid[] before returning -ENOSPC. If the target
> CLOSID has dirty RMIDs, return -EBUSY to signal a retryable condition.
>
> Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")
> Cc: James Morse <james.morse@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Babu Moger <babu.moger@amd.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   fs/resctrl/monitor.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 73413cb128ea..da883adc3adc 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -225,6 +225,14 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
>   			return itr;
>   	}
>   
> +	/*
> +	 * If this CLOSID has RMIDs in limbo, return -EBUSY so userspace can
> +	 * retry. Otherwise, the CLOSID is genuinely out of RMIDs.
> +	 */
> +	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) &&
> +	    closid_num_dirty_rmid[closid])
> +		return ERR_PTR(-EBUSY);
> +
>   	return ERR_PTR(-ENOSPC);
>   }
>   

