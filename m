Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794447758;
	b=wAbsEnmfm9ovyRtd1LjskSUGeAuOuSgJMBRZ6ya2/kC0GLEFjqSSQh68Uvx87DlalyxW
	 kyFE76GS/QwWBrob0/UXSsnwr2IBSVleely5p+LtVincJnkxNiDmuGC/PSgXm4q8yyCgd
	 AarEQ6ugoQ7rLh5eaXI5hoIZcO2H1ZJl3vlcLIguM5sJHthek8NkcfcKTL/Y/9Cq5Y8kf
	 efa6LWGpL/VmtMshpGJIQ51/1/0mXr6pNsfboxpy2cvLDphYRnNj3hsVXOD3baC8Qq+to
	 oJ1CEXqotsO8WRPxdpQfHr9EpPjvgZ9+b1C7HdmUlEbh0pSrVR7+AHNIuU3wcOM6pUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794447758;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=qW9MSBzHosQ7hdtobAJ7KEVajyY4W/gqzP4pj0COmPc=;
	b=XNZZgIoS+bCoR8nJAW2c+UEbCNArPudZ65oKirlxZVNM+uApyucFBf82+vpL/dpR0rMC
	 pvbM7ypAKSFohgI3uuE+96yXkZvxk76tn/rGi9lGx/XZ6jpnNp5XxaTxh7vRMjk+Cii73
	 QYImnEkxNTZ3uPemEbqTCMGZPe8CXph5EKtgz2YjnaEwNaPVT35K5P5vCE9oNhAW1vp4k
	 KwdT0J1f2BZi/K6dO5dD2A3fucAa6VckXzlS4cAvc0bCoeblviHvJOoq545TSMoa811xX
	 Y6rSgYa0UbL8dRhJuaM7VMUAKI1m3WtskotjvXu6/+T70TvIXZLhwfdv6MhZ1zykJnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=VPfINziM;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519F3606A323;
	Thu, 12 Nov 2026 01:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 519F3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=VPfINziM
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qW9MSBzHosQ7hdtobAJ7KEVajyY4W/gqzP4pj0COmPc=;
	b=VPfINziMutmXzV51O0x5Q8I/yYikzzBejH83e1meaMnYhaleoueAtFgbUctSPO5l8+ER9+kwc
	VjpVw9ZxTtA7rGXfplerLYkNHJXidhA38iozeWzw9VZis0gAOobg+DSyVkQkPzy8zyCLHbUzi+A
	5r0i0vA4P5rDJXYTNFq2d54=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jQ36K1vHHz1cyS0;
	Thu, 12 Nov 2026 09:42:17 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D61340578;
	Thu, 12 Nov 2026 09:42:33 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 09:42:31 +0800
Message-ID: <7d27b172-d186-4b7a-87af-d0d25554b964@huawei.com>
Date: Thu, 12 Nov 2026 09:42:31 +0800
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
Subject: Re: [PATCH v5 RESEND 7/7] fs/resctrl: Add info/moveable_mon_group
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<gshan@redhat.com>, <zengheng4@huawei.com>, <jic23@kernel.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-8-ruanjinjie@huawei.com>
 <efd9c3d5-a732-47bf-bca1-50a8650fd0ef@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <efd9c3d5-a732-47bf-bca1-50a8650fd0ef@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/12 2:34, Reinette Chatre 写道:
> Hi Jinjie and Ben,

Hi Reinette,

> 
> On 11/10/26 5:39 AM, Jinjie Ruan wrote:
>> Moving a MON group into the mon_groups directory of another CTRL_MON
>> group changes the CLOSID of the group while its RMID stays the same.
>> Where the RMID is only meaningful together with the CLOSID, as on arm64
>> MPAM, the move changes the RMID index of the group and is rejected with
>> -EOPNOTSUPP.
>>
>> Userspace cannot tell whether the move is supported without trying it.
>> Add "info/moveable_mon_group", which reads 1 when a MON group can be
>> moved to another CTRL_MON group and 0 when the move is rejected, and
>> refer to it where resctrl.rst describes the move.
>>
>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> Do you find that this binary "supported/unsupported" accurately captures

I think this behavior is deterministic on MPAMv1, so that's enough for mpam.

> everything that MPAM may ever want to do in this area? Could it be that, for

That would be what the new version of MPAM does (such as v2 mentioned
below), the behavior of the mapmv1 version is already determined..

> example, one day MPAM may be asked to support the move of a monitor group to
> support scenarios where the reset of monitor counts is acceptable to the customer
> and availability of PMG will be managed as part of the scenario needing support?

As stated in the MPAM manual, MPAMv2 completely separates PARTID and
PMG, allowing for more flexible and fine-grained monitoring statistics
across partitions, so the CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID will not
set for v2, However, it might need to be changed to a dynamic switch..

> 
> When adding a new interface it helps to consider future possible changes and
> aim to create an interface that solves the immediate problem while leaving room
> for future enhancements. If we do not do that the interface becomes a maze due
> to new files just being added to address the problem of the day.
> 

I agree with your idea. We need to think twice before we act.

> I would like to propose that this patch be submitted separately with the goal
> to obtain more feedback on the new interface. 

I don't object, but I understand this is the same thing as the previous
patch. I'd like to hear Ben's advice.

> 
> Reinette

-- 
Best regards,
Jinjie

