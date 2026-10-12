Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96DF3AB460
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799251; cv=none; b=jMqIVv0cLnFNKTBkuFT7xehCm2hOBIawp8Ej0EdutCP1OGyBqQooWn7siodt7EzJH3AFp6t9y+wvWC4UgNJTfmYocIday9cbZbsnJK6qPLvo0ss7G3LQkOqJb9Q7Pb7J/KOIq5lqyC5TZ/5y+UZKcfp15Y5JGcwiIp12SuynuZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799251; c=relaxed/simple;
	bh=TgEExvSXqv9J5ttztH9S2+RjVls834wUxsjvp2vCLOY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OSDCWEp9TgqFOEyTNcME169bhoGaDREEQkoLm2vZf/La7QNmDxZKE++/mLyY9pe3on7g4kh6sGh/YlLxHDzb/4Vg9gRDOy1jyom0RvyddbjewzJp1RqsYQ48UOLJy9rkEweqJuqcWgz+TyCIx0/8tNaP5WdMFEXzBPEKah6g6ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2n97Mvlz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9oOeRAEi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2n97Mvlz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9oOeRAEi"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791799247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t9NunqpeQiEf4ZWwseHV3gnt+zYlh91Z5SMDeOn9oJY=;
	b=2n97MvlzoGDNxLX8CtL9UlrivYb3XFs7Bq2bl6Pw/g9OzuyITM3aaBperwiV8RoILVhkIY
	yJdGXAE0LtpAeO71d6mrXk+7CVqY2mVH2oVH+6xBMAbauZ2aTolFP2DJiCMqq2+puLkPYZ
	jQ+U5FTENNHvydImAukLthm8YoJWf8a6Ln8kdKrNWl7L9ntMWK6fZuGtPjNrx3tCfAGmW6
	OMcaOiPDWwEv12PQ+RpObfLl95g668mt1Z97LSPKzP1hXD528OeUhGMvBX2ZIJ6i3hpK/8
	uZBNQW0o1p0w8hj+DS63UFT6WmVnFVxwOUHwvocxex+ohVDTvPvzhqr915Xzrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791799247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t9NunqpeQiEf4ZWwseHV3gnt+zYlh91Z5SMDeOn9oJY=;
	b=9oOeRAEijxChtL2X8BhW3BDkHBYB58PbRgow7s8c6C+rcBqtpqjAjil5YFGXGt3/OKibMc
	zR3Av6jDQnynWdBg==
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>, Petr Mladek
 <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org, Nguyen Ngoc
 Thang <ngocthang2710.1999@gmail.com>,
 syzbot+8324b8fd984b86905a66@syzkaller.appspotmail.com
Subject: Re: [PATCH] printk: mark racy data block id accesses in the ringbuffer
In-Reply-To: <20261011091755.303723-1-ngocthang2710.1999@gmail.com>
References: <20261011091755.303723-1-ngocthang2710.1999@gmail.com>
Date: Mon, 12 Oct 2026 12:06:47 +0206
Message-ID: <87a4oj9r1s.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-11, Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com> wrote:
> data_alloc() stores the descriptor ID into a newly reserved data block
> while data_make_reusable(), running from data_push_tail() on another CPU,
> may still be loading the ID from the same area. The code relies on this
> race being harmless: a stale or garbage ID simply fails the descriptor
> lookup or the blk_lpos check. But the accesses are plain, so KCSAN
> reports them, and the compiler is free to tear or refetch the ID.
>
> Use READ_ONCE()/WRITE_ONCE() for every access to the block ID that can
> overlap with the lockless reader. No functional change intended.

READ_ONCE()/WRITE_ONCE() could cause minor side-effects as it prohibits
optimizations that do not need to be prohibited. These would not cause a
problem, but they are unnecessary. The data race is allowed.

How about using data_race() instead?

	id = data_race(blk->id);

	data_race(blk->id = id);

John Ogness
