Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845263DDAED
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175726; cv=none; b=IkeAtZqOEpvFA4xAnQh6cr9BFzTcROkNBertu4VFOibfWQw7Xl+6N1NFUR6iKvbzx/XpGpUjnR9De5I2B8O1YcA8VZ/943TEnezTpRPFkEx5eAuERuWKxOU+iwkkLBYNqrVIfvBM8aZimQJn3HKrEEhHRwy/Yr5EqPtCVuwqdEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175726; c=relaxed/simple;
	bh=Pj6w8HADzrwFoI05Y+wM7KubVh46ro/Npq6045L8WvE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=rmnBFOWMFYHT+CUatcLSV/vuYnQUqRCH+0jQNixiijWJZSC1CNwyQNDrNwUBPL82VMZ7Xtf3FzVKPVuRVBtTVxKcL5XG0k5HoQawTYgOs3KfIW55cYqF/3svjcbv3jw2YKzb/iLzJRxoxgs/g+KGW4XXl9TZ2kWO43ahUdzeKkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SB3scY7d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SB3scY7d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1151F1F000E9;
	Mon, 31 Aug 2026 11:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788175725;
	bh=Gqj2K9+wp90YvEKZMSvL1LZpZwjNHSzCNuGCNxMefXo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SB3scY7d63d/eJqv4Mh0utENg6FNoyxZgIZfYT9wskjSLb93/ewvpTUimcqX/GycD
	 ea0MQ6BpzM0/16qegjhq+AUZrlZpEHHkiArnotvBjmtwdKodlaMy+08y3hHkQIK6AC
	 kAbh/Rl8Kbbr3alcBNFvuwg7AztwQLn0+63qIN6qn0nB0HRxIEV6moLayEbXbib4m9
	 wcds6YEC6MT4RzN0hGJlZgWRNfthKz7niDrcjOISOnnRkNo4A7wP2kMVd8VRT6RJC4
	 iSDkFFPBdt7alnLg0sK3x/QULuPoYlRtjTIkKJcPOMir+/q1BUfoP+kPGj0atA8DXv
	 am0ubi84jP7eg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH V2] kho: Convert error handling to immediate return
 pattern
From: Mike Rapoport <rppt@kernel.org>
To: LongWei27 <longwei27@huawei.com>
Cc: Alexander Graf <graf@amazon.com>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, hewenliang4@huawei.com
In-Reply-To: <20260824024448.550552-1-longwei27@huawei.com>
References: <00c96a62-f783-497c-a7ac-1de495e4af06@huawei.com>
 <20260824024448.550552-1-longwei27@huawei.com>
Date: Mon, 31 Aug 2026 14:28:39 +0300
Message-Id: <178817571946.3691424.3757525664520719609.b4-review@b4>
X-Mailer: b4 0.17-dev

Hi,


> Replace the chained error accumulation (err |= func()) with immediate
> per-step error checking and early return in kho_out_fdt_setup().
> 
> Two problems with the current approach:
> 1. It continues executing FDT operations even after a failure, which
>    is pointless and potentially unsafe on an invalid FDT context.

Did you actually see failures here or was it an LLM suggesting that they
may happen?

> 2. Bitwise OR of multiple negative error codes produces a result that
>    may not represent any actual error, making debugging misleading.
> 
> Early return fails fast and preserves the original error code for
> accurate diagnosis.

The caller does not care about the exact error value, so the diagnosis
statement is moot at best.
Moreover, libfdt does not return Linux error values.

-- 
Sincerely yours,
Mike.

