Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14F231618B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789124286; cv=none; b=XviMaoFebCi/ZA0t1BX/Qucey0WqQAbdVQ+N4guorxVOvQI2xTzgbte1VgBojfizuNVeH9ip926DBr9ll3lxwOje/bGcMQ1hCCMtCkLC1TgnYTknrlURt2ToP22jK7vTEeynZKKvRrO8TMPzZFrjguiiyAj3AuhhUdpn07ZrHQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789124286; c=relaxed/simple;
	bh=FOOQT0yVmBeN0yvr5o6zhABs7c9ky6iRk/2U6KEOs7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZiOioddTmZBXPcYddveZ4XK/vcz1mkwy1B0s+gzRHkNGfk3BhCWzQgdbMCpj6ERKbVAt0HYPqphpSDvDPegTwL4AJF1QOk65I6JzSj2Nj8Qa/F/GHp3Soc9+UkwtpKGqiVZv5sAuOiIbofjKc3wY6zt2UZ3Wo7zSkMIlKwmA9IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Du8Wgn67; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mvvxgNG9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Du8Wgn67";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mvvxgNG9"
Date: Fri, 11 Sep 2026 12:58:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789124281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FOOQT0yVmBeN0yvr5o6zhABs7c9ky6iRk/2U6KEOs7U=;
	b=Du8Wgn678yKnUNHv+mLaw/Ef7ecWim9sbntuRUmQqwYDm63IWabKeQhf0mIy9QluSJAQiQ
	4e1hj9mslAaQkjyo+z96pSVxKC8B62zvVcBH0BGGm2Z8G4he2DCDfi3unCXcFeXQrk2O7D
	76S8euN22ZIy9iFVojGQLwVdj1Xsien+PDcasUrXDX7i/spTDgzpebS8ET9r/qcoHgx8mG
	XEiiNC/3rqk4OXYCn4I92uA7J3QWxO5D5ZaVdHyime/CMr6P/f8o3Rg0A6eSy3NUpobMvr
	7qqUifmSCe6YwvcyeBJPr8Mg9fJLL5kcWXgOPCIghoEllklIQmyaXVgXxgZbug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789124281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FOOQT0yVmBeN0yvr5o6zhABs7c9ky6iRk/2U6KEOs7U=;
	b=mvvxgNG97XNNk8zi4Sl1PXIi9rV0kGm1tO3NHbV/ANQHusrUB2kHlt4gJ9W0ST3EGYHdkA
	YqXFE6t0uSRd9kDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] printk: Remove preempt_disable() from __wake_up_klogd()
Message-ID: <20260911105800.3PL182jo@linutronix.de>
References: <20260911105126.aPCuP2jV@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911105126.aPCuP2jV@linutronix.de>

On 2026-09-11 12:51:28 [+0200], To linux-kernel@vger.kernel.org wrote:
> I'm sorry, I noticed this after starring at it once I sent the patch. I
> could resend and merge it into the previous if it is preferred.

Now that I forgot to close the editor and did stare again, didn't we
want to rip out console_irqwork_blocked()?

Sebastian
