Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241829;
	b=ixSt4tn1LWyl3PjurTCCf9tVx6GKyOjPnuirq2rRakG8y+KLZ3pJgGUIdgUlpQxUPFhv
	 fn88kNFzzxeEB1FnTM9TTUusr/lV7QAbN7u9gfSdfgH8Y9xO7zZJydDmdYqo1Cv21a/+P
	 QmD2tjpeBg4CHCts8XkEZ3k6I1BS5eE3HzIWteAk9E5x5oeOWZV6tb2ai8R9dxHezGMT6
	 fSH8QYmuFb/0csWltrjOFzAYd3kS+YR7NTvkEjNc31guRtWczYsXO0+UunnqSGD8z+RwM
	 Zirfc/ZC3cZ0dlcqBuJImxoEd/xNWUlCSbhWXUclaJIBUzE+6Vxc9ZY/P0bQvin+H0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241829;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=j6W2NjxbKyTpJpsuputqmw55aHmjyy0nQAHdn7UNx/U=;
	b=13MeIIuHVrZ5S7nTSNAb2FnS4ry4sPn9BjdmRbSM4K2yeStw3g/PN2DlW3hH+zgHQ+/V
	 no9Z8mdM/68gTUYsJcw2zHWa24h+cOeoPwDugASuSNIF9ENe8JDYhh60qVMflFO8XV4Nz
	 zIkRL7+ySYgtEurnnh+g59dRgiel5BXC6YRZBeKHnIiBCJV8c3LDNKMEAdV7fuVUyUE6U
	 YbNPsQ0frHr6mSuwcEkyZOUGFFt01Vdc/ta2eXkXPf1T0ueiVlWZ3sz0NndZT1FCSJdYZ
	 X5CETdriPXH7QQ9gBqBoj93grEOX0ZvK7ybou4IECuCgYhDnFKkluH1ZVuHJK8Qrnlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YH+QX+ho;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lXvxpDhv;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A61606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A61606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YH+QX+ho;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lXvxpDhv
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794241827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j6W2NjxbKyTpJpsuputqmw55aHmjyy0nQAHdn7UNx/U=;
	b=YH+QX+ho1jK7G1ig2Q2mLe7BQmoYXgaK7f+//s2ZUcMfXHaQjM39IFMpxuB1XZJihUAsjL
	fgdYF8QrgrUJgf1oz7H2yeRygTtgIrIzYbGyBPgagaXtBEtMQ356tqjiWZsVnUjbu1yBLi
	ivVctFpTJc/K0UaBlFgHSF1WdMGNw1yiDuyH6TgcgpWtaBwd6WUP1YpiUgY6J91tmSy0KP
	P7ApX9/vRROLXaOjPWotLKYkMO9uQatNtCnYfUqAm5y5AzBQUAwTuR7R4ZWr8NvAaVjiX9
	Yj8z1GEvAnVi0vkjKzz+9/HrpiaoLQrIOXA030k/9ldKjSOvofamipmkEOf4fA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794241827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j6W2NjxbKyTpJpsuputqmw55aHmjyy0nQAHdn7UNx/U=;
	b=lXvxpDhv0V858zUTPfyTaHsi2g5eigDqefLcw4vi0+Fdyf/VwrP3C3DmvdJWEIWs1xNg0W
	ivofs3p4rMOmTkCg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Chris
 Down <chris@chrisdown.name>, Naveen Kumar Chaudhary
 <naveen.osdev@gmail.com>, printk@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/16] printk: Clean up preferred console handling
In-Reply-To: <avHqqoJO8C15LkpG@pathway.suse.cz>
References: <20261106171952.207909-1-pmladek@suse.com>
 <avHqqoJO8C15LkpG@pathway.suse.cz>
Date: Mon, 09 Nov 2026 17:36:27 +0106
Message-ID: <87o6bynf18.fsf@jogness.linutronix.de>
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

On 2026-11-09, Petr Mladek <pmladek@suse.com> wrote:
> I have the fixes mostly ready. I wonder whether you would prefer that
> I send v7 or you have already started review of v6.

I did not have a chance to start with v6, so I will wait for v7.

John
