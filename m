Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923D644A3F7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788943302; cv=none; b=IyRftpJ8sWjRA/IRym4ChB9NdlV8Da6raQcZCjbgAuYdHud4buLkuVGRyBy5zPucW/RE5Xma6Btqel7i9EL/tUFsEJ0XX+9s42qMQ4Q6Jkm2qlVEsBK7fwvlDjLzfAjS7uK57CQvrhaZaA5QU+lrmWuS0Zs6UUMvs0qmXl2oi8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788943302; c=relaxed/simple;
	bh=i4D6oDdQR9zjZBe5MpqOj5e3KMbINWWPSHrcK8rJ6uY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=c5ffnvwXV/+EPtGpm+gE09UhPvX3wr69LYs5M2Y8qK37VJsTGi/kjxUEMAn4J+W14qbIxzFRoSf4Rkgov+022M0ALUXZ05OX/E74wPq0qpNRLaK8nJezFqCz2gLIAGZ4ACldX54Tc4GAetR/OpLKZqKGxbNsjl8IutWsQofmIdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEcgmrUD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEcgmrUD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22BD1F00A3A;
	Wed,  9 Sep 2026 08:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788943301;
	bh=dN+S+OLQ3E9fR3RU3W4nKI6yEw9xqFk69o8z5jA3CAI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=YEcgmrUDQ8a7hmaBKlZ6pZV2G8K6w2s5oBXaWStivF/sVH71YkwrU+ThV8DyyGoVC
	 vXIXBEIQJntc8gDbbQA0s/MEBtSg91Q0G/10nKTMkw/NCKknBp7OIzVrXqQ8RL6cWy
	 nnfMTMa1KM9ltcqhw74y+fQnTIh4C9ztf63mu6nQTYRaDStINLJSJ1gNLj2yf+iCnY
	 w25Bqfd0/NjXjz0Pht5nBrxYx2Aj3JqBBA+GQKNnWj5BIAtBPM19e08Key5A1tpxQP
	 yLrIhcordk4QvyrGhFUr5n52e6uayyMyENDji4+kqqx70LLQ38lu1U3yZPwPHxGafE
	 nnR83ub6Q4vkA==
Message-ID: <01e67f12-f759-492a-a332-3c9d5d4c7fdf@kernel.org>
Date: Wed, 9 Sep 2026 16:41:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 03/14] f2fs: support regular file buffered
 writes
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
References: <83fe187e-e3e8-4328-bbbf-a6751873b9e0@kernel.org>
 <20260907130313.2626386-1-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260907130313.2626386-1-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/26 21:03, Nanzhe Zhao wrote:
> On Thu, 27 Aug 2026 16:56:53 +0800, Chao Yu wrote:
>> +	/* Wait for pending drops back to bias which indicates all bio have completed. */
>> +	while (READ_ONCE(ffs->read_pages_pending) != 1)
>> +		f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
>>
>> Suspect there will be potential performance issue, as timeout interval
>> is large.
>>
>> Looks hacky.
> 
> Thanks for the review.
> 
> Maybe we can switch this to an event-driven wait instead:
> 
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ includes
>  	#include <linux/fiemap.h>
> +	#include <linux/wait_bit.h>	/* wait_var_event_io / wake_up_var */
>  	#include <linux/iomap.h>
> @@ f2fs_submit_page_read_sync()
> -	/* Wait for pending drops back to bias which indicates all bio have completed. */
> -	while (READ_ONCE(ffs->read_pages_pending) != 1)
> -		f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
> +	/* Wait until all bios have completed (pending drops back to our bias). */
> +	wait_var_event_io(&ffs->read_pages_pending,
> +			  READ_ONCE(ffs->read_pages_pending) == 1);
> @@ f2fs_finish_read_bio()
>  			ffs->read_pages_pending -= nr_pages;
>  			finished = !ffs->read_pages_pending;
>  			spin_unlock_irqrestore(&ffs->state_lock, flags);
> +
> +			/* Wake f2fs_submit_page_read_sync() waiters (if any). */
> +			wake_up_var(&ffs->read_pages_pending);
>  		}
> 
> However, this requires an extra wake_up_var(&ffs->read_pages_pending)
> in f2fs_finish_read_bio(). I'm not sure whether adding an extra
> wake-up in the completion callback is a good practice - what do you
> think?

Sure, IMO, stability has higher priority, we can tune this later if it
takes much time.

Thanks,

> 
> Thanks,
> Nanzhe

