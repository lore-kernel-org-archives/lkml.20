Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590873;
	b=KeGFt6JSVroCJG1mtBHPuhCb8ReTyL1jacXcnBFeyFwUcaxxBvKduG6PT1Yaw1ECC0Ux
	 LsFimCwKGsyf908b79STFMn4sCy06lqZcLL8Hi3BkUtRS+LFb738+wKflkOOBK59mK865
	 o2GDW/Ub5KYbUJndmfChZrBrV38rnBkWub+9BwaWjCroKDimbHEExhuqaJY8uSIt2XKPS
	 SU3oPS3nEZAYGIf4Y2++ltRul5U85KTq5OV6yroCaV3n1d2H9/93OqVmo8rqUyPNNaT3H
	 QqNx9po0bn535jETIJhkg4Bshd3h7Qj6mKgAVQ0AMwV9vtDW+ZTEzT9m2xsUxWh0ILA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590873;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Language:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=KR1jOcsnI9GCpe3QQ9dt+U7gOwd7hIlEUMvUAgLiWqk=;
	b=P7QGRRytGFUPAaNo1cBF+kASsfBU2gOx/8DOXQUD0U3YXzCxetzOn2tOludQQUKsOiXU
	 xTPUV9Vf986+9gvpGSAndOfr1GONq0p3e4CFAYetEIwP49c2V74F/Wk7lAl88hPTZ6Krw
	 meFLr8+vYN9+ew+rvtPhC90cJm/ViXcKuAovszh9SJ3haK5FVsI0wiut6UtmHcWGO9Y8e
	 JpiJ6RTBnCYcE3/GQzdkJuWdzKNBl7myXwbyu6WNHNB1qboZAOtfkxM3fUhdq2fjIsFd+
	 M1lus11m9vjfTLQ6+bSw3wXcjA6D560R6mg0xUZrYsdvw7qD6owUwcmdtpO4CmgdaVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=3B7gDsJ8;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE65A606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE65A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=3B7gDsJ8
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KR1jOcsnI9GCpe3QQ9dt+U7gOwd7hIlEUMvUAgLiWqk=;
	b=3B7gDsJ8xfHqkgi3KkG1yOe9d8WWWW7/nlC1Ss0M6f22Tv7aoxjlEB6VhpvS5doM2vHpc1pZf
	OAcSMTbQmnoy3xQgM3M6uNnrU3NUPAl2UzG2haON5M/Jye34C23CUIqK3tZaQEZV/qg0Vjz+omn
	8jasrRGVPG43BJXOMtiwL0k=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jHyCs18hqzLlvp;
	Mon,  2 Nov 2026 11:40:57 +0800 (CST)
Received: from whupemk100004.china.huawei.com (unknown [7.152.185.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 91DED4057C;
	Mon,  2 Nov 2026 11:41:06 +0800 (CST)
Received: from [10.173.125.21] (10.173.125.21) by
 whupemk100004.china.huawei.com (7.152.185.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 2 Nov 2026 11:41:05 +0800
Subject: Re: [PATCH] mm: memory-failure: update statistics before emitting the
 trace event
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Mauro Carvalho Chehab <m.chehab@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
	zhenwei pi <pizhenwei@bytedance.com>
References: <d472a9a3ccfa8c0359d7d7acabed92c8927d8e47.1793174996.git.mchehab+huawei@kernel.org>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <85af4757-745f-08d4-b896-d38f9fad632c@huawei.com>
Date: Mon, 2 Nov 2026 11:40:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <d472a9a3ccfa8c0359d7d7acabed92c8927d8e47.1793174996.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemk100004.china.huawei.com (7.152.185.74)

On 2026/10/28 16:09, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <m.chehab@huawei.com>
> 
> Today's rasdaemon-ci run showed a race condition at the page poison
> logic affecting userspace (rasdaemon): action_result() emits a
> memory_failure_event before incrementing num_poisoned_pages and
> updating the per-node memory failure statistics.
> 
> That causes userspace to read /proc/meminfo to detect HardwareCorrupted
> trace events to warn if the value exceeds POISON_STAT_THRESHOLD.
> This works most of the cases, but there is a chance that the value
> not being updated in time before libtraceevent notification is handled.
> 
> Root cause is commit e240ac52f7da ("mm/memory-failure.c: simplify num_poisoned_pages_inc/dec")
> which changed the order of updates.
> 
> Rasdaemod-ci run up to Oct 27 worked properly, but on today's run, it
> failed to get the HardwareCorrupted data from /proc/meminfo because
> it was updated only after trigging the hardware error event:
> 	https://mchehab.github.io/rasdaemon-ci/failures/20261028T035110Z-40629018388/daily/aarch64/consumer-poison-page-stat.html
> 
> E.g. it failed to log this:
> 	rasdaemon: Poison page statistics exceeded threshold: 4 kB (threshold: 0 kB)
> 
> This is important for rasdaemon, as the consumer's action monitors a failed
> threshold before poisoning pages. So, if the counter doesn't update properly,
> it will end not poisoning pages at the expected threshold.
> 
> Fixes: e240ac52f7da ("mm/memory-failure.c: simplify num_poisoned_pages_inc/dec")
> Closes: https://github.com/mchehab/rasdaemon-ci/actions/runs/40629018388
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Miaohe Lin <linmiaohe@huawei.com>

Thanks.
.
