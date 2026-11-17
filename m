Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911467;
	b=DHyEE0Q3EByCPGxwYUqRMy/68AGYbEeGbGvlpw7fGUW3aEo3ky3E4zzAThW7dNBWGS4y
	 IIM2QfUA0oE56Knor4wGxbAHQrnAmoVS6YzhVLDIGylUlD8+xsLPI/v/1+u7dD3to0h/5
	 t7OJ/9gmYTg2OqenJxB+7DEUIJRX6p2tWZQiRn8HxUw87Z8RD/+ycmAUDo5GRqdieG7vS
	 th3xtecA+09uqGH+LweYPQk8TDHhJHVu3ViKSCaodDsJyTcXMxR9b4FmY0SAfjKTXCins
	 YHltMR2dD42/cjo43+WMQkl6b40kTHiXuClOzjoPL2PdmMNVdS1YdxJT4mBJMqLjshA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911467;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fzwQ41gXbzBWFQOuSJndmRr1Y/hEGkuQs9i/J8SJwWI=;
	b=PVassboDo1Zj/SXh5x6HRZx83GX6y0ZFO5oLCKI08KzUDe8KCUTK4FIPbrltgCLf7SwL
	 33yX2z8Lue/yqO6cgFBfrBIYtDoHFHRDDLa4bdE/TiObUKkkkVnYIDF+YsRJ3T7v/Gh5w
	 2z1rgbHDKNkjAvXtT0+u3EvnfFDSrarNJBAX+4pPev7qORmx6Toarl9galJlrhpXOEeRW
	 Fi1eUWBYv53gyxtYcjPC27W7e6EnNRHKgwFgCkbPPZrr74aAYKxPwHOGuVxgHvMF+1Rqr
	 Mlftc+W+4UGhmspP8NDrUeGE4GUsv8IHGTzMQ0lKHdSoNYEF/TocHwZO2mt7JQTRolA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="dAn/9qq8";
	arc=none smtp.remote-ip=95.215.58.172
Received: from mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA32606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BA32606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dAn/9qq8
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uCrQmHHENcsF63rBxoHbkw+a1E1fsr2NdawTnDnGVyg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794911464; v=1; x=1795516264;
 b=dAn/9qq853Gn8sYg6XRGqGK0buph+wsvKO3u022wCZf+hyH9WasdSbaRVyoFBOkfvh/8nxYj
 oZNAsuyfvJ3K8ZSyjqBE0r0f+R6WVzcO8aLxItsaAsnEiEipA0Q9PGzSFrtgfgrgzIg67cH+FUz
 jebcd3gSh1x0puhJTpcL9Rqo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 61d688c623486c17;
	Tue, 17 Nov 2026 10:31:04 +0000
X-Mizu-Trace-ID: 61d688c623486c17
X-Migadu-Flow: FLOW_OUT
Message-ID: <17cc4251-04ae-41a7-a872-fc5cf525b58f@linux.dev>
Date: Tue, 17 Nov 2026 19:30:49 +0900
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
Subject: Re: [PATCH net] netdevsim: fix devlink rate node leak on
 devlink_free()
To: xietangxin <xietangxin@h-partners.com>
Cc: Dmytro Linkin <dlinkin@nvidia.com>, Vlad Buslov <vladbu@nvidia.com>,
 Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 syzbot+bbd81e1e2276c534dea1@syzkaller.appspotmail.com,
 gaoxingwang1@huawei.com, huyizhen2@huawei.com,
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20261117063237.865953-1-xietangxin@h-partners.com>
From: Xuanqiang Luo <xuanqiang.luo@linux.dev>
In-Reply-To: <20261117063237.865953-1-xietangxin@h-partners.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026/11/17 at 15:32 xietangxin wrote:
> netdevsim allows switching the eswitch mode to switchdev with zero VFs
> and creating rate nodes on such a device. However during device teardown
> nsim_dev_reload_destroy() only drops the eswitch back to legacy when VFs
> were configured, so the rate nodes are never destroyed and trigger the
> WARN_ON(devlink_rates_check()) in devlink_free():
> 
>    WARNING: net/devlink/core.c:544 at devlink_free+0x18c/0x26c, CPU#2: bash/5032
>    Modules linked in: netdevsim ...
>    CPU: 2 UID: 0 PID: 5032 Comm: bash Not tainted 7.4.0-rc3+ #77 PREEMPTLAZY
>    Call trace:
>     devlink_free+0x18c/0x26c (P)
>     nsim_drv_remove+0x9c/0xb4 [netdevsim]
>     nsim_bus_remove+0x10/0x1c [netdevsim]
>     del_device_store+0x110/0x190 [netdevsim]
>     ...
> 
> Evaluate the eswitch mode check unconditionally, so rate nodes are
> destroyed whether or not any VF was ever configured.
> 
> Reproduce by:
>    $ echo "10 1" > /sys/bus/netdevsim/new_device
>    $ devlink dev eswitch set netdevsim/netdevsim10 mode switchdev
>    $ devlink port function rate add netdevsim/netdevsim10/n1
>    $ echo 10 > /sys/bus/netdevsim/del_device
> 
> Fixes: 885226f5680e ("netdevsim: Implement support for devlink rate nodes")
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+bbd81e1e2276c534dea1@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/netdev/6af9824c.920b2b3a.148c65.0009.GAE@google.com/
> Signed-off-by: xietangxin <xietangxin@h-partners.com>
> ---

The rate nodes are also left behind on the reload path. I reproduced this
locally on 7.3.0 (net/main)

  WARNING: net/devlink/dev.c:437 at 
devlink_reload_reinit_sanity_check+0x178/0x1c8
  Call trace:
   devlink_reload_reinit_sanity_check+0x178/0x1c8 (P)
   devlink_reload+0x298/0x2b8
   devlink_nl_reload_doit+0x5cc/0x870
   genl_family_rcv_msg_doit+0x15c/0x1f0
   ...

Please mention reload in the changelog, as it now also resets a zero-VF
switchdev device to legacy mode, like the existing VF case.
