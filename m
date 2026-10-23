Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737867;
	b=C17MRitRTmtfsBveTocr+qxxUw7yCPwJ3tSxVQrhckqvHk3grZ+Lhhi20Bf9dTIkYDsY
	 SKz2jwYhLckNm2LYcJZqrysDdRwx3k3OoUuCLUfDYNpAwLMcV0rK34L/C2Lj8qwXUkWu3
	 q5hG+OvEava88X9/Nq8tXoO4jDoI4jtvXwFG8aL0k8zyl3HLbSnJa3PWDSWoUkt9Fl8BA
	 NxrI4cMihCkpsXAMNzSlFTPixRw55xVL8E7VORBUcf8S9E7ZgWydJrg16Jb/cWiDaiwgs
	 CCvu65ipCKg0mKN6D4sHRPSZPt5nBNcl3fLr1eJtrH8D9sMo2ccQjXEao4tBB6wO5qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737867;
	h=DMARC-Filter:DKIM-Signature:From:Content-Type:In-Reply-To:Subject:
	 Date:Message-Id:X-Original-From:User-Agent:Cc:Mime-Version:To:
	 References:Content-Transfer-Encoding:X-Lms-Return-Path;
	bh=RRG6U99EKeZDnYNuky91yYiF/y3AS7tMgJRzNytuW38=;
	b=4Z//EMWwCi0o/ANfRtzG2IqCF+7vL6HVDNw/6mI/4DcAQTUDScw9ngxSD/Ar7cSN3js9
	 JHfDoZXhyQMzb80SGCtnUer28OKgC5BKuwp+PZtPrfeU5lfRIiC4pnirEhziGF2W+4NKP
	 b2FSpT7LdGu/C4RL+/IRlk59luIjgwvOP5k4ANCBbVW93XbWoH4VLpnsDnq+uvokG/o6w
	 udpHgu6VoiLHOPucG/6FD2nXMIQD9kvFIj5ADIV9Mmlxz47q0UY5yDzqXqpHVC68u1uFh
	 KOBPOVQPSV7yD2srJAwQzpnItq/OcWoIwPGTxLuEts9piUkri7ML/PdyKmrvNHBNmpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=SO2QktX9;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBF8606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDBF8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=SO2QktX9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792737861; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=RRG6U99EKeZDnYNuky91yYiF/y3AS7tMgJRzNytuW38=;
 b=SO2QktX99/R5pc/vs/36dWrgiVA5IOFGdXPtW6PpG2Hie1Dxq5xNPGMeDz3A/Eq3n2Fpw9
 /ctb9/Jk/SMdTIGzY7b56+GnlNp5rj5skkvR5GAfJWQpHj6PuVPXU/FyIqQRYIT+kuYUBy
 a9lyMszauzkaTlxHw//isPXk8M+IgRQutXapfllfLU1gyIOMQOGOtb11gkA3iN68sEu477
 OhtIxh6oH50S3oHKRijVqD/i6uJF+ASEEZsZ4rzAeXhVsXIc/HzJLlpKzMbpFaIcJEMWQQ
 wTdp5nHPOZs7Sjt3PUUgheIq3sahEfn7uGc65X5capu7vxBz5pG9XEyJS6eYNw==
From: "Li Zhe" <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <atoZpXaCRc7etPW8@gourry-fedora-PF4VCD3F>
Subject: Re: [RFC 0/2] mm: add source selectors to memory.reclaim
Date: Fri, 23 Oct 2026 14:43:57 +0800
Message-Id: <ab7aa28c-ccf7-4bad-a871-4b05f7e9bfca@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
User-Agent: Mozilla Thunderbird
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, <ziy@nvidia.com>, 
	<joshua.hahnjy@gmail.com>, <rakie.kim@sk.com>, 
	<ying.huang@linux.alibaba.com>, <ljs@kernel.org>, <mhocko@suse.com>, 
	<muchun.song@linux.dev>, <roman.gushchin@linux.dev>, 
	<shakeel.butt@linux.dev>, <weixugc@google.com>, 
	<cgroups@vger.kernel.org>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
To: "Gregory Price" <gourry@gourry.net>
References: <20261019141401.11927-1-lizhe.67@bytedance.com> <atY-LD2AzCYATRii@gourry-fedora-PF4VCD3F> <30457046-a662-4ff7-a6a8-100398d7a806@bytedance.com> <179264138036.2549665.17429111144570830454.b4-reply@b4> <9b715272-3ed9-42da-a6ae-467e8ae00c0b@bytedance.com> <atoZpXaCRc7etPW8@gourry-fedora-PF4VCD3F>
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26adb0242+06f775+vger.kernel.org+lizhe.67@bytedance.com>

On 10/22/26 10:11 PM, Gregory Price wrote:
> On Thu, Oct 22, 2026 at 05:43:49PM +0800, Li Zhe wrote:
>> On 10/22/26 11:56 AM, Gregory Price (Meta) wrote:
>>
>> So userspace cannot rely on one write to memory.reclaim to produce a
>> final per-node distribution. The intended usage is a feedback loop: the
>> controller observes the memcg's resident distribution, chooses the source
>> nodes it wants to relieve, applies source-scoped reclaim pressure,
>> observes the new distribution, and iterates.
>>
> I think the critical question is what CAN userspace rely on?
>
> We can make a bunch of feedback loop interfaces, but there's no
> guarantee they'll actually be useful.

The reliable part I currently want to claim is narrow: userspace can ask
memory.reclaim to apply reclaim pressure to memcg memory resident on the
selected source nodes. It should not rely on a single write to produce a
final net per-node footprint. The existing memory.reclaim interface is
also a best-effort reclaim request rather than a deterministic placement
primitive; this patch only adds a way to select where that reclaim
pressure is applied.


>
>>> At the very least i think you need to add details in your cover that
>>> demonstrates the process of doing something like per-node resident
>>> ratios, and show that it works as you intend.
>> Agreed. I will update the cover letter to make this model clearer. I
>> will also make clear that source=nodes is not a final net per-node
>> footprint guarantee and does not change memory.reclaim completion
>> accounting.
>>
> To be clear, I think not just making it clearer, but if you can show
> some tests that demonstrate the reliable behavior of the interface
> extension under different scenarios - that would be compelling.


That makes sense. I will run more detailed tests across different
scenarios and include the results in v2.

Thanks,
Zhe

>
> ~Gregory
