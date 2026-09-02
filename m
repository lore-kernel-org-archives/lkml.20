Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E134483A5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351739; cv=none; b=RmlXnNlkD3lgS6m9pBmPsFAMCGWhZ/XxehOnFuJ79/YgSORJnq4wEJdj+XRjY9/aU2i6/njpzZKsGgMzss7qeInfuoTMfnTyq/u5mbjXiLFCGjnb3nhX9hDFce9G+hDyqJoCcQO6dXpi7NRp4Dz/XjcGvBF0ENejfttvIdibFm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351739; c=relaxed/simple;
	bh=rXgg491TClmqHMl6PPwcPkJvOA7J88dCd8/gyHlyn/g=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=u97IIeVN9x5krM98Fyi6x2/SHEQQbv5uGO8WiVB2OkYQw8qKY3mU/goz7vnAUtisVehM8OOs8bH0Y4doSaffkWYhiVkZ4mdvLNajzuqAq+PmyWnVAD8XDK5hJlyiCLnINQVhpMN481sqLVRPwWZwOxaGzRFXcYkGKVGP1oNw/qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxRvGO/M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxRvGO/M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687421F00A3E;
	Wed,  2 Sep 2026 12:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788351738;
	bh=89TMwyN9hNCf8InjZ/BoJd7/XuvClRBjnluIOo0LKe0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=LxRvGO/MggPRXmQmjjeoCO+sMdBslb0FTEP1B0/rRrp4etc/feY4cPSZonVNFcYXc
	 hrS1Mc6wG3Tk5z7H/LQmZwE8l5pnufIrGBkj8SAggB6sYy9Nsvoa6fUr1oGDWySHMn
	 L2kiYwx+XnONiqIXzQzN9l7KPJjUC53lYjlTlxFNLT0Xc4+kt3lWcIBlqjDXXLbJnx
	 Q7BUvE216Kx1jXJvkd3katwP+Cq7X+bTxPRNt2IIGOE9kY96DDmhoPWJcK0LM9XYLX
	 lzKVXBBYwqahc5Z3Z0jtS/HY/CbwVetvwOYxM/JyBx07wxCAsFFY9n3T9HSGX/HzuI
	 cVmcYwM9muuJg==
Message-ID: <46ee7fba-6a20-473c-b87d-856fa4ce1865@kernel.org>
Date: Wed, 2 Sep 2026 20:22:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>, qiwenjie@xiaomi.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH v5 04/12] f2fs: cache: introduce writeback thread
To: Wenjie Qi <qwjhust@gmail.com>
References: <20260831092227.739737-1-chao@kernel.org>
 <20260831092227.739737-5-chao@kernel.org>
 <20260902115636.691796-1-qiwenjie@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260902115636.691796-1-qiwenjie@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Wenjie,

Thanks for the review, I've fixed all issues in 04/12 and 09/12 patch in
https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/log/?h=feature/cache,

please take a look.

On 9/2/26 19:56, Wenjie Qi wrote:
> Hi Chao,
> 
>> static int f2fs_cache_writeback_kthread(void *data)
>> {
>> 	unsigned int interval = cache_thread->cache_wb_interval;
>> }
> 
> and startup initializes the field after `kthread_run()`:
> 
>> task = kthread_run(f2fs_cache_writeback_kthread, sbi, "%s", name);
>> if (IS_ERR(task))
>> 	return PTR_ERR(task);
>>
>> cache_thread->cache_wb_task = task;
>> cache_thread->cache_wb_interval = DEF_DIRTY_CACHE_TIMEOUT;
> 
> `kthread_run()` wakes the new thread before returning, while
> `cache_wb_interval` is initially zero.  The worker copies the field only
> once, and the sysfs store later updates the field rather than the local
> `interval`.
> 
> Can the worker observe zero at startup, and can a later
> `cache_wb_interval` write change the interval used by that worker?

