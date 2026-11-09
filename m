Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217943;
	b=1HFu4aI1K3lIoF33SZ3hvju/s8jZePhKVf4GbwxaXdM4uAmGifU3rnq+1XVtQRyX96+r
	 /ULuhCSORlg0KgHQECeKRE3pm0AGfDoFD8dLQnueZ6oUxjDS7VCE0M7heeIi/sdn8b5Zz
	 4QzeZg2IGAxVLmAvGGUE3U/8fi98o3n8SDOsFeTEZldjtNEL7hNXYHY71srV3x7jFRc4N
	 OGXYooKDGT7DLv8WbmWZ6KZKaxtF1MqVUFsjG/+hhRit/WKCaus/NtBMhrhCySOhoo/QR
	 3QPMPdBvbZtpbYSgpKa/tKF/xwa2tJVZz1irY5HbRsU+b2Gf/Es6dLYv3WwLXcY7P0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217943;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=BzUPhjfbI7hgxlhrsDS2vrCET8eg/Sl/5dZnXUefZbk=;
	b=UUzdqHcVllDI2JpkgTo15qb6ndamuhq6BLy2xh3yTUfeW1zIzxy863NH6ZinCuBYsP9S
	 ZMeY+quVRTOhI1cnwkSDfb+01tjh6QpomfThTr0FqYSjPa7yb64kBCld/2hUCBTYrfnlg
	 JkFnf5aIvn1HUa1Dwx0Drx35tuIYV5dbUElIQ6xL9zzcJwTg38RFVIYeGRohPr+lyQVkA
	 ln9+hxyTGZao9fgrVbAgnqhpgTDLNXR+OrNC9bfKyYKPR4BcajST2HD4Af6VcZiHl2N7u
	 67DWvQuA2OWI1m7i5taS34nPceDXhP09PuQS82i3gJHia0W+eYPnpWY8+U6Fu/RgtuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Y89BXxHe;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA2E606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA2E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Y89BXxHe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=BzUPhjfbI7hgxlhrsDS2vrCET8eg/Sl/5dZnXUefZbk=; t=1794217941; x=2109577941; 
	b=Y89BXxHe+CjhNQsL8atfixb0goQsLu54Z3XcxuquyZJ1TxNCYse0whfUzcVMBSslJ9pL9y+tn33
	uGIVHN8wJV9IRJSWbtPj9amh2UxYohVpyp9sGCY4wE3X9UHW3mDuSj1LjZNCDu9br6zK6gIIbjfiR
	YUK0Se9w7h6uBb36yTwnvgUgdKMmIPROixLM+xhG6oIWU3+5Tpa/Tl0Kx5XVQR+vqiD4ZKDhE4Nt9
	LYwftjRi2bQ9qF9HQzyRL99GclnrmJpiqWEL8j5OtnjKmJUAiD/bQX0CGcDesRpCabxnJy+8txIlF
	mTaoAUgfIRQDfl7vELitAcSBuHeiVwfirBWw==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xQM30-0078U4-J4; Mon, 09 Nov 2026 10:52:18 +0100
Message-ID: <6b489363-274f-426a-9143-6ed5593a0c19@igalia.com>
Date: Mon, 9 Nov 2026 09:52:17 +0000
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
Subject: Re: [PATCH v8 5/6] workqueue: Imply strict CPU affinity for WQ_RT
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Chia-I Wu <olv@google.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Matthew Brost <matthew.brost@intel.com>, Steven Price <steven.price@arm.com>
References: <20261104095225.32654-1-tvrtko.ursulin@igalia.com>
 <20261104095225.32654-6-tvrtko.ursulin@igalia.com>
 <fbf6ec45cf29c26e2a064bd79f006862@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <fbf6ec45cf29c26e2a064bd79f006862@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 05/11/2026 19:00, Tejun Heo wrote:
> Hello, Tvrtko.
> 
> On Wed, Nov 04, 2026 at 09:52:24AM +0000, Tvrtko Ursulin wrote:
>> -	if (wq->flags & WQ_RT)
>> +	if (wq->flags & WQ_RT) {
>>   		attrs->prio = RT_PRIORITY;
>> +		/* Strict CPU affinity for low latency execution. */
>> +		attrs->affn_scope = WQ_AFFN_CPU;
>> +		attrs->affn_strict = true;
>> +	}
> 
> I don't think this needs to be hard-coded. If setting it through
> workqueue attrs is too inconvenient, how about adding WQ_ flags so that
> the affinity scope and strictness can be set easily when the workqueue
> is created? The flags can be expanded to u64 to make room and
> reorganized cleanly while at it.

apply_workqueue_attrs() would work in theory but is not exported for 
modules which is required for panthor.

Regarding the flag reorganization, what would require expanding to u64? 
Unless I am missing something I see currently only 20 bits are used.

Although on a higher level my feeling is that panthor could first try 
with WQ_RT as is, and we consider adding strict affinity, via either of 
the above options, if that will not be good enough.

Regards,

Tvrtko

