Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611761;
	b=Cn5gNCrl7dKcZmUB3dSL6d7xJyNa9YhcWNemfMy//Tyu1sn0TwF1X9oPv4/NAgQhwuwp
	 bL7NecGRX/78XALHGdlJPQApncN3YcOXJKnjHeoJUNZy0AV2lbQ5IfziO4BzCc7f1/6c6
	 +911KzSsBbkzb6XA6rPDPpxnpj3yGjgE2F6ieqi5tnvdsdQukXx1g0vGKw9lur3ldVGXQ
	 VxWwpRnYQtmNT+9MKSnRADCrPp5lZx8wP976ibOrEvTCDsH3olUGiyXKzFfOQ+aGxD7+Q
	 CNAb0O8eBB379k/ai2O/Mafh2dUclC2G2FRH5tQOe5QGRpt1hAmRyLCrvYMFMvvzT9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611761;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-OQ-MSGID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rxxX0qla8hwD31pbvXQlK+1bs9/2ui2XSllowjYuYoY=;
	b=4ob66HEoAPV+fqcQTQuMxU57+VwapHMaGDMZAQpwW0UjudjMZ8MDKLKBtUQthN/YXJTy
	 po/wZDiMcALY4YWdsTFSzbacxO5b/wY1dajzzR5hDutkyeKFaNyII3NV6KipofkQrFdZH
	 y/2lIW7sAUw/K/BTQc3BPWzCBqbWitVya8CDPsTTXMlNWFL47dwppeVvbMToc/frAzidf
	 9YHajO6/G73tEHh49wUGyEnbm8ePJcliUEooZG60zLrMBxyPiA5B0018ON1NwiltzaBZJ
	 DkPrmwTZdXCdZ1IuFLJbzhBD5djvBWotaAX86yvgqIb6ujwLLTz11eBtCmrUwGdRwLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=xWMWKiVm;
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9567606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9567606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=xWMWKiVm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793611754; bh=rxxX0qla8hwD31pbvXQlK+1bs9/2ui2XSllowjYuYoY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=xWMWKiVmR4TWRLjz5V26D4ZiVQQDnJyZIPTesIcDxnwOEEf7RAm33b57kZhtdrlOz
	 N6vC9SQvPnFgAHWC+ba6UN3UVBjt/oNumXtUfj/kjZLJl2x3ZbIcKHZ2jnID+EXKeJ
	 7MVVeiz/VBtTyOHBeeIjKOn9fbdjbBjLI9s4dAZE=
