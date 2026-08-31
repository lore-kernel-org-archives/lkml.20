Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA2430FF1D;
	Mon, 31 Aug 2026 09:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170189; cv=none; b=KBcLfM58RoM7W8GwkNu9SM8V8MVPV8L1nZ0ZdpZK6hIec2yccY8mKVkw8HJC7RDLJY4a+xKBaLuLVvpCO/5ISk2ATRFxp4rKhfBDKIfvEraSrdrcYdRW5NVpNXmfFVOEnXvtwyX4vsFvd8g9Zmgr8zGKTg2kJb8yDo/PomKWjmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170189; c=relaxed/simple;
	bh=cv9ZuxELGewDJwDPvlvEc7LmYRah7BgABDNT/4pgcKo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fuwxgYd0bGMp5UkgRRkG6fnkGNLGyy60fJwXsFNIq63K1oNZ8Tq3MumO8wMdJ38/MYFHmXhR2Wyb+jcPKmorN7sLQFfnR27OjUQzEWWfTosaPyacodJ5ruRyaKfnUfRJfED5Z/Oc09MvtvpXGJUgaiHBEeTeW7oh+Vl1mnLHx58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIidlPRH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIidlPRH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B27E1F000E9;
	Mon, 31 Aug 2026 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788170188;
	bh=cv9ZuxELGewDJwDPvlvEc7LmYRah7BgABDNT/4pgcKo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=QIidlPRHIC18ABY3QXJ2Vzz3L76ZHBR0bwqGrZhWdM+MZomydNLRpdGOZYbarVU60
	 TWGVSgskLIatuTUjB2lLQ6PbHPGUqglBCGpbWJMZbssP/u9G/1p3j7bpVBdrXrbEgM
	 nehni9Om3TjwH2hsk/N3ARZZKmeCEoL4ZYQ/ojdrH7o5sw/UP8zefsXF5b4t83P3Gj
	 9vcik47wXnndkmcg9ETNhOpfohipjedPaggJARmQG3QWrWMOJQgcJ+SJvFc/0S3hNz
	 7u1b2a43xSKTJKekiOMqMXZsEc08NoYkSFla2awmW5m7xVUg34g5UiexI21+G70EXH
	 F3QtZhafBnWAw==
From: Thomas Gleixner <tglx@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
In-Reply-To: <apSj4HWWyUxJ1btY@tardis.local>
References: <apA4M7Asz0mV9uaw@tardis.local> <87jypbfu1t.ffs@fw13>
 <apBrZuxU8bmCgG8h@tardis.local> <87bjanfmzz.ffs@fw13>
 <apCS3T63WUxHd1GH@tardis.local> <87wltbdvmd.ffs@fw13>
 <87mru5et6r.ffs@fw13> <apNtQWqOgwF5_Ctq@tardis.local>
 <apRJzVbMl-hj-otX@tardis.local> <87v78rcrf9.ffs@fw13>
 <apSj4HWWyUxJ1btY@tardis.local>
Date: Mon, 31 Aug 2026 11:56:25 +0200
Message-ID: <87mru2d35i.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Aug 30 2026 at 14:42, Boqun Feng wrote:
> On Sun, Aug 30, 2026 at 09:57:30PM +0200, Thomas Gleixner wrote:
> [...]
>> +
>> +#ifdef CONFIG_RT
>
> 0 day probably will find it, but FWIW this one should be
> CONFIG_PREEMPT_RT.

Indeed
