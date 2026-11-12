Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490440;
	b=jHal00uPQLMkyHL4A9z6+GmYbDkbvSkZ4mlYx3xui80RU8I8SZr6CwFM2ze76yk2p9W1
	 M72L+C988Aug7RlEZw30IRrYVkM8CXNb76+K4nn0x49K5qY1601UvGax1yH2pzmc0wSa4
	 eqZ3mmg81quWSNtXvKMKblYMkAtQwHuYhPzG0Eb3wzyzRi+4LQusxeDHVZqKyv6jriBWz
	 U6HMFoITRoepMPA6yxSpxEtqb8XI+BfEYGLA6XVOoUkJ7sH+7ViZF+9e79x18e4z2uSBG
	 L6RUlLUC9REZ8946OUm4kBbe61ywK0QUd7hMP9TfquJgh6dF1S/zrZ4PgdQG9KWWOpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FwL/KWXkezDHAFArKAWV6uoJFctTAPwUR8TBzgDQZkM=;
	b=lXhZvTkBGDrBlYv5bwnD0qP6utDYXw1wlGQR9LfckZmY6oZzh70IsAb3QMvo5gv65v+l
	 Wa+lwwn/fZ6VXq5DYlWqdrldeoI9JSM57kWOKbzmjNg7SLBBdFyJ7slNxQAM084m+SQq1
	 7Pj1Vu11pYcUGXbba8GyV2Xj0cGOZrsE6mQ/+NSeclftaJsPN+22idsOCtSI8/OrSRPCJ
	 JDXKVbroWZJbGhEPNg143k1GWvbvUmjwIA2sZtcKUqtOb7d1kgQvgjsArHD3b8ZenJZ8J
	 6i+sv0bLC9qRJTmKWIk7Iu3hckGPayzAGo5xnC+y+35NBkKc75KDdNHiiNZd6CVgPgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mXJNNx/2";
	arc=none smtp.remote-ip=74.125.228.139
Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C6E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C6E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mXJNNx/2
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c504c069dcaso214426266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490437; x=1795095237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwL/KWXkezDHAFArKAWV6uoJFctTAPwUR8TBzgDQZkM=;
        b=mXJNNx/2D9bvkGxbL6UWwG/avIeDGrhci2v0aMLsxA7DT/5Yz4ftOHqj59EKRfh4Zz
         d07QlHaS+8sKpB3jabucAJ5AqTKh/l0io+O8RDSnOThAXqYvo6lhIjVf6MuYqgq0LcUf
         Gfuhs3ZIyBVcb3hrtL9AK4ezUgGPq7m3550CFYJg5te+Am2IfAMWUThiRfIXcnq/bC2n
         V1xOD6v21IgJzmUi85ke8xToh16MDap6S+Uvy9RRpT6Q+utqLJC7h5Cel+B1dU+dqUAv
         cWC0li+6766Zs6EcZ0ua6EFtmxEYjkt56zyRXuRos7dCTE6oRa/ZQ29MERH9mwQd1qeN
         4tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490437; x=1795095237;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwL/KWXkezDHAFArKAWV6uoJFctTAPwUR8TBzgDQZkM=;
        b=0Ymb325PNO9m/wZx8mu9G5j7Z6OSag1HiOPLtrNhG64G1YVwIGZRFxeqyJfU60WgLW
         xupodIouaN1eiwlZz6HNInbnZRuQuEENs8/45eTZ5o08ilH6O+FixAtaKqih+YsveNnd
         Yca5aTueXQXPMUDt4qWyRPT4wYZG1MF7D023cZpDbLk/vEBsyzTlaTXi7JopBWdhlCGb
         yWo5Tvr7LSJPeKuE966PXIYK/2VT1IGiZwUZOWmjnHMtb/BvHNlKS6nzdjwqnwuzWeKC
         62eNyNdNG7X04mkTY9pVnxl4VEbwsed7wMoDK4QCKE5YYzN4Iho1bMOEqfY/abJ9A0tW
         MZtQ==
X-Forwarded-Encrypted: i=1; AL+hErHPpBgkYhvNDDC+EtlboZpwnwvbQQ2hMSZqWO7z8TP10CRnUapDZoXb1ipB+MG/cRLzqrTggCdVPgXfFvo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SxKjMcSEv/ic3UbJssFaRlRGUYgiDaPAtO0KECMYvVQWEWa+J
	eOYWPh/h7fNF0/xV5g4wIiHtyFj1n/01WSGB0skP21LP1rPVDSh1wxuL
X-Gm-Gg: AYBFou23gbaJmF7Gc2GSibCp6Rl1fwUJ2k2/CmtP742gcVpbhDe3uVHp7NISBORV8+w
	jOlspkctek+AERo9UmuxkhVaWKnIYmXdj9Al8+DZgCdeqRaGG6lOViww3qACYI1mieWf7DfwOkS
	tpurIlprIYaNKDFbtBpFC+fQ8LnK0jiZftO/FWE9xd0imWWUdXTVC5aPlwaZXsoXF6x3IVr5p5q
	XT7PBlMhhBJbcCdmbS1zuwjwflMV/ahdfejvk6ReiDvxoS6M2MPjI5Q90N9NQzmNQhvxYD3Ej8n
	6vxHeaaoK+MkztO6MF8A0zlx03naJHbQOIp32KnCsyWvhq+vhljqntQjqrb6S5k+mmOEew1NOi8
	8kOX8jPmYsTE5ycXrVAZpRFAj3Hyc8fg+tORD/TODTVLAdAB2EJQcLy0WtdnfYlhLMSD4rtXncF
	0xn+MI1tnsenZ+TWIsXDdbo2fvcJIYjKL5VANQ0IzeE/9X/McOsCapyFsyAcWeO9Mpt6gs7zGAr
	esiU4qZLHlpJz04uN5A9RqUJsj4iynFyo4tICCmz7tJPmFQW4UkUTp5WAHdSO6A+iVZFwcgFYpb
	BSLjwG3P10h4EFGwxRiA07GQyb487lQxSkvlgQ==
