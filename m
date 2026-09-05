Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC97248867
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 21:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788643150; cv=none; b=Sw1abpLLK1ZpspFSh8HwaLBrNGa0CTnSDEPT27PBv/zOt2JilKbqVkJ+6Fujp/1zGv5uYBIEmnSzZoSqzZiVuI8j0JGV/vgXQL25o+11RW9l1SW2hiVevqyBqOPZcJqNzRPGzhcP97JCWyzE00QJKVu/8tNdY/GEDnEqy4wAh9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788643150; c=relaxed/simple;
	bh=lmyEyU3GUMuZ8HDoqANNoTvc/jRo6lFqb2YHgGvWKOk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=agMlLGYDXGT4aY6IkWSYo3C37V2DucjS9l9ItfE8zfSCqdJa1psH81YEU+XWOr4kQ0jex+nscBQVRxH4kYNxS1U8TfBiUnTeMPslv1MqX2v8bqa97OJoO0qmG5Vps4W83uRUWDnC37ABJ74CT5bdORC0E8bKKmg4yQGZr4kRKRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dmgpAaAY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AdpWkPOl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dmgpAaAY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AdpWkPOl"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788643147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SA2gINT/95PU1s6zIxzKqrLQ010RoltSF67GXDkK864=;
	b=dmgpAaAYpkGv1gCC7P/kdQ2P0O1YdackzQJBvcnG2tJWrLBsgnQfcFcKMJCx4HwDV/6vx7
	AIRkuxSL6mNtSpX+pyFFQX//f1cZUzkQjuKqEzEYTc0+v4BJMBma03zN4HAj9fSviwJ3W0
	ib0X8ZEe4eJZzY2DoH+XlUFhEZgI39cLeFZB5H85uFUg0VHmWFohzvDHR9lP+QhGQkph7F
	adqEqaassZqiQKVjcA009Y4FAJhPAuq5HVnkWnFr/InQis2Lu89MuNZLvazcoGfbW4x2wc
	1yQGM0/SzDWHRo8v/Skf/z5olWndpmgby3pi4zcdqaIkpmKjKq03l+wXS0G2fw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788643147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SA2gINT/95PU1s6zIxzKqrLQ010RoltSF67GXDkK864=;
	b=AdpWkPOlz3+wvuKnovAC0i/zbJgx5cE4w3LtE+Djb69Ta1PMgH51cZzpsy0+3GefxbYvyE
	jvIXIGhZFR9JgoAg==
To: =?utf-8?B?5YiY5pyv6auY?= <liushugao@xiaomi.com>, =?utf-8?B?5pyx5oG6?=
 =?utf-8?B?5Lm+?= <zhukaiqian@xiaomi.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, =?utf-8?B?J+W8oOWYieS8nyc=?=
 <zhangjiawei8@xiaomi.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?546L6Z+s?=
 <lingyue@xiaomi.com>, =?utf-8?B?54aK5Lqu?= <xiongliang@xiaomi.com>,
 "isaacmanjarres@google.com" <isaacmanjarres@google.com>, Frederic
 Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, =?utf-8?B?5qKB5Lyf6bmP?=
 <weipengliang@xiaomi.com>, =?utf-8?B?57+B6YeR6aOe?=
 <wengjinfei@xiaomi.com>
Subject: Re: =?utf-8?B?5Zue5aSNOg==?= [External Mail][PATCH] tick/broadcast:
 Plug clockevents
 replacement race
In-Reply-To: <e52a3bfe9e444c14bc6281b1075c1fb2@xiaomi.com>
References: <042520850d394f0bb0004a226db63d0d@xiaomi.com>
 <87o77m1v9r.ffs@tglx> <b07f9746a58d46919b1600b22f5dff05@xiaomi.com>
 <835d5847-1aa0-4852-89c7-6a6996b3eb65@linaro.org>
 <bc1a086b932f454f9379c49221983675@xiaomi.com> <87o775uh0y.ffs@tglx>
 <87frrs8lsg.ffs@tglx> <87cymdsu0r.ffs@tglx>
 <6eb4fac303f4457f9686510664e79bff@xiaomi.com>
 <e52a3bfe9e444c14bc6281b1075c1fb2@xiaomi.com>
Date: Sat, 05 Sep 2026 23:19:06 +0200
Message-ID: <87jyoz4cs5.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03 2026 at 06:33, =E5=88=98=E6=9C=AF=E9=AB=98 wrote:
> Could you please share the expected timeline for merging this fix into
> the mainline kernel? We have downstream products depending on this fix
> and would appreciate it if the merge could be expedited.

Just for the record. Here is the timeline:

2024-06-26: Issue reported
2024-08-12: Patch available after some discussion
2026-08-28: Confirmation that the patch works
2026-09-05: Request for time line

It took you more than fricking TWO YEARS to test and validate that patch
and now that you finally came around to take care of it without
following the documented process you expect me to merge it within a
couple of days and preferrably expedite it and provide you the expected
timeline because you have a business case.

IOW, this could have been fixed TWO YEARS ago if you wold have paid
attention.

Seriously?

Thanks,

        tglx
