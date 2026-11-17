Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908675;
	b=v2989bGkmkKxXo70b95U2lWRLY/cVIsrzCKRaZIXoRg/OYb9CXT2LXAaw97qh3P9Dmj5
	 axmJiu1CCP29inQTvd3SHmT+GI40Vuexfbwanel/wJJfSCcV0oMh2d5S2zl47IbBZdtik
	 iYvVVmZxha/nwQzeb+BCIgbnobKCAz9xJDzhoR3QlqHu9e5FafsryGUKjfvvLr/29Zhhm
	 AzxZ8FjWRsjbCSMCGw/MkskGRnQXgfeUr7+MLNoKjezDcIMJeipUZjMHYotSuKkyDWO0W
	 G89o78snpkf3QGiCyCvVSEv343FRl0p61mJse+MNf3/sVqT82A0bLsXqFRSr918ucrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908675;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=b1MgxZIkRyIZLzSIguBbm4Gv1Oa7PXI6OyAlFx5p6L8=;
	b=yRQcUe58ttnMa8jkjIw/W0cMP9PO38yMKm84irR2h2Xb7+ZkJM5Edk+l9N7QqyoXKgnX
	 P3NBIXDpfxieIRkY6jcS/72E1IiDwTxFKDj+61MnXi0+11Zv3sbCemclSE3QgoNWm4m+4
	 +Ygw/ShN+hT0huw0MemWfM8KYMGyn1qRJAz/vl0mV78UUd2kjacga8EwmJKTIhUm/xESs
	 jRVMOpgu6WSzD7BJlugyKAoflewL26pAw+u+QRmHyvcyMZ0hl61eKbN63kxRO9slRheiM
	 v7ZVABjc8v7oVvrilx7L1zZjzdueEapK/pz2nZPQQs7pzFPGGQN58C8QJiogP5+Hg3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XLQEKduI;
	arc=none smtp.remote-ip=91.218.175.156
Received: from mta0.migadu.com (out-156.mta0.migadu.com [91.218.175.156])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FF0606A886
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2FF0606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XLQEKduI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jI/HSOH27gn3z7/oko7i56d6vS3jdN32+/PktpMz0A4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794908672; v=1; x=1795513472;
 b=XLQEKduI5S7OoJaD318kt2WdpE4i66ILaNjf4ZND1hyV/5upjC4qviynepTAsgGSG4aXn7jg
 ycJFBN2MfsQNDJu+Rjj2Nieep1si6xWrQwSSD2AGZGiy7r7TyS9tECdZj5xfNUcwD7qPgc7vJF2
 jUz8XPV8Jt7f9I0+RlrSQTew=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 35110425c39f87d5;
	Tue, 17 Nov 2026 09:44:32 +0000
X-Mizu-Trace-ID: 35110425c39f87d5
X-Migadu-Flow: FLOW_OUT
Message-ID: <f450f415-2a49-4471-8640-4c185c1d8689@linux.dev>
Date: Tue, 17 Nov 2026 17:44:25 +0800
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
Subject: Re: [PATCH 1/2] docs/zh_CN: Add RCU/index.rst translation
To: Dongliang Mu <dzm91@hust.edu.cn>, alexs@kernel.org, si.yanteng@linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 paulmck@kernel.org, linux-doc@vger.kernel.org, rcu@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261113013054.5662-1-xiongwei.song@linux.dev>
 <20261113013054.5662-2-xiongwei.song@linux.dev>
 <14c51094-0bb0-4cf8-8daf-0d307d5436db@hust.edu.cn>
From: Bruce Song <xiongwei.song@linux.dev>
In-Reply-To: <14c51094-0bb0-4cf8-8daf-0d307d5436db@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/16/2026 10:49 PM, Dongliang Mu wrote:
> 
> On 11/13/26 9:30 AM, xiongwei.song@linux.dev wrote:
>> From: Xiongwei Song <xiongwei.song@linux.dev>
>>
>> Translate .../RCU/index.rst into Chinese and update subsystem-apis.rst
>>
>> Update the translation through commit b3eb16109ae1
>> ("doc: Update stallwarn.rst based on RCU Tasks Trace as SRCU")
>>
>> Signed-off-by: Xiongwei Song <xiongwei.song@linux.dev>
>> ---
>>   .../translations/zh_CN/RCU/index.rst          | 49 +++++++++++++++++++
>>   .../translations/zh_CN/subsystem-apis.rst     |  1 +
>>   2 files changed, 50 insertions(+)
>>   create mode 100644 Documentation/translations/zh_CN/RCU/index.rst
>>
>> diff --git a/Documentation/translations/zh_CN/RCU/index.rst b/ 
>> Documentation/translations/zh_CN/RCU/index.rst
>> new file mode 100644
>> index 000000000000..6db03061fd87
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/RCU/index.rst
>> @@ -0,0 +1,49 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +.. _rcu_handbook:
>> +
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/RCU/index.rst
>> +
>> +:翻译:
>> +
>> + 宋雄微 Xiongwei Song <xiongwei.song@linux.dev>
>> +
>> +:校译:
>> +
>> +============
>> +RCU Handbook
>> +============
>> +
>> +.. toctree::
>> +   :maxdepth: 2
>> +
>> +TODOLIST:
>> +
>> +* checklist
>> +* lockdep
>> +* lockdep-splat
>> +* rcubarrier
>> +* rcu_dereference
>> +* whatisRCU
>> +* rcu
>> +* rculist_nulls
>> +* rcuref
>> +* torture
>> +* stallwarn
>> +* listRCU
>> +* NMI-RCU
>> +* UP
>> +
>> +* Design/Memory-Ordering/Tree-RCU-Memory-Ordering
>> +* Design/Expedited-Grace-Periods/Expedited-Grace-Periods
>> +* Design/Requirements/Requirements
>> +* Design/Data-Structures/Data-Structures
>> +
>> +.. only::  subproject and html
>> +
>> +   Indices
>> +   ====
> 
> Documentation/translations/zh_CN/RCU/index.rst:48: WARNING: Title 
> underline too short.
> 
> Please use make htmldocs to double check your added documents has no 
> compilation errors.
> 

Thank you for pointing this out, Dongliang.

I've built the docs following the instructions in how-to.rst before
sending the series out.Then I checked the html files, which looked good.
But I didn't notice the WARNING. I will fix it and resend.

Thanks,
Xiongwei


