Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478495;
	b=QOZID2v2LQ2+MxPZ2oE3SAwkaNqZ0zDDb16QqRSYVJN6XIqUnKjyyN6h9kc6CXpEnr8m
	 OtoZWbyAJJftkn/njC/WoFQ7dsy/7oH9Xs70iXLu++guyv0LEi0W8Gh1cgG+zTj71xHE4
	 +10P2AJMuQ/c39HOqp/n8dDZNDvAsR91CUQiCKZ4W/YeIbbLmywxTfNQAXByoaw+xeJdP
	 Ip46gXUz82Qsk+Je01YAKgy5i/pA/e5Wn2gZn8VPaXujqz3oPRnvIJSGkNq5a6g3lm8pS
	 vnvHfKD/xo6J2P0F30nO5LIoTnY163TQrvQl3gjdgSeP8EWiD97oX5LhrjxmwH09MIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478495;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=RK/JA3eAeIqaYw76IJTDkpRM6eNDSo2ev+UQ13JOcOo=;
	b=0ZYtyXW98f9RF2p7rlkQIfWJlzJfzjcK2WkNFVUApiUq6W+GOcJdETjT6vKayQIpa7Oc
	 c1gGIQJRMEwucv3Al4ihInBlQmmdJMNSXIQCLsu/oaQz/Otvx72INXQmgFLuyYhHeS2SW
	 S6y6PiJc3xhMbqWOwC0EJUM9XgXo+ibjgVitozaoAMo8mCwyOrPYnL4XOAdBED1naPrEA
	 UHJMCDPyImpV1KjgjxcPpSgJSsr+FgCZRfJZGvvQGX/pP2ATy82W3KOyJ12o3YSwE3xkP
	 HTeU95Kd+IhNcLqesmnh7ZOPhCGXTlY30w+RH6wVb5qVyxL1qsW6tVPl66W/cHyuDbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FvNuxFeu;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94007606A884
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94007606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FvNuxFeu
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E0DA153B;
	Thu, 12 Nov 2026 02:14:49 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.14.230])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE13C3F673;
	Thu, 12 Nov 2026 02:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794478492; bh=03oGMNKIkLrORcinz/NWCh9Xb8H8G9Bc81HCYjlUJY4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FvNuxFeu6APtBkadjYiJ4sAT0vvmqUum5ZcTOPKHy4385Rtm8vffG69ZcelXcLBq/
	 LPlubUhgFSPCH9DGZsds238FCXKIpT4F1iYqoNu8y+TQEaN3VntL6zgJ3UHSzsDcTZ
	 0oNYvCBtm8pEASXisG9+G87dstbjRgo3LGyOHv4Y=
Message-ID: <c1b23876-73aa-4be8-969d-dc5c8b5a6dc2@arm.com>
Date: Thu, 12 Nov 2026 10:14:40 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH] arm_mpam: Account for a MBWU overflow before reading the
 counter value
To: Jinjie Ruan <ruanjinjie@huawei.com>, Ping Li <leeonion.muyu@gmail.com>,
 james.morse@arm.com
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <d45dd5d2-15d2-41fc-adef-b8e9af9eb1a9@arm.com>
 <20261111125601.4120592-1-leeonion.muyu@gmail.com>
 <a97b8d1c-7fe6-40c4-a145-82f63bd0f6e5@arm.com>
 <ed1378ae-a580-4f3a-abb6-c3d0c57ead9f@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <ed1378ae-a580-4f3a-abb6-c3d0c57ead9f@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jinjie,

On 12/11/2026 01:53, Jinjie Ruan wrote:
> 
> 
> 在 2026/11/11 23:00, Ben Horgan 写道:
>> Hi Ping,
>>
>> On 11/11/2026 12:56, Ping Li wrote:
>>> From: leeonion.muyu@gmail.com
>>>
>>> Hi Ben,
>>>
>>> Thanks for taking a look.
>>>
>>>> Is the a theoretical fix or has this been observed in practice?
>>>
>>> Not observed in practice. My hardware team was reviewing the software
>>> overflow and NRDY checking logic with me, and we found this while
>>> walking through the code together.
>>>
>>>> Based on this, for MBWU you should only see NRDY set in the
>>>> MAX_NRDY_USEC after a change of monitor settings. At such a reset
>>>> the VALUE is reset to 0. Are you seeing or potentially seeing an
>>>> overflow in this window of time?
>>>
>>> I agree. Our starting assumption was IHI0099B.d 6.2.1 RGKWNB - that on
>>> a settings update the monitor VALUE field keeps counting using the new
>>> criteria without automatically resetting to 0. But as you point out,
>>> looking at the reconfiguration path in write_msmon_ctl_flt_vals(),
>>> the driver deliberately writes VALUE to 0 as part of the IDGYLF
>>> sequence, so the accumulated count is discarded there and even a
>>> 31-bit monitor cannot overflow within the NRDY window after a
>>> reconfiguration. The overflow and NRDY cannot collide.
>>>
>>> My apologies - there was a second trigger in my original analysis
>>> that the commit message failed to mention: any error reading the
>>> counter value after the status bit has been cleared loses the
>>> accounting the same way, and mpam_msmon_read() does not retry
>>> non-EBUSY errors. For a MPAM_F capable MSC, mpam_msc_read_mbwu_l()
>>> and mpam_read_monsel_reg() go through the PCC mailbox and can return
>>> -ETIMEDOUT or -EIO on transport errors. So I believe the patch still
>>> provides protection against this failure path - it moves the
>>> accounting to the point where the status bit has been read but not
>>> yet cleared, and it is a no-op in the normal path.
>>
>> I see. This is a side effect of the recent addition of support for MPAM-Fb (which uses  the PCC
>> mailbox). Any error relating to MPAM-Fb is considered as an indication of MPAM being broken and mpam
>> is disabled using mpam_fb_disable_mpam(). After this point normal driver behaviour cannot be
> 
> Yes, I also noticed that.
> 
>> expected. So, if we do hit one of the MPAM-Fb failures then we've already triggered a tear down of
>> the driver. Hence, your patch isn't fixing anything that effects the normal operation of the driver.
>>
>> Having said that, it is not pretty to rely on the MPAM-Fb failures being catastrophic and makes the
>> driver more fragile and difficult to reason about. Jin Jie has a patch [1] which addresses a problem
>> related to when control configuration fails due to an MPAM-Fb error. I don't currently intend to
>> merge either of these patches as I still think there is likely to be more of the same lurking in the
>> driver and I don't want to do this piecemeal. I may take them later though, after I've audited for
>> any similar problems; a couple of small changes are worth it for making the driver easier to reason
>> about.
> 
> I agree to consider these issues together, and there may be other bugs,
> including resctrl, such as schema write failures, but they appear to be
> okay..
> 
> https://lore.kernel.org/all/20261104102304.703535-1-ruanjinjie@huawei.com/

Thanks for bringing this to my attention. I'll add a comment there.

Thanks,

Ben

> 
>>
>> [1] https://lore.kernel.org/linux-arm-kernel/20261104101541.563113-1-ruanjinjie@huawei.com/
>>
>> Thanks,
>>
>> Ben
>>
>>
>>>
>>> Thanks,
>>> Ping
>>
> 

