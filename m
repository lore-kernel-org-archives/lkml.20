Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103250;
	b=YZRp6FPH2JeVDX563si+3lT4hypjMZB9TDKmSTq129WuRfgsDsgybFj2vTr+k8bCWa1n
	 8vBLZJpSohz3IvZK3nh2KXbZfXCj/5FmgTuKO1LAzbkivycA1CtuaakhV0NDEaPEtOPEX
	 M2RLQJ+9EnsEC3d5V7422Ol5CSkBHJRvAJQAu9iYhZfc/YaziyroE1C4gtaKmxCpmtgo3
	 VNiWv0cXItlrmUxdm/AkM0/nd18D3k1iVPuPbr4bWWxrwTX/mdsjkkx/c5x2INn1G14JB
	 BoZQERIhWWaxkz1N+K/dlGISz4yjjSnPs0zWOAPU6xlY88Z/dCjszSQw29KqDGUs+Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103250;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=zQE6Av0rjRm2PMDzhJEwKp1w7WnhJH8SHbd4xBk/2to=;
	b=nn2/kdaY8KORDLF6670H+7eUM0/w34kwsD4X5TTU9NIYWxMCaaTPB8iCrUHKrMZW2blt
	 Q3ZpmKwH2ap8H6OkGRnhyYVz1WQy+9IenzaqFDwiiRMVaH5F6OKK5GIaKG1efe6zAlx4v
	 8Pz0jli6AElOKrGFMVgAgK3YZ142rKqurm0qg3phKQwJSNKlnnU49XOeerz1bFbJNQhn5
	 FjHPIuCv9L/d2uqOKD5jJZYqiUXk79qCapvC6lSnO2KOFhLc4JUPPmIXzh4K+XRaG9tFu
	 G6nEzkF9V530IvDSE85/cbtpmYRV61S8f1+7YxNOu+iMlN8gANfZVPUrBpHdRZKqRqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Qu7vAGFg;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zZLMEVpK;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39118606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39118606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Qu7vAGFg;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zZLMEVpK
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793103248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zQE6Av0rjRm2PMDzhJEwKp1w7WnhJH8SHbd4xBk/2to=;
	b=Qu7vAGFgVAxTFEezpKIif4y/dKKSk8ahagbvYyUNFlstpFawJG7dlGjjeo3lx+mpyE+mJq
	13qS/FYHADqOxHpQO7f7RFzAwJuzyPjhgRHe+/iXJHM77DRggA8Hcd3l7jsy+TvO4dodPF
	awdYtAXZ1vvQkSU5+6esi56UHKQg/WMSKpodHFtWKuURIFyL89iJoupOQF41wUCsLcJKMh
	BN6JpCI37PHhVKy6Zyp5muyL/rYXTJvKD8CdSifq8uGMWFS/M44zqWRq5kztcvWI4Zg2lr
	ROotKQnqHHdYm19nRxbIkmmXXSSr+cKbUoWBz4MWW2qrKZe/+42QXkB70zw8+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793103248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zQE6Av0rjRm2PMDzhJEwKp1w7WnhJH8SHbd4xBk/2to=;
	b=zZLMEVpKSa7LbulxmL3AA7IcVNCGgemzX6EMC/+y7ET2R8yec7nYOoczVybUaXMPpwNYe1
	4R4Q4zQr77DpNDCw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Chris
 Down <chris@chrisdown.name>, Naveen Kumar Chaudhary
 <naveen.osdev@gmail.com>, linux-kernel@vger.kernel.org, Petr Mladek
 <pmladek@suse.com>
Subject: Re: [PATCH v5 05/16] printk: Prefer the console either via name or
 devname exclusively
In-Reply-To: <20260929120546.328616-6-pmladek@suse.com>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-6-pmladek@suse.com>
Date: Tue, 27 Oct 2026 13:20:07 +0106
Message-ID: <87a4nz49yo.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-09-29, Petr Mladek <pmladek@suse.com> wrote:
> The commit 7640f1a44eba0cc1a4 ("printk:
> Add match_devname_and_update_preferred_console()") added the possibility
> to prefer a console driver via device name. The name of the console driver
> gets assigned when the device gets initialized and it triers whether
> it is eligible for a console.
>
> The above mentioned commit ensures that __add_preferred_console() is called
> at least with name or devname value. But it does not check whether
> both are defined which is a non-sense.
>
> Add the check and do not fail quietly. Also shuffle the code a bit
> to make it ready for adding more checks.
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>
