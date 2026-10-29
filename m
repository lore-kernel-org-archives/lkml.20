Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793255096;
	b=r6opsrqOv8ehPomcx8rK6nZgpClXpIP4/yQu8++HfFalPj7NcGKAVL1JHYHfWyhCsQtU
	 U1QwfopzJ04JmPnVx6XoOkU1JBFx3AfuSDLKAw4sRgvFuWIvKHHJ+NyAlr6PPM2A2i731
	 k9Lw7dTU5ru9L1t7z23w4P42xYjpeNlmAs6hWVzu4ZFDQB8fnlJlXVZYl4aH1TJFV7sO5
	 dsi4vLKfS31DAJ+akpbQB4wEgkBD9pcNqjmA2ODYnnmfRsFrVo/bJ38KPB43tQJMxkH9R
	 gn8R5p91j8TcrUo9ecCbW2XEng3oXXEOxhRf+QSj4jBulOAqvBsyXuEz9n/WEdkuVrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793255096;
	h=DMARC-Filter:DKIM-Signature:Cc:Date:X-Original-From:User-Agent:
	 Content-Transfer-Encoding:To:From:Subject:Mime-Version:Content-Type:
	 X-Lms-Return-Path:Message-Id:References:In-Reply-To;
	bh=G/jHONOjsG3jk3ok02og65/P6DgsNIUASy0C0aH+3Fk=;
	b=yXuCCzj5/rsThUt1DYotkp4Ivg2j8w5iOQ5pPryIn3CuZNQuk3HlCB2dQv5rX5dhhRWc
	 TX4qdRl+TCfNGRToyS8VeYiu3cQftOdZDkogLoEYZCrM6mYmAf+7E6kBKk8jFcYoZMK7a
	 7zagAwFE8DxP7mi148hmZ/9OsH9jBT9JEcpXo1BEqhXogbQ3gFv8J09iGSo4X8DWuVVPA
	 JnXrjDo0/bT+dsSR0DXR792eG/+ek6zhp6JVos4Apst99BcDFbm94BeENb0UoMq/CQrz7
	 e6CfWfbaeUXoxOa9GgoZ5+OFfbBpkh3jX8L3LnC4R1ZAR+I4AvZl7W2EwgxcvBeISuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ZtOQpinT;
	arc=none smtp.remote-ip=209.127.231.114
Received: from va-2-114.ptr.blmpb.com (va-2-114.ptr.blmpb.com [209.127.231.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9E5606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B9E5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ZtOQpinT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793255089; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=G/jHONOjsG3jk3ok02og65/P6DgsNIUASy0C0aH+3Fk=;
 b=ZtOQpinToUAnE5i2fpxWQ/Sbs6hx6Jgx3dpW3z4CMXa0LEp6S3Y36paqfrL4rJcNGoVWbq
 KZMwuwlNWtfKC0yA9VXgkb8z2Q/qya8jztPfkYSV7dIa4JmJhNX9+Z8Kf495etYfmfY/dX
 K0b5qTGbp7fTzS1QuUpYZ9zhCgdiZ0mNw5NSyoISy+/cVBg/3P7vuTodSfZCbT3l3N+2AP
 8BmkXmRzt5lXl6gE6kxFwFo+XR4Gh/kLLGfJGxArIr78cB7LEFOzQWf130WmdAnsuXb5Hz
 DtOZz0TAQTuTCmNTN5AexDn1e1ZGAXlOP/erRKdLEOOw/PZHuv+glcqWJNXWbA==
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
Date: Thu, 29 Oct 2026 14:24:24 +0800
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
User-Agent: Mozilla Thunderbird
Content-Transfer-Encoding: quoted-printable
To: "Bharata B Rao" <bharata@amd.com>, <akpm@linux-foundation.org>, 
	<bsegall@google.com>, <david@kernel.org>, <dietmar.eggemann@arm.com>, 
	<gourry@gourry.net>, <joshua.hahnjy@gmail.com>, <juri.lelli@redhat.com>, 
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <riel@redhat.com>, 
	<rostedt@goodmis.org>, <vincent.guittot@linaro.org>, 
	<vschneid@redhat.com>, <ziy@nvidia.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: Re: [PATCH v2 1/3] sched/numa: make free-space tiering promotion bypass configurable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26ae2e6af+e0aca2+vger.kernel.org+lizhe.67@bytedance.com>
Message-Id: <74f3a0bf-22cc-42b7-8ced-c8c6ea9f6f93@bytedance.com>
References: <20261028041253.74839-1-lizhe.67@bytedance.com> <20261028041253.74839-2-lizhe.67@bytedance.com> <e2fb13e8-6d17-41ea-a9f7-397f62a85f72@amd.com>
In-Reply-To: <e2fb13e8-6d17-41ea-a9f7-397f62a85f72@amd.com>

On 10/29/26 12:16 PM, Bharata B Rao wrote:
> On 28-Oct-26 9:42 AM, Li Zhe wrote:
>> Memory tiering normally promotes any recently accessed slow-tier page if
>> the target fast-tier node has enough free space. This preserves the
>> existing policy of filling available fast memory before relying on
>> hotness and rate-limit control.
>>
>> That is not always the desired policy. Some deployments may intentionall=
y
>> keep part of a workload's memory on CXL-attached memory, for example to
>> preserve a desired DRAM/CXL capacity split or bandwidth distribution. Wi=
th
>> the free-space bypass, short cold accesses and bursts of hot accesses ca=
n
>> refill the fast tier and pull the workload away from that distribution
>> whenever DRAM has free space.
> Currently promotion happens on 1st access. Won't it be more natural to tw=
eak
> this frequency of access and also the time between successive accesses to
> prevent promotion due to short cold accesses and bursts of hot accesses
> rather than free space bypass configuration?
I agree that using hotness and rate-limit controls is the more natural
policy here.=C2=A0 That is exactly what this knob is trying to make possibl=
e.

The current free-space bypass promotes before reaching those existing
checks.=C2=A0 So when the target fast-tier node has enough free space, shor=
t
accesses can still be promoted even if they would not pass the
hotness/rate-limit path.

With this knob disabled, the free-space shortcut is skipped and those
faults fall back to the existing hotness and rate-limit controls instead.
So the patch does not add a new hotness policy; it only makes the
existing one effective even when the fast tier has free space.

Thanks,
Zhe

>
> Regards,
> Bharata.
