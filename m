Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BFB481B1;
	Sun, 30 Aug 2026 01:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788051727; cv=none; b=OH4SI/Ax8LSMZiihCbIFy1JAr/0LnKXxu+Yo6KqR4jllY435QH7uopxGv2iIJSk7VFN3f6gxQfKpTduRoQQsevOIj0LoSc2awK9FgmVnp7Lvi55CR7eG2q/6RBmyaOuXbj1AYFLeE5cOuHd4V2T/rbesT6czk6Khq4BI+ItyHO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788051727; c=relaxed/simple;
	bh=e3IRJe1WEHnaAfeMZbD2fubotE2R8orkhkr7KsuoH1s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SqXpSVOtXPnUJQNA/hd0PglaGAcxuD4xLaE6zRjkTcfkL3ZdNt1Kv3rVLGDRYXGpygTmmMubFhz2qoE4OY736ILj/1XFWbjIO2YWWHArEas24o/yjNHcZ0rYtjAWWNEdfr74BhWHCaS7+Cnz/hcAxid0qC+9/svJpN3lE8srk/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ry4S7Gex; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ry4S7Gex"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5C21F000E9;
	Sun, 30 Aug 2026 01:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788051726;
	bh=xU2s+wyhxKlOGwiNRKg8xReAr+6fxCJGp1fcNYlakHY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ry4S7GexE0+qJs8mGK5v71/GIAmiFFC47QGxR0KwE6MkIFrGYZvYYbSYqZ0LMODDI
	 /F419UEgz/r4talneQjSic70oxEAYey12uv8cEZ54zcAOM8UCqy2koF4sDosM2+vvg
	 ABVt7tuYCLZl8Si6SINrvz0aEy7MOUxCnkAK5CBM=
Date: Sat, 29 Aug 2026 18:02:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrei Vagin <avagin@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
 criu@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] proc: Report SIGEV_NONE in /proc/pid/timers if target
 task has died
Message-Id: <20260829180205.16dc4d5ed20150b79533f3c2@linux-foundation.org>
In-Reply-To: <20260816161216.984580-1-avagin@google.com>
References: <20260816161216.984580-1-avagin@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 16 Aug 2026 16:12:15 +0000 Andrei Vagin <avagin@google.com> wrote:

> When a posix timer is created targeting a specific thread (using
> SIGEV_SIGNAL | SIGEV_THREAD_ID), it takes a reference to the target
> struct pid in timer->it_pid. If the target thread subsequently
> terminates, its numeric tid is freed and can be recycled for an
> unrelated task. However, the timer holds its reference to the original
> struct pid.
> 
> show_timer() in /proc/[pid]/timers previously called pid_nr_ns()
> directly on timer->it_pid without checking whether any task remained
> attached to that struct pid. As a result:
> 1. It reported the stale tid, which could mistakenly refer to a recycled
>    pid.
> 2. In the kernel, expired signals for dead target threads are dropped by
>    posixtimer_send_sigqueue() because posixtimer_get_target() returns
>    NULL, so the timer functionally acts as SIGEV_NONE.
> 3. Checkpoint/restore tools (CRIU) parsing /proc/[pid]/timers would try
>    to restore a timer with SIGEV_SIGNAL | SIGEV_THREAD_ID targeting a
>    non-existent or unrelated thread.

This sounds like a somewhat significant issue for CRIU but that's just
me wildly guessing.

> Check pid_has_task(timer->it_pid, timer->it_pid_type) in show_timer().
> If the target task has died, override notify to SIGEV_NONE and report
> PID 0 (e.g., 'notify: none/pid.0').

No Fixes: and no cc:stable?  Maybe my guess was wrong?
