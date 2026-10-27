Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105937;
	b=Eg9l0NpYFigk2hK36nO/0TaOL9bty+ahcSqZTPnfqdu3fme9Bk189GyrX56pnxwQXP8I
	 sMyyJ/9+wiWxgG7X78WiFYciaBJlGfKBnpFJKw/W2Sn06Ee7Z6j2hHgPTf7apNhyammj2
	 47nEvFZVlav/waHQNYuvQLVz3M0venTZWT04B08Ay2ssWkVkmpfqkyd+zISYxv6UBeyrI
	 QuyDszwmnmM4Ur05B20ibV1WDaz1l+aoD5Ry4GtjUL8kJIAOBxuBHnMUq2cp24jN6dpJ+
	 mgsZFApnr+Y8Z9D08Z0584pJNV2F8aiekHFhQ1TEwCAZ63VQ8V40TRtOK9b04xjWOAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=b2oJG/Cx+yrxp2tVulERESQsUaYqENiGI/N1hIw4DgY=;
	b=dMIk3s8/oWJn9PQKwsy0DbuWudSjw2wOELr4KBMgZC9TCG9cSDAm7onwqsBJ+A2W+7SI
	 vedfXLaxQss1emxgzlO6ZN0wEmjBmSZ5vkV3vfSwFp2FuJoronSKRZn3dnnqX8VVFzCZ8
	 Sw+KEGEk/hQTRHeLGtiqVY4PxCOu/asPpY4R9NrrmoxnfoTkQANLqbc5nwnkkwMNwsP8R
	 reEYS2vTep/dC7qsb238xSCKIK6B58UaP7xtMjlEmnNUwMMT49ujOQAl9jbDetcCz+UNI
	 AZfO52jpm0E3lRhNhRys6bctOFodkTvG9ZDtS80Qwptwch32Yccwo/ZNWFjTcSNpPrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dCSBHlqJ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989DF606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 989DF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dCSBHlqJ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso31599375e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793105935; x=1793710735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b2oJG/Cx+yrxp2tVulERESQsUaYqENiGI/N1hIw4DgY=;
        b=dCSBHlqJhbxGNxDS28So5RrVfZbL9zjwyxN0BnPVQzn6xBvQNqDzN8GcLoz9swLVXy
         KW+y+lNSZIKsl81mHaSzYspKq0V+gopGCvEfclPmjL1bC+JXRzy1LhZKgMysuIP1bUNF
         1zWrlVUj6iLBuWL6qS5CHZCLctqLx6E+u/nRJp9bT3jRYNWVj0N0dPsbXSjedTXUpuag
         Y+aEcVbY0czb5Dz5mRrmKXWnjUo5kPpKnxNk+aYYzYnfWl8FD+LNLItQMWQd1eG7E4sG
         LS+jDkeHD2jpfcLzzF87vvM1S9lQO9vpJl8N6TIJXRDdtIQui4rq1xQ7KuzG9HFysfyA
         AX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105935; x=1793710735;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b2oJG/Cx+yrxp2tVulERESQsUaYqENiGI/N1hIw4DgY=;
        b=RnCMJ4QIGp2Y+i5j4UJrlg7IMKJ405+PkSuO8uGHD9s7koqRgv03Kouelpk54CSaPF
         npX56XP+Y7agk/aOc1uVI0sKipWj7wsQdqusW1+IcZ284MxTR0I09l1ao3FyzCUPC6Kg
         49lyzmqR0h0lB7U+PIRyDXtv8+5LmZOzUa17IicjArI7Nqo5+YAGOuNuYB1aAVFjVvRs
         Ewwi8hyKjO8brWqQhjw/Ow0eYrkmNwrtL11/y8hy2Ud1JJ9CB+fkH91boaeraCAoKJj9
         S093+YsLUV+DWW5EqMspxl5FrO7ynvRYQ8jfOli3T7epGimX2swsRKyTY/fMlcauVga/
         BFrA==
X-Forwarded-Encrypted: i=1; AKwUvBz8c070/qyHupd93c6t6WkL4/kquYDhYGIlnyBjjjozlapbdIwRf033Y8pX9wpFeQNNEFfkMT2XDl1Ggpk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyR1cZwe+txQUjGwrTRgUXoFtWALJRFIwwz4OJvVZFB/Dc1+4D
	QUjKCErA+G9456m0JLgWNAdC+ExpHLzI4tol79R74G3F843Qxlz07pqBo9IFQVzdenQ=
