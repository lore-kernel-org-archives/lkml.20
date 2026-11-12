Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448406;
	b=E3uycHvjaaddGFlNdzgKgSH3dt502xPojn/iq730QPrfnPhwjfBeKuqA80n0I1UbVkzv
	 q2CjXz6D1T+dWbir1S1Id8kIZgPKWZIUeckHi/Poler5twiiPP4ozvPxfiN8kZgVr1ABb
	 hhuKnqjMqiqVlBMUwvFHJqPBhjrUb3pyroUQlz1n/AW1LpEHWQCtv3QRlZxdumarf7TYs
	 aPDdHaApzfys4+EDoVwi3G3VQAM7dGN1xwLyTaRXr3WKpHvH4578xzB8ujVryu8Wn3kPa
	 SYQY+q8WH2677KKnX6+Tc78Eevit554wM0XLgoNoh4IRAi4CA+eEf7jMBZBy+RgEIpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448406;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=EYc2BablPLwMhU9FZQ/OXJgvB4RspKvj+/PhgADu6Z0=;
	b=mBzRQwYK3nki0DFX1M78kEm8X1CAaNk8rQ9kWo15iJLKrTMaPZPLPHQNQLgUEO65jUuS
	 4hWXssF1DGPBLy/hY51oBfF05mIQTNiTPlvFd9Ch4BNCFaBoaD7AfSF8d+xbcUNWzBGH2
	 TqsWcoU1rHIGaFLwGq3mTJoVDQdSdq6E68tYHyi+br+Y0R6JL/wjax3oGpr0djja1+6Sj
	 jttm97is8Y34uqTYTYkueYsiBVB4VYjz6pF8Cbswfs7ddRV6lcK/+ylJ/6iOFEdWwhIEj
	 3ljiy0LAtIlYiHivBYzOX0JhZTBdd28ICAN/49/Fk1UW49EuhspKn2bgGb87ae4hFmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=eLtFSzSL;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7598D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7598D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=eLtFSzSL
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=EYc2BablPLwMhU9FZQ/OXJgvB4RspKvj+/PhgADu6Z0=;
	b=eLtFSzSLRmFPUMIm5WNP54MJKMXN6RWoEyf7CtknWk46vMmQ0xETv9IB94jpT67v6tIWIYqU+
	yrxEuHhmZFJk+UJnIdNSd0jXESLSqAfdCe/Ch+gPDXpA7kaxMC3Wk3ufrgGiI6qfWQFdSqeNS6l
	F4SzgI7b0aatXCz/fY5teTw=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jQ3LQ1p8pz1T4J1;
	Thu, 12 Nov 2026 09:52:46 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E91C5203AB;
	Thu, 12 Nov 2026 09:53:16 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 09:53:16 +0800
Message-ID: <ed1378ae-a580-4f3a-abb6-c3d0c57ead9f@huawei.com>
Date: Thu, 12 Nov 2026 09:53:15 +0800
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
To: Ben Horgan <ben.horgan@arm.com>, Ping Li <leeonion.muyu@gmail.com>,
	<james.morse@arm.com>
CC: <reinette.chatre@intel.com>, <fenghuay@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <d45dd5d2-15d2-41fc-adef-b8e9af9eb1a9@arm.com>
 <20261111125601.4120592-1-leeonion.muyu@gmail.com>
 <a97b8d1c-7fe6-40c4-a145-82f63bd0f6e5@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <a97b8d1c-7fe6-40c4-a145-82f63bd0f6e5@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/11 23:00, Ben Horgan 写道:
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

Yes, I also noticed that.

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

I agree to consider these issues together, and there may be other bugs,
including resctrl, such as schema write failures, but they appear to be
okay..

https://lore.kernel.org/all/20261104102304.703535-1-ruanjinjie@huawei.com/

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

-- 
Best regards,
Jinjie

