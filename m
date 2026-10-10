Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A81942AA9
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791616662; cv=none; b=B9AuwPitm/yLvIxFhUX1Ss0HdjqzLCfzW9MlEkNdAOw5J1OrjIYDF1XBTahLRC5ZwmzkayTm1bxOuJkZLQyQ6/pBe8K/gG+5DTQFYzI7he/piz9b9Ij2tpxPTY7VTJqp67Ya10DokJ8IAzqkGIvOR62f34zCQES1Etn9DalgWmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791616662; c=relaxed/simple;
	bh=jfFR1hBwlvHP0zDhUXccSh02oNWSCsZbkJp4gYokGhA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RXABWCejGmgb46PP9o1YKIxS8QlM0TKLIL4NtQUi48B5Ofa8/j4Z1OJdty/o67CIHb40RDCvuNEpKSz7LkaBe7NypF7itZ4oGg7ELUkFBU2j0+LMJiU2AwTJIkRGsFebEg9GZsCJeSeI1trigd0wW/STRk4FRiWdgNhErWm1HFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQ5UpPih; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQ5UpPih"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731821F000FF;
	Sat, 10 Oct 2026 07:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791616661;
	bh=LjaoX7Zu0LcypZ9rSEHpW4L8GeX+4hGgjpaev3HY+BA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=ZQ5UpPih/Tz9/Paz6Wvf+ZLJkIth3WlLAL42Y/yg3dRilGulBZczhkzGjEjnLQwPR
	 GU+JBuxigErrJ/ljpA0ocLbGlqfwsuGwyYMC/DXoKFBso27eqFRA08hF/XycpbnnJq
	 9NjftyW1dzYzFEdnOOcdCt6r7tMYgD4546yCusKN/PKdRXiyFLDD1nNS8qe4+BM9md
	 10vN3oSAwrM2FivSErZ0X7/H3BcQ55wqzH0RPdeNBgQ/jzZreUcHySwDdF58E2HR5j
	 WArCisIwYs2jrN2RiLl/nqz01n9FjHzMXtsVwwOtBjnNtQ3Yr69C37jISfEu/C/kpa
	 v4+U18wMUKpEQ==
Message-ID: <6e1b9e96-eb98-4eec-9c34-5bd9ca2f9808@kernel.org>
Date: Sat, 10 Oct 2026 15:17:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-erofs@lists.ozlabs.org
Subject: Re: [PATCH] MAINTAINERS: erofs: update my email address
To: Jingbo Xu <jefflexu@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 xiang@kernel.org
References: <20260921030417.87932-1-jefflexu@linux.alibaba.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260921030417.87932-1-jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/21/26 11:04, Jingbo Xu wrote:
> From: Jingbo Xu <jefflexu@163.com>
> 
> This email address will not be available in a few days.
> Update my own email address to jefflexu@163.com.
> 
> Signed-off-by: Jingbo Xu <jefflexu@163.com>
Acked-by: Chao Yu <chao@kernel.org>

Thanks,
