Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794410154;
	b=OoMe5cviEC0UZ2LC66wo5GrwQaHwewYZgwqwkvLRr8hlJj8aXD/gx2TtdZ83jEqcwuNT
	 ApPb3rE543r5hhFtHppz9B5197e5TTMRn4nQjdqb83pd1M5x/3S7l4Vf89YC1B+4EyUIB
	 zx0MqCJy60KysXBlUt+gxrz37vF5rH7vy2tJDVJQr+6lGNoZaNoydmHwY0FnbknO6u6T/
	 U2JpkifdI+mW8HNwIt5XsisXONsFgtnivIFgs98TFnSRPMnXTT6bJiaa0lCoIAWemAAxO
	 qfcuhdivB55ra7nAvIAgQxXAAxXZqzy/wjOsilRuMkpzkvab1iIsPDpe2pB0HRAv73w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410154;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Pprxhn7SNkfKNPiAEW5wNbJlXAXRZEVWDfUn3Qm3Prk=;
	b=MuYCBftxitG/+u6OPh857ldpHofNp4i/RfHqGu3DWoEjrqtVg/6U1pG+gQhpaoacZf3+
	 1BcAh2kWP5RR81i6gHoueHP5NzleJbtvV6m+6vh4AJoMx2WXCnChZyBB+5NADNarR2aTE
	 lyqZnhevVjx2mJ+Pssqu+XgXjEV7H2hQ2Qi7HzR3S/WVv7UPbC+jFqjuOi4Kl0epcsEal
	 V8UTjTP+uGHTCBXFESpFFcxIT6nYYLtv31tQ0tffAexckeJDt/3wJ/r81Zs4eQEWU139e
	 +cJmUaGdzlkvXXRHRLEOvRkUS8g4qsxHfBAJzeAb83lzqQITsoUyqlX+hR+1Ox56stg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="uVG91/NU";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8F8606A334
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E8F8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uVG91/NU
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 418731576;
	Wed, 11 Nov 2026 07:15:50 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41D813FA7A;
	Wed, 11 Nov 2026 07:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794410153; bh=d19WkltXV0i6LVlVs/qFDgMqx7ypd2YCR4Ad5YUEAxc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=uVG91/NU0Kjn7NcqJHLIcabrXwl3/B3yxmrjWkpLbk2jOoIYiDlCae3MZS4r54V3d
	 MC0ZYbCrNLdiuxN1qJyddD7Zkmy0KRAUcQTckpsijCgnkmn3LOpjYW3bhcUFtx5fyM
	 i2kWXF/gyrCUAF4NhYpSlNmyDEnAYohb/ly0EaR8=
Message-ID: <aa7fc5d7-de81-4e40-9b2e-5253f0c7bb02@arm.com>
Date: Wed, 11 Nov 2026 15:15:50 +0000
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
From: Ben Horgan <ben.horgan@arm.com>
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <d45dd5d2-15d2-41fc-adef-b8e9af9eb1a9@arm.com>
 <20261111125601.4120592-1-leeonion.muyu@gmail.com>
 <a97b8d1c-7fe6-40c4-a145-82f63bd0f6e5@arm.com>
Content-Language: en-US
In-Reply-To: <a97b8d1c-7fe6-40c4-a145-82f63bd0f6e5@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ping,

On 11/11/2026 15:00, Ben Horgan wrote:
> Hi Ping,
> 
> On 11/11/2026 12:56, Ping Li wrote:
>> From: leeonion.muyu@gmail.com
>>
>> Hi Ben,
>>
>> Thanks for taking a look.
>>
>>> Is the a theoretical fix or has this been observed in practice?
>>
>> Not observed in practice. My hardware team was reviewing the software
>> overflow and NRDY checking logic with me, and we found this while
>> walking through the code together.
>>
>>> Based on this, for MBWU you should only see NRDY set in the
>>> MAX_NRDY_USEC after a change of monitor settings. At such a reset
>>> the VALUE is reset to 0. Are you seeing or potentially seeing an
>>> overflow in this window of time?
>>
>> I agree. Our starting assumption was IHI0099B.d 6.2.1 RGKWNB - that on
>> a settings update the monitor VALUE field keeps counting using the new
>> criteria without automatically resetting to 0. But as you point out,
>> looking at the reconfiguration path in write_msmon_ctl_flt_vals(),
>> the driver deliberately writes VALUE to 0 as part of the IDGYLF
>> sequence, so the accumulated count is discarded there and even a
>> 31-bit monitor cannot overflow within the NRDY window after a
>> reconfiguration. The overflow and NRDY cannot collide.
>>
>> My apologies - there was a second trigger in my original analysis
>> that the commit message failed to mention: any error reading the
>> counter value after the status bit has been cleared loses the
>> accounting the same way, and mpam_msmon_read() does not retry
>> non-EBUSY errors. For a MPAM_F capable MSC, mpam_msc_read_mbwu_l()
>> and mpam_read_monsel_reg() go through the PCC mailbox and can return
>> -ETIMEDOUT or -EIO on transport errors. So I believe the patch still
>> provides protection against this failure path - it moves the
>> accounting to the point where the status bit has been read but not
>> yet cleared, and it is a no-op in the normal path.
> 
> I see. This is a side effect of the recent addition of support for MPAM-Fb (which uses  the PCC
> mailbox). Any error relating to MPAM-Fb is considered as an indication of MPAM being broken and mpam
> is disabled using mpam_fb_disable_mpam(). After this point normal driver behaviour cannot be
> expected. So, if we do hit one of the MPAM-Fb failures then we've already triggered a tear down of
> the driver. Hence, your patch isn't fixing anything that effects the normal operation of the driver.
> 
> Having said that, it is not pretty to rely on the MPAM-Fb failures being catastrophic and makes the
> driver more fragile and difficult to reason about. Jin Jie has a patch [1] which addresses a problem
> related to when control configuration fails due to an MPAM-Fb error. I don't currently intend to
> merge either of these patches as I still think there is likely to be more of the same lurking in the
> driver and I don't want to do this piecemeal. I may take them later though, after I've audited for
> any similar problems; a couple of small changes are worth it for making the driver easier to reason
> about.

Just to clarify, it is still necessary that on any MPAM-Fb failure the error is passed up to resctrl
and then the user when they triggered the request. I will shortly post a small series that fixes
some problems in that area.

Thanks,

Ben

> 
> [1] https://lore.kernel.org/linux-arm-kernel/20261104101541.563113-1-ruanjinjie@huawei.com/
> 
> Thanks,
> 
> Ben
> 
> 
>>
>> Thanks,
>> Ping
> 