X-Gm-Gg: AYBFou0qeKINMR7A7JffZ8XjtZ03O7N/SB11OZh9Iw66MyGes1Rg3OEa5y8piWBMA25
	W39qS/slXNZcFCBbxWMQJ1q03GxalO8uNvBjO2tttQ9Fk8mhssDKs0WmxfHaPe+U1ZVDky1dQsN
	KP+DNxlV1EV+QkHnAHPTOEdtCeFp49Z4GSrK1J/vs1sagXUvVcR7QZMPSXrs6EwZhEE/7ZWIH57
	fTFEzyw7qZbsVhs4RwMv4gmmqeSQglnlk2zMvXaIhAR8K4JZA45X2gxJhrWcylXQ9PrFZFlj6KP
	TvvR+1nvhI2u1jXon4RnE1etpqyPq8JdEHOO5Kl9vA2TmmnQCLEV2Ub2mshz52u8ctBI3rbkVtV
	Ixu4UG2dn+Rljv8MjAf9t41NuaPKN0pzqZMIJLvKmOP3889Q4GNQtXw6PIM1FNcxtyA4v4CehFL
	W9Coip+jkwSdQE1dPzSgVkYhX4KEuqss1AT2/rvrb4M5YTRgPlUYfmFrIPx+GCIg5Lg66mHWcJW
	ZjT2WzorM8uitHZlnWgRQilJvUOJNwZCpwR6xOSSjgHxnSy/QbO4R4Suw==
X-Received: by 2002:a05:600c:621b:b0:4a2:59:f568 with SMTP id 5b1f17b1804b1-4a35ac95a53mr181284635e9.14.1793105934989;
        Tue, 27 Oct 2026 05:58:54 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d9280sm262504675e9.13.2026.10.27.05.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:58:54 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:58:52 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Breno Leitao <leitao@debian.org>, chris@chrisdown.name,
	Sam Crossley <samuelcrossley@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Paolo Abeni <pabeni@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] netconsole: allow replaying the printk buffer on
 demand
Message-ID: <auCgDAzkio4RVfWK@pathway.suse.cz>
References: <20261024-netcons-replay-upstream-v1-0-9613f38496e5@gmail.com>
 <87fqxskdpl.fsf@jogness.linutronix.de>
 <at84qygscue8crQi@gmail.com>
 <87a4o0k3qa.fsf@jogness.linutronix.de>
 <at9qgBucVm-QHnye@pathway.suse.cz>
 <87zew0ifpp.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zew0ifpp.fsf@jogness.linutronix.de>

On Mon 2026-10-26 17:39:54, John Ogness wrote:
> On 2026-10-26, Petr Mladek <pmladek@suse.com> wrote:
> > The "replay" approach looks like a big hammer. Many messages might get
> > duplicated, especially when the outage was small.
> >
> > A better solution might be to do not increment con->nbcon_seq
> > when the transmission failed. And try it later again.
> 
> Note that there was a time during the rework that we used to allow the
> console to return failure but decided it was too complicated [0].

> [0] https://lore.kernel.org/lkml/ZdTCZqhZww8_WgSU@alley

It seems that the main problem was how to handle the nbcon ownership
when the callback returned an error. But I think that has been later
solved because we needed to re-acquire the ownership for the clean up.

Honestly, I am not completely sure what worms could jump from this
can. But I think that adding the error handling should be doable.
Well, I am not sure that it is worth the effort for this use-case.

> The kthreads are setup to stay in their printing loop until the backlog
> is clear. Having a nice=-20 task busy-loop would be bad.

My idea was to put the kthread into in interruptible sleep. It could
be woken again by a timer and by the next printk() call.

> > con->write_thread() currently does not return anything. I believe that
> > it is partly a historical limit. Two problems come to my mind:
> >
> >    1. There used to be a global "console_seq" counter which was common
> >       for all console drivers. But we have a per-console counter since
> >       the commit a699449bb13b70b8bd1 ("printk: refactor and rework
> >       printing logic").
> >
> >    2. There has never been a try-later logic. But is should be easier
> >       to add it now. We have the kthreads. And even the legacy loop
> >       is able to break when there is not progress.
> 
> I suppose for only the write_thread() callback we could implement some
> sort of throttled retry if the console driver reports failure. But this
> is assuming console drivers can even detect if it successfully sent or
> not. The netconsole certainly has no method to _know_ if the UDP packet
> was received. And UARTs (asside from flow-control) also have no way to
> confirm that the other side received the data.

Good point. We could detect problems only on the sender side
which might need not be enough.

> Breno and Sam simply want the user to trigger a replay of the full
> log. Essentially a sysrq-R but per-console. I think that is a reasonable
> request and certainly much easier than attempting some sort of
> transmission guarantee.

Yes. I am not against the interface. I just thought about a better
solution.

Best Regards,
Petr
