Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234285;
	b=r3EbXNTRzfsd+jWjhta6/0guLhDQJDBjZ4r8SvLE4p4lAvpV+9fvSzavUK4tT0QjLbje
	 /N2sLbWugaPJtuRi6QGwxcLbzDPqbrLljRO6sY3UwPKQHhytFY7YGEWBuiN+bMxuGPlrM
	 iYtVwW6K4VZfLfF6EFw1b3LkFk2zeARydUxEgKDk7rRM274LssPNW9tbP3Uno+sNvF+pJ
	 PrZlOqe09l6smHJsjc+OxosJY3L4ph9v3wSS7ITHPF3riAkFvI9tgRpxn52amZooJIXiB
	 YcHrU+r3/iVw8umE44EAUhq5t7FZ1NUqJOrODevvuVTMmufMoWUq7OUZe7h9/bWIUpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234285;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HZwCReN5TfpP/7UgtdfoNSUQJuUtcpW5E6BDQOlTEDs=;
	b=B0iWdYqTpAsBuwTNOUyupkzfSX0RVLrRwrid40C6eaFg6Pb3k+kL+8jyqGhTWtXXaN6F
	 MJnVjVmFx1JXnqa+joeupCy70axbsN2+W3pV9jq9I9UAffOLP0B7zeZr62Y9GtkeFEVzt
	 B8nEXdA4Pnp6uIrN/zOungwApVfgI3Fl/sKDfp+tu8reMKjDcINWsPMhLjnvhQgRm+A/N
	 F11LhECayajcfExErM/BqhXchN2/kc537Sp2+RYySzEldh+IAf1fXW5e1XcfFjKkbuIdD
	 LHGowkIQ7MApyUoPU+fWI5aNzARDf40NtAJD/RmHWWU+wWVDHq2M/oh2rSCJrgDLcJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTHQe6Wy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67332606D80F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTHQe6Wy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3FCB1F0089F;
	Mon,  9 Nov 2026 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794234285;
	bh=HZwCReN5TfpP/7UgtdfoNSUQJuUtcpW5E6BDQOlTEDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bTHQe6WyCD2PN76oe0NakU0wWJ2SzDnnyBIriO3GtdG8dAuwkvpkzLT8Au2tc3Zra
	 l+e0fl3klvXSGzI3ledA34/J5QrRg7NvhDLfHX+rSdVDLJsij9gTrGSKtL/AnCMHzq
	 sct3pUvwsTTfKs04OD3Y6LQg+QwC/1tCTPTzf6ZnTd50ZDWZLp7vRqfjKx7dpzGjPf
	 W2DG2NIM1AONa6X+1p36NAU0++m8gD7TBUf+ObQnFe6LJD4q08OdF6iry87HHYvFJJ
	 ACwNeI3btAPjLfQui/yiZP2AQPSrZaoVvS9XLJo9/wknE1VS1TD/7ziiW6dePJnwq7
	 735BUxH12B20A==
Date: Mon, 9 Nov 2026 04:24:43 -1000
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Chia-I Wu <olv@google.com>, Liviu Dudau <liviu.dudau@arm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v8 5/6] workqueue: Imply strict CPU affinity for WQ_RT
Message-ID: <avHXq1lK7m_Sfz2j@slm.duckdns.org>
References: <20261104095225.32654-1-tvrtko.ursulin@igalia.com>
 <20261104095225.32654-6-tvrtko.ursulin@igalia.com>
 <fbf6ec45cf29c26e2a064bd79f006862@kernel.org>
 <6b489363-274f-426a-9143-6ed5593a0c19@igalia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b489363-274f-426a-9143-6ed5593a0c19@igalia.com>

Hello,

On Mon, Nov 09, 2026 at 09:52:17AM +0000, Tvrtko Ursulin wrote:
...
> apply_workqueue_attrs() would work in theory but is not exported for modules
> which is required for panthor.

Oh, please feel free to export them.

> Regarding the flag reorganization, what would require expanding to u64?
> Unless I am missing something I see currently only 20 bits are used.

Right, it might not be strictly necessary. Just something we might as well
do while at it if we want to encode a bunch of scope / attrs in the flags.

> Although on a higher level my feeling is that panthor could first try with
> WQ_RT as is, and we consider adding strict affinity, via either of the above
> options, if that will not be good enough.

I see.

Thanks.

-- 
tejun
