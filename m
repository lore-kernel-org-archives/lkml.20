Received: from mta1.migadu.com (out-31.mta1.migadu.com [95.215.58.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B242E717B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787808947; cv=none; b=a5So4Sct5t/0Z2gv4V97hxd/JOCztibf09MU4UBGgeejZn7YV9XiwYJg/hmgSbbx8/Jm+c+QQmo58qY57uS+yFy4/Hh6Nf/NYtwTaCz0wqS+3YBS963haF+dW29dC0YwzJ4q/wmoYtS7iEnBQ86bqFewEMiQ6g/lrPTOgPCRArU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787808947; c=relaxed/simple;
	bh=CztYMdjLZpKGzEVJeG55tEt7ujyjlh1YgMpcAGn0CQY=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=DmJcZ2A3ZFh2t0x+Vp8E0qgsiBOwt5LCy6kuko864DEBtYwAVAeVyi2l8m4Rfv+uMSU+EqJakBz83PmzAOtxbWJfnSi4uwg+G7nqlHb+Ew7ZEWFMHjj4aKwTtZnYmMCDGVIeVz1kkKwfD6XBVFX+DJYdeeItDNQYNChERMEq+wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BjEUT7ZE; arc=none smtp.client-ip=95.215.58.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BjEUT7ZE"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CztYMdjLZpKGzEVJeG55tEt7ujyjlh1YgMpcAGn0CQY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787808942; v=1; x=1788413742;
 b=BjEUT7ZEdFGr0GuuzX2Aq3QNiG66AJw1b3UD17yr26kkLC+M9CRUg2ea0NIB3nDsLhhhlo6v
 DnaDOMFCuiB7XBP0lEn9+mS/UV/d5twgGWyxmC8dbmZd07Pp9hnsQh+dYNYZOikeQ3qcz8hcy5S
 B7alX2oz6uecfyWYFXvwOSX4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from webmail.migadu.com (2001:41d0:303:fc7a::)
	by smtp.migadu.com with ESMTPS id 7b273cdc8630cbad;
	Thu, 27 Aug 2026 05:35:32 +0000
X-Mizu-Trace-ID: 7b273cdc8630cbad
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 05:35:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Hui Zhu" <hui.zhu@linux.dev>
Message-ID: <f33eaa0c730feb9f598738ff79d98cb25b4b2bcd@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] maple_tree: Annotate lockless pivot reads for KCSAN
To: "Liam R. Howlett" <liam@infradead.org>, "Andrew Morton"
 <akpm@linux-foundation.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Andrew Ballance"
 <andrewjballance@gmail.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, linux-kernel@vger.kernel.org,
 maple-tree@lists.infradead.org, linux-mm@kvack.org, "Hui Zhu"
 <zhuhui@kylinos.cn>
In-Reply-To: <kpzm3pcwxwnzk5kngcsfcybzst5jtyrdcphd3hcpmoc6dbtswq@atn5yddl23qx>
References: <20260826074430.1139325-1-hui.zhu@linux.dev>
 <20260826094147.42e1e71e91a5a537ced30a21@linux-foundation.org>
 <kpzm3pcwxwnzk5kngcsfcybzst5jtyrdcphd3hcpmoc6dbtswq@atn5yddl23qx>

>=20
>=20On 26/08/26 09:41AM, Andrew Morton wrote:
>=20
>=20>=20
>=20> On Wed, 26 Aug 2026 15:44:30 +0800 "Hui Zhu" <hui.zhu@linux.dev> wr=
ote:
> >=20=20
>=20>  In RCU mode, replaced maple nodes are marked dead and freed via RC=
U
> >  after the new node has been published. Arming the RCU free writes
> >  node->rcu.next and node->rcu.func, which share storage with
> >  pivot[0] and pivot[1] (see struct maple_node), while lockless
> >  readers may still walk the dead node. These stores therefore race
> >  with the pivot loads performed by the walkers.
> >=20=20
>=20>  This is harmless: the writer marks the node dead with an smp_wmb()
> >  before arming the rcu_head, and the walkers re-check ma_dead_node()
> >  after reading the node and restart the walk when the node is dead,
> >  so any pivot read that raced with the rcu_head stores is discarded.
> >  KCSAN cannot see this protocol and reports the plain accesses, so
> >  annotate the lockless pivot reads with data_race() through a new
> >  ma_pivot_rcu() helper.
> >=20=20
>=20>  Found by fuzzing on a 6.6 kernel; the race still exists on
> >  mainline. No functional change intended.
> >=20=20
>=20>=20=20
>=20>  Thanks. AI review suggests that the patch is correct, but incomple=
te?
> >=20=20
>=20>  https://sashiko.dev/#/patchset/20260826074430.1139325-1-hui.zhu@li=
nux.dev
> >=20
>=20Yes, this is literally every read of numerous pivots on any reader th=
at
> would need something like this. Most code is shared with the writer
> side, so we'll have data_race() annotation where it is not needed there=
.
>=20
>=20I don't like the name of the function and I don't agree that it is wo=
rth
> doing, especially half of it. If you notice ma_ functions take a maple
> node as the first argument, but your new function takes an array pointe=
r
> in the node.
>=20
>=20The from address does not agree with the sign-off on the patch.
>=20
>=20I also don't think a benign race needs a Fixes tag?
>=20
>=20It might be worth looking at other ways to calm kcsans down such as t=
he
> type qualifier __data_racy, or maybe the makefile option.

Hi Liam,

__data_racy is defined as volatile for KCSAN kernels, so the qualifier
has to propagate to every access site: ma_pivots() would return a
volatile pointer, and all the "unsigned long *pivots" locals and helper
parameters in maple_tree.c (about 25 sites) would need the qualifier
too.
It also marks the whole pivot array as racy, while only pivot[0] and
pivot[1] actually overlap the rcu_head.

The Makefile option (KCSAN_SANITIZE_maple_tree.o :=3D n) is a one-liner,
but it disables KCSAN for the entire file, so any real data race
introduced in maple_tree.c later would go unnoticed.

Do you think one of these two is still the better choice, or should I
keep the current approach and fix the patch according to your review
comments?

Best,
Hui

>=20
>=20Thanks,
> Liam
>