X-Received: by 2002:a17:907:868a:b0:c3e:34fa:611d with SMTP id a640c23a62f3a-c5066b51879mr464464066b.35.1794490437222;
        Thu, 12 Nov 2026 05:33:57 -0800 (PST)
Received: from [192.168.100.182] ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a6947sm353760066b.10.2026.11.12.05.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:33:56 -0800 (PST)
Message-ID: <e11f1ba6-6e56-4bac-a0cb-f9258a53f34e@gmail.com>
Date: Thu, 12 Nov 2026 18:33:51 +0500
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
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Andrew Lunn <andrew@lunn.ch>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yixun Lan <dlan@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Tomas Hlavacek
 <tmshlvck@gmail.com>, Muhammad Bilal <meatuni001@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
 <DMO13SWAGZAN.NYISGLGI7Y5A@linux.spacemit.com>
 <c55c5878-d9c1-4863-bc55-99d334ba2ede@gmail.com>
 <12a95b3a-9c8b-4a2d-9b81-12b3839e64a9@lunn.ch>
 <DMPNAPNEGQ5I.XYUIB7Y8HDCA@linux.spacemit.com>
 <ee3f414c-fffa-41e6-8bec-6af7ce676c4b@iscas.ac.cn>
 <DMQJ0R4QTE6R.2I492KA9N85CB@linux.spacemit.com>
Content-Language: en-US
From: Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <DMQJ0R4QTE6R.2I492KA9N85CB@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/9/26 1:10 PM, Troy Mitchell wrote:
> On Mon Nov 9, 2026 at 7:59 AM GMT, Vivian Wang wrote:
>> On 11/8/26 15:19, Troy Mitchell wrote:
>>
>>> On Sat Nov 7, 2026 at 5:32 PM GMT, Andrew Lunn wrote:
>>>> On Fri, Nov 06, 2026 at 03:44:50PM +0500, Ali Tariq wrote:
>>>>>
>>>>> On 11/6/26 2:43 PM, Troy Mitchell wrote:
>>>>>> On Thu,  5 Nov 2026 17:34:37 +0500, Ali Tariq wrote:
>>>>>>> @@ -2056,7 +2059,9 @@ static int emac_suspend(struct device *dev)
>>>>>>>    		return 0;
>>>>>>>    	}
>>>>>>> +	rtnl_lock();
>>>>>>>    	emac_stop(ndev);
>>>>>>> +	rtnl_unlock();
>>>>>>>    	clk_disable_unprepare(priv->bus_clk);
>>>>>>>    	netif_device_detach(ndev);
>>>>>> This can deadlock. emac_stop() -> emac_down() calls
>>>>>> cancel_work_sync(&priv->tx_timeout_task) with RTNL now held, while
>>>>>> emac_tx_timeout_task() starts with rtnl_lock().
>>>>>>
>>>>> Thanks Troy, that makes sense.
>>>>>
>>>>> For the deadlock, I think the correct function to call is rtnl_trylock()
>>>>> inside the emac_tx_timeout_task(), which would return if the lock is already
>>>>> held and will hold the lock if it is not.
>>>> rtnl_trylock() is generally a workaround needed for badly written
>>>> code. Please try to avoid it.
>>> Agreed. If the reset is done in place, the work does not need RTNL at all,
>>> so .ndo_stop can keep cancel_work_sync() as is.
>>>
>> Thanks for the diagnosis and suggestions.
>>
>> Although, maybe we could simply avoid cancel_work_sync() in emac_down()?
>> emac_tx_timeout_task() checks for !netif_running and does nothing if
>> already down so it should be safe. The task cancel_work_sync() in
>> emac_remove() does cleanup on unbind so the task is not leaked.
>>
>> This seems to be the pattern in other drivers as well. What do you think?
> That was my first thought too, but I'm not sure netif_running() is
> enough here. emac_suspend() calls emac_stop() directly, so
> netif_running() is still true and a pending work would stop the device
> a second time. And since the netdev is devm-registered, emac_remove()
> runs before unregister_netdev(), so the work could be requeued after
> the cancel there.
> 
> So we'd still need to cancel it in suspend and remove, and at that
> point resetting in place looks simpler to me. What do you think?
> 
> 

Thanks Troy, Vivian and Andrew. I'll drop rtnl_trylock().

I think a simpler approach here will be to go with Vivian's suggestion
of dropping cancel_work_sync() from emac_down(), and handle Troy's two
cases by disabling the work where the device is stopped without the core:

1. Suspend: emac_suspend() calls disable_work_sync() before stopping
    the device, and emac_resume() calls enable_work(). So the work
    can't run while the device is suspended.

2. Remove: emac_remove() uses disable_work_sync() instead of
    cancel_work_sync(), so the work can't be queued again before the
    devm unregister_netdev().

For a normal close, the work's existing netif_running() check is
enough, because the core clears it before calling .ndo_stop.

With this, nothing waits for the work while holding RTNL, and the
work doesn't wait for itself.

v2 will have two patches. First the TX timeout fix (reported by Troy) 
then the suspend/resume patch, which will take
RTNL after disable_work_sync() and before the netif_running() checks.

If you still prefer resetting in place, please let me know.

Regards,
Ali

pw-bot: cr
