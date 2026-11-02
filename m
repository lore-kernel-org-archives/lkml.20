Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611894;
	b=kqJnK4qRM0vlzZEOAHT4h2Rsxy4/N2w6JJ/89ZlKu/hqD/aCJ4qv8GpTsV+PnWeqLkTE
	 xgK4jp/Z7CNzokem6m3G/l4DgxZMgFC95jlwAseaj63HCRWo3/YqYNBqbnMiH1IZDBWg7
	 QG94ToIYsh05SUz1CkQ6IaGLVsSHS3vf8aRiC3TrdCADQvaeShR5n+6dN/GlSN5J0mBeS
	 gvp4q+/p4L53sra+tWT9jgPuR7V7LLAdiKdFX6y2PxYG5iSPstU4E8vrBhZHCANoJhNMK
	 3gtGCyFNj8+R6whRJCLawXEZZcQrw7n//Z3pX9ikCkn+aC6fhkYAW0EXd/GgQOyyYLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611894;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=wMpxUgI5WYQHqOiTNMupmrDcZlh4/8zsVO74lnqUK2M=;
	b=CG8YTH/vaeN7WQoKa/LEBjvO7g1Y73f121kvawcL8gwPwyg54Q5jVy8OvuOGVIPSeu55
	 SVGXtTXT9gUyWmdhh2s1JMHVXr5TffaLXQjCjk4SWn5mTUGuOKwJBtbqUwan0Saw8LQKc
	 YTbYiUUfjlkxzoffq6pmZQbWZyoDR5ae1woxQnQIYKi+5tM9JPyh1Ot85cu+2lGDSJiWH
	 b+Tp+BmOZdGC5UCVgRFRsS+K++bMdjfad1oT98hYSyCU8PUwctcUIMFiJ2+DhiLPlIQPI
	 68wa9TBykChHUf41Lbm3Ve0R94SqJVz84zdeddadrRD04WPAf6TrzlZagbGoz4gQsIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=GFViRWO2;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EC7606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44EC7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=GFViRWO2
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wMpxUgI5WYQHqOiTNMupmrDcZlh4/8zsVO74lnqUK2M=;
	b=GFViRWO2yIuo/FApP9DGv+3L9CtGEV/hhU7sxasp04wFv3gtE9SMfiHVIeGoL3T3T7taCwKU4
	Xo2dYrVTvZmBDBCK+EiT48D5coM/DbZV8tbR4UqCq4xmw4TCDc3ACgaZcEGYd1v04cltniCH6oU
	5p32Fbh37mJJ1JDOoDXWPZU=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jJ5zz6J3Wz1T4G4;
	Mon,  2 Nov 2026 17:31:11 +0800 (CST)
Received: from kwepemo200010.china.huawei.com (unknown [7.202.195.178])
	by mail.maildlp.com (Postfix) with ESMTPS id B04864057D;
	Mon,  2 Nov 2026 17:31:28 +0800 (CST)
Received: from [10.174.177.203] (10.174.177.203) by
 kwepemo200010.china.huawei.com (7.202.195.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 2 Nov 2026 17:31:27 +0800
Message-ID: <17c910a3-edbb-4f1e-8a6a-f02fbca9e606@huawei.com>
Date: Mon, 2 Nov 2026 17:31:27 +0800
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
Subject: Re: [PATCH] mm/migrate: fix softlockup in do_pages_stat() with huge
 page arrays
To: "David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>
CC: Qi Xi <xiqi5703@163.com>, <linux-mm@kvack.org>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn
	<joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, Gregory Price
	<gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair
 Popple <apopple@nvidia.com>, Qiliang Yuan <odys.yuan@gmail.com>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>,
	<sunnanyong@huawei.com>
References: <20261031033330.3416326-1-xiqi5703@163.com>
 <76579248-64db-47bf-b8d0-4eb3ca556f5a@kernel.org>
 <20261031094253.d28f484e7e27de469cfa76d2@linux-foundation.org>
 <4806f76f-1fd3-4554-8656-86f4802785fc@kernel.org>
Content-Language: en-GB
From: Qi Xi <xiqi2@huawei.com>
In-Reply-To: <4806f76f-1fd3-4554-8656-86f4802785fc@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemo200010.china.huawei.com (7.202.195.178)


On 02/11/2026 17:07, David Hildenbrand (Arm) wrote:
> On 10/31/26 17:42, Andrew Morton wrote:
>> On Sat, 31 Oct 2026 11:52:30 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:
>>
>>> On 10/31/26 04:33, Qi Xi wrote:
>>>> From: Qi Xi <xiqi2@huawei.com>
>>>>
>>>> do_pages_stat() walks the user page array in 16-page chunks but never
>>>> reschedules, so a huge nr_pages can hold a CPU past the watchdog
>>>> threshold on non-preemptible kernels. Add cond_resched() to the loop so
>>>> long move_pages() node-query calls yield periodically.
>>>>
>>>> With KASAN and function tracing enabled, a move_pages() node query
>>>> (nodes == NULL) over 10 million page entries (~40GB) can trigger the
>>>> softlockup on a PREEMPT_NONE kernel.
>>>>
>>>> Fixes: 80bba1290ab5 ("mm: no get_user/put_user while holding mmap_sem in do_pages_stat?")
>>>> Signed-off-by: Qi Xi <xiqi2@huawei.com>
>>>> ---
>>>>   mm/migrate.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/mm/migrate.c b/mm/migrate.c
>>>> index 7bdcdb57652f..6c2371020cc5 100644
>>>> --- a/mm/migrate.c
>>>> +++ b/mm/migrate.c
>>>> @@ -2545,6 +2545,7 @@ static int do_pages_stat(struct mm_struct *mm, unsigned long nr_pages,
>>>>   
>>>>   		chunk_offset += chunk_nr;
>>>>   		nr_pages -= chunk_nr;
>>>> +		cond_resched();
>>>>   	}
>>>>   	return nr_pages ? -EFAULT : 0;
>>>>   }
>>> I though we wanted to stop throwing in cond_resched() at this point?
>> It's almost unneeded in current mainline kernels.  PREEMPT_NONE can
>> still be selected by
>>
>> 	All supported Alpha configurations
>>
>> 	All supported Hexagon configurations
>>
>> 	Non-ColdFire configurations (classic m68k)
>>
>> However 99% of the world are on 5.x and 6.x kernels and many of those
>> machines use PREEMPT_NONE.
>>
>>
>> IOW, cond_resched() is not really needed in mainline, needed in
>> -stable.
> But where did the submitter reproduce this?
>
> Why should we even care reading the above?
>
> I'm all confused now.
Sorry for the confusion. I reproduced it on a 6.6-based arm64 kernel
with CONFIG_PREEMPT_NONE=y, KASAN and function tracing enabled.

Mainline now only allows PREEMPT_NONE on alpha, hexagon and
classic m68k; the mainstream architectures  cannot select it anymore.
So, as Andrew said, the practical value is for 5.x/6.x stable users.

I'll send a v2 with this written and CC stable.

Qi
