Received: from mta1.migadu.com (out-16.mta1.migadu.com [95.215.58.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13D62D94AF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788401185; cv=none; b=SwERLd/UoF6zT+xvoum4bu9Z3GD7obkswkISTNOPndQVO109A2W/ROuzN8RAOVukaLE1AzWncHbidCHnEKSuRU8Kwkc0FxmiQvJ6JY66VbMk+hXKhjQoCOyNbpPn4cYeBJQevULe+mvX0XWIjHiObIHucb7MXSzlXb0BWZb+6c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788401185; c=relaxed/simple;
	bh=sORQMTssCW+DjxRG0tdExe1sK1xpzkmHbXyQlIYY8FA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8aF09B+Pj9AI3kCTIspwx8mdNt5AD5qKxC/sNCTiCs0nX2RnzPkXewKokh3Wk+Y3S20dHzAJBF6iW0MLzxMI5Kv8wAYuuPXW68alvBuCpArsRK+imxEKHS0TIm1fy3ApVvUGzPC6TTkwVVoMOR/S61uK38gkbzds8HSls//9Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bxDnsMke; arc=none smtp.client-ip=95.215.58.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bxDnsMke"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sORQMTssCW+DjxRG0tdExe1sK1xpzkmHbXyQlIYY8FA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788401179; v=1; x=1789005979;
 b=bxDnsMketen5hFJagQshfOdgfojgtth0wWo3bx6e3YJs3NvN2we2cl55EUEZLtjh2MvqiJ1A
 tGcPaKaHGtrt2gOelzGNgElMjVuns1Fy7iX248wAbP3OLSJFWxf1rYqQJsrgR/LiOAc2OT1DsxG
 ZutY4rT4lGm2H3y1N3wcbYxM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 484a927a0ec94e73;
	Thu, 03 Sep 2026 02:06:19 +0000
X-Mizu-Trace-ID: 484a927a0ec94e73
X-Migadu-Flow: FLOW_OUT
Message-ID: <767cba8d-1cc2-42e9-a8ac-8cda90d0fc35@linux.dev>
Date: Thu, 3 Sep 2026 10:06:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH RESEND mm-stable v5 0/2] mm/vmscan: fix NR_ISOLATED
 accounting and throttle MGLRU eviction
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
References: <cover.1788339549.git.zhuhui@kylinos.cn>
 <20260902143727.776d04e71eac0e4b1fea6260@linux-foundation.org>
Content-Language: en-US
From: Hui Zhu <hui.zhu@linux.dev>
In-Reply-To: <20260902143727.776d04e71eac0e4b1fea6260@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


> On Wed,  2 Sep 2026 17:11:24 +0800 "Hui Zhu" <hui.zhu@linux.dev> wrote:
>
>> Previously the patch was based on mm-unstable, which caused issues during
>> Sashiko apply.
>> So I rebased it onto mm-stable and resend.
> Sorry, things are moving at a million mph at this stage of the cycle.
> mm-new's isolate_folios() has changed a lot.
>
> So please redo on latest mm-new and let's retry?  That'll be a few
> hours after I hit "send" on this!
>
> Also, Sashiko isn't done yet.
>
> 	https://sashiko.dev/#/patchset/cover.1788339549.git.zhuhui@kylinos.cn
>
> If that's all too painful then I suggest waiting a week or so - I'm close to
> completing processing the backlog (I've got it down to early July).

Thanks for the heads up.

I think we can hold off on this patchset for now. It has a notable
impact on MGLRU performance, and will still need a fair amount of
discussion, testing and revisions.

My apologies — I should have posted this version as an RFC.
Going forward, I’ll submit the whole series as RFCs, and only send
the formal patchset once we have a broadly agreed result.

Best,
Hui

