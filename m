Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C884A2072
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438025; cv=none; b=os+463I76cpc3ZTxZMw63ml5/NYk7kQIFH+g4fb6LBv/mAVKtj+ONYWdBnuIKa6VsQJv3XhS1wbb6ZuUJuDuYDfGp+tq6KjWB1cTyLcgm+BanlIej+5a18syVfkzc09ga63LbImMF67WnxfgzFhDnv/tmXGuEUDlCLkmqrsYfYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438025; c=relaxed/simple;
	bh=7+zEDhgLWPK1XyD5mUsSnmEhVXTXJkMHK19vEUPudT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDrt/RphTGDqslqnKenP8WQptqQvte+YsjzZmHEgWH4HWUEbJkrUHNlhVSpib/asHOg+7CWOhYQ61h0zKsGcfviTTuaMX/ZpbfiiNXwd+TjdIEuryEK7koIIG7nTk6oAe9ksL/GZMGXIyFJ2NglgfXX5QTzYCI32qodzdSFO4xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DyS3SeZV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OXXbT6pv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DyS3SeZV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OXXbT6pv"
Date: Thu, 3 Sep 2026 14:20:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788438019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7+zEDhgLWPK1XyD5mUsSnmEhVXTXJkMHK19vEUPudT8=;
	b=DyS3SeZVU1oCPuyaUa/hJqDNRZSK2QuFyXMqAXGk/wIbgfVFxz8PAqOOPkFHIz6lr/K+7K
	sgTVDzz3XBQJrWnQbvFVTOejpGNHUdB5jrQ7F4X5YPveIjFMyfH47lxKujcFvl2Mcm+MR5
	/TGrHkOhjZr0PEs4iK3AnoBztLqD2jdWG04MXjknk95BQRbg24SfiAhpKcf09kpaCoYEUT
	9oFwmUwa5uo0peRN3y6kCv48pMLFFrfeLY9Ff+e8lRc5CyM69WLqp5+8fswTda1uxm5jlt
	n8pHaaOHkEue9B8ZNMoUBqtBkiDej6pw+xQb9k3b6uEhbwGsc5+xGhj7Kd6p7A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788438019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7+zEDhgLWPK1XyD5mUsSnmEhVXTXJkMHK19vEUPudT8=;
	b=OXXbT6pvMz8GouTFFJR6oi68/wS0kQ+/jZ98n83pzAe3Sz/cPVTh6U3OYsqlCNcmVuVfe5
	3EyXpOCJCBlBdCDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Boqun Feng <boqun@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] softirq: Preserve interrupt context during IRQ exit
Message-ID: <20260903122017.ZRsTFeks@linutronix.de>
References: <20260903112737.49551-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903112737.49551-1-kmehltretter@gmail.com>

On 2026-09-03 13:27:37 [+0200], Karl Mehltretter wrote:
> __irq_exit_rcu() drops HARDIRQ_OFFSET before deferred hrtimer rearm,
> softirq dispatch, and timersd wakeup. This work is still on the IRQ
> return path, but in_task() reports task context.

Is this new? I don't remember seeing this before.

Sebastian
