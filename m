Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB271296BD2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 01:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788917519; cv=none; b=A4o/CfUucRS94EhIjbTY62Jsjfc//+ed4u58BSkWdArlDNAfO7bZPEsFua3pv7n5PGA888BxSR6/g/BS5GKORx8Qp0u+o2Qch0J7zEurqA1qH+KijazxCkErXwH2hXMHuViSK/GrWnBWOKga4Bx3h9Bx9R3UtC1gzzr1iSfhxjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788917519; c=relaxed/simple;
	bh=yFC63mYJXmTvkUjj23wKnktOTv0726mNL9AGUak2Dgc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JmzDTTnDQ0KDHtuaAACTdDT9F+kaJ6EnKylyCr1Emo7tiYmYV5Wk7lAcwfONPpLAWSBg87SqBm3cRRgu9fvZdb3hdYmKy0HMm0/v4KxnorzrsHxEWFrjNkBE9Gm51G3W84LYqk9bedqEMA51HgXtV/DyctHsBJU+jdmo1M+gVQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dPeLNOU4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dPeLNOU4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203B01F00A3A;
	Wed,  9 Sep 2026 01:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788917517;
	bh=E6Jg5xIoexoZAriiCVovYZ0qFnPKz2yjpLiaN5i1W4w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dPeLNOU4iXquobDjstLplfC2jXo6o18xmbbGcphLdK9D5cmpMqZS2UVuB3JOZji5d
	 OGMH4imFVETAs9tjHhLyJhip8JDjOyk4+toRqp+2LjdYyVm1j2gOt80V7JK5Vyuip7
	 4qCWDeEldXq5FBqxlV+UBvb9y6lnU6DZ5a8VOJ4Q=
Date: Tue, 8 Sep 2026 18:31:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: hannes@cmpxchg.org, baohua@kernel.org, kasong@tencent.com,
 qi.zheng@linux.dev, shakeel.butt@linux.dev, david@kernel.org,
 mhocko@kernel.org, ljs@kernel.org, ryncsn@gmail.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Bo Zhang <zhangbo56@xiaomi.com>
Subject: Re: [PATCH v4] mm: vmscan: avoid anon scanning for GFP_NOIO with
 low swapcache
Message-Id: <20260908183156.5f1fcd990ee847589197aac4@linux-foundation.org>
In-Reply-To: <20260908062649.1045883-1-zhangbo56@xiaomi.com>
References: <20260908062649.1045883-1-zhangbo56@xiaomi.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  8 Sep 2026 14:26:49 +0800 Bo Zhang <zhangbo0325@gmail.com> wrote:

> We have observed some cases where memory is allocated with GFP_NOIO, so
> we cannot reclaim any anon folios unless they are in swapcache. We can
> end up spending more than 150 ms looping in `shrink_folio_list()` scanning
> non-swapcache folios without reclaiming a single folio. This is pure
> overhead.
> 
> This is particularly true on systems using zRAM, where swapcache is
> relatively rare. So let's check whether anon reclaim is allowed by
> GFP_IO and whether there is enough swapcache to make it worthwhile. If
> the swapcache is extremely low, we're essentially searching for a
> needle in a haystack, so let's avoid scanning anon in the first place.
> 
> On Android this is triggered by dm-verity hash-block reads through
> dm-bufio, which legitimately use GFP_NOIO because they run underneath the
> IO path:
> 
> ...
>
> To stay conservative, this only skips anon when the swapcache is really
> tiny - below 1/64 of the anon LRU - i.e. when essentially no anon on the
> list can be reclaimed without IO. Whenever there is a meaningful amount of
> swapcached anon, the normal path is used and anon is scanned and aged as
> before.
> 
> ...
>

OK, thanks, I'll add this for testing and more review.

With trepidation.  It's easy to play whack-a-mole with this code:
improve one thing, worsen another.  Unfortunately the "improve" step is
apparent immediately whereas "worsen" can take years.

So, as I said, testing and more review.
