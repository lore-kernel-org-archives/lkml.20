Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754848;
	b=xzHMQpLyFQnje5pgTrx+ziyAxcAPof9FKPqU+1ECn/UY1QbELAYMcRikSoDLd9YI+CS4
	 aDW5Fo5ZEpJ9e6fZOsHKw5f9Njr1YYDMHCtUx+ZJry/AoZhzXkOvcraQjmWVPVLEYsc9q
	 IIywKGT0Ms0tmRVl3VJbIDWD/t8leA/t9RXqzpFLAU0LirHcK2ak96b5zqriIrkwyIB3Q
	 oBUU2LBBlST1JuZUfReHea9Ju+O2Vb0UpIFBcKzG6E5P+/ZHQONwHmbye43Fa2Zc8L+3z
	 pZxEzm6TtU5l6Kd2hUKrfrd+xXEcxUAsPuJvleZytMRhNh6tSGHNtmhdkvCDrhEJ8OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754848;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=lYMX9gV6Dojh3jBu+0B6wZGmoQtuUvF5WWAGmG743YU=;
	b=KSsdoKHPFhHamCJqqsTDRDqpieq3Qyl5v245NrYbhbBDV/wNlQJgnq3eXmyxYI0T1PpQ
	 iro/HgKl8oJCQKh9Ru7m5pQGLe5f6YJA3AFoq1ak8/RYi2L17PMpauG6zjsMdwpNbEAne
	 FDgc5t6uU9ExiG9IE29HLRIqAw//TyJHHY5CImrAeQXw+N4FGJJUfyxS5Af1bEQ52zSLn
	 cyxxfR02CTUNJmNbWNnW77rWe67/GtfVzy/v2d5j+pQNzL83IOiSnJayPPU0H2KRrN/3y
	 pOvg7kKBmh4zoHpGAiaMNZk3vC+bfl+vbNGcslhVRIHjholILMC+6h9ns0m8vC5vLYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="Q2Z34R/F";
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F348606A326;
	Wed,  4 Nov 2026 01:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F348606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Q2Z34R/F
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lYMX9gV6Dojh3jBu+0B6wZGmoQtuUvF5WWAGmG743YU=;
	b=Q2Z34R/FZisDKgb2p9yXIy3A3J8SAI3gYAMlNgfl6mnpIew1xbRm/q032ff67OuoMTna4vY86
	4hp0rcrdc2QqBcM/C2C60GZyK7SweVsX6y9N/JdhR0kH2AbsiLsKrGXkYT24a1lKrx3/tw1KI7R
	5fQi1SsdDBUbF58sbH87d0c=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jK6sC0FtKz1d056;
	Wed,  4 Nov 2026 09:13:51 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E8B914057C;
	Wed,  4 Nov 2026 09:14:01 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 09:14:01 +0800
Message-ID: <e63525ac-e0ee-4c69-9390-a1e9805eb716@huawei.com>
Date: Wed, 4 Nov 2026 09:14:00 +0800
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
Subject: Re: [RFC PATCH v2 19/19] Documentation: arm64: mpam: Describe the L2
 monitor events
To: Daniel Pereira <danielmaraboo@gmail.com>
CC: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
 <20261029123611.1108424-20-ruanjinjie@huawei.com>
 <CAMAsx6c655ZN6YkwCSmgo9rdddUG9sjYQE_1XQi6=J=i=7N_Jw@mail.gmail.com>
 <432a92de-bd62-4d89-b0b8-3e89086660e0@huawei.com>
 <CAMAsx6fCiTLSPpbOPW9nh1rmqLEzy6i-YjK5BzhtmRq4nBykjA@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CAMAsx6fCiTLSPpbOPW9nh1rmqLEzy6i-YjK5BzhtmRq4nBykjA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/3 21:02, Daniel Pereira 写道:
> On Tue, Nov 03, 2026 05:59 AM, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>>
> Hi Jinjie,
> 
>> This is an outdated message leftover by mistake; please ignore it.
> 
> Thanks for clarifying. Will the commit message be fixed in the next
> version, or will the patch go forward as it is? I ask because the stale
> sentence ("Say why a bandwidth counter is assigned for the life of the
> monitoring group...") would otherwise end up in the git history.

Will delete it. Thank you!

> 
> 
> Thanks,
> Daniel

-- 
Best regards,
Jinjie

