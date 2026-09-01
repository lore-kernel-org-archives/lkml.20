Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4E6374A1D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226974; cv=none; b=VV7niyWS5x+kRdrTs8Icj/WJo02dUUw0LhMTtTkcCYIq9dxKEpj2KaziI88SD1SRY5TjtI7zthy365RwkQBWXNAlgn7M4iz7y9vGRYUC3nH1gS511ttWR6IGEdaXAMaLUqqJE/wOPeOpO22k+QLOLTzM1MhzGMfTCbM2hb4ui9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226974; c=relaxed/simple;
	bh=RO8ldlTEYVy/e8xfy6FK0hw5C3smx9nmxCD8He19q78=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=d0P7aO0h+Q/ltvPILDA0xGJQPK1iTB19p7skGQ+XxY0pdrg43/lryVUvoeCHxrefFah2VB7Qm0ytat0RkFt4i/D3u2sJ8ZG5/5+LkLxtweJpPgwzz42JgR7BqiwOXgxPImGRon2gwXN3e1k8Z+NPqc+1VKBJ0E5uRn7E3IPhl6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=madk7Afs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="madk7Afs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14391F000E9;
	Tue,  1 Sep 2026 01:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788226973;
	bh=qUBTD6UGQgvrXlngZStTE/AMCacoF/WiZwM2SuL8ngU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=madk7AfsI+5lWe4vCrsnibHe02et+DfFeK5OUWKvt5tq9pZVqO+QCF7YfkvnMzV0t
	 5CKPSb94mnMVCRsR2Ur1fFB+sPqZDX7jOsAiJJpmTnPEYoyFmBEg5r9sWSI0hES32A
	 zOdpK+xbnu7htr1F222URnJRt7AIpvlX9jYjalCU=
Date: Mon, 31 Aug 2026 18:42:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Dev Jain <dev.jain@arm.com>, Ye Liu <ye.liu@linux.dev>, Ye Liu
 <liuye@kylinos.cn>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: vmalloc: fix vmap_purge_lock livelock under
 memory pressure
Message-Id: <20260831184252.15b978678820a94b106640ac@linux-foundation.org>
In-Reply-To: <apVPTt9Xw8kSgmTU@milan>
References: <20260828091753.299295-1-ye.liu@linux.dev>
	<20260828110503.e1eff32a9b7df9a8b2ddd4d6@linux-foundation.org>
	<bec5eaef-d084-467f-9bfd-43f7dedc1aa7@arm.com>
	<apVPTt9Xw8kSgmTU@milan>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 11:54:22 +0200 Uladzislau Rezki <urezki@gmail.com> wrote:

> But, i think we can overt mutex_lock() into mutex_trylock() just only
> in the:
> 
> static unsigned long
> vmap_node_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
> {
> 	struct vmap_node *vn;
> 
> 	guard(mutex)(&vmap_purge_lock);
> 	for_each_vmap_node(vn)
> 		decay_va_pool_node(vn, true);
> 
> 	return SHRINK_STOP;
> }

I *think* that means we can expect a v3.

Ho hum.  I guess I'll queue v2, under the assumption that my
assumptions are usually wrong.
