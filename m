Received: from mta1.migadu.com (out-115.mta1.migadu.com [95.215.58.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA123DBD76
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789890841; cv=none; b=ISOiHM0dT7OLoKBL1w6mj9kOeBkc8SUrVUt8Tfy6+JWM9ENz8yWCegAoCzsdfb8DHnnBm+ERL4c+M12nzOY771MYvh3pwa/UJq8iBf/GkwK4kT+mGhLUE/I5JuFKwmVUD2tvWTV0JPPvXjgHMZn+8AvlPut9Sq1Yf9JF3BE/Q5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789890841; c=relaxed/simple;
	bh=ofWAQlYpdWhjj6U/g7ojcf/VhSZsLy3f4wqaySbylHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ph+v7I2/Cd2NLavVYN4/F/f0NlgkeY7kDbByZ2ZprkKk02rYoF3REEQSuwPX+DFuZ8WAuQ1vggr0y8Clrih5OiscbiZ54AiiOvBiLcFA9zaXZImv5t/EJEVovW9HllbJiQo2UUM2spsF5oNcOP7GEOz5STaZNQu6nOceMtoFO98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BtFzRmqj; arc=none smtp.client-ip=95.215.58.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BtFzRmqj"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ofWAQlYpdWhjj6U/g7ojcf/VhSZsLy3f4wqaySbylHU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789890836; v=1; x=1790495636;
 b=BtFzRmqjOuGi3nY6+LrGvg2D6woor1Wj1x3+8W01p4ezFyEymtOZCNNY08T6yd1CUOLvXmAk
 toc8uws5Kx1IGL8+1LN1WhmHrZ1LjicSm1yQPYU7IvJeYNh86QzTNV0a/BsLL9i8PNB79q8w2gH
 3qjLvvr2QCLeYB49jYH8XQ5o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1afdd80ea8a24a3b;
	Sun, 20 Sep 2026 07:53:56 +0000
X-Mizu-Trace-ID: 1afdd80ea8a24a3b
X-Migadu-Flow: FLOW_OUT
Message-ID: <17ab543b-2067-4ff0-9505-46ad2837ab73@linux.dev>
Date: Sun, 20 Sep 2026 15:53:46 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/swapops: remove unused is_hwpoison_entry()
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Baoquan He <baoquan.he@linux.dev>,
 Barry Song <baohua@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>
References: <20260918165642.1014988-1-ekffu200098@gmail.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260918165642.1014988-1-ekffu200098@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/19/26 12:56 AM, Sang-Heon Jeon wrote:
> Since commit 93976a20345b ("mm: eliminate further swapops predicates"),
> is_hwpoison_entry() has no callers.
> 
> So remove it.
> 
> No functional change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  include/linux/swapops.h | 9 ---------
>  1 file changed, 9 deletions(-)

Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Thanks,
Zenghui
