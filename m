Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3B04BAA17
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601446; cv=none; b=uIKtT2Q8+PiiDJV+w/tWhunuIFOBSaGuq6rGV2qBL0pm6YOa2W5ggae4HSvp+iK8njGhvYeQkqvYgB09+QDiogoshc/7zz1k7FZQd5OpEn1SoJ3+WWPRfstj/1dZanDz23Ax6nHRsfhxBbnXh2lhnUeI60k5f/yM1S7TeVN18LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601446; c=relaxed/simple;
	bh=L8YfVm7+8kYIsaLQrJzsZ0NaFr2bFxb95G8YXTtiDVQ=;
	h=Date:From:To:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gAZxrmUdk1sNcLGw0f0UKOkHqp8JvygaU3proO0GnOhliAO+1tQVnl7kEtjOcx6wb7z033CBaARw0AZPxFLuWgI9H8bo+T3+/GVZnKfZ/gIoJJNbKutjZAqgBmerLR/pf5khVDXp6BM+kGLCWIzT8izO5rhp5+kp0XS0Oav67WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=xQlhKezl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="xQlhKezl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981681F000FF;
	Wed, 16 Sep 2026 23:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789601445;
	bh=1hL/QslE9kXpw9D0DG8KnR2S2Wv56IDU1UfLhKDJBSo=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=xQlhKezlmUcqndEOYoCt0jz+DZelOEfUckPTIkvJoqSoDiwI/IqpwRQ8W3nUE0eW8
	 0W82MpO7GA99H+VvobfbK3KYtK36x3SrmPu6hfG9OhUpoutjsq01rqiLQ3C+PTVkbj
	 GXpglFoS2igpNM8j+TJl3m/Wn+5ny/ZpiQ4xQC/4=
Date: Wed, 16 Sep 2026 16:30:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Arnd Bergmann <arnd@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@kernel.org>, Michal
 Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt
 <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, Kairui Song
 <kasong@tencent.com>, Barry Song <baohua@kernel.org>, Axel Rasmussen
 <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu
 <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Ridong Chen <chenridong@xiaomi.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vmscan: avoid false-positive -Wuninitialized
 warning, again
Message-Id: <20260916163044.3daa3811d9b2bf7d958f1f27@linux-foundation.org>
In-Reply-To: <20260916162816.39f0f33f6a48d30a71be3575@linux-foundation.org>
References: <20260916083456.4136132-1-arnd@kernel.org>
	<20260916162816.39f0f33f6a48d30a71be3575@linux-foundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 16:28:16 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> >
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -3274,8 +3274,10 @@ struct ctrl_pos {
> >  	int gain;
> >  };
> >  
> > -static void read_ctrl_pos(struct lruvec *lruvec, int type, int tier_min,
> > -			  int tier_max, int gain, struct ctrl_pos *pos)
> > +/* __noipa works around  gcc-16 warning for uninitizled use of pos->refaulted */
> > +static __noipa void read_ctrl_pos(struct lruvec *lruvec, int type,
> > +				  int tier_min, int tier_max, int gain,
> > +				  struct ctrl_pos *pos)
> >  {
> >  	int i;
> >  	struct lru_gen_folio *lrugen = &lruvec->lrugen;
> 
> Current code has changed here somewhat, but I expect the error is still
> there.  I fixed that "uninitizled" while in there.  Altered patch is
> below.


Then the build blew up in unexpected ways.  gcc-15.2.0.

The failure looks like a legit min() signedness thing which has been
there quite a while.  I'm thinking that __noipa surfaced this for some
reason?

  CC      mm/vmscan.o
In file included from <command-line>:
mm/vmscan.c: In function 'read_ctrl_pos':
././include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_798' declared with attribute error: min(tier, 4U - 1) signedness error
  702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                             ^

I'll queue a fix to switch this to min_t (yuck) for now.  It would of
course be better to use more appropriate types in this code.  Unless
tiers can be negative!


From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm/vmscan.c: fix min() signedness mismatch
Date: Wed Sep 16 04:21:22 PM PDT 2026

A __noipa conversion from Arnd [1] somehow revealed a longstanding min()
error in read_ctrl_pos().  Plug it with min_t().

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Axel Rasmussen <axelrasmussen@google.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Barry Song <baohua@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Kairui Song <kasong@tencent.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Wei Xu <weixugc@google.com>
Cc: Yuanchu Xie <yuanchu@google.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/vmscan.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/mm/vmscan.c~mm-vmscanc-fix-min-signedness-mismatch
+++ a/mm/vmscan.c
@@ -3205,7 +3205,7 @@ static void read_ctrl_pos(struct lruvec
 	pos->gain = gain;
 	pos->refaulted = pos->total = 0;
 
-	for (i = tier % MAX_NR_TIERS; i <= min(tier, MAX_NR_TIERS - 1); i++) {
+	for (i = tier % MAX_NR_TIERS; i <= min_t(unsigned int, tier, MAX_NR_TIERS - 1); i++) {
 		pos->refaulted += lrugen->avg_refaulted[type][i] +
 				  atomic_long_read(&lrugen->refaulted[hist][type][i]);
 		pos->total += lrugen->avg_total[type][i] +
_

