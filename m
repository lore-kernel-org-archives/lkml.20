Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793242182;
	b=tqt3X+Kfjj0kqiuKw/H3WQ89JxbS2VUtr3QKexnOfnIz8NC6rzJh7ySA1N1xjK29HC7O
	 NGTAKV2ZnAV5vXUsZSODFIOLQlc1oeL5Q+flIpuCtjcCQBjDJmnO1WJ6atg3oAfkdGhqK
	 EshZk/HS7X8ZjzcjZf95yQZ4pvfjhDygKK4+fCd63GZq0U7mH/cfhPURd/j6mlzxLR+1O
	 M/CXugZdGMTxQ4D97/8bbM7bJTZm8C+1uJqHfRl5rHgMfIXl+EU9g/WHRgBeOe5NVYB3y
	 4OXLfFj0J1zwyn83TQITG1ODVgG/oiJbsW76zyKSQNG05R2FhxDvVBmrCbuHjMPNCpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793242182;
	h=DMARC-Filter:DKIM-Signature:Content-Type:Cc:From:Message-Id:
	 Mime-Version:Content-Transfer-Encoding:To:Subject:Date:In-Reply-To:
	 User-Agent:X-Lms-Return-Path:References:X-Original-From;
	bh=hTvlG/Tq8WG71QR3KEeqZ4U9dHyqctWa0aSN+5Yu23w=;
	b=GbJRA7j5BEQK47Y9xOYuN7GYyP/YMAoH7K4H4TF/yFtmme3ngDFv9ksi+OB++KvMNcdn
	 gZyf1FrDpw9ffdWuyFfkNIzH+QZ09BZFT039EwgOvBGZfI43iDTSvY8o2hdmB++5lXBMN
	 sk34N/haxPl3JbqmRKxKanUIFs6aAyi7h92BwhqGfrU4p6f8KLUs0YhoRq6Lr6OOEm/S8
	 4+X0IDDgSUR0aYumMIPfQnbgAPbf+E1GuRxr3wQmNTHKfzEdlysJ5HrsJ0vmaLR6mmML8
	 Nq0TZ1+hYuoX28VBX8i4uo8LJAHaRngt34neXk3ArcAU7ygdtc+y8T0GdNmJG8oAFDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=hdocmnqL;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1030606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1030606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=hdocmnqL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793242171; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=hTvlG/Tq8WG71QR3KEeqZ4U9dHyqctWa0aSN+5Yu23w=;
 b=hdocmnqL7Au86xutXGj5AxJd6L2RQ9zUDLfyiIK1GwmRJCNJFLwJJpn593fjdbY0zCEJQ7
 1MoC3D7EjToaXcsv+jHn0WflqUguMcKiWxbklah2aPqhNGVtthA/8mWqBPat/mNyWI2M/q
 eqAsetgnmchrJdyRa/L9NLPJvQu6F9zuDHT9k0qAqIBmYRQwf91FDM9XfQAXhxiAKZEzcy
 2VQxwFYLfijiNlYczQRbgst121FvVhB8Zq5uAnENx4ZbcoAw60fw6W4zNZX/BmXw7p6XrJ
 i3+Xw0N4W6cA6duLzeY0VT2yJYKVqRtKcbdXChcWgcCo3dGaSBPKxQHhJKnOgQ==
Content-Type: text/plain; charset=UTF-8
Cc: <akpm@linux-foundation.org>, <bsegall@google.com>, <david@kernel.org>, 
	<dietmar.eggemann@arm.com>, <gourry@gourry.net>, 
	<joshua.hahnjy@gmail.com>, <juri.lelli@redhat.com>, 
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <riel@redhat.com>, <rostedt@goodmis.org>, 
	<vincent.guittot@linaro.org>, <vschneid@redhat.com>, <ziy@nvidia.com>, 
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <b32b2bec-4fa1-4899-9014-52a6568cbd73@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: "Peter Zijlstra" <peterz@infradead.org>, <bharata@amd.com>
Subject: Re: [PATCH v2 0/3] sched/numa: refine memory tiering promotion heuristics
Date: Thu, 29 Oct 2026 10:49:03 +0800
In-Reply-To: <20261028092004.GG2668804@noisy.programming.kicks-ass.net>
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26ae2b439+d67bc1+vger.kernel.org+lizhe.67@bytedance.com>
References: <20261028041253.74839-1-lizhe.67@bytedance.com> <20261028092004.GG2668804@noisy.programming.kicks-ass.net>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>

On 10/28/26 5:20 PM, Peter Zijlstra wrote:
> On Wed, Oct 28, 2026 at 12:12:50PM +0800, Li Zhe wrote:
>> This version narrows the series to memory tiering.  The generic normal
>> NUMA balancing cleanups and heuristic changes from v1 are not included.
> Should we not look at Bharata's pghot stuff first and untangle this numa
> balancing vs tiering nonsense, before making an even bigger mess of
> things?
I agree that pghot is relevant to the longer-term direction.=C2=A0 My
understanding is that the two ideas are not conflicting with each other:
this series tries to refine the current NUMA-balancing-based tiering
implementation, while pghot would be a larger rework of the promotion
infrastructure.

Let's also copy Bharata here so he is aware of this discussion.

Based on Joshua's comment, I can also split patch 2 out as a standalone
fix with a proper Fixes tag, and keep patches 1 and 3 for the broader
tiering heuristic discussion.

Thanks,
Zhe
