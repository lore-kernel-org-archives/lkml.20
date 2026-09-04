Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD8F20DD51
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788563203; cv=none; b=J16DOahHE5ku0oxXlcRkZuk9jH0FAxYks6Iemp4y/7DHkGLXZaN/BRuLq5DJ0iYMkgrv8iaIoyG3nsrtEZZ39hYd3oMiCKIYlNq9jaWA0QBdCyiGcwRLKojdYQGe4Xqk2bcKaknm9WGUTaA2ixIkPBdQiEjRQc+3IhU5z3tdo9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788563203; c=relaxed/simple;
	bh=/2B8Dh2/jbEdAtdLQ1sAD0zdFqbOW1Rz7xO7wTEh/Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C2kK23F5vkTNu9tMjmuouYR30iE/ANMMUKnmbtN1XgnP9aKWixBcO10AJMthYFOwg6YKAfW4y/dMB7CVkCZj7FPlwEHUtxikqO973tN9dnmsF6ulXMmgWEhr/0uWQ3YaJEjFIL4UXGTYSS4FoAv8xquuFAs20Wjzt8HaaXJZZf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=CQPmXmvz; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="CQPmXmvz"
Received: from omf08.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id C6228A3E91;
	Fri,  4 Sep 2026 23:06:38 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 9A16B20027;
	Fri,  4 Sep 2026 23:06:36 +0000 (UTC)
Date: Fri, 4 Sep 2026 19:07:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Ye Liu <ye.liu@linux.dev>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Marco Elver <elver@google.com>, Ye Liu
 <liuye@kylinos.cn>, Yi Tao <escape@linux.alibaba.com>, Tejun Heo
 <tj@kernel.org>, Bart Van Assche <bvanassche@acm.org>, Christian Brauner
 <brauner@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] mm: introduce for_each_process_rcu and
 for_each_thread_rcu
Message-ID: <20260904190742.7231d56e@gandalf.local.home>
In-Reply-To: <87ecf87m31.ffs@fw13>
References: <20260904083001.553587-1-ye.liu@linux.dev>
	<20260904083001.553587-2-ye.liu@linux.dev>
	<20260904122536.1079b279@gandalf.local.home>
	<87ecf87m31.ffs@fw13>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9A16B20027
X-Stat-Signature: 94599w63qsp378ifyksoajqeyc94b7t5
X-Rspamd-Server: rspamout03
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/GwGttuyOnfaOFMG/Hbl+emC5UFLFYKaQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=rc4fok4nFu4VvpijLSYYc3rMm1OuQylSLRygVzKrmI4=; b=CQPmXmvzu/I8VbxcdHi6InpOHSFT+cKnx2hNKizzJSRb7eTVePzevf3AOUyk24lc7PX/J5V4oDfjBi2qaiV+hJ77yqH35qtCv3dmnHaEIyU2ar+urRyuX2T3Vx6dbDc5jS6e4C2UIRoo8QbOwq3tfmfn4IuJQFueyegTZ1Zd/FY=
X-HE-Tag: 1788563196-903902
X-HE-Meta: U2FsdGVkX18jc21xB9g4cXGD+ND4k+RwPmOPv/s7f+mILwVw57ZmBTuWjhcGewzIyfbliww94R12rQUH+Jay427ObIq4st0GytjwRczpNJTekbQPeBdLgmqV26Dtu9bEoIbaEXFpk3AmK4V/JExEZ5jNXpP5qgehBgZjbr6qt7vrHyiNcYZ8Laz+kLmHMh6nTsZEa9L9K9/qFhmmbdz+5JD8Xu+/HfHfuHE8Av1n/vmTzLdD5qyV+f7OW1L6anG3KRJ6hj/H3JbE2jXHlu5QZEWSoBDAJbjDiy7Q9F12Mnkr5w/xE66C9XFBVpqCKmQ8kyHYqLFAZ4g4pEVSPfLfo64OrIzO3yxt

On Fri, 04 Sep 2026 23:17:38 +0200
Thomas Gleixner <tglx@kernel.org> wrote:

> No. Scopes can be left by any valid termination mechanism. 
> 
> The only problematic case of leaving a scoped_guard() with goto is when
> the goto is actually implemented as an ASM goto. See the comment above
> arch_unsafe_get_user() in linux/uaccess.h.


Oh OK. I was under the impression that goto's could cause undefined
behavior with guards. Or is that just when a goto jumps over one? Or is
that OK too?

-- Steve