Received: from [10.88.157.208] ([61.169.203.203])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 74BA5091; Mon, 02 Nov 2026 17:29:11 +0800
X-QQ-mid: xmsmtpt1793611751t4nne06do
Message-ID: <tencent_9125D3B8701AD20B318ED534FC1119659807@qq.com>
X-QQ-XMAILINFO: NtdA9nrf+Ds0cXQSZJ3paxv0piPaAhDTo018K5/oh91Q4O2tGuq3ACE0h5VgjB
	 4QWmoUF8jTASINayjdNXRZZFP75OwhKqw8R3AiF8bf34i2UJxNZCkkJ+JhPODCDHuXXCnryenDAj
	 S+vQVly7g82FkqplaK9xqEDLOKkvOsaCNFP9lcXGmmcwkqr8sL/V4oeGg/DMyx4eV0hE6D3XmFjR
	 e94E4TSDG7MYTHIf7hm2gy4sghHkPyoepqDU1XF0ixQbQMwJp+78GNGsUbfA+k+jqjFmJeXArPQU
	 lvwWQPdC4NQ9sn76d2qB5WaQcVJn6IBwvS3WHyy1w3aXTtV/L4ZoPXPp/M7IVVXY1dO0N6DMA5ih
	 hikz1rmoHV+f2zJYH5l9XSi+kZ2ZxihDFbjT8VHr51kCF48tXsscZjMgNkzskajCILHBgNWwvm/y
	 IKL1LYaQX0rShGPIgMpJO3+IYO/5irg8f6vv2q+c7/awbUGq1q/Ox6SCU6dVWaEcShVPuDhhyrNd
	 j7LKOdFUMTwdbx1gzj1Cx+QdH3APayWbYJlxE1S8bhUwcSeG0mK3El0eZPkkyZ18+m1hNFj0c4en
	 a3u4v5NjcjuOpTALIHr4MqJj4b21gvRYnq5CIJcvUytTSCE1gM8LtNDvLpZE7pEVwpfHRNtuOV6O
	 Md8cDQqsgETgFOsMwJqWxIuMUvs91ZjzCsZjmJf/Bf0zwkg3HMAgEi9ZCPrVL3WWCJeuWuMHh+fe
	 zqBUVCxazjtV6Q4KZ2DX6p8L+ww+etxUDQ8v/YgQXQy/J3SzWV9QOgh+cBbauXtM58khhblMDUrg
	 6cnHtEe2NOv4XfXvP7Il0yUBZNrAz/vf/EBJ1LaT9vDJd/2OLyop0X1RbHQSSbegO9vAj1BNaVZN
	 +dFVexczlFge4iuOgKpcBv106m0aKBZI+OKZ9xHwZ3SP1VFn/zwiPRaiyrfOMwsKGP/pLrt8jg+M
	 iTT3WC1/a+MakyQZ4J9i+3j1qCF/5u9Z7R/dVnlhbH8KUCThVt7hXs5LNbzgb/Cejg1Q39GC5C9X
	 jIwCCx1qIGUIW37L4yCJ1me4mJVLG18rBYVeBVnznoNX+WjPpVebr2VAv2w/Lor1wBbj+M90wLyr
	 KeH1qfCwT707i+LXx0Pm0A4NfD8/VLUqmk/LbewViaZgCvO05vIRMeXAZo/WGulKxzE/4KjN66VR
	 910tM=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-OQ-MSGID: <b23eae5c-0bc4-4556-8516-82d77272ecc8@qq.com>
Date: Mon, 2 Nov 2026 17:29:11 +0800
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
Subject: Re: [PATCH] mm/page_alloc: release isolated freepages on compound
 range mismatch
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org
Cc: vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
 brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <tencent_869149E9C4305627F0ED654860AC4DDBC309@qq.com>
 <5d79db66-2195-4f8d-a721-e1756bc6ead0@kernel.org>
From: Zhenghui Hao <zhenghui.hao@qq.com>
In-Reply-To: <5d79db66-2195-4f8d-a721-e1756bc6ead0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2026/11/2 17:11, David Hildenbrand (Arm) wrote:
> On 11/2/26 10:06, Zhenghui Hao wrote:
>> alloc_contig_frozen_range_noprof() isolates [outer_start, outer_end)
>> before checking whether a __GFP_COMP request exactly matches the
>> allocated range.  If it does not, the function returns -EINVAL without
>> releasing cc.freepages, leaking the isolated pages.
>>
>> Call release_free_list() before returning -EINVAL, while the pageblock
>> is still isolated, matching the cleanup already used when
>> isolate_freepages_range() fails.
>>
>> Use WARN_ONCE() as well: the condition is reachable through the exported
>> API, and repeated invalid calls should not flood dmesg.
>>
>> Tested with an order-9 free pageblock and a one-page __GFP_COMP
>> subrange:
>>   before: free_buddy=0, leaked=512/512
>>   after:  free_buddy=1, leaked=0/512
> How did you reproduce this? Using a hacky kernel module?
>
>> Fixes: e98337d11bbdf ("mm/contig_alloc: support __GFP_COMP")
> I thought we discussed this in the past: if you are able to trigger the WARN
> something is messed up already.
>
>
> And indeed, same patch already here, SMH
>
> https://lore.kernel.org/linux-mm/20260629-free-pfn-on-alloc-contig-range-error-path-v1-1-496ff9ca22db@nvidia.com/
Thanks for the pointer, and sorry for the duplicate -- I missed the
earlier thread.

You're right on both points: the reproducer was a synthetic module, not a
real workload, and being able to trigger the WARN means the underlying
path or validation needs fixing rather than papering over it with
WARN_ONCE.

I'll drop this version and follow the existing thread. I'll check whether
the earlier patch is still pending and only send an update if there is a
real delta on the current tree.

Thanks,
Zhenghui

