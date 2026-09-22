Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FC551474D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071594; cv=none; b=gPLzNzXIQ+mxSa/Pw6YdjLE9b2D7+fO72FZ65kNQ9m7IhonKmzeuFGp3AlqG+vTB1zpvr/PIXONexPH2kVC4jb+MyJ9W+a+pVFUP+0WsezgL2c22qQ9nasFQEJG5KGpALBoNBc7pYaidkhpzSDaPoH9XibWH4AGu2fjpM8OJ1kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071594; c=relaxed/simple;
	bh=4+cdrIW/7GgLKE6eyiybxHMQgdxiTLAvIZUCW2l2H6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCrhd4weCXZZFjs/ouDnFAurDSGiUbH3ScjiYBVD/ePPWhOIIkKVwNYduKG6jVV8V+iBICs6WT5hYd6dEu8EwuIbwdCf8ku6zfWkFaRMUf6CoI+oCry5vBWANaZ8hq8EHC+pabAG3KYM0NLZoclvXnW5qZRCA085nFSEpRz7PS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fBsyD7W6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UJldujve; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fBsyD7W6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UJldujve"
Date: Tue, 22 Sep 2026 12:06:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790071591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e/sJFF2ReMV2vcT05W/XghKzvI2AsrK19tXLOKcu1ag=;
	b=fBsyD7W6E29SIPXI6GYRaOeGAIwWHZ4MdqSkS7Ulkh4D0YNtTMLtKYoxcJogzzK0mTCXa4
	oAd5DnCC5V/EOY7pjE3hAkNUe7DqJdQJ5oVzHUP1/KVovhwXoHmIRS2xCDz+qElvYlgtyl
	Ye8tb43gHhDh8/UxfA07JG+zZlKsO4H3YF2AKTu3n1N27QoPeeyqwKdPCvsFAtaobpy5/R
	fgUDWetBKblTfzOZA9Kk1gP1FS76SVmuBZCfUZXI5GjmkahijgmicQeahWQFFCmPiUZNq5
	NV9pHnKLLHc2Miwj9G/Z2+m2x0OvFfDW5ErA58yAkqoXXD9d3uaRk0P90+PxEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790071591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e/sJFF2ReMV2vcT05W/XghKzvI2AsrK19tXLOKcu1ag=;
	b=UJldujveAA2SAhDLVkWf58kILcmPjlpT6q9TUqwdB8ie64b7XNCtXY8SCh1YwH3MLdZy70
	do0L4EYV/YEekQDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Petr Mladek <pmladek@suse.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2] printk: Use two irq_works instead per-CPU
Message-ID: <20260922100629.8arMCeI1@linutronix.de>
References: <20260914143412.1sMcp89V@linutronix.de>
 <arJSM8NaTAK_sN7Q@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arJSM8NaTAK_sN7Q@pathway.suse.cz>

On 2026-09-22 12:02:27 [+0200], Petr Mladek wrote:
> PS: I am going to wait few more days and give others chance to look at
>     it. I will commit it next week if nobody complains.

Thank you.

Sebastian
