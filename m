Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409244;
	b=wVp7TxS67yDIVUHy8G81tZ3ujlqGELd0qNHVIOmZYY+s4d/jnQKXbAPTE7GJk7bEXe4+
	 rWrtZdArKbCqEhrESfvtLYfzI8aAkfsQ09/gwwjCikuUvGpQ146/GV+2RoiX92IiuYK+Q
	 3uHEg8U/cOuaAGfXKRjhyamDb305+Lq1UyQsMcqPXDbXYf8EbwF1vPzA8qi7kXwNfQe+q
	 bNDL3SMUWXAvazR9tBV1jzKAFeDmvJqDWIc+eZVnCuHbem1JSTQ4HijKeO6QBwKoc3Upr
	 SAgvcdKxZ92FZWKUhlETUmuX6p4UzgQZ3nKxNV2VCqbNmLZ0AtA4Lu2JkLJdT6QMcBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409244;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dRGEJNcy+74OVTPVFz0Nfo59XU6+zDE0WTqrtLz4siQ=;
	b=tl4ElXO5jRd2yMRNvPad7scODpTOFqoEm5rA33tsvGr1Ph9eo2cVRqpKJnGy2CYt63qE
	 RllUbw8bUuQB+Y4PTjsKxxalygHKlOWlZPh/FIgu0s57OQ9YralnQb7boDPUHqqonlmKI
	 q/qW+Pyn/6WaXcg7RVnnp2csD0oGFKg5Wbd6Viw44a7eBmvcNp3YVwYV45uB1Iu8OEy3S
	 CHzqjUxDjT6VMKpLnYxsh9UUm6HP9oTg9+t5TWb3gaEYMyo4KmY5jqKyE6t2X7Xzh7el9
	 hhMoNUiL7B3ss3PRHqWgasHf2LX1rwSfuGcOzNxH+hN6kJbXWSqJSAB+8u6qjlzGWTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gN+E9Mi0;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C77606B203
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25C77606B203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gN+E9Mi0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7028C1576;
	Wed, 11 Nov 2026 07:00:40 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BBA53F632;
	Wed, 11 Nov 2026 07:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794409243; bh=4ZfRjG3ZJ15BhDnrsZxfFWKNcfLEyZXluHKVjSfWFyM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gN+E9Mi062PgcLsHuL17j2j0rJ+z9SxthQ6m3qIHW1594eLqHZHPIDvR6ceNv5FLf
	 7ZQ2qR9NglCgyeTZHfpOAiaC7lCiyQNEnaeL1q8BFmx4FYrI651cc+bgrWmRAbg9M/
	 pNRNE7NvGX6mnbftQVNRESh+eBkqBzmW9iPoCzrg=
Message-ID: <a97b8d1c-7fe6-40c4-a145-82f63bd0f6e5@arm.com>
Date: Wed, 11 Nov 2026 15:00:41 +0000
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
Subject: Re: [PATCH] arm_mpam: Account for a MBWU overflow before reading the
 counter value
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <d45dd5d2-15d2-41fc-adef-b8e9af9eb1a9@arm.com>
 <20261111125601.4120592-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261111125601.4120592-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ping,

On 11/11/2026 12:56, Ping Li wrote:
> From: leeonion.muyu@gmail.com
> 
> Hi Ben,
> 
> Thanks for taking a look.
> 
>> Is the a theoretical fix or has this been observed in practice?
> 
> Not observed in practice. My hardware team was reviewing the software
> overflow and NRDY checking logic with me, and we found this while
> walking through the code together.
> 
>> Based on this, for MBWU you should only see NRDY set in the
>> MAX_NRDY_USEC after a change of monitor settings. At such a reset
>> the VALUE is reset to 0. Are you seeing or potentially seeing an
>> overflow in this window of time?
> 
> I agree. Our starting assumption was IHI0099B.d 6.2.1 RGKWNB - that on
> a settings update the monitor VALUE field keeps counting using the new
> criteria without automatically resetting to 0. But as you point out,
> looking at the reconfiguration path in write_msmon_ctl_flt_vals(),
> the driver deliberately writes VALUE to 0 as part of the IDGYLF
> sequence, so the accumulated count is discarded there and even a
> 31-bit monitor cannot overflow within the NRDY window after a
> reconfiguration. The overflow and NRDY cannot collide.
> 
> My apologies - there was a second trigger in my original analysis
> that the commit message failed to mention: any error reading the
> counter value after the status bit has been cleared loses the
> accounting the same way, and mpam_msmon_read() does not retry
> non-EBUSY errors. For a MPAM_F capable MSC, mpam_msc_read_mbwu_l()
> and mpam_read_monsel_reg() go through the PCC mailbox and can return
> -ETIMEDOUT or -EIO on transport errors. So I believe the patch still
> provides protection against this failure path - it moves the
> accounting to the point where the status bit has been read but not
> yet cleared, and it is a no-op in the normal path.

I see. This is a side effect of the recent addition of support for MPAM-Fb (which uses  the PCC
mailbox). Any error relating to MPAM-Fb is considered as an indication of MPAM being broken and mpam
is disabled using mpam_fb_disable_mpam(). After this point normal driver behaviour cannot be
expected. So, if we do hit one of the MPAM-Fb failures then we've already triggered a tear down of
the driver. Hence, your patch isn't fixing anything that effects the normal operation of the driver.

Having said that, it is not pretty to rely on the MPAM-Fb failures being catastrophic and makes the
driver more fragile and difficult to reason about. Jin Jie has a patch [1] which addresses a problem
related to when control configuration fails due to an MPAM-Fb error. I don't currently intend to
merge either of these patches as I still think there is likely to be more of the same lurking in the
driver and I don't want to do this piecemeal. I may take them later though, after I've audited for
any similar problems; a couple of small changes are worth it for making the driver easier to reason
about.

[1] https://lore.kernel.org/linux-arm-kernel/20261104101541.563113-1-ruanjinjie@huawei.com/

Thanks,

Ben


> 
> Thanks,
> Ping

