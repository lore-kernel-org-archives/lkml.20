Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65AE4C8C49
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070684; cv=none; b=aN5j/tznmFKwUuI98PwVO022HwBXvON/8sxoSiswOGxcVaiqdHfGeB1ZTU2oWzvcM2aFD1B55qon8CLH+q1pgAwPLT0hnqXGWrZph/UYK1wxtY8ESSRBsS+/UEjNGfxg16UFC57h081H+JhlCSM9dUMrhqod6YKcQNZDO+iotXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070684; c=relaxed/simple;
	bh=5R/B9oerD6ZAcrxOpPa4FFKNooYAkWS0LD0ULmaAcY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAcitLTaufL5Y3DAK+ba+2J4+wMl/xzDwchfxXQT43TuBafnB2OB6LrjcWV+KKG+64vkMWsiAXLgnyJfWHBTcm8PPwX/Yl3UOTYlkmCKlHjAHue8gSiqVfmU++lG82O/vVwner6zB6F0fyF4KwIZRAsN2CKYWqtSd6sIycd68ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OWgcUced; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OWgcUced"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Fd3SALvKmXPY+tnBsouWsT91DLL/tQGCpIqLluiHgZ4=; b=OWgcUcedsqz7eevs3dFouSaqQb
	ex5KEy8TOGYBW0sec/NB45aOwwj5pB/qBBtgtagBTxVZ++ZdwI7DITWzQbvM5zfKFE2iDD8E332Qo
	NE5ZWYuA7eTAUq+bU5nAfd3n7Q1ujRU3qyqUP10J36j6OtrHp2nQ0LvnyfJBqgBMjHQqawIW5eZuo
	J9ZgJ2v/HvazHtH9UD4gfxmZ2l7ecMu+BJnw6NYnfmj2iZHoOhueDODD/FvkU8KrdoCkRaN3CfzgQ
	GQPkv3oqsi8FwuYWebwgWk7CPPuwDIbYD4oGQajI0nLENtYsPimzEu89Wrifc0EHGwhrz9EEIgJil
	Ayc0/KLA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8x9Y-0000000DOhz-0wSv;
	Tue, 22 Sep 2026 09:51:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 309F4300754; Tue, 22 Sep 2026 11:51:07 +0200 (CEST)
Date: Tue, 22 Sep 2026 11:51:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>, mingo@redhat.com,
	hannes@cmpxchg.org, surenb@google.com, jstultz@google.com,
	connoro@google.com, metin.kaya@arm.com, sh_def@163.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/core: Account PSI IRQ time to the execution context
Message-ID: <20260922095107.GV788244@noisy.programming.kicks-ass.net>
References: <20260918132915.1236312-1-zhanxusheng@xiaomi.com>
 <20260922081706.GE2009045@noisy.programming.kicks-ass.net>
 <20260922091532.2504886-1-zhanxusheng@xiaomi.com>
 <20260922094944.GN1837346@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922094944.GN1837346@noisy.programming.kicks-ass.net>

On Tue, Sep 22, 2026 at 11:49:44AM +0200, Peter Zijlstra wrote:
> On Tue, Sep 22, 2026 at 05:15:31PM +0800, Zhan Xusheng wrote:
> > On Tue, Sep 22, 2026 at 10:17:06AM +0200, Peter Zijlstra wrote:
> > > Does not in fact apply. There is no curr in sched_tick anymore.
> > 
> > It needs commit f5741d2b3451 ("sched/core: Call wq_worker_tick() for the
> > execution context"), which added that local.  That is in sched/urgent and
> > master, not in sched/core, and the patch applies cleanly to the first two.
> > 
> > If you want it on sched/core instead, I will resend using rq->curr at the
> > call site.
> 
> Hmm, I thought I was on tip/master which should have /urgent on, but let
> me try again. Perhaps I fat-fingered something.

And indeed. I must've done something weird this morning. In it goes.
