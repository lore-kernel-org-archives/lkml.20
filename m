Received: from mta0.migadu.com (out-156.mta0.migadu.com [91.218.175.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F331358378
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789613799; cv=none; b=T4ieTyC7IvpalHAd9X+crxSrtFGtQ+ca7W8wwU05cJYIm/VaV8EvnTMbh4IFrBBi1hMIjwbJkIXHHUOCRbAoDrltEhV502pKTTm0KeRWikR47GTJUquOM9J654A0Fi2fKKTE/f3hXneNpVAEOyJQQwuffYxBtYilvT5GG5YElAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789613799; c=relaxed/simple;
	bh=FhTMxEbI+Hm7knFbU8ZHAQCuFqyobe/xTUTkOpgFmSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1hMf7iDLkha8VvhqAoI/RNbv88lJ4nv/bu68IyivgtnDI2Oc9naV9zYvZ1jUw/6aDvL0lCSr3aDkVpn6wK5mOflvsTNfLgf8YQQUVz1yC79Jk1a93QJeP5IQQHocrLOHuKJCJ3mrxc9QzptlqagvrrPxyfz6ox6Cc/vNz2P3tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pNlthdPi; arc=none smtp.client-ip=91.218.175.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pNlthdPi"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FhTMxEbI+Hm7knFbU8ZHAQCuFqyobe/xTUTkOpgFmSQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789613787; v=1; x=1790218587;
 b=pNlthdPiVvdHJYAlRecZ7TL1llP87xUxqNpIkLSE+6eepTAZvDqLnq5PKlZkTH6LZcF1SM3I
 ChrLTF/oD/6ccEwe4oUKZD50ZM20VZEvybBS/OrRTQEy+QmylvyGM/vNhu0rztvE5hxXeM+IkVd
 LGJjp5XtTQ1XxOh4Kx8qUWqI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id af011a6eef206229;
	Thu, 17 Sep 2026 02:56:26 +0000
X-Mizu-Trace-ID: af011a6eef206229
X-Migadu-Flow: FLOW_OUT
Date: Thu, 17 Sep 2026 10:56:22 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ridong Chen <chenridong@xiaomi.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vmscan: avoid false-positive -Wuninitialized warning,
 again
Message-ID: <aqtW1iW9WLJfl7hp@fedora>
References: <20260916083456.4136132-1-arnd@kernel.org>
 <20260916162816.39f0f33f6a48d30a71be3575@linux-foundation.org>
 <20260916163044.3daa3811d9b2bf7d958f1f27@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916163044.3daa3811d9b2bf7d958f1f27@linux-foundation.org>

On 09/16/26 at 04:30pm, Andrew Morton wrote:
> On Wed, 16 Sep 2026 16:28:16 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> > >
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > > @@ -3274,8 +3274,10 @@ struct ctrl_pos {
> > >  	int gain;
> > >  };
> > >  
> > > -static void read_ctrl_pos(struct lruvec *lruvec, int type, int tier_min,
> > > -			  int tier_max, int gain, struct ctrl_pos *pos)
> > > +/* __noipa works around  gcc-16 warning for uninitizled use of pos->refaulted */
> > > +static __noipa void read_ctrl_pos(struct lruvec *lruvec, int type,
> > > +				  int tier_min, int tier_max, int gain,
> > > +				  struct ctrl_pos *pos)
> > >  {
> > >  	int i;
> > >  	struct lru_gen_folio *lrugen = &lruvec->lrugen;
> > 
> > Current code has changed here somewhat, but I expect the error is still
> > there.  I fixed that "uninitizled" while in there.  Altered patch is
> > below.
> 
> 
> Then the build blew up in unexpected ways.  gcc-15.2.0.
> 
> The failure looks like a legit min() signedness thing which has been
> there quite a while.  I'm thinking that __noipa surfaced this for some
> reason?
> 
>   CC      mm/vmscan.o
> In file included from <command-line>:
> mm/vmscan.c: In function 'read_ctrl_pos':
> ././include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_798' declared with attribute error: min(tier, 4U - 1) signedness error
>   702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |                                             ^
> 
> I'll queue a fix to switch this to min_t (yuck) for now.  It would of
> course be better to use more appropriate types in this code.  Unless
> tiers can be negative!

I drafted one to change 'tier' as 'unsigned int'. While in mm-new this
issue has gone away because Kairui's patch change 'tier' to 'tier_min'
and 'tier_max' and remove min().

commit b447513eee2f ("mm/mglru: use explicit tier range in read_ctrl_pos()")

I personally think your one line change is better for backporting to
stable tree.

From: Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH] mm/vmscan: fix min() signedness mismatch in read_ctrl_pos()

read_ctrl_pos() declares 'tier' as int, but MAX_NR_TIERS is 4U, so
min(tier, MAX_NR_TIERS - 1) compares int with unsigned int and min()
reports a signedness error:

  error: min(tier, 4U - 1) signedness error

'tier' is never negative, it is a tier index or MAX_NR_TIERS to mean
all tiers. Make it unsigned int, then min() compares two unsigned
values and no min_t() needed.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
diff --git a/mm/vmscan.c b/mm/vmscan.c
index f11491ee9ed5..1844d92a6732 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3195,10 +3195,10 @@ struct ctrl_pos {
 	int gain;
 };
 
-static void read_ctrl_pos(struct lruvec *lruvec, int type, int tier, int gain,
-			  struct ctrl_pos *pos)
+static void read_ctrl_pos(struct lruvec *lruvec, int type, unsigned int tier,
+			  int gain, struct ctrl_pos *pos)
 {
-	int i;
+	unsigned int i;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	int hist = lru_hist_from_seq(lrugen->min_seq[type]);
 
@@ -4801,7 +4801,7 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 
 static int get_tier_idx(struct lruvec *lruvec, int type)
 {
-	int tier;
+	unsigned int tier;
 	struct ctrl_pos sp, pv = {};
 
 	/*
