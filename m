Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851454;
	b=WfMqZGFOuvXYdwUN3HRcWwWn0mjZKZpunhlWBBTU2+P1CAI8C5yzSbVzCaw4WzgF1gyQ
	 64Rj/Q54DG7Gcc342vJFh/XxlNMlgZqqK1Is0K05ySCST+tOtrqYimdfMPX5Gq2DXi1e9
	 8VMlW64M08we6WR/zh2xvlwUblrXGsp9txVD8pWFs1pMqYyUZQ6gwx7LcoaSh4cO0VJ6m
	 QGK10H5gFJPgJk5Z8a9aFktIWjFsDC0aKJlWpEt5pKKUQPhX3QRdff+kYFfDjL/aebY/k
	 BGRXjcJa1P9/W3/nNzR+YmTeWGPZ4ZW9UJXDJETX7p/jW8TWZGQBtu+JLDAoPXXFdoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851454;
	h=DMARC-Filter:DKIM-Signature:Date:Mime-Version:References:
	 X-Lms-Return-Path:Content-Transfer-Encoding:To:Cc:From:In-Reply-To:
	 Subject:Message-Id:User-Agent:X-Original-From:Content-Type;
	bh=ZYu4vf+Y1xQk0GWAYhYxqZeXAZ+RYHgD2MH4lwu/i9M=;
	b=zOrang+xBHsOq5GAQNMxz8eeAbqVQhStZ6yEk5Cr20zZKdtiboROUsxO0WsWEisac0mY
	 U7Qw0RKdAz8dUaVt+AN6sCvqc77LkRK20LyH+wtLY1osOo+rZ7mTEg9vKfITp40MOmLkc
	 DurWHMXHfgX56E3mGPHkMW9NwGVu+WTEJNETLV2/NkU0cCS4GL3JrTroDGQnmEdkbmgeh
	 ATfXPls73GA1wwDSmmJx47ywEuRpxcI9XljqGO5DRA9H2XyPv/ItN3et0AYNrwOiBdQT+
	 0FI/LlWLK6v+AlhvwZSmreSM+yfbBc19wyRc2ZZ+KIxYZp8z22yqdZcIRbJ11dgAdvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=fPFwJ55z;
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4263606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4263606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=fPFwJ55z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793851448; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ZYu4vf+Y1xQk0GWAYhYxqZeXAZ+RYHgD2MH4lwu/i9M=;
 b=fPFwJ55ztN6xnQ8J5bfVkdvSYtJ34KITPGNICbCHajpoK+N+mKdNsnnBhKwx5cgAn9JaUX
 Jx8eBwZZtB3WNCp+pC3lyVAzToRVQXo5ICo8+BrGZU6N95KXLHO3E8g4kyRc/psrd7JWd0
 a+y+zAZy5SS+oTMTqt60Q65LBJHQmRAvIvcO5sbBak82mnPgAhTfhOnkp9qVe3Yw91wQFP
 ZOMjTFKVQyldfzQsLBLFgN/8RJQNq9bzfv0dTorXlz7iLFmqhJkp2xStqNMnF3KDY3x5b+
 pxeT1l2EqW3tkOwL4g6G4HstHS/YY8hjKOd08tC9vRQK+w8XR/n7Bcw/QKiXSg==
Date: Thu, 5 Nov 2026 12:03:43 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028041253.74839-1-lizhe.67@bytedance.com> <20261028041253.74839-2-lizhe.67@bytedance.com> <0676993f-c04c-4e4e-9f8d-1650c8fd6d6e@amd.com> <010b2b6c-8f1b-4c3b-913f-cc2e8b957759@bytedance.com> <a6bcd771-fcf7-4fe4-8c21-5e65bd579de7@amd.com> <1bab234e-8914-4694-b0aa-f265fa49c6d3@bytedance.com> <c9cf96bf-f3b1-47da-b22a-9600b5fb01be@amd.com> <3318a7f7-4dec-431b-9284-ec7c2807151c@bytedance.com> <aurO98PC4TTweJs0@gourry-fedora-PF4VCD3F>
X-Lms-Return-Path: <lba+26aec0036+70eca5+vger.kernel.org+lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
To: "Gregory Price" <gourry@gourry.net>
Cc: "Bharata B Rao" <bharata@amd.com>, <akpm@linux-foundation.org>, 
	<bsegall@google.com>, <david@kernel.org>, <dietmar.eggemann@arm.com>, 
	<joshua.hahnjy@gmail.com>, <juri.lelli@redhat.com>, 
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <rostedt@goodmis.org>, 
	<vincent.guittot@linaro.org>, <vschneid@redhat.com>, <ziy@nvidia.com>, 
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
In-Reply-To: <aurO98PC4TTweJs0@gourry-fedora-PF4VCD3F>
Subject: Re: [PATCH v2 1/3] sched/numa: make free-space tiering promotion bypass configurable
Message-Id: <519e6126-e4c3-4267-91a8-ff81174aaa5a@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8

On 11/4/26 2:21 PM, Gregory Price wrote:
> On Mon, Nov 02, 2026 at 10:56:27AM +0800, Li Zhe wrote:
>> On 10/30/26 11:44 AM, Bharata B Rao wrote:
>> Thanks, Bharata.
>>
>> I would appreciate further maintainer feedback on whether this series
>> looks acceptable.
>>
> I will give it some additional time when I get back to normal next week.


Thanks, Gregory.

Thanks,
Zhe

>
> ~Gregory
