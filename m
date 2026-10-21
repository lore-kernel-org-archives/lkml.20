Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571946;
	b=Uqz8P+lMSULkMFLHbCAoDDzYvSV+N7wqov6LlhkHPVweam2ehKDrzKeEREIj01g2P7NL
	 PbL3jrHvAWkE5mNkvXCDMehUZRd5rUmMJQr/dO12TaNc/Jz8U/H4JHRb4ne/HlH+z53iR
	 aueThzwFPTuqC+7cAsZBhqUl3Z8t/RGe4JGGU7XCuZcBrvGWp3J1uMAULZWz/f9kViQH4
	 ugNJo4ZlRqUTWQ7bDenyWuqwPrihcS8ivgqgSTw66Hz5fk/mLlgQnKK/YqgKqL0DUFhhJ
	 qRDkd/xX4gZz5FmcVH46xi9g9gqJuUn7pXuvJJiHr9cMQrc+e8+yboJ1kEbU0Uz3Ahw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571946;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=4BeR0d2NBo7TTv1s4Fw/XPHIiIsyxioSWIUyXbU3ce0=;
	b=Sz4YlgrFSWYvEgbpmP9oZiwq4BzkEL9VxbxIHcCGXIaW1VTa8fr6CJWKH3BKyE6C39cn
	 6ga17ckt+SPMY0PlaZD9l9a6WV4eIBeREm2KzKfFCpqheO+bbMWmwn+ixJBi6oeHxu5Qr
	 Zg4IvWDd9F3xvHk9ws5GcGn3KJl/fyQW4wdtBqX/N/NUyKBFIJhQDeKJdGiKjC7tRx1iE
	 X8TvlflzjJsTPKwPkboB9PMCtcFfTck70rbiXrv77gOy4w3r4YT6cqyqpq5ODq47wPpt8
	 rLpCiTj7OjjQlK1ttNPejhaf26MoVq9bLpa5teDRZ9N7JAyO9n1T484o4CUe5arVrFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=loD5EpsV;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5906606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5906606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=loD5EpsV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=4BeR0d2NBo7TTv1s4Fw/XPHIiIsyxioSWIUyXbU3ce0=;
	b=loD5EpsVw8UguaXWl8DEYSFgoJa0cSCEKntETTanb5XGNPleeGygEZFIpgJKto
	MPCgJ7Zrm6nbOEVhEcBkq3G3BEgCjkB9P+EV5hJcqmz9jjQStQNjsoMPerG7b0o1
	H+4W55JKJfW+KZLHXNb2O9SNfaB1KnUyPC6bspY7/VsxQ=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3fwoCethqVCE7Bw--.20192S2;
	Wed, 21 Oct 2026 16:38:26 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: Re: [PATCH] sched_ext: Reject oversized automatic CID shards
Date: Wed, 21 Oct 2026 17:36:38 +0900
Message-ID: <20261021173638.1658294-798632-sh_def@163.com>
In-Reply-To: <aths_re-QX5Er4Vq@gpd4>
References: <20261021064946.1445728-1-sh_def@163.com> <aths_re-QX5Er4Vq@gpd4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3fwoCethqVCE7Bw--.20192S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUeksDDUUUU
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6QNvzmrYegPDnQAA3e

> However, the only thing reported is "scx_root_enable() failed (-7)",
> which doesn't say much about what went wrong. Can we report the reason
> with scx_error(), similar to what scx_bpf_cid_override() does for
> oversized shards? Something like:
>
> 	if (cids_in_core > SCX_CID_SHARD_MAX_CPUS) {
> 		scx_error(sch, "core with %u cpus exceeds max shard size %d",
> 			  cids_in_core, SCX_CID_SHARD_MAX_CPUS);
> 		return -E2BIG;
> 	}

Thanks for reproducing the issue and testing the fix, Andrea!

I will send v2 with that scx_error() diagnostic.

