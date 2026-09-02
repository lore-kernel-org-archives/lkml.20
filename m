Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CB34189DA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385061; cv=none; b=ItDz1WE5Ic8rXDYj/+xf5tQW3NGTDOp3S22kt69dIc1W7wyjOsE8WVsoFTjumEGZPe/H8I1bV7Lg/4baP8b7e/vCEQgoAxWuSRWesCka4507PpF9ExVWJuItjr9XmTaGdnag/DpcJcRjHprZWHAg8evlRi7kOin3X6fZrrOBpUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385061; c=relaxed/simple;
	bh=9I4VZzMjJ/xapmKjBq8RVYoWeBVsktkdPzs6owCMVZ4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=h/6JVGISogjQySneU8RHKvNz7OvwzNtfqWzQtrjtljpVjiLDP81hqxLspJhv5k21l40WXuk68ZtkS7Mrwh60tJkRnxkdXr9uLiZ2K7wOIYEASjUbvs9qD4I8PiYfNWTopGO9daMVIehG4lkjrMwRFYUjy4cZwfSM74LDP5sZcaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iMUZ04go; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iMUZ04go"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BCD1F000E9;
	Wed,  2 Sep 2026 21:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788385048;
	bh=M7u5Q20xGyFYF2besHwZ8IoTF1MLoqQdi7RED5WWdQM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iMUZ04goHcmhR2afGPKLKU7mt9PyuPEB59ToEmoY0nBpsPAvxYnLWxHRHe7ZR/qVK
	 BA639Y9uIzZvZl8tULj65jtds3hAeshlx5dTM6EnAJzktqLVhzNImnwdy2kaAdMLIK
	 YjXdPWzxCh5Kw6eFRQ8eVxrl1glREH3F748Dpzgo=
Date: Wed, 2 Sep 2026 14:37:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Hui Zhu" <hui.zhu@linux.dev>
Cc: Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, Shakeel
 Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, Axel
 Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei
 Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, David
 Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Hui Zhu
 <zhuhui@kylinos.cn>
Subject: Re: [PATCH RESEND mm-stable v5 0/2] mm/vmscan: fix NR_ISOLATED
 accounting and throttle MGLRU eviction
Message-Id: <20260902143727.776d04e71eac0e4b1fea6260@linux-foundation.org>
In-Reply-To: <cover.1788339549.git.zhuhui@kylinos.cn>
References: <cover.1788339549.git.zhuhui@kylinos.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  2 Sep 2026 17:11:24 +0800 "Hui Zhu" <hui.zhu@linux.dev> wrote:

> Previously the patch was based on mm-unstable, which caused issues during
> Sashiko apply.
> So I rebased it onto mm-stable and resend.

Sorry, things are moving at a million mph at this stage of the cycle. 
mm-new's isolate_folios() has changed a lot.

So please redo on latest mm-new and let's retry?  That'll be a few
hours after I hit "send" on this!

Also, Sashiko isn't done yet.

	https://sashiko.dev/#/patchset/cover.1788339549.git.zhuhui@kylinos.cn

If that's all too painful then I suggest waiting a week or so - I'm close to
completing processing the backlog (I've got it down to early July).
