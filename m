Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9C94CCDC1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788206159; cv=none; b=lUnpTPMooGknexfSFujEf+h54C0AmrA3wfPDrPcJQgJ1COryhJPpi5yjOYBF+hiq5bxqETE9FvE8a1FRqkjjD4RrFjwz8RAW77wEWASZhIxkpjjfjBJxg08jZAkT3eIvcG8yu9DNCsJvwkb8s0h9pukW0TyPOe1ZGlCSca0GVRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788206159; c=relaxed/simple;
	bh=UjirE7PDf+vp8IHH6NJvjlcUufwRTyi6jcFcwH2IEtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTVOLyiYahZVZSbM5tmTvDAKrd88QX0JxmktHFJhnvfYF5yZG0t0E0rNZ6IoJhfdmewNuneUkOg/2AXkTZQdXMnSV2NhZtwcULAVRon7mz+v13b1TACtHlHvR3fsoXaKuuYpkINXzObOIpULitx95QCBwuzCnnVJ09peV/s5mfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHq6PIHi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHq6PIHi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE961F000E9;
	Mon, 31 Aug 2026 19:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788206157;
	bh=Y9/xutxa0yVC5oXqjxcXznHsaJxpAP0rLurk1SO8VpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oHq6PIHiDubRuBSKmIQs2QbnhopS/6egB71tJJg68HkwzmP3mpjSk5O5/HwT+kms+
	 widEfcMi5WrCNRwcpaZR0lLNh96xakeA89h5FwnIsfFKwafGAywUtrpzI5BUWpOrqu
	 y/OJs+xhGzcByUHjTC6pMwzpdWSQeSZcBZ9C5CBOh0CukLzbdOzJWTWnBIMimIS2sn
	 IkKjDbtSzceuVaf3Y0lqHH2obcto1Y0cF+3Rz5RyDE06QQuPpItiPa+Crnz0y0YPi/
	 JiS6VIxNfKXKMQcdKulKBmWa7UZTYqh/WnlXznd4OFpBoz7JNbojB7Kx6DcJRwuZxG
	 wyerF3pj1kEOQ==
Date: Mon, 31 Aug 2026 20:55:37 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: Pedro Falcato <pfalcato@suse.de>, Andi Kleen <ak@kernel.org>, 
	akpm@linux-foundation.org, liam@infradead.org, jannh@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RCU safety for vma maple tree walks
Message-ID: <apXaTN6o5YaEO8FR@lucifer>
References: <20260831143511.1133029-1-ak@kernel.org>
 <apWUsc-a6k1YkuMv@pedro-suse>
 <apXXgimKxgJl57qo@firstfloor.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apXXgimKxgJl57qo@firstfloor.org>

On Mon, Aug 31, 2026 at 12:35:30PM -0700, Andi Kleen wrote:
> > But none of this code uses RCU? I'm confused.
>
> There are two classes of callers: ones that change the maple tree while
> walking and those that don't. The ones that change it use
> kfree_rcu (if that's what you meant with "use RCU") because they can free
> nodes.
>
> The patch changes both classes, but strictly only the ones actually
> changing need the change. For the others the existing locking is
> indeed sufficient.

Andi I think you're really wildly off the mark here and it's not really a great
use of our time to help you debug your own private patch.

But in case you are on to a real bug here and I'm wildly wrong, it
shouldn't be difficult for you to point out precisely where the node is being
freed as a result of the split that causes a stale node to be referenced?

I mean what actually modifies the maple tree nodes here?

__split_vma()
  -> vma_complete()
    -> vma_iter_store_new()
      -> vma_iter_store_overwrite()

Right?

But I see:

	if (vmi->mas.status != ma_start &&
	    ((vmi->mas.index > vma->vm_start) || (vmi->mas.last < vma->vm_start)))
		vma_iter_invalidate(vmi);

Which calls mas_pause() which sets mas->node = NULL.

So I mean, presumably you are saying this doesn't work correctly or this
criteria is wrong, I can't really see how else there could be a problem here,
could you explain exactly what's up here?

Also why is the solution to insert a whole bunch of RCU read locks everywhere so
we can keep on accessing a node that we've already decided to free?

I mean surely the solution really ought to be simply invalidating the iterator
right?

Also again, could you share the patch you've applied to the kernel you're
actually seeing this bug in, given you haven't reproduced it even once with an
upstream kernel?

Thanks.

--
Cheers, Lorenzo
