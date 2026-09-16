Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D8242CB1C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601298; cv=none; b=Cb2qhLqvdGwBuMALS2jRnmYDBAjbnVmZLTuxx585IzYWyolRvLW4WjA9S124UdZzDTCWjm7wb8EybmUlgKyNFjzg+um66StayBvS9amCEQu+gCyOC5Eors4KqK6R1KFWq0JxbHz+Ys9z0Wy1hJO8Awt+zDyFnhv+oFVZvJ4HNkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601298; c=relaxed/simple;
	bh=eIYaTbOyCqRYPJn7/8Rhy6w3wPYle3dovTqH6wLFO/s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=m4gzyDaURrZTzsmkDimj7i4vSG7Ak5XLlb/E4XMG1klcP9+PePugtXH6Rzn551QroaHx79C31Ea4yzyS5joezhojxfV7jkasOO+pTbb8wjcFDMMiOVpq+GBRaqt+2Ack4EODEZkVM7AJG/SzbiidJaekzwJ/qtWHPjl6oalWi1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=srvA9OXD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="srvA9OXD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886311F000FF;
	Wed, 16 Sep 2026 23:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789601297;
	bh=UPs0AIc/Ul5bydtRCdm7Q9haA+pM2MhBAlRyqbrA+uo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=srvA9OXDoPzoqx9Pib4l6v8rqaRVTEd6e0c5mvHaxz5vdsP2Mm+d9TCxc+TJpMPRu
	 dtEuSBeHPRpI3Zzlu3voDCT62LC76011AqrTfcp8LFhJoRO1s+rP8ah1qikeBWXr1v
	 MTzLCu3Chm+GXcLyiPXTYGZCG+dk7Zb8Hmg4qrgk=
Date: Wed, 16 Sep 2026 16:28:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Arnd Bergmann <arnd@arndb.de>,
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Qi
 Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo
 Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>, Barry Song
 <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie
 <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Baoquan He
 <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, Ridong
 Chen <chenridong@xiaomi.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vmscan: avoid false-positive -Wuninitialized
 warning, again
Message-Id: <20260916162816.39f0f33f6a48d30a71be3575@linux-foundation.org>
In-Reply-To: <20260916083456.4136132-1-arnd@kernel.org>
References: <20260916083456.4136132-1-arnd@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 10:34:46 +0200 Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> I previously worked around a false-postive gcc-16 warning in the
> get_tier_idx() function, by adding a fake initializer. This happens with
> the -fsanitize=bounds sanitizer when the compiler creates a specialized
> variant of isolate_folios():
> 
> In function 'get_tier_idx',
>     inlined from 'isolate_folios.constprop' at mm/vmscan.c:4982:9:
> mm/vmscan.c:4934:9: error: 'sp.refaulted' is used uninitialized [-Werror=uninitialized]
>  4934 |         read_ctrl_pos(lruvec, type, LRU_TIER_MIN, LRU_TIER_MIN, 2, &sp);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> mm/vmscan.c: In function 'isolate_folios.constprop':
> mm/vmscan.c:4946:25: note: 'sp.refaulted' was declared here
>  4946 |         struct ctrl_pos sp, pv = {};
>       |                         ^~
> 
> Adding another "= {}" would solve the problem as well, but to prevent
> this from happening again after the next code refactoring, try instead to
> prevent this by forbidding interprocedural optimizations on this function.
> 
> ...
>
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3274,8 +3274,10 @@ struct ctrl_pos {
>  	int gain;
>  };
>  
> -static void read_ctrl_pos(struct lruvec *lruvec, int type, int tier_min,
> -			  int tier_max, int gain, struct ctrl_pos *pos)
> +/* __noipa works around  gcc-16 warning for uninitizled use of pos->refaulted */
> +static __noipa void read_ctrl_pos(struct lruvec *lruvec, int type,
> +				  int tier_min, int tier_max, int gain,
> +				  struct ctrl_pos *pos)
>  {
>  	int i;
>  	struct lru_gen_folio *lrugen = &lruvec->lrugen;

Current code has changed here somewhat, but I expect the error is still
there.  I fixed that "uninitizled" while in there.  Altered patch is
below.


--- a/mm/vmscan.c~mm-vmscan-avoid-false-positive-wuninitialized-warning-again
+++ a/mm/vmscan.c
@@ -3195,8 +3195,12 @@ struct ctrl_pos {
 	int gain;
 };
 
-static void read_ctrl_pos(struct lruvec *lruvec, int type, int tier, int gain,
-			  struct ctrl_pos *pos)
+/*
+ * __noipa works around  gcc-16 warning for uninitialized use of
+ * pos->refaulted
+ */
+static __noipa void read_ctrl_pos(struct lruvec *lruvec, int type, int tier,
+			  int gain, struct ctrl_pos *pos)
 {
 	int i;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
@@ -4802,7 +4806,7 @@ static int scan_folios(unsigned long nr_
 static int get_tier_idx(struct lruvec *lruvec, int type)
 {
 	int tier;
-	struct ctrl_pos sp, pv = {};
+	struct ctrl_pos sp, pv;
 
 	/*
 	 * To leave a margin for fluctuations, use a larger gain factor (2:3).
@@ -4821,7 +4825,7 @@ static int get_tier_idx(struct lruvec *l
 
 static int get_type_to_scan(struct lruvec *lruvec, int swappiness)
 {
-	struct ctrl_pos sp, pv = {};
+	struct ctrl_pos sp, pv;
 
 	if (swappiness <= MIN_SWAPPINESS + 1)
 		return LRU_GEN_FILE;
_

